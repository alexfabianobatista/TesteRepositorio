unit UCultura_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMCultura = class(TDataModule)
    QCulturaCons: TOracleDataSet1;
    QCulturaConsCOD_CULTURA: TIntegerField;
    QCulturaConsDESC_CULTURA: TStringField;
    QCultura: TOracleDataSet1;
    QCulturaCOD_CULTURA: TIntegerField;
    QCulturaDESC_CULTURA: TStringField;
    QCulturaCOD_CULTURA_SIAGRO: TIntegerField;
    procedure QCulturaAfterInsert(DataSet: TDataSet);
    procedure QCulturaAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCultura: TDMCultura;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMCultura.QCulturaAfterInsert(DataSet: TDataSet);
begin
  //QCulturaCod_Cultura.Value := DMOracle.Sequencia('CULTURA');
end;

procedure TDMCultura.QCulturaAfterPost(DataSet: TDataSet);
var wCodigo:Integer;
begin
   wCodigo := QCulturaCod_Cultura.Value;
   QCultura.Close;
   QCultura.SetVariable('PK',wCodigo);
   QCultura.Open;

end;

end.
