unit ULivroFiscalIPI_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, Dialogs;

type
  TDMLivroFiscalIPI = class(TDataModule)
    DSLivroFiscalIPI: TDataSource;
    QLivroFiscalIPI: TOracleDataSet1;
    QLivroFiscalIPINUM_ANO: TIntegerField;
    QLivroFiscalIPINUM_MES: TIntegerField;
    QLivroFiscalIPICOD_FILIAL: TIntegerField;
    QLivroFiscalIPIVAL_CR_ICM: TFloatField;
    QLivroFiscalIPIVAL_DB_ICM: TFloatField;
    QLivroFiscalIPIVAL_SALDO_CREDOR: TFloatField;
    QLcto: TOracleDataSet1;
    DSLcto: TDataSource;
    QLctoNUM_ANO: TIntegerField;
    QLctoNUM_MES: TIntegerField;
    QLctoCOD_FILIAL: TIntegerField;
    QLctoCOD_OPERACAO: TIntegerField;
    QLctoVAL_IMPOSTO: TFloatField;
    QLctoDESC_LCTO: TStringField;
    QLctoDESC_COMPLEMENTO: TStringField;
    QLctoCOD_LIVRO_LCTO_IPI: TIntegerField;
    QRLivroFiscalIPI: TOracleDataSet;
    QRLivroFiscalIPIdesc_operacao: TStringField;
    QRLivroFiscalIPICOD_TITULO: TFloatField;
    QRLivroFiscalIPIDESC_TITULO: TStringField;
    QRLivroFiscalIPICOD_OPERACAO: TFloatField;
    QRLivroFiscalIPIVAL_LANCAMENTO: TFloatField;
    QRLivroFiscalIPIval_relatorio: TFloatField;
    QLivroFiscalIPICons: TOracleDataSet1;
    QLivroFiscalIPIConsNUM_ANO: TIntegerField;
    QLivroFiscalIPIConsNUM_MES: TIntegerField;
    QLivroFiscalIPIConsCOD_FILIAL: TIntegerField;
    QLivroFiscalIPIConsVAL_CR_ICM: TFloatField;
    QLivroFiscalIPIConsVAL_DB_ICM: TFloatField;
    QLivroFiscalIPINUM_DECENDIO: TIntegerField;
    QLctoNUM_DECENDIO: TIntegerField;
    QLivroFiscalIPIConsNUM_DECENDIO: TIntegerField;
    QRLivroFiscalIPIDESC_OBS: TStringField;
    QRLivroFiscalIPIDeb: TOracleDataSet;
    QRLivroFiscalIPICred: TOracleDataSet;
    QRLivroFiscalIPICredCODIGO: TStringField;
    QRLivroFiscalIPICredVALOR: TFloatField;
    QRLivroFiscalIPICreddescricao: TStringField;
    QRLivroFiscalIPIDebCODIGO: TStringField;
    QRLivroFiscalIPIDebVALOR: TFloatField;
    QRLivroFiscalIPIDebdescricao: TStringField;
    QRLivroFiscalIPIDebMES: TFloatField;
    QRLivroFiscalIPIDebANO: TFloatField;
    QRLivroFiscalIPICredMES: TFloatField;
    QRLivroFiscalIPICredANO: TFloatField;
    QLctoItem: TOracleDataSet1;
    QLctoItemCOD_LIVRO_LCTO_IPI_ITEM: TIntegerField;
    QLctoItemCOD_LIVRO_LCTO_IPI: TIntegerField;
    QLctoItemCOD_NOTA_ITEM: TIntegerField;
    QLctoItemVAL_AJUSTE: TFloatField;
    QLctoItemnum_nota: TIntegerField;
    QLctoItemcod_serie: TStringField;
    QLctoItemcod_serie_modelo: TStringField;
    QLctoItemcod_produto: TIntegerField;
    QLctoItemdesc_produto: TStringField;
    procedure QLivroFiscalIPIAfterPost(DataSet: TDataSet);
    procedure QLctoAfterInsert(DataSet: TDataSet);
    procedure QLctoAfterPost(DataSet: TDataSet);
    procedure QLctoBeforeInsert(DataSet: TDataSet);
    procedure QRLivroFiscalIPICalcFields(DataSet: TDataSet);
    procedure QLivroFiscalIPIAfterOpen(DataSet: TDataSet);
    procedure QLivroFiscalIPIAfterClose(DataSet: TDataSet);
    procedure QRLivroFiscalIPIDebCalcFields(DataSet: TDataSet);
    procedure QLctoItemCalcFields(DataSet: TDataSet);
    procedure QLctoAfterOpen(DataSet: TDataSet);
    procedure QLivroFiscalIPIBeforePost(DataSet: TDataSet);
    procedure QLivroFiscalIPIBeforeDelete(DataSet: TDataSet);
    procedure QLctoBeforeDelete(DataSet: TDataSet);
    procedure QLctoItemBeforePost(DataSet: TDataSet);
    procedure QLctoItemBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetaRegistro(wFilial, wAno, wMes, wDecendio: Integer);
  end;

var
  DMLivroFiscalIPI: TDMLivroFiscalIPI;

implementation

uses UOracle_cl, UBiblioteca;

{$R *.dfm}

procedure TDMLivroFiscalIPI.QLivroFiscalIPIAfterPost(DataSet: TDataSet);
var
  wFilial, wAno, wMes, wDecendio: integer;
  wValC, wValD, wValS, wValA: Real;
begin
  QRLivroFiscalIPICred.Close;
  QRLivroFiscalIPICred.SetVariable('FILIAL', QLivroFiscalIPICOD_FILIAL.Value);
  QRLivroFiscalIPICred.SetVariable('MES', QLivroFiscalIPINUM_MES.Value);
  QRLivroFiscalIPICred.SetVariable('ANO', QLivroFiscalIPINUM_ANO.Value);
  QRLivroFiscalIPICred.SetVariable('DECENDIO', QLivroFiscalIPINUM_DECENDIO.Value);
  QRLivroFiscalIPICred.Open;
  QRLivroFiscalIPIDeb.Close;
  QRLivroFiscalIPIDeb.SetVariable('FILIAL', QLivroFiscalIPICOD_FILIAL.Value);
  QRLivroFiscalIPIDeb.SetVariable('MES', QLivroFiscalIPINUM_MES.Value);
  QRLivroFiscalIPIDeb.SetVariable('ANO', QLivroFiscalIPINUM_ANO.Value);
  QRLivroFiscalIPIDeb.SetVariable('DECENDIO', QLivroFiscalIPINUM_DECENDIO.Value);
  QRLivroFiscalIPIDeb.Open;

  wValC := 0;
  wValA := 0;
  QRLivroFiscalIPICred.First;
  while not QRLivroFiscalIPICred.Eof do
  begin
    If QRLivroFiscalIPICredCODIGO.Value <> 'MES_ANTERIOR' Then
       wValC := wValC + QRLivroFiscalIPICredVALOR.Value
    Else
       wValA := QRLivroFiscalIPICredVALOR.Value;
    QRLivroFiscalIPICred.Next;
  end;
  wValD := 0;
  QRLivroFiscalIPIDeb.First;
  while not QRLivroFiscalIPIDeb.Eof do
  begin
    wValD := wValD + QRLivroFiscalIPIDebVALOR.Value;
    QRLivroFiscalIPIDeb.Next;
  end;

  wValS := 0;
  if (wValC + wValA) > wValD then
    wValS := wValC + wValA - wValD;
  DMOracle.ExecutaSql('UPDATE TB_LIVRO_FISCAL_IPI SET VAL_CR_ICM = ' +
    Bib.TrocaVirgulaPorPonto(FloatToStr(wValC)) + ', VAL_DB_ICM = ' +
    Bib.TrocaVirgulaPorPonto(FloatToStr(wValD)) + ', VAL_SALDO_CREDOR = ' +
    Bib.TrocaVirgulaPorPonto(FloatToStr(wValS)) + ' WHERE ' +
    'NUM_ANO = ' + QLivroFiscalIPINUM_ANO.Text + ' AND ' +
    'NUM_MES = ' + QLivroFiscalIPINUM_MES.Text + ' AND ' +
    'COD_FILIAL = ' + QLivroFiscalIPICOD_FILIAL.Text + ' AND ' +
    'NUM_DECENDIO = ' + QLivroFiscalIPINUM_DECENDIO.Text, true);

  wFilial := QLivroFiscalIPICOD_FILIAL.Value;
  wAno := QLivroFiscalIPINUM_ANO.Value;
  wMes := QLivroFiscalIPINUM_MES.Value;
  wDecendio := QLivroFiscalIPINUM_DECENDIO.Value;
  QLivroFiscalIPI.Close;
  QLivroFiscalIPI.SetVariable('FILIAL', wFilial);
  QLivroFiscalIPI.SetVariable('ANO', wAno);
  QLivroFiscalIPI.SetVariable('MES', wMes);
  QLivroFiscalIPI.SetVariable('DECENDIO', wDecendio);
  QLivroFiscalIPI.Open;
end;

procedure TDMLivroFiscalIPI.QLctoAfterInsert(DataSet: TDataSet);
begin
  QLctoCod_Filial.Value := QLivroFiscalIPICod_Filial.Value;
  QLctoNum_Ano.Value := QLivroFiscalIPINum_Ano.Value;
  QLctoNum_Mes.Value := QLivroFiscalIPINum_Mes.Value;
  QLctoNum_Decendio.Value := QLivroFiscalIPINum_Decendio.Value;

  if not (QLivroFiscalIPI.State in [dsEdit, dsInsert]) then
  begin
    QLcto.cancel;
    raise Exception.Create('Não está em modo de edição');
  end;
end;

procedure TDMLivroFiscalIPI.QLctoAfterPost(DataSet: TDataSet);
begin
  QLcto.Close;
  QLcto.Open;
end;

procedure TDMLivroFiscalIPI.QLctoBeforeInsert(DataSet: TDataSet);
begin
  if QLivroFiscalIPI.State = dsInsert then
  begin
    QLivroFiscalIPI.Post;
    QLivroFiscalIPI.Edit;
  end;
end;

procedure TDMLivroFiscalIPI.QRLivroFiscalIPICalcFields(DataSet: TDataSet);
var dsc: string;
begin
  dsc := '';

  case QRLivroFiscalIPICOD_OPERACAO.AsInteger of
    1: dsc := 'POR ENTRADAS NO MERCADO NACIONAL';
    2: dsc := 'POR ENTRADAS NO MERCADO EXTERNO';
    3: dsc := 'POR SAÍDAS PARA O MERCADO EXTERNO';
    4: dsc := 'ESTORNO DE DÉBITOS';
    5: dsc := 'OUTROS CRÉDITOS';
    6: dsc := 'SUBTOTAL';
    7: dsc := 'SALDO CREDOR NO PERÍODO ANTERIOR';
    8: dsc := 'TOTAL';
    9: dsc := 'POR SAÍDAS PARA MERCADO NACIONAL';
    10: dsc := 'ESTORNO DE CRÉDITOS';
    11: dsc := 'RESSARCIMENTOS DE CRÉDITO';
    12: dsc := 'OUTROS DÉBITOS';
    13: dsc := 'TOTAL';
    14: dsc := 'DÉBITO TOTAL';
    15: dsc := 'CRÉDITO TOTAL';
    16: dsc := 'SALDO DEVEDOR';
    17: dsc := 'SALDO CREDOR';
  end;

  QRLivroFiscalIPIdesc_operacao.Value := dsc;
  QRLivroFiscalIPIVal_Relatorio.Value := QRLivroFiscalIPIVal_Lancamento.Value;
  if QRLivroFiscalIPIVal_Lancamento.Value < 0 then
    QRLivroFiscalIPIVal_Relatorio.Value := 0;
end;

procedure TDMLivroFiscalIPI.SetaRegistro(wFilial, wAno, wMes, wDecendio: Integer);
begin
  QLivroFiscalIPI.Close;
  QLivroFiscalIPI.SetVariable('FILIAL', wFilial);
  QLivroFiscalIPI.SetVariable('ANO', wAno);
  QLivroFiscalIPI.SetVariable('MES', wMes);
  QLivroFiscalIPI.SetVariable('DECENDIO', wDecendio);
  QLivroFiscalIPI.Open;
  if QLivroFiscalIPICOD_FILIAL.Value = 0 then
  begin
    QLivroFiscalIPI.Insert;
    QLivroFiscalIPICod_Filial.Value := wFilial;
    QLivroFiscalIPINum_Ano.Value := wAno;
    QLivroFiscalIPINum_Mes.Value := wMes;
    QLivroFiscalIPINum_Decendio.Value := wDecendio;
  end;
  QLcto.Open;
end;

procedure TDMLivroFiscalIPI.QLivroFiscalIPIAfterOpen(DataSet: TDataSet);
begin
  QLcto.Close;
  QLcto.Open;
end;

procedure TDMLivroFiscalIPI.QLivroFiscalIPIAfterClose(DataSet: TDataSet);
begin
  QLcto.Close;
end;

procedure TDMLivroFiscalIPI.QRLivroFiscalIPIDebCalcFields(
  DataSet: TDataSet);
var
  wCod: string;
  wCampo: TField;
begin
  wCod := DataSet.FieldByName('CODIGO').Value;
  wCampo := DataSet.FieldByName('descricao');
  if (wCod = 'SAIDA_DEBITO') then
    wCampo.Value := 'Por Saídas com Débito do Imposto'
  else if (wCod = 'ENTRADA_CREDITO') then
    wCampo.Value := 'Por Entradas com Crédito do Imposto'
  else if (wCod = 'MES_ANTERIOR') then
    wCampo.Value := 'Saldo Credor Mês Anterior'
  else if (wCod = '1') then
    wCampo.Value := 'Por Entradas do Mercado Nacional'
  else if (wCod = '2') then
    wCampo.Value := 'Por Entradas do Mercado Externo'
  else if (wCod = '3') then
    wCampo.Value := 'Por Saídas para Mercado Externo'
  else if (wCod = '4') then
    wCampo.Value := 'Estorno de Débitos'
  else if (wCod = '5') then
    wCampo.Value := 'Outros Créditos'
  else if (wCod = '7') then
    wCampo.Value := 'Saldo Credor no Período Anterior'
  else if (wCod = '9') then
    wCampo.Value := 'Por Saídas para Mercado Nacional'
  else if (wCod = '10') then
    wCampo.Value := 'Estorno de Créditos'
  else if (wCod = '11') then
    wCampo.Value := 'Ressarcimento de Crédito'
  else if (wCod = '12') then
    wCampo.Value := 'Outros Débitos';
end;

procedure TDMLivroFiscalIPI.QLctoItemCalcFields(DataSet: TDataSet);
begin
  if QLctoItemCOD_NOTA_ITEM.Value > 0 then
  begin
    with DMOracle do
    begin
      QLctoItemnum_nota.Text := FastSelect('N.NUM_NOTA',
        'TB_NOTA_CAB N INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_CAB',
        'I.COD_NOTA_ITEM = ' + QLctoItemCOD_NOTA_ITEM.Text);
      QLctoItemcod_serie.Value := FastSelect('N.COD_SERIE',
        'TB_NOTA_CAB N INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_CAB',
        'I.COD_NOTA_ITEM = ' + QLctoItemCOD_NOTA_ITEM.Text);
      QLctoItemcod_serie_modelo.Value := FastSelect('N.COD_SERIE_MODELO',
        'TB_NOTA_CAB N INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_CAB',
        'I.COD_NOTA_ITEM = ' + QLctoItemCOD_NOTA_ITEM.Text);
      QLctoItemcod_produto.Text := FastSelect('P.COD_PRODUTO',
        'TB_PRODUTO P INNER JOIN TB_NOTA_ITEM I ON P.COD_PRODUTO = I.COD_PRODUTO',
        'I.COD_NOTA_ITEM = ' + QLctoItemCOD_NOTA_ITEM.Text);
      QLctoItemdesc_produto.Text := FastSelect('P.DESC_PRODUTO',
        'TB_PRODUTO P INNER JOIN TB_NOTA_ITEM I ON P.COD_PRODUTO = I.COD_PRODUTO',
        'I.COD_NOTA_ITEM = ' + QLctoItemCOD_NOTA_ITEM.Text); 
    end;
  end;
end;

procedure TDMLivroFiscalIPI.QLctoAfterOpen(DataSet: TDataSet);
begin
  QLctoItem.Close;
  QLctoItem.Open;
end;

procedure TDMLivroFiscalIPI.QLivroFiscalIPIBeforePost(DataSet: TDataSet);
begin
  QLctoItem.First;
  while not QLctoItem.Eof do
  begin
    if (QLctoItemVAL_AJUSTE.IsNull) or (QLctoItemVAL_AJUSTE.Value = 0) then
    begin
      MessageDlg('Valor do ajuste não informado em Lançamentos - Documentos',
         mtError, [mbOk], 0);
      abort;
    end;
    QLctoItem.Next;
  end;
end;

procedure TDMLivroFiscalIPI.QLivroFiscalIPIBeforeDelete(DataSet: TDataSet);
begin
  QLcto.First;
  while not QLcto.Eof do
  begin
    QLcto.Delete;
  end;
end;

procedure TDMLivroFiscalIPI.QLctoBeforeDelete(DataSet: TDataSet);
begin
  QLctoItem.First;
  while not QLctoItem.Eof do
  begin
    QLctoItem.Delete;
  end;
end;

procedure TDMLivroFiscalIPI.QLctoItemBeforePost(DataSet: TDataSet);
begin
  QLctoItemCOD_LIVRO_LCTO_IPI.Value := QLctoCOD_LIVRO_LCTO_IPI.Value;
end;

procedure TDMLivroFiscalIPI.QLctoItemBeforeInsert(DataSet: TDataSet);
begin
  if QLcto.State in [DsInsert, DsEdit] then
    QLcto.Post;
end;

end.

