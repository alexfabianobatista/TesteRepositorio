unit UBlocoD_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDmBlocoD = class(TDataModule)
    QReg100: TOracleDataSet1;
    QReg100COD_CADASTRO: TFloatField;
    QReg100IND_SITUACAO: TStringField;
    QReg100NUM_CONHECIMENTO: TFloatField;
    QReg100DT_EMISSAO: TDateTimeField;
    QReg100DT_RECEBIMENTO: TDateTimeField;
    QReg100VAL_FRETE: TFloatField;
    QReg100VAL_DESCONTO: TFloatField;
    QReg100TIPO_PAGAMENTO: TFloatField;
    QReg100VAL_TOTAL: TFloatField;
    QReg100VAL_BASE_CALCULO: TFloatField;
    QReg100VAL_ICMS: TFloatField;
    QReg100VAL_NAO_TRIBUTADO: TFloatField;
    QReg100VAL_PIS: TFloatField;
    QReg100VAL_COFINS: TFloatField;
    QReg100COD_CONHECIMENTO: TFloatField;
    QReg130: TOracleDataSet1;
    QReg500: TOracleDataSet1;
    QReg500COD_PART: TIntegerField;
    QReg500COD_MOD: TFloatField;
    QReg500COD_SIT: TStringField;
    QReg500SER: TStringField;
    QReg500DT_DOC: TDateTimeField;
    QReg500DT_A_P: TDateTimeField;
    QReg500VAL_DOC: TFloatField;
    QReg500VAL_SERV: TFloatField;
    QReg500VL_ICMS: TFloatField;
    QReg590: TOracleDataSet1;
    QReg590CST_ICMS: TStringField;
    QReg590CFOP: TFloatField;
    QReg590ALIQ_ICMS: TFloatField;
    QReg590VL_OPR: TFloatField;
    QReg590VL_BC_ICMS: TFloatField;
    QReg590VL_ICMS: TFloatField;
    QReg590VL_BC_ICMS_ST: TFloatField;
    QReg590VL_ICMS_ST: TFloatField;
    QReg590VL_RED_BC: TFloatField;
    QReg100IND_TIPO_OPERACAO: TStringField;
    QReg100CST_ICMS: TStringField;
    QReg100ALIQ_ICMS: TFloatField;
    QReg100CFOP: TFloatField;
    QReg100IND_EMITE: TStringField;
    QReg100val_servico: TFloatField;
    QAux100: TOracleDataSet1;
    QAux100VALOR: TFloatField;
    QReg100TIPO: TStringField;
    QReg100NUM_SERIE_FISCAL: TFloatField;
    QReg500NUM_SERIE_FISCAL: TIntegerField;
    QReg130COD_CIDADE_IBGE_ORIGEM: TStringField;
    QReg130COD_UF_IBGE_ORIGEM: TFloatField;
    QReg130COD_CIDADE_IBGE_DESTINO: TStringField;
    QReg130COD_UF_IBGE_DESTINO: TFloatField;
    QReg130DESC_PLACA: TStringField;
    QReg130VAL_LIQUIDO: TFloatField;
    QReg130VAL_PEDAGIO: TFloatField;
    QReg130VAL_FRETE: TFloatField;
    QReg500NUM_DOC: TFloatField;
    QReg500VL_BC_ICMS: TFloatField;
    QReg500COD_NOTA_CAB: TIntegerField;
    QReg100COD_SERIE_MODELO: TStringField;
    QReg100DESC_CHAVE_ACESSO_CTE: TStringField;
    QReg100IND_TIPO_CTE: TStringField;
    QReg100COD_SERIE: TStringField;
    QReg500COD_SERIE: TStringField;
    QReg100COD_MUN_ORIG: TStringField;
    QReg100COD_MUN_DEST: TStringField;
    QReg100DESC_CHAVE_ACESSO_REF: TStringField;
    procedure QReg100CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmBlocoD: TDmBlocoD;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TDmBlocoD.QReg100CalcFields(DataSet: TDataSet);
begin
  if QReg100TIPO.Value = 'N' then
  Begin
    QAux100.Close;
    QAux100.SetVariable('COD_NOTA_CAB', QReg100COD_CONHECIMENTO.Value);
    QAux100.open;
    QReg100val_servico.Value := QAux100VALOR.Value;
  End
  else
    QReg100val_servico.Value := QReg100VAL_FRETE.Value;
  if QReg100val_servico.Value = 0 then
    QReg100val_servico.Value := QReg100VAL_TOTAL.Value;
end;

end.
