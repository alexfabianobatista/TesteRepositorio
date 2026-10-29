unit URContasPagar_Finalidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRContasPagar_Finalidade = class(TFTRelSimples)
    QRLbFilial: TQRLabel;
    QRLbPeriodo: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRGroup1: TQRGroup;
    DetailBand1: TQRBand;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr1: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasPagar_Finalidade: TFRContasPagar_Finalidade;

implementation

uses UContasPagar_cl, URelContasPagar_cl;

{$R *.DFM}

end.
