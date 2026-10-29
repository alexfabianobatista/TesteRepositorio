unit URLiquidacoesOpercaoCambioACC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRLiquidacoesOpercaoCambioACC = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel15: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRLiquidacoesOpercaoCambioACC: TFRLiquidacoesOpercaoCambioACC;

implementation

uses UOperacaoCambio_cl;

{$R *.DFM}

end.
