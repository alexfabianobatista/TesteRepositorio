unit USpedRel_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMSpedRel = class(TDataModule)
    QRPisCofinsOperacao: TOracleDataSet1;
    QRPisCofinsOperacaoCOD_OPERACAO: TIntegerField;
    QRPisCofinsOperacaoDESC_OPERACAO: TStringField;
    QRPisCofinsOperacaoMODELO: TStringField;
    QRPisCofinsOperacaoVAL_BC: TFloatField;
    QRPisCofinsNota: TOracleDataSet1;
    QRPisCofinsNotaNUM_NOTA: TFloatField;
    QRPisCofinsNotaDT_RECEBIMENTO: TDateTimeField;
    QRPisCofinsNotaCOD_OPERACAO: TIntegerField;
    QRPisCofinsNotaDESC_OPERACAO: TStringField;
    QRPisCofinsNotaMODELO: TStringField;
    QRPisCofinsNotaTIPO: TStringField;
    QRPisCofinsNotaVAL_BC: TFloatField;
    QRPisCofinsOperacaoIND_ENTRADA_SAIDA: TStringField;
    QRPisCofinsNotaIND_ENTRADA_SAIDA: TStringField;
    QRPisCofinsCST: TOracleDataSet1;
    QRPisCofinsCSTCST_COFINS: TStringField;
    QRPisCofinsCSTCST_PIS: TStringField;
    QRPisCofinsCSTIND_ENTRADA_SAIDA: TStringField;
    QRPisCofinsCSTTIPO: TStringField;
    QRPisCofinsCSTVAL_BC: TFloatField;
    QRPisCofinsOperacaoVAL_PIS: TFloatField;
    QRPisCofinsOperacaoVAL_COFINS: TFloatField;
    QRPisCofinsNotaVAL_PIS: TFloatField;
    QRPisCofinsNotaVAL_COFINS: TFloatField;
    QRPisCofinsCSTVAL_PIS: TFloatField;
    QRPisCofinsCSTVAL_COFINS: TFloatField;
    QRPisCofinsOperacaoVAL_IPI: TFloatField;
    QRPisCofinsOperacaoVAL_ICMS_SUBST: TFloatField;
    QRPisCofinsNotaVAL_IPI: TFloatField;
    QRPisCofinsNotaVAL_ICMS_SUBST: TFloatField;
    QRFiscalIPI: TOracleDataSet1;
    QRFiscalIPIIND_ENTRADA_SAIDA: TStringField;
    QRFiscalIPICOD_NOTA_CAB: TIntegerField;
    QRFiscalIPIDESC_OPERACAO: TStringField;
    QRFiscalIPIDESC_SERIE_MODELO: TStringField;
    QRFiscalIPICOD_CST_IPI: TStringField;
    QRFiscalIPIOBSERVACAO: TStringField;
    QRFiscalIPIVAL_IPI: TFloatField;
    QRFiscalIPINUM_NOTA: TIntegerField;
    QRFiscalIPIVAL_ICMS: TFloatField;
    QRPisCofinsNotaCOD_NOTA: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMSpedRel: TDMSpedRel;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
