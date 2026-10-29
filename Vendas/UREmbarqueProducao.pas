unit UREmbarqueProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, jpeg, Db;

type
  TFREmbarqueProducao = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand4: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    QRImage: TQRImage;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREmbarqueProducao: TFREmbarqueProducao;

implementation

uses UEmbarque_cl;

{$R *.dfm}

procedure TFREmbarqueProducao.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  b: TStream;
  Jpg: TJpegImage;
begin
  inherited;
  Jpg := nil;
  b := DMEmbarque.QREmbarque.CreateBlobStream(DMEmbarque.QREmbarqueIMG_IMAGEM, bmRead);
  if b.Size > 0 then
  begin
    try
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(b);
      QRImage.Picture.Assign(Jpg);
      QRImage.visible := true;
    except
    end;
  end
  else
  begin
    QRImage.Picture.Assign(nil);
    QRImage.Visible := false;
  end;
  jpg.Free;
  b.Destroy;
end;

end.
