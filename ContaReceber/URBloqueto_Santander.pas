unit URBloqueto_Santander;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Barcode, QRPDFFilt;

type
  TFRBloqueto_Santander = class(TForm)
    QRPrimario: TQuickRep;
    DetailBand1: TQRBand;
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
    QRShape35: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    LocalPagamento1: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    Vencimento3: TQRDBText;
    QRDBText6: TQRDBText;
    Num_Digitavel: TQRLabel;
    QRLabel26: TQRDBText;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRImage1: TQRImage;
    LabelBanco3: TQRLabel;
    NomePessoa: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText9: TQRDBText;
    Logo1: TQRImage;
    QRLabel37: TQRLabel;
    QRShape1: TQRShape;
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
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    LocalPagamento2: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel73: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel77: TQRLabel;
    Logo2: TQRImage;
    QRShape24: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRSysData6: TQRSysData;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel114: TQRLabel;
    QRDBText18: TQRDBText;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRLabel118: TQRLabel;
    Logo3: TQRImage;
    Especie3: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText38: TQRDBText;
    LocalPagamento3: TQRLabel;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    Barcode1: TBarcode;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRShape2: TQRShape;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText33: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRLabel66: TQRLabel;
    QRDBText43: TQRDBText;
    QRLabel67: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel69: TQRLabel;
    QRDBText44: TQRDBText;
    QRLabel68: TQRLabel;
    QRDBText45: TQRDBText;
    QRLabel75: TQRLabel;
    QRDBText46: TQRDBText;
    QRLabel76: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText59: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
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
  FRBloqueto_Santander: TFRBloqueto_Santander;

implementation

uses UContasReceber_cl, USequencia_cl, UBiblioteca, clipbrd, UOracle_cl,
  UParamSistema_cl, UFilial_cl, DB;

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

function TFRBloqueto_SANTANDER.DACMod11(wS:String):String;
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

function TFRBloqueto_SANTANDER.DACMod11NN(wS:String):String;
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

function TFRBloqueto_Santander.FatorVenc():String;
Begin
  if DMContasReceber.QRBloquetoDT_VENCIMENTO.Value > StrToDate('22/02/2025') then  // Em 22/02/2025 o fator de vcto zerá resetado para inicial 1000
    Result := FloatToStr(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value - StrToDate('29/05/2022') )
  else
    Result := FloatToStr(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value - StrToDate('07/10/1997') );
End;

//-DIGITO VERIFICADOR MODULO 10-----------------------------------------------\\
function TFRBloqueto_Santander.DVMod10(wS:String):String;
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

procedure TFRBloqueto_Santander.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
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
      DMSequencia.Sequencia(QRBloquetoCOD_FILIAL.Value,'NossoNumeroSANTANDER');
      if QRBloquetonosso_numero_seq.Value >= 99999999 then
        begin
          MessageDlg('Sequência Nosso Número deve ser inicializada, sequência atingiu valor máximo!!!',mtWarning,[mbOk],0);
          QRPrimario.QRPrinter.Cancel;
          Exit;
        end;

//NOSSO NUMERO------------------------------------------------------\\
    wNN1 := Bib.StrZero(QRBloquetonosso_numero_seq.Text,12);
    wNN1:= wNN1 + DACMod11NN(wNN1);
    QRLabel51.Caption := wNN1;
    QRLabel61.Caption := wNN1;
    QRLabel62.Caption := wNN1;

//Digito Verificador CODIGO DE BARRAS-----------------------------------------\\

    WDVGeral := '0339'  + FatorVenc()                                         +
    intdecimais(Bib.StrZero(QRBloquetoVAL_TITULO.Text,10),10,2) + '9'         +
    RMaskCGC_CPF(QRBloquetoCODIGO_CEDENTE.Text,6)                             + 
    RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text,1)                 +
    Bib.StrZero(wNN1,13)                                                      +
    '0' + '101';
    wDVGeral:= DACMod11(wDVGeral);
//    showMessage(RMaskCGC_CPF(QRBloquetoCODIGO_CEDENTE.Text,6));
//******************************************************************************
//      ROTINAS PARA FORMAR A REPRESENTAÇAO NUMERICA DO CODIGO DE BARRAS
//******************************************************************************

    wAux := '';

//digito verificador campo 1
    wNN := copy(QRBloquetoCODIGO_CEDENTE.Text,1,3);
    if DMParamSistema.CodEmpresa = 'DONABENTA' then
      wNN := '03399' + '0' + copy(bib.strzero(QRBloquetoCODIGO_CEDENTE.Text,3),1,3)
    else
      wNN := '03399' + copy(bib.strzero(QRBloquetoCODIGO_CEDENTE.Text,4),1,4);
    wNN := DVMod10(wNN);

    if DMParamSistema.CodEmpresa = 'DONABENTA' then //Código do cendente tem o zero a esquerda que o oracle não deixa gravar. Junior 19/07/2023
      wAux:= '03399' + '0' + copy(QRBloquetoCODIGO_CEDENTE.Text,1,3)
    else
      wAux:= '03399' + copy(bib.strzero(QRBloquetoCODIGO_CEDENTE.Text,4),1,4);

    wAux := wAux + wNN;
    wLinhaDig := wLinhaDig + wAux + ' ';
    Insert('.',wLinhaDig,10);

//digito verificador campo2                         
    wNN := '';
    if DMParamSistema.CodEmpresa = 'DONABENTA' then
      wNN := copy(QRBloquetoCODIGO_CEDENTE.Text,4,2) + QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text + copy(wNN1,1,7)
    else
      wNN := copy(QRBloquetoCODIGO_CEDENTE.Text,5,2) + QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text + copy(wNN1,1,7);
    wNN := DVMod10(wNN);

    if DMParamSistema.CodEmpresa = 'DONABENTA' then //Código do cendente tem o zero a esquerda que o oracle não deixa gravar. Junior 19/07/2023
      wAux:= copy(QRBloquetoCODIGO_CEDENTE.Text,4,2) + copy(QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text,1,1)
    else
      wAux:= copy(QRBloquetoCODIGO_CEDENTE.Text,5,2) + copy(QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text,1,1);
    wAux:= wAux + copy(wNN1,1,7);
    wAux := wAux + wNN;
    wLinhaDig := wLinhaDig + wAux + ' ';
    Insert('.',wLinhaDig,23);

//digito verificador campo3
    wNN := '';
    wNN := copy(wNN1,8,6) + '0101';
    wNN := DVMod10(wNN);

    wAux := copy(wNN1,8,6) + '0101';
    wAux := wAux + wNN;
    wLinhaDig := wLinhaDig + wAux + ' ';
    Insert('.',wLinhaDig,36);

//digito verificador campo4
    wLinhaDig := wLinhaDig + wDVGeral + ' ';

//digito verificador campo5
    wLinhaDig := wLinhaDig + FatorVenc() + intdecimais(Bib.StrZero(QRBloquetoVAL_TITULO.Text,10),10,2);
    Num_Digitavel.Caption := wLinhaDig;

//CODIGO DE BARRAS
    wCodBarra := '0339' + wDVGeral + FatorVenc()                              +
    intdecimais(Bib.StrZero(QRBloquetoVAL_TITULO.Text,10),10,2) + '9'         +
    RMaskCGC_CPF(QRBloquetoCODIGO_CEDENTE.Text,6)                             + 
    RMaskCGC_CPF(Bib.StrZero(QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text,1),1)  +
    Bib.StrZero(wNN1,13)                                                      +
    '0' + '101';
    Barcode1.Digits := wCodBarra;
    Barcode1.BarcodeCopy;
    QRImage1.Picture.Assign(ClipBoard);

  //-AGENCIA/CEDENTE------------------------------------------------------\\
    QRLabel24.Caption := RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4) + '-' + RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text,1) +
                         '/' + QRBloquetoCODIGO_CEDENTE.Text + QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text;
    QRLabel28.Caption := QRLabel24.Caption;
    QRLabel29.Caption := QRLabel24.Caption;

    QRMemo1.Lines.Clear;
    If(DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.Value <> 0)Then
      QRMemo1.Lines.Add(DMContasReceber.QRBloquetoinstrucao_juro.Text);

    QRMemo1.Lines.Append(Trim(DMContasReceber.QRBloquetoDESC_INSTRUCAO_BLOQUETO.Text));
    QRMemo2.Lines := QRMemo1.Lines;
    QRMemo3.Lines := QRMemo1.Lines;

    QRLabel67.Caption := QRBloquetoDT_EMISSAO.Text;
    QRLabel69.Caption := QRBloquetoDT_EMISSAO.Text;
    QRLabel74.Caption := QRBloquetoDT_EMISSAO.Text;

    QRLabel78.Caption := QRBloquetoPERC_JURO_BLOQUETO.Text + '/' + IntToStr(trunc(QRBloquetoVAL_MULTA.Value));
    QRLabel82.Caption := QRBloquetoPERC_JURO_BLOQUETO.Text + '/' + IntToStr(trunc(QRBloquetoVAL_MULTA.Value));
    QRLabel92.Caption := QRBloquetoPERC_JURO_BLOQUETO.Text + '/' + IntToStr(trunc(QRBloquetoVAL_MULTA.Value));

  except
    on E : Exception do
      ShowMessage(E.Message);
  end;
  try
      If DMOracle.DBCemapa.InTransaction = False then
         DMOracle.DBCemapa.StartTransaction;
      QAtuBloq.Close;
      QAtuBloq.SetVariable('NUMERO', Bib.StrZero(wNN1,13));
      QAtuBloq.SetVariable('COD_CONTA_RECEBER_CAB',QRBloquetoCOD_CONTA_RECEBER_CAB.Value);
      QAtuBloq.ExecSQL;
      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      raise exception.Create('Erro ao tentar gravar Nosso Numero no Contas a Receber!');
    end;
  end
  else
    Begin //########### COPIA DO BLOQUETO MARCOS 14/05/2005 ####################

//NOSSO NUMERO------------------------------------------------------\\
    QRLabel51.Caption := Bib.StrZero(QRBloquetoNOSSO_NUMERO.Text,13);
    QRLabel61.Caption := Bib.StrZero(QRBloquetoNOSSO_NUMERO.Text,13);
    QRLabel62.Caption := Bib.StrZero(QRBloquetoNOSSO_NUMERO.Text,13);
    wNN1 := Bib.StrZero(QRBloquetoNOSSO_NUMERO.Text,13);
//Digito Verificador CODIGO DE BARRAS-----------------------------------------------------\\

    WDVGeral := '0339'  + FatorVenc()                                         +
    intdecimais(Bib.StrZero(QRBloquetoVAL_TITULO.Text,10),10,2) + '9'         +
    RMaskCGC_CPF(QRBloquetoCODIGO_CEDENTE.Text,6)                             +
    RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text,1)                 +
    Bib.StrZero(wNN1,13)                                                      +
    '0' + '101';
    wDVGeral:= DACMod11(wDVGeral);

//******************************************************************************
//COPIA BOLETO - ROTINAS PARA FORMAR A REPRESENTAÇAO NUMERICA DO CODIGO DE BARRAS
//******************************************************************************

    wAux := '';

//digito verificador campo 1
    wNN := copy(QRBloquetoCODIGO_CEDENTE.Text,1,3);
    if DMParamSistema.CodEmpresa = 'DONABENTA' then
      wNN := '03399' + '0' + copy(bib.strzero(QRBloquetoCODIGO_CEDENTE.Text,3),1,3)
    else
      wNN := '03399' + copy(bib.strzero(QRBloquetoCODIGO_CEDENTE.Text,4),1,4);
    wNN := DVMod10(wNN);

    if DMParamSistema.CodEmpresa = 'DONABENTA' then
      wAux:= '03399' + '0' + copy(QRBloquetoCODIGO_CEDENTE.Text,1,3)
    else
      wAux:= '03399' + copy(bib.strzero(QRBloquetoCODIGO_CEDENTE.Text,4),1,4);
    wAux := wAux + wNN;
    wLinhaDig := wLinhaDig + wAux + ' ';
    Insert('.',wLinhaDig,10);

//digito verificador campo2

    wNN := '';
    if DMParamSistema.CodEmpresa = 'DONABENTA' then
      wNN := copy(QRBloquetoCODIGO_CEDENTE.Text,4,2) + QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text + copy(wNN1,1,7)
    else
      wNN := copy(QRBloquetoCODIGO_CEDENTE.Text,5,2) + QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text + copy(wNN1,1,7);
    wNN := DVMod10(wNN);

    if DMParamSistema.CodEmpresa = 'DONABENTA' then
      wAux := copy(QRBloquetoCODIGO_CEDENTE.Text,4,2) + copy(QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text,1,1)
    else
      wAux:= copy(QRBloquetoCODIGO_CEDENTE.Text,5,2) + copy(QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text,1,1);
    wAux:= wAux + copy(wNN1,1,7);
    wAux := wAux + wNN;
    wLinhaDig := wLinhaDig + wAux + ' ';
    Insert('.',wLinhaDig,23);

//digito verificador campo3

    wNN := '';
    wNN := copy(wNN1,8,6) + '0101';
    wNN := DVMod10(wNN);

    wAux := copy(wNN1,8,6) + '0101';
    wAux := wAux + wNN;
    wLinhaDig := wLinhaDig + wAux + ' ';
    Insert('.',wLinhaDig,36);

//digito verificador campo4

    wLinhaDig := wLinhaDig + wDVGeral + ' ';

//digito verificador campo5

    wLinhaDig := wLinhaDig + FatorVenc() + intdecimais(Bib.StrZero(QRBloquetoVAL_TITULO.Text,10),10,2);
    Num_Digitavel.Caption := wLinhaDig;

//CODIGO DE BARRAS
    
    wCodBarra := '0339' + wDVGeral + FatorVenc()                              +
    intdecimais(Bib.StrZero(QRBloquetoVAL_TITULO.Text,10),10,2) + '9'         +
    RMaskCGC_CPF(Bib.StrZero(QRBloquetoCODIGO_CEDENTE.Text,6),6)              +
    RMaskCGC_CPF(Bib.StrZero(QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text,1),1)  +
    Bib.StrZero(QRBloquetoNOSSO_NUMERO.Text,13)                               +
    '0' + '101';
    Barcode1.Digits := wCodBarra;
    Barcode1.BarcodeCopy;
    QRImage1.Picture.Assign(ClipBoard);

  //-AGENCIA/CEDENTE------------------------------------------------------\\

    QRLabel24.Caption := RMaskCGC_CPF(QRBloquetoCOD_AGENCIA.Text,4) + '-' + RMaskCGC_CPF(QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Text,1) +
                         '/' + QRBloquetoCODIGO_CEDENTE.Text + '-' + QRBloquetoDIGITO_VERIFICADOR_CEDENTE.Text;
    QRLabel28.Caption := QRLabel24.Caption;
    QRLabel29.Caption := QRLabel24.Caption;

    QRLabel78.Caption := QRBloquetoPERC_JURO_BLOQUETO.Text + '/' + IntToStr(trunc(QRBloquetoVAL_MULTA.Value));
    QRLabel82.Caption := QRBloquetoPERC_JURO_BLOQUETO.Text + '/' + IntToStr(trunc(QRBloquetoVAL_MULTA.Value));
    QRLabel92.Caption := QRBloquetoPERC_JURO_BLOQUETO.Text + '/' + IntToStr(trunc(QRBloquetoVAL_MULTA.Value));

    QRMemo1.Lines.Clear;
    If(DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.Value <> 0)Then
      QRMemo1.Lines.Add(DMContasReceber.QRBloquetoinstrucao_juro.Text);

    QRMemo1.Lines.Append(Trim(DMContasReceber.QRBloquetoDESC_INSTRUCAO_BLOQUETO.Text));
    QRMemo2.Lines := QRMemo1.Lines;
    QRMemo3.Lines := QRMemo1.Lines;

    QRLabel67.Caption := QRBloquetoDT_EMISSAO.Text;
    QRLabel69.Caption := QRBloquetoDT_EMISSAO.Text;
    QRLabel74.Caption := QRBloquetoDT_EMISSAO.Text;

    end;
end;
end;
end.
