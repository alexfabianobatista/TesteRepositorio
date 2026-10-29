    unit URBloqueto_Sicoob;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, Barcode, ExtCtrls, QRPDFFilt;

type
  TFRBloqueto_Sicoob = class(TForm)
    QRPrimario: TQuickRep;
    QRBand2: TQRBand;
    Barcode1: TBarcode;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRDBText18: TQRDBText;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRLabel66: TQRLabel;
    QRImage2: TQRImage;
    QRDBText19: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText27: TQRDBText;
    QRLabel67: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel70: TQRLabel;
    QRMemo1: TQRMemo;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRLabel1: TQRLabel;
    QRImage3: TQRImage;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel33: TQRLabel;
    QRImage1: TQRImage;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel71: TQRLabel;
    QRMemo2: TQRMemo;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel72: TQRLabel;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRSysData6: TQRSysData;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRLabel98: TQRLabel;
    QRDBText37: TQRDBText;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRLabel100: TQRLabel;
    QRImage4: TQRImage;
    QRDBText38: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRLabel101: TQRLabel;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRLabel104: TQRLabel;
    QRMemo3: TQRMemo;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRLabel105: TQRLabel;
    QRShape56: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel103: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel121: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel120: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel122: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel106: TQRLabel;
    QRDBText39: TQRDBText;
    QRLabel109: TQRLabel;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    wstrNossoNumero : String;

    function RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
    function Intdecimais(wValor :String; wTamanho, wDecimais:integer): String;
    function CalculaDVMod10(wstrCampo: String):String;
    function FatorVenc():String;
    function DACMod11(wS:String):String;
    function DvNossoNumero(wS:String):string;


  public
    { Public declarations }
  end;

var
  FRBloqueto_Sicoob: TFRBloqueto_Sicoob;

implementation

uses UContasReceber_cl, USequencia_cl, UOracle_cl, clipbrd,
  UBiblioteca,Mask, URBloquetoSafra, UParamSistema_cl, UContasReceberParam,
  DB;

{$R *.dfm}

procedure TFRBloqueto_Sicoob.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  wstrAux, wstrCampoLivre, wstrCodBarras, wstrLinhaDigitavel, www, wNN,
  wNossoNumero, wstrAux2, wDvNossoNumero, dvCodBarras : String;
  wDesconto, wauxdesc : Real;
  
begin

  With DMContasReceber do
  begin
    // ACEITE
    If (DMContasReceber.QRBloquetoIND_ACEITE.Text = 'SIM') or
       (DMParamSistema.QParamSistemaIND_ACEITE_CR.Text = 'N') then
    Begin
      QRLabel36.Caption:= 'S';
      QRLabel103.Caption:= 'S';
      QRLabel69.Caption:= 'S';
    End
    Else
    Begin
      QRLabel36.Caption:= 'N';
      QRLabel103.Caption:= 'N';
      QRLabel69.Caption:= 'N';
    End;

    // Uso do Banco
    QRLabel110.Caption := '';
    QRLabel112.Caption := '';

    // Desconto
    QRLabel119.Caption := '0,00';
    QRLabel121.Caption := '0,00';
    QRLabel123.Caption := '0,00';   

    // Sacador/Avalista
    QRLabel115.Caption := '';
    QRLabel35.Caption:= '';
    QRLabel31.Caption := '';

    //Agencia/Código beneficiário
    QRLabel25.Caption := RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4) + '/' +
                         RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text,2)+
                         '/' + RMaskCGC_CPF(QRBloquetoCODIGO_CEDENTE.Text,6) + QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text;
    QRLabel59.Caption := QRLabel25.Caption;
    QRLabel94.Caption := QRLabel25.Caption;

    if dmcontasreceber.QRBloquetoPERC_DESCONTO.Value > 0 then //Vanessa 19/11/2015
    begin
      wDesconto := ((QRBloquetoVAL_TITULO.Value * QRBloquetoPERC_DESCONTO.Value)/100);
      QRLabel119.Caption := FormatFloat('#,##0.00',wDesconto);
      QRLabel121.Caption := FormatFloat('#,##0.00',wDesconto);
      QRLabel123.Caption := FormatFloat('#,##0.00',wDesconto)
    end
    else
    begin
      QRDBText7.Caption := '0,00';
      QRLabel121.Caption := FormatFloat('#,##0.00',wDesconto);
      QRLabel123.Caption := FormatFloat('#,##0.00',wDesconto);
    end;
      
   if QRBloquetoNOSSO_NUMERO.Text = '' then
   begin

   if ((DMParamSistema.QParamSistemaIND_SICOOB_BANCOOB.Text = 'N') and
      (DMParamSistema.QParamSistemaIND_SICOOB_BRADESCO.Text = 'N')and
      (DMParamSistema.QParamSistemaIND_SICOOB_BANCOOB_CNAB240.Text = 'S')) then
      wNossoNumero := IntToStr(DMSequencia.Sequencia(QRBloquetoCOD_FILIAL.Value,'ARQ_REM_SICOOB_240'))
   else
      wNossoNumero := IntToStr(DMSequencia.Sequencia(QRBloquetoCOD_FILIAL.Value,'NossoNumero_SICOOB'));

      if QRBloquetonosso_numero_seq.Value > 9999999 then
      begin
        MessageDlg('Sequencia Nosso Número deve ser inicializada, sequencia atingiu valor maximo!!!',mtWarning,[mbOk],0);
        QRPrimario.QRPrinter.Cancel;
        Exit;
      end;
      wstrNossoNumero := '';
      wstrCampoLivre := '';
      wstrCodBarras := '';
      wstrLinhaDigitavel := '';
      wstrAux := '';
      wstrAux2 := '';
      wDvNossoNumero := '';
      dvCodBarras := '';

      QRBloquetonosso_numero_seq.Value := StrToInt(RMaskCGC_CPF(wNossoNumero,8));
      wstrNossoNumero := IntDecimais(QRBloquetonosso_numero_seq.Text,5,0);

      wstrNossoNumero := FormatDateTime('YY', QRBloquetoDT_VENCIMENTO.Value) + wstrNossoNumero;

      //dados para calcula Dv do nosso número
      wstrAux2 := Intdecimais(QRBloquetoCOD_AGENCIA.Text,4,0) +
                  //Intdecimais(QRBloquetoNUM_CONTA_CORRENTE.Text, 10,0) +
                  Intdecimais(QRBloquetoCODIGO_CEDENTE.Text, 9,0) +
                  Intdecimais(QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text, 1,0) +
                  Intdecimais(wstrNossoNumero,7,0);
      Insert(DvNossoNumero(wstrAux2), wstrNossoNumero, 8);

   end else
   begin // Copia de Bloqueto
      wstrNossoNumero := Copy(QRBloquetoNOSSO_NUMERO.Value, 1, QRBloquetoNOSSO_NUMERO.Size);
   end;

    wstrCampoLivre := RMaskCGC_CPF(QRBloquetoCARTEIRA.Text,1)                     +
                      RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4)                  +
                      IntDecimais(QRBloquetoCOD_FORMA_CADAST_BANCO.Text,2,0)      +
                      //RMaskCGC_CPF(Copy(QRBloquetoNUM_CONTA_CORRENTE.Text,1,7),7) +   Mudei 23/11/2015 - Vanessa
                      RMaskCGC_CPF(Copy(QRBloquetoCODIGO_CEDENTE.Text,1,6),6)     +
                      RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text,1)   +
                      IntDecimais(wstrNossoNumero,8,0)                            +
                      RMaskCGC_CPF(QRBloquetoNUM_PARCELA.Text,3);

    wstrCampoLivre :=Bib.LimpaString(wstrCampoLivre,'-');

    // NOSSO NUMERO
    QRLabel70.Caption := wstrNossoNumero;
    QRLabel71.Caption := wstrNossoNumero;
    QRLabel104.Caption := wStrNossoNumero;

    wstrCodBarras := '7569' + FatorVenc() + IntDecimais(QRBloquetoVAL_TITULO.Text,10,2) +
       wstrCampoLivre;

    //LINHA DIGITAVEL
    wstrAux := '7569' + Copy(wstrCampoLivre,1,5); //carteira e agencia
    wstrLinhaDigitavel := wstrAux + CalculaDVMod10(wstrAux); //dv campo 1

    wstrLinhaDigitavel := wstrLinhaDigitavel +
      Copy(wstrCampoLivre,6,2) + //modalidade
      Copy(wstrCampoLivre,8,7) + // cod cliente
      Copy(wstrCampoLivre,15,1)+ // primeiro digito nn
      CalculaDVMod10(Copy(wstrCampoLivre,6,10)); //dv campo 2

    wstrLinhaDigitavel := wstrLinhaDigitavel +
      Copy(wstrCampoLivre,16,7) + //restante nn
      Copy(wstrCampoLivre,23,3) + //parcela
      CalculaDVMod10(Copy(wstrCampoLivre,16,10)); //dv campo 3

    wstrLinhaDigitavel := wstrLinhaDigitavel + DACMod11(copy(wstrCodBarras,1,43)); //dv cod barras

    wstrLinhaDigitavel := wstrLinhaDigitavel +
      RMaskCGC_CPF(FatorVenc(),4) + //fator vencimento
      RMaskCGC_CPF(FloatToStr(QRBloquetoVAL_TITULO.Value * 100),10); //val titulo

    dvCodBarras := DACMod11(copy(wstrCodBarras,1,43));
    wstrCodBarras := copy(wstrCodBarras,1,4) + dvCodBarras + copy(wstrCodBarras,5,43);

    //mascara linha digitavel
    Insert('.',wstrLinhaDigitavel,6);
    Insert(' ',wstrLinhaDigitavel,12);
    Insert('.',wstrLinhaDigitavel,18);
    Insert(' ',wstrLinhaDigitavel,25);
    Insert('.',wstrLinhaDigitavel,31);
    Insert(' ',wstrLinhaDigitavel,38);
    Insert(' ',wstrLinhaDigitavel,40);

    QRMemo1.Lines.Clear;
    QRMemo2.Lines.Clear;
    QRMemo3.Lines.Clear;

    If (DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.Value <> 0) Then
      QRMemo1.Lines.Add(DMContasReceber.QRBloquetoinstrucao_juro.Text);

    QRMemo1.Lines.Append( Trim(DMContasReceber.QRBloquetoDESC_INSTRUCAO_BLOQUETO.Text));
    QRMemo2.Lines := QRMemo1.Lines;
    QRMemo3.Lines := QRMemo1.Lines;

    QRLabel64.Caption := wstrLinhaDigitavel;
    Barcode1.Digits := wstrCodBarras;
    Barcode1.BarcodeCopy;
    QRImage3.Picture.Assign(ClipBoard);
  end;
end;

function TFRBloqueto_Sicoob.RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
var S : string;
    x : integer;
begin
  for x := 1 to length(wCgc1) do
    if wCgc1[x] in ['0','1','2','3','4','5','6','7','8','9'] then
       S := S + wCgc1[x];

  while Length(S) < Zeros do
      S := '0' + S;

  Result := S;
end;

Function TFRBloqueto_Sicoob.Intdecimais(wValor :String; wTamanho, wDecimais:integer): String;
var
  C, Cont, Posicao :integer;
  Res, Aux :String;
begin
  for Cont := 1 to wTamanho do
    Aux := '0' + Aux;

  If wValor <> '' then
  Begin
    Str(StrToFloat(Trim(wValor)):wTamanho:wDecimais, Res);

    while Pos(' ', Res) > 0 do
      Res[Pos(' ', Res)] := '0';

    while Pos('.', Res) > 0 do
    Begin
      Posicao:= Pos('.', Res);
      Delete(Res,Posicao,1);
    End;

  C := Length(Res);
  for Cont:= wTamanho downto 1 do
  Begin
    Aux[Cont] := Res[C];
    Dec(C,1);
    If C < 1 then
      Break;
  End;

  End;
  Res:= Aux;
  Result := Res;
End;

function TFRBloqueto_Sicoob.FatorVenc():String;
Begin
  if DMContasReceber.QRBloquetoDT_VENCIMENTO.Value > StrToDate('22/02/2025') then  // Em 22/02/2025 o fator de vcto zerá resetado para inicial 1000
    Result := FloatToStr(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value - StrToDate('29/05/2022') )
  else
    Result := FloatToStr(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value - StrToDate('07/10/1997') );
End;

function TFRBloqueto_Sicoob.DACMod11(wS:String):String;
var
  wTam, wCont, wNN : Integer;
Begin
  wNN := 0;
  wCont := 2;
  For wTam:=Length(wS) DownTo 1 do
  Begin
    wNN := wNN + StrToInt(wS[wTam]) * wCont;
    Inc(wCont);
    If wCont > 9 Then
      wCont := 2;
  End;
    wNN := 11 - (wNN mod 11);
  If  (wNN=10) or (wNN=1) or (wNN=0) or (wNN=11)Then
    Result := '1'
  Else
    Result := IntToStr(wNN);
End;

function TFRBloqueto_Sicoob.DvNossoNumero(wS:String):String;
var
  wTam, i, somatorio, algarismo1, resto, dv: integer;
  wSomaMultiplicacao: array of Integer;
  const
  wConstante : array[1..21] of integer = (3,1,9,7,3,1,9,7,3,1,9,7,3,1,9,7,3,1,9,7,3);
begin
  SetLength(wSomaMultiplicacao, length(ws)); //declaracao array  length retorna o tam do array

  for i := 0 to length(ws) -1 do //limpa a wSomaMultiplicacao
    wSomaMultiplicacao[i] := 0;

  i := 21;
  somatorio := 0;

  for wTam:=Length(wS) -1 downto 0 do //downto decrementa
    begin
      wsomamultiplicacao[wTam] := wsomamultiplicacao[wTam] + strtoint(wS[wTam+1]) * wConstante[i];
      i := i-1;
      somatorio := somatorio + wsomamultiplicacao[wTam];
    end;

    resto := (somatorio mod 11);
    dv := 11 - resto;

    if (resto = 0) or (resto = 1) then
      Result := '0'
    else
    if (dv = 10) or (dv = 11) then
      Result := '1'
    else
      Result := inttostr(dv);
end;

function TFRBloqueto_Sicoob.CalculaDVMod10(wstrCampo: String):String;
var
  wintC, wintDAC, wintPrimMult: Integer;
  wintValor: array of Integer;
Begin
  wintDAC := 0;
  wintPrimMult := 2;
  SetLength(wintValor, Length(wstrCampo));

  for wintC := Length(wstrCampo)-1 downto 0 do
  Begin
    wintValor[wintC] := StrToInt(wstrCampo[wintC+1]); //a matriz de inteiros começa em 0
                                       //string começa por 1
    wintValor[wintC] := wintValor[wintC] * wintPrimMult;
    If wintPrimMult = 1 then
      wintPrimMult := 2
    Else
      wintPrimMult := 1;

    If wintValor[wintC] < 10 then           //wintDAC faz a soma dos algarismos
      wintDAC:= wintDAC + wintValor[wintC]
    Else
      wintDAC:= wintDAC + wintValor[wintC] - 9;
  End;

  wintDAC := 10 - (wintDAC Mod 10);
  If wintDAC = 10 then
    Result := '0'
  Else
    Result := IntToStr(wintDAC);
End;


procedure TFRBloqueto_Sicoob.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
 with DMContasReceber do
  begin
  if QRBloquetoNOSSO_NUMERO.Text = '' then
  Begin
    try
      If DMOracle.DBCemapa.InTransaction = False then
         DMOracle.DBCemapa.StartTransaction;
      if QRBloquetoNUM_TITULO.Value = 0 then
      Begin
        QRBloquetoPeriodo.Close;
        QRBloquetoPeriodo.SetVariable('COD_BANCO_AGENCIA',Trim(FContasReceberParam.ME36Banco.Text));
        QRBloquetoPeriodo.SetVariable('COD_CONTA_CORRENTE',Trim(FContasReceberParam.ME36ContaCorrente.Text));
        QRBloquetoPeriodo.SetVariable('COD_FILIAL',Trim(FContasReceberParam.ME36Filial.Text));
        QRBloquetoPeriodo.SetVariable('COD_CADASTRO',QRBloquetoCOD_CADASTRO.Text);
        QRBloquetoPeriodo.SetVariable('DT_INICIAL',Trim(FContasReceberParam.ME36DtInicial.Text));
        QRBloquetoPeriodo.SetVariable('DT_FINAL',Trim(FContasReceberParam.ME36DtFinal.Text));
        QRBloquetoPeriodo.Open;
        QRBloquetoPeriodo.First;
        while not QRBloquetoPeriodo.Eof do
        Begin
          QAtuBloq.Close;
          QAtuBloq.SetVariable('NUMERO', Bib.StrZero(wstrNossoNumero,8));
          QAtuBloq.SetVariable('COD_CONTA_RECEBER_CAB',QRBloquetoPeriodoCOD_CONTA_RECEBER_CAB.Value);
          QAtuBloq.ExecSQL;
          QRBloquetoPeriodo.Next;
        end;
      end
      else
      Begin
        QAtuBloq.Close;
        QAtuBloq.SetVariable('NUMERO', Bib.StrZero(wstrNossoNumero,8));
        QAtuBloq.SetVariable('COD_CONTA_RECEBER_CAB',QRBloquetoCOD_CONTA_RECEBER_CAB.Value);
        QAtuBloq.ExecSQL;
      end;

      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      raise exception.Create('Erro ao tentar gravar Nosso Numero no Contas a Receber!');
    end;
  end;
  end;
end;

end.
