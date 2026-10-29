unit UMotorista_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMMotorista = class(TDataModule)
    QMotoristaCad: TOracleDataSet1;
    QMotoristaCons: TOracleDataSet1;
    QRMotorista: TOracleDataSet1;
    QRMotoristaCOD_MOTORISTA: TIntegerField;
    QRMotoristaNOME: TStringField;
    QRMotoristaDT_EXPEDICAO: TDateTimeField;
    QRMotoristaDESC_CARTEIRA: TStringField;
    QMotoristaCadCOD_MOTORISTA: TIntegerField;
    QMotoristaCadNOME: TStringField;
    QMotoristaCadDESC_CARTEIRA: TStringField;
    QMotoristaCadDT_EXPEDICAO: TDateTimeField;
    QMotoristaCadDESC_TELEFONE: TStringField;
    QMotoristaConsCOD_MOTORISTA: TIntegerField;
    QMotoristaConsNOME: TStringField;
    QMotoristaConsDESC_CARTEIRA: TStringField;
    QMotoristaConsDT_EXPEDICAO: TDateTimeField;
    QMotoristaConsDESC_TELEFONE: TStringField;
    QRMotoristaDESC_TELEFONE: TStringField;
    QMotoristaCadDESC_CIDADE: TStringField;
    QRMotoristaDESC_CIDADE: TStringField;
    QMotoristaConsDESC_CIDADE: TStringField;
    QMotoristaCadNUM_CPF: TStringField;
    QMotoristaCadNUM_RG: TStringField;
    QMotoristaCadORGAO_EMISSOR_RG: TStringField;
    QMotoristaCadNUM_INSS: TStringField;
    QRMotoristaNUM_CPF: TStringField;
    QRMotoristaNUM_RG: TStringField;
    procedure QMotoristaCadBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMotorista: TDMMotorista;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMMotorista.QMotoristaCadBeforePost(DataSet: TDataSet);
begin
  DMMotorista.QMotoristaCadDesc_Cidade.Value := UpperCase(DMMotorista.QMotoristaCadDesc_Cidade.value);
end;

end.
