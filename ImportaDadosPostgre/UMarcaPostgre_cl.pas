unit UMarcaPostgre_cl;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDMMarcaPostgre = class(TDataModule)
    ZQMarcaSeta: TZQuery;
    ZQMarcaSetacodigo: TStringField;
    ZQMarcaSetadescricao: TMemoField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMarcaPostgre: TDMMarcaPostgre;

implementation

uses UPostgre_cl;

{$R *.dfm}

end.
