unit UOrdemCompra_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste, Oracle;

type
  TDMOrdemCompra = class(TDataModule)
    DSOrdemCompra: TDataSource;
    DSItemOC: TDataSource;
    DSSomaItemOC: TDataSource;
    DSOCAberto: TDataSource;
    DSOrdemCompraUltima: TDataSource;
    QOrdemCompra: TOracleDataSet1;
    QOrdemCompraCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QOrdemCompraCOD_FILIAL: TIntegerField;
    QOrdemCompraCOD_OPERACAO: TIntegerField;
    QOrdemCompraCOD_CADASTRO: TIntegerField;
    QOrdemCompraNUM_ORDEM_COMPRA: TIntegerField;
    QOrdemCompraDT_EMISSAO: TDateTimeField;
    QOrdemCompraVAL_DESCONTO: TFloatField;
    QOrdemCompraDT_ENTREGA: TDateTimeField;
    QOrdemCompraDT_FATURAMENTO: TDateTimeField;
    QOrdemCompraDT_SISTEMA: TDateTimeField;
    QOrdemCompraCOD_MOEDA: TIntegerField;
    QOrdemCompraIND_FRETE: TStringField;
    QOrdemCompraCOD_CAD_FRETE: TIntegerField;
    QOrdemCompraVAL_FRETE: TFloatField;
    QOrdemCompraNOME_CONTATO: TStringField;
    QOrdemCompraIND_CONDICAO_PAGTO: TStringField;
    QOrdemCompraPERC_FRETE: TFloatField;
    QItemOC: TOracleDataSet1;
    QItemOCCOD_ORDEM_COMPRA_ITEM: TIntegerField;
    QItemOCCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QItemOCCOD_PRODUTO: TFloatField;
    QItemOCQT_PEDIDO: TFloatField;
    QItemOCQT_ATENDIDO: TFloatField;
    QItemOCQT_CANCELADO: TFloatField;
    QItemOCPERC_DESCONTO: TFloatField;
    QItemOCCOD_TRIBUTACAO: TIntegerField;
    QItemOCPERC_IPI: TFloatField;
    QItemOCQT_EMBALAGEM: TIntegerField;
    QItemOCvlr_total: TFloatField;
    QItemOCvlr_liquido: TFloatField;
    QItemOCpreco_venda: TFloatField;
    QOrdemCompraCons: TOracleDataSet1;
    QOrdemCompraConsCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QOrdemCompraConsCOD_FILIAL: TIntegerField;
    QOrdemCompraConsCOD_CADASTRO: TIntegerField;
    QOrdemCompraConsNUM_ORDEM_COMPRA: TIntegerField;
    QOrdemCompraConsDT_EMISSAO: TDateTimeField;
    QOrdemCompraConsNOME: TStringField;
    QSomaItemOC: TOracleDataSet1;
    QOCAberto: TOracleDataSet1;
    QOCAbertoDT_EMISSAO: TDateTimeField;
    QOCAbertoCOD_CADASTRO: TIntegerField;
    QOCAbertoNUM_ORDEM_COMPRA: TIntegerField;
    QOCAbertoCOD_FILIAL: TIntegerField;
    QOCAbertoCOD_ORDEM_COMPRA_ITEM: TIntegerField;
    QOCAbertoCOD_PRODUTO: TFloatField;
    QOCAbertoQT_PEDIDO: TFloatField;
    QOCAbertoQT_ATENDIDO: TFloatField;
    QOCAbertoQT_CANCELADO: TFloatField;
    QOCAbertoNOME: TStringField;
    QSomaItemOCSVLR_BRUTO: TFloatField;
    QSomaItemOCSVLR_LIQUIDO: TFloatField;
    QROCAberto: TOracleDataSet1;
    QROCAbertoCOD_FILIAL: TIntegerField;
    QROCAbertoCOD_CADASTRO: TIntegerField;
    QROCAbertoCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QROCAbertoDT_EMISSAO: TDateTimeField;
    QROCAbertoDT_ENTREGA: TDateTimeField;
    QROCAbertoPERC_DESCONTO: TFloatField;
    QROCAbertoVAL_UNITARIO: TFloatField;
    QROCAbertoQT_CANCELADO: TFloatField;
    QROCAbertoQT_ATENDIDO: TFloatField;
    QROCAbertoQT_PEDIDO: TFloatField;
    QROCAbertoCOD_MOEDA: TIntegerField;
    QROCAbertoDESC_MOEDA: TStringField;
    QROCAbertoNOME: TStringField;
    QROCAbertoCOD_PRODUTO: TFloatField;
    QROCAbertovlr_total: TFloatField;
    QROCAbertoqtde_total: TFloatField;
    QROCAbertoqtde_saldo: TFloatField;
    QRProdutoAcum: TOracleDataSet1;
    QRProdutoAcumCOD_MOEDA: TIntegerField;
    QRProdutoAcumDESC_MOEDA: TStringField;
    QRProdutoAcumCOD_PRODUTO: TFloatField;
    QRProdutoAcumSQT_SALDO: TFloatField;
    QRProdutoAcumSVAL_TOTAL: TFloatField;
    QRProdutoAcumSQT_CANCELADO: TFloatField;
    QRProdutoAcumSQT_ATENDIDO: TFloatField;
    QRProdutoAcumSQT_PEDIDO: TFloatField;
    QROrdemCompraFor: TOracleDataSet1;
    QROrdemCompraForCOD_CADASTRO: TIntegerField;
    QROrdemCompraForNUM_ORDEM_COMPRA: TIntegerField;
    QROrdemCompraForDT_EMISSAO: TDateTimeField;
    QROrdemCompraForDT_ENTREGA: TDateTimeField;
    QROrdemCompraForVAL_DESCONTO: TFloatField;
    QROrdemCompraForNOME: TStringField;
    QROrdemCompraForDESC_TELEFONE: TStringField;
    QROrdemCompraForSVAL_TOTAL: TFloatField;
    QOrdemCompraUltima: TOracleDataSet1;
    QOrdemCompraUltimaCOD_TRIBUTACAO: TIntegerField;
    QOrdemCompraUltimaQT_QUANTIDADE: TFloatField;
    QOrdemCompraUltimaPERC_IPI: TFloatField;
    QOrdemCompraUltimaVAL_UNITARIO: TFloatField;
    QOrdemCompraUltimaVAL_IPI: TFloatField;
    QOrdemCompraUltimaDT_RECEBIMENTO: TDateTimeField;
    QOrdemCompraUltimaIND_TIPO_FRETE: TStringField;
    QOrdemCompraUltimaNOME: TStringField;
    QROrdemCompraNota: TOracleDataSet1;
    QROCAbertoIND_CONDICAO_PAGTO: TStringField;
    QROCAbertoNUM_ORDEM_COMPRA: TIntegerField;
    QrOrdemCompraFinanceiro: TOracleDataSet1;
    QrOrdemCompraFinanceiroNOME: TStringField;
    QrOrdemCompraFinanceiroTOTAL_NOTA: TFloatField;
    QrOrdemCompraFinanceiroTOTAL_ORDEM_COMPRA: TFloatField;
    QrOrdemCompraFinanceiroVAL_TITULO_ABERTO: TFloatField;
    QrOrdemCompraFinanceiroVAL_TITULO_PAGO: TFloatField;
    QOrdemCompraVAL_DESCARGA: TFloatField;
    QOrdemCompraCOD_CULTURA: TIntegerField;
    QROrdemCompraForIND_CONDICAO_PAGTO: TStringField;
    QItemOCVAL_UNITARIO: TFloatField;
    QROrdemCompraForSVAL_TOTAL_ABERTO: TFloatField;
    QROrdemCompraNotaTOTAL_NOTA: TFloatField;
    QROrdemCompraNotaDT_EMISSAO: TStringField;
    QROrdemCompraNotaDT_RECEBIMENTO: TStringField;
    QROrdemCompraNotaCOD_ORDEM_CARREGAMENTO_CAB: TFloatField;
    QROrdemCompraNotaDESC_PLACA: TStringField;
    QROrdemCompraNotaQT_PEDIDO: TFloatField;
    QROrdemCompraNotaVAL_UNITARIO_OC: TFloatField;
    QROrdemCompraNotaVAL_UNITARIO: TFloatField;
    QROrdemCompraNotaQT_BAIXA: TFloatField;
    QROrdemCompraNotaNOME: TStringField;
    QOrdemCompraDESC_OBSERVACAO: TStringField;
    QOrdemCompraDESC_COMPLEMENTO_OBS: TStringField;
    QOrdemCompraDESC_COMPLEMENTO_OBS1: TStringField;
    QOrdemCompraConsIND_CONDICAO_PAGTO: TStringField;
    QOrdemCompraCOD_MENSAGEM: TIntegerField;
    QROrdemCompraTransito: TOracleDataSet1;
    QRProdutoAcumDESC_PRODUTO: TStringField;
    QROrdemCompraNotaCOD_PRODUTO: TFloatField;
    QROrdemCompraNotaDESC_PRODUTO: TStringField;
    QROCAbertoDESC_PRODUTO: TStringField;
    QItemOCnome_produto: TStringField;
    QROrdemCompraTransitoCOD_FILIAL: TIntegerField;
    QROrdemCompraTransitoDT_EMISSAO: TStringField;
    QROrdemCompraTransitoCOD_ORDEM_CARREGAMENTO_CAB: TIntegerField;
    QROrdemCompraTransitoDESC_PLACA: TStringField;
    QROrdemCompraTransitoCOD_PRODUTO: TFloatField;
    QROrdemCompraTransitoQT_PEDIDO: TFloatField;
    QROrdemCompraTransitoVAL_UNITARIO_OC: TFloatField;
    QROrdemCompraTransitoVAL_UNITARIO: TFloatField;
    QROrdemCompraTransitoCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QROrdemCompraTransitoNUM_ORDEM_COMPRA: TIntegerField;
    QROrdemCompraTransitoDESC_PRODUTO: TStringField;
    QROrdemCompraTransitoNOME: TStringField;
    QROrdemCompraTransitoQTD_TRANSITO: TFloatField;
    QROrdemCompraTransitoQT_ATENDIDO: TFloatField;
    QOrdemCompraUltimaVAL_TOTAL: TFloatField;
    QOrdemCompraUltimaVAL_DESPESAS: TFloatField;
    QOrdemCompraUltimaVAL_DESCONTO: TFloatField;
    OPCompra: TOraclePackage;
    QItemOCdesc_unidade: TStringField;
    QItemOCqt_saldo: TFloatField;
    QOrdemCompraLimite: TOracleDataSet1;
    QOrdemCompraLimiteSVLR_LIQUIDO: TFloatField;
    QOrdemCompraCOD_FINALIDADE: TIntegerField;
    QROrdemCompraLimite: TOracleDataSet1;
    QROrdemCompraLimiteCOD_FINALIDADE: TIntegerField;
    QROrdemCompraLimiteDESC_FINALIDADE: TStringField;
    QROrdemCompraLimiteVAL_LIMITE: TFloatField;
    QROrdemCompraLimiteVAL_TOTAL: TFloatField;
    QROCAbertoDESC_OBSERVACAO: TStringField;
    QrOrdemCompraFinanceiroCOD_CADASTRO: TFloatField;
    QOrdemCompraCaixa: TOracleDataSet1;
    QOrdemCompraCaixaCOD_CAIXA_MOV: TIntegerField;
    QOrdemCompraCaixaDT_MOVIMENTO: TDateTimeField;
    QOrdemCompraCaixaVAL_MOVIMENTO: TFloatField;
    QOrdemCompraCaixaCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QOrdemCompraCOD_DEPARTAMENTO: TIntegerField;
    QOrdemCompraDT_VENCIMENTO: TDateTimeField;
    QROCAbertoCOD_OPERACAO: TIntegerField;
    QROCAbertoCOD_FINALIDADE: TIntegerField;
    QROCAbertoCOD_DEPARTAMENTO: TIntegerField;
    QROCAbertoDT_VENCIMENTO: TDateTimeField;
    QROCAbertoDESC_DEPARTAMENTO: TStringField;
    QROrdemCompraForCOD_OPERACAO: TIntegerField;
    QROrdemCompraForCOD_FINALIDADE: TIntegerField;
    QROrdemCompraForCOD_DEPARTAMENTO: TIntegerField;
    QROrdemCompraForDT_VENCIMENTO: TDateTimeField;
    QROrdemCompraForDESC_DEPARTAMENTO: TStringField;
    QOrdemCompraVAL_ADIANTAMENTO: TFloatField;
    QOrdemCompraNUM_OS: TIntegerField;
    QItemOCDESC_PENEIRA_TIPO: TStringField;
    QItemOCperc_aliquota: TFloatField;
    QOrdemCompraCOD_VENDEDOR: TIntegerField;
    QItemOCCOD_LOTE_TIPO: TIntegerField;
    QItemOCdesc_lote: TStringField;
    QItemOCVAL_SUBSTITUICAO: TFloatField;
    QItemOCvlr_total_bruto: TFloatField;
    QOrdemCompraCOD_USUARIO: TIntegerField;
    QItemOCCOD_USUARIO: TIntegerField;
    QROrdemCompraNotaCOD_FILIAL: TIntegerField;
    QROrdemCompraNotaCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QROrdemCompraNotaNUM_ORDEM_COMPRA: TIntegerField;
    QROrdemCompraNotaNUM_NOTA: TFloatField;
    procedure QOrdemCompraAfterInsert(DataSet: TDataSet);
    procedure QOrdemCompraBeforeInsert(DataSet: TDataSet);
    procedure QOrdemCompraBeforeEdit(DataSet: TDataSet);
    procedure QOrdemCompraAfterCancel(DataSet: TDataSet);
    procedure QItemOCBeforeEdit(DataSet: TDataSet);
    procedure QItemOCBeforeInsert(DataSet: TDataSet);
    procedure QItemOCBeforeDelete(DataSet: TDataSet);
    procedure QOrdemCompraAfterPost(DataSet: TDataSet);
    procedure QOrdemCompraBeforePost(DataSet: TDataSet);
    procedure QOrdemCompraBeforeCancel(DataSet: TDataSet);
    procedure QItemOCAfterInsert(DataSet: TDataSet);
    procedure QItemOCCalcFields(DataSet: TDataSet);
    procedure QItemOCAfterPost(DataSet: TDataSet);
    procedure QROCAbertoCalcFields(DataSet: TDataSet);
    procedure QItemOCQT_CANCELADOValidate(Sender: TField);
    procedure QItemOCCOD_PRODUTOValidate(Sender: TField);
    procedure QOrdemCompraCOD_CADASTROValidate(Sender: TField);
    procedure QItemOCQT_ATENDIDOValidate(Sender: TField);
    procedure QItemOCBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    fExcluindo : Boolean;
  public
    { Public declarations }
    Property pExcluindo : Boolean Read fExcluindo Write fExcluindo Default False;
    Procedure ExcluiOrdemCompra;
  end;

var
  DMOrdemCompra: TDMOrdemCompra;

implementation

uses UOracle_cl, UParamSistema_cl, UEstoque_cl, UProduto_cl, UBibCompra, UUsuario_cl,
  Math;

{$R *.DFM}

procedure TDMOrdemCompra.QOrdemCompraAfterInsert(DataSet: TDataSet);
var bibCompra: TBibCompra;
begin
//  QOrdemCompraCod_Ordem_Compra_Cab.Value := DMOracle.Sequencia('ORDEM_COMPRA');
//  QOrdemCompraNum_Ordem_Compra.Value := QOrdemCompraCod_Ordem_Compra_Cab.Value;
  bibCompra := TBibCompra.Create;
  QOrdemCompraNum_Ordem_Compra.Value := bibCompra.personalizaNumOrdemCompra(QOrdemCompraCod_Ordem_Compra_Cab.Value, 'INSERT');
  QOrdemCompraDt_Emissao.Value := DMOracle.DataServ;
  QOrdemCompraDt_Sistema.Value := DMOracle.DataServ;
  QOrdemCompraCod_Filial.Value := DMParamSistema.QParamSistemaCod_Filial.Value;
  QOrdemCompraInd_Frete.Value := 'CIF';
  QOrdemCompraCod_Moeda.Value := 1; 
end;

procedure TDMOrdemCompra.QOrdemCompraBeforeInsert(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMOrdemCompra.QOrdemCompraBeforeEdit(DataSet: TDataSet);
begin
  If Not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;
  QOrdemCompraCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMOrdemCompra.QOrdemCompraAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QOrdemCompra.Close;
  QOrdemCompra.Open;
end;

procedure TDMOrdemCompra.QItemOCBeforeEdit(DataSet: TDataSet);
begin               
  If QOrdemCompra.State <> dsEdit then
    Raise Exception.Create('Ordem de Compra não está no modo de alteração!');
  QItemOCCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMOrdemCompra.QItemOCBeforeInsert(DataSet: TDataSet);
begin
  If QOrdemCompra.State = dsInsert then
  Begin
    QItemOCCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
    QOrdemCompra.Post;
    QOrdemCompra.Edit;
  End;
  If (QOrdemCompra.State <> dsEdit) And (QOrdemCompra.State <> dsInsert) then
    Raise Exception.Create('Ordem de Compra não está no modo de alteração!');
end;

procedure TDMOrdemCompra.QItemOCBeforeDelete(DataSet: TDataSet);
begin
  If pExcluindo = False then
    If QOrdemCompra.State <> dsEdit then
      Raise Exception.Create('Ordem de Compra não está no modo de alteração!');
end;


procedure TDMOrdemCompra.QOrdemCompraAfterPost(DataSet: TDataSet);
Var wCodigo : Integer;
begin
  wCodigo := QOrdemCompraCod_Ordem_Compra_Cab.Value;
  QOrdemCompra.Close;
  QOrdemCompra.SetVariable('PK',wcodigo);
  QOrdemCompra.Open;
end;

procedure TDMOrdemCompra.QOrdemCompraBeforePost(DataSet: TDataSet);
var bibCompra: TBibCompra;
Begin
  DMOracle.ValidaFilial(QOrdemCompraCOD_FILIAL.Text);
  If QItemOC.State in [dsEdit,dsInsert] then
    QItemOC.Post;
  DMOracle.ValidaFilial(DMOrdemCompra.QOrdemCompraCOD_FILIAL.Text);
  try
    QItemOC.DisableControls;  //Para não percorrer os itens do grid ao informar novo produto. Suporte:681 - Rubens(Kreuz). Junior 26/08/2020
    QItemOC.First;
    While not QItemOC.Eof do
    Begin
        // *** Atualizar estoque com Quantidade 0 para gerar um registro de estoque ***
      DMEstoque.AtualizaEstoque(0,
                             QOrdemCompraCod_Filial.Value,
                             StrToInt(QItemOCCod_Produto.Text),
                             1,
                             0,
                             0,
                             0,
                             0);

      QItemOC.Next;
    End;
    QItemOC.EnableControls;   

    bibCompra := TBibCompra.Create;

    QOrdemCompraNUM_ORDEM_COMPRA.Value :=
      bibCompra.personalizaNumOrdemCompra(QOrdemCompraNUM_ORDEM_COMPRA.Value, 'POST');

    if (QOrdemCompraNUM_OS.Value > 0) and (QOrdemCompra.State = DsInsert) then
      QOrdemCompraDESC_OBSERVACAO.Value := Trim(QOrdemCompraDESC_OBSERVACAO.Value +
          ' REQUISICAO DE SERVICO DE TERCEIROS DA OS NUMERO ' + QOrdemCompraNUM_OS.Text);
    Except
      QItemOC.EnableControls;
      raise;
    end;

End;

procedure TDMOrdemCompra.QOrdemCompraBeforeCancel(DataSet: TDataSet);
begin
  If QItemOC.State in [dsEdit,dsInsert] then
    QItemOC.Cancel;
end;

procedure TDMOrdemCompra.QItemOCAfterInsert(DataSet: TDataSet);
begin
  QItemOCCOD_ORDEM_COMPRA_CAB.Value := QOrdemCompraCod_Ordem_Compra_Cab.Value;
  //QItemOCCod_Ordem_Compra_Item.Value := DMOracle.Sequencia('ORDEM_COMPRA_ITEM');
  QItemOCPERC_DESCONTO.Value := 0;
  QItemOCQT_ATENDIDO.Value := 0;
  QItemOCQT_CANCELADO.Value := 0;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
    QItemOCQT_PEDIDO.Value := 1;
  QItemOCDESC_PENEIRA_TIPO.Value := '1';
  QItemOCQT_EMBALAGEM.Value := 1;
  QItemOCPERC_IPI.Value := 0;
end;

procedure TDMOrdemCompra.QItemOCCalcFields(DataSet: TDataSet);
var wPreco : String;
begin
  QItemOCnome_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemOCCod_Produto.Value),True);
  If Trim(QItemOCDESC_PENEIRA_TIPO.Value) <> '1' Then
     QItemOCnome_produto.Value := QItemOCnome_produto.Value + ' - ' + QItemOCDESC_PENEIRA_TIPO.Value
  Else
     QItemOCnome_produto.Value := QItemOCnome_produto.Value;
  wPreco := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemOCCod_Produto.Value),True);
  if wPreco <> '' then
     QItemOCpreco_venda.Value := StrToFloat(wPreco);
  QItemOCvlr_total.Value := QItemOCVal_Unitario.Value*QItemOCQt_Pedido.Value + QItemOCVAL_SUBSTITUICAO.Value * QItemOCQt_Pedido.Value +
                            (QItemOCVal_Unitario.Value*QItemOCQt_Pedido.Value * QItemOCPerc_IPI.Value / 100);
  QItemOCvlr_total_bruto.Value := QItemOCVal_Unitario.Value*QItemOCQt_Pedido.Value;
  QItemOCvlr_liquido.Value := QItemOCVal_Unitario.Value*QItemOCQt_Pedido.Value
                             *(1-QItemOCPerc_Desconto.Value/100)  + QItemOCVAL_SUBSTITUICAO.Value * QItemOCQt_Pedido.Value +
                             (QItemOCVal_Unitario.Value*QItemOCQt_Pedido.Value * QItemOCPerc_IPI.Value / 100);

  if QItemOCCOD_PRODUTO.Text <> '' then
    QItemOCdesc_unidade.Value := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO','COD_PRODUTO=' + QItemOCCOD_PRODUTO.Text,True)
  else
    QItemOCdesc_unidade.Value := '';
  QItemOCQt_Saldo.Value := QItemOCQt_Pedido.Value - QItemOCQt_Atendido.Value - QItemOCQt_Cancelado.Value;
  If QItemOCCod_Tributacao.Text <> '' Then
     QItemOCPerc_Aliquota.Text := DMOracle.BuscaNome('SELECT PERC_ALIQUOTA FROM TB_TRIBUTACAO','COD_TRIBUTACAO=' + QItemOCCOD_TRIBUTACAO.Text,True);
  if QItemOCCOD_LOTE_TIPO.Value > 0 then
    QItemOCdesc_lote.Value := DMOracle.FastSelect('DESC_LOTE', 'TB_LOTE_TIPO',
      'COD_LOTE_TIPO = ' + QItemOCCOD_LOTE_TIPO.Text);
end;

procedure TDMOrdemCompra.QItemOCAfterPost(DataSet: TDataSet);
var wRegistro: integer;
begin

  wRegistro := QItemOC.RecNo; //incluído para atender solicitação do Rubens - Kreuz - 21-05-2019 (Cleber)

  QSomaItemOC.Close;
  QSomaItemOC.Open;

  QOrdemCompra.Post;
  QOrdemCompra.Edit;

  QItemOC.RecNo := wRegistro; //incluído para atender solicitação do Rubens - Kreuz - 21-05-2019 (Cleber)

end;

procedure TDMOrdemCompra.QROCAbertoCalcFields(DataSet: TDataSet);
begin
  QROCAbertoqtde_saldo.Value := QROCAbertoQt_pedido.Value
                               -QROCAbertoqt_Cancelado.Value
                               -QROCAbertoqt_atendido.Value;
  QROCAbertovlr_total.Value := QROCAbertoQtde_saldo.Value * QROCAbertoVal_Unitario.Value;
end;

procedure TDMOrdemCompra.QItemOCQT_CANCELADOValidate(Sender: TField);
begin
  If RoundTo(QItemOCQt_Pedido.Value,-4) < RoundTo(QItemOCQt_Atendido.Value+QItemOCQt_Cancelado.Value,-4) then
    Raise Exception.Create('Quantidade inválida!');
end;

procedure TDMOrdemCompra.QItemOCCOD_PRODUTOValidate(Sender: TField);
begin
  QItemOCVal_Unitario.Value := DMProduto.PrecoVenda(QItemOCCod_Produto.Value,QOrdemCompraCod_Cadastro.Text);
end;

Procedure TDMOrdemCompra.ExcluiOrdemCompra;
Begin
  If MessageDlg('Apagar esta Ordem de Compra?',mtConfirmation,[mbYes,mbNo],0) <> mrYes Then
    Abort;
  Try
{Adicionado para gravar o usuário que esta editando a O.S. Informação necessária na tb_log. Alex 25/09/2023. }
//Item
  if (QOrdemCompraCOD_USUARIO.Value <> DMUsuario.CodUsuarioCorrente) or (QItemOCCOD_USUARIO.Value <> DMUsuario.CodUsuarioCorrente) then
  begin
    DMOracle.DBCemapa.StartTransaction;
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('UPDATE TB_ORDEM_COMPRA_ITEM SET COD_USUARIO = ' + chr(39) + inttostr(DMUsuario.CodUsuarioCorrente) + chr(39));
    DMOracle.QExecSQL.SQL.Add('WHERE COD_ORDEM_COMPRA_CAB = ' + chr(39) + QItemOCCOD_ORDEM_COMPRA_CAB.Text + chr(39));
    DMOracle.QExecSQL.ExecSQL;
    DMOracle.DBCemapa.Commit;
//Cabeçalho
    DMOracle.DBCemapa.StartTransaction;
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('UPDATE TB_ORDEM_COMPRA_CAB SET COD_USUARIO = ' + chr(39) + inttostr(DMUsuario.CodUsuarioCorrente) + chr(39));
    DMOracle.QExecSQL.SQL.Add('WHERE COD_ORDEM_COMPRA_CAB = ' + chr(39) + QItemOCCOD_ORDEM_COMPRA_CAB.Text + chr(39));
    DMOracle.QExecSQL.ExecSQL;
    DMOracle.DBCemapa.Commit;
  end;

    pExcluindo := True;
    DMOracle.DBCemapa.StartTransaction;
    While not QItemOC.Eof do
      QItemOC.Delete;
    QOrdemCompra.Delete;
    pExcluindo := False;
    DMOracle.DBCemapa.Commit;
  Except
    DMOracle.DBCemapa.RollBack;
    pExcluindo := False;
    Raise;
  End;
End;

procedure TDMOrdemCompra.QOrdemCompraCOD_CADASTROValidate(Sender: TField);
begin
  if Trim(QOrdemCompraCOD_CADASTRO.Text) <> '' then
    if Trim(DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO',' COD_CADASTRO = '+QOrdemCompraCOD_CADASTRO.Text,True)) <> '' then
       raise exception.Create('ATENÇÃO - Cadastro Cancelado, Verifique!')
end;

procedure TDMOrdemCompra.QItemOCQT_ATENDIDOValidate(Sender: TField);
begin
  If RoundTo(QItemOCQt_Pedido.Value, -4) < RoundTo(QItemOCQt_Atendido.Value+QItemOCQt_Cancelado.Value, -4) then
    Raise Exception.Create('Quantidade inválida!');

end;

procedure TDMOrdemCompra.QItemOCBeforePost(DataSet: TDataSet);
begin
  QItemOCCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

end.
