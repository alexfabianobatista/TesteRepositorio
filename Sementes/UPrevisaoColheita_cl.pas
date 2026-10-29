unit UPrevisaoColheita_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMPrevisaoColheita = class(TDataModule)
    QPrevisaoColheita: TOracleDataSet1;
    QPrevisaoColheitaCOD_PREVISAO_COLHEITA: TIntegerField;
    QPrevisaoColheitaCOD_PLANTIO_SAFRA: TIntegerField;
    QPrevisaoColheitaCOD_PRODUTO: TFloatField;
    QPrevisaoColheitaNUM_DIAS_COLHEITA: TIntegerField;
    QPrevisaoColheitadesc_complemento2: TStringField;
    QPrevisaoColheitasafra: TStringField;
    QExibePrevisao: TOracleDataSet1;
    QExibePrevisaoCOD_PREVISAO_COLHEITA: TIntegerField;
    QExibePrevisaoNUM_DIAS_COLHEITA: TIntegerField;
    QExibePrevisaoDESC_COMPLEMENTO_2: TStringField;
    QExibePrevisaoDESC_SAFRA: TStringField;
    DSPrevisaoColheita: TDataSource;
    QPrevisaoColheitaCons: TOracleDataSet1;
    QPrevisaoColheitaConsCOD_PREVISAO_COLHEITA: TIntegerField;
    QPrevisaoColheitaConsDESC_COMPLEMENTO_2: TStringField;
    QPrevisaoColheitaConsDESC_SAFRA: TStringField;
    QPrevisaoColheitaConsNUM_DIAS_COLHEITA: TIntegerField;
    procedure QPrevisaoColheitaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPrevisaoColheita: TDMPrevisaoColheita;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMPrevisaoColheita.QPrevisaoColheitaCalcFields(
  DataSet: TDataSet);
begin
  if QPrevisaoColheitaCod_Produto.Text <> '' then
    QPrevisaoColheitaDesc_Complemento2.Value:=DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO_2 FROM TB_PRODUTO ',
                                                                 ' COD_PRODUTO = '+QPrevisaoColheitaCod_Produto.Text);
  if QPrevisaoColheitaCod_Plantio_Safra.Text <> '' then
    QPrevisaoColheitaSafra.Value:=DMOracle.BuscaNome('SELECT DESC_SAFRA FROM TB_PLANTIO_SAFRA',
                                                     ' COD_PLANTIO_SAFRA = '+QPrevisaoColheitaCod_Plantio_Safra.Text);
end;

end.
