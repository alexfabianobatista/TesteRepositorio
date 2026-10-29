unit URBloqueto_CEF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, Barcode, ExtCtrls, jpeg, Db;

type
  TFRBloqueto_CEF = class(TForm)
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
    QRShape35: TQRShape;
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
    QRDBText30: TQRDBText;
    QRLabel68: TQRLabel;
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
    QRDBText13: TQRDBText;
    QRLabel35: TQRLabel;
    QRLabel71: TQRLabel;
    QRMemo2: TQRMemo;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel72: TQRLabel;
    QRShape37: TQRShape;
    QRShape56: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText31: TQRDBText;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel73: TQRLabel;
    QRShape36: TQRShape;
    Barcode1: TBarcode;
    QRImage4: TQRImage;
    QRLabel74: TQRLabel;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRSysData5: TQRSysData;
    QRLabel75: TQRLabel;
    QRShape40: TQRShape;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
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
    QRShape48: TQRShape;
    QRLabel90: TQRLabel;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRShape55: TQRShape;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape57: TQRShape;
    QRDBText12: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText35: TQRDBText;
    QRLabel107: TQRLabel;
    QRDBText36: TQRDBText;
    QRSysData6: TQRSysData;
    QRMemo3: TQRMemo;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    function DACMod11(wS:String):String;
    function DACMod11NN(wS:String):String;
    function FatorVenc():String;
    function DVMod10(wS:String):String;

  public
    { Public declarations }

  end;

var
  FRBloqueto_CEF: TFRBloqueto_CEF;

implementation

uses UContasReceber_cl, USequencia_cl, UOracle_cl, clipbrd, UBiblioteca,
  UContasReceberParam;

{$R *.dfm}
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

//para calcular o DVGeral
function TFRBloqueto_CEF.DACMod11(wS:String):String;
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
  If  (wNN=0) or (wNN=1) or (wNN=10) or (wNN=11)Then
    Result := '1'
  Else
    Result := IntToStr(wNN);
End;

//para calcular o DVnossonumero
function TFRBloqueto_CEF.DACMod11NN(wS:String):String;
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
  If  (wNN=10) or (wNN=11)Then
    Result := '0'
  Else
    Result := IntToStr(wNN);
End;

function TFRBloqueto_CEF.FatorVenc():String;
Begin
  Result := FloatToStr(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value - StrToDate('07/10/1997') );
End;

//-DIGITO VERIFICADOR MODULO 10-----------------------------------------------\\
function TFRBloqueto_CEF.DVMod10(wS:String):String;
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
  If ((wDV = 0) or (wDV = 10)) Then
    wDV := 0;
  Result := IntToStr(wDV);
End;

Function ReverseStr (S : ShortString) : ShortString;
var
I : Integer;
begin
Result := '';
For I := Length(S) DownTo 1 Do
Result := Result + S[I];
end;


procedure TFRBloqueto_CEF.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  wCodBarra, wAux, wDVGeral, wLinhaDig, wNN, wCodCedente: string;
  wNN1, wDigCob, wRegistrada: string;
  wN,wDesconto : Real;
begin
  wCodCedente := '';
  With DMContasReceber do
  begin
    If QRBloquetoPERC_DESCONTO.Value > 0 Then
     Begin
       wDesconto := ((QRBloquetoVAL_TITULO.Value * QRBloquetoPERC_DESCONTO.Value) / 100);
       QRLabel110.Caption := FormatFloat('#,##0.00',wDesconto);
       QRLabel111.Caption := FormatFloat('#,##0.00',wDesconto);
       QRLabel112.Caption := FormatFloat('#,##0.00',wDesconto);
     end
    else
    Begin
      QRLabel110.Caption := '0,00';
      QRLabel111.Caption := '0,00';
      QRLabel112.Caption := '0,00';
    end;


    if QRBloquetoNOSSO_NUMERO.Text = '' Then
    Begin
      try
        QRBloquetonosso_numero_seq.Value:=
        DMSequencia.Sequencia(Trunc(1),'NOSSONUMERO_CEF');
        if QRBloquetonosso_numero_seq.Value >= 9999999 then
          begin
            MessageDlg('Sequência Nosso Número deve ser inicializada, sequência atingiu valor máximo!!!',mtWarning,[mbOk],0);
            QRPrimario.QRPrinter.Cancel;
            Exit;
          end;
      wRegistrada := DMOracle.BuscaNome('SELECT COD_FORMA_CADAST_BANCO FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ FContasReceberParam.ME19CodContaCorrente.Text);
      if wRegistrada = '1' then
      Begin
        wRegistrada := '9';
        QRLabel104.Caption := 'CR';
        QRLabel36.Caption := 'CR';
        QRLabel63.Caption := 'CR';
      end
      else
      Begin
        wRegistrada := '8';
        QRLabel104.Caption := 'SR';
        QRLabel36.Caption := 'SR';
        QRLabel63.Caption := 'SR';
      end;
  //NOSSO NUMERO------------------------------------------------------\\
      wNN1 := wRegistrada + Bib.StrZero(QRBloquetonosso_numero_seq.Text,9);
      wNN1 := wNN1 + DACMod11NN(wNN1);
      Insert('-',wNN1,11);
      QRLabel70.Caption := wNN1;
      QRLabel71.Caption := wNN1;
      QRLabel103.Caption := wNN1;

      QRLabel31.Caption := RMaskCGC_CPF(QRBloquetoNum_Titulo.Text,6);
      QRLabel32.Caption := RMaskCGC_CPF(QRBloquetoNum_Titulo.Text,6);
      QRLabel107.Caption := RMaskCGC_CPF(QRBloquetoNum_Titulo.Text,6);


  //Digito Verificador CODIGO DE BARRAS-----------------------------------------------------\\
      wCodCedente := copy(RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4),1,4) +
                     RMaskCGC_CPF(QRBloquetoNUM_CONVENIO.Text,3) +
                     RMaskCGC_CPF(QRBloquetoCODIGO_CEDENTE.Text,8);

      WDVGeral := QRBloquetoCOD_BANCO.Text + '9'  + FatorVenc()                 +
      intdecimais(Bib.StrZero(QRBloquetoVAL_TITULO.Text,10),10,2)               +
      //RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4)  + '9'                         +
      wRegistrada + RMaskCGC_CPF(QRBloquetonosso_numero_seq.Text,9)                     +
      wCodCedente;
      wDVGeral:= DACMod11(wDVGeral);

  //******************************************************************************
  //      ROTINAS PARA FORMAR A REPRESENTAÇAO NUMERICA DO CODIGO DE BARRAS
  //******************************************************************************

      wAux := '';

  //digito verificador campo 1
      wNN := QRBloquetoCOD_BANCO.Text + '9'                           +
             wRegistrada + copy(RMaskCGC_CPF(QRBloquetonosso_numero_seq.Text,9),1,4);
      wNN := DVMod10(wNN);

      wAux:= QRBloquetoCOD_BANCO.Text + '9'                           +
      wRegistrada + copy(RMaskCGC_CPF(QRBloquetonosso_numero_seq.Text,9),1,4);
      wAux := wAux + wNN;
      wLinhaDig := wLinhaDig + wAux + ' ';
      Insert('.',wLinhaDig,6);

  //digito verificador campo2
      wNN := '';
      wNN := copy(RMaskCGC_CPF(QRBloquetonosso_numero_seq.Text,9),5,5)    +
             copy(wCodCedente,1,5);
      wNN := DVMod10(wNN);

      wAux:= copy(RMaskCGC_CPF(QRBloquetonosso_numero_seq.Text,9),5,5)    +
             copy(wCodCedente,1,5);
      wAux := wAux + wNN;
      wLinhaDig := wLinhaDig + wAux + ' ';
      Insert('.',wLinhaDig,18);

  //digito verificador campo3
      wNN := '';
      wNN := copy(wCodCedente,6,10);
      wNN := DVMod10(wNN);

      wAux := copy(wCodCedente,6,10);
      wAux := wAux + wNN;
      wLinhaDig := wLinhaDig + wAux + ' ';
      Insert('.',wLinhaDig,31);

  //digito verificador campo4
      wLinhaDig := wLinhaDig + wDVGeral + ' ';

  //digito verificador campo5
      wLinhaDig := wLinhaDig + FatorVenc() + intdecimais(Bib.StrZero(QRBloquetoVAL_TITULO.Text,10),10,2);

      QRLabel64.Caption := wLinhaDig;

  //CODIGO DE BARRAS
      wCodBarra := QRBloquetoCOD_BANCO.Text + '9'  + wDVGeral + FatorVenc()     +
      intdecimais(Bib.StrZero(QRBloquetoVAL_TITULO.Text,10),10,2)               +
      wRegistrada +RMaskCGC_CPF(QRBloquetonosso_numero_seq.Text,9)              +
      copy(RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4),1,4)                      +
      RMaskCGC_CPF(QRBloquetoNUM_CONVENIO.Text,3)                               +
      RMaskCGC_CPF(QRBloquetoCODIGO_CEDENTE.Text,8);

      Barcode1.Digits := wCodBarra;
      Barcode1.BarcodeCopy;
      QRImage3.Picture.Assign(ClipBoard);


      //agencia/codigo cedente
      wCodCedente := RMaskCGC_CPF(QRBloquetoCODIGO_CEDENTE.Text,8) + RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text,1);
      Insert('-',wCodCedente,9);
      QRLabel25.Caption := copy(RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4),1,4) + '.' + RMaskCGC_CPF(QRBloquetoNUM_CONVENIO.Text,3) + '.' + wCodCedente;
      QRLabel59.Caption := QRLabel25.Caption;
      QRLabel102.Caption := QRLabel25.Caption;

      QRMemo1.Lines.Clear;
      If(DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.Value <> 0)Then
        QRMemo1.Lines.Add(DMContasReceber.QRBloquetoinstrucao_juro.Text);

      QRMemo1.Lines.Append(Trim(DMContasReceber.QRBloquetoDESC_INSTRUCAO_BLOQUETO.Text));
      QRMemo2.Lines := QRMemo1.Lines;
      QRMemo3.Lines := QRMemo1.Lines;

    except
      on E : Exception do
        ShowMessage(E.Message);
    end;
    try
        If DMOracle.DBCemapa.InTransaction = False then
           DMOracle.DBCemapa.StartTransaction;
        QAtuBloq.Close;
        QAtuBloq.SetVariable('NUMERO', Bib.StrZero(wNN1,10));
        QAtuBloq.SetVariable('COD_CONTA_RECEBER_CAB',QRBloquetoCOD_CONTA_RECEBER_CAB.Value);
        QAtuBloq.ExecSQL;
        DMOracle.DBCemapa.Commit;
      except
        DMOracle.DBCemapa.Rollback;
        raise exception.Create('Erro ao tentar gravar Nosso Numero no Contas a Receber!');
      end;
   end;
 end; 
end;

end.
