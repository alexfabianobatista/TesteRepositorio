unit UDmVeiculo;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TDmVeiculo = class(TDataModule)
    QSelVeiculo: TIBQuery;
    DsSelVeiculo: TDataSource;
    QSelVeiculoCODVEICULO: TIntegerField;
    QSelVeiculoDSCVEICULO: TIBStringField;
    QSelVeiculoCODMARCA: TIntegerField;
    QSelVeiculoANOFAB: TIntegerField;
    QSelVeiculoANOMODELO: TIntegerField;
    QSelVeiculoCHASSI: TIntegerField;
    QSelVeiculoPLACA: TIBStringField;
    QSelVeiculoCODCOR: TIntegerField;
    QSelVeiculoVALORCOMPRA: TFloatField;
    QSelVeiculoVALORVENDA: TFloatField;
    QUpValorVenda: TIBQuery;
    QUpValorCompra: TIBQuery;
    QJaVendido: TIBQuery;
    QJaVendidoVALORVENDA: TFloatField;
    QJaComprado: TIBQuery;
    QJaCompradoVALORCOMPRA: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmVeiculo: TDmVeiculo;

implementation

{$R *.dfm}

end.
