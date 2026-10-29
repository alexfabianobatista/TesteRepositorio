unit URRelacaoOperacaoCambioSWP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRRelacaoOperacaoCambioSWP = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel10: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand3: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel15: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel7: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRelacaoOperacaoCambioSWP: TFRRelacaoOperacaoCambioSWP;

implementation

uses UOperacaoCambio_cl;

{$R *.DFM}

end.
 