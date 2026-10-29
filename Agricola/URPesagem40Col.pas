unit URPesagem40Col;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, grimgctrl, QRCtrls, ExtCtrls;

type
  TFRPesagem40Col = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRHRule1: TQRHRule;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRExpr6: TQRExpr;
    QRLogo: TQRImage;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLInmetro: TQRLabel;
    QRDBMensagem: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText14: TQRDBText;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPesagem40Col: TFRPesagem40Col;

implementation

uses URomaneioAgricola_cl, UOracle_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFRPesagem40Col.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var wCaminhoImagem : String;
begin
  {if FileExists('logotipo.jpg') then
    QRLogo.Picture.LoadFromFile('logotipo.jpg');}
  wCaminhoImagem := ExtractFilePath(Application.ExeName) + 'logo\logotipo.jpg';
  QRLogo.Picture.LoadFromFile(wCaminhoImagem);
  if (DMParamSistema.CodEmpresa = 'ITATIBA') then
  begin
    QRLogo.Enabled := false;
    QRLogo.Visible := false;
    QRLabel10.Enabled := false;
    QRDBText9.Enabled := false;
    QRLabel4.Enabled := false;
    QRDBText6.Enabled := false;

    QRLabel2.Enabled := true;
  end;

end;

procedure TFRPesagem40Col.FormCreate(Sender: TObject);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CEREAIS' then
     QRLInmetro.Enabled := True;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ALIANCA' then
     QRDBMensagem.Enabled := True;
end;

end.
