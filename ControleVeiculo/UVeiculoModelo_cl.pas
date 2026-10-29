unit UVeiculoModelo_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMVeiculoModelo = class(TDataModule)
    QVeiculoModeloCad: TOracleDataSet1;
    QVeiculoModeloCadCOD_MODELO: TIntegerField;
    QVeiculoModeloCadDESC_MODELO: TStringField;
    QVeiculoModeloCons: TOracleDataSet1;
    QVeiculoModeloConsCOD_MODELO: TIntegerField;
    QVeiculoModeloConsDESC_MODELO: TStringField;
    QRVeiculoModelo: TOracleDataSet1;
    QRVeiculoModeloCOD_MODELO: TIntegerField;
    QRVeiculoModeloDESC_MODELO: TStringField;
    QVeiculoModeloCadCOD_FABRICANTE: TIntegerField;
    QVeiculoModeloCaddesc_fabricante: TStringField;
    QVeiculoModeloConsDESC_FABRICANTE: TStringField;
    QRVeiculoModeloDESC_FABRICANTE: TStringField;
    procedure QVeiculoModeloCadCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMVeiculoModelo: TDMVeiculoModelo;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMVeiculoModelo.QVeiculoModeloCadCalcFields(DataSet: TDataSet);
begin
  if Trim(QVeiculoModeloCadCOD_FABRICANTE.Text) <> '' then
    QVeiculoModeloCaddesc_fabricante.Value := DMOracle.BuscaNome('SELECT DESC_FABRICANTE FROM TB_VEICULO_FABRICANTE',
                                                                 'COD_FABRICANTE = '+QVeiculoModeloCadCOD_FABRICANTE.Text)
  else
    QVeiculoModeloCaddesc_fabricante.Value := '';
end;

end.
