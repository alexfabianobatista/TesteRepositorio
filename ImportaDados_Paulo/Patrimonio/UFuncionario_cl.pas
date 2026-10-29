unit UFuncionario_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMFuncionario = class(TDataModule)
    QFuncionario: TOracleDataSet1;
    QFuncionarioCOD_FUNCIONARIO: TIntegerField;
    QFuncionarioDESC_FUNCIONARIO: TStringField;
    QFuncionariodesc_categoria: TStringField;
    QFuncionarioCons: TOracleDataSet1;
    QFuncionarioConsCOD_FUNCIONARIO: TIntegerField;
    QFuncionarioConsDESC_FUNCIONARIO: TStringField;
    QFuncionarioConsCOD_CATEGORIA: TStringField;
    QRfuncionario: TOracleDataSet1;
    QRfuncionarioCOD_FUNCIONARIO: TIntegerField;
    QRfuncionarioDESC_FUNCIONARIO: TStringField;
    QRfuncionarioCOD_CATEGORIA: TStringField;
    QRfuncionarioDESC_CATEGORIA: TStringField;
    QFuncionarioConsDESC_TELEFONE: TStringField;
    QFuncionarioConsDESC_CELULAR: TStringField;
    QFuncionarioConsDESC_EMAIL: TStringField;
    QFuncionarioConsDESC_HORA_INICIO: TStringField;
    QFuncionarioConsDESC_HORA_TERMINO: TStringField;
    QFuncionarioConsNUM_MINISTERIO: TIntegerField;
    QFuncionarioConsNUM_REG_CREA: TStringField;
    QFuncionarioDESC_TELEFONE: TStringField;
    QFuncionarioDESC_CELULAR: TStringField;
    QFuncionarioDESC_EMAIL: TStringField;
    QFuncionarioDESC_HORA_INICIO: TStringField;
    QFuncionarioDESC_HORA_TERMINO: TStringField;
    QFuncionarioNUM_MINISTERIO: TIntegerField;
    QFuncionarioNUM_REG_CREA: TStringField;
    QFuncionarioCOD_CATEGORIA: TStringField;
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
    procedure QFuncionarioCalcFields(DataSet: TDataSet);
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
  QFuncionarioDesc_Categoria.Value := DMOracle.BuscaNome('SELECT DESC_CATEGORIA FROM TB_CATEGORIA_PROFISSIONAL','COD_CATEGORIA = '+Chr(39)+QFuncionarioCod_Categoria.Value+Chr(39));
end;

end.
