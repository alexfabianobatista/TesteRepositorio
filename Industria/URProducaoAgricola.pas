unit URProducaoAgricola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRCtrls, QuickRpt, ExtCtrls, QRWebFilt,
  QRPDFFilt;

type
  TFRProducaoAgricola = class(TFTRelSimples)
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLFilial: TQRLabel;
    QRLabel15: TQRLabel;
    QRLTurno: TQRLabel;
    QRLabel14: TQRLabel;
    QRLData_I: TQRLabel;
    QRLabel16: TQRLabel;
    QRLData_F: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText2: TQRDBText;
    QRSubDetail3: TQRSubDetail;
    QRSubDetail2: TQRSubDetail;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand4: TQRBand;
    QRExpr5: TQRExpr;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRExpr6: TQRExpr;
    QRDBText6: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel19: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel20: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProducaoAgricola: TFRProducaoAgricola;

implementation

uses UProducaoAgricola_cl;

{$R *.dfm}

end.
