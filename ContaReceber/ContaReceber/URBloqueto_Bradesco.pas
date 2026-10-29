unit URBloqueto_Bradesco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, Barcode, ExtCtrls;

type
  TFRBloqueto_Bradesco = class(TForm)
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
    QRShape57: TQRShape;
    QRLabel31: TQRLabel;
    QRShape58: TQRShape;
    QRLabel99: TQRLabel;
    QRShape59: TQRShape;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel117: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel121: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel120: TQRLabel;
    QRLabel113: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel122: TQRLabel;
    QRLabel123: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
    wstrNossoNumero : String;

    function RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
    function Intdecimais(wValor :String; wTamanho, wDecimais:integer): String;
    //function CalculaDVCodBarras(wstrNumeros:String):String;
    function CalculaDVMod10(wstrCampo: String):String;
    function FatorVenc():String;
    function DACMod11(wS:String):String;
  public
    { Public declarations }
    function CalculaDVNN(wstrNumeros:String):String;
  end;

var
  FRBloqueto_Bradesco: TFRBloqueto_Bradesco;

implementation

uses UContasReceber_cl, USequencia_cl, UOracle_cl, clipbrd,
  UBiblioteca,Mask, URBloquetoSafra, UParamSistema_cl, UContasReceberParam;

{$R *.DFM}

function TFRBloqueto_Bradesco.RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
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


Function TFRBloqueto_Bradesco.Intdecimais(wValor :String; wTamanho, wDecimais:integer): String;
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


function TFRBloqueto_Bradesco.CalculaDVNN(wstrNumeros:String):String;
var
  wintC, wintDV, wintMult : Integer;
  wintValor: array of Integer;
Begin
  wintDV := 0;
  wintMult := 2;
  wstrNumeros:=wstrNumeros;
  SetLength(wintValor, Length(wstrNumeros));

  for wintC := Length(wstrNumeros)-1 downto 0 do
  Begin
    wintValor[wintC] := StrToInt(wstrNumeros[wintC+1]); //a matriz de inteiros começa em 0

    If wintMult > 7 then
      wintMult := 2;                                                    //string começa por 1

    wintValor[wintC] := wintValor[wintC] * wintMult;
    wintDV := wintDV + wintValor[wintC];

    inc(wintMult);
  End;

  wintDV := 11 - (wintDV Mod 11);
  Case wintDV of
    10: wstrNumeros := 'P';
    11: wstrNumeros := '0';
  Else
    wstrNumeros := IntToStr(wintDV);
  End;
  Result := wstrNumeros;
End;

function TFRBloqueto_BRADESCO.DACMod11(wS:String):String;
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


{function TFRBloqueto_Bradesco.CalculaDVCodBarras(wstrNumeros:String):String;
var
  wintC, wintDV, wintMult : Integer;
  wintValor: array of Integer;
Begin
  wintDV := 0;
  wintMult := 2;
  SetLength(wintValor, Length(wstrNumeros));

  for wintC := Length(wstrNumeros)-1 downto 0 do
  Begin
    wintValor[wintC] := StrToInt(wstrNumeros[wintC+1]); //a matriz de inteiros começa em 0
                                                        //string começa por 1
    wintValor[wintC] := wintValor[wintC] * wintMult;
    wintDV := wintDV + wintValor[wintC];
    Inc(wintMult);
    If wintMult = 9 then
      wintMult := 2
  End;
  wintDV := 11 - (wintDV Mod 11);
  If(wintDV = 0)OR(wintDV > 9)Then
    wintDV := 1;
  Result := IntToStr(wintDV);
End;   }


function TFRBloqueto_Bradesco.CalculaDVMod10(wstrCampo: String):String;
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

    If wintValor[wintC] < 10 then
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


function TFRBloqueto_Bradesco.FatorVenc():String;
Begin
  Result := FloatToStr(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value - StrToDate('07/10/1997') );
End;

procedure TFRBloqueto_Bradesco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
  FRBloqueto_Bradesco := nil;
end;

procedure TFRBloqueto_Bradesco.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  wstrAux : String;
  wstrCampoLivre : String;
  wstrCodBarras : String;
  wstrLinhaDigitavel,www : String;
  wNN : String;
  wNossoNumero : string; //criada p/ resolver problema com NN no caso emissão safra
  wDesconto : Real;
begin
  With DMContasReceber do
  Begin
    If QRBloquetoPERC_DESCONTO.Value > 0 Then
     Begin
       wDesconto := ((QRBloquetoVAL_TITULO.Value * QRBloquetoPERC_DESCONTO.Value) / 100);
       QRLabel119.Caption := FormatFloat('#,##0.00',wDesconto);
       QRLabel121.Caption := FormatFloat('#,##0.00',wDesconto);
       QRLabel123.Caption := FormatFloat('#,##0.00',wDesconto);
     end
    else
    Begin
      QRLabel119.Caption := '0,00';
      QRLabel121.Caption := '0,00';
      QRLabel123.Caption := '0,00';
    end;

    if QRBloquetoCOD_BANCO.Value = 422 then
    Begin
      QRBloquetoCARTEIRA.Value := 09;
      QRBloquetoCOD_AGENCIA.Value := 3114;
      QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Value := '3';
      QRBloquetoNUM_CONTA_CORRENTE.Value := '0176300';
      QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text := '8';
      QRBloquetoDESC_FILIAL.Value := 'BANCO SAFRA SA';
      FRBloqueto_Bradesco.QRLabel110.Caption := 'CIP 130';
      FRBloqueto_Bradesco.QRLabel112.Caption := 'CIP 130';
      FRBloqueto_Bradesco.QRLabel113.Caption := '09';
      FRBloqueto_Bradesco.QRLabel114.Caption := '09';
      FRBloqueto_Bradesco.QRDBText29.Enabled := False;
      FRBloqueto_Bradesco.QRDBText12.Enabled := False;
      FRBloqueto_Bradesco.QRLabel115.Caption := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL ='+QRBloquetoCOD_FILIAL.Text);
      FRBloqueto_Bradesco.QRLabel118.Caption := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL ='+QRBloquetoCOD_FILIAL.Text);
    end
    else
    Begin
      FRBloqueto_Bradesco.QRLabel110.Caption := '';
      FRBloqueto_Bradesco.QRLabel112.Caption := '';
      FRBloqueto_Bradesco.QRLabel113.Caption := '';
      FRBloqueto_Bradesco.QRLabel114.Caption := '';
      FRBloqueto_Bradesco.QRDBText29.Enabled := True;
      FRBloqueto_Bradesco.QRDBText12.Enabled := True;
      FRBloqueto_Bradesco.QRLabel115.Caption := '';
      FRBloqueto_Bradesco.QRLabel118.Caption := '';
    end;

    if QRBloquetoNOSSO_NUMERO.Text = '' then
    Begin
      if QRBloquetoCOD_BANCO.Value = 422 then
        wNossoNumero := IntToStr(DMSequencia.Sequencia(1,'NossoNumeroSAFRA'))
      else
        wNossoNumero := IntToStr(DMSequencia.Sequencia(1,'NossoNumero_BRADESCO'));
      if QRBloquetonosso_numero_seq.Value > 999999999 then
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



      QRBloquetonosso_numero_seq.Value := StrToInt(RMaskCGC_CPF(wNossoNumero,9));
      if QRBloquetoCOD_BANCO.Value = 422 then
        wstrNossoNumero := IntDecimais(copy(QRBloquetoDT_EMISSAO.Text,9,2) + (QRBloquetonosso_numero_seq.Text),11,0)
      else
        wstrNossoNumero := IntDecimais(QRBloquetonosso_numero_seq.Text,11,0);

      wstrNossoNumero := wstrNossoNumero + CalculaDVNN(QRBloquetoCARTEIRA.Text + wstrNossoNumero);
      wstrCampoLivre := RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4)       +
                        RMaskCGC_CPF(QRBloquetoCARTEIRA.Text,2)          +
                        IntDecimais(QRBloquetonosso_numero_seq.Text,11,0)+
                        RMaskCGC_CPF(Copy(QRBloquetoNUM_CONTA_CORRENTE.Text,1,7),7) +
                        '0';

      wstrCampoLivre :=Bib.LimpaString(wstrCampoLivre,'-');

      //wstrCodBarras := '2379' + IntDecimais(QRBloquetoVAL_TITULO.Text,10,2) +RMaskCGC_CPF(FatorVenc(),4)+wstrCampoLivre;
      wstrCodBarras := '2379' + FatorVenc() + IntDecimais(QRBloquetoVAL_TITULO.Text,10,2) +wstrCampoLivre;
      Insert(DACMod11(wstrCodBarras), wstrCodBarras, 5 );
      //Insert(CalculaDVCodBarras(wstrCodBarras), wstrCodBarras, 5 );

      //LINHA DIGITAVEL
      wstrAux := '2379' + Copy(wstrCampoLivre,1,5);
      wstrLinhaDigitavel := wstrAux + CalculaDVMod10(wstrAux);
      wstrLinhaDigitavel := wstrLinhaDigitavel + Copy(wstrCampoLivre,6,10) + CalculaDVMod10( Copy(wstrCampoLivre,6,10) );
      wstrLinhaDigitavel := wstrLinhaDigitavel + Copy(wstrCampoLivre,16,10) + CalculaDVMod10( Copy(wstrCampoLivre,16,10) );
      wstrLinhaDigitavel := wstrLinhaDigitavel + Copy(wstrCodBarras,5,1);
      wstrLinhaDigitavel := wstrLinhaDigitavel + RMaskCGC_CPF(FatorVenc(),4);
      wstrLinhaDigitavel := wstrLinhaDigitavel + RMaskCGC_CPF(FloatToStr(Trunc(QRBloquetoVAL_TITULO.Value * 100)),10);

      //    IntDecimais(QRBloquetoVAL_TITULO.Text, (Length(QRBloquetoVAL_TITULO.Text)-1),2 );
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

      //DATA EMISSAO
      QRSysData3.Text := QRBloquetoDT_EMISSAO.Text;

      //aceite
      If DMContasReceber.QRBloquetoIND_ACEITE.Text = 'SIM' then
      Begin
        QRLabel36.Caption:= 'SIM';
      //  QRLabel69.Caption:= 'SIM';
        QRLabel103.Caption:= 'SIM';
      End
      Else
      Begin
        QRLabel36.Caption:= 'N';
       // QRLabel69.Caption:= 'SEM';
        QRLabel103.Caption:= 'N';
      End;

      //agencia/codigo cedente
      QRLabel25.Caption := RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4) + '-' +
                           TRIM(QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text)  +
                           '/' + RMaskCGC_CPF(QRBloquetoNUM_CONTA_CORRENTE.Text,7)+ '-'+
                           RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text,1);

      QRLabel59.Caption := QRLabel25.Caption;
     // QRLabel94.Caption := QRLabel25.Caption;

      //nosso numero
      wstrAux := '';
      wstrAux := RMaskCGC_CPF(QRBloquetoCARTEIRA.Text,2) + wstrNossoNumero;
      Insert('/',wstrAux,3);
  //    Insert('/',wstrAux,7);
      Insert('-',wstrAux,15);
      QRLabel70.Caption := wstrAux;
      QRLabel71.Caption := wstrAux;
    //  QRLabel104.Caption := wstrAux;

      QRLabel64.Caption := wstrLinhaDigitavel;
      Barcode1.Digits := wstrCodBarras;
      Barcode1.BarcodeCopy;
      QRImage3.Picture.Assign(ClipBoard);
    end
    else
    Begin
       //copia do bloqueto - Marcos - 13/05/2005

      wNN := QRBloquetoNOSSO_NUMERO.Value;
      //wstrNossoNumero := wstrNossoNumero + CalculaDVNN( QRBloquetoCARTEIRA.Text + wstrNossoNumero );
      wstrCampoLivre := RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4)                  +
                        RMaskCGC_CPF(QRBloquetoCARTEIRA.Text,2)                     +
                        //IntDecimais(QRBloquetonosso_numero_seq.Text,11,0)           +
                        //IntDecimais(Bib.StrZero(QRBloquetoNOSSO_NUMERO.Text,12),11,0) +
                        copy(Bib.StrZero(QRBloquetoNOSSO_NUMERO.Text,12),1,11)      +
                        RMaskCGC_CPF(Copy(QRBloquetoNUM_CONTA_CORRENTE.Text,1,7),7) +
                        '0';

      wstrCampoLivre :=Bib.LimpaString(wstrCampoLivre,'-');
      wstrCodBarras := '2379' + FatorVenc() + IntDecimais(QRBloquetoVAL_TITULO.Text,10,2) +wstrCampoLivre;
      Insert(DACMod11(wstrCodBarras), wstrCodBarras, 5 );


      //LINHA DIGITAVEL
      wstrAux := '2379' + Copy(wstrCampoLivre,1,5);
      wstrLinhaDigitavel := wstrAux + CalculaDVMod10(wstrAux);
      wstrLinhaDigitavel := wstrLinhaDigitavel + Copy(wstrCampoLivre,6,10) + CalculaDVMod10( Copy(wstrCampoLivre,6,10) );
      wstrLinhaDigitavel := wstrLinhaDigitavel + Copy(wstrCampoLivre,16,10) + CalculaDVMod10( Copy(wstrCampoLivre,16,10) );
      wstrLinhaDigitavel := wstrLinhaDigitavel + Copy(wstrCodBarras,5,1);
      wstrLinhaDigitavel := wstrLinhaDigitavel + RMaskCGC_CPF(FatorVenc(),4);
      wstrLinhaDigitavel := wstrLinhaDigitavel + RMaskCGC_CPF(FloatToStr(Trunc(QRBloquetoVAL_TITULO.Value * 100)),10);


      //IntDecimais(QRBloquetoVAL_TITULO.Text, (Length(QRBloquetoVAL_TITULO.Text)-1),2 );
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

      //instruções
      {If(QRBloquetoIND_TIPO_JURO.Text = 'VALOR')Then
      begin
        wstrAux := FormatFloat('#,##0.00', (QRBloquetoPERC_JURO_BLOQUETO.Value * QRBloquetoVAL_TITULO.Value/100 ));
        QRMemo1.Lines.Add('JUROS DE R$ ' + wstrAux + ' AO DIA APÓS VENCIMENTO');
      end
      Else
      begin
        wstrAux := FormatFloat('#,##0.00', QRBloquetoPERC_JURO_BLOQUETO.Value);
        QRMemo1.Lines.Add('JUROS DE ' + wstrAux + '% AO DIA APÓS VENCIMENTO');
      end;
      QRMemo1.Lines.Append(QRBloquetoDESC_INSTRUCAO_BLOQUETO.Text);
      QRMemo2.Lines.Append(QRMemo1.Lines.Text);
      QRMemo3.Lines.Append(QRMemo1.Lines.Text); }

      If (DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.Value <> 0) Then
        QRMemo1.Lines.Add(DMContasReceber.QRBloquetoinstrucao_juro.Text);

      QRMemo1.Lines.Append( Trim(DMContasReceber.QRBloquetoDESC_INSTRUCAO_BLOQUETO.Text));
      QRMemo2.Lines := QRMemo1.Lines;
      QRMemo3.Lines := QRMemo1.Lines;

      //DATA EMISSAO
      QRSysData3.Text := QRBloquetoDT_EMISSAO.Text;

      //aceite
      If DMContasReceber.QRBloquetoIND_ACEITE.Text = 'SIM' then
      Begin
        QRLabel36.Caption:= 'SIM';
        QRLabel69.Caption:= 'SIM';
        QRLabel103.Caption:= 'SIM';
      End
      Else
      Begin
        QRLabel36.Caption:= 'N';
        QRLabel69.Caption:= 'N';
        QRLabel103.Caption:= 'N';
      End;

      //agencia/codigo cedente
      QRLabel25.Caption := RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4) + '-' +
                           RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text,1) + '/' +
                           RMaskCGC_CPF(QRBloquetoNUM_CONTA_CORRENTE.Text,7)+ '-'+
                           RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text,1);
      QRLabel59.Caption := QRLabel25.Caption;
      QRLabel94.Caption := RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4) + '-' +
                           RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text,1) + '/' +
                           RMaskCGC_CPF(QRBloquetoNUM_CONTA_CORRENTE.Text,7)+ '-'+
                           RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text,1);

      //nosso numero
      wstrAux := '';

      wstrAux := RMaskCGC_CPF(QRBloquetoCARTEIRA.Text,2) + Bib.StrZero(wNN,12);
      Insert('/',wstrAux,3);
  //    Insert('/',wstrAux,7);
      Insert('-',wstrAux,15);
      QRLabel70.Caption := wstrAux;
      QRLabel71.Caption := wstrAux;
      QRLabel104.Caption := wstrAux;

      QRLabel64.Caption := wstrLinhaDigitavel;
      Barcode1.Digits := wstrCodBarras;
      Barcode1.BarcodeCopy;
      QRImage3.Picture.Assign(ClipBoard);

    end;
  End;

end;

procedure TFRBloqueto_Bradesco.QRBand2AfterPrint(Sender: TQRCustomBand;
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
          QAtuBloq.SetVariable('NUMERO', Bib.StrZero(wstrNossoNumero,12));
          QAtuBloq.SetVariable('COD_CONTA_RECEBER_CAB',QRBloquetoPeriodoCOD_CONTA_RECEBER_CAB.Value);
          QAtuBloq.ExecSQL;
          QRBloquetoPeriodo.Next;
        end;
      end
      else
      Begin
        QAtuBloq.Close;
        QAtuBloq.SetVariable('NUMERO', Bib.StrZero(wstrNossoNumero,12));
        QAtuBloq.SetVariable('COD_CONTA_RECEBER_CAB',QRBloquetoCOD_CONTA_RECEBER_CAB.Value);
        QAtuBloq.ExecSQL;
      end;
//      QEnviadoBanco.Close;
//      QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',QRBloquetoCOD_CONTA_RECEBER_CAB.Value);
//      QEnviadoBanco.ExecSQL;

      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      raise exception.Create('Erro ao tentar gravar Nosso Numero no Contas a Receber!');
    end;
  end;
  end;
end;

end.
