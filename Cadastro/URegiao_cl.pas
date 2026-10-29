unit URegiao_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMRegiao = class(TDataModule)
    DSRegiao: TDataSource;
    DSRegiaoCons: TDataSource;
    DSRegiaoAll: TDataSource;
    QRegiao: TOracleDataSet1;
    QRegiaoCOD_REGIAO: TIntegerField;
    QRegiaoDESC_REGIAO: TStringField;
    QRegiaoCons: TOracleDataSet1;
    QRegiaoConsCOD_REGIAO: TIntegerField;
    QRegiaoConsDESC_REGIAO: TStringField;
    QRegiaoAll: TOracleDataSet1;
    QRegiaoAllCOD_REGIAO: TIntegerField;
    QRegiaoAllDESC_REGIAO: TStringField;
    QRegiaoQT_POPULACAO: TFloatField;
    QRegiaoAllIND_SINC_MAX_ROTEIRIZADOR: TStringField;
    procedure QRegiaoAfterInsert(DataSet: TDataSet);
    procedure QRegiaoAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRegiao: TDMRegiao;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMRegiao.QRegiaoAfterInsert(DataSet: TDataSet);
begin
  QRegiaoCod_Regiao.Value := DMOracle.Sequencia('REGIAO');
end;

procedure TDMRegiao.QRegiaoAfterPost(DataSet: TDataSet);
begin
  QRegiao.SetVariable('PK',QRegiaoCod_Regiao.Value);
end;

end.
