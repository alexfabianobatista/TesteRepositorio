unit UTipoCadastro_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMTipoCadastro = class(TDataModule)
    DSTipoCadastro: TDataSource;
    DSTipoCadastroCons: TDataSource;
    DSTipoCadastroAll: TDataSource;
    QTipoCadastro: TOracleDataSet1;
    QTipoCadastroCOD_TIPO_CADASTRO: TIntegerField;
    QTipoCadastroDESC_TIPO_CADASTRO: TStringField;
    QTipoCadastroCons: TOracleDataSet1;
    QTipoCadastroConsCOD_TIPO_CADASTRO: TIntegerField;
    QTipoCadastroConsDESC_TIPO_CADASTRO: TStringField;
    QTipoCadastroAll: TOracleDataSet1;
    QTipoCadastroAllCOD_TIPO_CADASTRO: TIntegerField;
    QTipoCadastroAllDESC_TIPO_CADASTRO: TStringField;
    QRTipoCadastro: TOracleDataSet1;
    QRTipoCadastroCOD_TIPO_CADASTRO: TIntegerField;
    QRTipoCadastroDESC_TIPO_CADASTRO: TStringField;
    procedure QTipoCadastroAfterInsert(DataSet: TDataSet);
    procedure QTipoCadastroAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTipoCadastro: TDMTipoCadastro;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMTipoCadastro.QTipoCadastroAfterInsert(DataSet: TDataSet);
begin
  QTipoCadastroCod_Tipo_Cadastro.Value := DMOracle.Sequencia('TIPO_CADASTRO');
end;

procedure TDMTipoCadastro.QTipoCadastroAfterPost(DataSet: TDataSet);
begin
  QTipoCadastro.SetVariable('PK',QTipoCadastroCod_Tipo_Cadastro.Value);
end;

end.
