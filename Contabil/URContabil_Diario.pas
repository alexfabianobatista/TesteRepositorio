unit URContabil_Diario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFRContabil_Diario = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLTitulo: TQRLabel;
    QRLEmpresa: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLNumPagina: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRDBTVal_Debito: TQRDBText;
    QRBand7: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRBand6: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLFilial: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    QRBand5: TQRBand;
    QRLabel14: TQRLabel;
    QRLbCredito: TQRLabel;
    QRLbDebito: TQRLabel;
    QRShape1: TQRShape;
    QRLabel15: TQRLabel;
    QRLbDebito1: TQRLabel;
    QRLbCredito1: TQRLabel;
    QRShape2: TQRShape;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand6AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    FPag_Inicial: real;
    FNum_Linhas : Real;
    wstrAux : String;
   public
    { Public declarations }
    Property Pag_Inicial: Real Read FPag_Inicial write FPag_Inicial;
    Property Num_Linhas : Real Read FNum_Linhas write FNum_Linhas;
  end;

var
  FRContabil_Diario: TFRContabil_Diario;
  vNum_Pagina:Real;
  Val_deb,Val_cred :Real;
  wfloCredito, wfloDebito : Real;
implementation

uses UOracle_cl, UPlanilha_cl, UContabilParam;

{$R *.DFM}

procedure TFRContabil_Diario.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRPrimario.QRPrinter.PaperLength := Round(QRPrimario.Page.Length);
  QRPrimario.QRPrinter.PaperWidth := Round(QRPrimario.Page.Width);
  vNum_Pagina:=Pag_Inicial;
  Num_Linhas:=Pag_Inicial;
//  QRLTotDiaaTrans.Font.Color:=clBlack;
//  QREDeb.Font.Color:=clBlack;
//  QRECred.Font.Color:=clBlack;
  wfloCredito := 0;
  wfloDebito := 0;
end;

procedure TFRContabil_Diario.FormCreate(Sender: TObject);
begin
  QRLEmpresa.Caption := 'Empresa: '+DMOracle.BuscaNome('SELECT DESC_EMPRESA FROM TB_PARAM_SISTEMA',
                                                       'COD_FILIAL >= 0');
end;

procedure TFRContabil_Diario.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  vNum_Pagina:=vNum_Pagina+1;
  QRLNumPagina.Caption:=FloatToStr(vNum_Pagina);
  Num_Linhas:=vNum_Pagina;
end;

procedure TFRContabil_Diario.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
//  QREDeb.Reset;
//  QRECred.Reset;
    DMPlanilha.QRDiarioTot.Next;
end;

procedure TFRContabil_Diario.QRBand6AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
//  QRLTotDiaaTrans.Font.Color:=clWhite;
//  QREDeb.Font.Color:=clWhite;
//  QRECred.Font.Color:=clWhite;
end;

procedure TFRContabil_Diario.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
{ If DMPlanilha.QRContabil_DiarioVAL_DEBITO.Value =  0 then
   QRDBTVal_Debito.Mask:=''
 else
   QRDBTVal_Debito.Mask:='#,##0.00';

 If DMPlanilha.QRContabil_DiarioVAL_Credito.Value =  0 then
   QRDBTVal_Credito.Mask:=''
 else
   QRDBTVal_Credito.Mask:='#,##0.00';  }

end;

procedure TFRContabil_Diario.QRBand5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  DMPlanilha.QRDiarioTot.First;
  FRContabil_Diario.Pag_Inicial:=strToInt(Trim(FContabilParam.ME2Pagina.Text))-1;
end;

procedure TFRContabil_Diario.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if QRPrimario.PageNumber=0 then
    begin
      QRLabel15.Font.Color:=clwhite;
      QRLbCredito1.Font.Color:=clwhite;
      QRLbDebito1.Font.Color:=clwhite;
      QRLabel15.Height:=0;
      QRLbCredito1.Height:=0;
      QRLbDebito1.Height:=0;
      QRBand2.Height := 18;
      QRShape2.Enabled := False;
    end
  else
    begin
      QRLabel15.Font.Color:=clblack;
      QRLbCredito1.Font.Color:=clblack;
      QRLbDebito1.Font.Color:=clblack;
      QRLabel15.Height:=13;
      QRLbCredito1.Height:=13;
      QRLbDebito1.Height:=13;
      QRBand2.Height := 34;
      QRShape2.Enabled := True;
    end;
  wstrAux := 'Crédito: ' + FormatFloat('###,###,##0.00',wfloCredito);
  QRLbCredito1.Caption := wstrAux;
  wstrAux := 'Débito: ' + FormatFloat('###,###,##0.00',wfloDebito);
  QRLbDebito1.Caption := wstrAux;
end;

procedure TFRContabil_Diario.QRBand6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  wstrAux := 'Crédito: ' + FormatFloat('###,###,##0.00',wfloCredito);
  QRLbCredito.Caption := wstrAux;
  wstrAux := 'Débito: ' + FormatFloat('###,###,##0.00',wfloDebito);
  QRLbDebito.Caption := wstrAux;
end;

procedure TFRContabil_Diario.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  With DMPlanilha Do
  Begin
    If(Trim(QRContabil_DiarioNUM_CONTRAPARTIDA.Text)<>'')AND(Trim(QRContabil_DiarioNUM_PLANO_CONTA.Text)<>'')Then
    Begin
      wfloDebito := wfloDebito + QRContabil_DiarioVAL_LANCTO.Value;
      wfloCredito := wfloCredito + (QRContabil_DiarioVAL_LANCTO.Value*-1);
    End
    Else
    Begin
      If( Trim(QRContabil_DiarioNUM_CONTRAPARTIDA.Text)='' )Then
        wfloDebito := wfloDebito + QRContabil_DiarioVAL_LANCTO.Value
      Else
        wfloCredito := wfloCredito + (QRContabil_DiarioVAL_LANCTO.Value*-1);
    End;
  End;
end;

procedure TFRContabil_Diario.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  wfloCredito := 0;
  wfloDebito := 0;
end;

end.
