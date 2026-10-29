unit URProdMateriaPrima;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRCtrls, QuickRpt, ExtCtrls, QRWebFilt,
  QRPDFFilt;

type
  TFRProdMateriaPrima = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRLFilial: TQRLabel;
    QRLabel11: TQRLabel;
    QRLTurno: TQRLabel;
    QRLabel13: TQRLabel;
    QRLData_I: TQRLabel;
    QRLabel15: TQRLabel;
    QRLData_F: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel9: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel12: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText6: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel5: TQRLabel;
    QRExpr3: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProdMateriaPrima: TFRProdMateriaPrima;

implementation

uses UProducaoAgricola_cl;

{$R *.dfm}

end.
