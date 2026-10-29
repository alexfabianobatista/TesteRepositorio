unit ULancamento_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMLancamento = class(TDataModule)
    QLancamento: TOracleDataSet1;
    QLancamentoCOD_LANCAMENTO: TIntegerField;
    QLancamentoCOD_MEDICO: TIntegerField;
    QLancamentoCOD_CONVENIO: TIntegerField;
    QLancamentoDT_LANCAMENTO: TDateTimeField;
    QLancamentoDT_PAGAMENTO: TDateTimeField;
    QLancamentoVAL_PAGAMENTO: TFloatField;
    QLancamentoIND_TIPO_PAGAMENTO: TStringField;
    QLancamentoNOME_PACIENTE: TStringField;
    QLancamentoCons: TOracleDataSet1;
    QLancamentoConsCOD_LANCAMENTO: TIntegerField;
    QLancamentoConsDT_LANCAMENTO: TDateTimeField;
    QLancamentoConsDT_PAGAMENTO: TDateTimeField;
    QLancamentoConsVAL_PAGAMENTO: TFloatField;
    QLancamentoConsNOME_PACIENTE: TStringField;
    QRLancamento: TOracleDataSet1;
    QRLancamentoCOD_LANCAMENTO: TIntegerField;
    QRLancamentoDT_LANCAMENTO: TDateTimeField;
    QRLancamentoDT_PAGAMENTO: TDateTimeField;
    QRLancamentoVAL_PAGAMENTO: TFloatField;
    QRLancamentoNOME_PACIENTE: TStringField;
    QRLancamentoMES_ANO_LANCAMENTO: TStringField;
    QRLancamentoMES_ANO_PAGAMENTO: TStringField;
    QRLancamentoNOME_MEDICO: TStringField;
    QRLancamentoDESC_CONVENIO: TStringField;
    QRLancamentoTIPO_PAGAMENTO: TStringField;
    QRReciboLancamento: TOracleDataSet1;
    QRReciboLancamentoNOME: TStringField;
    QRReciboLancamentoVAL_PAGAMENTO: TFloatField;
    QLancamentoConsNOME_MEDICO: TStringField;
    QLancamentoConsDESC_CONVENIO: TStringField;
    QLancamentoConsTIPO_PAGAMENTO: TStringField;
    QRLancamentoSintetico: TOracleDataSet1;
    QRLancamentoSinteticoNOME: TStringField;
    QRLancamentoSinteticoVAL_PAGAMENTO: TFloatField;
    QLancamentoIND_SITUACAO: TStringField;
    QRReciboLancamentoNOME_PACIENTE: TStringField;
    QRReciboLancamentoCONVENIO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMLancamento: TDMLancamento;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
