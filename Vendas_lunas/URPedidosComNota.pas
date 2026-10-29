unit URPedidosComNota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRPedidoComNota = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLFilial: TQRLabel;
    QRLabel10: TQRLabel;
    QRLCliente: TQRLabel;
    QRLabel11: TQRLabel;
    QRLVendedor: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel13: TQRLabel;
    SummaryBand1: TQRBand;
    QRSysData3: TQRSysData;
    QRLabel14: TQRLabel;
    QRLMotivo: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedidoComNota: TFRPedidoComNota;

implementation

uses URelatorioVenda_cl, UPedido_cl;

{$R *.DFM}

end.
