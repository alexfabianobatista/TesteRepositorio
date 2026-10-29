unit UBlocoE_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDmBlocoE = class(TDataModule)
    QReg111: TOracleDataSet1;
    QReg111NUM_ANO: TIntegerField;
    QReg111NUM_MES: TIntegerField;
    QReg111COD_FILIAL: TIntegerField;
    QReg111COD_OPERACAO: TIntegerField;
    QReg111VAL_IMPOSTO: TFloatField;
    QReg111DESC_LCTO: TStringField;
    QReg111DESC_COMPLEMENTO: TStringField;
    QReg111COD_LIVRO_LCTO: TIntegerField;
    QReg111COD_GIA: TIntegerField;
    QReg111DESC_GIA: TStringField;
    QReg116: TOracleDataSet1;
    QReg116COD_RECEITA: TIntegerField;
    QReg116DT_VENCIMENTO_RECOLHIMENTO: TDateTimeField;
    QReg116NUM_PROCESSO: TStringField;
    QReg116IND_PROCESSO: TIntegerField;
    QReg116DESC_PROCESSO: TStringField;
    QReg510: TOracleDataSet1;
    QReg520: TOracleDataSet1;
    QReg510NUM_CFOP: TFloatField;
    QReg510COD_CST_IPI: TStringField;
    QReg510VAL_IPI: TFloatField;
    QReg510VAL_TOTAL: TFloatField;
    QReg520VAL_CR_ICM: TFloatField;
    QReg520VAL_DB_ICM: TFloatField;
    QReg520VAL_SALDO_CREDOR: TFloatField;
    QReg520VAL_SALDO_DEVEDOR: TFloatField;
    QReg520VAL_OUTROS_CREDITOS: TFloatField;
    QReg520VAL_OUTROS_DEBITOS: TFloatField;
    QReg520VAL_SALDO_ANTERIOR: TFloatField;
    QReg200: TOracleDataSet1;
    QReg200COD_ESTADO: TStringField;
    QReg210: TOracleDataSet1;
    QReg210IND_MOV_ST: TStringField;
    QReg210VL_SLD_CRED_ANT_ST: TFloatField;
    QReg210VL_DEVOL_ST: TFloatField;
    QReg210VL_RESSARC_ST: TFloatField;
    QReg210VL_OUT_CRED_ST: TFloatField;
    QReg210VL_AJ_CREDITOS_ST: TFloatField;
    QReg210VL_RETENCAO_ST: TFloatField;
    QReg210VL_OUT_DEB_ST: TFloatField;
    QReg210VL_AJ_DEBITOS_ST: TFloatField;
    QReg210VL_SLD_DEV_ANT_ST: TFloatField;
    QReg210VL_DEDUCOES_ST: TFloatField;
    QReg210VL_ICMS_RECOL_ST: TFloatField;
    QReg210VL_SLD_CRED_ST_TRANSPORTAR: TFloatField;
    QReg210DEB_ESP_ST: TFloatField;
    QReg250: TOracleDataSet1;
    QReg250COD_RECEITA_OBRIGACAO_ICMS: TStringField;
    QReg250DT_VENCIMENTO_OBRIGACAO_ICMS: TDateTimeField;
    QReg250COD_OBRIGACAO_ICMS: TStringField;
    QReg250NUM_PROCESSO_OBRIGACAO_ICMS: TStringField;
    QReg250IND_PROCESSO_OBRIGACAO_ICMS: TIntegerField;
    QReg250DESC_PROCESSO_OBRIGACAO_ICMS: TStringField;
    QReg250DESC_COMPL_OBRIGACAO_ICMS: TStringField;
    QReg250NUM_MES_ANO_REFERENCIA: TStringField;
    QReg116IND_ORIGEM: TStringField;
    QReg530: TOracleDataSet1;
    QReg530IND_AJ: TStringField;
    QReg530VL_AJ: TFloatField;
    QReg530DESCR_AJ: TStringField;
    QReg530COD_AJ: TStringField;
    QReg250VAL_OR: TFloatField;
    QReg530IND_DOC: TFloatField;
    QReg531: TOracleDataSet1;
    QReg531COD_PART: TIntegerField;
    QReg531COD_MOD: TStringField;
    QReg531SERIE: TStringField;
    QReg531SUB: TStringField;
    QReg531NUM_DOC: TIntegerField;
    QReg531DT_DOC: TDateTimeField;
    QReg531VL_AJ_ITEM: TFloatField;
    QReg531DESC_CHAVE_ACESSO: TStringField;
    QReg530COD_LIVRO_LCTO_IPI: TIntegerField;
    QReg531COD_ITEM: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmBlocoE: TDmBlocoE;

implementation

uses UGia_cl, UOracle_cl;

{$R *.dfm}

end.
