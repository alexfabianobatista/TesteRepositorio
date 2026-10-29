unit URRomaneioAcumulado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRRomaneioAcumulado = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRLArmazem: TQRLabel;
    QRLParceria: TQRLabel;
    QRLabel4: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText7: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel9: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRomaneioAcumulado: TFRRomaneioAcumulado;

implementation

uses URomaneioAgricola_cl;

{$R *.DFM}

end.
