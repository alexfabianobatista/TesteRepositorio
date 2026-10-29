unit URNotasServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRCtrls, QuickRpt, ExtCtrls, QRWebFilt,
  QRPDFFilt;

type
  TFRNotasServico = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel5: TQRLabel;
    QRLFilial: TQRLabel;
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand4: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel16: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    QRCompositeReport1: TQRCompositeReport;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNotasServico: TFRNotasServico;

implementation

uses UNotaEntrada_cl, URNotasServicoImposto;

{$R *.dfm}

procedure TFRNotasServico.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(QRPrimario);
  QRCompositeReport1.Reports.Add(FRNotasServicoImposto.QRPrimario);
end;

end.
