unit URPrecoVendidoPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRPrecoVendidoPedido = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel14: TQRLabel;
    QRDBText12: TQRDBText;
    QRBand6: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRExpr8: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRDBText4: TQRDBText;
    QRDBTCadastro: TQRDBText;
    QRLCadastro: TQRLabel;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPrecoVendidoPedido: TFRPrecoVendidoPedido;

implementation

uses UPedido_cl, UBiblioteca;

{$R *.dfm}

end.
