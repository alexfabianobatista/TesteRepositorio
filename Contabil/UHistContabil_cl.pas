unit UHistContabil_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMHistContabil = class(TDataModule)
    DSHistContabil: TDataSource;
    DSHistContabilCons: TDataSource;
    QHistContabil: TOracleDataSet1;
    QHistContabilCOD_HISTORICO_CONTABIL: TIntegerField;
    QHistContabilDESC_HISTORICO_CONTABIL: TStringField;
    QHistContabilCons: TOracleDataSet1;
    QHistContabilConsCOD_HISTORICO_CONTABIL: TIntegerField;
    QHistContabilConsDESC_HISTORICO_CONTABIL: TStringField;
    QRHistContabil: TOracleDataSet1;
    QRHistContabilCOD_HISTORICO_CONTABIL: TIntegerField;
    QRHistContabilDESC_HISTORICO_CONTABIL: TStringField;
    procedure QHistContabilAfterInsert(DataSet: TDataSet);
    procedure QHistContabilAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMHistContabil: TDMHistContabil;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMHistContabil.QHistContabilAfterInsert(DataSet: TDataSet);
begin
//  QHistContabilCod_Historico_Contabil.Value := DMOracle.Sequencia('HISTORICO_CONTABIL');
end;

procedure TDMHistContabil.QHistContabilAfterPost(DataSet: TDataSet);
begin
  QHistContabil.SetVariable('PK',QHistContabilCod_Historico_Contabil.Value);
end;

end.
 