unit UCategoriaProfissional_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMCategoriaProfissional = class(TDataModule)
    QCategoria: TOracleDataSet1;
    QCategoriaCOD_CATEGORIA: TStringField;
    QCategoriaDESC_CATEGORIA: TStringField;
    QCategoriaCons: TOracleDataSet1;
    QCategoriaConsCOD_CATEGORIA: TStringField;
    QCategoriaConsDESC_CATEGORIA: TStringField;
    QRCategoria: TOracleDataSet1;
    QRCategoriaCOD_CATEGORIA: TStringField;
    QRCategoriaDESC_CATEGORIA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCategoriaProfissional: TDMCategoriaProfissional;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
