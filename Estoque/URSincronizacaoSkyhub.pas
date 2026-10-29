unit URSincronizacaoSkyhub;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, grimgctrl, QRExport, QRWebFilt, QRPDFFilt,
  QRCtrls, QuickRpt, ExtCtrls;

type
  TFRSincronizacaoSkyhub = class(TFTRelSimples)
    QRLProduto: TQRLabel;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRSincronizacaoSkyhub: TFRSincronizacaoSkyhub;

implementation

uses UProdutoSkyhub_cl;

{$R *.dfm}

end.
