unit UBlocoK_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMBlocoK = class(TDataModule)
    QReg200: TOracleDataSet1;
    QReg200COD_ITEM: TFloatField;
    QReg200QTD: TFloatField;
    QReg200IND_EST: TFloatField;
    QReg220: TOracleDataSet1;
    QReg220DT_TRANSFERENCIA: TDateTimeField;
    QReg220COD_PRODUTO_ORIGEM: TIntegerField;
    QReg220COD_PRODUTO_DESTINO: TIntegerField;
    QReg220QT_QUANTIDADE: TFloatField;
    QReg230: TOracleDataSet1;
    QReg235: TOracleDataSet1;
    QReg235DT_SAIDA: TDateTimeField;
    QReg235COD_ITEM: TIntegerField;
    QReg235QTD: TFloatField;
    QReg230DT_INI_OP: TDateTimeField;
    QReg230DT_FIN_OP: TDateTimeField;
    QReg230COD_DOC_OP: TIntegerField;
    QReg230COD_ITEM: TIntegerField;
    QReg230QTD_ENC: TFloatField;
    QReg230TIPO: TStringField;
    QReg200COD_PART: TFloatField;
    QReg235COD_INS_SUBST: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBlocoK: TDMBlocoK;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
