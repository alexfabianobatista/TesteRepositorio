unit URLancamentoSintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRLancamentoSintetico = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel11: TQRLabel;
    QRLData_I: TQRLabel;
    QRLabel12: TQRLabel;
    QRLData_F: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape1: TQRShape;
    QRBand4: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText3: TQRDBText;
    QRLTipoPagamento: TQRLabel;
    QRLConvenio: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRLancamentoSintetico: TFRLancamentoSintetico;

implementation

uses ULancamento_cl;

{$R *.dfm}

end.
