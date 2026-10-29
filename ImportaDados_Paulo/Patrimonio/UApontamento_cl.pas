unit UApontamento_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMApontamento = class(TDataModule)
    QApontamento: TOracleDataSet1;
    QApontamentoCOD_MARCACAO_HORA: TIntegerField;
    QApontamentoNUM_OS_CAB: TIntegerField;
    QApontamentodesc_atividade: TStringField;
    QApontamentodesc_os: TStringField;
    QApontamentoCOD_ATIVIDADE_CAB: TIntegerField;
    QApontamentoDESC_ESPERA: TStringField;
    QApontamentoDESC_HORA_ESPERA_INI: TStringField;
    QApontamentoDESC_HORA_ESPERA_TERMINO: TStringField;
    QApontamentoDT_MARCACAO_HORA: TDateTimeField;
    QApontamentoCons: TOracleDataSet1;
    QApontamentoConsCOD_MARCACAO_HORA: TIntegerField;
    QApontamentoConsCOD_ATIVIDADE_CAB: TIntegerField;
    QApontamentoConsNUM_OS_CAB: TIntegerField;
    QApontamentoConsDESC_HORA_INI: TStringField;
    QApontamentoConsDESC_HORA_TERMINO: TStringField;
    QApontamentoConsDESC_ESPERA: TStringField;
    QApontamentoConsDESC_HORA_ESPERA_INI: TStringField;
    QApontamentoConsDESC_HORA_ESPERA_TERMINO: TStringField;
    QApontamentoConsDT_MARCACAO_HORA: TDateTimeField;
    QRApontamento: TOracleDataSet1;
    QRApontamentoCOD_MARCACAO_HORA: TIntegerField;
    QRApontamentoCOD_ATIVIDADE_CAB: TIntegerField;
    QRApontamentoNUM_OS_CAB: TIntegerField;
    QRApontamentoDESC_ESPERA: TStringField;
    QRApontamentoDESC_HORA_ESPERA_INI: TStringField;
    QRApontamentoDESC_HORA_ESPERA_TERMINO: TStringField;
    QRApontamentoDT_MARCACAO_HORA: TDateTimeField;
    QApontamentoDESC_HORA_INI: TStringField;
    QApontamentoDESC_HORA_TERMINO: TStringField;
    QRApontamentoDESC_HORA_INI: TStringField;
    QRApontamentoDESC_HORA_TERMINO: TStringField;
    QApontamentoCOD_FUNCIONARIO: TIntegerField;
    QApontamentodesc_funcionario: TStringField;
    QApontamentoConsCOD_FUNCIONARIO: TIntegerField;
    QApontamentoConsDESC_FUNCIONARIO: TStringField;
    QRApontamentoCOD_FUNCIONARIO: TIntegerField;
    QRApontamentoDESC_FUNCIONARIO: TStringField;
    procedure QApontamentoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMApontamento: TDMApontamento;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMApontamento.QApontamentoCalcFields(DataSet: TDataSet);
begin
  if QApontamentoCod_Funcionario.Text <> '' then
    QApontamentoDesc_Funcionario.Value:=DMOracle.BuscaNome('SELECT DESC_FUNCIONARIO FROM TB_FUNCIONARIO','COD_FUNCIONARIO = '+IntToStr(QApontamentoCod_Funcionario.Value));
  if QApontamentoCod_Atividade_Cab.Text <> '' then
    QApontamentoDesc_Atividade.Value:=DMOracle.BuscaNome('SELECT DESC_ATIVIDADE FROM TB_ATIVIDADE_CAB',' COD_ATIVIDADE_CAB = '+IntToStr(QApontamentoCod_Atividade_cab.Value));
  if QApontamentoNum_OS_Cab.Text <> '' then
    QApontamentoDesc_os.Value:=DMOracle.BuscaNome('SELECT DESC_OS_PATRIMONIO FROM TB_OS_PATRIMONIO_CAB',' NUM_OS_CAB = '+IntToStr(QApontamentoNum_OS_Cab.Value));
end;

end.
