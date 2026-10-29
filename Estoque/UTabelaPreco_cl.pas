unit UTabelaPreco_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, Oracle, Dialogs, DBClient;

type
  TDMTabelaPreco = class(TDataModule)
    QTabelaPrecoCab: TOracleDataSet1;
    QTabelaPrecoItem: TOracleDataSet1;
    QTabelaPrecoCabCOD_TABELA_PRECO_CAB: TIntegerField;
    QTabelaPrecoCabDESC_TABELA_PRECO: TStringField;
    QTabelaPrecoCons: TOracleDataSet1;
    QTabelaPrecoItemCOD_TABELA_PRECO_ITEM: TIntegerField;
    QTabelaPrecoItemCOD_TABELA_PRECO_CAB: TIntegerField;
    QTabelaPrecoItemCOD_PRODUTO: TIntegerField;
    QTabelaPrecoItemVAL_PRECO: TFloatField;
    QTabelaPrecoItemdescricao: TStringField;
    QTabelaPrecoCabIND_SITUACAO: TStringField;
    QTabelaPrecoConsCOD_TABELA_PRECO_CAB: TIntegerField;
    QTabelaPrecoConsDESC_TABELA_PRECO: TStringField;
    QTabelaPrecoConsIND_SITUACAO: TStringField;
    QTabelaPrecoItensCons: TOracleDataSet1;
    QTabelaPrecoItensConsCOD_PRODUTO: TIntegerField;
    QTabelaPrecoItensConsVAL_PRECO: TFloatField;
    QTabelaPrecoItensConsDESC_PRODUTO: TStringField;
    QRTabelaPreco: TOracleDataSet1;
    QRTabelaPrecoCOD_TABELA_PRECO_CAB: TIntegerField;
    QRTabelaPrecoDESC_TABELA_PRECO: TStringField;
    QRTabelaPrecoIND_SITUACAO: TStringField;
    QRTabelaPrecoCOD_TABELA_PRECO_ITEM: TIntegerField;
    QRTabelaPrecoCOD_PRODUTO: TIntegerField;
    QRTabelaPrecoDESC_PRODUTO: TStringField;
    QRTabelaPrecoVAL_PRECO: TFloatField;
    QTabelaPrecoProduto: TOracleDataSet1;
    QTabelaPrecoProdutoCOD_TABELA_PRECO_ITEM: TIntegerField;
    QTabelaPrecoProdutoCOD_TABELA_PRECO_CAB: TIntegerField;
    QTabelaPrecoProdutoCOD_PRODUTO: TIntegerField;
    QTabelaPrecoProdutoVAL_PRECO: TFloatField;
    QTabelaPrecoCabIND_BLOQUEIA_DESCONTO: TStringField;
    QRTabelaPrecoNUM_CLASSE: TIntegerField;
    QRTabelaPrecoNUM_SUBCLASSE: TIntegerField;
    QRTabelaPrecoDESC_CLASSE: TStringField;
    QReajustaPreco: TOracleDataSet1;
    QReajustaPrecoCOD_TABELA_PRECO_CAB: TIntegerField;
    QReajustaPrecoCOD_TABELA_PRECO_ITEM: TIntegerField;
    QReajustaPrecoCOD_PRODUTO: TIntegerField;
    QReajustaPrecoVAL_PRECO: TFloatField;
    OPReajustaListaPreco: TOraclePackage;
    QTabelaPrecoProdutoIND_BLOQUEIA_DESCONTO: TStringField;
    CDSTabelaPrecoItem: TClientDataSet;
    CDSTabelaPrecoItemcod_tabela_preco_item: TIntegerField;
    CDSTabelaPrecoItemcod_tabela_preco_cab: TIntegerField;
    CDSTabelaPrecoItemcod_produto: TIntegerField;
    CDSTabelaPrecoItemval_preco: TFloatField;
    QTabelaPrecoProdutoIND_SITUACAO: TStringField;
    QTabelaPrecoItemQT_QUANTIDADE: TFloatField;
    QTabelaPrecoItensConsQT_QUANTIDADE: TFloatField;
    QTabelaPrecoProdutoQT_QUANTIDADE: TFloatField;
    QTabelaPrecoItensConsVAL_TOTAL_ITEM: TFloatField;
    QRTabelaPrecoQT_QUANTIDADE: TFloatField;
    QRTabelaPrecoVAL_TOTAL_ITEM: TFloatField;
    QRTabelaPrecoPERC_IPI: TFloatField;
    QRTabelaPrecoVAL_TOTAL_COM_IPI: TFloatField;
    procedure QTabelaPrecoItemAfterInsert(DataSet: TDataSet);
    procedure QTabelaPrecoItemBeforeEdit(DataSet: TDataSet);
    procedure QTabelaPrecoItemBeforeInsert(DataSet: TDataSet);
    procedure QTabelaPrecoCabAfterCancel(DataSet: TDataSet);
    procedure QTabelaPrecoCabAfterDelete(DataSet: TDataSet);
    procedure QTabelaPrecoCabAfterPost(DataSet: TDataSet);
    procedure QTabelaPrecoCabBeforeCancel(DataSet: TDataSet);
    procedure QTabelaPrecoCabBeforeDelete(DataSet: TDataSet);
    procedure QTabelaPrecoCabBeforeEdit(DataSet: TDataSet);
    procedure QTabelaPrecoCabBeforePost(DataSet: TDataSet);
    procedure QTabelaPrecoCabDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure QTabelaPrecoItemCalcFields(DataSet: TDataSet);
    procedure QTabelaPrecoCabAfterInsert(DataSet: TDataSet);
    procedure QTabelaPrecoItemVAL_PRECOValidate(Sender: TField);
    procedure QTabelaPrecoCabBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTabelaPreco: TDMTabelaPreco;

implementation

uses UOracle_cl, UUsuario_cl, UProduto_cl, UParamSistema_cl, DateUtils;

{$R *.dfm}

procedure TDMTabelaPreco.QTabelaPrecoItemAfterInsert(DataSet: TDataSet);
begin
   QTabelaPrecoItemCOD_TABELA_PRECO_CAB.Value := QTabelaPrecoCabCOD_TABELA_PRECO_CAB.Value;
end;

procedure TDMTabelaPreco.QTabelaPrecoItemBeforeEdit(DataSet: TDataSet);
begin
{  if QTabelaPrecoCab.State = dsInsert then
  begin
    QTabelaPrecoCab.Post;
    QTabelaPrecoCab.Edit;
  end;     }
end;

procedure TDMTabelaPreco.QTabelaPrecoItemBeforeInsert(DataSet: TDataSet);
begin
  If QTabelaPrecoCab.State = dsInsert then
  Begin
    QTabelaPrecoCab.Post;
    QTabelaPrecoCab.Edit;
  End;
end;

procedure TDMTabelaPreco.QTabelaPrecoCabAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Rollback;
end;

procedure TDMTabelaPreco.QTabelaPrecoCabAfterDelete(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Commit;
end;

procedure TDMTabelaPreco.QTabelaPrecoCabAfterPost(DataSet: TDataSet);
var wCodigo : Real;
begin
  wCodigo := QTabelaPrecoCabCOD_TABELA_PRECO_CAB.Value;
  QTabelaPrecoCab.Close;
  QTabelaPrecoCab.SetVariable('PK',wCodigo);
  QTabelaPrecoCab.Open;
end;

procedure TDMTabelaPreco.QTabelaPrecoCabBeforeCancel(DataSet: TDataSet);
begin
  If QTabelaPrecoItem.State in [dsEdit,dsInsert] then
    QTabelaPrecoItem.Cancel;
end;

procedure TDMTabelaPreco.QTabelaPrecoCabBeforeDelete(DataSet: TDataSet);
begin

  if (DMParamSistema.CodEmpresa = 'DEION') then
  begin
     if not(DMUsuario.pTipoFuncionario = 'DIRETOR') and not(DMUsuario.pTipoFuncionario = 'SUPERVISOR') then
     begin
      raise Exception.Create('Você não tem autorização para deletar esse item');
     end;
  end;

  if not(DMOracle.DBCemapa.inTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMTabelaPreco.QTabelaPrecoCabBeforeEdit(DataSet: TDataSet);
begin

  if (DMParamSistema.CodEmpresa = 'DEION') then
  begin
     if not(DMUsuario.pTipoFuncionario = 'DIRETOR') and not(DMUsuario.pTipoFuncionario = 'SUPERVISOR') then
     begin
      raise Exception.Create('Você não tem autorização para editar esse item');
     end;
  end;

  If Not DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMTabelaPreco.QTabelaPrecoCabBeforePost(DataSet: TDataSet);
begin

  if QTabelaPrecoItem.State in [dsEdit,dsInsert] then
     QTabelaPrecoItem.Post;
  if DMOracle.DBCemapa.inTransaction then
  begin
    DMOracle.DBCemapa.Commit;
    DMOracle.DBCemapa.StartTransaction;
  end;
end;

procedure TDMTabelaPreco.QTabelaPrecoCabDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Rollback;
end;

procedure TDMTabelaPreco.QTabelaPrecoItemCalcFields(DataSet: TDataSet);
begin
  QTabelaPrecoItemDescricao.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' +
                                     FloatToStr(QTabelaPrecoItemCOD_PRODUTO.Value));
//QObra_Req_ItemDescricao.value:=DMOracle.BuscaNome('SELECT DESC_PRODUTO
//FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QObra_Req_ItemCod_Produto.Value));
end;

procedure TDMTabelaPreco.QTabelaPrecoCabAfterInsert(DataSet: TDataSet);
begin
  QTabelaPrecoCabIND_SITUACAO.Value := 'ATIVO';
  QTabelaPrecoCabIND_BLOQUEIA_DESCONTO.Value := 'NAO';
  //Gian, 11/11/2017. Solicitado por Marlon somente para Kreuz
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'KREUZ' then
  begin
    if DMUsuario.Privilegiado then
      QTabelaPrecoCabIND_BLOQUEIA_DESCONTO.Value := 'NAO'
    else
      QTabelaPrecoCabIND_BLOQUEIA_DESCONTO.Value := 'SIM';
  end;
  //QTabelaPrecoCab.Post;
end;

procedure TDMTabelaPreco.QTabelaPrecoItemVAL_PRECOValidate(Sender: TField);
begin
 {with DMUsuario, dmProduto do
  begin
    if QTabelaPrecoItemVAL_PRECO.Value = 0 then
      Exit;
    if not Privilegiado then
    begin
      QProduto.Close;
      QProduto.SetVariable('PK', QTabelaPrecoItemCOD_PRODUTO.Value);
      QProduto.Open;
      if (QProdutoVAL_VAREJO.Value
        - (QProdutoVAL_VAREJO.Value * QProdutoPERC_DESCONTO_MAXIMO.Value  / 100))
        > Sender.Value then
      begin
        MessageDlg('Valor do produto maior que o desconto máxio permitido',
          mtError, [mbOk], 0);
        QTabelaPrecoItemVAL_PRECO.Clear;
        Abort;
      end;
    end;
  end;}
end;

procedure TDMTabelaPreco.QTabelaPrecoCabBeforeInsert(DataSet: TDataSet);
begin
  if (DMParamSistema.CodEmpresa = 'DEION') then
  begin
     if not(DMUsuario.pTipoFuncionario = 'DIRETOR') and not(DMUsuario.pTipoFuncionario = 'SUPERVISOR') then
     begin
      raise Exception.Create('Você não tem autorização para inserir itens');
     end;
  end;
end;

end.
