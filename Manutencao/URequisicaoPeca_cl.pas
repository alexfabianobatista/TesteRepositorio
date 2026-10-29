unit URequisicaoPeca_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMRequisicaoPeca = class(TDataModule)
    QRequisicaoPeca: TOracleDataSet1;
    QRequisicaoPecaNUM_REQUISICAO_PECA: TIntegerField;
    QRequisicaoPecaNUM_OS_MANUTENCAO: TIntegerField;
    QRequisicaoPecaCOD_FUNCIONARIO: TIntegerField;
    QRequisicaoPecaCOD_FILIAL: TIntegerField;
    QRequisicaoPecaDT_EMISSAO: TDateTimeField;
    QRequisicaoPecadesc_filial: TStringField;
    QRequisicaoPecaItem: TOracleDataSet1;
    QRequisicaoPecaItemNUM_REQUISICAO_PECA: TIntegerField;
    QRequisicaoPecaItemCOD_PRODUTO: TFloatField;
    QRequisicaoPecaItemQT_PRODUTO: TIntegerField;
    QRequisicaoPecaItemdesc_produto: TStringField;
    DSRequisicaoPecaItem: TDataSource;
    QRequisicaoPecadt_emissao_os: TStringField;
    QRequisicaoPecadesc_funcionario: TStringField;
    QRequisicaoPecaCons: TOracleDataSet1;
    QRequisicaoPecaConsNUM_REQUISICAO_PECA: TIntegerField;
    QRequisicaoPecaConsNUM_OS_MANUTENCAO: TIntegerField;
    QRequisicaoPecaConsCOD_FUNCIONARIO: TIntegerField;
    QRequisicaoPecaConsCOD_FILIAL: TIntegerField;
    QRequisicaoPecaConsDT_EMISSAO: TDateTimeField;
    QRequisicaoPecaConsDESC_FUNCIONARIO: TStringField;
    QRequisicaoPecaItemCOD_REQUISICAO_PECA_ITEM: TIntegerField;
    procedure DSRequisicaoPecaItemStateChange(Sender: TObject);
    procedure QRequisicaoPecaAfterInsert(DataSet: TDataSet);
    procedure QRequisicaoPecaCalcFields(DataSet: TDataSet);
    procedure QRequisicaoPecaItemCalcFields(DataSet: TDataSet);
    procedure QRequisicaoPecaItemAfterInsert(DataSet: TDataSet);
    procedure QRequisicaoPecaItemBeforeInsert(DataSet: TDataSet);
    procedure QRequisicaoPecaAfterOpen(DataSet: TDataSet);
    procedure QRequisicaoPecaAfterDelete(DataSet: TDataSet);
    procedure QRequisicaoPecaBeforePost(DataSet: TDataSet);
    procedure QRequisicaoPecaBeforeDelete(DataSet: TDataSet);
    procedure QRequisicaoPecaAfterEdit(DataSet: TDataSet);
    procedure QRequisicaoPecaItemBeforePost(DataSet: TDataSet);
    procedure QRequisicaoPecaItemBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRequisicaoPeca: TDMRequisicaoPeca;

implementation

uses URequisicaoPecaCad, UOracle_cl, UEstoque_cl;

{$R *.DFM}

procedure TDMRequisicaoPeca.DSRequisicaoPecaItemStateChange(
  Sender: TObject);
begin
  If DMRequisicaoPeca.QRequisicaoPecaItem.State in [DSInsert,DSEdit] then
    FRequisicaoPecaCad.BTProduto.enabled:=true
  else
    FRequisicaoPecaCad.BTProduto.enabled:=false;
end;

procedure TDMRequisicaoPeca.QRequisicaoPecaAfterInsert(DataSet: TDataSet);
begin
  QRequisicaoPecaDt_Emissao.Value:=date;
  QRequisicaoPecaItem.Close;
  QRequisicaoPecaItem.Open;
end;

procedure TDMRequisicaoPeca.QRequisicaoPecaCalcFields(DataSet: TDataSet);
begin
  if Trim(QRequisicaoPecaCod_Filial.Text) <> '' then
    QRequisicaoPecaDesc_filial.Value:= DMOracle.BuscaNome('SELECT DESC_FILIAL'+
                                                               ' FROM TB_FILIAL','COD_FILIAL = '
                                                               +Trim(QRequisicaoPecaCod_Filial.Text));
  if Trim(QRequisicaoPecaCod_Funcionario.Text) <> '' then
    QRequisicaoPecaDesc_funcionario.Value:= DMOracle.BuscaNome('SELECT DESC_FUNCIONARIO'+
                                                               ' FROM TB_FUNCIONARIO','COD_FUNCIONARIO = '
                                                               +Trim(QRequisicaoPecaCod_Funcionario.Text));
  if Trim(QRequisicaoPecaNum_OS_Manutencao.Text) <> '' then
    QRequisicaoPecadt_emissao_os.Value:= DMOracle.BuscaNome('SELECT DT_EMISSAO'+
                                                               ' FROM TB_OS_MANUTENCAO_CAB','NUM_OS_MANUTENCAO = '
                                                               +Trim(QRequisicaoPecaNum_OS_Manutencao.Text));
end;

procedure TDMRequisicaoPeca.QRequisicaoPecaItemCalcFields(
  DataSet: TDataSet);
begin
  if Trim(QRequisicaoPecaItemCod_Produto.Text) <> '' then
    QRequisicaoPecaItemDesc_Produto.Value:= DMOracle.BuscaNome('SELECT DESC_PRODUTO'+
                                                               ' FROM TB_PRODUTO','COD_PRODUTO = '
                                                               +Trim(QRequisicaoPecaItemCod_Produto.Text));
end;

procedure TDMRequisicaoPeca.QRequisicaoPecaItemAfterInsert(
  DataSet: TDataSet);
begin
  QRequisicaoPecaItemNum_Requisicao_Peca.Value:= QRequisicaoPecaNum_Requisicao_Peca.Value;
  FRequisicaoPecaCad.BTProdutoClick(self);
end;

procedure TDMRequisicaoPeca.QRequisicaoPecaItemBeforeInsert(
  DataSet: TDataSet);
begin
  if QRequisicaoPeca.state in [DSInsert,DSEdit] then
    QRequisicaoPeca.Post;
end;

procedure TDMRequisicaoPeca.QRequisicaoPecaAfterOpen(DataSet: TDataSet);
begin
  QRequisicaoPecaItem.Close;
  QRequisicaoPecaItem.setVariable('NUM_REQUISICAO_PECA',QRequisicaoPecaNum_Requisicao_Peca.Value);
  QRequisicaoPecaItem.Open;
end;

procedure TDMRequisicaoPeca.QRequisicaoPecaAfterDelete(DataSet: TDataSet);
begin
  QRequisicaoPecaItem.Close;
  QRequisicaoPecaItem.setVariable('NUM_REQUISICAO_PECA',QRequisicaoPecaNum_Requisicao_Peca.Value);
  QRequisicaoPecaItem.Open;
end;

procedure TDMRequisicaoPeca.QRequisicaoPecaBeforePost(DataSet: TDataSet);
var
  wEncerramento :String;
begin
  wEncerramento := DMOracle.BuscaNome('SELECT TB_OS_MANUTENCAO_CAB.DT_ENCERRAMENTO FROM'+
                                      ' TB_OS_MANUTENCAO_CAB','NUM_OS_MANUTENCAO ='+QRequisicaoPecaNum_OS_Manutencao.Text);
  if wEncerramento <> '' then
    raise exception.create('O.S já encerrada');
end;

procedure TDMRequisicaoPeca.QRequisicaoPecaBeforeDelete(DataSet: TDataSet);
var
  wEncerramento :String;
begin
  wEncerramento := DMOracle.BuscaNome('SELECT TB_OS_MANUTENCAO_CAB.DT_ENCERRAMENTO FROM'+
                                      ' TB_OS_MANUTENCAO_CAB','NUM_OS_MANUTENCAO ='+QRequisicaoPecaNum_OS_Manutencao.Text);
  if wEncerramento <> '' then
    raise exception.create('O.S já encerrada');
end;
procedure TDMRequisicaoPeca.QRequisicaoPecaAfterEdit(DataSet: TDataSet);
var
  wEncerramento :String;
begin
  wEncerramento := DMOracle.BuscaNome('SELECT TB_OS_MANUTENCAO_CAB.DT_ENCERRAMENTO FROM'+
                                      ' TB_OS_MANUTENCAO_CAB','NUM_OS_MANUTENCAO ='+QRequisicaoPecaNum_OS_Manutencao.Text);
  if wEncerramento <> '' then
    raise exception.create('O.S já encerrada');
end;
procedure TDMRequisicaoPeca.QRequisicaoPecaItemBeforePost(
  DataSet: TDataSet);
begin
  try
    if DMOracle.DBCemapa.InTransaction = false then
       DMOracle.DBCemapa.StartTransaction;

    DMEstoque.AtualizaEstoque(-1,QRequisicaoPecaCOD_FILIAL.Value,QRequisicaoPecaItemCOD_PRODUTO.Value,
                               1,QRequisicaoPecaItemQT_Produto.Value*-1,0,0,0);

    if DMOracle.DBCemapa.InTransaction = true then
       DMOracle.DBCemapa.Commit;
  except
     DMOracle.DBCemapa.Rollback;
     QRequisicaoPecaItem.cancel;
     QRequisicaoPecaItemCod_Produto.Clear;
     QRequisicaoPecaitemQt_Produto.Clear;
     QRequisicaoPecaitemNum_Requisicao_Peca.Clear;
     Exit;
  end;
end;
procedure TDMRequisicaoPeca.QRequisicaoPecaItemBeforeDelete(
  DataSet: TDataSet);
begin
    try
    if DMOracle.DBCemapa.InTransaction = false then
       DMOracle.DBCemapa.StartTransaction;

    DMEstoque.AtualizaEstoque(-1,QRequisicaoPecaCOD_FILIAL.Value,QRequisicaoPecaItemCOD_PRODUTO.Value,
                               1,QRequisicaoPecaItemQT_Produto.Value,0,0,0);

    if DMOracle.DBCemapa.InTransaction = true then
       DMOracle.DBCemapa.Commit;
  except
     DMOracle.DBCemapa.Rollback;
     QRequisicaoPecaItem.cancel;
     QRequisicaoPecaItemCod_Produto.Clear;
     QRequisicaoPecaitemQt_Produto.Clear;
     QRequisicaoPecaitemNum_Requisicao_Peca.Clear;
     Exit;
  end;
end;

end.
