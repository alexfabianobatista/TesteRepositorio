unit UNfEletronicaLote_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, Provider, DBClient, UNfe_cl, Oracle, DateUtils, Controls;

type
  TAcaoLote = (alEnvio, alGeraXML, alDanfe, alEmail, alConsulta,
      alConsultaProtocolo, alCancela, alSalvaDanfePdf, alCartaCorrecao,
      alEnvioRps, alConsSitLote, alConsNfseRps, alConsLoteRps,
      alConsNFSe, alCancelaNFSe);

  TAcoesLote = class
  protected
    FAcoes: Array of TAcaoLote;
  public
    function Add(Acao: TAcaoLote): TAcoesLote;
    function Contains(Acao: TAcaoLote): Boolean;
  end;

  TDMNfEletronicaLote = class(TDataModule)
    QNfeLote: TOracleDataSet1;
    QNfeLoteID_LOTE: TFloatField;
    QNfeLoteIND_SITUACAO: TIntegerField;
    QNfeLoteDT_CRIACAO: TDateTimeField;
    QNfeLoteDT_ENVIO: TDateTimeField;
    QNfeLoteCons: TOracleDataSet1;
    QNfeLoteItemCons: TOracleDataSet1;
    QNfeLoteConsID_LOTE: TFloatField;
    QNfeLoteConsIND_SITUACAO: TIntegerField;
    QNfeLoteConsDT_CRIACAO: TDateTimeField;
    QNfeLoteConsDT_ENVIO: TDateTimeField;
    QNfeLoteConsdesc_situacao: TStringField;
    QNfeLoteItemConsID_LOTE: TFloatField;
    QNfeLoteItemConsDESC_CHAVE_ACESSO: TStringField;
    QNfeLoteItemConsDT_EMISSAO: TDateTimeField;
    QNfeLoteItemConsNUM_NOTA: TIntegerField;
    QNfeLoteItemConsIND_ENTRADA_SAIDA: TStringField;
    QNfeLoteItemConsCADASTRO: TStringField;
    QNfeLoteItemConsSTATUS: TStringField;
    QNfeLoteCOD_FILIAL: TIntegerField;
    QNfeLoteConsCOD_FILIAL: TIntegerField;
    QNfeLoteConsDESC_REPOSITORIO_NFE: TStringField;
    QNfeLoteNUM_RECIBO: TFloatField;
    QNfeLoteConsCOD_UF_IBGE: TIntegerField;
    QNfeLoteItem: TOracleDataSet1;
    QNfeLoteItemID_LOTE: TFloatField;
    QNfeLoteItemDESC_CHAVE_ACESSO: TStringField;
    QNfeLoteItemCOD_FILIAL: TIntegerField;
    QNfeLoteItemDESC_SERIE: TStringField;
    QNfeLoteItemNUM_NF_ELETRONICA: TIntegerField;
    QNfeLoteItemDESC_XML_NFE: TMemoField;
    QNfeLoteItemDESC_CERTIFICADO: TStringField;
    QNfeLoteItemDESC_LOGOTIPO: TStringField;
    QNfeLoteItemIND_AMBIENTE_NFE: TIntegerField;
    QNfeLoteItemCOD_NOTA_CAB: TIntegerField;
    CDSNfeLoteItemCons: TClientDataSet;
    DSPNfeLoteItemCons: TDataSetProvider;
    CDSNfeLoteItemConsSTATUS: TStringField;
    CDSNfeLoteItemConsID_LOTE: TFloatField;
    CDSNfeLoteItemConsDESC_CHAVE_ACESSO: TStringField;
    CDSNfeLoteItemConsDT_EMISSAO: TDateTimeField;
    CDSNfeLoteItemConsNUM_NOTA: TIntegerField;
    CDSNfeLoteItemConsIND_ENTRADA_SAIDA: TStringField;
    CDSNfeLoteItemConsCADASTRO: TStringField;
    QNfeLoteItemConsIND_SELECIONADO: TStringField;
    CDSNfeLoteItemConsIND_SELECIONADO: TStringField;
    DSNfeLoteCons: TDataSource;
    QNfeLoteItemConsDESC_EMAIL: TStringField;
    CDSNfeLoteItemConsDESC_EMAIL: TStringField;
    CDSNfeLoteItemConsdesc_tipo_nota: TStringField;
    CDSNfeLoteItemConsdesc_assunto_email: TStringField;
    CDSNfeLoteItemConsdesc_corpo_email: TStringField;
    QNfeLoteItemConsCOD_SERIE: TStringField;
    CDSNfeLoteItemConsCOD_SERIE: TStringField;
    QNfeLoteConsDESC_FILIAL: TStringField;
    QNfeLoteConsCGC_FILIAL: TStringField;
    CDSNfeLoteItemConsdesc_anexo_email: TStringField;
    QNfeLoteItemConsEMAIL_XML: TStringField;
    QNfeLoteItemConsEMAIL_PDF: TStringField;
    CDSNfeLoteItemConsEMAIL_XML: TStringField;
    CDSNfeLoteItemConsEMAIL_PDF: TStringField;
    QNfeLoteItemConsIND_CONTINGENCIA: TStringField;
    QNfeLoteItemConsIND_AMBIENTE_NFE: TIntegerField;
    CDSNfeLoteItemConsIND_CONTINGENCIA: TStringField;
    CDSNfeLoteItemConsIND_AMBIENTE_NFE: TIntegerField;
    QNfeLoteItemConsDESC_MSG_VALIDACAO: TMemoField;
    CDSNfeLoteItemConsDESC_MSG_VALIDACAO: TMemoField;
    QNfeLoteItemConsDESC_MSG_VALIDACAO_LOTE: TMemoField;
    CDSNfeLoteItemConsDESC_MSG_VALIDACAO_LOTE: TMemoField;
    QNfeLoteItemConsCOD_NOTA_CAB: TIntegerField;
    CDSNfeLoteItemConsCOD_NOTA_CAB: TIntegerField;
    QNfeLoteConsCONT_SELECIONADO: TFloatField;
    QNfeLoteConsDESC_IMPRESSORA_DANFE: TStringField;
    CDSNfeLoteItemConsretorno_sefaz: TStringField;
    QNfeLoteItemConsDESC_MSG_CANCELAMENTO: TStringField;
    QNfeLoteItemConsDESC_RETORNO_CANCELAMENTO: TStringField;
    QNfeLoteItemConsDESC_RETORNO_PROCESSAMENTO: TStringField;
    CDSNfeLoteItemConsDESC_MSG_CANCELAMENTO: TStringField;
    CDSNfeLoteItemConsDESC_RETORNO_CANCELAMENTO: TStringField;
    CDSNfeLoteItemConsDESC_RETORNO_PROCESSAMENTO: TStringField;
    CDSNfeLoteItemConsind_autorizado: TBooleanField;
    CDSNfeLoteItemConsind_cancelado: TBooleanField;
    CDSNfeLoteItemConsind_denegado: TBooleanField;
    CDSNfeLoteItemConsind_pendente: TBooleanField;
    QNfeLoteItemConsDESC_PROT_AUTORIZACAO: TStringField;
    QNfeLoteItemConsDESC_PROT_CANCELAMENTO: TStringField;
    CDSNfeLoteItemConsDESC_PROT_AUTORIZACAO: TStringField;
    CDSNfeLoteItemConsDESC_PROT_CANCELAMENTO: TStringField;
    QNfeLoteItemConsDESC_JUST_CANCELA: TStringField;
    CDSNfeLoteItemConsDESC_JUST_CANCELA: TStringField;
    QNfeLoteConsIND_CONTINGENCIA: TFloatField;
    QNfeLoteItemConsNUM_VIAS_DANFE: TIntegerField;
    CDSNfeLoteItemConsNUM_VIAS_DANFE: TIntegerField;
    QNfeLoteItemConsDESC_IMPRESSORA_DANFE: TStringField;
    CDSNfeLoteItemConsDESC_IMPRESSORA_DANFE: TStringField;
    QNfeLoteItemDESC_XML_RPS: TMemoField;
    QNfeLoteConsDESC_PROTOCOLO: TStringField;
    QNfeLoteConsDESC_INSCRICAO_MUNICIPAL: TStringField;
    QNfeLoteConsCOD_IBGE_CIDADE: TStringField;
    CDSNfeLoteItemConsNUM_CGC_CPF: TStringField;
    CDSNfeLoteItemConsDESC_INSCRICAO_MUNICIPAL: TStringField;
    QNfeLoteItemIND_NFSE: TStringField;
    QNfeLoteItemConsIND_NFSE: TStringField;
    QNfeLoteDESC_PROTOCOLO: TStringField;
    CDSNfeLoteItemConsIND_NFSE: TStringField;
    QNfeLoteItemConsNOME_CADASTRO: TStringField;
    QNfeLoteItemConsNUM_CGC_CPF: TStringField;
    QNfeLoteItemConsDESC_INSCRICAO_MUNICIPAL: TStringField;
    CDSNfeLoteItemConsNOME_CADASTRO: TStringField;
    QNfeLoteItemConsNUM_NFSE: TStringField;
    CDSNfeLoteItemConsNUM_NFSE: TStringField;
    QNfeLoteItemConsDESC_XML_NFE: TMemoField;
    QNfeLoteItemConsDESC_XML_RETORNO: TMemoField;
    CDSNfeLoteItemConsDESC_XML_NFE: TMemoField;
    CDSNfeLoteItemConsDESC_XML_RETORNO: TMemoField;
    QNfeLoteItemConsLOTE_CANC: TFloatField;
    CDSNfeLoteItemConsLOTE_CANC: TFloatField;
    QNfeLoteItemConsCOD_SERIE_MODELO: TStringField;
    QNfeLoteItemConsNUM_VIAS_DANFE_NFCE: TIntegerField;
    QNfeLoteItemConsDESC_IMPRESSORA_DANFE_NFCE: TStringField;
    CDSNfeLoteItemConsCOD_SERIE_MODELO: TStringField;
    CDSNfeLoteItemConsNUM_VIAS_DANFE_NFCE: TIntegerField;
    CDSNfeLoteItemConsDESC_IMPRESSORA_DANFE_NFCE: TStringField;
    QNfeLoteItemDESC_IMPRESSORA: TStringField;
    QNfeLoteItemConsCOD_PAIS_IBGE: TIntegerField;
    CDSNfeLoteItemConsCOD_PAIS_IBGE: TIntegerField;
    QNfeLoteItemIND_DANFE_IMPRESSA: TStringField;
    QNfeLoteItemIND_CONTINGENCIA: TStringField;
    QNfeLoteItemDT_CONTINGENCIA: TDateTimeField;
    QNfeLoteItemDESC_JUST_CONTINGENCIA: TStringField;
    QNfeLoteConsCOD_USUARIO: TFloatField;
    QNFeLoteConsOld: TOracleDataSet1;
    FloatField1: TFloatField;
    IntegerField1: TIntegerField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    IntegerField3: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField2: TFloatField;
    StringField4: TStringField;
    FloatField3: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField4: TFloatField;
    procedure QNfeLoteAfterInsert(DataSet: TDataSet);
    procedure QNfeLoteConsCalcFields(DataSet: TDataSet);
    procedure CDSNfeLoteItemConsCalcFields(DataSet: TDataSet);
    procedure CDSNfeLoteItemConsAfterOpen(DataSet: TDataSet);
    procedure CDSNfeLoteItemConsAfterInsert(DataSet: TDataSet);
    procedure QNfeLoteConsBeforeOpen(DataSet: TDataSet);
    procedure QNfeLoteConsAfterOpen(DataSet: TDataSet);
    procedure QNfeLoteConsBeforeClose(DataSet: TDataSet);
    procedure QNfeLoteItemConsBeforeOpen(DataSet: TDataSet);
  private
  public
    function AcaoEmLote(Acoes: TAcoesLote; MostraResultado: Boolean = True): Integer;
    procedure CarregaLoteCons(IdLote: Longint; ForceRefresh: Boolean = True);
    procedure CarregaNotaCons(Nota: Integer);
    procedure ConfirmaEnvioLoteNfe(IdLote: Double);
    procedure SetRegistro(Id: Double; ForceRefresh: Boolean = True);
    procedure SetSelecaoItem(Sel: String = 'S');
    procedure InverteSelecaoItem;
    procedure AdicionaNotaEmLote(Chave :String; Filial :Integer; CodNota: Integer);
  end;

var
  DMNfEletronicaLote: TDMNfEletronicaLote;

const
  SIT_NF_E_LOTE_CRIADO: Integer = 1;
  SIT_NF_E_LOTE_ENVIADO: Integer = 2;

implementation

uses UOracle_cl, Dialogs, UParamSistema_cl, UBiblioteca, Forms,
  UUsuario_cl, UAguardoNfe, UNFeRetorno, UAguardoBloqueado, NfeUtils,
  NfeConsts, UNotaSaida_cl, NfseConsts;

{$R *.dfm}

procedure TDMNfEletronicaLote.ConfirmaEnvioLoteNfe(IdLote: Double);
begin
  if IdLote < 1 then
    Exit;
  SetRegistro(IdLote);

  QNfeLote.Edit;
  QNfeLoteIND_SITUACAO.Value := SIT_NF_E_LOTE_ENVIADO;
  QNfeLoteDT_ENVIO.Value := DMOracle.DataHoraServ;
  QNfeLote.Post;
end;

procedure TDMNfEletronicaLote.AdicionaNotaEmLote(Chave :String; Filial :Integer; CodNota: Integer);
var
  Buscador :TBuscador;
  IdLote :String;
  Cod_nota_cab: String;
  aux: String;
begin
  Buscador := TBuscador.Create;
  IdLote := '';
  Cod_nota_cab := '';
  if Filial = 0 then
  begin
    MessageDlg('Por favor selecione uma nota para adicionar ao lote', mtError, [mbOk],0);
    Abort;
  end;
  if Chave = '' then
  begin
    MessageDlg('Nota Fiscal não possui chave de acesso', mtError, [mbOk],0);
    Abort;
  end;
  //Certifica-se que a nota não possua um lote (NF-es antigas)

  aux := QuotedStr(Bib.LimpaNumero(Chave));
  Buscador.Limpa;
  Buscador.Adiciona('SELECT ID_LOTE FROM TB_NF_ELETRONICA WHERE DESC_CHAVE_ACESSO = ' +
    QuotedStr(Bib.LimpaNumero(Chave)));
  Buscador.Adiciona('SELECT COD_NOTA_CAB FROM TB_NF_ELETRONICA WHERE DESC_CHAVE_ACESSO = ' +
    QuotedStr(Bib.LimpaNumero(Chave)));
  Buscador.Buscar;
  if Buscador.TemProximo then
  begin
    IdLote := Buscador.Proximo;
    Cod_nota_cab := Buscador.Proximo;
  end;
  if IdLote <> '' then
  begin
    if Cod_nota_cab = '' then
      with DMOracle do
      begin
        DMOracle.DBCemapa.StartTransaction;
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        QExecSQL.SQL.Add('UPDATE TB_NF_ELETRONICA SET COD_NOTA_CAB = ');
        QExecSQL.SQL.Add(IntToStr(CodNota));
        QExecSQL.SQL.Add(' WHERE DESC_CHAVE_ACESSO = ');
        QExecSQL.SQL.Add(QuotedStr(Bib.LimpaNumero(Chave)));
        QExecSQL.ExecSQL;
        DMOracle.DBCemapa.Commit;
      end;
    if MessageDlg('Esta nota já pertence ao lote ' + IdLote + '. Deseja atribuir um novo lote?',mtWarning,[mbYes, mbNo],0) = mrNo then
      Abort;
  end;

  try
    //Insere o lote
    QNfeLote.Open;
    QNfeLote.Insert;
    QNfeLoteDT_CRIACAO.Value := DMOracle.DataHoraServ;
    QNfeLoteCOD_FILIAL.Value := Filial;
    QNfeLote.Post;

    with DMOracle do
    begin
      DMOracle.DBCemapa.StartTransaction;
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add('UPDATE TB_NF_ELETRONICA SET ID_LOTE = ');
      QExecSQL.SQL.Add(QNfeLoteID_LOTE.Text);
      QExecSQL.SQL.Add(' WHERE ID_LOTE = ');
      QExecSQL.SQL.Add(IdLote);
      QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
    end;
    MessageDlg('Nota inserida ao novo lote ' + QNfeLoteID_LOTE.Text, mtInformation, [mbOk], 0);
  Except
    DMOracle.DBCemapa.Rollback;
  end;
end;

procedure TDMNfEletronicaLote.QNfeLoteAfterInsert(DataSet: TDataSet);
begin
  QNfeLoteIND_SITUACAO.Value := SIT_NF_E_LOTE_CRIADO;
  QNfeLoteDT_CRIACAO.Value := DMOracle.DataHoraServ;
end;

procedure TDMNfEletronicaLote.SetRegistro(Id: Double; ForceRefresh: Boolean = True);
begin
  if (QNfeLoteID_LOTE.Value <> Id) or (ForceRefresh) then
  begin
    QNfeLote.Close;
    QNfeLote.SetVariable('PK', Id);
    QNfeLote.Open;
  end;
end;

procedure TDMNfEletronicaLote.QNfeLoteConsCalcFields(DataSet: TDataSet);
begin
  QNfeLoteConsdesc_situacao.Value := '';
  if QNfeLoteConsIND_SITUACAO.Value = SIT_NF_E_LOTE_CRIADO then
    QNfeLoteConsdesc_situacao.Value := 'PENDENTE'
  else if QNfeLoteConsIND_SITUACAO.Value = SIT_NF_E_LOTE_ENVIADO then
    QNfeLoteConsdesc_situacao.Value := 'ENVIADO';
//  if QNfeLoteConsIND_CONTINGENCIA.Value = TP_EMIS_CONTINGENCIA_SCAN then
//    QNfeLoteConscod_uf_ibge_envio.Value := 0;
end;

procedure TDMNfEletronicaLote.CDSNfeLoteItemConsCalcFields(
  DataSet: TDataSet);
var
  Assunto, Corpo: String;
  SitEnvio, SitCanc: Integer;
begin
  CDSNfeLoteItemConsdesc_tipo_nota.Value := '';
  CDSNfeLoteItemConsdesc_assunto_email.Value := '';
  CDSNfeLoteItemConsdesc_corpo_email.Value := '';

  if CDSNfeLoteItemConsIND_ENTRADA_SAIDA.Value = 'E' then
    CDSNfeLoteItemConsdesc_tipo_nota.Value := 'ENTRADA'
  else if CDSNfeLoteItemConsIND_ENTRADA_SAIDA.Value = 'S' then
    CDSNfeLoteItemConsdesc_tipo_nota.Value := 'SAIDA';
  CDSNfeLoteItemConsretorno_sefaz.Value := '';

  SitEnvio := StrToInt('0' + CDSNfeLoteItemConsDESC_RETORNO_PROCESSAMENTO.Value);
  SitCanc := StrToInt('0' + CDSNfeLoteItemConsDESC_RETORNO_CANCELAMENTO.Value);
  CDSNfeLoteItemConsind_autorizado.Value := SitEnvio in SIT_NFE_ACEITO;
  CDSNfeLoteItemConsind_cancelado.Value := SitCanc in SIT_NFE_CANCELA;
  CDSNfeLoteItemConsind_denegado.Value := (SitEnvio - 100 in [10, 105, 201, 202]); //status 110, 205, 301 ou 302
  CDSNfeLoteItemConsind_pendente.Value := (SitEnvio > 999) and (SitEnvio < 1005);

  if not CDSNfeLoteItemConsSTATUS.IsNull then
  begin
    try
      if CDSNfeLoteItemConsind_cancelado.Value then
        CDSNfeLoteItemConsretorno_sefaz.Value := CDSNfeLoteItemConsDESC_RETORNO_CANCELAMENTO.Value +
            ' - ' + CDSNfeLoteItemConsDESC_MSG_CANCELAMENTO.Value
      else
        CDSNfeLoteItemConsretorno_sefaz.Value := CDSNfeLoteItemConsDESC_RETORNO_PROCESSAMENTO.Value + ' - ' +
            CDSNfeLoteItemConsDESC_MSG_VALIDACAO_LOTE.Value;
    except
      MessageDlg('Erro ao carregar situação das notas.', mtWarning, [mbOK], 0);
    end;
  end;

    with DMParamSistema do
      if StrToInt('0' + CDSNfeLoteItemConsSTATUS.Value) in SIT_NFE_CANCELA then
      begin
        Assunto := QParamSistemaDESC_ASSUNTO_EMAIL_CANC.Value;
        Corpo := QParamSistemaDESC_CORPO_EMAIL_CANC.Value;
      end
      else
      begin
        Assunto := QParamSistemaDESC_ASSUNTO_EMAIL.Value;
        Corpo := QParamSistemaDESC_CORPO_EMAIL.Value;
      end;

  CDSNfeLoteItemConsdesc_anexo_email.Value := 'NF-e_' + CDSNfeLoteItemConsNUM_NOTA.Text;
  with Bib do
  begin
    Assunto := SubstituiStr(Assunto, NFE_EMAIL_NUMERO, CDSNfeLoteItemConsNUM_NOTA.Text);
    Assunto := SubstituiStr(Assunto, NFE_EMAIL_SERIE, CDSNfeLoteItemConsCOD_SERIE.Value);
    Assunto := SubstituiStr(Assunto, DFE_EMAIL_FILIAL, QNfeLoteConsDESC_FILIAL.Value);
    Assunto := SubstituiStr(Assunto, DFE_EMAIL_ARQUIVO, CDSNfeLoteItemConsdesc_anexo_email.Value);
    Assunto := SubstituiStr(Assunto, DFE_EMAIL_CNPJ, QNfeLoteConsCGC_FILIAL.Value);
    Assunto := SubstituiStr(Assunto, #$D + #$A, '<p>');
    Assunto := SubstituiStr(Assunto, #$A, '<p>');

    Corpo := SubstituiStr(Corpo, NFE_EMAIL_NUMERO, CDSNfeLoteItemConsNUM_NOTA.Text);
    Corpo := SubstituiStr(Corpo, NFE_EMAIL_SERIE, CDSNfeLoteItemConsCOD_SERIE.Value);
    Corpo := SubstituiStr(Corpo, DFE_EMAIL_FILIAL, QNfeLoteConsDESC_FILIAL.Value);
    Corpo := SubstituiStr(Corpo, DFE_EMAIL_ARQUIVO, CDSNfeLoteItemConsdesc_anexo_email.Value);
    Corpo := SubstituiStr(Corpo, DFE_EMAIL_CNPJ, QNfeLoteConsCGC_FILIAL.Value);
    Corpo := Corpo + '<p>' + CDSNfeLoteItemConsNUM_CGC_CPF.Value;
    Corpo := Corpo + '<p>' + CDSNfeLoteItemConsNOME_CADASTRO.Value;
    Corpo := SubstituiStr(Corpo, #$D + #$A, '<p>');
    Corpo := SubstituiStr(Corpo, #$A, '<p>');
  end;
  CDSNfeLoteItemConsdesc_assunto_email.Value := Assunto;
  CDSNfeLoteItemConsdesc_corpo_email.Value := Corpo;
end;

procedure TDMNfEletronicaLote.CDSNfeLoteItemConsAfterOpen(
  DataSet: TDataSet);
begin
  DMParamSistema.QParamSistema.RefreshRecord;
end;

function TDMNfEletronicaLote.AcaoEmLote(Acoes: TAcoesLote; MostraResultado: Boolean = True): Integer;
(*
 * Funcao para acao sobre o lote presente em QNfeLoteCons.
 * Cuidado: No caso de solicitação de gerar xml (alGeraXML) a função irá efetuar
 * um commit.
 *)
var
  ExecList: TList;
  DescEmail: String;
begin
  Result := 0;
  if CDSNfeLoteItemCons.RecordCount = 0 then
    Exit;

  //========================================== NF-e ================================================//
  //GERAÇÃO DE XML
  if Acoes.Contains(alGeraXML) then
  begin
    QNfeLote.Close;
    QNfeLote.SetVariable('PK', CDSNfeLoteItemConsID_LOTE.Value);
    QNfeLote.Open;
    QNfeLoteItem.Close;
    QNfeLoteItem.ClearVariables;
    QNfeLoteItem.SetVariable('ID_LOTE', CDSNfeLoteItemConsID_LOTE.Value);
    QNfeLoteItem.Open;
    while not QNfeLoteItem.Eof do
    begin
      QNfeLoteItem.Edit;
      QNfeLoteItemDESC_XML_NFE.Value := TNfeUtils.GeraXMLNfe(QNfeLoteItemCOD_NOTA_CAB.Value);
      QNfeLoteItem.Post;

      QNfeLoteItem.Next;
    end;
    DMOracle.DBCemapa.Commit;
  end;

  ExecList := TList.Create;

  //CANCELAMENTO DE NF-E
  if Acoes.Contains(alCancela) then
    ExecList.Add(TExecucaoCancela.Create(QNfeLoteConsDESC_REPOSITORIO_NFE.Value,
        CDSNfeLoteItemConsLOTE_CANC.AsInteger , QNfeLoteConsCOD_UF_IBGE.Value,
        CDSNfeLoteItemConsIND_AMBIENTE_NFE.Value,
        CDSNfeLoteItemConsNUM_NOTA.Value, CDSNfeLoteItemConsDESC_CHAVE_ACESSO.Value));

  //ENVIO DE LOTE / CONSULTA DE LOTE
  if Acoes.Contains(alEnvio) then
    ExecList.Add(TExecucaoEnviaLote.Create(QNfeLoteConsDESC_REPOSITORIO_NFE.Value,
        QNfeLoteConsID_LOTE.AsInteger, QNfeLoteConsCOD_UF_IBGE.Value,
        Acoes.Contains(alConsulta)))
  else if Acoes.Contains(alConsulta) then
    ExecList.Add(TExecucaoConsultaLote.Create(QNfeLoteConsDESC_REPOSITORIO_NFE.Value,
        QNfeLoteConsID_LOTE.AsInteger, QNfeLoteConsCOD_UF_IBGE.Value));

  //CONSULTA DE PROTOCOLO
  if Acoes.Contains(alConsultaProtocolo) then
  begin
    CDSNfeLoteItemCons.First;
    while not CDSNfeLoteItemCons.Eof do
    begin
      if CDSNfeLoteItemConsIND_SELECIONADO.Value = 'S' then
        ExecList.Add(TExecucaoConsultaProtocolo.Create(
            QNfeLoteConsDESC_REPOSITORIO_NFE.Value,
            QNfeLoteConsCOD_FILIAL.Value,
            QNfeLoteConsCOD_UF_IBGE.Value,
            CDSNfeLoteItemConsIND_AMBIENTE_NFE.Value,
            CDSNfeLoteItemConsNUM_NOTA.Value,
            CDSNfeLoteItemConsDESC_CHAVE_ACESSO.Value));
      CDSNfeLoteItemCons.Next;
    end;
  end;

  //========================================== NFS-e ================================================//
  //Envio de Lote Rps
  if Acoes.Contains(alEnvioRps) then
    ExecList.Add(TExecucaoEnviaLoteRps.Create(QNfeLoteConsDESC_REPOSITORIO_NFE.Value,
        QNfeLoteConsID_LOTE.AsInteger, QNfeLoteConsCOD_IBGE_CIDADE.AsInteger,
        Acoes.Contains(alConsLoteRps)))
  else if Acoes.Contains(alConsSitLote) then
    ExecList.Add(TExecucaoConsultaSitLote.Create(QNfeLoteConsDESC_REPOSITORIO_NFE.Value,
        QNfeLoteConsCOD_FILIAL.Value, QNfeLoteConsCOD_IBGE_CIDADE.AsInteger,
        QNfeLoteConsDESC_PROTOCOLO.Value))
  else if Acoes.Contains(alConsLoteRps) then
    ExecList.Add(TExecucaoConsultaLoteRps.Create(QNfeLoteConsDESC_REPOSITORIO_NFE.Value,
        QNfeLoteConsID_LOTE.AsInteger,QNfeLoteConsCOD_IBGE_CIDADE.AsInteger,
        QNfeLoteConsDESC_PROTOCOLO.Value));

  //Consulta de NFS-e por Rps
  if Acoes.Contains(alConsNfseRps) then
  begin
    CDSNfeLoteItemCons.First;
    while not CDSNfeLoteItemCons.Eof do
    begin
      if CDSNfeLoteItemConsIND_SELECIONADO.Value = 'S' then
        ExecList.Add(TExecucaoConsultaNFSeRps.Create(QNfeLoteConsDESC_REPOSITORIO_NFE.Value,
            QNfeLoteConsCOD_FILIAL.Value, QNfeLoteConsCOD_IBGE_CIDADE.AsInteger, CDSNfeLoteItemConsNUM_NOTA.Value,
            CDSNfeLoteItemConsDESC_CHAVE_ACESSO.Value, CDSNfeLoteItemConsCOD_SERIE.Value,IntToStr(TIPO_RPS)));
      CDSNfeLoteItemCons.Next;
    end;
  end;

  //Consulta de NFS-e
  if Acoes.Contains(alConsNFSe) then
  begin
    CDSNfeLoteItemCons.First;
    while not CDSNfeLoteItemCons.Eof do
    begin
      if CDSNfeLoteItemConsIND_SELECIONADO.Value = 'S' then
        ExecList.Add(TExecucaoConsultaNFSe.Create(QNfeLoteConsDESC_REPOSITORIO_NFE.Value,
            QNfeLoteConsCOD_FILIAL.Value, QNfeLoteConsCOD_IBGE_CIDADE.AsInteger,
            CDSNfeLoteItemConsDESC_CHAVE_ACESSO.Value, CDSNfeLoteItemConsNUM_NFSE.Value,
            CDSNfeLoteItemConsDT_EMISSAO.Value,
            CDSNfeLoteItemConsDT_EMISSAO.Value, Bib.LimpaNumero(CDSNfeLoteItemConsNUM_CGC_CPF.Value),
            CDSNfeLoteItemConsDESC_INSCRICAO_MUNICIPAL.Value, '','',''));
      CDSNfeLoteItemCons.Next;
    end;
  end;

  //CANCELAMENTO DE NFS-E
  if Acoes.Contains(alCancelaNFSe) then
    ExecList.Add(TExecucaoCancelaNFSe.Create(QNfeLoteConsDESC_REPOSITORIO_NFE.Value,
        QNfeLoteConsCOD_FILIAL.Value, QNfeLoteConsCOD_IBGE_CIDADE.AsInteger,
        CDSNfeLoteItemConsNUM_NFSE.Value, CDSNfeLoteItemConsDESC_CHAVE_ACESSO.Value, '0'));

  if (Acoes.Contains(alDanfe)) or (Acoes.Contains(alEmail)) or (Acoes.Contains(alSalvaDanfePdf)) then
  begin
    CDSNfeLoteItemCons.First;
    while not CDSNfeLoteItemCons.Eof do
    begin
      if CDSNfeLoteItemConsIND_SELECIONADO.Value = 'S' then
      begin
        //SALVA DANFE EM PDF
        if Acoes.Contains(alSalvaDanfePdf) then
          ExecList.Add(TExecucaoSalvaDanfePdf.Create(
              QNfeLoteConsDESC_REPOSITORIO_NFE.Value,
              CDSNfeLoteItemConsDESC_CHAVE_ACESSO.Value,
              bib.ift(CDSNfeLoteItemConsCOD_SERIE_MODELO.Value = '65',
               CDSNfeLoteItemConsDESC_IMPRESSORA_DANFE_NFCE.Value,
               CDSNfeLoteItemConsDESC_IMPRESSORA_DANFE.Value),
              CDSNfeLoteItemConsNUM_NOTA.Value, CDSNfeLoteItemConsIND_NFSE.Value = 'NAO'));
        //EMISSÃO DE DANFE
        if Acoes.Contains(alDanfe) then
          ExecList.Add(TExecucaoImprimeDanfe.Create(
              QNfeLoteConsDESC_REPOSITORIO_NFE.Value,
              CDSNfeLoteItemConsDESC_CHAVE_ACESSO.Value,
              bib.ift(CDSNfeLoteItemConsCOD_SERIE_MODELO.Value = '65',
               CDSNfeLoteItemConsDESC_IMPRESSORA_DANFE_NFCE.Value,
               CDSNfeLoteItemConsDESC_IMPRESSORA_DANFE.Value),
              bib.ift(CDSNfeLoteItemConsCOD_SERIE_MODELO.Value = '65',
               CDSNfeLoteItemConsNUM_VIAS_DANFE_NFCE.Value,
               CDSNfeLoteItemConsNUM_VIAS_DANFE.Value),
              CDSNfeLoteItemConsNUM_NOTA.Value, CDSNfeLoteItemConsIND_NFSE.Value = 'NAO'));

        //EMISSÃO DE E-MAIL
        if Acoes.Contains(alEmail) then
        begin
          DescEmail := CDSNfeLoteItemConsDESC_EMAIL.Value;
          if (DescEmail <> '') or (InputQuery('E-mail não cadastrado',
              'Informe o e-mail para ' + CDSNfeLoteItemConsCADASTRO.Value +
              ' ou cancele para não enviar para este cliente:',
              DescEmail)) then
            ExecList.Add(TExecucaoEnviaEmail.Create(QNfeLoteConsDESC_REPOSITORIO_NFE.Value,
                CDSNfeLoteItemConsDESC_CHAVE_ACESSO.Value, DescEmail,
                CDSNfeLoteItemConsdesc_assunto_email.Value,
                CDSNfeLoteItemConsdesc_corpo_email.Value,
                CDSNfeLoteItemConsEMAIL_XML.Value = 'S',
                CDSNfeLoteItemConsEMAIL_PDF.Value = 'S',
                CDSNfeLoteItemConsNUM_NOTA.Value, CDSNfeLoteItemConsIND_NFSE.Value = 'NAO'));
        end;
      end;
      CDSNfeLoteItemCons.Next;
    end;
  end;

  Result := DMNfe.ExecutaAcoes(ExecList, MostraResultado);
end;

{ TAcoesLote }

function TAcoesLote.Add(Acao: TAcaoLote): TAcoesLote;
var
  i: Integer;
begin
  i := Length(FAcoes);
  SetLength(FAcoes, i + 1);
  FAcoes[i] := Acao;
  Result := Self;
end;

function TAcoesLote.Contains(Acao: TAcaoLote): Boolean;
var
  i: Integer;
begin
  Result := True;
  for i := 0 to Length(FAcoes) - 1 do
    if FAcoes[i] = Acao then
      Exit;
  Result := False;
end;

procedure TDMNfEletronicaLote.CarregaLoteCons(IdLote: Longint;
  ForceRefresh: Boolean);
begin
  if (QNfeLoteConsID_LOTE.Value <> IdLote) or (ForceRefresh) then
  begin
    QNfeLoteCons.Close;
    QNfeLoteCons.ClearVariables;
    QNfeLoteCons.SetVariable('ID_LOTE', IdLote);
    QNfeLoteCons.Open;
  end;
end;

procedure TDMNfEletronicaLote.CDSNfeLoteItemConsAfterInsert(
  DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMNfEletronicaLote.InverteSelecaoItem;
begin
  if CDSNfeLoteItemConsIND_SELECIONADO.Value = 'S' then
    SetSelecaoItem('N')
  else
    SetSelecaoItem('S');
end;

procedure TDMNfEletronicaLote.SetSelecaoItem(Sel: String);
begin
  try
    if (CDSNfeLoteItemConsIND_SELECIONADO.Value <> Sel) then
    begin
      if not (CDSNfeLoteItemCons.State in [DsEdit, DsInsert]) then
        CDSNfeLoteItemCons.Edit;
      CDSNfeLoteItemConsIND_SELECIONADO.Value := Sel;
      if CDSNfeLoteItemCons.State in [DsEdit, DsInsert] then
        CDSNfeLoteItemCons.Post;
    end;
  except
    Raise;
  end;
end;

procedure TDMNfEletronicaLote.QNfeLoteConsBeforeOpen(DataSet: TDataSet);
begin
//  QNfeLoteCons.SetVariable('USUARIO', DMUsuario.CodUsuarioCorrente);
end;

procedure TDMNfEletronicaLote.QNfeLoteConsAfterOpen(DataSet: TDataSet);
begin
  CDSNfeLoteItemCons.Open;
end;

procedure TDMNfEletronicaLote.QNfeLoteConsBeforeClose(DataSet: TDataSet);
begin
  CDSNfeLoteItemCons.Close;
end;

procedure TDMNfEletronicaLote.CarregaNotaCons(Nota: Integer);
begin
  QNfeLoteCons.Close;
  QNfeLoteCons.ClearVariables;
  QNfeLoteCons.SetVariable('NOTA_CAB', Nota);
  QNfeLoteCons.Open;

  while (CDSNfeLoteItemConsCOD_NOTA_CAB.Value <> Nota) and
      (not CDSNfeLoteItemCons.Eof) do
    CDSNfeLoteItemCons.Next;
end;

procedure TDMNfEletronicaLote.QNfeLoteItemConsBeforeOpen(
  DataSet: TDataSet);
begin
  QNfeLoteItemCons.DeclareVariable('COD_USUARIO', otInteger);
  QNfeLoteItemCons.SetVariable('COD_USUARIO', DMUsuario.CodUsuarioCorrente);
end;

end.
