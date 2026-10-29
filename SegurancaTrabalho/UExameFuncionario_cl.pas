unit UExameFuncionario_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMExameFuncionario = class(TDataModule)
    QExameFuncionario: TOracleDataSet1;
    QExameFuncionarioCOD_EXAME_FUNCIONARIO: TIntegerField;
    QExameFuncionarioCOD_TIPO_EXAME: TIntegerField;
    QExameFuncionarioCOD_FUNCIONARIO: TIntegerField;
    QExameFuncionarioCOD_EXAME: TIntegerField;
    QExameFuncionarioDT_EXAME: TDateTimeField;
    QExameFuncionariodesc_funcionario: TStringField;
    QExameFuncionariodesc_tipo_exame: TStringField;
    QExameFuncionariodesc_exame: TStringField;
    DSExameFuncionario: TDataSource;
    QExameFuncionarioID_EXAME: TStringField;
    procedure DSExameFuncionarioStateChange(Sender: TObject);
    procedure QExameFuncionarioAfterInsert(DataSet: TDataSet);
    procedure QExameFuncionarioCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMExameFuncionario: TDMExameFuncionario;

implementation

uses UOracle_cl, UExameFuncionarioCad, UFuncionario_cl;

{$R *.DFM}

procedure TDMExameFuncionario.DSExameFuncionarioStateChange(
  Sender: TObject);
begin
  If DSExameFuncionario.State in [DSInsert,DSEdit] then
  begin
    FExameFuncionarioCad.BTExameCons.enabled:=true;
    FExameFuncionarioCad.BTTipoExameCons.enabled:=true;
  end
  else
  begin
    FExameFuncionarioCad.BTExameCons.enabled:=false;
    FExameFuncionarioCad.BTTipoExameCons.enabled:=false;
  end;
end;

procedure TDMExameFuncionario.QExameFuncionarioAfterInsert(
  DataSet: TDataSet);
begin
  QExameFuncionarioCod_Funcionario.Value := DMFuncionario.QFuncionarioCod_Funcionario.Value;
  QExameFuncionarioDt_Exame.Value := Date;
end;

procedure TDMExameFuncionario.QExameFuncionarioCalcFields(
  DataSet: TDataSet);
begin
  if Trim(QExameFuncionarioCod_Exame.text) <> '' then
    QExameFuncionarioDesc_Exame.Value := DMOracle.BuscaNome('SELECT DESC_EXAME '+
    ' FROM TB_EXAME','COD_EXAME = '+Trim(QExameFuncionarioCod_Exame.text));

  if Trim(QExameFuncionarioCod_Tipo_Exame.text) <> '' then
    QExameFuncionarioDesc_Tipo_Exame.Value := DMOracle.BuscaNome('SELECT DESC_TIPO_EXAME '+
    ' FROM TB_TIPO_EXAME','COD_TIPO_EXAME = '+Trim(QExameFuncionarioCod_Tipo_Exame.text));

  if Trim(QExameFuncionarioCod_Funcionario.text) <> '' then
    QExameFuncionarioDesc_Funcionario.Value := DMOracle.BuscaNome('SELECT DESC_FUNCIONARIO '+
    ' FROM TB_FUNCIONARIO','COD_FUNCIONARIO = '+Trim(QExameFuncionarioCod_Funcionario.text));
end;

end.
