unit URBoletim_Producao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRBoletim_Producao = class(TFTRelSimples)
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
    QRBand4: TQRBand;
    QRCompositeReport1: TQRCompositeReport;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRBoletim_Producao: TFRBoletim_Producao;

implementation

uses UBoletim_cl, URBoletim_Producao2;

{$R *.DFM}

procedure TFRBoletim_Producao.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  QRPrimario.NewPage;
end;

procedure TFRBoletim_Producao.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FRBoletim_Producao.QRPrimario);
  QRCompositeReport1.Reports.Add(FRBoletim_Producao2.QRPrimario);  
end;

end.
