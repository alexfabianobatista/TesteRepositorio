unit URNota_ComissaoCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, variants, QRWebFilt,
  QRPDFFilt;

type
  TFRNota_ComissaoCliente = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGCabVendedor: TQRGroup;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBRodTotalVendedor: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel12: TQRLabel;
    QrNrPedido: TQRLabel;
    QRLabel14: TQRLabel;
    QRLQuantidade: TQRLabel;
    QRDBText12: TQRDBText;
    QRLQuota: TQRLabel;
    QRLabel15: TQRLabel;
    QRLFilial: TQRLabel;
    QRDBText1: TQRDBText;
    QRExpr5: TQRExpr;
    QRLObservacao: TQRLabel;
    QRLObservacao1: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel13: TQRLabel;
    QRExpr4: TQRExpr;
    QRBand4: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel17: TQRLabel;
    QRDBText13: TQRDBText;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGCabVendedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_ComissaoCliente: TFRNota_ComissaoCliente;

implementation

uses UOracle_cl, UNotaSaidaParam, UParamSistema_cl, URelatorioVenda_cl,
  UNotaSaida_cl;

{$R *.DFM}

procedure TFRNota_ComissaoCliente.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QrNrPedido.Caption := ' ';
  If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'FAVILLE' Then
  Begin
    With DMNotaSaida do
    begin
      QrAchaNrPedido.Close;
      QrAchaNrPedido.SetVariable('PK',DMRelatorio_Venda.QrComissaoClienteCod_Nota_Cab.Value);
      QrAchaNrPedido.Open;
      If QrAchaNrPedido.RecordCount > 0 then
         QrNrPedido.Caption := FloatToStr(QrAchaNrPedidoNum_pedido.Value);
    end;
  End;
end;

procedure TFRNota_ComissaoCliente.QRGCabVendedorBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var Ano,mes,dia :word;
begin
  inherited;
  With DMRelatorio_Venda do
  Begin
    QrQuotaVend2.Close;
    DeCodeDate(StrToDate(FNotaSaidaParam.ME10DataI.Text),Ano, mes,dia);
    QrQuotaVend2.SetVariable('ANO',Ano);
    QrQuotaVend2.SetVariable('MES',Mes);
    QrQuotaVend2.SetVariable('VENDEDOR',DMRelatorio_Venda.QRComissaoClienteCod_Vendedor.Value);
    QrQuotaVend2.Open;
    If QrQuotaVend2.Eof
    Then
       QRLQuota.Caption := ''
    Else
       QRLQuota.Caption := FormatFloat('###,###',QrQuotaVend2SQt_Quota.Value);
 end;      
end;

procedure TFRNota_ComissaoCliente.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'INJEPAR') then
  begin
    QRLabel17.Enabled := true;
    QRDBText13.Enabled := true;
    QRExpr9.Enabled := true;
    QRExpr10.Enabled := true;
    QRLabel5.Caption := 'MECÂNICA';
    QRLabel6.Caption := 'Total Mecânica:';
    QRLTitulo.Caption := 'Comissão de Mecânicas por Cliente';
  end;
end;

end.
