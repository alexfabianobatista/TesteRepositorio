unit URBloqueto_HSBC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Barcode;

type
  TFRBloqueto_HSBC = class(TForm)
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
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText27: TQRDBText;
    QRLabel67: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel70: TQRLabel;
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
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel71: TQRLabel;
    QRMemo2: TQRMemo;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRShape37: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel99: TQRLabel;
    QRImage1: TQRImage;
    QRImage4: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel35: TQRLabel;
    QRLabel63: TQRLabel;
    QRShape16: TQRShape;
    QRLabel65: TQRLabel;
    QRLCarteira2: TQRLabel;
    QRShape55: TQRShape;
    QRLabel72: TQRLabel;
    QRLCarteira: TQRLabel;
    QRShape34: TQRShape;
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
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel100: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel101: TQRLabel;
    QRDBText13: TQRDBText;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRLabel102: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel104: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel105: TQRLabel;
    QRMemo3: TQRMemo;
    QRDBText32: TQRDBText;
    QRDBText35: TQRDBText;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRImage2: TQRImage;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRLCarteira1: TQRLabel;
    QRShape56: TQRShape;
    QRLabel42: TQRLabel;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRLabel113: TQRLabel;
    QRMemo1: TQRMemo;
    QRDBText47: TQRDBText;
    QRLabel114: TQRLabel;
    QRDBText48: TQRDBText;
    QRLabel115: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    function DVMod10(wS:String):String;
    function FatorVenc():String;
    function DACMod11(wS:String):String;
    function RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
    function intdecimais(wValor :String; wTamanho, wDecimais:integer): String;
  public
    { Public declarations }
  end;

var
  FRBloqueto_HSBC: TFRBloqueto_HSBC;

implementation

uses UContasReceber_cl, USequencia_cl, UOracle_cl, UBiblioteca, clipbrd,
  UParamSistema_cl;

{$R *.DFM}

function TFRBloqueto_HSBC.intdecimais(wValor :String; wTamanho, wDecimais:integer): String;
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


function TFRBloqueto_HSBC.RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
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


//-DAC PAGINA 18--------------------------------------------------------------\\
function TFRBloqueto_HSBC.DACMod11(wS:String):String;
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
  If (wNN=0) OR (wNN=1) OR (wNN=10) OR (wNN=11) Then
    Result := '1'
  Else
    Result := IntToStr(wNN);
End;


function TFRBloqueto_HSBC.FatorVenc():String;
Begin
  Result := FloatToStr(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value - StrToDate('07/10/1997') );
End;


//-DIGITO VERIFICADOR MODULO 10-----------------------------------------------\\
function TFRBloqueto_HSBC.DVMod10(wS:String):String;
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


procedure TFRBloqueto_HSBC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
  FRBloqueto_HSBC := nil;
end;


procedure TFRBloqueto_HSBC.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  wLinhaDig, wAux : String;
  wCampoLivre, wNN, wDVGeral, wDigito : String;
  wNossoNumero : real;
begin
  wAux := '';
  wDVGeral := '';
  wCampoLivre := '';
  wNN := '';
  wLinhaDig := '';

  With DMContasReceber do
  Begin
  if QRBloquetoNOSSO_NUMERO.Text = '' then
  Begin
    try
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'BOAVISTA' Then   // aqui é para bloqueto "CNR" COBRANCA NAO REGISTRADA
          QRBloquetonosso_numero_seq.Value:= StrToInt(RMaskCGC_CPF( Trim(QRBloquetoNUM_TITUlO.Text),6) + RMaskCGC_CPF( Trim(QRBloquetoNUM_PARCELA.Text),2))
       Else
       Begin
          QRBloquetonosso_numero_seq.Value:= DMSequencia.Sequencia(Trunc(1),'NossoNumero_HSBC');
          if QRBloquetonosso_numero_seq.Value >= 99999 then
          begin
            MessageDlg('Sequência Nosso Número deve ser inicializada, sequência atingiu valor máximo!!!',mtWarning,[mbOk],0);
            QRPrimario.QRPrinter.Cancel;
            Exit;
          end;
       End;
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'BOAVISTA' Then   // aqui é para bloqueto "CNR" COBRANCA NAO REGISTRADA
       Begin
         wNN := RMaskCGC_CPF( Trim(QRBloquetonosso_numero_seq.Text),13 );
         wDigito := Bib.DigitoVerificadorHSBC1(wNN);
         wNN := wNN + wDigito + '4';
         wDigito := Bib.DigitoVerificadorHSBC1(IntToStr(StrToInt(wNN) + StrToInt(QRBloquetoCODIGO_CEDENTE.Text) + StrToInt(FormatDateTime('DDMMYY', QRBloquetoDt_Vencimento.Value))));
         wNN := wNN + wDigito;
       End
      Else
       Begin
         wNN := RMaskCGC_CPF( Trim(QRBloquetoCODIGO_CEDENTE.Text),5 )                  +
                RMaskCGC_CPF( Trim(QRBloquetonosso_numero_seq.Text),5 );
         wNN := wNN + Bib.DigitoVerificadorHSBC(wNN);
       End;
      //-CODIGO DE BARRAS-----------------------------------------------------\\
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'BOAVISTA' Then   // aqui é para bloqueto "CNR" COBRANCA NAO REGISTRADA
       Begin
         wDVGeral := '3999' + FatorVenc()                                          +
         intdecimais( Trim(QRBloquetoVAL_TITULO.Text),10,2 )                       +
         RMaskCGC_CPF( Trim(QRBloquetoCODIGO_CEDENTE.Text),7)                      +
         RMaskCGC_CPF( Trim(QRBloquetonosso_numero_seq.Text),13 )                  +
         RMaskCGC_CPF(IntToStr(Bib.DiaAno(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value)),3) +
         Copy(FormatDateTime('YYYY',DMContasReceber.QRBloquetoDT_VENCIMENTO.Value),4,1) + '2';
         Insert(DACMod11(wDVGeral), wDVGeral, 5);
         Barcode1.Digits := wDVGeral;
         Barcode1.BarcodeCopy;
         QRImage3.Picture.Assign(ClipBoard);
       End
      Else
       Begin
         wDVGeral := '3999' + FatorVenc()                                          +
         intdecimais( Trim(QRBloquetoVAL_TITULO.Text),10,2 ) + wNN                 +
         RMaskCGC_CPF( Trim(QRBloquetoCOD_AGENCIA.Text),4)                         +
         RMaskCGC_CPF( Trim(QRBloquetoNUM_CONTA_CORRENTE.Text),7) + '001'          ;
         Insert(DACMod11(wDVGeral), wDVGeral, 5);
         Barcode1.Digits := wDVGeral;
         Barcode1.BarcodeCopy;
         QRImage3.Picture.Assign(ClipBoard);
       End;

      //-LINHA DIGITAVEL------------------------------------------------------\\
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'BOAVISTA' Then   // aqui é para bloqueto "CNR" COBRANCA NAO REGISTRADA
       Begin
         wAux := '3999' + Copy(QRBloquetoCODIGO_CEDENTE.Text,1,5);
         wAux := wAux + DVMod10(wAux);
         wLinhaDig := wLinhaDig + wAux + ' ';
         Insert('.',wLinhaDig,6);

         wAux := Copy(QRBloquetoCODIGO_CEDENTE.Text,6,2) + Copy(wNN,1,08);
         wAux := wAux + DVMod10(wAux);
         wLinhaDig := wLinhaDig + wAux + ' ';
         Insert('.',wLinhaDig,18);

         wAux := Copy(wNN,9,05) + RMaskCGC_CPF(IntToStr(Bib.DiaAno(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value)),3);
         wAux := wAux + Copy(FormatDateTime('YYYY',DMContasReceber.QRBloquetoDT_VENCIMENTO.Value),4,1) + '2';
         wAux := wAux + DVMod10(wAux);
         wLinhaDig := wLinhaDig + wAux + ' ';
         Insert('.',wLinhaDig,31);

         wLinhaDig := wLinhaDig + Copy(wDVGeral,5,1) + ' ';
         wLinhaDig := wLinhaDig + FatorVenc() + intdecimais( Trim(QRBloquetoVAL_TITULO.Text),10,2);

         QRLabel64.Caption := wLinhaDig;
       End
      Else
       Begin
         wAux := '3999' + Copy(wNN,1,5);
         wAux := wAux + DVMod10(wAux);
         wLinhaDig := wLinhaDig + wAux + ' ';
         Insert('.',wLinhaDig,6);

         wAux := Copy(wNN,6,11) + RMaskCGC_CPF( Trim(QRBloquetoCOD_AGENCIA.Text),4);
         wAux := wAux + DVMod10(wAux);
         wLinhaDig := wLinhaDig + wAux + ' ';
         Insert('.',wLinhaDig,18);

         wAux := RMaskCGC_CPF( Trim(QRBloquetoNUM_CONTA_CORRENTE.Text),7) + '00' + '1';
         wAux := wAux + DVMod10(wAux);
         wLinhaDig := wLinhaDig + wAux + ' ';
         Insert('.',wLinhaDig,31);

         wLinhaDig := wLinhaDig + Copy(wDVGeral,5,1) + ' ';
         wLinhaDig := wLinhaDig + FatorVenc() + intdecimais( Trim(QRBloquetoVAL_TITULO.Text),10,2);

         QRLabel64.Caption := wLinhaDig;
       End;
      //-AGENCIA/CEDENTE------------------------------------------------------\\
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'BOAVISTA' Then   // aqui é para bloqueto "CNR" COBRANCA NAO REGISTRADA
         wAux := RMaskCGC_CPF( Trim(QRBloquetoCODIGO_CEDENTE.Text),5)
      Else
         wAux := RMaskCGC_CPF( Trim(QRBloquetoCOD_AGENCIA.Text),4) + '-' +
                 RMaskCGC_CPF( Trim(QRBloquetoCOD_AGENCIA.Text),4) +
                 RMaskCGC_CPF( Trim(QRBloquetoNUM_CONTA_CORRENTE.Text),5);
      QRLabel25.Caption := wAux;
      QRLabel59.Caption := wAux;
      QRLabel96.Caption := wAux;

      //-NOSSO NUMERO---------------------------------------------------------\\
      wAux := wNN;
      //Insert('/', wAux, 3);
      //Insert('-', wAux, 10);
      QRLabel71.Caption := wAux;
      QRLabel70.Caption := wAux;
      QRLabel105.Caption := wAux;

      //-INSTRUCOES DE PAGAMENTO----------------------------------------------\\
      wAux := '';
      QRMemo1.Lines.Clear;
      If(DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.Value <> 0)Then
      Begin
//        If(Trim(DMContasReceber.QRBloquetoIND_TIPO_JURO.Text) = 'VALOR')Then             //SERGIO ADICIONADO 20/02/2003
//        Begin
          QRMemo1.Lines.Add(DMContasReceber.QRBloquetoinstrucao_juro.Text);
//        End
//        Else
//        Begin
//          QRMemo1.Lines.Add('Juro diário de R$ ' + FormatFloat('###,##0.00',
//          ( DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.value / DMoracle.DiasNoMes(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value) * DMContasReceber.QRBloquetoVAL_TITULO.Value / 100) )
//          + ' por atraso de Pgto.');
//        End
      End;

      //QRMemo1.Lines.Add('JUROS DE R$ ' +wAux+ ' AO DIA APÓS VENCIMENTO');

      QRMemo1.Lines.Append( Trim(DMContasReceber.QRBloquetoDESC_INSTRUCAO_BLOQUETO.Text));
      QRMemo2.Lines := QRMemo1.Lines;
      QRMemo3.Lines := QRMemo1.Lines;

      //-DATAS----------------------------------------------------------------\\
      wAux := FormatDateTime('DD/MM/YYYY', QRBloquetoDT_EMISSAO.Value);
      QRLabel31.Caption := wAux;
      QRLabel8.Caption := wAux;
      QRLabel108.Caption := wAux;
      wAux := FormatDateTime('DD/MM/YYYY', Date);
      QRLabel32.Caption := wAux;
      QRLabel1.Caption := wAux;
      QRLabel109.Caption := wAux;
    except
      on E : Exception do
        ShowMessage(E.Message);
   end;
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
  end   
  else//COPIA DO BLOQUETO MARCOS 13/05/2005
    begin

      wNossoNumero := StrToFloat(QRBloquetoNOSSO_NUMERO.Value);

      //-CODIGO DE BARRAS-----------------------------------------------------\\
      wDVGeral := '3999' + FatorVenc()                                          +
      intdecimais( Trim(QRBloquetoVAL_TITULO.Text),10,2 ) + Bib.StrZero(FloatToStr(wNossoNumero),11)        +
      RMaskCGC_CPF( Trim(QRBloquetoCOD_AGENCIA.Text),4)                         +
      RMaskCGC_CPF( Trim(QRBloquetoNUM_CONTA_CORRENTE.Text),7) + '001'          ;
      Insert(DACMod11(wDVGeral), wDVGeral, 5);
      Barcode1.Digits := wDVGeral;
      Barcode1.BarcodeCopy;
      QRImage3.Picture.Assign(ClipBoard);

      //-LINHA DIGITAVEL------------------------------------------------------\\
      wAux := '3999' + Copy(Bib.StrZero(FloatToStr(wNossoNumero),11),1,5);
      wAux := wAux + DVMod10(wAux);
      wLinhaDig := wLinhaDig + wAux + ' ';
      Insert('.',wLinhaDig,6);

      wAux := Copy(Bib.StrZero(FloatToStr(wNossoNumero),11),6,11) + RMaskCGC_CPF( Trim(QRBloquetoCOD_AGENCIA.Text),4);
      wAux := wAux + DVMod10(wAux);
      wLinhaDig := wLinhaDig + wAux + ' ';
      Insert('.',wLinhaDig,18);

      wAux := RMaskCGC_CPF( Trim(QRBloquetoNUM_CONTA_CORRENTE.Text),7) + '00' + '1';
      wAux := wAux + DVMod10(wAux);
      wLinhaDig := wLinhaDig + wAux + ' ';
      Insert('.',wLinhaDig,31);

      wLinhaDig := wLinhaDig + Copy(wDVGeral,5,1) + ' ';
      wLinhaDig := wLinhaDig + FatorVenc() + intdecimais( Trim(QRBloquetoVAL_TITULO.Text),10,2);

      QRLabel64.Caption := wLinhaDig;

      //-AGENCIA/CEDENTE------------------------------------------------------\\
      wAux := RMaskCGC_CPF( Trim(QRBloquetoCOD_AGENCIA.Text),4) + '-' +
              RMaskCGC_CPF( Trim(QRBloquetoCOD_AGENCIA.Text),4) +
              RMaskCGC_CPF( Trim(QRBloquetoNUM_CONTA_CORRENTE.Text),5);
      QRLabel25.Caption := wAux;
      QRLabel59.Caption := wAux;
      QRLabel96.Caption := wAux;

      //-NOSSO NUMERO---------------------------------------------------------\\
      wAux := FloatToStr(wNossoNumero);
      //Insert('/', wAux, 3);
      //Insert('-', wAux, 10);
      QRLabel71.Caption := wAux;
      QRLabel70.Caption := wAux;
      QRLabel105.Caption := wAux;

      //-INSTRUCOES DE PAGAMENTO----------------------------------------------\\
      wAux := '';
      QRMemo1.Lines.Clear;
      If(DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.Value <> 0)Then
      Begin
//        If(Trim(DMContasReceber.QRBloquetoIND_TIPO_JURO.Text) = 'VALOR')Then             //SERGIO ADICIONADO 20/02/2003
//        Begin
          QRMemo1.Lines.Add(DMContasReceber.QRBloquetoinstrucao_juro.Text);
//        End
//        Else
//        Begin
//          QRMemo1.Lines.Add('Juro diário de R$ ' + FormatFloat('###,##0.00',
//          ( DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.value / DMoracle.DiasNoMes(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value) * DMContasReceber.QRBloquetoVAL_TITULO.Value / 100) )
//          + ' por atraso de Pgto.');
//        End
      End;

      //QRMemo1.Lines.Add('JUROS DE R$ ' +wAux+ ' AO DIA APÓS VENCIMENTO');

      QRMemo1.Lines.Append( Trim(DMContasReceber.QRBloquetoDESC_INSTRUCAO_BLOQUETO.Text));
      QRMemo2.Lines := QRMemo1.Lines;
      QRMemo3.Lines := QRMemo1.Lines;

      //-DATAS----------------------------------------------------------------\\
      wAux := FormatDateTime('DD/MM/YYYY', QRBloquetoDT_EMISSAO.Value);
      QRLabel31.Caption := wAux;
      QRLabel8.Caption := wAux;
      QRLabel108.Caption := wAux;
      wAux := FormatDateTime('DD/MM/YYYY', Date);
      QRLabel32.Caption := wAux;
      QRLabel1.Caption := wAux;
      QRLabel109.Caption := wAux;

//fim copia bloqueto
  End;
END;
end;

end.
