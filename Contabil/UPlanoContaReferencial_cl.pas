unit UPlanoContaReferencial_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDmPlanoContaReferencial = class(TDataModule)
    QPlanoContaReferencial: TOracleDataSet1;
    QPlanoContaReferencialCons: TOracleDataSet1;
    QPlanoContaReferencialCOD_PLANO_CONTA_REFERENCIAL: TIntegerField;
    QPlanoContaReferencialDESC_PLANO_CONTA_REFERENCIAL: TStringField;
    QPlanoContaReferencialNUM_PLANO_CONTA_REFERENCIAL: TStringField;
    QPlanoContaReferencialConsCOD_PLANO_CONTA_REFERENCIAL: TIntegerField;
    QPlanoContaReferencialConsDESC_PLANO_CONTA_REFERENCIAL: TStringField;
    QPlanoContaReferencialConsNUM_PLANO_CONTA_REFERENCIAL: TStringField;
    QRPlanoContaReferencial: TOracleDataSet1;
    QRPlanoContaReferencialCOD_PLANO_CONTA_REFERENCIAL: TIntegerField;
    QRPlanoContaReferencialNUM_PLANO_CONTA_REFERENCIAL: TStringField;
    QRPlanoContaReferencialDESC_PLANO_CONTA_REFERENCIAL: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmPlanoContaReferencial: TDmPlanoContaReferencial;

implementation

{$R *.dfm}

end.
