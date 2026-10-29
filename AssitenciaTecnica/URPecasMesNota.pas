unit URPecasMesNota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRPecasMesNota = class(TFTRelSimples)
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRExpr4: TQRExpr;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr12: TQRExpr;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr3: TQRExpr;
    QRLOperacao: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPecasMesNota: TFRPecasMesNota;

implementation

uses UPecas_cl;

{$R *.DFM}

end.
