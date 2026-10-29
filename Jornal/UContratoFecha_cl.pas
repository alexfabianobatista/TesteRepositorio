unit UContratoFecha_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, DBClient;

type
  TDMContratoFecha = class(TDataModule)
    QGeraCRCad: TOracleDataSet1;
    QGeraCRCadCOD_CONTA_RECEBER_CAB: TIntegerField;
    QGeraCRCadCOD_FINALIDADE: TIntegerField;
    QGeraCRCadCOD_BANCO_AGENCIA: TIntegerField;
    QGeraCRCadCOD_FILIAL: TIntegerField;
    QGeraCRCadNUM_TITULO: TFloatField;
    QGeraCRCadNUM_PARCELA: TIntegerField;
    QGeraCRCadDESC_TIPO_DOCUMENTO: TStringField;
    QGeraCRCadDT_MOVIMENTO: TDateTimeField;
    QGeraCRCadDT_BAIXA: TDateTimeField;
    QGeraCRCadDT_VENCIMENTO: TDateTimeField;
    QGeraCRCadDT_EMISSAO: TDateTimeField;
    QGeraCRCadDT_CAPITALIZACAO: TDateTimeField;
    QGeraCRCadDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QGeraCRCadVAL_TITULO: TFloatField;
    QGeraCRCadVAL_NEGOCIO: TFloatField;
    QGeraCRCadIND_ACEITE: TStringField;
    QGeraCRCadIND_SITUACAO: TStringField;
    QGeraCRCadDESC_OBSERVACAO: TStringField;
    QGeraCRCadCOD_NOTA_CAB: TIntegerField;
    QGeraCRCadCOD_CADASTRO: TIntegerField;
    QGeraCRCadVAL_ORIGINAL: TFloatField;
    QGeraCRCadVAL_PROMISSORIA: TFloatField;
    QGeraCRCadVAL_JUROS: TFloatField;
    QGeraCRCadCOD_DEPARTAMENTO: TIntegerField;
    QGeraCRCadCOD_CONTRATO_VEND: TIntegerField;
    QGeraCRCadDESC_AVALISTA1: TStringField;
    QGeraCRCadDESC_AVALISTA2: TStringField;
    QGeraCRCadCOD_VENDEDOR: TIntegerField;
    QGeraCRCadCOD_VENDEDOR1: TIntegerField;
    QGeraCRCadPERC_COMISSAO: TFloatField;
    QGeraCRCadPERC_COMISSAO1: TFloatField;
    QGeraCRCadCOD_NOSSO_NUMERO: TStringField;
    QGeraCRCadIND_ENVIADO_BANCO: TStringField;
    QGeraCRCadCOD_CONTA_CORRENTE: TIntegerField;
    QGeraCRCadCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QGeraCRCadCOD_OBRA_CONTRATO: TIntegerField;
    QGeraCRCadIND_EMITIDO_CARNE: TStringField;
    QGeraCRCadCOD_OBRA_CONTRATO_MOV: TIntegerField;
    QGeraCRCadNUM_OS: TIntegerField;
    QGeraCRCadCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QGeraCRCadDESC_OBS: TStringField;
    QGeraCRMovCad: TOracleDataSet1;
    QGeraCRMovCaddesc_caixa_banco: TStringField;
    QGeraCRMovCadCOD_CONTA_RECEBER_MOV: TIntegerField;
    QGeraCRMovCadCOD_CONTA_RECEBER_CAB: TIntegerField;
    QGeraCRMovCadDT_MOVIMENTO: TDateTimeField;
    QGeraCRMovCadVAL_MOVIMENTO: TFloatField;
    QGeraCRMovCadDESC_OBSERVACAO: TStringField;
    QGeraCRMovCadCOD_USUARIO: TIntegerField;
    QGeraCRMovCadDT_USUARIO: TDateTimeField;
    QGeraCRMovCadIND_TIPO_MOVIMENTO: TStringField;
    QGeraCRMovCadCOD_BCO_MOVIMENTO: TIntegerField;
    QGeraCRMovCadCOD_CAIXA_MOV: TIntegerField;
    QGeraCRMovCadCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QGeraCRMovCadCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QGeraCRMovCadCOD_NOTA_CAB: TIntegerField;
    QGeraCRMovCadIND_DEVOLUCAO: TStringField;
    QGeraCRMovCadIND_FORMA_PAGAMENTO: TStringField;
    QGeraCRMovCadIND_TROCA: TStringField;
    CDSFechaGeraCR: TClientDataSet;
    CDSFechaGeraCRNUM_EDICAO: TIntegerField;
    CDSFechaGeraCRVAL_CONTA_RECEBER: TFloatField;
    CDSFechaGeraCRDT_VENCIMENTO: TDateField;
    CDSFechaGeraCRCOD_CONTRATO_JORNAL_ITEM: TIntegerField;
    procedure QGeraCRCadAfterInsert(DataSet: TDataSet);
    procedure QGeraCRMovCadAfterInsert(DataSet: TDataSet);
    procedure QGeraCRMovCadBeforeEdit(DataSet: TDataSet);
    procedure QGeraCRMovCadAfterPost(DataSet: TDataSet);
    procedure QGeraCRMovCadBeforePost(DataSet: TDataSet);
    procedure QGeraCRMovCadCalcFields(DataSet: TDataSet);
    procedure QGeraCRCadAfterPost(DataSet: TDataSet);
    procedure QGeraCRCadBeforeEdit(DataSet: TDataSet);
    procedure QGeraCRCadBeforeInsert(DataSet: TDataSet);
    procedure QGeraCRCadBeforePost(DataSet: TDataSet);
    procedure QGeraCRCadAfterClose(DataSet: TDataSet);
    procedure QGeraCRCadAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContratoFecha: TDMContratoFecha;

implementation

uses UOracle_cl, UUsuario_cl, UParamSistema_cl, USequencia_cl;

{$R *.dfm}

procedure TDMContratoFecha.QGeraCRCadAfterInsert(DataSet: TDataSet);
begin
  QGeraCRCadIND_SITUACAO.Value := 'ABERTO';
  QGeraCRCadIND_ACEITE.Value := 'NAO';
  QGeraCRCadDT_EMISSAO.Value := DMOracle.DataServ;
  QGeraCRCadVAL_JUROS.Value := 0;
  QGeraCRCadCOD_FILIAL.Value := DMUsuario.CodFilialUsuario;
  QGeraCRCadCOD_DEPARTAMENTO.Value := 1;
  QGeraCRCadPERC_COMISSAO.Value := 0;
  QGeraCRCadPERC_COMISSAO1.Value := 0;
end;

procedure TDMContratoFecha.QGeraCRMovCadAfterInsert(DataSet: TDataSet);
begin
  QGeraCRMovCadCOD_CONTA_RECEBER_CAB.Value := QGeraCRCadCOD_CONTA_RECEBER_CAB.Value;
  QGeraCRMovCadDT_MOVIMENTO.Value := QGeraCRCadDT_EMISSAO.Value; 
end;

procedure TDMContratoFecha.QGeraCRMovCadBeforeEdit(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then
    raise Exception.Create('Não é Possível alterar ou incluir valores no movimento. Altere antes o Contas à Receber.');
  if QGeraCRCad.State = dsInsert then
  begin
    QGeraCRCad.Post;
    QGeraCRCad.Edit;
  end;
end;

procedure TDMContratoFecha.QGeraCRMovCadAfterPost(DataSet: TDataSet);
var
  wCodigo: Real;
begin
  wCodigo := QGeraCRMovCadCOD_CONTA_RECEBER_MOV.Value;
  QGeraCRMovCad.DisableControls;
  QGeraCRMovCad.Close;
  QGeraCRMovCad.Open;
  QGeraCRMovCad.Locate('COD_CONTA_RECEBER_MOV', wCodigo, []);
  QGeraCRMovCad.EnableControls;
end;

procedure TDMContratoFecha.QGeraCRMovCadBeforePost(DataSet: TDataSet);
begin
  QGeraCRMovCadCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  QGeraCRMovCadDT_USUARIO.Value := DMOracle.DataHoraServ;
end;

procedure TDMContratoFecha.QGeraCRMovCadCalcFields(DataSet: TDataSet);
var
  wConta: String;
begin
  if (QGeraCRMovCadIND_TIPO_MOVIMENTO.Text <> 'PRINCIPAL') And
      (QGeraCRMovCadIND_TIPO_MOVIMENTO.Text <> 'JUROS') then
  begin
    if QGeraCRMovCadCOD_BCO_MOVIMENTO.Text <> '' then
    begin
      wConta := MontaSelect('COD_CONTA_CORRENTE', 'TB_BCO_MOVIMENTO',
          'COD_BCO_MOVIMENTO = 0' + QGeraCRMovCadCOD_BCO_MOVIMENTO.Text);
      wConta := DMOracle.FastSelect('DESC_CONTA_CORRENTE', 'TB_CONTA_CORRENTE',
          'COD_CONTA_CORRENTE IN (' + wConta + ')');
      if wConta <> '' then
         QGeraCRMovCaddesc_caixa_banco.Value := wConta;
    end
    else
      if QGeraCRMovCadCOD_CAIXA_MOV.Text <> '' then
        QGeraCRMovCaddesc_caixa_banco.Value := 'Caixa'
      else
        QGeraCRMovCaddesc_caixa_banco.Value := 'Contabil';
  end;
end;

procedure TDMContratoFecha.QGeraCRCadAfterPost(DataSet: TDataSet);
begin
  if QGeraCRMovCadCod_Conta_Receber_Mov.Value=0 then // Verificar se existe algum Registro
    begin
      QGeraCRMovCad.Insert; // inserção do Movimento
      QGeraCRMovCadVAL_MOVIMENTO.Value := QGeraCRCadVal_Titulo.Value;
      QGeraCRMovCadIND_TIPO_MOVIMENTO.Value := 'PRINCIPAL';
      QGeraCRMovCad.Post;
    end;
end;

procedure TDMContratoFecha.QGeraCRCadBeforeEdit(DataSet: TDataSet);
begin
  If not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMContratoFecha.QGeraCRCadBeforeInsert(DataSet: TDataSet);
begin
  If not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMContratoFecha.QGeraCRCadBeforePost(DataSet: TDataSet);
var
  wDtCapitalizacao, wVlMovimento: String;
begin
  if QGeraCRCad.State = dsInsert then
  begin
    if DMParamSistema.QParamSistemaDT_FECHAMENTO_SISTEMA.Value >=  QGeraCRCadDT_EMISSAO.Value then
      Raise Exception.Create('Não é permitido incluir este título - Fechamento Contábil');

    QGeraCRCadDT_MOVIMENTO.Value := DMOracle.DataHoraServ;
    if QGeraCRCadNUM_TITULO.Value=0 then
      QGeraCRCadNUM_TITULO.Value := DMSequencia.Sequencia(Trunc(QGeraCRCadCOD_FILIAL.Value),'Num_Titulo_CR');
    if QGeraCRCadVAL_ORIGINAL.IsNull then
      QGeraCRCadVAL_ORIGINAL.value := QGeraCRCadVAL_TITULO.Value;
    QGeraCRCadDT_CAPITALIZACAO_MOEDA.value := QGeraCRCadDT_EMISSAO.Value;
  end;
  if ((QGeraCRCadVAL_ORIGINAL.Value = QGeraCRCadVAL_TITULO.Value) and
     (QGeraCRCadVAL_JUROS.Value = 0) and (QGeraCRCadIND_SITUACAO.Value = 'ABERTO')) or
     (QGeraCRCadDT_CAPITALIZACAO.Text = '') then
  begin
    wVlMovimento := DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_RECEBER_MOV','COD_CONTA_RECEBER_CAB  = '+QGeraCRCadCod_Conta_Receber_Cab.Text + ' and IND_TIPO_MOVIMENTO <> '+Chr(39)+'PRINCIPAL'+Chr(39));
    if wVlMovimento = '' then
      if DMOracle.FastSelect('IND_ENCARGO', 'TB_FINALIDADE',
          'COD_FINALIDADE = ' + FloatToStr(QGeraCRCadCOD_FINALIDADE.Value), True) = 'EMISSAO' then
        QGeraCRCadDT_CAPITALIZACAO.Value := QGeraCRCadDT_EMISSAO.Value
      Else
        QGeraCRCadDT_CAPITALIZACAO.Value := QGeraCRCadDT_VENCIMENTO.Value; 
  end
  else
  begin
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MOINHO' then
    begin
      wDtCapitalizacao := DMOracle.BuscaNome('SELECT MAX(DT_MOVIMENTO) FROM TB_CONTA_RECEBER_MOV','COD_CONTA_RECEBER_CAB  = '+QGeraCRCadCod_Conta_Receber_Cab.Text + ' and IND_TIPO_MOVIMENTO In ('+Chr(39)+'RECEBTO. PRINCIPAL'+Chr(39)+','+Chr(39)+'RECEBTO. JUROS'+Chr(39)+')');
      if wDtCapitalizacao <> '' then
        if StrToDate(wDtCapitalizacao) > QGeraCRCadDt_Capitalizacao.Value then
          QGeraCRCadDt_Capitalizacao.Value := StrToDate(wDtCapitalizacao);
    end;
  end;
  if QGeraCRCadDT_VENCIMENTO.Text = '' then
    raise Exception.Create('Contas a receber sem data de vencimento');
end;

procedure TDMContratoFecha.QGeraCRCadAfterClose(DataSet: TDataSet);
begin
  QGeraCRMovCad.Close;
end;

procedure TDMContratoFecha.QGeraCRCadAfterOpen(DataSet: TDataSet);
begin
  QGeraCRMovCad.Open;
end;

end.
