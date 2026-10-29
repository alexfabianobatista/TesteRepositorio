unit URRetornoImposto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QuickRpt, QRExport, Qrctrls, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRRetornoImposto = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    DetailBand1: TQRBand;
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    QRExpr3: TQRExpr;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel11: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRetornoImposto: TFRRetornoImposto;

implementation

uses ULivroFiscal_Cl;

{$R *.DFM}

end.
