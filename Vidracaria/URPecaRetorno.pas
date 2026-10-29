unit URPecaRetorno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRPecaRetorno = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLData: TQRLabel;
    QRLabel4: TQRLabel;
    QRLProduto: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRBand4: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRLParam: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPecaRetorno: TFRPecaRetorno;

implementation

uses UPecaRetorno_cl;

{$R *.dfm}

end.
