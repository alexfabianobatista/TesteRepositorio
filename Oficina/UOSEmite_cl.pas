unit UOSEmite_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, Controls, Forms, Variants, Dialogs,
  StrUtils;

type
  TDMOSEmite = class(TDataModule)
    QOrdemServico: TOracleDataSet1;
    QOrdemServicoCOD_CADASTRO: TIntegerField;
    QOrdemServicoCOD_FILIAL: TIntegerField;
    QOrdemServicoCOD_MECANICO: TIntegerField;
    QOrdemServicoCOD_OPERACAO: TIntegerField;
    QOrdemServicoCOD_VENDEDOR: TIntegerField;
    QOrdemServicoDESC_SERVICO: TStringField;
    QOrdemServicoDT_EMISSAO: TDateTimeField;
    QOrdemServicoDT_ENTRADA: TDateTimeField;
    QOrdemServicoDT_FECHAMENTO: TDateTimeField;
    QOrdemServicoDT_SAIDA: TDateTimeField;
    QOrdemServicoIND_CONDICAO_PAGTO: TIntegerField;
    QOrdemServicoIND_SITUACAO: TStringField;
    QOrdemServicoIND_TIPO_OS: TIntegerField;
    QOrdemServicoNUM_CHASSI: TStringField;
    QOrdemServicoNUM_OS: TIntegerField;
    QOrdemServicoNUM_TITULO: TIntegerField;
    QOrdemServicoVAL_NF_MAO_DE_OBRA: TFloatField;
    QOrdemServicoVAL_NF_PECAS: TFloatField;
    QOrdemServicoVAL_NF_PECAS_ISENTAS: TFloatField;
    QOrdemServicoVAL_NF_SERVICO_CHAPEACAO: TFloatField;
    QOrdemServicoVAL_NF_SERVICO_ELETRICO: TFloatField;
    QOrdemServicoVAL_NF_SERVICO_TERCEIRO: TFloatField;
    QOrdemServicoVAL_NF_MAO_DE_OBRA2: TFloatField;
    QOrdemServicoVAL_NF_PECAS2: TFloatField;
    QOrdemServicoVAL_NF_PECAS_ISENTAS2: TFloatField;
    QOrdemServicoVAL_NF_SERVICO_CHAPEACAO2: TFloatField;
    QOrdemServicoVAL_NF_SERVICO_ELETRICO2: TFloatField;
    QOrdemServicoVAL_NF_SERVICO_TERCEIRO2: TFloatField;
    QRequisicao: TOracleDataSet1;
    QRequisicaoCOD_FILIAL: TIntegerField;
    QRequisicaoCOD_MECANICO: TIntegerField;
    QRequisicaoCOD_VENDEDOR: TIntegerField;
    QRequisicaoDT_EMISSAO: TDateTimeField;
    QRequisicaoIND_SITUACAO: TStringField;
    QRequisicaoIND_TIPO_MOVIMENTO: TStringField;
    QRequisicaoNUM_OS: TIntegerField;
    QRequisicaoNUM_PEDIDO: TIntegerField;
    QRequisicaoNUM_REQUISICAO: TIntegerField;
    QRequisicaoVAL_TOTAL: TFloatField;
    QRequisicaoIt: TOracleDataSet1;
    QRequisicaoItCOD_FILIAL: TIntegerField;
    QRequisicaoItCOD_MECANICO: TIntegerField;
    QRequisicaoItCOD_PRODUTO: TFloatField;
    QRequisicaoItCOD_REQUISICAO_ITEM: TIntegerField;
    QRequisicaoItCOD_VENDEDOR: TIntegerField;
    QRequisicaoItDT_REQUISICAO_ITEM: TDateTimeField;
    QRequisicaoItIND_DESCONTO: TStringField;
    QRequisicaoItNUM_FABRICANTE: TStringField;
    QRequisicaoItNUM_REQUISICAO: TIntegerField;
    QRequisicaoItPERC_DESCONTO: TFloatField;
    QRequisicaoItQT_QUANTIDADE: TFloatField;
    QRequisicaoItVAL_CUSTO: TFloatField;
    QRequisicaoItVAL_UNITARIO: TFloatField;
    QServicoTerceiro: TOracleDataSet1;
    QServicoTerceiroCOD_CADASTRO: TIntegerField;
    QServicoTerceiroCOD_SERVICO: TIntegerField;
    QServicoTerceiroCOD_SERVICO_TERCEIRO: TIntegerField;
    QServicoTerceiroCOD_VENDEDOR: TIntegerField;
    QServicoTerceiroDESC_SERVICO: TStringField;
    QServicoTerceiroDT_SERVICO: TDateTimeField;
    QServicoTerceiroNUM_NOTA: TIntegerField;
    QServicoTerceiroNUM_OS: TIntegerField;
    QServicoTerceiroVAL_SERVICO: TFloatField;
    QRequisicaoItval_total: TFloatField;
    QRequisicaoItDESC_PRODUTO: TStringField;
    QRequisicaoItIND_TIPO_PRODUTO: TStringField;
    QOrdemServicoCOD_MENSAGEM: TIntegerField;
    QOrdemServicoVAL_DESCONTO: TFloatField;
    QOrdemServicoCOD_NOTA_CAB: TIntegerField;
    QOrdemServicoIND_VISTA_PRAZO: TIntegerField;
    QOrdemServicoCOD_SERIE: TStringField;
    QRequisicaoItDESC_REQUISICAO_ITEM: TStringField;
    QRequisicaoItVAL_PEDAGIO: TFloatField;
    QRequisicaoItVAL_REFEICAO: TFloatField;
    QRequisicaoItVAL_HOSPEDAGEM: TFloatField;
    QRequisicaoItval_despesa: TFloatField;
    QOrdemServicoDESC_FILIAL: TStringField;
    QOrdemServicoDESC_OS_TIPO: TStringField;
    QOrdemServicoNOME: TStringField;
    QRequisicaoProduto: TOracleDataSet1;
    QRequisicaoServico: TOracleDataSet1;
    QRequisicaoVeiculo: TOracleDataSet1;
    QRequisicaoProdutoCOD_FILIAL: TIntegerField;
    QRequisicaoProdutoCOD_MECANICO: TIntegerField;
    QRequisicaoProdutoCOD_PRODUTO: TFloatField;
    QRequisicaoProdutoCOD_REQUISICAO_ITEM: TIntegerField;
    QRequisicaoProdutoDESC_REQUISICAO_ITEM: TStringField;
    QRequisicaoProdutoCOD_VENDEDOR: TIntegerField;
    QRequisicaoProdutoDT_REQUISICAO_ITEM: TDateTimeField;
    QRequisicaoProdutoIND_DESCONTO: TStringField;
    QRequisicaoProdutoNUM_FABRICANTE: TStringField;
    QRequisicaoProdutoNUM_REQUISICAO: TIntegerField;
    QRequisicaoProdutoPERC_DESCONTO: TFloatField;
    QRequisicaoProdutoQT_QUANTIDADE: TFloatField;
    QRequisicaoProdutoVAL_CUSTO: TFloatField;
    QRequisicaoProdutoVAL_UNITARIO: TFloatField;
    QRequisicaoProdutoVAL_PEDAGIO: TFloatField;
    QRequisicaoProdutoVAL_REFEICAO: TFloatField;
    QRequisicaoProdutoVAL_HOSPEDAGEM: TFloatField;
    QRequisicaoProdutoDESC_PRODUTO: TStringField;
    QRequisicaoProdutoIND_TIPO_PRODUTO: TStringField;
    QRequisicaoProdutoval_total: TFloatField;
    QRequisicaoServicoCOD_FILIAL: TIntegerField;
    QRequisicaoServicoCOD_MECANICO: TIntegerField;
    QRequisicaoServicoCOD_PRODUTO: TFloatField;
    QRequisicaoServicoCOD_REQUISICAO_ITEM: TIntegerField;
    QRequisicaoServicoCOD_VENDEDOR: TIntegerField;
    QRequisicaoServicoDT_REQUISICAO_ITEM: TDateTimeField;
    QRequisicaoServicoIND_DESCONTO: TStringField;
    QRequisicaoServicoNUM_FABRICANTE: TStringField;
    QRequisicaoServicoNUM_REQUISICAO: TIntegerField;
    QRequisicaoServicoPERC_DESCONTO: TFloatField;
    QRequisicaoServicoQT_QUANTIDADE: TFloatField;
    QRequisicaoServicoVAL_CUSTO: TFloatField;
    QRequisicaoServicoVAL_UNITARIO: TFloatField;
    QRequisicaoServicoVAL_PEDAGIO: TFloatField;
    QRequisicaoServicoVAL_REFEICAO: TFloatField;
    QRequisicaoServicoVAL_HOSPEDAGEM: TFloatField;
    QRequisicaoServicoDESC_PRODUTO: TStringField;
    QRequisicaoServicoIND_TIPO_PRODUTO: TStringField;
    QRequisicaoServicoval_total: TFloatField;
    QRequisicaoVeiculoCOD_FILIAL: TIntegerField;
    QRequisicaoVeiculoCOD_MECANICO: TIntegerField;
    QRequisicaoVeiculoCOD_PRODUTO: TFloatField;
    QRequisicaoVeiculoCOD_REQUISICAO_ITEM: TIntegerField;
    QRequisicaoVeiculoDESC_REQUISICAO_ITEM: TStringField;
    QRequisicaoVeiculoCOD_VENDEDOR: TIntegerField;
    QRequisicaoVeiculoDT_REQUISICAO_ITEM: TDateTimeField;
    QRequisicaoVeiculoIND_DESCONTO: TStringField;
    QRequisicaoVeiculoNUM_FABRICANTE: TStringField;
    QRequisicaoVeiculoNUM_REQUISICAO: TIntegerField;
    QRequisicaoVeiculoPERC_DESCONTO: TFloatField;
    QRequisicaoVeiculoQT_QUANTIDADE: TFloatField;
    QRequisicaoVeiculoVAL_CUSTO: TFloatField;
    QRequisicaoVeiculoVAL_UNITARIO: TFloatField;
    QRequisicaoVeiculoVAL_PEDAGIO: TFloatField;
    QRequisicaoVeiculoVAL_REFEICAO: TFloatField;
    QRequisicaoVeiculoVAL_HOSPEDAGEM: TFloatField;
    QRequisicaoVeiculoDESC_PRODUTO: TStringField;
    QRequisicaoVeiculoIND_TIPO_PRODUTO: TStringField;
    QRequisicaoVeiculoval_total: TFloatField;
    QServicoTerceiroIt: TOracleDataSet1;
    QServicoTerceiroItDESC_PRODUTO: TStringField;
    QServicoTerceiroItQT_QUANTIDADE: TFloatField;
    QServicoTerceiroItVAL_UNITARIO: TFloatField;
    QServicoTerceiroItVAL_TOTAL: TFloatField;
    QServicoTerceiroItDT_REQUISICAO_ITEM: TDateTimeField;
    QServicoTerceiroItCOD_VENDEDOR: TIntegerField;
    QRequisicaoVeiculoval_despesa: TFloatField;
    QServicoTerceiroItCOD_PRODUTO: TIntegerField;
    QRequisicaoItPorClasse: TOracleDataSet1;
    QRequisicaoItPorClasseCOD_CLASSE: TIntegerField;
    QRequisicaoItPorClasseDESC_CLASSE: TStringField;
    QRequisicaoItPorClasseVAL_TOTAL: TFloatField;
    QOSItem: TOracleDataSet1;
    QOSItemCOD_OS_ITEM: TIntegerField;
    QOSItemCOD_PRODUTO: TFloatField;
    QOSItemQT_QUANTIDADE: TFloatField;
    QOSItemVAL_UNITARIO: TFloatField;
    QOSItemVAL_TOTAL: TFloatField;
    QOSItemIND_TIPO: TStringField;
    QOSItemNUM_OS: TIntegerField;
    QOSItemCOD_TRIBUTACAO: TIntegerField;
    QOSItemDESC_COMPLEMENTO: TStringField;
    QOSItemVAL_DESPESA: TFloatField;
    QOSItemVAL_DESCONTO: TFloatField;
    QOSItemVAL_CUSTO: TFloatField;
    QOSItemCOD_LOTE_TIPO: TIntegerField;
    function GeraNotaBanco(wNumOS: Integer; wCommit: Boolean;
      wProdutos: Boolean = True; wServicos: Boolean = True;
      wOperacao: Integer = 0; PermitirSemItens: Boolean = False;
      wNumero: Integer = 0): Integer;
//    procedure CalculaISS;
    procedure SetaEmissao(wNumOS: Integer);
    procedure QRequisicaoItCalcFields(DataSet: TDataSet);
    procedure VoltaNotaBanco(wNumOS: Integer; wCommit: Boolean);
    procedure ClearVariablesClose(DataSet: TDataSet);
  private
  public
    procedure EmiteOS(wNumOS: Integer; wSimplificada: Boolean = False);
    function GeraNotaBancoByOSItem(wNumOS: Integer; wProdutos: Boolean = True; wServicos: Boolean = True;
      wOperacao: Integer = 0; wNumero: Integer = 0; wVariacao: Real = 0): Integer;
  end;

var
  DMOSEmite: TDMOSEmite;

implementation

uses UOracle_cl, UNotaSaida_cl, USerie_cl, UOficina_cl, UParamSistema_cl,
  UOperacao_cl, UNotaSaida_Cancela, UImpressoraFiscal, UBiblioteca, Math,
  UNotaImpressao;

{$R *.dfm}

procedure TDMOSEmite.SetaEmissao(wNumOS: Integer);
begin
  QOrdemServico.Close;
  QServicoTerceiro.Close;
  QServicoTerceiroIt.Close;
  QRequisicao.Close;
  QRequisicaoIt.Close;
  QRequisicaoProduto.Close;
  QRequisicaoServico.Close;
  QRequisicaoVeiculo.Close;
  QRequisicaoItPorClasse.Close;
  QOSItem.Close;

  QOrdemServico.SetVariable('NUM_OS', wNumOS);
  QServicoTerceiro.SetVariable('NUM_OS', wNumOS);
  QRequisicao.SetVariable('NUM_OS', wNumOS);
  QRequisicaoItPorClasse.SetVariable('NUM_OS', wNumOS);
  QOSItem.SetVariable('NUM_OS', wNumOS);

  QOrdemServico.Open;
  QServicoTerceiro.Open;
  QServicoTerceiroIt.Open;
  QRequisicao.Open;
  QRequisicaoIt.Open;
  QRequisicaoProduto.Open;
  QRequisicaoServico.Open;
  QRequisicaoVeiculo.Open;
  QRequisicaoItPorClasse.Open;
  QOSItem.Open;
end;

function TDMOSEmite.GeraNotaBanco(wNumOS: Integer; wCommit: Boolean;
  wProdutos: Boolean = True; wServicos: Boolean = True;
  wOperacao: Integer = 0; PermitirSemItens: Boolean = False;
  wNumero: Integer = 0): Integer; // GERA UMA NOTA CONFIRMADA NO BANCO
  procedure fecha;
  begin
    QOrdemServico.Close;
    QRequisicao.Close;
    QRequisicaoIt.Close;
    QServicoTerceiro.Close;
  end;
var
  wTrib, wTipo, wSerie, wSerieModelo, wEstado: string;
  Buscador: TBuscador;
begin
  SetaEmissao(wNumOS);
  Buscador := TBuscador.Create;
  Buscador.Limpa;
  Buscador.Adiciona('COD_ESTADO', 'TB_CADASTRO', 'COD_CADASTRO = ' + QOrdemServicoCOD_CADASTRO.Text);
  Buscador.Adiciona('COD_SERIE', 'TB_OPERACAO', 'COD_OPERACAO = ' +
    IntToStr(IfThen(wOperacao > 0, wOperacao, QOrdemServicoCOD_OPERACAO.Value)));
  Buscador.Adiciona('COD_SERIE_MODELO', 'TB_OPERACAO', 'COD_OPERACAO = ' +
    IntToStr(IfThen(wOperacao > 0, wOperacao, QOrdemServicoCOD_OPERACAO.Value)));
  Buscador.Buscar;

  wEstado := Buscador.Proximo;
  wSerie := Buscador.Proximo;
  wSerieModelo := Buscador.Proximo;

  with DMNotaSaida do
  begin
    QNotaSaida.Close;
    QNotaSaida.Open;
    QItemNF.Close;
    QItemNF.Open;
    QNotaSaida.Insert;
    QNotaSaidaCOD_FILIAL.Value := QOrdemServicoCOD_FILIAL.Value;
    QNotaSaidaCOD_CADASTRO.Value := QOrdemServicoCOD_CADASTRO.Value;
    QNotaSaidaCOD_OPERACAO.Value := IfThen(wOperacao > 0, wOperacao, QOrdemServicoCOD_OPERACAO.Value);
    if QOrdemServicoCOD_MENSAGEM.Value > 0 then
      QNotaSaidaCOD_MENSAGEM.Value := QOrdemServicoCOD_MENSAGEM.Value;
    QNotaSaidaCOD_ESTADO.Value := wEstado;
    QNotaSaidaIND_CONDICAO_PAGTO.Value := IntToStr(QOrdemServicoIND_VISTA_PRAZO.Value);
    QNotaSaidaCOD_SERIE.Value := IfThen(wSerie = '', QOrdemServicoCOD_SERIE.Value, wSerie);
    QNotaSaidaCOD_SERIE_MODELO.Value := wSerieModelo;
    QNotaSaidaNUM_NOTA.Value := 0; //Será atribuído depois
    QNotaSaidaNUM_OS.Value := QOrdemServicoNUM_OS.Value;
    QNotaSaidaCOD_VENDEDOR.Value := QOrdemServicoCOD_VENDEDOR.Value; //Cod_Vendedor não estava indo pra notacab corretamente. Junior - 11/02/2014.
    QNotaSaida.Post;
    Result := QNotaSaidaCOD_NOTA_CAB.Value;
    QNotaSaida.Edit;

    QRequisicaoIt.First; //------------------------------------ PRODUTOS
    while not QRequisicaoIt.Eof do
    begin
      Buscador := TBuscador.Create;
      Buscador.Limpa;
      Buscador.Adiciona('COD_TRIBUTACAO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QRequisicaoItCOD_PRODUTO.Text);
      Buscador.Adiciona('IND_TIPO_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QRequisicaoItCOD_PRODUTO.Text);
      Buscador.Buscar;
      wTrib := Buscador.Proximo;
      wTipo := Buscador.Proximo;

      if ((wServicos) and (wTipo = 'SERVIÇO')) or ((wProdutos) and (wTipo <> 'SERVIÇO')) then
      begin
        QItemNF.Insert;
        QItemNFCOD_TRIBUTACAO.Value := StrToInt('0' + wTrib);
        QItemNFCOD_PRODUTO.Value := QRequisicaoItCOD_PRODUTO.Value;
        QItemNFDESC_COMPLEMENTO.Value := QRequisicaoItDESC_PRODUTO.Value;
        QItemNFQT_QUANTIDADE.Value := QRequisicaoItQT_QUANTIDADE.Value;
        QItemNFVAL_UNITARIO.Value := QRequisicaoItVAL_UNITARIO.Value;
        QItemNFVAL_TOTAL.Value := QRequisicaoItval_total.Value;
        QItemNFVAL_DESPESAS.Value := QRequisicaoItval_despesa.Value;
        QItemNFVAL_DESCONTO.Value := QRequisicaoItval_total.Value * (QRequisicaoItPERC_DESCONTO.Value / 100);
        QItemNFVAL_CUSTO.Value := QRequisicaoItVAL_CUSTO.Value;
        QItemNFVAL_IPI.Value := 0;
        QItemNFCOD_LOTE_TIPO.Value := 1;
        QItemNF.Post;
      end;

      QRequisicaoIt.Next;
    end;

    if wServicos then
    begin
      if DMParamSistema.CodEmpresa = 'MEDIBENS' then
      begin
        QServicoTerceiro.First;
        while not QServicoTerceiro.Eof do
        begin
          QItemNF.Insert;
          QItemNFCOD_TRIBUTACAO.Value := StrToInt(DMOracle.FastSelect('COD_TRIBUTACAO',
            'TB_PRODUTO', 'COD_PRODUTO = ' + QServicoTerceiroCOD_SERVICO.Text));
          QItemNFCOD_PRODUTO.Value := QServicoTerceiroCOD_SERVICO.Value;
          QItemNFDESC_COMPLEMENTO.Value := QServicoTerceiroDESC_SERVICO.Value;
          QItemNFQT_QUANTIDADE.Value := 1;
          QItemNFVAL_UNITARIO.Value := QServicoTerceiroVAL_SERVICO.Value;
          QItemNFVAL_TOTAL.Value := QServicoTerceiroVAL_SERVICO.Value;
          QItemNFVAL_IPI.Value := 0;
          QItemNFCOD_LOTE_TIPO.Value := 1;
          QItemNF.Post;

          QServicoTerceiro.Next;
        end;
      end
      else
      begin
        QServicoTerceiroIt.First;
        while not QServicoTerceiroIt.Eof do
        begin
          QItemNF.Insert;
          QItemNFCOD_TRIBUTACAO.Value := StrToInt(DMOracle.FastSelect('COD_TRIBUTACAO',
            'TB_PRODUTO', 'COD_PRODUTO = ' + QServicoTerceiroItCOD_PRODUTO.Text));
          QItemNFCOD_PRODUTO.Value := QServicoTerceiroItCOD_PRODUTO.Value;
          QItemNFDESC_COMPLEMENTO.Value := QServicoTerceiroItDESC_PRODUTO.Value;
          QItemNFQT_QUANTIDADE.Value := QServicoTerceiroItQT_QUANTIDADE.Value;
          QItemNFVAL_UNITARIO.Value := QServicoTerceiroItVAL_UNITARIO.Value;
          QItemNFVAL_TOTAL.Value := QServicoTerceiroItVAL_TOTAL.Value;
          QItemNFVAL_IPI.Value := 0;
          QItemNFCOD_LOTE_TIPO.Value := 1;
          QItemNF.Post;

          QServicoTerceiroIt.Next;
        end;
      end;
    end;
    QItemNF.First;
    if (not PermitirSemItens) and (QItemNF.Eof) then
    begin
      QNotaSaida.Post;
      QNotaSaida.Delete;
      Result := 0;
      fecha;
      Exit;
    end;
    QNotaSaidaVAL_DESCONTO.Value := QOrdemServicoVAL_DESCONTO.Value;
    QNotaSaidaIND_SITUACAO.Value := '2'; //lancar como nota confirmada
    if wNumero = 0 then
    begin
      if wSerie = '' then
        wNumero := QOrdemServicoNUM_TITULO.Value
      else
        wNumero := DMSerie.NumeroSerie(QNotaSaidaCOD_FILIAL.Value, wSerie, wSerieModelo);
    end;
    QNotaSaidaNUM_NOTA.Value := wNumero;
    QNotaSaida.Post;
    try
      if (wCommit) and (DMOracle.DBCemapa.InTransaction) then
        DMOracle.DBCemapa.Commit;
    except
      if (wCommit) then
        DMOracle.DBCemapa.Rollback;
      raise;
    end;
  end;

  if (wCommit) and (DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.Commit;

  fecha;
end;

function TDMOSEmite.GeraNotaBancoByOSItem(wNumOS: Integer; wProdutos: Boolean = True; wServicos: Boolean = True;
  wOperacao: Integer = 0; wNumero: Integer = 0; wVariacao: Real = 0): Integer; // GERA UMA NOTA CONFIRMADA NO BANCO
  procedure fecha;
  begin
    QOrdemServico.Close;
    QRequisicao.Close;
    QRequisicaoIt.Close;
    QServicoTerceiro.Close;
  end;
var
  wTipo, wSerie, wSerieModelo, wEstado, wNumProdutos, wNumServicos, wPlaca: string;
  Buscador: TBuscador;
begin
  Result := 0;
  if not (wProdutos or wServicos) then
    Exit;

  SetaEmissao(wNumOS);
  Buscador := TBuscador.Create;
  Buscador.Limpa;
  Buscador.Adiciona('COUNT(*)', 'TB_OS_ITEM', 'NUM_OS = ' + IntToStr(wNumOs) +
    ' AND IND_TIPO = ' + QuotedStr('S')); //Número de serviços
  Buscador.Adiciona('COUNT(*)', 'TB_OS_ITEM', 'NUM_OS = ' + IntToStr(wNumOs) +
    ' AND IND_TIPO = ' + QuotedStr('P')); //Número de produtos
  Buscador.Adiciona('COD_ESTADO', 'TB_CADASTRO', 'COD_CADASTRO = ' + QOrdemServicoCOD_CADASTRO.Text);
  Buscador.Adiciona('COD_SERIE', 'TB_OPERACAO', 'COD_OPERACAO = ' +
    IntToStr(IfThen(wOperacao > 0, wOperacao, QOrdemServicoCOD_OPERACAO.Value)));
  Buscador.Adiciona('COD_SERIE_MODELO', 'TB_OPERACAO', 'COD_OPERACAO = ' +
    IntToStr(IfThen(wOperacao > 0, wOperacao, QOrdemServicoCOD_OPERACAO.Value)));
  Buscador.Buscar;

  wNumServicos := Buscador.Proximo;
  wNumProdutos := Buscador.Proximo;
  if not (wProdutos and wServicos) then
  begin
    if (wProdutos) and (wNumProdutos = '0') then
      Exit;
    if (wServicos) and (wNumServicos = '0') then
      Exit;
  end;

  wEstado := Buscador.Proximo;
  wSerie := Buscador.Proximo;
  wSerieModelo := Buscador.Proximo;

  with DMNotaSaida do
  begin
    QNotaSaida.Close;
    QNotaSaida.Open;
    QItemNF.Close;
    QItemNF.Open;
    QNotaSaida.Insert;
    QNotaSaidaCOD_FILIAL.Value := QOrdemServicoCOD_FILIAL.Value;
    QNotaSaidaCOD_CADASTRO.Value := QOrdemServicoCOD_CADASTRO.Value;
    QNotaSaidaCOD_OPERACAO.Value := IfThen(wOperacao > 0, wOperacao, QOrdemServicoCOD_OPERACAO.Value);
    if QOrdemServicoCOD_MENSAGEM.Value > 0 then
      QNotaSaidaCOD_MENSAGEM.Value := QOrdemServicoCOD_MENSAGEM.Value;
    QNotaSaidaCOD_ESTADO.Value := wEstado;
    QNotaSaidaIND_CONDICAO_PAGTO.Value := IntToStr(QOrdemServicoIND_VISTA_PRAZO.Value);
    QNotaSaidaCOD_SERIE.Value := IfThen(wSerie = '', QOrdemServicoCOD_SERIE.Value, wSerie);
    QNotaSaidaCOD_SERIE_MODELO.Value := wSerieModelo;
    QNotaSaidaNUM_NOTA.Value := 0; //Será atribuído depois
    QNotaSaidaNUM_OS.Value := QOrdemServicoNUM_OS.Value;
    QNotaSaidaCOD_VENDEDOR.Value := QOrdemServicoCOD_VENDEDOR.Value;//O vendedor da OS não estava indo pra NotaCab corretamente. Junior - 11/02/2014
    wPlaca := '';
    if (QOrdemServicoNUM_CHASSI.Value <> '') then
      wPlaca := dmoracle.FastSelect('NUM_PLACA', 'TB_VEICULO', 'NUM_CHASSI = ' + QuotedStr(QOrdemServicoNUM_CHASSI.Value));

    if (wServicos) then
      QNotaSaidaDESC_OBS_CORPO_NOTA.Value := QOrdemServicoDESC_SERVICO.Text +'\nOS NUMERO: ' +
        QOrdemServicoNUM_OS.Text + ' PLACA: ' + wPlaca
    else
      QNotaSaidaDESC_OBS_CORPO_NOTA.Value := '\nOS NUMERO: ' + QOrdemServicoNUM_OS.Text + ' PLACA: ' + wPlaca;


    if QOrdemServicoIND_VISTA_PRAZO.Value = 1 then
    begin
      QNotaSaidaDESC_OBS_CORPO_NOTA.Value :=
        QNotaSaidaDESC_OBS_CORPO_NOTA.Value + '\nPAGAMENTO A VISTA.';
    end;
    QNotaSaidaDESC_OBS_CORPO_NOTA.Value :=
      QNotaSaidaDESC_OBS_CORPO_NOTA.Value + '\nEMPRESA OPTANTE PELO SIMPLES.';
    QNotaSaida.Post;
    Result := QNotaSaidaCOD_NOTA_CAB.Value;
    QNotaSaida.Edit;

    QOSItem.First;
    while not QOSItem.Eof do
    begin
      wTipo := QOSItemIND_TIPO.Value;
      if ((wServicos) and (wTipo = 'S')) or ((wProdutos) and (wTipo = 'P')) then
      begin
        pConfirmando := true;
        QItemNF.Insert;
        QItemNFCOD_PRODUTO.Value := QOSItemCOD_PRODUTO.Value;
        QItemNFDESC_COMPLEMENTO.Value := QOSItemDESC_COMPLEMENTO.Value;
        QItemNFQT_QUANTIDADE.Value := QOSItemQT_QUANTIDADE.Value;
        QItemNFVAL_UNITARIO.Value := QOSItemVAL_UNITARIO.Value - (QOSItemVAL_DESCONTO.Value / QOSItemQT_QUANTIDADE.Value);
        QItemNFVAL_TOTAL.Value := QOSItemVAL_TOTAL.Value - QOSItemVAL_DESCONTO.Value;
        QItemNFVAL_DESPESAS.Value := QOSItemVAL_DESPESA.Value;
        QItemNFVAL_DESCONTO.Value := 0;
        QItemNFVAL_CUSTO.Value := QOSItemVAL_CUSTO.Value;
        QItemNFVAL_IPI.Value := 0;
        QItemNFCOD_LOTE_TIPO.Value := QOSItemCOD_LOTE_TIPO.Value;
        QItemNFCOD_TRIBUTACAO.Value := QOSItemCOD_TRIBUTACAO.Value;
        QItemNF.Post;
        if QItemNF.RecordCount = 1 then
        begin
          QItemNF.Edit;
          QItemNF.Post;
        end;
      end;

      QOSItem.Next;
    end;
    QNotaSaidaIND_SITUACAO.Value := '2'; //lancar como nota confirmada
    pConfirmando := false;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MEDIBENS' then
    begin
      if wVariacao > 0 then
        QNotaSaidaVAL_DESPESAS.Value := wVariacao
      else
        QNotaSaidaVAL_DESCONTO.Value := (wVariacao * -1);
    end;
    
    if wNumero = 0 then
    begin
      if wSerie = '' then
        wNumero := QOrdemServicoNUM_TITULO.Value
      else
        wNumero := DMSerie.NumeroSerie(QNotaSaidaCOD_FILIAL.Value, wSerie, wSerieModelo);
    end;
    QNotaSaidaNUM_NOTA.Value := wNumero;
    if (wServicos) then
      QNotaSaidaDESC_OBS_CORPO_NOTA.Value :=
        QNotaSaidaDESC_OBS_CORPO_NOTA.Value + '\nNúm. RPS: ' + IntToStr(wNumero);
    pConfirmando := true;
    QNotaSaida.Post;
  end;
  fecha;
end;

//procedure TDMOSEmite.CalculaISS;
//Var wPercISS : String;
//begin
//  wPercISS := DMOracle.BuscaNome('SELECT PERC_ISS FROM TB_PRODUTO','COD_PRODUTO = ' + FloatToStr(DMNotaSaida.QItemNFCod_Produto.Value),True);
//  If Trim(wPercISS) <> '' then
//    If DMOracle.BuscaNome('SELECT IND_REGIME_ESPECIAL FROM TB_CADASTRO','COD_CADASTRO = ' + FloatToStr(DMNotaSaida.QNotaSaidaCod_Cadastro.Value)) <> 'SIM' Then
//      DMNotaSaida.QItemNFVal_ISS.Value := DMNotaSaida.QItemNFVal_Total.Value * StrToFloat(wPercISS)/100;
//end;
//

procedure TDMOSEmite.QRequisicaoItCalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('val_total').Value := FieldByName('QT_QUANTIDADE').Value *
      FieldByName('VAL_UNITARIO').Value;
    if (DataSet = QRequisicaoIt) or (DataSet = QRequisicaoVeiculo) then
    begin
      FieldByName('val_despesa').Value := FieldByName('VAL_PEDAGIO').Value +
        FieldByName('VAL_REFEICAO').Value + FieldByName('VAL_HOSPEDAGEM').Value;
//      FieldByName('val_total').Value := FieldByName('val_total').Value +
//          FieldByName('val_despesa').Value;
    end;
  end;
end;

procedure TDMOSEmite.VoltaNotaBanco(wNumOS: Integer; wCommit: Boolean);
begin
  QOrdemServico.Close;
  QOrdemServico.SetVariable('NUM_OS', wNumOs);
  QOrdemServico.open;

  if QOrdemServicoCOD_NOTA_CAB.Text <> '' then
  try
    DMNotaSaida.QItemNF.Close;
    DMNotaSaida.QNotaSaida.close;
    DMNotaSaida.QNotaSaida.SetVariable('PK', QOrdemServicoCOD_NOTA_CAB.Value);
    DMNotaSaida.QNotaSaida.open;
    DMNotaSaida.QItemNF.open;

    DMNotaSaida.VoltaConfirmacao; // Volta Confirmação da NF

    if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' then // Cancela a NF
      raise Exception.Create('Não é possivel cancelar uma Nota confirmada!');
    if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '3' then
      raise Exception.Create('Esta Nota Fiscal já está cancelada!');
    if DMOracle.BuscaNome('SELECT COD_RPA FROM TB_RPA', 'COD_NOTA_CAB = ' + FloatToStr(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value)) <> '' then
      raise Exception.Create('Esta Nota Possui um RPA - Favor Verificar!');
    if FNotaSaida_Cancela = nil then
      FNotaSaida_Cancela := TFNotaSaida_Cancela.Create(Application);
    if FNotaSaida_Cancela.ShowModal = MrOk then
    begin
      if DMOperacao.QOperacaoIND_CUPOM_FISCAL.Value = 'S' then
      begin
        if FImpressoraFiscal = nil then
          FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL' then
          FImpressoraFiscal.Y8000ECF('1E')
        else
        begin
          iRetorno := Bematech_FI_CancelaCupom();
          FImpressoraFiscal.Analisa_iRetorno();
          FImpressoraFiscal.Retorno_Impressora();
        end;
      end;
    end;

    if (wCommit) and (DMOracle.DBCemapa.InTransaction) then
      DMOracle.DBCemapa.Commit;
  except
    if wCommit then
      DMOracle.DBCemapa.Rollback;
    QOrdemServico.Close;
    raise;
  end;
  QOrdemServico.Close;
end;

procedure TDMOSEmite.EmiteOS(wNumOS: Integer; wSimplificada: Boolean = False);
  function imprimeItens(wTitulo: string; i: TImp; DataSet: TDataSet; var wLinha: Integer; wServico: Boolean = False): Real;
  var
    wDespesa: Real;
  begin
    Result := 0;
    if not DataSet.Eof then
    begin
      i.WriteXY(0.2, wLinha, wTitulo);

      Inc(wLinha);
      i.WriteXY(0.2, wLinha, Bib.Chars('-', 133));

      Inc(wLinha);
      if not wServico then
        i.WriteXY(0.2, wLinha, 'Cod. Fab.');
      i.WriteXY(2.9, wLinha, 'Descricao');
      i.WriteXY(9.5, wLinha, 'Qtde');
      i.WriteXY(13.5, wLinha, 'Vlr. Un.');
      i.WriteXY(15, wLinha, 'Vlr. Tot.');
      i.WriteXY(18, wLinha, 'Data');

      Inc(wLinha);
      i.WriteXY(0.2, wLinha, Bib.Chars('-', 133));

      wDespesa := 0;
      while not DataSet.Eof do
      begin
        Inc(wLinha);
        with DataSet do
        begin
          if not wServico then
            i.WriteXY(0.2, wLinha, FieldByName('NUM_FABRICANTE').Text);
          i.WriteXY(2.9, wLinha, FieldByName('DESC_PRODUTO').Value);
          i.WriteXY(9.4, wLinha, Bib.NumToTexto(FieldByName('QT_QUANTIDADE').Value, 0, 5));
          i.WriteXY(13.5, wLinha, Bib.NumToTexto(FieldByName('VAL_UNITARIO').Value, 2, 9));
          i.WriteXY(14.9, wLinha, Bib.NumToTexto(FieldByName('val_total').Value, 2, 10));
          i.WriteXY(18, wLinha, FieldByName('DT_REQUISICAO_ITEM').Text);

          if (Dataset.FindField('val_despesa') <> nil) and (FieldByName('val_despesa').Value <> null) then
            wDespesa := wDespesa + FieldByName('val_despesa').Value;
          Result := Result + FieldByName('val_total').Value + wDespesa;

          Next;
        end;
        if wLinha >= 60 then
        begin
          i.SaltaPagina;
          wLinha := 0;
        end;
      end;

      if wDespesa > 0 then
      begin
        Inc(wLinha);
        i.WriteXY(7.5, wLinha, 'DESPESAS EXTRAS' + Bib.Chars('.', 21) + ': ');
        i.WriteXY(14.9, wLinha, Bib.NumToTexto(wDespesa, 2, 10));
      end;
      Inc(wLinha);
      i.WriteXY(7.5, wLinha, 'TOTAL ' + wTitulo + Bib.Chars('.', 30 - Length(wTitulo)) + ': ');
      i.WriteXY(14.9, wLinha, Bib.NumToTexto(Result, 2, 10));
    end;
  end;
  function totaliza(DataSet: TDataSet; campo: string = 'val_total'): Real;
  begin
    Result := 0;
    DataSet.First;
    while not DataSet.Eof do
      with DataSet do
      begin
        Result := Result + FieldByName(campo).Value;
        Next;
      end;
  end;
var
  wFecha: Boolean;
  wLinha: Integer;
  wLpt: string;
  wTotalPeca, wTotalServico, wTotalServicoTerceiro, wTotalVeiculo, wTotal: Real;
begin
  //Impressao da OS

  SetaEmissao(wNumOS);

  if QOrdemServico.Eof then
    Exit;
  wFecha := (QOrdemServicoIND_SITUACAO.Value = 'F'); // Se estiver fechada, emite Fechamento, senão emite Pré-Fechamento

  if QOrdemServicoCOD_FILIAL.Value > 0 then
    wLpt := DMOracle.BuscaNome('SELECT DESC_LPT_OS FROM TB_FILIAL', 'COD_FILIAL = ' + QOrdemServicoCOD_FILIAL.Text);

  if Trim(wLpt) = '' then
    wLpt := 'LPT1';

  if Imp = nil then
    Imp := TImp.Create;
  if wLpt = 'LPT1' then
    Imp.AbreImpressora
  else if wLpt = 'LPT2' then
    Imp.AbreImpressora_Lpt2
  else
    Imp.AbreImpressora_Com2;

  Imp.ConfiguraImpressora('CONDENSADO_ON', 'SEXTOS', 66);

  wLinha := 2;
  Imp.WriteXY(0.2, wLinha, QOrdemServicoDESC_FILIAL.Value);
  Imp.WriteXY(17.3, wLinha, DateTimeToStr(Now));

  Inc(wLinha, 2);
  Imp.WriteXY(0.2, wLinha, Bib.ift(wFecha, '', 'PRE-') + 'FECHAMENTO - Nr. O.S.: ' + QOrdemServicoNUM_OS.Text);
  Imp.WriteXY(7.5, wLinha, 'TIPO: ' + QOrdemServicoIND_TIPO_OS.Text + ' - ' + QOrdemServicoDESC_OS_TIPO.Value);

  Inc(wLinha);
  if wFecha then
    Imp.WriteXY(0.2, wLinha, 'DATA FECHAMENTO: ' + QOrdemServicoDT_FECHAMENTO.Text);

  Inc(wLinha, 2);
  Imp.WriteXY(0.2, wLinha, 'CLIENTE: ' + QOrdemServicoCOD_CADASTRO.Text + ' - ' + QOrdemServicoNOME.Value);

  Inc(wLinha, 2);
  wTotalServico := imprimeItens('SERVICOS EXECUTADOS', Imp, QRequisicaoServico, wLinha, True);
  Inc(wLinha, 2);
  wTotalServicoTerceiro := imprimeItens('SERVICOS DE TERCEIROS', Imp, QServicoTerceiroIt, wLinha, True);
  Inc(wLinha, 2);
  if wSimplificada then
  begin
    wTotalPeca := totaliza(QRequisicaoProduto);
    wTotalServico := totaliza(QRequisicaoServico);
    wTotalServicoTerceiro := totaliza(QServicoTerceiroIt);
    wTotalVeiculo := totaliza(QRequisicaoVeiculo, 'QT_QUANTIDADE');
    Imp.WriteXY(0.2, wLinha, 'TOTAL PECAS..................: ' + Bib.NumToTexto(wTotalPeca, 2, 9));
    Inc(wLinha);
    Imp.WriteXY(0.2, wLinha, 'TOTAL KM DESLOCAMENTO........: ' + Bib.NumToTexto(wTotalVeiculo, 0, 6));
    wTotalVeiculo := totaliza(QRequisicaoVeiculo) + totaliza(QRequisicaoVeiculo, 'val_despesa');
    Inc(wLinha);
    Imp.WriteXY(0.2, wLinha, 'TOTAL GASTOS COM VEICULOS....: ' + Bib.NumToTexto(wTotalVeiculo, 2, 9));
  end
  else
  begin
    wTotalPeca := imprimeItens('RELACAO DE PECAS', Imp, QRequisicaoProduto, wLinha);
    Inc(wLinha, 2);
    wTotalVeiculo := imprimeItens('TAXA DE LOCOMOCAO', Imp, QRequisicaoVeiculo, wLinha, True);
  end;
  wTotal := wTotalPeca + wTotalServico + wTotalServicoTerceiro + wTotalVeiculo;

  Inc(wLinha, 3);
  QRequisicaoItPorClasse.First;
  while not QRequisicaoItPorClasse.Eof do
  begin
    Imp.WriteXY(0.2, wLinha, 'TOTAL ' + QRequisicaoItPorClasseDESC_CLASSE.Value +
      bib.Chars('.', 23 - Length(QRequisicaoItPorClasseDESC_CLASSE.Value)) +
      ': ' + Bib.NumToTexto(QRequisicaoItPorClasseVAL_TOTAL.Value, 2, 9));
    Inc(wLinha);
    QRequisicaoItPorClasse.Next;
  end;
  Imp.WriteXY(0.2, wLinha, 'TOTAL DA OS: ' + Bib.NumToTexto(wTotal, 2, 12));

  Imp.SaltaPagina;
  Imp.FechaImpressora;
end;

procedure TDMOSEmite.ClearVariablesClose(DataSet: TDataSet);
begin
  if DataSet is TOracleDataSet1 then
    TOracleDataSet1(DataSet).ClearVariables;
end;

end.

