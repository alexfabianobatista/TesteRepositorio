unit UPais_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMPais = class(TDataModule)
    DSPais: TDataSource;
    DSPaisCons: TDataSource;
    QPais: TOracleDataSet1;
    QPaisCOD_PAIS: TIntegerField;
    QPaisDESC_PAIS: TStringField;
    QPaisCons: TOracleDataSet1;
    QPaisConsCOD_PAIS: TIntegerField;
    QPaisConsDESC_PAIS: TStringField;
    QRPais: TOracleDataSet1;
    QRPaisCOD_PAIS: TIntegerField;
    QRPaisDESC_PAIS: TStringField;
    QPaisCOD_PAIS_IBGE: TIntegerField;
    QPaisCOD_PAIS_SISCOMEX: TIntegerField;
    procedure QPaisAfterInsert(DataSet: TDataSet);
    procedure QPaisAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPais: TDMPais;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMPais.QPaisAfterInsert(DataSet: TDataSet);
begin
  QPaisCod_Pais.Value := DMOracle.Sequencia('PAIS');
end;

procedure TDMPais.QPaisAfterPost(DataSet: TDataSet);
begin
  QPais.SetVariable('PK',QPaisCod_Pais.Value);
end;

end.
