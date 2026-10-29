unit UREtiquetasAssinantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TFREtiquetasAssinantes = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRLNome1: TQRLabel;
    QRLEndereco1: TQRLabel;
    QRLCidade1: TQRLabel;
    QRLCEP1: TQRLabel;
    QRLNome2: TQRLabel;
    QRLEndereco2: TQRLabel;
    QRLCidade2: TQRLabel;
    QRLCEP2: TQRLabel;
    QRLNome3: TQRLabel;
    QRLEndereco3: TQRLabel;
    QRLCidade3: TQRLabel;
    QRLCEP3: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREtiquetasAssinantes: TFREtiquetasAssinantes;

implementation

uses UCadastro_Rel_cl;

{$R *.dfm}

procedure TFREtiquetasAssinantes.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with DMCadastro_Rel do
  begin
    if  not QREtiquetaAssinantes.Eof then
    begin
      QRLNome1.Caption     := QREtiquetaAssinantesNOME.Text;
      QRLEndereco1.Caption := QREtiquetaAssinantesDESC_ENDERECO.Text;
      QRLCidade1.Caption   := QREtiquetaAssinantesDESC_CIDADE.Text;
      QRLCEP1.Caption      := QREtiquetaAssinantesDESC_CEP.Text;
      QREtiquetaAssinantes.Next;
    end;
    if  not QREtiquetaAssinantes.Eof then
    begin
      QRLNome2.Caption     := QREtiquetaAssinantesNOME.Text;
      QRLEndereco2.Caption := QREtiquetaAssinantesDESC_ENDERECO.Text;
      QRLCidade2.Caption   := QREtiquetaAssinantesDESC_CIDADE.Text;
      QRLCEP2.Caption      := QREtiquetaAssinantesDESC_CEP.Text;
      QREtiquetaAssinantes.Next;
    end;
    if  not QREtiquetaAssinantes.Eof then
    begin
      QRLNome3.Caption     := QREtiquetaAssinantesNOME.Text;
      QRLEndereco3.Caption := QREtiquetaAssinantesDESC_ENDERECO.Text;
      QRLCidade3.Caption   := QREtiquetaAssinantesDESC_CIDADE.Text;
      QRLCEP3.Caption      := QREtiquetaAssinantesDESC_CEP.Text;
    end;
  end;
end;

procedure TFREtiquetasAssinantes.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  QRLNome1.Caption     := '';
  QRLEndereco1.Caption := '';
  QRLCidade1.Caption   := '';
  QRLCEP1.Caption      := '';
  QRLNome2.Caption     := '';
  QRLEndereco2.Caption := '';
  QRLCidade2.Caption   := '';
  QRLCEP2.Caption      := '';
  QRLNome3.Caption     := '';
  QRLEndereco3.Caption := '';
  QRLCidade3.Caption   := '';
  QRLCEP3.Caption      := '';
end;

end.
