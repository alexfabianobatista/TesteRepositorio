unit UContabiliza_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMContabiliza = class(TDataModule)
    QContabiliza_CX: TOracleDataSet1;
    QContabiliza_CXCOD_HISTORICO: TIntegerField;
    QContabiliza_CXCOD_CAIXA_MOV: TIntegerField;
    QContabiliza_CXCOD_USUARIO: TIntegerField;
    QContabiliza_CXCOD_FILIAL: TIntegerField;
    QContabiliza_CXDT_MOVIMENTO: TDateTimeField;
    QContabiliza_CXVAL_MOVIMENTO: TFloatField;
    QContabiliza_CXNUM_DOCUMENTO: TIntegerField;
    QContabiliza_CXCOD_CADASTRO: TIntegerField;
    QContabiliza_CXCOD_NOTA_CAB: TIntegerField;
    QContabiliza_CXCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContabiliza_CXCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContabiliza_CXDESC_COMPLEMENTO: TStringField;
    QContabiliza_CXCOD_CONTRATO_MOV: TIntegerField;
    QContabiliza_CXCOD_BCO_MOVIMENTO: TIntegerField;
    QContabiliza_CXCOD_CONTABIL_DEB: TStringField;
    QContabiliza_CXCOD_HISTORICO_CONTABIL: TIntegerField;
    QContabiliza_CXCOD_CONTABIL_CRED: TStringField;
    QContabiliza_BC: TOracleDataSet1;
    QContabiliza_BCCOD_HISTORICO: TIntegerField;
    QContabiliza_BCCOD_BCO_MOVIMENTO: TIntegerField;
    QContabiliza_BCNUM_CHEQUE: TIntegerField;
    QContabiliza_BCDT_MOVIMENTO: TDateTimeField;
    QContabiliza_BCVAL_MOVIMENTO: TFloatField;
    QContabiliza_BCDESC_OBSERVACAO: TStringField;
    QContabiliza_BCCOD_NOTA_CAB: TIntegerField;
    QContabiliza_BCCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContabiliza_BCCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContabiliza_BCCOD_CADASTRO: TIntegerField;
    QContabiliza_BCCOD_HISTORICO_CONTABIL: TIntegerField;
    QContabiliza_BCCOD_CONTABIL_DEB: TStringField;
    QContabiliza_BCCOD_CONTABIL_CRED: TStringField;
    QContabiliza_BCCOD_FILIAL: TIntegerField;
    QContabiliza: TOracleDataSet1;
    QContabilizaCOD_NOTA_CAB: TIntegerField;
    QContabilizaCOD_FILIAL: TIntegerField;
    QContabilizaCOD_OPERACAO: TIntegerField;
    QContabilizaNUM_NOTA: TIntegerField;
    QContabilizaCOD_SERIE: TStringField;
    QContabilizaIND_SITUACAO: TStringField;
    QContabilizaDT_RECEBIMENTO: TDateTimeField;
    QContabiliza_CP: TOracleDataSet1;
    QContabiliza_CPCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContabiliza_CPCOD_FINALIDADE: TIntegerField;
    QContabiliza_CPCOD_BANCO_AGENCIA: TIntegerField;
    QContabiliza_CPCOD_CADASTRO: TIntegerField;
    QContabiliza_CPCOD_FILIAL: TIntegerField;
    QContabiliza_CPNUM_TITULO: TIntegerField;
    QContabiliza_CPNUM_PARCELA: TIntegerField;
    QContabiliza_CPDESC_TIPO_DOCUMENTO: TStringField;
    QContabiliza_CPCOD_CONTA_PAGAR_MOV: TIntegerField;
    QContabiliza_CPDT_MOVIMENTO: TDateTimeField;
    QContabiliza_CPVAL_MOVIMENTO: TFloatField;
    QContabiliza_CPIND_TIPO_MOVIMENTO: TStringField;
    QContabiliza_CPCOD_BCO_MOVIMENTO: TIntegerField;
    QContabiliza_CPCOD_CAIXA_MOV: TIntegerField;
    QContabiliza_CPCOD_HISTORICO_CONTABIL: TIntegerField;
    QContabiliza_CPCOD_CONTABIL_VL_DESC_CRED: TStringField;
    QContabiliza_CPCOD_CONTABIL_VL_JURO_CRED: TStringField;
    QContabiliza_CPCOD_CONTABIL_VL_BAIXA_DEB: TStringField;
    QContabiliza_CPCOD_CONTABIL_VL_DESC_DEB: TStringField;
    QContabiliza_CPCOD_CONTABIL_VL_JURO_DEB: TStringField;
    QContabiliza_CPCOD_CONTABIL_VL_BAIXA_CRED: TStringField;
    QContabiliza_CPCOD_CONTABIL_VL_BANCO_CRED: TStringField;
    QContabiliza_CPCOD_CONTABIL_VL_BANCO_DEB: TStringField;
    QContabiliza_CPCOD_CONTABIL_VL_JURO_BCO_DEB: TStringField;
    QContabiliza_CPCOD_CONTABIL_VL_DESC_BCO_CRED: TStringField;
    QContabiliza_CPNOME: TStringField;
    QContabiliza_CR: TOracleDataSet1;
    QContabiliza_CRCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContabiliza_CRCOD_FINALIDADE: TIntegerField;
    QContabiliza_CRCOD_BANCO_AGENCIA: TIntegerField;
    QContabiliza_CRCOD_FILIAL: TIntegerField;
    QContabiliza_CRNUM_TITULO: TIntegerField;
    QContabiliza_CRCOD_CADASTRO: TIntegerField;
    QContabiliza_CRCOD_CONTA_RECEBER_MOV: TIntegerField;
    QContabiliza_CRDT_MOVIMENTO: TDateTimeField;
    QContabiliza_CRVAL_MOVIMENTO: TFloatField;
    QContabiliza_CRIND_TIPO_MOVIMENTO: TStringField;
    QContabiliza_CRCOD_BCO_MOVIMENTO: TIntegerField;
    QContabiliza_CRCOD_CAIXA_MOV: TIntegerField;
    QContabiliza_CRCOD_HISTORICO_CONTABIL: TIntegerField;
    QContabiliza_CRCOD_CONTABIL_VL_DESC_CRED: TStringField;
    QContabiliza_CRCOD_CONTABIL_VL_JURO_CRED: TStringField;
    QContabiliza_CRCOD_CONTABIL_VL_BAIXA_DEB: TStringField;
    QContabiliza_CRCOD_CONTABIL_VL_DESC_DEB: TStringField;
    QContabiliza_CRCOD_CONTABIL_VL_JURO_DEB: TStringField;
    QContabiliza_CRCOD_CONTABIL_VL_BAIXA_CRED: TStringField;
    QContabiliza_CRCOD_CONTABIL_VL_BANCO_CRED: TStringField;
    QContabiliza_CRCOD_CONTABIL_VL_BANCO_DEB: TStringField;
    QContabiliza_CRCOD_CONTABIL_VL_JURO_BCO_DEB: TStringField;
    QContabiliza_CRCOD_CONTABIL_VL_DESC_BCO_CRED: TStringField;
    QContabiliza_CRNOME: TStringField;
    QContabiliza_BCCOD_CONTABIL_CONTRAPARTIDA: TStringField;
    QAtualiza_Nota: TOracleDataSet1;
    QConhecimentoFrete: TOracleDataSet1;
    QConhecimentoFreteCOD_CONHECIMENTO_FRETE: TIntegerField;
    QConhecimentoFreteCOD_NOTA_CAB: TIntegerField;
    QConhecimentoFreteNUM_FRETE: TIntegerField;
    QConhecimentoFreteDT_PAGAMENTO: TDateTimeField;
    QConhecimentoFreteCOD_CONTRATO_VEND: TIntegerField;
    QConhecimentoFreteVAL_FRETE: TFloatField;
    QConhecimentoFreteQT_PESO_CHEGADA: TFloatField;
    QConhecimentoFreteDESC_PLACA: TStringField;
    QConhecimentoFreteDESC_MOTORISTA: TStringField;
    QConhecimentoFreteDT_EMISSAO_CONHECIMENTO: TDateTimeField;
    QConhecimentoFreteQT_PESO_FRETE: TFloatField;
    QConhecimentoFreteVAL_PEDAGIO: TFloatField;
    QConhecimentoFreteVAL_ICMS: TFloatField;
    QConhecimentoFreteVAL_ESTADIA: TFloatField;
    QConhecimentoFreteVAL_DESCONTO: TFloatField;
    QConhecimentoFreteVAL_QUEBRA_TECNICA: TFloatField;
    QConhecimentoFreteCOD_CADASTRO: TIntegerField;
    QConhecimentoFreteCOD_FILIAL: TIntegerField;
    QConhecimentoFreteVAL_FRETE_COMPLEMENTO: TFloatField;
    QConhecimentoFreteIND_GERA_CUSTO: TStringField;
    QConhecimentoFreteVAL_FRETE_TON: TFloatField;
    QConhecimentoFreteIND_TIPO_CALCULO: TStringField;
    QConhecimentoFreteDT_RECEBIMENTO: TDateTimeField;
    QConhecimentoFreteCOD_OPERACAO: TIntegerField;
    QConhecimentoFreteQT_QUANTIDADE: TFloatField;
    QConhecimentoFreteVALOR_FRETE_TON: TFloatField;
    QConhecimentoFreteIND_SITUACAO: TStringField;
    QConhecimentoFreteCOD_TRIBUTACAO: TIntegerField;
    QConhecimentoFreteVAL_PIS: TFloatField;
    QConhecimentoFreteVAL_COFINS: TFloatField;
    QContabilizaCOD_CADASTRO: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContabiliza: TDMContabiliza;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
