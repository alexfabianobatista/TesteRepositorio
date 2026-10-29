unit UControleCarga_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMControleCarga = class(TDataModule)
    QControleCargaCad: TOracleDataSet1;
    QControleCargaCadCOD_CONTROLE_CARGA: TIntegerField;
    QControleCargaCadCOD_EMBARQUE: TIntegerField;
    QControleCargaCadDT_SAIDA: TDateTimeField;
    QControleCargaCadDT_VENCIMENTO: TDateTimeField;
    QControleCargaCadCOD_TRANSPORTADOR: TIntegerField;
    QControleCargaCadCOD_MOTORISTA: TIntegerField;
    QControleCargaCadDESC_VIAGEM_PARA: TStringField;
    QControleCargaCadVAL_RETORNO: TFloatField;
    QControleCargaCadKM_SAIDA: TIntegerField;
    QControleCargaCadKM_CHEGADA: TIntegerField;
    QControleCargaCadVAL_KM: TFloatField;
    QControleCargaCadVAL_AJUDA_CUSTO: TFloatField;
    QControleCargaCadVAL_ADTO_VIAGEM: TFloatField;
    QControleCargaCadDESC_OBSERVACAO: TStringField;
    QControleCargaCadDesc_transportador: TStringField;
    QControleCargaCadDesc_motorista: TStringField;
    QControleCargaCadKm_total: TIntegerField;
    QControleCargaCadVal_frete: TFloatField;
    QControleCargaCadSaldo_pagar: TFloatField;
    QcontroleCargaCons: TOracleDataSet1;
    QcontroleCargaConsCOD_CONTROLE_CARGA: TIntegerField;
    QcontroleCargaConsCOD_EMBARQUE: TIntegerField;
    QcontroleCargaConsDT_SAIDA: TDateTimeField;
    QcontroleCargaConsDT_VENCIMENTO: TDateTimeField;
    QcontroleCargaConsCOD_TRANSPORTADOR: TIntegerField;
    QcontroleCargaConsCOD_MOTORISTA: TIntegerField;
    QcontroleCargaConsDESC_VIAGEM_PARA: TStringField;
    QControleCargaCadCOD_CONTA_PAGAR_CAB: TIntegerField;
    QControleCargaCadIND_SITUACAO: TStringField;
    QControleCargaCadCOD_FILIAL: TIntegerField;
    QControleCargaCaddesc_filial: TStringField;
    procedure QControleCargaCadCalcFields(DataSet: TDataSet);
    procedure QControleCargaCadAfterPost(DataSet: TDataSet);
    procedure QControleCargaCadBeforeInsert(DataSet: TDataSet);
    procedure QControleCargaCadAfterCancel(DataSet: TDataSet);
    procedure QControleCargaCadAfterDelete(DataSet: TDataSet);
    procedure QControleCargaCadAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMControleCarga: TDMControleCarga;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMControleCarga.QControleCargaCadCalcFields(DataSet: TDataSet);
begin
  if QControleCargaCadCOD_TRANSPORTADOR.Text <> ''  then
    QControleCargaCadDesc_transportador.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + IntToStr(QControleCargaCadCOD_TRANSPORTADOR.Value));

  if QControleCargaCadCOD_MOTORISTA.Text <> '' then
    QControleCargaCadDesc_motorista.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + IntToStr(QControleCargaCadCOD_MOTORISTA.Value));

  if (QControleCargaCadKM_SAIDA.Text <> '') and (QControleCargaCadKM_CHEGADA.Text <> '') then
    QControleCargaCadKm_total.Value := QControleCargaCadKM_CHEGADA.Value - QControleCargaCadKM_SAIDA.Value;

  if (QControleCargaCadKm_total.Text <> '') and (QControleCargaCadVAL_KM.Text <> '') then
    QControleCargaCadVal_frete.Value := QControleCargaCadKm_total.Value * QControleCargaCadVAL_KM.Value;

  if QControleCargaCadCOD_FILIAL.Text <> ''  then
    QControleCargaCadDesc_filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + IntToStr(QControleCargaCadCOD_FILIAL.Value));

  if (QControleCargaCadVal_frete.Text <> '') and (QControleCargaCadVAL_ADTO_VIAGEM.Text <> '') and
     (QControleCargaCadVAL_AJUDA_CUSTO.Text <> '') then
    QControleCargaCadSaldo_pagar.Value := QControleCargaCadVal_frete.Value - QControleCargaCadVAL_ADTO_VIAGEM.Value -
                                          QControleCargaCadVAL_AJUDA_CUSTO.Value;
end;

procedure TDMControleCarga.QControleCargaCadAfterPost(DataSet: TDataSet);
Var wCodigo : Real;
begin
  wCodigo := QControleCargaCadCod_Controle_Carga.Value;
  QControleCargaCad.Close;
  QControleCargaCad.SetVariable('PK',wCodigo);
  QControleCargaCad.Open;
end;

procedure TDMControleCarga.QControleCargaCadBeforeInsert(
  DataSet: TDataSet);
begin
  If not DMOracle.DBCemapa.InTransaction Then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMControleCarga.QControleCargaCadAfterCancel(DataSet: TDataSet);
begin
  If DMOracle.DBCemapa.InTransaction Then
     DMOracle.DBCemapa.RollBack;

end;

procedure TDMControleCarga.QControleCargaCadAfterDelete(DataSet: TDataSet);
begin
  If DMOracle.DBCemapa.InTransaction Then
     DMOracle.DBCemapa.Commit;

end;

procedure TDMControleCarga.QControleCargaCadAfterInsert(DataSet: TDataSet);
begin
  //----------quando for inserir um novo registro mostra os campos de valores com 0.00
  if QControleCargaCad.State = dsInsert then
  begin
    QControleCargaCadVAL_RETORNO.Value := 0;
    QControleCargaCadVAL_KM.Value := 0;
    QControleCargaCadVAL_AJUDA_CUSTO.Value := 0;
    QControleCargaCadVAL_ADTO_VIAGEM.Value := 0;
  end;
end;

end.
