unit UCidade_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMCidade = class(TDataModule)
    QCidade: TOracleDataSet1;
    QCidadeCOD_CIDADE: TIntegerField;
    QCidadeDESC_CIDADE: TStringField;
    QCidadeCOD_ESTADO: TStringField;
    QCidadeCons: TOracleDataSet1;
    QCidadeConsCOD_CIDADE: TIntegerField;
    QCidadeConsDESC_CIDADE: TStringField;
    QCidadeConsCOD_ESTADO: TStringField;
    QCidadedesc_estado: TStringField;
    QRCidade: TOracleDataSet1;
    QCidadeCOD_PRACA: TStringField;
    QCidadedesc_cidade_praca: TStringField;
    QCidadeCOD_DFC: TIntegerField;
    QCidadeCOD_MUNICIPIO_SC: TIntegerField;
    QCidadeCOD_CIDADE_IBGE: TStringField;
    QRCidadeCOD_CIDADE: TIntegerField;
    QRCidadeDESC_CIDADE: TStringField;
    QRCidadeCOD_ESTADO: TStringField;
    QRCidadeCOD_PRACA: TStringField;
    QRCidadeCOD_DFC: TIntegerField;
    QRCidadeCOD_MUNICIPIO_SC: TIntegerField;
    QRCidadeCOD_CIDADE_IBGE: TStringField;
    QRCidadeIND_SINC_MAX_ROTEIRIZADOR: TStringField;
    QCidadePERC_ISS: TFloatField;
    QCidadePERC_IBS_MUN: TFloatField;
    procedure QCidadeCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCidade: TDMCidade;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMCidade.QCidadeCalcFields(DataSet: TDataSet);
begin
  If QCidadeCOD_ESTADO.Text <> '' Then
    QCidadeDesc_Estado.Text := DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO','COD_ESTADO = '+CHR(39)+Trim(QCidadeCod_Estado.Text)+CHR(39));
  If QCidadeCod_Praca.Text <> '' Then
    QCidadeDesc_Cidade_Praca.Text := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_PRACA','COD_PRACA = '+CHR(39)+Trim(QCidadeCod_Praca.Text)+CHR(39));
end;
end.
