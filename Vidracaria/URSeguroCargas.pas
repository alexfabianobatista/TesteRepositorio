unit URSeguroCargas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRSeguroCargas = class(TFTRelSimples)
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRExpr1: TQRExpr;
    QRBand5: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRBand6: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRDBText9: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRSeguroCargas: TFRSeguroCargas;

implementation

uses URelatorioVenda_cl, URSeguroCargas1;

{$R *.DFM}

procedure TFRSeguroCargas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  FRSeguroCargas := nil;
end;

end.
