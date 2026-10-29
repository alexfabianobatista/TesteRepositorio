unit UDevolucaoTroca_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, Provider, DBClient,
    Dialogs;

type
  TDMDevolucaoTroca = class(TDataModule)
    QItensDevolucao: TOracleDataSet1;
    QItensDevolucaoCOD_NOTA_ITEM: TIntegerField;
    QItensDevolucaoCOD_PRODUTO: TFloatField;
    QItensDevolucaoDESC_PRODUTO: TStringField;
    QItensDevolucaoQT_QUANTIDADE: TFloatField;
    DSPItensDevolucao: TDataSetProvider;
    CDSItensDevolucao: TClientDataSet;
    QNotaSaidaCons: TOracleDataSet1;
    QNotaSaidaConsCOD_NOTA_CAB: TIntegerField;
    QNotaSaidaConsNOME: TStringField;
    QNotaSaidaConsDT_RECEBIMENTO: TDateTimeField;
    QNotaSaidaConsCOD_SERIE: TStringField;
    QNotaSaidaConsCOD_FILIAL: TIntegerField;
    QNotaSaidaConsCOD_TRANSPORTADOR: TIntegerField;
    QNotaSaidaConsCOD_CADASTRO: TIntegerField;
    QNotaSaidaConsIND_SITUACAO: TStringField;
    QNotaSaidaConsCOD_ORDEM_CARREGAMENTO_CAB: TIntegerField;
    QNotaSaidaConsVAL_DESCONTO: TFloatField;
    QNotaSaidaConsCOD_ESTADO: TStringField;
    QNotaSaidaConsIND_ENTRADA_SAIDA: TStringField;
    QNotaSaidaConsCOD_CADASTRO_PARCEIRO: TIntegerField;
    QNotaSaidaConsDESC_PLACA: TStringField;
    QNotaSaidaConsIND_VENDAS: TStringField;
    QNotaSaidaConsDT_EMISSAO: TDateTimeField;
    QNotaSaidaConsSVAL_TOTAL: TFloatField;
    QNotaSaidaConsNOME_VENDEDOR: TStringField;
    QNotaSaidaConsIND_CONDICIONAL: TStringField;
    QNotaSaidaConsIND_CONDICAO_PAGTO: TStringField;
    QNotaSaidaConsdesc_pagamento: TStringField;
    QNotaSaidaConsDESC_CHAVE_ACESSO: TStringField;
    QNotaSaidaConsNUM_NOTA: TFloatField;
    QNotaSaidaConsCOD_SERIE_MODELO: TStringField;
    QNotaSaidaConsCOD_OBRA: TIntegerField;
    QNotaSaidaConsDESC_OBRA: TStringField;
    QItensDevolucaoQT_DEVOLUCAO: TFloatField;
    QItensDevolucaoVAL_UNITARIO: TFloatField;
    QItensDevolucaoVAL_DESCONTO: TFloatField;
    QItensDevolucaoVAL_IPI: TFloatField;
    QItensDevolucaoVAL_DESPESAS: TFloatField;
    QItensDevolucaoVAL_ICMS_SUBST: TFloatField;
    CDSItensTroca: TClientDataSet;
    CDSItensTrocaCOD_PRODUTO: TIntegerField;
    CDSItensTrocaCOD_LOTE_TIPO: TIntegerField;
    CDSItensTrocaQT_QUANTIDADE: TFloatField;
    CDSItensTrocaVAL_UNITARIO: TFloatField;
    CDSItensTrocaCOD_TRIBUTACAO: TIntegerField;
    CDSItensTrocaDESC_PRODUTO: TStringField;
    CDSItensTrocaVAL_TOTAL: TFloatField;
    QNotaSaidaConsCOD_OPERACAO: TIntegerField;
    CDSItensTrocaVAL_ICMS_SUBST: TFloatField;
    CDSItensTrocaVAL_DESCONTO: TFloatField;
    CDSItensTrocaVAL_IPI: TFloatField;
    QContasReceberCons: TOracleDataSet1;
    QContasReceberMovCons: TOracleDataSet1;
    QContasReceberConsCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContasReceberConsCOD_FINALIDADE: TIntegerField;
    QContasReceberConsCOD_BANCO_AGENCIA: TIntegerField;
    QContasReceberConsCOD_FILIAL: TIntegerField;
    QContasReceberConsNUM_TITULO: TFloatField;
    QContasReceberConsNUM_PARCELA: TIntegerField;
    QContasReceberConsDESC_TIPO_DOCUMENTO: TStringField;
    QContasReceberConsDT_MOVIMENTO: TDateTimeField;
    QContasReceberConsDT_BAIXA: TDateTimeField;
    QContasReceberConsDT_VENCIMENTO: TDateTimeField;
    QContasReceberConsDT_EMISSAO: TDateTimeField;
    QContasReceberConsDT_CAPITALIZACAO: TDateTimeField;
    QContasReceberConsVAL_TITULO: TFloatField;
    QContasReceberConsVAL_NEGOCIO: TFloatField;
    QContasReceberConsIND_ACEITE: TStringField;
    QContasReceberConsIND_SITUACAO: TStringField;
    QContasReceberConsDESC_OBSERVACAO: TStringField;
    QContasReceberConsCOD_NOTA_CAB: TIntegerField;
    QContasReceberConsCOD_CADASTRO: TIntegerField;
    QContasReceberConsVAL_ORIGINAL: TFloatField;
    QContasReceberConsCOD_NOSSO_NUMERO: TStringField;
    QContasReceberConsVAL_JUROS: TFloatField;
    QContasReceberConsCOD_DEPARTAMENTO: TIntegerField;
    QContasReceberConsCOD_CONTRATO_VEND: TIntegerField;
    QContasReceberConsDESC_AVALISTA1: TStringField;
    QContasReceberConsDESC_AVALISTA2: TStringField;
    QContasReceberConsCOD_VENDEDOR: TIntegerField;
    QContasReceberConsPERC_COMISSAO: TFloatField;
    QContasReceberConsDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QContasReceberConsVAL_PROMISSORIA: TFloatField;
    QContasReceberConsIND_ENVIADO_BANCO: TStringField;
    QContasReceberConsCOD_CONTA_CORRENTE: TIntegerField;
    QContasReceberConsCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QContasReceberConsCOD_OBRA_CONTRATO: TIntegerField;
    QContasReceberConsIND_EMITIDO_CARNE: TStringField;
    QContasReceberConsCOD_OBRA_CONTRATO_MOV: TIntegerField;
    QContasReceberConsNUM_OS: TIntegerField;
    QContasReceberConsCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QContasReceberConsDESC_OBS: TStringField;
    QContasReceberConsCOD_VENDEDOR1: TIntegerField;
    QContasReceberConsPERC_COMISSAO1: TFloatField;
    QContasReceberConsCOD_OFICINA_CAB: TIntegerField;
    QContasReceberConsCOD_BORDERO: TIntegerField;
    QContasReceberConsCOD_OBRA: TIntegerField;
    QContasReceberConsCOD_CONTRATO_LOCADOR: TIntegerField;
    QContasReceberConsCOD_USUARIO: TIntegerField;
    QContasReceberConsDT_USUARIO: TDateTimeField;
    QContasReceberMovConsCOD_CONTA_RECEBER_MOV: TIntegerField;
    QContasReceberMovConsCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContasReceberMovConsDT_MOVIMENTO: TDateTimeField;
    QContasReceberMovConsVAL_MOVIMENTO: TFloatField;
    QContasReceberMovConsDESC_OBSERVACAO: TStringField;
    QContasReceberMovConsCOD_USUARIO: TIntegerField;
    QContasReceberMovConsDT_USUARIO: TDateTimeField;
    QContasReceberMovConsIND_TIPO_MOVIMENTO: TStringField;
    QContasReceberMovConsCOD_BCO_MOVIMENTO: TIntegerField;
    QContasReceberMovConsCOD_CAIXA_MOV: TIntegerField;
    QContasReceberMovConsCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QContasReceberMovConsCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QContasReceberMovConsCOD_NOTA_CAB: TIntegerField;
    QContasReceberMovConsIND_DEVOLUCAO: TStringField;
    QContasReceberMovConsIND_FORMA_PAGAMENTO: TStringField;
    QContasReceberMovConsIND_TROCA: TStringField;
    QContasReceberMovConsCOD_ADIANTAMENTO: TIntegerField;
    QNotaSaidaConsVAL_DESPESAS: TFloatField;
    QNotaSaidaConsVAL_FRETE: TFloatField;
    QItensDevolucaoCOD_TRIBUTACAO: TIntegerField;
    QItensDevolucaoVAL_FRETE: TFloatField;
    QItensDevolucaoVAL_ICM_BASE: TFloatField;
    QItensDevolucaoVAL_ICM: TFloatField;
    QItensDevolucaoVAL_BASE_SUBST: TFloatField;
    QItensDevolucaoVAL_CUSTO: TFloatField;
    QItensDevolucaoCOD_CST_PIS: TStringField;
    QItensDevolucaoCOD_CST_COFINS: TStringField;
    QItensDevolucaoCOD_CST_IPI: TStringField;
    QItensDevolucaoVAL_PIS: TFloatField;
    QItensDevolucaoVAL_CONFINS: TFloatField;
    QItensDevolucaoCOD_LOTE_TIPO: TIntegerField;
    QItensDevolucaoDESC_INF_ADICIONAL: TStringField;
    QItensDevolucaoPERC_COMISSAO: TFloatField;
    QValeProdutoItem: TOracleDataSet;
    QValeProdutoItemCOD_NOTA_ITEM: TIntegerField;
    QValeProdutoItemQT_QUANTIDADE_DEVOLVIDA: TFloatField;
    QRValeProduto: TOracleDataSet;
    QRValeProdutoFONE_FILIAL: TStringField;
    QRValeProdutoENDERECO_CADASTRO: TStringField;
    QRValeProdutoCEP_CADASTRO: TStringField;
    QRValeProdutoFONE_CADASTRO: TStringField;
    QRValeProdutoVAL_VALE_PRODUTO: TFloatField;
    QRValeProdutoCIDADE_ESTADO_FILIAL: TStringField;
    QRValeProdutoCIDADE_ESTADO_CADASTRO: TStringField;
    QRValeProdutoDT_EMISSAO: TDateTimeField;
    QRValeProdutoDESC_FILIAL: TStringField;
    QRValeProdutoCNPJ_FILIAL: TStringField;
    QRValeProdutoENDERECO_FILIAL: TStringField;
    QRValeProdutoBAIRRO_FILIAL: TStringField;
    QRValeProdutoNOME_CADASTRO: TStringField;
    QRValeProdutoCPF_CNPJ_CADASTRO: TStringField;
    QRValeProdutoBAIRRO_CADASTRO: TStringField;
    QValeProdutoCons: TOracleDataSet;
    QValeProdutoConsCOD_FILIAL: TIntegerField;
    QValeProdutoConsCOD_CADASTRO: TIntegerField;
    QValeProdutoConsNOME: TStringField;
    QValeProdutoConsVAL_VALE_PRODUTO: TFloatField;
    QValeProdutoConsDT_EMISSAO: TDateTimeField;
    QValeProdutoItemCOD_VALE_PRODUTO_ITEM: TIntegerField;
    QValeProdutoItemCOD_VALE_PRODUTO: TIntegerField;
    QRValeProdutoCOD_VALE_PRODUTO: TIntegerField;
    QValeProdutoConsCOD_VALE_PRODUTO: TIntegerField;
    QValeProdutoConsIND_UTILIZADO: TStringField;
    QValeProdutoConsCOD_NOTA_CAB_TROCA: TIntegerField;
    QValeProdutoConsCOD_NOTA_CAB: TIntegerField;
    QValeProdutoConsCOD_NOTA_CAB_DEV: TIntegerField;
    CDSItensDevolucaoCOD_NOTA_ITEM: TIntegerField;
    CDSItensDevolucaoCOD_PRODUTO: TFloatField;
    CDSItensDevolucaoDESC_PRODUTO: TStringField;
    CDSItensDevolucaoVAL_UNITARIO: TFloatField;
    CDSItensDevolucaoQT_QUANTIDADE: TFloatField;
    CDSItensDevolucaoQT_DEVOLUCAO: TFloatField;
    CDSItensDevolucaoVAL_DESCONTO: TFloatField;
    CDSItensDevolucaoVAL_IPI: TFloatField;
    CDSItensDevolucaoVAL_DESPESAS: TFloatField;
    CDSItensDevolucaoVAL_ICMS_SUBST: TFloatField;
    CDSItensDevolucaoCOD_TRIBUTACAO: TIntegerField;
    CDSItensDevolucaoVAL_FRETE: TFloatField;
    CDSItensDevolucaoVAL_ICM_BASE: TFloatField;
    CDSItensDevolucaoVAL_ICM: TFloatField;
    CDSItensDevolucaoVAL_BASE_SUBST: TFloatField;
    CDSItensDevolucaoVAL_CUSTO: TFloatField;
    CDSItensDevolucaoCOD_CST_PIS: TStringField;
    CDSItensDevolucaoCOD_CST_COFINS: TStringField;
    CDSItensDevolucaoCOD_CST_IPI: TStringField;
    CDSItensDevolucaoVAL_PIS: TFloatField;
    CDSItensDevolucaoVAL_CONFINS: TFloatField;
    CDSItensDevolucaoCOD_LOTE_TIPO: TIntegerField;
    CDSItensDevolucaoDESC_INF_ADICIONAL: TStringField;
    CDSItensDevolucaoPERC_COMISSAO: TFloatField;
    QValeProdutoConsIND_VALIDO: TStringField;
    QRValeProdutoCOD_FILIAL: TIntegerField;
    QRValeProdutoDADOS_FILIAL: TStringField;
    QRValeProdutoDADOS_CADASTRO: TStringField;
    QRValeProdutoNUM_NOTA: TIntegerField;
    QRValeProdutoCOD_CADASTRO: TIntegerField;
    QValeProdutoConsIND_CANCELADO: TStringField;
    QRValeProdutoNUM_NOTA_DEV: TIntegerField;
    QNotaSaidaConsCOD_VENDEDOR: TIntegerField;
    QRValeProdutoDESC_TIPO_VALE: TStringField;
    QValeProdutoConsIND_FORMA_PGTO_VALE_PRESENTE: TIntegerField;
    QCaixa: TOracleDataSet1;
    QCaixaCOD_CAIXA_MOV: TIntegerField;
    QCaixaCOD_USUARIO: TIntegerField;
    QCaixaCOD_FILIAL: TIntegerField;
    QCaixaCOD_DEPARTAMENTO: TIntegerField;
    QCaixaCOD_HISTORICO: TIntegerField;
    QCaixaDT_MOVIMENTO: TDateTimeField;
    QCaixaVAL_MOVIMENTO: TFloatField;
    QCaixaDESC_HORARIO: TStringField;
    QCaixaCOD_CADASTRO: TIntegerField;
    QCaixaCOD_NOTA_CAB: TIntegerField;
    QCaixaCOD_CONTA_RECEBER_CAB: TIntegerField;
    QCaixaCOD_CONTA_PAGAR_CAB: TIntegerField;
    QCaixaDT_USUARIO: TDateTimeField;
    QCaixaDESC_COMPLEMENTO: TStringField;
    QCaixaCOD_PEDIDO_CAB: TIntegerField;
    QCaixaCOD_OFICINA_CAB: TIntegerField;
    QCaixaNUM_DOCUMENTO: TFloatField;
    QCaixaCOD_VALE_PRODUTO: TIntegerField;
    QValeProdutoConsDESC_TIPO_VALE: TStringField;
    QValeProdutoConsIND_SITUACAO_VALE_PRESENTE: TIntegerField;
    QValeProdutoValida: TOracleDataSet;
    QValeProdutoValidaCOD_FILIAL: TIntegerField;
    QValeProdutoValidaCOD_CADASTRO: TIntegerField;
    QValeProdutoValidaNOME: TStringField;
    QValeProdutoValidaCOD_VALE_PRODUTO: TIntegerField;
    QValeProdutoValidaVAL_VALE_PRODUTO: TFloatField;
    QValeProdutoValidaDT_EMISSAO: TDateTimeField;
    QValeProdutoValidaCOD_NOTA_CAB_TROCA: TIntegerField;
    QValeProdutoValidaIND_VALIDO: TStringField;
    QValeProdutoValidaIND_CANCELADO: TStringField;
    QValeProdutoValidaIND_UTILIZADO: TStringField;
    QValeProdutoValidaCOD_NOTA_CAB: TIntegerField;
    QValeProdutoValidaCOD_NOTA_CAB_DEV: TIntegerField;
    QValeProdutoValidaIND_FORMA_PGTO_VALE_PRESENTE: TIntegerField;
    QValeProdutoValidaDESC_TIPO_VALE: TStringField;
    QValeProdutoValidaIND_SITUACAO_VALE_PRESENTE: TIntegerField;
    QContaReceber: TOracleDataSet1;
    QContaReceberCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContaReceberCOD_FINALIDADE: TIntegerField;
    QContaReceberCOD_BANCO_AGENCIA: TIntegerField;
    QContaReceberCOD_FILIAL: TIntegerField;
    QContaReceberNUM_PARCELA: TIntegerField;
    QContaReceberDESC_TIPO_DOCUMENTO: TStringField;
    QContaReceberDT_MOVIMENTO: TDateTimeField;
    QContaReceberDT_BAIXA: TDateTimeField;
    QContaReceberDT_VENCIMENTO: TDateTimeField;
    QContaReceberDT_EMISSAO: TDateTimeField;
    QContaReceberDT_CAPITALIZACAO: TDateTimeField;
    QContaReceberVAL_TITULO: TFloatField;
    QContaReceberVAL_NEGOCIO: TFloatField;
    QContaReceberIND_ACEITE: TStringField;
    QContaReceberIND_SITUACAO: TStringField;
    QContaReceberDESC_OBSERVACAO: TStringField;
    QContaReceberCOD_NOTA_CAB: TIntegerField;
    QContaReceberCOD_CADASTRO: TIntegerField;
    QContaReceberVAL_ORIGINAL: TFloatField;
    QContaReceberCOD_NOSSO_NUMERO: TStringField;
    QContaReceberVAL_JUROS: TFloatField;
    QContaReceberCOD_DEPARTAMENTO: TIntegerField;
    QContaReceberCOD_CONTRATO_VEND: TIntegerField;
    QContaReceberDESC_AVALISTA1: TStringField;
    QContaReceberDESC_AVALISTA2: TStringField;
    QContaReceberCOD_VENDEDOR: TIntegerField;
    QContaReceberPERC_COMISSAO: TFloatField;
    QContaReceberDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QContaReceberVAL_PROMISSORIA: TFloatField;
    QContaReceberCOD_CONTA_CORRENTE: TIntegerField;
    QContaReceberCOD_OFICINA_CAB: TIntegerField;
    QContaReceberNUM_TITULO: TFloatField;
    QContaReceberIND_ENVIADO_BANCO: TStringField;
    QContaReceberCOD_USUARIO: TIntegerField;
    QContaReceberDT_USUARIO: TDateTimeField;
    QContaReceberCOD_VALE_PRODUTO: TIntegerField;
    QContaReceberMov: TOracleDataSet1;
    QContaReceberMovCOD_CONTA_RECEBER_MOV: TIntegerField;
    QContaReceberMovCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContaReceberMovDT_MOVIMENTO: TDateTimeField;
    QContaReceberMovVAL_MOVIMENTO: TFloatField;
    QContaReceberMovDESC_OBSERVACAO: TStringField;
    QContaReceberMovCOD_USUARIO: TIntegerField;
    QContaReceberMovDT_USUARIO: TDateTimeField;
    QContaReceberMovIND_TIPO_MOVIMENTO: TStringField;
    QContaReceberMovCOD_BCO_MOVIMENTO: TIntegerField;
    QContaReceberMovCOD_CAIXA_MOV: TIntegerField;
    QContaReceberMovCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QContaReceberMovCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QRValeProdutoDT_VENCIMENTO: TDateTimeField;
    QRValeProdutoIND_FORMA_PGTO_VALE_PRESENTE: TIntegerField;
    QRValeProdutoCOD_NOME_CADASTRO: TStringField;
    QValeProduto: TOracleDataSet1;
    QValeProdutoCOD_VALE_PRODUTO: TIntegerField;
    QValeProdutoCOD_NOTA_CAB: TIntegerField;
    QValeProdutoCOD_NOTA_CAB_DEV: TIntegerField;
    QValeProdutoCOD_NOTA_CAB_TROCA: TIntegerField;
    QValeProdutoDT_EMISSAO: TDateTimeField;
    QValeProdutoVAL_VALOR_BAIXADO: TFloatField;
    QValeProdutoVAL_VALE_PRODUTO: TFloatField;
    QValeProdutoCOD_NOTA_CAB_ANTERIOR: TIntegerField;
    QValeProdutoDESC_TIPO_VALE: TStringField;
    QValeProdutoCOD_FILIAL: TIntegerField;
    QValeProdutoIND_FORMA_PGTO_VALE_PRESENTE: TIntegerField;
    QValeProdutoIND_SITUACAO_VALE_PRESENTE: TIntegerField;
    QValeProdutoCOD_CADASTRO: TIntegerField;
    QValeProdutoCOD_USUARIO: TIntegerField;
    QValeProdutoDT_USUARIO: TDateTimeField;
    QValeProdutoIND_FORMA_PAGAMENTO: TIntegerField;
    QValeProdutoCOD_VENDEDOR: TIntegerField;
    QValeProdutoIND_MODALIDADE_CARTAO: TStringField;
    QValeProdutoVAL_AVISTA: TFloatField;
    QValeProdutosituacao: TStringField;
    QContasPagarCabCons: TOracleDataSet1;
    QContasPagarCabConsCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagarCabConsCOD_CADASTRO: TIntegerField;
    QContasPagarCabConsNUM_TITULO: TFloatField;
    QContasPagarCabConsVAL_TITULO: TFloatField;
    QContasPagarCabConsVAL_ORIGINAL: TFloatField;
    QContasPagarCabConsDT_BAIXA: TDateTimeField;
    QContasPagarCabConsIND_SITUACAO: TStringField;
    QContasPagarCabConsIND_ACEITE: TStringField;
    QContasPagarCabConsCOD_NOTA_CAB: TIntegerField;
    QContasPagarCabConsIND_DEVOLUCAO: TStringField;
    procedure QNotaSaidaConsAfterScroll(DataSet: TDataSet);
    procedure CDSItensDevolucaoQT_DEVOLUCAOValidate(Sender: TField);
    procedure limpaInstrucoes;
    procedure QValeProdutoCalcFields(DataSet: TDataSet);
    procedure QValeProdutoBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    valorTotalDevolucao: double;
    valorTotalTroca: double;

  public
    { Public declarations }
    property pValorTotalDevolucao: double
      read valorTotalDevolucao write valorTotalDevolucao;
    property pValorTotalTroca: double
      read valorTotalTroca write valorTotalTroca;
    procedure atualizaValorTotalDevolucao;
    procedure atualizaValorTotalTroca;
    Procedure CalculaICM;
    procedure IncluiCaixa(wVal_Movimento: Real; wTipo, wFilial, wCadastro, wNumDocumento: string;
      wDataMov: TDateTime);
    procedure GeraContaReceber();
  end;

var
  DMDevolucaoTroca: TDMDevolucaoTroca;

implementation

uses UNotaSaida_cl, UOracle_cl, UTributacao_cl, UOperacao_cl, UFilial_cl,
  UParamSistema_cl, UEstado_cl, UBiblioteca, UUsuario_cl, UFinalidade_cl;

{$R *.dfm}

procedure TDMDevolucaoTroca.QNotaSaidaConsAfterScroll(DataSet: TDataSet);
begin
  CDSItensTroca.EmptyDataSet;
  atualizaValorTotalTroca;
  if QNotaSaidaConsCOD_NOTA_CAB.Value > 0 then
  begin
    CDSItensDevolucao.Close;
    CDSItensDevolucao.Params[0].Value
      := QNotaSaidaConsCOD_NOTA_CAB.Value;
    CDSItensDevolucao.Open;
  end;
end;

procedure TDMDevolucaoTroca.CDSItensDevolucaoQT_DEVOLUCAOValidate(
  Sender: TField);
begin
  if CDSItensDevolucaoQT_QUANTIDADE.Value < CDSItensDevolucaoQT_DEVOLUCAO.Value then
  begin
    MessageDlg('Quantidade de devolução não pode ser maior que a quantidade vendida',
      mtError, [mbOk], 0);
    Abort;
  end;
  if CDSItensDevolucaoQT_DEVOLUCAO.Value < 0 then
  begin
    MessageDlg('Quantidade de devolução não pode ser menor que zero',
      mtError, [mbOk], 0);
    Abort;
  end;
end;

procedure TDMDevolucaoTroca.atualizaValorTotalDevolucao;
var wRecNo: integer;
begin
  pValorTotalDevolucao := 0;
  if CDSItensDevolucao.RecordCount > 0 then
  begin
    wRecNo := CDSItensDevolucao.RecNo;
    CDSItensDevolucao.First;
    while not CDSItensDevolucao.Eof do
    begin
      if CDSItensDevolucaoQT_DEVOLUCAO.Value > 0 then
        if DMParamSistema.CodEmpresa = 'ARISTIDES' then
          pValorTotalDevolucao := pValorTotalDevolucao +
            (CDSItensDevolucaoQT_DEVOLUCAO.Value * CDSItensDevolucaoVAL_UNITARIO.Value)
            //Não considera mais o desconto do item no vale-compras (Pedido da Aristides) 29/02/2016
        else
          pValorTotalDevolucao := pValorTotalDevolucao +
            (CDSItensDevolucaoQT_DEVOLUCAO.Value * CDSItensDevolucaoVAL_UNITARIO.Value)
            - CDSItensDevolucaoQT_DEVOLUCAO.Value *
              (CDSItensDevolucaoVAL_DESCONTO.Value / CDSItensDevolucaoQT_QUANTIDADE.Value)
            + CDSItensDevolucaoQT_DEVOLUCAO.Value *
              (CDSItensDevolucaoVAL_DESPESAS.Value / CDSItensDevolucaoQT_QUANTIDADE.Value)
            + CDSItensDevolucaoQT_DEVOLUCAO.Value *
              (CDSItensDevolucaoVAL_ICMS_SUBST.Value / CDSItensDevolucaoQT_QUANTIDADE.Value);
      CDSItensDevolucao.Next;
    end;
    CDSItensDevolucao.RecNo := wRecNo;
  end;
end;



Procedure TDMDevolucaoTroca.CalculaICM;
  function CalculaICMSParaDescontar: Boolean;
  var
    wRegimeTributario: string;
  begin
    result := False;
    if(Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Value, 2, 2) = '30') or // isenta ou nao Tributada e com cobranca de icms por substituicao tributaria
      (DMTributacao.QTributacaoDESC_CSOSN.Value ='201') or //
      (DMTributacao.QTributacaoDESC_CSOSN.Value ='202') or
      (DMTributacao.QTributacaoDESC_CSOSN.Value ='203') or
      (DMTributacao.QTributacaoDESC_CSOSN.Value ='900') then
      result := True;
  end;
Var wPercICM,wPercAliqSubs,wBaseAliqSubs, wValIcmItem, wValBaseIcmItem, wValBaseSubstItem, wValIcmDeduzido: Real;
    wPercDesc,wAuxBase, wTotal, wValUnitario, wQtPedido : Real;
    wPrecoPauta,wTipoCalculo : String;
    wClasse, wTribEstado : Integer;
    wTipoCliente, wEstado,wIPI : string;
begin
  wPercAliqSubs := 0;
  wBaseAliqSubs := 0;
  wPercDesc := 0;
  wEstado := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO ','COD_CADASTRO='+QNotaSaidaConsCOD_CADASTRO.Text);
//  if DMPedido.QPedidoItemPERC_DESCONTO.Value > 0 then
//    wValUnitario := QPedidoItemVAL_UNITARIO.Value-((QPedidoItemVAL_UNITARIO.Value*QPedidoItemPERC_DESCONTO.Value)/100)
//  else
    wValUnitario := CDSItensTrocaVAL_UNITARIO.Value;
  wQtPedido := CDSItensTrocaQT_QUANTIDADE.Value;
  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK', QNotaSaidaConsCOD_FILIAL.Text);
  DMFilial.QFilial.Open;
  Try
    //If QSomaPedidoSTotal_Pedido.Value >= 0 then
      wTotal := wValUnitario * wQtPedido;
    //else
    //  wTotal := (wValUnitario*wQtPedido)+((wValUnitario*wQtPedido)*QPedidoItemPERC_ACRESCIMO.Value/100);

    //If wTotal <> 0 Then
    //  wPercDesc := 1+(QPedidoVal_Desconto.Value)/wTotal;
    If Trim(CDSItensTrocaCOD_TRIBUTACAO.Text) <> '' then
    Begin
      wIPI := DMOracle.BuscaNome('SELECT PERC_IPI FROM TB_PRODUTO','COD_PRODUTO=' + CDSItensTrocaCOD_PRODUTO.Text);
      If DMTributacao.QTributacaoCod_Tributacao.Value <>  CDSItensTrocaCOD_TRIBUTACAO.Value Then
      Begin
        DMTributacao.QTributacao.Close;
        DMTributacao.QTributacao.SetVariable('Pk',CDSItensTrocaCOD_TRIBUTACAO.Value);
        DMTributacao.QTributacao.Open;
      End;
      wPercICM := DMTributacao.QTributacaoPERC_ALIQUOTA.Value;
      wAuxBase := DMTributacao.QTributacaoPERC_TRIBUTADO.Value;
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZAPOLI' then
      Begin
        wTribEstado := strtoint(DMOracle.BuscaNome('SELECT PERC_TRIBUTACAO FROM TB_ESTADO','COD_ESTADO='+chr(39)+wEstado+chr(39)));
        wPercICM := StrToFloat(DMOracle.BuscaNome('SELECT PERC_ALIQUOTA FROM TB_TRIBUTACAO','COD_TRIBUTACAO='+IntToStr(wTribEstado)));
        wAuxBase := StrToFloat(DMOracle.BuscaNome('SELECT PERC_TRIBUTADO FROM TB_TRIBUTACAO','COD_TRIBUTACAO='+IntToStr(wTribEstado)));
      end;

      DMOperacao.QOperacao.Close;
      DMOperacao.QOperacao.SetVariable('PK', QNotaSaidaConsCOD_OPERACAO.Text);
      DMOperacao.QOperacao.Open;
      If ((DMOperacao.QOperacaoInd_Vendas.Value = 'V') Or
         (DMOperacao.QOperacaoInd_Bonificacao.Value = 'S')) Then
         If (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Text,2,2) = '10') Or   // Tributada e com cobranca de icms por substituicao tributaria
            (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Text,2,2) = '30') or   // isenta ou nao Tributada e com cobranca de icms por substituicao tributaria
            (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Text,2,2) = '60') or   // icms cobrado anteriormente por substituicao tributaria
            (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Text,2,2) = '70') or   // icms cobrado anteriormente por substituicao tributaria
            (Copy(DMTributacao.QTributacaoDESC_CSOSN.Text,1,3) = '201')        or
            (Copy(DMTributacao.QTributacaoDESC_CSOSN.Text,1,3) = '202')        or
            (Copy(DMTributacao.QTributacaoDESC_CSOSN.Text,1,3) = '203')        or
            (Copy(DMTributacao.QTributacaoDESC_CSOSN.Text,1,3) = '900') Then
         Begin
           If DMEstado.QEstadoCod_Estado.Value <> wEstado Then
           Begin
             DMEstado.QEstado.Close;
             DMEstado.QEstado.SetVariable('COD_ESTADO',wEstado);
             DMEstado.QEstado.Open;
           End;
           wPercAliqSubs := DMEstado.QEstadoPERC_ALIQ_SUBST.Value;
           wBaseAliqSubs := DMEstado.QEstadoPERC_BASE_SUBST.Value;
           DmTributacao.QProdutoSubstTribCons.Close; // esta trabalhando com esta tabela para o caso de produtos com substituicao diferente dentro do mesmo estado  - Cesar - 04/02/2010
           DmTributacao.QProdutoSubstTribCons.SetVariable('Cod_Produto', CDSItensTrocaCod_Produto.Value);
           DmTributacao.QProdutoSubstTribCons.SetVariable('Cod_Estado', wEstado);
           DmTributacao.QProdutoSubstTribCons.Open;
           if not (DmTributacao.QProdutoSubstTribCons.Eof) then
           begin
             wPercAliqSubs := DmTributacao.QProdutoSubstTribConsPerc_Aliquota.Value;
             wBaseAliqSubs := DmTributacao.QProdutoSubstTribConsPerc_Tributado.Value;
           end;
           DmTributacao.QProdutoSubstTribCons.Close;
         End;
      // Rotina para verificar se tem preco pauta para calculo de icms

      // wValBaseIcmItem := QPedidoItemValor_total.Value * wAuxBase / 100 * wPercDesc;
      wValBaseIcmItem := wTotal * wAuxBase / 100;
      wValIcmItem := wValBaseIcmItem * wPercICM / 100;

     If ((DMOperacao.QOperacaoInd_Vendas.Value = 'V') Or
        (DMOperacao.QOperacaoInd_Bonificacao.Value = 'S')) Then
       If (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Value,2,2) = '10') Or   // Tributada e com cobranca de icms por substituicao tributaria
          (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Value,2,2) = '30') or   // isenta ou nao Tributada e com cobranca de icms por substituicao tributaria
          (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Value,2,2) = '60') or   // icms cobrado anteriormente por substituicao tributaria
          (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Value,2,2) = '70') or  // reducao de base de calculo e cobranca de icms por substituicao tributaria
          (Copy(DMTributacao.QTributacaoDESC_CSOSN.Text,1,3) = '201')        or
          (Copy(DMTributacao.QTributacaoDESC_CSOSN.Text,1,3) = '202')        or
          (Copy(DMTributacao.QTributacaoDESC_CSOSN.Text,1,3) = '203')        or
          (Copy(DMTributacao.QTributacaoDESC_CSOSN.Text,1,3) = '900') Then
        Begin
          wTipoCalculo := DMOracle.BuscaNome('SELECT IND_SUBSTITUICAO FROM TB_FILIAL','COD_FILIAL = ' + QNotaSaidaConsCod_Filial.Text,True);
          wPrecoPauta := DMOracle.BuscaNome('SELECT PERC_ALIQUOTA FROM TB_PRODUTO_SUBST_TRIB','COD_PRODUTO = '+ CDSItensTrocaCod_Produto.Text + ' And COD_ESTADO='+chr(39)+wEstado+chr(39));
          If (wPrecoPauta <> '') And (wTipoCalculo = 'P') Then  // calculo por pauta cfe tabela de filial
          Begin
            //wValBaseSubstItem := StrToFloat(wPrecoPauta) * QPedidoItemQt_Pedido.Value;
            wBaseAliqSubs := StrToFloat(DMOracle.BuscaNome('SELECT PERC_TRIBUTADO FROM TB_PRODUTO_SUBST_TRIB','COD_PRODUTO = '+CDSItensTrocaCod_Produto.Text + ' And COD_ESTADO='+chr(39)+wEstado+chr(39)));
            //wValBaseSubstItem := ((wTotal+(StrToFLoat(wIPI)*wTotal/100)) * wBaseAliqSubs / 100)
            wValBaseSubstItem := (wTotal * wBaseAliqSubs / 100);
          End
        Else
          //wValBaseSubstItem := ((wTotal+(StrToFLoat(wIPI)*wTotal/100)) * wBaseAliqSubs / 100 );
          wValBaseSubstItem := (wTotal * wBaseAliqSubs / 100);

        CDSItensTrocaVal_Icms_Subst.Value := wValBaseSubstItem * wPercAliqSubs / 100;

        wValIcmDeduzido := 0;
        if CalculaICMSParaDescontar then
          if(DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZAPOLI') then //a pedido dO JUNIOR ,
            wValIcmDeduzido := ((wValUnitario * wQtPedido) * 0.12);

        If CDSItensTrocaVal_Icms_Subst.Value <> 0 Then
        begin
          CDSItensTrocaVal_Icms_Subst.Value := CDSItensTrocaVal_Icms_Subst.Value - wValIcmItem - wValIcmDeduzido;
          If DMOracle.BuscaNome('SELECT IND_REGIME_TRIBUTARIO FROM TB_CADASTRO','COD_CADASTRO = ' + QNotaSaidaConsCOD_CADASTRO.Text,True) <> '3' Then
                                                                                  //implementado por Adriel em
            CdsitenstrocaVal_Icms_Subst.Value := CdsitenstrocaVal_Icms_Subst.Value -  //09/05/2014 para a Provina
                                              (CDSItensTrocaVal_Icms_Subst.Value *
                                              DMEstado.QEstadoPERC_REDUCAO_ICMS_SUBST.Value / 100);
        end;
      End;
    End;
  Except
    raise; //aqui
    //Raise Exception.Create ('Erro no Calculo de Icms');
  End;
End;


procedure TDMDevolucaoTroca.atualizaValorTotalTroca;
var wRecNo: integer;
begin
  pValorTotalTroca := 0;
  wRecNo := CDSItensDevolucao.RecNo;
  CDSItensTroca.First;
  while not CDSItensTroca.Eof do
  begin
    pValorTotalTroca :=
      pValorTotalTroca + CDSItensTrocaVAL_TOTAL.Value;
    CDSItensTroca.Next;
  end;
  if not CDSItensTroca.IsEmpty then
    CDSItensTroca.RecNo := wRecNo;
end;

procedure TDMDevolucaoTroca.limpaInstrucoes;
begin
  CDSItensDevolucao.EmptyDataSet;
  CDSItensTroca.EmptyDataSet;
  atualizaValorTotalDevolucao;
  atualizaValorTotalTroca;
  QNotaSaidaCons.Close;
  QNotaSaidaCons.setvariable('DT_INICIAL', '01/01/1900');
  QNotaSaidaCons.setvariable('DT_FINAL', '01/01/1900');
  QNotaSaidaCons.Open;
end;

procedure TDMDevolucaoTroca.QValeProdutoCalcFields(DataSet: TDataSet);
begin
  if not QValeProduto.Eof then
  begin
    if QValeProdutoIND_SITUACAO_VALE_PRESENTE.Value = 1 then
      QValeProdutosituacao.Value := 'NÃO EMITIDO'
    else if QValeProdutoIND_SITUACAO_VALE_PRESENTE.Value = 2 then
      QValeProdutosituacao.Value := 'EMITIDO'
    else
      QValeProdutosituacao.Value := 'CANCELADO';
  end;
end;

procedure TDMDevolucaoTroca.IncluiCaixa(wVal_Movimento: Real; wTipo, wFilial, wCadastro, wNumDocumento: string;
  wDataMov: TDateTime);
var wHistorico: string;
begin
  try
    if wTipo = 'VENDA A VISTA' then
      wHistorico := DMOracle.BuscaNome('SELECT COD_HISTORICO_CAIXA_VALE FROM TB_PARAM_SISTEMA','1=1')
    else if wTipo = 'CARTAO DE CREDITO' then
      wHistorico := DMOracle.BuscaNome('SELECT COD_HISTORICO_CARTAO_CREDITO FROM TB_PARAM_SISTEMA','1=1')
    else if wTipo = 'CARTAO DE DEBITO' then
      wHistorico := DMOracle.BuscaNome('SELECT COD_HISTORICO_CARTAO_DEBITO FROM TB_PARAM_SISTEMA','1=1');

    if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES') then
      wHistorico := '10';

    // falta acertar para possíveis outras empresas
    if wHistorico <> '' then
    begin
      QCaixa.Open;
      QCaixa.Insert;
      QCaixaCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
      QCaixaCOD_FILIAL.Value := StrToInt(wFilial);
      QCaixaCOD_DEPARTAMENTO.Value := DMUsuario.CodDepartamentoUsuario;
      QCaixaCOD_HISTORICO.Value := StrToInt(wHistorico);
      QCaixaDT_MOVIMENTO.Value := wDataMov;
      QCaixaVAL_MOVIMENTO.Value := wVal_Movimento;
      QCaixaCOD_CADASTRO.Value := StrToInt(wCadastro);
      if wNumDocumento <> '' then
        QCaixaNUM_DOCUMENTO.Value := StrToInt(wNumDocumento);
      QCaixaDESC_COMPLEMENTO.Value := 'Venda Vale-presente nº: ' + wNumDocumento;
      
      QCaixaCOD_VALE_PRODUTO.Value := StrToInt(wNumDocumento);
      QCaixaDT_USUARIO.Value := DMOracle.DataServ;
      QCaixa.Post;
      QCaixa.Close;
    end;
  except
    if QCaixa.State = dsInsert then
      QCaixa.Cancel;
    raise;
  end;
end;
procedure TDMDevolucaoTroca.GeraContaReceber();
begin
  QContaReceber.Open;
  try
    QContaReceber.Insert;
    QContaReceberCOD_CONTA_RECEBER_CAB.Value := DMOracle.Sequencia('CONTA_RECEBER');
    if DMParamSistema.CodEmpresa = 'ARISTIDES' then
      QContaReceberCOD_FINALIDADE.Value := 3
    else
      QContaReceberCOD_FINALIDADE.Value := DMUsuario.CodFinalidadeUsuario;
    QContaReceberCOD_CADASTRO.Value := QValeProdutoCOD_CADASTRO.Value;
    QContaReceberCOD_FILIAL.Value := QValeProdutoCOD_FILIAL.Value;
    QContaReceberCOD_DEPARTAMENTO.Value := DMUsuario.CodDepartamentoUsuario;

    QContaReceberNUM_TITULO.Value := QValeProdutoCOD_VALE_PRODUTO.Value;
    QContaReceberNUM_PARCELA.Value := 1;
    QContaReceberDT_MOVIMENTO.Value := DMOracle.DataHoraServ;
    QContaReceberDT_VENCIMENTO.Value := QValeProdutoDT_EMISSAO.Value + 30;
    QContaReceberDT_EMISSAO.Value := QValeProdutoDT_EMISSAO.Value;
    QContaReceberDT_CAPITALIZACAO_MOEDA.Value := QValeProdutoDT_EMISSAO.Value;

    with DMFinalidade do
    begin
      QFinalidade.Close;
      QFinalidade.SetVariable('PK', DMUsuario.CodFinalidadeUsuario);
      QFinalidade.Open;
      if QFinalidadeInd_Encargo.Value = 'EMISSAO' then
        QContaReceberDT_CAPITALIZACAO.Value := QContaReceberDT_EMISSAO.Value
      else
        QContaReceberDT_CAPITALIZACAO.Value := QContaReceberDT_VENCIMENTO.Value;
    end;

    QContaReceberVAL_TITULO.Value := QValeProdutoVAL_VALE_PRODUTO.Value - QValeProdutoVAL_AVISTA.Value;
    QContaReceberIND_ACEITE.Value := 'NAO';
    QContaReceberIND_SITUACAO.Value := 'ABERTO';
    QContaReceberVAL_ORIGINAL.Value := QContaReceberVal_Titulo.Value;
    QContaReceberCOD_VENDEDOR.Value := QValeProdutoCOD_VENDEDOR.Value;
    QContaReceberCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
    QContaReceberDT_Usuario.Value := DMOracle.DataHoraServ;
    QContaReceber.Post;

    QContaReceberMov.Open;
    QContaReceberMov.Insert;
    QContaReceberMovCod_Conta_Receber_Cab.Value := QContaReceberCod_Conta_Receber_Cab.Value;
    QContaReceberMovCod_Conta_Receber_Mov.Value := DMOracle.Sequencia('CONTA_RECEBER_MOV');
    QContaReceberMovDt_Movimento.Value := QValeProdutoDT_EMISSAO.Value;
    QContaReceberMovInd_Tipo_Movimento.Value := 'PRINCIPAL';
    QContaReceberMovDT_Usuario.Value := DMOracle.DataHoraServ;
    QContaReceberMovCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
    QContaReceberMovVal_Movimento.Value := QContaReceberVal_Titulo.Value;
    QContaReceberMov.Post;
  except
    if QContaReceberMov.State in [dsEdit, dsInsert] then
      QContaReceberMov.Cancel;
    if QContaReceber.State in [dsEdit, dsInsert] then
      QContaReceber.Cancel;
    raise;
  end;
  QContaReceberMov.Close;
  QContaReceber.Close;
end;

procedure TDMDevolucaoTroca.QValeProdutoBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QValeProdutoCOD_FILIAL.Text);
  QValeProdutoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  QValeProdutoDT_USUARIO.Value := Date;
end;

end.
