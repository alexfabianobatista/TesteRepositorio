unit URSeguroCargas1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRSeguroCargas1 = class(TFTRelSimples)
    QRBand5: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRBand4: TQRBand;
    QRDBText7: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRSeguroCargas1: TFRSeguroCargas1;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

procedure TFRSeguroCargas1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  FRSeguroCargas1 := nil;
end;

end.
