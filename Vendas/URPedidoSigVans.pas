unit URPedidoSigVans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl,jpeg;

type
  TFRPedidoSigVans = class(TFTRelSimples)
    QRBand6: TQRBand;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel14: TQRLabel;
    QRBand5: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRHRule3: TQRHRule;
    QRLogo: TQRImage;
    QRLLogo: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText13: TQRDBText;
    QRShape2: TQRShape;
    QRLabel30: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText26: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel19: TQRLabel;
    QRHRule4: TQRHRule;
    QRImage1: TQRImage;
    QRMemo1: TQRMemo;
    QRHRule2: TQRHRule;
    QRLabel16: TQRLabel;
    QRShape1: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText11: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedidoSigVans: TFRPedidoSigVans;

implementation

uses
  UPedido_cl, UOracle_cl;

{$R *.dfm}

procedure TFRPedidoSigVans.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if FileExists(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg') then
  begin
     QRLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg');
     QRLLogo.Enabled := False;
  end
  else
  begin
    QRLogo.Picture := Nil;
    QRLLogo.Enabled := True;
  end;
end;

procedure TFRPedidoSigVans.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMPedido.QRPedidoDESC_OBS_ITEM.Text <> '' then
  begin
    QRBand3.Height := 35
  end
  else
  begin
    QRBand3.Height := 18
  end;
end;

procedure TFRPedidoSigVans.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
 jpeg: tjpegimage;
 buf: tmemorystream;
 w, h: Integer;
 prop: Double;
begin
  inherited;
  if Trim(DMPedido.QRPedidoIMAGEM_PEDIDO.Value) <> '' then
  begin
    jpeg := TJpegImage.Create;
    buf := Tmemorystream.Create;
    try

      DMPedido.QRPedidoIMAGEM_PEDIDO.SaveToStream(buf);
      buf.Position := 0;
      jpeg.LoadFromStream(buf);
      // proporção da imagem
      prop := jpeg.Width / jpeg.Height;

      // altura fixa (exemplo)
      h := QRImage1.Height;

      // calcula largura proporcional
      w := Round(h * prop);

      QRImage1.Width := w;

      QRImage1.Picture.Assign(jpeg);
      //Deixar para a direita
      QRImage1.Left := TQRCustomBand(QRImage1.Parent).Width - QRImage1.Width;

    finally
      buf.free;
      jpeg.free;
    end;
  end
  else
    QRImage1.Picture.Assign(nil);
end;

end.
