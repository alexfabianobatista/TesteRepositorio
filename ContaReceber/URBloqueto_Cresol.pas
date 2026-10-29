unit URBloqueto_Cresol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, Barcode, ExtCtrls, jpeg, QRPDFFilt;

type
  TFRBloqueto_Cresol = class(TForm)
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
    QRLabel57: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
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
    QRDBText29: TQRDBText;
    QRLabel104: TQRLabel;
    QRMemo1: TQRMemo;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRLabel1: TQRLabel;
    QRImage3: TQRImage;
    QRShape56: TQRShape;
    QRDBText5: TQRDBText;
    QRShape57: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel121: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel122: TQRLabel;
    QRShape37: TQRShape;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel73: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel56: TQRLabel;
    QRSysData6: TQRSysData;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape15: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel70: TQRLabel;
    QRMemo2: TQRMemo;
    QRDBText26: TQRDBText;
    QRDBText31: TQRDBText;
    QRShape10: TQRShape;
    QRImage4: TQRImage;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape11: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel79: TQRLabel;
    QRDBText40: TQRDBText;
    QRLabel87: TQRLabel;
    QRDBText44: TQRDBText;
    QRShape16: TQRShape;
    QRLabel78: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText32: TQRDBText;
    QRShape18: TQRShape;
    QRLabel65: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel81: TQRLabel;
    QRImage6: TQRImage;
    QRImage2: TQRImage;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRShape26: TQRShape;
    QRMemo3: TQRMemo;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    QRDBText14: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText20: TQRDBText;
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
  FRBloqueto_Cresol: TFRBloqueto_Cresol;

implementation

uses UContasReceber_cl, USequencia_cl, UOracle_cl, clipbrd,
  UBiblioteca,Mask, URBloquetoSafra, UParamSistema_cl, UContasReceberParam,
  DB;

{$R *.DFM}

function TFRBloqueto_Cresol.RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
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


Function TFRBloqueto_Cresol.Intdecimais(wValor :String; wTamanho, wDecimais:integer): String;
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


function TFRBloqueto_Cresol.CalculaDVNN(wstrNumeros:String):String;
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
  // Modificado por Djeison - 26/07/2013
//  wintDV := wintDV div 11;
//
//  wintDV := 11 - (wintDV Mod 11);
  wintDV := (wintDV * 10) mod 11;
  Case wintDV of
    10: wstrNumeros := 'P';
    11: wstrNumeros := '0';
  Else
    wstrNumeros := IntToStr(wintDV);
  End;
  Result := wstrNumeros;
End;

function TFRBloqueto_Cresol.DACMod11(wS:String):String;
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

function TFRBloqueto_Cresol.CalculaDVMod10(wstrCampo: String):String;
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


function TFRBloqueto_Cresol.FatorVenc():String;
Begin
  if DMContasReceber.QRBloquetoDT_VENCIMENTO.Value > StrToDate('22/02/2025') then  // Em 22/02/2025 o fator de vcto zerá resetado para inicial 1000
    Result := FloatToStr(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value - StrToDate('29/05/2022') )
  else
    Result := FloatToStr(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value - StrToDate('07/10/1997') );
End;

procedure TFRBloqueto_Cresol.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
  FRBloqueto_Cresol := nil;
end;

procedure TFRBloqueto_Cresol.QRBand2BeforePrint(Sender: TQRCustomBand;
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
  wstrNossoNumero := '';
  wstrCampoLivre := '';
  wstrCodBarras := '';
  wstrLinhaDigitavel := '';
  wstrAux := '';

  With DMContasReceber do
  Begin
    If (QRBloquetoPERC_DESCONTO.Value > 0) and (DMParamSistema.CodEmpresa <> 'TOMATESMI') Then
     Begin
       wDesconto := ((QRBloquetoVAL_TITULO.Value * QRBloquetoPERC_DESCONTO.Value) / 100);
       QRLabel121.Caption := FormatFloat('#,##0.00',wDesconto);
       QRLabel73.Caption := FormatFloat('#,##0.00',wDesconto);
       //QRLabel123.Caption := FormatFloat('#,##0.00',wDesconto);
     end
    else
    Begin
      QRLabel121.Caption := '';
      QRLabel73.Caption := '';
      //QRLabel123.Caption := '';
    end;
    
    if QRBloquetoNOSSO_NUMERO.Text = '' then
    Begin
        wNossoNumero := IntToStr(DMSequencia.Sequencia(QRBloquetoCOD_FILIAL.Value,'NossoNumero_Cresol'));
      if QRBloquetonosso_numero_seq.Value > 2773100 then //A princípio esse valor é só para a Diniz, se implantar mais clientes, tem que controlar. Vanessa 03/06/2019
      begin
        MessageDlg('Sequência Nosso Número deve ser inicializada, sequencia atingiu valor maximo!',mtWarning,[mbOk],0);
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
      wstrNossoNumero := wstrNossoNumero + CalculaDVNN(QRBloquetoCARTEIRA.Text + wstrNossoNumero)
    end
    else
    Begin
      wNN := Copy(QRBloquetoNOSSO_NUMERO.Value, 1, QRBloquetoNOSSO_NUMERO.Size);

      wstrCampoLivre := RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4)                  +
                        RMaskCGC_CPF(QRBloquetoCARTEIRA.Text,2)                     +
                        copy(Bib.StrZero(QRBloquetoNOSSO_NUMERO.Text,12),1,11)      +
                        RMaskCGC_CPF(Copy(QRBloquetoNUM_CONTA_CORRENTE.Text,1,7),7) +
                        '0';

      wstrNossoNumero := wNN;
    end;

    wstrCampoLivre := Bib.LimpaString(wstrCampoLivre,'-');
    //wstrCodBarras := '2379' + FatorVenc() + IntDecimais(QRBloquetoVAL_TITULO.Text,10,2) +wstrCampoLivre; //2379 Cresol utilizava Modelo Bradesco para Boletos
    wstrCodBarras := '1339' + FatorVenc() + IntDecimais(QRBloquetoVAL_TITULO.Text,10,2) +wstrCampoLivre; //1339 Cresol Atual.Junior 31/08/2023
    Insert(DACMod11(wstrCodBarras), wstrCodBarras, 5 );

    //LINHA DIGITAVEL
//    wstrAux := '2379' + Copy(wstrCampoLivre,1,5); //2379 Cresol utilizava Modelo Bradesco para Boletos
    wstrAux := '1339' + Copy(wstrCampoLivre,1,5);  //1339 Cresol Atual.Junior 31/08/2023
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
    QRMemo3.Lines.Clear;

    If (QRBloquetoPERC_JURO_BLOQUETO.Value <> 0) Then
      QRMemo1.Lines.Add(QRBloquetoinstrucao_juro.Text);

    QRMemo1.Lines.Append( Trim(QRBloquetoDESC_INSTRUCAO_BLOQUETO.Text));
    QRMemo2.Lines := QRMemo1.Lines;
    QRMemo3.Lines := QRMemo1.Lines;

    // DATA EMISSAO
    QRSysData3.Text := QRBloquetoDT_EMISSAO.Text;

    //agencia/codigo cedente
    QRLabel59.Caption := RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4) + '-' +
                         RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text,1) + '/' +
                         RMaskCGC_CPF(QRBloquetoNUM_CONTA_CORRENTE.Text,6)+ '-'+
                         RMaskCGC_CPF(QRBloquetoDIG_VERIFICADOR_AGENCIA_CONTA.Text,1);
    QRLabel82.Caption := QRLabel59.Caption;
    QRLabel76.Caption := QRLabel59.Caption;

    // NOSSO NUMERO
    wstrAux := '';
    wstrAux := RMaskCGC_CPF(QRBloquetoCARTEIRA.Text,2) + wstrNossoNumero;

    Insert('/',wstrAux,3);
    Insert('-',wstrAux, Length(wstrAux));
    QRLabel104.Caption := wstrAux;
    QRLabel70.Caption := wstrAux;
    QRLabel79.Caption := wstrAux;

    QRLabel64.Caption := wstrLinhaDigitavel;
    QRLabel81.Caption := QRLabel64.Caption;
    Barcode1.Digits := wstrCodBarras;
    Barcode1.BarcodeCopy;
    QRImage3.Picture.Assign(ClipBoard);
  End;
end;

procedure TFRBloqueto_Cresol.QRBand2AfterPrint(Sender: TQRCustomBand;
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
