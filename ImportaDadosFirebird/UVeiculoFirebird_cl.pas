unit UVeiculoFirebird_cl;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDMVeiculoFirebird = class(TDataModule)
    ZQVeiculoRetifoz: TZQuery;
    ZQVeiculoRetifozNUM_PLACA: TStringField;
    ZQVeiculoRetifozNOME: TStringField;
    ZQVeiculoRetifozCOD_CADASTRO: TIntegerField;
    ZQVeiculoRetifozDESCRICAO: TStringField;
    ZQVeiculoRetifozNUM_CHASSI: TStringField;
    ZQVeiculoRetifozNUM_ANO: TStringField;
    ZQVeiculoRetifozNUM_ANO_FAB: TStringField;
    ZQVeiculoRetifozDESC_OBSERVACAO: TStringField;
    ZQVeiculoRetifozCOD_COR: TStringField;
    ZQVeiculoRetifozNUM_RENAVAM: TStringField;
    ZQVeiculoRetifozKM_ATUAL: TIntegerField;
    ZQVeiculoRetifozCOD_MOTORISTA: TIntegerField;
    ZQModeloVeiculoRetifoz: TZQuery;
    ZQVeiculoRetifozDESC_MODELO: TStringField;
    ZQModeloVeiculoRetifozNOME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMVeiculoFirebird: TDMVeiculoFirebird;

implementation
uses UFirebird_cl;

{$R *.dfm}

end.
