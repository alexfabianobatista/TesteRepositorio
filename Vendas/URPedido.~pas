unit URPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QuickRpt, QRExport, QRWebFilt, QRPDFFilt, QRCtrls,
  ExtCtrls, grimgctrl;

type
  TFRPedido = class(TFTRelSimples)
    QRBDetail: TQRBand;
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRLCliente: TQRLabel;
    QRLabel3: TQRLabel;
    QRLRuaFilial: TQRLabel;
    QRLEndereco: TQRLabel;
    QRLEndFilial: TQRLabel;
    QRLabel6: TQRLabel;
    QRLDtEmissao: TQRLabel;
    QRLabel7: TQRLabel;
    QRLFone: TQRLabel;
    QRLabel9: TQRLabel;
    QRLBairro: TQRLabel;
    QRLabel8: TQRLabel;
    QRLPedido: TQRLabel;
    QRLNatOp: TQRLabel;
    QRLTipoPagto: TQRLabel;
    QRDBTQtde: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRExprSQtde: TQRExpr;
    QRMObservacao: TQRMemo;
    QRBand5: TQRBand;
    QRLabel17: TQRLabel;
    QRExprTotal: TQRExpr;
    QRM1: TQRMemo;
    QRM2: TQRMemo;
    QRM3: TQRMemo;
    QRLabel10: TQRLabel;
    QRLEntrada: TQRLabel;
    QRLabel5: TQRLabel;
    QRLCidade: TQRLabel;
    QRLabel19: TQRLabel;
    QRLCep: TQRLabel;
    QRLEmbalagem: TQRLabel;
    QRM4: TQRMemo;
    QRM5: TQRMemo;
    QRLabel18: TQRLabel;
    QRLCelular: TQRLabel;
    QRDBTSerie: TQRDBText;
    QRDBTDot: TQRDBText;
    QRDBTDescProduto: TQRDBText;
    QRLValTotal: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel11: TQRLabel;
    QRHRule2: TQRHRule;
    QRLabel21: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRCompositeReport1: TQRCompositeReport;
    QRBand3: TQRBand;
    QRLabel13: TQRLabel;
    QRLSerie: TQRLabel;
    QRLDot: TQRLabel;
    QRLQtde: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText9: TQRDBText;
    QRLVia: TQRLabel;
    QRCorte: TQRHRule;
    QRLFantasia: TQRLabel;
    QRLabel23: TQRLabel;
    QRLCondicaopagto: TQRLabel;
    QRLMarca: TQRLabel;
    QRDBTMarca: TQRDBText;
    QRDBText10: TQRDBText;
    QRLCnpjFilial: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText11: TQRDBText;
    QRLObra: TQRLabel;
    QRDBCGC_FILIAL: TQRDBText;
    QRLOrdemServico: TQRLabel;
    QRLOrdemServicoNum: TQRLabel;
    QRLDtEntradaOS: TQRLabel;
    QRLDataEntradaOS: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private    { Private declarations }

  public
    { Public declarations }
  end;

var
  FRPedido: TFRPedido;
  ValTotal: Real;
  numVia :Integer = 0;
implementation

uses UNotaSaida_cl, UParamSistema_cl, UOracle_cl;

{$R *.dfm}

procedure TFRPedido.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  wAux: TQRMemo;
begin
  inherited;
  QRM4.Lines.Append(' ');
  QRM5.Lines.Append(' ');
  QRM1.Height := (QRM1.Lines.Count * 16) + 1;
  QRM2.Height := (QRM2.Lines.Count * 16) + 1;
  QRM3.Height := (QRM3.Lines.Count * 16) + 1;
  QRM4.Height := (QRM4.Lines.Count * 16) + 1;
  QRM5.Height := (QRM5.Lines.Count * 16) + 1;
  if (QRM1.Height > QRM2.Height) and (QRM1.Height > QRM3.Height) then
    wAux := QRM1
  else
    if (QRM2.Height > QRM3.Height) then
      wAux := QRM2
    else
      wAux := QRM3;
  QRM4.Top := wAux.Height + wAux.Top + 16;
  QRM5.Top := QRM4.Top;
  if (QRM4.Height > QRM5.Height) then
    wAux := QRM4
  else
    wAux := QRM5;
  QRBand5.Height := wAux.Top + wAux.Height;
  ValTotal := 0;
  if ChildBand1 <> Nil then
    ChildBand1.Enabled := (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RAZENTE');
end;

procedure TFRPedido.QRBDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TRENTO' then
  begin
    with DMNotaSaida do
    begin
      if QRPedidoEspelhoDESC_INF_ADICIONAL.Value <> '' then
        QRPedidoEspelhoDESC_PRODUTO.Value := QRPedidoEspelhoDESC_PRODUTO.Value +
          ' - ' + QRPedidoEspelhoDESC_INF_ADICIONAL.Value;
    end;
  end;
  ValTotal := ValTotal + DMNotaSaida.QRPedidoEspelhoVAL_TOTAL.Value;
end;

procedure TFRPedido.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  ValTotal := ValTotal - DMNotaSaida.QNFE_EmiteVAL_DESCONTO.Value;
  if DMParamSistema.CodEmpresa = 'RAZENTE' then
  begin
    QRLValTotal.Caption := FormatFloat('#,##0.00', ValTotal);
    QRExprTotal.Enabled := False;
    QRLValTotal.Enabled := True;
  end;
end;

procedure TFRPedido.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TRENTO' then
  begin
    QRCompositeReport1.Reports.Add(QRPrimario);
    QRCompositeReport1.Reports.Add(QRPrimario);
  end;
end;

procedure TFRPedido.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  Inc(numVia);
  QRLVia.Caption := IntToStr(numVia) + 'ª Via';
  if numVia = 2 then
    numVia := 0;

  if (DMParamSistema.CodEmpresa = 'NFCE-IVO') then
    QRLabel20.Caption := 'Mecânico';

end;

procedure TFRPedido.FormCreate(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'NEOALI') or
     (DMParamSistema.CodEmpresa = 'PLOPES') then
  begin
    QRDBText7.DataField := 'NUM_FABRICANTE';
    QRBDetail.Font.Size := 8; //deixtar toda a banda com fonte 8.
    QRDBText7.Width      := 155;
    QRDBTDescProduto.Left      := 160;
    QRDBTDescProduto.Width     := 280;
  end;

  if (DMParamSistema.CodEmpresa = 'CLARO') then //Vanessa 01/12/2014
  begin
    QRDBTDescProduto.Width := 180;
    QRDBTDescProduto.Font.Height := -11;
  end;
  if (DMParamSistema.CodEmpresa = 'HOSPITAL') then //Gian 18/01/2018
  begin
    QRLabel20.Caption := 'Médico';
  end;

  if (DMParamSistema.CodEmpresa = 'CONKRETA') then //Gian 20/08/2019
  begin
    QRDBText6.DataField := 'VAL_TOTAL_COM_DESCONTO';
  end;

  if (DMParamSistema.CodEmpresa = 'MEDSYSTEM') or (DMParamSistema.CodEmpresa = 'JOFER') or (DMParamSistema.CodEmpresa = 'RRPECAS')
  or (DMParamSistema.CodEmpresa = 'RSMECANICA') then
  begin
    QRDBCGC_FILIAL.Enabled := True;
    QRLCnpjFilial.Enabled := True;
  end;
  if (DMParamSistema.CodEmpresa = 'BEDIN') then
    QRLabel8.Caption := 'Orçamento';
{Adicionado CodEmpresa para não aparecer campos sobrepostos quando salvar o relatório. Alex 12/02/2025.}
  if (DMParamSistema.CodEmpresa = 'ZANONI') or (DMParamSistema.CodEmpresa = 'ALFA') then
  begin
    QRLTitulo.Enabled := false;
    QRLTitulo.Visible := False;
    QRLValTotal.Enabled := False;
    QRLValTotal.Visible := False;
  end;
end;

end.
