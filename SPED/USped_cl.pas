unit USped_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, Oracle;

type
  TDMSped = class(TDataModule)
    QInsSped: TOracleDataSet1;
    QBuscaTodos: TOracleDataSet1;
    QContaBloco: TOracleDataSet1;
    QContaRegistro: TOracleDataSet1;
    QProcuraRegistro: TOracleDataSet1;
    QConta: TOracleDataSet1;
    QDelSped: TOracleDataSet1;
    QUpSped: TOracleDataSet1;
    QRegistros: TOracleDataSet1;
    QBlocos: TOracleDataSet1;
    QBlocosDESC_BLOCO: TStringField;
    QRegistrosDESC_BLOCO: TStringField;
    QRegistrosDESC_REGISTRO: TStringField;
    QMaxRegistro: TOracleDataSet1;
    QAlteraCodigo: TOracleDataSet1;
    QBuscaTodosDESC_CONTEUDO: TStringField;
    QProcuraRegistroCOD_REGISTRO: TFloatField;
    QProcuraRegistroDESC_BLOCO: TStringField;
    QProcuraRegistroDESC_REGISTRO: TStringField;
    QProcuraRegistroDESC_CONTEUDO: TStringField;
    QContaTOTAL: TFloatField;
    QMaxRegistroMAXIMO: TFloatField;
    QContaRegistroTOTAL: TFloatField;
    QContaBlocoTOTAL: TFloatField;
    QPlanoConta: TOracleDataSet1;
    QPlanoContaCOD_REDUZIDO: TIntegerField;
    QPlanoContaCOD_FILIAL: TIntegerField;
    QPlanoContaDESC_PLANO_CONTA: TStringField;
    QPlanoContaNUM_GRAU: TIntegerField;
    QPlanoContaCOD_PLANO_CONTA: TIntegerField;
    QPlanoContaNUM_PLANO_CONTA: TStringField;
    QPlanoContaCOD_GRUPO: TIntegerField;
    QPlanoContaCOD_DEPARTAMENTO: TIntegerField;
    QPlanoContaDESC_NATUREZA_CONTA: TStringField;
    QPlanoContaCOD_PLANO_CONTA_REFERENCIAL: TIntegerField;
    QPlanoContaIND_LIBERADO_USO: TStringField;
    QPlanoContaNum: TOracleDataSet1;
    QPlanoContaNumCOD_REDUZIDO: TIntegerField;
    QPlanoContaNumCOD_FILIAL: TIntegerField;
    QPlanoContaNumDESC_PLANO_CONTA: TStringField;
    QPlanoContaNumNUM_GRAU: TIntegerField;
    QPlanoContaNumCOD_PLANO_CONTA: TIntegerField;
    QPlanoContaNumNUM_PLANO_CONTA: TStringField;
    QPlanoContaNumCOD_GRUPO: TIntegerField;
    QPlanoContaNumCOD_DEPARTAMENTO: TIntegerField;
    QPlanoContaNumDESC_NATUREZA_CONTA: TStringField;
    QPlanoContaNumCOD_PLANO_CONTA_REFERENCIAL: TIntegerField;
    QPlanoContaNumIND_LIBERADO_USO: TStringField;
    QInsSpedApuracao: TOracleDataSet1;
    QApuracaoPisCons: TOracleDataSet1;
    QApuracaoPisConsDESC_REGISTRO: TStringField;
    QApuracaoPisConsCOD_CST_PIS: TStringField;
    QApuracaoPisConsVAL_REGISTRO: TFloatField;
    QApuracaoPisNatCons: TOracleDataSet1;
    QApuracaoCofinsCons: TOracleDataSet1;
    QApuracaoCofinsNatCons: TOracleDataSet1;
    QApuracaoPisNatConsDESC_REGISTRO: TStringField;
    QApuracaoPisNatConsVAL_REGISTRO: TFloatField;
    QApuracaoCofinsConsDESC_REGISTRO: TStringField;
    QApuracaoCofinsConsCOD_CST_COFINS: TStringField;
    QApuracaoCofinsConsVAL_REGISTRO: TFloatField;
    QApuracaoCofinsNatConsDESC_REGISTRO: TStringField;
    QApuracaoCofinsNatConsVAL_REGISTRO: TFloatField;
    QApuracaoCofinsNatConsCOD_NATUREZA_RECEITA: TFloatField;
    QApuracaoPisNatConsCOD_NATUREZA_RECEITA: TFloatField;
    QPlanoContaCons: TOracleDataSet1;
    QPlanoContaConsCOD_PLANO_CONTA: TIntegerField;
    QPlanoContaConsCOD_REDUZIDO: TIntegerField;
    QPlanoContaConsDESC_PLANO_CONTA: TStringField;
    QPlanoContaConsNUM_GRAU: TIntegerField;
    QPlanoContaConsNUM_PLANO_CONTA: TStringField;
    QPlanoContaConsDESC_NATUREZA_CONTA: TStringField;
    QPlanoContaConsNUM_GRAUS_CONTABIL: TIntegerField;
    QPlanoContaConsCOD_PLANO_CONTA_REFERENCIAL: TStringField;
    QBuscaTodosDESC_CONTEUDO_LONGO: TMemoField;
    QApuracaoPisNatConsPERC_ALIQUOTA: TFloatField;
    QApuracaoPisNatConsVAL_BC: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMSped: TDMSped;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
