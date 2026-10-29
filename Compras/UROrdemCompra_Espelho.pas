unit UROrdemCompra_Espelho;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls, QRExport, jpeg, QRWebFilt,
  QRPDFFilt;

type
  TFROrdemCompra_Espelho = class(TFTRelSimples)
    QRBSumOC: TQRBand;
    QRLabel14: TQRLabel;
    QRShape1: TQRShape;
    QRBCabOC: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel10: TQRLabel;
    QRBDetail: TQRSubDetail;
    QRDBText12: TQRDBText;
    QRDBTDescricao: TQRDBText;
    QRDBTValUnitario: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText6: TQRDBText;
    QRLAliq: TQRLabel;
    QRDBTAliq: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    sValIpi: TQRLabel;
    sValCDesconto: TQRLabel;
    sValTotal: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel32: TQRLabel;
    wPreco_Venda: TQRLabel;
    wLucro: TQRLabel;
    QRDBText17: TQRDBText;
    QRLEmb: TQRLabel;
    QRLValLiq: TQRLabel;
    QRLPrecoLiquido: TQRLabel;
    QRShape2: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText16: TQRDBText;
    QRLCodigoBarras: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText31: TQRDBText;
    QRLUn: TQRLabel;
    QRDBTUn: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBTValTotal: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText35: TQRDBText;
    QRLEndereco: TQRLabel;
    QRLTransportadora: TQRLabel;
    QRLMoeda: TQRLabel;
    QRLMensagem: TQRLabel;
    QRDBTEmb: TQRDBText;
    QRLabel12: TQRLabel;
    QRLVendedor: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel9: TQRLabel;
    sValSubstituicao: TQRLabel;
    procedure QRBDetailAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBSumOCBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBCabOCAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBCabOCBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBTValUnitarioPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrdemCompra_Espelho: TFROrdemCompra_Espelho;
  wVl_Ipi,wVlCDesconto,wVlTotal,wValDescItem, wSubstituicao:Real;

implementation

uses UOrdemCompra_cl, UOrdemCompraParam, UOracle_cl, UFilial_cl,
  UCadastro_cl, UMensagem_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFROrdemCompra_Espelho.QRBDetailAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
  var wValIpi, wTotal, wPercDescTotal: real;
begin
  inherited;
  With DmOrdemCompra do
  begin
    wValDescItem := 0;
    wTotal := QItemOCvlr_total_bruto.Value;
    if wTotal > 0 then
    begin   //Valor com Desconto não estava aparecendo certo. Ajuda do Adriel. 20/05/2015 - Junior.
    //  wPercDescTotal := 1;
//      if QOrdemCompraVal_Desconto.Value > 0 then
//      begin
//        wPercDescTotal := QOrdemCompraVal_Desconto.Value / QSomaItemOcsVlr_liquido.Value;
//        wValDescItem := wPercDescTotal * (QItemOCVal_Unitario.Value*QItemOCQt_Pedido.Value*(1 + QItemOCPerc_Desconto.Value/100));
//      end
//      else
        wValDescItem := QItemOCVal_Unitario.Value*QItemOCQt_Pedido.Value*(QItemOCPerc_Desconto.Value/100);
    end;
    wValIpi := (wTotal - wValDescItem) * (QItemOCPerc_Ipi.Value / 100);
    wVl_Ipi := wVl_Ipi + wValIpi;
    wVlCDesconto := wVlCDesconto + wTotal -  wValDescItem;
    wVlTotal := wVlTotal + wTotal - wValDescItem + wValIpi + QItemOCVAL_SUBSTITUICAO.Value * QItemOCQt_Pedido.Value;
    wSubstituicao := wSubstituicao + QItemOCVal_Substituicao.Value * QItemOCQt_Pedido.Value;
  end;
end;

procedure TFROrdemCompra_Espelho.QRBSumOCBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  sValIpi.Caption :=FormatFloat('###,##0.00',wVl_Ipi);
  sValCDesconto.Caption := FormatFloat('###,##0.00',wVlCDesconto - DMOrdemCompra.QOrdemCompraVal_Desconto.Value );
  sValTotal.Caption := FormatFloat('###,##0.00',wVlTotal - DMOrdemCompra.QOrdemCompraVal_Desconto.Value);
  sValSubstituicao.Caption := FormatFloat('###,##0.00',wSubstituicao);
end;

procedure TFROrdemCompra_Espelho.QRBCabOCAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wVl_Ipi:=0;
  wVlCDesconto:=0;
  wVlTotal:=0;
  wSubstituicao:=0;
end;

procedure TFROrdemCompra_Espelho.QRBDetailBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var wVal_Icms,wVal_Liquido,wPerc_Base,wPerc_Aliquota,wVal_Frete,wVal_Ipi_Preco,wPerc_Lucro,wPrecoLiquido:Real;
begin
  inherited;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARZ') then
  Begin
    QRDBText17.Transparent := True;
    QRDBTEmb.Transparent := False;
  end
  else
    QRDBTEmb.Enabled := False;

  if fOrdemCompraParam.Rg3Preco.ItemIndex = 0 then
   begin
     wPreco_Venda.Caption := FormatFloat('###,##0.00',DmOrdemCompra.QItemOCPreco_Venda.Value);
     wVal_Ipi_Preco := ((DmOrdemCompra.QItemOCvlr_liquido.Value - wValDescItem) * DmOrdemCompra.QItemOCPerc_Ipi.Value / 100) / DmOrdemCompra.QItemOCQt_Pedido.Value;
     wVal_Liquido := (DmOrdemCompra.QItemOCvlr_liquido.Value - wValDescItem) / DmOrdemCompra.QItemOCQt_Pedido.Value;
     wVal_Frete := ((DmOrdemCompra.QItemOCvlr_liquido.Value - wValDescItem) * DmOrdemCompra.QOrdemCompraPerc_Frete.Value / 100 / DmOrdemCompra.QItemOCQt_Pedido.Value);
     wPerc_Base := StrToFloat(DMOracle.BuscaNome('SELECT PERC_TRIBUTADO FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+FloatToStr(DmOrdemCompra.QItemOCCod_Tributacao.Value),True));
     wPerc_Aliquota := StrToFloat(DMOracle.BuscaNome('SELECT PERC_ALIQUOTA FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+FloatToStr(DmOrdemCompra.QItemOCCod_Tributacao.Value),True));
     wPerc_Base := wPerc_Base / 100;
     wPerc_Aliquota := wPerc_Aliquota / 100;
     wVal_Icms := 0;
     If wPerc_Aliquota > 0 Then
       wVal_Icms := ((DmOrdemCompra.QItemOCvlr_liquido.Value - wValDescItem) * wPerc_Base * wPerc_Aliquota / DmOrdemCompra.QItemOCQt_Pedido.Value);
     wPerc_Lucro := 0;
     if (wVal_liquido+wVal_Ipi_Preco + wVal_Frete - wVal_Icms) > 0 then
       wPerc_Lucro := (DmOrdemCompra.QItemOCpreco_venda.Value / ((wVal_liquido+wVal_Ipi_Preco + wVal_Frete - wVal_Icms) / DmOrdemCompra.QItemOCQt_Embalagem.Value)   - 1) * 100;
     wLucro.Caption := FormatFloat('#,##0.00',wPerc_Lucro);
     wPrecoLiquido := (wVal_liquido + wVal_Ipi_Preco + wVal_Frete - wVal_Icms) / DmOrdemCompra.QItemOCQt_Embalagem.Value;
     QRLPrecoLiquido.Caption := FormatFloat('#,##0.00',wPrecoLiquido);
     QRLValLiq.Caption := 'Valor Liquido';
   end
  else
   begin
     wPreco_Venda.Caption := '';
     wLucro.Caption := '';
     QRLPrecoLiquido.Caption := '';
     QRLValLiq.Caption := '';
   end;
  QRLCodigoBarras.Caption := DMOracle.BuscaNome('SELECT NUM_FABRICANTE FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(DmOrdemCompra.QItemOCCod_Produto.Value),True);

  if DMParamSistema.CodEmpresa = 'RADIO' then
  begin
    QRDBTEmb.Width := (QRDBTAliq.Left + QRDBTAliq.Width) - QRDBTEmb.Left;
    QRDBTEmb.Enabled := True;
    QRDBTUn.Enabled := False;
    QRDBTAliq.Enabled := False;
    QRDBTEmb.DataField := 'desc_lote';
  end;
end;

procedure TFROrdemCompra_Espelho.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLEmpresa.Caption := DMFilial.QFilialDesc_Filial.Value;
  if DMParamSistema.CodEmpresa = 'ENERMED' then //Solicitado por Sebastião. Junior 15/05/2020.
    QRLTitulo.Caption := 'COTAÇÃO';
end;

procedure TFROrdemCompra_Espelho.QRBCabOCBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
//Var
//  wEndereco, wDescMoeda : String;
begin
  inherited;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARZ') then
    QRLEmb.Caption := 'IPI';

  With DmOrdemCompra Do
  Begin
    Buscador.Limpa;
    Buscador.Adiciona('DESC_ENDERECO || ' + QuotedStr(' - ') + ' || DESC_CIDADE || ' +
      QuotedStr(' - ') + ' || COD_ESTADO', 'TB_CADASTRO',
      'COD_CADASTRO = 0' + QOrdemCompraCOD_CADASTRO.Text);
//    Buscador.Adiciona('DESC_CIDADE', 'TB_CADASTRO',
//      'COD_CADASTRO = 0' + QOrdemCompraCOD_CADASTRO.Text);
//    Buscador.Adiciona('COD_ESTADO', 'TB_CADASTRO',
//      'COD_CADASTRO = 0' + QOrdemCompraCOD_CADASTRO.Text);
    Buscador.Adiciona('NOME || DESC_TELEFONE', 'TB_CADASTRO',
      'COD_CADASTRO = 0' + QOrdemCompraCOD_CAD_FRETE.Text);
    Buscador.Adiciona('DESC_MOEDA', 'TB_MOEDA',
      'COD_MOEDA = 0' + QOrdemCompraCOD_MOEDA.Text);
    Buscador.Adiciona('COD_VENDEDOR || ' + QuotedStr(' - ') + ' || NOME', 'TB_VENDEDOR',
      'COD_VENDEDOR = 0' + QOrdemCompraCOD_VENDEDOR.Text);
    Buscador.Buscar();

//    wEndereco := Trim(DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_CADASTRO',
//                                                           'COD_CADASTRO = '+FloatToStr(QOrdemCompraCod_Cadastro.Value),True));
//    wEndereco := wEndereco + ' - ' + Trim(DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CADASTRO',
//                                                           'COD_CADASTRO = '+FloatToStr(QOrdemCompraCod_Cadastro.Value),True));
//    wEndereco := wEndereco + ' - ' + Trim(DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO',
//                                                           'COD_CADASTRO = '+FloatToStr(QOrdemCompraCod_Cadastro.Value),True));
//    QRlEndereco.Caption := wEndereco;
//    QRLTransportadora.Caption := DMOracle.BuscaNome('SELECT NOME || DESC_TELEFONE FROM TB_CADASTRO','COD_CADASTRO ='+FloatToStr(QOrdemCompraCod_cad_Frete.Value),True);
//    wDescMoeda := Trim(DMOracle.BuscaNome('SELECT DESC_MOEDA FROM TB_MOEDA',
//                                                            'COD_MOEDA = '+ FloatToStr(QOrdemCompraCod_moeda.Value),True));
//    QRLMoeda.Caption :=wdescmoeda;

    QRlEndereco.Caption := Buscador.Proximo;
    QRLTransportadora.Caption := Buscador.Proximo;
    QRLMoeda.Caption := Buscador.Proximo;
    QRLVendedor.Caption := Buscador.Proximo;

    if DMParamSistema.CodEmpresa = 'RADIO' then
    begin
      QRLEmb.Enabled := False;
      QRLUn.Enabled := False;
      QRLAliq.Enabled := True;
      QRLAliq.Caption := 'Lote';
    end;
  End;
end;

procedure TFROrdemCompra_Espelho.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
{  with DMOrdemCompra do
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS') and (QOrdemCompraNUM_OS.Value > 0) then
    begin
      QRLTitulo.Caption := 'REQUISIÇÃO DE SERVIÇO DE TERCEIRO';
      QRDBTDescricao.DataField := 'DESC_PENEIRA_TIPO'; // campo usado para armazenar complemento
      QRBDetail.Height := 18;
    end;
    }
end;

procedure TFROrdemCompra_Espelho.QRDBTValUnitarioPrint(sender: TObject;
  var Value: String);
begin
  inherited;
//  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS') and (StrToFloat(Value) = 0) then
//    Value := '__________';
end;

end.
