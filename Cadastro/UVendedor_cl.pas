unit UVendedor_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste, Provider, DBClient, Oracle;

type
  TDMVendedor = class(TDataModule)
    QVendedor: TOracleDataSet1;
    QVendedorCOD_VENDEDOR: TIntegerField;
    QVendedorCOD_ESTADO: TStringField;
    QVendedorNOME: TStringField;
    QVendedorDESC_ENDERECO: TStringField;
    QVendedorDESC_CIDADE: TStringField;
    QVendedorDESC_CEP: TStringField;
    QVendedorDESC_E_MAIL: TStringField;
    QVendedorDT_NASCIMENTO: TDateTimeField;
    QVendedorDESC_CPF: TStringField;
    QVendedorDESC_IDENTIDADE: TStringField;
    QVendedorPERC_COMISSAO1: TFloatField;
    QVendedorPERC_COMISSAO2: TFloatField;
    QVendedorPERC_IRRF: TFloatField;
    QVendedorCOD_SUPERVISOR: TIntegerField;
    QVendedorDESC_FAX: TStringField;
    QVendedorIND_TIPO_FRETE: TStringField;
    QVendedorNOME_CONTATO1: TStringField;
    QVendedorNOME_CONTATO2: TStringField;
    QVendedorNOME_CONTATO3: TStringField;
    QVendedorIND_SITUACAO: TStringField;
    QVendedorCons: TOracleDataSet1;
    QVendedorConsCOD_VENDEDOR: TIntegerField;
    QVendedorConsNOME: TStringField;
    QVendedorConsIND_SITUACAO: TStringField;
    QVendRegiaoTela: TOracleDataSet1;
    QVendRegiaoTelaCOD_REGIAO: TIntegerField;
    QVendRegiaoTelaCOD_VENDEDOR: TIntegerField;
    QVendRegiaoTelaDESC_REGIAO: TStringField;
    QVendedorRegiao: TOracleDataSet1;
    QRSupervisor: TOracleDataSet1;
    QRVendedor: TOracleDataSet1;
    QQuotaVendedor: TOracleDataSet1;
    QQuotaVendedornome_vendedor: TStringField;
    QQuotaVendedornome_classe: TStringField;
    QRVendedorRegiao: TOracleDataSet1;
    QRVendedorRegiaoCOD_REGIAO: TIntegerField;
    QRVendedorRegiaoDESC_REGIAO: TStringField;
    QRVendedorRegiaoCOD_VENDEDOR: TIntegerField;
    QRVendedorRegiaoNOME: TStringField;
    QVendedorRegiaoCOD_VENDEDOR: TIntegerField;
    QVendedorRegiaoCOD_REGIAO: TIntegerField;
    QVendedorRegiaoDT_LIBERACAO: TDateTimeField;
    QVenda_Regiao: TOracleDataSet1;
    QVenda_RegiaoCOD_FILIAL: TIntegerField;
    QVenda_RegiaoCOD_VENDEDOR: TIntegerField;
    QVenda_RegiaoCOD_REGIAO: TIntegerField;
    QVenda_RegiaoNUM_MES: TIntegerField;
    QVenda_RegiaoNUM_ANO: TIntegerField;
    QVenda_RegiaoQT_QUANTIDADE: TFloatField;
    QVenda_RegiaoCOD_VENDA_REGIAO: TIntegerField;
    QVenda_regiaoCons: TOracleDataSet1;
    QVenda_regiaoConsCOD_FILIAL: TIntegerField;
    QVenda_regiaoConsCOD_VENDEDOR: TIntegerField;
    QVenda_regiaoConsCOD_REGIAO: TIntegerField;
    QVenda_regiaoConsNUM_MES: TIntegerField;
    QVenda_regiaoConsNUM_ANO: TIntegerField;
    QVenda_regiaoConsQT_QUANTIDADE: TFloatField;
    QVenda_regiaoConsCOD_VENDA_REGIAO: TIntegerField;
    QVenda_regiaoConsDESC_FILIAL: TStringField;
    QVenda_regiaoConsNOME: TStringField;
    QVenda_regiaoConsDESC_REGIAO: TStringField;
    QVenda_regiaoConsQT_POPULACAO: TFloatField;
    QRVenda_regiao: TOracleDataSet1;
    QRVenda_regiaoCOD_FILIAL: TFloatField;
    QRVenda_regiaoCOD_VENDEDOR: TFloatField;
    QRVenda_regiaoCOD_REGIAO: TFloatField;
    QRVenda_regiaoQT_POPULACAO: TFloatField;
    QRVenda_regiaoNOME: TStringField;
    QRVenda_regiaoDESC_REGIAO: TStringField;
    QRVenda_regiaoJAN: TFloatField;
    QRVenda_regiaoFEV: TFloatField;
    QRVenda_regiaoMAR: TFloatField;
    QRVenda_regiaoABR: TFloatField;
    QRVenda_regiaoMAI: TFloatField;
    QRVenda_regiaoJUN: TFloatField;
    QRVenda_regiaoJUL: TFloatField;
    QRVenda_regiaoAGO: TFloatField;
    QRVenda_regiaoSETEM: TFloatField;
    QRVenda_regiaoOUT: TFloatField;
    QRVenda_regiaoNOV: TFloatField;
    QRVenda_regiaoDEZ: TFloatField;
    QRVenda_regiaoTotalKGHab: TFloatField;
    QRVenda_regiaoTotalAno: TFloatField;
    QRVenda_regiaopop_jan: TFloatField;
    QRVenda_regiaopop_fev: TFloatField;
    QRVenda_regiaopop_mar: TFloatField;
    QRVenda_regiaopop_abr: TFloatField;
    QRVenda_regiaopop_maio: TFloatField;
    QRVenda_regiaopop_jun: TFloatField;
    QRVenda_regiaopop_jul: TFloatField;
    QRVenda_regiaopop_ago: TFloatField;
    QRVenda_regiaopop_set: TFloatField;
    QRVenda_regiaopop_out: TFloatField;
    QRVenda_regiaopop_nov: TFloatField;
    QRVenda_regiaopop_dez: TFloatField;
    QVendedorDT_CADASTRO: TDateTimeField;
    QRVendedorCOD_VENDEDOR: TIntegerField;
    QRVendedorPERC_IRRF: TFloatField;
    QRVendedorNOME: TStringField;
    QRVendedorDESC_ENDERECO: TStringField;
    QRVendedorDESC_CIDADE: TStringField;
    QRVendedorCOD_ESTADO: TStringField;
    QRVendedorDESC_TELEFONE: TStringField;
    QRVendedorDESC_CELULAR: TStringField;
    QRVendedorPERC_COMISSAO1: TFloatField;
    QRVendedorPERC_COMISSAO2: TFloatField;
    QRVendedorPERC_IRRF_1: TFloatField;
    QRVendedorDESC_CEP: TStringField;
    QRVendedorDESC_CPF: TStringField;
    QRVendedorDESC_IDENTIDADE: TStringField;
    QRVendedorDESC_E_MAIL: TStringField;
    QVendedorPERC_FRETE: TFloatField;
    QRCidadeVendedor: TOracleDataSet1;
    QRCidadeVendedorCOD_VENDEDOR: TIntegerField;
    QRCidadeVendedorNOME: TStringField;
    QRCidadeVendedorCOD_CIDADE: TIntegerField;
    QRCidadeVendedorDESC_CIDADE: TStringField;
    QVendedorCOD_DEPARTAMENTO: TIntegerField;
    QQuotaVendedorCons: TOracleDataSet1;
    QRVendedorQuota: TOracleDataSet1;
    QRVendedorQuotaCOD_VENDEDOR: TIntegerField;
    QRVendedorQuotaQT_QUOTA: TFloatField;
    QRVendedorQuotaNUM_ANO: TIntegerField;
    QRVendedorQuotaNUM_MES: TIntegerField;
    QRVendedorQuotaQT_QUOTA_KG: TFloatField;
    QRVendedorQuotaNOME: TStringField;
    QVendedorPERC_ICMS_POCKET: TFloatField;
    QVendedorCOD_BANCO_AGENCIA: TIntegerField;
    QVendedorDESC_AGENCIA: TStringField;
    QVendedorDESC_CONTA_CORRENTE: TStringField;
    QRVendedorCOD_BANCO_AGENCIA: TIntegerField;
    QRVendedorDESC_AGENCIA: TStringField;
    QRVendedorDESC_CONTA_CORRENTE: TStringField;
    QVendedorVAL_FRETE_POCKET: TFloatField;
    QReplicaCotasVendedor: TOracleDataSet1;
    QVendedorCOD_FILIAL: TIntegerField;
    QVendedorIND_TROCA: TStringField;
    QVendedorIND_BONIFICACAO: TStringField;
    QVendedorIND_BRINDE: TStringField;
    QVendedorIND_AMOSTRA: TStringField;
    QVendedorIND_SEM_NOTA: TStringField;
    QRSupervisorCidade: TOracleDataSet1;
    QRSupervisorCidadeCOD_CIDADE: TIntegerField;
    QRSupervisorCidadeDESC_CIDADE: TStringField;
    QVendedorPremio: TOracleDataSet1;
    QVendedorPremioCOD_PREMIO_VENDEDOR: TIntegerField;
    QVendedorPremioCOD_VENDEDOR: TIntegerField;
    QVendedorPremioNUM_ANO: TIntegerField;
    QVendedorPremioNUM_MES: TIntegerField;
    QVendedorPremioNUM_BONUS_QUALIDADE: TFloatField;
    QVendedorPremioVAL_PREMIO: TFloatField;
    QVendedorPremioPERC_INADIMPLENCIA: TFloatField;
    QTabelaVendedor: TOracleDataSet1;
    QTabelaVendedorCOD_VENDEDOR: TIntegerField;
    QTabelaVendedorCOD_TABELA_POCKET: TIntegerField;
    QTabelaVendedor_All: TOracleDataSet1;
    QTabelaVendedor_AllCOD_TABELA_POCKET: TIntegerField;
    QTabelaVendedor_AllDESC_TABELA: TStringField;
    QTabelaVendedordesc_tabela: TStringField;
    QVendedorPremioNOTA_DE1: TFloatField;
    QVendedorPremioNOTA_ATE1: TFloatField;
    QVendedorPremioPERC_PREMIO1: TFloatField;
    QVendedorPremioNOTA_DE2: TFloatField;
    QVendedorPremioNOTA_ATE2: TFloatField;
    QVendedorPremioPERC_PREMIO2: TFloatField;
    QVendedorPremioNOTA_DE3: TFloatField;
    QVendedorPremioNOTA_ATE3: TFloatField;
    QVendedorPremioPERC_PREMIO3: TFloatField;
    QVendedorPremioNOTA_DE4: TFloatField;
    QVendedorPremioNOTA_ATE4: TFloatField;
    QVendedorPremioPERC_PREMIO4: TFloatField;
    QVendedorPremioNOTA_DE5: TFloatField;
    QVendedorPremioNOTA_ATE5: TFloatField;
    QVendedorPremioPERC_PREMIO5: TFloatField;
    QVendedorPremioNOTA_DE6: TFloatField;
    QVendedorPremioNOTA_ATE6: TFloatField;
    QVendedorPremioPERC_PREMIO6: TFloatField;
    QVendedorPremioNOTA_DE7: TFloatField;
    QVendedorPremioNOTA_ATE7: TFloatField;
    QVendedorPremioPERC_PREMIO7: TFloatField;
    QVendedorPremioNOTA_DE8: TFloatField;
    QVendedorPremioNOTA_ATE8: TFloatField;
    QVendedorPremioPERC_PREMIO8: TFloatField;
    QVendedorPremioNOTA_DE9: TFloatField;
    QVendedorPremioNOTA_ATE9: TFloatField;
    QVendedorPremioPERC_PREMIO9: TFloatField;
    QVendedorPremioNOTA_DE10: TFloatField;
    QVendedorPremioNOTA_ATE10: TFloatField;
    QVendedorPremioPERC_PREMIO10: TFloatField;
    QVendedorPremioNOTA_ACIMA: TFloatField;
    QVendedorPremioPERC_PREMIO_ACIMA: TFloatField;
    QQuotaVendedorVAL_QUOTA: TFloatField;
    QQuotaVendedorQT_QUOTA: TFloatField;
    QQuotaVendedorQT_QUOTA_KG: TFloatField;
    QMetaKGGrafico: TOracleDataSet1;
    QMetaKGGraficoDESCRICAO: TStringField;
    QMetaKGGraficoQUANTIDADE: TFloatField;
    QMetaValGrafico: TOracleDataSet1;
    QMetaValGraficoDESCRICAO: TStringField;
    QMetaValGraficoVALOR: TFloatField;
    QQuotaVendedorConsCOD_VENDEDOR_QUOTA: TIntegerField;
    QQuotaVendedorConsVAL_QUOTA: TFloatField;
    QQuotaVendedorConsNUM_ANO: TIntegerField;
    QQuotaVendedorConsNUM_MES: TIntegerField;
    QQuotaVendedorConsQT_QUOTA_KG: TFloatField;
    QQuotaVendedorConsNOME: TStringField;
    QSomaComissao: TOracleDataSet1;
    QSomaComissaoCOD_VENDEDOR: TIntegerField;
    QSomaComissaoVAL_TOTAL: TFloatField;
    QQuotaVendedorCOD_GRUPO_PRODUTO_META: TIntegerField;
    QQuotaVendedorCOD_VENDEDOR_QUOTA: TIntegerField;
    QQuotaVendedorNUM_MES: TIntegerField;
    QQuotaVendedorNUM_ANO: TIntegerField;
    QQuotaVendedorCOD_VENDEDOR: TIntegerField;
    QQuotaVendedorCOD_PRODUTO: TFloatField;
    QQuotaVendedorConsCOD_PRODUTO: TFloatField;
    QQuotaVendedorConsDESC_PRODUTO: TStringField;
    QQuotaVendedorQT_QUOTA_KG_PADRAO: TFloatField;
    QCotaSupervisor: TOracleDataSet1;
    QCotaSupervisorQT_SUPERVISOR: TFloatField;
    QCotaSupervisorQT_QUOTA_KG_VENDEDORES: TFloatField;
    QCotaSupervisorQT_QUOTA_KG_PADRAO: TFloatField;
    QRVendedorQuotaDESC_PRODUTO: TStringField;
    QVendedorPERC_DESCONTO_LIBERADO: TIntegerField;
    QVendedorPERC_DESCONTO_RESTRICAO: TIntegerField;
    QVendedorPERC_ACRESCIMO_MAXIMO: TIntegerField;
    QVendedorPERC_NOTA_FISCAL: TIntegerField;
    OPVendedor: TOraclePackage;
    QRQuotaSupervisorVendedor: TOracleDataSet1;
    QRQuotaSupervisorVendedorSUPERVISOR: TStringField;
    QRQuotaSupervisorVendedorPRODUTO: TStringField;
    QRQuotaSupervisorVendedorVENDEDOR: TStringField;
    QRQuotaSupervisorVendedorKG_SUPERVISOR: TFloatField;
    QRQuotaSupervisorVendedorPADRAO_SUPERVISOR: TFloatField;
    QRQuotaSupervisorVendedorKG_VENDEDOR: TFloatField;
    QRQuotaSupervisorVendedorPADRAO_VENDEDOR: TFloatField;
    QVendedorDESC_BAIRRO: TStringField;
    QVendedorConsDESC_CIDADE: TStringField;
    QVendedorPERC_COMISSAO3: TFloatField;
    QVendedorPERC_COMISSAO4: TFloatField;
    QVendedorDESC_TELEFONE: TStringField;
    QVendedorDESC_CELULAR: TStringField;
    QVendedorConsIND_SINC_MAX_ROTEIRIZADOR: TStringField;
    QVendedorConsDESC_TELEFONE: TStringField;
    QVendedorConsDESC_CELULAR: TStringField;
    QVendedorConsCOD_SUPERVISOR: TIntegerField;
    QVendedorCOD_USUARIO: TIntegerField;
    procedure QVendedorAfterInsert(DataSet: TDataSet);
    procedure QVendedorRegiaoAfterPost(DataSet: TDataSet);
    procedure QVendedorRegiaoAfterInsert(DataSet: TDataSet);
    procedure QVendedorAfterPost(DataSet: TDataSet);
    procedure QQuotaVendedorAfterPost(DataSet: TDataSet);
    procedure QQuotaVendedorCalcFields(DataSet: TDataSet);
    procedure QQuotaVendedorNUM_ANOValidate(Sender: TField);
    procedure QQuotaVendedorNUM_MESValidate(Sender: TField);
    procedure QQuotaVendedorAfterInsert(DataSet: TDataSet);
    procedure QVendedorRegiaoAfterDelete(DataSet: TDataSet);
    procedure QVenda_RegiaoAfterPost(DataSet: TDataSet);
    procedure QRVenda_regiaoCalcFields(DataSet: TDataSet);
    procedure QVendedorPremioAfterInsert(DataSet: TDataSet);
    procedure QTabelaVendedorCalcFields(DataSet: TDataSet);
    function retornaData(mes :Word; ano :Word) :TDateTime;
    procedure QQuotaVendedorAfterOpen(DataSet: TDataSet);
    procedure QQuotaVendedorBeforePost(DataSet: TDataSet);
    procedure QVendedorBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMVendedor: TDMVendedor;

implementation

uses UOracle_cl, UUsuario_cl;

{$R *.DFM}

procedure TDMVendedor.QVendedorAfterInsert(DataSet: TDataSet);
begin
  QVendedorCod_Vendedor.Value := DMOracle.Sequencia('VENDEDOR');
end;

procedure TDMVendedor.QVendedorRegiaoAfterPost(DataSet: TDataSet);
Var wRegiao : Real;
begin
  wRegiao := QVendedorRegiaoCod_Regiao.Value;
  QVendRegiaoTela.Close;
  QVendRegiaoTela.Open;
  QVendRegiaoTela.Locate('COD_REGIAO',wRegiao,[]);
end;

procedure TDMVendedor.QVendedorRegiaoAfterInsert(DataSet: TDataSet);
begin
  QVendedorRegiaoDt_Liberacao.Value := DMOracle.DataServ;
end;

procedure TDMVendedor.QVendedorAfterPost(DataSet: TDataSet);
Var wCodigo : Integer;
begin
  wCodigo := QVendedorCod_Vendedor.Value;
  QVendedor.Close;
  QVendedor.SetVariable('PK',wCodigo);
  QVendedor.Open; 
end;

procedure TDMVendedor.QQuotaVendedorAfterPost(DataSet: TDataSet);
var
  wCodigo :Integer;
begin
  wCodigo := QQuotaVendedorCOD_VENDEDOR_QUOTA.Value;
  QQuotaVendedor.Close;
  QQuotaVendedor.SetVariable('PK',wCodigo);
  QQuotaVendedor.Open;
end;

procedure TDMVendedor.QQuotaVendedorCalcFields(DataSet: TDataSet);
begin
  QQuotaVendedornome_vendedor.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+FloatToStr(QQuotaVendedorCod_Vendedor.Value),True);
  //QQuotaVendedornome_classe.Value := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(QQuotaVendedorCod_Classe.Value),True);
end;

procedure TDMVendedor.QQuotaVendedorNUM_ANOValidate(Sender: TField);
begin
  If (QQuotaVendedorNum_Ano.Value < 1997 ) or
     (QQuotaVendedorNum_Ano.Value > 2030 ) Then
    Raise Exception.Create('Ano Inválido!');
end;

procedure TDMVendedor.QQuotaVendedorNUM_MESValidate(Sender: TField);
begin
  If (QQuotaVendedorNum_Mes.Value < 1) or
     (QQuotaVendedorNum_Mes.Value > 12 ) Then
    Raise Exception.Create('Mês Inválido!');
end;

procedure TDMVendedor.QQuotaVendedorAfterInsert(DataSet: TDataSet);
Var wAno,wMes,wDia : Word;
begin
  DecodeDate(Date,wAno,wMes,wDia);
  QQuotaVendedorNum_Mes.Value := wMes;
  QQuotaVendedorNum_Ano.Value := wAno;
end;

procedure TDMVendedor.QVendedorRegiaoAfterDelete(DataSet: TDataSet);
Var wRegiao : Real;
begin
  QVendRegiaoTela.Next;
  wRegiao := QVendRegiaoTelaCod_Regiao.Value;
  QVendRegiaoTela.Close;
  QVendRegiaoTela.Open;
  QVendRegiaoTela.Locate('COD_REGIAO',wRegiao,[]);
end;

procedure TDMVendedor.QVenda_RegiaoAfterPost(DataSet: TDataSet);
begin
  QVenda_regiao.SetVariable('PK',QVenda_RegiaoCOD_VENDA_REGIAO.Value);
end;

procedure TDMVendedor.QRVenda_regiaoCalcFields(DataSet: TDataSet);
var mQT_Populacao, nTotalMeses: Real; nDivisor: Integer; nTotalKGHab: Real;
begin
  nTotalMeses := 0;
  nDivisor    := 0;
  nTotalKGHab := 0;
  with DMVendedor do
  begin

    if QRVenda_RegiaoQT_POPULACAO.Value = 0 Then
       mQT_Populacao:= 1
    else
       mQT_Populacao:= QRVenda_RegiaoQT_POPULACAO.Value;

    if QRVenda_RegiaoJAN.Value <> 0 then
    begin
      nDivisor := 1;
      nTotalMeses := nTotalMeses + QRVenda_RegiaoJAN.Value;
      nTotalKGHab := nTotalKGHab + QRVenda_RegiaoJAN.Value / mQT_Populacao;
      QRVenda_RegiaoPop_Jan.Value := QRVenda_RegiaoPop_Jan.Value + mQT_Populacao;
    end;

    if QRVenda_RegiaoFEV.Value <> 0 then
    begin
      nDivisor:= 2;
      nTotalMeses := nTotalMeses + QRVenda_RegiaoFEV.Value;
      nTotalKGHab := nTotalKGHab + QRVenda_RegiaoFEV.Value / mQT_Populacao;
      QRVenda_RegiaoPop_Fev.Value := QRVenda_RegiaoPop_Fev.Value + mQT_Populacao;
    end;
    if QRVenda_RegiaoMAR.Value <> 0 then
    begin
      nDivisor:= 3;
      nTotalMeses := nTotalMeses + QRVenda_RegiaoMAR.Value;
      nTotalKGHab := nTotalKGHab + QRVenda_RegiaoMAR.Value / mQT_Populacao;
      QRVenda_RegiaoPop_Mar.Value := QRVenda_RegiaoPop_Mar.Value + mQT_Populacao;
    end;
    if QRVenda_RegiaoABR.Value <> 0 then
    begin
      nDivisor:= 4;
      nTotalMeses := nTotalMeses + QRVenda_RegiaoABR.Value;
      nTotalKGHab := nTotalKGHab + QRVenda_RegiaoABR.Value / mQT_Populacao;
      QRVenda_RegiaoPop_Abr.Value := QRVenda_RegiaoPop_Abr.Value + mQT_Populacao;
    end;
    if QRVenda_RegiaoMAI.Value <> 0 then
    begin
      nDivisor:= 5;
      nTotalMeses := nTotalMeses + QRVenda_RegiaoMAI.Value;
      nTotalKGHab := nTotalKGHab + QRVenda_RegiaoMAI.Value / mQT_Populacao;
      QRVenda_RegiaoPop_Maio.Value := QRVenda_RegiaoPop_Maio.Value + mQT_Populacao;
    end;
    if QRVenda_RegiaoJUN.Value <> 0 then
    begin
      nDivisor:= 6;
      nTotalMeses := nTotalMeses + QRVenda_RegiaoJUN.Value;
      nTotalKGHab := nTotalKGHab + QRVenda_RegiaoJUN.Value / mQT_Populacao;
      QRVenda_RegiaoPop_Jun.Value := QRVenda_RegiaoPop_Jun.Value + mQT_Populacao;
    end;
    if QRVenda_RegiaoJUL.Value <> 0 then
    begin
      nDivisor:= 7;
      nTotalMeses := nTotalMeses + QRVenda_RegiaoJUL.Value;
      nTotalKGHab := nTotalKGHab + QRVenda_RegiaoJUL.Value / mQT_Populacao;
      QRVenda_RegiaoPop_Jul.Value := QRVenda_RegiaoPop_Jul.Value + mQT_Populacao;
    end;
    if QRVenda_RegiaoAGO.Value <> 0 then
    begin
      nDivisor:= 8;
      nTotalMeses := nTotalMeses + QRVenda_RegiaoAGO.Value;
      nTotalKGHab := nTotalKGHab + QRVenda_RegiaoAGO.Value / mQT_Populacao;
      QRVenda_RegiaoPop_Ago.Value := QRVenda_RegiaoPop_Ago.Value + mQT_Populacao;
    end;
    if QRVenda_RegiaoSETEM.Value <> 0 then
    begin
      nDivisor:= 9;
      nTotalMeses := nTotalMeses + QRVenda_RegiaoSETEM.Value;
      nTotalKGHab := nTotalKGHab + QRVenda_RegiaoSETEM.Value / mQT_Populacao;
      QRVenda_RegiaoPop_Set.Value := QRVenda_RegiaoPop_Set.Value + mQT_Populacao;
    end;
    if QRVenda_RegiaoOUT.Value <> 0 then
    begin
      nDivisor:= 10;
      nTotalMeses := nTotalMeses + QRVenda_RegiaoOUT.Value;
      nTotalKGHab := nTotalKGHab + QRVenda_RegiaoOUT.Value / mQT_Populacao;
      QRVenda_RegiaoPop_Out.Value := QRVenda_RegiaoPop_Out.Value + mQT_Populacao;
    end;
    if QRVenda_RegiaoNOV.Value <> 0 then
    begin
      nDivisor:= 11;
      nTotalMeses := nTotalMeses + QRVenda_RegiaoNOV.Value;
      nTotalKGHab := nTotalKGHab + QRVenda_RegiaoNOV.Value / mQT_Populacao;
      QRVenda_RegiaoPop_Nov.Value := QRVenda_RegiaoPop_Nov.Value + mQT_Populacao;
    end;
    if QRVenda_RegiaoDEZ.Value <> 0 then
    begin
      nDivisor:= 12;
      nTotalMeses := nTotalMeses + QRVenda_RegiaoDEZ.Value;
      nTotalKGHab := nTotalKGHab + QRVenda_RegiaoDEZ.Value / mQT_Populacao;
      QRVenda_RegiaoPop_Dez.Value := QRVenda_RegiaoPop_Dez.Value + mQT_Populacao;
    end;

    If nDivisor = 0 Then
       Ndivisor := 1;
    QRVenda_RegiaoTotalAno.Value := nTotalMeses / nDivisor;
    QRVenda_RegiaoTotalKGHab.Value := nTotalKGHab / nDivisor;
  end;

end;

procedure TDMVendedor.QVendedorPremioAfterInsert(DataSet: TDataSet);
begin
  QVendedorPremioCod_Vendedor.Value := QVendedorCod_Vendedor.Value;
  QVendedorPremioNOTA_DE1.Value := 90;
  QVendedorPremioNOTA_ATE1.Value := 90.9;
  QVendedorPremioPERC_PREMIO1.Value := 0.15;
  QVendedorPremioNOTA_DE2.Value := 91;
  QVendedorPremioNOTA_ATE2.Value := 91.9;
  QVendedorPremioPERC_PREMIO2.Value := 0.16;
  QVendedorPremioNOTA_DE3.Value := 92;
  QVendedorPremioNOTA_ATE3.Value := 92.9;
  QVendedorPremioPERC_PREMIO3.Value := 0.17;
  QVendedorPremioNOTA_DE4.Value := 93;
  QVendedorPremioNOTA_ATE4.Value := 93.9;
  QVendedorPremioPERC_PREMIO4.Value := 0.18;
  QVendedorPremioNOTA_DE5.Value := 94;
  QVendedorPremioNOTA_ATE5.Value := 94.9;
  QVendedorPremioPERC_PREMIO5.Value := 0.19;
  QVendedorPremioNOTA_DE6.Value := 95;
  QVendedorPremioNOTA_ATE6.Value := 95.9;
  QVendedorPremioPERC_PREMIO6.Value := 0.20;
  QVendedorPremioNOTA_DE7.Value := 96;
  QVendedorPremioNOTA_ATE7.Value := 96.9;
  QVendedorPremioPERC_PREMIO7.Value := 0.21;
  QVendedorPremioNOTA_DE8.Value := 97;
  QVendedorPremioNOTA_ATE8.Value := 97.9;
  QVendedorPremioPERC_PREMIO8.Value := 0.22;
  QVendedorPremioNOTA_DE9.Value := 98;
  QVendedorPremioNOTA_ATE9.Value := 98.9;
  QVendedorPremioPERC_PREMIO9.Value := 0.23;
  QVendedorPremioNOTA_DE10.Value := 99;
  QVendedorPremioNOTA_ATE10.Value := 99.9;
  QVendedorPremioPERC_PREMIO10.Value := 0.24;
  QVendedorPremioNOTA_ACIMA.Value := 100;
  QVendedorPremioPERC_PREMIO_ACIMA.Value := 0.25;

end;

procedure TDMVendedor.QTabelaVendedorCalcFields(DataSet: TDataSet);
begin
  QTabelaVendedorDesc_Tabela.Value := DMOracle.BuscaNome('SELECT DESC_TABELA FROM TB_TABELA_POCKET','COD_TABELA_POCKET = '+FloatToStr(QTabelaVendedorCOD_TABELA_POCKET.Value),True);
end;

function TDMVendedor.retornaData(mes :Word; ano :Word) :TDateTime;
var
  data :TDateTime;
  dia :Word;
begin
  dia := 01;
  data := EncodeDate(ano,mes,dia);
  result := data;
end;

procedure TDMVendedor.QQuotaVendedorAfterOpen(DataSet: TDataSet);
begin
//  if QQuotaVendedor.RecordCount > 0 then
//    begin
//
//      {QMetaValGrafico.Close();
//      QMetaValGrafico.SetVariable('VENDEDOR',QQuotaVendedorCOD_VENDEDOR.Value);
//      QMetaValGrafico.SetVariable('ANO',QQuotaVendedorNUM_ANO.Value);
//      QMetaValGrafico.SetVariable('MES',QQuotaVendedorNUM_MES.Value);
//      QMetaValGrafico.SetVariable('DT_INI',retornaData(QQuotaVendedorNUM_MES.Value,QQuotaVendedorNUM_ANO.Value));
//      QMetaValGrafico.SetVariable('DT_FIM',retornaData(QQuotaVendedorNUM_MES.Value,QQuotaVendedorNUM_ANO.Value));
//      QMetaValGrafico.Open();}
//
//      {cdsMetasKg.Close;
//      cdsMetasKg.Params[0].AsInteger := QQuotaVendedorCOD_VENDEDOR.Value;
//      cdsMetasKg.Params[1].AsInteger := QQuotaVendedorNUM_ANO.Value;
//      cdsMetasKg.Params[2].AsInteger := QQuotaVendedorNUM_MES.Value;
//      cdsMetasKg.Params[3].AsDate := retornaData(QQuotaVendedorNUM_MES.Value,QQuotaVendedorNUM_ANO.Value);
//      cdsMetasKg.Params[4].AsDate := retornaData(QQuotaVendedorNUM_MES.Value,QQuotaVendedorNUM_ANO.Value);
//      cdsMetasKg.Open;}
//  end;
  QSomaComissao.Close;
  QSomaComissao.SetVariable('ANO', QQuotaVendedorNUM_ANO.Text);
  QSomaComissao.SetVariable('MES', FormatFloat('00',QQuotaVendedorNUM_MES.Value));
  QSomaComissao.SetVariable('GRUPO', QQuotaVendedorCOD_GRUPO_PRODUTO_META.Value);
  QSomaComissao.Open;
end;

procedure TDMVendedor.QQuotaVendedorBeforePost(DataSet: TDataSet);
var wSupervisor: Integer;
    wCotaSupervisor, wCotaVendedores, wCotaPadraoVendedores: Double;
begin
  wSupervisor := StrToInt('0' + DMOracle.FastSelect('COD_SUPERVISOR',
    'TB_VENDEDOR', 'COD_VENDEDOR = ' + QQuotaVendedorCOD_VENDEDOR.Text));

  if wSupervisor <> 0 then
  begin
    QCotaSupervisor.Close;
    QCotaSupervisor.SetVariable('COD_SUPERVISOR', wSupervisor);
    QCotaSupervisor.SetVariable('COD_PRODUTO', QQuotaVendedorCOD_PRODUTO.Value);
    QCotaSupervisor.SetVariable('COD_VENDEDOR_IGNORAR', QQuotaVendedorCOD_VENDEDOR.Value);
    QCotaSupervisor.Open;

    wCotaSupervisor := QCotaSupervisorQT_SUPERVISOR.Value;
    wCotaVendedores := QCotaSupervisorQT_QUOTA_KG_VENDEDORES.Value + QQuotaVendedorQT_QUOTA_KG.Value;
    wCotaPadraoVendedores := QCotaSupervisorQT_QUOTA_KG_PADRAO.Value + QQuotaVendedorQT_QUOTA_KG_PADRAO.Value;

    if wCotaVendedores > wCotaSupervisor then
    begin
      MessageDlg('A cota informada excedeu o permitido para o supervisor deste vendedor.' + #13 + #10 +
                 'Cota máxima permitida para este vendedor: ' +
                 FormatFloat('#,###,###,##0.##', QCotaSupervisorQT_SUPERVISOR.Value - QCotaSupervisorQT_QUOTA_KG_VENDEDORES.Value) + ' KG.', mtError, [mbOK], 0);
      Abort;
    end;

    if wCotaPadraoVendedores > wCotaSUpervisor then
    begin
      MessageDlg('A cota PADRÃO informada excedeu o permitido para o supervisor deste vendedor.' + #13 + #10 +
                 'Cota PADRÃO máxima permitida para este vendedor: ' +
                 FormatFloat('#,###,###,##0.##', QCotaSupervisorQT_SUPERVISOR.Value - QCotaSupervisorQT_QUOTA_KG_PADRAO.Value) + ' KG.', mtError, [mbOK], 0);
      Abort;
    end;
  end;
end;

procedure TDMVendedor.QVendedorBeforePost(DataSet: TDataSet);
begin
  if (QVendedorCOD_FILIAL.Text <> '') then
    DMOracle.ValidaFilial(QVendedorCOD_FILIAL.Text);
  QVendedorCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

end.
