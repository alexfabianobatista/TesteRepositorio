unit UVeiculoConhecimento_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMVeiculoConhecimento = class(TDataModule)
    QVeiculoCad: TOracleDataSet1;
    QVeiculoCadCOD_ESTADO: TStringField;
    QVeiculoCadDESC_ESTADO: TStringField;
    QVeiculoCadDESC_VEICULO: TStringField;
    QVeiculoCadNOME_PROPRIETARIO: TStringField;
    QVeiculoCons: TOracleDataSet1;
    QVeiculoConsCOD_ESTADO: TStringField;
    QVeiculoConsDESC_VEICULO: TStringField;
    QRVeiculo: TOracleDataSet1;
    QRVeiculoDESC_CIDADE: TStringField;
    QRVeiculoCOD_ESTADO: TStringField;
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
    QVeiculoCadDESC_FROTA: TStringField;
    QVeiculoConsDESC_COR: TStringField;
    QVeiculoConsDESC_CHASSIS: TStringField;
    QVeiculoConsDESC_RENAVAN: TStringField;
    QVeiculoConsDESC_ANO_MODELO: TStringField;
    QVeiculoConsDESC_MARCA: TStringField;
    QVeiculoConsVAL_MAX_CARGA: TIntegerField;
    QVeiculoConsVAL_VOLUME: TFloatField;
    QVeiculoConsCOD_USUARIO: TIntegerField;
    QVeiculoConsDESC_FROTA: TStringField;
    QRVeiculoVAL_MAX_CARGA: TIntegerField;
    QRVeiculoVAL_VOLUME: TFloatField;
    QRVeiculoCOD_USUARIO: TIntegerField;
    QRVeiculoDESC_FROTA: TStringField;
    QVeiculoCadCOD_VEICULO_CTE: TStringField;
    QVeiculoCadIND_TIPO_PROPRIEDADE: TStringField;
    QVeiculoCadIND_TIPO_VEICULO: TIntegerField;
    QVeiculoCadIND_TIPO_RODADO: TStringField;
    QVeiculoCadIND_TIPO_CARROCERIA: TStringField;
    QVeiculoCadCOD_CIDADE: TIntegerField;
    QVeiculoCadNUM_TARA: TIntegerField;
    QRVeiculoIND_TIPO_PROPRIEDADE: TStringField;
    QRVeiculoNOME: TStringField;
    QRVeiculoDESC_CIDADE1: TStringField;
    QVeiculoCadCOD_PROPRIETARIO: TIntegerField;
    QVeiculoConsCOD_PROPRIETARIO: TIntegerField;
    QRVeiculoCOD_PROPRIETARIO: TIntegerField;
    QVeiculoCadCOD_CADASTRO: TIntegerField;
    procedure QVeiculoCadCalcFields(DataSet: TDataSet);
    procedure QVeiculoCadBeforePost(DataSet: TDataSet);
    procedure QVeiculoCadCOD_CIDADEChange(Sender: TField);
    procedure QVeiculoCadAfterInsert(DataSet: TDataSet);
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

procedure TDMVeiculoConhecimento.QVeiculoCadCOD_CIDADEChange(
  Sender: TField);
begin
  if QVeiculoCadCOD_CIDADE.Text <> '' then
    QVeiculoCadCOD_ESTADO.Value := DMOracle.FastSelect('COD_ESTADO','TB_CIDADE','COD_CIDADE = '+QVeiculoCadCOD_CIDADE.Text);
end;

procedure TDMVeiculoConhecimento.QVeiculoCadAfterInsert(DataSet: TDataSet);
begin
  QVeiculoCadCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  QVeiculoCadIND_TIPO_PROPRIEDADE.Value := 'T';
  QVeiculoCadIND_TIPO_VEICULO.Value := 0;
  QVeiculoCadIND_TIPO_RODADO.Value := '00';
  QVeiculoCadIND_TIPO_CARROCERIA.Value := '00';
end;

end.
 