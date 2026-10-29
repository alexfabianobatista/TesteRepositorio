unit URNotasCfopPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRCtrls, QuickRpt, QRExport, QRWebFilt, QRPDFFilt,
  ExtCtrls, grimgctrl;

type
  TFRNotasCfopPagto = class(TFTRelSimples)
    QrlPeriodo: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRHRule1: TQRHRule;
    QRGroup2: TQRGroup;
    QRDBText7: TQRDBText;
    QRDBText1: TQRDBText;
    QRExpr7: TQRExpr;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNotasCfopPagto: TFRNotasCfopPagto;

implementation

uses ULivroFiscal_Cl;

{$R *.dfm}

end.
