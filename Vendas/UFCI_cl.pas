unit UFCI_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMFCI = class(TDataModule)
    QReg0000: TOracleDataSet1;
    QReg0010: TOracleDataSet1;
    QReg0001: TOracleDataSet1;
    QReg0001TIPO_REGISTRO: TStringField;
    QReg0001TEXTO_PADRAO_UTF8: TStringField;
    QReg0000TIPO_REGISTRO: TStringField;
    QReg0000CNPJ_CONTRIBUINTE: TStringField;
    QReg0000NOME_CONTRIBUINTE: TStringField;
    QReg0000VERSAO_LEIAUTE: TStringField;
    QReg0990: TOracleDataSet1;
    QReg0990TIPO_REGISTRO: TStringField;
    QReg0990QUANTIDADE_LINHAS: TFloatField;
    QReg0010TIPO_REGISTRO: TStringField;
    QReg0010CNPJ_CONTRIBUINTE: TStringField;
    QReg0010NOME_RAZAO_SOCIAL: TStringField;
    QReg0010INSCRICAO_ESTADUAL: TStringField;
    QReg0010ENDERECO_ESTABELECIMENTO: TStringField;
    QReg0010CEP: TStringField;
    QReg0010MUNICIPIO: TStringField;
    QReg0010UF: TStringField;
    QReg5001: TOracleDataSet1;
    QReg5001TIPO_REGISTRO: TStringField;
    QReg5020: TOracleDataSet1;
    QReg5990: TOracleDataSet1;
    QReg5990TIPO_REGISTRO: TStringField;
    QReg5990QUANTIDADE_LINHAS: TFloatField;
    QReg5020TIPO_REGISTRO: TStringField;
    QReg5020NOME_MERCADORIA: TStringField;
    QReg5020CODIGO_NCM: TStringField;
    QReg5020CODIGO_MERCADORIA: TFloatField;
    QReg5020CODIGO_GTIN: TStringField;
    QReg5020UNIDADE_MERCADORIA: TStringField;
    QReg5020CONTEUDO_IMPORTACAO_CI: TFloatField;
    QReg9001: TOracleDataSet1;
    QReg9001TIPO_REGISTRO: TStringField;
    QReg9900: TOracleDataSet1;
    QReg9900TIPO_REGISTRO: TStringField;
    QReg9900TIPO_REGISTRO_SER_TOTALIZADO: TStringField;
    QReg9900QTD_LINHAS: TFloatField;
    QReg9990: TOracleDataSet1;
    QReg9990TIPO_REGISTRO: TStringField;
    QReg9990QTD_LINHAS: TFloatField;
    QReg9999: TOracleDataSet1;
    QReg9999TIPO_REGISTRO: TStringField;
    QReg9999QUANTIDADE_LINHAS: TFloatField;
    QReg5020VALOR_SAIDA_MERCADORIA: TStringField;
    QReg5020VALOR_PARCELA_IMPORTADA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMFCI: TDMFCI;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
