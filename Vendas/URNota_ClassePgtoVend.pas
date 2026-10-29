unit URNota_ClassePgtoVend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QuickRpt, Qrctrls, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNota_ClassePgtoVend = class(TFTRelSimples)
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRGroup2: TQRGroup;
    QRBTotais: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText5: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText6: TQRDBText;
    QRExpr3: TQRExpr;
    QRDBText7: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRCompositeReport1: TQRCompositeReport;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText8: TQRDBText;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_ClassePgtoVend: TFRNota_ClassePgtoVend;

implementation

uses URelatorioVenda_cl, URNota_ClassePgto;

{$R *.DFM}

procedure TFRNota_ClassePgtoVend.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FRNota_ClassePgtoVend.QRPrimario);
  QRCompositeReport1.Reports.Add(FRNota_ClassePgto.QRPrimario);

end;

end.
