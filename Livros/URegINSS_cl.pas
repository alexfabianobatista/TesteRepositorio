unit URegINSS_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMRegINSS = class(TDataModule)
    QRegINSS: TOracleDataSet1;
    QRegINSSNUM_NOTA: TIntegerField;
    QRegINSSCOD_SERIE: TStringField;
    QRegINSSIND_SITUACAO: TStringField;
    QRegINSSDT_RECEBIMENTO: TDateTimeField;
    QRegINSSNUM_CGC: TStringField;
    QRegINSSDESC_INSCRICAO: TStringField;
    QRegINSSBASE_CALCULO: TFloatField;
    QRegContabil: TOracleDataSet1;
    QRegContabilDT_LANCAMENTO: TDateTimeField;
    QRegContabilNUM_PLANO_CONTA: TStringField;
    QRegContabilNUM_CONTRAPARTIDA: TStringField;
    QRegContabilVAL_LANCAMENTO: TFloatField;
    QRegContabilIND_OPERACAO: TStringField;
    QRegContabilDESC_HISTORICO_CONTABIL: TStringField;
    QRegSaldoContabil: TOracleDataSet1;
    QRegSaldoContabilNUM_PLANO_CONTA: TStringField;
    QRegSaldoContabilVAL_ANTERIOR: TFloatField;
    QRegSaldoContabilVAL_DEBITO: TFloatField;
    QRegSaldoContabilVAL_CREDITO: TFloatField;
    QRegSaldoContabilVAL_ATUAL: TFloatField;
    QRegMestreNf_Emitida: TOracleDataSet1;
    QRegMestreNf_EmitidaIND_ENTRADA_SAIDA: TStringField;
    QRegMestreNf_EmitidaDESC_MODELO: TStringField;
    QRegMestreNf_EmitidaCOD_SERIE: TStringField;
    QRegMestreNf_EmitidaNUM_NOTA: TIntegerField;
    QRegMestreNf_EmitidaDT_EMISSAO: TDateTimeField;
    QRegMestreNf_EmitidaCOD_CADASTRO: TIntegerField;
    QRegMestreNf_EmitidaDT_RECEBIMENTO: TDateTimeField;
    QRegMestreNf_EmitidaVAL_MERCADORIAS: TFloatField;
    QRegMestreNf_EmitidaVAL_DESCONTO: TFloatField;
    QRegMestreNf_EmitidaVAL_FRETE: TFloatField;
    QRegMestreNf_EmitidaVAL_SEGURO: TFloatField;
    QRegMestreNf_EmitidaVAL_DESPESAS: TFloatField;
    QRegMestreNf_EmitidaVAL_TOTAL_IPI: TFloatField;
    QRegMestreNf_EmitidaVAL_ICMS_SUBST: TFloatField;
    QRegMestreNf_EmitidaCOD_TRANSPORTADOR: TIntegerField;
    QRegMestreNf_EmitidaQT_BRUTO: TFloatField;
    QRegMestreNf_EmitidaQT_LIQUIDO: TFloatField;
    QRegMestreNf_EmitidaIND_TIPO_FRETE: TStringField;
    QRegMestreNf_EmitidaDESC_PLACA: TStringField;
    QRegMestreNf_EmitidaIND_SITUACAO: TStringField;
    QRegMestreNf_EmitidaIND_TIPO_PAGAMENTO: TStringField;
    QRegMestreNf_EmitidaDESC_OBSERVACAO: TStringField;
    QRegItensNf_Emitida: TOracleDataSet1;
    QRegItensNf_EmitidaIND_ENTRADA_SAIDA: TStringField;
    QRegItensNf_EmitidaDESC_MODELO: TStringField;
    QRegItensNf_EmitidaCOD_SERIE: TStringField;
    QRegItensNf_EmitidaNUM_NOTA: TIntegerField;
    QRegItensNf_EmitidaDT_EMISSAO: TDateTimeField;
    QRegItensNf_EmitidaCOD_PRODUTO: TFloatField;
    QRegItensNf_EmitidaDESC_COMPLEMENTO: TStringField;
    QRegItensNf_EmitidaNAT_OPERACAO: TFloatField;
    QRegItensNf_EmitidaCOD_OPERACAO: TIntegerField;
    QRegItensNf_EmitidaCOD_NBM_SH: TStringField;
    QRegItensNf_EmitidaQT_QUANTIDADE: TFloatField;
    QRegItensNf_EmitidaDESC_UNIDADE: TStringField;
    QRegItensNf_EmitidaVAL_UNITARIO: TFloatField;
    QRegItensNf_EmitidaVAL_TOTAL: TFloatField;
    QRegItensNf_EmitidaVAL_DESCONTO: TFloatField;
    QRegItensNf_EmitidaPERC_IPI: TFloatField;
    QRegItensNf_EmitidaVAL_IPI: TFloatField;
    QRegItensNf_EmitidaDESC_SITUACAO_TRIB: TStringField;
    QRegItensNf_EmitidaNUM_CLASSIFICACAO: TStringField;
    QRegItensNf_EmitidaPERC_ALIQUOTA: TFloatField;
    QRegItensNf_EmitidaVAL_ICM_BASE: TFloatField;
    QRegItensNf_EmitidaVAL_ICM: TFloatField;
    QRegItensNf_EmitidaVAL_BASE_SUBST: TFloatField;
    QRegItensNf_EmitidaVAL_ICMS_SUBST: TFloatField;
    QRegItensNf_EmitidaIND_ESTOQUE: TStringField;
    QRegMestreNf_Terceiros: TOracleDataSet1;
    QRegItensNf_Terceiros: TOracleDataSet1;
    QRegMestreNf_TerceirosDESC_MODELO: TStringField;
    QRegMestreNf_TerceirosCOD_SERIE: TStringField;
    QRegMestreNf_TerceirosNUM_NOTA: TIntegerField;
    QRegMestreNf_TerceirosDT_EMISSAO: TDateTimeField;
    QRegMestreNf_TerceirosCOD_CADASTRO: TIntegerField;
    QRegMestreNf_TerceirosDT_RECEBIMENTO: TDateTimeField;
    QRegMestreNf_TerceirosVAL_MERCADORIAS: TFloatField;
    QRegMestreNf_TerceirosVAL_DESCONTO: TFloatField;
    QRegMestreNf_TerceirosVAL_FRETE: TFloatField;
    QRegMestreNf_TerceirosVAL_SEGURO: TFloatField;
    QRegMestreNf_TerceirosVAL_DESPESAS: TFloatField;
    QRegMestreNf_TerceirosVAL_TOTAL_IPI: TFloatField;
    QRegMestreNf_TerceirosVAL_ICMS_SUBST: TFloatField;
    QRegMestreNf_TerceirosIND_TIPO_PAGAMENTO: TStringField;
    QRegMestreNf_TerceirosDESC_OBSERVACAO: TStringField;
    QRegItensNf_TerceirosDESC_MODELO: TStringField;
    QRegItensNf_TerceirosCOD_SERIE: TStringField;
    QRegItensNf_TerceirosNUM_NOTA: TIntegerField;
    QRegItensNf_TerceirosDT_EMISSAO: TDateTimeField;
    QRegItensNf_TerceirosCOD_CADASTRO: TIntegerField;
    QRegItensNf_TerceirosCOD_PRODUTO: TFloatField;
    QRegItensNf_TerceirosDESC_COMPLEMENTO: TStringField;
    QRegItensNf_TerceirosNAT_OPERACAO: TFloatField;
    QRegItensNf_TerceirosCOD_OPERACAO: TIntegerField;
    QRegItensNf_TerceirosCOD_NBM_SH: TStringField;
    QRegItensNf_TerceirosQT_QUANTIDADE: TFloatField;
    QRegItensNf_TerceirosDESC_UNIDADE: TStringField;
    QRegItensNf_TerceirosVAL_UNITARIO: TFloatField;
    QRegItensNf_TerceirosVAL_TOTAL: TFloatField;
    QRegItensNf_TerceirosVAL_DESCONTO: TFloatField;
    QRegItensNf_TerceirosPERC_IPI: TFloatField;
    QRegItensNf_TerceirosVAL_IPI: TFloatField;
    QRegItensNf_TerceirosDESC_SITUACAO_TRIB: TStringField;
    QRegItensNf_TerceirosNUM_CLASSIFICACAO: TStringField;
    QRegItensNf_TerceirosPERC_ALIQUOTA: TFloatField;
    QRegItensNf_TerceirosVAL_ICM_BASE: TFloatField;
    QRegItensNf_TerceirosVAL_ICM: TFloatField;
    QRegItensNf_TerceirosVAL_BASE_SUBST: TFloatField;
    QRegItensNf_TerceirosVAL_ICMS_SUBST: TFloatField;
    QRegItensNf_TerceirosIND_ESTOQUE: TStringField;
    QRegCadastro_PJ_PF: TOracleDataSet1;
    QRegCadastro_PJ_PFDT_CADASTRO: TDateTimeField;
    QRegCadastro_PJ_PFCOD_CADASTRO: TIntegerField;
    QRegCadastro_PJ_PFNUM_CGC_CPF: TStringField;
    QRegCadastro_PJ_PFNUM_INSCRICAO: TStringField;
    QRegCadastro_PJ_PFDESC_INSCRICAO_MUNICIPAL: TStringField;
    QRegCadastro_PJ_PFNOME: TStringField;
    QRegCadastro_PJ_PFDESC_ENDERECO: TStringField;
    QRegCadastro_PJ_PFDESC_BAIRRO: TStringField;
    QRegCadastro_PJ_PFDESC_CIDADE: TStringField;
    QRegCadastro_PJ_PFCOD_ESTADO: TStringField;
    QRegCadastro_PJ_PFDESC_PAIS: TStringField;
    QRegCadastro_PJ_PFDESC_CEP: TStringField;
    QRegPlanoContas: TOracleDataSet1;
    QRegPlanoContasNUM_PLANO_CONTA: TStringField;
    QRegPlanoContasIND_TIPO_CONTA: TStringField;
    QRegPlanoContasDESC_PLANO_CONTA: TStringField;
    QRegOperacao: TOracleDataSet1;
    QRegOperacaoCOD_OPERACAO: TIntegerField;
    QRegOperacaoDESC_OPERACAO: TStringField;
    QRegProdutos: TOracleDataSet1;
    QRegProdutosCOD_PRODUTO: TFloatField;
    QRegProdutosDESC_PRODUTO: TStringField;
    QRegSaldoContabilDT_ANO_MES: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRegINSS: TDMRegINSS;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
