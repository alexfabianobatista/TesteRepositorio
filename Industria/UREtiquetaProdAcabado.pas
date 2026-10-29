unit UREtiquetaProdAcabado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, Barcode, ExtCtrls, clipbrd;

type
  TFREtiquetaProdAcabado = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRL_DT1: TQRLabel;
    QRL_DT2: TQRLabel;
    QRL_DT3: TQRLabel;
    QRL_DT4: TQRLabel;
    QRL_DT5: TQRLabel;
    QRLVolumes1: TQRLabel;
    QRLVolumes2: TQRLabel;
    QRLVolumes3: TQRLabel;
    QRLVolumes4: TQRLabel;
    QRLVolumes5: TQRLabel;
    QRLProduto1: TQRLabel;
    QRLProduto2: TQRLabel;
    QRLProduto3: TQRLabel;
    QRLProduto4: TQRLabel;
    QRLProduto5: TQRLabel;
    QRImage1: TQRImage;
    Barcode1: TBarcode;
    QRImage2: TQRImage;
    QRImage3: TQRImage;
    QRImage4: TQRImage;
    QRImage5: TQRImage;
    Barcode2: TBarcode;
    Barcode3: TBarcode;
    Barcode4: TBarcode;
    Barcode5: TBarcode;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREtiquetaProdAcabado: TFREtiquetaProdAcabado;
  wCont, wNum_Volume : integer;
implementation

uses UOrdemProducao_cl, UOracle_cl, UFormulaParam;

{$R *.DFM}

procedure TFREtiquetaProdAcabado.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
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
      FREtiquetaProdAcabado.QRL_DT1.Caption := datetostr(DMOracle.QDataServDTSERVIDOR.Value);
      wProduto := copy(QREtiquetaVolumesCOD_ETIQUETA.Text,7,6);
      FrEtiquetaProdAcabado.QRLProduto1.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + wProduto);
      FrEtiquetaProdAcabado.QRLVolumes1.Caption:= Copy(QREtiquetaVolumesCOD_ETIQUETA.Text,13,1)+' Volumes';
      QREtiquetaVolumes.Next;
    end;

    Barcode2.Digits := DMOrdemProducao.QrEtiquetaVolumesCOD_ETIQUETA.Value;
    Barcode2.BarcodeCopy;
    QRImage2.Picture.Assign(Clipboard);
    if QREtiquetaVolumesCOD_ETIQUETA.Text <> '' then
    Begin
      FREtiquetaProdAcabado.QRL_DT2.Caption := datetostr(DMOracle.QDataServDTSERVIDOR.Value);
      wProduto := copy(QREtiquetaVolumesCOD_ETIQUETA.Text,7,6);
      wNum_Volume := StrToInt(DMOracle.BuscaNome('SELECT NUM_VOLUMES FROM TB_PRODUTO','COD_PRODUTO ='+wProduto));
      FrEtiquetaProdAcabado.QRLProduto2.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + wProduto);
      FrEtiquetaProdAcabado.QRLVolumes2.Caption:= Copy(QREtiquetaVolumesCOD_ETIQUETA.Text,13,1)+' Volumes';
      QREtiquetaVolumes.Next;
    end;

    Barcode3.Digits := DMOrdemProducao.QrEtiquetaVolumesCOD_ETIQUETA.Value;
    Barcode3.BarcodeCopy;
    QRImage3.Picture.Assign(Clipboard);
    if QREtiquetaVolumesCOD_ETIQUETA.Text <> '' then
    begin
      FREtiquetaProdAcabado.QRL_DT3.Caption := datetostr(DMOracle.QDataServDTSERVIDOR.Value);
      wProduto := copy(QREtiquetaVolumesCOD_ETIQUETA.Text,7,6);
      wNum_Volume := StrToInt(DMOracle.BuscaNome('SELECT NUM_VOLUMES FROM TB_PRODUTO','COD_PRODUTO ='+wProduto));
      FrEtiquetaProdAcabado.QRLProduto3.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + wProduto);
      FrEtiquetaProdAcabado.QRLVolumes3.Caption:= Copy(QREtiquetaVolumesCOD_ETIQUETA.Text,13,1)+' Volumes';
      QREtiquetaVolumes.Next;
    end;

    Barcode4.Digits := DMOrdemProducao.QrEtiquetaVolumesCOD_ETIQUETA.Value;
    Barcode4.BarcodeCopy;
    QRImage4.Picture.Assign(Clipboard);
    if QREtiquetaVolumesCOD_ETIQUETA.Text <> '' then
    begin
      FREtiquetaProdAcabado.QRL_DT4.Caption := datetostr(DMOracle.QDataServDTSERVIDOR.Value);
      wProduto := copy(QREtiquetaVolumesCOD_ETIQUETA.Text,7,6);
      wNum_Volume := StrToInt(DMOracle.BuscaNome('SELECT NUM_VOLUMES FROM TB_PRODUTO','COD_PRODUTO ='+wProduto));
      FrEtiquetaProdAcabado.QRLProduto4.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + wProduto);
      FrEtiquetaProdAcabado.QRLVolumes4.Caption:= Copy(QREtiquetaVolumesCOD_ETIQUETA.Text,13,1)+' Volumes';
      QREtiquetaVolumes.Next;
    end;

    Barcode5.Digits := DMOrdemProducao.QrEtiquetaVolumesCOD_ETIQUETA.Value;
    Barcode5.BarcodeCopy;
    QRImage5.Picture.Assign(Clipboard);
    if QREtiquetaVolumesCOD_ETIQUETA.Text <> '' then
    begin
      FREtiquetaProdAcabado.QRL_DT5.Caption := datetostr(DMOracle.QDataServDTSERVIDOR.Value);
      wProduto := copy(QREtiquetaVolumesCOD_ETIQUETA.Text,7,6);
      wNum_Volume := StrToInt(DMOracle.BuscaNome('SELECT NUM_VOLUMES FROM TB_PRODUTO','COD_PRODUTO ='+wProduto));
      FrEtiquetaProdAcabado.QRLProduto5.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + wProduto);
      FrEtiquetaProdAcabado.QRLVolumes5.Caption:= Copy(QREtiquetaVolumesCOD_ETIQUETA.Text,13,1)+' Volumes';
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

procedure TFREtiquetaProdAcabado.QuickRep1BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  wCont:=0;
end;

end.
