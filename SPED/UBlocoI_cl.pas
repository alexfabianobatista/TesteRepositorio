 unit UBlocoI_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, DBClient;

type
  TDmBlocoI = class(TDataModule)
    QReg075: TOracleDataSet1;
    QReg075COD_HISTORICO_CONTABIL: TIntegerField;
    QReg075DESC_HISTORICO_CONTABIL: TStringField;
    QReg155: TOracleDataSet1;
    QReg200: TOracleDataSet1;
    QReg030: TOracleDataSet1;
    QReg050: TOracleDataSet1;
    QReg051: TOracleDataSet1;
    QReg300: TOracleDataSet1;
    QReg300DT_LANCAMENTO: TDateTimeField;
    QReg310: TOracleDataSet1;
    QReg310COD_PLANO_CONTA: TFloatField;
    QReg310NUM_PLANO_CONTA: TStringField;
    QReg310VAL_DEBITO: TFloatField;
    QReg310VAL_CREDITO: TFloatField;
    QReg355: TOracleDataSet1;
    QReg052: TOracleDataSet1;
    QReg050COD_PLANO_CONTA: TIntegerField;
    QReg050COD_REDUZIDO: TIntegerField;
    QReg050DESC_PLANO_CONTA: TStringField;
    QReg050NUM_GRAU: TIntegerField;
    QReg050NUM_PLANO_CONTA: TStringField;
    QReg050DESC_NATUREZA_CONTA: TStringField;
    QReg050NUM_GRAUS_CONTABIL: TIntegerField;
    QReg050COD_PLANO_CONTA_REFERENCIAL: TIntegerField;
    QReg051NUM_PLANO_CONTA_REFERENCIAL: TStringField;
    QReg051NUM_GRAU: TIntegerField;
    QReg200DT_LANCAMENTO: TDateTimeField;
    QReg200VAL_LANCAMENTO: TFloatField;
    QReg200DESC_COMPLEMENTO: TStringField;
    QReg200IND_LANCAMENTO: TStringField;
    QReg200COD_LANCTO_CONTABIL: TIntegerField;
    QReg200IND_OPERACAO: TStringField;
    QReg200NUM_PLANO_CONTA: TStringField;
    QReg200COD_HISTORICO_CONTABIL: TIntegerField;
    QReg155COD_PLANO_CONTA: TIntegerField;
    QReg155NUM_PLANO_CONTA: TStringField;
    QReg155VAL_ANTERIOR: TFloatField;
    QReg155VAL_DEBITO: TFloatField;
    QReg155VAL_CREDITO: TFloatField;
    QReg155VAL_ATUAL: TFloatField;
    QReg052COD_AGLUTINACAO1: TStringField;
    QReg052COD_AGLUTINACAO: TIntegerField;
    QReg030DESC_FILIAL: TStringField;
    QReg030NUM_CGC: TStringField;
    QReg030NUM_NIRE: TStringField;
    QReg030DESC_CIDADE: TStringField;
    QReg030COD_TERMO_ABERTURA: TIntegerField;
    QReg030COD_FILIAL: TIntegerField;
    QReg030NUM_ORDEM: TFloatField;
    QReg030DESC_NAT_LIVRO: TStringField;
    QReg030DT_INICIAL: TDateTimeField;
    QReg250: TOracleDataSet1;
    QReg250COD_CTA: TStringField;
    QReg250VL_DC: TFloatField;
    QReg250IND_DC: TStringField;
    QReg200COD_FILIAL: TIntegerField;
    QReg250COD_HIST_PAD: TIntegerField;
    QReg200DESC_COMPLEMENTO_PARAM: TStringField;
    QReg200COD_NOTA_CAB: TIntegerField;
    QReg200COD_CONTA_PAGAR_CAB: TIntegerField;
    QReg200COD_BCO_MOVIMENTO: TIntegerField;
    QReg200COD_CAIXA_MOV: TIntegerField;
    QReg200COD_PLANILHA: TIntegerField;
    QReg250COD_LANCTO_CONTABIL: TIntegerField;
    QReg200COD_CONTA_RECEBER_CAB: TFloatField;
    QReg200IND_TIPO_LANCAMENTO_SPED: TStringField;
    CDSPartida: TClientDataSet;
    CDSPartidaCOD_LANCTO_CONTABIL: TIntegerField;
    CDSPartidaIND_TIPO_LANCAMENTO_SPED: TStringField;
    CDSPartidaVAL_LANCAMENTO: TFloatField;
    CDSDatas: TClientDataSet;
    CDSDatasDT_INI: TDateField;
    CDSDatasDT_FIN: TDateField;
    QReg355VAL_LANCAMENTO: TFloatField;
    QReg355NUM_PLANO_CONTA: TStringField;
    QReg355COD_PLANILHA: TIntegerField;
    QReg350: TOracleDataSet1;
    QReg350DT_LANCAMENTO: TDateTimeField;
    QReg355VAL_ATUAL: TFloatField;
    CDSEncerramento: TClientDataSet;
    CDSEncerramentoVAL_LANCAMENTO: TFloatField;
    CDSEncerramentoNUM_PLANO_CONTA: TStringField;
    QReg200DESC_NATUREZA_CONTA: TStringField;
    QReg030DT_EX_SOCIAL: TStringField;
    QReg051COD_PLAN_REF: TStringField;
    CDSEncerramentoDT_ENCERRAMENTO: TDateTimeField;
    QReg155Trim: TOracleDataSet1;
    QReg155TrimCOD_PLANO_CONTA: TIntegerField;
    QReg155TrimNUM_PLANO_CONTA: TStringField;
    QReg155TrimVAL_ANTERIOR: TFloatField;
    QReg155TrimVAL_DEBITO: TFloatField;
    QReg155TrimVAL_CREDITO: TFloatField;
    QReg155TrimVAL_ATUAL: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmBlocoI: TDmBlocoI;

implementation

{$R *.dfm}

end.
