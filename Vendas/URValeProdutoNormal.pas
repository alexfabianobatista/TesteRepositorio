unit URValeProdutoNormal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl;

type
  TFRValeProdutoNormal = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRHRule1: TQRHRule;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRHRule2: TQRHRule;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRHRule4: TQRHRule;
    QRLogo: TQRImage;
    QRLabel13: TQRLabel;
    QRDBText14: TQRDBText;
    QRLValeProduto: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText15: TQRDBText;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRValeProdutoNormal: TFRValeProdutoNormal;

implementation

uses UDevolucaoTroca_cl, UOracle_cl;

{$R *.dfm}

procedure TFRValeProdutoNormal.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var wCaminhoLogoDanfe: String;
begin
  inherited;
  QRLValeProduto.Caption := 'VALE-COMPRAS Nº ' +
    DMDevolucaoTroca.QRValeProdutoCOD_VALE_PRODUTO.Text;

  //wCaminhoLogoDanfe := DMOracle.FastSelect('DESC_LOGOTIPO_DANFE','TB_FILIAL',
  //    'COD_FILIAL = '+ DMDevolucaoTroca.QRValeProdutoCOD_FILIAL.Text);
  //if wCaminhoLogoDanfe <> '' then
  if FileExists('logo.jpg') then
    QRLogo.Picture.LoadFromFile('logo.jpg');
end;

end.
