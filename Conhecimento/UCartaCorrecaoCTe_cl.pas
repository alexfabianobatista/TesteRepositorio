unit UCartaCorrecaoCTe_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, Provider, DBClient;

type
  TDMCartaCorrecaoCTe = class(TDataModule)
    QCartaCorrecaoCTe: TOracleDataSet;
    QCartaCorrecaoCTeDESC_CHAVE_ACESSO: TStringField;
    QCartaCorrecaoCTeNSEQ_EVENTO: TIntegerField;
    QCartaCorrecaoCTeDT_EVENTO: TDateTimeField;
    QCartaCorrecaoCTeTP_EVENTO: TIntegerField;
    QCartaCorrecaoCTeDESC_JUSTIFICATIVA: TStringField;
    QCartaCorrecaoCTeDESC_RETORNO_PROCESSAMENTO: TStringField;
    QCartaCorrecaoCTeDESC_MSG_VALIDACAO: TMemoField;
    QCartaCorrecaoCTeDT_REG_EVENTO: TDateTimeField;
    QCartaCorrecaoCTeDESC_PROTOCOLO: TStringField;
    QCartaCorrecaoCTeDESC_XML_EVENTO: TMemoField;
    QCartaCorrecaoCTeDESC_XML_RETORNO: TMemoField;
    QGrupoAlterado: TOracleDataSet1;
    QCampoAlterado: TOracleDataSet1;
    QCorrecaoCTe: TOracleDataSet;
    QCorrecaoCTeDESC_GRUPO_ALTERADO: TStringField;
    QCorrecaoCTeDESC_CAMPO_ALTERADO: TStringField;
    QCorrecaoCTeDESC_VALOR_ALTERADO: TStringField;
    QCartaCorrecaoCTemsg_validacao: TStringField;
    QCorrecaoCTeNUM_ITEM_ALTERADO: TIntegerField;
    QCorrecaoCTeCOD_CORRECAO_CTE: TIntegerField;
    QGrupoAlteradoTAG_GRUPO: TStringField;
    QGrupoAlteradoDESC_GRUPO: TStringField;
    QCampoAlteradoTAG_CAMPO: TStringField;
    QCampoAlteradoDESC_CAMPO: TStringField;
    QCampoAlteradoTAG_GRUPO: TStringField;
    QCartaCorrecaoCTeID_EVENTO: TStringField;
    QCorrecaoCTeID_EVENTO: TStringField;
    procedure QCartaCorrecaoCTeCalcFields(DataSet: TDataSet);
    procedure QCartaCorrecaoCTeBeforeInsert(DataSet: TDataSet);
    procedure QCartaCorrecaoCTeBeforeEdit(DataSet: TDataSet);
    procedure QCartaCorrecaoCTeAfterCancel(DataSet: TDataSet);
    procedure QCorrecaoCTeAfterInsert(DataSet: TDataSet);
    procedure QCartaCorrecaoCTeAfterDelete(DataSet: TDataSet);
    procedure QCartaCorrecaoCTeBeforeDelete(DataSet: TDataSet);
    procedure QCorrecaoCTeBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCartaCorrecaoCTe: TDMCartaCorrecaoCTe;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TDMCartaCorrecaoCTe.QCartaCorrecaoCTeCalcFields(
  DataSet: TDataSet);
begin
  if QCartaCorrecaoCTe.Active then
    QCartaCorrecaoCTemsg_validacao.Value :=
        QCartaCorrecaoCTeDESC_RETORNO_PROCESSAMENTO.Value + ' - ' +
        QCartaCorrecaoCTeDESC_MSG_VALIDACAO.Value; 
end;

procedure TDMCartaCorrecaoCTe.QCartaCorrecaoCTeBeforeInsert(
  DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMCartaCorrecaoCTe.QCartaCorrecaoCTeBeforeEdit(
  DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMCartaCorrecaoCTe.QCartaCorrecaoCTeAfterCancel(
  DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Rollback;
end;

procedure TDMCartaCorrecaoCTe.QCorrecaoCTeAfterInsert(DataSet: TDataSet);
begin
  QCorrecaoCTeID_EVENTO.Value := QCartaCorrecaoCTeID_EVENTO.Value;
end;

procedure TDMCartaCorrecaoCTe.QCartaCorrecaoCTeAfterDelete(
  DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Commit;
end;

procedure TDMCartaCorrecaoCTe.QCartaCorrecaoCTeBeforeDelete(
  DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMCartaCorrecaoCTe.QCorrecaoCTeBeforeInsert(DataSet: TDataSet);
begin
  if QCartaCorrecaoCTe.State = dsInsert then
  begin
    QCartaCorrecaoCTe.Post;
    QCartaCorrecaoCTe.Edit;
  end;
end;

end.
