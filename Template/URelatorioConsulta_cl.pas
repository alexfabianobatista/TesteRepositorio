unit URelatorioConsulta_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDmRelatorioConsulta = class(TDataModule)
    QCamposTela: TOracleDataSet1;
    QRelTela: TOracleDataSet1;
    QCamposCod: TOracleDataSet1;
    QRelCod: TOracleDataSet1;
    QRelTelaCOD_RELATORIO_CONSULTA: TIntegerField;
    QRelTelaDESC_TELA: TStringField;
    QRelTelaDESC_TITULO: TStringField;
    QRelTelaCOD_USUARIO: TIntegerField;
    QRelTelaIND_DATA_HORA: TStringField;
    QRelTelaIND_NUMERO_PAGINA: TStringField;
    QRelTelaIND_PUBLICO: TStringField;
    QRelTelaIND_TITULO: TStringField;
    QCamposTelaCOD_USUARIO: TIntegerField;
    QCamposTelaCOD_RELATORIO_CONSULTA_CAMPO: TIntegerField;
    QCamposTelaCOD_RELATORIO_CONSULTA: TIntegerField;
    QCamposTelaDESC_CAMPO: TStringField;
    QCamposTelaDESC_TITULO: TStringField;
    QCamposTelaNUM_ORDEM: TIntegerField;
    QCamposTelaNUM_LARGURA: TIntegerField;
    QCamposTelaDESC_ALINHAMENTO: TStringField;
    QCamposCodCOD_USUARIO: TIntegerField;
    QCamposCodCOD_RELATORIO_CONSULTA_CAMPO: TIntegerField;
    QCamposCodCOD_RELATORIO_CONSULTA: TIntegerField;
    QCamposCodDESC_CAMPO: TStringField;
    QCamposCodDESC_TITULO: TStringField;
    QCamposCodNUM_ORDEM: TIntegerField;
    QCamposCodNUM_LARGURA: TIntegerField;
    QCamposCodDESC_ALINHAMENTO: TStringField;
    QRelCodCOD_RELATORIO_CONSULTA: TIntegerField;
    QRelCodDESC_TELA: TStringField;
    QRelCodDESC_TITULO: TStringField;
    QRelCodCOD_USUARIO: TIntegerField;
    QRelCodIND_DATA_HORA: TStringField;
    QRelCodIND_NUMERO_PAGINA: TStringField;
    QRelCodIND_PUBLICO: TStringField;
    QRelCodIND_TITULO: TStringField;
    QRelTelaPublico: TOracleDataSet1;
    QRelTelaPublicoCOD_RELATORIO_CONSULTA: TIntegerField;
    QRelTelaPublicoDESC_TELA: TStringField;
    QRelTelaPublicoDESC_TITULO: TStringField;
    QRelTelaPublicoCOD_USUARIO: TIntegerField;
    QRelTelaPublicoIND_DATA_HORA: TStringField;
    QRelTelaPublicoIND_NUMERO_PAGINA: TStringField;
    QRelTelaPublicoIND_PUBLICO: TStringField;
    QRelTelaPublicoIND_TITULO: TStringField;
    QRelCodIND_ORIENTACAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmRelatorioConsulta: TDmRelatorioConsulta;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
