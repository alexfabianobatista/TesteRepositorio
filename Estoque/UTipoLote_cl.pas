unit UTipoLote_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMTipoLote = class(TDataModule)
    DSTipoLote: TDataSource;
    DSClaspar: TDataSource;
    QTipoLote: TOracleDataSet1;
    QTipoLoteCOD_LOTE_TIPO: TIntegerField;
    QTipoLoteDESC_GERMINACAO: TStringField;
    QTipoLoteDESC_PUREZA: TStringField;
    QTipoLoteDESC_ATESTADO: TStringField;
    QTipoLoteDESC_VALIDADE: TStringField;
    QTipoLoteDESC_PENEIRA: TStringField;
    QTipoLoteIND_IMPRIME_NF: TStringField;
    QTipoLoteCOD_PRODUTO: TFloatField;
    QTipoLotedesc_produto: TStringField;
    QTipoLoteCons: TOracleDataSet1;
    QTipoLoteConsCOD_LOTE_TIPO: TIntegerField;
    QRTipoLote: TOracleDataSet1;
    QRTipoLoteCOD_LOTE_TIPO: TIntegerField;
    QRTipoLoteDESC_GERMINACAO: TStringField;
    QRTipoLoteDESC_LOTE: TStringField;
    QRTipoLoteDESC_PUREZA: TStringField;
    QRTipoLoteDESC_ATESTADO: TStringField;
    QRTipoLoteDESC_VALIDADE: TStringField;
    QRTipoLoteDESC_PENEIRA: TStringField;
    QClaspar: TOracleDataSet1;
    QClasparCOD_LOTE_TIPO: TIntegerField;
    QClasparNUM_CERTIFICADO: TFloatField;
    QClasparCOD_SERIE: TStringField;
    QClasparCOD_ESTADO: TStringField;
    QClasparDT_EMISSAO: TDateTimeField;
    QClasparCOD_REG_MAARA: TStringField;
    QClasparPERC_UMIDADE: TFloatField;
    QClasparDESC_SAFRA: TStringField;
    QClasparQT_CLASSIFICADO: TFloatField;
    QClasparDESC_RENDA: TStringField;
    QClasparPERC_INTEIRO: TFloatField;
    QClasparPERC_QUEBRADOS: TFloatField;
    QClasparDESC_MARCA: TStringField;
    QClasparDESC_GRUPO: TStringField;
    QClasparDESC_CLASSE: TStringField;
    QClasparDESC_TIPO: TStringField;
    QClasparDESC_REGIONAL: TStringField;
    QClasparDESC_POSTO: TStringField;
    QTipoLoteDT_VENCIMENTO: TDateTimeField;
    QClasparDT_VALIDADE: TDateTimeField;
    QTipoLoteIND_TIPO_PRODUCAO: TStringField;
    QTipoLoteDESC_TIPO_SEMENTE: TStringField;
    QRMovimentoPorLote: TOracleDataSet1;
    QRMovimentoPorLoteNUM_NOTA: TIntegerField;
    QRMovimentoPorLoteDT_EMISSAO: TDateTimeField;
    QRMovimentoPorLoteNOME: TStringField;
    QRMovimentoPorLoteDESC_OPERACAO: TStringField;
    QRMovimentoPorLoteQT_QUANTIDADE: TFloatField;
    QRMovimentoPorLoteDESC_PRODUTO: TStringField;
    QRMovimentoPorLoteDESC_LOTE: TStringField;
    QRMovimentoPorLoteIND_TIPO_PRODUCAO: TStringField;
    QTipoLoteDESC_CATEGORIA: TStringField;
    QTipoLoteCOD_CADASTRO: TIntegerField;
    QTipoLotenome_cadastro: TStringField;
    QTipoLoteDESC_RENASEN: TStringField;
    QTipoLoteVAL_PRECO: TFloatField;
    QTipoLoteDESC_LOTE: TStringField;
    QTipoLoteConsDESC_LOTE: TStringField;
    QTipoLoteNUM_PESO: TFloatField;
    QTipoLoteDESC_OBSERVACAO: TStringField;
    QTipoLoteQT_LOTE: TFloatField;
    QTipoLoteDT_FABRICACAO: TDateTimeField;
    QRLoteVencimentoProduto: TOracleDataSet;
    QRLoteVencimentoProdutoCOD_PRODUTO: TFloatField;
    QRLoteVencimentoProdutoDESC_PRODUTO: TStringField;
    QRLoteVencimentoProdutoQT_QUANTIDADE: TFloatField;
    QRLoteVencimentoProdutoCOD_LOTE_TIPO: TIntegerField;
    QRLoteVencimentoProdutoDESC_LOTE: TStringField;
    QRLoteVencimentoProdutoDT_VENCIMENTO: TDateTimeField;
    procedure QTipoLoteAfterInsert(DataSet: TDataSet);
    procedure QClasparAfterInsert(DataSet: TDataSet);
    procedure QClasparBeforeInsert(DataSet: TDataSet);
    procedure QTipoLoteCalcFields(DataSet: TDataSet);
    procedure QTipoLoteNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTipoLote: TDMTipoLote;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMTipoLote.QTipoLoteAfterInsert(DataSet: TDataSet);
begin
//  QTipoLoteCod_Lote_Tipo.Value := DMOracle.Sequencia('LOTE_TIPO');
end;

procedure TDMTipoLote.QClasparAfterInsert(DataSet: TDataSet);
begin
  QClasparCOD_LOTE_TIPO.Value := QTipoLoteCOD_LOTE_TIPO.Value;
  QClasparCOD_REG_MAARA.Value := 'PR-07326-1';
end;

procedure TDMTipoLote.QClasparBeforeInsert(DataSet: TDataSet);
begin
  If QClasparCod_Lote_Tipo.Value = QTipoLoteCod_Lote_Tipo.Value then
    Raise Exception.Create('Cada lote só pode ter um Certificado de Classificação!');
end;

procedure TDMTipoLote.QTipoLoteCalcFields(DataSet: TDataSet);
begin
//  QTipoLotedesc_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','TB_PRODUTO.COD_PRODUTO = ' + FloatToStr(QTipoLoteCOD_PRODUTO.Value), True);
//  QTipoLotenome_cadastro.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','TB_CADASTRO.COD_CADASTRO = ' + FloatToStr(QTipoLoteCOD_CADASTRO.Value), True);
end;

procedure TDMTipoLote.QTipoLoteNewRecord(DataSet: TDataSet);
begin
  QTipoLoteIND_IMPRIME_NF.Value:= 'N';
end;

end.
