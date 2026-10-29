unit UEtiquetas_Cl;

interface

uses
  SysUtils, Classes, DB, DBClient;

type
  TDMEtiquetas = class(TDataModule)
    CDEtiquetas: TClientDataSet;
    CDEtiquetascod_produto: TStringField;
    CDEtiquetasdesc_produto: TStringField;
    CDEtiquetasval_produto: TFloatField;
    CDEtiquetastipo_valor: TStringField;
    CDEtiquetasdesc_localizacao: TStringField;
    CDEtiquetascod_original: TStringField;
    CDEtiquetasdesc_unidade: TStringField;
    CDEtiquetasdescricao1: TStringField;
    CDEtiquetasdescricao2: TStringField;
    CDEtiquetasdescricao3: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMEtiquetas: TDMEtiquetas;

implementation

{$R *.dfm}

end.
