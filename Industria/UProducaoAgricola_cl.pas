unit UProducaoAgricola_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMProducaoAgricola = class(TDataModule)
    QProducaoAgricola: TOracleDataSet1;
    QProducaoAgricolaCons: TOracleDataSet1;
    QProducaoAgricolaCOD_PRODUCAO_AGRICOLA: TIntegerField;
    QProducaoAgricolaCOD_TURNO: TIntegerField;
    QProducaoAgricolaCOD_FILIAL: TIntegerField;
    QProducaoAgricolaCOD_OPERACAO: TIntegerField;
    QProducaoAgricolaDT_PRODUCAO_AGRICOLA: TDateTimeField;
    QProducaoAgricolaDESC_OBS: TStringField;
    QMateriaPrima: TOracleDataSet1;
    QProdutoAcabado: TOracleDataSet1;
    QMateriaPrimaCOD_MATERIA_PRIMA: TIntegerField;
    QMateriaPrimaCOD_PRODUCAO_AGRICOLA: TIntegerField;
    QMateriaPrimaVAL_CUSTO: TFloatField;
    QMateriaPrimaCOD_PRODUTO: TFloatField;
    QProdutoAcabadoCOD_PRODUTO_ACABADO: TIntegerField;
    QProdutoAcabadoCOD_PRODUCAO_AGRICOLA: TIntegerField;
    QProdutoAcabadoVAL_CUSTO: TFloatField;
    QProdutoAcabadoCOD_PRODUTO: TFloatField;
    QProducaoAgricolaIND_CONFIRMADO: TStringField;
    QProducaoAgricolaConsCOD_PRODUCAO_AGRICOLA: TIntegerField;
    QProducaoAgricolaConsDT_PRODUCAO_AGRICOLA: TDateTimeField;
    QProducaoAgricolaConsDESC_OBS: TStringField;
    QProducaoAgricolaConsIND_CONFIRMADO: TStringField;
    QProducaoAgricolaConsDESC_TURNO: TStringField;
    QProducaoAgricolaConsDESC_FILIAL: TStringField;
    QProducaoAgricolaConsDESC_OPERACAO: TStringField;
    QMateriaPrimaQDE_QUANTIDADE: TFloatField;
    QProdutoAcabadoQDE_QUANTIDADE: TFloatField;
    QRProdMateriaPrima: TOracleDataSet1;
    QRProdMateriaPrimaQDE_QUANTIDADE: TFloatField;
    QRProdMateriaPrimaVAL_CUSTO: TFloatField;
    QRProdMateriaPrimaCOD_PRODUTO: TFloatField;
    QRProdMateriaPrimaDESC_PRODUTO: TStringField;
    QRProdMateriaPrimaDT_PRODUCAO_AGRICOLA: TDateTimeField;
    QRProdutoAcabado: TOracleDataSet1;
    QRProdutoAcabadoCOD_PRODUTO_ACABADO: TIntegerField;
    QRProdutoAcabadoCOD_PRODUCAO_AGRICOLA: TIntegerField;
    QRProdutoAcabadoQDE_QUANTIDADE: TFloatField;
    QRProdutoAcabadoVAL_CUSTO: TFloatField;
    QRProdutoAcabadoCOD_PRODUTO: TFloatField;
    QRProdutoAcabadoDESC_PRODUTO: TStringField;
    QRProdutoAcabadoDT_PRODUCAO_AGRICOLA: TDateTimeField;
    QRProdMateriaPrimaCOD_MATERIA_PRIMA: TIntegerField;
    QRProducao: TOracleDataSet1;
    QRProdMateriaPrimaCOD_PRODUCAO_AGRICOLA: TIntegerField;
    QRProdMateriaPrimaDESC_TURNO: TStringField;
    QRProdMateriaPrimaCOD_TURNO: TIntegerField;
    QRProducaoMP: TOracleDataSet1;
    QRProducaoMPQDE_QUANTIDADE: TFloatField;
    QRProducaoMPVAL_CUSTO: TFloatField;
    QRProducaoMPCOD_PRODUTO: TFloatField;
    QRProducaoMPDESC_MATERIA_PRIMA: TStringField;
    QRProducaoPA: TOracleDataSet1;
    QRProducaoPAQT_PRODUTO: TFloatField;
    QRProducaoPAVAL_PRODUTO: TFloatField;
    QRProducaoPACOD_PRODUTO: TFloatField;
    QRProducaoPADESC_PRODUTO_ACABADO: TStringField;
    QRProducaoCOD_PRODUCAO_AGRICOLA: TIntegerField;
    QRProducaoDT_PRODUCAO_AGRICOLA: TDateTimeField;
    QRProdutoAcabadoDESC_TURNO: TStringField;
    QRProducaoDESC_TURNO: TStringField;
    QProducaoAgricolaCOD_CADASTRO: TIntegerField;
    QProducaoAgricolaCOD_NOTA_CAB_ENTRADA: TIntegerField;
    QProducaoAgricolaCOD_NOTA_CAB_SAIDA: TIntegerField;
    procedure QProducaoAgricolaAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMProducaoAgricola: TDMProducaoAgricola;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMProducaoAgricola.QProducaoAgricolaAfterInsert(
  DataSet: TDataSet);
begin
  QproducaoAgricolaIND_CONFIRMADO.value := '1';
  QproducaoAgricolaDT_PRODUCAO_AGRICOLA.Value := Date;
end;

end.
