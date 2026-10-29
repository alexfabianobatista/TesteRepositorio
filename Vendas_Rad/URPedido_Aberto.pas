unit URPedido_Aberto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRPedido_Aberto = class(TFTRelSimples)
    QRBItemPedido: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel5: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText16: TQRDBText;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel9: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText17: TQRDBText;
    QRBand4: TQRBand;
    QRLabel18: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr12: TQRExpr;
    QRLabel19: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText26: TQRDBText;
    QRLEstado: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedido_Aberto: TFRPedido_Aberto;

implementation

uses UPedido_cl;

{$R *.DFM}

procedure TFRPedido_Aberto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FRPedido_Aberto := Nil;
end;

end.
