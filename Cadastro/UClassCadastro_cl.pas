unit UClassCadastro_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMClassCadastro = class(TDataModule)
    DSClassCadastro: TDataSource;
    DSClassCadastroCons: TDataSource;
    QClassCadastro: TOracleDataSet1;
    QClassCadastroCons: TOracleDataSet1;
    QRClassCadastro: TOracleDataSet1;
    QClassCadastroCOD_CLASS_CADASTRO: TIntegerField;
    QClassCadastroDESC_CLASSIFICACAO: TStringField;
    QClassCadastroIND_VENDA: TStringField;
    QClassCadastroDESC_OBSERVACAO: TStringField;
    QClassCadastroVAL_REFERENCIA: TFloatField;
    QClassCadastroConsCOD_CLASS_CADASTRO: TIntegerField;
    QClassCadastroConsDESC_CLASSIFICACAO: TStringField;
    QClassCadastroConsIND_VENDA: TStringField;
    QRClassCadastroCOD_CLASS_CADASTRO: TIntegerField;
    QRClassCadastroDESC_CLASSIFICACAO: TStringField;
    QRClassCadastroIND_VENDA: TStringField;
    QClassCadastroPERC_EQUIPAMENTO: TFloatField;
    QClassCadastroIND_SEPROCADO_LOJA: TStringField;
    QClassCadastroConsIND_SEPROCADO_LOJA: TStringField;
    QClassCadastroIND_ATENCAO: TStringField;
    QClassCadastroConsIND_ATENCAO: TStringField;
    procedure QClassCadastroAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMClassCadastro: TDMClassCadastro;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMClassCadastro.QClassCadastroAfterPost(DataSet: TDataSet);
Var wCodigo : Integer;
begin
  wCodigo := QClassCadastroCod_Class_Cadastro.Value;
  QClassCadastro.Close;
  QClassCadastro.SetVariable('PK',wCodigo);
  QClassCadastro.Open;
end;

end.
