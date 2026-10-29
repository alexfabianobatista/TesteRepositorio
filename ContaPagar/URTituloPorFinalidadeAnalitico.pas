unit URTituloPorFinalidadeAnalitico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, StdCtrls;

type
  TFRTitulosFinalidadeAnalitico = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand4: TQRBand;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    Label1: TLabel;
    QRBand5: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr3: TQRExpr;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRTitulosFinalidadeAnalitico: TFRTitulosFinalidadeAnalitico;

implementation

uses UContasPagar_cl;

{$R *.dfm}

end.
