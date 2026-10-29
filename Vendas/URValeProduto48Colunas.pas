unit URValeProduto48Colunas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl;

type
  TFRValeProduto48Colunas = class(TFTRelSimples)
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLogo: TQRImage;
    QRDBText1: TQRDBText;
    QRSysData3: TQRSysData;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRBand5: TQRBand;
    QRLabel4: TQRLabel;
    QRHRule4: TQRHRule;
    QRHRule1: TQRHRule;
    QRBand3: TQRBand;
    QRHRule2: TQRHRule;
    QRLabel5: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText13: TQRDBText;
    QRLValeProduto: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRBand4: TQRBand;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel14: TQRLabel;
    QRChildBand1: TQRChildBand;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRHRule5: TQRHRule;
    QRDBText11: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRCBValidade: TQRChildBand;
    QRLValidade: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    fSegundaVia: Boolean;
  public
    { Public declarations }
    property pSegundaVia: Boolean read fSegundaVia write fSegundaVia;
  end;

var
  FRValeProduto48Colunas: TFRValeProduto48Colunas;

implementation

uses UOracle_cl, UDevolucaoTroca_cl, UBiblioteca, UParamSistema_cl;

{$R *.dfm}

procedure TFRValeProduto48Colunas.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var wCaminhoLogo: String;
begin
  inherited;
  if DMDevolucaoTroca.QRValeProdutoDESC_TIPO_VALE.Value = 'VALE-COMPRAS' then
  begin
    QRLValeProduto.Caption := 'VALE-COMPRAS Nº ' + DMDevolucaoTroca.QRValeProdutoCOD_VALE_PRODUTO.Text;
    QRBand5.Enabled := True;
    QRBand4.Enabled := False;
    QRChildBand1.Enabled := False;
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FERRAGMED') or
       (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DONABENTA') then
    begin
      QRCBValidade.Enabled := True;
      QRLValidade.Caption := 'Válido somente até ' + FormatDateTime('dd/MM/yyyy',
        IncMonth(DMDevolucaoTroca.QRValeProdutoDT_EMISSAO.Value, 6));
    end
    else
      QRCBValidade.Enabled := False;
  end
  else
  begin
    QRLValeProduto.Caption := 'VALE-PRESENTE Nº ' + DMDevolucaoTroca.QRValeProdutoCOD_VALE_PRODUTO.Text;
    QRBand5.Enabled := False;
    QRCBValidade.Enabled := False;
    if (DMDevolucaoTroca.QRValeProdutoIND_FORMA_PGTO_VALE_PRESENTE.Value = 2) and
       fSegundaVia then
    begin
      QRBand4.Enabled := True;
      QRChildBand1.Enabled := True;
    end
    else
    begin
      QRBand4.Enabled := False;
      QRChildBand1.Enabled := False;
    end;
  end;
  wCaminhoLogo := ExtractFilePath(Application.ExeName) + 'logo\logo.jpg';
  if FileExists(wCaminhoLogo) then
    QRLogo.Picture.LoadFromFile(wCaminhoLogo);
end;

end.
