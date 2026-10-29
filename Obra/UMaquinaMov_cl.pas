unit UMaquinaMov_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMMaquinaMov = class(TDataModule)
    QMaquinaMovCad: TOracleDataSet1;
    QMaquinaMovCadCOD_MAQUINA_MOV: TIntegerField;
    QMaquinaMovCadDT_MOVIMENTO: TDateTimeField;
    QMaquinaMovCadCOD_OBRA: TIntegerField;
    QMaquinaMovCadCOD_OPERADOR: TIntegerField;
    QMaquinaMovCadKM_INICIAL: TFloatField;
    QMaquinaMovCadKM_FINAL: TFloatField;
    QMaquinaMovCadHR_TRABALHADAS: TFloatField;
    QMaquinaMovCons: TOracleDataSet1;
    QMaquinaMovConsCOD_MAQUINA_MOV: TIntegerField;
    QMaquinaMovConsDT_MOVIMENTO: TDateTimeField;
    QMaquinaMovConsCOD_OBRA: TIntegerField;
    QMaquinaMovConsDESC_OBRA: TStringField;
    QMaquinaMovConsCOD_OPERADOR: TIntegerField;
    QMaquinaMovConsNOME: TStringField;
    QRMaquinaMov: TOracleDataSet1;
    QRMaquinaMovIND_SITUACAO: TStringField;
    QRMaquinaMovDT_MOVIMENTO: TDateTimeField;
    QRMaquinaMovKM_INICIAL: TFloatField;
    QRMaquinaMovKM_FINAL: TFloatField;
    QRMaquinaMovHR_TRABALHADAS: TFloatField;
    QRMaquinaMovOBRA: TStringField;
    QRMaquinaMovFILIAL: TStringField;
    QRMaquinaMovCOD_OPERADOR: TIntegerField;
    QRMaquinaMovOPERADOR: TStringField;
    procedure QMaquinaMovCadAfterInsert(DataSet: TDataSet);
    procedure QMaquinaMovCadBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMaquinaMov: TDMMaquinaMov;

implementation

uses UOracle_cl, UObra_cl;

{$R *.DFM}

procedure TDMMaquinaMov.QMaquinaMovCadAfterInsert(DataSet: TDataSet);
begin
  QMaquinaMovCadDT_MOVIMENTO.Value := Date;
end;

procedure TDMMaquinaMov.QMaquinaMovCadBeforePost(DataSet: TDataSet);
begin
  if QMaquinaMovCadKM_FINAL.Value < QMaquinaMovCadKM_INICIAL.Value then
    Raise Exception.Create('Kilometragem Final deve ser Maior do que a Inicial');
  if QMaquinaMovCad.State in [DSInsert] then
  begin
    DMObra.QObra_Cad.Close;
    DMObra.QObra_Cad.SetVariable('PK',QMaquinaMovCadCOD_OBRA.Value);
    DMObra.QObra_Cad.open;
    DMObra.QObra_Cad.Edit;
    if DMObra.QObra_CadIND_KM_HR.Value = 'KM' then
      DMObra.QObra_CadVAL_MARCADOR.Value := QMaquinaMovCadKM_FINAL.Value
    else
      DMObra.QObra_CadVAL_MARCADOR.Value := DMObra.QObra_CadVAL_MARCADOR.Value + QMaquinaMovCadHR_TRABALHADAS.Value;
    DMObra.QObra_Cad.Post;
  end;
end;

end.
