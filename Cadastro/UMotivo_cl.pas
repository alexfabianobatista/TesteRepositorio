unit UMotivo_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMMotivo = class(TDataModule)
    DSMotivo: TDataSource;
    DSMotivoCons: TDataSource;
    QMotivo: TOracleDataSet1;
    QMotivoCOD_MOTIVO: TIntegerField;
    QMotivoDESC_MOTIVO: TStringField;
    QMotivoIND_LIVRO_FISCAL: TStringField;
    QMotivoCons: TOracleDataSet1;
    QMotivoConsCOD_MOTIVO: TIntegerField;
    QMotivoConsDESC_MOTIVO: TStringField;
    QRMotivo: TOracleDataSet1;
    QRMotivoCOD_MOTIVO: TIntegerField;
    QRMotivoDESC_MOTIVO: TStringField;
    QRMotivoIND_SINC_MAX_ROTEIRIZADOR: TStringField;
    procedure QMotivoAfterInsert(DataSet: TDataSet);
    procedure QMotivoAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMotivo: TDMMotivo;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMMotivo.QMotivoAfterInsert(DataSet: TDataSet);
begin
  QMotivoCod_Motivo.Value := DMOracle.Sequencia('MOTIVO');
end;

procedure TDMMotivo.QMotivoAfterPost(DataSet: TDataSet);
begin
  QMotivo.SetVariable('PK',QMotivoCod_Motivo.Value);
end;

end.
