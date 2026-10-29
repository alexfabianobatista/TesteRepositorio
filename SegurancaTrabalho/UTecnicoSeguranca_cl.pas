unit UTecnicoSeguranca_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMTecnicoSeguranca = class(TDataModule)
    QTecnicoSeguranca: TOracleDataSet1;
    QTecnicoSegurancaCOD_FILIAL: TIntegerField;
    QTecnicoSegurancadesc_filial: TStringField;
    QTecnicoSegurancaDESC_TECNICO_SEGURANCA: TStringField;
    QTecnicoSegCons: TOracleDataSet1;
    QTecnicoSegConsCOD_FILIAL: TIntegerField;
    QTecnicoSegConsDESC_TECNICO_SEGURANCA: TStringField;
    QRTecnicoSeguranca: TOracleDataSet1;
    procedure QTecnicoSegurancaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTecnicoSeguranca: TDMTecnicoSeguranca;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMTecnicoSeguranca.QTecnicoSegurancaCalcFields(
  DataSet: TDataSet);
begin
  if Trim(QTecnicoSegurancaCOD_FILIAL.Text) <> '' then
    QTecnicoSegurancadesc_filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                                            'COD_FILIAL = '+Trim(QTecnicoSegurancaCOD_FILIAL.Text))
  else
    QTecnicoSegurancadesc_filial.Text := '';
end;

end.
