unit LePortaCom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils;

const
   // CONSTANTES PADRÕES DA PORTA
  NUL = #0; SOH = #1; STX = #2; ETX = #3; EOT = #4; ENQ = #5; ACK = #6; BEL = #7; BS = #8;
  TAB = #9; LF = #10; VT = #11; FF = #12; CR = #13; SO = #14; SI = #15; DLE = #16;
  DC1 = #17; DC2 = #18; DC3 = #19; DC4 = #20; NAK = #21; SYN = #22; ETB = #23; CAN = #24;
  EM  = #25; SUB = #26; ESC = #27; FS = #28; GS = #29; RS = #30; US = #31;

   // CARACTER DE FINAL PADRÃO EM MODO rmTERM
  DefaultTerminator = #13#10;


type
  TBalanca = class
  private
    { Private declarations }
    procedure EscreveDados(Cmd: string);
    procedure MensagemErro(S: string);

  public
    { Public declarations }
    function SerialAberto: boolean;
    procedure AbreSerial(Porta: byte; pBaudRate, pByteSize, pStopBits, pParidade: integer; pConfigura: boolean = false);
    procedure FechaSerial;
    function LerSerial: string;
    function LerSerialWT3000(pTamanho: integer): string;
    function LerSerialToledo(pTamanho: integer): string;
    function LerSerialFilizola(pTamanho: integer): string;
    function TempSerial: string;
    function LePesoToledo: string;
    function LePesoWT3000: string;
    function LePesoFilizola: string;
  end;

var
  FRespTmp: array[0..1024] of Char;
  FRespostas: array[0..1024] of Char;
  FHandleCom: THANDLE = INVALID_HANDLE_VALUE;
  wSobrecarga, wInstabilidade, wNegativo: boolean;
  wStatus: string;

const
  dcb_Binary = $00000001;
  dcb_ParityCheck = $00000002;
  dcb_DtrControlEnable = $00000010;
  dcb_RtsControlEnable = $00001000;


implementation


function TBalanca.SerialAberto: boolean;
begin
  Result := FHandleCom <> INVALID_HANDLE_VALUE;
end;

procedure TBalanca.MensagemErro(S: string);
begin
  MessageDlg(S, mtWarning, [mbOk], 0);
  Abort;
end;

procedure TBalanca.AbreSerial(Porta: byte; pBaudRate, pByteSize, pStopBits, pParidade: integer; pConfigura: boolean = false);
var
  Timeouts : TCOMMTIMEOUTS;
  _dcb : TDCB;
begin
  repeat
    if SerialAberto then
      Break;

    SetLastError(0);

    FHandleCom := THandle(CreateFile(PChar('COM' + IntToStr(Porta)),
      GENERIC_READ or GENERIC_WRITE, 0, nil, OPEN_EXISTING, 0, 0));

    if FHandleCom <> INVALID_HANDLE_VALUE then
    begin
      SetCommMask(FHandleCom, 0);
      SetupComm(FHandleCom, 4096, 0);

      FillChar(_dcb, SizeOf(_dcb), 0);
      _dcb.DCBlength := SizeOf(_dcb);

      try
        if not GetCommState(FHandleCom, _dcb) then
          MensagemErro('Erro lendo configurações da porta');

        if pConfigura then
        begin
          _dcb.BaudRate := pBaudRate;
          _dcb.ByteSize := pByteSize;
          _dcb.Parity := pParidade;
          _dcb.StopBits := pStopBits;
          _dcb.wReserved := 18;
          _dcb.XonLim := 4096 div 4;
          _dcb.XoffLim := 4096 div 4;
          _dcb.XonChar := DC1;
          _dcb.XoffChar := DC3;
          _dcb.ErrorChar := NUL;
        end;

        _dcb.Flags := dcb_Binary or dcb_DtrControlEnable;

        //se controle pelo software
        //_dcb.Flags := _dcb.Flags or $00000100 or $00000200;

        //se controle pelo hardware
        //  _dcb.Flags := _dcb.Flags or $00000004 or $00002000
        //então
        //_dcb.Flags := _dcb.Flags or dcb_RtsControlEnable;

        if _dcb.Parity > 0 then
          _dcb.Flags := _dcb.Flags or dcb_ParityCheck;

        if not SetCommState(FHandleCom, _dcb) then
          MensagemErro('Erro escrevendo configurações da porta');

        GetCommTimeouts(FHandleCom, Timeouts);

        Timeouts.ReadIntervalTimeout := 2;
        //Timeouts.ReadIntervalTimeout := MAXWORD;

        Timeouts.ReadTotalTimeoutConstant := 150;
        //Timeouts.ReadTotalTimeoutConstant := 0;
        {
        TimeOuts.ReadTotalTimeoutMultiplier := 0;
        TimeOuts.WriteTotalTimeoutMultiplier := 0;
        TimeOuts.WriteTotalTimeoutConstant := 0;
        }
        SetCommTimeouts(FHandleCom, Timeouts);
      except
        PurgeComm(FHandleCom, PURGE_TXABORT or PURGE_TXCLEAR or PURGE_RXABORT or PURGE_RXCLEAR);
        FileClose(Integer(FHandleCom));
        FHandleCom := INVALID_HANDLE_VALUE;
        raise;
      end;
      Break;
    end;

    if Application.MessageBox(PChar('Erro ao inicializar porta ''COM' + IntToStr(Porta) + '''.'),
          'Informação', MB_RETRYCANCEL + MB_ICONASTERISK + MB_DEFBUTTON1 + MB_APPLMODAL) <> ID_RETRY then
    begin
      Abort;
    end;
  until False;
end;

procedure TBalanca.FechaSerial;
begin
  if not SerialAberto then
    Exit;

  PurgeComm(FHandleCom, PURGE_TXABORT or PURGE_TXCLEAR or PURGE_RXABORT or PURGE_RXCLEAR);
  FileClose(Integer(FHandleCom));
  FHandleCom := INVALID_HANDLE_VALUE;
end;

function TBalanca.TempSerial: string;
begin
   result := FRespostas;
end;

procedure TBalanca.EscreveDados(Cmd: string);
var
  vI, vL: integer;
  Escritos: dword;
  vTickFim: cardinal;
begin
  if not SerialAberto then
    MensagemErro('Serial não aberto');

  //isso é bom pra limpar o buffer e garantir q não fique nenhuma resposta antiga
  while ReadFile(FHandleCom, FRespTmp[0], 1024, Escritos, nil) do
    if Escritos = 0 then
      Break;

  vI := 0;
  vL := Length(Cmd);
  if vL > 1024 then
    MensagemErro('Função implementada só pra 1024 bytes por CMD mas é só mudar');

  Move(Cmd[1], FRespTmp[0], vL);

  vTickFim := GetTickCount + 10000;

  while (vL > vI) and WriteFile(FHandleCom, FRespTmp[vI], vL - vI, Escritos, nil) do
  begin
    if Escritos = 0 then
    begin
      if vI > vL then
        Break;

      if vTickFim < GetTickCount then
      begin

        Break;
      end;
    end
    else
      Inc(vI, Escritos);
  end;

  if vL <> vI then
    MensagemErro('Erro escrevendo dados: ' + IntToStr(vL) + ' <> ' + IntToStr(vI));
end;

function TBalanca.LerSerial: string;
var
  Lidos : DWord;
  vTickFim : Cardinal;
begin
  if not SerialAberto then
    MensagemErro('Serial não aberto');

  Result := '';
  vTickFim := GetTickCount + 10000;
  
  while ReadFile(FHandleCom, FRespTmp[0], 1024, Lidos, nil) do
  begin
    if Lidos = 0 then
    begin
      //vc poderia testar se ja é o fim do retorno aki e dar um:
      //  Break;

      if vTickFim < GetTickCount then
        Break;
    end
    else
    begin
      Result := Result + Copy(FRespTmp, 1, Lidos);
    end;
  end;
end;

//EM CADA BALANÇA UMA QUANTIDADE DE CARACTERES DIFERENTES É ENVIADA SENDO NECESSÁRIO
//CRIAR UM NOVO LÊ PESO PARA CADA. BASTA SUBSTITUIR O PTAMANHO E A VALIDAÇÃO NO BLOCO WHILE
function TBalanca.LerSerialWT3000(pTamanho: integer): string;
var
  Lidos, vL, dL : DWord;
  vTickFim : Cardinal;
  naoLido: boolean;
  i: integer;
  teste: string;
begin
  teste := '';
  naoLido := true;
  wSobrecarga := false;

  if not SerialAberto then
    MensagemErro('Serial não aberto');

  Result := '';
  vTickFim := GetTickCount + 10000;

  //EscreveDados(#0);


  while (ReadFile(FHandleCom, FRespTmp[0], 1024, Lidos, nil))
    and  naoLido do
  begin
    //PARA WT3000(PAINEL PCOM DE BALANÇA) DEVE VALIDAR OS CARACTERES DE ESTABILIDADE S E T
    if (FRespTmp[0] = 'S') and (FRespTmp[1] = 'T') then
    begin
      naoLido:= false;
      for i := 0 to 1023 do
        FRespostas[i] := FRespTmp[i];

      result :=  Copy(FRespTmp, 1, 1024);
      if vTickFim < GetTickCount then
      begin
        naoLido := false;
        Result := 'SOBRECARGA';
      end;
    end
    else if (FRespTmp[0] = 'O') and (FRespTmp[1] = 'L') then
    begin
      wSobrecarga := true;
      naoLido:= false;
      result := 'SOBRECARGA';
    end;
    if vTickFim < GetTickCount then
        Break;
  end;
end;

function TBalanca.LePesoWT3000: string;
var
  pPeso: string;
  i: integer;
begin

  pPeso := LerSerialWT3000(512);

  if wSobrecarga then
    MensagemErro('Erro na pesagem! Verifique os limites da balança.')
  else if pPeso = 'SOBRECARGA' then
    MensagemErro('Erro na pesagem! Verifique os dados.')
  else
    result := copy(pPeso, 8, 7);

end;

function TBalanca.LerSerialToledo(pTamanho: integer): string;
var
  Lidos : DWord;
  vTickFim : Cardinal;
  naoLido: boolean;
  i: integer;
begin
  naoLido := true;
  wSobrecarga := false;
  wInstabilidade := false;

  if not SerialAberto then
    MensagemErro('Serial não aberto');

  Result := '';
  vTickFim := GetTickCount + 10000;

  EscreveDados(char($05));

  while (ReadFile(FHandleCom, FRespTmp[0], pTamanho, Lidos, nil))
    and  naoLido do
  begin
    for i := 0 to 1023 do
      FRespostas[i] := FRespTmp[i];
    //PARA TOLEDO(PAINEL PCOM DE BALANÇA) DEVE VALIDAR OS CARACTERES
    // DE INDICACAO #2 E #3 NAS POSIÇÕES 0 E 6
    if (Lidos > 0) and (FRespTmp[0] = #2) and (FRespTmp[6] = #3) then
    begin
      naoLido:= false;
      if Copy(FRespTmp, 2, pTamanho - 2) = 'SSSSS' then
        wSobrecarga := true;
      if Copy(FRespTmp, 2, pTamanho - 2) = 'IIIII' then
        wInstabilidade := true;
      if Copy(FRespTmp, 2, pTamanho - 2) = 'NNNNN' then
        wNegativo := true;
      result :=  Copy(FRespTmp, 2, pTamanho - 2);
    end;
    if vTickFim < GetTickCount then
      begin
        naoLido := false;
        Result := 'SOBRECARGA';
      end;
  end;
end;

function TBalanca.LePesoToledo: string;
var
  pPeso: string;
begin

  pPeso := LerSerialToledo(7);

  if wSobrecarga then
//    MensagemErro('Erro na pesagem! Verifique os limites da balança.')
    result := pPeso
  else if pPeso = 'SOBRECARGA' then
//    MensagemErro('Erro na pesagem! SOBRECARGA.')
    result := pPeso
  else if wInstabilidade then
//    MensagemErro('Erro na pesagem! Instabilidade.')
    result := pPeso
  else if wNegativo and (pPeso = 'NNNNN') then
    result := pPeso
//    MensagemErro('Peso negativo! Verifique as configurações da balança.')
  else
  begin
    pPeso :=  copy(pPeso, 0, 2) + ',' + copy(pPeso, 3, 3);
    result := pPeso;
  end;

end;

function TBalanca.LerSerialFilizola(pTamanho: integer): string;
var
  Lidos : DWord;
  vTickFim : Cardinal;
  naoLido: boolean;
  i: integer;
begin
  naoLido := true;

  if not SerialAberto then
    MensagemErro('Serial não aberto');

  Result := '';
  vTickFim := GetTickCount + 10000;

  for i := 0 to 1023 do
    FRespostas[i] := FRespTmp[i];

  while (ReadFile(FHandleCom, FRespTmp[0], pTamanho, Lidos, nil))
    and  naoLido do
  begin
    //PARA FRILIZOLA NÃO HÁ INFORMACAO DE INICIO E FIM
    if (Lidos = 0) then
    begin
      naoLido:= false;
      result :=  Copy(FRespTmp, 1, pTamanho);
    end
  end;
end;

function TBalanca.LePesoFilizola: string;
var
  pPeso: string;
begin

  pPeso := LerSerialFilizola(5);
  pPeso :=  copy(pPeso, 1, 2) + ',' + copy(pPeso, 3, 3);

  result := format('%g', [StrToFloat(pPeso)]);

end;

end.
