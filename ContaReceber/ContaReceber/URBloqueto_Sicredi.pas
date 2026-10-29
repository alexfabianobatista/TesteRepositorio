unit URBloqueto_Sicredi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, Barcode, ExtCtrls, Clipbrd, jpeg;

type
  TFRBloqueto_Sicredi = class(TForm)
    QRPrimario: TQuickRep;
    QRBand2: TQRBand;
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
    QRLabel27: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
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
    QRDBText18: TQRDBText;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRLabel66: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText27: TQRDBText;
    QRLabel67: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel70: TQRLabel;
    QRMemo1: TQRMemo;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
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
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
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
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel71: TQRLabel;
    QRMemo2: TQRMemo;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
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
    QRLabel32: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
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
    QRSysData5: TQRSysData;
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
    QRDBText38: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRLabel101: TQRLabel;
    QRDBText45: TQRDBText;
    QRDBText47: TQRDBText;
    QRLabel104: TQRLabel;
    QRMemo3: TQRMemo;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRShape56: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel99: TQRLabel;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRImage4: TQRImage;
    QRDBText5: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    Barcode1: TBarcode;
    QRDBText15: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText39: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel35: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    function NossoNumero(wDACMod11:String):String;
    function FatorVenc():String;
    function DVMod10(wS:String):String;
    function DACMod11(wS,wAproveitamento:String):String;
    function DVGeral(wCampoLivre:String):String;
  public
    { Public declarations }
  end;

var
  FRBloqueto_Sicredi: TFRBloqueto_Sicredi;

implementation

uses UContasReceber_cl, USequencia_cl, UOracle_cl, UBiblioteca,
  UParamSistema_cl;

{$R *.DFM}

function intdecimais(wValor :String; wTamanho, wDecimais:integer): String;
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

function RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
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


//-GERACAO DO NOSSO NUMERO PAG.8----------------------------------------------\\
function TFRBloqueto_Sicredi.NossoNumero(wDACMod11:String):String;
var
  wS : String;
Begin
  wS := '';
  wS := FormatDateTime('yy', Date);
  wS := wS + '3' + RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetonosso_numero_seq.Text),5 )  + wDACMod11;
  Result := wS;
End;


//-DIGITO VERIFICADOR GERAL BANCO SICREDI PAGINA 32---------------------------\\
function TFRBloqueto_Sicredi.FatorVenc():String;
Begin
  Result := FloatToStr(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value - StrToDate('07/10/1997') );
End;


//-DIGITO VERIFICADOR MODULO 10-----------------------------------------------\\
function TFRBloqueto_Sicredi.DVMod10(wS:String):String;
var
  //wDV : String;
  wAux, wTam, wMult, wDV : Integer;
Begin
  wDV := 0;
  wMult := 2;
  For wTam:=Length(wS) DownTo 1 Do
  Begin
    wAux := wMult * StrToInt(wS[wTam]);
    If wAux<10 Then
      wDV := wDV + wAux
    Else
      wDV := wDV + (wAux - 9);
    If wMult = 2 Then
      wMult := 1
    Else
      wMult := 2;
  End;
  wDV := 10 - (wDV mod 10);
  If wDV = 10 Then
    wDV := 0;
  Result := IntToStr(wDV);
End;


//-DIGITO VERIFICADOR MODULO 11-----------------------------------------------\\
function TFRBloqueto_Sicredi.DACMod11(wS,wAproveitamento:String):String;
var
  wTam, wCont, wNN, wDig : Integer;
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
  wDig := (wNN Mod 11);
  If (wAproveitamento = 'S') And (wDig <= 1) Then // para calculo do dv do campo livre resto 0 ou 1 digito é 0
     wDig := 0
  Else
   Begin
     wDig := 11 - wDig;
     If wDig > 9 Then
        wDig := 0;
   End;
  Result := IntToStr(wDig);
End;

//-DIGITO VERIFICADOR GERAL---------------------------------------------------\\
function TFRBloqueto_Sicredi.DVGeral(wCampoLivre:String):String;
var
  wTam, wCont, wDV: Integer;
  wS : String;
Begin
  wDV := 0;
  wS := '';
  wS := '7489' + FatorVenc() + intdecimais(  Trim(DMContasReceber.QRBloquetoVAL_TITULO.Text),10,2 ) + wCampoLivre;
  wCont := 2;
  For wTam:=Length(wS) DownTo 1 do
  Begin
    wDV := wDV + StrToInt(wS[wTam]) * wCont;
    Inc(wCont);
    If wCont > 9 Then
      wCont := 2;
  End;
  wDV := 11 - (wDV mod 11);
  If (wDV=0) OR (wDV=1) OR (wDV>9) Then
    wDV := 1;
  Insert( IntToStr(wDV), wS, 5 );
  Result := wS;
End;


//----------------------------------------------------------------------------\\
procedure TFRBloqueto_Sicredi.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  wLinhaDig, wAux,wAuxVerificador, wDgAgencia : String;
  wCampoLivre, wNN, wDVGeral      : String;
  wDesconto : Real;
begin
  wAux := '';
  wDVGeral := '';
  wCampoLivre := '';
  wNN := '';
  wLinhaDig := '';

  With DMContasReceber do
  Begin
    If QRBloquetoPERC_DESCONTO.Value > 0 Then
     Begin
       wDesconto := ((QRBloquetoVAL_TITULO.Value * QRBloquetoPERC_DESCONTO.Value) / 100);
       QRLabel119.Caption := FormatFloat('#,##0.00',wDesconto);
       QRLabel31.Caption := FormatFloat('#,##0.00',wDesconto);
       QRLabel35.Caption := FormatFloat('#,##0.00',wDesconto);
     end
    else
    Begin
      QRLabel119.Caption := '0,00';
      QRLabel31.Caption := '0,00';
      QRLabel35.Caption := '0,00';
    end;
  If QRBloquetoNOSSO_NUMERO.Text = '' then
  Begin
    try
      QRBloquetonosso_numero_seq.Value:=
      DMSequencia.Sequencia(QRBloquetoCod_Filial.Value,'NossoNumero_SICREDI');
      if QRBloquetonosso_numero_seq.Value >= 99999 then
      begin
        MessageDlg('Sequencia Nosso Número deve ser inicializada, sequencia atingiu valor máximo!!!',mtWarning,[mbOk],0);
        QRPrimario.QRPrinter.Cancel;
        Exit;
      end;
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL' Then // para foz do iguacu o digito é 46
        wDgAgencia := '46'
      Else
      if ((DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS') or
          (DMParamSistema.QParamSistemaCod_Empresa.Value = 'NIR') or
          (DMParamSistema.QParamSistemaCod_Empresa.Value = 'LANGE') or
         (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE'))  Then // para cgs o digito é 41
        wDgAgencia := '41'
      else
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASMIL' Then // para grasmil o digito é 02
        wDgAgencia := '02'
      else
      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'INSIDE' Then // para INSIDE o digito é 60
        wDgAgencia := '60'
      else
        wDgAgencia := RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text),2 );

      wNN := RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetoCOD_AGENCIA.Text),4 )                     +
             wDgAgencia                                                                             +
             RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetoCODIGO_CEDENTE.Text),5 )                  +
             FormatDateTime('yy', Date) + '3'                                                       +
             RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetonosso_numero_seq.Text),5 );
      wNN := NossoNumero(DACMod11(wNN,'N'));

      //-CAMPO LIVRE----------------------------------------------------------\\
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL' Then // para foz do iguacu o digito é 46
        wAuxVerificador:= '46'
      Else
      if ((DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS') or
          (DMParamSistema.QParamSistemaCod_Empresa.Value = 'NIR') or
          (DMParamSistema.QParamSistemaCod_Empresa.Value = 'LANGE') or
          (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE'))  Then // para cgs o digito é 41
        wAuxVerificador:= '41'
      Else
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASMIL' Then // para grasmil o digito é 02
        wAuxVerificador:= '02'
      Else
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'INSIDE' Then // para INSIDE o digito é 60
        wAuxVerificador:= '60'
      Else
        wAuxVerificador:=Copy(DMContasReceber.QRBloquetoCOD_AGENCIA.Text,4,1)+
                          Trim(DMContasReceber.QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text);
      wCampoLivre := '31' + wNN + RMaskCGC_CPF(Copy(DMContasReceber.QRBloquetoCOD_AGENCIA.Text,1,3),4)   +
                     RMaskCGC_CPF( Trim(wAuxVerificador),2)    +
                     RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetoCODIGO_CEDENTE.Text),5)                +
                     '10';
      wCampoLivre := wCampoLivre + DACMod11(wCampoLivre,'S');

      wDVGeral := DVGeral(wCampoLivre);

      //-LINHA DIGITAVEL------------------------------------------------------\\
      wAux := '7489' + Copy(wCampoLivre,1,5);
      wAux := wAux + DVMod10(wAux);
      wLinhaDig := wLinhaDig + wAux + ' ';
      Insert('.',wLinhaDig,6);

      wAux := Copy(wCampoLivre,6,10);
      wAux := wAux + DVMod10(wAux);
      wLinhaDig := wLinhaDig + wAux + ' ';
      Insert('.',wLinhaDig,18);

      wAux := Copy(wCampoLivre,16,10);
      wAux := wAux + DVMod10(wAux);
      wLinhaDig := wLinhaDig + wAux + ' ';
      Insert('.',wLinhaDig,31);

      wLinhaDig := wLinhaDig + Copy(wDVGeral,5,1) + ' ';
      wLinhaDig := wLinhaDig + FatorVenc() + intdecimais( Trim(DMContasReceber.QRBloquetoVAL_TITULO.Text),10,2);

      QRLabel64.Caption := wLinhaDig;

      //-CODIGO DE BARRAS-----------------------------------------------------\\
      Barcode1.Digits := wDVGeral;
      Barcode1.BarcodeCopy;
      QRImage3.Picture.Assign(ClipBoard);

      //-AGENCIA/CEDENTE------------------------------------------------------\\
      wAux:=Copy(DMContasReceber.QRBloquetoCOD_AGENCIA.Text,1,3);
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL' Then   // para foz do iguacu o digito é 46
        wAuxVerificador:= '46'
      Else
      if ((DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS') or
          (DMParamSistema.QParamSistemaCod_Empresa.Value = 'NIR') or
          (DMParamSistema.QParamSistemaCod_Empresa.Value = 'LANGE') or
         (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE'))  Then // para cgs o digito é 41
        wAuxVerificador:= '41'
      Else
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASMIL' Then   // para GRASMIL o digito é 02
        wAuxVerificador:= '02'
      Else
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'INSIDE' Then   // para INSIDE o digito é 60
        wAuxVerificador:= '60'
      Else
        wAuxVerificador:=Copy(DMContasReceber.QRBloquetoCOD_AGENCIA.Text,4,1)+
                          Trim(DMContasReceber.QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text);
      wAux := RMaskCGC_CPF(Trim(wAux),4) + '.' +
              RMaskCGC_CPF(wAuxVerificador,2) + '/' +
              RMaskCGC_CPF(Trim(DMContasReceber.QRBloquetoCODIGO_CEDENTE.Text),5);
      QRLabel25.Caption := wAux;
      QRLabel59.Caption := wAux;
      QRLabel94.Caption := wAux;

      //-NOSSO NUMERO---------------------------------------------------------\\
      wAux := wNN;
      Insert('/', wAux, 3);
      Insert('-', wAux, 10);
      QRLabel71.Caption := wAux;
      QRLabel70.Caption := wAux;
      QRLabel104.Caption := wAux;

      //-LOCAL DE PAGAMENTO---------------------------------------------------\\
      QRLabel68.Caption := 'PAGÁVEL PREFERENCIALMENTE NAS COOPERATIVAS DE CRÉDITO DO SICREDI';
      QRLabel72.Caption := 'PAGÁVEL PREFERENCIALMENTE NAS COOPERATIVAS DE CRÉDITO DO SICREDI';
      QRLabel99.Caption := 'PAGÁVEL PREFERENCIALMENTE NAS COOPERATIVAS DE CRÉDITO DO SICREDI';

      //-INSTRUCOES DE PAGAMENTO----------------------------------------------\\
      wAux := '';
{      If( Trim(DMContasReceber.QRBloqueto IND_TIPO_JURO.Text) = 'VALOR' )Then
        wAux := FormatFloat('#,##0.00',DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.Value)
      Else
        wAux := FormatFloat('#,##0.00',(DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.Value * DMContasReceber.QRBloquetoVAL_TITULO.Value / 100));
}     QRMemo1.Lines.Clear;
      QRMemo1.Lines.Add(DMContasReceber.QRBloquetoinstrucao_juro.Text);
      QRMemo1.Lines.Append( Trim(DMContasReceber.QRBloquetoDESC_INSTRUCAO_BLOQUETO.Text));
      //pedido pelo luister (nos parametros do relatorios é informado o codigo da mensagem que deve sair no campo de instrucoes)
      wAux := '';
      if DMContasReceber.pCodMensagem > 0 then
        wAux := DMOracle.BuscaNome('SELECT DESC_MENSAGEM FROM TB_MENSAGEM', 'COD_MENSAGEM = ' + IntToStr(DMContasReceber.pCodMensagem));
      if wAux <> '' then
        QRMemo1.Lines.Add(wAux);
      QRMemo2.Lines := QRMemo1.Lines;
      QRMemo3.Lines := QRMemo1.Lines;

      //-ACEITE---------------------------------------------------------------\\
      If Trim(DMContasReceber.QRBloquetoIND_ACEITE.Text) = 'SIM' Then
       Begin
        QRLabel36.Caption := 'SIM';
        QRLabel69.Caption := 'SIM';
        QRLabel103.Caption := 'SIM';
       End
      Else
       Begin
        QRLabel36.Caption := 'NÃO';
        QRLabel69.Caption := 'NÃO';
        QRLabel103.Caption := 'NÃO';
       End
      //-VENCIMENTO-----------------------------------------------------------\\

    except
      on E : Exception do
        ShowMessage(E.Message);
    end;

    with DMContasReceber do
    begin
    try
      If DMOracle.DBCemapa.InTransaction = False then
         DMOracle.DBCemapa.StartTransaction;
      QAtuBloq.Close;
      QAtuBloq.SetVariable('NUMERO', Bib.StrZero(wNN,9));
      QAtuBloq.SetVariable('COD_CONTA_RECEBER_CAB',QRBloquetoCOD_CONTA_RECEBER_CAB.Value);
      QAtuBloq.ExecSQL;

      //QEnviadoBanco.Close;
      //QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',QRBloquetoCOD_CONTA_RECEBER_CAB.Value);
      //QEnviadoBanco.ExecSQL;

      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      raise exception.Create('Erro ao tentar gravar Nosso Numero no Contas a Receber!');
    end;
    end;
    end

    else
    Begin //COPIA DO BLOQUETO MARCOS

      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL' Then // para foz do iguacu o digito é 46
         wDgAgencia := '46'
      Else
      if ((DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS') or
          (DMParamSistema.QParamSistemaCod_Empresa.Value = 'NIR') or
          (DMParamSistema.QParamSistemaCod_Empresa.Value = 'LANGE') or
         (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE'))  Then // para cgs o digito é 41
        wAuxVerificador:= '41'
      Else
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASMIL' Then // para grasmil o digito é 02
        wAuxVerificador := '02'
      else
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'INSIDE' Then   // para INSIDE o digito é 60
        wAuxVerificador:= '60'
      Else
         wDgAgencia := RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text),2 );

       wNN := QRBloquetoNOSSO_NUMERO.Value;
      //-CAMPO LIVRE----------------------------------------------------------\\
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL' Then // para foz do iguacu o digito é 46
         wAuxVerificador:= '46'
      Else
      if ((DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS') or
          (DMParamSistema.QParamSistemaCod_Empresa.Value = 'NIR') or
          (DMParamSistema.QParamSistemaCod_Empresa.Value = 'LANGE') or
         (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE'))  Then // para cgs o digito é 41
        wAuxVerificador:= '41'
      Else
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASMIL' Then   // para grasmil o digito é 02
        wAuxVerificador:= '02'
      Else
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'INSIDE' Then   // para INSIDE o digito é 60
        wAuxVerificador:= '60'
      Else
        wAuxVerificador:=Copy(DMContasReceber.QRBloquetoCOD_AGENCIA.Text,4,1)+
                            Trim(DMContasReceber.QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text);
      wCampoLivre := '31' + wNN + RMaskCGC_CPF(Copy(DMContasReceber.QRBloquetoCOD_AGENCIA.Text,1,3),4)   +
                     RMaskCGC_CPF( Trim(wAuxVerificador),2)    +
                     RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetoCODIGO_CEDENTE.Text),5)                +
                     '10';
      wCampoLivre := wCampoLivre + DACMod11(wCampoLivre,'S');

      wDVGeral := DVGeral(wCampoLivre);

      //-LINHA DIGITAVEL------------------------------------------------------\\
      wAux := '7489' + Copy(wCampoLivre,1,5);
      wAux := wAux + DVMod10(wAux);
      wLinhaDig := wLinhaDig + wAux + ' ';
      Insert('.',wLinhaDig,6);

      wAux := Copy(wCampoLivre,6,10);
      wAux := wAux + DVMod10(wAux);
      wLinhaDig := wLinhaDig + wAux + ' ';
      Insert('.',wLinhaDig,18);

      wAux := Copy(wCampoLivre,16,10);
      wAux := wAux + DVMod10(wAux);
      wLinhaDig := wLinhaDig + wAux + ' ';
      Insert('.',wLinhaDig,31);

      wLinhaDig := wLinhaDig + Copy(wDVGeral,5,1) + ' ';
      wLinhaDig := wLinhaDig + FatorVenc() + intdecimais( Trim(DMContasReceber.QRBloquetoVAL_TITULO.Text),10,2);

      QRLabel64.Caption := wLinhaDig;

      //-CODIGO DE BARRAS-----------------------------------------------------\\
      Barcode1.Digits := wDVGeral;
      Barcode1.BarcodeCopy;
      QRImage3.Picture.Assign(ClipBoard);

      //-AGENCIA/CEDENTE------------------------------------------------------\\
      wAux:=Copy(DMContasReceber.QRBloquetoCOD_AGENCIA.Text,1,3);
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL' Then   // para foz do iguacu o digito é 46
         wAuxVerificador:= '46'
      Else
      if ((DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS') or
          (DMParamSistema.QParamSistemaCod_Empresa.Value = 'NIR') or
          (DMParamSistema.QParamSistemaCod_Empresa.Value = 'LANGE') or
         (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE'))  Then // para cgs o digito é 41
        wAuxVerificador:= '41'
      Else
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASMIL' Then   // para grasmil o digito é 02
        wAuxVerificador:= '02'
      Else
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'INSIDE' Then   // para INSIDE o digito é 60
        wAuxVerificador:= '60'
      Else
         wAuxVerificador:=Copy(DMContasReceber.QRBloquetoCOD_AGENCIA.Text,4,1)+
                          Trim(DMContasReceber.QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text);
      wAux := RMaskCGC_CPF(Trim(wAux),4) + '.' +
              RMaskCGC_CPF(wAuxVerificador,2) + '/' +
              RMaskCGC_CPF(Trim(DMContasReceber.QRBloquetoCODIGO_CEDENTE.Text),5);
      QRLabel25.Caption := wAux;
      QRLabel59.Caption := wAux;
      QRLabel94.Caption := wAux;

      //-NOSSO NUMERO---------------------------------------------------------\\
      wAux := QRBloquetoNOSSO_NUMERO.Text;
      Insert('/', wAux, 3);
      Insert('-', wAux, 10);
      QRLabel71.Caption := wAux;
      QRLabel70.Caption := wAux;
      QRLabel104.Caption := wAux;

      //-LOCAL DE PAGAMENTO---------------------------------------------------\\
      QRLabel68.Caption := 'PAGÁVEL PREFERENCIALMENTE NAS AGÊNCIAS BANSICREDI OU SICREDI';
      QRLabel72.Caption := 'PAGÁVEL PREFERENCIALMENTE NAS AGÊNCIAS BANSICREDI OU SICREDI';
      QRLabel99.Caption := 'PAGÁVEL PREFERENCIALMENTE NAS AGÊNCIAS BANSICREDI OU SICREDI';

      //-INSTRUCOES DE PAGAMENTO----------------------------------------------\\
      wAux := '';
{      If( Trim(DMContasReceber.QRBloqueto IND_TIPO_JURO.Text) = 'VALOR' )Then
        wAux := FormatFloat('#,##0.00',DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.Value)
      Else
        wAux := FormatFloat('#,##0.00',(DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.Value * DMContasReceber.QRBloquetoVAL_TITULO.Value / 100));
}     QRMemo1.Lines.Clear;
      QRMemo1.Lines.Add(DMContasReceber.QRBloquetoinstrucao_juro.Text);
      QRMemo1.Lines.Append( Trim(DMContasReceber.QRBloquetoDESC_INSTRUCAO_BLOQUETO.Text));
      QRMemo2.Lines := QRMemo1.Lines;
      QRMemo3.Lines := QRMemo1.Lines;

      //-ACEITE---------------------------------------------------------------\\
      If Trim(DMContasReceber.QRBloquetoIND_ACEITE.Text) = 'SIM' Then
      Begin
        QRLabel36.Caption := 'SIM';
        QRLabel69.Caption := 'SIM';
        QRLabel103.Caption := 'SIM';
      End
      Else
      Begin
        QRLabel36.Caption := 'NÃO';
        QRLabel69.Caption := 'NÃO';
        QRLabel103.Caption := 'NÃO';
      End ;
    end;
  End;
 END;
end.
