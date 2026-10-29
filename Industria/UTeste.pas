unit UTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, Barcode, clipbrd;

type
  TFteste = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLProduto1: TQRLabel;
    QRL_DT1: TQRLabel;
    QRLVolumes1: TQRLabel;
    QRLProduto2: TQRLabel;
    QRL_DT2: TQRLabel;
    QRLVolumes2: TQRLabel;
    QRLProduto3: TQRLabel;
    QRL_DT3: TQRLabel;
    QRLVolumes3: TQRLabel;
    QRLProduto4: TQRLabel;
    QRL_DT4: TQRLabel;
    QRLVolumes4: TQRLabel;
    QRLProduto5: TQRLabel;
    QRL_DT5: TQRLabel;
    QRLVolumes5: TQRLabel;
    Barcode1: TBarcode;
    Barcode2: TBarcode;
    Barcode3: TBarcode;
    Barcode4: TBarcode;
    Barcode5: TBarcode;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRImage3: TQRImage;
    QRImage4: TQRImage;
    QRImage5: TQRImage;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fteste: TFteste;
  wCont, wNum_Volume : integer;

implementation

uses UOrdemProducao_cl, UREtiquetaProdAcabado, UOracle_cl, UFormulaParam;

{$R *.dfm}

procedure TFteste.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
wProduto : string;
begin
  with DMOrdemProducao do
  Begin
    if wCont <> 1 then
    Begin
      QREtiquetaVolumes.Close;
      QREtiquetaVolumes.open;
      QREtiquetaVolumes.First;
    end;

    Barcode1.Digits := DMOrdemProducao.QrEtiquetaVolumesCOD_ETIQUETA.Value;
    Barcode1.BarcodeCopy;
    QRImage1.Picture.Assign(Clipboard);
    if QREtiquetaVolumesCOD_ETIQUETA.Text <> '' then
    Begin
      Fteste.QRL_DT1.Caption := datetostr(DMOracle.QDataServDTSERVIDOR.Value);
      Fteste.QRLProduto1.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + copy(QREtiquetaVolumesCOD_ETIQUETA.Text,7,6));
      Fteste.QRLVolumes1.Caption:= Copy(QREtiquetaVolumesCOD_ETIQUETA.Text,13,1)+' Volumes';
      QREtiquetaVolumes.Next;
    end;

    Barcode2.Digits := DMOrdemProducao.QrEtiquetaVolumesCOD_ETIQUETA.Value;
    Barcode2.BarcodeCopy;
    QRImage2.Picture.Assign(Clipboard);
    if QREtiquetaVolumesCOD_ETIQUETA.Text <> '' then
    Begin
      Fteste.QRL_DT2.Caption := datetostr(DMOracle.QDataServDTSERVIDOR.Value);
      Fteste.QRLProduto2.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + copy(QREtiquetaVolumesCOD_ETIQUETA.Text,7,6));
      Fteste.QRLVolumes2.Caption:= Copy(QREtiquetaVolumesCOD_ETIQUETA.Text,13,1)+' Volumes';
      QREtiquetaVolumes.Next;
    end;

    Barcode3.Digits := DMOrdemProducao.QrEtiquetaVolumesCOD_ETIQUETA.Value;
    Barcode3.BarcodeCopy;
    QRImage3.Picture.Assign(Clipboard);
    if QREtiquetaVolumesCOD_ETIQUETA.Text <> '' then
    begin
      Fteste.QRL_DT3.Caption := datetostr(DMOracle.QDataServDTSERVIDOR.Value);
      Fteste.QRLProduto3.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + copy(QREtiquetaVolumesCOD_ETIQUETA.Text,7,6));
      Fteste.QRLVolumes3.Caption:= Copy(QREtiquetaVolumesCOD_ETIQUETA.Text,13,1)+' Volumes';
      QREtiquetaVolumes.Next;
    end;

    Barcode4.Digits := DMOrdemProducao.QrEtiquetaVolumesCOD_ETIQUETA.Value;
    Barcode4.BarcodeCopy;
    QRImage4.Picture.Assign(Clipboard);
    if QREtiquetaVolumesCOD_ETIQUETA.Text <> '' then
    begin
      Fteste.QRL_DT4.Caption := datetostr(DMOracle.QDataServDTSERVIDOR.Value);
      Fteste.QRLProduto4.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + copy(QREtiquetaVolumesCOD_ETIQUETA.Text,7,6));
      Fteste.QRLVolumes4.Caption:= Copy(QREtiquetaVolumesCOD_ETIQUETA.Text,13,1)+' Volumes';
      QREtiquetaVolumes.Next;
    end;

    Barcode5.Digits := DMOrdemProducao.QrEtiquetaVolumesCOD_ETIQUETA.Value;
    Barcode5.BarcodeCopy;
    QRImage5.Picture.Assign(Clipboard);
    if QREtiquetaVolumesCOD_ETIQUETA.Text <> '' then
    begin
      Fteste.QRL_DT5.Caption := datetostr(DMOracle.QDataServDTSERVIDOR.Value); 
      Fteste.QRLProduto5.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + copy(QREtiquetaVolumesCOD_ETIQUETA.Text,7,6));
      Fteste.QRLVolumes5.Caption:= Copy(QREtiquetaVolumesCOD_ETIQUETA.Text,13,1)+' Volumes';
      QREtiquetaVolumes.Next;
      wCont := 1;
    end;
  end;
  if FFormulaParam.CB4Data.Checked = False Then
  Begin
    QRL_DT1.Caption := '';
    QRL_DT2.Caption := '';
    QRL_DT3.Caption := '';
    QRL_DT4.Caption := '';
    QRL_DT5.Caption := '';
  end;
end;

procedure TFteste.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  wCont:=0;
end;

end.
