unit UrHistoricosPlanoConta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRCtrls, QRExport, QRWebFilt, QRPDFFilt, QuickRpt,
  ExtCtrls;

type
  TFrHistoricosPlanoConta = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand3: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrHistoricosPlanoConta: TFrHistoricosPlanoConta;

implementation

uses UHistorico_cl;

{$R *.dfm}

end.
