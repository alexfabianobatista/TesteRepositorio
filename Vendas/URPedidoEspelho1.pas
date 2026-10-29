unit URPedidoEspelho1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRPedidoEspelho1 = class(TFTRelSimples)
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRBand3: TQRBand;
    QRSysData3: TQRSysData;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRBand4: TQRBand;
    QRLabel18: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRLTotal: TQRLabel;
    QRLPedido: TQRLabel;
    QRLDesconto: TQRLabel;
    QRLAcrescimo: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel24: TQRLabel;
    QRLSubstituicao: TQRLabel;
    QrlMensagem: TQRLabel;
    QRLAssinatura: TQRLabel;
    QRLSite: TQRLabel;
    QRShape2: TQRShape;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioAfterPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedidoEspelho1: TFRPedidoEspelho1;
  wTotalPedido,wDesconto,wSubstituicao : Real;

implementation

uses UPedido_cl, UOracle_cl;

{$R *.dfm}

procedure TFRPedidoEspelho1.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  wTotalPedido := 0;
  wDesconto := 0;
  wSubstituicao := 0;
end;

procedure TFRPedidoEspelho1.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wTotalPedido := wTotalPedido+DMPedido.QrPedidoValor_Total.Value;
  wDesconto := wDesconto + (DMPedido.QrPedidoValor_Total.Value * DMPedido.QRPedidoPERC_DESCONTO.Value / 100);
  wSubstituicao := wSubstituicao + DMPedido.QrPedidoVal_Substituicao.Value;
end;

procedure TFRPedidoEspelho1.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLPedido.Caption := FormatFloat('###,###,##0.00',wTotalPedido);
  QRLDesconto.Caption := FormatFloat('###,###,##0.00',wDesconto + DMPedido.QRPedidoVAL_DESCONTO.Value);
{  QRLAcrescimo.Caption := FormatFloat('###,###,##0.00',0);Isaque da Inside informou que não estava aparecendo o valor de acrescimo no relatório. Alex 04/01/2024}
  QRLAcrescimo.Caption := FormatFloat('###,###,##0.00',DMPedido.QRPedidoVAL_DESPESAS.Value);
  QRLSubstituicao.Caption := FormatFloat('###,###,##0.00',wSubstituicao);
{ Isaque da Inside informou que não estava aparecendo o valor de acrescimo no relatório. Alex 04/01/2024.
  QRLTotal.Caption := FormatFloat('###,###,##0.00',wTotalPedido - wDesconto + wSubstituicao - DMPedido.QRPedidoVAL_DESCONTO.Value);} //Adicionado wDesconto. Andre 30/05/2025.
  QRLTotal.Caption := FormatFloat('###,###,##0.00',wTotalPedido - wDesconto - DMPedido.QRPedidoVAL_DESCONTO.Value + wSubstituicao + DMPedido.QRPedidoVAL_DESPESAS.Value);
end;

procedure TFRPedidoEspelho1.QRPrimarioAfterPrint(Sender: TObject);
begin
  inherited;
  if DMPedido.QRPedidoIND_SITUACAO.Value = '1' then
    DMOracle.ExecutaSql('UPDATE TB_PEDIDO_CAB SET STEP_PEDIDO_WEB = 2, LOCAL_ULTIMA_ALTERACAO = ' +
      QuotedStr('CEMAPA') + ' WHERE COD_PEDIDO_CAB = '+ DMPedido.QRPedidoCOD_PEDIDO_CAB.Text);
end;

end.
