unit UDmOperador;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TDmOperador = class(TDataModule)
    QSelOperador: TIBQuery;
    DsSelOperador: TDataSource;
    QSelOperadorCOD_OPERADOR: TIntegerField;
    QSelOperadorDESC_NOME: TIBStringField;
    QSelOperadorDESC_SENHA: TIBStringField;
    QLogin: TIBQuery;
    QLoginCOD_OPERADOR: TIntegerField;
    QLoginDESC_NOME: TIBStringField;
    QLoginDESC_SENHA: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmOperador: TDmOperador;

implementation

{$R *.dfm}

end.
