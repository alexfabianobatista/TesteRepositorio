unit URecebimentoRel_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMRecebimentoRel = class(TDataModule)
    QRRecebimentoJornal: TOracleDataSet1;
    QRRecebimentoJornalNUM_ANO: TIntegerField;
    QRRecebimentoJornalNOME: TStringField;
    QRRecebimentoJornalDT_VENCIMENTO: TDateTimeField;
    QRRecebimentoJornalVAL_TOTAL: TFloatField;
    QRRecebimentoJornalDESC_CIDADE: TStringField;
    QRRecebimentoJornalVALOR_PARCELA1: TFloatField;
    QRRecebimentoJornalDT_PAGAMENTO_PARCELA1: TDateTimeField;
    QRRecebimentoJornalVALOR_PARCELA2: TFloatField;
    QRRecebimentoJornalDT_PAGAMENTO_PARCELA2: TDateTimeField;
    QRRecebimentoJornalVALOR_PARCELA3: TFloatField;
    QRRecebimentoJornalDT_PAGAMENTO_PARCELA3: TDateTimeField;
    QRRecebimentoJornalVALOR_PARCELA4: TFloatField;
    QRRecebimentoJornalDT_PAGAMENTO_PARCELA4: TDateTimeField;
    QRRecebimentoJornalVENDEDOR: TStringField;
    QRRecebimentoJornalCOD_VENDEDOR: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRecebimentoRel: TDMRecebimentoRel;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
