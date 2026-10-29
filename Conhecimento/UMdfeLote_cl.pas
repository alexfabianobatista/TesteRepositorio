unit UMdfeLote_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, Provider, DBClient, UNfe_cl, Oracle;

type
  TAcaoLoteMDFe = (alEnvioMDFe, alGeraXMLMDFe, alDamdfe, alEmailMDFe, alEmailAvulsoMDFe,
  alConsultaMDFe, alConsultaProtocoloMDFe, alEventoMDFe, alStatusServicoMDFe, alSalvaDamdfePdf);

  TAcoesLoteMDFe = class
  protected
    FAcoes: Array of TAcaoLoteMDFe;
  public
    function Add(Acao: TAcaoLoteMDFe): TAcoesLoteMDFe;
    function Contains(Acao: TAcaoLoteMDFe): Boolean;
  end;

  TDMMdfeLote = class(TDataModule)
    QMdfeLote: TOracleDataSet1;
    QMdfeLoteID_LOTE: TFloatField;
    QMdfeLoteIND_SITUACAO: TIntegerField;
    QMdfeLoteDT_CRIACAO: TDateTimeField;
    QMdfeLoteDT_ENVIO: TDateTimeField;
    QMdfeLoteCOD_FILIAL: TIntegerField;
    QMdfeLoteNUM_RECIBO: TFloatField;
    QMdfeLoteCons: TOracleDataSet1;
    QMdfeLoteConsdesc_situacao: TStringField;
    QMdfeLoteConscod_uf_ibge_envio: TIntegerField;
    QMdfeLoteConsID_LOTE: TFloatField;
    QMdfeLoteConsIND_SITUACAO: TIntegerField;
    QMdfeLoteConsDT_CRIACAO: TDateTimeField;
    QMdfeLoteConsDT_ENVIO: TDateTimeField;
    QMdfeLoteConsCOD_FILIAL: TIntegerField;
    QMdfeLoteConsDESC_REPOSITORIO_NFE: TStringField;
    QMdfeLoteConsDESC_FILIAL: TStringField;
    QMdfeLoteConsCGC_FILIAL: TStringField;
    QMdfeLoteConsCOD_UF_IBGE: TIntegerField;
    QMdfeLoteConsCONT_SELECIONADO: TFloatField;
    QMdfeLoteConsCOD_USUARIO: TIntegerField;
    QMdfeLoteConsDESC_IMPRESSORA_DACTE: TStringField;
    QMdfeLoteItemCons: TOracleDataSet1;
    QMdfeLoteItemConsID_LOTE: TFloatField;
    QMdfeLoteItemConsDESC_CHAVE_ACESSO: TStringField;
    QMdfeLoteItemConsDESC_MSG_CANCELAMENTO: TStringField;
    QMdfeLoteItemConsDESC_MSG_VALIDACAO: TMemoField;
    QMdfeLoteItemConsDESC_MSG_VALIDACAO_LOTE: TMemoField;
    QMdfeLoteItemConsDESC_PROT_AUTORIZACAO: TStringField;
    QMdfeLoteItemConsDESC_PROT_CANCELAMENTO: TStringField;
    QMdfeLoteItemConsDESC_RETORNO_CANCELAMENTO: TStringField;
    QMdfeLoteItemConsDESC_RETORNO_PROCESSAMENTO: TStringField;
    QMdfeLoteItemConsDESC_XML_RETORNO: TMemoField;
    QMdfeLoteItemConsSTATUS: TStringField;
    QMdfeLoteItemConsDT_EMISSAO: TDateTimeField;
    QMdfeLoteItemConsCOD_SERIE: TStringField;
    QMdfeLoteItemConsEMAIL_XML: TStringField;
    QMdfeLoteItemConsEMAIL_PDF: TStringField;
    QMdfeLoteItemConsIND_SELECIONADO: TStringField;
    QMdfeLoteItemConsDESC_IMPRESSORA_DACTE: TStringField;
    QMdfeLoteItem: TOracleDataSet1;
    QMdfeLoteItemID_LOTE: TFloatField;
    QMdfeLoteItemDESC_CHAVE_ACESSO: TStringField;
    QMdfeLoteItemCOD_FILIAL: TIntegerField;
    QMdfeLoteItemDESC_SERIE: TStringField;
    CDSMdfeLoteItemCons: TClientDataSet;
    CDSMdfeLoteItemConsdesc_tipo_nota: TStringField;
    CDSMdfeLoteItemConsretorno_sefaz: TStringField;
    CDSMdfeLoteItemConsdesc_assunto_email: TStringField;
    CDSMdfeLoteItemConsdesc_corpo_email: TStringField;
    CDSMdfeLoteItemConsdesc_anexo_email: TStringField;
    CDSMdfeLoteItemConsind_autorizado: TBooleanField;
    CDSMdfeLoteItemConsind_cancelado: TBooleanField;
    CDSMdfeLoteItemConsind_denegado: TBooleanField;
    CDSMdfeLoteItemConsind_pendente: TBooleanField;
    DSPMdfeLoteItemCons: TDataSetProvider;
    DSMdfeLoteCons: TDataSource;
    QMdfeLoteItemNUM_MDFE: TIntegerField;
    QMdfeLoteItemDESC_XML_MDFE: TMemoField;
    QMdfeLoteItemIND_AMBIENTE_MDFE: TIntegerField;
    QMdfeLoteItemCOD_MANIFESTO: TIntegerField;
    QMdfeLoteItemConsDESC_XML_MDFE: TMemoField;
    QMdfeLoteItemConsCOD_MANIFESTO: TIntegerField;
    QMdfeLoteItemConsNUM_MANIFESTO: TIntegerField;
    QMdfeLoteItemConsIND_AMBIENTE_MDFE: TIntegerField;
    QMdfeLoteItemConsNUM_VIAS_DAMDFE: TIntegerField;
    CDSMdfeLoteItemConsID_LOTE: TFloatField;
    CDSMdfeLoteItemConsDESC_CHAVE_ACESSO: TStringField;
    CDSMdfeLoteItemConsDESC_MSG_CANCELAMENTO: TStringField;
    CDSMdfeLoteItemConsDESC_MSG_VALIDACAO: TMemoField;
    CDSMdfeLoteItemConsDESC_MSG_VALIDACAO_LOTE: TMemoField;
    CDSMdfeLoteItemConsDESC_PROT_AUTORIZACAO: TStringField;
    CDSMdfeLoteItemConsDESC_PROT_CANCELAMENTO: TStringField;
    CDSMdfeLoteItemConsDESC_RETORNO_CANCELAMENTO: TStringField;
    CDSMdfeLoteItemConsDESC_RETORNO_PROCESSAMENTO: TStringField;
    CDSMdfeLoteItemConsDESC_XML_RETORNO: TMemoField;
    CDSMdfeLoteItemConsSTATUS: TStringField;
    CDSMdfeLoteItemConsDT_EMISSAO: TDateTimeField;
    CDSMdfeLoteItemConsCOD_SERIE: TStringField;
    CDSMdfeLoteItemConsEMAIL_XML: TStringField;
    CDSMdfeLoteItemConsEMAIL_PDF: TStringField;
    CDSMdfeLoteItemConsIND_SELECIONADO: TStringField;
    CDSMdfeLoteItemConsDESC_IMPRESSORA_DACTE: TStringField;
    CDSMdfeLoteItemConsDESC_XML_MDFE: TMemoField;
    CDSMdfeLoteItemConsCOD_MANIFESTO: TIntegerField;
    CDSMdfeLoteItemConsNUM_MANIFESTO: TIntegerField;
    CDSMdfeLoteItemConsIND_AMBIENTE_MDFE: TIntegerField;
    CDSMdfeLoteItemConsNUM_VIAS_DAMDFE: TIntegerField;
    QMdfeLoteItemConsDESC_EMAIL: TStringField;
    CDSMdfeLoteItemConsDESC_EMAIL: TStringField;
    CDSMdfeLoteItemConsind_encerrado: TBooleanField;
    QMdfeLoteItemConsDESC_RETORNO_ENCERRAMENTO: TStringField;
    QMdfeLoteItemConsXML_RETORNO_ENCERRAMENTO: TMemoField;
    QMdfeLoteItemConsXML_EVENTO_ENCERRAMENTO: TMemoField;
    CDSMdfeLoteItemConsDESC_RETORNO_ENCERRAMENTO: TStringField;
    CDSMdfeLoteItemConsXML_RETORNO_ENCERRAMENTO: TMemoField;
    CDSMdfeLoteItemConsXML_EVENTO_ENCERRAMENTO: TMemoField;
    procedure QMdfeLoteAfterInsert(DataSet: TDataSet);
    procedure QMdfeLoteConsCalcFields(DataSet: TDataSet);
    procedure CDSMdfeLoteItemConsCalcFields(DataSet: TDataSet);
    procedure CDSMdfeLoteItemConsAfterOpen(DataSet: TDataSet);
    procedure CDSMdfeLoteItemConsAfterInsert(DataSet: TDataSet);
    procedure QMdfeLoteConsBeforeOpen(DataSet: TDataSet);
    procedure QMdfeLoteConsAfterOpen(DataSet: TDataSet);
    procedure QMdfeLoteConsBeforeClose(DataSet: TDataSet);
    procedure QMdfeLoteItemConsBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function AcaoEmLote(Acoes: TAcoesLoteMDFe; MostraResultado: Boolean = True): Integer;
    procedure CarregaLoteCons(IdLote: Longint; ForceRefresh: Boolean = True);
    procedure CarregaManifestoCons(MT: Integer);
    procedure ConfirmaEnvioLoteMdfe(IdLote: Double);
    procedure SetRegistro(Id: Double; ForceRefresh: Boolean = True);
    procedure SetSelecaoItem(Sel: String = 'S');
    procedure InverteSelecaoItem;
    procedure AdicionaMDFeEmLote(Chave :String; Filial :Integer; CodManifesto: Integer);
  end;

var
  DMMdfeLote: TDMMdfeLote;

const
  SIT_MDFE_LOTE_CRIADO: Integer = 1;
  SIT_MDFE_LOTE_ENVIADO: Integer = 2;
  
implementation

uses UOracle_cl, Dialogs, UParamSistema_cl, UBiblioteca, Forms,
  UUsuario_cl, UAguardoNfe, UNFeRetorno, UAguardoBloqueado, 
  MdfeConsts, UConhecimento_cl, StrUtils;

{$R *.dfm}

procedure TDMMdfeLote.ConfirmaEnvioLoteMdfe(IdLote: Double);
begin
  if IdLote < 1 then
    Exit;
  SetRegistro(IdLote);

  QMdfeLote.Edit;
  QMdfeLoteIND_SITUACAO.Value := SIT_MDFE_LOTE_ENVIADO;
  QMdfeLoteDT_ENVIO.Value := DMOracle.DataHoraServ;
  QMdfeLote.Post;
end;

procedure TDMMdfeLote.AdicionaMDFeEmLote(Chave: String; Filial :Integer; CodManifesto: Integer);
var
  Buscador :TBuscador;
  IdLote :String;
  aux: String;
begin
  Buscador := TBuscador.Create;
  IdLote := '';
  if Filial = 0 then
  begin
    MessageDlg('Por favor selecione um Manifesto para adicionar ao lote', mtError, [mbOk],0);
    Abort;
  end;
  if Chave = '' then
  begin
    MessageDlg('Manifesto não possui chave de acesso', mtError, [mbOk],0);
    Abort;
  end;

  aux := QuotedStr(Bib.LimpaNumero(Chave));
  Buscador.Limpa;
  Buscador.Adiciona('SELECT ID_LOTE FROM TB_MDFE WHERE DESC_CHAVE_ACESSO = ' +
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
      QExecSQL.SQL.Add('UPDATE TB_MDFE SET COD_MANIFESTO = ');
      QExecSQL.SQL.Add(IntToStr(CodManifesto));
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
    QMdfeLote.Open;
    QMdfeLote.Insert;
    QMdfeLoteDT_CRIACAO.Value := DMOracle.DataHoraServ;
    QMdfeLoteCOD_FILIAL.Value := Filial;
    QMdfeLote.Post;

    with DMOracle do
    begin
      DMOracle.DBCemapa.StartTransaction;
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add('UPDATE TB_MDFE SET ID_LOTE = ');
      QExecSQL.SQL.Add(QMdfeLoteID_LOTE.Text);
      QExecSQL.SQL.Add(', COD_MANIFESTO = ');
      QExecSQL.SQL.Add(IntToStr(CodManifesto));
      QExecSQL.SQL.Add(' WHERE DESC_CHAVE_ACESSO = ');
      QExecSQL.SQL.Add(QuotedStr(Bib.LimpaNumero(Chave)));
      QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
    end;
    MessageDlg('Manifesto inserido ao lote ' + IdLote, mtInformation, [mbOk], 0);
  Except
    DMOracle.DBCemapa.Rollback;
  end;
end;

procedure TDMMdfeLote.QMdfeLoteAfterInsert(DataSet: TDataSet);
begin
  QMdfeLoteIND_SITUACAO.Value := SIT_MDFE_LOTE_CRIADO;
  QMdfeLoteDT_CRIACAO.Value := DMOracle.DataHoraServ;
end;

procedure TDMMdfeLote.SetRegistro(Id: Double; ForceRefresh: Boolean = True);
begin
  if (QMdfeLoteID_LOTE.Value <> Id) or (ForceRefresh) then
  begin
    QMdfeLote.Close;
    QMdfeLote.SetVariable('PK', Id);
    QMdfeLote.Open;
  end;
end;

procedure TDMMdfeLote.QMdfeLoteConsCalcFields(DataSet: TDataSet);
begin
  QMdfeLoteConsdesc_situacao.Value := '';
  if QMdfeLoteConsIND_SITUACAO.Value = SIT_MDFE_LOTE_CRIADO then
    QMdfeLoteConsdesc_situacao.Value := 'PENDENTE'
  else if QMdfeLoteConsIND_SITUACAO.Value = SIT_MDFE_LOTE_ENVIADO then
    QMdfeLoteConsdesc_situacao.Value := 'ENVIADO';

  QMdfeLoteConscod_uf_ibge_envio.Value := QMdfeLoteConsCOD_UF_IBGE.Value;
//  if QMdfeLoteConsIND_CONTINGENCIA.Value = TP_EMIS_CONTINGENCIA_SCAN then
//    QMdfeLoteConscod_uf_ibge_envio.Value := 0;
end;

procedure TDMMdfeLote.CDSMdfeLoteItemConsCalcFields(
  DataSet: TDataSet);
var
  Assunto, Corpo: String;
  SitEnvio, SitCanc, SitEnc: Integer;
begin
  CDSMdfeLoteItemConsdesc_tipo_nota.Value := '';
  CDSMdfeLoteItemConsdesc_assunto_email.Value := '';
  CDSMdfeLoteItemConsdesc_corpo_email.Value := '';

  CDSMdfeLoteItemConsretorno_sefaz.Value := '';

  SitEnvio := StrToInt('0' + CDSMdfeLoteItemConsDESC_RETORNO_PROCESSAMENTO.Value);
  SitCanc := StrToInt('0' + CDSMdfeLoteItemConsDESC_RETORNO_CANCELAMENTO.Value);
  SitEnc := StrToInt('0' + CDSMdfeLoteItemConsDESC_RETORNO_ENCERRAMENTO.Value);
  CDSMdfeLoteItemConsind_autorizado.Value := SitEnvio in SIT_MDFE_ACEITO;
  CDSMdfeLoteItemConsind_cancelado.Value := SitCanc in SIT_MDFE_CANCELADO;
  CDSMdfeLoteItemConsind_encerrado.Value := SitEnc in SIT_MDFE_ENCERRADO;
  CDSMdfeLoteItemConsind_denegado.Value := (SitEnvio - 100 in [10, 105, 201, 202]); //status 110, 205, 301 ou 302
  CDSMdfeLoteItemConsind_pendente.Value := (SitEnvio > 999) and (SitEnvio < 1005);

  if not CDSMdfeLoteItemConsSTATUS.IsNull then
  begin
    try
      if CDSMdfeLoteItemConsind_cancelado.Value then
        CDSMdfeLoteItemConsretorno_sefaz.Value := CDSMdfeLoteItemConsDESC_RETORNO_CANCELAMENTO.Value +
            ' - ' + CDSMdfeLoteItemConsDESC_MSG_CANCELAMENTO.Value
      else
        CDSMdfeLoteItemConsretorno_sefaz.Value := CDSMdfeLoteItemConsDESC_RETORNO_PROCESSAMENTO.Value + ' - ' +
            CDSMdfeLoteItemConsDESC_MSG_VALIDACAO_LOTE.Value;
    except
      MessageDlg('Erro ao carregar situação dos Manifestos.', mtWarning, [mbOK], 0);
    end;
  end;

    with DMParamSistema do
      if StrToInt('0' + CDSMdfeLoteItemConsSTATUS.Value) in SIT_MDFE_CANCELADO then
      begin
        Assunto := QParamSistemaDESC_ASSUNTO_EMAIL_CANC_MDFE.Value;
        Corpo := QParamSistemaDESC_CORPO_EMAIL_CANC_MDFE.Value;
      end
      else
      begin
        Assunto := QParamSistemaDESC_ASSUNTO_EMAIL_MDFE.Value;
        Corpo := QParamSistemaDESC_CORPO_EMAIL_MDFE.Value;
      end;

  CDSMdfeLoteItemConsdesc_anexo_email.Value := 'CT-e_' + CDSMdfeLoteItemConsNUM_MANIFESTO.Text;
  with Bib do
  begin
    Assunto := SubstituiStr(Assunto, MDFE_EMAIL_NUMERO, CDSMdfeLoteItemConsNUM_MANIFESTO.Text);
    Assunto := SubstituiStr(Assunto, MDFE_EMAIL_SERIE, CDSMdfeLoteItemConsCOD_SERIE.Value);
    Assunto := SubstituiStr(Assunto, DFE_EMAIL_FILIAL, QMdfeLoteConsDESC_FILIAL.Value);
    Assunto := SubstituiStr(Assunto, DFE_EMAIL_ARQUIVO, CDSMdfeLoteItemConsdesc_anexo_email.Value);
    Assunto := SubstituiStr(Assunto, DFE_EMAIL_CNPJ, QMdfeLoteConsCGC_FILIAL.Value);
    Assunto := SubstituiStr(Assunto, #$D + #$A, '<p>');
    Assunto := SubstituiStr(Assunto, #$A, '<p>');

    Corpo := SubstituiStr(Corpo, MDFE_EMAIL_NUMERO, CDSMdfeLoteItemConsNUM_MANIFESTO.Text);
    Corpo := SubstituiStr(Corpo, MDFE_EMAIL_SERIE, CDSMdfeLoteItemConsCOD_SERIE.Value);
    Corpo := SubstituiStr(Corpo, DFE_EMAIL_FILIAL, QMdfeLoteConsDESC_FILIAL.Value);
    Corpo := SubstituiStr(Corpo, DFE_EMAIL_ARQUIVO, CDSMdfeLoteItemConsdesc_anexo_email.Value);
    Corpo := SubstituiStr(Corpo, DFE_EMAIL_CNPJ, QMdfeLoteConsCGC_FILIAL.Value);
    //Corpo := Corpo + '<p>' + CDSMdfeLoteItemConsNOME_DEST.Value;
    Corpo := SubstituiStr(Corpo, #$D + #$A, '<p>');
    Corpo := SubstituiStr(Corpo, #$A, '<p>');
  end;
  CDSMdfeLoteItemConsdesc_assunto_email.Value := Assunto;
  CDSMdfeLoteItemConsdesc_corpo_email.Value := Corpo;
end;

procedure TDMMdfeLote.CDSMdfeLoteItemConsAfterOpen(
  DataSet: TDataSet);
begin
  DMParamSistema.QParamSistema.RefreshRecord;
end;

function TDMMdfeLote.AcaoEmLote(Acoes: TAcoesLoteMDFe; MostraResultado: Boolean = True): Integer;
(*
 * Funcao para acao sobre o lote presente em QMdfeLoteCons.
 * Cuidado: No caso de solicitação de gerar xml (alGeraXML) a função irá efetuar
 * um commit.
 *)
var
  ExecList: TList;
  DescEmail: String;
begin
  Result := 0;
  if CDSMdfeLoteItemCons.RecordCount = 0 then
    Exit;

  //========================================== MDF-e ================================================//
  //GERAÇÃO DE XML
  if Acoes.Contains(alGeraXMLMDFe) then
  begin
    QMdfeLote.Close;
    QMdfeLote.SetVariable('PK', CDSMdfeLoteItemConsID_LOTE.Value);
    QMdfeLote.Open;
    QMdfeLoteItem.Close;
    QMdfeLoteItem.ClearVariables;
    QMdfeLoteItem.SetVariable('ID_LOTE', CDSMdfeLoteItemConsID_LOTE.Value);
    QMdfeLoteItem.Open;
    while not QMdfeLoteItem.Eof do
    begin
      QMdfeLoteItem.Edit;
      //QMdfeLoteItemDESC_XML_MDFE.Value := TMdfeUtils.GeraXMLMDFe(QMdfeLoteItemCOD_MANIFESTO.Value);
      QMdfeLoteItem.Post;

      QMdfeLoteItem.Next;
    end;
    DMOracle.DBCemapa.Commit;
  end;

  ExecList := TList.Create;

  //ENVIO DE LOTE / CONSULTA DE LOTE
  if Acoes.Contains(alEnvioMDFe) then
    ExecList.Add(TExecucaoEnviaLoteMDFe.Create(QMdfeLoteConsDESC_REPOSITORIO_NFE.Value,
        QMdfeLoteConsID_LOTE.AsInteger, QMdfeLoteConscod_uf_ibge_envio.Value,
        Acoes.Contains(alConsultaMDFe)))
  else if Acoes.Contains(alConsultaMDFe) then
    ExecList.Add(TExecucaoConsultaLoteMDFe.Create(QMdfeLoteConsDESC_REPOSITORIO_NFE.Value,
        QMdfeLoteConsID_LOTE.AsInteger, QMdfeLoteConscod_uf_ibge_envio.Value));

  //CONSULTA DE PROTOCOLO
  if Acoes.Contains(alConsultaProtocoloMDFe) then
  begin
    CDSMdfeLoteItemCons.First;
    while not CDSMdfeLoteItemCons.Eof do
    begin
      if CDSMdfeLoteItemConsIND_SELECIONADO.Value = 'S' then
        ExecList.Add(TExecucaoConsultaProtocoloMDFe.Create(
            QMdfeLoteConsDESC_REPOSITORIO_NFE.Value,
            QMdfeLoteConsCOD_FILIAL.Value,
            QMdfeLoteConscod_uf_ibge_envio.Value,
            CDSMdfeLoteItemConsIND_AMBIENTE_MDFE.Value,
            CDSMdfeLoteItemConsNUM_MANIFESTO.Value,
            CDSMdfeLoteItemConsDESC_CHAVE_ACESSO.Value));
      CDSMdfeLoteItemCons.Next;
    end;
  end;

  if (Acoes.Contains(alDamdfe)) or (Acoes.Contains(alEmailMDFe)) or (Acoes.Contains(alSalvaDamdfePdf)) then
  begin
    CDSMdfeLoteItemCons.First;
    while not CDSMdfeLoteItemCons.Eof do
    begin
      if CDSMdfeLoteItemConsIND_SELECIONADO.Value = 'S' then
      begin
        if Acoes.Contains(alEmailMDFe) then
        begin
          DescEmail := CDSMdfeLoteItemConsDESC_EMAIL.Value;
          if (DescEmail <> '') or (InputQuery('E-mail para Envio',
            'Informe o e-mail.',
            DescEmail)) then
            ExecList.Add(TExecucaoEnviaEmailMDFe.Create(
            QMdfeLoteConsDESC_REPOSITORIO_NFE.Value,
            CDSMdfeLoteItemConsDESC_CHAVE_ACESSO.Value, DescEmail,
            CDSMdfeLoteItemConsdesc_assunto_email.Value,
            CDSMdfeLoteItemConsdesc_corpo_email.Value,
            CDSMdfeLoteItemConsEMAIL_XML.Value = 'S',
            CDSMdfeLoteItemConsEMAIL_PDF.Value = 'S',
            CDSMdfeLoteItemConsNUM_MANIFESTO.Value));
        end;
        //SALVA DAMDFE EM PDF
        if Acoes.Contains(alSalvaDamdfePdf) then
          ExecList.Add(TExecucaoSalvaDamdfePdf.Create(
              QMdfeLoteConsDESC_REPOSITORIO_NFE.Value,
              CDSMdfeLoteItemConsDESC_CHAVE_ACESSO.Value,
              CDSMdfeLoteItemConsDESC_IMPRESSORA_DACTE.Value,
              CDSMdfeLoteItemConsNUM_MANIFESTO.Value));
        //EMISSÃO DE DAMDFE
        if Acoes.Contains(alDamdfe) then
          ExecList.Add(TExecucaoImprimeDamdfe.Create(
              QMdfeLoteConsDESC_REPOSITORIO_NFE.Value,
              CDSMdfeLoteItemConsDESC_CHAVE_ACESSO.Value,
              CDSMdfeLoteItemConsDESC_IMPRESSORA_DACTE.Value,
              CDSMdfeLoteItemConsNUM_VIAS_DAMDFE.Value,
              CDSMdfeLoteItemConsNUM_MANIFESTO.Value));
      end;
      CDSMdfeLoteItemCons.Next;
    end;
  end;
  Result := DMNfe.ExecutaAcoes(ExecList, MostraResultado);
end;

{ TAcoesLote }

function TAcoesLoteMDFe.Add(Acao: TAcaoLoteMDFe): TAcoesLoteMDFe;
var
  i: Integer;
begin
  i := Length(FAcoes);
  SetLength(FAcoes, i + 1);
  FAcoes[i] := Acao;
  Result := Self;
end;

function TAcoesLoteMDFe.Contains(Acao: TAcaoLoteMDFe): Boolean;
var
  i: Integer;
begin
  Result := True;
  for i := 0 to Length(FAcoes) - 1 do
    if FAcoes[i] = Acao then
      Exit;
  Result := False;
end;

procedure TDMMdfeLote.CarregaLoteCons(IdLote: Longint;
  ForceRefresh: Boolean);
begin
  if (QMdfeLoteConsID_LOTE.Value <> IdLote) or (ForceRefresh) then
  begin
    QMdfeLoteCons.Close;
    QMdfeLoteCons.ClearVariables;
    QMdfeLoteCons.SetVariable('ID_LOTE', IdLote);
    QMdfeLoteCons.Open;
  end;
end;

procedure TDMMdfeLote.CDSMdfeLoteItemConsAfterInsert(
  DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMMdfeLote.InverteSelecaoItem;
begin
  if CDSMdfeLoteItemConsIND_SELECIONADO.Value = 'S' then
    SetSelecaoItem('N')
  else
    SetSelecaoItem('S');
end;

procedure TDMMdfeLote.SetSelecaoItem(Sel: String);
begin
  try
    if (CDSMdfeLoteItemConsIND_SELECIONADO.Value <> Sel) then
    begin
      if not (CDSMdfeLoteItemCons.State in [DsEdit, DsInsert]) then
        CDSMdfeLoteItemCons.Edit;
      CDSMdfeLoteItemConsIND_SELECIONADO.Value := Sel;
      if CDSMdfeLoteItemCons.State in [DsEdit, DsInsert] then
        CDSMdfeLoteItemCons.Post;
    end;
  except
    Raise;
  end;
end;

procedure TDMMdfeLote.QMdfeLoteConsBeforeOpen(DataSet: TDataSet);
begin
  QMdfeLoteCons.SetVariable('USUARIO', DMUsuario.CodUsuarioCorrente);
end;

procedure TDMMdfeLote.QMdfeLoteConsBeforeClose(DataSet: TDataSet);
begin
  CDSMdfeLoteItemCons.Close;
end;

procedure TDMMdfeLote.CarregaManifestoCons(MT: Integer);
begin
  QMdfeLoteCons.Close;
  QMdfeLoteCons.ClearVariables;
  QMdfeLoteCons.SetVariable('COD_MANIFESTO', MT);
  QMdfeLoteCons.Open;

  while (CDSMdfeLoteItemConsCOD_MANIFESTO.Value <> MT) and
      (not CDSMdfeLoteItemCons.Eof) do
    CDSMdfeLoteItemCons.Next;
end;

procedure TDMMdfeLote.QMdfeLoteItemConsBeforeOpen(
  DataSet: TDataSet);
begin
  QMdfeLoteItemCons.DeclareVariable('COD_USUARIO', otInteger);
  QMdfeLoteItemCons.SetVariable('COD_USUARIO', DMUsuario.CodUsuarioCorrente);
end;

procedure TDMMdfeLote.QMdfeLoteConsAfterOpen(DataSet: TDataSet);
begin
  CDSMdfeLoteItemCons.Open;
end;

end.
