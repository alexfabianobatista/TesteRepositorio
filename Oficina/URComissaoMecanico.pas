unit URComissaoMecanico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRComissaoMecanico = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel13: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel14: TQRLabel;
    QRLFilial: TQRLabel;
    QRLabel15: TQRLabel;
    QRLMecanico: TQRLabel;
    QRLabel17: TQRLabel;
    QRLComissao: TQRLabel;
    QRLabel16: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRBand5: TQRBand;
    QRLabel18: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel19: TQRLabel;
    QRLOS: TQRLabel;
    QRCRComissaoMecanico: TQRCompositeReport;
    procedure QRCRComissaoMecanicoAddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRComissaoMecanico: TFRComissaoMecanico;

implementation

uses URelatorio_cl, URComissaoProdutoVendedor;

{$R *.dfm}

procedure TFRComissaoMecanico.QRCRComissaoMecanicoAddReports(
  Sender: TObject);
begin
  inherited;
  QRCRComissaoMecanico.Reports.Add(QRPrimario);
  QRCRComissaoMecanico.Reports.Add(FRComissaoProdutoVendedor.QRPrimario);
end;

end.
