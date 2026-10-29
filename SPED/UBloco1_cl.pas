unit UBloco1_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMBloco1 = class(TDataModule)
    QReg400: TOracleDataSet1;
    QReg100: TOracleDataSet1;
    QReg105: TOracleDataSet1;
    QReg105COD_SERIE: TStringField;
    QReg105DESC_CHAVE_ACESSO: TStringField;
    QReg105DT_EMISSAO: TDateTimeField;
    QReg105COD_PRODUTO: TFloatField;
    QReg100COD_NOTA_CAB: TIntegerField;
    QReg100IND_TIPO_DOCUMENTO: TStringField;
    QReg100NUM_DECLARACAO: TStringField;
    QReg100DT_DECLARACAO: TDateTimeField;
    QReg100IND_NATUREZA_EXPORTACAO: TStringField;
    QReg100NUMERO_RE: TStringField;
    QReg100DT_EMISSAO: TDateTimeField;
    QReg100COD_PAIS_SISCOMEX: TIntegerField;
    QReg100NUM_CONHECIMENTO: TStringField;
    QReg100DT_CONHECIMENTO: TDateTimeField;
    QReg100DT_AVERBACAO: TDateTimeField;
    QReg105NUM_SERIE_FISCAL: TIntegerField;
    QReg100NUM_TIPO_CONHECIMENTO: TStringField;
    QReg105IND_NATUREZA_EXPORTACAO: TStringField;
    QReg105NUM_NOTA: TFloatField;
    QReg105COD_SERIE_MODELO: TStringField;
    QReg400MUN: TStringField;
    QReg400VALOR: TFloatField;
    QReg400COD_ITEM_IPM: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBloco1: TDMBloco1;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
