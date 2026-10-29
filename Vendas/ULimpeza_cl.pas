unit ULimpeza_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMLimpeza = class(TDataModule)
    QLimpaPedido: TOracleDataSet1;
    QLimpaPrazo: TOracleDataSet1;
    QLimpaConta: TOracleDataSet1;
    QLimpaNotaCab: TOracleDataSet1;
    QLimpaNotaItem: TOracleDataSet1;
    QLimpaCaixa: TOracleDataSet1;
    QLimpeza: TOracleDataSet1;
    QLimpezaCOD_NOTA_CAB: TIntegerField;
    QLimpezaCOD_FILIAL: TIntegerField;
    QLimpezaIND_SITUACAO: TStringField;
    QLimpezaIND_CONDICAO_PAGTO: TStringField;
    QLimpezaDT_EMISSAO: TDateTimeField;
    QLimpezaIND_ENTRADA_SAIDA: TStringField;
    QLimpezaIND_EMITE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMLimpeza: TDMLimpeza;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
