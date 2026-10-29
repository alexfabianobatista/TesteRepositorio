unit URPosicaoContratoTotal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFRPosicaoContratoTotal = class(TForm)
    QRPrimario: TQuickRep;
    SummaryBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel6: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPosicaoContratoTotal: TFRPosicaoContratoTotal;

implementation

{$R *.DFM}

end.
