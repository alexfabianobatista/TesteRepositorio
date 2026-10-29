unit URPedidoMaterial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QuickRpt, QRExport, QRWebFilt, QRPDFFilt, QRCtrls,
  ExtCtrls;

type
  TFRPedidoMaterial = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape2: TQRShape;
    QRBand4: TQRBand;
    QRLabel23: TQRLabel;
    QRShape3: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel24: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel25: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape4: TQRShape;
    QRLabel28: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText37: TQRDBText;
    QRDBText26: TQRDBText;
    QRExpr5: TQRExpr;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedidoMaterial: TFRPedidoMaterial;

implementation

uses UVidracaria_cl;

{$R *.dfm}

procedure TFRPedidoMaterial.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If DmVidracaria.QRPedidoMaterialDESC_CANTO.Text <> '' then
    QRDBText19.Enabled := True
  else
    QRDBText19.Enabled := False;
end;

procedure TFRPedidoMaterial.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRExpr5.Reset;
end;

end.
