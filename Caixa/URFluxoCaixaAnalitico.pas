unit URFluxoCaixaAnalitico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRFluxoCaixaAnalitico = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRLFilial: TQRLabel;
    QRLDepartamento: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand3: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand4: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel9: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRGroup2: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand5: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRFluxoCaixaAnalitico: TFRFluxoCaixaAnalitico;

implementation

uses UFluxoCaixa_cl;

{$R *.DFM}

end.
