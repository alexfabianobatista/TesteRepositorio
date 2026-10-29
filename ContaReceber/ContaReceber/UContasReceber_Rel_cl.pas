unit UContasReceber_Rel_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, DBClient;

type
  TDMContasReceber_Rel = class(TDataModule)
    QRSerasa: TOracleDataSet1;
    QRTotalCRPeriodo: TOracleDataSet1;
    QRTotalCRPeriodoTOTAL: TFloatField;
    QRSerasa_Tempo: TOracleDataSet1;
    QRSerasa_TempoNUM_CGC_CPF: TStringField;
    QRSerasa_TempoDT_CADASTRO: TDateTimeField;
    QSerasa_Recebto: TOracleDataSet1;
    QRSerasaNUM_CGC_CPF: TStringField;
    QRSerasaNUM_NOTA: TIntegerField;
    QRSerasaDT_EMISSAO: TDateTimeField;
    QRSerasaDT_VENCIMENTO: TDateTimeField;
    QRSerasaVAL_ORIGINAL: TFloatField;
    QRSerasaNUM_PARCELA: TIntegerField;
    QRSerasaVAL_TITULO: TFloatField;
    QSerasa_RecebtoNUM_CGC_CPF: TStringField;
    QSerasa_RecebtoNUM_TITULO: TIntegerField;
    QSerasa_RecebtoDT_EMISSAO: TDateTimeField;
    QSerasa_RecebtoDT_MOVIMENTO: TDateTimeField;
    QSerasa_RecebtoDT_VENCIMENTO: TDateTimeField;
    QSerasa_RecebtoNUM_PARCELA: TIntegerField;
    QSerasa_RecebtoVAL_TITULO: TFloatField;
    QSerasa_RecebtoVAL_MOVIMENTO: TFloatField;
    QSerasa_RecebtoCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRTitulosAberto_Depto_Sint: TOracleDataSet1;
    QRTitulosAberto_Depto_SintCOD_FILIAL: TIntegerField;
    QRTitulosAberto_Depto_SintDESC_FILIAL: TStringField;
    QRTitulosAberto_Depto_SintCOD_DEPARTAMENTO: TIntegerField;
    QRTitulosAberto_Depto_SintDESC_DEPARTAMENTO: TStringField;
    QRTitulosAberto_Depto_SintTOTAL: TFloatField;
    QRMovimentacao: TOracleDataSet1;
    QRMovimentacaoCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRMovimentacaoCOD_FINALIDADE: TIntegerField;
    QRMovimentacaoCOD_BANCO_AGENCIA: TIntegerField;
    QRMovimentacaoCOD_FILIAL: TIntegerField;
    QRMovimentacaoNUM_TITULO: TIntegerField;
    QRMovimentacaoNUM_PARCELA: TIntegerField;
    QRMovimentacaoDESC_TIPO_DOCUMENTO: TStringField;
    QRMovimentacaoDT_MOVIMENTO: TDateTimeField;
    QRMovimentacaoDT_BAIXA: TDateTimeField;
    QRMovimentacaoDT_VENCIMENTO: TDateTimeField;
    QRMovimentacaoDT_EMISSAO: TDateTimeField;
    QRMovimentacaoDT_CAPITALIZACAO: TDateTimeField;
    QRMovimentacaoDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QRMovimentacaoVAL_TITULO: TFloatField;
    QRMovimentacaoVAL_NEGOCIO: TFloatField;
    QRMovimentacaoIND_ACEITE: TStringField;
    QRMovimentacaoIND_SITUACAO: TStringField;
    QRMovimentacaoDESC_OBSERVACAO: TStringField;
    QRMovimentacaoCOD_NOTA_CAB: TIntegerField;
    QRMovimentacaoCOD_CADASTRO: TIntegerField;
    QRMovimentacaoVAL_ORIGINAL: TFloatField;
    QRMovimentacaoVAL_JUROS: TFloatField;
    QRMovimentacaoCOD_NOSSO_NUMERO: TStringField;
    QRMovimentacaoNOME: TStringField;
    QRMovimentacaoNUM_CGC_CPF: TStringField;
    QRMovimentacaoDESC_FANTASIA: TStringField;
    QRMovimentacaoNOME_CONTATO2: TStringField;
    QRMovimentacaoNUM_TIPO_JURO: TStringField;
    QRMovimentacaoPERC_TAXA: TFloatField;
    QRMovimentacaoPERC_JURO_MORA: TFloatField;
    QRMovimentacaoCOD_MOEDA: TIntegerField;
    QRCalculoDesconto: TOracleDataSet1;
    QRCalculoDescontoNUM_TITULO: TIntegerField;
    QRCalculoDescontoDT_VENCIMENTO: TDateTimeField;
    QRCalculoDescontoVAL_TITULO: TFloatField;
    QRCalculoDescontoVAL_DESC_PONTUALIDADE: TFloatField;
    QRCalculoDescontoVAL_DESC_ANTECIPACAO: TFloatField;
    QRCalculoDescontoVAL_TOTAL: TFloatField;
    QRRemessaDesconto: TOracleDataSet1;
    QRRemessaDescontoCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRRemessaDescontoNUM_TITULO: TIntegerField;
    QRRemessaDescontoNUM_PARCELA: TIntegerField;
    QRRemessaDescontoDESC_TIPO_DOCUMENTO: TStringField;
    QRRemessaDescontoDT_MOVIMENTO: TDateTimeField;
    QRRemessaDescontoDT_BAIXA: TDateTimeField;
    QRRemessaDescontoDT_VENCIMENTO: TDateTimeField;
    QRRemessaDescontoDT_EMISSAO: TDateTimeField;
    QRRemessaDescontoDT_CAPITALIZACAO: TDateTimeField;
    QRRemessaDescontoVAL_TITULO: TFloatField;
    QRRemessaDescontoVAL_NEGOCIO: TFloatField;
    QRRemessaDescontoIND_ACEITE: TStringField;
    QRRemessaDescontoVAL_ORIGINAL: TFloatField;
    QRRemessaDescontoCOD_NOSSO_NUMERO: TStringField;
    QRRemessaDescontoVAL_JUROS: TFloatField;
    QRRemessaDescontoDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QRRemessaDescontoDESC_AVALISTA1: TStringField;
    QRRemessaDescontoCOD_CONTA_CORRENTE: TIntegerField;
    QRRemessaDescontoNUM_CONTA_CORRENTE: TStringField;
    QRRemessaDescontoDESC_CONTA_CORRENTE: TStringField;
    QRRemessaDescontoVARIACAO: TIntegerField;
    QRRemessaDescontoCARTEIRA: TIntegerField;
    QRRemessaDescontoCOMANDO: TIntegerField;
    QRRemessaDescontoNR_DIAS_PROTESTO: TIntegerField;
    QRRemessaDescontoPRIMEIRA_INSTR_COD: TStringField;
    QRRemessaDescontoCC_COD_FILIAL: TIntegerField;
    QRRemessaDescontoCOD_CADASTRO: TIntegerField;
    QRRemessaDescontoNOME: TStringField;
    QRRemessaDescontoIND_FISICA_JURIDICA: TStringField;
    QRRemessaDescontoNUM_CGC_CPF: TStringField;
    QRRemessaDescontoDESC_TELEFONE: TStringField;
    QRRemessaDescontoDESC_CELULAR: TStringField;
    QRRemessaDescontoDESC_BAIRRO: TStringField;
    QRRemessaDescontoDESC_FANTASIA: TStringField;
    QRRemessaDescontoDESC_CIDADE_COBRANCA: TStringField;
    QRRemessaDescontoDESC_ENDERECO_COBRANCA: TStringField;
    QRRemessaDescontoDESC_ESTADO_COBRANCA: TStringField;
    QRRemessaDescontoDESC_CEP_COBRANCA: TStringField;
    QRRemessaDescontoDESC_TELEFONE_COMERCIAL: TStringField;
    QRRemessaDescontoCOD_BANCO_AGENCIA: TIntegerField;
    QRRemessaDescontoDESC_BANCO_AGENCIA: TStringField;
    QRRemessaDescontoDESC_CIDADE: TStringField;
    QRRemessaDescontoDESC_SIGLA: TStringField;
    QRRemessaDescontoDESC_LOCAL_PGTO_BLOQ: TStringField;
    QRRemessaDescontoDESC_INSTRUCAO_BLOQUETO: TStringField;
    QRRemessaDescontoIND_TIPO_JURO: TStringField;
    QRRemessaDescontoPERC_JURO_BLOQUETO: TFloatField;
    QRRemessaDescontoCOD_BANCO: TIntegerField;
    QRRemessaDescontoCOD_AGENCIA: TIntegerField;
    QRRemessaDescontoCOD_CONTABIL_VALOR_FILIAL: TStringField;
    QRRemessaDescontoNUM_INSCR_CEDENTE: TFloatField;
    QRRemessaDescontoPREFIXO_AGENCIA: TIntegerField;
    QRRemessaDescontoDIGITO_VERIFICADOR_AGENCIA: TStringField;
    QRRemessaDescontoCODIGO_CEDENTE: TFloatField;
    QRRemessaDescontoDIGITO_VERIFICADOR_CEDENTE: TStringField;
    QRRemessaDescontoNUM_CONVENIO: TFloatField;
    QRRemessaDescontoCOD_CONVENENTE_LIDER: TFloatField;
    QRRemessaDescontoNOSSO_NUMERO: TFloatField;
    QRRemessaDescontoDIGITO_VERIFICADOR_N_NR: TStringField;
    QRRemessaDescontoDESC_FILIAL: TStringField;
    QRRemessaDescontoCOD_FILIAL: TIntegerField;
    QRRemessaDescontoNUM_CGC: TStringField;
    QRRemessaDescontoCOD_CONVENIO_CUSTODIA: TFloatField;
    QRRemessaDescontoinstrucao_juro: TFloatField;
    QRRemessaDescontonum_cgc_filial_conta: TStringField;
    cdsRContasReceberBaixaLote: TClientDataSet;
    cdsRContasReceberBaixaLoteval_principal: TFloatField;
    cdsRContasReceberBaixaLoteval_juros: TFloatField;
    cdsRContasReceberBaixaLoteval_principal_recebido: TFloatField;
    cdsRContasReceberBaixaLoteval_juros_recebido: TFloatField;
    cdsRContasReceberBaixaLoteval_desconto: TFloatField;
    cdsRContasReceberBaixaLoteval_recebido: TFloatField;
    cdsRContasReceberBaixaLoteval_pendente: TFloatField;
    cdsRContasReceberBaixaLotenome_cliente: TStringField;
    cdsRContasReceberBaixaLotedesc_observacao: TStringField;
    cdsRContasReceberBaixaLotenum_recibo: TIntegerField;
    cdsRContasReceberBaixaLotenum_parcela: TIntegerField;
    cdsRContasReceberBaixaLotenum_duplicata: TIntegerField;
    procedure QRRemessaDescontoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public

  procedure AddDadosReciboLote(nomeCliente:String;
            numDuplicata, numParcela:integer;
            valPrincipal, valJuros, valPrincipalRecebido, valJurosRecebido, valDesconto, valRecebido, valPendente:double; desc_observacao: String);

    { Public declarations }
  end;

var
  DMContasReceber_Rel: TDMContasReceber_Rel;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMContasReceber_Rel.QRRemessaDescontoCalcFields(
  DataSet: TDataSet);
begin
  //----copiado da QRemessa
  If QRRemessaDescontoCOD_CONTA_CORRENTE.Text <> '' Then
  Begin
    QRRemessaDescontonum_cgc_filial_conta.Text := DMOracle.BuscaNome('SELECT NUM_CGC FROM TB_FILIAL', 'TB_FILIAL.COD_FILIAL =' + QRRemessaDescontoCC_COD_FILIAL.Text,True );
  End;

  If QRRemessaDescontoPERC_JURO_BLOQUETO.value <> 0 Then
  Begin
//    if QRemessaind_tipo_juro.Value='VALOR' then
//      QRemessainstrucao_juro.Value := QRemessaPERC_JURO_BLOQUETO.Value/DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value)
//    else
//      QRemessainstrucao_juro.Value := QRemessaPERC_JURO_BLOQUETO.value / DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value);

//--- comentado por Fabio 26/11/2004 -- calculo de valor de juro por dia errado pq nao era multiplicado pelo valor do titulo
    QRRemessaDescontoinstrucao_juro.Value := (QRRemessaDescontoPERC_JURO_BLOQUETO.Value/DMoracle.DiasNoMes(QRRemessaDescontoDT_VENCIMENTO.Value)*QRRemessaDescontoVal_Titulo.Value/100);

  End;

end;

//------------------------------------------------------------
procedure TDMContasReceber_Rel.AddDadosReciboLote(nomeCliente:String;
                                                  numDuplicata, numParcela:integer;
                                                  valPrincipal, valJuros, valPrincipalRecebido, valJurosRecebido, valDesconto, valRecebido, valPendente:double; desc_observacao: String);
begin
  with DMContasReceber_Rel do
  begin
    cdsRContasReceberBaixaLote.Insert;
    cdsRContasReceberBaixaLotenome_cliente.Value           := nomeCliente;
    cdsRContasReceberBaixaLotenum_duplicata.Value          := numDuplicata;
    cdsRContasReceberBaixaLotenum_parcela.Value            := numParcela;
    cdsRContasReceberBaixaLoteval_principal.Value          := valPrincipal;
    cdsRContasReceberBaixaLoteval_juros.Value              := valJuros;
    cdsRContasReceberBaixaLoteval_principal_recebido.Value := valPrincipalRecebido;
    cdsRContasReceberBaixaLoteval_juros_recebido.Value     := valJurosRecebido;
    cdsRContasReceberBaixaLoteval_desconto.Value           := valDesconto;
    cdsRContasReceberBaixaLoteval_recebido.Value           := valRecebido;
    cdsRContasReceberBaixaLoteval_pendente.Value           := valPendente;
    cdsRContasReceberBaixaLotedesc_observacao.Value        := desc_observacao;
    cdsRContasReceberBaixaLote.Post;
  end;
end;
//------------------------------------------------------------


end.
