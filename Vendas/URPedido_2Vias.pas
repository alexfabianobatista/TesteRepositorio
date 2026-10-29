unit URPedido_2Vias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl, StdCtrls;

type
  TFRPedido_2Vias = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRBCabOC: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText29: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel38: TQRLabel;
    QRLNcm: TQRLabel;
    QRBand3: TQRBand;
    QRDBText11: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBTDescProduto: TQRDBText;
    QRDBTCodProduto: TQRDBText;
    QRDBTNcm: TQRDBText;
    QRDBText38: TQRDBText;
    QRBSumOC: TQRBand;
    QRLabel14: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel17: TQRLabel;
    QRLTotal: TQRLabel;
    QRLTotalQtde: TQRLabel;
    QRLabel37: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel40: TQRLabel;
    QRLabel42: TQRLabel;
    QRExpr3: TQRExpr;
    QRShape1: TQRShape;
    QRLabel33: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel36: TQRLabel;
    QRCompositeReport1: TQRCompositeReport;
    ChildBand1: TQRChildBand;
    QRHRule1: TQRHRule;
    QRLTroca: TQRLabel;
    QRLogo: TQRImage;
    QRLabel25: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBSumOCBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioAfterPrint(Sender: TObject);
    procedure QRBSumOCAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBCabOCBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedido_2Vias: TFRPedido_2Vias;
  wTotalPedido, wQtdeTotal, wM3, wVolumes, wPesoBruto, wPesoLiquido : Real;
  numVia :Integer = 0;
  
implementation

uses UOracle_cl, UPedido_cl, UNotaSaida_cl, Uparamsistema_cl;

{$R *.dfm}

procedure TFRPedido_2Vias.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLEmpresa.Caption := DMOracle.BuscaNome('SELECT DESC_FILIAL || ' + QuoteDStr(' Fone:') + ' || DESC_TELEFONE FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(DMPedido.QPedidoCod_Filial.Value));
end;

procedure TFRPedido_2Vias.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
Var
  wEmbalagem, wVol: String;
  wVal: Real;
begin
  inherited;
  wTotalPedido := wTotalPedido+ (DMPedido.QrPedidoValor_Total.Value - (DMPedido.QRPedidoQT_PEDIDO.Value *
                  (DMPedido.QRPedidoVAL_UNITARIO.Value * DMPedido.QRPedidoPERC_DESCONTO.Value/100)))+
                  DMPedido.QRPedidoVal_substituicao.Value;
  wQtdeTotal  := wQtdeTotal+DMPedido.QrPedidoQrQuantidade.Value;
  wEmbalagem := FloatToStr(DMPedido.QrPedidoNUM_EMBALAGEM.Value);
  wVol := FloatToStr(DMPedido.QrPedidoNUM_VOLUMES.Value);
  If Trim(wEmbalagem) <> '' Then
    wM3 := wM3 + DMPedido.QrPedidoQt_Pedido.Value * StrToFloat(wEmbalagem);
  If Trim(wVol) <> '' Then
    wVolumes := wVolumes + DMPedido.QrPedidoQt_Pedido.Value * StrToFloat(wVol);
end;

procedure TFRPedido_2Vias.QRBSumOCBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa <> 'DINIZ') then
  begin
    QRLogo.Enabled := false;
    QRLogo.Visible := false;
    QRLabel25.Enabled := false;
    QRLabel25.Visible := false;
  end;
  wTotalPedido := wTotalPedido - DMPedido.QRPedidoVAL_DESCONTO.Value;
  QRLTotal.Caption := FormatFloat(' ###,###,##0.00',wTotalPedido);
  QRLTotalQtde.caption := FormatFloat(' ###,###,##0.00',wQtdeTotal);
  if QRHRule1.Enabled then
    QRHRule1.Enabled := (numVia = 1);
//Solicitado por Diniz. Alex 17/08/2023.
  if (DMParamSistema.CodEmpresa = 'DINIZ') then
  begin
    QRLTroca.Caption := 'O Prazo para devoluções de peças é de 72 horas, mediante entrega da mercadoria.' + chr(13) +
                           chr(10) + 'Após esse prazo não será aceito devoluções e não será realizado cancelamento de nota fiscal.';
    QRLTroca.Font.Style :=[fsBold];
    QRLTroca.AutoStretch := true;
    QRLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg');
  end;
end;

procedure TFRPedido_2Vias.QRPrimarioAfterPrint(Sender: TObject);
begin
  inherited;
  if DMPedido.QRPedidoIND_SITUACAO.Value = '1' then
    DMOracle.ExecutaSql('UPDATE TB_PEDIDO_CAB SET STEP_PEDIDO_WEB = 2, LOCAL_ULTIMA_ALTERACAO = ' +
      QuotedStr('CEMAPA') + ' WHERE COD_PEDIDO_CAB = '+ DMPedido.QRPedidoCOD_PEDIDO_CAB.Text);
end;

procedure TFRPedido_2Vias.QRBSumOCAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  wTamanhoTotal, wTamanhoGerado : Double;
begin
  inherited;
  wTotalPedido := 0;
  wQtdeTotal := 0;
end;

procedure TFRPedido_2Vias.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
    QRCompositeReport1.Reports.Add(QRPrimario);
    if (DMParamSistema.CodEmpresa <> 'SCALA') then
    begin
      QRCompositeReport1.Reports.Add(QRPrimario);
    end;
end;

procedure TFRPedido_2Vias.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  with DMPedido do
  begin
    if (QRPedido.RecordCount <= 15) and (numVia = 1) then
    begin
      ChildBand1.Height := 230 - (QRPedido.RecordCount * 18);
      QRHRule1.Top := ChildBand1.Height - 15;
    end
    else
      ChildBand1.Height := 0;
  end;
end;

procedure TFRPedido_2Vias.QRBCabOCBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (DMPedido.QRPedido.RecordCount) <= 12 then
  begin
    Inc(numVia);
    if numVia = 2 then
      numVia := 0;
  end;
end;

procedure TFRPedido_2Vias.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'DINIZ') then
  begin
    QRDBText38.Visible := false;
    QRDBText38.Enabled := false;
  end;
end;

procedure TFRPedido_2Vias.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa <> 'DINIZ') then
  begin
    QRLogo.Enabled := false;
    QRLogo.Visible := false;
    QRLabel25.Enabled := false;
    QRLabel25.Visible := false;
  end;
end;

end.
