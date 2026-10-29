unit UClassePostgre_cl;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDMClassePostgre = class(TDataModule)
    ZQClasseSeta: TZQuery;
    ZQClasseSetacodigo: TStringField;
    ZQClasseSetadescricao: TMemoField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMClassePostgre: TDMClassePostgre;

implementation

uses UPostgre_cl;

{$R *.dfm}

end.
