unit UConexao_cl;

interface

uses
  SysUtils, Classes, IBDatabase, DB;

type
  TDMConexao = class(TDataModule)
    IBInterbase: TIBDatabase;
    IBTransaction: TIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConexao: TDMConexao;

implementation

{$R *.dfm}

end.
