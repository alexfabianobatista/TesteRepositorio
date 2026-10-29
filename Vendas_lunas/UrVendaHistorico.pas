unit UrVendaHistorico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRVendaHistorico = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel14: TQRLabel;
    QRBand5: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRCompositeReport1: TQRCompositeReport;
    QRBand6: TQRBand;
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRVendaHistorico: TFRVendaHistorico;

implementation

Uses URTitulos, URelatorioVenda_cl;

{$R *.DFM}

procedure TFRVendaHistorico.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FRVendaHistorico.QRPrimario);
  QRCompositeReport1.Reports.Add(FRTitulos.QRPrimario);
end;

end.
