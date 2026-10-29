unit URegNota_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMRegNota = class(TDataModule)
    QNotaCab: TOracleDataSet1;
    QNotaItem: TOracleDataSet1;
    QNotaCabCOD_NOTA_CAB: TIntegerField;
    QNotaCabCOD_USUARIO: TIntegerField;
    QNotaCabCOD_FILIAL: TIntegerField;
    QNotaCabCOD_MENSAGEM: TIntegerField;
    QNotaCabCOD_TRANSPORTE: TIntegerField;
    QNotaCabCOD_OPERACAO: TIntegerField;
    QNotaCabCOD_ESTADO: TStringField;
    QNotaCabCOD_VENDEDOR: TIntegerField;
    QNotaCabCOD_CADASTRO: TIntegerField;
    QNotaCabCOD_SERIE: TStringField;
    QNotaCabIND_SITUACAO: TStringField;
    QNotaCabIND_CONDICAO_PAGTO: TStringField;
    QNotaCabDT_EMISSAO: TDateTimeField;
    QNotaCabDT_MOVIMENTO: TDateTimeField;
    QNotaCabDT_RECEBIMENTO: TDateTimeField;
    QNotaCabCOD_MOTIVO_CANC: TIntegerField;
    QNotaCabVAL_DESPESAS: TFloatField;
    QNotaCabIND_ENTRADA_SAIDA: TStringField;
    QNotaCabVAL_FRETE: TFloatField;
    QNotaCabVAL_DESCONTO: TFloatField;
    QNotaCabCOD_TRANSPORTADOR: TIntegerField;
    QNotaCabNUM_CONHECIMENTO_FRETE: TIntegerField;
    QNotaCabVAL_AVISTA: TFloatField;
    QNotaCabIND_TIPO_FRETE: TStringField;
    QNotaCabNUM_VOLUMES: TIntegerField;
    QNotaCabOBS: TStringField;
    QNotaCabOBS_COMPLEMENTO: TStringField;
    QNotaCabDT_USUARIO: TDateTimeField;
    QNotaCabCOD_TRIBUTACAO_FRETE: TIntegerField;
    QNotaCabVAL_TOTAL_IPI: TFloatField;
    QNotaCabVAL_ICM_FRETE: TFloatField;
    QNotaCabVAL_ICM_BASE_FRETE: TFloatField;
    QNotaCabVAL_FUNRURAL: TFloatField;
    QNotaCabDESC_PLACA: TStringField;
    QNotaCabDESC_TRANSPORTADORA: TStringField;
    QNotaCabCOD_NOTA_CONTA_CORRENTE: TIntegerField;
    QNotaCabDT_EMISSAO_CF: TDateTimeField;
    QNotaCabCOD_OPERACAO_CF: TIntegerField;
    QNotaCabNR_DIAS_CHEQUE: TIntegerField;
    QNotaCabCOD_CONTRATO_MOV: TIntegerField;
    QNotaCabCOD_CONTRATO_GP_MOV: TIntegerField;
    QNotaCabNR_DIAS_CHEQUE1: TIntegerField;
    QNotaCabNR_DIAS_CHEQUE2: TIntegerField;
    QNotaCabIND_NOTA_SEGURO: TStringField;
    QNotaCabCOD_CONTRATO_VEND: TIntegerField;
    QNotaCabNR_ROTA: TIntegerField;
    QNotaCabPERC_COMISSAO: TFloatField;
    QNotaCabIND_MILHAGEM: TStringField;
    QNotaCabNUM_OS: TIntegerField;
    QNotaCabCOD_DEPARTAMENTO: TIntegerField;
    QNotaCabVAL_PEDAGIO: TFloatField;
    QNotaCabCOD_VENDEDOR_PREPOSTO: TIntegerField;
    QNotaCabNR_DIAS_CHEQUE3: TIntegerField;
    QNotaCabVAL_FRETE_TON: TFloatField;
    QNotaCabDESC_OBS_CORPO_NOTA: TStringField;
    QNotaCabCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QNotaCabCOD_CADASTRO_PARCEIRO: TIntegerField;
    QNotaCabNUM_PEDIDO: TIntegerField;
    QNotaCabCOD_ORDEM_CARREGAMENTO_CAB: TIntegerField;
    QNotaItemCOD_NOTA_ITEM: TIntegerField;
    QNotaItemCOD_NOTA_CAB: TIntegerField;
    QNotaItemCOD_TRIBUTACAO: TIntegerField;
    QNotaItemQT_QUANTIDADE: TFloatField;
    QNotaItemVAL_TOTAL: TFloatField;
    QNotaItemPERC_IPI: TFloatField;
    QNotaItemPERC_COMISSAO: TFloatField;
    QNotaItemCOD_PRODUTO: TFloatField;
    QNotaItemCOD_LOTE_TIPO: TIntegerField;
    QNotaItemVAL_DESCONTO: TFloatField;
    QNotaItemVAL_DESPESAS: TFloatField;
    QNotaItemVAL_FRETE: TFloatField;
    QNotaItemPERC_DESCONTO: TFloatField;
    QNotaItemVAL_IPI: TFloatField;
    QNotaItemVAL_UNITARIO: TFloatField;
    QNotaItemVAL_ICM_BASE: TFloatField;
    QNotaItemVAL_ICM: TFloatField;
    QNotaItemIND_CLASS_IPI: TStringField;
    QNotaItemVAL_CUSTO: TFloatField;
    QNotaItemVAL_ISS: TFloatField;
    QNotaItemPERC_INSS: TFloatField;
    QNotaItemPERC_BENEFICIADO: TFloatField;
    QNotaItemIND_BX_CONTR_VEND: TStringField;
    QNotaItemNUM_NOTA_PRODUTOR: TIntegerField;
    QNotaItemIND_TIPO_CONSUMO: TStringField;
    QNotaItemQT_CHEGADA: TFloatField;
    QRegNotaCons: TOracleDataSet1;
    QRegNotaConsCOD_NOTA_CAB: TIntegerField;
    QRegNotaConsNUM_NOTA: TIntegerField;
    QRegNotaConsCOD_SERIE: TStringField;
    QRegNotaConsCOD_FILIAL: TIntegerField;
    QRegNotaConsDT_EMISSAO: TDateTimeField;
    QRegNotaConsDT_RECEBIMENTO: TDateTimeField;
    QRegNotaConsNOME: TStringField;
    QNotaCabNUM_NOTA: TFloatField;
    procedure QNotaItemBeforeInsert(DataSet: TDataSet);
    procedure QNotaItemAfterInsert(DataSet: TDataSet);
    procedure QNotaItemBeforeEdit(DataSet: TDataSet);
    procedure QNotaCabBeforeEdit(DataSet: TDataSet);
    procedure QNotaCabBeforeInsert(DataSet: TDataSet);
    procedure QNotaCabAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRegNota: TDMRegNota;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMRegNota.QNotaItemBeforeInsert(DataSet: TDataSet);
begin
  With DMRegNota Do
  Begin
    if(QNotaCab.State in [dsInsert,dsEdit])then
    Begin
      QNotaCab.Post;
      QNotaCab.RefreshRecord;
      QNotaCab.Edit;
    End;
  End;
end;

procedure TDMRegNota.QNotaItemAfterInsert(DataSet: TDataSet);
begin
  With DMRegNota Do
  Begin
    QNotaItemQT_QUANTIDADE.Value := 1;
    QNotaItemCOD_PRODUTO.Value := 1;
    QNotaItemPERC_IPI.Value := 0;
    QNotaItemPERC_COMISSAO.Value := 0;
    QNotaItemCOD_LOTE_TIPO.Value := 1;
    QNotaItemVAL_DESPESAS.Value := 0;
    QNotaItemVAL_FRETE.Value := 0;
    QNotaItemPERC_DESCONTO.Value := 0;
    QNotaItemVAL_IPI.Value := 0;
    QNotaItemVAL_UNITARIO.Value := 0;
    QNotaItemIND_CLASS_IPI.Value := '5';
    QNotaItemVAL_ISS.Value := 0;
    QNotaItemVAL_CUSTO.Value := 0;
  End;
end;

procedure TDMRegNota.QNotaItemBeforeEdit(DataSet: TDataSet);
begin
  With DMRegNota Do
  Begin
    if(QNotaCab.State in [dsInsert,dsEdit])then
    Begin
      QNotaCab.Post;
      QNotaCab.RefreshRecord;
    End;
    QNotaCab.Edit;
  End;
end;

procedure TDMRegNota.QNotaCabBeforeEdit(DataSet: TDataSet);
begin
  If not DMOracle.DBCemapa.InTransaction Then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMRegNota.QNotaCabBeforeInsert(DataSet: TDataSet);
begin
  If not DMOracle.DBCemapa.InTransaction Then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMRegNota.QNotaCabAfterPost(DataSet: TDataSet);
begin
  QNotaCab.SetVariable('PK',QNotaCabCOD_NOTA_CAB.Text);
end;

end.
