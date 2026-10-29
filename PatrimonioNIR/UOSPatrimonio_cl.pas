unit UOSPatrimonio_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMOSPatrimonio = class(TDataModule)
    QOSPatrimonio: TOracleDataSet1;
    QOSPatrimonioNUM_OS_CAB: TIntegerField;
    QOSPatrimonioCOD_DEPARTAMENTO: TIntegerField;
    QOSPatrimonioCOD_FUNCIONARIO: TIntegerField;
    QOSPatrimonioCOD_PATRIMONIO_ITEM: TStringField;
    QOSPatrimonioCOD_PRIORIDADE: TStringField;
    QOSPatrimonioCOD_TIPO_SERVICO: TStringField;
    QOSPatrimonioDT_PREVISTA: TDateTimeField;
    QOSPatrimonioItem: TOracleDataSet1;
    QOSPatrimonioItemCOD_PROCEDIMENTO: TFloatField;
    QOSPatrimonioItemNUM_OS_CAB: TFloatField;
    QOSPatrimonioDESC_DEPARTAMENTO: TStringField;
    QOSPatrimonioDESC_FUNCIONARIO: TStringField;
    QOSPatrimonioDESC_PATRIMONIO_ITEM: TStringField;
    QOSPatrimonioDESC_PRIORIDADE: TStringField;
    QOSPatrimonioDESC_TIPO_SERVICO: TStringField;
    QOSPatrimonioItemDESC_PROCEDIMENTO: TStringField;
    QOSPatrimonioCons: TOracleDataSet1;
    QOSPatrimonioConsNUM_OS_CAB: TIntegerField;
    QOSPatrimonioConsCOD_DEPARTAMENTO: TIntegerField;
    QOSPatrimonioConsCOD_FUNCIONARIO: TIntegerField;
    QOSPatrimonioConsCOD_PATRIMONIO_ITEM: TStringField;
    QOSPatrimonioConsCOD_PRIORIDADE: TStringField;
    QOSPatrimonioConsCOD_TIPO_SERVICO: TStringField;
    QOSPatrimonioConsDT_PREVISTA: TDateTimeField;
    QOSPatrimonioConsDT_ENCERRAMENTO: TDateTimeField;
    QROSPatrimonio: TOracleDataSet1;
    QOSPatrimonioConsDESC_FUNCIONARIO: TStringField;
    QOSPatrimonioConsDESC_DEPARTAMENTO: TStringField;
    QOSPatrimonioConsDESC_PATRIMONIO_ITEM: TStringField;
    QOSPatrimonioDT_ENCERRAMENTO: TDateTimeField;
    QOSPatrimonioItemCons: TOracleDataSet1;
    QOSPatrimonioItemConsCOD_PROCEDIMENTO: TFloatField;
    QOSPatrimonioItemConsNUM_OS_CAB: TFloatField;
    QRHistoricoEquipamento: TOracleDataSet1;
    QRHistoricoEquipamentoCOD_PATRIMONIO_ITEM: TStringField;
    QRHistoricoEquipamentoDESC_PATRIMONIO_ITEM: TStringField;
    QRHistoricoEquipamentoNUM_OS_CAB: TIntegerField;
    QRHistoricoEquipamentoCOD_TIPO_SERVICO: TStringField;
    QRHistoricoEquipamentoCOD_PROCEDIMENTO: TFloatField;
    QRHistoricoEquipamentoDT_ENCERRAMENTO: TDateTimeField;
    QROSAberto: TOracleDataSet1;
    QROSAbertoNUM_OS_CAB: TIntegerField;
    QROSAbertoCOD_DEPARTAMENTO: TIntegerField;
    QROSAbertoCOD_FUNCIONARIO: TIntegerField;
    QROSAbertoCOD_PATRIMONIO_ITEM: TStringField;
    QROSAbertoCOD_PRIORIDADE: TStringField;
    QROSAbertoCOD_TIPO_SERVICO: TStringField;
    QROSAbertoDT_PREVISTA: TDateTimeField;
    QROSAbertoDT_ENCERRAMENTO: TDateTimeField;
    QROSAbertoDESC_PATRIMONIO_ITEM: TStringField;
    QROSAbertoDESC_TIPO_SERVICO: TStringField;
    QROSAbertoDESC_DEPARTAMENTO: TStringField;
    QROSAbertoDESC_FUNCIONARIO: TStringField;
    QROSAbertoCOD_PROCEDIMENTO: TFloatField;
    QOSPatrimonioDT_EMISSAO: TDateTimeField;
    QROSAbertoDT_EMISSAO: TDateTimeField;
    QROSAbertoDESC_PROCEDIMENTO: TStringField;
    QRHistoricoEquipamentoDESC_PROCEDIMENTO: TStringField;
    QEncerramentoDescProcedimento: TOracleDataSet1;
    QEncerramentoDescProcedimentoCOD_PROCEDIMENTO_CAB: TIntegerField;
    QEncerramentoDescProcedimentoDESC_PROCEDIMENTO: TStringField;
    QOSPatrimonioItemDESC_OBSERVACAO: TStringField;
    QOSPatrimonioItemDESC_COMPLEMENTO1: TStringField;
    QOSPatrimonioItemDESC_COMPLEMENTO2: TStringField;
    QOSPatrimonioNUM_DIAS: TIntegerField;
    QOSPatrimonioConsNUM_DIAS: TIntegerField;
    QOSPatrimonioConsDT_EMISSAO: TDateTimeField;
    QRHistoricoEquipamentoDESC_OBSERVACAO: TStringField;
    QRHistoricoEquipamentoDESC_COMPLEMENTO1: TStringField;
    QRHistoricoEquipamentoDESC_COMPLEMENTO2: TStringField;
    QOSPatrimonioItemConsDESC_OBSERVACAO: TStringField;
    QOSPatrimonioItemConsDESC_COMPLEMENTO1: TStringField;
    QOSPatrimonioItemConsDESC_COMPLEMENTO2: TStringField;
    DSOSPatrimonioItem: TDataSource;
    QRFormularioOS: TOracleDataSet1;
    QRFormularioOSNUM_OS_CAB: TIntegerField;
    QRFormularioOSCOD_TIPO_SERVICO: TStringField;
    QRFormularioOSCOD_DEPARTAMENTO: TIntegerField;
    QRFormularioOSCOD_FUNCIONARIO: TIntegerField;
    QRFormularioOSDT_ENCERRAMENTO: TDateTimeField;
    QRFormularioOSDT_PREVISTA: TDateTimeField;
    QRFormularioOSDESC_PATRIMONIO_ITEM: TStringField;
    QRFormularioOSDESC_TIPO_SERVICO: TStringField;
    QRFormularioOSCOD_PROCEDIMENTO: TFloatField;
    QRFormularioOSDESC_PROCEDIMENTO: TStringField;
    QRFormularioOSDESC_DEPARTAMENTO: TStringField;
    QRFormularioOSDESC_FUNCIONARIO: TStringField;
    QRFormularioOSCOD_ATIVIDADE_CAB: TIntegerField;
    QRFormularioOSDESC_ATIVIDADE: TStringField;
    QRFormularioOSCOD_CATEGORIA: TStringField;
    QRFormularioOSDESC_CATEGORIA: TStringField;
    QRFormularioOSCOD_PRIORIDADE: TStringField;
    QRFormularioOSDESC_PRIORIDADE: TStringField;
    QROSPatrimonioNUM_OS_CAB: TIntegerField;
    QROSPatrimonioCOD_DEPARTAMENTO: TIntegerField;
    QROSPatrimonioCOD_FUNCIONARIO: TIntegerField;
    QROSPatrimonioCOD_PATRIMONIO_ITEM: TStringField;
    QROSPatrimonioCOD_PRIORIDADE: TStringField;
    QROSPatrimonioCOD_TIPO_SERVICO: TStringField;
    QROSPatrimonioDT_PREVISTA: TDateTimeField;
    QROSPatrimonioDT_ENCERRAMENTO: TDateTimeField;
    QROSPatrimonioDT_EMISSAO: TDateTimeField;
    QROSPatrimonioNUM_DIAS: TIntegerField;
    QROSPatrimonioDESC_PATRIMONIO_ITEM: TStringField;
    QROSPatrimonioDESC_TIPO_SERVICO: TStringField;
    QROSPatrimonioDESC_DEPARTAMENTO: TStringField;
    QROSPatrimonioDESC_FUNCIONARIO: TStringField;
    QROSPatrimonioDESC_PRIORIDADE: TStringField;
    QROSPatrimonioCOD_PROCEDIMENTO: TFloatField;
    QROSPatrimonioDESC_PROCEDIMENTO: TStringField;
    QROSPatrimonioDESC_OBSERVACAO: TStringField;
    QROSPatrimonioDESC_COMPLEMENTO1: TStringField;
    QROSPatrimonioDESC_COMPLEMENTO2: TStringField;
    QOSPatrimonioItemDESC_HORA_INI: TStringField;
    QOSPatrimonioItemDESC_HORA_FIM: TStringField;
    QOSPatrimonioItemDESC_HORA_INI_1: TStringField;
    QOSPatrimonioItemDESC_HORA_FIM_1: TStringField;
    QOSPatrimonioItemDESC_HORA_INI_2: TStringField;
    QOSPatrimonioItemDESC_HORA_FIM_2: TStringField;
    QOSPatrimonioDESC_OS_PATRIMONIO: TStringField;
    QROSAbertoDESC_OS_PATRIMONIO: TStringField;
    QOSPatrimonioConsDESC_OS_PATRIMONIO: TStringField;
    QRHistoricoEquipamentoDESC_OS_PATRIMONIO: TStringField;
    QROSPatrimonioDESC_OS_PATRIMONIO: TStringField;
    QRFormularioOSDESC_OS_PATRIMONIO: TStringField;
    QRFormularioOSCOD_PATRIMONIO_ITEM: TStringField;
    QOSdoDia: TOracleDataSet1;
    QOSdoDiaNUM_OS_CAB: TIntegerField;
    QOSdoDiaDESC_OS_PATRIMONIO: TStringField;
    QOSdoDiaCOD_TIPO_SERVICO: TStringField;
    QOSdoDiaCOD_PRIORIDADE: TStringField;
    QOSdoDiaDESC_PATRIMONIO_ITEM: TStringField;
    DSOSdoDia: TDataSource;
    procedure QOSPatrimonioCalcFields(DataSet: TDataSet);
    procedure QOSPatrimonioItemCalcFields(DataSet: TDataSet);
    procedure QOSPatrimonioItemBeforeInsert(DataSet: TDataSet);
    procedure QOSPatrimonioAfterEdit(DataSet: TDataSet);
    procedure QOSPatrimonioAfterInsert(DataSet: TDataSet);
    procedure QOSPatrimonioItemAfterInsert(DataSet: TDataSet);
    procedure QOSPatrimonioBeforeDelete(DataSet: TDataSet);
    procedure QOSPatrimonioBeforePost(DataSet: TDataSet);
    procedure DSOSPatrimonioItemStateChange(Sender: TObject);
    procedure DSItemPatrimonioStateChange(Sender: TObject);
    procedure QOSPatrimonioAfterOpen(DataSet: TDataSet);
    procedure QOSPatrimonioBeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMOSPatrimonio: TDMOSPatrimonio;

implementation

uses UOracle_cl, UOSPatrimonio;

{$R *.DFM}

procedure TDMOSPatrimonio.QOSPatrimonioCalcFields(DataSet: TDataSet);
begin
  QOSPatrimonioDesc_Departamento.Value := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+inttostr(QOSPATRIMONIOCOD_DEPARTAMENTO.Value));
  QOSPatrimonioDesc_Funcionario.Value := DMOracle.BuscaNome('SELECT DESC_FUNCIONARIO FROM TB_FUNCIONARIO','COD_FUNCIONARIO = '+inttostr(QOSPATRIMONIOCOD_FUNCIONARIO.Value));
  QOSPatrimonioDesc_Prioridade.Value := DMOracle.BuscaNome('SELECT DESC_PRIORIDADE FROM TB_PRIORIDADES','COD_PRIORIDADE = '+CHR(39)+QOSPATRIMONIOCOD_PRIORIDADE.Value+CHR(39));
  QOSPatrimonioDesc_Tipo_Servico.Value := DMOracle.BuscaNome('SELECT DESC_TIPO_SERVICO FROM TB_TIPO_SERVICO','COD_TIPO_SERVICO = '+CHR(39)+QOSPATRIMONIOCOD_TIPO_SERVICO.Value+CHR(39));
  QOSPatrimonioDesc_Patrimonio_ITEM.Value := DMOracle.BuscaNome('SELECT DESC_PATRIMONIO_ITEM FROM TB_PATRIMONIO_ITEM','COD_Patrimonio_Item = '+CHR(39)+QOSPATRIMONIOCOD_Patrimonio_Item.Value+CHR(39));
end;

procedure TDMOSPatrimonio.QOSPatrimonioItemCalcFields(DataSet: TDataSet);
begin
   QOSPatrimonioItemDesc_Procedimento.Value := DMOracle.BuscaNome('SELECT DESC_PROCEDIMENTO FROM TB_PROCEDIMENTO ','COD_PROCEDIMENTO_CAB = '+FloatToStr(QOSPatrimonioItemCod_Procedimento.value));

end;

procedure TDMOSPatrimonio.QOSPatrimonioItemBeforeInsert(DataSet: TDataSet);
begin
  if QOSPatrimonio.State = DsInsert then
     QOSPatrimonio.Post;

end;

procedure TDMOSPatrimonio.QOSPatrimonioAfterEdit(DataSet: TDataSet);
begin
  QOSPatrimonioItem.close;
  QOSPatrimonioItem.open;
end;

procedure TDMOSPatrimonio.QOSPatrimonioAfterInsert(DataSet: TDataSet);
begin
  QOSPatrimonioItem.close;
  QOSPatrimonioItem.open;
  QOSPatrimonioDT_Emissao.value:=Date;
end;

procedure TDMOSPatrimonio.QOSPatrimonioItemAfterInsert(DataSet: TDataSet);
begin
   QOSPatrimonioItemNum_Os_Cab.value:= QOSPatrimonioNum_OS_Cab.value;
end;

procedure TDMOSPatrimonio.QOSPatrimonioBeforeDelete(DataSet: TDataSet);
begin
   if(QOSPatrimonioItem.recordCount > 0) then
   Begin
     while not(QOSPatrimonioItem.eof) do
     begin
       QOSPatrimonioItem.next;
       QOSPatrimonioItem.delete;
     end;
  end;
end;

procedure TDMOSPatrimonio.QOSPatrimonioBeforePost(DataSet: TDataSet);
begin
  with DMOSPatrimonio do

end;
procedure TDMOSPatrimonio.DSOSPatrimonioItemStateChange(Sender: TObject);
begin
  If DSOSPatrimonioItem.State in [DSInsert] then
  begin
    FOSPatrimonio.BTProcedimento.enabled:=true;
    FOSPatrimonio.BTProcedimentoClick(self);
    FOSPatrimonio.BTProcedimento.enabled:=false;
  end
  else
    FOSPatrimonio.BTProcedimento.enabled:=false
end;

procedure TDMOSPatrimonio.DSItemPatrimonioStateChange(Sender: TObject);
begin
  If DSOSPatrimonioItem.State in [DSInsert] then
  begin
    FOSPatrimonio.BTProcedimento.enabled:=true;
    FOSPatrimonio.BTProcedimentoClick(self);
  end
  else
    FOSPatrimonio.BTProcedimento.enabled:=false
end;

procedure TDMOSPatrimonio.QOSPatrimonioAfterOpen(DataSet: TDataSet);
begin
  QOSPatrimonioItem.close;
  QOSPatrimonioItem.open;
end;

procedure TDMOSPatrimonio.QOSPatrimonioBeforeEdit(DataSet: TDataSet);
begin
  If QOSPatrimonioDT_Encerramento.text <> '' then
    Raise Exception.Create('Esta O.S já está encerrada!');
end;

end.
