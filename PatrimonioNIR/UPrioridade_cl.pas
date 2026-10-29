unit UPrioridade_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMPrioridade = class(TDataModule)
    QPrioridade: TOracleDataSet1;
    QPrioridadeCOD_PRIORIDADE: TStringField;
    QPrioridadeDESC_PRIORIDADE: TStringField;
    QPrioridadeCons: TOracleDataSet1;
    QPrioridadeConsCOD_PRIORIDADE: TStringField;
    QPrioridadeConsDESC_PRIORIDADE: TStringField;
    QRPrioridade: TOracleDataSet1;
    QRPrioridadeCOD_PRIORIDADE: TStringField;
    QRPrioridadeDESC_PRIORIDADE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPrioridade: TDMPrioridade;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
