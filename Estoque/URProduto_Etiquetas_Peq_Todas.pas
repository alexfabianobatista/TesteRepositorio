unit URProduto_Etiquetas_Peq_Todas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  quickrpt, ExtCtrls, Qrctrls;

type
  TFRProduto_Etiqueta_Peq_Todas = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRDBNumFab: TQRDBText;
    QRDBDescProd: TQRDBText;
    QRDBValVarejo: TQRDBText;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProduto_Etiqueta_Peq_Todas: TFRProduto_Etiqueta_Peq_Todas;

implementation

uses UProduto_cl, UProdutoRelatorio_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRProduto_Etiqueta_Peq_Todas.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if (DMParamSistema.CodEmpresa = 'RADIO') then
    QRPrimario.Page.TopMargin := 6;
end;

procedure TFRProduto_Etiqueta_Peq_Todas.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (DMParamSistema.CodEmpresa = 'RADIO') then
  begin
    QRDBDescProd.AutoStretch := False;
    QRDBDescProd.AutoSize := False;
    QRDBDescProd.WordWrap := True;
    QRDBNumFab.Left := 25;//12;
    QRDBDescProd.Left := 25;//12;
    QRDBDescProd.Width := 195;//300;
    QRDBDescProd.Height := 34;
    QRDBValVarejo.Top := 51;
    QRLabel1.Top := 51;
  end;
end;

end.
