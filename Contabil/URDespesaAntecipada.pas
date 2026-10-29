unit URDespesaAntecipada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRDespesaAntecipada = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRExpr2: TQRExpr;
    QRBand3: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    SummaryBand1: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRDespesaAntecipada: TFRDespesaAntecipada;

implementation

uses UDespesaAntecipada_cl;

{$R *.DFM}

end.
