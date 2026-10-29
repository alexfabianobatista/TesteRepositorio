unit URContratoCompra_Aberto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRContratoCompra_Aberto = class(TFTRelSimples)
    QRBand4: TQRBand;
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand5: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLFilial: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand6: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel14: TQRLabel;
    QRDBText10: TQRDBText;
    QRLTipoPagto: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel15: TQRLabel;
    QRDBText11: TQRDBText;
    QRBand7: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContratoCompra_Aberto: TFRContratoCompra_Aberto;

implementation

uses Ucontrato_cl;

{$R *.DFM}

end.
