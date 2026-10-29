unit URNotaAgricola_Aberto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNotaAgricola_Aberto = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRBand5: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRExpr2: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNotaAgricola_Aberto: TFRNotaAgricola_Aberto;

implementation

uses Ucontrato_cl;

{$R *.DFM}

end.
