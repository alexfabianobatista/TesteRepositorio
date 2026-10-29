unit UMarca_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMMarca = class(TDataModule)
    QMarca: TOracleDataSet1;
    QMarcaCOD_MARCA: TIntegerField;
    QMarcaDESC_MARCA: TStringField;
    QMarcaCons: TOracleDataSet1;
    QMarcaConsCOD_MARCA: TIntegerField;
    QMarcaConsDESC_MARCA: TStringField;
    QRMarca: TOracleDataSet1;
    QRMarcaCOD_MARCA: TIntegerField;
    QRMarcaDESC_MARCA: TStringField;
    QMarcaDESC_MOTOR: TStringField;
    procedure QMarcaBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMarca: TDMMarca;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMMarca.QMarcaBeforeInsert(DataSet: TDataSet);
begin
//  DMOracle.DBCemapa.StartTransaction;
end;

end.
