unit UrCadastroEnvelope;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers;

type
  TFrCadastroEnvelope = class(TForm)
    QrPrimario: TQuickRep;
    QRBDetail: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRCidade_Uf: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand2: TQRBand;
    QRBand1: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    procedure QRBDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QrPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrCadastroEnvelope: TFrCadastroEnvelope;

implementation

uses UCadastro_Rel_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFrCadastroEnvelope.QRBDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrCidade_Uf.Caption := Trim(DMCadastro_Rel.QrCadastroEnvelopesDesc_Cidade_Cobranca.Text) + ' - ' + Trim(DMCadastro_Rel.QrCadastroEnvelopesDesc_Estado_Cobranca.Text);
end;

procedure TFrCadastroEnvelope.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  if DMParamSistema.CodEmpresa = 'MARTICAR' then // para impressao laser envolope personalizado
    for i:=0 to ComponentCount - 1 do
      if (Components[i] is TQRPrintable) then
        with (Components[i] as TQRPrintable) do
          if (Parent = QRBDetail) then
            Top := Top + 40;

end;

procedure TFrCadastroEnvelope.QrPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if DMParamSistema.CodEmpresa = 'FURGOESMED' then
  begin
     QRBand1.Enabled := true;
     QRBDetail.Enabled := false;
  end;

end;

end.
