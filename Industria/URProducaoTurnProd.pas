unit URProducaoTurnProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, QRExport,
  QRWebFilt, QRPDFFilt;

type
  TFRProducaoTurnoProd = class(TFTRelSimples)
    QRBand4: TQRBand;
    QRDBText3: TQRDBText;
    QRLFilial: TQRLabel;
    QRLabel3: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProducaoTurnoProd: TFRProducaoTurnoProd;

implementation

uses UTurno_cl;

{$R *.DFM}

end.
