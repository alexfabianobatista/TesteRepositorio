unit UFContI_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, UOracle_cl, DBClient;

type
  TDmFContI = class(TDataModule)
    QReg050: TOracleDataSet1;
    QReg050COD_PLANO_CONTA: TIntegerField;
    QReg050COD_REDUZIDO: TIntegerField;
    QReg050DESC_PLANO_CONTA: TStringField;
    QReg050NUM_GRAU: TIntegerField;
    QReg050NUM_PLANO_CONTA: TStringField;
    QReg050DESC_NATUREZA_CONTA: TStringField;
    QReg050NUM_GRAUS_CONTABIL: TIntegerField;
    QReg050COD_PLANO_CONTA_REFERENCIAL: TIntegerField;
    QReg051: TOracleDataSet1;
    QReg075: TOracleDataSet1;
    QReg075COD_HISTORICO_CONTABIL: TIntegerField;
    QReg075DESC_HISTORICO_CONTABIL: TStringField;
    QReg155: TOracleDataSet1;
    QReg200: TOracleDataSet1;
    QReg250: TOracleDataSet1;
    QReg355: TOracleDataSet1;
    QReg355NUM_PLANO_CONTA: TStringField;
    QReg355VAL_ATUAL: TFloatField;
    QReg355IND_DC: TStringField;
    QReg356: TOracleDataSet1;
    QReg356COD_CTA_REF: TStringField;
    QReg356VL_CTA: TFloatField;
    QReg356IND_DC: TStringField;
    QReg355COD_PLANO_CONTA: TIntegerField;
    QReg051NUM_PLANO_CONTA_REFERENCIAL: TStringField;
    QReg051NUM_GRAU: TIntegerField;
    QReg155COD_PLANO_CONTA: TIntegerField;
    QReg155NUM_PLANO_CONTA: TStringField;
    QReg155VL_SLD_INI: TFloatField;
    QReg155VAL_DEBITO: TFloatField;
    QReg155VAL_CREDITO: TFloatField;
    QReg155VL_SLD_FIN: TFloatField;
    QReg155IND_DC_INI: TStringField;
    QReg155IND_DC_FIN: TStringField;
    CDSDatas: TClientDataSet;
    CDSDatasDT_INI: TDateField;
    CDSDatasDT_FIN: TDateField;
    CDSEncerramento: TClientDataSet;
    CDSEncerramentoVAL_LANCAMENTO: TFloatField;
    CDSEncerramentoNUM_PLANO_CONTA: TStringField;
    CDSPartida: TClientDataSet;
    CDSPartidaCOD_LANCTO_CONTABIL: TIntegerField;
    CDSPartidaIND_TIPO_LANCAMENTO_SPED: TStringField;
    CDSPartidaVAL_LANCAMENTO: TFloatField;
    QReg250COD_CTA: TStringField;
    QReg250VL_DC: TFloatField;
    QReg250IND_DC: TStringField;
    QReg200COD_FILIAL: TIntegerField;
    QReg200DT_LANCAMENTO: TDateTimeField;
    QReg200VAL_LANCAMENTO: TFloatField;
    QReg200DESC_COMPLEMENTO: TStringField;
    QReg200DESC_COMPLEMENTO_PARAM: TStringField;
    QReg200IND_LANCAMENTO: TStringField;
    QReg200COD_LANCTO_CONTABIL: TIntegerField;
    QReg200IND_OPERACAO: TStringField;
    QReg200NUM_PLANO_CONTA: TStringField;
    QReg200DESC_NATUREZA_CONTA: TStringField;
    QReg200COD_HISTORICO_CONTABIL: TFloatField;
    QReg200COD_NOTA_CAB: TFloatField;
    QReg200COD_CONTA_RECEBER_CAB: TFloatField;
    QReg200COD_CONTA_PAGAR_CAB: TFloatField;
    QReg200COD_BCO_MOVIMENTO: TFloatField;
    QReg200COD_CAIXA_MOV: TFloatField;
    QReg200COD_PLANILHA: TFloatField;
    QLancExtemporaneo: TOracleDataSet1;
    QLancExtemporaneoDT_INI: TDateTimeField;
    QLancExtemporaneoDT_FIN: TDateTimeField;
    QLancExtemporaneoCOD_HISTORICO_CONTABIL: TIntegerField;
    CDSDatasCOD_HISTORICO_CONTABIL: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmFContI: TDmFContI;

implementation

{$R *.dfm}

end.
