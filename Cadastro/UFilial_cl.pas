unit UFilial_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMFilial = class(TDataModule)
    QFilial: TOracleDataSet1;
    QFilialCOD_FILIAL: TIntegerField;
    QFilialDESC_FILIAL: TStringField;
    QFilialDESC_CIDADE: TStringField;
    QFilialDESC_CEP: TStringField;
    QFilialDESC_ENDERECO: TStringField;
    QFilialNUM_CGC: TStringField;
    QFilialDESC_TELEFONE: TStringField;
    QFilialNUM_NOTA_FISCAL: TIntegerField;
    QFilialNUM_TITULO: TIntegerField;
    QFilialIND_ESTOQUE: TStringField;
    QFilialNUM_ORCAMENTO: TIntegerField;
    QFilialNUM_PEDIDO: TIntegerField;
    QFilialNUM_RECEITA: TIntegerField;
    QFilialNUM_CONTRATO: TIntegerField;
    QFilialNUM_CPR: TIntegerField;
    QFilialNUM_GUIA: TIntegerField;
    QFilialNUM_BOLETIM: TIntegerField;
    QFilialNUM_CAIXA_POSTAL: TIntegerField;
    QFilialNUM_RECIBO: TIntegerField;
    QFilialCOD_ESTADO: TStringField;
    QFilialDT_FECHAMENTO_CONTABIL: TDateTimeField;
    QFilialNUM_ROMANEIO: TIntegerField;
    QFilialNUM_PAG_RAZAO: TIntegerField;
    QFilialDESC_LPT_NOTA: TStringField;
    QFilialDESC_LPT_PEDIDO: TStringField;
    QFilialCOD_SERIE: TStringField;
    QFilialNUM_ENDERECO: TIntegerField;
    QFilialDESC_COMPLEMENTO_ENDERECO: TStringField;
    QFilialDESC_NOME_CONTATO: TStringField;
    QFilialIND_PADRAO_ARQ_MAGNETICO: TStringField;
    QFilialDESC_FAX: TStringField;
    QFilialDESC_E_MAIL: TStringField;
    QFilialCons: TOracleDataSet1;
    QFilialConsCOD_FILIAL: TIntegerField;
    QFilialConsDESC_FILIAL: TStringField;
    QFilialConsNUM_CGC: TStringField;
    QRFilial: TOracleDataSet1;
    QRFilialCOD_FILIAL: TIntegerField;
    QRFilialDESC_FILIAL: TStringField;
    QRFilialDESC_CIDADE: TStringField;
    QRFilialDESC_CEP: TStringField;
    QRFilialDESC_ENDERECO: TStringField;
    QRFilialNUM_CGC: TStringField;
    QRFilialDESC_TELEFONE: TStringField;
    QRFilialNUM_NOTA_FISCAL: TIntegerField;
    QRFilialNUM_TITULO: TIntegerField;
    QRFilialIND_ESTOQUE: TStringField;
    QRFilialNUM_ORCAMENTO: TIntegerField;
    QRFilialNUM_PEDIDO: TIntegerField;
    QRFilialNUM_RECEITA: TIntegerField;
    QRFilialNUM_CONTRATO: TIntegerField;
    QRFilialNUM_CPR: TIntegerField;
    QRFilialNUM_GUIA: TIntegerField;
    QRFilialNUM_BOLETIM: TIntegerField;
    QRFilialNUM_CAIXA_POSTAL: TIntegerField;
    QRFilialNUM_RECIBO: TIntegerField;
    QRFilialCOD_ESTADO: TStringField;
    QRFilialDT_FECHAMENTO_CONTABIL: TDateTimeField;
    QRFilialNUM_ROMANEIO: TIntegerField;
    QRFilialNUM_PAG_RAZAO: TIntegerField;
    QRFilialDESC_LPT_NOTA: TStringField;
    QRFilialDESC_LPT_PEDIDO: TStringField;
    QRFilialCOD_SERIE: TStringField;
    QRFilialNUM_ENDERECO: TIntegerField;
    QRFilialDESC_COMPLEMENTO_ENDERECO: TStringField;
    QRFilialDESC_BAIRRO: TStringField;
    QRFilialDESC_NOME_CONTATO: TStringField;
    QRFilialIND_PADRAO_ARQ_MAGNETICO: TStringField;
    QRFilialIND_PADRAO_FIN_ARQ_MAGNETICO: TStringField;
    QRFilialDESC_FAX: TStringField;
    QRFilialDESC_E_MAIL: TStringField;
    QFilialIND_PORTA_BALANCA: TStringField;
    QFilialDESC_LPT_OS: TStringField;
    QFilialDESC_TIPO_BALANCA: TStringField;
    QFilialCOD_CREDENCIAL_SEAB: TIntegerField;
    QFilialPERC_ISS: TFloatField;
    QFilialNUM_MINISTERIO_AGRICULTURA: TIntegerField;
    QFilialIND_BLOQUEIO_VENDA_VCTO: TStringField;
    QFilialDESC_IMPRESSORA_FISCAL: TStringField;
    QFilialIND_PADRAO_FIN_ARQ_MAGNETICO: TStringField;
    QFilialIND_LIBERA_PESO_ROMANEIO: TStringField;
    QFilialIND_ESTOQUE_NEGATIVO: TStringField;
    QFilialDESC_PORTA_CHRONOS: TStringField;
    QFilialIND_SUBSTITUICAO: TStringField;
    QFilialCOD_CADASTRO: TIntegerField;
    QFilialDESC_NIT: TStringField;
    QFilialDESC_INSCRICAO_MUNICIPAL: TStringField;
    QFilialDESC_SUFRAMA: TStringField;
    QFilialCOD_CIDADE: TIntegerField;
    QFilialCOD_CADASTRO_CONTABILISTA: TIntegerField;
    QFilialIND_CREDITO_ICMS: TStringField;
    QFilialIND_IMPRIME_PEDIDO: TStringField;
    QFilialIND_CONTINGENCIA: TStringField;
    QFilialNUM_NIRE: TStringField;
    QFilialIND_AMBIENTE_NFE: TIntegerField;
    QFilialIND_TIPO_NOTA: TStringField;
    QRFilialIND_PORTA_BALANCA: TStringField;
    QRFilialDESC_LPT_OS: TStringField;
    QRFilialDESC_TIPO_BALANCA: TStringField;
    QRFilialCOD_CREDENCIAL_SEAB: TIntegerField;
    QRFilialPERC_ISS: TFloatField;
    QRFilialNUM_MINISTERIO_AGRICULTURA: TIntegerField;
    QRFilialIND_BLOQUEIO_VENDA_VCTO: TStringField;
    QRFilialDESC_IMPRESSORA_FISCAL: TStringField;
    QRFilialIND_LIBERA_PESO_ROMANEIO: TStringField;
    QRFilialIND_ESTOQUE_NEGATIVO: TStringField;
    QRFilialDESC_PORTA_CHRONOS: TStringField;
    QRFilialIND_SUBSTITUICAO: TStringField;
    QRFilialCOD_CADASTRO: TIntegerField;
    QRFilialCOD_CIDADE: TIntegerField;
    QRFilialIND_CONTINGENCIA: TStringField;
    QRFilialNUM_NIRE: TStringField;
    QRFilialDESC_NIT: TStringField;
    QRFilialDESC_INSCRICAO_MUNICIPAL: TStringField;
    QRFilialDESC_SUFRAMA: TStringField;
    QRFilialCOD_CADASTRO_CONTABILISTA: TIntegerField;
    QRFilialIND_AMBIENTE_NFE: TIntegerField;
    QRFilialIND_TIPO_NOTA: TStringField;
    QRFilialIND_CREDITO_ICMS: TStringField;
    QRFilialIND_IMPRIME_PEDIDO: TStringField;
    QRFilialCOD_CADASTRO_RESPONSAVEL: TIntegerField;
    QFilialCOD_CADASTRO_RESPONSAVEL: TIntegerField;
    QFilialIND_SISTEMA_NFE: TIntegerField;
    QFilialDESC_LPT_CHEQUE: TStringField;
    QFilialDESC_LPT_CONHECIMENTO: TStringField;
    QFilialNUM_VIAS_DANFE: TIntegerField;
    QFilialDESC_REPOSITORIO_NFE: TStringField;
    QFilialIND_VIAS_DANFE: TStringField;
    QFilialDESC_USUARIO: TStringField;
    QFilialDESC_SENHA: TStringField;
    QFilialIND_LOGIN_NFE: TStringField;
    QFilialDESC_CERTIFICADO: TStringField;
    QFilialDESC_LOGOTIPO_DANFE: TStringField;
    QFilialIND_REGIME_TRIBUTARIO: TIntegerField;
    QFilialDESC_VERSAO_NFE: TStringField;
    QFilialDT_CONTINGENCIA: TDateTimeField;
    QFilialDESC_JUST_CONTINGENCIA: TStringField;
    QFilialIND_OCULTA_FONE_DANFE: TStringField;
    QFilialCOD_ENERGIA_TENSAO: TStringField;
    QFilialCOD_CLASSE_CONSUMO: TStringField;
    QClasseConsumoCons: TOracleDataSet1;
    QClasseConsumoConsCOD_CLASSE_CONSUMO: TStringField;
    QClasseConsumoConsDESC_CLASSE_CONSUMO: TStringField;
    QEnergiaTensaoCons: TOracleDataSet1;
    QEnergiaTensaoConsCOD_ENERGIA_TENSAO: TStringField;
    QEnergiaTensaoConsDESC_ENERGIA_TENSAO: TStringField;
    QFilialIND_TIPO_ENERGIA: TIntegerField;
    QFilialIND_TIPO_ATIVIDADE: TStringField;
    QFilialIND_PERFIL_SPED: TStringField;
    QFilialIND_ST: TStringField;
    QFilialIND_REGIME_ESPECIAL: TStringField;
    QInventarioMes: TOracleDataSet1;
    QInventarioMesCOD_FILIAL: TIntegerField;
    QInventarioMesNUM_MES: TIntegerField;
    QIncidenciaTrib: TOracleDataSet1;
    QIncidenciaTribDESC_INC_TRIB: TStringField;
    QIncidenciaTribDESC_COMPLETA: TStringField;
    DSIncidenciaTrib: TDataSource;
    QFilialCOD_INC_TRIB: TIntegerField;
    QApropCredito: TOracleDataSet1;
    DSApropCredito: TDataSource;
    QApropCreditoDESC_METOD_APROP: TStringField;
    QApropCreditoDESC_COMPLETA: TStringField;
    QFilialCOD_APROPRIACAO_CRED: TIntegerField;
    QTipoCont: TOracleDataSet1;
    DSTipoCont: TDataSource;
    QFilialCOD_TIPO_CONT: TIntegerField;
    QCriterioEscrit: TOracleDataSet1;
    DSCriterioEscrit: TDataSource;
    QTipoContDESC_TIPO_CONT: TStringField;
    QTipoContDESC_COMPLETA: TStringField;
    QCriterioEscritDESC_CRITERIO_ESCRIT: TStringField;
    QCriterioEscritDESC_COMPLETA: TStringField;
    QFilialCOD_CRITERIO_ESCRIT: TIntegerField;
    QFilialIND_IPI: TStringField;
    QFilialIND_PERMITE_IMP_EXP: TStringField;
    QIncidenciaTribCOD_INC_TRIB: TFloatField;
    QApropCreditoCOD_APRO_CRED: TFloatField;
    QTipoContCOD_TIPO_CONT: TFloatField;
    QCriterioEscritCOD_CRITERIO_ESCRIT: TFloatField;
    QSerieModeloCons: TOracleDataSet1;
    QSerieModeloConsORDEM: TFloatField;
    QSerieModeloConsCOD_SERIE_MODELO: TStringField;
    QSerieModeloConsDESC_SERIE_MODELO: TStringField;
    QSerieModeloConsDESC_COMPLETA: TStringField;
    DSSerieModeloCons: TDataSource;
    QFilialCOD_SERIE_MODELO: TStringField;
    QFilialPERC_BC_NFSE: TFloatField;
    QFilialDESC_CPF_RESPONSAVEL: TStringField;
    QFilialDESC_SENHA_EMAIL: TStringField;
    QFilialDESC_SMTP: TStringField;
    QFilialNUM_PORTA_SMTP: TIntegerField;
    QFilialIND_SSL: TStringField;
    QFilialDESC_ENVIO_EMAIL: TStringField;
    QIncidenciaTribPrev: TOracleDataSet1;
    QIncidenciaTribPrevCOD_INC_TRIB: TFloatField;
    QIncidenciaTribPrevDESC_INC_TRIB: TStringField;
    QIncidenciaTribPrevDESC_COMPLETA: TStringField;
    DSIncidenciaTribPrev: TDataSource;
    QFilialDESC_CNAE: TStringField;
    QFilialCOD_INC_TRIB_PREV: TIntegerField;
    QFilialIND_CONTINGENCIA_CTE: TStringField;
    QFilialIND_AMBIENTE_CTE: TIntegerField;
    QFilialIND_VIAS_DACTE: TStringField;
    QFilialNUM_VIAS_DACTE: TIntegerField;
    QFilialDT_CONTINGENCIA_CTE: TDateTimeField;
    QFilialDESC_JUSTI_CONTINGENCIA_CTE: TStringField;
    QFilialDESC_VERSAO_CTE: TStringField;
    QFilialDESC_CIOT: TStringField;
    QFilialDESC_LOGOTIPO_DACTE: TStringField;
    QFilialDESC_CERTIFICADO_CTE: TStringField;
    QFilialDESC_IP_TEF: TStringField;
    QFilialDESC_ID_TERMINAL_TEF: TStringField;
    QFilialDESC_ID_LOJA_TEF: TStringField;
    QFilialCOD_NBS_PADRAO: TIntegerField;
    QNbs: TOracleDataSet;
    QNbsCOD_NBS: TIntegerField;
    QNbsDESC_NBS: TStringField;
    QNbsPERC_TRIBUTO_NACIONAL: TFloatField;
    QNbsPERC_TRIBUTO_IMPORTADO: TFloatField;
    DSNbs: TDataSource;
    QFilialDESC_LPT_RECIBO: TStringField;
    QFilialDESC_HASH_MD5: TStringField;
    QFilialIND_ORIENTACAO_PAG_DANFE: TIntegerField;
    QFilialDESC_VERSAO_MDFE: TStringField;
    QFilialIND_AMBIENTE_MDFE: TIntegerField;
    QFilialIND_VIAS_DAMDFE: TStringField;
    QFilialNUM_VIAS_DAMDFE: TIntegerField;
    QFilialPERC_ALIQ_CRED_ICMSSN: TFloatField;
    QFilialIND_CONSIDERA_DESC_BC: TStringField;
    QFilialDESC_LOGOTIPO_DAMDFE: TStringField;
    QFilialDESC_CERTIFICADO_MDFE: TStringField;
    QPisDCTF: TOracleDataSet1;
    QPisDCTFDESC_COMPLETA: TStringField;
    QCofinsDCTF: TOracleDataSet1;
    QCofinsDCTFDESC_COMPLETA: TStringField;
    DSPisDCTF: TDataSource;
    DSCofinsDCTF: TDataSource;
    QFilialCOD_PIS_DCTF: TIntegerField;
    QFilialCOD_COFINS_DCTF: TIntegerField;
    QPisDCTFCOD_PISCOFINS_DCTF: TFloatField;
    QCofinsDCTFCOD_PISCOFINS_DCTF: TFloatField;
    QFilialIND_CONSIDERA_IPI_BC_SUBST: TStringField;
    QFilialIND_CONSIDERA_IPI_BC_ICMS: TStringField;
    QFilialIND_TIPO_EMITENTE_MDFE: TIntegerField;
    QFilialIND_CONTINGENCIA_NFCE: TStringField;
    QFilialIND_AMBIENTE_NFCE: TIntegerField;
    QFilialIND_VIAS_DANFE_NFCE: TStringField;
    QFilialNUM_VIAS_DANFE_NFCE: TIntegerField;
    QFilialDT_CONTINGENCIA_NFCE: TDateTimeField;
    QFilialDESC_JUST_CONTINGENCIA_NFCE: TStringField;
    QFilialDESC_VERSAO_NFCE: TStringField;
    QFilialIND_CONSUMIDOR_FINAL: TStringField;
    QFilialIND_RESP_SEGURO_PADRAO: TIntegerField;
    QFilialIND_PEDAGIO_INCLUSO: TStringField;
    QFilialIND_CONSIDERA_RED_BASE_SUBST: TStringField;
    QFilialCOD_SEGURADORA_PADRAO: TIntegerField;
    QFilialIND_MOSTRA_IE_SUBST: TStringField;
    QFilialDT_NIRE: TDateTimeField;
    QFilialDESC_CSC_NFCE: TStringField;
    QFilialDESC_IDENTIFICADOR_CSC_NFCE: TStringField;
    QFilialDESC_LOGOTIPO_DANFE_NFCE: TStringField;
    QFilialDESC_CERTIFICADO_NFCE: TStringField;
    QFilialPERC_DEDUCAO_NFSE: TFloatField;
    QFormaTrib: TOracleDataSet1;
    DSFormaTrib: TDataSource;
    QFilialCOD_FORMA_TRIBUTACAO: TIntegerField;
    QFilialIND_FORMA_APURACAO: TStringField;
    QFilialIND_OPT_EXT_RTT: TStringField;
    QFilialIND_DIF_FCONT: TStringField;
    QFilialCOD_NATUREZA_JURIDICA: TIntegerField;
    QNatJuridica: TOracleDataSet1;
    QNatJuridicaCOD_NATUREZA_JURIDICA: TIntegerField;
    QNatJuridicaCOD_NATUREZA_JURIDICADE: TStringField;
    DSNatJuridica: TDataSource;
    QFilialIND_LIBERA_PESO_RENDA: TStringField;
    QFilialDESC_BAIRRO: TStringField;
    QFilialDESC_LPT_ETIQUETA: TStringField;
    QFilialIND_NOME_FANTASIA_DANFE: TStringField;
    QInscricaoSubstFilial: TOracleDataSet1;
    QInscricaoSubstFilialCOD_INSCRICAO_SUBST_FILIAL: TIntegerField;
    QInscricaoSubstFilialCOD_FILIAL: TIntegerField;
    QInscricaoSubstFilialCOD_ESTADO: TStringField;
    QInscricaoSubstFilialDESC_INSCRICAO_SUBST: TStringField;
    QFilialCOD_CADASTRO_ENG_RESPONSAVEL: TFloatField;
    QFilialDT_REVISAO_ENG_RESPONSAVEL: TDateTimeField;
    QFilialIND_AMBIENTE_NFSE: TIntegerField;
    QFilialDESC_SENHA_WS_NFSE: TStringField;
    QFilialDESC_TAF: TStringField;
    QFilialDESC_NRO_REG_ESTADUAL: TStringField;
    QFilialIND_IMPRIME_DANFE_NFCE: TStringField;
    QFilialIND_IMPRIME_DANFE: TStringField;
    QFilialIND_IMPRIME_DACTE: TStringField;
    QFilialIND_IMPRIME_DAMDFE: TStringField;
    QFilialDESC_APOLICE_SEGURO_PADRAO: TStringField;
    QFilialDESC_INSCRICAO: TStringField;
    QRFilialDESC_INSCRICAO: TStringField;
    QFilialIND_IMPRIME_REQ_OBRA: TStringField;
    QRFilialIND_SINC_MAX_ROTEIRIZADOR: TStringField;
    QFilialDESC_RNTRC: TStringField;
    QFilialIND_IMPRIME_ROMANEIO: TStringField;
    QAutXML: TOracleDataSet;
    QAutXMLCOD_AUT_XML: TIntegerField;
    QAutXMLIND_TIPO_DOCUMENTO: TIntegerField;
    QAutXMLCOD_FILIAL: TIntegerField;
    QAutXMLmodelo: TStringField;
    QAutXMLCOD_CADASTRO: TIntegerField;
    QAutXMLnome: TStringField;
    QFilialCOD_CLASSIFICACAO_CONTRIB_IPI: TStringField;
    QClassifContribIpiCons: TOracleDataSet1;
    QClassifContribIpiConsCOD_CLASSIFICACAO_CONTRIB_IPI: TStringField;
    QClassifContribIpiConsDESC_CLASSIFICACAO_CONTRIB_IPI: TStringField;
    QFilialDESC_VERSAO_NFSE: TStringField;
    QFilialCOD_CADASTRO_TECNICO: TIntegerField;
    QFilialIND_IMPRIME_ORCAMENTO_WORD: TStringField;
    QFilialIND_VALORES_AGREGADOS: TStringField;
    QClassificacaoTributaria: TOracleDataSet1;
    QClassificacaoTributariaCOD_CLASSIFICACAO_TRIBUTARIA: TIntegerField;
    QClassificacaoTributariaDESC_CLASSIFICACAO_TRIBUTARIA: TStringField;
    DSClassificacaoTributaria: TDataSource;
    QFilialCOD_CLASSIFICACAO_TRIBUTARIA: TIntegerField;
    QFilialIND_OBRIGA_ECD: TStringField;
    QAtivPreponderante: TOracleDataSet1;
    QFilialIND_SITUACAO_REINF: TIntegerField;
    QFilialCOD_CADASTRO_REINF: TIntegerField;
    QFilialIND_DESONERACAO_CPRB: TStringField;
    QFilialIND_AMBIENTE_REINF: TIntegerField;
    QFilialIND_CALCULA_ISS_CIDADE: TStringField;
    QFilialDESC_VERSAO_REINF: TStringField;
    QAtivPreponderanteCOD_ATIV_PREPONDERANTE: TIntegerField;
    QAtivPreponderanteDESC_ATIV_PREPONDERANTE: TStringField;
    QFilialIND_ATIV_PREPONDERANTE: TIntegerField;
    DSAtivPreponderante: TDataSource;
    QFilialDT_INVENTARIO: TDateTimeField;
    QFilialIND_SITUACAO: TStringField;
    QFilialCOD_USUARIO: TIntegerField;
    QFilialPERC_IR_NFSE: TFloatField;
    QFilialPERC_CSLL_NFSE: TFloatField;
    QFilialConsDESC_INSCRICAO: TStringField;
    QFilialConsDESC_ENDERECO: TStringField;
    QFilialConsDESC_CIDADE: TStringField;
    QFilialNUM_RET_ULT_CONS_NFE_RECEBIDAS: TIntegerField;
    QFilialDT_ULT_CONS_NFE_RECEBIDAS: TDateTimeField;
    QFilialIND_CONSIDERA_FRETE_BC_ICMS: TStringField;
    QFilialIND_SPED_PISCOFINS: TStringField;
    procedure QFilialAfterPost(DataSet: TDataSet);
    procedure QFilialAfterOpen(DataSet: TDataSet);
    procedure QIncidenciaTribAfterOpen(DataSet: TDataSet);
    procedure QFilialBeforePost(DataSet: TDataSet);
    procedure QFilialBeforeDelete(DataSet: TDataSet);
    procedure QFilialAfterDelete(DataSet: TDataSet);
    procedure QInscricaoSubstFilialAfterInsert(DataSet: TDataSet);
    procedure QInscricaoSubstFilialBeforeEdit(DataSet: TDataSet);
    procedure QInscricaoSubstFilialAfterPost(DataSet: TDataSet);
    procedure QInscricaoSubstFilialBeforeDelete(DataSet: TDataSet);
    procedure QFilialAfterCancel(DataSet: TDataSet);
    procedure QAutXMLCalcFields(DataSet: TDataSet);
    procedure QAutXMLAfterInsert(DataSet: TDataSet);
    procedure DSClassificacaoTributariaDataChange(Sender: TObject;
      Field: TField);
  private
    { Private declarations }
  public
    function EmiteNfe(Filial: Integer): Boolean;
  end;

var
  DMFilial: TDMFilial;
  wCodPafInclusaoExclusao: String = '';

implementation

uses UOracle_cl, UFilialCad, UBiblioteca, UUsuario_cl;

{$R *.DFM}

function TDMFilial.EmiteNfe(Filial: Integer): Boolean;
var
  s: String;
begin
  inherited;
  s := DMOracle.FastSelect('IND_TIPO_NOTA',
      'TB_FILIAL', 'COD_FILIAL = ' + IntToStr(Filial));
  Result := (s = 'ELETRONICA') or (s = 'AMBAS');
end;

procedure TDMFilial.QFilialAfterPost(DataSet: TDataSet);
Var wCodigo : Integer;
begin
  //wCodigo := QFilialCod_Filial.Value;
//  QFilial.Close;
//  QFilial.SetVariable('PK',wCodigo);
//  QFilial.Open;
//  with DMImpressoraFiscal do
//  begin
//    QChecaMD5Filial.Close;
//    QChecaMD5Filial.SetVariable('COD_FILIAL',wCodigo);
//    QChecaMD5Filial.Open;
//    bib.GeraMD5Query(QChecaMD5Filial,'TB_FILIAL');
////    bib.AtualizaExclusaoInclusaoMD5(DMOracle.DataServ,
////      DMOracle.DataServ,True);
//  end;
//  QFilial.RefreshRecord;
//  with DMOracle do
//  begin
//    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
//      QuotedStr(QFilialCOD_FILIAL.Text+'TB_FILIAL'),true);
//  end;
end;

procedure TDMFilial.QFilialAfterOpen(DataSet: TDataSet);
begin
  QIncidenciaTrib.Open;
  QCriterioEscrit.Open;
  QApropCredito.Open;
  QTipoCont.Open;
  QSerieModeloCons.Open;
  QIncidenciaTribPrev.Open;
  QAutXML.Close;
  QAutXML.SetVariable('COD_FILIAL', QFilialCOD_FILIAL.Value);
  QAutXML.Open;
end;

procedure TDMFilial.QIncidenciaTribAfterOpen(DataSet: TDataSet);
begin
  //QApropCredito.Open;
  //QTipoCont.Open;
  //QCriterioEscrit.Open;
end;

procedure TDMFilial.QFilialBeforePost(DataSet: TDataSet);
begin
//  PafEcfHashTabelas.Instancia.Atualiza(DMOracle.DataServ,'TB_FILIAL');
  QFilialCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMFilial.QFilialBeforeDelete(DataSet: TDataSet);
begin
  wCodPafInclusaoExclusao := QFilialCOD_FILIAL.Text+'TB_FILIAL';  
end;

procedure TDMFilial.QFilialAfterDelete(DataSet: TDataSet);
begin
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(wCodPafInclusaoExclusao),true);
  end;
end;

procedure TDMFilial.QInscricaoSubstFilialAfterInsert(DataSet: TDataSet);
begin
  QInscricaoSubstFilialCOD_FILIAL.Value := QFilialCOD_FILIAL.Value;
end;

procedure TDMFilial.QInscricaoSubstFilialBeforeEdit(DataSet: TDataSet);
begin
  if QFilial.State = dsInsert then
  begin
    QFilial.Post;
    QFilial.Edit;
  end;
  if QFilial.State <> dsEdit then
    raise Exception.Create('Filial não está no modo de alteração!');
end;

procedure TDMFilial.QInscricaoSubstFilialAfterPost(DataSet: TDataSet);
var wCodigo: Real;
begin
  wCodigo := QInscricaoSubstFilialCOD_INSCRICAO_SUBST_FILIAL.Value;

  QInscricaoSubstFilial.DisableControls;
  if QInscricaoSubstFilial.RecordCount < 2 then
  begin
    QFilial.Post;
    QFilial.Edit;
  end;
  QInscricaoSubstFilial.Locate('COD_INSCRICAO_SUBST_FILIAL', wCodigo, []);
  QInscricaoSubstFilial.EnableControls;
end;

procedure TDMFilial.QInscricaoSubstFilialBeforeDelete(DataSet: TDataSet);
begin
  if QFilial.State <> dsEdit then
    raise Exception.Create('Filial não está no modo de alteração!');
  if QInscricaoSubstFilial.State in [dsEdit, dsInsert] then
    QInscricaoSubstFilial.Cancel;
end;

procedure TDMFilial.QFilialAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QFilial.Close;
  QFilial.Open;
end;

procedure TDMFilial.QAutXMLCalcFields(DataSet: TDataSet);
begin
  QAutXMLmodelo.Value := Bib.ift(QAutXMLIND_TIPO_DOCUMENTO.Value = 57, 'CT-e',
      Bib.ift(QAutXMLIND_TIPO_DOCUMENTO.Value = 67, 'CT-e OS',
      Bib.ift(QAutXMLIND_TIPO_DOCUMENTO.Value = 55, 'NF-e', 'NFC-e')));
  if (not QAutXMLCOD_CADASTRO.IsNull) and (QAutXMLCOD_CADASTRO.Value <> 0)  then
    QAutXMLnome.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + QAutXMLCOD_CADASTRO.Text);
end;

procedure TDMFilial.QAutXMLAfterInsert(DataSet: TDataSet);
begin
  QAutXMLCOD_FILIAL.Value := QFilialCOD_FILIAL.Value;
  QAutXMLIND_TIPO_DOCUMENTO.Value := 55;
end;

procedure TDMFilial.DSClassificacaoTributariaDataChange(Sender: TObject;
  Field: TField);
begin
   if not (QFilialCOD_CLASSIFICACAO_TRIBUTARIA.Value in [2,3,99]) then
   begin
      QFilialIND_DESONERACAO_CPRB.Value := 'NAO'  //na tabela do reinf R1000 é 0 - VALUEUNCHECKED
   end;
   
end;

end.
