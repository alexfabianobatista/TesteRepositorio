unit URLiquidacaoOpercaoCambioEPT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, QRExport, ExtCtrls;

type
  TFRLiquidacaoOpercaoCambioEPT = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRDBText9: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText6: TQRDBText;
    DetailBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel16: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRLiquidacaoOpercaoCambioEPT: TFRLiquidacaoOpercaoCambioEPT;

implementation

uses UOperacaoCambio_cl;

{$R *.DFM}

end.
 