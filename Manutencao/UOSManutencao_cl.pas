unit UOSManutencao_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMOSManutencao = class(TDataModule)
    QOSManutencao: TOracleDataSet1;
    QOSManutencaoItem: TOracleDataSet1;
    QOSManutencaoItemNUM_OS_MANUTENCAO: TIntegerField;
    QOSManutencaoItemCOD_PROCEDIMENTO_CAB: TIntegerField;
    QOSManutencaoMov: TOracleDataSet1;
    QOSManutencaoMovCOD_ATIVIDADE_CAB: TIntegerField;
    QOSManutencaoMovDT_ATIVIDADE: TDateTimeField;
    QOSManutencaoMovNUM_OS_MANUTENCAO: TIntegerField;
    QOSManutencaoMovCOD_FUNCIONARIO: TIntegerField;
    QOSManutencaoMovDESC_HORA_INI: TStringField;
    QOSManutencaoMovDESC_HORA_FIM: TStringField;
    QOSManutencaoMovDESC_OBS: TStringField;
    QOSManutencaoMovDESC_COMPLEMENTO: TStringField;
    QOSManutencaodesc_equipamento: TStringField;
    QOSManutencaodesc_equipamento_item: TStringField;
    QOSManutencaodesc_tipo_servico: TStringField;
    QOSManutencaodesc_prioridade: TStringField;
    QOSManutencaoItemdesc_procedimento: TStringField;
    DSOSManutencaoItem: TDataSource;
    QOSManutencaoCons: TOracleDataSet1;
    QOSManutencaoConsNUM_OS_MANUTENCAO: TIntegerField;
    QOSManutencaoConsCOD_EQUIPAMENTO_CAB: TStringField;
    QOSManutencaoConsCOD_EQUIPAMENTO_ITEM: TStringField;
    QOSManutencaoConsCOD_PRIORIDADE: TStringField;
    QOSManutencaoConsCOD_TIPO_SERVICO: TStringField;
    QOSManutencaoConsDT_EMISSAO: TDateTimeField;
    QOSManutencaoConsDT_PREVISTA: TDateTimeField;
    QOSManutencaoConsDT_ENCERRAMENTO: TDateTimeField;
    QOSManutencaoMovdesc_atividade: TStringField;
    QOSManutencaoMovdesc_funcionario: TStringField;
    DSOSManutencaoMov: TDataSource;
    QROSFormulario: TOracleDataSet1;
    QROSFormularioNUM_OS_MANUTENCAO: TIntegerField;
    QROSFormularioCOD_EQUIPAMENTO_CAB: TStringField;
    QROSFormularioCOD_EQUIPAMENTO_ITEM: TStringField;
    QROSFormularioCOD_TIPO_SERVICO: TStringField;
    QROSFormularioDT_EMISSAO: TDateTimeField;
    QROSFormularioDT_PREVISTA: TDateTimeField;
    QROSFormularioCOD_PRIORIDADE: TStringField;
    QROSFormularioCOD_PROCEDIMENTO_CAB: TIntegerField;
    QROSFormularioDESC_TIPO_SERVICO: TStringField;
    QROSFormularioDESC_EQUIPAMENTO_ITEM: TStringField;
    QROSFormularioDESC_EQUIPAMENTO: TStringField;
    QROSFormularioDESC_PROCEDIMENTO: TStringField;
    QROSFormularioCOD_ATIVIDADE_CAB: TIntegerField;
    QROSFormularioDESC_ATIVIDADE: TStringField;
    QROSFormularioDESC_PRIORIDADE: TStringField;
    QOSManutencaoConsNUM_DIAS: TIntegerField;
    QOSManutencaoItemCons: TOracleDataSet1;
    QOSManutencaoItemConsNUM_OS_MANUTENCAO: TIntegerField;
    QOSManutencaoItemConsCOD_PROCEDIMENTO_CAB: TIntegerField;
    QNumOS: TOracleDataSet1;
    QNumOSNUM_OS_MANUTENCAO: TFloatField;
    QGeraOS: TOracleDataSet1;
    QOSManutencaoNUM_OS_MANUTENCAO: TIntegerField;
    QOSManutencaoCOD_EQUIPAMENTO_CAB: TStringField;
    QOSManutencaoCOD_EQUIPAMENTO_ITEM: TStringField;
    QOSManutencaoCOD_PRIORIDADE: TStringField;
    QOSManutencaoCOD_TIPO_SERVICO: TStringField;
    QOSManutencaoDT_EMISSAO: TDateTimeField;
    QOSManutencaoDT_PREVISTA: TDateTimeField;
    QOSManutencaoDT_ENCERRAMENTO: TDateTimeField;
    QOSManutencaoNUM_DIAS: TIntegerField;
    QGeraOSNUM_OS_MANUTENCAO: TIntegerField;
    QGeraOSCOD_EQUIPAMENTO_CAB: TStringField;
    QGeraOSCOD_EQUIPAMENTO_ITEM: TStringField;
    QGeraOSCOD_PRIORIDADE: TStringField;
    QGeraOSCOD_TIPO_SERVICO: TStringField;
    QGeraOSDT_EMISSAO: TDateTimeField;
    QGeraOSDT_PREVISTA: TDateTimeField;
    QGeraOSDT_ENCERRAMENTO: TDateTimeField;
    QGeraOSNUM_DIAS: TIntegerField;
    QOSManutencaoDESC_SERVICO: TStringField;
    QOSManutencaoAtiv: TOracleDataSet1;
    QOSManutencaoAtivCOD_OS_MANUTENCAO_ATIV: TIntegerField;
    QOSManutencaoAtivNUM_OS_MANUTENCAO: TIntegerField;
    QOSManutencaoAtivCOD_ATIVIDADE_CAB: TIntegerField;
    QOSManutencaoAtivdesc_atividade: TStringField;
    DSOSManutencaoAtiv: TDataSource;
    QOSManutencaoPeca: TOracleDataSet1;
    QOSManutencaoPecaCOD_OS_MANUTENCAO_PECA: TIntegerField;
    QOSManutencaoPecaCOD_PRODUTO: TIntegerField;
    QOSManutencaoPecaQT_QUANTIDADE: TFloatField;
    QOSManutencaoPecaVAL_UNITARIO: TFloatField;
    QOSManutencaoPecasVal_total: TFloatField;
    QROSManutencaoPeca: TOracleDataSet1;
    QROSManutencaoPecaCOD_OS_MANUTENCAO_PECA: TIntegerField;
    QROSManutencaoPecaCOD_PRODUTO: TIntegerField;
    QROSManutencaoPecaQT_QUANTIDADE: TFloatField;
    QROSManutencaoPecaVAL_UNITARIO: TFloatField;
    QROSManutencaoPecasDesc_produto: TStringField;
    QOSManutencaoCOD_DEPARTAMENTO: TIntegerField;
    QROSFormularioCOD_DEPARTAMENTO: TIntegerField;
    QROSFormularioDESC_DEPARTAMENTO: TStringField;
    procedure QOSManutencaoAfterDelete(DataSet: TDataSet);
    procedure QOSManutencaoAfterPost(DataSet: TDataSet);
    procedure QOSManutencaoAfterCancel(DataSet: TDataSet);
    procedure QOSManutencaoAfterOpen(DataSet: TDataSet);
    procedure QOSManutencaoAfterInsert(DataSet: TDataSet);
    procedure DSOSManutencaoItemStateChange(Sender: TObject);
    procedure QOSManutencaoItemAfterInsert(DataSet: TDataSet);
    procedure QOSManutencaoItemBeforeInsert(DataSet: TDataSet);
    procedure QOSManutencaoItemCalcFields(DataSet: TDataSet);
    procedure QOSManutencaoMovAfterInsert(DataSet: TDataSet);
    procedure QOSManutencaoMovCalcFields(DataSet: TDataSet);
    procedure QOSManutencaoCalcFields(DataSet: TDataSet);
    procedure QOSManutencaoAtivAfterInsert(DataSet: TDataSet);
    procedure QOSManutencaoAtivCalcFields(DataSet: TDataSet);
    procedure QOSManutencaoBeforePost(DataSet: TDataSet);
    procedure QOSManutencaoPecaCalcFields(DataSet: TDataSet);
    procedure QROSManutencaoPecaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMOSManutencao: TDMOSManutencao;

implementation

uses UOracle_cl, UOSManutencaoCad;

{$R *.DFM}

procedure TDMOSManutencao.QOSManutencaoAfterDelete(DataSet: TDataSet);
begin
  QOSManutencaoItem.Close;
  QOSManutencaoItem.setVariable('NUM_OS_MANUTENCAO',QOSManutencaoNum_OS_Manutencao.Value);
  QOSManutencaoItem.Open;
end;

procedure TDMOSManutencao.QOSManutencaoAfterPost(DataSet: TDataSet);
begin
  QOSManutencaoItem.Close;
  QOSManutencaoItem.setVariable('NUM_OS_MANUTENCAO',QOSManutencaoNum_OS_Manutencao.Value);
  QOSManutencaoItem.Open;
end;

procedure TDMOSManutencao.QOSManutencaoAfterCancel(DataSet: TDataSet);
begin
  QOSManutencaoItem.Close;
  QOSManutencaoItem.setVariable('NUM_OS_MANUTENCAO',QOSManutencaoNum_OS_Manutencao.Value);
  QOSManutencaoItem.Open;
end;

procedure TDMOSManutencao.QOSManutencaoAfterOpen(DataSet: TDataSet);
begin
  QOSManutencaoItem.Close;
  QOSManutencaoItem.setVariable('NUM_OS_MANUTENCAO',QOSManutencaoNUM_OS_MANUTENCAO.Value);
  QOSManutencaoItem.Open;
end;

procedure TDMOSManutencao.QOSManutencaoAfterInsert(DataSet: TDataSet);
begin
  QOSManutencaoDt_Emissao.Value := Date;
end;

procedure TDMOSManutencao.DSOSManutencaoItemStateChange(Sender: TObject);
begin
  If DSOSManutencaoItem.State in [DSInsert,DSEdit] then
    begin
      FOSManutencaoCad.BTProcedimentoCons.Enabled:=True;
    end
  Else
    begin
      FOSManutencaoCad.BTProcedimentoCons.Enabled:=False;
    end;
end;

procedure TDMOSManutencao.QOSManutencaoItemAfterInsert(DataSet: TDataSet);
begin
  QOSManutencaoItemNum_OS_Manutencao.Value := QOSManutencaoNum_OS_Manutencao.Value;
end;

procedure TDMOSManutencao.QOSManutencaoItemBeforeInsert(DataSet: TDataSet);
begin
  if QOSManutencao.State in [DSInsert,DSEdit] then
    QOSManutencao.Post;
end;

procedure TDMOSManutencao.QOSManutencaoItemCalcFields(DataSet: TDataSet);
begin
  if QOSManutencaoItemCod_Procedimento_Cab.Text <> '' then
    QOSManutencaoItemdesc_procedimento.Value:= DMOracle.BuscaNome('SELECT TB_PROCEDIMENTO.DESC_PROCEDIMENTO FROM TB_PROCEDIMENTO',
                                                                  'COD_PROCEDIMENTO_CAB = '+QOSManutencaoItemCod_Procedimento_Cab.Text);
end;

procedure TDMOSManutencao.QOSManutencaoMovAfterInsert(DataSet: TDataSet);
begin
  QOSManutencaoMovNum_OS_Manutencao.Value := QOSManutencaoNum_OS_Manutencao.Value;
end;

procedure TDMOSManutencao.QOSManutencaoMovCalcFields(DataSet: TDataSet);
begin
  if QOSManutencaoMovCod_Atividade_Cab.Text <> '' then
    QOSManutencaoMovdesc_atividade.Value:= DMOracle.BuscaNome('SELECT TB_ATIVIDADE_CAB.DESC_ATIVIDADE'+
                                                               ' FROM TB_ATIVIDADE_CAB','COD_ATIVIDADE_CAB = '
                                                               +QOSManutencaoMovCod_Atividade_Cab.Text);
    if QOSManutencaoMovCod_Funcionario.Text <> '' then
    QOSManutencaoMovdesc_funcionario.Value:= DMOracle.BuscaNome('SELECT DESC_FUNCIONARIO'+
                                                               ' FROM TB_FUNCIONARIO','COD_FUNCIONARIO = '
                                                               +QOSManutencaoMovCod_Funcionario.Text);
end;

procedure TDMOSManutencao.QOSManutencaoCalcFields(DataSet: TDataSet);
begin
  if QOSManutencaoCod_Equipamento_Cab.Text <> '' then
    QOSManutencaodesc_equipamento.Value:= DMOracle.BuscaNome('SELECT DESC_EQUIPAMENTO'+
                                                               ' FROM TB_EQUIPAMENTO_CAB','COD_EQUIPAMENTO_CAB = '
                                                               +CHR(39)+QOSManutencaoCod_Equipamento_Cab.Text+CHR(39));
  if QOSManutencaoCod_Equipamento_Item.Text <> '' then
    QOSManutencaodesc_equipamento_item.Value:= DMOracle.BuscaNome('SELECT DESC_EQUIPAMENTO_ITEM'+
                                                               ' FROM TB_EQUIPAMENTO_ITEM','COD_EQUIPAMENTO_ITEM = '
                                                               +CHR(39)+QOSManutencaoCod_Equipamento_Item.Text+CHR(39));
  if QOSManutencaoCod_Prioridade.Text <> '' then
    QOSManutencaodesc_prioridade.Value:= DMOracle.BuscaNome('SELECT DESC_PRIORIDADE'+
                                                               ' FROM TB_PRIORIDADES','COD_PRIORIDADE = '
                                                               +CHR(39)+QOSManutencaoCod_Prioridade.Text+CHR(39));
  if QOSManutencaoCod_Tipo_Servico.Text <> '' then
    QOSManutencaodesc_tipo_servico.Value:= DMOracle.BuscaNome('SELECT DESC_TIPO_SERVICO'+
                                                               ' FROM TB_TIPO_SERVICO','COD_TIPO_SERVICO = '
                                                               +CHR(39)+QOSManutencaoCod_Tipo_Servico.Text+CHR(39));

end;

procedure TDMOSManutencao.QOSManutencaoAtivAfterInsert(DataSet: TDataSet);
begin
  QOSManutencaoAtivNum_OS_Manutencao.Value := QOSManutencaoNum_OS_Manutencao.Value;
end;

procedure TDMOSManutencao.QOSManutencaoAtivCalcFields(DataSet: TDataSet);
begin
  if trim(QOSManutencaoAtivCod_Atividade_Cab.Text) <> '' then
  QOSManutencaoAtivDesc_Atividade.Value := DMOracle.BuscaNome('SELECT DESC_Atividade FROM TB_Atividade_cab','cod_Atividade_cab = '+trim(QOSManutencaoAtivCod_Atividade_Cab.Text));
end;

procedure TDMOSManutencao.QOSManutencaoBeforePost(DataSet: TDataSet);
begin
  //if (QOSManutencaoCod_Equipamento_Cab.Text <> '') and (QOSManutencaoCod_Equipamento_Cab.Text <> '') then
    //raise exception.create('Impossível Cadastrar O.S referente a Equipamento e Item simultaneamente');
end;

procedure TDMOSManutencao.QOSManutencaoPecaCalcFields(DataSet: TDataSet);
begin
  QOSManutencaoPecasVal_total.Value :=
  QOSManutencaoPecaQT_QUANTIDADE.Value * QOSManutencaoPecaVAL_UNITARIO.Value;
end;

procedure TDMOSManutencao.QROSManutencaoPecaCalcFields(DataSet: TDataSet);
begin
  QROSManutencaoPecasDesc_produto.Text :=
  DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + QROSManutencaoPecaCOD_PRODUTO.Text);
end;

end.
