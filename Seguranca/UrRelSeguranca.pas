unit UrRelSeguranca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFrRelSeguranca = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRSubDetail1: TQRSubDetail;
    QRTelas: TQRBand;
    QRBand4: TQRBand;
    QRSubDetail2: TQRSubDetail;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrRelSeguranca: TFrRelSeguranca;

implementation

uses UGrupo_cl;

{$R *.DFM}

end.
