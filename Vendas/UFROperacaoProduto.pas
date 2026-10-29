unit UFROperacaoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFROperacaoProduto = class(TFTRelSimples)
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel4: TQRLabel;
    QRCompositeReport1: TQRCompositeReport;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLbFilial: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRExpr2: TQRExpr;
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROperacaoProduto: TFROperacaoProduto;

implementation
uses URelatorioVenda_cl, UFROperacaoProduto2;

{$R *.dfm}

procedure TFROperacaoProduto.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FROperacaoProduto.QRPrimario);
  QRCompositeReport1.Reports.Add(FROperacaoProduto2.QRPrimario);
end;

end.
