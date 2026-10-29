unit URProducaoEstabelecida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRProducaoEstabelecida = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText1: TQRDBText;
    QRLFilial: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    Produto: TQRLabel;
    QRLabel7: TQRLabel;
    a: TQRGroup;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel4: TQRLabel;
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr1: TQRExpr;
    SummaryBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProducaoEstabelecida: TFRProducaoEstabelecida;

implementation

uses UBoletim_cl;

{$R *.DFM}

end.
