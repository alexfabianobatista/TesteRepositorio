unit URConhecimentoIR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRConhecimentoIR = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLFilial: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    QRBand5: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel6: TQRLabel;
    QRExpr4: TQRExpr;
    QRLFilialDestino: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRConhecimentoIR: TFRConhecimentoIR;

implementation

uses UConhecimento_cl;

{$R *.DFM}

end.
