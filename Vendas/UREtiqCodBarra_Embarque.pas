unit UREtiqCodBarra_Embarque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, Barcode, ExtCtrls, clipbrd;

type
  TFREtiqCodBarra_Embarque = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRL_DT1: TQRLabel;
    QRL_DT2: TQRLabel;
    QRL_DT3: TQRLabel;
    QRLVolume1: TQRLabel;
    QRLVolume2: TQRLabel;
    QRLVolume3: TQRLabel;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRImage3: TQRImage;
    Barcode1: TBarcode;
    Barcode2: TBarcode;
    Barcode3: TBarcode;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREtiqCodBarra_Embarque: TFREtiqCodBarra_Embarque;

implementation

uses UEmbarque_cl, UOracle_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFREtiqCodBarra_Embarque.DetailBand1BeforePrint(
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

  with DMEmbarque do
  begin
    if QEtiquetaETIQUETA1.Text <> '' then
    Begin
      FREtiqCodBarra_Embarque.QRL_DT1.Caption := datetostr(DMOracle.QDataServDTSERVIDOR.Value);
      if(DMParamSistema.CodEmpresa = 'ABATE') then
      begin
        produto := copy(QEtiquetaETIQUETA1.Text,7,6);
        FREtiqCodBarra_Embarque.QRLVolume1.Caption := 'Volume ' + copy(QEtiquetaETIQUETA1.Text,13,1) +
                                                   ' de ' + copy(QEtiquetaETIQUETA1.Text,14,1);
      end
      else
      begin
        FREtiqCodBarra_Embarque.QRLVolume1.Caption := '';
        produto := copy(QEtiquetaETIQUETA1.Text,1,6);
      end;
      QEtiquetadesc_produto1.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + produto);
    end;
    if QEtiquetaETIQUETA2.Text <> '' then
    Begin
      FREtiqCodBarra_Embarque.QRL_DT2.Caption := datetostr(DMOracle.QDataServDTSERVIDOR.Value);
      if(DMParamSistema.CodEmpresa = 'ABATE') then
      begin
        produto := copy(QEtiquetaETIQUETA2.Text,7,6);
        FREtiqCodBarra_Embarque.QRLVolume2.Caption := 'Volume ' + copy(QEtiquetaETIQUETA2.Text,13,1) +
                                                   ' de ' + copy(QEtiquetaETIQUETA2.Text,14,1);
      end
      else
      begin
        FREtiqCodBarra_Embarque.QRLVolume2.Caption := '';
        produto := copy(QEtiquetaETIQUETA2.Text,1,6);
      end;
      QEtiquetadesc_produto2.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + produto);
    end;
    if QEtiquetaETIQUETA3.Text <> '' then
    begin
      FREtiqCodBarra_Embarque.QRL_DT3.Caption := datetostr(DMOracle.QDataServDTSERVIDOR.Value);
      if(DMParamSistema.CodEmpresa = 'ABATE') then
      begin
        produto := copy(QEtiquetaETIQUETA3.Text,7,6);
        FREtiqCodBarra_Embarque.QRLVolume3.Caption := 'Volume ' + copy(QEtiquetaETIQUETA3.Text,13,1) +
                                                     ' de ' + copy(QEtiquetaETIQUETA3.Text,14,1);
      end
      else
      begin
        FREtiqCodBarra_Embarque.QRLVolume3.Caption := '';
        produto := copy(QEtiquetaETIQUETA3.Text,1,6);
      end;
      QEtiquetadesc_produto3.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + produto);
    end;

  end;
end;

end.
