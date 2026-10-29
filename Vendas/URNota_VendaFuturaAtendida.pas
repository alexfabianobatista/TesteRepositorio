unit URNota_VendaFuturaAtendida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRCtrls, QuickRpt, jpeg, QRExport, QRWebFilt,
  QRPDFFilt, ExtCtrls;

type
  TFRNota_VendaFuturaAtendida = class(TFTRelSimples)
    ChildBand1: TQRChildBand;
    QRLabel16: TQRLabel;
    parametrosUtilizados: TQRMemo;
    ColumnHeaderBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel7: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel17: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRGroup3: TQRGroup;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand4: TQRBand;
    QRDBText5: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr7: TQRExpr;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand6: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRBand3: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr11: TQRExpr;
    QRBand5: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr12: TQRExpr;
    QRLabel18: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape9: TQRShape;
    QRDBText13: TQRDBText;
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRLabel18Print(sender: TObject; var Value: String);
    procedure QRGroup3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    wQtde : Real;
  end;

var
  FRNota_VendaFuturaAtendida: TFRNota_VendaFuturaAtendida;

implementation

uses URelatorioVenda_cl;

{$R *.dfm}

procedure TFRNota_VendaFuturaAtendida.QRBand4AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  wQtde := DMRelatorio_Venda.QRFutura_AtendidoQT_Quantidade.Value + wQtde;

end;

procedure TFRNota_VendaFuturaAtendida.QRLabel18Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := FormatFloat('###,##0',DMRelatorio_Venda.QRFutura_AtendidoQT_NOTA_ITEM.Value - DMRelatorio_Venda.QRFutura_AtendidoQT_Quantidade.Value - wQtde);
end;

procedure TFRNota_VendaFuturaAtendida.QRGroup3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  wQtde := 0;
end;

end.
