unit URFormulaProjecaoCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, StdCtrls;

type
  TFRFormulaProjecaoCompra = class(TFTRelSimples)
    QRLabel4: TQRLabel;
    QRLFilial: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRGFormula: TQRGroup;
    QRLProjecao: TQRLabel;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBTSaldo: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBTTotal: TQRDBText;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBTItem: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBTProjetada1: TQRDBText;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr1: TQRExpr;
    QRLabel12: TQRLabel;
    procedure QRGFormulaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRFormulaProjecaoCompra: TFRFormulaProjecaoCompra;

implementation

uses UFormula_cl;

{$R *.dfm}

procedure TFRFormulaProjecaoCompra.QRGFormulaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  with DMFormula do
  begin
    if (QRProjecaoComprasQTD_PROJETADA1.Value > 0) and (QRProjecaoComprasCODFORMULA.Value = QRProjecaoComprasFORMULA1.Value) then
      QRLProjecao.Caption := 'Qt. Projetada: ' + QRProjecaoComprasQTD_PROJETADA1.Text;
    if (QRProjecaoComprasQTD_PROJETADA2.Value > 0) and (QRProjecaoComprasCODFORMULA.Value = QRProjecaoComprasFORMULA2.Value) then
      QRLProjecao.Caption := 'Qt. Projetada: ' + QRProjecaoComprasQTD_PROJETADA2.Text;
    if (QRProjecaoComprasQTD_PROJETADA3.Value > 0) and (QRProjecaoComprasCODFORMULA.Value = QRProjecaoComprasFORMULA3.Value) then
      QRLProjecao.Caption := 'Qt. Projetada: ' + QRProjecaoComprasQTD_PROJETADA3.Text;
    if (QRProjecaoComprasQTD_PROJETADA4.Value > 0) and (QRProjecaoComprasCODFORMULA.Value = QRProjecaoComprasFORMULA4.Value) then
      QRLProjecao.Caption := 'Qt. Projetada: ' + QRProjecaoComprasQTD_PROJETADA4.Text;
    if (QRProjecaoComprasQTD_PROJETADA5.Value > 0) and (QRProjecaoComprasCODFORMULA.Value = QRProjecaoComprasFORMULA5.Value) then
      QRLProjecao.Caption := 'Qt. Projetada: ' + QRProjecaoComprasQTD_PROJETADA5.Text;
    if (QRProjecaoComprasQTD_PROJETADA6.Value > 0) and (QRProjecaoComprasCODFORMULA.Value = QRProjecaoComprasFORMULA6.Value) then
      QRLProjecao.Caption := 'Qt. Projetada: ' + QRProjecaoComprasQTD_PROJETADA6.Text;
    if (QRProjecaoComprasQTD_PROJETADA7.Value > 0) and (QRProjecaoComprasCODFORMULA.Value = QRProjecaoComprasFORMULA7.Value) then
      QRLProjecao.Caption := 'Qt. Projetada: ' + QRProjecaoComprasQTD_PROJETADA7.Text;
    if (QRProjecaoComprasQTD_PROJETADA8.Value > 0) and (QRProjecaoComprasCODFORMULA.Value = QRProjecaoComprasFORMULA8.Value) then
      QRLProjecao.Caption := 'Qt. Projetada: ' + QRProjecaoComprasQTD_PROJETADA8.Text;
  end;
end;

end.
