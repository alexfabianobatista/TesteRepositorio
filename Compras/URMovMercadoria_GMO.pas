unit URMovMercadoria_GMO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFrMovMercadoria_GMO = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLDadosCliente: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand4: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLFilial: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand5: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrMovMercadoria_GMO: TFrMovMercadoria_GMO;

implementation

uses URelatorio_Compra_cl;

{$R *.DFM}

procedure TFrMovMercadoria_GMO.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLDadosCliente.Caption := Trim(DMRelatorio_Compra.QRMovMercadoria_GMONum_Cgc_Cpf.Value) + ' - ' +
                             Trim(DMRelatorio_Compra.QRMovMercadoria_GMOCod_Cadastro.Text) + ' - ' +
                             Trim(DMRelatorio_Compra.QRMovMercadoria_GMONome_Cadastro.Value) + ' - ' +
                             Trim(DMRelatorio_Compra.QRMovMercadoria_GMODesc_Endereco.Value) + ' - ' +
                             Trim(DMRelatorio_Compra.QRMovMercadoria_GMODesc_Cidade.Value) + ' - ' +
                             Trim(DMRelatorio_Compra.QRMovMercadoria_GMOCod_Estado.Value) + ' - ' +
                             Trim(DMRelatorio_Compra.QRMovMercadoria_GMODESC_CEP.Value) + ' - ' +
                             Trim(DMRelatorio_Compra.QRMovMercadoria_GMODesc_Telefone.Value);
end;

end.
