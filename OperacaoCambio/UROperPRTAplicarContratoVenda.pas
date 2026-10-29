unit UROperPRTAplicarContratoVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFROperPRTAplicarContratoVenda = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr3: TQRExpr;
    QRLPeriodo: TQRLabel;
    QRLCredito: TQRLabel;
    QRExpr4: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROperPRTAplicarContratoVenda: TFROperPRTAplicarContratoVenda;

implementation

uses UOperacaoCambio_cl;

{$R *.DFM}

end.
