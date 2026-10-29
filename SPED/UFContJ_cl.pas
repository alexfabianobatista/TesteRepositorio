unit UFContJ_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, UOracle_cl;

type
  TDmFContJ = class(TDataModule)
    QReg930: TOracleDataSet1;
    QReg930IDENT_NOM: TStringField;
    QReg930IDENT_CPF_CNPJ: TStringField;
    QReg930IDENT_QUALIF: TStringField;
    QReg930COD_ASSIN: TStringField;
    QReg930IND_CRC: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmFContJ: TDmFContJ;

implementation

{$R *.dfm}

end.
