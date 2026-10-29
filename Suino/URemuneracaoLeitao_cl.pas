unit URemuneracaoLeitao_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMRemuneracaoLeitao = class(TDataModule)
    QRemuneracaoLeitao_Cad: TOracleDataSet1;
    QRemuneracaoLeitao_CadDESC_TIPO_PARCERIA: TStringField;
    QRemuneracaoLeitao_CadQT_PESO_REFERENCIA: TFloatField;
    QRemuneracaoLeitao_CadQT_INCREMENTO_REFERENCIA: TFloatField;
    QRemuneracaoLeitao_CadVL_PESO_REFERENCIA: TFloatField;
    QRemuneracaoLeitao_CadVL_INCREMENTO_REFERENCIA: TFloatField;
    QRemuneracaoLeitao_CadQT_CONVERSAO_REFERENICIA: TFloatField;
    QRemuneracaoLeitao_CadQT_CONVERSAO_INCREMENTO: TFloatField;
    QRemuneracaoLeitao_CadVL_CONVERSAO_INCREMENTO: TFloatField;
    QRemuneracaoLeitao_Cons: TOracleDataSet1;
    QRemuneracaoLeitao_ConsDESC_TIPO_PARCERIA: TStringField;
    QRemuneracaoLeitao_ConsQT_PESO_REFERENCIA: TFloatField;
    QRemuneracaoLeitao_ConsQT_INCREMENTO_REFERENCIA: TFloatField;
    QRemuneracaoLeitao_ConsVL_PESO_REFERENCIA: TFloatField;
    QRemuneracaoLeitao_ConsVL_INCREMENTO_REFERENCIA: TFloatField;
    QRemuneracaoLeitao_ConsQT_CONVERSAO_REFERENICIA: TFloatField;
    QRemuneracaoLeitao_ConsQT_CONVERSAO_INCREMENTO: TFloatField;
    QRemuneracaoLeitao_ConsVL_CONVERSAO_INCREMENTO: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRemuneracaoLeitao: TDMRemuneracaoLeitao;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
