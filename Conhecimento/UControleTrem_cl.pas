unit UControleTrem_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, Oracle;

type
  TDMControleTrem = class(TDataModule)
    QControleTrem: TOracleDataSet1;
    QControleTremCons: TOracleDataSet1;
    QRControleTrem: TOracleDataSet1;
    QRControleTremCOD_CONTROLE_TREM: TIntegerField;
    QRControleTremCOD_REMETENTE: TIntegerField;
    QRControleTremCOD_DESTINATARIO: TIntegerField;
    QRControleTremCOD_EMPRESA: TIntegerField;
    QRControleTremNUM_FATURA: TIntegerField;
    QRControleTremNUM_DESPACHO: TIntegerField;
    QRControleTremVAL_TON: TFloatField;
    QRControleTremDT_VENCIMENTO: TDateTimeField;
    QRControleTremNUM_VAGAO: TIntegerField;
    QRControleTremDT_CONTROLE: TDateTimeField;
    QRControleTremDESC_FILIAL: TStringField;
    QRControleTremCOD_NOTA: TIntegerField;
    QRControleTremREMETENTE: TStringField;
    QRControleTremDESTINATARIO: TStringField;
    QRControleTremPESO_CHEGADA: TFloatField;
    QRControleTremPESO_SAIDA: TFloatField;
    QRControleTremDIF_PESO: TFloatField;
    QRControleTremPERC_VAR: TFloatField;
    QControleTremCOD_FLUXO_TREM: TIntegerField;
    QControleTremDT_ACORDO: TDateTimeField;
    QControleTremCOD_FILIAL: TIntegerField;
    QControleTremCOD_PRODUTO: TIntegerField;
    QControleTremVAL_TARIFA_TONELADA: TFloatField;
    QControleTremQT_QUANTIDADE: TFloatField;
    QControleTremCOD_CADASTRO_DESTINATARIO: TIntegerField;
    QControleTremCOD_USUARIO: TIntegerField;
    QControleTremDT_USUARIO: TDateTimeField;
    QControleTremCOD_MOTIVO: TIntegerField;
    QControleTremConsCOD_FLUXO_TREM: TIntegerField;
    QControleTremConsDT_ACORDO: TDateTimeField;
    QControleTremConsCOD_FILIAL: TIntegerField;
    QControleTremConsCOD_PRODUTO: TIntegerField;
    QControleTremConsVAL_TARIFA_TONELADA: TFloatField;
    QControleTremConsQT_QUANTIDADE: TFloatField;
    QControleTremConsCOD_CADASTRO_DESTINATARIO: TIntegerField;
    QControleTremConsCOD_USUARIO: TIntegerField;
    QControleTremConsDT_USUARIO: TDateTimeField;
    QControleTremConsCOD_MOTIVO: TIntegerField;
    QControleTremConsNOME: TStringField;
    QControleTremConsDESC_PRODUTO: TStringField;
    QVagao: TOracleDataSet1;
    QVagaoCOD_VAGAO: TIntegerField;
    QVagaoDT_VAGAO: TDateTimeField;
    QVagaoQT_QUANTIDADE: TFloatField;
    QVagaoQT_PESO_CHEGADA: TFloatField;
    QVagaoCOD_FLUXO_TREM: TIntegerField;
    QVagaoItem: TOracleDataSet1;
    QVagaoItemCOD_VAGAO_ITEM: TIntegerField;
    QVagaoItemCOD_VAGAO: TIntegerField;
    QVagaoItemCOD_NOTA: TIntegerField;
    QVagaoItemQT_PESO_SAIDA: TFloatField;
    QVagaoItemQT_PESO_CHEGADA: TFloatField;
    QVagaoItemnum_nota: TIntegerField;
    QVagaoItemdt_emissao_nota: TDateField;
    QVagaoItemqt_quantidade_nota: TFloatField;
    QVagaoCOD_USUARIO: TIntegerField;
    QVagaoDT_USUARIO: TDateTimeField;
    QRVagaoNota: TOracleDataSet1;
    QRVagaoNotaCOD_FLUXO_TREM: TIntegerField;
    QRVagaoNotaQT_PESO_SAIDA: TFloatField;
    QRVagaoNotaQT_PESO_CHEGADA: TFloatField;
    QRVagaoNotaNUM_NOTA: TIntegerField;
    QRVagaoNotaDT_EMISSAO: TDateTimeField;
    QRVagaoNotaQT_QUANTIDADE: TFloatField;
    QRVagaoNotaQT_PESO_CHEGADA_VAGAO: TFloatField;
    QFluxoNota: TOracleDataSet1;
    QFluxoNotaQUANTIDADE: TFloatField;
    QFluxoNotaNUM_NOTA: TIntegerField;
    QFluxoNotaDT_EMISSAO: TDateTimeField;
    QFluxoNotaNOTA_CAB: TIntegerField;
    QFluxoNotaqt_quantidade_nota: TIntegerField;
    QRVagaoNotadiferencapesonota: TFloatField;
    QRVagaoNotaDT_ACORDO: TDateTimeField;
    QRVagaoNotadiferencapesovagao: TFloatField;
    F: TStringField;
    QControleTremCOD_CADASTRO_ORIGEM: TIntegerField;
    QControleTremCOD_OPERACAO: TIntegerField;
    QControleTremCOD_TRIBUTACAO: TIntegerField;
    QControleTremIND_MODAL: TStringField;
    QVagaoNUM_VAGAO: TStringField;
    QControleTremcidade_origem: TIntegerField;
    QControleTremcidade_destino: TIntegerField;
    QControleTremDESC_FLUXO: TStringField;
    QControleTremConsDESC_FLUXO: TStringField;
    QControleTremConsCOD_CADASTRO_ORIGEM: TIntegerField;
    QControleTremConsCOD_OPERACAO: TIntegerField;
    QControleTremConsCOD_TRIBUTACAO: TIntegerField;
    QControleTremConsIND_MODAL: TStringField;
    QRVagaoNotaDESC_FLUXO: TStringField;
    QRVagaoNotaNUM_VAGAO: TStringField;
    QControleTremIND_SITUACAO: TStringField;
    QControleTremQT_QUANTIDADE_CANCELADA: TFloatField;
    QControleTremConsIND_SITUACAO: TStringField;
    QControleTremConsQT_QUANTIDADE_CANCELADA: TFloatField;
    QFluxoNotaCOD_NOTA_ITEM: TIntegerField;
    QFluxoNotaQT_CHEGADA: TFloatField;
    OPControleTrem: TOraclePackage;
    procedure QControleTremBeforePost(DataSet: TDataSet);
    procedure QVagaoItemCalcFields(DataSet: TDataSet);
    procedure QFluxoNotaCalcFields(DataSet: TDataSet);
    procedure QRVagaoNotaCalcFields(DataSet: TDataSet);
    procedure QControleTremCalcFields(DataSet: TDataSet);
    procedure QVagaoItemAfterPost(DataSet: TDataSet);
    procedure QVagaoItemAfterDelete(DataSet: TDataSet);
    procedure QControleTremAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMControleTrem: TDMControleTrem;

implementation

uses UOracle_cl, UUsuario_cl;

{$R *.dfm}

procedure TDMControleTrem.QControleTremBeforePost(DataSet: TDataSet);
begin
  QControleTremCod_Usuario.Value := DmUsuario.CodUsuarioCorrente;
  QControleTremDt_Usuario.Value := Date;

end;

procedure TDMControleTrem.QVagaoItemCalcFields(DataSet: TDataSet);
begin
  if QVagaoItemCOD_NOTA.Text <> '' then
  begin
    QVagaoItemnum_nota.Text           := DMOracle.BuscaNome('SELECT      NUM_NOTA FROM TB_NOTA_CAB', 'COD_NOTA_CAB = ' + QVagaoItemCOD_NOTA.Text);
    QVagaoItemdt_emissao_nota.Text    := DMOracle.BuscaNome('SELECT    DT_EMISSAO FROM TB_NOTA_CAB', 'COD_NOTA_CAB = ' + QVagaoItemCOD_NOTA.Text);
    QVagaoItemqt_quantidade_nota.Text := DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_NOTA_ITEM','COD_NOTA_CAB = ' + QVagaoItemCOD_NOTA.Text);
  end;
end;

procedure TDMControleTrem.QFluxoNotaCalcFields(DataSet: TDataSet);
begin
  QFluxoNotaqt_quantidade_nota.Text := DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_NOTA_ITEM','COD_NOTA_CAB = ' + QFluxoNotaNOTA_CAB.Text);
end;

procedure TDMControleTrem.QRVagaoNotaCalcFields(DataSet: TDataSet);
begin
  with DMControleTrem do
  begin
    QRVagaoNotadiferencapesonota.Value  := QRVagaoNotaQT_PESO_SAIDA.Value - QRVagaoNotaQT_PESO_CHEGADA.Value;
    QRVagaoNotadiferencapesovagao.Value := QRVagaoNotaQT_QUANTIDADE.Value - QRVagaoNotaQT_PESO_CHEGADA_VAGAO.Value;
  end;
end;

procedure TDMControleTrem.QControleTremCalcFields(DataSet: TDataSet);
begin
  with DMControleTrem do
  begin
    if Trim(QControleTremCOD_CADASTRO_ORIGEM.Text) <> '' then
      QControleTremcidade_origem.Text := DMOracle.BuscaNome('SELECT COD_CIDADE FROM TB_CADASTRO',  'TB_CADASTRO.COD_CADASTRO = ' + QControleTremCOD_CADASTRO_ORIGEM.Text);
    if Trim(QControleTremCOD_CADASTRO_DESTINATARIO.Text) <> '' then
      QControleTremcidade_destino.Text := DMOracle.BuscaNome('SELECT COD_CIDADE FROM TB_CADASTRO', 'TB_CADASTRO.COD_CADASTRO = ' + QControleTremCOD_CADASTRO_DESTINATARIO.Text);
  end;
end;

procedure TDMControleTrem.QVagaoItemAfterPost(DataSet: TDataSet);
begin
  QControleTremAfterPost(DataSet);
end;

procedure TDMControleTrem.QVagaoItemAfterDelete(DataSet: TDataSet);
begin
  QControleTremAfterPost(DataSet);
end;

procedure TDMControleTrem.QControleTremAfterPost(DataSet: TDataSet);
begin
  //Chama Procedure responsável pelo CONTROLE do STATUS do Controle de TREM, baseando-se na Qtde do Fluxo e na Qtde das Notas.
  //Camila - 30/10/2007
  OPControleTrem.CallProcedure('PROC_CONTROLE_STATUS_FLUXO', [QControleTremCOD_FLUXO_TREM.Value]);
  DMOracle.DBCemapa.Commit;
end;

end.
