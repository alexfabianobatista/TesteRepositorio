unit UIndiceDesempenho_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMIndiceDesempenho = class(TDataModule)
    QIndiceDivisor: TOracleDataSet1;
    QIndiceDivisorCOD_INDICE_DIVISOR: TIntegerField;
    QIndiceDivisorCOD_INDICE_DESEMPENHO: TIntegerField;
    QIndiceDivisorCOD_PLANO_CONTA: TIntegerField;
    QIndiceDivisordesc_plano_conta: TStringField;
    QIndiceDividendo: TOracleDataSet1;
    QIndiceDividendoCOD_INDICE_DIVIDENDO: TIntegerField;
    QIndiceDividendoCOD_INDICE_DESEMPENHO: TIntegerField;
    QIndiceDividendoCOD_PLANO_CONTA: TIntegerField;
    DSIndiceDivisor: TDataSource;
    DSIndiceDividendo: TDataSource;
    QIndiceDividendodesc_plano_conta: TStringField;
    QIndiceDesempenho: TOracleDataSet1;
    QIndiceDesempenhoCOD_INDICE_DESEMPENHO: TIntegerField;
    QIndiceDesempenhoDESC_INDICE_DESEMPENHO: TStringField;
    QIndiceDesempenhoCons: TOracleDataSet1;
    QIndiceDesempenhoConsCOD_INDICE_DESEMPENHO: TIntegerField;
    QIndiceDesempenhoConsDESC_INDICE_DESEMPENHO: TStringField;
    QRIndiceDesempenho: TOracleDataSet1;
    QIndiceDesempenhoVAL_MULTIPLICADOR: TFloatField;
    QRIndiceDesempenhoDIVIDENDODIVISORMULTIPLICA: TFloatField;
    QRIndiceDesempenhoINDICE: TIntegerField;
    QRIndiceDesempenhoDESC_INDICE: TStringField;
    QIndiceDividendoDESC_SINAL: TStringField;
    QIndiceDivisorDESC_SINAL: TStringField;
    QRAvaliacaoDesempenho: TOracleDataSet1;
    QRAvaliacaoDesempenhoDESC_PLANO_CONTA: TStringField;
    QRAvaliacaoDesempenhoCOD_PLANO_CONTA: TFloatField;
    QRAvaliacaoDesempenhoIND_ATIVO_PASSIVO: TStringField;
    QRAvaliacaoDesempenhoSALDO_1: TFloatField;
    QRAvaliacaoDesempenhoSALDO_2: TFloatField;
    QRAvaliacaoDesempenhoSALDO_3: TFloatField;
    QRAvaliacaoDesempenhoSALDO_4: TFloatField;
    QRAvaliacaoDesempenhoSALDO_5: TFloatField;
    QRAvaliacaoDesempenhoSALDO_6: TFloatField;
    QRAvaliacaoDesempenhoNUM_PLANO_CONTA: TStringField;
    QRAnaliseVertical: TOracleDataSet1;
    QRAnaliseVerticalIND_ATIVO_PASSIVO: TStringField;
    QRAnaliseVerticalCOD_PLANO_CONTA: TFloatField;
    QRAnaliseVerticalNUM_PLANO_CONTA: TStringField;
    QRAnaliseVerticalDESC_PLANO_CONTA: TStringField;
    QRAnaliseVerticalSALDO_1: TFloatField;
    QRAnaliseVerticalSALDO_2: TFloatField;
    QRAnaliseVerticalSALDO_3: TFloatField;
    QRAnaliseVerticalSALDO_4: TFloatField;
    QRAnaliseVerticalSALDO_5: TFloatField;
    QRAnaliseVerticalSALDO_6: TFloatField;
    QRAnaliseVerticalTOTAL_1: TFloatField;
    QRAnaliseVerticalTOTAL_2: TFloatField;
    QRAnaliseVerticalTOTAL_3: TFloatField;
    QRAnaliseVerticalTOTAL_4: TFloatField;
    QRAnaliseVerticalTOTAL_5: TFloatField;
    QRAnaliseVerticalTOTAL_6: TFloatField;
    procedure QIndiceDesempenhoAfterEdit(DataSet: TDataSet);
    procedure QIndiceDesempenhoAfterInsert(DataSet: TDataSet);
    procedure QIndiceDividendoAfterInsert(DataSet: TDataSet);
    procedure QIndiceDividendoCalcFields(DataSet: TDataSet);
    procedure DSIndiceDividendoStateChange(Sender: TObject);
    procedure QIndiceDivisorCalcFields(DataSet: TDataSet);
    procedure DSIndiceDivisorStateChange(Sender: TObject);
    procedure QIndiceDivisorAfterInsert(DataSet: TDataSet);
    procedure QIndiceDesempenhoAfterOpen(DataSet: TDataSet);
    procedure QIndiceDesempenhoAfterPost(DataSet: TDataSet);
    procedure QIndiceDesempenhoAfterCancel(DataSet: TDataSet);
    procedure QIndiceDesempenhoAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMIndiceDesempenho: TDMIndiceDesempenho;

implementation

uses UOracle_cl, UIndiceDesempenhoCad;

{$R *.DFM}

procedure TDMIndiceDesempenho.QIndiceDesempenhoAfterEdit(
  DataSet: TDataSet);
begin
  QIndiceDivisor.Close;
  QIndiceDivisor.Open;
  QIndiceDividendo.Close;
  QIndiceDividendo.Open;
end;

procedure TDMIndiceDesempenho.QIndiceDesempenhoAfterInsert(
  DataSet: TDataSet);
begin
  with DMIndiceDesempenho do
  begin
    QIndiceDividendo.Close;
    QIndiceDividendo.SetVariable('COD_INDICE_DESEMPENHO',QIndiceDesempenhoCod_Indice_Desempenho.Value);
    QIndiceDividendo.Open;

    QIndiceDivisor.Close;
    QIndiceDivisor.SetVariable('COD_INDICE_DESEMPENHO',QIndiceDesempenhoCod_Indice_Desempenho.Value);
    QIndiceDivisor.Open;
  end;
end;

procedure TDMIndiceDesempenho.QIndiceDividendoAfterInsert(
  DataSet: TDataSet);
begin
  QIndiceDividendoCod_Indice_Desempenho.Value := QIndiceDesempenhoCod_Indice_Desempenho.Value;
  FIndiceDesempenhoCad.BTPlanoConta1Click(SELF);
end;

procedure TDMIndiceDesempenho.QIndiceDividendoCalcFields(DataSet: TDataSet);
begin
  if QIndiceDividendoCod_Plano_Conta.Text <> '' then
    QIndiceDividendoDesc_Plano_Conta.Value:=DMOracle.BuscaNome('SELECT TB_PLANO_CONTA.DESC_PLANO_CONTA FROM TB_PLANO_CONTA',
                                                               'COD_PLANO_CONTA = '+QIndiceDividendoCod_Plano_Conta.Text);
end;

procedure TDMIndiceDesempenho.DSIndiceDividendoStateChange(
  Sender: TObject);
begin
  if DSIndiceDividendo.State in [DSInsert,DSEdit] then
  begin
    FIndiceDesempenhoCad.BTPlanoConta1.Enabled:=true;
  end
  else
  begin
    FIndiceDesempenhoCad.BTPlanoConta1.Enabled:=false;
  end;
end;

procedure TDMIndiceDesempenho.QIndiceDivisorCalcFields(DataSet: TDataSet);
begin
  if QIndiceDivisorCod_Plano_Conta.text <> '' then
    QIndiceDivisorDesc_Plano_Conta.Value:=DMOracle.BuscaNome('SELECT TB_PLANO_CONTA.DESC_PLANO_CONTA FROM TB_PLANO_CONTA',
                                                             'COD_PLANO_CONTA = '+QIndiceDivisorCod_Plano_Conta.text);
end;

procedure TDMIndiceDesempenho.DSIndiceDivisorStateChange(Sender: TObject);
begin
  if DSIndiceDivisor.State in [DSInsert,DSEdit] then
  begin
    FIndiceDesempenhoCad.BTPlanoConta2.Enabled:=true;
  end
  else
  begin
    FIndiceDesempenhoCad.BTPlanoConta2.Enabled:=false;
  end;

end;

procedure TDMIndiceDesempenho.QIndiceDivisorAfterInsert(DataSet: TDataSet);
begin
  QIndiceDivisorCod_Indice_Desempenho.Value := QIndiceDesempenhoCod_Indice_Desempenho.Value;
  FIndiceDesempenhoCad.BTPlanoConta2Click(SELF);
end;

procedure TDMIndiceDesempenho.QIndiceDesempenhoAfterOpen(
  DataSet: TDataSet);
begin
  with DMIndiceDesempenho do
  begin
    QIndiceDividendo.Close;
    QIndiceDividendo.SetVariable('COD_INDICE_DESEMPENHO',QIndiceDesempenhoCod_Indice_Desempenho.Value);
    QIndiceDividendo.Open;

    QIndiceDivisor.Close;
    QIndiceDivisor.SetVariable('COD_INDICE_DESEMPENHO',QIndiceDesempenhoCod_Indice_Desempenho.Value);
    QIndiceDivisor.Open;
  end;
end;

procedure TDMIndiceDesempenho.QIndiceDesempenhoAfterPost(
  DataSet: TDataSet);
begin
  with DMIndiceDesempenho do
  begin
    QIndiceDividendo.Close;
    QIndiceDividendo.SetVariable('COD_INDICE_DESEMPENHO',QIndiceDesempenhoCod_Indice_Desempenho.Value);
    QIndiceDividendo.Open;

    QIndiceDivisor.Close;
    QIndiceDivisor.SetVariable('COD_INDICE_DESEMPENHO',QIndiceDesempenhoCod_Indice_Desempenho.Value);
    QIndiceDivisor.Open;
  end;
end;

procedure TDMIndiceDesempenho.QIndiceDesempenhoAfterCancel(
  DataSet: TDataSet);
begin
  with DMIndiceDesempenho do
  begin
    QIndiceDividendo.Close;
    QIndiceDividendo.SetVariable('COD_INDICE_DESEMPENHO',QIndiceDesempenhoCod_Indice_Desempenho.Value);
    QIndiceDividendo.Open;

    QIndiceDivisor.Close;
    QIndiceDivisor.SetVariable('COD_INDICE_DESEMPENHO',QIndiceDesempenhoCod_Indice_Desempenho.Value);
    QIndiceDivisor.Open;
  end;  
end;

procedure TDMIndiceDesempenho.QIndiceDesempenhoAfterDelete(
  DataSet: TDataSet);
begin
  with DMIndiceDesempenho do
  begin
    QIndiceDividendo.Close;
    QIndiceDividendo.SetVariable('COD_INDICE_DESEMPENHO',QIndiceDesempenhoCod_Indice_Desempenho.Value);
    QIndiceDividendo.Open;

    QIndiceDivisor.Close;
    QIndiceDivisor.SetVariable('COD_INDICE_DESEMPENHO',QIndiceDesempenhoCod_Indice_Desempenho.Value);
    QIndiceDivisor.Open;
  end;
end;

end.
