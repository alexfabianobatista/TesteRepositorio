unit UOrdemCarregamento_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMOrdemCarregamento = class(TDataModule)
    QOrdemCarregamentoCab: TOracleDataSet1;
    QOrdemCarregamentoItem: TOracleDataSet1;
    QOrdemCarregamentoCabCOD_ORDEM_CARREGAMENTO_CAB: TIntegerField;
    QOrdemCarregamentoCabCOD_CADASTRO: TIntegerField;
    QOrdemCarregamentoCabCOD_FILIAL: TIntegerField;
    QOrdemCarregamentoCabDT_EMISSAO: TDateTimeField;
    QOrdemCarregamentoCabDESC_EMISSOR: TStringField;
    QOrdemCarregamentoCabDESC_DESTINATARIO: TStringField;
    QOrdemCarregamentoItemCOD_ORDEM_CARREGAMENTO_ITEM: TIntegerField;
    QOrdemCarregamentoItemCOD_ORDEM_CARREGAMENTO_CAB: TIntegerField;
    QOrdemCarregamentoItemCOD_MOTORISTA: TIntegerField;
    QOrdemCarregamentoItemCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QOrdemCarregamentoCons: TOracleDataSet1;
    QOrdemCarregamentoItemCOD_PRODUTO: TFloatField;
    DSOrdemCompra: TDataSource;
    QOrdemCompraItem: TOracleDataSet1;
    QOrdemCompraItemCOD_ORDEM_COMPRA_ITEM: TIntegerField;
    QOrdemCompraItemCOD_PRODUTO: TFloatField;
    QOrdemCompraItemQT_PEDIDO: TFloatField;
    QOrdemCarregamentoItemQTD_TONELADA: TFloatField;
    QOrdemCompraItemqtd_tonelada: TFloatField;
    QOrdemCompraItemCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QROrdemCarregamento: TOracleDataSet1;
    QROrdemCarregamentonome_motorista: TStringField;
    QROrdemCarregamentoqtd_produto: TFloatField;
    QOrdemCompraItemqtd_a_carregar: TFloatField;
    QOrdemCarregamentoCabCOD_NOTA_CAB: TIntegerField;
    QOrdemCarregamentoCabIND_SITUACAO: TStringField;
    QOrdemCarregamentoItemDESC_PLACA_VEICULO: TStringField;
    QOrdemCarregamentoItemIND_TIPO_FRETE: TStringField;
    QOrdemCarregamentoItemVAL_PEDAGIO: TFloatField;
    QOrdemCarregamentoItemVAL_FRETE_TON: TFloatField;
    QOrdemCarregamentoItemIND_TIPO_PGTO: TStringField;
    QROrdemCarregamentoSituacao: TOracleDataSet1;
    QROrdemCarregamentoSituacaoCOD_ORDEM_CARREGAMENTO_CAB: TIntegerField;
    QROrdemCarregamentoSituacaoDT_EMISSAO: TDateTimeField;
    QROrdemCarregamentoSituacaoDESC_EMISSOR: TStringField;
    QROrdemCarregamentoSituacaoDESC_DESTINATARIO: TStringField;
    QROrdemCarregamentoSituacaoIND_SITUACAO: TStringField;
    QROrdemCarregamentoSituacaoQTD_TONELADA: TFloatField;
    QROrdemCarregamentoSituacaoDESC_PLACA_VEICULO: TStringField;
    QROrdemCarregamentoSituacaoIND_TIPO_FRETE: TStringField;
    QROrdemCarregamentoSituacaoIND_TIPO_PGTO: TStringField;
    QROrdemCarregamentoSituacaoVAL_PEDAGIO: TFloatField;
    QROrdemCarregamentoSituacaoVAL_FRETE_TON: TFloatField;
    QROrdemCarregamentoSituacaoCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QROrdemCarregamentoSituacaoNOME: TStringField;
    QROrdemCarregamentoSituacaoCOD_PRODUTO: TFloatField;
    QROrdemCarregamentoSituacaoNUM_NOTA: TIntegerField;
    QROrdemCarregamentoSituacaodesc_tipo_pgto: TStringField;
    QROrdemCarregamentoSituacaoCOD_CADASTRO: TIntegerField;
    QOrdemCarregamentoCabCOD_CADASTRO_DESTINO: TIntegerField;
    QROrdemCarregamentonome_destino: TStringField;
    QROrdemCarregamentoendereco_destino: TStringField;
    QROrdemCarregamentocidade_destino: TStringField;
    QROrdemCarregamentobairro_destino: TStringField;
    QROrdemCarregamentoestado_destino: TStringField;
    QROrdemCarregamentoNOME_ORIGEM: TStringField;
    QROrdemCarregamentoENDERECO_ORIGEM: TStringField;
    QROrdemCarregamentoCIDADE_ORIGEM: TStringField;
    QROrdemCarregamentoBAIRRO_ORIGEM: TStringField;
    QROrdemCarregamentoESTADO_ORIGEM: TStringField;
    QROrdemCarregamentoDESC_UNIDADE: TStringField;
    QROrdemCarregamentoNUM_EMBALAGEM: TFloatField;
    QROrdemCarregamentoDESC_FILIAL: TStringField;
    QROrdemCarregamentoDESC_ENDERECO: TStringField;
    QROrdemCarregamentoDESC_CIDADE: TStringField;
    QROrdemCarregamentoDESC_CEP: TStringField;
    QROrdemCarregamentoDESC_BAIRRO: TStringField;
    QROrdemCarregamentoCOD_ESTADO: TStringField;
    QROrdemCarregamentoCOD_ORDEM_CARREGAMENTO_CAB: TIntegerField;
    QROrdemCarregamentoDESC_EMISSOR: TStringField;
    QROrdemCarregamentoDESC_DESTINATARIO: TStringField;
    QROrdemCarregamentoDT_EMISSAO: TDateTimeField;
    QROrdemCarregamentoCOD_CADASTRO_DESTINO: TIntegerField;
    QROrdemCarregamentoQTD_TONELADA: TFloatField;
    QROrdemCarregamentoCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QROrdemCarregamentoCOD_MOTORISTA: TIntegerField;
    QROrdemCarregamentoDESC_PLACA_VEICULO: TStringField;
    QROrdemCarregamentoSituacaodesc_destino: TStringField;
    QROrdemCarregamentoSituacaodesc_motorista: TStringField;
    QROrdemCarregamentoSituacaoCOD_CADASTRO_DESTINO: TIntegerField;
    QROrdemCarregamentoSituacaoCOD_MOTORISTA: TIntegerField;
    QOrdemCarregamentoCabCOD_MOTIVO_CANCELAMENTO: TIntegerField;
    QOrdemCarregamentoConsCOD_ORDEM_CARREGAMENTO_CAB: TIntegerField;
    QOrdemCarregamentoConsCOD_CADASTRO: TIntegerField;
    QOrdemCarregamentoConsCOD_CADASTRO_DESTINO: TIntegerField;
    QOrdemCarregamentoConsCOD_FILIAL: TIntegerField;
    QOrdemCarregamentoConsDT_EMISSAO: TDateTimeField;
    QOrdemCarregamentoConsDESC_EMISSOR: TStringField;
    QOrdemCarregamentoConsIND_SITUACAO: TStringField;
    QOrdemCarregamentoConsDESC_DESTINATARIO: TStringField;
    QOrdemCarregamentoConsDESC_PLACA_VEICULO: TStringField;
    QOrdemCarregamentoConsNOME: TStringField;
    QOrdemCarregamentoCabNUM_ORDEM_CARREGAMENTO: TIntegerField;
    QROrdemCarregamentoNUM_ORDEM_CARREGAMENTO: TIntegerField;
    QROrdemCarregamentoSituacaoNUM_ORDEM_CARREGAMENTO: TIntegerField;
    QROrdemCarregamentoNUM_ORDEM_COMPRA: TIntegerField;
    QOrdemCarregamentoCabCOD_MENSAGEM: TIntegerField;
    QROrdemCarregamentoDESC_MENSAGEM: TStringField;
    QROrdemCarregamentoDESC_OBS_COMPL: TStringField;
    QROrdemCarregamentoDESC_OBS_COMPL1: TStringField;
    QROrdemCarregamentoDESC_OBS_COMPL2: TStringField;
    QROrdemCarregamentoDESC_OBS_COMPL3: TStringField;
    QOrdemCarregamentoCabDESC_OBSERVACAO: TStringField;
    QROrdemCarregamentoDESC_OBSERVACAO: TStringField;
    QROrdemCarregamentoCOD_PRODUTO: TFloatField;
    QROrdemCarregamentoVAL_PEDAGIO: TFloatField;
    QROrdemCarregamentoVAL_FRETE: TFloatField;
    QOrdemCompraItemqtd_em_transito: TFloatField;
    QOrdemCompraItemqtd_saldo_restante: TFloatField;
    QOrdemCompraItemQT_ATENDIDO: TFloatField;
    QOrdemCompraItemQT_DISPONIVEL: TFloatField;
    QOrdemCompraItemqtd_ton_atendido: TFloatField;
    QOrdemCompraItemDESC_PRODUTO: TStringField;
    QROrdemCarregamentoSituacaoDESC_PRODUTO: TStringField;
    QROrdemCarregamentoDESC_PRODUTO: TStringField;
    QOrdemCompraItemQT_CANCELADO: TFloatField;
    QOrdemCarregamentoCabCOD_MOTORISTA: TIntegerField;
    procedure QOrdemCarregamentoItemCalcFields(DataSet: TDataSet);
    procedure QOrdemCarregamentoItemBeforeInsert(DataSet: TDataSet);
    procedure QOrdemCarregamentoItemBeforeEdit(DataSet: TDataSet);
    procedure QOrdemCompraItemCalcFields(DataSet: TDataSet);
    procedure QROrdemCarregamentoCalcFields(DataSet: TDataSet);
    procedure QOrdemCarregamentoCabAfterInsert(DataSet: TDataSet);
    procedure QROrdemCarregamentoSituacaoCalcFields(DataSet: TDataSet);
    procedure QOrdemCarregamentoCabAfterEdit(DataSet: TDataSet);
    procedure QOrdemCarregamentoItemBeforePost(DataSet: TDataSet);
    procedure QOrdemCarregamentoCabAfterPost(DataSet: TDataSet);
    procedure QOrdemCarregamentoCabBeforePost(DataSet: TDataSet);
    procedure QOrdemCarregamentoItemAfterPost(DataSet: TDataSet);
    procedure QOrdemCarregamentoItemAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  DMOrdemCarregamento: TDMOrdemCarregamento;
  wMotorista : Integer;
  wFreteTon,wPedagio : Real;
  wPlaca_Veiculo : String;

implementation

uses UOracle_cl, USequencia_cl, UUsuario_cl;

{$R *.DFM}

procedure TDMOrdemCarregamento.QOrdemCarregamentoItemCalcFields(
  DataSet: TDataSet);
begin
//  If(Trim(QOrdemCarregamentoItemCOD_ORDEM_COMPRA_CAB.Text) <> '')Then
//  Begin
//    QOrdemCompraItem.Close;
//    QOrdemCompraItem.SetVariable('COD_OC_CAB',Trim(QOrdemCarregamentoItemCOD_ORDEM_COMPRA_CAB.Text));
//    QOrdemCompraItem.Open;
//    If(QOrdemCompraItem.RecordCount = 0)Then
//        raise Exception.Create('Esta Ordem de Compra não possui Itens');
//  End;
end;

procedure TDMOrdemCarregamento.QOrdemCarregamentoItemBeforeInsert(
  DataSet: TDataSet);
begin
//  DMOracle.DBCemapa.StartTransaction;
  QOrdemCarregamentoCab.Edit;
end;

procedure TDMOrdemCarregamento.QOrdemCarregamentoItemBeforeEdit(
  DataSet: TDataSet);
begin
//  DMOracle.DBCemapa.StartTransaction;
  QOrdemCarregamentoCab.Edit;
end;

procedure TDMOrdemCarregamento.QOrdemCompraItemCalcFields(
  DataSet: TDataSet);
var
  wfloNumEmbalagem : Real;
  wfloQtd : Real;
  wstrDescUnidade, wstrQtdCarregar, wVal : String;
begin
  wfloNumEmbalagem := StrToFloat( DMOracle.BuscaNome('SELECT NUM_EMBALAGEM ' +
                     ' FROM TB_PRODUTO, TB_ORDEM_COMPRA_ITEM',
                     ' TB_PRODUTO.COD_PRODUTO = TB_ORDEM_COMPRA_ITEM.COD_PRODUTO '+
                     ' AND TB_PRODUTO.COD_PRODUTO =' + QOrdemCompraItemCOD_PRODUTO.Text) );
  wfloQtd := QOrdemCompraItemQT_PEDIDO.Value;
  wstrDescUnidade := DMOracle.BuscaNome('SELECT DESC_UNIDADE ' +
                     ' FROM TB_PRODUTO, TB_ORDEM_COMPRA_ITEM',
                     ' TB_PRODUTO.COD_PRODUTO = TB_ORDEM_COMPRA_ITEM.COD_PRODUTO ' +
                     ' AND TB_PRODUTO.COD_PRODUTO = ' + QOrdemCompraItemCOD_PRODUTO.Text);
  If(Trim(wstrDescUnidade) = 'T')Then
  Begin
    QOrdemCompraItemqtd_tonelada.Value := wfloNumEmbalagem * wfloQtd;
    wVal := DMOracle.BuscaNome(' SELECT SUM(QTD_TONELADA) AS QTD_TONELADA '+
                               ' FROM TB_ORDEM_CARREGAMENTO_ITEM,TB_ORDEM_COMPRA_ITEM ',
                               ' TB_ORDEM_CARREGAMENTO_ITEM.COD_ORDEM_COMPRA_CAB = TB_ORDEM_COMPRA_ITEM.COD_ORDEM_COMPRA_CAB '+
                               ' AND TB_ORDEM_COMPRA_ITEM.COD_PRODUTO =' + QOrdemCompraItemCOD_PRODUTO.Text);
    if trim(wVal) = '' then
      wVal := '0';
    QOrdemCompraItemqtd_a_carregar.Value := QOrdemCompraItemqtd_tonelada.Value - strtofloat(wVal);

  End
  Else
    If(Trim(wstrDescUnidade) = 'SC')OR(Trim(wstrDescUnidade) = 'KG')Then
    Begin
      QOrdemCompraItemqtd_tonelada.Value := (wfloNumEmbalagem * wfloQtd)/1000;
      wstrQtdCarregar := DMOracle.BuscaNome(' SELECT SUM(QTD_TONELADA) AS QTD_TONELADA ' +
                                            ' FROM TB_ORDEM_CARREGAMENTO_ITEM,TB_ORDEM_COMPRA_ITEM',
                                            ' TB_ORDEM_CARREGAMENTO_ITEM.COD_ORDEM_COMPRA_CAB = TB_ORDEM_COMPRA_ITEM.COD_ORDEM_COMPRA_CAB AND '+
                                            ' TB_ORDEM_COMPRA_ITEM.COD_PRODUTO =' + QOrdemCompraItemCOD_PRODUTO.Text);
      If(wstrQtdCarregar <> '')Then
        QOrdemCompraItemqtd_a_carregar.Value := QOrdemCompraItemqtd_tonelada.Value - StrToFloat(wstrQtdCarregar)
      Else
        QOrdemCompraItemqtd_a_carregar.Value := QOrdemCompraItemqtd_tonelada.Value;
    End;

  QOrdemCompraItemqtd_ton_atendido.Value := (QOrdemCompraItemQT_ATENDIDO.Value / 1000) * 50;

  wVal := DMOracle.BuscaNome(' SELECT SUM(QTD_TONELADA) FROM TB_ORDEM_CARREGAMENTO_CAB, ' +
                             ' TB_ORDEM_CARREGAMENTO_ITEM, TB_ORDEM_COMPRA_ITEM ',
                             ' TB_ORDEM_CARREGAMENTO_CAB.COD_ORDEM_CARREGAMENTO_CAB = TB_ORDEM_CARREGAMENTO_ITEM.COD_ORDEM_CARREGAMENTO_CAB AND ' +
                             ' TB_ORDEM_CARREGAMENTO_ITEM.COD_PRODUTO = TB_ORDEM_COMPRA_ITEM.COD_PRODUTO AND ' +
                             ' TB_ORDEM_CARREGAMENTO_ITEM.COD_ORDEM_COMPRA_CAB = TB_ORDEM_COMPRA_ITEM.COD_ORDEM_COMPRA_CAB AND ' +
                             ' TB_ORDEM_COMPRA_ITEM.COD_ORDEM_COMPRA_ITEM = ' + QOrdemCompraItemCOD_ORDEM_COMPRA_ITEM.AsString + ' AND ' +
                             ' TB_ORDEM_CARREGAMENTO_ITEM.COD_PRODUTO = ' + QOrdemCompraItemCOD_PRODUTO.AsString + ' AND ' +
                             ' TB_ORDEM_CARREGAMENTO_CAB.IND_SITUACAO = ' + CHR(39) + 'A' + CHR(39));

  if wVal <> '' then
    QOrdemCompraItemqtd_em_transito.Value := (strtofloat(wVal) * 1000) / wfloNumEmbalagem
  else
    QOrdemCompraItemqtd_em_transito.Value := 0;

  QOrdemCompraItemqtd_saldo_restante.Value := QOrdemCompraItemQT_PEDIDO.Value - QOrdemCompraItemQT_CANCELADO.Value - QOrdemCompraItemQT_ATENDIDO.Value - QOrdemCompraItemqtd_em_transito.Value;
end;

procedure TDMOrdemCarregamento.QROrdemCarregamentoCalcFields(
  DataSet: TDataSet);
var
  wfloNumEmbalagem : Real;
  wstrDescUnidade : String;
begin
  QROrdemCarregamentonome_motorista.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO =' + QROrdemCarregamentoCOD_MOTORISTA.Text);
  wfloNumEmbalagem := StrToFloat( DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO',
                      'TB_PRODUTO.COD_PRODUTO =' + QROrdemCarregamentoCOD_PRODUTO.Text) );
  wstrDescUnidade := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO',
                     'TB_PRODUTO.COD_PRODUTO =' + QROrdemCarregamentoCOD_PRODUTO.Text);

  If(Trim(wstrDescUnidade) = 'T')Then
    QROrdemCarregamentoqtd_produto.Value := QROrdemCarregamentoQTD_TONELADA.Value / wfloNumEmbalagem
  Else
    If(Trim(wstrDescUnidade) = 'SC')OR(Trim(wstrDescUnidade) = 'KG')Then
      QROrdemCarregamentoqtd_produto.Value := QROrdemCarregamentoQTD_TONELADA.Value * 1000 / wfloNumEmbalagem
    Else
      raise Exception.create('A Unidade do Produto escolhida não é T, KG nem SC');
  QROrdemCarregamentonome_destino.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO =' + QROrdemCarregamentoCOD_CADASTRO_DESTINO.Text);
  QROrdemCarregamentoendereco_destino.Text := DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_CADASTRO','COD_CADASTRO =' + QROrdemCarregamentoCOD_CADASTRO_DESTINO.Text);
  QROrdemCarregamentocidade_destino.Text := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CADASTRO','COD_CADASTRO =' + QROrdemCarregamentoCOD_CADASTRO_DESTINO.Text);
  QROrdemCarregamentobairro_destino.Text := DMOracle.BuscaNome('SELECT DESC_BAIRRO FROM TB_CADASTRO','COD_CADASTRO =' + QROrdemCarregamentoCOD_CADASTRO_DESTINO.Text);
  QROrdemCarregamentoestado_destino.Text := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO =' + QROrdemCarregamentoCOD_CADASTRO_DESTINO.Text);
end;

procedure TDMOrdemCarregamento.QOrdemCarregamentoCabAfterInsert(
  DataSet: TDataSet);
begin
  QOrdemCarregamentoCabDESC_EMISSOR.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO', 'COD_USUARIO = '+
                                                                  IntToStr(DMUsuario.CodUsuarioCorrente));
  QOrdemCarregamentoCabDT_EMISSAO.Value := Date;
  QOrdemCarregamentoCabIND_SITUACAO.Value := 'A';
  wPedagio := 0;
  wFreteTon := 0;
  wMotorista := 0;
  wPlaca_Veiculo := '';
  QOrdemCarregamentoItem.Insert;
end;

procedure TDMOrdemCarregamento.QROrdemCarregamentoSituacaoCalcFields(
  DataSet: TDataSet);
begin
  If(QROrdemCarregamentoSituacaoIND_TIPO_PGTO.Text <> '')Then
  Begin
    If(QROrdemCarregamentoSituacaoIND_TIPO_PGTO.Text = 'R')Then
      QROrdemCarregamentoSituacaodesc_tipo_pgto.Text := 'RPA';
    If(QROrdemCarregamentoSituacaoIND_TIPO_PGTO.Text = 'C')Then
      QROrdemCarregamentoSituacaodesc_tipo_pgto.Text := 'CONHECIMENTO';
    If(QROrdemCarregamentoSituacaoIND_TIPO_PGTO.Text = 'N')Then
      QROrdemCarregamentoSituacaodesc_tipo_pgto.Text := 'NENHUM';
  End;
  If( Trim(QROrdemCarregamentoSituacaoCOD_CADASTRO_DESTINO.Text) <> '' )Then
    QROrdemCarregamentoSituacaodesc_destino.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + Trim(QROrdemCarregamentoSituacaoCOD_CADASTRO_DESTINO.Text));
  If( Trim(QROrdemCarregamentoSituacaoCOD_MOTORISTA.Text) <> '' )Then
    QROrdemCarregamentoSituacaodesc_motorista.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + Trim(QROrdemCarregamentoSituacaoCOD_MOTORISTA.Text));
end;

procedure TDMOrdemCarregamento.QOrdemCarregamentoCabAfterEdit(
  DataSet: TDataSet);
begin
  QOrdemCarregamentoItem.Edit;
end;

procedure TDMOrdemCarregamento.QOrdemCarregamentoItemBeforePost(
  DataSet: TDataSet);
begin
  If(QOrdemCarregamentoCab.State = dsInsert)Then
  Begin
    QOrdemCarregamentoCab.Post;
    QOrdemCarregamentoCab.Edit;
  End;
end;

procedure TDMOrdemCarregamento.QOrdemCarregamentoCabAfterPost(
  DataSet: TDataSet);
begin
  If(QOrdemCarregamentoItem.State in [DsInsert,DsEdit])Then
    QOrdemCarregamentoItem.Post;
end;

procedure TDMOrdemCarregamento.QOrdemCarregamentoCabBeforePost(
  DataSet: TDataSet);
begin
  With DMOrdemCarregamento Do
  Begin
    If(QOrdemCarregamentoCabNUM_ORDEM_CARREGAMENTO.IsNull)Then
      QOrdemCarregamentoCabNUM_ORDEM_CARREGAMENTO.Value := DMSequencia.Sequencia(QOrdemCarregamentoCabCOD_FILIAL.Value,'ORDEM_CARREGAMENTO');
  End;
end;

procedure TDMOrdemCarregamento.QOrdemCarregamentoItemAfterPost(
  DataSet: TDataSet);
begin
  wMotorista := QOrdemCarregamentoItemCod_Motorista.Value;
  wFreteTon := QOrdemCarregamentoItemVal_Frete_Ton.Value;
  wPedagio := QOrdemCarregamentoItemVal_Pedagio.Value;
  wPlaca_Veiculo := QOrdemCarregamentoItemDesc_Placa_Veiculo.Value;

end;

procedure TDMOrdemCarregamento.QOrdemCarregamentoItemAfterInsert(
  DataSet: TDataSet);
begin
  QOrdemCarregamentoItemCod_Motorista.Value := wMotorista;
  QOrdemCarregamentoItemVal_Frete_Ton.Value := wFreteTon;
  QOrdemCarregamentoItemVal_Pedagio.Value := wPedagio;
  QOrdemCarregamentoItemDesc_Placa_Veiculo.Value := wPlaca_Veiculo;
end;

end.
