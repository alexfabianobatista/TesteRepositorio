unit UBlocoG_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDmBlocoG = class(TDataModule)
    QReg110: TOracleDataSet1;
    QReg110VAL_TOTAL: TFloatField;
    QReg110VAL_CREDITO: TFloatField;
    QReg110DT_GERADO_CIAP: TDateTimeField;
    QReg110VAL_CRED_ANT: TFloatField;
    QReg125: TOracleDataSet1;
    QReg130: TOracleDataSet1;
    QReg140: TOracleDataSet1;
    QReg125COD_PATRIMONIO_ITEM: TIntegerField;
    QReg125VAL_CREDITO: TFloatField;
    QReg125COD_CONTROLE_CREDITO_ICMS: TIntegerField;
    QReg125VAL_ICMS: TFloatField;
    QReg125DT_AQUISICAO: TDateTimeField;
    QReg125COD_NOTA_CAB_ENTRADA: TIntegerField;
    QReg130EMITENTE: TFloatField;
    QReg130COD_CADASTRO: TIntegerField;
    QReg130COD_SERIE: TStringField;
    QReg130COD_SERIE_MODELO: TStringField;
    QReg130NUM_NOTA: TIntegerField;
    QReg130DT_EMISSAO: TDateTimeField;
    QReg130DESC_CHAVE_ACESSO: TStringField;
    QReg130NOME: TStringField;
    QReg140COD_PRODUTO: TFloatField;
    QReg140DESC_PRODUTO: TStringField;
    QReg140QT_QUANTIDADE: TFloatField;
    QReg140DESC_UNIDADE: TStringField;
    QReg140VAL_ICMS: TFloatField;
    QReg140VAL_ICMS_SUBST: TFloatField;
    QReg140VAL_ICMS_FRETE: TFloatField;
    QReg140VAL_ICMS_DIFERENCIAL: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmBlocoG: TDmBlocoG;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
