unit URVendaAvistaBalcao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QuickRpt, Qrctrls, ExtCtrls;

type
  TFRVendaAvistaBalcao = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText6: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRVendaAvistaBalcao: TFRVendaAvistaBalcao;

implementation

uses URelatorio_cl;

{$R *.DFM}

end.
