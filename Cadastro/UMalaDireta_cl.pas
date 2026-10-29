unit UMalaDireta_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, DBClient, Dialogs;

type
  TDMMalaDireta = class(TDataModule)
    QMalaDireta: TOracleDataSet1;
    QMalaDiretaSMTP: TOracleDataSet1;
    QMensagemEletronica: TOracleDataSet1;
    QMalaDiretaSMTPCOD_MALA_DIRETA_SMTP: TIntegerField;
    QMalaDiretaSMTPCOD_MALA_DIRETA_CAB: TIntegerField;
    QMalaDiretaSMTPCOD_SMTP: TIntegerField;
    QMalaDiretaDestino: TOracleDataSet1;
    QMalaDiretaDestinoCOD_MALA_DIRETA_DESTINO: TIntegerField;
    QMalaDiretaDestinoCOD_MALA_DIRETA_CAB: TIntegerField;
    QMalaDiretaDestinoDESC_EMAIL_DESTINO: TStringField;
    QMalaDiretaDestinoDESC_NOME_DESTINO: TStringField;
    QMalaDiretaDestinoIND_ENVIO: TStringField;
    QSMTP: TOracleDataSet1;
    QSMTPCOD_SMTP: TIntegerField;
    QSMTPDESC_EMAIL: TStringField;
    QSMTPDESC_SMTP: TStringField;
    QSMTPDESC_PORT: TIntegerField;
    QSMTPDESC_SENHA: TStringField;
    QSMTPQT_EMAIL: TIntegerField;
    QSMTPQT_HORAS: TIntegerField;
    QSMTPDT_INICIO_ENVIO: TDateTimeField;
    QMensagemEletronicaCOD_MENSAGEM_ELETRONICA: TIntegerField;
    QMensagemEletronicaDESC_DESCRICAO: TStringField;
    QMensagemEletronicaDESC_TITULO: TStringField;
    QMensagemEletronicaDESC_CORPO: TMemoField;
    QMensagemEletronicaDESC_REMETENTE: TStringField;
    QMalaDiretaCOD_MALA_DIRETA_CAB: TIntegerField;
    QMalaDiretaCOD_MENSAGEM_ELETRONICA: TIntegerField;
    QMalaDiretaDESC_STATUS: TStringField;
    QMalaDiretaDT_CADASTRO: TDateTimeField;
    QMalaDiretaDESC_DESCRICAO: TStringField;
    QMalaDiretadesc_situacao: TStringField;
    QMalaDiretaSMTPdesc_email: TStringField;
    QMalaDiretaCons: TOracleDataSet1;
    QMensagemEletronicaCons: TOracleDataSet1;
    QSMTPCons: TOracleDataSet1;
    QMalaDiretaConsCOD_MALA_DIRETA_CAB: TIntegerField;
    QMalaDiretaConsCOD_MENSAGEM_ELETRONICA: TIntegerField;
    QMalaDiretaConsDESC_DESCRICAO: TStringField;
    QMalaDiretaConsDT_CADASTRO: TDateTimeField;
    QSMTPConsCOD_SMTP: TIntegerField;
    QSMTPConsDESC_SMTP: TStringField;
    QSMTPConsDESC_EMAIL: TStringField;
    QSMTPConsQT_EMAIL: TIntegerField;
    QSMTPConsQT_HORAS: TIntegerField;
    QMensagemEletronicaConsCOD_MENSAGEM_ELETRONICA: TIntegerField;
    QMensagemEletronicaConsDESC_DESCRICAO: TStringField;
    QMensagemEletronicaConsDESC_TITULO: TStringField;
    QMensagemEletronicaConsDESC_REMETENTE: TStringField;
    CDSDestinos: TClientDataSet;
    CDSDestinosEMAIL_DESTINO: TStringField;
    CDSDestinosNOME_DESTINO: TStringField;
    CDSSMTP: TClientDataSet;
    CDSSMTPEMAIL: TStringField;
    CDSSMTPSERVIDOR: TStringField;
    CDSSMTPINTERVALO: TStringField;
    CDSSMTPCODIGO: TIntegerField;
    QMalaDiretaSMTPdesc_intervalo: TStringField;
    QMalaDiretaDestinostatus_envio: TStringField;
    QSMTPIND_AUTENTICACAO: TStringField;
    QSMTPDESC_TIPO_CRIPTOGRAFIA: TStringField;
    CDSSMTPEMAILS_HORA: TIntegerField;
    QMalaDiretaConsDESC_STATUS: TStringField;
    QMalaDiretaConsdesc_situacao: TStringField;
    QSMTPQT_ENVIOS_ATUAL: TIntegerField;
    QSMTPQT_ENVIOS_VEZ: TIntegerField;
    QSMTPConsQT_ENVIOS_VEZ: TIntegerField;
    QMalaDiretaDestinoDESC_ERRO_ENVIO: TStringField;
    QMensagemEletronicaBACKUP_ALTERACAO: TMemoField;
    procedure QMalaDiretaAfterDelete(DataSet: TDataSet);
    procedure QMalaDiretaCalcFields(DataSet: TDataSet);
    procedure QMalaDiretaAfterCancel(DataSet: TDataSet);
    procedure QMalaDiretaSMTPCalcFields(DataSet: TDataSet);
    procedure QMensagemEletronicaAfterCancel(DataSet: TDataSet);
    procedure QMensagemEletronicaAfterDelete(DataSet: TDataSet);
    procedure QMensagemEletronicaAfterInsert(DataSet: TDataSet);
    procedure QSMTPAfterCancel(DataSet: TDataSet);
    procedure QSMTPAfterDelete(DataSet: TDataSet);
    procedure QSMTPAfterInsert(DataSet: TDataSet);
    procedure QMalaDiretaBeforeInsert(DataSet: TDataSet);
    procedure QMalaDiretaAfterOpen(DataSet: TDataSet);
    procedure QMalaDiretaBeforeDelete(DataSet: TDataSet);
    procedure QMalaDiretaDestinoCalcFields(DataSet: TDataSet);
    procedure QSMTPBeforePost(DataSet: TDataSet);
    procedure QMalaDiretaConsCalcFields(DataSet: TDataSet);
    procedure QMalaDiretaAfterPost(DataSet: TDataSet);
    procedure QSMTPAfterPost(DataSet: TDataSet);
    procedure QMensagemEletronicaAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMalaDireta: TDMMalaDireta;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TDMMalaDireta.QMalaDiretaAfterDelete(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Commit;
end;

procedure TDMMalaDireta.QMalaDiretaCalcFields(DataSet: TDataSet);
begin
  if QMalaDiretaDESC_STATUS.Value = 'NA FILA' then
    QMalaDiretadesc_situacao.Value := 'Aguardando a vez'
  else if QMalaDiretaDESC_STATUS.Value = 'ENVIANDO' then
    QMalaDiretadesc_situacao.Value := 'Enviando agora'
  else if QMalaDiretaDESC_STATUS.Value = 'OK' then
    QMalaDiretadesc_situacao.Value := 'Terminado'
  else if QMalaDiretaDESC_STATUS.Value = 'PAUSADO' then
    QMalaDiretadesc_situacao.Value := 'Pausado pelo usuário'
  else
    QMalaDiretadesc_situacao.Value := QMalaDiretaDESC_STATUS.Value;
end;

procedure TDMMalaDireta.QMalaDiretaAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Rollback;
  QMalaDireta.Refresh;
end;

procedure TDMMalaDireta.QMalaDiretaSMTPCalcFields(DataSet: TDataSet);
begin
  QMalaDiretaSMTPdesc_email.Value := DMOracle.FastSelect('DESC_EMAIL', 'TB_SMTP', 'COD_SMTP=' + QuotedStr(QMalaDiretaSMTPCOD_SMTP.Text));
  QMalaDiretaSMTPdesc_intervalo.Value := DMOracle.FastSelect('QT_EMAIL', 'TB_SMTP', 'COD_SMTP=' + QuotedStr(QMalaDiretaSMTPCOD_SMTP.Text)) + '/' +
                                         DMOracle.FastSelect('QT_HORAS', 'TB_SMTP', 'COD_SMTP=' + QuotedStr(QMalaDiretaSMTPCOD_SMTP.Text));
end;

procedure TDMMalaDireta.QMensagemEletronicaAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Rollback;
end;

procedure TDMMalaDireta.QMensagemEletronicaAfterDelete(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Commit;
end;

procedure TDMMalaDireta.QMensagemEletronicaAfterInsert(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMMalaDireta.QSMTPAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Rollback;
end;

procedure TDMMalaDireta.QSMTPAfterDelete(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Commit;
end;

procedure TDMMalaDireta.QSMTPAfterInsert(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMMalaDireta.QMalaDiretaBeforeInsert(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMMalaDireta.QMalaDiretaAfterOpen(DataSet: TDataSet);
begin
  QMalaDiretaDestino.Open;
  QMalaDiretaSMTP.Open;
end;

procedure TDMMalaDireta.QMalaDiretaBeforeDelete(DataSet: TDataSet);
begin
  while not QMalaDiretaDestino.Eof do
  begin
    QMalaDiretaDestino.Delete;
  end;
  while not QMalaDiretaSMTP.Eof do
  begin
    QMalaDiretaSMTP.Delete;
  end;
end;

procedure TDMMalaDireta.QMalaDiretaDestinoCalcFields(DataSet: TDataSet);
begin
  if QMalaDiretaDestinoIND_ENVIO.Value = 'S' then
    QMalaDiretaDestinostatus_envio.Value := 'Sim'
  else if QMalaDiretaDestinoIND_ENVIO.Value = 'N' then
    QMalaDiretaDestinostatus_envio.Value := 'Não'
  else if QMalaDiretaDestinoIND_ENVIO.Value = 'E' then
    QMalaDiretaDestinostatus_envio.Value := 'Erro'
  else    
    QMalaDiretaDestinostatus_envio.Value := 'Desconhecido';
end;

procedure TDMMalaDireta.QSMTPBeforePost(DataSet: TDataSet);
begin
  if QSMTPQT_EMAIL.Value < 1 then
    raise Exception.Create('Preencha o valor para o intervalo de e-mails(no mínimo 1)!');

  if QSMTPQT_HORAS.Value < 1 then
    raise Exception.Create('Preencha o valor para o intervalo de horas(no mínimo 1)!');
end;

procedure TDMMalaDireta.QMalaDiretaConsCalcFields(DataSet: TDataSet);
begin
  if QMalaDiretaConsDESC_STATUS.Value = 'NA FILA' then
    QMalaDiretaConsdesc_situacao.Value := 'Aguardando a vez'
  else if QMalaDiretaConsDESC_STATUS.Value = 'ENVIANDO' then
    QMalaDiretaConsdesc_situacao.Value := 'Enviando agora'
  else if QMalaDiretaConsDESC_STATUS.Value = 'OK' then
    QMalaDiretaConsdesc_situacao.Value := 'Terminado'
  else if QMalaDiretaConsDESC_STATUS.Value = 'PAUSADO' then
    QMalaDiretaConsdesc_situacao.Value := 'Pausado pelo usuário'
  else
    QMalaDiretaConsdesc_situacao.Value := QMalaDiretaConsDESC_STATUS.Value;
end;

procedure TDMMalaDireta.QMalaDiretaAfterPost(DataSet: TDataSet);
begin                                                
  QMalaDireta.SetVariable('PK',QMalaDiretaCOD_MALA_DIRETA_CAB.Value);
end;

procedure TDMMalaDireta.QSMTPAfterPost(DataSet: TDataSet);
begin
  QSMTP.SetVariable('PK',QSMTPCOD_SMTP.Value);
end;

procedure TDMMalaDireta.QMensagemEletronicaAfterPost(DataSet: TDataSet);
begin
  QMensagemEletronica.SetVariable('PK',QMensagemEletronicaCOD_MENSAGEM_ELETRONICA.Value);
end;

end.
