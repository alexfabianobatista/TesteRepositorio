unit UNotaSaidaVendasVendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRVendasPorVendedor = class(TFTRelSimples)
    QRBand6: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr2: TQRExpr;
    QRBand3: TQRBand;
    QRLFilial: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRExpr1: TQRExpr;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRVendasPorVendedor: TFRVendasPorVendedor;

implementation
uses URelatorioVenda_cl, UNotaSaidaParam;
{$R *.DFM}

procedure TFRVendasPorVendedor.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  if FNotaSaidaParam.RG25Valor.ItemIndex = 0 then
  Begin
    FRVendasPorVendedor.QRLabel8.Enabled := True;
    FRVendasPorVendedor.QRDBText5.Enabled := True;
    FRVendasPorVendedor.QRExpr1.Enabled := True;
  end
  else
  Begin
    FRVendasPorVendedor.QRLabel8.Enabled := False;
    FRVendasPorVendedor.QRDBText5.Enabled := False;
    FRVendasPorVendedor.QRExpr1.Enabled := False;
  end;

end;

end.
