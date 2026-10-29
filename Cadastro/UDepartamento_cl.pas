unit UDepartamento_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMDepartamento = class(TDataModule)
    DSDepartamento: TDataSource;
    DSDepartamentoCons: TDataSource;
    QDepartamento: TOracleDataSet1;
    QDepartamentoCOD_DEPARTAMENTO: TIntegerField;
    QDepartamentoDESC_DEPARTAMENTO: TStringField;
    QDepartamentoIND_FLUXO_CAIXA: TStringField;
    QDepartamentoCons: TOracleDataSet1;
    QRDepartamento: TOracleDataSet1;
    QDepartamentoConsCOD_DEPARTAMENTO: TIntegerField;
    QDepartamentoConsDESC_DEPARTAMENTO: TStringField;
    QDepartamentoConsIND_FLUXO_CAIXA: TStringField;
    QRDepartamentoCOD_DEPARTAMENTO: TIntegerField;
    QRDepartamentoDESC_DEPARTAMENTO: TStringField;
    QRDepartamentoIND_FLUXO_CAIXA: TStringField;
    QDepartamentoCOD_USUARIO: TIntegerField;
    QDepartamentoConsIND_SITUACAO: TStringField;
    QRDepartamentoIND_SITUACAO: TStringField;
    QDepartamentoIND_SITUACAO: TStringField;
    QRDepartamentosituacao: TStringField;
    procedure QDepartamentoAfterInsert(DataSet: TDataSet);
    procedure QDepartamentoAfterPost(DataSet: TDataSet);
    procedure QDepartamentoBeforePost(DataSet: TDataSet);
    procedure QRDepartamentoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDepartamento: TDMDepartamento;

implementation

uses UOracle_cl, UUsuario_cl;

{$R *.DFM}

procedure TDMDepartamento.QDepartamentoAfterInsert(DataSet: TDataSet);
begin
  QDepartamentoCod_Departamento.Value := DMOracle.Sequencia('DEPARTAMENTO');
end;

procedure TDMDepartamento.QDepartamentoAfterPost(DataSet: TDataSet);
begin
  QDepartamento.SetVariable('PK',QDepartamentoCod_Departamento.Value);
end;

procedure TDMDepartamento.QDepartamentoBeforePost(DataSet: TDataSet);
begin
  QDepartamentoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMDepartamento.QRDepartamentoCalcFields(DataSet: TDataSet);
begin
  if QRDepartamentoIND_SITUACAO.Value = 'A' then
    QRDepartamentosituacao.Value := 'ATIVADO';
  if QRDepartamentoIND_SITUACAO.Value = 'D' then
    QRDepartamentosituacao.Value := 'DESATIVADO';
end;

end.
