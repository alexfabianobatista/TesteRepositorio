unit URNota_QuotaVend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRNota_QuotaVend = class(TFTRelSimples)
    QRGCabFilial: TQRGroup;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
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
    QRCompositeReport1: TQRCompositeReport;
    QRBTotFilial: TQRBand;
    QRLabel16: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
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
    QRDBText28: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRLabel3: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
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
