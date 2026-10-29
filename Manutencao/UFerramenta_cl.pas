unit UFerramenta_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMFerramenta = class(TDataModule)
    QFerramenta: TOracleDataSet1;
    QFerramentaCons: TOracleDataSet1;
    QFerramentaCOD_FERRAMENTA: TIntegerField;
    QFerramentaDESC_FERRAMENTA: TStringField;
    QFerramentaConsCOD_FERRAMENTA: TIntegerField;
    QFerramentaConsDESC_FERRAMENTA: TStringField;
    QRFerramenta: TOracleDataSet1;
    QRFerramentaCOD_FERRAMENTA: TIntegerField;
    QRFerramentaDESC_FERRAMENTA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMFerramenta: TDMFerramenta;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
