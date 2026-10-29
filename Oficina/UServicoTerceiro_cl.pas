unit UServicoTerceiro_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMServicoTerceiro = class(TDataModule)
    QServicoTerceiroCad: TOracleDataSet1;
    QServicoTerceiroCadCOD_SERVICO_TERCEIRO: TIntegerField;
    QServicoTerceiroCadNUM_OS: TIntegerField;
    QServicoTerceiroCadCOD_VENDEDOR: TIntegerField;
    QServicoTerceiroCadVAL_SERVICO: TFloatField;
    QServicoTerceiroCadnome_vendedor: TStringField;
    QServicoTerceiroCadCOD_CADASTRO: TIntegerField;
    QServicoTerceiroCadDT_SERVICO: TDateTimeField;
    QServicoTerceiroCadnome_cadastro: TStringField;
    QServicoTerceiroCadNUM_NOTA: TIntegerField;
    QServicoTerceiroCaddesc_produto_servico: TStringField;
    QServicoTerceiroCadCOD_NOTA_CAB: TIntegerField;
    QServicoTerceiroCons: TOracleDataSet1;
    QServicoTerceiroConsCOD_SERVICO_TERCEIRO: TIntegerField;
    QServicoTerceiroConsNUM_OS: TIntegerField;
    QServicoTerceiroConsCOD_SERVICO: TIntegerField;
    QServicoTerceiroConsCOD_VENDEDOR: TIntegerField;
    QServicoTerceiroConsVAL_SERVICO: TFloatField;
    QServicoTerceiroConsCOD_CADASTRO: TIntegerField;
    QServicoTerceiroConsDT_SERVICO: TDateTimeField;
    QServicoTerceiroConsNUM_NOTA: TIntegerField;
    QServicoTerceiroConsDESC_PRODUTO: TStringField;
    QServicoTerceiroItem: TOracleDataSet1;
    QServicoTerceiroItemCOD_SERVICO_TERCEIRO_ITEM: TIntegerField;
    QServicoTerceiroItemCOD_SERVICO_TERCEIRO: TIntegerField;
    QServicoTerceiroItemCOD_PRODUTO: TIntegerField;
    QServicoTerceiroItemQT_QUANTIDADE: TFloatField;
    QServicoTerceiroItemVAL_UNITARIO: TFloatField;
    QServicoTerceiroItemval_total: TFloatField;
    QServicoTerceiroItemDESC_SERVICO_TERCEIRO_ITEM: TStringField;
    QServicoTerceiroItemCOD_NOTA_ITEM: TIntegerField;
    QServicoTerceiroCadCOD_SERVICO: TIntegerField;
    QServicoTerceiroCadnome_cliente: TStringField;
    QServicoTerceiroCadDESC_SERVICO: TStringField;
    QServicoTerceiroConsDESC_SERVICO: TStringField;
    procedure QServicoTerceiroCadAfterInsert(DataSet: TDataSet);
    procedure QServicoTerceiroCadBeforePost(DataSet: TDataSet);
    procedure QServicoTerceiroCadCalcFields(DataSet: TDataSet);
    procedure QServicoTerceiroCadAfterOpen(DataSet: TDataSet);
    procedure QServicoTerceiroCadBeforeClose(DataSet: TDataSet);
    procedure QServicoTerceiroItemCalcFields(DataSet: TDataSet);
    procedure QServicoTerceiroItemAfterInsert(DataSet: TDataSet);
    procedure QServicoTerceiroItemBeforeInsert(DataSet: TDataSet);
    procedure QServicoTerceiroItemBeforeEdit(DataSet: TDataSet);
    procedure QServicoTerceiroItemBeforePost(DataSet: TDataSet);
    procedure QServicoTerceiroItemAfterPost(DataSet: TDataSet);
    procedure QServicoTerceiroCadBeforeCancel(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImportaItensNF;
  end;

var
  DMServicoTerceiro: TDMServicoTerceiro;

implementation

uses UOracle_cl, UParamSistema_cl, UNotaEntrada_cl, UUsuario_cl;

{$R *.dfm}

procedure TDMServicoTerceiro.QServicoTerceiroCadAfterInsert(
  DataSet: TDataSet);
begin
  QServicoTerceiroCadDT_SERVICO.Value := Date;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
    QServicoTerceiroCadCOD_VENDEDOR.Value := DMUsuario.CodVendedorPadrao;
end;

procedure TDMServicoTerceiro.QServicoTerceiroCadBeforePost(
  DataSet: TDataSet);
begin
  if DMOracle.FastSelect('IND_SITUACAO', 'TB_OS', 'NUM_OS = ' + QServicoTerceiroCadNUM_OS.Text) = 'F' then
    raise Exception.Create('OS já está fechada.');
end;

procedure TDMServicoTerceiro.QServicoTerceiroCadCalcFields(
  DataSet: TDataSet);
begin
  QServicoTerceiroCaddesc_produto_servico.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QServicoTerceiroCadCOD_SERVICO.Value));
  QServicoTerceiroCadnome_vendedor.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + FloatToStr(QServicoTerceiroCadCOD_VENDEDOR.Value));
  QServicoTerceiroCadnome_cadastro.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(QServicoTerceiroCadCOD_CADASTRO.Value));
end;

procedure TDMServicoTerceiro.QServicoTerceiroCadAfterOpen(
  DataSet: TDataSet);
begin
  QServicoTerceiroItem.Open;
end;

procedure TDMServicoTerceiro.QServicoTerceiroCadBeforeClose(
  DataSet: TDataSet);
begin
  QServicoTerceiroItem.Close;
end;

procedure TDMServicoTerceiro.QServicoTerceiroItemCalcFields(
  DataSet: TDataSet);
begin
  QServicoTerceiroItemval_total.Value := QServicoTerceiroItemQT_QUANTIDADE.Value *
    QServicoTerceiroItemVAL_UNITARIO.Value;
end;

procedure TDMServicoTerceiro.QServicoTerceiroItemAfterInsert(
  DataSet: TDataSet);
begin
  QServicoTerceiroItemQT_QUANTIDADE.Value := 1;
  QServicoTerceiroItemVAL_UNITARIO.Value := 0;
end;

procedure TDMServicoTerceiro.QServicoTerceiroItemBeforeInsert(
  DataSet: TDataSet);
begin
  if QServicoTerceiroCad.State = DsInsert then
    QServicoTerceiroCad.Post;
  if QServicoTerceiroCad.State = DsBrowse then
    QServicoTerceiroCad.Edit;
end;

procedure TDMServicoTerceiro.ImportaItensNF;
var
  wCod: Integer;
begin
  wCod := QServicoTerceiroCadCOD_NOTA_CAB.Value;
  if wCod > 0 then
    with DMNotaEntrada do
    begin
      DMParamSistema.QParamSistema.RefreshRecord;

      QNotaEntrada.Close;
      QNotaEntrada.SetVariable('PK', wCod);
      QNotaEntrada.Open;
      QItemNF.Close;
      QItemNF.Open;
      QItemNF.First;

      QServicoTerceiroCadNUM_NOTA.Value := QNotaEntradaNUM_NOTA.Value;
      if (QServicoTerceiroCadNUM_OS.Value = 0) and (QNotaEntradaNUM_OS.Value > 0) then
        QServicoTerceiroCadNUM_OS.Value := QNotaEntradaNUM_OS.Value;
      if (QServicoTerceiroCadCOD_CADASTRO.Value = 0) and (QNotaEntradaCOD_CADASTRO.Value > 0) then
        QServicoTerceiroCadCOD_CADASTRO.Value := QNotaEntradaCOD_CADASTRO.Value;
      if (QServicoTerceiroCadCOD_VENDEDOR.Value = 0) and (QNotaEntradaCOD_VENDEDOR.Value > 0) then
        QServicoTerceiroCadCOD_VENDEDOR.Value := QNotaEntradaCOD_VENDEDOR.Value;
      QServicoTerceiroCadVAL_SERVICO.Value := QSomaItemNotasval_total_nota.Value +
        (QSomaItemNotasval_total_nota.Value * DMParamSistema.QParamSistemaPERC_SERVICO_TERCEIRO.Value / 100);

      while not QItemNF.Eof do
      begin
        if DMOracle.FastSelect('COD_SERVICO_TERCEIRO_ITEM', 'TB_SERVICO_TERCEIRO_ITEM',
          'COD_NOTA_ITEM = ' + QItemNFCOD_NOTA_ITEM.Text) = '' then
        begin
          QServicoTerceiroItem.Append;
          QServicoTerceiroItemCOD_NOTA_ITEM.Value := QItemNFCOD_NOTA_ITEM.Value;
          QServicoTerceiroItemCOD_PRODUTO.Value := Trunc(QItemNFCOD_PRODUTO.Value);
          QServicoTerceiroItemQT_QUANTIDADE.Value := QItemNFQT_QUANTIDADE.Value;
          QServicoTerceiroItemVAL_UNITARIO.Value := QItemNFVAL_UNITARIO.Value +
            (QItemNFVAL_UNITARIO.Value * DMParamSistema.QParamSistemaPERC_SERVICO_TERCEIRO.Value / 100);
          QServicoTerceiroItemDESC_SERVICO_TERCEIRO_ITEM.Value := QItemNFDESC_COMPLEMENTO.Value;
          QServicoTerceiroItem.Post;
        end;

        QItemNF.Next;
      end;

      QItemNF.Close;
      QNotaEntrada.Close;
    end;
end;

procedure TDMServicoTerceiro.QServicoTerceiroItemBeforeEdit(
  DataSet: TDataSet);
begin
  if QServicoTerceiroCad.State = DsInsert then
    QServicoTerceiroCad.Post;
  if QServicoTerceiroCad.State = DsBrowse then
    QServicoTerceiroCad.Edit;
end;

procedure TDMServicoTerceiro.QServicoTerceiroItemBeforePost(
  DataSet: TDataSet);
var
  v: Variant;
  val: Real;
begin
  with DataSet do
  begin
    v := FieldByName('COD_NOTA_ITEM').Value;
    if v = 0 then
      raise Exception.Create('Produto não tem relação com item de nota. Por favor, exclua e importe novamente.');
    val := StrToFloat('0' + DMOracle.FastSelect('VAL_TOTAL', 'TB_NOTA_ITEM', 'COD_NOTA_ITEM = ' + FloatToStr(v)));
    val := val + (val * DMParamSistema.QParamSistemaPERC_SERVICO_TERCEIRO.Value / 100);
    if FieldByName('val_total').Value < val then
      raise Exception.Create('Valor do item inferior ao permitido.');
  end;
end;

procedure TDMServicoTerceiro.QServicoTerceiroItemAfterPost(
  DataSet: TDataSet);
begin
  QServicoTerceiroCadVAL_SERVICO.Value := StrToFloat('0' +
    DMOracle.FastSelect('SUM(QT_QUANTIDADE*VAL_UNITARIO)', 'TB_SERVICO_TERCEIRO_ITEM',
    'COD_SERVICO_TERCEIRO = ' + QServicoTerceiroCadCOD_SERVICO_TERCEIRO.Text));
end;

procedure TDMServicoTerceiro.QServicoTerceiroCadBeforeCancel(
  DataSet: TDataSet);
begin
  if QServicoTerceiroItem.State in [DsInsert, DsEdit] then
    QServicoTerceiroItem.Cancel;
end;

end.

