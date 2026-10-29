unit UMaquinaManu_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMMaquinaManu = class(TDataModule)
    QMaquinaManuCad: TOracleDataSet1;
    QMaquinaManuCadCOD_MAQUINA_MANU: TIntegerField;
    QMaquinaManuCadIND_TIPO: TStringField;
    QMaquinaManuCadCOD_OBRA: TIntegerField;
    QMaquinaManuCadKM: TFloatField;
    QMaquinaManuCadHORAS: TFloatField;
    QMaquinaManuCadDT_REVISAO: TDateTimeField;
    QMaquinaManuCadLOCAL: TStringField;
    QMaquinaManuCadSERIE: TStringField;
    QMaquinaManuCons: TOracleDataSet1;
    QMaquinaManuConsCOD_MAQUINA_MANU: TIntegerField;
    QMaquinaManuConsDT_REVISAO: TDateTimeField;
    QMaquinaManuConsCOD_OBRA: TIntegerField;
    QMaquinaManuConsDESC_OBRA: TStringField;
    QMaquinaManuConsIND_TIPO: TStringField;
    QRMaquinaManu: TOracleDataSet1;
    QRMaquinaProxManu: TOracleDataSet1;
    QRMaquinaManuOBRA: TStringField;
    QRMaquinaManuFILIAL: TStringField;
    QRMaquinaManuIND_SITUACAO: TStringField;
    QRMaquinaManuIND_KM_HR: TStringField;
    QRMaquinaManuDT_REVISAO: TDateTimeField;
    QRMaquinaManuKM_HR: TFloatField;
    QRMaquinaManuIND_TIPO: TStringField;
    QRMaquinaManuLOCAL: TStringField;
    QRMaquinaProxManuIND_KM_HR: TStringField;
    QRMaquinaProxManuVAL_MARCADOR: TFloatField;
    QRMaquinaProxManuPROX_TROCA_OLEO: TFloatField;
    QRMaquinaProxManuPROX_TROCA_FILTRO: TFloatField;
    QRMaquinaProxManuCOD_OBRA: TIntegerField;
    QRMaquinaProxManuDESC_OBRA: TStringField;
    QRMaquinaProxManuCOD_FILIAL: TIntegerField;
    QRMaquinaProxManuDESC_FILIAL: TStringField;
    procedure QMaquinaManuCadAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMaquinaManu: TDMMaquinaManu;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMMaquinaManu.QMaquinaManuCadAfterInsert(DataSet: TDataSet);
begin
  QMaquinaManuCadDT_REVISAO.Value := Date;
end;

end.
