unit UREtiqCodBarra_Producao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls, Qrctrls, Barcode, clipbrd;

type
  TFREtiqCodBarra_Producao = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRL_DT1: TQRLabel;
    QRL_DT2: TQRLabel;
    QRL_DT3: TQRLabel;
    QRL_DT4: TQRLabel;
    QRL_DT5: TQRLabel;
    QRLVolume1: TQRLabel;
    QRLVolume2: TQRLabel;
    QRLVolume3: TQRLabel;
    QRLVolume4: TQRLabel;
    QRLVolume5: TQRLabel;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRImage3: TQRImage;
    QRImage4: TQRImage;
    QRImage5: TQRImage;
    Barcode1: TBarcode;
    Barcode2: TBarcode;
    Barcode3: TBarcode;
    Barcode4: TBarcode;
    Barcode5: TBarcode;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREtiqCodBarra_Producao: TFREtiqCodBarra_Producao;

implementation

uses UEmbarque_cl, UEmbarqueParam, UOracle_cl;

{$R *.DFM}

procedure TFREtiqCodBarra_Producao.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
produto : string;
begin

  Barcode1.Digits := DMEmbarque.QEtiquetaETIQUETA1.Value;
  Barcode1.BarcodeCopy;
  QRImage1.Picture.Assign(Clipboard);

  Barcode2.Digits := DMEmbarque.QEtiquetaETIQUETA2.Value;
  Barcode2.BarcodeCopy;
  QRImage2.Picture.Assign(Clipboard);

  Barcode3.Digits := DMEmbarque.QEtiquetaETIQUETA3.Value;
  Barcode3.BarcodeCopy;
  QRImage3.Picture.Assign(Clipboard);

  Barcode4.Digits := DMEmbarque.QEtiquetaETIQUETA4.Value;
  Barcode4.BarcodeCopy;
  QRImage4.Picture.Assign(Clipboard);

  Barcode5.Digits := DMEmbarque.QEtiquetaETIQUETA5.Value;
  Barcode5.BarcodeCopy;
  QRImage5.Picture.Assign(Clipboard);


  with DMEmbarque do
  begin
    if QEtiquetaETIQUETA1.Text <> '' then
    Begin
      FREtiqCodBarra_Producao.QRL_DT1.Caption := datetostr(DMOracle.QDataServDTSERVIDOR.Value);
      produto := copy(QEtiquetaETIQUETA1.Text,7,6);
      FREtiqCodBarra_Producao.QRLVolume1.Caption := 'Volume '+copy(QEtiquetaETIQUETA1.Text,13,1);
      QEtiquetadesc_produto1.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + produto);
    end;
    if QEtiquetaETIQUETA2.Text <> '' then
    Begin
      FREtiqCodBarra_Producao.QRL_DT2.Caption := datetostr(DMOracle.QDataServDTSERVIDOR.Value);
      produto := copy(QEtiquetaETIQUETA2.Text,7,6);
      FREtiqCodBarra_Producao.QRLVolume2.Caption := 'Volume '+copy(QEtiquetaETIQUETA2.Text,13,1);
      QEtiquetadesc_produto2.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + produto);
    end;
    if QEtiquetaETIQUETA3.Text <> '' then
    begin
      FREtiqCodBarra_Producao.QRL_DT3.Caption := datetostr(DMOracle.QDataServDTSERVIDOR.Value);
      produto := copy(QEtiquetaETIQUETA3.Text,7,6);
      FREtiqCodBarra_Producao.QRLVolume3.Caption := 'Volume '+copy(QEtiquetaETIQUETA3.Text,13,1);
      QEtiquetadesc_produto3.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + produto);
    end;
    if QEtiquetaETIQUETA4.Text <> '' then
    begin
      FREtiqCodBarra_Producao.QRL_DT4.Caption := datetostr(DMOracle.QDataServDTSERVIDOR.Value);
      produto := copy(QEtiquetaETIQUETA4.Text,7,6);
      FREtiqCodBarra_Producao.QRLVolume4.Caption := 'Volume '+copy(QEtiquetaETIQUETA4.Text,13,1);
      QEtiquetadesc_produto4.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + produto);
    end;
    if QEtiquetaETIQUETA5.Text <> '' then
    begin
      FREtiqCodBarra_Producao.QRL_DT5.Caption := datetostr(DMOracle.QDataServDTSERVIDOR.Value);
      produto := copy(QEtiquetaETIQUETA5.Text,7,6);
      FREtiqCodBarra_Producao.QRLVolume5.Caption := 'Volume '+copy(QEtiquetaETIQUETA5.Text,13,1);
      QEtiquetadesc_produto5.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + produto);
    end;
  end;
  If FEmbarqueParam.RG17Data.ItemIndex = 1 then
  Begin
    QRL_DT1.Caption := '';
    QRL_DT2.Caption := '';
    QRL_DT3.Caption := '';
    QRL_DT4.Caption := '';
    QRL_DT5.Caption := '';
  end; 
end;
end.
