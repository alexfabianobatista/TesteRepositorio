unit URPedido40Colunas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QuickRpt, grimgctrl, QRCtrls, QRExport, QRWebFilt,
  QRPDFFilt, ExtCtrls;

type
  TFRPedido40Colunas = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRBDetail: TQRBand;
    QRDBTQtde: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBTDescProduto: TQRDBText;
    QRBand4: TQRBand;
    QRExprSQtde: TQRExpr;
    QRMObservacao: TQRMemo;
    QRBand5: TQRBand;
    QRLabel13: TQRLabel;
    QRLDtEmissao: TQRLabel;
    QRLTipoPagto: TQRLabel;
    QRLabel22: TQRLabel;
    QRLPedido: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
    QRDBText1: TQRDBText;
    QRLPagar: TQRLabel;
    QRM1: TQRMemo;
    QRM2: TQRMemo;
    QRM3: TQRMemo;
    QRChildBand1: TQRChildBand;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRMCliente: TQRMemo;
    QRMEnderecoFilial: TQRMemo;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel4: TQRLabel;
    QRCBPrazo: TQRChildBand;
    QRMemoPrazo: TQRMemo;
    QRCBTroco: TQRChildBand;
    QRCBCondicional: TQRChildBand;
    QRDBText11: TQRDBText;
    QRHRule1: TQRHRule;
    QRLValorPago: TQRLabel;
    QREValorPago: TQRExpr;
    QRDBTTroco: TQRDBText;
    QRLTroco: TQRLabel;
    QRCBVales: TQRChildBand;
    QRLVales: TQRLabel;
    QRCBEntrada: TQRChildBand;
    QRLEntrada: TQRLabel;
    QRDBTEntrada: TQRDBText;
    QRDBText3: TQRDBText;
    QRChildBand2: TQRChildBand;
    QRLabel3: TQRLabel;
    QRCBTotal: TQRChildBand;
    QRLabel5: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText12: TQRDBText;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedido40Colunas: TFRPedido40Colunas;

implementation

uses UNotaSaida_cl, UParamSistema_cl, UOracle_cl;

{$R *.dfm}

procedure TFRPedido40Colunas.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  QRDBText12.Enabled := false;
  if (DMParamSistema.CodEmpresa = 'MODASUL') then
  begin
    QRLabel4.Enabled := True;
    QRDBText10.Enabled := True;
  end;
  if DMParamSistema.CodEmpresa = 'MAVENIDA' then
  begin
    QRDBText7.Left := 49;
    QRDBTDescProduto.Left := 81;
  end;
  if DMParamSistema.CodEmpresa = 'NFCE-DOGAO' then
  begin
    QRDBText7.Enabled := False;
    QRDBText8.Enabled := False;
    QRDBTDescProduto.Left := 57;
    QRDBTDescProduto.Width := 200;
    QRDBTQtde.Font.Style := [fsBold];
    QRDBText2.Font.Style := [fsBold];
    QRDBTDescProduto.Font.Style := [fsBold];
    QRDBText4.Font.Style := [fsBold];
    QRDBText1.Font.Style := [fsBold];
    QRDBText5.Font.Style := [fsBold];
    QRDBText6.Font.Style := [fsBold];
    QRMObservacao.Font.Style := [fsBold];
    QRDBTQtde.Font.Size := 10;
    QRDBText2.Font.Size := 10;
    QRDBTDescProduto.Font.Size := 10;
    QRDBText4.Font.Size := 10;
    QRDBText1.Font.Size := 10;
    QRDBText5.Font.Size := 10;
    QRDBText6.Font.Size := 10;
    QRMObservacao.Font.Size := 10;
  end;
  if DMParamSistema.CodEmpresa = 'INSIDE' then
  begin
    QRLabel4.Enabled := True;
    QRDBText10.Enabled := True;
    QRDBText10.DataField := 'COD_LOTE_TIPO';
    QRMCliente.AutoStretch := False;        //Adicionado por Andre, 05/10/24 conforme suporte 9781
    QRMCliente.Height := 66;
    QRMCliente.Font.Size := 8;
  end;
  if (DMParamSistema.CodEmpresa = 'PRAIASMI') then
  begin
    QRDBText8.DataField := 'DESC_INF_ADICIONAL';
    QRDBText12.Enabled := true;
  end;
  if (DMParamSistema.CodEmpresa = 'FINESTRA') then
  begin
    QRDBText8.Enabled := False;
  end;

  with DMNotaSaida do
    if DMNotaSaida.QRPedidoEspelhoind_condicional.Value = 'S' then
    begin
      QRLabel22.Caption := 'Condicional: ' + DMNotaSaida.QRPedidoEspelhoNUM_NOTA.Text;
      QRCBEntrada.Height := 0;
      QRCBVales.Height := 0;
      QRCBTroco.Height := 0;
    end
    else
    begin
      QRLabel22.Caption := 'Pedido: ' + DMNotaSaida.QRPedidoEspelhoNUM_NOTA.Text;
      QRCBCondicional.Height := 0;

      if QRPedidoEspelhoVAL_AVISTA.Value = 0 then
        QRCBEntrada.Height := 0;
      if QRPedidoEspelhoSVAL_TOTAL_VALES.Value = 0 then
        QRCBVales.Height := 0;
      if QRPedidoEspelhoVAL_TROCO.Value <= 0 then
        QRCBTroco.Height := 0;


    end;
end;

end.
