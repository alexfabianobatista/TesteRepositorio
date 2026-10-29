unit UPrecoPocket1_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMPrecoPocket1 = class(TDataModule)
    QPrecoPocket_Cad: TOracleDataSet1;
    QPrecoPocket_Cons: TOracleDataSet1;
    QPrecoPocket_CadCOD_TABELA_POCKET: TIntegerField;
    QPrecoPocket_CadDESC_TABELA: TStringField;
    QPrecoPocket_CadIND_SITUACAO: TStringField;
    QPrecoPocket_CadNUM_PRAZO_MAXIMO: TIntegerField;
    QPrecoPocket_CadPERC_COMISSAO: TFloatField;
    QPrecoPocket_Item: TOracleDataSet1;
    QPrecoPocket_ItemCOD_TABELA_POCKET: TIntegerField;
    QPrecoPocket_ItemCOD_PRODUTO: TIntegerField;
    QPrecoPocket_ItemVAL_PRECO_AVISTA: TFloatField;
    QPrecoPocket_ItemVAL_PRECO_APRAZO: TFloatField;
    QPrecoPocket_ConsCOD_TABELA_POCKET: TIntegerField;
    QPrecoPocket_ConsDESC_TABELA: TStringField;
    QPrecoPocket_ConsIND_SITUACAO: TStringField;
    QPrecoPocket_ConsNUM_PRAZO_MAXIMO: TIntegerField;
    QPrecoPocket_ConsPERC_COMISSAO: TFloatField;
    QPrecoPocket_CadQT_MINIMO_CAIXAS: TIntegerField;
    QRPrecoPocket: TOracleDataSet1;
    QRPrecoPocketCOD_TABELA_POCKET: TIntegerField;
    QRPrecoPocketDESC_TABELA: TStringField;
    QRPrecoPocketNUM_PRAZO_MAXIMO: TIntegerField;
    QRPrecoPocketPERC_COMISSAO: TFloatField;
    QRPrecoPocketQT_MINIMO_CAIXAS: TIntegerField;
    QRPrecoPocketVAL_PRECO_AVISTA: TFloatField;
    QRPrecoPocketVAL_PRECO_APRAZO: TFloatField;
    QRPrecoPocketDESC_PRODUTO: TStringField;
    QRPrecoPocketCOD_PRODUTO: TIntegerField;
    QRPrecoPocketCOD_CLASSE: TIntegerField;
    QRPrecoPocketDESC_CLASSE: TStringField;
    QPrecoPocket_CadPERC_DESC_AVISTA: TFloatField;
    QTabelaPocket_Cons: TOracleDataSet1;
    QPrecoPocket_CadNUM_COD_TBL_PAI: TIntegerField;
    QPrecoPocket_CadPERC_VARIACAO: TFloatField;
    QPrecoPocket_CadDES_OPERACAO: TStringField;
    QTabelaPocket_ConsCOD_TABELA_POCKET: TIntegerField;
    QTabelaPocket_ConsDESC_TABELA: TStringField;
    QTabelaPocket_ConsIND_SITUACAO: TStringField;
    QTabelaPocket_ConsNUM_PRAZO_MAXIMO: TIntegerField;
    QTabelaPocket_ConsPERC_COMISSAO: TFloatField;
    QTabelaPocket_ConsQT_MINIMO_CAIXAS: TIntegerField;
    QTabelaPocket_ConsPERC_DESC_AVISTA: TFloatField;
    QTabelaPocket_ConsNUM_COD_TBL_PAI: TIntegerField;
    QTabelaPocket_ConsPERC_VARIACAO: TFloatField;
    QTabelaPocket_ConsDES_OPERACAO: TStringField;
    procedure QPrecoPocket_ItemAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPrecoPocket1: TDMPrecoPocket1;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TDMPrecoPocket1.QPrecoPocket_ItemAfterInsert(DataSet: TDataSet);
begin
  QPrecoPocket_ItemCOD_TABELA_POCKET.Value := QPrecoPocket_CadCOD_TABELA_POCKET.value;
end;

end.
