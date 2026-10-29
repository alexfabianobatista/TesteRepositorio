unit UPlanoContaFirebird_cl;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDMPlanoContasFirebird = class(TDataModule)
    ZQPlanoContaRefRetifoz: TZQuery;
    ZQPlanoContaRefRetifozCOD_PLANO_CONTA_REFERENCIAL: TIntegerField;
    ZQPlanoContaRefRetifozDESC_PLANO_CONTA_REFERENCIAL: TStringField;
    ZQPlanoContaRefRetifozNUM_PLANO_CONTA_REFERENCIAL: TStringField;
    ZQPlanoContaRetifoz: TZQuery;
    ZQPlanoContaRetifozCOD_PLANO_CONTA: TIntegerField;
    ZQPlanoContaRetifozDESC_PLANO_CONTA: TStringField;
    ZQPlanoContaRetifozCOD_FILIAL: TIntegerField;
    ZQPlanoContaRetifozNUM_PLANO_CONTA: TStringField;
    ZQPlanoContaRetifozTIPO: TStringField;
    ZQPlanoContaRetifozDESC_NATUREZA_CONTA: TStringField;
    ZQPlanoContaRetifozIND_LIBERADO_USO: TStringField;
    ZQPlanoContaRetifozCONTAREFERENCIAL: TStringField;
    ZQPlanoContaRetifozNUM_GRAU: TStringField;
    ZQPlanoContaCli: TZQuery;
    ZQPlanoContaCliCOD_CADASTRO: TIntegerField;
    ZQPlanoContaCliNOME_CADASTRO: TStringField;
    ZQPlanoContaCliCOD_REDUZIDO: TIntegerField;
    ZQPlanoContaCliDESC_PLANO_CONTA: TStringField;
    ZQPlanoContaCliCOD_FILIAL: TIntegerField;
    ZQPlanoContaCliNUM_PLANO_CONTA: TStringField;
    ZQPlanoContaCliNUM_GRAU: TStringField;
    ZQPlanoContaCliTIPO: TStringField;
    ZQPlanoContaCliDESC_NATUREZA_CONTA: TStringField;
    ZQPlanoContaCliIND_LIBERADO_USO: TStringField;
    ZQPlanoContaFor: TZQuery;
    ZQPlanoContaForCOD_CADASTRO: TIntegerField;
    ZQPlanoContaForNOME_CADASTRO: TStringField;
    ZQPlanoContaForCOD_REDUZIDO: TIntegerField;
    ZQPlanoContaForDESC_PLANO_CONTA: TStringField;
    ZQPlanoContaForCOD_FILIAL: TIntegerField;
    ZQPlanoContaForNUM_PLANO_CONTA: TStringField;
    ZQPlanoContaForNUM_GRAU: TStringField;
    ZQPlanoContaForTIPO: TStringField;
    ZQPlanoContaForDESC_NATUREZA_CONTA: TStringField;
    ZQPlanoContaForIND_LIBERADO_USO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPlanoContasFirebird: TDMPlanoContasFirebird;

implementation
uses UFirebird_cl;
{$R *.dfm}

end.
