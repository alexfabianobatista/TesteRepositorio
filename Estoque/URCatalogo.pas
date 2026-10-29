unit URCatalogo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, jpeg;

type
  TFRCatalogo = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRImage3: TQRImage;
    QRImage4: TQRImage;
    QRBand4: TQRBand;
    QRDBText21: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    wMostraPreco: boolean;
  public
    { Public declarations }
    property MostraPreco: boolean read wMostraPreco write wMostraPreco;
  end;

var
  FRCatalogo: TFRCatalogo;

implementation

uses UProduto_cl, UCatalogo, UParamSistema_cl, UFilial_cl;

{$R *.dfm}


procedure TFRCatalogo.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
 jpeg: tjpegimage;
 buf: tmemorystream;
begin
  inherited;
  with DMProduto do
  begin
    if CDSRCatalogoProdutoCOD_PRODUTO_1.Value > 0 then
    begin
      jpeg := TJpegImage.Create;
      buf := Tmemorystream.Create;
      try
        CDSRCatalogoProdutoIMAGEM_1.SaveToStream(buf);
        buf.Position:=0;
        jpeg.LoadFromStream(buf);
        //QRImage1.Picture.Assign(jpeg);
        QRImage1.Picture.Graphic := jpeg;
        QRLabel6.Caption := ' ' + CDSRCatalogoProdutoCOD_PRODUTO_1.Text
          + ' ' + CDSRCatalogoProdutoDESCRICAO_1.Value;
        QRLabel6.Caption := QRLabel6.Caption + #13#10;
        QRLabel6.Caption := QRLabel6.Caption + ' ' + CDSRCatalogoProdutoNUM_FABRICANTE_1.Value;
        if MostraPreco then
          QRLabel6.Caption := QRLabel6.Caption + '   ' + CDSRCatalogoProdutoPRECO_1.Text;
        QRLabel6.Caption := QRLabel6.Caption + #13#10;
        QRLabel6.Caption := QRLabel6.Caption + ' ' + CDSRCatalogoProdutoDESC_OBS_1.Text;
      finally
        buf.free;
        jpeg.free;
      end;
    end
    else
    begin
      QRImage1.Enabled := False;
      QRLabel6.Enabled := False;
    end;

    if CDSRCatalogoProdutoCOD_PRODUTO_2.Value > 0 then
    begin
      jpeg := TJpegImage.Create;
      buf := Tmemorystream.Create;
      try
        CDSRCatalogoProdutoIMAGEM_2.SaveToStream(buf);
        buf.Position:=0;
        jpeg.LoadFromStream(buf);
        QRImage2.Picture.Graphic := jpeg;
        QRLabel7.Caption := ' ' + CDSRCatalogoProdutoCOD_PRODUTO_2.Text + ' ' + CDSRCatalogoProdutoDESCRICAO_2.Value;
        QRLabel7.Caption := QRLabel7.Caption + #13#10;
        QRLabel7.Caption := QRLabel7.Caption + ' ' + CDSRCatalogoProdutoNUM_FABRICANTE_2.Value;
        if MostraPreco then
          QRLabel7.Caption := QRLabel7.Caption + '   ' + CDSRCatalogoProdutoPRECO_2.Text;
        QRLabel7.Caption := QRLabel7.Caption + #13#10;
        QRLabel7.Caption := QRLabel7.Caption + ' ' + CDSRCatalogoProdutoDESC_OBS_2.Value;
      finally
        buf.free;
        jpeg.free;
      end;
    end
    else
    begin
      QRImage2.Enabled := False;
      QRLabel7.Enabled := False;
    end;

    if CDSRCatalogoProdutoCOD_PRODUTO_3.Value > 0 then
    begin
      jpeg := TJpegImage.Create;
      buf := Tmemorystream.Create;
      try
        CDSRCatalogoProdutoIMAGEM_3.SaveToStream(buf);
        buf.Position:=0;
        jpeg.LoadFromStream(buf);
        QRImage3.Picture.Graphic := jpeg;
        QRLabel8.Caption := ' ' + CDSRCatalogoProdutoCOD_PRODUTO_3.Text + ' ' + CDSRCatalogoProdutoDESCRICAO_3.Value;
        QRLabel8.Caption := QRLabel8.Caption + #13#10;
        QRLabel8.Caption := QRLabel8.Caption + ' ' + CDSRCatalogoProdutoNUM_FABRICANTE_3.Value;
        if MostraPreco then
          QRLabel8.Caption := QRLabel8.Caption + '   ' + CDSRCatalogoProdutoPRECO_3.Text;
        QRLabel8.Caption := QRLabel8.Caption + #13#10;
        QRLabel8.Caption := QRLabel8.Caption + ' ' + CDSRCatalogoProdutoDESC_OBS_3.Value;
      finally
        buf.free;
        jpeg.free;
      end;
    end
    else
    begin
      QRImage3.Enabled := False;
      QRLabel8.Enabled := False;
    end;

    if CDSRCatalogoProdutoCOD_PRODUTO_4.Value > 0 then
    begin
      jpeg := TJpegImage.Create;
      buf := Tmemorystream.Create;
      try
        CDSRCatalogoProdutoIMAGEM_4.SaveToStream(buf);
        buf.Position:=0;
        jpeg.LoadFromStream(buf);
        QRImage4.Picture.Graphic := jpeg;
        QRLabel9.Caption := ' ' + CDSRCatalogoProdutoCOD_PRODUTO_4.Text + ' ' + CDSRCatalogoProdutoDESCRICAO_4.Value;
        QRLabel9.Caption := QRLabel9.Caption + #13#10;
        QRLabel9.Caption := QRLabel9.Caption + ' ' + CDSRCatalogoProdutoNUM_FABRICANTE_4.Value;
        if MostraPreco then
          QRLabel9.Caption := QRLabel9.Caption + '   ' + CDSRCatalogoProdutoPRECO_4.Text;
        QRLabel9.Caption := QRLabel9.Caption + #13#10;
        QRLabel9.Caption := QRLabel9.Caption + ' ' + CDSRCatalogoProdutoDESC_OBS_4.Value;
      finally
        buf.free;
        jpeg.free;
      end;
    end
    else
    begin
      QRImage4.Enabled := False;
      QRLabel9.Enabled := False;
    end;
  end;
end;

procedure TFRCatalogo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
{  FRCatalogo.Free;
  FRCatalogo := nil;  }
end;

procedure TFRCatalogo.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  QRImage1.Picture := nil;
  QRImage2.Picture := nil;
  QRImage3.Picture := nil;
  QRImage4.Picture := nil;
  QRLabel6.Caption := '';
  QRLabel7.Caption := '';
  QRLabel8.Caption := '';
  QRLabel9.Caption := '';
end;

procedure TFRCatalogo.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK','1');
  DMFilial.QFilial.Open;
end;

end.
 