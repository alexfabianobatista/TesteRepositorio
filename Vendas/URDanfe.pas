unit URDanfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRCtrls, QRExport, QRWebFilt, QRPDFFilt, QuickRpt,
  ExtCtrls;

type
  TFRDanfe = class(TFTRelSimples)
    QRDBIImageDanfe: TQRDBImage;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRImage1: TQRImage;
    QRLabel3: TQRLabel;
    QRDBTHomologacao: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRDanfe: TFRDanfe;

implementation

{$R *.dfm}

end.
