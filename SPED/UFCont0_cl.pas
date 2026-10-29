unit UFCont0_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDmFCont0 = class(TDataModule)
    QReg000: TOracleDataSet1;
    QReg000DESC_FILIAL: TStringField;
    QReg000NUM_CGC: TStringField;
    QReg000DESC_NIT: TStringField;
    QReg000DESC_SIGLA_ESTADO: TStringField;
    QReg000DESC_INSCRICAO: TStringField;
    QReg000DESC_INSCRICAO_MUNICIPAL: TStringField;
    QReg000DESC_SUFRAMA: TStringField;
    QReg000COD_CIDADE_IBGE: TStringField;
    QReg000COD_UF_IBGE: TFloatField;
    QReg000IND_PERFIL_SPED: TStringField;
    QReg000IND_TIPO_ATIVIDADE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmFCont0: TDmFCont0;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
