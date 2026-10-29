unit URContasPagarAgendaBaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRContasPagarAgendaBaixa = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel15: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel16: TQRLabel;
    QRLFilial: TQRLabel;
    QRLData: TQRLabel;
    QRBand6: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel17: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel18: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasPagarAgendaBaixa: TFRContasPagarAgendaBaixa;

implementation

uses UContasPagarRel_cl;

{$R *.dfm}

end.
