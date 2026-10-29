unit UTipoPropriedade_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMTipoPropriedade = class(TDataModule)
    DSTipoPropriedade: TDataSource;
    DSTipoPropriedadeCons: TDataSource;
    QTipoPropriedade: TOracleDataSet1;
    QTipoPropriedadeCons: TOracleDataSet1;
    QTipoPropriedadeConsCOD_TIPO_PROPRIEDADE: TIntegerField;
    QTipoPropriedadeConsDESC_TIPO_PROPRIEDADE: TStringField;
    QRTipoPropriedade: TOracleDataSet1;
    QRTipoPropriedadeCOD_TIPO_PROPRIEDADE: TIntegerField;
    QRTipoPropriedadeDESC_TIPO_PROPRIEDADE: TStringField;
    QTipoPropriedadeCOD_TIPO_PROPRIEDADE: TIntegerField;
    QTipoPropriedadeDESC_TIPO_PROPRIEDADE: TStringField;
    procedure QTipoPropriedadeAfterInsert(DataSet: TDataSet);
    procedure QTipoPropriedadeAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTipoPropriedade: TDMTipoPropriedade;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMTipoPropriedade.QTipoPropriedadeAfterInsert(
  DataSet: TDataSet);
begin
  QTipoPropriedadeCod_Tipo_Propriedade.Value := DMOracle.Sequencia('TIPO_PROPRIEDADE');
end;

procedure TDMTipoPropriedade.QTipoPropriedadeAfterPost(DataSet: TDataSet);
begin
  QTipoPropriedade.SetVariable('PK',QTipoPropriedadeCod_Tipo_Propriedade.Value);
end;

end.
