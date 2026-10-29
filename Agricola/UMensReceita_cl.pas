unit UMensReceita_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMMensReceita = class(TDataModule)
    QMensReceitaCons: TOracleDataSet1;
    QMensReceita: TOracleDataSet1;
    QMensReceitaConsCOD_MENS_RECEITA: TIntegerField;
    QMensReceitaConsDESC_PRECAUCAO: TStringField;
    QMensReceitaConsDESC_SOCORRO: TStringField;
    QMensReceitaCOD_MENS_RECEITA: TIntegerField;
    QMensReceitaDESC_PRECAUCAO: TStringField;
    QMensReceitaDESC_SOCORRO: TStringField;
    procedure QMensReceitaAfterInsert(DataSet: TDataSet);
    procedure QMensReceitaAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMensReceita: TDMMensReceita;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMMensReceita.QMensReceitaAfterInsert(DataSet: TDataSet);
begin
//     QMensReceitaCod_Mens_Receita.Value := DMOracle.Sequencia('MENSRECEITA');
end;

procedure TDMMensReceita.QMensReceitaAfterPost(DataSet: TDataSet);
var wCodigo:Integer;
begin
   wCodigo := QMensReceitaCod_Mens_Receita.Value;
   QMensReceita.Close;
   QMensReceita.SetVariable('PK',wCodigo);
   QMensReceita.Open;

end;

end.
