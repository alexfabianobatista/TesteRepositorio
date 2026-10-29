unit URResumoLancamentoAgrupadoCaixaBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRResumoLancAgrupadoCaixaBanco = class(TFTRelSimples)
    QRLDepartamento: TQRLabel;
    DetailBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRBand3: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    QRLFilial: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRResumoLancAgrupadoCaixaBanco: TFRResumoLancAgrupadoCaixaBanco;

implementation

uses UCaixa_cl, UCaixaRel_cl;

{$R *.DFM}

end.
