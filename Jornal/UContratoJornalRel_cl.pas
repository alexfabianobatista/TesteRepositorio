unit UContratoJornalRel_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMContratoJornalRel = class(TDataModule)
    QRContratoJornal: TOracleDataSet1;
    QRContratoJornalNUM_EDICAO: TIntegerField;
    QRContratoJornalDT_EDICAO: TDateTimeField;
    QRContratoJornalCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRContratoJornalFILIAL: TStringField;
    QRContratoJornalCADASTRO: TStringField;
    QRContratoJornalDT_CONTRATO: TDateTimeField;
    QRContratoJornalVAL_CONTRATO: TFloatField;
    QRContratoJornalVENDEDOR: TStringField;
    QRContratoJornalSITUACAO_CR: TStringField;
    QRContratoJornalVAL_CR: TFloatField;
    QRContratoJornalDT_VENCIMENTO: TDateTimeField;
    QRContratoJornalCOD_CONTRATO_JORNAL: TIntegerField;
    QRContratoJornalVAL_ORIGINAL: TFloatField;
    QRContratoJornalIND_TIPO: TStringField;
    QRContratoJornalIND_SITUACAO: TIntegerField;
    QRContratoJornaldesc_situacao: TStringField;
    procedure QRContratoJornalCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContratoJornalRel: TDMContratoJornalRel;

implementation

uses UOracle_cl, UContratoJornal_cl;

{$R *.dfm}

procedure TDMContratoJornalRel.QRContratoJornalCalcFields(
  DataSet: TDataSet);
begin
  QRContratoJornaldesc_situacao.Value := '';
  case QRContratoJornalIND_SITUACAO.Value of
    SIT_CONTRATO_ABERTO: QRContratoJornaldesc_situacao.Value := 'ABERTO';
    SIT_CONTRATO_FECHADO: QRContratoJornaldesc_situacao.Value := 'FECHADO';
    SIT_CONTRATO_CANCELADO: QRContratoJornaldesc_situacao.Value := 'CANCELADO';
  end;
end;

end.
