unit UVeiculoFabricante_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMVeiculoFabricante = class(TDataModule)
    QVeiculoFabricanteCad: TOracleDataSet1;
    QVeiculoFabricanteCons: TOracleDataSet1;
    QRVeiculoFabricante: TOracleDataSet1;
    QVeiculoFabricanteCadCOD_FABRICANTE: TIntegerField;
    QVeiculoFabricanteCadDESC_FABRICANTE: TStringField;
    QVeiculoFabricanteConsCOD_FABRICANTE: TIntegerField;
    QVeiculoFabricanteConsDESC_FABRICANTE: TStringField;
    QRVeiculoFabricanteCOD_FABRICANTE: TIntegerField;
    QRVeiculoFabricanteDESC_FABRICANTE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMVeiculoFabricante: TDMVeiculoFabricante;

implementation

{$R *.DFM}

end.
