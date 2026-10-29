unit UTributacao_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste, Oracle;

type
  TDMTributacao = class(TDataModule)
    QTributacao: TOracleDataSet1;
    QTributacaoNUM_CLASSIFICACAO: TStringField;
    QTributacaoPERC_ALIQUOTA: TFloatField;
    QTributacaoDESC_TRIBUTACAO: TStringField;
    QTributacaoCOD_TRIBUTACAO: TIntegerField;
    QTributacaoCOD_TRIB_IMP_FISCAL: TStringField;
    QTributacaoDESC_SITUACAO_TRIB: TStringField;
    QTributacaoCons: TOracleDataSet1;
    QTributacaoConsCOD_TRIBUTACAO: TIntegerField;
    QTributacaoConsDESC_TRIBUTACAO: TStringField;
    QRTributacao: TOracleDataSet1;
    QRTributacaoCOD_TRIBUTACAO: TIntegerField;
    QRTributacaoDESC_TRIBUTACAO: TStringField;
    QRTributacaoPERC_TRIBUTADO: TFloatField;
    QRTributacaoPERC_ALIQUOTA: TFloatField;
    QRTributacaoNUM_CLASSIFICACAO: TStringField;
    QTributacaoIND_BASE_REDUZIDA: TStringField;
    QTributacaoPERC_TRIBUTADO_NOTA: TFloatField;
    QProdutoSubstTrib: TOracleDataSet1;
    QProdutoSubstTribCOD_PRODUTO_SUBST_TRIB: TIntegerField;
    QProdutoSubstTribCOD_PRODUTO: TIntegerField;
    QProdutoSubstTribCOD_ESTADO: TStringField;
    QProdutoSubstTribPERC_TRIBUTADO: TFloatField;
    QProdutoSubstTribPERC_ALIQUOTA: TFloatField;
    QProdutoSubstTribCons: TOracleDataSet1;
    QProdutoSubstTribConsCOD_PRODUTO_SUBST_TRIB: TIntegerField;
    QProdutoSubstTribConsCOD_PRODUTO: TIntegerField;
    QProdutoSubstTribConsCOD_ESTADO: TStringField;
    QProdutoSubstTribConsPERC_TRIBUTADO: TFloatField;
    QProdutoSubstTribConsPERC_ALIQUOTA: TFloatField;
    QProdutoSubstTribConsDESC_PRODUTO: TStringField;
    QRProdutoSubstTrib: TOracleDataSet1;
    QTributacaoPERC_TRIBUTADO: TFloatField;
    QTributacaoDESC_CSOSN: TStringField;
    QTributacaoNUM_INDICE_TRIB_ECF: TStringField;
    QTributacaoConsDESC_SITUACAO_TRIB: TStringField;
    QTributacaoConsDESC_CSOSN: TStringField;
    QTributacaoDESC_HASH_MD5: TStringField;
    QTributacaoPERC_DIFERIMENTO: TFloatField;
    QProdutoSubstTribCOD_FILIAL: TIntegerField;
    QProdutoSubstTribPERC_TRIBUTADO_SN: TFloatField;
    QProdutoSubstTribConsCOD_FILIAL: TIntegerField;
    QProdutoSubstTribConsPERC_TRIBUTADO_SN: TFloatField;
    QProdutoSubstTribConsPERC_ALIQUOTA_DIFERENCIAL: TFloatField;
    QProdutoSubstTribPERC_ALIQUOTA_DIFERENCIAL: TFloatField;
    QTributacaoDESC_SITUACAO_TRIB_NC: TStringField;
    QTributacaoDESC_CSOSN_NC: TStringField;
    QProdutoSubstTribCOD_TRIBUTACAO: TIntegerField;
    QProdutoSubstTribConsCOD_TRIBUTACAO: TIntegerField;
    QTributacaoConsDESC_SITUACAO_TRIB_NC: TStringField;
    QTributacaoConsDESC_CSOSN_NC: TStringField;
    QTributacaoConsPERC_TRIBUTADO: TFloatField;
    QTributacaoConsPERC_ALIQUOTA: TFloatField;
    QTributacaoConsPERC_DIFERIMENTO: TFloatField;
    OPReajustaMVAPorNcm: TOraclePackage;
    QTributacaoDESC_OBSERVACAO: TStringField;
    QTributacaoDESC_OBSERVACAO_NC: TStringField;
    QTributacaoCOD_USUARIO: TIntegerField;
    QTributacaoPERC_IBS: TFloatField;
    QTributacaoPERC_CBS: TFloatField;
    QTributacaoPERC_IS: TFloatField;
    QCSTReformaTributaria: TOracleDataSet1;
    DSCSTReformaTributaria: TDataSource;
    QCSTReformaTributariaDESCRICAO: TStringField;
    QCSTReformaTributariaCOD_CST_IBS_CBS: TIntegerField;
    QCSTReformaTributariaNUM_CST_IBS_CBS: TStringField;
    QCSTReformaTributariaDESC_CST_IBS_CBS: TStringField;
    QCSTReformaTributariaIND_GRUPO_IBS_CBS: TStringField;
    QCSTReformaTributariaIND_GRUPO_IBS_CBS_MONO: TStringField;
    QCSTReformaTributariaIND_GRUPO_RED: TStringField;
    QCSTReformaTributariaIND_GRUPO_DIF: TStringField;
    QCSTReformaTributariaIND_GRUPO_TRANSF_CRED: TStringField;
    QCSTReformaTributariaIND_GRUPO_CRED_PRES_IBSZFM: TStringField;
    QCSTReformaTributariaIND_GRUPO_AJUSTE_COMPET: TStringField;
    QCSTReformaTributariaIND_REDUTOR_BC: TStringField;
    QTributacaoCOD_CST_IBS_CBS: TIntegerField;
    QTributacaoConsCOD_CST_IBS_CBS: TIntegerField;
    procedure QTributacaoBeforePost(DataSet: TDataSet);
    procedure QTributacaoAfterInsert(DataSet: TDataSet);
    procedure QTributacaoAfterPost(DataSet: TDataSet);
    procedure QTributacaoBeforeDelete(DataSet: TDataSet);
    procedure QTributacaoAfterDelete(DataSet: TDataSet);
    procedure QProdutoSubstTribBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTributacao: TDMTributacao;
  wCodPafInclusaoExclusao: String = '';

implementation

uses UOracle_cl,UBiblioteca, UImpressoraFiscal_cl,UUsuario_cl;

{$R *.DFM}

procedure TDMTributacao.QTributacaoBeforePost(DataSet: TDataSet);
begin
  if Trim(QTributacaoDESC_CSOSN.Value) = '' then
    QTributacaoDESC_CSOSN.Clear;
//  if Trim(QTributacaoDESC_SITUACAO_TRIB.Value) = '' then
//    QTributacaoDESC_SITUACAO_TRIB.Clear;
// RETIRADO PELO CESAR 02/01/2019 - NAO UTILIZA MAIS IMPRESSORA FISCAL
{  if (not QTributacaoCOD_TRIB_IMP_FISCAL.IsNull) and
  (QTributacaoCOD_TRIB_IMP_FISCAL.Value[1] in ['T','S']) and
    (QTributacaoNUM_INDICE_TRIB_ECF.IsNull) then
  begin
    MessageDlg('Índice de tributação não informado', mtError,
      [mbOk],0);
    Abort;
  end;
} // PafEcfHashTabelas.Instancia.Atualiza(DMOracle.DataServ,'TB_TRIBUTACAO');
  QTributacaoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMTributacao.QTributacaoAfterInsert(DataSet: TDataSet);
begin
  QTributacaoDESC_CSOSN.Value := '   ';
//  QTributacaoDESC_SITUACAO_TRIB.Value := '  ';
end;

procedure TDMTributacao.QTributacaoAfterPost(DataSet: TDataSet);
begin
//  with DMImpressoraFiscal do
//  begin
//    QChecaMD5Tributacao.Close;
//    QChecaMD5Tributacao.SetVariable('COD_TRIBUTACAO',
//      QTributacaoCOD_TRIBUTACAO.Value);
//    QChecaMD5Tributacao.Open;
//    bib.GeraMD5Query(QChecaMD5Tributacao,'TB_TRIBUTACAO');
//    bib.AtualizaExclusaoInclusaoMD5(DMOracle.DataServ,DMOracle.DataServ,
//      True);
//    QTributacao.RefreshRecord;
//  end;
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(QTributacaoCOD_TRIBUTACAO.Text+'TB_TRIBUTACAO'),true);
  end
end;

procedure TDMTributacao.QTributacaoBeforeDelete(DataSet: TDataSet);
begin
  wCodPafInclusaoExclusao := QTributacaoCOD_TRIBUTACAO.Text+'TB_TRIBUTACAO';
end;

procedure TDMTributacao.QTributacaoAfterDelete(DataSet: TDataSet);
begin
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(wCodPafInclusaoExclusao),true);
  end;
end;

procedure TDMTributacao.QProdutoSubstTribBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QProdutoSubstTribCOD_FILIAL.Text);
end;

end.
