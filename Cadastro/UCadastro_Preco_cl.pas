unit UCadastro_Preco_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMCadastro_Preco = class(TDataModule)
    QCadastro_Preco_Cad: TOracleDataSet1;
    QCadastro_Preco_CadCOD_CADASTRO_PRECO: TIntegerField;
    QCadastro_Preco_CadCOD_CADASTRO: TIntegerField;
    QCadastro_Preco_CadCOD_PRODUTO: TIntegerField;
    QCadastro_Preco_CadVAL_PRECO: TFloatField;
    QCadastro_Preco_Cons: TOracleDataSet1;
    QCadastro_Preco_ConsCOD_CADASTRO: TIntegerField;
    QCadastro_Preco_ConsCOD_PRODUTO: TIntegerField;
    QCadastro_Preco_ConsVAL_PRECO: TFloatField;
    QCadastro_Preco_ConsNOME: TStringField;
    QCadastro_Preco_ConsDESC_PRODUTO: TStringField;
    QCadastro_Preco_ConsCOD_CADASTRO_PRECO: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCadastro_Preco: TDMCadastro_Preco;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
