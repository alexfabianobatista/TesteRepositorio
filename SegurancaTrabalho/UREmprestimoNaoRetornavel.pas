unit UREmprestimoNaoRetornavel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFREmprestimoNaoRetornavel = class(TFTRelSimples)
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape4: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLLocalData: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRExprMemo1: TQRExprMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREmprestimoNaoRetornavel: TFREmprestimoNaoRetornavel;

implementation

uses UEmprestimo_cl;

{$R *.DFM}

end.
