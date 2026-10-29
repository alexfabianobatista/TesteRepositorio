unit UContratoArroz_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMContratoArroz = class(TDataModule)
    DSContrato_Arroz: TDataSource;
    DSContratoSaldo: TDataSource;
    DSContrato_Nota_Saldo: TDataSource;
    DSContrato_Arroz_Item_Cons: TDataSource;
    QContrato_Nota_Saldo: TOracleDataSet1;
    QContratoSaldo: TOracleDataSet1;
    QContratoSaldoCOD_CONTRATO_ARROZ: TIntegerField;
    QContratoSaldoCOD_CADASTRO: TIntegerField;
    QContratoSaldoCOD_PRODUTO: TIntegerField;
    QContratoSaldoQT_QUANTIDADE: TFloatField;
    QContratoSaldoDESC_TIPO: TStringField;
    QContratoSaldoVL_PRECO_SACA: TFloatField;
    QContratoSaldoCOD_FILIAL: TIntegerField;
    QContratoSaldoDT_EMISSAO: TDateTimeField;
    QContratoSaldoNUM_CONTRATO: TIntegerField;
    QContratoSaldoQT_SALDO: TFloatField;
    QContratoSaldoNOME: TStringField;
    QContrato_Arroz: TOracleDataSet1;
    QContrato_ArrozCOD_CONTRATO_ARROZ: TIntegerField;
    QContrato_ArrozCOD_CADASTRO: TIntegerField;
    QContrato_ArrozCOD_FILIAL: TIntegerField;
    QContrato_ArrozCOD_PRODUTO: TIntegerField;
    QContrato_ArrozQT_QUANTIDADE: TFloatField;
    QContrato_ArrozDESC_TIPO: TStringField;
    QContrato_ArrozPERC_GRAOS_INTEIROS: TFloatField;
    QContrato_ArrozPERC_GRAOS_QUEBRADOS: TFloatField;
    QContrato_ArrozVL_PRECO_SACA: TFloatField;
    QContrato_ArrozPERC_FUNRURAL: TFloatField;
    QContrato_ArrozVL_ARREDONDAMENTO: TFloatField;
    QContrato_ArrozVL_ADIANTAMENTO: TFloatField;
    QContrato_ArrozVL_FRETE: TFloatField;
    QContrato_ArrozDESC_OBSERVACAO: TStringField;
    QContrato_ArrozDT_EMISSAO: TDateTimeField;
    QContrato_ArrozNUM_CONTRATO: TIntegerField;
    QContrato_ArrozQT_SALDO: TFloatField;
    QContrato_Arroz_Item: TOracleDataSet1;
    QContrato_Arroz_ItemCOD_CONTRATO_ARROZ_ITEM: TIntegerField;
    QContrato_Arroz_ItemCOD_CONTRATO_ARROZ: TIntegerField;
    QContrato_Arroz_ItemCOD_NOTA_ITEM: TIntegerField;
    QContrato_Arroz_ItemQT_QUANTIDADE: TFloatField;
    QContrato_Arroz_Item_Cons: TOracleDataSet1;
    QContrato_ArrozCons: TOracleDataSet1;
    QContrato_ArrozConsCOD_CONTRATO_ARROZ: TIntegerField;
    QContrato_ArrozConsCOD_CADASTRO: TIntegerField;
    QContrato_ArrozConsCOD_PRODUTO: TIntegerField;
    QContrato_ArrozConsQT_QUANTIDADE: TFloatField;
    QContrato_ArrozConsDT_EMISSAO: TDateTimeField;
    QContrato_ArrozConsCOD_FILIAL: TIntegerField;
    QContrato_ArrozConsDESC_TIPO: TStringField;
    QContrato_ArrozConsPERC_GRAOS_INTEIROS: TFloatField;
    QContrato_ArrozConsPERC_GRAOS_QUEBRADOS: TFloatField;
    QContrato_ArrozConsVL_PRECO_SACA: TFloatField;
    QContrato_ArrozConsPERC_FUNRURAL: TFloatField;
    QContrato_ArrozConsVL_ARREDONDAMENTO: TFloatField;
    QContrato_ArrozConsVL_ADIANTAMENTO: TFloatField;
    QContrato_ArrozConsVL_FRETE: TFloatField;
    QContrato_ArrozConsDESC_OBSERVACAO: TStringField;
    QContrato_ArrozConsNUM_CONTRATO: TIntegerField;
    QContaPagar: TOracleDataSet1;
    QContaPagarMov: TOracleDataSet1;
    QContaPagarMovCOD_CONTA_PAGAR_MOV: TIntegerField;
    QContaPagarMovCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContaPagarMovDT_MOVIMENTO: TDateTimeField;
    QContaPagarMovVAL_MOVIMENTO: TFloatField;
    QContaPagarMovDESC_OBSERVACAO: TStringField;
    QContaPagarMovIND_TIPO_MOVIMENTO: TStringField;
    QContaPagarMovDT_USUARIO: TDateTimeField;
    QContaPagarMovCOD_USUARIO: TIntegerField;
    QContaPagarMovCOD_BCO_MOVIMENTO: TIntegerField;
    QContaPagarMovCOD_CAIXA_MOV: TIntegerField;
    QContaPagarMovCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QContaPagarMovCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QContaPagarCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContaPagarCOD_FINALIDADE: TIntegerField;
    QContaPagarCOD_BANCO_AGENCIA: TIntegerField;
    QContaPagarCOD_CADASTRO: TIntegerField;
    QContaPagarCOD_FILIAL: TIntegerField;
    QContaPagarNUM_TITULO: TIntegerField;
    QContaPagarNUM_PARCELA: TIntegerField;
    QContaPagarDESC_TIPO_DOCUMENTO: TStringField;
    QContaPagarDT_MOVIMENTO: TDateTimeField;
    QContaPagarDT_BAIXA: TDateTimeField;
    QContaPagarDT_VENCIMENTO: TDateTimeField;
    QContaPagarDT_EMISSAO: TDateTimeField;
    QContaPagarDT_CAPITALIZACAO: TDateTimeField;
    QContaPagarVAL_TITULO: TFloatField;
    QContaPagarCOD_NOTA_CAB: TIntegerField;
    QContaPagarIND_ACEITE: TStringField;
    QContaPagarIND_SITUACAO: TStringField;
    QContaPagarVAL_ORIGINAL: TFloatField;
    QContaPagarVAL_INDEXADO: TFloatField;
    QContaPagarCOD_DEPARTAMENTO: TIntegerField;
    QContaPagarCOD_CONTRATO: TIntegerField;
    QContaPagarCOD_CONTRATO_GP: TIntegerField;
    QContaPagarCOD_CONTRATO_VEND: TIntegerField;
    QContaPagarCOD_CONTRATO_ARROZ: TIntegerField;
    QContrato_Arroz_Item_ConsCOD_CONTRATO_ARROZ_ITEM: TIntegerField;
    QContrato_Arroz_Item_ConsCOD_CONTRATO_ARROZ: TIntegerField;
    QContrato_Arroz_Item_ConsCOD_NOTA_ITEM: TIntegerField;
    QContrato_Arroz_Item_ConsQT_QUANTIDADE: TFloatField;
    QContrato_Arroz_Item_ConsNUM_NOTA: TIntegerField;
    QContrato_Arroz_Item_ConsDT_EMISSAO: TDateTimeField;
    QContaPagarDESC_OBSERVACAO: TStringField;
    QContaPagarCOD_CONHECIMENTO_FRETE: TIntegerField;
    QContratoImplantacaoSaldo: TOracleDataSet1;
    QContratoImplantacaoSaldoCOD_CADASTRO: TIntegerField;
    QContratoImplantacaoSaldoQT_SALDO: TFloatField;
    QContratoImplantacaoSaldoVAL_SALDO: TFloatField;
    QContratoImplantacaoSaldoDT_IMPLANTACAO: TDateTimeField;
    QContratoImplantacaoSaldoCons: TOracleDataSet1;
    QContratoImplantacaoSaldoCOD_CONTRATO_ARROZ_SALDO: TIntegerField;
    QContratoImplantacaoSaldoCOD_PRODUTO: TFloatField;
    QContratoImplantacaoSaldoConsCOD_CONTRATO_ARROZ_SALDO: TIntegerField;
    QContratoImplantacaoSaldoConsCOD_CADASTRO: TIntegerField;
    QContratoImplantacaoSaldoConsCOD_PRODUTO: TFloatField;
    QContratoImplantacaoSaldoConsQT_SALDO: TFloatField;
    QContratoImplantacaoSaldoConsVAL_SALDO: TFloatField;
    QContratoImplantacaoSaldoConsDT_IMPLANTACAO: TDateTimeField;
    QContratoImplantacaoSaldoConsNOME: TStringField;
    QContrato_ArrozIND_TIPO_CONTRATO: TStringField;
    QContratoSaldoDESC_PRODUTO: TStringField;
    QContrato_ArrozIND_SITUACAO: TStringField;
    QRFinanceiroContrato: TOracleDataSet1;
    QRFinanceiroContratoQUANTIDADE_CONTRATO: TFloatField;
    QRFinanceiroContratoDT_EMISSAO_CONTRATO: TDateTimeField;
    QRFinanceiroContratoQT_SALDO: TFloatField;
    QRFinanceiroContratoCOD_ESTADO: TStringField;
    QRFinanceiroContratoNOME: TStringField;
    QRFinanceiroContratoKG_LIQUIDO: TFloatField;
    QRFinanceiroContratoVAL_PAGTO: TFloatField;
    QContrato_ArrozCOD_NOTA_CAB: TIntegerField;
    QContrato_ArrozCOD_OPERACAO: TIntegerField;
    QNotaSaidaCab: TOracleDataSet1;
    QNotaSaidaCabCOD_NOTA_CAB: TIntegerField;
    QNotaSaidaCabCOD_USUARIO: TIntegerField;
    QNotaSaidaCabCOD_FILIAL: TIntegerField;
    QNotaSaidaCabCOD_MENSAGEM: TIntegerField;
    QNotaSaidaCabCOD_TRANSPORTE: TIntegerField;
    QNotaSaidaCabCOD_OPERACAO: TIntegerField;
    QNotaSaidaCabCOD_ESTADO: TStringField;
    QNotaSaidaCabCOD_VENDEDOR: TIntegerField;
    QNotaSaidaCabCOD_CADASTRO: TIntegerField;
    QNotaSaidaCabNUM_NOTA: TIntegerField;
    QNotaSaidaCabCOD_SERIE: TStringField;
    QNotaSaidaCabIND_SITUACAO: TStringField;
    QNotaSaidaCabIND_CONDICAO_PAGTO: TStringField;
    QNotaSaidaCabDT_EMISSAO: TDateTimeField;
    QNotaSaidaCabDT_MOVIMENTO: TDateTimeField;
    QNotaSaidaCabDT_RECEBIMENTO: TDateTimeField;
    QNotaSaidaCabCOD_MOTIVO_CANC: TIntegerField;
    QNotaSaidaCabVAL_DESPESAS: TFloatField;
    QNotaSaidaCabIND_ENTRADA_SAIDA: TStringField;
    QNotaSaidaCabVAL_FRETE: TFloatField;
    QNotaSaidaCabVAL_DESCONTO: TFloatField;
    QNotaSaidaCabCOD_TRANSPORTADOR: TIntegerField;
    QNotaSaidaCabNUM_CONHECIMENTO_FRETE: TIntegerField;
    QNotaSaidaCabVAL_AVISTA: TFloatField;
    QNotaSaidaCabIND_TIPO_FRETE: TStringField;
    QNotaSaidaCabNUM_VOLUMES: TIntegerField;
    QNotaSaidaCabOBS: TStringField;
    QNotaSaidaCabOBS_COMPLEMENTO: TStringField;
    QNotaSaidaCabDT_USUARIO: TDateTimeField;
    QNotaSaidaCabCOD_TRIBUTACAO_FRETE: TIntegerField;
    QNotaSaidaCabVAL_TOTAL_IPI: TFloatField;
    QNotaSaidaCabVAL_ICM_FRETE: TFloatField;
    QNotaSaidaCabVAL_ICM_BASE_FRETE: TFloatField;
    QNotaSaidaCabVAL_FUNRURAL: TFloatField;
    QNotaSaidaCabDESC_PLACA: TStringField;
    QNotaSaidaCabDESC_TRANSPORTADORA: TStringField;
    QNotaSaidaCabCOD_NOTA_CONTA_CORRENTE: TIntegerField;
    QNotaSaidaCabDT_EMISSAO_CF: TDateTimeField;
    QNotaSaidaCabCOD_OPERACAO_CF: TIntegerField;
    QNotaSaidaCabNR_DIAS_CHEQUE: TIntegerField;
    QNotaSaidaCabCOD_CONTRATO_MOV: TIntegerField;
    QNotaSaidaCabCOD_CONTRATO_GP_MOV: TIntegerField;
    QNotaSaidaCabNR_DIAS_CHEQUE1: TIntegerField;
    QNotaSaidaCabNR_DIAS_CHEQUE2: TIntegerField;
    QNotaSaidaCabIND_NOTA_SEGURO: TStringField;
    QNotaSaidaCabCOD_CONTRATO_VEND: TIntegerField;
    QNotaSaidaCabNR_ROTA: TIntegerField;
    QNotaSaidaCabPERC_COMISSAO: TFloatField;
    QNotaSaidaCabIND_MILHAGEM: TStringField;
    QNotaSaidaCabNUM_OS: TIntegerField;
    QNotaSaidaCabCOD_DEPARTAMENTO: TIntegerField;
    QNotaSaidaCabVAL_PEDAGIO: TFloatField;
    QNotaSaidaCabCOD_VENDEDOR_PREPOSTO: TIntegerField;
    QNotaSaidaCabNR_DIAS_CHEQUE3: TIntegerField;
    QNotaSaidaCabVAL_FRETE_TON: TFloatField;
    QNotaSaidaCabDESC_OBS_CORPO_NOTA: TStringField;
    QNotaSaidaCabCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QNotaSaidaCabCOD_CADASTRO_PARCEIRO: TIntegerField;
    QNotaSaidaCabNUM_PEDIDO: TIntegerField;
    QNotaSaidaCabCOD_ORDEM_CARREGAMENTO_CAB: TIntegerField;
    QNotaSaidaCabNR_DIAS_CHEQUE4: TIntegerField;
    QNotaSaidaCabDESC_OBS_DEVOLUCAO: TStringField;
    QNotaSaidaCabCOD_PRAZO_VENCIMENTO: TIntegerField;
    QNotaSaidaCabNUM_DIAS_CARENCIA: TIntegerField;
    QNotaSaidaCabCOD_CULTURA: TIntegerField;
    QNotaSaidaCabCOD_MOTORISTA: TIntegerField;
    QNotaSaidaCabCOD_CONTRATO_PJURIDICA: TIntegerField;
    QNotaSaidaCabCOD_CADASTRO_CLASSIFICACAO: TIntegerField;
    QNotaSaidaCabIND_IMPRIME_FRETE: TStringField;
    QNotaSaidaCabIND_IMPRIME_CAB: TStringField;
    QNotaSaidaCabVAL_IMPOSTO: TFloatField;
    QNotaSaidaCabNUM_DESPACHO_EXPORTACAO: TFloatField;
    QNotaSaidaCabDESC_MEMORANDO_EXPORTACAO: TStringField;
    QNotaSaidaCabVAL_DESCONTO_FITAS: TFloatField;
    QNotaSaidaCabNUM_DCO: TStringField;
    QNotaItem: TOracleDataSet1;
    QNotaItemCOD_NOTA_ITEM: TIntegerField;
    QNotaItemCOD_NOTA_CAB: TIntegerField;
    QNotaItemCOD_TRIBUTACAO: TIntegerField;
    QNotaItemQT_QUANTIDADE: TFloatField;
    QNotaItemVAL_TOTAL: TFloatField;
    QNotaItemPERC_IPI: TFloatField;
    QNotaItemPERC_COMISSAO: TFloatField;
    QNotaItemCOD_PRODUTO: TFloatField;
    QNotaItemCOD_LOTE_TIPO: TIntegerField;
    QNotaItemVAL_DESCONTO: TFloatField;
    QNotaItemVAL_DESPESAS: TFloatField;
    QNotaItemVAL_FRETE: TFloatField;
    QNotaItemPERC_DESCONTO: TFloatField;
    QNotaItemVAL_IPI: TFloatField;
    QNotaItemVAL_UNITARIO: TFloatField;
    QNotaItemVAL_ICM_BASE: TFloatField;
    QNotaItemVAL_ICM: TFloatField;
    QNotaItemIND_CLASS_IPI: TStringField;
    QNotaItemVAL_CUSTO: TFloatField;
    QNotaItemVAL_ISS: TFloatField;
    QNotaItemPERC_INSS: TFloatField;
    QNotaItemPERC_BENEFICIADO: TFloatField;
    QNotaItemIND_BX_CONTR_VEND: TStringField;
    QNotaItemNUM_NOTA_PRODUTOR: TIntegerField;
    QNotaItemIND_TIPO_CONSUMO: TStringField;
    QNotaItemQT_CHEGADA: TFloatField;
    QNotaItemVAL_PIS: TFloatField;
    QNotaItemPERC_DESC: TFloatField;
    QNotaItemVAL_CONFINS: TFloatField;
    QNotaItemVAL_BASE_SUBST: TFloatField;
    QNotaItemVAL_ICMS_SUBST: TFloatField;
    QNotaItemVAL_UNITARIO_TABELA: TFloatField;
    QNotaItemCOD_CULTURA: TIntegerField;
    QNotaItemVAL_DPI_TRANSGENICOS: TFloatField;
    QNotaItemQT_CREDITO_TRANSGENICOS: TFloatField;
    QNotaItemCOD_ROMANEIO_AGRICOLA: TIntegerField;
    QNotaItemVAL_FACS: TFloatField;
    QNotaItemVAL_FETHAB: TFloatField;
    QNotaItemIND_CUSTO: TIntegerField;
    QNotaItemDESC_RENDA: TStringField;
    QRContaCorrente: TOracleDataSet1;
    QRSaldoFixarSintetico: TOracleDataSet1;
    QRSaldoFixarSinteticoCOD_PRODUTO: TFloatField;
    QRSaldoFixarSinteticoDESC_PRODUTO: TStringField;
    QRSaldoFixarSinteticoQT_FIXAR: TFloatField;
    QRSaldoFixarSinteticoVL_FIXACAO: TFloatField;
    QContrato_ArrozCOD_TRIBUTACAO: TIntegerField;
    QRSaldoFixarSinteticoCOD_CADASTRO: TIntegerField;
    QRSaldoFixarSinteticoNOME: TStringField;
    QContaPagarDT_VENCIMENTO_PRORROGADO: TDateTimeField;
    QContaPagarCOD_CONTA_CORRENTE: TIntegerField;
    QContaPagarCOD_USUARIO_ACEITE: TIntegerField;
    QContaPagarCOD_BANCO_PGTO: TIntegerField;
    QContaPagarCOD_AGENCIA: TStringField;
    QContaPagarCOD_CONTA_CORRENTE_PGTO: TStringField;
    QContaPagarDESC_CNPJ_CPF_PGTO: TStringField;
    QContaPagarDESC_NOME_TITULAR_CONTA: TStringField;
    QContaPagarIND_FORMA_PAGAMENTO: TStringField;
    QContrato_ArrozIND_CONTA_PAGAR: TStringField;
    QRFinanceiroContratoCOD_CONTRATO_ARROZ: TIntegerField;
    QRFinanceiroContratoNUM_EMBALAGEM: TFloatField;
    QRFinanceiroContratosVal_Media: TFloatField;
    QRFinanceiroContratosVal_Media_Limpo: TFloatField;
    QRFinanceiroContratoCOD_PRODUTO: TFloatField;
    QRFinanceiroContratoDESC_PRODUTO: TStringField;
    QRContratoArroz: TOracleDataSet1;
    QRContratoArrozCOD_CADASTRO: TIntegerField;
    QRContratoArrozCOD_CONTRATO_ARROZ: TIntegerField;
    QRContratoArrozDT_EMISSAO: TDateTimeField;
    QRContratoArrozNUM_CONTRATO: TIntegerField;
    QRContratoArrozQT_QUANTIDADE: TFloatField;
    QRContratoArrozQT_SALDO: TFloatField;
    QRContratoArrozCOD_NOTA_CAB: TIntegerField;
    QRContratoArrozVL_PRECO_SACA: TFloatField;
    QRContratoArrozNOME: TStringField;
    QRContratoArrozDESC_PRODUTO: TStringField;
    QRContratoArrozSITUACAO: TStringField;
    QContrato_Nota_SaldoCOD_NOTA_ITEM: TFloatField;
    QContrato_Nota_SaldoCOD_PRODUTO: TFloatField;
    QContrato_Nota_SaldoCOD_CADASTRO: TFloatField;
    QContrato_Nota_SaldoQT_QUANTIDADE: TFloatField;
    QContrato_Nota_SaldoQT_SALDO: TFloatField;
    QRContratoArrozVAL_SACA: TFloatField;
    QContrato_ArrozVAL_AJUSTE_CONTABIL: TFloatField;
    QContrato_Nota_SaldoNUM_NOTA: TFloatField;
    QContratoArrozBaixa: TOracleDataSet1;
    QContratoArrozBaixaCOD_CONTRATO_ARROZ_BAIXA: TIntegerField;
    QContratoArrozBaixaCOD_CONTRATO_ARROZ: TIntegerField;
    QContratoArrozBaixaQT_BAIXA: TFloatField;
    QContratoArrozBaixaVL_BAIXA: TFloatField;
    QContratoArrozBaixaDT_BAIXA: TDateTimeField;
    QRContaCorrenteNUM_NOTA: TFloatField;
    QRContaCorrenteCOD_SERIE: TStringField;
    QRContaCorrenteDT_EMISSAO: TDateTimeField;
    QRContaCorrenteCOD_OPERACAO: TFloatField;
    QRContaCorrenteCOD_CADASTRO: TFloatField;
    QRContaCorrenteCOD_PRODUTO: TFloatField;
    QRContaCorrenteDESC_RENDA: TStringField;
    QRContaCorrenteQT_AFIXAR: TFloatField;
    QRContaCorrenteVL_FIXAR: TFloatField;
    QRContaCorrenteQT_FIXACAO: TFloatField;
    QRContaCorrenteVL_FIXACAO: TFloatField;
    QRContaCorrenteVL_NOTA: TFloatField;
    QRContaCorrenteVL_SACA: TFloatField;
    QRContaCorrenteDESC_PRODUTO: TStringField;
    QRContaCorrenteNOME: TStringField;
    procedure QContrato_ArrozAfterPost(DataSet: TDataSet);
    procedure QContrato_ArrozAfterInsert(DataSet: TDataSet);
    procedure QContrato_ArrozBeforePost(DataSet: TDataSet);
    procedure QContrato_Arroz_ItemAfterInsert(DataSet: TDataSet);
    procedure QContrato_ArrozCOD_CADASTROValidate(Sender: TField);
    procedure QContrato_ArrozBeforeInsert(DataSet: TDataSet);
    procedure QContrato_ArrozBeforeEdit(DataSet: TDataSet);
    procedure QContrato_ArrozBeforeDelete(DataSet: TDataSet);
    procedure QContrato_ArrozAfterDelete(DataSet: TDataSet);
    procedure QContrato_ArrozAfterCancel(DataSet: TDataSet);
    procedure QContrato_ArrozAfterEdit(DataSet: TDataSet);
    procedure QContrato_ArrozDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure QContrato_ArrozEditError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure QContrato_ArrozPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure QRFinanceiroContratoCalcFields(DataSet: TDataSet);
    procedure QContratoArrozBaixaAfterInsert(DataSet: TDataSet);
    procedure QContratoArrozBaixaBeforePost(DataSet: TDataSet);
    procedure QContratoArrozBaixaAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    Procedure GeraContaPagar(wCod_Contrato:Real;wListaParcela:TStrings; wFinalidade:Integer; wDepartamento:String; wFormaPagto:Integer);
    { Public declarations }
  end;

var
  DMContratoArroz: TDMContratoArroz;

implementation

uses UOracle_cl, UFinalidade_cl, UUsuario_cl, UBiblioteca, USequencia_cl,
  UPlanilha_cl;

{$R *.DFM}

procedure TDMContratoArroz.QContrato_ArrozAfterPost(DataSet: TDataSet);
Var wCodigo : Integer;
begin
  wCodigo := QContrato_ArrozCod_Contrato_Arroz.Value;
  QContrato_Arroz.Close;
  QContrato_Arroz.SetVariable('PK',wCodigo);
  QContrato_Arroz.Open;
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Commit;
end;

procedure TDMContratoArroz.QContrato_ArrozAfterInsert(DataSet: TDataSet);
begin
//  QContrato_ArrozCod_Contrato_Arroz.Value := DMOracle.Sequencia('CONTRATO_ARROZ');
  QContrato_ArrozCOD_Filial.Value:=1;
  QContrato_ArrozDT_EMISSAO.Value:=DMoracle.DataServ;

end;

Procedure TDMContratoArroz.GeraContaPagar(wCod_Contrato:Real;wListaParcela:TStrings; wFinalidade:Integer; wDepartamento:String; wFormaPagto:Integer);
Var wCont,wCodDoc,wFilial,wCodCompl,wCodHistorico : Integer;
    wAux,wContaCred,wContaDeb,wNumDoc,wNome : String;
    wVlrLancto : Real;
    wDtLancto : TDateTime;
    x, y: array of string;
Begin
  For wCont := 0 to wListaParcela.Count - 1 do
  Begin
    QContaPagar.Open;
    wAux := Copy(wListaParcela[wCont],11,15);
    wAux := Bib.LimpaString(wAux,'.');
    If StrToFloat(wAux) > 0 Then
     Begin
      Try
        QContaPagar.Insert;
        QContaPagarCOD_CONTA_PAGAR_CAB.Value := DMOracle.Sequencia('CONTA_PAGAR');
        QContaPagarCOD_FINALIDADE.Value := wFinalidade;
        QContaPagarCOD_CADASTRO.Value := QContrato_ArrozCod_Cadastro.Value;
        QContaPagarDT_EMISSAO.Value := QContrato_ArrozDt_Emissao.Value;
        QContaPagarNUM_TITULO.Value := QContrato_ArrozNum_Contrato.Value;
        QContaPagarCOD_FILIAL.Value := QContrato_ArrozCod_Filial.Value;
        QContaPagarCOD_DEPARTAMENTO.Text := Trim(wDepartamento);
        QContaPagarNUM_PARCELA.Value := wCont+1;
        QContaPagarDESC_TIPO_DOCUMENTO.Value := 'CON';
        QContaPagarDT_MOVIMENTO.Value := DMOracle.DataHoraServ;
        QContaPagarDT_VENCIMENTO.Value := StrToDate(Copy(wListaParcela[wCont],1,10) );
        If DMFinalidade.QFinalidadeInd_Encargo.Value = 'EMISSAO' Then
           QContaPagarDT_CAPITALIZACAO.Value := QContaPagarDT_EMISSAO.Value
        Else
           QContaPagarDT_CAPITALIZACAO.Value := QContaPagarDT_VENCIMENTO.Value;
        wAux := Copy(wListaParcela[wCont],11,15);
        wAux := Bib.LimpaString(wAux,'.');
        QContaPagarVAL_TITULO.Value := StrToFloat(wAux );

  //      wAux := Copy(wListaParcela[wCont],31,15);
  //      wAux := Bib.LimpaString(wAux,'.');
  //      If Trim(wAux) <> '' Then
  //        QContaPagarVAL_Indexado.Value := StrToFloat(wAux);
        QContaPagarCOD_CONTRATO_ARROZ.Value := QContrato_ArrozCod_Contrato_Arroz.Value;
        QContaPagarDESC_OBSERVACAO.Value := 'Ref Contrato Arroz Nr. '+FloatToStr(QContrato_ArrozNum_Contrato.Value);
        QContaPagarIND_ACEITE.Value := 'NAO';
        QContaPagarIND_SITUACAO.Value := 'ABERTO';
        QContaPagarVAL_ORIGINAL.Value := QContaPagarVal_Titulo.Value;
        Case wFormaPagto Of
          0 : QContaPagarInd_Forma_Pagamento.Value := 'Bloqueto';
          1 : QContaPagarInd_Forma_Pagamento.Value := 'Deposito';
          2 : QContaPagarInd_Forma_Pagamento.Value := 'Cheque';
          3 : QContaPagarInd_Forma_Pagamento.Value := 'Dinheiro';
          4 : QContaPagarInd_Forma_Pagamento.Value := 'Debito Automatico';
          5 : QContaPagarInd_Forma_Pagamento.Value := 'Adiantamento';
          6 : QContaPagarInd_Forma_Pagamento.Value := 'Devolução';
          7 : QContaPagarInd_Forma_Pagamento.Value := 'Sem Pagamento';
        End;
        wAux := Copy(wListaParcela[wCont],27,4);
        If Trim(wAux) <> '' Then
           QContaPagarCod_Banco_Pgto.Value := StrToInt(Trim(wAux));
        wAux := Copy(wListaParcela[wCont],32,6);
        If Trim(wAux) <> '' Then
           QContaPagarCod_Agencia.Value := Trim(wAux);
        wAux := Copy(wListaParcela[wCont],39,10);
        If Trim(wAux) <> '' Then
           QContaPagarCod_Conta_Corrente_Pgto.Value := Trim(wAux);
        wAux := Copy(wListaParcela[wCont],50,18);
        If Trim(wAux) <> '' Then
           QContaPagarDesc_Cnpj_Cpf_Pgto.Value := Trim(wAux);
        wAux := Copy(wListaParcela[wCont],69,30);
        If Trim(wAux) <> '' Then
           QContaPagarDesc_Nome_Titular_Conta.Value := Trim(wAux);

        QContaPagar.Post;
        QContaPagarMov.Open;
        QContaPagarMov.Insert;
        QContaPagarMovCod_Conta_Pagar_Cab.Value := QContaPagarCod_Conta_Pagar_Cab.Value;
        QContaPagarMovCod_Conta_Pagar_Mov.Value := DMOracle.Sequencia('CONTA_PAGAR_MOV');
        QContaPagarMovDt_Movimento.Value := DMOracle.DataServ;
        QContaPagarMovInd_Tipo_Movimento.Value := 'PRINCIPAL';
        QContaPagarMovDT_Usuario.Value := DMOracle.DataHoraServ;
        QContaPagarMovCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
        QContaPagarMovVal_Movimento.Value :=  QContaPagarVal_Titulo.Value;

        setLength(x, 4); //4 sql diferentes
        setLength(y, 4);

        x[0] := 'SELECT COD_CONTABIL_INCLUSAO_CRED FROM TB_FINALIDADE WHERE COD_FINALIDADE = '+IntToStr(wFinalidade);
        x[1] := 'SELECT COD_CONTABIL_INCLUSAO_DEB FROM TB_FINALIDADE WHERE COD_FINALIDADE = '+IntToStr(wFinalidade);
        x[2] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+QContrato_ArrozCod_Cadastro.Text;
        x[3] := 'SELECT COD_HIST_CONTABIL_INCLUSAO FROM TB_FINALIDADE WHERE COD_FINALIDADE = '+IntToStr(wFinalidade);

        DMOracle.BuscaNomes(x, y);

        wContaCred:=y[0];
        wContaDeb :=y[1];
        If (wContaCred <> '') And
           (wContaDeb  <> '') Then
        Begin
          wNome:=y[2];
          wCodDoc:=QContaPagarCod_Conta_Pagar_Cab.Value;
          wNumDoc:=FloatToStr(QContaPagarNum_Titulo.Value)+'-'+Trim(wNome)+'-'+Trim(QContaPagarDesc_Observacao.Value);
          wFilial:=QContaPagarCod_Filial.Value;
          wCodCompl:=QContaPagarCod_Cadastro.Value;
          wVlrLancto:=QContaPagarVal_Titulo.Value;
          wDtLancto:=QContaPagarDt_Emissao.Value;
          wCodHistorico:=StrToInt(y[3]);
          DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
          QContaPagarMovCOD_LANCTO_CONTABIL_CRED.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
          DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
          QContaPagarMovCOD_LANCTO_CONTABIL_DEB.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
        End;
        QContaPagarMov.Post;
      Except
        If QContaPagarMov.State in [dsEdit,dsInsert] then
          QContaPagarMov.Cancel;
        If QContaPagar.State in [dsEdit,dsInsert] then
          QContaPagar.Cancel;
        Raise;
      End;
    End;
  End;
  QContaPagarMov.Close;
  QContaPagar.Close;
end;

procedure TDMContratoArroz.QContrato_ArrozBeforePost(DataSet: TDataSet);
begin
  If QContrato_Arroz.State = dsInsert then
  Begin
    QContrato_ArrozNUM_CONTRATO.Value:=DMSequencia.Sequencia(Trunc(QCONTRATO_ARROZCOD_FILIAL.VALUE),'Contrato_Arroz');
    QContrato_ArrozQT_SALDO.Value:= QContrato_ArrozQT_QUANTIDADE.Value;
  End;  
end;

procedure TDMContratoArroz.QContrato_Arroz_ItemAfterInsert(DataSet: TDataSet);
begin
//  QContrato_Arroz_ItemCod_Contrato_Arroz_Item.Value := DMOracle.Sequencia('CONTRATO_ARROZ_ITEM');

end;

procedure TDMContratoArroz.QContrato_ArrozCOD_CADASTROValidate(Sender: TField);
begin
  if Trim(QContrato_ArrozCOD_CADASTRO.Text) <> '' then
  begin
    if Trim(DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO',' COD_CADASTRO = '+QContrato_ArrozCOD_CADASTRO.Text)) <> '' then
       raise exception.Create('ATENÇÃO - Cadastro Cancelado, Verifique!')
  end;
end;

procedure TDMContratoArroz.QContrato_ArrozBeforeInsert(DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.inTransaction) then
    DMOracle.DBCemapa.StartTransaction;

end;

procedure TDMContratoArroz.QContrato_ArrozBeforeEdit(DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.inTransaction) then
    DMOracle.DBCemapa.StartTransaction;

end;

procedure TDMContratoArroz.QContrato_ArrozBeforeDelete(DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.inTransaction) then
    DMOracle.DBCemapa.StartTransaction;

end;

procedure TDMContratoArroz.QContrato_ArrozAfterDelete(DataSet: TDataSet);
begin
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Commit;

end;

procedure TDMContratoArroz.QContrato_ArrozAfterCancel(DataSet: TDataSet);
begin
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.RollBack;

end;

procedure TDMContratoArroz.QContrato_ArrozAfterEdit(DataSet: TDataSet);
begin
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Commit;

end;

procedure TDMContratoArroz.QContrato_ArrozDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.RollBack;

end;

procedure TDMContratoArroz.QContrato_ArrozEditError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.RollBack;

end;

procedure TDMContratoArroz.QContrato_ArrozPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.RollBack;

end;

procedure TDMContratoArroz.QRFinanceiroContratoCalcFields(DataSet: TDataSet);
begin
  If QRFinanceiroContratoQt_Saldo.Value > 0 Then
     QRFinanceiroContratosVal_Media.Value := QRFinanceiroContratoVAL_PAGTO.Value / QRFinanceiroContratoQt_Saldo.Value * QRFinanceiroContratoNum_Embalagem.Value
  Else
     QRFinanceiroContratosVal_Media.Value := QRFinanceiroContratoVAL_PAGTO.Value;
  If QRFinanceiroContratoKg_Liquido.Value > 0 Then
     QRFinanceiroContratosVal_Media_Limpo.Value := QRFinanceiroContratoVAL_PAGTO.Value / QRFinanceiroContratoKg_Liquido.Value * QRFinanceiroContratoNum_Embalagem.Value
  Else
     QRFinanceiroContratosVal_Media_Limpo.Value := QRFinanceiroContratoVAL_PAGTO.Value;   
end;

procedure TDMContratoArroz.QContratoArrozBaixaAfterInsert(
  DataSet: TDataSet);
begin
  QContratoArrozBaixaCod_Contrato_Arroz.Value := QContrato_ArrozCod_Contrato_Arroz.Value; 
end;

procedure TDMContratoArroz.QContratoArrozBaixaBeforePost(
  DataSet: TDataSet);
begin
  If QContratoArrozBaixaQt_Baixa.Value > QContrato_ArrozQt_Saldo.Value Then
     Raise Exception.Create('Baixa maior que saldo contrato');
end;

procedure TDMContratoArroz.QContratoArrozBaixaAfterPost(DataSet: TDataSet);
begin
  QContrato_Arroz.Edit;
  QContrato_ArrozQt_Saldo.Value := QContrato_ArrozQt_Saldo.Value - QContratoArrozBaixaQt_Baixa.Value;
  QContrato_Arroz.Post;
end;

end.
