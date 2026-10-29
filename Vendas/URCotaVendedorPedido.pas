unit URCotaVendedorPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRCotaVendedorPedido = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRBand5: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRBand6: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel15: TQRLabel;
    QRShape2: TQRShape;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
    QRExpr1: TQRExpr;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCotaVendedorPedido: TFRCotaVendedorPedido;

implementation

uses UPedido_cl;

{$R *.dfm}

procedure TFRCotaVendedorPedido.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
//  if QRExpr4.Value.dblResult = 0 then
//    QRExpr4.Enabled := False
//  else
//    QRExpr4.Enabled := True;
//  if QRExpr8.Value.dblResult = 0 then
//    QRExpr8.Enabled := False
//  else
//    QRExpr8.Enabled := True;
end;

procedure TFRCotaVendedorPedido.QRBand6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
//  if QRExpr7.Value.dblResult = 0 then
//    QRExpr7.Enabled := False
//  else
//    QRExpr7.Enabled := True;
//  if QRExpr6.Value.dblResult = 0 then
//    QRExpr6.Enabled := False
//  else
//    QRExpr6.Enabled := True;
end;

end.
