unit UImportaDados_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Oracle, OracleData, OraTeste, OraS;

type
  TDMImportaDados = class(TDataModule)
    QExpSyngentaSKU: TOracleDataSet1;
    QExpSyngentaSKUNUM_FABRICANTE: TStringField;
    QExpSyngentaSKUFILIAL_ESTOQUE: TStringField;
    QExpSyngentaSKUDT_RECEBIMENTO: TDateTimeField;
    QExpSyngentaSKUQT_VENDA: TFloatField;
    QExpSyngentaSKUQT_VENDA_ESTORNO: TFloatField;
    QExpSyngentaSKUVAL_PRECO_UNITARIO: TFloatField;
    QExpSyngentaSKUVAL_MARGEM_UNITARIA: TFloatField;
    QExpSyngentaSKUQT_TRANFERENCIA: TFloatField;
    QExpSyngentaSKUQT_TRANFERENCIA_ESTORNO: TFloatField;
    QExpSyngentaSKUVL_CUSTO_MEDIO: TFloatField;
    QExpSyngentaSKUQT_ESTOQUE: TFloatField;
    QExpSyngentaSKUFALTA_ESTOQUE: TFloatField;
    QExpSyngentaDFU: TOracleDataSet1;
    QExpSyngentaNF: TOracleDataSet1;
    QExpSyngentaDFUNUM_FABRICANTE: TStringField;
    QExpSyngentaDFUFILIAL_ESTOQUE: TStringField;
    QExpSyngentaDFUDT_RECEBIMENTO: TDateTimeField;
    QExpSyngentaDFUQT_VENDA: TFloatField;
    QExpSyngentaDFUQT_VENDA_ESTORNO: TFloatField;
    QExpSyngentaDFUDESC_CIDADE: TStringField;
    QExpSyngentaDFUVAL_PRECO_UNITARIO: TFloatField;
    QExpSyngentaDFUVAL_MARGEM_UNITARIA: TFloatField;
    QExpSyngentaNFNUM_FABRICANTE: TStringField;
    QExpSyngentaNFFILIAL_ESTOQUE: TStringField;
    QExpSyngentaNFNUM_NOTA: TIntegerField;
  private
    { Private declarations }

  public
    { Public declarations }
    Procedure ImportaProduto;
  end;

var
  DMImportaDados: TDMImportaDados;

implementation

uses UOracle_cl;

{$R *.DFM}

{ TDMImportaDados }

procedure TDMImportaDados.ImportaProduto;
begin
end;

end.
