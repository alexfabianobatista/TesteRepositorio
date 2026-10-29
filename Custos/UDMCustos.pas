unit UDMCustos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMCustos = class(TDataModule)
    QRCustosRel: TOracleDataSet1;
    QRCustosRelCOD_CUSTO: TIntegerField;
    QRCustosRelCOD_FILIAL: TIntegerField;
    QRCustosRelDESC_FILIAL: TStringField;
    QRCustosRelDT_LANCAMENTO: TDateTimeField;
    QRCustosRelVAL_CUSTO: TFloatField;
    QRCustosRelCOD_DEPARTAMENTO: TIntegerField;
    QRCustosRelDESC_DEPARTAMENTO: TStringField;
    QRCustoDepartamento: TOracleDataSet1;
    QRCustoDepartamentoCOD_FILIAL: TIntegerField;
    QRCustoDepartamentoDESC_FILIAL: TStringField;
    QRCustoDepartamentoDT_LANCAMENTO: TDateTimeField;
    QRCustoDepartamentoVAL_CUSTO: TFloatField;
    QRCustoDepartamentoCOD_DEPARTAMENTO: TIntegerField;
    QRCustoDepartamentoDESC_DEPARTAMENTO: TStringField;
    QRCustoDepartamentoTEntrada: TFloatField;
    QRCustoDepartamentoTSaida: TFloatField;
    QRRateioCusto: TOracleDataSet1;
    QRRateioCustoCOD_RATEIO_CUSTOS: TIntegerField;
    QRRateioCustoCOD_FILIAL_ORIG: TIntegerField;
    QRRateioCustoDESC_FILIAL_ORIGEM: TStringField;
    QRRateioCustoCOD_DPTO_ORIG: TIntegerField;
    QRRateioCustoDESC_DPTO_ORIGEM: TStringField;
    QRRateioCustoCOD_FILIAL_DEST: TIntegerField;
    QRRateioCustoCOD_DPTO_DEST: TIntegerField;
    QRRateioCustoPERC_RATEIO: TFloatField;
    QCustoCons: TOracleDataSet1;
    QCustoConsCOD_CUSTO: TIntegerField;
    QCustoConsCOD_FILIAL: TIntegerField;
    QCustoConsDT_LANCAMENTO: TDateTimeField;
    QCustoConsVAL_CUSTO: TFloatField;
    QCustoConsCOD_DEPARTAMENTO: TIntegerField;
    QCustoConsDESC_DEPARTAMENTO: TStringField;
    QCustoCad: TOracleDataSet1;
    QCustoCadCOD_CUSTO: TIntegerField;
    QCustoCadCOD_FILIAL: TIntegerField;
    QCustoCadCOD_DEPARTAMENTO: TIntegerField;
    QCustoCadDT_LANCAMENTO: TDateTimeField;
    QCustoCadVAL_CUSTO: TFloatField;
    QCustoCadDESC_OBSERVACAO: TStringField;
    QRateioCalculoCustos: TOracleDataSet1;
    QRateio_CustosCons: TOracleDataSet1;
    QRateio_CustosConsCOD_RATEIO_CUSTOS: TIntegerField;
    QRateio_CustosConsCOD_FILIAL_ORIG: TIntegerField;
    QRateio_CustosConsDESC_FILIAL: TStringField;
    QRateio_CustosConsCOD_DPTO_ORIG: TIntegerField;
    QRateio_CustosConsDESC_DEPARTAMENTO: TStringField;
    QRateio_CustosConsCOD_FILIAL_DEST: TIntegerField;
    QRateio_CustosConsCOD_DPTO_DEST: TIntegerField;
    QRateio_CustosConsPERC_RATEIO: TFloatField;
    QRateioCustosCad: TOracleDataSet1;
    QRateioCustosCadCOD_RATEIO_CUSTOS: TIntegerField;
    QRateioCustosCadCOD_FILIAL_ORIG: TIntegerField;
    QRateioCustosCadCOD_DPTO_ORIG: TIntegerField;
    QRateioCustosCadCOD_FILIAL_DEST: TIntegerField;
    QRateioCustosCadCOD_DPTO_DEST: TIntegerField;
    QRateioCustosCadPERC_RATEIO: TFloatField;
    QRApuracaoResultado: TOracleDataSet1;
    QRApuracaoResultadoJAN: TFloatField;
    QRApuracaoResultadoFEV: TFloatField;
    QRApuracaoResultadoMAR: TFloatField;
    QRApuracaoResultadoABR: TFloatField;
    QRApuracaoResultadoMAI: TFloatField;
    QRApuracaoResultadoJUN: TFloatField;
    QRApuracaoResultadoJUL: TFloatField;
    QRApuracaoResultadoAGO: TFloatField;
    QRApuracaoResultadoSETEM: TFloatField;
    QRApuracaoResultadoOUT: TFloatField;
    QRApuracaoResultadoNOV: TFloatField;
    QRApuracaoResultadoDEZ: TFloatField;
    QRApuracaoResultadomedia: TFloatField;
    QRApuracaoResultadoacumulado: TFloatField;
    QRateioCustosCaddesc_filial_origem: TStringField;
    QRateioCustosCaddesc_depto_origem: TStringField;
    QRateioCustosCaddesc_filial_destino: TStringField;
    QRateioCustosCaddesc_depto_destino: TStringField;
    QCustoCadCOD_PLANO_CONTA: TIntegerField;
    QRateioCustosCadCOD_PLANO_CONTA: TIntegerField;
    QRateioCalculoCustosCOD_FILIAL: TIntegerField;
    QRateioCalculoCustosCOD_PLANO_CONTA: TIntegerField;
    QRateioCalculoCustosDT_LANCAMENTO: TDateTimeField;
    QRateioCalculoCustosVAL_LANCAMENTO: TFloatField;
    QRateioCalculoCustosCOD_DEPARTAMENTO: TIntegerField;
    QRateioCalculoCustosCOD_GRUPO: TIntegerField;
    QCustoConsCOD_PLANO_CONTA: TIntegerField;
    QCustoConsDESC_PLANO_CONTA: TStringField;
    QRCustosRelCOD_PLANO_CONTA: TIntegerField;
    QRCustosRelDESC_PLANO_CONTA: TStringField;
    QRCustoDepartamentoDESC_PLANO_CONTA: TStringField;
    QRCustoDepartamentoCOD_PLANO_CONTA: TIntegerField;
    QRateio_CustosConsCOD_PLANO_CONTA: TIntegerField;
    QRateio_CustosConsDESC_PLANO_CONTA: TStringField;
    QRRateioCustoCOD_PLANO_CONTA: TIntegerField;
    QRRateioCustoDESC_PLANO_CONTA: TStringField;
    QRApuracaoResultadoCOD_GRUPO: TIntegerField;
    QRApuracaoResultadoCOD_PLANO_CONTA: TIntegerField;
    QRApuracaoResultadoDESC_GRUPO: TStringField;
    QRApuracaoResultadoDESC_PLANO_CONTA: TStringField;
    procedure QCustoCadAfterInsert(DataSet: TDataSet);
    procedure QCustoCadAfterPost(DataSet: TDataSet);
    procedure QRateioCustosCadAfterInsert(DataSet: TDataSet);
    procedure QRateioCustosCadAfterPost(DataSet: TDataSet);
    procedure QRCustoDepartamentoCalcFields(DataSet: TDataSet);
    procedure QCustoCadNewRecord(DataSet: TDataSet);
    procedure QRApuracaoResultadoCalcFields(DataSet: TDataSet);
    procedure QRateioCustosCadCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCustos: TDMCustos;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMCustos.QCustoCadAfterInsert(DataSet: TDataSet);
begin
  // QCustoCadCOD_CUSTO.Value := DMOracle.Sequencia('CUSTOS');
end;

procedure TDMCustos.QCustoCadAfterPost(DataSet: TDataSet);
begin
  QCustoCad.SetVariable('PK',QCustoCadCOD_CUSTO.Value);
end;

procedure TDMCustos.QRateioCustosCadAfterInsert(DataSet: TDataSet);
begin
   //QRateioCustosCadCOD_RATEIO_CUSTOS.Value := DMOracle.Sequencia('RATEIO_CUSTOS');
end;

procedure TDMCustos.QRateioCustosCadAfterPost(DataSet: TDataSet);
begin
  QRateioCustosCad.SetVariable('PK',QRateioCustosCadCOD_RATEIO_CUSTOS.Value);
end;

procedure TDMCustos.QRCustoDepartamentoCalcFields(DataSet: TDataSet);
begin
   if QRCustoDepartamentoVAL_CUSTO.Value > 0 then
      QRCustoDepartamentoTEntrada.Value := QRCustoDepartamentoTEntrada.Value +
      QRCustoDepartamentoVAL_CUSTO.Value
   else
      QRCustoDepartamentoTSaida.Value := QRCustoDepartamentoTSaida.Value +
      QRCustoDepartamentoVAL_CUSTO.Value;
end;

procedure TDMCustos.QCustoCadNewRecord(DataSet: TDataSet);
begin
  QCustoCadDT_LANCAMENTO.Value := Date;
end;

procedure TDMCustos.QRApuracaoResultadoCalcFields(DataSet: TDataSet);
var nTotalMeses: Real; nDivisor: Integer;
begin
  nTotalMeses := 0;
  nDivisor    := 0;
  with DMCustos do
  begin
    if QRApuracaoResultadoJAN.Value <> 0 then
    begin
      nDivisor := 1;
      nTotalMeses := nTotalMeses + QRApuracaoResultadoJAN.Value;
    end;
    if QRApuracaoResultadoFEV.Value <> 0 then
    begin
      nDivisor:= 2;
      nTotalMeses := nTotalMeses + QRApuracaoResultadoFEV.Value;
    end;
    if QRApuracaoResultadoMAR.Value <> 0 then
    begin
      nDivisor:= 3;
      nTotalMeses := nTotalMeses + QRApuracaoResultadoMAR.Value;
    end;
    if QRApuracaoResultadoABR.Value <> 0 then
    begin
      nDivisor:= 4;
      nTotalMeses := nTotalMeses + QRApuracaoResultadoABR.Value;
    end;
    if QRApuracaoResultadoMAI.Value <> 0 then
    begin
      nDivisor:= 5;
      nTotalMeses := nTotalMeses + QRApuracaoResultadoMAI.Value;
    end;
    if QRApuracaoResultadoJUN.Value <> 0 then
    begin
      nDivisor:= 6;
      nTotalMeses := nTotalMeses + QRApuracaoResultadoJUN.Value;
    end;
    if QRApuracaoResultadoJUL.Value <> 0 then
    begin
      nDivisor:= 7;
      nTotalMeses := nTotalMeses + QRApuracaoResultadoJUL.Value;
    end;
    if QRApuracaoResultadoAGO.Value <> 0 then
    begin
      nDivisor:= 8;
      nTotalMeses := nTotalMeses + QRApuracaoResultadoAGO.Value;
    end;
    if QRApuracaoResultadoSETEM.Value <> 0 then
    begin
      nDivisor:= 9;
      nTotalMeses := nTotalMeses + QRApuracaoResultadoSETEM.Value;
    end;
    if QRApuracaoResultadoOUT.Value <> 0 then
    begin
      nDivisor:= 10;
      nTotalMeses := nTotalMeses + QRApuracaoResultadoOUT.Value;
    end;
    if QRApuracaoResultadoNOV.Value <> 0 then
    begin
      nDivisor:= 11;
      nTotalMeses := nTotalMeses + QRApuracaoResultadoNOV.Value;
    end;
    if QRApuracaoResultadoDEZ.Value <> 0 then
    begin
      nDivisor:= 12;
      nTotalMeses := nTotalMeses + QRApuracaoResultadoDEZ.Value;
    end;
    QRApuracaoResultadoMedia.Value := nTotalMeses / nDivisor;
    QRApuracaoResultadoAcumulado.Value := nTotalMeses;
  end;

end;

procedure TDMCustos.QRateioCustosCadCalcFields(DataSet: TDataSet);
begin
    If QRateioCustosCadCod_Filial_Orig.Text <> '' Then
       QRateioCustosCaddesc_filial_origem.value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                           'COD_FILIAL = '+QRateioCustosCadCod_Filial_Orig.Text);
    If QRateioCustosCadCod_Dpto_Orig.Text <> '' Then
       QRateioCustosCaddesc_depto_Origem.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO',
                                          'COD_DEPARTAMENTO = '+QRateioCustosCadCod_Dpto_Orig.Text);
    If QRateioCustosCadCod_Filial_Dest.Text <> '' Then
       QRateioCustosCaddesc_filial_destino.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                           'COD_FILIAL = '+QRateioCustosCadCod_Filial_Dest.Text);
    If QRateioCustosCadcod_dpto_dest.Text <> '' Then
       QRateioCustosCaddesc_depto_destino.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO',
                                          'COD_DEPARTAMENTO = '+QRateioCustosCadcod_dpto_dest.Text);

end;

end.
