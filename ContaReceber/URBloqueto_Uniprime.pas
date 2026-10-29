unit URBloqueto_Uniprime;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, Barcode, ExtCtrls, jpeg, QRPDFFilt;

type
  TFRBloqueto_Uniprime = class(TForm)
    QRPrimario: TQuickRep;
    QRBand2: TQRBand;
    Barcode1: TBarcode;
    QRShape24: TQRShape;
    QRLabel62: TQRLabel;
    QRLabel64: TQRLabel;
    QRImage3: TQRImage;
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
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRLabel98: TQRLabel;
    QRDBText37: TQRDBText;
    QRDBText46: TQRDBText;
    QRLabel104: TQRLabel;
    QRMemo2: TQRMemo;
    QRLabel105: TQRLabel;
    QRShape56: TQRShape;
    QRLabel69: TQRLabel;
    QRDBText14: TQRDBText;
    QRShape1: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel34: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel65: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel72: TQRLabel;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRImage2: TQRImage;
    QRLabel108: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRLabel116: TQRLabel;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel17: TQRLabel;
    QRShape4: TQRShape;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape25: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
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
    QRSysData1: TQRSysData;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel54: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel55: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel66: TQRLabel;
    QRShape53: TQRShape;
    QRShape15: TQRShape;
    N: TQRLabel;
    QRShape13: TQRShape;
    QRImage1: TQRImage;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRShape6: TQRShape;
    QRImage4: TQRImage;
    QRShape7: TQRShape;
    QRLabel19: TQRLabel;
    QRShape12: TQRShape;
    QRLabel50: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel52: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel53: TQRLabel;
    QRShape18: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRDBText18: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText27: TQRDBText;
    QRLabel57: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel68: TQRLabel;
    QRLabel61: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel51: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel56: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText30: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
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
    function CalculaDVMod10(wstrCampo: String):String;
    function FatorVenc():String;
    function DACMod11(wS:String):String;
  public
    { Public declarations }
    function CalculaDVNN(wstrNumeros:String):String;
  end;

var
  FRBloqueto_Uniprime: TFRBloqueto_Uniprime;

implementation

uses UContasReceber_cl, USequencia_cl, UOracle_cl, clipbrd,
  UBiblioteca,Mask, URBloquetoSafra, UParamSistema_cl, UContasReceberParam,
  DB;

{$R *.DFM}

function TFRBloqueto_Uniprime.RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
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


Function TFRBloqueto_Uniprime.Intdecimais(wValor :String; wTamanho, wDecimais:integer): String;
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


function TFRBloqueto_Uniprime.CalculaDVNN(wstrNumeros:String):String;
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
      wintMult := 2;

    wintValor[wintC] := wintValor[wintC] * wintMult;
    wintDV := wintDV + wintValor[wintC];

    inc(wintMult);
  End;

  wintDV := (wintDV * 10) mod 11;
  Case wintDV of
    10: wstrNumeros := 'P';
    11: wstrNumeros := '0';
  Else
    wstrNumeros := IntToStr(wintDV);
  End;
  Result := wstrNumeros;
End;

function TFRBloqueto_Uniprime.DACMod11(wS:String):String;
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

function TFRBloqueto_Uniprime.CalculaDVMod10(wstrCampo: String):String;
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


function TFRBloqueto_Uniprime.FatorVenc():String;
Begin
  if DMContasReceber.QRBloquetoDT_VENCIMENTO.Value > StrToDate('22/02/2025') then  // Em 22/02/2025 o fator de vcto zerá resetado para inicial 1000
    Result := FloatToStr(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value - StrToDate('29/05/2022') )
  else
    Result := FloatToStr(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value - StrToDate('07/10/1997') );
End;

procedure TFRBloqueto_Uniprime.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
  FRBloqueto_Uniprime := nil;
end;

procedure TFRBloqueto_Uniprime.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  wstrAux : String;
  wstrCampoLivre : String;
  wstrCodBarras : String;
  wstrLinhaDigitavel,www : String;
  wNN : String;
  wNossoNumero : string;
  wDesconto : Real;
begin
  wstrNossoNumero := '';
  wstrCampoLivre := '';
  wstrCodBarras := '';
  wstrLinhaDigitavel := '';
  wstrAux := '';
  
  With DMContasReceber do
  Begin

    FRBloqueto_Uniprime.QRLabel35.Caption := '';

    if QRBloquetoNOSSO_NUMERO.Text = '' then
    Begin
      wNossoNumero := IntToStr(DMSequencia.Sequencia(1,'NossoNumero_Uniprime'));
      if QRBloquetonosso_numero_seq.Value > 999999999 then
      begin
        MessageDlg('Sequencia Nosso Número deve ser inicializada, sequencia atingiu valor maximo!!!',mtWarning,[mbOk],0);
        QRPrimario.QRPrinter.Cancel;
        Exit;
      end;

      QRBloquetonosso_numero_seq.Value := StrToInt(RMaskCGC_CPF(wNossoNumero,9));
      wstrNossoNumero := IntDecimais(QRBloquetonosso_numero_seq.Text,11,0);
      wstrCampoLivre := RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4)       +
                          RMaskCGC_CPF(QRBloquetoCARTEIRA.Text,2)          +
                          IntDecimais(wstrNossoNumero,11,0)+ // Aumentei de 9 pra 11
                          RMaskCGC_CPF(Copy(QRBloquetoNUM_CONTA_CORRENTE.Text,1,7),7) +
                          '0';
      wstrNossoNumero := wstrNossoNumero + CalculaDVNN(QRBloquetoCARTEIRA.Text + wstrNossoNumero) // Tirei uma das Carteiras
    end
    else
    begin //copia do bloqueto
      wNN := Copy(QRBloquetoNOSSO_NUMERO.Value, 1, QRBloquetoNOSSO_NUMERO.Size);

      wstrCampoLivre := RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4)                  +
                        RMaskCGC_CPF(QRBloquetoCARTEIRA.Text,2)                     +
                        copy(Bib.StrZero(QRBloquetoNOSSO_NUMERO.Text,12),1,11)      +
                        RMaskCGC_CPF(Copy(QRBloquetoNUM_CONTA_CORRENTE.Text,1,7),7) +
                        '0';

      wstrNossoNumero := wNN;
    end;

    wstrCampoLivre :=Bib.LimpaString(wstrCampoLivre,'-');
    wstrCodBarras := '0999' + FatorVenc() + IntDecimais(QRBloquetoVAL_TITULO.Text,10,2) +wstrCampoLivre;
    Insert(DACMod11(wstrCodBarras), wstrCodBarras, 5 );

    //LINHA DIGITAVEL
    wstrAux := '0999' + Copy(wstrCampoLivre,1,5);
    wstrLinhaDigitavel := wstrAux + CalculaDVMod10(wstrAux);
    wstrLinhaDigitavel := wstrLinhaDigitavel + Copy(wstrCampoLivre,6,10) + CalculaDVMod10( Copy(wstrCampoLivre,6,10) );
    wstrLinhaDigitavel := wstrLinhaDigitavel + Copy(wstrCampoLivre,16,10) + CalculaDVMod10( Copy(wstrCampoLivre,16,10) );
    wstrLinhaDigitavel := wstrLinhaDigitavel + Copy(wstrCodBarras,5,1);
    wstrLinhaDigitavel := wstrLinhaDigitavel + RMaskCGC_CPF(FatorVenc(),4);
    wstrLinhaDigitavel := wstrLinhaDigitavel + RMaskCGC_CPF(FloatToStr(QRBloquetoVAL_TITULO.Value * 100),10);

    Insert('.',wstrLinhaDigitavel,6);
    Insert(' ',wstrLinhaDigitavel,12);
    Insert('.',wstrLinhaDigitavel,18);
    Insert(' ',wstrLinhaDigitavel,25);
    Insert('.',wstrLinhaDigitavel,31);
    Insert(' ',wstrLinhaDigitavel,38);
    Insert(' ',wstrLinhaDigitavel,40);

    QRMemo1.Lines.Clear;
    QRMemo2.Lines.Clear;

    If (QRBloquetoPERC_JURO_BLOQUETO.Value <> 0) Then
      QRMemo1.Lines.Add(QRBloquetoinstrucao_juro.Text);

    QRMemo1.Lines.Append(Trim(QRBloquetoDESC_INSTRUCAO_BLOQUETO.Text));
    QRMemo2.Lines := QRMemo1.Lines;

    //agencia/codigo cedente
    QRLabel94.Caption := RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4) + '-' +
                         RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text,1) + '/' +
                         RMaskCGC_CPF(QRBloquetoNUM_CONTA_CORRENTE.Text,6)+ '-'+
                         RMaskCGC_CPF(QRBloquetoDIG_VERIFICADOR_AGENCIA_CONTA.Text,1);
    QRLabel65.Caption := QRLabel94.Caption;
    QRLabel49.Caption := QRLabel94.Caption;

    //NOSSO NUMERO
    wstrAux := '';

    wstrAux := RMaskCGC_CPF(QRBloquetoCARTEIRA.Text,2) + wstrNossoNumero;

    Insert('/',wstrAux,3);
    Insert('-',wstrAux, Length(wstrAux));
    QRLabel54.Caption := wstrAux;
    QRLabel104.Caption := QRLabel54.Caption;
    QRLabel108.Caption := QRLabel54.Caption;

    QRLabel64.Caption := wstrLinhaDigitavel;
    Barcode1.Digits := wstrCodBarras;
    Barcode1.BarcodeCopy;
    QRImage3.Picture.Assign(ClipBoard);
  End;
end;

procedure TFRBloqueto_Uniprime.QRBand2AfterPrint(Sender: TQRCustomBand;
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
        QRBloquetoPeriodo.SetVariable('DT_FINAL',Trim(FContasReceberParam.ME36DtFinal.Text) + ' 23:59:59');
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

      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      raise exception.Create('Erro ao tentar gravar Nosso Numero no Contas a Receber!');
    end;
  end;
  end;
end;

end.
