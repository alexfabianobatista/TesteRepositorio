unit URTitulosEmissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRTitulosEmissao = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel11: TQRLabel;
    QRLFinalidade: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRBand3: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand4: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel16: TQRLabel;
    QRLBanco: TQRLabel;
    QRBoleto: TQRLabel;
    QRRemessa: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRTitulosEmissao: TFRTitulosEmissao;

implementation

uses UContasReceber_cl;

{$R *.DFM}

end.
