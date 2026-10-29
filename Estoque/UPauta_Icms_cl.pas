unit UPauta_Icms_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMPauta_ICMS = class(TDataModule)
    QPauta_Icms_Cad: TOracleDataSet1;
    QPauta_Icms_CadCOD_PRODUTO: TFloatField;
    QPauta_Icms_CadCOD_ESTADO: TStringField;
    QPauta_Icms_CadVAL_PAUTA: TFloatField;
    QPauta_Icms_Caddesc_estado: TStringField;
    QPauta_Icms_Cons: TOracleDataSet1;
    QPauta_Icms_ConsCOD_PRODUTO: TFloatField;
    QPauta_Icms_ConsCOD_ESTADO: TStringField;
    QPauta_Icms_ConsVAL_PAUTA: TFloatField;
    QPauta_Icms_ConsDESC_PRODUTO: TStringField;
    QPauta_Icms_ConsDESC_ESTADO: TStringField;
    QRPauta_Icms: TOracleDataSet1;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    procedure QPauta_Icms_CadCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPauta_ICMS: TDMPauta_ICMS;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMPauta_ICMS.QPauta_Icms_CadCalcFields(DataSet: TDataSet);
begin
  QPauta_Icms_CadDesc_Estado.Value := DmOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO','COD_ESTADO ='+Chr(39) +QPauta_Icms_CadCod_Estado.Value+Chr(39));
end;

end.
