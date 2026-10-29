unit UAreaCultivar_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMAreaCultivar = class(TDataModule)
    QAreaCultivar: TOracleDataSet1;
    QAreaCultivarCOD_AREA_CULTIVAR: TIntegerField;
    QAreaCultivarCOD_PLANTIO_SAFRA: TIntegerField;
    QAreaCultivarVAL_AREA_CULTIVAR: TFloatField;
    QAreaCultivardesc_produto: TStringField;
    QAreaCultivardesc_safra: TStringField;
    DSAreaCultivar: TDataSource;
    QExibeArea: TOracleDataSet1;
    QAreaCultivarCOD_PRODUTO: TFloatField;
    QAreaCultivarCons: TOracleDataSet1;
    QExibeAreaDESC_SAFRA: TStringField;
    QExibeAreaVAL_AREA_CULTIVAR: TFloatField;
    QAreaCultivarConsDESC_SAFRA: TStringField;
    QAreaCultivarConsVAL_AREA_CULTIVAR: TFloatField;
    QExibeAreaDESC_COMPLEMENTO_2: TStringField;
    QAreaCultivarConsDESC_COMPLEMENTO_2: TStringField;
    QAreaCultivarConsCOD_AREA_CULTIVAR: TIntegerField;
    procedure QAreaCultivarCalcFields(DataSet: TDataSet);
    procedure QAreaCultivarBeforeOpen(DataSet: TDataSet);
    procedure QAreaCultivarAfterEdit(DataSet: TDataSet);
    procedure QAreaCultivarAfterPost(DataSet: TDataSet);
    procedure QAreaCultivarAfterDelete(DataSet: TDataSet);
    procedure QAreaCultivarAfterCancel(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMAreaCultivar: TDMAreaCultivar;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMAreaCultivar.QAreaCultivarCalcFields(DataSet: TDataSet);
begin
  if QAreaCultivarCod_Produto.Text <> '' then
    QAreaCultivarDesc_Produto.Value:=DMOracle.BuscaNome('SELECT TB_PRODUTO.DESC_COMPLEMENTO_2 FROM TB_PRODUTO','COD_PRODUTO = '+Trim(QAreaCultivarCod_Produto.Text));
  if QAreaCultivarCod_Plantio_Safra.Text <> '' then
    QAreaCultivarDesc_Safra.Value:= DMOracle.BuscaNome('SELECT TB_PLANTIO_SAFRA.DESC_SAFRA FROM TB_PLANTIO_SAFRA','COD_PLANTIO_SAFRA = '+Trim(IntToStr(QAreaCultivarCod_Plantio_Safra.Value)));
    
end;

procedure TDMAreaCultivar.QAreaCultivarBeforeOpen(DataSet: TDataSet);
begin
  with DMAreaCultivar do
  begin
    QExibeArea.Close;
    QExibeArea.SetVariable('COD_PLANTIO_SAFRA',IntToStr(QAreaCultivarCod_Plantio_Safra.Value));
    QExibeArea.Open;
  end;
end;

procedure TDMAreaCultivar.QAreaCultivarAfterEdit(DataSet: TDataSet);
begin
  with DMAreaCultivar do
  begin
    QExibeArea.Close;
    QExibeArea.SetVariable('COD_PLANTIO_SAFRA',IntToStr(QAreaCultivarCod_Plantio_Safra.Value));
    QExibeArea.Open;
  end;
end;

procedure TDMAreaCultivar.QAreaCultivarAfterPost(DataSet: TDataSet);
begin
  with DMAreaCultivar do
  begin
    QExibeArea.Close;
    QExibeArea.SetVariable('COD_PLANTIO_SAFRA',IntToStr(QAreaCultivarCod_Plantio_Safra.Value));
    QExibeArea.Open;
  end;
end;

procedure TDMAreaCultivar.QAreaCultivarAfterDelete(DataSet: TDataSet);
begin
  with DMAreaCultivar do
  begin
    QExibeArea.Close;
    QExibeArea.SetVariable('COD_PLANTIO_SAFRA',IntToStr(QAreaCultivarCod_Plantio_Safra.Value));
    QExibeArea.Open;
  end;
end;

procedure TDMAreaCultivar.QAreaCultivarAfterCancel(DataSet: TDataSet);
begin
  with DMAreaCultivar do
  begin
    QExibeArea.Close;
    QExibeArea.SetVariable('COD_PLANTIO_SAFRA',IntToStr(QAreaCultivarCod_Plantio_Safra.Value));
    QExibeArea.Open;
  end;
end;

end.
