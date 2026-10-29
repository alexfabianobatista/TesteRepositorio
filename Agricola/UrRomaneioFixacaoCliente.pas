unit UrRomaneioFixacaoCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QRExport, QuickRpt, ExtCtrls;

type
  TFrRomaneioFixacaoCliente = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand4: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrRomaneioFixacaoCliente: TFrRomaneioFixacaoCliente;

implementation

uses URomaneioAgricola_cl;

{$R *.DFM}

end.
