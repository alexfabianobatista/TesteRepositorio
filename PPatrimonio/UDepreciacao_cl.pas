unit UDepreciacao_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, Oracle;

type
  TDMDepreciacao = class(TDataModule)
    QIncluiDepreciacao: TOracleDataSet1;
    QIncluiDepreciacaoCOD_DEPRECIACAO_PATRIMONIO: TIntegerField;
    QIncluiDepreciacaoCOD_PATRIMONIO_ITEM: TIntegerField;
    QIncluiDepreciacaoDT_DEPRECIACAO: TDateTimeField;
    QIncluiDepreciacaoVAL_DEPRECIACAO: TFloatField;
    QDepreciacaoPatrimonio: TOracleDataSet1;
    QDepreciacaoPatrimonioDT_DEPRECIACAO: TDateTimeField;
    QDepreciacaoPatrimonioVAL_DEPRECIACAO: TFloatField;
    QIncluiDepreciacaoCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QIncluiDepreciacaoCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QIncluiDepreciacaoVAL_AQUISICAO_AO_GERAR: TFloatField;
    QDepreciacaoPatrimonioVAL_AQUISICAO_AO_GERAR: TFloatField;
    QRMapaCalculo: TOracleDataSet1;
    QRMapaCalculoCOD_PATRIMONIO_ITEM: TFloatField;
    QRMapaCalculoCOD_REDUZIDO: TFloatField;
    QRMapaCalculoDESC_PLANO_CONTA: TStringField;
    QRMapaCalculoVAL_AQUISICAO: TFloatField;
    QRMapaCalculoVAL_RESIDUAL: TFloatField;
    QRMapaCalculoDEP_ACUM_ANT: TFloatField;
    QRMapaCalculoDEP_ACUM_POS: TFloatField;
    QRMapaCalculoVAL_DEP_JAN: TFloatField;
    QRMapaCalculoVAL_DEP_FEV: TFloatField;
    QRMapaCalculoVAL_DEP_MAR: TFloatField;
    QRMapaCalculoVAL_DEP_ABR: TFloatField;
    QRMapaCalculoVAL_DEP_MAI: TFloatField;
    QRMapaCalculoVAL_DEP_JUN: TFloatField;
    QRMapaCalculoVAL_DEP_JUL: TFloatField;
    QRMapaCalculoVAL_DEP_AGO: TFloatField;
    QRMapaCalculoVAL_DEP_SET: TFloatField;
    QRMapaCalculoVAL_DEP_OUT: TFloatField;
    QRMapaCalculoVAL_DEP_NOV: TFloatField;
    QRMapaCalculoVAL_DEP_DEZ: TFloatField;
    QRMapaCalculoBem: TOracleDataSet1;
    QRMapaCalculoBemCOD_PATRIMONIO_ITEM: TIntegerField;
    QRMapaCalculoBemPERC_DEPRECIACAO: TFloatField;
    QRMapaCalculoBemPERC_DEPRECIACAO_MES: TFloatField;
    QRMapaCalculoBemVAL_AQUISICAO_AO_GERAR: TFloatField;
    QRMapaCalculoBemVAL_DEPRECIACAO: TFloatField;
    QRMapaCalculoBemval_saldo_residual: TFloatField;
    QRMapaCalculoBemval_depreciacao_acumulada: TFloatField;
    QRMapaCalculoBemDT_DEPRECIACAO: TDateTimeField;
    QRMapaCalculoBemPERIODO_COMPETENCIA: TStringField;
    QRMapaCalculoBemval_saldo_anterior: TFloatField;
    QRMapaCalculoBemval_inclusoes: TFloatField;
    QRMapaCalculoBemCOD_REDUZIDO: TIntegerField;
    QRMapaCalculoBemDESC_PLANO_CONTA: TStringField;
    QRMapaCalculoBemANO_MES_AQUISICAO: TFloatField;
    QRMapaCalculoBemANO_MES_DEPRECIACAO: TFloatField;
    QRMapaCalculoBemval_depreciacao_calculado: TFloatField;
    QRMapaCalculoBemCOD_REDUZIDO_BEM: TIntegerField;
    QRMapaCalculoBemDESC_PLANO_CONTA_BEM: TStringField;
    QRMapaCalculoDESC_PRODUTO: TStringField;
    QDepreciacaoPatrimonioCad: TOracleDataSet1;
    QDepreciacaoPatrimonioCadCOD_DEPRECIACAO_PATRIMONIO: TIntegerField;
    QDepreciacaoPatrimonioCadCOD_PATRIMONIO_ITEM: TIntegerField;
    QDepreciacaoPatrimonioCadDT_DEPRECIACAO: TDateTimeField;
    QDepreciacaoPatrimonioCadVAL_DEPRECIACAO: TFloatField;
    QDepreciacaoPatrimonioCadCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QDepreciacaoPatrimonioCadCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QDepreciacaoPatrimonioCadVAL_AQUISICAO_AO_GERAR: TFloatField;
    QDepreciacaoPatrimonioLista: TOracleDataSet1;
    QDepreciacaoPatrimonioListaCOD_DEPRECIACAO_PATRIMONIO: TIntegerField;
    QDepreciacaoPatrimonioListaCOD_PATRIMONIO_ITEM: TIntegerField;
    QDepreciacaoPatrimonioListaDT_DEPRECIACAO: TDateTimeField;
    QDepreciacaoPatrimonioListaVAL_DEPRECIACAO: TFloatField;
    QDepreciacaoPatrimonioListaCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QDepreciacaoPatrimonioListaCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QDepreciacaoPatrimonioListaVAL_AQUISICAO_AO_GERAR: TFloatField;
    QRMapaCalculoDESC_PATRIMONIO: TStringField;
    QRMapaCalculoVAL_RESIDUAL_AB: TFloatField;
    QRMapaCalculoVAL_RESIDUAL_MOINHO: TFloatField;
    QRMapaCalculoval_residual_calc: TFloatField;
    QRMapaCalculoVAL_BAIXADO_BEM: TFloatField;
    QRMapaCalculoVAL_BAIXADO_BEM_MOINHO: TFloatField;
    QRMapaCalculoval_baixado_bem_calc: TFloatField;
    QRMapaCalculoval_aquisicao_calc: TFloatField;
    QRMapaCalculodep_acum_pos_calc: TFloatField;
    procedure QRMapaCalculoBemCalcFields(DataSet: TDataSet);
    procedure QDepreciacaoPatrimonioCadBeforeEdit(DataSet: TDataSet);
    procedure QDepreciacaoPatrimonioCadBeforeDelete(DataSet: TDataSet);
    procedure QDepreciacaoPatrimonioCadBeforePost(DataSet: TDataSet);
    procedure QRMapaCalculoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDepreciacao: TDMDepreciacao;

implementation

uses UOracle_cl, UPatrimonio_cl, UParamSistema_cl;

{$R *.DFM}

procedure TDMDepreciacao.QRMapaCalculoBemCalcFields(DataSet: TDataSet);
var
  wVal : string;
begin

  //BUSCA AS DEPRECIACOES DAS INCORPORACOES
  wVal := DMOracle.BuscaNome(
           ' SELECT SUM(VAL_INCORPORACAO_DEPRECIADO) FROM TB_PATRIMONIO_INCORPORACAO',
           ' COD_PATRIMONIO_ITEM = ' + inttostr(DMDepreciacao.QRMapaCalculoBemCOD_PATRIMONIO_ITEM.Value) +
           ' AND TO_NUMBER(TO_CHAR(DT_INCORPORACAO,'+chr(39)+'YYYYMM'+chr(39)+')) = ' + floattostr(QRMapaCalculoBemANO_MES_DEPRECIACAO.Value)
          );
  QRMapaCalculoBemval_depreciacao_calculado.Value := QRMapaCalculoBemVAL_DEPRECIACAO.Value;
  if wVal <> '' then
    QRMapaCalculoBemval_depreciacao_calculado.Value := QRMapaCalculoBemval_depreciacao_calculado.Value + strtofloat(wVal);
  //------------------------------------------------------------------------


  //------------------------------------------------------------------------

  //BUSCA AS DEPRECIACOES
  wVal := DMOracle.BuscaNome(
          ' SELECT SUM(VAL_DEPRECIACAO) FROM TB_PATRIMONIO_DEPRECIACAO',
          ' COD_PATRIMONIO_ITEM = ' + inttostr(DMDepreciacao.QRMapaCalculoBemCOD_PATRIMONIO_ITEM.Value) +
          ' AND DT_DEPRECIACAO <= '+chr(39)+ datetostr(DMDepreciacao.QRMapaCalculoBemDT_DEPRECIACAO.Value) +chr(39)
         );

  if wVal <> '' then
    QRMapaCalculoBemval_depreciacao_acumulada.Value := strtofloat(wVal)
  else
    QRMapaCalculoBemval_depreciacao_acumulada.Value := 0;


  //BUSCA AS DEPRECIACOES DAS INCORPORACOES
  wVal := DMOracle.BuscaNome(
           ' SELECT SUM(VAL_INCORPORACAO_DEPRECIADO) FROM TB_PATRIMONIO_INCORPORACAO',
           ' COD_PATRIMONIO_ITEM = ' + inttostr(DMDepreciacao.QRMapaCalculoBemCOD_PATRIMONIO_ITEM.Value) +
           ' AND TO_NUMBER(TO_CHAR(DT_INCORPORACAO,'+chr(39)+'YYYYMM'+chr(39)+')) <= ' + floattostr(QRMapaCalculoBemANO_MES_DEPRECIACAO.Value)
          );

  if wVal <> '' then
    QRMapaCalculoBemval_depreciacao_acumulada.Value := QRMapaCalculoBemval_depreciacao_acumulada.Value + strtofloat(wVal);
  //------------------------------------------------------------------------

  QRMapaCalculoBemval_saldo_residual.Value := QRMapaCalculoBemVAL_AQUISICAO_AO_GERAR.Value - QRMapaCalculoBemval_depreciacao_acumulada.Value;

  //------------------------------------------------------------------------
  QRMapaCalculoBemval_inclusoes.Value := 0;

  if QRMapaCalculoBemANO_MES_AQUISICAO.Value = QRMapaCalculoBemANO_MES_DEPRECIACAO.Value then
    QRMapaCalculoBemval_inclusoes.Value := QRMapaCalculoBemVAL_AQUISICAO_AO_GERAR.Value;

  wVal := DMOracle.BuscaNome(
           ' SELECT SUM(VAL_INCORPORACAO) FROM TB_PATRIMONIO_INCORPORACAO',
           ' COD_PATRIMONIO_ITEM = ' + inttostr(DMDepreciacao.QRMapaCalculoBemCOD_PATRIMONIO_ITEM.Value) +
           ' AND TO_NUMBER(TO_CHAR(DT_INCORPORACAO,'+chr(39)+'YYYYMM'+chr(39)+')) = ' + floattostr(QRMapaCalculoBemANO_MES_DEPRECIACAO.Value)
        );
  if wVal <> '' then
      QRMapaCalculoBemval_inclusoes.Value := QRMapaCalculoBemval_inclusoes.Value + strtofloat(wVal);

  //---------------------------------------------------------------------------
end;

procedure TDMDepreciacao.QDepreciacaoPatrimonioCadBeforeEdit(
  DataSet: TDataSet);
begin
  if QDepreciacaoPatrimonioCadCOD_LANCTO_CONTABIL_CRED.Text <> '' then
    raise Exception.create('Depreciação Gerada Automaticamente, não pode ser alterada');
end;

procedure TDMDepreciacao.QDepreciacaoPatrimonioCadBeforeDelete(
  DataSet: TDataSet);
begin
  if QDepreciacaoPatrimonioCadCOD_LANCTO_CONTABIL_CRED.Text <> '' then
    raise Exception.create('Depreciação Gerada Automaticamente, não pode ser excluída');
end;

Function FirstDayOfMonth (Data : TDateTime; lSabDom : Boolean) : TDateTime;
var
  Ano, Mes, Dia : word;
  DiaDaSemana : Integer;
begin
  DecodeDate (Data, Ano, Mes, Dia);
  Dia := 1;
  if lSabDom Then
  begin
    DiaDaSemana := DayOfWeek (Data);
    if DiaDaSemana = 1 Then
      Dia := 2
    else
      if DiaDaSemana = 7 Then
        Dia := 3;
  end;
  FirstDayOfMonth := EncodeDate (Ano, Mes, Dia);
end;

Function LastDayOfMonth (Data : TDateTime; lSabDom : Boolean) : TDateTime;
var
  Ano, Mes, Dia : word;
  AuxData : TDateTime;
  DiaDaSemana : Integer;
begin
  AuxData := FirstDayOfMonth (IncMonth (Data, 1), False) - 1;
  if lSabDom Then
  begin
    DecodeDate (Auxdata, Ano, Mes, Dia);
    DiaDaSemana := DayOfWeek (AuxData);
    if DiaDaSemana = 1 Then
      Dia := Dia - 2
    else
      if DiaDaSemana = 7 Then
    Dec (Dia);
    AuxData := EnCodeDate (Ano, Mes, Dia);
  end;
  LastDayOfMonth := AuxData;
end;

procedure TDMDepreciacao.QDepreciacaoPatrimonioCadBeforePost(
  DataSet: TDataSet);
begin
  if QDepreciacaoPatrimonioCadDT_DEPRECIACAO.Value <> LastDayOfMonth(QDepreciacaoPatrimonioCadDT_DEPRECIACAO.Value, false) then
    raise Exception.Create('A data informada não é o ultimo dia do mês.')
end;

procedure TDMDepreciacao.QRMapaCalculoCalcFields(DataSet: TDataSet);
begin
  {esse campo calculado foi criado para controlar o calculo do valor residual
  na AB e no MOINHO, pois a forma de calcular é diferente para cada empresa,
  a query QRMapaCalculo tem dois campos que calculam o valor residual, um na forma
  de calculo do moinho e outra na forma de calculo da ab, o código abaixo
  verifica qual empresa está executando o sistema e atribui ao campo calculado
  val_residual_calc o valor de acordo com a empresa}
  QRMapaCalculoval_residual_calc.Value := QRMapaCalculoVAL_RESIDUAL.Value;
  QRMapaCalculoval_aquisicao_calc.Value := QRMapaCalculoVAL_AQUISICAO.Value;
  QRMapaCalculodep_acum_pos_calc.Value := QRMapaCalculoDEP_ACUM_POS.Value;

  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO') or
     (dmParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CAVALCA') or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PEQUENAS') then
  begin
    QRMapaCalculoval_residual_calc.Value := QRMapaCalculoVAL_RESIDUAL_MOINHO.Value;
    QRMapaCalculoval_baixado_bem_calc.Value := QRMapaCalculoVAL_BAIXADO_BEM_MOINHO.Value;
    QRMapaCalculoval_aquisicao_calc.Value := QRMapaCalculoVAL_AQUISICAO.Value - QRMapaCalculoval_baixado_bem_calc.Value;

    QRMapaCalculodep_acum_pos_calc.Value := QRMapaCalculodep_acum_pos_calc.Value - QRMapaCalculodep_acum_pos_calc.Value * QRMapaCalculoval_baixado_bem_calc.Value / QRMapaCalculoVAL_AQUISICAO.Value;

  end;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AB' then
  begin
    QRMapaCalculoval_residual_calc.Value := QRMapaCalculoVAL_RESIDUAL_AB.Value;
    QRMapaCalculoval_baixado_bem_calc.Value := QRMapaCalculoVAL_BAIXADO_BEM.Value;
  end;
end;

end.
