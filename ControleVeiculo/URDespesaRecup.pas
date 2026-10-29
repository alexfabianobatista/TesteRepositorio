unit URDespesaRecup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRDespesaRecup = class(TFTRelSimples)
    QRLPeriodo: TQRLabel;
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText9: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRLClassificacao: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRDespesaRecup: TFRDespesaRecup;

implementation

uses UDespesaRecup_cl;

{$R *.DFM}

end.
