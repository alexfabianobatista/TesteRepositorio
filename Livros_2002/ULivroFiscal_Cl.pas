unit ULivroFiscal_Cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMLivroFiscal = class(TDataModule)
    DSLivroFiscal: TDataSource;
    DSResumoApuracao: TDataSource;
    DSLcto: TDataSource;
    QRNotasOperacaoResumo: TOracleDataSet1;
    QRNotasOperacaoResumoIND_ENTRADA_SAIDA: TStringField;
    QRNotasOperacaoResumoCOD_OPERACAO: TFloatField;
    QRNotasOperacaoResumoDESC_OPERACAO: TStringField;
    QRNotasOperacaoResumoDESC_RESUMO: TStringField;
    QRNotasOperacaoResumoSVAL_TOTAL: TFloatField;
    QRNotasOperacaoResumoVAL_FUNRURAL: TFloatField;
    QRLivroFiscalArquivo: TOracleDataSet1;
    QRLivroFiscalArquivoUF_CLIENTE: TStringField;
    QRLivroFiscalArquivoNUM_CGC_CPF: TStringField;
    QRLivroFiscalArquivoNUM_INSCRICAO: TStringField;
    QRLivroFiscalArquivoNUM_NOTA: TFloatField;
    QRLivroFiscalArquivoCOD_SERIE: TStringField;
    QRLivroFiscalArquivoIND_SITUACAO: TStringField;
    QRLivroFiscalArquivoCOD_FILIAL: TFloatField;
    QRLivroFiscalArquivoSITUACAO: TStringField;
    QRLivroFiscalArquivoPERC_ALIQUOTA: TFloatField;
    QRLivroFiscalArquivoNAT_OPERACAO: TFloatField;
    QRLivroFiscalArquivoIND_FISICA_JURIDICA: TStringField;
    QRLivroFiscalArquivoVAL_TOTAL: TFloatField;
    QRLivroFiscalArquivoVAL_ICM_BASE: TFloatField;
    QRLivroFiscalArquivoVAL_ICM: TFloatField;
    QRLivroFiscalArquivoVAL_BASE_ISENTA: TFloatField;
    QRLivroFiscalArquivoVAL_BASE_OUTRAS: TFloatField;
    QRLcto: TOracleDataSet1;
    QRLctoNUM_ANO: TIntegerField;
    QRLctoNUM_MES: TIntegerField;
    QRLctoCOD_FILIAL: TIntegerField;
    QRLctoCOD_OPERACAO: TIntegerField;
    QRLctoVAL_IMPOSTO: TFloatField;
    QRLctoDESC_LCTO: TStringField;
    QRLctoDESC_COMPLEMENTO: TStringField;
    QRLctoCOD_LIVRO_LCTO: TIntegerField;
    QRNotasOperacao: TOracleDataSet1;
    QRNotasOperacaoCOD_NOTA_CAB: TFloatField;
    QRNotasOperacaoDT_EMISSAO: TDateTimeField;
    QRNotasOperacaoDT_RECEBIMENTO: TDateTimeField;
    QRNotasOperacaoIND_ENTRADA_SAIDA: TStringField;
    QRNotasOperacaoNUM_NOTA: TFloatField;
    QRNotasOperacaoCOD_SERIE: TStringField;
    QRNotasOperacaoCOD_OPERACAO: TFloatField;
    QRNotasOperacaoDESC_OPERACAO: TStringField;
    QRNotasOperacaoDESC_RESUMO: TStringField;
    QRNotasOperacaoSVAL_TOTAL: TFloatField;
    QRNotasOperacaoDESC_VALOR: TStringField;
    QRNotasOperacaosVal_Funrural: TFloatField;
    QRNotasImposto: TOracleDataSet1;
    QRNotasImpostoCOD_FILIAL: TIntegerField;
    QRNotasImpostoCOD_ESTADO: TStringField;
    QRNotasImpostoNUM_NOTA: TIntegerField;
    QRNotasImpostoDT_EMISSAO: TDateTimeField;
    QRNotasImpostoIND_ENTRADA_SAIDA: TStringField;
    QRNotasImpostoPERC_ALIQUOTA: TFloatField;
    QRNotasImpostoNAT_OPERACAO: TFloatField;
    QRNotasImpostoSVAL_TOTAL: TFloatField;
    QRNotasImpostoSVAL_ICMS: TFloatField;
    QRLivro_DFC: TOracleDataSet1;
    QRLivroNEPrefeitura: TOracleDataSet1;
    QRLivroNEPrefeituraNUM_CGC_CPF: TStringField;
    QRLivroNEPrefeituraDT_EMISSAO: TDateTimeField;
    QRLivroNEPrefeituraNUM_NOTA: TIntegerField;
    QRLivroNEPrefeituraCOD_PRODUTO: TFloatField;
    QRLivroNEPrefeituraDESC_PRODUTO: TStringField;
    QRLivroNEPrefeituraQT_QUANTIDADE: TFloatField;
    QRLivroNEPrefeituraVAL_UNITARIO: TFloatField;
    QRLivroNEPrefeituraVAL_TOTAL: TFloatField;
    QRLivroRelNFPeriodo: TOracleDataSet1;
    QRLivroRelNFPeriodoDT_EMISSAO: TDateTimeField;
    QRLivroRelNFPeriodoNUM_NOTA: TIntegerField;
    QRLivroRelNFPeriodoIND_SITUACAO: TStringField;
    QRLivroRelNFPeriodoDESC_OPERACAO: TStringField;
    QRLivroRelNFPeriodoNOME: TStringField;
    QResumoApuracao: TOracleDataSet1;
    QResumoApuracaoNUM_ANO: TFloatField;
    QResumoApuracaoNUM_MES: TFloatField;
    QResumoApuracaoCOD_FILIAL: TFloatField;
    QResumoApuracaoNUM_BANDA: TStringField;
    QResumoApuracaoNOME_BANDA: TStringField;
    QResumoApuracaoCOD_OPERACAO: TFloatField;
    QResumoApuracaoOPERACAO: TStringField;
    QResumoApuracaoVALOR_TEMP: TFloatField;
    QResumoApuracaoValor: TFloatField;
    QRLivroFResumoOpS: TOracleDataSet1;
    QRLivroFResumoOpSCOD_OPERACAO: TFloatField;
    QRLivroFResumoOpSIND_ENTRADA_SAIDA: TStringField;
    QRLivroFResumoOpSDESC_OPERACAO: TStringField;
    QRLivroFResumoOpSDESC_RESUMO: TStringField;
    QRLivroFResumoOpSVAL_ICM: TFloatField;
    QRLivroFResumoOpA: TOracleDataSet1;
    QRLivroFResumoOpADT_RECEBIMENTO: TDateTimeField;
    QRLivroFResumoOpAIND_ENTRADA_SAIDA: TStringField;
    QRLivroFResumoOpADESC_OPERACAO: TStringField;
    QRLivroFResumoOpADESC_RESUMO: TStringField;
    QRLivroFResumoOpACOD_OPERACAO: TFloatField;
    QRLivroFResumoOpAVAL_ICM: TFloatField;
    QLivroFiscalCons: TOracleDataSet1;
    QLivroFiscalConsNUM_ANO: TIntegerField;
    QLivroFiscalConsNUM_MES: TIntegerField;
    QLivroFiscalConsCOD_FILIAL: TIntegerField;
    QLivroFiscalConsVAL_CR_ICM: TFloatField;
    QLivroFiscalConsVAL_DB_ICM: TFloatField;
    QLivroFiscal: TOracleDataSet1;
    QLivroFiscalNUM_ANO: TIntegerField;
    QLivroFiscalNUM_MES: TIntegerField;
    QLivroFiscalCOD_FILIAL: TIntegerField;
    QLivroFiscalVAL_CR_ICM: TFloatField;
    QLivroFiscalVAL_DB_ICM: TFloatField;
    QLivroFiscalVAL_SALDO_CREDOR: TFloatField;
    QLcto: TOracleDataSet1;
    QLctoNUM_ANO: TIntegerField;
    QLctoNUM_MES: TIntegerField;
    QLctoCOD_FILIAL: TIntegerField;
    QLctoCOD_OPERACAO: TIntegerField;
    QLctoVAL_IMPOSTO: TFloatField;
    QLctoDESC_LCTO: TStringField;
    QLctoDESC_COMPLEMENTO: TStringField;
    QLctoCOD_LIVRO_LCTO: TIntegerField;
    QRLivroNEPrefeituraDESC_REGIAO: TStringField;
    QRLivro_DFCCOD_ESTADO: TStringField;
    QRLivro_DFCDESC_CIDADE: TStringField;
    QRLivro_DFCVAL_ICM_BASE: TFloatField;
    QRLivro_DFCVAL_ICM_BASE_ISENTO: TFloatField;
    QRLivro_DFCVAL_ICM_BASE_OUTRAS: TFloatField;
    QRLivro_DFCVAL_CONTABIL: TFloatField;
    QRLivro_DFCIND_ENTRADA_SAIDA: TStringField;
    QRNFSaida_Devolucao_Periodo: TOracleDataSet1;
    QRNFSaida_Devolucao_Periodototal_isento: TFloatField;
    QRNFSaida_Devolucao_PeriodoDT_RECEBIMENTO: TDateTimeField;
    QRNFSaida_Devolucao_PeriodoNUM_NOTA: TIntegerField;
    QRNFSaida_Devolucao_PeriodoVAL_BASE_ICM: TFloatField;
    QRNFSaida_Devolucao_PeriodoT_VENDA: TFloatField;
    QRNFSaida_Devolucao_PeriodoDESC_ESTADO: TStringField;
    QRLivroFiscalArquivoCOD_NOTA_CAB: TFloatField;
    QRLivroFiscalArquivoItens: TOracleDataSet1;
    QRLivroFiscalArquivoItensPERC_ALIQUOTA: TFloatField;
    QRLivroFiscalArquivoItensCOD_PRODUTO: TFloatField;
    QRLivroFiscalArquivoItensQT_QUANTIDADE: TFloatField;
    QRLivroFiscalArquivoItensVAL_TOTAL: TFloatField;
    QRLivroFiscalArquivoItensVAL_DESCONTO: TFloatField;
    QRLivroFiscalArquivoItensVAL_ICM_BASE: TFloatField;
    QRLivroFiscalArquivoItensDESC_PRODUTO: TStringField;
    QRLivroFiscalArquivoItensDESC_UNIDADE: TStringField;
    QRLivroFiscalArquivoDT_RECEBIMENTO: TDateTimeField;
    QRNotasImpostoIND_CONDICAO_PAGTO: TStringField;
    QRNotasImpostoDESC_RESUMO: TStringField;
    QRNotasImpostodesc_pagto: TStringField;
    QRNotasImpostoNOME: TStringField;
    QRLivroFiscalArquivo_R70: TOracleDataSet1;
    QRNotasImpostoCOD_CADASTRO: TIntegerField;
    QRLivroFiscalArquivo_R75: TOracleDataSet1;
    QRLivroFiscalArquivo_R75PERC_ALIQUOTA: TFloatField;
    QRLivroFiscalArquivo_R75DESC_PRODUTO: TStringField;
    QRLivroFiscalArquivo_R75DESC_UNIDADE: TStringField;
    QRLivroFiscalArquivo_R75COD_PRODUTO: TFloatField;
    QRNotasOperacaoResumoNAT_OPERACAO: TFloatField;
    QRLivroFiscalArquivoItensNUM_NOTA: TIntegerField;
    QRLivroFiscalArquivoItensCOD_SERIE: TStringField;
    QRLivroFiscalArquivoItensNAT_OPERACAO: TFloatField;
    QRLivroFiscalArquivoItensIND_FISICA_JURIDICA: TStringField;
    QRLivroFiscalArquivoItensNUM_CGC_CPF: TStringField;
    QRNotasOperacaoResumoIND_ESTOQUE: TStringField;
    QRLivroFiscalArquivo_R70UF_CLIENTE: TStringField;
    QRLivroFiscalArquivo_R70NUM_CGC_CPF: TStringField;
    QRLivroFiscalArquivo_R70NUM_INSCRICAO: TStringField;
    QRLivroFiscalArquivo_R70NUM_CONHECIMENTO: TFloatField;
    QRLivroFiscalArquivo_R70COD_SERIE: TStringField;
    QRLivroFiscalArquivo_R70DT_EMISSAO: TDateTimeField;
    QRLivroFiscalArquivo_R70COD_FILIAL: TFloatField;
    QRLivroFiscalArquivo_R70SITUACAO: TStringField;
    QRLivroFiscalArquivo_R70NAT_OPERACAO: TFloatField;
    QRLivroFiscalArquivo_R70IND_FISICA_JURIDICA: TStringField;
    QRLivroFiscalArquivo_R70VAL_TOTAL: TFloatField;
    QRLivroFiscalArquivo_R70VAL_ICM_BASE: TFloatField;
    QRLivroFiscalArquivo_R70VAL_ICM: TFloatField;
    QRLivroFiscalArquivo_R70VAL_BASE_ISENTO: TFloatField;
    QRLivroFiscalArquivo_R70VAL_BASE_OUTRAS: TFloatField;
    QRNotasOperacao2: TOracleDataSet1;
    QRNotasOperacao2COD_NOTA_CAB: TFloatField;
    QRNotasOperacao2DT_EMISSAO: TDateTimeField;
    QRNotasOperacao2DT_RECEBIMENTO: TDateTimeField;
    QRNotasOperacao2IND_ENTRADA_SAIDA: TStringField;
    QRNotasOperacao2NUM_NOTA: TFloatField;
    QRNotasOperacao2COD_SERIE: TStringField;
    QRNotasOperacao2COD_OPERACAO: TFloatField;
    QRNotasOperacao2DESC_OPERACAO: TStringField;
    QRNotasOperacao2DESC_RESUMO: TStringField;
    QRNotasOperacao2SVAL_TOTAL: TFloatField;
    QRNotasOperacao2sval_funrural: TFloatField;
    QRNotasOperacao2DESC_VALOR: TStringField;
    procedure QLctoAfterPost(DataSet: TDataSet);
    procedure QLctoAfterInsert(DataSet: TDataSet);
    procedure QResumoApuracaoCalcFields(DataSet: TDataSet);
    procedure QLctoBeforeEdit(DataSet: TDataSet);
    procedure QLctoBeforeDelete(DataSet: TDataSet);
    procedure QLctoBeforeInsert(DataSet: TDataSet);
    procedure QLivroFiscalBeforeInsert(DataSet: TDataSet);
    procedure QLivroFiscalBeforeEdit(DataSet: TDataSet);
    procedure QLivroFiscalAfterCancel(DataSet: TDataSet);
    procedure QLivroFiscalAfterPost(DataSet: TDataSet);
    procedure QRLivroFiscalArquivoCalcFields(DataSet: TDataSet);
    procedure QRNotasOperacaoCalcFields(DataSet: TDataSet);
    procedure QRNFSaida_Devolucao_PeriodoCalcFields(DataSet: TDataSet);
    procedure QRNotasImpostoCalcFields(DataSet: TDataSet);
    procedure QRNotasOperacao2CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure SetaRegistro(wFilial,wAno,wMes:Integer);
    Procedure CalculaApuracao;
  end;

var
  DMLivroFiscal: TDMLivroFiscal;

implementation

uses URegEntrada_cl, UOracle_cl;

{$R *.DFM}

{ TDMLivroFiscal }

procedure TDMLivroFiscal.SetaRegistro(wFilial, wAno, wMes: Integer);
begin
  QLivroFiscal.Close;
  QLivroFiscal.SetVariable('FILIAL',wFilial);
  QLivroFiscal.SetVariable('ANO',wAno);
  QLivroFiscal.SetVariable('MES',wMes);
  QLivroFiscal.Open;
  if QLivroFiscalCod_Filial.Value = 0 Then
  begin
    QLivroFiscal.Insert;
    QLivroFiscalCod_Filial.Value := wFilial;
    QLivroFiscalNum_Ano.Value := wAno;
    QLivroFiscalNum_Mes.Value := wMes;
  end;
  QLcto.Open;
end;

procedure TDMLivroFiscal.CalculaApuracao;
Var wDataI, wDataF : String;
    wUltDia : Integer;
    wValorCreditado, wValorDebitado : Real;
begin
  wDataI := '01/'+FormatFloat('00',QLivroFiscalNum_Mes.Value)+'/'+FormatFloat('0000',QLivroFiscalNum_Ano.Value);
  wUltDia := DMOracle.DiasNoMes(StrToDate(wDataI));
  wDataF := FormatFloat('00',wUltDia)+'/'+FormatFloat('00',QLivroFiscalNum_Mes.Value)+'/'+FormatFloat('0000',QLivroFiscalNum_Ano.Value);
  With DMRegEntrada do
  Begin
    QApuracaoE.Close;
    QApuracaoE.SetVariable('FILIAL',QLivroFiscalCod_Filial.Value);
    QApuracaoE.SetVariable('DATA_I',wDataI);
    QApuracaoE.SetVariable('DATA_F',wDataF);
    QApuracaoE.Open;
    wValorCreditado := 0;
    While not QApuracaoE.Eof do
    Begin
      wValorCreditado := wValorCreditado+QApuracaoEVal_ICM.Value;
      QApuracaoE.Next;
    End;
    QApuracaoS.Close;
    QApuracaoS.SetVariable('FILIAL',QLivroFiscalCod_Filial.Value);
    QApuracaoS.SetVariable('DATA_I',StrToDate(wDataI));
    QApuracaoS.SetVariable('DATA_F',StrToDate(wDataF));
    QApuracaoS.Open;
    wValorDebitado := 0;
    While not QApuracaoS.Eof do
    Begin
      wValorDebitado := wValorDebitado+QApuracaoSVal_ICM.Value;
      QApuracaoS.Next;
    End;
  End;
  QLivroFiscal.Edit;
  QLivroFiscalVal_CR_ICM.Value := wValorCreditado;
  QLivroFiscalVal_DB_ICM.Value := wValorDebitado;
end;

procedure TDMLivroFiscal.QLctoAfterPost(DataSet: TDataSet);
begin
  QLcto.Close;
  QLcto.Open;
end;

procedure TDMLivroFiscal.QLctoAfterInsert(DataSet: TDataSet);
begin
  //QLctoCod_Livro_Lcto.Value := DMOracle.Sequencia('LIVRO_LCTO');
  QLctoCod_Filial.Value     := QLivroFiscalCod_Filial.Value;
  QLctoNum_Ano.Value        := QLivroFiscalNum_Ano.Value;
  QLctoNum_Mes.Value        := QLivroFiscalNum_Mes.Value;
end;

procedure TDMLivroFiscal.QResumoApuracaoCalcFields(DataSet: TDataSet);
var wSoma : String;
begin
  // Calculo do Valor
  QResumoApuracaoValor.Value := QResumoApuracaoValor_Temp.Value;
  if QResumoApuracaoCod_Operacao.Value <> 8 Then
   begin
    wSoma := DMOracle.BuscaNome('SELECT SUM(VAL_IMPOSTO) FROM TB_LIVRO_LCTO',
                   'COD_FILIAL        ='+QResumoApuracaoCod_Filial.Text
                   +' AND NUM_ANO     ='+QResumoApuracaoNum_Ano.Text
                   +' AND NUM_MES     ='+QResumoApuracaoNum_Mes.Text
                   +' AND COD_OPERACAO='+QResumoApuracaoCod_Operacao.Text);
   end
  else
   begin
    wSoma := DMOracle.BuscaNome('SELECT SUM(VAL_IMPOSTO) FROM TB_LIVRO_LCTO',
                   'COD_FILIAL = '+QResumoApuracaoCod_Filial.Text
                   +' AND NUM_ANO = '+QResumoApuracaoNum_Ano.Text
                   +' AND NUM_MES = '+QResumoApuracaoNum_Mes.Text
                   +' AND ( COD_OPERACAO  = 006 OR COD_OPERACAO = 007)');
   end;
  if Trim(wSoma) <> '' Then
     QResumoApuracaoValor.Value := QResumoApuracaoValor.Value + StrToFloat(wSoma);
end;

procedure TDMLivroFiscal.QLctoBeforeEdit(DataSet: TDataSet);
begin
//  if QLivroFiscal.State <> dsEdit Then
//     raise Exception.Create('Não estão no modo de Alteração!');
end;

procedure TDMLivroFiscal.QLctoBeforeDelete(DataSet: TDataSet);
begin
//  If QLivroFiscal.State <> dsEdit Then
//    Raise Exception.Create('Não estão no modo de Alteração!');
end;

procedure TDMLivroFiscal.QLctoBeforeInsert(DataSet: TDataSet);
begin
  if QLivroFiscal.State = dsInsert Then
  begin
    QLivroFiscal.Post;
    QLivroFiscal.Edit;
  end;
 // if QLivroFiscal.State <> dsEdit Then
 //    raise Exception.Create('Não estão no modo de Alteração!');
end;

procedure TDMLivroFiscal.QLivroFiscalBeforeInsert(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMLivroFiscal.QLivroFiscalBeforeEdit(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMLivroFiscal.QLivroFiscalAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QLivroFiscal.Close;
  QLivroFiscal.Open;
end;

procedure TDMLivroFiscal.QLivroFiscalAfterPost(DataSet: TDataSet);
var
  wFilial, wAno, wMes : integer;
begin
  wFilial := QLivroFiscalCod_Filial.Value;
  wAno    := QLivroFiscalNum_Ano.Value;
  wMes    := QLivroFiscalNum_Mes.Value;
  QLivroFiscal.Close;
  QLivroFiscal.SetVariable('FILIAL',wFilial);
  QLivroFiscal.SetVariable('ANO',wAno);
  QLivroFiscal.SetVariable('MES',wMes);
  QLivroFiscal.Open;
end;

procedure TDMLivroFiscal.QRLivroFiscalArquivoCalcFields(DataSet: TDataSet);
begin
  // QRLivroFiscalArquivoVAL_ISENTAS.Value := (QRLivroFiscalArquivoVal_Total.Value - QRLivroFiscalArquivoVal_Icm_Base.Value);
end;

procedure TDMLivroFiscal.QRNotasOperacaoCalcFields(DataSet: TDataSet);
var wFunrural : String;
begin
  QRNotasOperacaosVal_Funrural.Value := 0;
  if QRNotasOperacaoDESC_VALOR.Value <> 'Valor Funrural' Then
  begin
    wFunrural := DmOracle.BuscaNome('SELECT VAL_FUNRURAL FROM TB_NOTA_CAB', 'COD_NOTA_CAB = ' + FloatToStr(QRNotasOperacaoCod_Nota_Cab.Value));
    if wFunrural <> ''  Then
       QRNotasOperacaosVal_Funrural.Value := StrToFloat(wFunrural);
  end;

end;

procedure TDMLivroFiscal.QRNFSaida_Devolucao_PeriodoCalcFields(
  DataSet: TDataSet);
begin
  if QRNFSaida_Devolucao_PeriodoVAL_BASE_ICM.Value = 0 then
     QRNFSaida_Devolucao_Periodototal_isento.Value:= QRNFSaida_Devolucao_PeriodoT_VENDA.Value
  else
     QRNFSaida_Devolucao_Periodototal_isento.Value:= QRNFSaida_Devolucao_PeriodoT_VENDA.Value-
                                                     QRNFSaida_Devolucao_PeriodoVAL_BASE_ICM.Value;
end;

procedure TDMLivroFiscal.QRNotasImpostoCalcFields(DataSet: TDataSet);
begin
  If QRNotasImpostoInd_Condicao_Pagto.Value = '2' Then
     QRNotasImpostoDesc_Pagto.Value := 'A Prazo'
  Else
     QRNotasImpostoDesc_Pagto.Value := 'A Vista';
end;

procedure TDMLivroFiscal.QRNotasOperacao2CalcFields(DataSet: TDataSet);
var wFunrural : String;
begin
  QRNotasOperacao2sVal_Funrural.Value := 0;
  if QRNotasOperacao2DESC_VALOR.Value <> 'Funrural' Then
  begin
    wFunrural := DmOracle.BuscaNome('SELECT VAL_FUNRURAL FROM TB_NOTA_CAB', 'COD_NOTA_CAB = ' + FloatToStr(QRNotasOperacao2Cod_Nota_Cab.Value));
    if wFunrural <> ''  Then
       QRNotasOperacao2sVal_Funrural.Value := StrToFloat(wFunrural);
  end;

end;

end.
