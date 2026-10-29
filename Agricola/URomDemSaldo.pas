unit URomDemSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFrRomDemSaldo = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel4: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    QRCompositeReport1: TQRCompositeReport;
    QRBand5: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel14: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText9: TQRDBText;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel15: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRGroup2: TQRGroup;
    QRDBText3: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText14: TQRDBText;
    QRLDepartamento: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel5: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRExpr11: TQRExpr;
    QRLabel20: TQRLabel;
    QRExpr12: TQRExpr;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrRomDemSaldo: TFrRomDemSaldo;

implementation

uses URomaneioAgricola_cl, URomDemSaldo2;

{$R *.DFM}

procedure TFrRomDemSaldo.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FRRomDemSaldo.QRPrimario);
  QRCompositeReport1.Reports.Add(FRRomDemSaldo2.QRPrimario);
end;

procedure TFrRomDemSaldo.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
{  If DMRomaneioAgricola.QRelSaldosQuantidade_Fixar.Value > 0 Then
     QrDbText8.Left := 611
  else
     QrDbText8.Left := 692;
}
end;

end.
