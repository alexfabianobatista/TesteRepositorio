unit UEstado_cl;

interface
                           
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMEstado = class(TDataModule)
    QEstado: TOracleDataSet1;
    QEstadoCons: TOracleDataSet1;
    QEstadoConsCOD_ESTADO: TStringField;
    QEstadoConsDESC_ESTADO: TStringField;
    QEstadoConsPERC_TRIBUTACAO: TFloatField;
    QEstadoConsPERC_FRETE: TFloatField;
    QEstadoCOD_ESTADO: TStringField;
    QEstadoDESC_ESTADO: TStringField;
    QEstadoPERC_TRIBUTACAO: TFloatField;
    QEstadoDESC_SIGLA_ESTADO: TStringField;
    QEstadoPERC_FRETE: TFloatField;
    QREstado: TOracleDataSet1;
    QREstadoCOD_ESTADO: TStringField;
    QREstadoDESC_ESTADO: TStringField;
    QREstadoPERC_TRIBUTACAO: TFloatField;
    QREstadoPERC_FRETE: TFloatField;
    QREstadoDESC_SIGLA_ESTADO: TStringField;
    QEstadodesc_tributacao: TStringField;
    QEstadoPERC_BASE_SUBST: TFloatField;
    QEstadoPERC_ALIQ_SUBST: TFloatField;
    QEstadoDESC_INSCRICAO_SUBST: TStringField;
    QEstadoCOD_UF_IBGE: TIntegerField;
    QEstadoCOD_GI: TIntegerField;
    DSEstadoRel: TDataSource;
    QEstadoPERC_REDUCAO_ICMS_SUBST: TFloatField;
    QEstadoPERC_ALIQ_ICMS_SIMPLES: TFloatField;
    QEstadoPERC_TRIBUTADO_SN: TFloatField;
    QEstadoPERC_ALIQUOTA_DIFERENCIAL: TFloatField;
    QFundoCombatePobreza: TOracleDataSet1;
    QFundoCombatePobrezaCOD_FUNDO_COMBATE_POBREZA: TIntegerField;
    QFundoCombatePobrezaCOD_ESTADO: TStringField;
    QFundoCombatePobrezaPERC_FCP_UF_DEST: TFloatField;
    QFundoCombatePobrezadesc_produto: TStringField;
    QEstadoConsCOD_UF_IBGE: TIntegerField;
    QFundoCombatePobrezaCOD_PRODUTO: TFloatField;
    QEstadoPERC_IBS_UF: TFloatField;
    procedure QEstadoAfterPost(DataSet: TDataSet);
    procedure QEstadoCalcFields(DataSet: TDataSet);
    procedure QFundoCombatePobrezaCalcFields(DataSet: TDataSet);
    procedure QFundoCombatePobrezaAfterInsert(DataSet: TDataSet);
    procedure QFundoCombatePobrezaAfterPost(DataSet: TDataSet);
    procedure QFundoCombatePobrezaBeforeDelete(DataSet: TDataSet);
    procedure QFundoCombatePobrezaBeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMEstado: TDMEstado;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMEstado.QEstadoAfterPost(DataSet: TDataSet);
begin
  //QEstado.Close;
  //QEstado.Open;
  QEstado.SetVariable('COD_ESTADO',QEstadoCod_Estado.Value);
end;

procedure TDMEstado.QEstadoCalcFields(DataSet: TDataSet);
begin
  If QEstadoPerc_Tributacao.Value <> 0 Then
     QEstadoDesc_Tributacao.Value := DMOracle.BuscaNome('SELECT DESC_TRIBUTACAO FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+FloatToStr(Trunc(QEstadoPerc_Tributacao.Value)),True);

end;

procedure TDMEstado.QFundoCombatePobrezaCalcFields(DataSet: TDataSet);
begin
  if (not QFundoCombatePobrezaCOD_PRODUTO.IsNull) and (QFundoCombatePobrezaCOD_PRODUTO.Value <> 0) then
    QFundoCombatePobrezadesc_produto.Value := DMOracle.FastSelect('DESC_PRODUTO','TB_PRODUTO', 'COD_PRODUTO = '+QFundoCombatePobrezaCOD_PRODUTO.Text);
end;

procedure TDMEstado.QFundoCombatePobrezaAfterInsert(DataSet: TDataSet);
begin
  QFundoCombatePobrezaCOD_ESTADO.Value := QEstadoCOD_ESTADO.Value;
end;

procedure TDMEstado.QFundoCombatePobrezaAfterPost(DataSet: TDataSet);
var wCodigo: Real;
begin
  wCodigo := QFundoCombatePobrezaCOD_FUNDO_COMBATE_POBREZA.Value;

  QFundoCombatePobreza.DisableControls;
  if QFundoCombatePobreza.RecordCount < 2 then
  begin
    QEstado.Post;
    QEstado.Edit;
  end;
  QFundoCombatePobreza.Locate('COD_FUNDO_COMBATE_POBREZA', wCodigo, []);
  QFundoCombatePobreza.EnableControls;
end;

procedure TDMEstado.QFundoCombatePobrezaBeforeDelete(DataSet: TDataSet);
begin
  if QEstado.State <> dsEdit then
    raise Exception.Create('Estado não está no modo de alteração!');
  if QFundoCombatePobreza.State in [dsEdit, dsInsert] then
    QFundoCombatePobreza.Cancel;
end;

procedure TDMEstado.QFundoCombatePobrezaBeforeEdit(DataSet: TDataSet);
begin
  if QEstado.State = dsInsert then
  begin
    QEstado.Post;
    QEstado.Edit;
  end;
  if QEstado.State <> dsEdit then
    raise Exception.Create('Estado não está no modo de alteração!');
end;

end.
