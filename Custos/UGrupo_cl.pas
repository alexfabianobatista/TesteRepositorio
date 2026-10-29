unit UGrupo_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMGrupo = class(TDataModule)
    QGrupo_CustoCons: TOracleDataSet1;
    QGrupo_CustoConsCOD_GRUPO: TIntegerField;
    QGrupo_CustoConsDESC_GRUPO: TStringField;
    QGrupo_CustoCad: TOracleDataSet1;
    QGrupo_CustoCadCOD_GRUPO: TIntegerField;
    QGrupo_CustoCadDESC_GRUPO: TStringField;
    QRGrupo_CustoCad: TOracleDataSet1;
    QRGrupo_CustoCadCOD_GRUPO: TIntegerField;
    QRGrupo_CustoCadDESC_GRUPO: TStringField;
    procedure QGrupo_CustoCadAfterInsert(DataSet: TDataSet);
    procedure QGrupo_CustoCadAfterPost(DataSet: TDataSet);
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

procedure TDMGrupo.QGrupo_CustoCadAfterInsert(DataSet: TDataSet);
begin
//  QGrupo_CustoCadCOD_GRUPO.Value := DMOracle.Sequencia('GRUPO_CUSTOS');
end;

procedure TDMGrupo.QGrupo_CustoCadAfterPost(DataSet: TDataSet);
Var wCod_Grupo : Integer;
begin
  wCod_Grupo := QGrupo_CustoCadCOD_GRUPO.Value;
  QGrupo_CustoCad.Close;
  QGrupo_CustoCad.SetVariable('PK',wCod_Grupo);
  QGrupo_CustoCad.Open;
end;

end.
