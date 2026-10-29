unit URNota_VendedorCMedio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNota_VendedorCMedio = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRGVendedor: TQRGroup;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRBRodVendedor: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRCompositeReport2: TQRCompositeReport;
    QRBand4: TQRBand;
    QRExpr4: TQRExpr;
    QRGroup1: TQRGroup;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRBRodClasse: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRLabel13: TQRLabel;
    QRDBText7: TQRDBText;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRLOperacao: TQRLabel;
    QRLRepresentante: TQRLabel;
    procedure QRCompositeReport2AddReports(Sender: TObject);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBRodVendedorAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBRodVendedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_VendedorCMedio: TFRNota_VendedorCMedio;
  wCont : Integer;
  wValor : Real;

implementation

uses URelatorioVenda_cl, URNota_VendedorCMedio2, UParamSistema_cl;

{$R *.DFM}

procedure TFRNota_VendedorCMedio.QRCompositeReport2AddReports(
  Sender: TObject);
begin
  inherited;
  QRCompositeReport2.Reports.Add(FRNota_VendedorCMedio.QRPrimario);
  QRCompositeReport2.Reports.Add(FRNota_VendedorCMedio2.QRPrimario);

end;

procedure TFRNota_VendedorCMedio.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
{ inc(wCont);
  wValor := wValor + DMRelatorio_Venda.QRVendedorCMedioSPRECO_MEDIO_KG.Value;  }
end;

procedure TFRNota_VendedorCMedio.QRBRodVendedorAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
//wCont := 0;
//wValor := 0;
end;

procedure TFRNota_VendedorCMedio.QRBRodVendedorBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
//sValorMedio.Caption := FormatFloat('###,##0.00',(wValor / wCont));
end;

procedure TFRNota_VendedorCMedio.FormCreate(Sender: TObject);
begin
  inherited;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
  Begin
    QRLabel8.left := 711;
    QrExpr5.Left := 684;
    QrExpr10.Left := 684;
    QrExpr11.Left := 684;

    QRLabel7.Enabled := False;
    QrDbText6.Enabled := False;
    QrExpr9.Enabled := False;
    QrExpr4.Enabled := False;

    QRLabel6.left := 623;
    QrDbText5.Left := 596;
    //QrExpr8.Left := 596;
   // QrExpr3.Left := 596;

    QRLabel5.left := 553;
    QrDbText4.Left := 508;
    QrExpr7.Left := 508;
    QrExpr2.Left := 508;

    QRLabel4.left := 430;
    QrDbText3.left := 422;
    QrExpr6.Left := 402;
    QrExpr1.Left := 402;

    Qrlabel13.Enabled := False;
    QrDbText7.Enabled := False;
    QrExpr12.Enabled := False;
    QrExpr13.Enabled := False;

    QrDbText2.Width := 400;
  End;
  //Para Mundo da Farinha é utilizado o PESO_BRUTO. Junior - 07/05/2014. Solicitacao: Marcos.
  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'MFARINHA') or (DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'PRECIOSA'))then
  begin
    //----QT KG
    QRDBText5.DataField := 'NUM_PESO_BRUTO';
    //----TOTAL KG
    QRExpr5.Expression  := 'SUM(QRVendedorCMedio.SNUM_PESO_BRUTO + QRVendedorCMedio.SQT_KILOS_BONIFICACAO)';
    QRExpr10.Expression := 'SUM(QRVendedorCMedio.SNUM_PESO_BRUTO + QRVendedorCMedio.SQT_KILOS_BONIFICACAO)';
    QRExpr11.Expression := 'SUM(QRVendedorCMedio.SNUM_PESO_BRUTO + QRVendedorCMedio.SQT_KILOS_BONIFICACAO)';
    //----C. MEDIO.
    QRExpr12.Expression := 'SUM(QRVendedorCMedio.SVAL_TOTAL) / SUM(QRVendedorCMedio.SNUM_PESO_BRUTO + QRVendedorCMedio.SQT_KILOS_BONIFICACAO)';
    QRExpr13.Expression := 'SUM(QRVendedorCMedio.SVAL_TOTAL) / SUM(QRVendedorCMedio.SNUM_PESO_BRUTO + QRVendedorCMedio.SQT_KILOS_BONIFICACAO)';
  end;

end;

end.
