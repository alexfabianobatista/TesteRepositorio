unit URNota_QuotaVend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNota_QuotaVend = class(TFTRelSimples)
    QRGCabFilial: TQRGroup;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRCompositeReport1: TQRCompositeReport;
    QRBTotFilial: TQRBand;
    QRLabel16: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
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
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
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
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_QuotaVend: TFRNota_QuotaVend;

implementation

uses URNota_QuotaVend3, URelatorioVenda_cl, UNotaSaidaParam;

{$R *.DFM}

procedure TFRNota_QuotaVend.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var wTotal : Real;
begin
  inherited;
  {With DMRelatorio_Venda do
  Begin
    wTotal := 0;
    QRQuotaVend2.Close;
    QRQuotaVend2.SetVariable('VENDEDOR',QRQuotaVendCod_Vendedor.Value);
    QRQuotaVend2.SetVariable('ANO',FNOTASAIDAPARAM.ME14ANO.TEXT);//QRQuotaVendANO.Value);

    QRQuotaVend2.SetVariable('MES',01);
    QRQuotaVend2.Open;
    QRLQuota01.Caption := FormatFloat('###,###,##0',QRQuotaVend2SQT_Quota.Value);
    wTotal := wTotal + QRQuotaVend2SQT_Quota.Value;
    QRQuotaVend2.Close;

    QRQuotaVend2.SetVariable('MES',02);
    QRQuotaVend2.Open;
    QRLQuota02.Caption := FormatFloat('###,###,##0',QRQuotaVend2SQT_Quota.Value);
    wTotal := wTotal + QRQuotaVend2SQT_Quota.Value;
    QRQuotaVend2.Close;

    QRQuotaVend2.SetVariable('MES',03);
    QRQuotaVend2.Open;
    QRLQuota03.Caption := FormatFloat('###,###,##0',QRQuotaVend2SQT_Quota.Value);
    wTotal := wTotal + QRQuotaVend2SQT_Quota.Value;
    QRQuotaVend2.Close;

    QRQuotaVend2.SetVariable('MES',04);
    QRQuotaVend2.Open;
    QRLQuota04.Caption := FormatFloat('###,###,##0',QRQuotaVend2SQT_Quota.Value);
    wTotal := wTotal + QRQuotaVend2SQT_Quota.Value;
    QRQuotaVend2.Close;

    QRQuotaVend2.SetVariable('MES',05);
    QRQuotaVend2.Open;
    QRLQuota05.Caption := FormatFloat('###,###,##0',QRQuotaVend2SQT_Quota.Value);
    wTotal := wTotal + QRQuotaVend2SQT_Quota.Value;
    QRQuotaVend2.Close;

    QRQuotaVend2.SetVariable('MES',06);
    QRQuotaVend2.Open;
    QRLQuota06.Caption := FormatFloat('###,###,##0',QRQuotaVend2SQT_Quota.Value);
    wTotal := wTotal + QRQuotaVend2SQT_Quota.Value;
    QRQuotaVend2.Close;

    QRQuotaVend2.SetVariable('MES',07);
    QRQuotaVend2.Open;
    QRLQuota07.Caption := FormatFloat('###,###,##0',QRQuotaVend2SQT_Quota.Value);
    wTotal := wTotal + QRQuotaVend2SQT_Quota.Value;
    QRQuotaVend2.Close;

    QRQuotaVend2.SetVariable('MES',08);
    QRQuotaVend2.Open;
    QRLQuota08.Caption := FormatFloat('###,###,##0',QRQuotaVend2SQT_Quota.Value);
    wTotal := wTotal + QRQuotaVend2SQT_Quota.Value;
    QRQuotaVend2.Close;

    QRQuotaVend2.SetVariable('MES',09);
    QRQuotaVend2.Open;
    QRLQuota09.Caption := FormatFloat('###,###,##0',QRQuotaVend2SQT_Quota.Value);
    wTotal := wTotal + QRQuotaVend2SQT_Quota.Value;
    QRQuotaVend2.Close;

    QRQuotaVend2.SetVariable('MES',10);
    QRQuotaVend2.Open;
    QRLQuota10.Caption := FormatFloat('###,###,##0',QRQuotaVend2SQT_Quota.Value);
    wTotal := wTotal + QRQuotaVend2SQT_Quota.Value;
    QRQuotaVend2.Close;

    QRQuotaVend2.SetVariable('MES',11);
    QRQuotaVend2.Open;
    QRLQuota11.Caption := FormatFloat('###,###,##0',QRQuotaVend2SQT_Quota.Value);
    wTotal := wTotal + QRQuotaVend2SQT_Quota.Value;
    QRQuotaVend2.Close;

    QRQuotaVend2.SetVariable('MES',12);
    QRQuotaVend2.Open;
    QRLQuota12.Caption := FormatFloat('###,###,##0',QRQuotaVend2SQT_Quota.Value);
    wTotal := wTotal + QRQuotaVend2SQT_Quota.Value;
    QRQuotaVend2.Close;

    QRLQuota_Total.Caption := FormatFloat('###,###,##0',wTotal);

  End;   }
end;

procedure TFRNota_QuotaVend.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FRNota_QuotaVend.QRPrimario);
  QRCompositeReport1.Reports.Add(FRNota_QuotaVend3.QRPrimario);
end;

end.
