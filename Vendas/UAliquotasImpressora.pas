unit UAliquotasImpressora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ActnList;

type
  TFAliquotasImpressora = class(TForm)
    GroupBox1: TGroupBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MaskEdit9: TMaskEdit;
    Label10: TLabel;
    MaskEdit10: TMaskEdit;
    Label11: TLabel;
    MaskEdit11: TMaskEdit;
    Label12: TLabel;
    MaskEdit12: TMaskEdit;
    Label13: TLabel;
    MaskEdit13: TMaskEdit;
    Label14: TLabel;
    MaskEdit14: TMaskEdit;
    Label15: TLabel;
    MaskEdit15: TMaskEdit;
    Label16: TLabel;
    MaskEdit16: TMaskEdit;
    GroupBox2: TGroupBox;
    MeICMS: TMaskEdit;
    MeISS: TMaskEdit;
    Label17: TLabel;
    Label18: TLabel;
    btSair: TButton;
    ActionList1: TActionList;
    Action1: TAction;
    procedure FormActivate(Sender: TObject);
    Function Retorno_Impressora: Boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
    Procedure Analisa_iRetorno();
    function Analisa_iST1: TStrings;
    function Analisa_iST2: TStrings;
    function Analisa_iST3: String;
    function FormataAliquota(pAliquota: String): String;
  public
    { Public declarations }
  end;
  function Bematech_FI_RetornoAliquotas(Aliquotas: String): Integer;
    StdCall; External 'BEMAFI32.DLL';
  function Bematech_FI_VerificaIndiceAliquotasIss(Flag: String): Integer;
    StdCall; External 'BEMAFI32.DLL';
  function Bematech_FI_RetornoImpressoraMFD( Var ACK: Integer; Var ST1: Integer;
     Var ST2: Integer; Var ST3: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
var
  FAliquotasImpressora: TFAliquotasImpressora;
  iRetorno,iST1,iST2,iST3: Integer;

implementation

uses UImpressoraFiscal;

{$R *.dfm}

procedure TFAliquotasImpressora.FormActivate(Sender: TObject);
var
  iConta : Integer;
  sAliquotas : String;
  sAliquota : String;
  sISS : String;
  sICMS : String;
  iIndice : Integer;
  iIndiceISS : Integer;
  iIndiceVerifica : Integer;
begin
  for iConta := 1 to 80 do sAliquotas := sAliquotas + ' ';
  iRetorno := Bematech_FI_RetornoAliquotas(sAliquotas);  //Comando que recebe as alíquotas
  Analisa_iRetorno();
  Retorno_Impressora();

  for iConta := 1 to 49 do sISS := sISS + ' ';
  iRetorno := Bematech_FI_VerificaIndiceAliquotasIss(sISS); //Comando que recebe os índices
  Analisa_iRetorno();
  Retorno_Impressora();

  iIndice:=1;
  iIndiceVerifica := 1;
 
  for iConta := 1 to 16 do  //Laço para salvar cada alíquota no seu determino campo
  begin
    sAliquota := copy(sAliquotas,iIndice,4); //Copiando para variável a alíquota de String
    case iConta of
      1: Maskedit1.Text := sAliquota;
      2: Maskedit2.Text := sAliquota;
      3: Maskedit3.Text := sAliquota;
      4: Maskedit4.Text := sAliquota;
      5: Maskedit5.Text := sAliquota;
      6: Maskedit6.Text := sAliquota;
      7: Maskedit7.Text := sAliquota;
      8: Maskedit8.Text := sAliquota;
      9: Maskedit9.Text := sAliquota;
      10: Maskedit10.Text := sAliquota;
      11: Maskedit11.Text := sAliquota;
      12: Maskedit12.Text := sAliquota;
      13: Maskedit13.Text := sAliquota;
      14: Maskedit14.Text := sAliquota;
      15: Maskedit15.Text := sAliquota;
      16: Maskedit16.Text := sAliquota;
    end;
    iIndice := iIndice + 5; //Somando a quantidade de bytes para a copia da próxima alíquota
 
    if trim(sISS) = '' then //Verificando se há alíquotas de ISS
    begin
      if sAliquota <> '0000' then  // validando se a alíquota é zerada
      begin
        MeICMS.Text := MeICMS.Text + FormataAliquota(sAliquota) + '% ';
      end;
    end
    else
    begin
      iIndiceISS := StrToInt(Copy(sISS,iIndiceVerifica,2));
      if iIndiceISS = iConta then // Verificando se o índice é o mesmo da lista de alíquotas
      begin
        if sAliquota <> '0000' then
        begin
          MeISS.Text := MeISS.Text + FormataAliquota(sAliquota) + '% ';
          iIndiceVerifica := iIndiceVerifica + 3;
        end;
      end
      else
      begin
        if sAliquota <> '0000' then
        begin
          MeICMS.Text := MeICMS.Text + FormataAliquota(sAliquota) + '% ';
        end;
      end;
    end;

  end;

end;

function TFAliquotasImpressora.FormataAliquota(pAliquota: String): String;
begin
  if Pos(',',pAliquota) = 0 then
    Result := Copy(pAliquota,1,2) + ','+ Copy(pAliquota,3,2)
  else
    Result := pAliquota;
end;

Procedure TFAliquotasImpressora.Analisa_iRetorno();
Begin
    if iRetorno = 0 then
       Application.MessageBox( 'Erro de Comunicação !', 'Erro',
                                MB_IconError + MB_OK);

    If iRetorno = -1 Then
       Application.MessageBox( 'Erro de Execução na Função. Verifique!', 'Erro',
                                MB_IconError + MB_OK);

    if iRetorno = -2  then
       Application.MessageBox( 'Parâmetro Inválido !', 'Erro',
                                MB_IconError + MB_OK);

    if iRetorno = -3  then
       Application.MessageBox( 'Alíquota não programada !', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -4 Then
       Application.MessageBox( 'Arquivo BemaFI32.INI não encontrado. Verifique!', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -5 Then
       Application.MessageBox( 'Erro ao Abrir a Porta de Comunicação', 'Erro',
                                MB_IconError + MB_OK);

    If iRetorno = -6 Then
       Application.MessageBox( 'Impressora Desligada ou Desconectada', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -7 Then
       Application.MessageBox( 'Banco Não Cadastrado no Arquivo BemaFI32.ini', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -8 Then
       Application.MessageBox( 'Erro ao Criar ou Gravar no Arquivo Retorno.txt ou Status.txt', 'Erro',
                                MB_IconError + MB_OK);

    if iRetorno = -18 then
       Application.MessageBox( 'Não foi possível abrir arquivo INTPOS.001 !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -19 then
       Application.MessageBox( 'Parâmetro diferentes !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -20 then
       Application.MessageBox( 'Transação cancelada pelo Operador !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -21 then
       Application.MessageBox( 'A Transação não foi aprovada !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -22 then
       Application.MessageBox( 'Não foi possível terminal a Impressão !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -23 then
       Application.MessageBox( 'Não foi possível terminal a Operação !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -24 then
       Application.MessageBox( 'Forma de pagamento não programada.', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -25 then
       Application.MessageBox( 'Totalizador não fiscal não programado.', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -26 then
       Application.MessageBox( 'Transação já Efetuada !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -28 then
       Application.MessageBox( 'Não há Informações para serem Impressas !', 'Atenção',
                                MB_IconInformation + MB_OK);

end;

Function TFAliquotasImpressora.Retorno_Impressora: Boolean;
var
  wMsg: TStrings;
  iACK, iST1,iST2,iST3: integer;
Begin
  wMsg := TStringList.Create;
  wMsg.Clear;
  iACK := 0; iST1 := 0; iST2 := 0; iST3 := 0;
  iRetorno := Bematech_FI_RetornoImpressoraMFD(iACK, iST1, iST2, iST3);
  if (iST1 > 0) then
    wMsg.AddStrings(Analisa_iST1);
  if (iST2 > 0) then
    wMsg.AddStrings(Analisa_iST2);
  if (iST3 > 0) then
    wMsg.Add(Analisa_iST3());
  if wMsg.Count > 0 then
    MessageDlg(wMsg.Text, mtError, [mbOK], 0);

  result := wMsg.Count = 0;
End;

function TFAliquotasImpressora.Analisa_iST1: TStrings;
var
  wMsg: TStrings;
begin
  wMsg := TStringList.Create;
  wMsg.Clear;
  If iSt1 >= 128 Then
  begin                                                // bit 7
    iSt1 := iSt1 - 128;
    wMsg.Add('Fim de Papel');
  End;
  If iSt1 >= 64 Then                                                // bit 6
    iSt1 := iSt1 - 64;
  If (iSt1 >= 32) Then
  begin                                                // bit 5
    iSt1 := iSt1 - 32;
    wMsg.Add('Erro no Relógio');
  End;
  If iSt1 >= 16 Then
  begin                                                // bit 4
    iSt1 := iSt1 - 16;
    wMsg.Add('Impressora em Erro');
  End;
  If iSt1 >= 8 Then                                                // bit 3
  begin
    iSt1 := iSt1 - 8;
    wMsg.Add('Comando não iniciado com ESC');
  End;
  If iSt1 >= 4 Then
  begin                                                // bit 2
    iSt1 := iSt1 - 4;
    wMsg.Add('Comando Inexistente');
  End;
  If iSt1 >= 2 Then
  begin                                                // bit 1
    iSt1 := iSt1 - 2;
    wMsg.Add('Cupom Aberto');
  End;
  If iSt1 >= 1 Then                                                // bit 0
  begin
    wMsg.Add('Número de Parâmetro(s) Inválido(s)');
  End;
  result := wMsg;
end;

function TFAliquotasImpressora.Analisa_iST2: TStrings;
var
  wMsg: TStrings;
begin
  wMsg := TStringList.Create;
  wMsg.Clear;
  If iSt2 >= 128 Then
  begin                                                // bit 7
    iSt2 := iSt2 - 128;
    wMsg.Add('Tipo de Parâmetro de Comando Inválido');
  End;
  If iSt2 >= 64 Then
  begin                                               // bit 6
    iSt2 := iSt2 - 64;
    wMsg.Add('Memória Fiscal Lotada');
  end;
  If (iSt2 >= 32) Then
  begin                                                // bit 5
    iSt2 := iSt2 - 32;
    wMsg.Add('Erro na Memória RAM');
  End;
  If iSt2 >= 16 Then
  begin                                                // bit 4
    iSt2 := iSt2 - 16;
    wMsg.Add('Alíquota Não Programada');
  End;
  If iSt2 >= 8 Then                                                // bit 3
  begin
    iSt2 := iSt2 - 8;
    wMsg.Add('Capacidade de Alíquotas Lotada');
  End;
  If iSt2 >= 4 Then
  begin                                                // bit 2
    iSt2 := iSt2 - 4;
    wMsg.Add('Cancelamento Não Permitido');
  End;
  If iSt2 >= 2 Then
  begin                                                // bit 1
    iSt2 := iSt2 - 2;
    wMsg.Add('CNPJ/IE do Proprietário Não Programado');
  End;
  If iSt2 >= 1 Then                                                // bit 0
  begin
    wMsg.Add('Comando Não Executado');
  End;
  result := wMsg;
end;

function TFAliquotasImpressora.Analisa_iST3: String;
begin
  case iST3 of
    1: result := 'COMANDO INVÁLIDO';
    2: result := 'ERRO DESCONHECIDO';
    3: result := 'NÚMERO DE PARÂMETRO INVÁLIDO';
    4: result := 'TIPO DE PARÂMETRO INVÁLIDO';
    5: result := 'TODAS ALÍQUOTAS JÁ PROGRAMADAS';
    6: result := 'TOTALIZADOR NÃO FISCAL JÁ PROGRAMADO';
    7: result := 'CUPOM FISCAL ABERTO';
    8: result := 'CUPOM FISCAL FECHADO';
    9: result := 'ECF OCUPADO';
    10: result := 'IMPRESSORA EM ERRO';
    11: result := 'IMPRESSORA SEM PAPEL';
    12: result := 'IMPRESSORA COM CABEÇA LEVANTADA';
    13: result := 'IMPRESSORA OFF LINE';
    14: result := 'ALÍQUOTA NÃO PROGRAMADA';
    15: result := 'TERMINADOR DE STRING FALTANDO';
    16: result := 'ACRÉSCIMO OU DESCONTO MAIOR QUE O TOTAL DO CUPOM FISCAL';
    17: result := 'CUPOM FISCAL SEM ITEM VENDIDO';
    18: result := 'COMANDO NÃO EFETIVADO';
    19: result := 'SEM ESPAÇO PARA NOVAS FORMAS DE PAGAMENTO';
    20: result := 'FORMA DE PAGAMENTO NÃO PROGRAMADA';
    21: result := 'ÍNDICE MAIOR QUE NÚMERO DE FORMA DE PAGAMENTO';
    22: result := 'FORMAS DE PAGAMENTO ENCERRADAS';
    23: result := 'CUPOM NÃO TOTALIZADO';
    24: result := 'COMANDO MAIOR QUE 7Fh (127d)';
    25: result := 'CUPOM FISCAL ABERTO E SEM ÍTEM';
    26: result := 'CANCELAMENTO NÃO IMEDIATAMENTE APÓS';
    27: result := 'CANCELAMENTO JÁ EFETUADO';
    28: result := 'COMPROVANTE DE CRÉDITO OU DÉBITO NÃO PERMITIDO OU JÁ EMITIDO';
    29: result := 'MEIO DE PAGAMENTO NÃO PERMITE TEF';
    30: result := 'SEM COMPROVANTE NÃO FISCAL ABERTO';
    31: result := 'COMPROVANTE DE CRÉDITO OU DÉBITO JÁ ABERTO';
    32: result := 'REIMPRESSÃO NÃO PERMITIDA';
    33: result := 'COMPROVANTE NÃO FISCAL JÁ ABERTO';
    34: result := 'TOTALIZADOR NÃO FISCAL NÃO PROGRAMADO';
    35: result := 'CUPOM NÃO FISCAL SEM ÍTEM VENDIDO';
    36: result := 'ACRÉSCIMO E DESCONTO MAIOR QUE TOTAL CNF';
    37: result := 'MEIO DE PAGAMENTO NÃO INDICADO';
    38: result := 'MEIO DE PAGAMENTO DIFERENTE DO TOTAL DO RECEBIMENTO';
    39: result := 'NÃO PERMITIDO MAIS DE UMA SANGRIA OU SUPRIMENTO';
    40: result := 'RELATÓRIO GERENCIAL JÁ PROGRAMADO';
    41: result := 'RELATÓRIO GERENCIAL NÃO PROGRAMADO';
    42: result := 'RELATÓRIO GERENCIAL NÃO PERMITIDO';
    43: result := 'MFD NÃO INICIALIZADA';
    44: result := 'MFD AUSENTE';
    45: result := 'MFD SEM NÚMERO DE SÉRIE';
    46: result := 'MFD JÁ INICIALIZADA';
    47: result := 'MFD LOTADA';
    48: result := 'CUPOM NÃO FISCAL ABERTO';
    49: result := 'MEMÓRIA FISCAL DESCONECTADA';
    50: result := 'MEMÓRIA FISCAL SEM NÚMERO DE SÉRIE DA MFD';
    51: result := 'MEMÓRIA FISCAL LOTADA';
    52: result := 'DATA INICIAL INVÁLIDA';
    53: result := 'DATA FINAL INVÁLIDA';
    54: result := 'CONTADOR DE REDUÇÃO Z INICIAL INVÁLIDO';
    55: result := 'CONTADOR DE REDUÇÃO Z FINAL INVÁLIDO';
    56: result := 'ERRO DE ALOCAÇÃO';
    57: result := 'DADOS DO RTC INCORRETOS';
    58: result := 'DATA ANTERIOR AO ÚLTIMO DOCUMENTO EMITIDO';
    59: result := 'FORA DE INTERVENÇÃO TÉCNICA';
    60: result := 'EM INTERVENÇÃO TÉCNICA';
    61: result := 'ERRO NA MEMÓRIA DE TRABALHO';
    62: result := 'JÁ HOUVE MOVIMENTO NO DIA';
    63: result := 'BLOQUEIO POR RZ';
    64: result := 'FORMA DE PAGAMENTO ABERTA';
    65: result := 'AGUARDANDO PRIMEIRO PROPRIETÁRIO';
    66: result := 'AGUARDANDO RZ';
    67: result := 'ECF OU LOJA IGUAL A ZERO';
    68: result := 'CUPOM ADICIONAL NÃO PERMITIDO';
    69: result := 'DESCONTO MAIOR QUE TOTAL VENDIDO EM ICMS';
    70: result := 'RECEBIMENTO NÃO FISCAL NULO NÃO PERMITIDO';
    71: result := 'ACRÉSCIMO OU DESCONTO MAIOR QUE TOTAL NÃO FISCAL';
    72: result := 'MEMÓRIA FISCAL LOTADA PARA NOVO CARTUCHO';
    73: result := 'ERRO DE GRAVAÇÃO NA MF';
    74: result := 'ERRO DE GRAVAÇÃO NA MFD';
    75: result := 'DADOS DO RTC ANTERIORES AO ÚLTIMO DOC ARMAZENADO';
    76: result := 'MEMÓRIA FISCAL SEM ESPAÇO PARA GRAVAR LEITURAS DA MFD';
    77: result := 'MEMÓRIA FISCAL SEM ESPAÇO PARA GRAVAR VERSAO DO SB';
    78: result := 'DESCRIÇÃO IGUAL A DEFAULT NÃO PERMITIDO';
    79: result := 'EXTRAPOLADO NÚMERO DE REPETIÇÕES PERMITIDAS';
    80: result := 'SEGUNDA VIA DO COMPROVANTE DE CRÉDITO OU DÉBITO NÃO PERMITIDO';
    81: result := 'PARCELAMENTO FORA DA SEQUÊNCIA';
    82: result := 'COMPROVANTE DE CRÉDITO OU DÉBITO ABERTO';
    83: result := 'TEXTO COM SEQUÊNCIA DE ESC INVÁLIDA';
    84: result := 'TEXTO COM SEQUÊNCIA DE ESC INCOMPLETA';
    85: result := 'VENDA COM VALOR NULO';
    86: result := 'ESTORNO DE VALOR NULO';
    87: result := 'FORMA DE PAGAMENTO DIFERENTE DO TOTAL DA SANGRIA';
    88: result := 'REDUÇÃO NÃO PERMITIDA EM INTERVENÇÃO TÉCNICA';
    89: result := 'AGUARDANDO RZ PARA ENTRADA EM INTERVENÇÃO TÉCNICA';
    90: result := 'FORMA DE PAGAMENTO COM VALOR NULO NÃO PERMITIDO';
    91: result := 'ACRÉSCIMO E DESCONTO MAIOR QUE VALOR DO ÍTEM';
    92: result := 'AUTENTICAÇÃO NÃO PERMITIDA';
    93: result := 'TIMEOUT NA VALIDAÇÃO';
    94: result := 'COMANDO NÃO EXECUTADO EM IMPRESSORA BILHETE DE PASSAGEM';
    95: result := 'COMANDO NÃO EXECUTADO EM IMPRESSORA DE CUPOM FISCAL';
    96: result := 'CUPOM NÃO FISCAL FECHADO';
    97: result := 'PARÂMETRO NÃO ASCII EM CAMPO ASCII';
    98: result := 'PARÂMETRO NÃO ASCII NUMÉRICO EM CAMPO ASCII NUMÉRICO';
    99: result := 'TIPO DE TRANSPORTE INVÁLIDO';
    100: result := 'DATA E HORA INVÁLIDA';
    101: result := 'SEM RELATÓRIO GERENCIAL OU COMPROVANTE DE CRÉDITO OU DÉBITO ABERTO';
    102: result := 'NÚMERO DO TOTALIZADOR NÃO FISCAL INVÁLIDO';
    103: result := 'PARÂMETRO DE ACRÉSCIMO OU DESCONTO INVÁLIDO';
    104: result := 'ACRÉSCIMO OU DESCONTO EM SANGRIA OU SUPRIMENTO NÃO PERMITIDO';
    105: result := 'NÚMERO DO RELATÓRIO GERENCIAL INVÁLIDO';
    106: result := 'FORMA DE PAGAMENTO ORIGEM NÃO PROGRAMADA';
    107: result := 'FORMA DE PAGAMENTO DESTINO NÃO PROGRAMADA';
    108: result := 'ESTORNO MAIOR QUE FORMA PAGAMENTO';
    109: result := 'CARACTER NUMÉRICO NA CODIFICAÇÃO GT NÃO PERMITIDO';
    110: result := 'ERRO NA INICIALIZAÇÃO DA MF';
    111: result := 'NOME DO TOTALIZADOR EM BRANCO NÃO PERMITIDO';
    112: result := 'DATA E HORA ANTERIORES AO ÚLTIMO DOC ARMAZENADO';
    113: result := 'PARÂMETRO DE ACRÉSCIMO OU DESCONTO INVÁLIDO';
    114: result := 'ÍTEM ANTERIOR AOS TREZENTOS ÚLTIMOS';
    115: result := 'ÍTEM NÃO EXISTE OU JÁ CANCELADO';
    116: result := 'CÓDIGO COM ESPAÇOS NÃO PERMITIDO';
    117: result := 'DESCRICAO SEM CARACTER ALFABÉTICO NÃO PERMITIDO';
    118: result := 'ACRÉSCIMO MAIOR QUE VALOR DO ÍTEM';
    119: result := 'DESCONTO MAIOR QUE VALOR DO ÍTEM';
    120: result := 'DESCONTO EM ISS NÃO PERMITIDO';
    121: result := 'ACRÉSCIMO EM ÍTEM JÁ EFETUADO';
    122: result := 'DESCONTO EM ÍTEM JÁ EFETUADO';
    123: result := 'ERRO NA MEMÓRIA FISCAL CHAMAR CREDENCIADO';
    124: result := 'AGUARDANDO GRAVAÇÃO NA MEMÓRIA FISCAL';
    125: result := 'CARACTER REPETIDO NA CODIFICAÇÃO DO GT';
    126: result := 'VERSÃO JÁ GRAVADA NA MEMÓRIA FISCAL';
    127: result := 'ESTOURO DE CAPACIDADE NO CHEQUE';
    128: result := 'TIMEOUT NA LEITURA DO CHEQUE';
    129: result := 'MÊS INVÁLIDO';
    130: result := 'COORDENADA INVÁLIDA';
    131: result := 'SOBREPOSIÇÃO DE TEXTO';
    132: result := 'SOBREPOSIÇÃO DE TEXTO NO VALOR';
    133: result := 'SOBREPOSIÇÃO DE TEXTO NO EXTENSO';
    134: result := 'SOBREPOSIÇÃO DE TEXTO NO FAVORECIDO';
    135: result := 'SOBREPOSIÇÃO DE TEXTO NA LOCALIDADE';
    136: result := 'SOBREPOSIÇÃO DE TEXTO NO OPCIONAL';
    137: result := 'SOBREPOSIÇÃO DE TEXTO NO DIA';
    138: result := 'SOBREPOSIÇÃO DE TEXTO NO MÊS';
    139: result := 'SOBREPOSIÇÃO DE TEXTO NO ANO';
    140: result := 'USANDO MFD DE OUTRO ECF';
    141: result := 'PRIMEIRO DADO DIFERENTE DE ESC OU 1C';
    142: result := 'NÃO PERMITIDO ALTERAR SEM INTERVENÇÃO TÉCNICA';
    143: result := 'DADOS DA ÚLTIMA RZ CORROMPIDOS';
    144: result := 'COMANDO NÃO PERMITIDO NO MODO INICIALIZAÇÃO';
    145: result := 'AGUARDANDO ACERTO DE RELÓGIO';
    146: result := 'MFD JÁ INICIALIZADA PARA OUTRA MF';
    147: result := 'AGUARDANDO ACERTO DO RELÓGIO OU DESBLOQUEIO PELO TECLADO';
    148: result := 'VALOR FORMA DE PAGAMENTO MAIOR QUE MÁXIMO PERMITIDO';
    149: result := 'RAZÃO SOCIAL EM BRANCO';
    150: result := 'NOME DE FANTASIA EM BRANCO';
    151: result := 'ENDEREÇO EM BRANCO';
    152: result := 'ESTORNO DE CDC NÃO PERMITIDO';
    153: result := 'DADOS DO PROPRIETÁRIO IGUAIS AO ATUAL';
    154: result := 'ESTORNO DE FORMA DE PAGAMENTO NÃO PERMITIDO';
    155: result := 'DESCRIÇÃO FORMA DE PAGAMENTO IGUAL JÁ PROGRAMADA';
    156: result := 'ACERTO DE HORÁRIO DE VERÃO SÓ IMEDIATAMENTE APÓS RZ';
    157: result := 'IT NÃO PERMITIDA MF RESERVADA PARA RZ';
    158: result := 'SENHA CNPJ INVÁLIDA';
    159: result := 'TIMEOUT NA INICIALIZAÇÃO DA NOVA MF';
    160: result := 'NÃO ENCONTRADO DADOS NA MFD';
    161: result := 'SANGRIA OU SUPRIMENTO DEVEM SER ÚNICOS NO CNF';
    162: result := 'ÍNDICE DA FORMA DE PAGAMENTO NULO NÃO PERMITIDO';
    163: result := 'UF DESTINO INVÁLIDA';
    164: result := 'TIPO DE TRANSPORTE INCOMPATÍVEL COM UF DESTINO';
    165: result := 'DESCRIÇÃO DO PRIMEIRO ÍTEM DO BILHETE DE PASSAGEM DIFERENTE DE "TARIFA"';
    166: result := 'AGUARDANDO IMPRESSÃO DE CHEQUE OU AUTENTICAÇÃO';
    167: result := 'NÃO PERMITIDO PROGRAMAÇAO CNPJ IE COM ESPAÇOS EM BRANCO';
    168: result := 'NÃO PERMITIDO PROGRAMAÇÃO UF COM ESPAÇOS EM BRANCO';
    169: result := 'NÚMERO DE IMPRESSÕES DA FITA DETALHE NESTA INTERVENÇÃO TÉCNICA ESGOTADO';
    170: result := 'CF JÁ SUBTOTALIZADO';
    171: result := 'CUPOM NÃO SUBTOTALIZADO';
    172: result := 'ACRÉSCIMO EM SUBTOTAL JÁ EFETUADO';
    173: result := 'DESCONTO EM SUBTOTAL JÁ EFETUADO';
    174: result := 'ACRÉSCIMO NULO NÃO PERMITIDO';
    175: result := 'DESCONTO NULO NÃO PERMITIDO';
    176: result := 'CANCELAMENTO DE ACRÉSCIMO OU DESCONTO EM SUBTOTAL NÃO PERMITIDO';
    177: result := 'DATA INVÁLIDA';
    178: result := 'VALOR DO CHEQUE NULO NÃO PERMITIDO';
    179: result := 'VALOR DO CHEQUE INVÁLIDO';
    180: result := 'CHEQUE SEM LOCALIDADE NÃO PERMITIDO';
    181: result := 'CANCELAMENTO ACRÉSCIMO EM ÍTEM NÃO PERMITIDO';
    182: result := 'CANCELAMENTO DESCONTO EM ÍTEM NÃO PERMITIDO';
    183: result := 'NÚMERO MÁXIMO DE ÍTENS ATINGIDO';
    184: result := 'NÚMERO DE ÍTEM NULO NÃO PERMITIDO';
    185: result := 'MAIS QUE DUAS ALÍQUOTAS DIFERENTES NO BILHETE DE PASSAGEM NÃO PERMITIDO';
    186: result := 'ACRÉSCIMO OU DESCONTO EM ITEM NÃO PERMITIDO';
    187: result := 'CANCELAMENTO DE ACRÉSCIMO OU DESCONTO EM ITEM NÃO PERMITIDO';
    188: result := 'CLICHE JÁ IMPRESSO';
    189: result := 'TEXTO OPCIONAL DO CHEQUE EXCEDEU O MÁXIMO PERMITIDO';
    190: result := 'IMPRESSÃO AUTOMÁTICA NO VERSO NÃO PERMITIDO NESTE EQUIPAMENTO';
    191: result := 'TIMEOUT NA INSERÇÃO DO CHEQUE';
    192: result := 'OVERFLOW NA CAPACIDADE DE TEXTO DO COMPROVANTE DE CRÉDITO OU DÉBITO';
    193: result := 'PROGRAMAÇÃO DE ESPAÇOS ENTRE CUPONS MENOR QUE O MÍNIMO PERMITIDO';
    194: result := 'EQUIPAMENTO NÃO POSSUI LEITOR DE CHEQUE';
    195: result := 'PROGRAMAÇÃO DE ALÍQUOTA COM VALOR NULO NÃO PERMITIDO';
    196: result := 'PARÂMETRO BAUD RATE INVÁLIDO';
    197: result := 'CONFIGURAÇÃO PERMITIDA SOMENTE PELA PORTA DOS FISCO';
    198: result := 'VALOR TOTAL DO ITEM EXCEDE 11 DÍGITOS';
    199: result := 'PROGRAMAÇÃO DA MOEDA COM ESPAÇOS EM BRACO NÃO PERMITIDO';
    200: result := 'CASAS DECIMAIS DEVEM SER PROGRAMADAS COM 2 OU 3';
    201: result := 'NÃO PERMITE CADASTRAR USUÁRIOS DIFERENTES NA MESMA MFD';
    202: result := 'IDENTIFICAÇÃO DO CONSUMIDOR NÃO PERMITIDA PARA SANGRIA OU SUPRIMENTO';
    203: result := 'CASAS DECIMAIS EM QUANTIDADE MAIOR DO QUE A PERMITIDA';
    204: result := 'CASAS DECIMAIS DO UNITÁRIO MAIOR DO QUE O PERMITIDA';
    205: result := 'POSIÇÃO RESERVADA PARA ICMS';
    206: result := 'POSIÇÃO RESERVADA PARA ISS';
    207: result := 'TODAS AS ALÍQUOTAS COM A MESMA VINCULAÇÃO NÃO PERMITIDO';
    208: result := 'DATA DE EMBARQUE ANTERIOR A DATA DE EMISSÃO';
    209: result := 'ALÍQUOTA DE ISS NÃO PERMITIDA SEM INSCRIÇÃO MUNICIPAL';
    210: result := 'RETORNO PACOTE CLICHE FORA DA SEQUÊNCIA';
    211: result := 'ESPAÇO PARA ARMAZENAMENTO DO CLICHE ESGOTADO';
    212: result := 'CLICHE GRÁFICO NÃO DISPONÍVEL PARA CONFIRMAÇÃO';
    213: result := 'CRC DO CLICHE GRÁFICO DIFERENTE DO INFORMADO';
    214: result := 'INTERVALO INVÁLIDO';
    215: result := 'USUÁRIO JÁ PROGRAMADO';
    217: result := 'DETECTADA ABERTURA DO EQUIPAMENTO';
    218: result := 'CANCELAMENTO DE ACRÉSCIMO/DESCONTO NÃO PERMITIDO';

  end;
end;


procedure TFAliquotasImpressora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MeICMS.Clear;
  MeISS.Clear;
end;

procedure TFAliquotasImpressora.Action1Execute(Sender: TObject);
begin
  FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

end.
