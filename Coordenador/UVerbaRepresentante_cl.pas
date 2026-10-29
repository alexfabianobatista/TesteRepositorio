unit UVerbaRepresentante_cl;

interface
 
uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMVerbaRepresentante = class(TDataModule)
    QVerbaRepresentante_Cad: TOracleDataSet1;
    QVerbaRepresentante_CadCOD_VERBA_REPRESENTANTE: TIntegerField;
    QVerbaRepresentante_CadCOD_VENDEDOR: TIntegerField;
    QVerbaRepresentante_CadNUM_ANO: TIntegerField;
    QVerbaRepresentante_CadNUM_MES: TIntegerField;
    QVerbaRepresentante_CadVAL_VERBA: TFloatField;
    QVerbaVendedor: TOracleDataSet1;
    QVerbaVendedorCOD_VERBA_REPRESENTANTE: TIntegerField;
    QVerbaVendedorCOD_VENDEDOR: TIntegerField;
    QVerbaVendedorNUM_ANO: TIntegerField;
    QVerbaVendedorNUM_MES: TIntegerField;
    QVerbaVendedorVAL_VERBA: TFloatField;
    QVerbaVendedorVAL_UTILIZADO: TFloatField;
    QVerbaVendedor_All: TOracleDataSet1;
    QVerbaVendedor_AllCOD_VENDEDOR: TFloatField;
    QVerbaVendedor_AllNOME: TStringField;
    QVerbaVendedor_AllVAL_VERBA: TFloatField;
    QVerbaVendedor_AllVAL_UTILIZADO: TFloatField;
    QVerbaVendedor_AllCOD_VERBA_REPRESENTANTE: TFloatField;
    QRVerbaRepresentante: TOracleDataSet1;
    QRVerbaRepresentanteVAL_VERBA: TFloatField;
    QRVerbaRepresentanteNOME: TStringField;
    QRVerbaVendedor: TOracleDataSet1;
    QRVerbaRepresentanteCOD_VENDEDOR: TIntegerField;
    QVerbaRepresentanteCons: TOracleDataSet1;
    QVerbaRepresentanteConsCOD_VERBA_REPRESENTANTE: TIntegerField;
    QVerbaRepresentanteConsCOD_VENDEDOR: TIntegerField;
    QVerbaRepresentanteConsNUM_ANO: TIntegerField;
    QVerbaRepresentanteConsNUM_MES: TIntegerField;
    QVerbaRepresentanteConsVAL_VERBA: TFloatField;
    QVerbaVendedorCons: TOracleDataSet1;
    QRVerbaVendedorCOD_VENDEDOR: TIntegerField;
    QRVerbaVendedorNUM_ANO: TIntegerField;
    QRVerbaVendedorNUM_MES: TIntegerField;
    QRVerbaVendedorVAL_VERBA: TFloatField;
    QRVerbaVendedorVAL_UTILIZADO: TFloatField;
    QRVerbaVendedorCOD_VERBA_REPRESENTANTE: TIntegerField;
    QRVerbaVendedorNOME: TStringField;
    QRVerbaVendedorVAL_VERBA_REPRESENTANTE: TFloatField;
    QRVerbaVendedorCOD_REPRESENTANTE: TIntegerField;
    QVerbaVendedorConsCOD_VENDEDOR: TIntegerField;
    QVerbaVendedorConsNUM_ANO: TIntegerField;
    QVerbaVendedorConsNUM_MES: TIntegerField;
    QVerbaVendedorConsVAL_VERBA: TFloatField;
    QVerbaVendedorConsNOME: TStringField;
    QVerbaVendedorConsCOD_SUPERVISOR: TIntegerField;
    QVerbaVendedorConsVAL_UTILIZADO: TFloatField;
    QVerbaVendedorConsCOD_VERBA_REPRESENTANTE: TIntegerField;
    procedure QVerbaVendedorAfterCancel(DataSet: TDataSet);
    procedure QVerbaVendedorAfterDelete(DataSet: TDataSet);
    procedure QVerbaVendedorBeforeDelete(DataSet: TDataSet);
    procedure QVerbaVendedorBeforeEdit(DataSet: TDataSet);
    procedure QVerbaVendedorBeforeInsert(DataSet: TDataSet);
    procedure QVerbaVendedorDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure QVerbaVendedorAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMVerbaRepresentante: TDMVerbaRepresentante;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TDMVerbaRepresentante.QVerbaVendedorAfterCancel(
  DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
end;

procedure TDMVerbaRepresentante.QVerbaVendedorAfterDelete(
  DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Commit;

end;

procedure TDMVerbaRepresentante.QVerbaVendedorBeforeDelete(
  DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;

end;

procedure TDMVerbaRepresentante.QVerbaVendedorBeforeEdit(
  DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;

end;

procedure TDMVerbaRepresentante.QVerbaVendedorBeforeInsert(
  DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;

end;

procedure TDMVerbaRepresentante.QVerbaVendedorDeleteError(
  DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  DMOracle.DBCemapa.Rollback;

end;

procedure TDMVerbaRepresentante.QVerbaVendedorAfterPost(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Commit;

end;

end.
