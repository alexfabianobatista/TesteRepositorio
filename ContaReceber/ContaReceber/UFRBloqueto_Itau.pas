unit UFRBloqueto_Itau;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, jpeg, QuickRpt, ExtCtrls, Barcode, Clipbrd, Db;

type
  TFRBloqueto_Itau = class(TForm)
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
    Barcode1: TBarcode;
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
    QRLabel31: TQRLabel;
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
    QRLabel99: TQRLabel;
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
    DataSource1: TDataSource;
    QRDBText5: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText52: TQRDBText;
    QRLabel106: TQRLabel;
    QRDBText53: TQRDBText;
    QRLabel107: TQRLabel;
    QRDBText54: TQRDBText;
    QRLabel108: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRBloqueto_Itau: TFRBloqueto_Itau;

implementation

uses UContasReceber_cl, UBiblioteca, USequencia_cl, UOracle_cl;
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



//FUNÇAO PARA CALCULO DO DAC DO CODIGO DE BARRA SERGIO 02/08/2002
function DacCampo(wCampo: String):String;
var
  C, DAC, wPrimMult: Integer;
  Valor: array of Integer;
Begin
  DAC := 0;
  wPrimMult := 2;
  SetLength(Valor, Length(wCampo));

  for C := Length(wCampo)-1 downto 0 do
  Begin
    Valor[C] := StrToInt(wCampo[C+1]); //a matriz de inteiros começa em 0
                                       //string começa por 1
    Valor[C] := Valor[C] * wPrimMult;
    If wPrimMult = 1 then
      wPrimMult := 2
    Else
      wPrimMult := 1;

    If Valor[C] < 10 then
      DAC:= DAC + Valor[C]
    Else
      DAC:= DAC + Valor[C] - 9;
  End;

  DAC := 10 - (DAC Mod 10);
  If DAC = 10 then
    Result := '0'
  Else
    Result := IntToStr(DAC);
End;


//********************************************************
// Calculo do DAC Anexo 2 para geraçao do codigo de barras
function DacAnexo2(wS: String):String;
var
  Qtd, C, Mult, Res: Integer;
  Valor: array of integer;
Begin
  Mult := 2;
  Res := 0;
  Qtd := Length(wS);
  SetLength(Valor, Qtd );
  for C := Qtd downto 1 do
  Begin
    Valor[C-1] := StrToInt( wS[C] );
    Valor[C-1] := Valor[C-1] * Mult;
    Res := Valor[C-1] + Res;
    Inc(Mult);
    If Mult > 9 then
      Mult := 2;
  End;
  Res := 11 - (Res mod 11);
  If (Res = 0) or (Res = 1) or (Res = 10) or (Res = 11) then
    Result := '1'
  Else
    Result := IntToStr(Res);
End;



procedure TFRBloqueto_Itau.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  wCampo1, wCampo2, wCampo3, wCodBarra, wCodBarraN, wAux, wDtBase, wNumCC: string;
  wDacAnexo3, wDac2, wDacAnexo4: string;
  wN : Real;

begin
  if DMContasReceber.QRBloquetoNOSSO_NUMERO.Text = '' then
  Begin
  try
    If DMContasReceber.QRBloquetoCARTEIRA.Value = 210 Then
       DMContasReceber.QRBloquetonosso_numero_seq.Value:=
       DMSequencia.Sequencia(Trunc(1),'NOSSO_NUMERO_ITAU210')
    Else
     Begin
       DMContasReceber.QRBloquetonosso_numero_seq.Value:=
       DMSequencia.Sequencia(Trunc(1),'NossoNumero_ITAU');
       If DMContasReceber.QRBloquetonosso_numero_seq.Value >= 100000 then
       begin
         MessageDlg('Sequencia Nosso Número deve ser inicializada, sequencia atingiu valor maximo!!!',mtWarning,[mbOk],0);
         QRPrimario.QRPrinter.Cancel;
         Exit;
       end;
     end;
    wDac2:= '';
    wDacAnexo3 := '';
    wDacAnexo4 := '';
    wAux := '';
    wNumCC := '';
    wNumCC := RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetoNUM_CONTA_CORRENTE.Text),5 );

    If DMContasReceber.QRBloquetoIND_ACEITE.Text = 'SIM' then
    Begin
      QRLabel36.Caption:= 'S';
      QRLabel69.Caption:= 'S';
      QRLabel103.Caption:= 'S';
    End
    Else
    Begin
      QRLabel36.Caption:= 'N';
      QRLabel69.Caption:= 'N';
      QRLabel103.Caption:= 'N';
    End;

    //Label AGENCIA CODIGO CEDENTE
    QRLabel25.Caption := RMaskCGC_CPF( DMContasReceber.QRBloquetoCOD_AGENCIA.Text,4 ) + '/' + Bib.StrZero( DMContasReceber.QRBloquetoNUM_CONTA_CORRENTE.Text,4 );
    QRLabel59.Caption := RMaskCGC_CPF( DMContasReceber.QRBloquetoCOD_AGENCIA.Text,4 ) + '/' + Bib.StrZero( DMContasReceber.QRBloquetoNUM_CONTA_CORRENTE.Text,4 );
    QRLabel94.Caption := RMaskCGC_CPF( DMContasReceber.QRBloquetoCOD_AGENCIA.Text,4 ) + '/' + Bib.StrZero( DMContasReceber.QRBloquetoNUM_CONTA_CORRENTE.Text,4 );


  //****************************************************************************
  // Calculo DAC para codigo de barras campo Posicao 31 Anexo 4
    wAux := '';
    wDacAnexo4:= '';
    If (Trim(DMContasReceber.QRBloquetoCARTEIRA.Text) = '126') OR (Trim(DMContasReceber.QRBloquetoCARTEIRA.Text) = '131')  OR
    (Trim(DMContasReceber.QRBloquetoCARTEIRA.Text) = '146') OR (Trim(DMContasReceber.QRBloquetoCARTEIRA.Text) = '150') OR
    (Trim(DMContasReceber.QRBloquetoCARTEIRA.Text) = '168') then
    Begin
      wDacAnexo4 := RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetoCARTEIRA.Text),3)          +
      RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetonosso_numero_seq.Text),3);
    End
    Else
    Begin
      wDacAnexo4 := RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetoCOD_AGENCIA.Text),4)       +
      Copy(wNumCC,1,5)                                                                      +
      RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetoCARTEIRA.Text),3)                        +
      RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetonosso_numero_seq.Text),8);
    End;
    wDacAnexo4 := DacCampo(wDacAnexo4);


    //Campo NOSSO NUMERO
    QRLabel70.Caption := RMaskCGC_CPF( DMContasReceber.QRBloquetoCARTEIRA.Text,3 ) + '/' + Bib.StrZero( DMContasReceber.QRBloquetonosso_numero_seq.Text,8 ) + '-' + wDacAnexo4;
    QRLabel71.Caption := RMaskCGC_CPF( DMContasReceber.QRBloquetoCARTEIRA.Text,3 ) + '/' + Bib.StrZero( DMContasReceber.QRBloquetonosso_numero_seq.Text,8 ) + '-' + wDacAnexo4;
    QRLabel104.Caption := RMaskCGC_CPF( DMContasReceber.QRBloquetoCARTEIRA.Text,3 ) + '/' + Bib.StrZero( DMContasReceber.QRBloquetonosso_numero_seq.Text,8 ) + '-' + wDacAnexo4;

    wAux := '';

    QRMemo1.Lines.Clear;
    If (DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.Value <> 0) Then
       QRMemo1.Lines.Add(DMContasReceber.QRBloquetoinstrucao_juro.Text);

    QRMemo1.Lines.Append( Trim(DMContasReceber.QRBloquetoDESC_INSTRUCAO_BLOQUETO.Text));
    QRMemo2.Lines := QRMemo1.Lines;
    QRMemo3.Lines := QRMemo1.Lines;

  //****************************************************************************
  //Calculo DAC para codigo de barras campo Posicao 41 Anexo 3
    wAux := '';
    wAux := RMaskCGC_CPF( DMContasReceber.QRBloquetoCOD_AGENCIA.Text,4 ) + Copy(wNumCC,1,5);
    wDacAnexo3 := DacCampo(wAux);

//******************************************************************************
//                 ROTINAS PARA FORMAR O CODIGO DE BARRAS
//******************************************************************************
    wCodBarra := '';
    wN := DMContasReceber.QRBloquetoDT_VENCIMENTO.Value - StrToDate('07/10/1997');

    wCodBarra := '3419' + FloatToStr(wN)                                                +
    intdecimais (DMContasReceber.QRBloquetoVAL_TITULO.Text, 10, 2)                      +
    RMaskCGC_CPF(DMContasReceber.QRBloquetoCARTEIRA.Text, 3)                            +
    RMaskCGC_CPF(DMContasReceber.QRBloquetonosso_numero_seq.Text, 8)                    +
    wDacAnexo4                                                                          +
    RMaskCGC_CPF(DMContasReceber.QRBloquetoCOD_AGENCIA.Text, 4)                         +
    Copy(wNumCC,1,5)                                                                    +
    wDacAnexo3                                                                          +
    '000';
    wDac2 := DacAnexo2(wCodBarra);
    Insert(wDac2, wCodBarra, 5);

    Barcode1.Digits := wCodBarra;
    Barcode1.BarcodeCopy;
    QRImage3.Picture.Assign(ClipBoard);
    //Barcode1.Free;

//******************************************************************************
//      ROTINAS PARA FORMAR A REPRESENTAÇAO NUMERICA DO CODIGO DE BARRAS
//******************************************************************************
    wCodBarraN := '';
    wNumCC := ''; // utilizado para armazenar o numero de nosso numero nessa rotina
    wAux := '';
    wCampo1 := '';
    wCampo2 := '';
    wCampo3 := '';
    wNumCC := RMaskCGC_CPF(DMContasReceber.QRBloquetonosso_numero_seq.Text,8);

  //Rotinas Representaçao Numerica Campo1
    wCampo1:= '3419' + RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetoCARTEIRA.Text) , 3)   +
    Copy(wNumCC,1,2);
    wCampo1 := wCampo1 + DacCampo(wCampo1);
    wCodBarraN := Copy(wCampo1,1,5) + '.' + Copy(wCampo1,6,5);

  //Rotinas Representaçao Numerica Campo 2
    wCampo2:= Copy( wNumCC,3,6)                                                +
    wDacAnexo4                                                                +
    Copy( Trim(DMContasReceber.QRBloquetoCOD_AGENCIA.Text),1,3 );
    wCampo2 := wCampo2 + DacCampo(wCampo2);
    Insert('.', wCampo2, 6);
    wCodBarraN := wCodBarraN + ' ' + wCampo2;

  //Rotinas Representaçao Numerica Campo 3
    wAux:= Copy( RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetoCOD_AGENCIA.Text),4 ),4,1)      +
    RMaskCGC_CPF( DMContasReceber.QRBloquetoNUM_CONTA_CORRENTE.Text, 6) + '000';
    wCampo3 := wAux + DacCampo(wAux);
    Insert('.', wCampo3, 6);
    wCodBarraN := wCodBarraN + ' ' + wCampo3;

  //Rotina Representacao Numerica Campo 4
    wCodBarraN := wCodBarraN + ' ' + wDac2;

  //Rotina Representaçao Numerica Campo 5
    wCodBarraN := wCodBarraN + ' ' + FloatToStr(wN) + intdecimais(Trim(DMContasReceber.QRBloquetoVAL_TITULO.Text), 10, 2);

    QRLabel31.Caption := wCodBarraN;
    QRLabel64.Caption := wCodBarraN;
    QRLabel99.Caption := wCodBarraN;

  except
    on E : Exception do
      ShowMessage(E.Message);
  end;
  end
  else   //copia do bloqueto Marcos 13/05/2005
    Begin

    wDac2:= '';
    wDacAnexo3 := '';
    wDacAnexo4 := '';
    wAux := '';
    wNumCC := '';
    wNumCC := RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetoNUM_CONTA_CORRENTE.Text),5 );

    If DMContasReceber.QRBloquetoIND_ACEITE.Text = 'SIM' then
    Begin
      QRLabel36.Caption:= 'S';
      QRLabel69.Caption:= 'S';
      QRLabel103.Caption:= 'S';
    End
    Else
    Begin
      QRLabel36.Caption:= 'N';
      QRLabel69.Caption:= 'N';
      QRLabel103.Caption:= 'N';
    End;

    //Label AGENCIA CODIGO CEDENTE
    QRLabel25.Caption := RMaskCGC_CPF( DMContasReceber.QRBloquetoCOD_AGENCIA.Text,4 ) + '/' + Bib.StrZero( DMContasReceber.QRBloquetoNUM_CONTA_CORRENTE.Text,4 );
    QRLabel59.Caption := RMaskCGC_CPF( DMContasReceber.QRBloquetoCOD_AGENCIA.Text,4 ) + '/' + Bib.StrZero( DMContasReceber.QRBloquetoNUM_CONTA_CORRENTE.Text,4 );
    QRLabel94.Caption := RMaskCGC_CPF( DMContasReceber.QRBloquetoCOD_AGENCIA.Text,4 ) + '/' + Bib.StrZero( DMContasReceber.QRBloquetoNUM_CONTA_CORRENTE.Text,4 );


  //****************************************************************************
  // Calculo DAC para codigo de barras campo Posicao 31 Anexo 4
    wAux := '';
    wDacAnexo4:= '';
    If (Trim(DMContasReceber.QRBloquetoCARTEIRA.Text) = '126') OR (Trim(DMContasReceber.QRBloquetoCARTEIRA.Text) = '131')  OR
    (Trim(DMContasReceber.QRBloquetoCARTEIRA.Text) = '146') OR (Trim(DMContasReceber.QRBloquetoCARTEIRA.Text) = '150') OR
    (Trim(DMContasReceber.QRBloquetoCARTEIRA.Text) = '168') then
    Begin
      wDacAnexo4 := RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetoCARTEIRA.Text),3)          +
      RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetoNOSSO_NUMERO.Text),3);
    End
    Else
    Begin
      wDacAnexo4 := RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetoCOD_AGENCIA.Text),4)       +
      Copy(wNumCC,1,5)                                                                      +
      RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetoCARTEIRA.Text),3)                        +
      RMaskCGC_CPF( Bib.StrZero(DMContasReceber.QRBloquetoNOSSO_NUMERO.Text,8),8);
    End;
    wDacAnexo4 := DacCampo(wDacAnexo4);


    //Campo NOSSO NUMERO
    QRLabel70.Caption := RMaskCGC_CPF( DMContasReceber.QRBloquetoCARTEIRA.Text,3 ) + '/' + Bib.StrZero(DMContasReceber.QRBloquetoNOSSO_NUMERO.Text,8) + '-' + wDacAnexo4;
    QRLabel71.Caption := RMaskCGC_CPF( DMContasReceber.QRBloquetoCARTEIRA.Text,3 ) + '/' + Bib.StrZero(DMContasReceber.QRBloquetoNOSSO_NUMERO.Text,8) + '-' + wDacAnexo4;
    QRLabel104.Caption := RMaskCGC_CPF( DMContasReceber.QRBloquetoCARTEIRA.Text,3 ) + '/' + Bib.StrZero(DMContasReceber.QRBloquetoNOSSO_NUMERO.Text,8) + '-' + wDacAnexo4;

    wAux := '';

    QRMemo1.Lines.Clear;
    If (DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.Value <> 0) Then
       QRMemo1.Lines.Add(DMContasReceber.QRBloquetoinstrucao_juro.Text);

    QRMemo1.Lines.Append( Trim(DMContasReceber.QRBloquetoDESC_INSTRUCAO_BLOQUETO.Text));
    QRMemo2.Lines := QRMemo1.Lines;
    QRMemo3.Lines := QRMemo1.Lines;

  //****************************************************************************
  //Calculo DAC para codigo de barras campo Posicao 41 Anexo 3
    wAux := '';
    wAux := RMaskCGC_CPF( DMContasReceber.QRBloquetoCOD_AGENCIA.Text,4 ) + Copy(wNumCC,1,5);
    wDacAnexo3 := DacCampo(wAux);


//******************************************************************************
//                 ROTINAS PARA FORMAR O CODIGO DE BARRAS
//******************************************************************************
    wCodBarra := '';
    wN := DMContasReceber.QRBloquetoDT_VENCIMENTO.Value - StrToDate('07/10/1997');

    wCodBarra := '3419' + FloatToStr(wN)                                                +
    intdecimais (DMContasReceber.QRBloquetoVAL_TITULO.Text, 10, 2)                      +
    RMaskCGC_CPF(DMContasReceber.QRBloquetoCARTEIRA.Text, 3)                            +
    RMaskCGC_CPF(Bib.StrZero(DMContasReceber.QRBloquetonosso_numero.Text,8),8)                    +
    wDacAnexo4                                                                          +
    RMaskCGC_CPF(DMContasReceber.QRBloquetoCOD_AGENCIA.Text, 4)                         +
    Copy(wNumCC,1,5)                                                                    +
    wDacAnexo3                                                                          +
    '000';
    wDac2 := DacAnexo2(wCodBarra);
    Insert(wDac2, wCodBarra, 5);

    Barcode1.Digits := wCodBarra;
    Barcode1.BarcodeCopy;
    QRImage3.Picture.Assign(ClipBoard);
    //Barcode1.Free;

//******************************************************************************
//      ROTINAS PARA FORMAR A REPRESENTAÇAO NUMERICA DO CODIGO DE BARRAS
//******************************************************************************
    wCodBarraN := '';
    wNumCC := ''; // utilizado para armazenar o numero de nosso numero nessa rotina
    wAux := '';
    wCampo1 := '';
    wCampo2 := '';
    wCampo3 := '';
    wNumCC := RMaskCGC_CPF(Bib.StrZero(DMContasReceber.QRBloquetoNOSSO_NUMERO.Text,8),8);

  //Rotinas Representaçao Numerica Campo1
    wCampo1:= '3419' + RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetoCARTEIRA.Text) , 3)   +
    Copy(wNumCC,1,2);
    wCampo1 := wCampo1 + DacCampo(wCampo1);
    wCodBarraN := Copy(wCampo1,1,5) + '.' + Copy(wCampo1,6,5);

  //Rotinas Representaçao Numerica Campo 2
    wCampo2:= Copy( wNumCC,3,6)                                                +
    wDacAnexo4                                                                +
    Copy( Trim(DMContasReceber.QRBloquetoCOD_AGENCIA.Text),1,3 );
    wCampo2 := wCampo2 + DacCampo(wCampo2);
    Insert('.', wCampo2, 6);
    wCodBarraN := wCodBarraN + ' ' + wCampo2;

  //Rotinas Representaçao Numerica Campo 3
    wAux:= Copy( RMaskCGC_CPF( Trim(DMContasReceber.QRBloquetoCOD_AGENCIA.Text),4 ),4,1)      +
    RMaskCGC_CPF( DMContasReceber.QRBloquetoNUM_CONTA_CORRENTE.Text, 6) + '000';
    wCampo3 := wAux + DacCampo(wAux);
    Insert('.', wCampo3, 6);
    wCodBarraN := wCodBarraN + ' ' + wCampo3;

  //Rotina Representacao Numerica Campo 4
    wCodBarraN := wCodBarraN + ' ' + wDac2;

  //Rotina Representaçao Numerica Campo 5
    wCodBarraN := wCodBarraN + ' ' + FloatToStr(wN) + intdecimais(Trim(DMContasReceber.QRBloquetoVAL_TITULO.Text), 10, 2);

    QRLabel31.Caption := wCodBarraN;
    QRLabel64.Caption := wCodBarraN;
    QRLabel99.Caption := wCodBarraN;
  end;
end;

procedure TFRBloqueto_Itau.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  with DMContasReceber do
  begin
  if QRBloquetoNOSSO_NUMERO.Text = '' then
    Begin
    try
      If DMOracle.DBCemapa.InTransaction = False then
         DMOracle.DBCemapa.StartTransaction;
      QAtuBloq.Close;
      QAtuBloq.SetVariable('NUMERO', Bib.StrZero(QRBloquetonosso_numero_seq.AsString,8));
      QAtuBloq.SetVariable('COD_CONTA_RECEBER_CAB',QRBloquetoCOD_CONTA_RECEBER_CAB.Value);
      QAtuBloq.ExecSQL;

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
