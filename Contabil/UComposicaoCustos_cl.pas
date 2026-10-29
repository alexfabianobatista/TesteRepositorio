unit UComposicaoCustos_cl;

interface

uses
  SysUtils, Classes, UOracle_cl, DB, OracleData, OraTeste;

type
  TDMComposicaoCustos = class(TDataModule)
    QComposicaoCustos: TOracleDataSet1;
    QComposicaoCustosCOD_COMPOSICAO_CUSTOS: TIntegerField;
    QComposicaoCustosDESC_COMPOSICAO_CUSTOS: TStringField;
    QComposicaoCustosIND_ATIVO: TStringField;
    QComposicaoCustosGrid: TOracleDataSet1;
    QComposicaoCustosGridCOD_COMPOSICAO_CUSTOS: TIntegerField;
    QComposicaoCustosGridDESC_COMPOSICAO_CUSTOS: TStringField;
    QComposicaoCustosGridIND_ATIVO: TStringField;
    QComposicaoCustosCons: TOracleDataSet1;
    QComposicaoCustosConsCOD_COMPOSICAO_CUSTOS: TIntegerField;
    QComposicaoCustosConsDESC_COMPOSICAO_CUSTOS: TStringField;
    QComposicaoCustosConsIND_ATIVO: TStringField;
    QCustosContaReferencialGrid: TOracleDataSet1;
    QCustosContaReferencialGridCOD_COMPOSICAO_CUSTOS: TIntegerField;
    QCustosContaReferencialGridDESC_COMPOSICAO_CUSTOS: TStringField;
    QCustosContaReferencialGridIND_ATIVO: TStringField;
    QCustosContaReferencialGridNUM_PLANO_CONTA_REFERENCIAL: TStringField;
    QCustosContaReferencialGridDESC_PLANO_CONTA_REFERENCIAL: TStringField;
    QCustosContaReferencial: TOracleDataSet1;
    QCustosContaReferencialCOD_CUSTOS_CONTA_REFERENCIAL: TIntegerField;
    QCustosContaReferencialCOD_COMPOSICAO_CUSTOS: TIntegerField;
    QCustosContaReferencialCOD_PLANO_CONTA_REFERENCIAL: TIntegerField;
    DSCustosContaReferencial: TDataSource;
    QCustosContaReferencialGridCOD_PLANO_CONTA_REFERENCIAL: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMComposicaoCustos: TDMComposicaoCustos;

implementation

{$R *.dfm}

end.
