unit URBloqueto_Unibanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Barcode;

type
  TFRBloqueto_Unibanco = class(TForm)
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
    QRDBText13: TQRDBText;
    QRLabel35: TQRLabel;
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
    QRDBText47: TQRDBText;
    QRLabel102: TQRLabel;
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
    QRDBText39: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText48: TQRDBText;
    QRLabel99: TQRLabel;
    QRDBText49: TQRDBText;
    QRLabel106: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    function DACMod11(wS:String):String;
    function FatorVenc():String;
    function DVMod10(wS:String):String;
    function DACMod11NN(wS:String):String;

  public
    { Public declarations }
  end;

var
  FRBloqueto_Unibanco: TFRBloqueto_Unibanco;

implementation

uses UContasReceber_cl, USequencia_cl, UOracle_cl, clipbrd, UBiblioteca;

{$R *.DFM}

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

function TFRBloqueto_UNIBANCO.DACMod11(wS:String):String;
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

function TFRBloqueto_UNIBANCO.DACMod11NN(wS:String):String;
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
  If (wNN=10) or (wNN=0) or (wNN=11) Then
    Result := '0'
  Else
    Result := IntToStr(wNN);
End;

function TFRBloqueto_UNIBANCO.FatorVenc():String;
Begin
  Result := FloatToStr(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value - StrToDate('07/10/1997') );
End;

//-DIGITO VERIFICADOR MODULO 10-----------------------------------------------\\
function TFRBloqueto_UNIBANCO.DVMod10(wS:String):String;
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

Function ReverseStr (S : ShortString) : ShortString;
var 
I : Integer; 
begin 
Result := ''; 
For I := Length(S) DownTo 1 Do 
Result := Result + S[I]; 
end;

procedure TFRBloqueto_Unibanco.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  wCodBarra, wAux, wDVGeral, wLinhaDig, wNN: string;
  wNN1, wNN2 : string;
  wN : Real;
begin
  With DMContasReceber do
  begin
  if QRBloquetoNOSSO_NUMERO.Text = '' Then
  Begin
    try
      QRBloquetonosso_numero_seq.Value:=
      DMSequencia.Sequencia(Trunc(1),'NossoNumeroUNIBANCO');
      if QRBloquetonosso_numero_seq.Value >= 99999999 then
        begin
          MessageDlg('Sequência Nosso Número deve ser inicializada, sequência atingiu valor máximo!!!',mtWarning,[mbOk],0);
          QRPrimario.QRPrinter.Cancel;
          Exit;
        end;

//NOSSO NUMERO------------------------------------------------------\\
    wNN1 := Bib.StrZero(QRBloquetonosso_numero_seq.Text,10);
    wNN1:= wNN1 + DACMod11NN(wNN1);
    wNN1:= wNN1 + DACMod11NN(wNN1);

    QRLabel70.Caption := '1/' + copy(wNN1,1,10) + '-' + copy(wNN1,11,1) + '/' + copy(wNN1,12,1);
    QRLabel71.Caption := QRLabel70.Caption;
    QRLabel104.Caption := QRLabel70.Caption;

//Digito Verificador CODIGO DE BARRAS-----------------------------------------------------\\

    WDVGeral := QRBloquetoCOD_BANCO.Text + '9'  + FatorVenc()                 +
    intdecimais(Bib.StrZero(QRBloquetoVAL_TITULO.Text,10),10,2) + '04'        +
    copy(QrBloquetoDT_VENCIMENTO.Text,9,2)                                    +
    copy(QrBloquetoDT_VENCIMENTO.Text,4,2)                                    +
    copy(QrBloquetoDT_VENCIMENTO.Text,1,2)                                    +
    RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4)                                +
    RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text,1)                 +
    RMaskCGC_CPF(wNN1,12);
    //qrlabel31.caption:= wdvgeral;
    wDVGeral:= DACMod11(wDVGeral);

//******************************************************************************
//      ROTINAS PARA FORMAR A REPRESENTAÇAO NUMERICA DO CODIGO DE BARRAS
//******************************************************************************

    wAux := '';

//digito verificador campo 1
    wNN := QRBloquetoCOD_BANCO.Text + '9' + '04'                              +
    copy(QrBloquetoDT_VENCIMENTO.Text,9,2)                                    +
    copy(QrBloquetoDT_VENCIMENTO.Text,4,1);
    wNN := DVMod10(wNN);

    wAux:= QRBloquetoCOD_BANCO.Text + '9' + '04'                              +
    copy(QrBloquetoDT_VENCIMENTO.Text,9,2)                                    +
    copy(QrBloquetoDT_VENCIMENTO.Text,4,1);
    wAux := wAux + wNN;
    wLinhaDig := wLinhaDig + wAux + ' ';
    Insert('.',wLinhaDig,6);

//digito verificador campo2
    wNN := '';
    wNN := copy(QrBloquetoDT_VENCIMENTO.Text,5,1)                             +
    copy(QrBloquetoDT_VENCIMENTO.Text,1,2)                                    +
    RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4)                                +
    RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text,1)                 +
    copy(wNN1,1,2);
    wNN := DVMod10(wNN);

    wAux:= copy(QrBloquetoDT_VENCIMENTO.Text,5,1)                             +
    copy(QrBloquetoDT_VENCIMENTO.Text,1,2)                                    +
    RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4)                                +
    RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text,1)                 +
    copy(wNN1,1,2);
    wAux := wAux + wNN;
    wLinhaDig := wLinhaDig + wAux + ' ';
    Insert('.',wLinhaDig,18);

//digito verificador campo3
    wNN := '';
    wNN := copy(wNN1,3,10);
    wNN := DVMod10(wNN);

    wAux := copy(wNN1,3,10);
    wAux := wAux + wNN;
    wLinhaDig := wLinhaDig + wAux + ' ';
    Insert('.',wLinhaDig,31);

//digito verificador campo4
    wLinhaDig := wLinhaDig + wDVGeral + ' ';

//digito verificador campo5
    wLinhaDig := wLinhaDig + FatorVenc() + intdecimais(Bib.StrZero(QRBloquetoVAL_TITULO.Text,10),10,2);

    QRLabel64.Caption := wLinhaDig;

//CODIGO DE BARRAS
    wCodBarra := QRBloquetoCOD_BANCO.Text + '9'  + FatorVenc()                +
    intdecimais(Bib.StrZero(QRBloquetoVAL_TITULO.Text,10),10,2) + '04'        +
    copy(QrBloquetoDT_VENCIMENTO.Text,9,2)                                    +
    copy(QrBloquetoDT_VENCIMENTO.Text,4,2)                                    +
    copy(QrBloquetoDT_VENCIMENTO.Text,1,2)                                    +
    RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4)                                +
    RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text,1)                 +
    copy(wNN1,1,12);
    Barcode1.Digits := wCodBarra;
    Barcode1.BarcodeCopy;
    QRImage3.Picture.Assign(ClipBoard);

     //aceite
    If DMContasReceber.QRBloquetoIND_ACEITE.Text = 'SIM' then
    Begin
      QRLabel36.Caption:= 'SIM';
      QRLabel69.Caption:= 'SIM';
      QRLabel103.Caption:= 'SIM';
    End
    Else
    Begin
      QRLabel36.Caption:= 'NÃO';
      QRLabel69.Caption:= 'NÃO';
      QRLabel103.Caption:= 'NÃO';
    End;

    //agencia/codigo cedente
    QRLabel25.Caption := RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,5) + '-' + RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text,1) + '/' + QRBloquetoNUM_CONTA_CORRENTE.Text;
    QRLabel59.Caption := QRLabel25.Caption;
    QRLabel94.Caption := QRLabel25.Caption;


    QRMemo1.Lines.Clear;
    If(DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.Value <> 0)Then
      QRMemo1.Lines.Add(DMContasReceber.QRBloquetoinstrucao_juro.Text);

    QRMemo1.Lines.Append(Trim(DMContasReceber.QRBloquetoDESC_INSTRUCAO_BLOQUETO.Text));
    QRMemo2.Lines := QRMemo1.Lines;
    QRMemo3.Lines := QRMemo1.Lines;

    //QRLabel67.Caption := QRBloquetoDT_EMISSAO.Text;
    //QRLabel69.Caption := QRBloquetoDT_EMISSAO.Text;
    //QRLabel74.Caption := QRBloquetoDT_EMISSAO.Text;

  except
    on E : Exception do
      ShowMessage(E.Message);
  end;
  try
      If DMOracle.DBCemapa.InTransaction = False then
         DMOracle.DBCemapa.StartTransaction;
      QAtuBloq.Close;
      QAtuBloq.SetVariable('NUMERO', Bib.StrZero(wNN1,12));
      QAtuBloq.SetVariable('COD_CONTA_RECEBER_CAB',QRBloquetoCOD_CONTA_RECEBER_CAB.Value);
      QAtuBloq.ExecSQL;
      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      raise exception.Create('Erro ao tentar gravar Nosso Numero no Contas a Receber!');
    end;
  end
  else
    Begin //COPIA DO BLOQUETO MARCOS 14/05/2005

//NOSSO NUMERO------------------------------------------------------\\
    //wNN1 := Bib.StrZero(QRBloquetonosso_numero_seq.Text,12);
    //wNN1:= wNN1 + DACMod11NN(wNN1);
    wNN1 := '1/' + copy(bib.StrZero(QRBloquetoNOSSO_NUMERO.Text,12),1,12);
    Insert('-',wNN1,13);
    Insert('/',wNN1,15);
    QRLabel70.Caption := wNN1;
    QRLabel71.Caption := QRLabel70.Caption;
    QRLabel104.Caption := QRLabel70.Caption;
    wNN1 := Bib.StrZero(QRBloquetoNOSSO_NUMERO.Text,12);
//Digito Verificador CODIGO DE BARRAS-----------------------------------------------------\\

    WDVGeral := QRBloquetoCOD_BANCO.Text + '9'  + FatorVenc()                 +
    intdecimais(Bib.StrZero(QRBloquetoVAL_TITULO.Text,10),10,2) + '04'        +
    copy(QrBloquetoDT_VENCIMENTO.Text,9,2)                                    +
    copy(QrBloquetoDT_VENCIMENTO.Text,4,2)                                    +
    copy(QrBloquetoDT_VENCIMENTO.Text,1,2)                                    +
    RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4)                                +
    RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text,1)                 +
    RMaskCGC_CPF(wNN1,12);
    //qrlabel31.caption:= wdvgeral;
    wDVGeral:= DACMod11(wDVGeral);

//******************************************************************************
//      ROTINAS PARA FORMAR A REPRESENTAÇAO NUMERICA DO CODIGO DE BARRAS
//******************************************************************************

    wAux := '';

//digito verificador campo 1
    wNN := QRBloquetoCOD_BANCO.Text + '9' + '04'                              +
    copy(QrBloquetoDT_VENCIMENTO.Text,9,2)                                    +
    copy(QrBloquetoDT_VENCIMENTO.Text,4,1);
    wNN := DVMod10(wNN);

    wAux:= QRBloquetoCOD_BANCO.Text + '9' + '04'                              +
    copy(QrBloquetoDT_VENCIMENTO.Text,9,2)                                    +
    copy(QrBloquetoDT_VENCIMENTO.Text,4,1);
    wAux := wAux + wNN;
    wLinhaDig := wLinhaDig + wAux + ' ';
    Insert('.',wLinhaDig,6);

//digito verificador campo2
    wNN := '';
    wNN := copy(QrBloquetoDT_VENCIMENTO.Text,5,1)                             +
    copy(QrBloquetoDT_VENCIMENTO.Text,1,2)                                    +
    RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4)                                +
    RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text,1)                 +
    copy(wNN1,1,2);
    wNN := DVMod10(wNN);

    wAux:= copy(QrBloquetoDT_VENCIMENTO.Text,5,1)                             +
    copy(QrBloquetoDT_VENCIMENTO.Text,1,2)                                    +
    RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4)                                +
    RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text,1)                 +
    copy(wNN1,1,2);
    wAux := wAux + wNN;
    wLinhaDig := wLinhaDig + wAux + ' ';
    Insert('.',wLinhaDig,18);

//digito verificador campo3
    wNN := '';
    wNN := copy(wNN1,3,10);
    wNN := DVMod10(wNN);

    wAux := copy(wNN1,3,10);
    wAux := wAux + wNN;
    wLinhaDig := wLinhaDig + wAux + ' ';
    Insert('.',wLinhaDig,31);

//digito verificador campo4
    wLinhaDig := wLinhaDig + wDVGeral + ' ';

//digito verificador campo5
    wLinhaDig := wLinhaDig + FatorVenc() + intdecimais(Bib.StrZero(QRBloquetoVAL_TITULO.Text,10),10,2);

    QRLabel64.Caption := wLinhaDig;

//CODIGO DE BARRAS
    wCodBarra := QRBloquetoCOD_BANCO.Text + '9'  + FatorVenc()                +
    intdecimais(Bib.StrZero(QRBloquetoVAL_TITULO.Text,10),10,2) + '04'        +
    copy(QrBloquetoDT_VENCIMENTO.Text,9,2)                                    +
    copy(QrBloquetoDT_VENCIMENTO.Text,4,2)                                    +
    copy(QrBloquetoDT_VENCIMENTO.Text,1,2)                                    +
    RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4)                                +
    RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text,1)                 +
    copy(wNN1,1,12);
    Barcode1.Digits := wCodBarra;
    Barcode1.BarcodeCopy;
    QRImage3.Picture.Assign(ClipBoard);

     //aceite
    If DMContasReceber.QRBloquetoIND_ACEITE.Text = 'SIM' then
    Begin
      QRLabel36.Caption:= 'SIM';
      QRLabel69.Caption:= 'SIM';
      QRLabel103.Caption:= 'SIM';
    End
    Else
    Begin
      QRLabel36.Caption:= 'NÃO';
      QRLabel69.Caption:= 'NÃO';
      QRLabel103.Caption:= 'NÃO';
    End;

    //agencia/codigo cedente
    QRLabel25.Caption := RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,5) + '-' + RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text,1) + '/' + QRBloquetoNUM_CONTA_CORRENTE.Text;
    QRLabel59.Caption := QRLabel25.Caption;
    QRLabel94.Caption := QRLabel25.Caption;

    QRMemo1.Lines.Clear;
    If(DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.Value <> 0)Then
      QRMemo1.Lines.Add(DMContasReceber.QRBloquetoinstrucao_juro.Text);

    QRMemo1.Lines.Append(Trim(DMContasReceber.QRBloquetoDESC_INSTRUCAO_BLOQUETO.Text));
    QRMemo2.Lines := QRMemo1.Lines;
    QRMemo3.Lines := QRMemo1.Lines;

    //QRLabel67.Caption := QRBloquetoDT_EMISSAO.Text;
    //QRLabel69.Caption := QRBloquetoDT_EMISSAO.Text;
    //QRLabel74.Caption := QRBloquetoDT_EMISSAO.Text;

    end;      
end;
end;
end.
