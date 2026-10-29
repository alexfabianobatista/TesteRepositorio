unit UCteLote_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, Provider, DBClient, UNfe_cl, Oracle;

type
  TAcaoLoteCTe = (alEnvioCTe, alGeraXMLCTe, alDacte, alEmailCTe, alEmailAvulsoCTe,
  alConsultaCTe, alConsultaProtocoloCTe, alCancelaCTe, alSalvaDactePdf, alCartaCorrecaoCTe);

  TAcoesLoteCTe = class
  protected
    FAcoes: Array of TAcaoLoteCTe;
  public
    function Add(Acao: TAcaoLoteCTe): TAcoesLoteCTe;
    function Contains(Acao: TAcaoLoteCTe): Boolean;
  end;

  TDMCteLote = class(TDataModule)
    QCteLote: TOracleDataSet1;
    QCteLoteCons: TOracleDataSet1;
    QCteLoteItemCons: TOracleDataSet1;
    QCteLoteConsdesc_situacao: TStringField;
    QCteLoteItem: TOracleDataSet1;
    QCteLoteItemID_LOTE: TFloatField;
    QCteLoteItemDESC_CHAVE_ACESSO: TStringField;
    QCteLoteItemCOD_FILIAL: TIntegerField;
    QCteLoteItemDESC_SERIE: TStringField;
    CDSCteLoteItemCons: TClientDataSet;
    DSPCteLoteItemCons: TDataSetProvider;
    DSCteLoteCons: TDataSource;
    CDSCteLoteItemConsdesc_tipo_nota: TStringField;
    CDSCteLoteItemConsdesc_assunto_email: TStringField;
    CDSCteLoteItemConsdesc_corpo_email: TStringField;
    CDSCteLoteItemConsdesc_anexo_email: TStringField;
    CDSCteLoteItemConsretorno_sefaz: TStringField;
    CDSCteLoteItemConsind_autorizado: TBooleanField;
    CDSCteLoteItemConsind_cancelado: TBooleanField;
    CDSCteLoteItemConsind_denegado: TBooleanField;
    CDSCteLoteItemConsind_pendente: TBooleanField;
    QCteLoteItemNUM_CTE: TIntegerField;
    QCteLoteItemDESC_XML_CTE: TMemoField;
    QCteLoteItemIND_AMBIENTE_CTE: TIntegerField;
    QCteLoteItemCOD_CONHECIMENTO: TIntegerField;
    QCteLoteID_LOTE: TFloatField;
    QCteLoteIND_SITUACAO: TIntegerField;
    QCteLoteDT_CRIACAO: TDateTimeField;
    QCteLoteDT_ENVIO: TDateTimeField;
    QCteLoteCOD_FILIAL: TIntegerField;
    QCteLoteNUM_RECIBO: TFloatField;
    QCteLoteConsID_LOTE: TFloatField;
    QCteLoteConsIND_SITUACAO: TIntegerField;
    QCteLoteConsDT_CRIACAO: TDateTimeField;
    QCteLoteConsDT_ENVIO: TDateTimeField;
    QCteLoteConsCOD_FILIAL: TIntegerField;
    QCteLoteConsDESC_REPOSITORIO_NFE: TStringField;
    QCteLoteConsDESC_FILIAL: TStringField;
    QCteLoteConsCGC_FILIAL: TStringField;
    QCteLoteConsIND_CONTINGENCIA: TFloatField;
    QCteLoteConsCOD_UF_IBGE: TIntegerField;
    QCteLoteConsCONT_SELECIONADO: TFloatField;
    QCteLoteConsCOD_USUARIO: TIntegerField;
    QCteLoteConsDESC_IMPRESSORA_DACTE: TStringField;
    QCteLoteItemConsID_LOTE: TFloatField;
    QCteLoteItemConsDESC_CHAVE_ACESSO: TStringField;
    QCteLoteItemConsDESC_MSG_CANCELAMENTO: TStringField;
    QCteLoteItemConsDESC_MSG_VALIDACAO: TMemoField;
    QCteLoteItemConsDESC_MSG_VALIDACAO_LOTE: TMemoField;
    QCteLoteItemConsDESC_PROT_AUTORIZACAO: TStringField;
    QCteLoteItemConsDESC_PROT_CANCELAMENTO: TStringField;
    QCteLoteItemConsDESC_RETORNO_CANCELAMENTO: TStringField;
    QCteLoteItemConsDESC_RETORNO_PROCESSAMENTO: TStringField;
    QCteLoteItemConsDESC_XML_CTE: TMemoField;
    QCteLoteItemConsDESC_XML_RETORNO: TMemoField;
    QCteLoteItemConsSTATUS: TStringField;
    QCteLoteItemConsDT_EMISSAO: TDateTimeField;
    QCteLoteItemConsCOD_SERIE: TStringField;
    QCteLoteItemConsCOD_CONHECIMENTO: TIntegerField;
    QCteLoteItemConsNUM_CONHECIMENTO: TIntegerField;
    QCteLoteItemConsIND_CONTINGENCIA_CTE: TStringField;
    QCteLoteItemConsIND_AMBIENTE_CTE: TIntegerField;
    QCteLoteItemConsDESTINATARIO: TStringField;
    QCteLoteItemConsNOME_DEST: TStringField;
    QCteLoteItemConsEMAIL_XML: TStringField;
    QCteLoteItemConsEMAIL_PDF: TStringField;
    QCteLoteItemConsIND_SELECIONADO: TStringField;
    QCteLoteItemConsDESC_JUST_CANCELA: TStringField;
    QCteLoteItemConsNUM_VIAS_DACTE: TIntegerField;
    QCteLoteItemConsDESC_IMPRESSORA_DACTE: TStringField;
    CDSCteLoteItemConsID_LOTE: TFloatField;
    CDSCteLoteItemConsDESC_CHAVE_ACESSO: TStringField;
    CDSCteLoteItemConsDESC_MSG_CANCELAMENTO: TStringField;
    CDSCteLoteItemConsDESC_MSG_VALIDACAO: TMemoField;
    CDSCteLoteItemConsDESC_MSG_VALIDACAO_LOTE: TMemoField;
    CDSCteLoteItemConsDESC_PROT_AUTORIZACAO: TStringField;
    CDSCteLoteItemConsDESC_PROT_CANCELAMENTO: TStringField;
    CDSCteLoteItemConsDESC_RETORNO_CANCELAMENTO: TStringField;
    CDSCteLoteItemConsDESC_RETORNO_PROCESSAMENTO: TStringField;
    CDSCteLoteItemConsDESC_XML_CTE: TMemoField;
    CDSCteLoteItemConsDESC_XML_RETORNO: TMemoField;
    CDSCteLoteItemConsSTATUS: TStringField;
    CDSCteLoteItemConsDT_EMISSAO: TDateTimeField;
    CDSCteLoteItemConsCOD_SERIE: TStringField;
    CDSCteLoteItemConsCOD_CONHECIMENTO: TIntegerField;
    CDSCteLoteItemConsNUM_CONHECIMENTO: TIntegerField;
    CDSCteLoteItemConsIND_CONTINGENCIA_CTE: TStringField;
    CDSCteLoteItemConsIND_AMBIENTE_CTE: TIntegerField;
    CDSCteLoteItemConsDESTINATARIO: TStringField;
    CDSCteLoteItemConsNOME_DEST: TStringField;
    CDSCteLoteItemConsEMAIL_XML: TStringField;
    CDSCteLoteItemConsEMAIL_PDF: TStringField;
    CDSCteLoteItemConsIND_SELECIONADO: TStringField;
    CDSCteLoteItemConsDESC_JUST_CANCELA: TStringField;
    CDSCteLoteItemConsNUM_VIAS_DACTE: TIntegerField;
    CDSCteLoteItemConsDESC_IMPRESSORA_DACTE: TStringField;
    QCteLoteItemConsCPF_CNPJ_DEST: TStringField;
    QCteLoteItemConsREMETENTE: TStringField;
    QCteLoteItemConsCPF_CNPJ_REM: TStringField;
    QCteLoteItemConsNOME_REM: TStringField;
    CDSCteLoteItemConsCPF_CNPJ_DEST: TStringField;
    CDSCteLoteItemConsREMETENTE: TStringField;
    CDSCteLoteItemConsCPF_CNPJ_REM: TStringField;
    CDSCteLoteItemConsNOME_REM: TStringField;
    CDSCteLoteItemConsDESC_EMAIL: TStringField;
    CDSCteLoteItemConsEMAIL_DEST: TStringField;
    CDSCteLoteItemConsEMAIL_TOM: TStringField;
    CDSCteLoteItemConsEMAIL_REM: TStringField;
    CDSCteLoteItemConsEMAIL_EXP: TStringField;
    CDSCteLoteItemConsEMAIL_REC: TStringField;
    QCteLoteItemConsIND_CTE_EMAIL_DEST: TIntegerField;
    QCteLoteItemConsIND_CTE_EMAIL_REM: TIntegerField;
    QCteLoteItemConsIND_CTE_EMAIL_EXP: TIntegerField;
    QCteLoteItemConsIND_CTE_EMAIL_REC: TIntegerField;
    CDSCteLoteItemConsIND_CTE_EMAIL_DEST: TIntegerField;
    CDSCteLoteItemConsIND_CTE_EMAIL_REM: TIntegerField;
    CDSCteLoteItemConsIND_CTE_EMAIL_EXP: TIntegerField;
    CDSCteLoteItemConsIND_CTE_EMAIL_REC: TIntegerField;
    QCteLoteItemConsEXPEDIDOR: TStringField;
    QCteLoteItemConsCPF_CNPJ_EXP: TStringField;
    QCteLoteItemConsNOME_EXP: TStringField;
    QCteLoteItemConsRECEBEDOR: TStringField;
    QCteLoteItemConsCPF_CNPJ_REC: TStringField;
    QCteLoteItemConsNOME_REC: TStringField;
    CDSCteLoteItemConsEXPEDIDOR: TStringField;
    CDSCteLoteItemConsCPF_CNPJ_EXP: TStringField;
    CDSCteLoteItemConsNOME_EXP: TStringField;
    CDSCteLoteItemConsRECEBEDOR: TStringField;
    CDSCteLoteItemConsCPF_CNPJ_REC: TStringField;
    CDSCteLoteItemConsNOME_REC: TStringField;
    QCteLoteItemConsIND_CTE_EMAIL_FILIAL: TIntegerField;
    QCteLoteItemConsEMAIL_FILIAL: TStringField;
    CDSCteLoteItemConsIND_CTE_EMAIL_FILIAL: TIntegerField;
    CDSCteLoteItemConsEMAIL_FILIAL: TStringField;
    QCteLoteItemConsDESC_XML_RETORNO_CANCELAMENTO: TMemoField;
    CDSCteLoteItemConsDESC_XML_RETORNO_CANCELAMENTO: TMemoField;
    QCteLoteItemConsEMAIL_DEST: TStringField;
    QCteLoteItemConsEMAIL_TOM: TStringField;
    QCteLoteItemConsEMAIL_REM: TStringField;
    QCteLoteItemConsEMAIL_EXP: TStringField;
    QCteLoteItemConsEMAIL_REC: TStringField;
    QCteLoteItemConsDESC_EMAIL: TStringField;
    procedure QCteLoteAfterInsert(DataSet: TDataSet);
    procedure QCteLoteConsCalcFields(DataSet: TDataSet);
    procedure CDSCteLoteItemConsCalcFields(DataSet: TDataSet);
    procedure CDSCteLoteItemConsAfterOpen(DataSet: TDataSet);
    procedure CDSCteLoteItemConsAfterInsert(DataSet: TDataSet);
    procedure QCteLoteConsBeforeOpen(DataSet: TDataSet);
    procedure QCteLoteConsAfterOpen(DataSet: TDataSet);
    procedure QCteLoteConsBeforeClose(DataSet: TDataSet);
    procedure QCteLoteItemConsBeforeOpen(DataSet: TDataSet);
  private
  public
    function AcaoEmLote(Acoes: TAcoesLoteCTe; MostraResultado: Boolean = True): Integer;
    procedure CarregaLoteCons(IdLote: Longint; ForceRefresh: Boolean = True);
    procedure CarregaConhecimentoCons(CT: Integer);
    procedure ConfirmaEnvioLoteCte(IdLote: Double);
    procedure SetRegistro(Id: Double; ForceRefresh: Boolean = True);
    procedure SetSelecaoItem(Sel: String = 'S');
    procedure InverteSelecaoItem;
    procedure AdicionaCTeEmLote(Chave :String; Filial :Integer; CodConhecimento: Integer);
  end;

var
  DMCteLote: TDMCteLote;

const
  SIT_CTE_LOTE_CRIADO: Integer = 1;
  SIT_CTE_LOTE_ENVIADO: Integer = 2;

implementation

uses UOracle_cl, Dialogs, UParamSistema_cl, UBiblioteca, Forms,
  UUsuario_cl, UAguardoNfe, UNFeRetorno, UAguardoBloqueado, CteUtils,
  CteConsts, UConhecimento_cl, StrUtils;

{$R *.dfm}

procedure TDMCteLote.ConfirmaEnvioLoteCte(IdLote: Double);
begin
  if IdLote < 1 then
    Exit;
  SetRegistro(IdLote);

  QCteLote.Edit;
  QCteLoteIND_SITUACAO.Value := SIT_CTE_LOTE_ENVIADO;
  QCteLoteDT_ENVIO.Value := DMOracle.DataHoraServ;
  QCteLote.Post;
end;

procedure TDMCteLote.AdicionaCTeEmLote(Chave: String; Filial :Integer; CodConhecimento: Integer);
var
  Buscador :TBuscador;
  IdLote :String;
  aux: String;
begin
  Buscador := TBuscador.Create;
  IdLote := '';
  if Filial = 0 then
  begin
    MessageDlg('Por favor selecione um Conhecimento para adicionar ao lote', mtError, [mbOk],0);
    Abort;
  end;
  if Chave = '' then
  begin
    MessageDlg('Conhecimento de Transporte não possui chave de acesso', mtError, [mbOk],0);
    Abort;
  end;

  aux := QuotedStr(Bib.LimpaNumero(Chave));
  Buscador.Limpa;
  Buscador.Adiciona('SELECT ID_LOTE FROM TB_CTE WHERE DESC_CHAVE_ACESSO = ' +
    QuotedStr(Bib.LimpaNumero(Chave)));
  Buscador.Buscar;
  if Buscador.TemProximo then
  begin
    IdLote := Buscador.Proximo;
  end;
  if IdLote <> '' then
  begin
    with DMOracle do
    begin
      DMOracle.DBCemapa.StartTransaction;
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add('UPDATE TB_CTE SET COD_CONHECIMENTO = ');
      QExecSQL.SQL.Add(IntToStr(CodConhecimento));
      QExecSQL.SQL.Add(' WHERE DESC_CHAVE_ACESSO = ');
      QExecSQL.SQL.Add(QuotedStr(Bib.LimpaNumero(Chave)));
      QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
    end;
    MessageDlg('Este CT-e ja pertence ao lote ' + IdLote, mtInformation, [mbOk],0);
    Abort;
  end;

  try
    //Insere o lote
    QCteLote.Open;
    QCteLote.Insert;
    QCteLoteDT_CRIACAO.Value := DMOracle.DataHoraServ;
    QCteLoteCOD_FILIAL.Value := Filial;
    QCteLote.Post;

    with DMOracle do
    begin
      DMOracle.DBCemapa.StartTransaction;
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add('UPDATE TB_CTE SET ID_LOTE = ');
      QExecSQL.SQL.Add(QCteLoteID_LOTE.Text);
      QExecSQL.SQL.Add(', COD_CONHECIMENTO = ');
      QExecSQL.SQL.Add(IntToStr(CodConhecimento));
      QExecSQL.SQL.Add(' WHERE DESC_CHAVE_ACESSO = ');
      QExecSQL.SQL.Add(QuotedStr(Bib.LimpaNumero(Chave)));
      QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
    end;
    MessageDlg('Conhecimento inserido ao lote ' + IdLote, mtInformation, [mbOk], 0);
  Except
    DMOracle.DBCemapa.Rollback;
  end;
end;

procedure TDMCteLote.QCteLoteAfterInsert(DataSet: TDataSet);
begin
  QCteLoteIND_SITUACAO.Value := SIT_CTE_LOTE_CRIADO;
  QCteLoteDT_CRIACAO.Value := DMOracle.DataHoraServ;
end;

procedure TDMCteLote.SetRegistro(Id: Double; ForceRefresh: Boolean = True);
begin
  if (QCteLoteID_LOTE.Value <> Id) or (ForceRefresh) then
  begin
    QCteLote.Close;
    QCteLote.SetVariable('PK', Id);
    QCteLote.Open;
  end;
end;

procedure TDMCteLote.QCteLoteConsCalcFields(DataSet: TDataSet);
begin
  QCteLoteConsdesc_situacao.Value := '';
  if QCteLoteConsIND_SITUACAO.Value = SIT_CTE_LOTE_CRIADO then
    QCteLoteConsdesc_situacao.Value := 'PENDENTE'
  else if QCteLoteConsIND_SITUACAO.Value = SIT_CTE_LOTE_ENVIADO then
    QCteLoteConsdesc_situacao.Value := 'ENVIADO';
end;

procedure TDMCteLote.CDSCteLoteItemConsCalcFields(
  DataSet: TDataSet);
var
  Assunto, Corpo: String;
  SitEnvio, SitCanc: Integer;
begin
  CDSCteLoteItemConsdesc_tipo_nota.Value := '';
  CDSCteLoteItemConsdesc_assunto_email.Value := '';
  CDSCteLoteItemConsdesc_corpo_email.Value := '';

  CDSCteLoteItemConsretorno_sefaz.Value := '';

  SitEnvio := StrToInt('0' + CDSCteLoteItemConsDESC_RETORNO_PROCESSAMENTO.Value);
  SitCanc := StrToInt('0' + CDSCteLoteItemConsDESC_RETORNO_CANCELAMENTO.Value);
  CDSCteLoteItemConsind_autorizado.Value := SitEnvio in SIT_CTE_ACEITO;
  CDSCteLoteItemConsind_cancelado.Value := SitCanc in SIT_CTE_CANCELADO;
  CDSCteLoteItemConsind_denegado.Value := (SitEnvio - 100 in [10, 105, 201, 202]); //status 110, 205, 301 ou 302
  CDSCteLoteItemConsind_pendente.Value := (SitEnvio > 999) and (SitEnvio < 1005);

  if not CDSCteLoteItemConsSTATUS.IsNull then
  begin
    try
      if CDSCteLoteItemConsind_cancelado.Value then
        CDSCteLoteItemConsretorno_sefaz.Value := CDSCteLoteItemConsDESC_RETORNO_CANCELAMENTO.Value +
            ' - ' + CDSCteLoteItemConsDESC_MSG_CANCELAMENTO.Value
      else
        CDSCteLoteItemConsretorno_sefaz.Value := CDSCteLoteItemConsDESC_RETORNO_PROCESSAMENTO.Value + ' - ' +
            CDSCteLoteItemConsDESC_MSG_VALIDACAO_LOTE.Value;
    except
      MessageDlg('Erro ao carregar situação dos Conhecimentos.', mtWarning, [mbOK], 0);
    end;
  end;

    with DMParamSistema do
      if StrToInt('0' + CDSCteLoteItemConsSTATUS.Value) in SIT_CTE_CANCELADO then
      begin
        Assunto := QParamSistemaDESC_ASSUNTO_EMAIL_CANC_CTE.Value;
        Corpo := QParamSistemaDESC_CORPO_EMAIL_CANC_CTE.Value;
      end
      else
      begin
        Assunto := QParamSistemaDESC_ASSUNTO_EMAIL_CTE.Value;
        Corpo := QParamSistemaDESC_CORPO_EMAIL_CTE.Value;
      end;

  CDSCteLoteItemConsdesc_anexo_email.Value := 'CT-e_' + CDSCteLoteItemConsNUM_CONHECIMENTO.Text;
  with Bib do
  begin
    Assunto := SubstituiStr(Assunto, CTE_EMAIL_NUMERO, CDSCteLoteItemConsNUM_CONHECIMENTO.Text);
    Assunto := SubstituiStr(Assunto, CTE_EMAIL_SERIE, CDSCteLoteItemConsCOD_SERIE.Value);
    Assunto := SubstituiStr(Assunto, DFE_EMAIL_FILIAL, QCteLoteConsDESC_FILIAL.Value);
    Assunto := SubstituiStr(Assunto, DFE_EMAIL_ARQUIVO, CDSCteLoteItemConsdesc_anexo_email.Value);
    Assunto := SubstituiStr(Assunto, DFE_EMAIL_CNPJ, QCteLoteConsCGC_FILIAL.Value);
    Assunto := SubstituiStr(Assunto, #$D + #$A, '<p>');
    Assunto := SubstituiStr(Assunto, #$A, '<p>');

    Corpo := SubstituiStr(Corpo, CTE_EMAIL_NUMERO, CDSCteLoteItemConsNUM_CONHECIMENTO.Text);
    Corpo := SubstituiStr(Corpo, CTE_EMAIL_SERIE, CDSCteLoteItemConsCOD_SERIE.Value);
    Corpo := SubstituiStr(Corpo, DFE_EMAIL_FILIAL, QCteLoteConsDESC_FILIAL.Value);
    Corpo := SubstituiStr(Corpo, DFE_EMAIL_ARQUIVO, CDSCteLoteItemConsdesc_anexo_email.Value);
    Corpo := SubstituiStr(Corpo, DFE_EMAIL_CNPJ, QCteLoteConsCGC_FILIAL.Value);
    Corpo := Corpo + '<p>' + CDSCteLoteItemConsCPF_CNPJ_REM.Value;
    Corpo := Corpo + '<p>' + CDSCteLoteItemConsNOME_REM.Value;
    Corpo := Corpo + '<p>' + CDSCteLoteItemConsCPF_CNPJ_DEST.Value;
    Corpo := Corpo + '<p>' + CDSCteLoteItemConsNOME_DEST.Value;
    Corpo := SubstituiStr(Corpo, #$D + #$A, '<p>');
    Corpo := SubstituiStr(Corpo, #$A, '<p>');
  end;
  CDSCteLoteItemConsdesc_assunto_email.Value := Assunto;
  CDSCteLoteItemConsdesc_corpo_email.Value := Corpo;
end;

procedure TDMCteLote.CDSCteLoteItemConsAfterOpen(
  DataSet: TDataSet);
begin
  DMParamSistema.QParamSistema.RefreshRecord;
end;

function TDMCteLote.AcaoEmLote(Acoes: TAcoesLoteCTe; MostraResultado: Boolean = True): Integer;
(*
 * Funcao para acao sobre o lote presente em QCteLoteCons.
 * Cuidado: No caso de solicitação de gerar xml (alGeraXML) a função irá efetuar
 * um commit.
 *)
var
  ExecList: TList;
  DescEmail, EmailAgente: String;
begin
  Result := 0;
  if CDSCteLoteItemCons.RecordCount = 0 then
    Exit;

  //========================================== NF-e ================================================//
  //GERAÇÃO DE XML
  if Acoes.Contains(alGeraXMLCTe) then
  begin
    QCteLote.Close;
    QCteLote.SetVariable('PK', CDSCteLoteItemConsID_LOTE.Value);
    QCteLote.Open;
    QCteLoteItem.Close;
    QCteLoteItem.ClearVariables;
    QCteLoteItem.SetVariable('ID_LOTE', CDSCteLoteItemConsID_LOTE.Value);
    QCteLoteItem.Open;
    while not QCteLoteItem.Eof do
    begin
      QCteLoteItem.Edit;
      QCteLoteItemDESC_XML_CTE.Value := TCteUtils.GeraXMLCTe(QCteLoteItemCOD_CONHECIMENTO.Value);
      QCteLoteItem.Post;

      QCteLoteItem.Next;
    end;
    DMOracle.DBCemapa.Commit;
  end;

  ExecList := TList.Create;

  //ENVIO DE LOTE / CONSULTA DE LOTE
  if Acoes.Contains(alEnvioCTe) then
    ExecList.Add(TExecucaoEnviaLoteCTe.Create(QCteLoteConsDESC_REPOSITORIO_NFE.Value,
        QCteLoteConsID_LOTE.AsInteger, QCteLoteConsCOD_UF_IBGE.Value,
        Acoes.Contains(alConsultaCTe)))
  else if Acoes.Contains(alConsultaCTe) then
    ExecList.Add(TExecucaoConsultaLoteCTe.Create(QCteLoteConsDESC_REPOSITORIO_NFE.Value,
        QCteLoteConsID_LOTE.AsInteger, QCteLoteConsCOD_UF_IBGE.Value));

  //CONSULTA DE PROTOCOLO
  if Acoes.Contains(alConsultaProtocoloCTe) then
  begin
    CDSCteLoteItemCons.First;
    while not CDSCteLoteItemCons.Eof do
    begin
      if CDSCteLoteItemConsIND_SELECIONADO.Value = 'S' then
        ExecList.Add(TExecucaoConsultaProtocoloCTe.Create(
            QCteLoteConsDESC_REPOSITORIO_NFE.Value,
            QCteLoteConsCOD_FILIAL.Value,
            QCteLoteConsCOD_UF_IBGE.Value,
            CDSCteLoteItemConsIND_AMBIENTE_CTE.Value,
            CDSCteLoteItemConsNUM_CONHECIMENTO.Value,
            CDSCteLoteItemConsDESC_CHAVE_ACESSO.Value));
      CDSCteLoteItemCons.Next;
    end;
  end;

  if (Acoes.Contains(alDacte)) or (Acoes.Contains(alEmailAvulsoCTe)) or (Acoes.Contains(alEmailCTe)) or (Acoes.Contains(alSalvaDactePdf)) then
  begin
    CDSCteLoteItemCons.First;
    while not CDSCteLoteItemCons.Eof do
    begin
      if CDSCteLoteItemConsIND_SELECIONADO.Value = 'S' then
      begin
        //SALVA DACTE EM PDF
        if Acoes.Contains(alSalvaDactePdf) then
          ExecList.Add(TExecucaoSalvaDactePdf.Create(
              QCteLoteConsDESC_REPOSITORIO_NFE.Value,
              CDSCteLoteItemConsDESC_CHAVE_ACESSO.Value,
              CDSCteLoteItemConsDESC_IMPRESSORA_DACTE.Value,
              CDSCteLoteItemConsNUM_CONHECIMENTO.Value));
        //EMISSÃO DE DACTE
        if Acoes.Contains(alDacte) then
          ExecList.Add(TExecucaoImprimeDacte.Create(
              QCteLoteConsDESC_REPOSITORIO_NFE.Value,
              CDSCteLoteItemConsDESC_CHAVE_ACESSO.Value,
              CDSCteLoteItemConsDESC_IMPRESSORA_DACTE.Value,
              CDSCteLoteItemConsNUM_VIAS_DACTE.Value,
              CDSCteLoteItemConsNUM_CONHECIMENTO.Value));

        //EMISSÃO DE E-MAIL
        if Acoes.Contains(alEmailCTe) then
        begin
          DescEmail := '';
          if CDSCteLoteItemConsIND_CTE_EMAIL_DEST.Value = 1 then
          begin
            EmailAgente := CDSCteLoteItemConsEMAIL_DEST.Value;
            if (EmailAgente <> '') or (InputQuery('E-mail não cadastrado',
              'Informe o e-mail para ' + CDSCteLoteItemConsDESTINATARIO.Value +
              ' ou cancele para não enviar para este destinatário:',
              EmailAgente)) then
              DescEmail := DescEmail + EmailAgente + '; ';
          end;

          if CDSCteLoteItemConsIND_CTE_EMAIL_REM.Value = 1 then
          begin
            EmailAgente := CDSCteLoteItemConsEMAIL_REM.Value;
            if (EmailAgente <> '') or (InputQuery('E-mail não cadastrado',
              'Informe o e-mail para ' + CDSCteLoteItemConsREMETENTE.Value +
              ' ou cancele para não enviar para este remetente:',
              EmailAgente)) then
              DescEmail := DescEmail + EmailAgente + '; ';
          end;

          if CDSCteLoteItemConsIND_CTE_EMAIL_EXP.Value = 1 then
          begin
            EmailAgente := CDSCteLoteItemConsEMAIL_EXP.Value;
            if (EmailAgente <> '') or (InputQuery('E-mail não cadastrado',
              'Informe o e-mail para ' + CDSCteLoteItemConsEXPEDIDOR.Value +
              ' ou cancele para não enviar para este expedidor:',
              EmailAgente)) then
              DescEmail := DescEmail + EmailAgente + '; ';
          end;

          if CDSCteLoteItemConsIND_CTE_EMAIL_REC.Value = 1 then
          begin
            EmailAgente := CDSCteLoteItemConsEMAIL_REC.Value;
            if (EmailAgente <> '') or (InputQuery('E-mail não cadastrado',
              'Informe o e-mail para ' + CDSCteLoteItemConsRECEBEDOR.Value +
              ' ou cancele para não enviar para este recebedor:',
              EmailAgente)) then
              DescEmail := DescEmail + EmailAgente + '; ';
          end;
          if (PosEx(UpperCase(Trim(CDSCteLoteItemConsEMAIL_TOM.Value)),UpperCase(DescEmail)) = 0) then
            DescEmail := DescEmail + CDSCteLoteItemConsEMAIL_TOM.Value + '; ';
          if (CDSCteLoteItemConsIND_CTE_EMAIL_FILIAL.Value = 1) and
             (PosEx(UpperCase(Trim(CDSCteLoteItemConsEMAIL_FILIAL.Value)),UpperCase(DescEmail)) = 0) then
            DescEmail := DescEmail + CDSCteLoteItemConsEMAIL_FILIAL.Value + '; ';

          ExecList.Add(TExecucaoEnviaEmailCTe.Create(QCteLoteConsDESC_REPOSITORIO_NFE.Value,
            CDSCteLoteItemConsDESC_CHAVE_ACESSO.Value, DescEmail,
            CDSCteLoteItemConsdesc_assunto_email.Value,
            CDSCteLoteItemConsdesc_corpo_email.Value,
            CDSCteLoteItemConsEMAIL_XML.Value = 'S',
            CDSCteLoteItemConsEMAIL_PDF.Value = 'S',
            CDSCteLoteItemConsNUM_CONHECIMENTO.Value));
        end;
        if Acoes.Contains(alEmailAvulsoCTe) then
        begin
          DescEmail := CDSCteLoteItemConsDESC_EMAIL.Value;
          if (DescEmail <> '') or (InputQuery('E-mail em branco',
            'Informe o e-mail.',
            DescEmail)) then
            ExecList.Add(TExecucaoEnviaEmailCTe.Create(QCteLoteConsDESC_REPOSITORIO_NFE.Value,
            CDSCteLoteItemConsDESC_CHAVE_ACESSO.Value, DescEmail,
            CDSCteLoteItemConsdesc_assunto_email.Value,
            CDSCteLoteItemConsdesc_corpo_email.Value,
            CDSCteLoteItemConsEMAIL_XML.Value = 'S',
            CDSCteLoteItemConsEMAIL_PDF.Value = 'S',
            CDSCteLoteItemConsNUM_CONHECIMENTO.Value));
        end;
      end;
      CDSCteLoteItemCons.Next;
    end;
  end;
  Result := DMNfe.ExecutaAcoes(ExecList, MostraResultado);
end;

{ TAcoesLote }

function TAcoesLoteCTe.Add(Acao: TAcaoLoteCTe): TAcoesLoteCTe;
var
  i: Integer;
begin
  i := Length(FAcoes);
  SetLength(FAcoes, i + 1);
  FAcoes[i] := Acao;
  Result := Self;
end;

function TAcoesLoteCTe.Contains(Acao: TAcaoLoteCTe): Boolean;
var
  i: Integer;
begin
  Result := True;
  for i := 0 to Length(FAcoes) - 1 do
    if FAcoes[i] = Acao then
      Exit;
  Result := False;
end;

procedure TDMCteLote.CarregaLoteCons(IdLote: Longint;
  ForceRefresh: Boolean);
begin
  if (QCteLoteConsID_LOTE.Value <> IdLote) or (ForceRefresh) then
  begin
    QCteLoteCons.Close;
    QCteLoteCons.ClearVariables;
    QCteLoteCons.SetVariable('ID_LOTE', IdLote);
    QCteLoteCons.Open;
  end;
end;

procedure TDMCteLote.CDSCteLoteItemConsAfterInsert(
  DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMCteLote.InverteSelecaoItem;
begin
  if CDSCteLoteItemConsIND_SELECIONADO.Value = 'S' then
    SetSelecaoItem('N')
  else
    SetSelecaoItem('S');
end;

procedure TDMCteLote.SetSelecaoItem(Sel: String);
begin
  try
    if (CDSCteLoteItemConsIND_SELECIONADO.Value <> Sel) then
    begin
      if not (CDSCteLoteItemCons.State in [DsEdit, DsInsert]) then
        CDSCteLoteItemCons.Edit;
      CDSCteLoteItemConsIND_SELECIONADO.Value := Sel;
      if CDSCteLoteItemCons.State in [DsEdit, DsInsert] then
        CDSCteLoteItemCons.Post;
    end;
  except
    Raise;
  end;
end;

procedure TDMCteLote.QCteLoteConsBeforeOpen(DataSet: TDataSet);
begin
  QCteLoteCons.SetVariable('USUARIO', DMUsuario.CodUsuarioCorrente);
end;

procedure TDMCteLote.QCteLoteConsAfterOpen(DataSet: TDataSet);
begin
  CDSCteLoteItemCons.Open;
end;

procedure TDMCteLote.QCteLoteConsBeforeClose(DataSet: TDataSet);
begin
  CDSCteLoteItemCons.Close;
end;

procedure TDMCteLote.CarregaConhecimentoCons(CT: Integer);
begin
  QCteLoteCons.Close;
  QCteLoteCons.ClearVariables;
  QCteLoteCons.SetVariable('COD_CONHECIMENTO', CT);
  QCteLoteCons.Open;

  while (CDSCteLoteItemConsCOD_CONHECIMENTO.Value <> CT) and
      (not CDSCteLoteItemCons.Eof) do
    CDSCteLoteItemCons.Next;
end;

procedure TDMCteLote.QCteLoteItemConsBeforeOpen(
  DataSet: TDataSet);
begin
  QCteLoteItemCons.DeclareVariable('COD_USUARIO', otInteger);
  QCteLoteItemCons.SetVariable('COD_USUARIO', DMUsuario.CodUsuarioCorrente);
end;

end.
