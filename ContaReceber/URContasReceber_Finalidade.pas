unit URContasReceber_Finalidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRContasReceber_Finalidade = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLbFilial: TQRLabel;
    QRLbPeriodo: TQRLabel;
    QRGroup1: TQRGroup;
    QRBdFooter: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr1: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasReceber_Finalidade: TFRContasReceber_Finalidade;

implementation

uses UContasReceber_cl;

{$R *.DFM}

end.
