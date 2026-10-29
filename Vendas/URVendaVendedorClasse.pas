unit URVendaVendedorClasse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRVendaVendedorClasse = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRBand4: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRGroup1: TQRGroup;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRExpr4: TQRExpr;
    QRBand5: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRLPeriodo: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText11: TQRDBText;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRLabel8: TQRLabel;
    QRDBText12: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr19: TQRExpr;
    QRLabel16: TQRLabel;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRCompositeReport1: TQRCompositeReport;
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRVendaVendedorClasse: TFRVendaVendedorClasse;

implementation

uses URelatorioVenda_cl, URVendaVendedorResumo;

{$R *.DFM}

procedure TFRVendaVendedorClasse.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FRVendaVendedorClasse.QRPrimario);
  QRCompositeReport1.Reports.Add(FRVendaVendedorResumo.QRPrimario);
end;

end.
