unit UGrupo_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMGrupo = class(TDataModule)
    DSGrupo: TDataSource;
    DSGrupoCons: TDataSource;
    DSUsuarioGrupo: TDataSource;
    USQLUsuarioGrupo: TUpdateSQL;
    DSDireitoGrupo: TDataSource;
    DSDireitoGrupoAll: TDataSource;
    QDireitoGrupoAll: TOracleDataSet1;
    QDireitoGrupo: TOracleDataSet1;
    QDireitoGrupoAllCOD_FUNCAO: TIntegerField;
    QDireitoGrupoAllCOD_GRUPO: TIntegerField;
    QDireitoGrupoAllNOME_FUNCAO: TStringField;
    QDireitoGrupoCOD_FUNCAO: TIntegerField;
    QDireitoGrupoCOD_GRUPO: TIntegerField;
    QRGrupo: TOracleDataSet1;
    QRGrupoCOD_GRUPO: TIntegerField;
    QRGrupoDESC_GRUPOS: TStringField;
    QRGrupo_Usuario: TOracleDataSet1;
    QrGrupo_Funcao: TOracleDataSet1;
    QrGrupo_FuncaoCOD_GRUPO: TIntegerField;
    QrGrupo_FuncaoDESC_GRUPOS: TStringField;
    QrGrupo_FuncaoDESC_TELA: TStringField;
    QrGrupo_FuncaoNOME_FUNCAO: TStringField;
    QRGrupo_UsuarioCOD_GRUPO: TIntegerField;
    QRGrupo_UsuarioDESC_GRUPOS: TStringField;
    QRGrupo_UsuarioNOME: TStringField;
    QGrupo: TOracleDataSet1;
    QGrupoCOD_GRUPO: TIntegerField;
    QGrupoDESC_GRUPOS: TStringField;
    QGrupoDT_CADASTRO: TDateTimeField;
    QGrupoNOME: TStringField;
    QGrupoCons: TOracleDataSet1;
    QUsuarioGrupo: TOracleDataSet1;
    QUsuarioGrupoCOD_GRUPO: TIntegerField;
    QUsuarioGrupoCOD_USUARIO: TIntegerField;
    QUsuarioGrupoDT_LIBERACAO: TDateTimeField;
    QUsuarioGrupoNOME: TStringField;
    QUsuarioGrupoIns: TOracleDataSet1;
    QUsuarioGrupoInsCOD_GRUPO: TIntegerField;
    QUsuarioGrupoInsCOD_USUARIO: TIntegerField;
    QUsuarioGrupoInsDT_LIBERACAO: TDateTimeField;
    QRUsuarioGrupo: TOracleDataSet1;
    QRFuncaoGrupo: TOracleDataSet1;
    QRGrupo_UsuarioCOD_USUARIO: TIntegerField;
    QGrupoConsCOD_GRUPO: TIntegerField;
    QGrupoConsNOME: TStringField;
    QGrupoConsDESC_GRUPOS: TStringField;
    procedure QGrupoAfterInsert(DataSet: TDataSet);
    procedure QGrupoAfterPost(DataSet: TDataSet);
    procedure QDireitoGrupoAfterPost(DataSet: TDataSet);
    procedure QGrupoAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMGrupo: TDMGrupo;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMGrupo.QGrupoAfterInsert(DataSet: TDataSet);
begin
  QGrupoDt_Cadastro.Value := DMOracle.DataServ;
end;

procedure TDMGrupo.QGrupoAfterPost(DataSet: TDataSet);
Var Codigo : Integer;
begin
  Codigo := QGrupoCod_Grupo.Value;
  QGrupo.Close;
  QGrupo.SetVariable('PK',Codigo);
  QGrupo.Open;
end;

procedure TDMGrupo.QDireitoGrupoAfterPost(DataSet: TDataSet);
begin
  QDireitoGrupo.Close;
  QDireitoGrupo.Open;
end;

procedure TDMGrupo.QGrupoAfterOpen(DataSet: TDataSet);
begin
  QDireitoGrupoAll.Close;
  QDireitoGrupoAll.SetVariable('COD_GRUPO',QGrupoCOD_GRUPO.Value);
  QDireitoGrupoAll.Open;
end;

end.
