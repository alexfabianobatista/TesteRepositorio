unit UNcm_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMNcm = class(TDataModule)
    QNcmCons: TOracleDataSet1;
    QNcmConsCOD_NCM: TIntegerField;
    QNcmConsDESC_NCM: TStringField;
    QNcmConsDESC_UN_MEDIDA: TStringField;
    QNcm: TOracleDataSet1;
    QNcmCOD_NCM: TIntegerField;
    QNcmDESC_NCM: TStringField;
    QNcmDESC_UN_MEDIDA: TStringField;
    QNcmIND_CONTRIB_PREVIDENCIARIA: TStringField;
    QNcmPERC_TRIBUTO_NACIONAL: TFloatField;
    QNcmPERC_TRIBUTO_IMPORTADO: TFloatField;
    QRNcm: TOracleDataSet1;
    QRNcmCOD_NCM: TIntegerField;
    QRNcmDESC_NCM: TStringField;
    QNcmSemSimilarNacCad: TOracleDataSet1;
    QNcmSemSimilarNacCons: TOracleDataSet1;
    QNcmSemSimilarNacCadNUM_NCM: TStringField;
    QNcmSemSimilarNacCadDESC_NCM: TMemoField;
    QNcmSemSimilarNacConsNUM_NCM: TStringField;
    QNcmSemSimilarNacConsDESC_NCM: TMemoField;
    QNcmSemSimilarNacConsdescricao: TStringField;
    QNcmDT_VIGENCIA_INI: TDateTimeField;
    QNcmDT_VIGENCIA_FIM: TDateTimeField;
    QNcmPERC_CBS: TFloatField;
    procedure QNcmBeforePost(DataSet: TDataSet);
    procedure QNcmSemSimilarNacConsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMNcm: TDMNcm;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TDMNcm.QNcmBeforePost(DataSet: TDataSet);
begin
  //if (DMNcm.QNcmCOD_NCM.Validate) then
//    raise Exception.Create('Gênero NCM precisa ter no mínimo 2 e no máximo 8 digitos.');
end;

procedure TDMNcm.QNcmSemSimilarNacConsCalcFields(DataSet: TDataSet);
begin
  QNcmSemSimilarNacConsdescricao.Text :=
    QNcmSemSimilarNacConsDESC_NCM.Value;
end;

end.
