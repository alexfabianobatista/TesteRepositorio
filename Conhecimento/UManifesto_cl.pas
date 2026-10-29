unit UManifesto_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, DBClient, UBiblioteca;

type
  TDMManifesto = class(TDataModule)
    QManifestoCons: TOracleDataSet1;
    QManifestoConsCOD_MANIFESTO: TIntegerField;
    QManifestoConsNUM_MANIFESTO: TIntegerField;
    QManifestoConsDT_EMISSAO: TDateTimeField;
    QManifestoConsDESC_FILIAL: TStringField;
    QManifestoConsDESC_CHAVE_ACESSO: TStringField;
    QManifestoConsCOD_FILIAL: TIntegerField;
    QManifestoConsCOD_SERIE: TStringField;
    QVeiculoMDFe: TOracleDataSet;
    QVeiculoMDFeDESC_PLACA: TStringField;
    QVeiculoMDFedesc_veiculo: TStringField;
    QCondutorMDFe: TOracleDataSet;
    QCondutorMDFeCOD_CADASTRO: TIntegerField;
    QCondutorMDFenome: TStringField;
    QCondutorMDFedesc_cpf: TStringField;
    QVeiculoMDFeCOD_VEICULO_MDFE: TIntegerField;
    QVeiculoMDFeCOD_MANIFESTO: TIntegerField;
    QCondutorMDFeCOD_CONDUTOR_MDFE: TIntegerField;
    QCondutorMDFeCOD_MANIFESTO: TIntegerField;
    QCidadeCarrega: TOracleDataSet;
    QCidadeCarregaCOD_CIDADE_CARREGA: TIntegerField;
    QCidadeCarregaCOD_CIDADE: TIntegerField;
    QCidadeCarregaCOD_MANIFESTO: TIntegerField;
    QCidadeDescarga: TOracleDataSet;
    QCidadeDescargaCOD_CIDADE_DESCARGA: TIntegerField;
    QCidadeDescargaCOD_CIDADE: TIntegerField;
    QCidadeDescargaCOD_MANIFESTO: TIntegerField;
    QInfDoc: TOracleDataSet;
    QInfDocCOD_INF_DOC: TIntegerField;
    QInfDocCOD_CIDADE_DESCARGA: TIntegerField;
    QInfDocIND_TIPO_DOC: TStringField;
    QInfDocDESC_CHAVE_ACESSO: TStringField;
    QInfDocDESC_SEG_COD_BARRA: TStringField;
    QInfDocNUM_DOC: TStringField;
    QInfDocDESC_SERIE: TStringField;
    QInfDocDESC_SUBSERIE: TStringField;
    QInfDocDT_EMISSAO: TDateTimeField;
    QInfDocVAL_CARGA: TFloatField;
    QInfDocDESC_CNPJ_EMIT: TStringField;
    QInfDocCOD_UF_DEST: TStringField;
    QInfDocVAL_NF: TFloatField;
    QInfDocDESC_PIN_SUFRAMA: TStringField;
    DsInfDoc: TDataSource;
    QCidadeDescargaDESC_CIDADE: TStringField;
    QCidadeDescargaCOD_CIDADE_IBGE: TStringField;
    QCidadeCarregaDESC_CIDADE: TStringField;
    QCidadeCarregaCOD_CIDADE_IBGE: TStringField;
    QInfDocdesc_cidade_descarga: TStringField;
    QUFPercurso: TOracleDataSet;
    QUFPercursoCOD_ESTADO: TStringField;
    QUFPercursoCOD_UF_PERCURSO: TIntegerField;
    QUFPercursoCOD_MANIFESTO: TIntegerField;
    QInfDocNUM_PESO: TFloatField;
    QSeguroMDFe: TOracleDataSet;
    QSeguroMDFeCOD_SEGURO_MDFE: TIntegerField;
    QSeguroMDFeCOD_MANIFESTO: TIntegerField;
    QSeguroMDFeIND_RESP_SEGURO: TIntegerField;
    QSeguroMDFedesc_seguradora: TStringField;
    QSeguroMDFeresp_seguro: TStringField;
    QInfDocCOD_CONHECIMENTO: TIntegerField;
    QSeguroMDFeCOD_RESP_SEGURO: TIntegerField;
    QSeguroMDFedesc_contratante: TStringField;
    QSeguroMDFeNUM_APOLICE_SEGURO: TStringField;
    QSeguroMDFeCOD_SEGURADORA: TIntegerField;
    QSeguroMDFeNUM_AVERBACAO_SEGURO: TStringField;
    QCidadeCarregaCons: TOracleDataSet;
    QCidadeDescargaCons: TOracleDataSet;
    QCidadeCarregaConsCOD_CIDADE_CARREGA: TIntegerField;
    QCidadeCarregaConsCOD_MANIFESTO: TIntegerField;
    QCidadeCarregaConsCOD_CIDADE: TIntegerField;
    QCidadeCarregaConsDESC_CIDADE: TStringField;
    QCidadeCarregaConsCOD_CIDADE_IBGE: TStringField;
    QCidadeDescargaConsCOD_CIDADE_DESCARGA: TIntegerField;
    QCidadeDescargaConsCOD_MANIFESTO: TIntegerField;
    QCidadeDescargaConsCOD_CIDADE: TIntegerField;
    QCidadeDescargaConsDESC_CIDADE: TStringField;
    QCidadeDescargaConsCOD_CIDADE_IBGE: TStringField;
    QManifesto: TOracleDataSet1;
    QManifestoCOD_MANIFESTO: TIntegerField;
    QManifestoNUM_MANIFESTO: TIntegerField;
    QManifestoIND_AMBIENTE_MDFE: TIntegerField;
    QManifestoIND_TIPO_EMITENTE: TIntegerField;
    QManifestoCOD_SERIE: TStringField;
    QManifestoCOD_SERIE_MODELO: TStringField;
    QManifestoIND_MODAL: TIntegerField;
    QManifestoDT_EMISSAO: TDateTimeField;
    QManifestoCOD_UF_CARREGA: TStringField;
    QManifestoCOD_UF_DESCARREGA: TStringField;
    QManifestoDESC_CHAVE_ACESSO: TStringField;
    QManifestoCOD_FILIAL: TIntegerField;
    QManifestoCOD_USUARIO: TIntegerField;
    QManifestoIND_SITUACAO: TStringField;
    QManifestoDESC_OBS: TMemoField;
    QManifestoVAL_CARGA: TFloatField;
    QManifestoNUM_PESO: TFloatField;
    QManifestoDESC_LACRES: TMemoField;
    QManifestodesc_situacao: TStringField;
    QManifestodesc_situacao_sefaz: TStringField;
    QManifestocod_estado: TStringField;
    QInfDocIND_SOMA_TOTAIS: TStringField;
    QInfDocNUM_CPF_CNPJ_TOMADOR: TStringField;
    QManifestoIND_TIPO_CARGA: TIntegerField;
    QManifestoCOD_PRODUTO: TIntegerField;
    QManifestoIND_LOTACAO: TStringField;
    QManifestoDESC_CEP_CARREGA: TStringField;
    QManifestoDESC_CEP_DESCARREGA: TStringField;
    QValePedagio: TOracleDataSet;
    QValePedagioCOD_VALE_PEDAGIO: TIntegerField;
    QValePedagioNUM_CNPJ_FORNECEDOR: TStringField;
    QValePedagioNUM_COMPRA: TStringField;
    QValePedagioVAL_VALE_PEDAGIO: TFloatField;
    QValePedagioCOD_MANIFESTO: TIntegerField;
    QValePedagioNUM_CPF_CNPJ_TOMADOR: TStringField;
    CdsTipoValePedagio: TClientDataSet;
    CdsTipoValePedagioCOD_TIPO_VALE_PEDAGIO: TStringField;
    CdsTipoValePedagioTIPO_VALE_PEDAGIO: TStringField;
    CdsCombinacaoVeicular: TClientDataSet;
    CdsCombinacaoVeicularCOD_COMB_VEICULAR: TStringField;
    QValePedagioIND_TIPO_VALE_PEDAGIO: TStringField;
    QValePedagioIND_COMBINACAO_VEICULAR: TStringField;
    DsTipoValePedagio: TDataSource;
    DsCombinacaoVeicular: TDataSource;
    CdsCombinacaoVeicularCOMB_VEICULAR: TStringField;
    QRManifesto: TOracleDataSet1;
    QRManifestoNUM_MANIFESTO: TIntegerField;
    QRManifestoCOD_MANIFESTO: TIntegerField;
    QRManifestoDESC_FILIAL: TStringField;
    QRManifestoDT_EMISSAO: TDateTimeField;
    QRManifestoDESC_PLACA: TStringField;
    QRManifestoSTATUS_MDFE: TStringField;
    QRManifestoCOD_UF_CARREGA: TStringField;
    QRManifestoCOD_UF_DESCARREGA: TStringField;
    QInfDocDESC_CIOT: TStringField;
    QCidadeDescargaConsCOD_ESTADO: TStringField;
    QCidadeDescargaCOD_ESTADO: TStringField;
    QCidadeCarregaCOD_ESTADO: TStringField;
    QCidadeCarregaConsCOD_ESTADO: TStringField;
    QManifestoCOD_BANCO_AGENCIA: TIntegerField;
    QManifestoConsCOD_BANCO_AGENCIA: TIntegerField;
    QManifestoDESC_LONGITUDE_CARREGA: TStringField;
    QManifestoDESC_LONGITUDE_DESCARREGA: TStringField;
    QManifestoDESC_LATITUDE_CARREGA: TStringField;
    QManifestoDESC_LATITUDE_DESCARREGA: TStringField;
    procedure QManifestoAfterCancel(DataSet: TDataSet);
    procedure QManifestoAfterDelete(DataSet: TDataSet);
    procedure QManifestoAfterEdit(DataSet: TDataSet);
    procedure QManifestoAfterInsert(DataSet: TDataSet);
    procedure QManifestoAfterPost(DataSet: TDataSet);
    procedure QManifestoBeforeDelete(DataSet: TDataSet);
    procedure QManifestoBeforePost(DataSet: TDataSet);
    procedure QManifestoCalcFields(DataSet: TDataSet);
    procedure QManifestoDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QVeiculoMDFeAfterInsert(DataSet: TDataSet);
    procedure QVeiculoMDFeAfterPost(DataSet: TDataSet);
    procedure QVeiculoMDFeBeforeDelete(DataSet: TDataSet);
    procedure QVeiculoMDFeBeforeEdit(DataSet: TDataSet);
    procedure QVeiculoMDFeCalcFields(DataSet: TDataSet);
    procedure QCondutorMDFeCalcFields(DataSet: TDataSet);
    procedure QCondutorMDFeBeforeDelete(DataSet: TDataSet);
    procedure QCondutorMDFeAfterPost(DataSet: TDataSet);
    procedure QCondutorMDFeAfterInsert(DataSet: TDataSet);
    procedure QCidadeCarregaAfterInsert(DataSet: TDataSet);
    procedure QCidadeCarregaAfterPost(DataSet: TDataSet);
    procedure QCidadeCarregaBeforeDelete(DataSet: TDataSet);
    procedure QCidadeDescargaAfterInsert(DataSet: TDataSet);
    procedure QCidadeDescargaAfterPost(DataSet: TDataSet);
    procedure QCidadeDescargaBeforeDelete(DataSet: TDataSet);
    procedure QInfDocAfterInsert(DataSet: TDataSet);
    procedure QCidadeDescargaAfterScroll(DataSet: TDataSet);
    procedure QInfDocCalcFields(DataSet: TDataSet);
    procedure QUFPercursoAfterInsert(DataSet: TDataSet);
    procedure QUFPercursoAfterPost(DataSet: TDataSet);
    procedure QUFPercursoBeforeDelete(DataSet: TDataSet);
    procedure QManifestoCOD_FILIALChange(Sender: TField);
    procedure QSeguroMDFeBeforeDelete(DataSet: TDataSet);
    procedure QSeguroMDFeAfterPost(DataSet: TDataSet);
    procedure QSeguroMDFeCalcFields(DataSet: TDataSet);
    procedure QSeguroMDFeAfterInsert(DataSet: TDataSet);
    procedure QValePedagioAfterInsert(DataSet: TDataSet);
    procedure QValePedagioAfterPost(DataSet: TDataSet);
    procedure QValePedagioBeforeDelete(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure QInfDocBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    fApagando: Boolean;
    tipoValePedagio: TVariantMap;
    combinacaoVeicular: TVariantMap;
  public
    { Public declarations }
    property pApagando: Boolean read fApagando write fApagando default False;
    procedure ExcluiManifesto;
  end;

var
  DMManifesto: TDMManifesto;

const
  SIT_MDFE_DIGITADO: string = '1';
  SIT_MDFE_CONFIRMADO: string = '2';
  SIT_MDFE_CANCELADO: string = '3';
  SIT_MDFE_DENEGADO: string = '4';
  SIT_MDFE_ENCERRADO: string = '5';

implementation

uses UOracle_cl, UUsuario_cl, UParamSistema_cl;

{$R *.dfm}

procedure TDMManifesto.QManifestoAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QManifesto.Close;
  QManifesto.Open;
end;

procedure TDMManifesto.QManifestoAfterDelete(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Commit;
end;

procedure TDMManifesto.QManifestoAfterEdit(DataSet: TDataSet);
begin
  QManifestoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMManifesto.QManifestoAfterInsert(DataSet: TDataSet);
begin
  QManifestoDT_EMISSAO.value:= Date;
  QManifestoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  QManifestoNUM_MANIFESTO.Value := 0;
  if DMParamSistema.CodEmpresa = 'AVICEU' then
    QManifestoCOD_SERIE.Value := '2'
  else
    QManifestoCOD_SERIE.Value := '1';
  QManifestoCOD_SERIE_MODELO.Value := '58';
  QManifestoCOD_FILIAL.Value := DMUsuario.CodFilialUsuario;
  QManifestoIND_AMBIENTE_MDFE.Text := DMOracle.FastSelect('IND_AMBIENTE_MDFE','TB_FILIAL','COD_FILIAL = '+ IntToStr(DMUsuario.CodFilialUsuario));

end;

procedure TDMManifesto.QManifestoAfterPost(DataSet: TDataSet);
var wCodigo: Integer;
begin
  wCodigo := QManifestoCOD_MANIFESTO.Value;
  QManifesto.Close;
  QManifesto.SetVariable('PK',wCodigo);
  QManifesto.Open;
end;

procedure TDMManifesto.QManifestoBeforeDelete(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMManifesto.QManifestoBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QManifestoCOD_FILIAL.Text);
  QManifestoCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMManifesto.QManifestoCalcFields(DataSet: TDataSet);
Var auxSitCancSefaz: String;
begin
  // Situacao do MDF-e - Adriel Dias 10/12/2013
  QManifestodesc_situacao.Value := '';
  if QManifestoIND_SITUACAO.Value = SIT_MDFE_DIGITADO then
    QManifestodesc_situacao.Value := 'DIGITADO'
  else if QManifestoIND_SITUACAO.Value = SIT_MDFE_CONFIRMADO then
    QManifestodesc_situacao.Value := 'CONFIRMADO'
  else if QManifestoIND_SITUACAO.Value = SIT_MDFE_CANCELADO then
    QManifestodesc_situacao.Value := 'CANCELADO'
  else if QManifestoIND_SITUACAO.Value = SIT_MDFE_DENEGADO then
    QManifestodesc_situacao.Value := 'DENEGADO'
  else if QManifestoIND_SITUACAO.Value = SIT_MDFE_ENCERRADO then
    QManifestodesc_situacao.Value := 'ENCERRADO';


  // Situacao do MDF-e na SEFAZ - Adriel Dias 10/12/2013
  QManifestodesc_situacao_sefaz.Value := '';
  if not QManifestoDESC_CHAVE_ACESSO.IsNull then
  begin
    auxSitCancSefaz := DMOracle.BuscaNome('SELECT DESC_RETORNO_ENCERRAMENTO FROM TB_MDFE',
        'COD_MANIFESTO = ' + QManifestoCOD_MANIFESTO.Text);
    if auxSitCancSefaz <> '' then
    begin
      QManifestodesc_situacao_sefaz.Value := auxSitCancSefaz + ' - '
       + DMOracle.BuscaNome('SELECT DESC_MSG_ENCERRAMENTO FROM TB_MDFE',
      'COD_MANIFESTO = ' + QManifestoCOD_MANIFESTO.Text);
    end
    else
    begin
      auxSitCancSefaz := '';
      auxSitCancSefaz := DMOracle.BuscaNome('SELECT DESC_RETORNO_CANCELAMENTO FROM TB_MDFE',
          'COD_MANIFESTO = ' + QManifestoCOD_MANIFESTO.Text);
      if auxSitCancSefaz <> '' then
      begin
        QManifestodesc_situacao_sefaz.Value := auxSitCancSefaz + ' - '
         + DMOracle.BuscaNome('SELECT DESC_MSG_CANCELAMENTO FROM TB_MDFE',
        'COD_MANIFESTO = ' + QManifestoCOD_MANIFESTO.Text);
      end
      else
      begin
        QManifestodesc_situacao_sefaz.Value :=
        DMOracle.BuscaNome('SELECT DESC_RETORNO_PROCESSAMENTO FROM TB_MDFE',
          'COD_MANIFESTO = ' + QManifestoCOD_MANIFESTO.Text) + ' - '
           + DMOracle.BuscaNome('SELECT DESC_MSG_VALIDACAO_LOTE FROM TB_MDFE',
          'COD_MANIFESTO = ' + QManifestoCOD_MANIFESTO.Text);
      end;
    end;
  end;
end;

procedure TDMManifesto.QManifestoDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Rollback;
end;

procedure TDMManifesto.QVeiculoMDFeAfterInsert(DataSet: TDataSet);
begin
  QVeiculoMDFeCOD_MANIFESTO.Value := QManifestoCOD_MANIFESTO.Value;
end;

procedure TDMManifesto.QVeiculoMDFeAfterPost(DataSet: TDataSet);
var wCodigo: Real;
begin
  wCodigo := QVeiculoMDFeCOD_VEICULO_MDFE.Value;

  QVeiculoMDFe.DisableControls;
  if QVeiculoMDFe.RecordCount < 2 then
  begin
   QManifesto.Post;
   QManifesto.Edit;
  end;
  QVeiculoMDFe.Locate('COD_VEICULO_MDFE', wCodigo, []);
  QVeiculoMDFe.EnableControls;
end;

procedure TDMManifesto.QVeiculoMDFeBeforeDelete(DataSet: TDataSet);
begin
  if not pApagando then
  begin
    if QManifesto.State <> dsEdit then
      raise Exception.Create('Manifesto não está no modo de alteração!');
    if QVeiculoMDFe.State in [dsEdit, dsInsert] then
      QVeiculoMDFe.Cancel;
  end;
end;

procedure TDMManifesto.QVeiculoMDFeBeforeEdit(DataSet: TDataSet);
begin
  if QManifesto.State = dsInsert then
  begin
    QManifesto.Post;
    QManifesto.Edit;
  end;
  if QManifesto.State <> dsEdit then
    raise Exception.Create('Manifesto não está no modo de alteração!');
end;

procedure TDMManifesto.QVeiculoMDFeCalcFields(DataSet: TDataSet);
begin
  if (not QVeiculoMDFeDESC_PLACA.IsNull) and (QVeiculoMDFeDESC_PLACA.Value <> '') then
  begin
    if Buscador = nil then
      Buscador := TBuscador.Create([''], False);
    Buscador.Limpa;
    Buscador.Adiciona('DESC_VEICULO','TB_VEICULO_CONHECIMENTO', 'DESC_PLACA = ' + chr(39) + QVeiculoMDFeDESC_PLACA.Text + chr(39));
    Buscador.Buscar;
    QVeiculoMDFedesc_veiculo.Value := Buscador.Proximo;
    Buscador.Fecha;
  end;
end;

procedure TDMManifesto.QCondutorMDFeCalcFields(DataSet: TDataSet);
begin
  if (not QCondutorMDFeCOD_CADASTRO.IsNull) and (QCondutorMDFeCOD_CADASTRO.Value <> 0) then
  begin
    if Buscador = nil then
      Buscador := TBuscador.Create([''], False);
    Buscador.Limpa;
    Buscador.Adiciona('NOME','TB_CADASTRO', 'COD_CADASTRO = '+QCondutorMDFeCOD_CADASTRO.Text);
    Buscador.Adiciona('NUM_CGC_CPF','TB_CADASTRO', 'COD_CADASTRO = '+QCondutorMDFeCOD_CADASTRO.Text);
    Buscador.Buscar;
    QCondutorMDFenome.Value := Buscador.Proximo;
    QCondutorMDFedesc_cpf.Value := Buscador.Proximo;
    Buscador.Fecha;
  end;
end;

procedure TDMManifesto.QCondutorMDFeBeforeDelete(DataSet: TDataSet);
begin
  if not pApagando then
  begin
    if QManifesto.State <> dsEdit then
      raise Exception.Create('Manifesto não está no modo de alteração!');
    if QCondutorMDFe.State in [dsEdit, dsInsert] then
      QCondutorMDFe.Cancel;
  end;
end;

procedure TDMManifesto.QCondutorMDFeAfterPost(DataSet: TDataSet);
var wCodigo: Real;
begin
  wCodigo := QCondutorMDFeCOD_CONDUTOR_MDFE.Value;

  QCondutorMDFe.DisableControls;
  if QCondutorMDFe.RecordCount < 2 then
  begin
   QManifesto.Post;
   QManifesto.Edit;
  end;
  QCondutorMDFe.Locate('COD_CONDUTOR_MDFE', wCodigo, []);
  QCondutorMDFe.EnableControls;
end;

procedure TDMManifesto.QCondutorMDFeAfterInsert(DataSet: TDataSet);
begin
  QCondutorMDFeCOD_MANIFESTO.Value := QManifestoCOD_MANIFESTO.Value;
end;

procedure TDMManifesto.QCidadeCarregaAfterInsert(DataSet: TDataSet);
begin
  QCidadeCarregaCOD_MANIFESTO.Value := QManifestoCOD_MANIFESTO.Value;
end;

procedure TDMManifesto.QCidadeCarregaAfterPost(DataSet: TDataSet);
var wCodigo: Real;
begin
  wCodigo := QCidadeCarregaCOD_CIDADE_CARREGA.Value;

  QCidadeCarrega.DisableControls;
  if QCidadeCarrega.RecordCount < 2 then
  begin
   QManifesto.Post;
   QManifesto.Edit;
  end;
  QCidadeCarrega.Locate('COD_CIDADE_CARREGA', wCodigo, []);
  QCidadeCarrega.EnableControls;
  QCidadeCarrega.Refresh;
end;

procedure TDMManifesto.QCidadeCarregaBeforeDelete(DataSet: TDataSet);
begin
  if not pApagando then
  begin
    if QManifesto.State <> dsEdit then
      raise Exception.Create('Manifesto não está no modo de alteração!');
    if QCidadeCarrega.State in [dsEdit, dsInsert] then
      QCidadeCarrega.Cancel;
  end;
end;

procedure TDMManifesto.QCidadeDescargaAfterInsert(DataSet: TDataSet);
begin
  QCidadeDescargaCOD_MANIFESTO.Value := QManifestoCOD_MANIFESTO.Value;
end;

procedure TDMManifesto.QCidadeDescargaAfterPost(DataSet: TDataSet);
var wCodigo: Real;
begin
  wCodigo := QCidadeDescargaCOD_CIDADE_DESCARGA.Value;

  QCidadeDescarga.DisableControls;
  if QCidadeDescarga.RecordCount < 2 then
  begin
   QManifesto.Post;
   QManifesto.Edit;
  end;
  QCidadeDescarga.Locate('COD_CIDADE_DESCARGA', wCodigo, []);
  QCidadeDescarga.EnableControls;
  QCidadeDescarga.RefreshRecord;
end;

procedure TDMManifesto.QCidadeDescargaBeforeDelete(DataSet: TDataSet);
begin
  if not pApagando then
  begin
    if QManifesto.State <> dsEdit then
      raise Exception.Create('Manifesto não está no modo de alteração!');
    if QCidadeDescarga.State in [dsEdit, dsInsert] then
      QCidadeDescarga.Cancel;
  end;
end;

procedure TDMManifesto.ExcluiManifesto;
var wComando: string;
begin
  try
    if QManifestoIND_SITUACAO.Value <> '1' then
      raise Exception.Create('Somente Manifesto digitados podem ser excluídos!');
    pApagando := True;

    QUFPercurso.First;
    while not QUFPercurso.Eof do
      QUFPercurso.Delete;

    QCondutorMDFe.First;
    while not QCondutorMDFe.Eof do
      QCondutorMDFe.Delete;

    QVeiculoMDFe.First;
    while not QVeiculoMDFe.Eof do
      QVeiculoMDFe.Delete;

    QCidadeCarrega.First;
    while not QCidadeCarrega.Eof do
      QCidadeCarrega.Delete;

    QValePedagio.First;
    while not QValePedagio.Eof do
      QValePedagio.Delete;

    QCidadeDescarga.First;
    while not QCidadeDescarga.Eof do
    begin
      QInfDoc.Close;
      QInfDoc.SetVariable('COD_CIDADE_DESCARGA', QCidadeDescargaCOD_CIDADE_DESCARGA.Value);
      QInfDoc.Open;
      QInfDoc.First;
      while not QInfDoc.Eof do
        QInfDoc.Delete;
      QCidadeDescarga.Delete;
    end;
    QSeguroMDFe.First;
    while not QSeguroMDFe.Eof do
      QSeguroMDFe.Delete;

    with DMOracle do
    begin
      if Trim(QManifestoDESC_CHAVE_ACESSO .Value) <> '' then
      begin
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        wComando := 'DELETE FROM TB_MDFE_EVENTO';
        wComando := wComando + ' WHERE DESC_CHAVE_ACESSO = ' + Bib.LimpaNumero(QManifestoDESC_CHAVE_ACESSO .Value);
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;
      end;

      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'DELETE FROM TB_MDFE';
      wComando := wComando + ' WHERE COD_MANIFESTO = ' + FloatToStr(QManifestoCOD_MANIFESTO.Value);
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
    end;
    QManifesto.Delete;
    pApagando := False;
  except
    pApagando := False;
    raise;
  end;
end;

procedure TDMManifesto.QInfDocAfterInsert(DataSet: TDataSet);
begin
  QInfDocCOD_CIDADE_DESCARGA.Value := QCidadeDescargaCOD_CIDADE_DESCARGA.Value;
end;

procedure TDMManifesto.QCidadeDescargaAfterScroll(DataSet: TDataSet);
begin
  if QCidadeDescargaCOD_CIDADE_DESCARGA.Text <> '' then
  begin
    QInfDoc.Close;
    QInfDoc.SetVariable('COD_CIDADE_DESCARGA',QCidadeDescargaCOD_CIDADE_DESCARGA.Text);
    QInfDoc.Open;
  end;
end;

procedure TDMManifesto.QInfDocCalcFields(DataSet: TDataSet);
begin
  QInfDocdesc_cidade_descarga.Value := DMOracle.FastSelect('DESC_CIDADE','TB_CIDADE','COD_CIDADE = '+QCidadeDescargaCOD_CIDADE.Text);
end;

procedure TDMManifesto.QUFPercursoAfterInsert(DataSet: TDataSet);
begin
  QUFPercursoCOD_MANIFESTO.Value := QManifestoCOD_MANIFESTO.Value;
end;

procedure TDMManifesto.QUFPercursoAfterPost(DataSet: TDataSet);
var
  wCodigo: Real;
begin
  wCodigo := QUFPercursoCOD_UF_PERCURSO.Value;

  QUFPercurso.DisableControls;
  if QUFPercurso.RecordCount < 2 then
  begin
   QManifesto.Post;
   QManifesto.Edit;
  end;
  QUFPercurso.Locate('COD_UF_PERCURSO', wCodigo, []);
  QUFPercurso.EnableControls;
  QUFPercurso.Refresh;

end;

procedure TDMManifesto.QUFPercursoBeforeDelete(DataSet: TDataSet);
begin
  if not pApagando then
  begin
    if QManifesto.State <> dsEdit then
      raise Exception.Create('Manifesto não está no modo de alteração!');
    if QUFPercurso.State in [dsEdit, dsInsert] then
      QUFPercurso.Cancel;
  end;
end;

procedure TDMManifesto.QManifestoCOD_FILIALChange(Sender: TField);
begin
  if QManifestoCOD_FILIAL.Value <> 0 then
  begin
    QManifestoIND_TIPO_EMITENTE.Text := DMOracle.FastSelect('IND_TIPO_EMITENTE_MDFE','TB_FILIAL','COD_FILIAL = '+QManifestoCOD_FILIAL.Text);
    QManifestoIND_AMBIENTE_MDFE.Text := DMOracle.FastSelect('IND_AMBIENTE_MDFE','TB_FILIAL','COD_FILIAL = '+ QManifestoCOD_FILIAL.Text);
  end;
end;

procedure TDMManifesto.QSeguroMDFeBeforeDelete(DataSet: TDataSet);
begin
  if not pApagando then
  begin
    if QManifesto.State <> dsEdit then
      raise Exception.Create('Manifesto não está no modo de alteração!');
    if QSeguroMDFe.State in [dsEdit, dsInsert] then
      QSeguroMDFe.Cancel;
  end;
end;

procedure TDMManifesto.QSeguroMDFeAfterPost(DataSet: TDataSet);
var
  wCodigo: Real;
begin
  wCodigo := QSeguroMDFeCOD_SEGURO_MDFE.Value;
  QSeguroMDFe.DisableControls;
  if QSeguroMDFe.RecordCount < 2 then
  begin
   QManifesto.Post;
   QManifesto.Edit;
  end;
  QSeguroMDFe.Locate('COD_SEGURO_MDFE', wCodigo, []);
  QSeguroMDFe.EnableControls;
  QSeguroMDFe.Refresh;
end;

procedure TDMManifesto.QSeguroMDFeCalcFields(DataSet: TDataSet);
begin
  if (not QSeguroMDFeCOD_SEGURADORA.IsNull) and (QSeguroMDFeCOD_SEGURADORA.Value <> 0) then
    QSeguroMDFedesc_seguradora.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = '+QSeguroMDFeCOD_SEGURADORA.Text);
  if (not QSeguroMDFeCOD_RESP_SEGURO.IsNull) and (QSeguroMDFeCOD_RESP_SEGURO.Value <> 0) then
    QSeguroMDFedesc_contratante.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = '+QSeguroMDFeCOD_RESP_SEGURO.Text);
  QSeguroMDFeresp_seguro.Value := Bib.ift(QSeguroMDFeIND_RESP_SEGURO.Value = 1,
    'Emitente','Contratante');
end;

procedure TDMManifesto.QSeguroMDFeAfterInsert(DataSet: TDataSet);
var wApolicePadrao: string;
begin
  wApolicePadrao := DMOracle.FastSelect('DESC_APOLICE_SEGURO_PADRAO','TB_FILIAL','COD_FILIAL = '+ QManifestoCOD_FILIAL.Text);
  QSeguroMDFeCOD_SEGURADORA.Text := DMOracle.FastSelect('COD_SEGURADORA_PADRAO','TB_FILIAL','COD_FILIAL = '+ QManifestoCOD_FILIAL.Text);
  QSeguroMDFeCOD_MANIFESTO.Value := QManifestoCOD_MANIFESTO.Value;
  QSeguroMDFeIND_RESP_SEGURO.Text := DMOracle.FastSelect('IND_RESP_SEGURO_PADRAO','TB_FILIAL','COD_FILIAL = '+ QManifestoCOD_FILIAL.Text);;
  QSeguroMDFeNUM_APOLICE_SEGURO.Value := Bib.ift(pos(',',wApolicePadrao)>0,
    Bib.ift(QSeguroMDFe.RecordCount mod 2 = 0, Trim(copy(wApolicePadrao,1,pos(',',wApolicePadrao)-1)),
      Trim(copy(wApolicePadrao,pos(',',wApolicePadrao)+1,Length(wApolicePadrao) - pos(',',wApolicePadrao)))),
    wApolicePadrao);
  
end;

procedure TDMManifesto.QValePedagioAfterInsert(DataSet: TDataSet);
begin
  QValePedagioCOD_MANIFESTO.Value := QManifestoCOD_MANIFESTO.Value;
end;

procedure TDMManifesto.QValePedagioAfterPost(DataSet: TDataSet);
var
  wCodigo: Real;
begin
  wCodigo := QValePedagioCOD_VALE_PEDAGIO.Value;
  QValePedagio.DisableControls;
  if QValePedagio.RecordCount < 2 then
  begin
   QManifesto.Post;
   QManifesto.Edit;
  end;
  QValePedagio.Locate('COD_VALE_PEDAGIO', wCodigo, []);
  QValePedagio.EnableControls;
  QValePedagio.Refresh;
end;

procedure TDMManifesto.QValePedagioBeforeDelete(DataSet: TDataSet);
begin
  if not pApagando then
  begin
    if QManifesto.State <> dsEdit then
      raise Exception.Create('Manifesto não está no modo de alteração!');
    if QValePedagio.State in [dsEdit, dsInsert] then
      QValePedagio.Cancel;
  end;
end;

procedure TDMManifesto.DataModuleCreate(Sender: TObject);
var i: integer;
begin
  tipoValePedagio := TVariantMap.Create;
  tipoValePedagio.addValue('01', '01 - TAG;');
  tipoValePedagio.addValue('02', '02 - Cupom;');
  tipoValePedagio.addValue('03', '03 - Cartão;');

  CdsTipoValePedagio.CreateDataSet;
  CdsTipoValePedagio.Active := True;

  for i := 0 to tipoValePedagio.count - 1 do
  begin
    CdsTipoValePedagio.Append;
    CdsTipoValePedagioCOD_TIPO_VALE_PEDAGIO.AsVariant := tipoValePedagio.getKeys.Keys[i];
    CdsTipoValePedagioTIPO_VALE_PEDAGIO.AsVariant := tipoValePedagio.getValue(tipoValePedagio.getKeys.Keys[i]);
    CdsTipoValePedagio.Post;
  end;

  combinacaoVeicular := TVariantMap.Create;
  combinacaoVeicular.addValue('02','02 Veículo Comercial 2 eixos;');
  combinacaoVeicular.addValue('04','04 Veículo Comercial 3 eixos;');
  combinacaoVeicular.addValue('06','06 Veículo Comercial 4 eixos;');
  combinacaoVeicular.addValue('07','07 Veículo Comercial 5 eixos;');
  combinacaoVeicular.addValue('08','08 Veículo Comercial 6 eixos;');
  combinacaoVeicular.addValue('10','10 Veículo Comercial 7 eixos;');
  combinacaoVeicular.addValue('11','11 Veículo Comercial 8 eixos;');
  combinacaoVeicular.addValue('12','12 Veículo Comercial 9 eixos;');
  combinacaoVeicular.addValue('13','13 Veículo Comercial 10 eixos;');
  combinacaoVeicular.addValue('14','14 Veículo Comercial Acima de 10 eixos;');

  CdsCombinacaoVeicular.CreateDataSet;
  CdsCombinacaoVeicular.Active := True;

  for i := 0 to combinacaoVeicular.count - 1 do
  begin
    CdsCombinacaoVeicular.Append;
    CdsCombinacaoVeicularCOD_COMB_VEICULAR.AsVariant := combinacaoVeicular.getKeys.Keys[i];
    CdsCombinacaoVeicularCOMB_VEICULAR.AsVariant := combinacaoVeicular.getValue(combinacaoVeicular.getKeys.Keys[i]);
    CdsCombinacaoVeicular.Post;
  end;
end;

procedure TDMManifesto.QInfDocBeforePost(DataSet: TDataSet);
begin
  if (DMParamSistema.CodEmpresa = 'MATRANSP') then
  begin
     if Trim(QInfDocDESC_CIOT.AsString) = '' then
    raise Exception.Create('Informe o CIOT.');
  end;
end;

end.
