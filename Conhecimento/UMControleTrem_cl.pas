unit UMControleTrem_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMControleTrem = class(TDataModule)
    QControleTremCad: TOracleDataSet1;
    QControleTremCadCOD_CONTROLE_TREM: TIntegerField;
    QControleTremCadDT_CONTROLE: TDateTimeField;
    QControleTremCadDESC_REMETENTE: TStringField;
    QControleTremCadDESC_DESTINATARIO: TStringField;
    QControleTremCadNUM_VAGAO: TIntegerField;
    QControleTremCadCOD_NOTA_CAB: TIntegerField;
    QControleTremCadCOD_EMPRESA_A: TStringField;
    QControleTremCadNUM_FATURA_A: TIntegerField;
    QControleTremCadNUM_DESPACHO_A: TIntegerField;
    QControleTremCadVAL_FRETE_A: TFloatField;
    QControleTremCadDT_PGTO_A: TDateTimeField;
    QControleTremCadCOD_EMPRESA_B: TStringField;
    QControleTremCadNUM_FATURA_B: TIntegerField;
    QControleTremCadVAL_FRETE_B: TFloatField;
    QControleTremCadDT_PGTO_B: TFloatField;
    QControleTremCadPESO_SAIDA: TFloatField;
    QControleTremCadPESO_CHEGADA: TFloatField;
    QControleTremCadNUM_DESPACHO_B: TIntegerField;
    QControleTremCadVAL_TON_A: TFloatField;
    QControleTremCadVAL_TON_B: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMControleTrem: TDMControleTrem;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
