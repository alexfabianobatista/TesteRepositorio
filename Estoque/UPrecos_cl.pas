unit UPrecos_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMPrecos = class(TDataModule)
    QAtualizaPrecoPercentualLucro: TOracleDataSet1;
    QAtualizaPrecoPercentualLucroPERC_LUCRO: TFloatField;
    QAtualizaPrecoPerc: TOracleDataSet1;
    QAtualizaPrecoFrete: TOracleDataSet1;
    QAtualizaPrecoAtacado: TOracleDataSet1;
    QAtualizaPrecoVarejo: TOracleDataSet1;
    QLimpaPromocao: TOracleDataSet1;
    QLimpaPromocaoCOD_PRODUTO: TFloatField;
    QLimpaPromocaoQT_QUANTIDADE: TFloatField;
    QAtualizaPromocao: TOracleDataSet1;
    QProdutoLote: TOracleDataSet1;
    QProdutoLoteCOD_PRODUTO: TFloatField;
    QProdutoLoteCOD_LOTE_TIPO: TIntegerField;
    QProdutoLoteVAL_VAREJO: TFloatField;
    QProdutoLoteVAL_ATACADO: TFloatField;
    QProdutoLoteVAL_VAREJO1: TFloatField;
    QProdutoLoteVAL_ATACADO1: TFloatField;
    QProdutoLoteEstoque: TOracleDataSet1;
    QProdutoLoteEstoqueCOD_LOTE_TIPO: TIntegerField;
    QProdutoLoteEstoqueCOD_FILIAL: TIntegerField;
    QProdutoLoteEstoqueCOD_PRODUTO: TFloatField;
    QProdutoLoteEstoqueVL_CUSTO_MEDIO: TFloatField;
    QProdutoLoteEstoqueVL_ULTIMO_CUSTO: TFloatField;
    QProdutoLoteEstoqueQT_QUANTIDADE: TFloatField;
    QPrecoLoteCons: TOracleDataSet1;
    QPrecoLoteConsCOD_PRODUTO: TFloatField;
    QPrecoLoteConsCOD_LOTE_TIPO: TIntegerField;
    QPrecoLoteConsVAL_VAREJO: TFloatField;
    QPrecoLoteConsVAL_ATACADO: TFloatField;
    QProdutoClasseCons: TOracleDataSet1;
    QProdutoClasseConsCOD_PRODUTO: TFloatField;
    QProdutoClasseConsVAL_VAREJO: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPrecos: TDMPrecos;

implementation

{$R *.DFM}

end.
