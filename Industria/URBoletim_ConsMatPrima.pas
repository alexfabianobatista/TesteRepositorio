unit URBoletim_ConsMatPrima;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRBoletim_ConsMatPrima = class(TFTRelSimples)
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
    QRCompositeReport1: TQRCompositeReport;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRBoletim_ConsMatPrima: TFRBoletim_ConsMatPrima;

implementation

uses UBoletim_cl, URBoletim_ConsMatPrima2;

{$R *.DFM}

procedure TFRBoletim_ConsMatPrima.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FRBoletim_ConsMatPrima.QRPrimario);
  QRCompositeReport1.Reports.Add(FRBoletim_ConsMatPrima2.QRPrimario);
end;

procedure TFRBoletim_ConsMatPrima.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  QRPrimario.NewPage;
end;

end.
