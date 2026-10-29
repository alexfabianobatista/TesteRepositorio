unit UImpressaoEtiqueta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons;

type
  TFImpressaoEtiqueta = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    MEPeca: TMaskEdit;
    MeChapa: TMaskEdit;
    SBImpCalculo: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SBImpPeca: TSpeedButton;
    SBImpChapa: TSpeedButton;
    procedure SBImpCalculoClick(Sender: TObject);
    procedure SBImpPecaClick(Sender: TObject);
    procedure SBImpChapaClick(Sender: TObject);
    procedure Contar(ms: longint);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImpressaoEtiqueta: TFImpressaoEtiqueta;

implementation

uses UPedido_cl, UOracle_cl;

{$R *.dfm}

function A_Set_Darkness(darkness: integer): integer; stdcall; external 'WINPPLA.DLL';

function A_CreatePrn(selection: integer; FileName: pchar): integer; stdcall; external 'WINPPLA.DLL';

function A_Print_Out(width, height, copies, amount: integer): integer; stdcall; external 'WINPPLA.DLL';

function A_Prn_Text(x, y, ori, font, typee, hor_factor, ver_factor: integer; mode: char; numeric: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';

function A_Prn_Barcode(x, y, ori: integer; typee: char; narrow, width, height: integer; mode: char; numeric: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';

function A_Prn_Text_TrueType(x, y, FSize: integer; FType: pchar; Fspin, FWeight, FItalic, FUnline, FStrikeOut: integer; id_name, data: pchar; mem_mode: integer): integer; stdcall; external 'WINPPLA.DLL';

function A_Get_Graphic(x, y, mem_mode: integer; format: char; filename: pchar): integer; stdcall; external 'WINPPLA.DLL';

function A_Draw_Box(mode, x, y, width, height, top, side: integer): integer; stdcall; external 'WINPPLA.DLL';

function A_Draw_Line(mode, x, y, width, height: integer): integer; stdcall; external 'WINPPLA.DLL';

procedure A_ClosePrn(); stdcall; external 'WINPPLA.DLL';

function A_Load_Graphic(x, y: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';

function A_Clear_Memory(): integer; stdcall; external 'WINPPLA.DLL';



function RMaskCGC_CPF(wCgc1: string; Zeros: Integer): string;
var S: string;
  x: integer;
begin

  for x := 1 to length(wCgc1) do
    if wCgc1[x] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'] then
      S := S + wCgc1[x];

  while Length(S) < Zeros do
    S := '0' + S;

  Result := S;
end;

procedure TFImpressaoEtiqueta.Contar(ms: longint);
var OTempo: LongInt;
begin
  OTempo := GetTickCount + ms;
  while GetTickCount < OTempo do Application.ProcessMessages;
end;

procedure TFImpressaoEtiqueta.SBImpCalculoClick(Sender: TObject);
var
  F: TextFile;
  wLinha, S, wCodBarra, wObs, wNumPecaChapa, wPedido, wAux3: string;
  wChapa, wTotalChapa, wNumPeca, wSeqImpressao, wCont, wAux, wAux1, wAux2: integer;
begin
  wAux := 0;
  wCont := 0;
  wAux2 := 0;
  wSeqImpressao := 0;
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName); {Pega arquivo selecionado em dialogo box}
    Reset(F);
    while wAux2 < 58 do
    begin
      Readln(F, S);
      inc(wAux2); {Le a primeira linha do arquivo }
    end;

    if Copy(S, 3, 1) = '/' then
    begin
      wAux1 := 2;
      wTotalChapa := StrToInt(Copy(S, 4, 1));
      wChapa := StrToInt(Copy(S, 2, 1));
    end
    else
      if Copy(S, 4, 1) = '/' then
      begin
        wAux1 := 3;
        wTotalChapa := StrToInt(Copy(S, 5, 2));
        wChapa := StrToInt(Copy(S, 2, 2));
      end;

    while (S <> '') do
    begin
      if copy(S, 2, wAux1) = IntToStr(wChapa) + '/' then
      begin
        A_CreatePrn(1, 'ppla.txt');
        A_Set_Darkness(12);
        A_Prn_Text(275, 200, 3, 5, 0, 1, 1, 'n', 2, pchar(copy(S, 1, 6)));
        A_Print_Out(1, 1, 1, 1);
        A_ClosePrn;
        if wChapa <= wTotalChapa then
          inc(wChapa);
        ReadLn(F, S);
        wNumPeca := 1;
        contar(1000);
      end;
      if wNumPeca > 1000 then
        wNumPeca := 1;
      //while ((copy(S,8,1) = 'F') or (copy(S,8,1) = 'M')) do
      while ((copy(S, 2, wAux1) <> IntToStr(wChapa) + '/') and (Trim(S) <> '* * * * *') and (Trim(S) <> '')) do
      begin
        with DMPedido do
        begin
          if ((copy(S, 3, 1) = '/') or (copy(S, 4, 1) = '/')) then
            ReadLn(F, S);
          wAux3 := copy(S, 2, 6);
          while copy(wAux3, 1, 1) = '0' do
            wAux3 := copy(wAux3, 2, 6);
          wPedido := DMOracle.BuscaNome('SELECT COD_PEDIDO FROM TB_MATERIAL', 'COD_PECA=' + chr(39) + wAux3 + chr(39));
          wNumPecaChapa := DMOracle.BuscaNome('SELECT COUNT(COD_MATERIAL) FROM TB_MATERIAL', 'COD_PEDIDO=' + wPedido);
          DMPedido.QEtiquetaOpty.Close;
          DMPedido.QEtiquetaOpty.SetVariable('COD_PEDIDO_CAB', wPedido);
          DMPedido.QEtiquetaOpty.Open;
          DMPedido.QEtiquetaOpty.First;
          while RMaskCGC_CPF(QEtiquetaOptyCOD_PECA.Text, 6) <> copy(S, 2, 6) do
          begin
            QEtiquetaOpty.Next;
            inc(wNumPeca);
          end;

          wObs := Trim(QEtiquetaOptyDESC_SERVICO.Text) + ' ' + Trim(QEtiquetaOptyDESC_ACABAMENTO.Text) + ' ' +
            Trim(QEtiquetaOptyDESC_CANTO.Text) + ' ' + Trim(QEtiquetaOptyDESC_FORMA.Text);
          wCodBarra := RMaskCGC_CPF(QEtiquetaOptyCOD_PECA.Text, 6) +
            RMaskCGC_CPF(QEtiquetaOptyCOD_PRODUTO.Text, 6) +
            RMaskCGC_CPF(QEtiquetaOptyNUM_SERIE.Text, 2) +
            RMaskCGC_CPF(QEtiquetaOptyCOD_PEDIDO_ITEM.Text, 6);

          DMOracle.QExecSQL.Close;
          DMOracle.QExecSQL.SQL.Clear;
          DMOracle.QExecSQL.SQL.Add('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_CALCULO =''S'' WHERE COD_PEDIDO_ITEM=' + QEtiquetaOptyCOD_PEDIDO_ITEM.Text);
          DMOracle.QExecSQL.ExecSQL;
          DMOracle.DBCemapa.Commit;

            //impressao invertida
          A_CreatePrn(1, 'ppla.txt');
          A_Set_Darkness(12);
          A_Prn_Text(310, 018, 3, 3, 0, 1, 1, 'n', 2, pchar(IntToStr(wNumPeca) + '/' + wNumPecaChapa));
          if QEtiquetaOptyIND_REPOSICAO.Text = 'SIM' then
            A_Prn_Text(250, 018, 3, 3, 0, 1, 1, 'n', 2, pchar('R' + QEtiquetaOptyQT_REPOSICAO.Text));
          A_Get_Graphic(125, 25, 2, 'B', pchar('c:\executaveis\TEMPER.bmp'));
          A_Prn_Text(115, 40, 3, 2, 0, 3, 3, 'n', 2, pchar(QEtiquetaOptyCOD_PEDIDO_CAB.Text));
          A_Prn_Text(100, 75, 3, 2, 0, 2, 2, 'n', 2, pchar(QEtiquetaOptyDESC_COMPLEMENTO.Text));
          A_Prn_Text(310, 110, 3, 4, 0, 1, 1, 'n', 2, pchar(Copy(QEtiquetaOptyDESC_FANTASIA.Text, 1, 14) + '-' + QEtiquetaOptyDESC_COMPLEMENTO_OBS.Text));
          A_Prn_Barcode(300, 170, 3, 'E', 0, 2, 50, 'N', 1, pchar(wCodBarra));
          A_Prn_Text(280, 190, 3, 4, 0, 1, 1, 'n', 2, pchar(QEtiquetaOptyVAL_LARGURA.Text + ' x ' + QEtiquetaOptyVAL_ALTURA.Text));
          A_Prn_Text(100, 190, 3, 4, 0, 1, 1, 'n', 2, pchar(RMaskCGC_CPF(QEtiquetaOptyCOD_PECA.Text, 6) + QEtiquetaOptyIND_TIPO.Text));
          A_Prn_Text(310, 205, 3, 2, 0, 1, 1, 'n', 2, pchar(Trim(wObs)));
          A_Prn_Text(310, 240, 3, 2, 0, 2, 3, 'n', 2, pchar(Copy(QEtiquetaOptyDESC_REGIAO.Text, 1, 3)));
          A_Prn_Text(90, 240, 3, 3, 0, 1, 1, 'n', 2, pchar(DateToStr(date)));
          A_Print_Out(1, 1, 1, 1);
          A_ClosePrn;

            //impressao normal
            {A_CreatePrn(1, 'ppla.txt');
            A_Set_Darkness(12);
            A_Prn_Text(015, 229, 2, 3, 0, 1, 1, 'n', 2, pchar(IntToStr(wNumPeca) + '/'+ wNumPecaChapa));
            If QEtiquetaOptyIND_REPOSICAO.Text = 'S' Then
              A_Prn_Text(045, 229, 1, 3, 0, 1, 1, 'n', 2, pchar('R'+QEtiquetaOptyQT_REPOSICAO.Text));
            A_Get_Graphic(015, 180, 2, 'B', pchar('c:\executaveis\TEMPER.bmp'));
            A_Prn_Text(210, 200, 1, 2, 0, 3, 3, 'n', 2, pchar(QEtiquetaOptyCOD_PEDIDO_CAB.Text));
            A_Prn_Text(204, 172, 1, 2, 0, 2, 2, 'n', 2, pchar(QEtiquetaOptyDESC_COMPLEMENTO.Text));
            A_Prn_Text(7, 137, 3, 4, 0, 1, 1, 'n', 2, pchar(Copy(QEtiquetaOptyNOME.Text,1,14) +'-'+ QEtiquetaOptyDESC_COMPLEMENTO_OBS.Text));
            A_Prn_Barcode(35, 75, 1, 'E', 0, 10, 50, 'N', 1, pchar(wCodBarra));
            A_Prn_Text(030, 060, 1, 3, 0, 1, 1, 'n', 2, pchar(QEtiquetaOptyVAL_LARGURA.Text+' x '+QEtiquetaOptyVAL_ALTURA.Text));
            A_Prn_Text(230,060, 1, 3, 0, 1, 1, 'n', 2, pchar(RMaskCGC_CPF(QEtiquetaOptyCOD_PECA.Text,6)+QEtiquetaOptyIND_TIPO.Text));
            A_Prn_Text(030,040, 1, 2, 0, 1, 1, 'n', 2, pchar(Trim(wObs)));
            A_Prn_Text(010, 006, 1, 2, 0, 2, 3, 'n', 2, pchar(Copy(QEtiquetaOptyDESC_REGIAO.Text,1,3)));
            A_Prn_Text(230, 006, 1, 3, 0, 1, 1, 'n', 2, pchar(DateToStr(date)));
            A_Print_Out(1, 1, 1, 1);
            A_ClosePrn; }
          contar(1000);
        end;
        wNumPeca := 1;
        ReadLn(F, S);
      end;
      if Trim(S) = '* * * * *' then
        S := '';
    end;
  end; // Fim do begin OpenDialog.

  CloseFile(F); // Fecha arquivo aberto.

  FImpressaoEtiqueta.Close;
  DMPedido.QEtiquetaOpty.Close;
end;

procedure TFImpressaoEtiqueta.SBImpPecaClick(Sender: TObject);
var
  wCodBarra, wObs, wNumPecaChapa, wPedido: string;
  wNumPeca: integer;
begin
  wNumPeca := 1;
  if Trim(MePeca.Text) = '' then
    raise Exception.Create('Informe a Peça!');
  with DMPedido do
  begin
    wPedido := DMOracle.BuscaNome('SELECT COD_PEDIDO FROM TB_MATERIAL', 'COD_PECA=' + chr(39) + Trim(MePeca.Text) + chr(39));
    wNumPecaChapa := DMOracle.BuscaNome('SELECT COUNT(COD_MATERIAL) FROM TB_MATERIAL', 'COD_PEDIDO=' + wPedido);
    DMPedido.QEtiquetaOpty.Close;
    DMPedido.QEtiquetaOpty.SetVariable('COD_PEDIDO_CAB', wPedido);
    DMPedido.QEtiquetaOpty.Open;
    DMPedido.QEtiquetaOpty.First;
    while QEtiquetaOptyCOD_PECA.Text <> Trim(MEPeca.Text) do
    begin
      QEtiquetaOpty.Next;
      inc(wNumPeca);
    end;
    if wNumPeca > 1000 then
      wNumPeca := 1;
    wObs := Trim(QEtiquetaOptyDESC_SERVICO.Text) + ' ' + Trim(QEtiquetaOptyDESC_ACABAMENTO.Text) + ' ' +
      Trim(QEtiquetaOptyDESC_CANTO.Text) + ' ' + Trim(QEtiquetaOptyDESC_FORMA.Text);
    wCodBarra := RMaskCGC_CPF(QEtiquetaOptyCOD_PECA.Text, 6) +
      RMaskCGC_CPF(QEtiquetaOptyCOD_PRODUTO.Text, 6) +
      RMaskCGC_CPF(QEtiquetaOptyNUM_SERIE.Text, 2) +
      RMaskCGC_CPF(QEtiquetaOptyCOD_PEDIDO_ITEM.Text, 6);
    A_CreatePrn(1, 'ppla.txt');
    A_Set_Darkness(12);
    A_Prn_Text(310, 018, 3, 3, 0, 1, 1, 'n', 2, pchar(IntToStr(wNumPeca) + '/' + wNumPecaChapa));
    if QEtiquetaOptyIND_REPOSICAO.Text = 'SIM' then
      A_Prn_Text(250, 018, 3, 3, 0, 1, 1, 'n', 2, pchar('R' + QEtiquetaOptyQT_REPOSICAO.Text));
    A_Get_Graphic(125, 25, 2, 'B', pchar('c:\executaveis\TEMPER.bmp'));
    A_Prn_Text(115, 40, 3, 2, 0, 3, 3, 'n', 2, pchar(QEtiquetaOptyCOD_PEDIDO_CAB.Text));
    A_Prn_Text(100, 75, 3, 2, 0, 2, 2, 'n', 2, pchar(QEtiquetaOptyDESC_COMPLEMENTO.Text));
    A_Prn_Text(310, 110, 3, 4, 0, 1, 1, 'n', 2, pchar(Copy(QEtiquetaOptyDESC_FANTASIA.Text, 1, 14) + '-' + QEtiquetaOptyDESC_COMPLEMENTO_OBS.Text));
    A_Prn_Barcode(300, 170, 3, 'E', 0, 2, 50, 'N', 1, pchar(wCodBarra));
    A_Prn_Text(280, 190, 3, 4, 0, 1, 1, 'n', 2, pchar(QEtiquetaOptyVAL_LARGURA.Text + ' x ' + QEtiquetaOptyVAL_ALTURA.Text));
    A_Prn_Text(100, 190, 3, 4, 0, 1, 1, 'n', 2, pchar(RMaskCGC_CPF(QEtiquetaOptyCOD_PECA.Text, 6) + QEtiquetaOptyIND_TIPO.Text));
    A_Prn_Text(310, 205, 3, 2, 0, 1, 1, 'n', 2, pchar(Trim(wObs)));
    A_Prn_Text(310, 240, 3, 2, 0, 2, 3, 'n', 2, pchar(Copy(QEtiquetaOptyDESC_REGIAO.Text, 1, 3)));
    A_Prn_Text(90, 240, 3, 3, 0, 1, 1, 'n', 2, pchar(FormatDateTime('dd/MM/yyyy', Date)));
    A_Print_Out(1, 1, 1, 1);
    A_ClosePrn;
    DMPedido.QEtiquetaOpty.Close;
  end;
end;

procedure TFImpressaoEtiqueta.SBImpChapaClick(Sender: TObject);
var
  F: TextFile;
  S, wCodBarra, wObs, wNumPecaChapa, wPedido, wAux3: string;
  wChapa, wTotalChapa, wNumPeca, wAux1, wAux2: integer;

begin
  wNumPeca := 1;
  wAux2 := 0;
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName); {Pega arquivo selecionado em dialogo box}
    Reset(F);
   // Readln(F,S);                             {Le a primeira linha do arquivo }
   // Readln(F,S);                            {Le a proxima linha do arquivo }
    while wAux2 < 58 do
    begin
      Readln(F, S);
      inc(wAux2); {Le a primeira linha do arquivo }
    end;

    wChapa := StrToInt(MeChapa.Text);
    if wChapa < 10 then
      wAux1 := 2
    else
      wAux1 := 3;

    while (S <> '') do
    begin
      while Copy(S, 2, wAux1) <> IntToStr(wChapa) + '/' do
        Readln(F, S);

      if copy(S, 2, wAux1) = IntToStr(wChapa) + '/' then
      begin
        A_CreatePrn(1, 'ppla.txt');
        A_Set_Darkness(12);
        A_Prn_Text(275, 200, 3, 5, 0, 1, 1, 'n', 2, pchar(copy(S, 1, 11)));
        A_Print_Out(1, 1, 1, 1);
        A_ClosePrn;
        ReadLn(F, S);
      end;
      if wNumPeca > 1000 then
        wNumPeca := 1;
      //while (copy(S,8,1) = 'F') or (copy(S,8,1) = 'M') do
      while ((copy(S, 2, wAux1) <> IntToStr(wChapa) + '/') and (Trim(S) <> '* * * * *') and (Trim(S) <> '')) do
      begin
        with DMPedido do
        begin
          wAux3 := copy(S, 2, 6);
          while copy(wAux3, 1, 1) = '0' do
            wAux3 := copy(wAux3, 2, 6);
          wPedido := DMOracle.BuscaNome('SELECT COD_PEDIDO FROM TB_MATERIAL', 'COD_PECA=' + chr(39) + wAux3 + chr(39));
          try
            wNumPecaChapa := DMOracle.BuscaNome('SELECT COUNT(COD_MATERIAL) FROM TB_MATERIAL', 'COD_PEDIDO=' + wPedido);
          except
            Abort;
//          on e: Exception do
//            raise Exception.Create(e.Message + #13 + #10 + 'wAux3=' + wAux3 + ' wPedido=' + wPedido + ' wChapa=' + IntToStr(wChapa) + ' S=' + S);
          end;
          DMPedido.QEtiquetaOpty.Close;
          DMPedido.QEtiquetaOpty.SetVariable('COD_PEDIDO_CAB', wPedido);
          DMPedido.QEtiquetaOpty.Open;
          DMPedido.QEtiquetaOpty.First;
          while RMaskCGC_CPF(QEtiquetaOptyCOD_PECA.Text, 6) <> copy(S, 2, 6) do
          begin
            QEtiquetaOpty.Next;
            inc(wNumPeca);
          end;

          wObs := Trim(QEtiquetaOptyDESC_SERVICO.Text) + ' ' + Trim(QEtiquetaOptyDESC_ACABAMENTO.Text) + ' ' +
            Trim(QEtiquetaOptyDESC_CANTO.Text) + ' ' + Trim(QEtiquetaOptyDESC_FORMA.Text);
          wCodBarra := RMaskCGC_CPF(QEtiquetaOptyCOD_PECA.Text, 6) +
            RMaskCGC_CPF(QEtiquetaOptyCOD_PRODUTO.Text, 6) +
            RMaskCGC_CPF(QEtiquetaOptyNUM_SERIE.Text, 2) +
            RMaskCGC_CPF(QEtiquetaOptyCOD_PEDIDO_ITEM.Text, 6);

          DMOracle.QExecSQL.Close;
          DMOracle.QExecSQL.SQL.Clear;
          DMOracle.QExecSQL.SQL.Add('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_CALCULO =''S'' WHERE COD_PEDIDO_ITEM=' + QEtiquetaOptyCOD_PEDIDO_ITEM.Text);
          DMOracle.QExecSQL.ExecSQL;
          DMOracle.DBCemapa.Commit;

          A_CreatePrn(1, 'ppla.txt');
          A_Set_Darkness(12);
          A_Prn_Text(310, 018, 3, 3, 0, 1, 1, 'n', 2, pchar(IntToStr(wNumPeca) + '/' + wNumPecaChapa));
          if QEtiquetaOptyIND_REPOSICAO.Text = 'SIM' then
            A_Prn_Text(250, 018, 3, 3, 0, 1, 1, 'n', 2, pchar('R' + QEtiquetaOptyQT_REPOSICAO.Text));
          A_Get_Graphic(125, 25, 2, 'B', pchar('c:\executaveis\TEMPER.bmp'));
          A_Prn_Text(115, 40, 3, 2, 0, 3, 3, 'n', 2, pchar(QEtiquetaOptyCOD_PEDIDO_CAB.Text));
          A_Prn_Text(100, 75, 3, 2, 0, 2, 2, 'n', 2, pchar(QEtiquetaOptyDESC_COMPLEMENTO.Text));
          A_Prn_Text(310, 110, 3, 4, 0, 1, 1, 'n', 2, pchar(Copy(QEtiquetaOptyDESC_FANTASIA.Text, 1, 14) + '-' + QEtiquetaOptyDESC_COMPLEMENTO_OBS.Text));
          A_Prn_Barcode(300, 170, 3, 'E', 0, 2, 50, 'N', 1, pchar(wCodBarra));
          A_Prn_Text(280, 190, 3, 4, 0, 1, 1, 'n', 2, pchar(QEtiquetaOptyVAL_LARGURA.Text + ' x ' + QEtiquetaOptyVAL_ALTURA.Text));
          A_Prn_Text(100, 190, 3, 4, 0, 1, 1, 'n', 2, pchar(RMaskCGC_CPF(QEtiquetaOptyCOD_PECA.Text, 6) + QEtiquetaOptyIND_TIPO.Text));
          A_Prn_Text(310, 205, 3, 2, 0, 1, 1, 'n', 2, pchar(Trim(wObs)));
          A_Prn_Text(310, 240, 3, 2, 0, 2, 3, 'n', 2, pchar(Copy(QEtiquetaOptyDESC_REGIAO.Text, 1, 3)));
          A_Prn_Text(90, 240, 3, 3, 0, 1, 1, 'n', 2, pchar(DateToStr(date)));
          A_Print_Out(1, 1, 1, 1);
          A_ClosePrn;

          {A_CreatePrn(1, 'ppla.txt');
          A_Set_Darkness(12);
          A_Prn_Text(015, 229, 1, 3, 0, 1, 1, 'n', 2, pchar(IntToStr(wNumPeca) + '/'+ wNumPecaChapa));
          If QEtiquetaOptyIND_REPOSICAO.Text = 'S' Then
              A_Prn_Text(045, 229, 1, 3, 0, 1, 1, 'n', 2, pchar('R'+QEtiquetaOptyQT_REPOSICAO.Text));
          A_Get_Graphic(015, 180, 2, 'B', pchar('c:\executaveis\TEMPER.bmp'));
          A_Prn_Text(210, 200, 1, 2, 0, 3, 3, 'n', 2, pchar(QEtiquetaOptyCOD_PEDIDO_CAB.Text));
          A_Prn_Text(204, 172, 1, 2, 0, 2, 2, 'n', 2, pchar(QEtiquetaOptyDESC_COMPLEMENTO.Text));
          A_Prn_Text(7, 137, 1, 4, 0, 1, 1, 'n', 2, pchar(Copy(QEtiquetaOptyNOME.Text,1,14) +'-'+ QEtiquetaOptyDESC_COMPLEMENTO_OBS.Text));
          A_Prn_Barcode(35, 75, 1, 'E', 0, 10, 50, 'N', 1, pchar(wCodBarra));
          A_Prn_Text(030, 060, 1, 3, 0, 1, 1, 'n', 2, pchar(QEtiquetaOptyVAL_LARGURA.Text+' x '+QEtiquetaOptyVAL_ALTURA.Text));
          A_Prn_Text(230,060, 1, 3, 0, 1, 1, 'n', 2, pchar(RMaskCGC_CPF(QEtiquetaOptyCOD_PECA.Text,6)+QEtiquetaOptyIND_TIPO.Text));
          A_Prn_Text(030,040, 1, 2, 0, 1, 1, 'n', 2, pchar(Trim(wObs)));
          A_Prn_Text(010, 006, 1, 2, 0, 2, 3, 'n', 2, pchar(Copy(QEtiquetaOptyDESC_REGIAO.Text,1,3)));
          A_Prn_Text(230, 006, 1, 3, 0, 1, 1, 'n', 2, pchar(DateToStr(date)));
          A_Print_Out(1, 1, 1, 1);
          A_ClosePrn; }
        end;

        wNumPeca := 1;
        ReadLn(F, S);
      end;
      S := '';
    end;
  end; // Fim do begin OpenDialog.

  CloseFile(F); // Fecha arquivo aberto.

  FImpressaoEtiqueta.Close;
  DMPedido.QEtiquetaOpty.Close;
end;

procedure TFImpressaoEtiqueta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_f6 then
  begin

    A_CreatePrn(1, 'ppla.txt');
    A_Set_Darkness(12);
    A_Prn_Text(275, 200, 3, 5, 0, 1, 1, 'n', 2, pchar('S(1,11)'));
    A_Print_Out(1, 1, 1, 1);
    A_ClosePrn;

    A_CreatePrn(1, 'ppla.txt');
    A_Set_Darkness(12);
    A_Prn_Text(310, 018, 3, 3, 0, 1, 1, 'n', 2, pchar('wNumPeca' + '/' + 'wNumPecaChapa'));
    A_Prn_Text(250, 018, 3, 3, 0, 1, 1, 'n', 2, pchar('R'));

    A_Get_Graphic(125, 25, 2, 'B', pchar('c:\executaveis\TEMPER.bmp'));
    A_Prn_Text(115, 40, 3, 2, 0, 3, 3, 'n', 2, pchar('cod.ped'));
    A_Prn_Text(100, 75, 3, 2, 0, 2, 2, 'n', 2, pchar('compl'));
    A_Prn_Text(310, 110, 3, 4, 0, 1, 1, 'n', 2, pchar('fantasia' + '-' + 'comp.obs'));
    A_Prn_Barcode(300, 170, 3, 'E', 0, 2, 50, 'N', 1, pchar('00000000000000000000'));
    A_Prn_Text(280, 190, 3, 4, 0, 1, 1, 'n', 2, pchar('larg' + ' x ' + 'alt'));
    A_Prn_Text(100, 190, 3, 4, 0, 1, 1, 'n', 2, pchar('cod.pc' + 'tipo'));
    A_Prn_Text(310, 205, 3, 2, 0, 1, 1, 'n', 2, pchar('wObs'));
    A_Prn_Text(310, 240, 3, 2, 0, 2, 3, 'n', 2, pchar('regiao'));
    A_Prn_Text(90, 240, 3, 3, 0, 1, 1, 'n', 2, pchar('data'));
    A_Print_Out(1, 1, 1, 1);
    A_ClosePrn;

  end;
end;

end.

