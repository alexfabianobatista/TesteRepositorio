unit UMedico_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMMedico = class(TDataModule)
    QMedico: TOracleDataSet1;
    QMedicoCOD_MEDICO: TIntegerField;
    QMedicoNOME: TStringField;
    QMedicoDESC_CRM: TStringField;
    QMedicoCons: TOracleDataSet1;
    QMedicoConsCOD_MEDICO: TIntegerField;
    QMedicoConsNOME: TStringField;
    QMedicoConsDESC_CRM: TStringField;
    QMedicoConsDESC_CPF: TStringField;
    QRMedico: TOracleDataSet1;
    QRMedicoCOD_MEDICO: TIntegerField;
    QRMedicoNOME: TStringField;
    QRMedicoDESC_CRM: TStringField;
    QRMedicoDESC_CPF: TStringField;
    QMedicoDESC_CNPJ: TStringField;
    QMedicoConsDESC_CNPJ: TStringField;
    QMedicoDESC_CPF: TStringField;
    QRMedicoDESC_CNPJ: TStringField;
    procedure QMedicoBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMedico: TDMMedico;

implementation

uses UOracle_cl, MaskUtils;

{$R *.dfm}

procedure TDMMedico.QMedicoBeforePost(DataSet: TDataSet);
begin
  MaskNoSave := 'N';
end;

end.
