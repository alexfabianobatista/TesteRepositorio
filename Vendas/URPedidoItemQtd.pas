unit URPedidoItemQtd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRPedidoItemQtd = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand5: TQRBand;
    QRLabel8: TQRLabel;
    QRExprQuantidade: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRCompositeReport1: TQRCompositeReport;
    QRCompositeReport2: TQRCompositeReport;
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure QRCompositeReport2AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedidoItemQtd: TFRPedidoItemQtd;

implementation

uses UPedido_cl, URPedidoItemQtdCidade, URPedidoItemQtdCliente;

{$R *.dfm}

procedure TFRPedidoItemQtd.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FRPedidoItemQtd.QRPrimario);
  QRCompositeReport1.Reports.Add(FRPedidoItemQtdCidade.QRPrimario);
end;

procedure TFRPedidoItemQtd.QRCompositeReport2AddReports(Sender: TObject);
begin
  inherited;
  QRCompositeReport2.Reports.Add(FRPedidoItemQtd.QRPrimario);
  QRCompositeReport2.Reports.Add(FRPedidoItemQtdCliente.QRPrimario);
end;

end.
