unit UROperACCAplicarContratoVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFROperACCAplicarContratoVenda = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    QRExpr5: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROperACCAplicarContratoVenda: TFROperACCAplicarContratoVenda;

implementation

uses UOperacaoCambio_cl;

{$R *.DFM}

end.
