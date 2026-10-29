unit URPosicaoContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls, Qrctrls;

type
  TFRPosicaoContrato = class(TForm)
    QRPrimario: TQuickRep;
    PageHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel6: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRCompositeReport1: TQRCompositeReport;
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPosicaoContrato: TFRPosicaoContrato;

implementation

uses UObraContrato_cl, URPosicaoContratoTotal;

{$R *.DFM}

procedure TFRPosicaoContrato.QRCompositeReport1AddReports(Sender: TObject);
begin
  QRCompositeReport1.Reports.Add(FRPosicaoContrato.QRPrimario);
  QRCompositeReport1.Reports.Add(FRPosicaoContratoTotal.QRPrimario);
end;

end.
