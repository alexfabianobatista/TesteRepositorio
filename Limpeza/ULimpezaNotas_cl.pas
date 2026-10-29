unit ULimpezaNotas_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMLimpezaNotas = class(TDataModule)
    QLimpezaNotaCab: TOracleDataSet1;
    QLimpezaNotaItem: TOracleDataSet1;
    QLimpezaNotaCabCOD_NOTA_CAB: TIntegerField;
    QContaReceberCab: TOracleDataSet1;
    QContaReceberMov: TOracleDataSet1;
    QCaixa_Mov_CR: TOracleDataSet1;
    QContaReceberMovCOD_CONTA_RECEBER_MOV: TIntegerField;
    QContaReceberMovCOD_CAIXA_MOV: TIntegerField;
    QContaReceberMovCOD_BCO_MOVIMENTO: TIntegerField;
    QBanco_Mov_CR: TOracleDataSet1;
    QCaixa_Mov_CRCOD_CAIXA_MOV: TIntegerField;
    QBanco_Mov_CRCOD_BCO_MOVIMENTO: TIntegerField;
    QCaixaNotaCab: TOracleDataSet1;
    QCaixaNotaCabCOD_CAIXA_MOV: TIntegerField;
    QBaixaPedido_Item: TOracleDataSet1;
    QContaPagarCab: TOracleDataSet1;
    QContaPagarMov: TOracleDataSet1;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    QCaixa_Mov_CP: TOracleDataSet1;
    IntegerField4: TIntegerField;
    QBanco_Mov_Cp: TOracleDataSet1;
    IntegerField5: TIntegerField;
    QContaPagarCabCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContaPagarMovCOD_CONTA_PAGAR_MOV: TIntegerField;
    QBaixaOC: TOracleDataSet1;
    QBaixaOCCOD_NOTA_ITEM: TIntegerField;
    QBaixaPedido_ItemCOD_NOTA_ITEM: TIntegerField;
    QContaReceberCabCOD_CONTA_RECEBER_CAB: TIntegerField;
    QLimpezaNotaCabIND_ENTRADA_SAIDA: TStringField;
    QLimpezaNotaCabIND_CONDICAO_PAGTO: TStringField;
    QLimpezaCaixa_Banco_CP: TOracleDataSet1;
    IntegerField9: TIntegerField;
    QLimpezaCaixa_Banco_CR: TOracleDataSet1;
    IntegerField1: TIntegerField;
    QNome_Nota: TOracleDataSet1;
    QNome_NotaCOD_NOTA_CAB: TIntegerField;
    QNome_NotaNOME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMLimpezaNotas: TDMLimpezaNotas;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
