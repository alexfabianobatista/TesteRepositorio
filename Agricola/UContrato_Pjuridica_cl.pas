unit UContrato_Pjuridica_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMContrato_PJuridica = class(TDataModule)
    QContratoPJuridica: TOracleDataSet1;
    QContratoPJuridicaCons: TOracleDataSet1;
    QContratoPJuridicaCOD_CONTRATO_PJURIDICA: TIntegerField;
    QContratoPJuridicaCOD_FILIAL: TIntegerField;
    QContratoPJuridicaCOD_CADASTRO: TIntegerField;
    QContratoPJuridicaCOD_PRODUTO: TIntegerField;
    QContratoPJuridicaQT_QUANTIDADE: TFloatField;
    QContratoPJuridicaDT_CONTRATO: TDateTimeField;
    QContratoPJuridicaIND_RET_ENTR: TStringField;
    QContratoPJuridicaDT_ENTREGA: TDateTimeField;
    QContratoPJuridicaCOD_CORRETORA: TIntegerField;
    QContratoPJuridicaDT_PAGTO: TDateTimeField;
    QContratoPJuridicaPERC_COMISSAO: TFloatField;
    QContratoPJuridicaCOD_CC: TIntegerField;
    QContratoPJuridicaOBS: TStringField;
    QContratoPJuridicaCOD_CC_CORRETORA: TStringField;
    QContratoPJuridicaIND_CONF: TStringField;
    QContratoPJuridicaNUM_AGENCIA_CORRETORA: TStringField;
    QContratoPJuridicaDESC_BANCO_CORRETORA: TStringField;
    QContratoPJuridicaVAL_SALDO: TFloatField;
    QContratoPJuridicaSALDO_NF_EMBARQUE: TFloatField;
    QContratoPJuridicaVAL_AJUSTE: TFloatField;
    QContratoPJuridicaVAL_FRETE: TFloatField;
    QContratoPJuridicaVAL_DESPESAS_PORTO: TFloatField;
    QContratoPJuridicaVAL_DESPESAS_PIS_COFINS: TFloatField;
    QContratoPJuridicaVAL_CUSTO_COMP: TFloatField;
    QContratoPJuridicaVAL_FINANCEIRO: TFloatField;
    QContratoPJuridicaPERC_PIS_COFINS_CPMF: TFloatField;
    QContratoPJuridicaVAL_COMISSAO: TFloatField;
    QContratoPJuridicaVAL_AJUSTE_CONTABIL: TFloatField;
    QContratoPJuridicaCOD_TRIBUTACAO: TIntegerField;
    QContratoPJuridicaCOD_MENSAGEM: TIntegerField;
    QContratoPJuridicaCOD_OPERACAO: TIntegerField;
    QContratoPJuridicaIND_TIPO_FRETE: TStringField;
    QContratoPJuridicaCOD_MSG_CORPO_NOTA: TIntegerField;
    QContratoPJuridicaVAL_CUSTO_PARCERIA: TFloatField;
    QContratoPJuridicaVAL_CUSTO_CLASPAR: TFloatField;
    QContratoPJuridicaVAL_CUSTO_QUEBRA_TRANSP: TFloatField;
    QContratoPJuridicaDT_VENCIMENTO: TDateTimeField;
    QContratoPJuridicaIND_CONDICAO_PAGTO: TStringField;
    QContratoPJuridicaIND_TIPO_MERCADO: TStringField;
    QContratoPJuridicaNUM_CONTRATO_CLIENTE: TStringField;
    QContratoPJuridicaIND_TIPO_PRECO: TStringField;
    QContratoPJuridicaConsCOD_CONTRATO_PJURIDICA: TIntegerField;
    QContratoPJuridicaConsQT_QUANTIDADE: TFloatField;
    QContratoPJuridicaConsDT_ENTREGA: TDateTimeField;
    QContratoPJuridicaConsNUM_CONTRATO: TIntegerField;
    QContratoPJuridicaConsCOD_FILIAL: TIntegerField;
    QContratoPJuridicaConsSALDO_NF_EMBARQUE: TFloatField;
    QContratoPJuridicaConsNOME: TStringField;
    QContratoPJuridicaConsDESC_FILIAL: TStringField;
    QContratoPJuridicaConsCOD_PRODUTO: TIntegerField;
    QContratoPJuridicaConsCOD_CADASTRO: TIntegerField;
    QContratoPJuridicaConsCOD_CORRETORA: TIntegerField;
    QContratoPJuridicaNUM_CONTRATO: TIntegerField;
    QRContratoPjuridica: TOracleDataSet1;
    QRContratoPjuridicaCOD_FILIAL: TIntegerField;
    QRContratoPjuridicaDESC_FILIAL: TStringField;
    QRContratoPjuridicaCOD_CADASTRO: TIntegerField;
    QRContratoPjuridicaNOME: TStringField;
    QRContratoPjuridicaCOD_PRODUTO: TIntegerField;
    QRContratoPjuridicaQT_QUANTIDADE: TFloatField;
    QRContratoPjuridicaDT_CONTRATO: TDateTimeField;
    QRContratoPjuridicaNUM_CONTRATO: TIntegerField;
    QContratoPJuridicaDT_ANO_SAFRA: TStringField;
    QContratoPJuridicaCOD_CONTATO_FILIAL: TIntegerField;
    QContratoPJuridicaCOD_CONTATO_CLIENTE: TIntegerField;
    QContratoPJuridicaNUM_CORRETORA: TStringField;
    QContratoPJuridicaLOCAL_ENTREGA: TStringField;
    QRContratoPjuridicaDESC_PRODUTO: TStringField;
    QContratoPJuridicaConsDESC_PRODUTO: TStringField;
    QContratoPJuridicaNota: TOracleDataSet1;
    QContratoPJuridicaNotaCOD_NOTA_CAB: TIntegerField;
    QContratoPJuridicaNotaNOME: TStringField;
    QContratoPJuridicaNotaCOD_FILIAL: TIntegerField;
    QContratoPJuridicaNotaDT_EMISSAO: TDateTimeField;
    QContratoPJuridicaNotaCOD_CONTRATO_PJURIDICA: TIntegerField;
    QContratoPJuridicaNotaCOD_MENSAGEM: TIntegerField;
    QContratoPJuridicaNotaCOD_SERIE: TStringField;
    QContratoPJuridicaNotaQT_QUANTIDADE: TFloatField;
    QContratoPJuridicaNotaVAL_TOTAL: TFloatField;
    QContratoPJuridicaNotaNUM_NOTA: TIntegerField;
    QContratoPJuridicaNotaDESC_PLACA: TStringField;
    QContratoPJuridicaNotaCOD_OPERACAO: TIntegerField;
    QContratoPJuridicaIND_PRECO: TStringField;
    QContratoPJuridicaIND_SITUACAO: TStringField;
    QContasPagar: TOracleDataSet1;
    QContasPagarCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagarCOD_FINALIDADE: TIntegerField;
    QContasPagarCOD_BANCO_AGENCIA: TIntegerField;
    QContasPagarCOD_CADASTRO: TIntegerField;
    QContasPagarCOD_FILIAL: TIntegerField;
    QContasPagarNUM_TITULO: TIntegerField;
    QContasPagarNUM_PARCELA: TIntegerField;
    QContasPagarDESC_TIPO_DOCUMENTO: TStringField;
    QContasPagarDT_MOVIMENTO: TDateTimeField;
    QContasPagarDT_BAIXA: TDateTimeField;
    QContasPagarDT_VENCIMENTO: TDateTimeField;
    QContasPagarDT_EMISSAO: TDateTimeField;
    QContasPagarDT_CAPITALIZACAO: TDateTimeField;
    QContasPagarVAL_TITULO: TFloatField;
    QContasPagarCOD_NOTA_CAB: TIntegerField;
    QContasPagarIND_ACEITE: TStringField;
    QContasPagarIND_SITUACAO: TStringField;
    QContasPagarVAL_ORIGINAL: TFloatField;
    QContasPagarVAL_INDEXADO: TFloatField;
    QContasPagarCOD_DEPARTAMENTO: TIntegerField;
    QContasPagarCOD_CONTRATO: TIntegerField;
    QContasPagarDESC_OBSERVACAO: TStringField;
    QContasPagarMov: TOracleDataSet1;
    QContasPagarMovCOD_CONTA_PAGAR_MOV: TIntegerField;
    QContasPagarMovCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagarMovDT_MOVIMENTO: TDateTimeField;
    QContasPagarMovVAL_MOVIMENTO: TFloatField;
    QContasPagarMovDESC_OBSERVACAO: TStringField;
    QContasPagarMovIND_TIPO_MOVIMENTO: TStringField;
    QContasPagarMovDT_USUARIO: TDateTimeField;
    QContasPagarMovCOD_USUARIO: TIntegerField;
    QContasPagarMovCOD_BCO_MOVIMENTO: TIntegerField;
    QContasPagarMovCOD_CAIXA_MOV: TIntegerField;
    QContasPagarMovCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QContasPagarMovCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QContasPagarCOD_CONTRATO_PJURIDICA: TIntegerField;
    QContratoPJuridicaIND_TIPO_CONTRATO: TStringField;
    QContratoPJuridicaDESC_PRIM_TESTEMUNHA: TStringField;
    QContratoPJuridicaDESC_SEG_TESTEMUNHA: TStringField;
    QRContratoPJuridicaNota: TOracleDataSet1;
    QRContratoPJuridicaNotaCOD_FILIAL: TIntegerField;
    QRContratoPJuridicaNotaCOD_CADASTRO: TIntegerField;
    QRContratoPJuridicaNotaCOD_PRODUTO: TIntegerField;
    QRContratoPJuridicaNotaQT_CONTRATO: TFloatField;
    QRContratoPJuridicaNotaDT_CONTRATO: TDateTimeField;
    QRContratoPJuridicaNotaNUM_CONTRATO: TIntegerField;
    QRContratoPJuridicaNotaVAL_SALDO: TFloatField;
    QRContratoPJuridicaNotaCOD_NOTA_CAB: TIntegerField;
    QRContratoPJuridicaNotaDT_EMISSAO: TDateTimeField;
    QRContratoPJuridicaNotaCOD_CONTRATO_PJURIDICA: TIntegerField;
    QRContratoPJuridicaNotaNUM_NOTA: TIntegerField;
    QRContratoPJuridicaNotaCOD_OPERACAO: TIntegerField;
    QRContratoPJuridicaNotaQT_QUANTIDADE: TFloatField;
    QRContratoPJuridicaNotaVAL_TOTAL: TFloatField;
    QRContratoPJuridicaNotaNOME: TStringField;
    QRContratoPJuridicaNotaDESC_PRODUTO: TStringField;
    QRContratoPJuridicaNotaDESC_PLACA: TStringField;
    QContratoPJuridicaCOD_PADRAO_DESCONTO_PRODUTO: TIntegerField;
    DSContrato_Vend_Pagto: TDataSource;
    QContrato_PJuridica_Pagto: TOracleDataSet1;
    QContrato_PJuridica_PagtoCOD_CONTRATO_PGTO: TIntegerField;
    QContrato_PJuridica_PagtoCOD_CONTRATO_PJURIDICA: TIntegerField;
    QContrato_PJuridica_PagtoDESC_OBSERVACAO: TStringField;
    QContratoPJuridicatotal: TFloatField;
    QContratoPJuridicavalor_aplicado: TFloatField;
    QContrato_PJuridica_PagtoDT_PAGTO: TDateTimeField;
    QContrato_PJuridica_PagtoVAL_PAGTO: TFloatField;
    QRContrato_PJuridica_Parcelas: TOracleDataSet1;
    QRContrato_PJuridica_ParcelasCOD_CONTRATO_PGTO: TIntegerField;
    QRContrato_PJuridica_ParcelasCOD_CONTRATO_PJURIDICA: TIntegerField;
    QRContrato_PJuridica_ParcelasDT_PAGTO: TDateTimeField;
    QRContrato_PJuridica_ParcelasVAL_PAGTO: TFloatField;
    QRContrato_PJuridica_ParcelasDESC_OBSERVACAO: TStringField;
    QContratoPJuridicaPRECO: TFloatField;
    QContratoPJuridicaConsPRECO: TFloatField;
    QRContratoPJuridicaNotaVAL_UNITARIO: TFloatField;
    QContratoPJuridica_Doc: TOracleDataSet;
    QContratoPJuridica_DocCOD_CONTRATO_JURIDICA_DOC: TIntegerField;
    QContratoPJuridica_DocNOME_ARQUIVO: TStringField;
    QContratoPJuridica_DocDT_INCLUSAO: TDateTimeField;
    QContratoPJuridica_DocDESCRICAO: TStringField;
    QContratoPJuridica_DocARQUIVO: TBlobField;
    QContratoPJuridica_DocCOD_CONTRATO_PJURIDICA: TIntegerField;
    QRContratoPjuridicaSALDO_NF_EMBARQUE: TFloatField;
    procedure QContratoPJuridicaBeforePost(DataSet: TDataSet);
    procedure QContrato_PJuridica_PagtoAfterInsert(DataSet: TDataSet);
    procedure QContrato_PJuridica_PagtoAfterPost(DataSet: TDataSet);
    procedure QContratoPJuridicaCalcFields(DataSet: TDataSet);
    procedure QContratoPJuridicaAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContrato_PJuridica: TDMContrato_PJuridica;


implementation

uses UOracle_cl, USequencia_cl;

{$R *.DFM}

procedure TDMContrato_PJuridica.QContratoPJuridicaBeforePost(
  DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QContratoPJuridicaCOD_FILIAL.Text);
  if QContratoPJuridicaNUM_CONTRATO.Text = '' Then
  Begin
    QContratoPJuridicaNUM_CONTRATO.Value:=DMSequencia.Sequencia(Trunc(QContratoPJuridicaCOD_FILIAL.Value),'Contrato_juridica');
    QContratoPJuridicaVAL_SALDO.Value:=QContratoPJuridicaQT_QUANTIDADE.Value;
  End;
end;

procedure TDMContrato_PJuridica.QContrato_PJuridica_PagtoAfterInsert(
  DataSet: TDataSet);
begin
  QContrato_PJuridica_PagtoCOD_CONTRATO_PJURIDICA.Value := QContratoPJuridicaCOD_CONTRATO_PJURIDICA.Value;
end;

procedure TDMContrato_PJuridica.QContrato_PJuridica_PagtoAfterPost(
  DataSet: TDataSet);
begin
  QContrato_PJuridica_Pagto.Close;
  QContrato_PJuridica_Pagto.Open;
end;

procedure TDMContrato_PJuridica.QContratoPJuridicaCalcFields(
  DataSet: TDataSet);
var  waux:string;
 wEmb, wFunRural : Real;
begin
//  If (QContrato_VendVal_Dolar.Text <> '') And (QContrato_VendVal_Dolar.Value <> 0) Then
//     QContrato_Vendtotal.Value := QContrato_VendVal_Dolar.Value
//  Else
//   Begin
     wAux:=DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QContratoPJuridicaCOD_PRODUTO.Value));
     if wAux<>'' then
       wEmb:=StrtoFloat(wAux)
     else
       wEmb:=0;
     wFunRural:=0;
     If wEmb >0 then
      Begin
         QContratoPJuridicatotal.value:=Trunc((QContratoPJuridicaPRECO.Value*QContratoPJuridicaQT_Quantidade.Value)/wEmb*((100-wFunRural)/100)*100);
         QContratoPJuridicatotal.value:=QContratoPJuridicatotal.value / 100;
      End;
//   End;
  QContratoPJuridicatotal.value:= QContratoPJuridicatotal.value + QContratoPJuridicaVal_Ajuste.value;
  QContratoPJuridicavalor_aplicado.Value:=QContratoPJuridicaQt_Quantidade.Value - QContratoPJuridicaSALDO_NF_EMBARQUE.Value;
end;

procedure TDMContrato_PJuridica.QContratoPJuridicaAfterPost(
  DataSet: TDataSet);
Var wCod_Contrato : Integer;
begin
  wCod_Contrato := QContratoPJuridicaCOD_CONTRATO_PJURIDICA.value;
  QContratoPJuridica.Close;
  QContratoPJuridica.SetVariable('PK',wCod_Contrato);
  QContratoPJuridica.Open;
end;

end.
