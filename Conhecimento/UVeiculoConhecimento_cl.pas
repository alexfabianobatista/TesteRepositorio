unit UVeiculoConhecimento_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMVeiculoConhecimento = class(TDataModule)
    QVeiculoCad: TOracleDataSet1;
    QVeiculoCadDESC_CIDADE: TStringField;
    QVeiculoCadCOD_ESTADO: TStringField;
    QVeiculoCadCOD_PROPRIETARIO: TIntegerField;
    QVeiculoCadDESC_ESTADO: TStringField;
    QVeiculoCadDESC_VEICULO: TStringField;
    QVeiculoCadNOME_PROPRIETARIO: TStringField;
    QVeiculoCons: TOracleDataSet1;
    QVeiculoConsDESC_CIDADE: TStringField;
    QVeiculoConsCOD_ESTADO: TStringField;
    QVeiculoConsCOD_PROPRIETARIO: TIntegerField;
    QVeiculoConsDESC_VEICULO: TStringField;
    QRVeiculo: TOracleDataSet1;
    QRVeiculoDESC_CIDADE: TStringField;
    QRVeiculoCOD_ESTADO: TStringField;
    QRVeiculoCOD_PROPRIETARIO: TIntegerField;
    QRVeiculoDESC_VEICULO: TStringField;
    QVeiculoCadDESC_PLACA: TStringField;
    QVeiculoConsDESC_PLACA: TStringField;
    QRVeiculoDESC_PLACA: TStringField;
    QVeiculoCadDESC_COR: TStringField;
    QVeiculoCadDESC_CHASSIS: TStringField;
    QVeiculoCadDESC_RENAVAN: TStringField;
    QVeiculoCadDESC_ANO_MODELO: TStringField;
    QVeiculoCadDESC_MARCA: TStringField;
    QVeiculoCadDESC_TIPO_VEICULO: TStringField;
    QVeiculoConsDESC_TIPO_VEICULO: TStringField;
    QRVeiculoDESC_TIPO_VEICULO: TStringField;
    QRVeiculoDESC_COR: TStringField;
    QRVeiculoDESC_CHASSIS: TStringField;
    QRVeiculoDESC_RENAVAN: TStringField;
    QRVeiculoDESC_ANO_MODELO: TStringField;
    QRVeiculoDESC_MARCA: TStringField;
    QVeiculoCadVAL_MAX_CARGA: TIntegerField;
    QVeiculoCadVAL_VOLUME: TFloatField;
    QVeiculoCadCOD_USUARIO: TIntegerField;
    procedure QVeiculoCadCalcFields(DataSet: TDataSet);
    procedure QVeiculoCadBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMVeiculoConhecimento: TDMVeiculoConhecimento;

implementation

uses UOracle_cl, {UVeiculoCad,} UUsuario_cl;

{$R *.DFM}

procedure TDMVeiculoConhecimento.QVeiculoCadCalcFields(DataSet: TDataSet);
begin
   DMVeiculoConhecimento.QVeiculoCadDesc_estado.value:= DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO','COD_ESTADO = '+Chr(39)+DMVeiculoConhecimento.QVeiculoCadCod_Estado.Value+Chr(39));
   DMVeiculoConhecimento.QVeiculoCadNome_Proprietario.value:= DMOracle.BuscaNome('SELECT Nome FROM TB_Proprietario','COD_Proprietario= '+inttostr(DMVeiculoConhecimento.QVeiculoCadCod_proprietario.Value));
end;

procedure TDMVeiculoConhecimento.QVeiculoCadBeforePost(DataSet: TDataSet);
begin
  QVeiculoCadCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
end;

end.
