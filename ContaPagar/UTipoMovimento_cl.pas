unit UTipoMovimento_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDMTipoMovimento = class(TDataModule)
    QTipoMovimento: TQuery;
    QTipoMovimentoCOD_TIPO_MOVIMENTO: TFloatField;
    QTipoMovimentoDESC_TIPO_MOVIMENTO: TStringField;
    QTipoMovimentoIND_OPERACAO: TStringField;
    QTipoMovimentoCons: TQuery;
    DSTipoMovimentoCons: TDataSource;
    QTipoMovimentoConsCOD_TIPO_MOVIMENTO: TFloatField;
    QTipoMovimentoConsDESC_TIPO_MOVIMENTO: TStringField;
    procedure QTipoMovimentoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTipoMovimento: TDMTipoMovimento;

implementation

{$R *.DFM}

procedure TDMTipoMovimento.QTipoMovimentoAfterInsert(DataSet: TDataSet);
begin
  QTipoMovimentoInd_Operacao.Value:='+';
end;

end.
