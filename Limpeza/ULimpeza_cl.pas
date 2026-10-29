unit ULimpeza_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDmLimpeza = class(TDataModule)
    QLimpeza_Caixa: TOracleDataSet1;
    QLimpeza_Bancos: TOracleDataSet1;
    QLimpeza_Pedido_Cab: TOracleDataSet1;
    QLimpeza_Pedido_Item: TOracleDataSet1;
    QAcessa_Embarque_Item: TOracleDataSet1;
    QLimpeza_Pedido_CabCOD_PEDIDO_CAB: TIntegerField;
    QLimpeza_Pedido_ItemCOD_PEDIDO_ITEM: TIntegerField;
    QLimpeza_Embarque_Cab: TOracleDataSet1;
    QAcessa_Embarque_ItemCOD_EMBARQUE: TIntegerField;
    QLimpeza_Embarque_CabCOD_EMBARQUE: TIntegerField;
    QLimpeza_Controle_Carga: TOracleDataSet1;
    QLimpeza_Controle_CargaCOD_CONTROLE_CARGA: TIntegerField;
    QLimpeza_Baixa_Pedido: TOracleDataSet1;
    QLimpeza_Embarque_Item: TOracleDataSet1;
    QLimpeza_Bancos_Mov: TOracleDataSet1;
    QLimpeza_Bancos_Caixa: TOracleDataSet1;
    QLimpezaMaterial_Pedido: TOracleDataSet1;
    QLimpezaMaterial_PedidoCOD_MATERIAL: TFloatField;
    QLimpeza_ContaReceberCab: TOracleDataSet1;
    QLimpeza_ContaReceberMov: TOracleDataSet1;
    QLimpezaCaixa_Cr_Mov: TOracleDataSet1;
    QLimpezaBanco_Cr_Mov: TOracleDataSet1;
    QLimpezaBanco_Cr_MovCOD_BCO_MOVIMENTO: TIntegerField;
    QLimpezaCaixa_Cr_MovCOD_CAIXA_MOV: TIntegerField;
    QLimpezaCaixa_Banco_CR: TOracleDataSet1;
    IntegerField1: TIntegerField;
    QLimpeza_Conta_Receber_Caixa_Cab: TOracleDataSet1;
    IntegerField2: TIntegerField;
    QLimpeza_ContaReceberCabCOD_CONTA_RECEBER_CAB: TIntegerField;
    QLimpeza_Conta_Receber_Banco_Cab: TOracleDataSet1;
    QLimpeza_Conta_Receber_Banco_CabCOD_BCO_MOVIMENTO: TIntegerField;
    QLimpeza_ContaReceberMovCOD_CONTA_RECEBER_MOV: TIntegerField;
    QLimpeza_ContaReceberMovCOD_CAIXA_MOV: TIntegerField;
    QLimpeza_ContaReceberMovCOD_BCO_MOVIMENTO: TIntegerField;
    QLimpeza_ContaPagarCab: TOracleDataSet1;
    QLimpeza_ContaPagarMov: TOracleDataSet1;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    QLimpezaCaixa_Cp_Mov: TOracleDataSet1;
    IntegerField7: TIntegerField;
    QLimpezaBanco_Cp_Mov: TOracleDataSet1;
    IntegerField8: TIntegerField;
    QLimpezaCaixa_Banco_CP: TOracleDataSet1;
    IntegerField9: TIntegerField;
    QLimpeza_Conta_Pagar_Caixa_Cab: TOracleDataSet1;
    IntegerField10: TIntegerField;
    QLimpeza_Conta_Pagar_Banco_Cab: TOracleDataSet1;
    IntegerField11: TIntegerField;
    QLimpeza_ContaPagarCabCOD_CONTA_PAGAR_CAB: TIntegerField;
    QLimpeza_ContaPagarMovCOD_CONTA_PAGAR_MOV: TIntegerField;
    QPedidoCancelado: TOracleDataSet1;
    QPedidoCanceladoCOD_PEDIDO_CANCELADO: TIntegerField;
    QLimpezaRomaneio: TOracleDataSet1;
    QLimpezaRomaneioCOD_ROMANEIO_AGRICOLA: TIntegerField;
    QLimpeza_Rateio_Romaneio: TOracleDataSet1;
    QLimpezaBalanca: TOracleDataSet1;
    QLimpezaBalancaCOD_BALANCA: TIntegerField;
    QLimpeza_Rateio_RomaneioCOD_ROMANEIO_AGRICOLA: TIntegerField;
    QLimpezaRomaneioCOD_BALANCA: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmLimpeza: TDmLimpeza;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
