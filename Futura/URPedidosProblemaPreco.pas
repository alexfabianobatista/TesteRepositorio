unit URPedidosProblemaPreco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QuickRpt, QRExport, Qrctrls, ExtCtrls;

type
  TFRPedidosProblemaPreco = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRLVendedor: TQRLabel;
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedidosProblemaPreco: TFRPedidosProblemaPreco;

implementation

uses ULiberaPedidos_cl;

{$R *.DFM}

end.
