unit URPedido_Preco_Medio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRPedido_Preco_Medio = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRDBText6: TQRDBText;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr4: TQRExpr;
    QRGroup2: TQRGroup;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand6: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedido_Preco_Medio: TFRPedido_Preco_Medio;

implementation

uses UPedido_cl;

{$R *.DFM}

end.
