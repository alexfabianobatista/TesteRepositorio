unit UNBS_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMNbs = class(TDataModule)
    QNBS_Cons: TOracleDataSet1;
    QNBS_ConsCOD_NBS: TIntegerField;
    QNBS_ConsDESC_NBS: TStringField;
    QNBS_Cad: TOracleDataSet1;
    QNBS_CadCOD_NBS: TIntegerField;
    QNBS_CadDESC_NBS: TStringField;
    QNBS_CadPERC_TRIBUTO_NACIONAL: TFloatField;
    QNBS_CadPERC_TRIBUTO_IMPORTADO: TFloatField;
    QNBS_CadCOD_USUARIO: TIntegerField;
    QNBS_CadPERC_CBS: TFloatField;
    QNBS_CadDT_VIGENCIA_INI: TDateTimeField;
    QNBS_CadDT_VIGENCIA_FIM: TDateTimeField;
    procedure QNBS_CadBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMNbs: TDMNbs;

implementation

Uses UOracle_cl, UUsuario_cl;

{$R *.dfm}

procedure TDMNbs.QNBS_CadBeforePost(DataSet: TDataSet);
begin
  QNBS_CadCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

end.
