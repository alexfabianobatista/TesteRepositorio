unit UFuncionario_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMFuncionario = class(TDataModule)
    QFuncionario: TOracleDataSet1;
    QFuncionariodesc_categoria: TStringField;
    QFuncionarioCons: TOracleDataSet1;
    QFuncionarioConsCOD_FUNCIONARIO: TIntegerField;
    QFuncionarioConsDESC_FUNCIONARIO: TStringField;
    QFuncionarioConsCOD_CATEGORIA: TStringField;
    QRFuncionario: TOracleDataSet1;
    QRFuncionarioCOD_FUNCIONARIO: TIntegerField;
    QRFuncionarioDESC_FUNCIONARIO: TStringField;
    QRFuncionarioCOD_CATEGORIA: TStringField;
    QRFuncionarioDESC_CATEGORIA: TStringField;
    QFuncionariodesc_cidade: TStringField;
    QFuncionariodesc_filial: TStringField;
    QFuncionariodesc_departamento: TStringField;
    QFuncionariodesc_estado_civil: TStringField;
    QFuncionariodesc_funcao_funcionario: TStringField;
    QRFuncionarioDESC_TELEFONE: TStringField;
    QRFuncionarioIND_SITUACAO: TStringField;
    QDependente: TOracleDataSet1;
    QDependenteCOD_DEPENDENTE: TIntegerField;
    QDependenteCOD_FUNCIONARIO: TIntegerField;
    QDependenteNOME: TStringField;
    QDependenteDT_NASCIMENTO: TDateTimeField;
    DSDependente: TDataSource;
    QRExameFuncionario: TOracleDataSet1;
    QRExameFuncionarioCOD_EXAME_FUNCIONARIO: TIntegerField;
    QRExameFuncionarioCOD_TIPO_EXAME: TIntegerField;
    QRExameFuncionarioDESC_TIPO_EXAME: TStringField;
    QRExameFuncionarioCOD_EXAME: TIntegerField;
    QRExameFuncionarioDESC_EXAME: TStringField;
    QRExameFuncionarioCOD_FUNCIONARIO: TIntegerField;
    QRExameFuncionarioDESC_FUNCIONARIO: TStringField;
    QRExameFuncionarioCOD_FILIAL: TIntegerField;
    QRExameFuncionarioDESC_FILIAL: TStringField;
    QRExameFuncionarioDT_EXAME: TDateTimeField;
    QRExameFuncionarioID_EXAME: TStringField;
    QRFuncionarioFuncao: TOracleDataSet1;
    QRFuncionarioFuncaoCOD_FUNCIONARIO: TIntegerField;
    QRFuncionarioFuncaoDESC_FUNCIONARIO: TStringField;
    QRFuncionarioFuncaoDESC_TELEFONE: TStringField;
    QRFuncionarioFuncaoCOD_FILIAL: TIntegerField;
    QRFuncionarioFuncaoDESC_FILIAL: TStringField;
    QRFuncionarioFuncaoCOD_FUNCAO_FUNCIONARIO: TIntegerField;
    QRFuncionarioFuncaoDESC_FUNCAO_FUNCIONARIO: TStringField;
    QRFuncionarioFuncaoIND_SITUACAO: TStringField;
    QRFuncionarioNUM_CPF: TStringField;
    QRFuncionarioNUM_RG: TStringField;
    QRFuncionarioDT_NASCIMENTO: TDateTimeField;
    QFuncionarioCOD_FUNCIONARIO: TIntegerField;
    QFuncionarioDESC_FUNCIONARIO: TStringField;
    QFuncionarioCOD_CATEGORIA: TStringField;
    QFuncionarioDESC_TELEFONE: TStringField;
    QFuncionarioDESC_CELULAR: TStringField;
    QFuncionarioDESC_EMAIL: TStringField;
    QFuncionarioDESC_HORA_INICIO: TStringField;
    QFuncionarioDESC_HORA_TERMINO: TStringField;
    QFuncionarioNUM_MINISTERIO: TIntegerField;
    QFuncionarioNUM_REG_CREA: TStringField;
    QFuncionarioDESC_ENDERECO: TStringField;
    QFuncionarioCOD_CIDADE: TIntegerField;
    QFuncionarioCOD_FILIAL: TIntegerField;
    QFuncionarioCOD_DEPARTAMENTO: TIntegerField;
    QFuncionarioNUM_CPF: TStringField;
    QFuncionarioNUM_RG: TStringField;
    QFuncionarioNUM_PIS: TStringField;
    QFuncionarioNUM_CARTEIRA_TRAB: TStringField;
    QFuncionarioCOD_ESTADO_CIVIL: TIntegerField;
    QFuncionarioCOD_FUNCAO_FUNCIONARIO: TIntegerField;
    QFuncionarioDT_ADMISSAO: TDateTimeField;
    QFuncionarioDT_DEMISSAO: TDateTimeField;
    QFuncionarioNUM_FILHOS: TIntegerField;
    QFuncionarioDESC_GRAU_INSTRUCAO: TStringField;
    QFuncionarioIND_TIPO_FUNCIONARIO: TStringField;
    QFuncionarioDT_NASCIMENTO: TDateTimeField;
    QFuncionarioDESC_NOME_CONJUGE: TStringField;
    QFuncionarioDT_NASCIMENTO_CONJUGE: TDateTimeField;
    QFuncionarioDESC_ALTURA: TFloatField;
    QFuncionarioVAL_PESO: TFloatField;
    QFuncionarioNUM_CALCA: TFloatField;
    QFuncionarioNUM_CAMISA: TFloatField;
    QFuncionarioNUM_CALCADO: TFloatField;
    QFuncionarioIND_SEXO: TStringField;
    QFuncionarioCOR_OLHOS: TStringField;
    QFuncionarioCOR_CABELOS: TStringField;
    QFuncionarioDESC_RACA: TStringField;
    QFuncionarioIND_SITUACAO: TStringField;
    QFuncionarioDESC_NOME_FILHO_1: TStringField;
    QFuncionarioDESC_NOME_FILHO_2: TStringField;
    QFuncionarioDT_NASCIMENTO_FILHO_1: TDateTimeField;
    QFuncionarioDT_NASCIMENTO_FILHO_2: TDateTimeField;
    QFuncionarioVAL_SALARIO: TFloatField;
    QFuncionarioNUM_TITULO_ELEITOR: TStringField;
    QFuncionarioTAM_CAMISA: TStringField;
    QFuncionarioNUM_RENASEM: TStringField;
    procedure QFuncionarioCalcFields(DataSet: TDataSet);
    procedure QDependenteAfterInsert(DataSet: TDataSet);
    procedure QDependenteBeforePost(DataSet: TDataSet);
    procedure QDependenteBeforeEdit(DataSet: TDataSet);
    procedure QDependenteBeforeInsert(DataSet: TDataSet);
    procedure QFuncionarioAfterPost(DataSet: TDataSet);
    procedure QFuncionarioBeforeCancel(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMFuncionario: TDMFuncionario;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMFuncionario.QFuncionarioCalcFields(DataSet: TDataSet);
begin
  if Trim(QFuncionarioCod_Categoria.text) <> '' then
    QFuncionarioDesc_Categoria.Value := DMOracle.BuscaNome('SELECT DESC_CATEGORIA '+
        'FROM TB_CATEGORIA_PROFISSIONAL','COD_CATEGORIA = '+Chr(39)+QFuncionarioCod_Categoria.Value+Chr(39));
  if Trim(QFuncionarioCod_Cidade.text) <> '' then
    QFuncionarioDesc_Cidade.Value := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CIDADE',
        'COD_CIDADE = '+Trim(QFuncionarioCod_Cidade.text));
  if Trim(QFuncionarioCod_Filial.text) <> '' then
    QFuncionarioDesc_Filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
        'COD_FILIAL = '+Trim(QFuncionarioCod_Filial.text));
  if Trim(QFuncionarioCod_Departamento.text) <> '' then
    QFuncionarioDesc_Departamento.Value := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO',
        'COD_DEPARTAMENTO = '+Trim(QFuncionarioCod_Departamento.text));
  if Trim(QFuncionarioCod_Funcao_Funcionario.text) <> '' then
    QFuncionarioDesc_Funcao_Funcionario.Value := DMOracle.BuscaNome('SELECT DESC_FUNCAO_FUNCIONARIO FROM TB_FUNCAO_FUNCIONARIO',
        'COD_FUNCAO_FUNCIONARIO = '+Trim(QFuncionarioCod_Funcao_Funcionario.text));
  if Trim(QFuncionarioCod_Estado_Civil.text) <> '' then
    QFuncionarioDesc_Estado_Civil.Value := DMOracle.BuscaNome('SELECT DESC_ESTADO_CIVIL FROM TB_ESTADO_CIVIL',
        'COD_ESTADO_CIVIL = '+Trim(QFuncionarioCod_Estado_Civil.text));
end;
procedure TDMFuncionario.QDependenteAfterInsert(DataSet: TDataSet);
begin
  if Trim(QFuncionarioCOD_FUNCIONARIO.Text) = '' then
    Raise Exception.Create('Informe o Funcionário');
  QDependenteCOD_FUNCIONARIO.Value := QFuncionarioCOD_FUNCIONARIO.Value;
end;

procedure TDMFuncionario.QDependenteBeforePost(DataSet: TDataSet);
begin
  if QFuncionario.State in [DSInsert] then
  begin
    QFuncionario.Post;
    QFuncionario.Edit;
  end;
end;

procedure TDMFuncionario.QDependenteBeforeEdit(DataSet: TDataSet);
begin
  if not(QFuncionario.State in [DSEdit]) then
    Raise Exception.Create('Funcionário não está em modo de Alteração');
end;

procedure TDMFuncionario.QDependenteBeforeInsert(DataSet: TDataSet);
begin
  if not(QFuncionario.State in [DSInsert,DSEdit]) then
    Raise Exception.Create('Funcionário não está modo de Inserção ou Alteração');
end;

procedure TDMFuncionario.QFuncionarioAfterPost(DataSet: TDataSet);
begin
  if QDependente.State in [DSInsert,DSEdit] then
    QDependente.Post;
end;

procedure TDMFuncionario.QFuncionarioBeforeCancel(DataSet: TDataSet);
begin
  if QDependente.State in [DSInsert,DSEdit] then
    QDependente.cancel;
end;

end.
