unit UEstoqueRelatorios_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMEstoqueRelatorios = class(TDataModule)
    QrEstoqueComposicao: TOracleDataSet1;
    QrEstoqueComposicaoCOD_PRODUTO: TFloatField;
    QrEstoqueComposicaoCOD_LOTE_TIPO: TFloatField;
    QrEstoqueComposicaoCOD_FILIAL: TFloatField;
    QrEstoqueComposicaoNUM_NOTA: TFloatField;
    QrEstoqueComposicaoDT_EMISSAO: TDateTimeField;
    QrEstoqueComposicaoDT_MOVIMENTO: TDateTimeField;
    QrEstoqueComposicaoQT_QUANTIDADE_ENTRADA: TFloatField;
    QrEstoqueComposicaoVAL_CUSTO_ENTRADA: TFloatField;
    QrEstoqueComposicaoQT_QUANTIDADE_SAIDA: TFloatField;
    QrEstoqueComposicaoVAL_CUSTO_SAIDA: TFloatField;
    QrEstoqueComposicaoDESC_OPERACAO: TStringField;
    QrEstoqueComposicaoCOD_OPERACAO: TFloatField;
    QrEstoqueComposicaoIND_ESTOQUE: TStringField;
    QrEstoqueComposicaoIND_CUSTO: TStringField;
    QrEstoqueComposicaoIND_TIPO_OPERACAO: TStringField;
    QrEstoqueComposicaoIND_CUSTO_NOTA: TStringField;
    QrEstoqueComposicaoIND_VENDAS: TStringField;
    QrEstoqueComposicaoIND_COMPRAS: TStringField;
    QRComposicaoEstoque: TOracleDataSet1;
    QRComposicaoEstoqueCOD_PRODUTO: TFloatField;
    QRComposicaoEstoqueCOD_LOTE_TIPO: TFloatField;
    QRComposicaoEstoqueCOD_FILIAL: TFloatField;
    QRComposicaoEstoqueNUM_NOTA: TFloatField;
    QRComposicaoEstoqueDT_EMISSAO: TDateTimeField;
    QRComposicaoEstoqueDT_MOVIMENTO: TDateTimeField;
    QRComposicaoEstoqueQT_QUANTIDADE_ENTRADA: TFloatField;
    QRComposicaoEstoqueVAL_CUSTO_ENTRADA: TFloatField;
    QRComposicaoEstoqueQT_QUANTIDADE_SAIDA: TFloatField;
    QRComposicaoEstoqueVAL_CUSTO_SAIDA: TFloatField;
    QRComposicaoEstoqueDESC_OPERACAO: TStringField;
    QRComposicaoEstoqueCOD_OPERACAO: TFloatField;
    QRComposicaoEstoqueIND_ESTOQUE: TStringField;
    QRComposicaoEstoqueIND_CUSTO: TStringField;
    QRComposicaoEstoqueIND_TIPO_OPERACAO: TStringField;
    QRComposicaoEstoqueIND_VENDAS: TStringField;
    QRComposicaoEstoqueIND_COMPRAS: TStringField;
    QRComposicaoEstoqueIND_CUSTO_NOTA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMEstoqueRelatorios: TDMEstoqueRelatorios;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
