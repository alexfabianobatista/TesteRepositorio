unit URContasReceber_Recebidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContasReceber_Recebidos = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel14: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel15: TQRLabel;
    QRExpr5: TQRExpr;
    QRLFilial: TQRLabel;
    QRExpr6: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText7: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText10: TQRDBText;
    QRBand5: TQRBand;
    QRLabel17: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasReceber_Recebidos: TFRContasReceber_Recebidos;

implementation

uses UContasReceber_cl;

{$R *.DFM}

end.
