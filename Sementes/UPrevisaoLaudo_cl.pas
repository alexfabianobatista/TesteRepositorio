unit UPrevisaoLaudo_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMPrevisaoLaudo = class(TDataModule)
    QPrevisaoLaudo: TOracleDataSet1;
    QPrevisaoLaudoCOD_PREVISAO_LAUDO: TIntegerField;
    QPrevisaoLaudoCOD_PLANTIO_SAFRA: TIntegerField;
    QPrevisaoLaudoCOD_PRODUTO: TIntegerField;
    QPrevisaoLaudoNUM_DIAS_FLORACAO: TIntegerField;
    QPrevisaoLaudoNUM_DIAS_PRE_COLHEITA: TIntegerField;
    QPrevisaoLaudosafra: TStringField;
    QPrevisaoLaudocultivar: TStringField;
    QExibePrevisao: TOracleDataSet1;
    QExibePrevisaoCOD_PREVISAO_LAUDO: TIntegerField;
    QExibePrevisaoDESC_COMPLEMENTO_2: TStringField;
    QExibePrevisaoDESC_SAFRA: TStringField;
    QExibePrevisaoNUM_DIAS_FLORACAO: TIntegerField;
    QExibePrevisaoNUM_DIAS_PRE_COLHEITA: TIntegerField;
    DSExibePrevisao: TDataSource;
    QPrevisaoLaudoCons: TOracleDataSet1;
    QPrevisaoLaudoConsCOD_PREVISAO_LAUDO: TIntegerField;
    QPrevisaoLaudoConsDESC_COMPLEMENTO_2: TStringField;
    QPrevisaoLaudoConsDESC_SAFRA: TStringField;
    QPrevisaoLaudoConsNUM_DIAS_FLORACAO: TIntegerField;
    QPrevisaoLaudoConsNUM_DIAS_PRE_COLHEITA: TIntegerField;
    QRPrevisaoLaudo: TOracleDataSet1;
    QRPrevisaoLaudoNUM_CAMPO_PLANTIO: TIntegerField;
    QRPrevisaoLaudoDT_INSPECAO: TDateTimeField;
    QRPrevisaoLaudoNOME: TStringField;
    QRPrevisaoLaudoDESC_CIDADE: TStringField;
    QRPrevisaoLaudoDESC_ENDERECO: TStringField;
    QRPrevisaoLaudoDESC_COMPLEMENTO_2: TStringField;
    QRPrevisaoLaudoDT_FLORACAO: TDateTimeField;
    QRPrevisaoLaudoDESC_SAFRA: TStringField;
    QRPrevisaoLaudoCOD_FILIAL: TIntegerField;
    QRPrevisaoLaudoDESC_FILIAL: TStringField;
    QRPrevisaoLaudoDESC_CULTURA: TStringField;
    QRPrevisaoLaudoDESC_CLASSE_PLANTIO: TStringField;
    QRPrevisaoLaudoNUM_AREA: TFloatField;
    QRPrevisaoLaudoVAL_AREA_APROVADA: TFloatField;
    QRPrevisaoPreColheita: TOracleDataSet1;
    QRPrevisaoPreColheitaNUM_CAMPO_PLANTIO: TIntegerField;
    QRPrevisaoPreColheitaNUM_AREA: TFloatField;
    QRPrevisaoPreColheitaDT_INSPECAO: TDateTimeField;
    QRPrevisaoPreColheitaVAL_AREA_APROVADA: TFloatField;
    QRPrevisaoPreColheitaNOME: TStringField;
    QRPrevisaoPreColheitaDESC_CIDADE: TStringField;
    QRPrevisaoPreColheitaDESC_ENDERECO: TStringField;
    QRPrevisaoPreColheitaDESC_COMPLEMENTO_2: TStringField;
    QRPrevisaoPreColheitaDESC_SAFRA: TStringField;
    QRPrevisaoPreColheitaCOD_FILIAL: TIntegerField;
    QRPrevisaoPreColheitaDESC_FILIAL: TStringField;
    QRPrevisaoPreColheitaDESC_CULTURA: TStringField;
    QRPrevisaoPreColheitaDESC_CLASSE_PLANTIO: TStringField;
    QRPrevisaoPreColheitaDT_PRE_COLHEITA: TDateTimeField;
    procedure QPrevisaoLaudoCalcFields(DataSet: TDataSet);
    procedure QPrevisaoLaudoAfterPost(DataSet: TDataSet);
    procedure QPrevisaoLaudoAfterOpen(DataSet: TDataSet);
    procedure QPrevisaoLaudoAfterDelete(DataSet: TDataSet);
    procedure QPrevisaoLaudoAfterCancel(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPrevisaoLaudo: TDMPrevisaoLaudo;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMPrevisaoLaudo.QPrevisaoLaudoCalcFields(DataSet: TDataSet);
begin
  if Trim(QPrevisaoLaudoCod_Produto.Text) <> '' then
    QPrevisaoLaudoCultivar.Value:=DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO_2 FROM TB_PRODUTO',' COD_PRODUTO = '+Trim(QPrevisaoLaudoCod_Produto.Text));
    if Trim(QPrevisaoLaudoCod_Plantio_Safra.Text) <> '' then
    QPrevisaoLaudoSafra.Value:=DMOracle.BuscaNome('SELECT DESC_SAFRA FROM TB_PLANTIO_SAFRA',' COD_PLANTIO_SAFRA = '+Trim(QPrevisaoLaudoCod_Plantio_Safra.Text));
end;

procedure TDMPrevisaoLaudo.QPrevisaoLaudoAfterPost(DataSet: TDataSet);
begin
  QExibePrevisao.Close;
  QExibePrevisao.SetVariable('COD_PLANTIO_SAFRA',QPrevisaoLaudoCod_Plantio_Safra.Value);
  QExibePrevisao.Open;
end;

procedure TDMPrevisaoLaudo.QPrevisaoLaudoAfterOpen(DataSet: TDataSet);
begin
  QExibePrevisao.Close;
  QExibePrevisao.SetVariable('COD_PLANTIO_SAFRA',QPrevisaoLaudoCod_Plantio_Safra.Value);
  QExibePrevisao.Open;
end;

procedure TDMPrevisaoLaudo.QPrevisaoLaudoAfterDelete(DataSet: TDataSet);
begin
  QExibePrevisao.Close;
  QExibePrevisao.SetVariable('COD_PLANTIO_SAFRA',QPrevisaoLaudoCod_Plantio_Safra.Value);
  QExibePrevisao.Open;
end;

procedure TDMPrevisaoLaudo.QPrevisaoLaudoAfterCancel(DataSet: TDataSet);
begin
  QExibePrevisao.Close;
  QExibePrevisao.SetVariable('COD_PLANTIO_SAFRA',QPrevisaoLaudoCod_Plantio_Safra.Value);
  QExibePrevisao.Open;
end;

end.
