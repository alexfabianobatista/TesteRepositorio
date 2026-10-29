unit UTef_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMTEF = class(TDataModule)
    QTefCab: TOracleDataSet1;
    QTefCabCOD_TEF_CAB: TIntegerField;
    QTefCabCOD_NOTA_CAB: TIntegerField;
    QTefCabNUM_NOTA: TIntegerField;
    QTefCabVAL_NOTA: TFloatField;
    QTefCabIND_STATUS: TStringField;
    QTefCabDESC_TERMINAL: TStringField;
    QTefPgto: TOracleDataSet1;
    QTefPgtoCOD_TEF_PGTO: TIntegerField;
    QTefPgtoCOD_TEF_CAB: TIntegerField;
    QTefPgtoVAL_PGTO: TFloatField;
    QTefCabPendente: TOracleDataSet1;
    QTefPgtoPendente: TOracleDataSet1;
    QTefPgtoPendenteCOD_TEF_PGTO: TIntegerField;
    QTefPgtoPendenteCOD_TEF_CAB: TIntegerField;
    QTefPgtoPendenteVAL_PGTO: TFloatField;
    QTefCabPendenteCOD_TEF_CAB: TIntegerField;
    QTefCabPendenteCOD_NOTA_CAB: TIntegerField;
    QTefCabPendenteNUM_NOTA: TIntegerField;
    QTefCabPendenteVAL_NOTA: TFloatField;
    QTefCabPendenteIND_STATUS: TStringField;
    QTefCabPendenteDESC_TERMINAL: TStringField;
    QPagamento: TOracleDataSet1;
    QPagamentoCOD_PAGAMENTO: TIntegerField;
    QPagamentoCOD_NOTA_CAB: TIntegerField;
    QPagamentoVAL_PAGAMENTO: TFloatField;
    QPagamentoVAL_VALOR: TFloatField;
    QPagamentoCOD_PAGAMENTO_ESTORNADO: TIntegerField;
    QPagamentoIND_ESTORNO: TStringField;
    QPagamentoCOD_TEF_PGTO: TIntegerField;
    QTefPgtoDESC_REDE_AUTORIZADORA: TStringField;
    QTefPgtoDESC_BANDEIRA_CARTAO: TStringField;
    QTefPgtoPendenteDESC_REDE_AUTORIZADORA: TStringField;
    QTefPgtoPendenteDESC_BANDEIRA_CARTAO: TStringField;
    QPagamentoDESC_PAGAMENTO: TStringField;
    QTefCabCOD_VALE_PRESENTE: TIntegerField;
    QTefCabPendenteCOD_VALE_PRESENTE: TIntegerField;
    QTefCabDT_EMISSAO: TDateTimeField;
    QTefCabPendenteDT_EMISSAO: TDateTimeField;
    QTefPgtoNSU: TStringField;
    QTefPgtoPendenteNSU: TStringField;
    procedure QPagamentoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTEF: TDMTEF;

implementation

uses UNotaSaida_cl;

{$R *.dfm}

procedure TDMTEF.QPagamentoAfterInsert(DataSet: TDataSet);
begin
  QPagamentoCOD_NOTA_CAB.Value := DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value;
end;

end.
