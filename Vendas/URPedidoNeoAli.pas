unit URPedidoNeoAli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl, jpeg;

type
  TFRPedidoNeoAli = class(TFTRelSimples)
    QRLogo: TQRImage;
    QRLLogo: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand4: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRBand5: TQRBand;
    QRDBText12: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText16: TQRDBText;
    QRImagemProduto: TQRImage;
    QRBSumOC: TQRBand;
    QRLabel10: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel20: TQRLabel;
    QRLTotal: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel30: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText26: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBSumOCBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedidoNeoAli: TFRPedidoNeoAli;
  wTotalPedido : Real;

implementation
uses  UPedido_cl;
{$R *.dfm}

procedure TFRPedidoNeoAli.QRBand1BeforePrint(Sender: TQRCustomBand;
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

procedure TFRPedidoNeoAli.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  jpeg: tjpegimage;
  wSemImagem: String;
  buf: tmemorystream;
begin
  inherited;
//  ShowMessage(DMPedido.QRPedidoCOD_PRODUTO.AsString);
  wSemImagem := '';
  if DMPedido.QRPedidoIMG_IMAGEM.Value <> '' then
  begin
    try
      jpeg := TJpegImage.Create;
      buf := Tmemorystream.Create;
      DMPedido.QRPedidoIMG_IMAGEM.SaveToStream(buf);
      buf.Position:=0;
      jpeg.LoadFromStream(buf);
      QRImagemProduto.Picture.Assign(jpeg);
    finally
      buf.free;
      jpeg.free;
    end;
  end
  else
  begin
    QRImagemProduto.Picture := Nil;
  end;
end;

procedure TFRPedidoNeoAli.QRBSumOCBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wTotalPedido := wTotalPedido - DMPedido.QRPedidoVAL_DESCONTO.Value + DMPedido.QRPedidoVAL_DESPESAS.Value;
  QRLTotal.Caption := FormatFloat(' ###,###,##0.00',wTotalPedido);
end;

procedure TFRPedidoNeoAli.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  wTotalPedido := 0;
end;

procedure TFRPedidoNeoAli.QRBand5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wTotalPedido := wTotalPedido+ (DMPedido.QrPedidoValor_Total.Value - (DMPedido.QRPedidoQT_PEDIDO.Value *
      (DMPedido.QRPedidoVAL_UNITARIO.Value * DMPedido.QRPedidoPERC_DESCONTO.Value/100)))+
      DMPedido.QRPedidoVal_substituicao.Value;
end;

end.
