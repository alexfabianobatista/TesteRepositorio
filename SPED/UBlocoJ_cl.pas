unit UBlocoJ_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDmBlocoJ = class(TDataModule)
    QReg100: TOracleDataSet1;
    QReg900: TOracleDataSet1;
    QReg930: TOracleDataSet1;
    QReg930NOME: TStringField;
    QReg930DESC_CPF: TStringField;
    QReg930DESC_QUALIFICACAO: TStringField;
    QReg930DESC_CRC: TStringField;
    QReg100COD_AGLUTINACAO: TIntegerField;
    QReg100NUM_PLANO_CONTA: TStringField;
    QReg100DESC_PLANO_CONTA: TStringField;
    QReg100NUM_GRAU: TIntegerField;
    QReg100DESC_TIPO_BALANCO: TStringField;
    QReg100VAL_ATUAL: TFloatField;
    QReg100IND_DC: TStringField;
    QReg900COD_TERMO_ABERTURA: TIntegerField;
    QReg900COD_FILIAL: TIntegerField;
    QReg900NUM_ORDEM: TFloatField;
    QReg900DESC_NAT_LIVRO: TStringField;
    QReg900DT_INICIAL: TDateTimeField;
    QReg900DESC_FILIAL: TStringField;
    QReg100IND_DC_BAL_INI: TStringField;
    QReg930DESC_E_MAIL: TStringField;
    QReg930DESC_TELEFONE: TStringField;
    QReg930UF_CRC: TStringField;
    QReg930NUM_SEQ_CRC: TStringField;
    QReg930DT_CRC: TStringField;
    QReg100VAL_CTA_INI: TFloatField;
    QReg800: TOracleDataSet1;
    QReg800DESC_NOTA_EXPLICATIVA: TMemoField;
    QReg100IND_COD_AGLUTINACAO: TStringField;
    QReg100COD_AGLUTINACAO_SUP: TFloatField;
    QReg100Trim: TOracleDataSet1;
    QReg100TrimCOD_AGLUTINACAO: TIntegerField;
    QReg100TrimIND_COD_AGLUTINACAO: TStringField;
    QReg100TrimCOD_AGLUTINACAO_SUP: TFloatField;
    QReg100TrimNUM_PLANO_CONTA: TStringField;
    QReg100TrimDESC_PLANO_CONTA: TStringField;
    QReg100TrimNUM_GRAU: TIntegerField;
    QReg100TrimDESC_TIPO_BALANCO: TStringField;
    QReg100TrimVAL_ATUAL: TFloatField;
    QReg100TrimIND_DC: TStringField;
    QReg100TrimVAL_CTA_INI: TFloatField;
    QReg100TrimIND_DC_BAL_INI: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmBlocoJ: TDmBlocoJ;

implementation

{$R *.dfm}

end.
