unit URPedido30Colunas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl;

type
  TFRPedido30Colunas = class(TFTRelSimples)
    QRMEnderecoFilial: TQRMemo;
    QRMCliente: TQRMemo;
    QRLabel13: TQRLabel;
    QRLDtEmissao: TQRLabel;
    QRLTipoPagto: TQRLabel;
    QRLPagar: TQRLabel;
    QRM1: TQRMemo;
    QRM2: TQRMemo;
    QRM3: TQRMemo;
    ChildBand1: TQRChildBand;
    QRLabel24: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRGroup1: TQRGroup;
    QRBDetail: TQRBand;
    QRDBTQtde: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBTDescProduto: TQRDBText;
    QRDBText1: TQRDBText;
    QRBand5: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
    ChildBand2: TQRChildBand;
    QRDBText3: TQRDBText;
    QRLVales: TQRLabel;
    ChildBand3: TQRChildBand;
    QRExpr1: TQRExpr;
    QRLabel7: TQRLabel;
    ChildBand4: TQRChildBand;
    QRLEntrada: TQRLabel;
    QRDBTEntrada: TQRDBText;
    ChildBand5: TQRChildBand;
    QREValorPago: TQRExpr;
    QRLValorPago: TQRLabel;
    QRLTroco: TQRLabel;
    QRDBTTroco: TQRDBText;
    ChildBand6: TQRChildBand;
    QRHRule1: TQRHRule;
    QRDBText11: TQRDBText;
    QRCBPrazo: TQRChildBand;
    QRMemoPrazo: TQRMemo;
    QRBand4: TQRBand;
    QRExprSQtde: TQRExpr;
    QRMObservacao: TQRMemo;
    QRLabel14: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel5: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel3: TQRLabel;
    QRLPedido: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedido30Colunas: TFRPedido30Colunas;

implementation

uses UNotaSaida_cl, UParamSistema_cl, UOracle_cl;

{$R *.dfm}

end.
