unit UFuncaoFuncionario_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMFuncaoFuncionario = class(TDataModule)
    QFuncaoFuncionario: TOracleDataSet1;
    QFuncaoFuncionarioCons: TOracleDataSet1;
    QFuncaoFuncionarioConsCOD_FUNCAO_FUNCIONARIO: TIntegerField;
    QFuncaoFuncionarioConsDESC_FUNCAO_FUNCIONARIO: TStringField;
    QFuncaoFuncionarioCOD_FUNCAO_FUNCIONARIO: TIntegerField;
    QFuncaoFuncionarioDESC_FUNCAO_FUNCIONARIO: TStringField;
    QRFuncaoFuncionario: TOracleDataSet1;
    QRFuncaoFuncionarioCOD_FUNCAO_FUNCIONARIO: TIntegerField;
    QRFuncaoFuncionarioDESC_FUNCAO_FUNCIONARIO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMFuncaoFuncionario: TDMFuncaoFuncionario;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
