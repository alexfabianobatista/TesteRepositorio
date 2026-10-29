unit URContasReceberMovDiario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRContasReceberMovDiario = class(TFTRelSimples)
    QRPeriodo: TQRLabel;
    QRLFormaPagamento: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRGroup2: TQRGroup;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand5: TQRBand;
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasReceberMovDiario: TFRContasReceberMovDiario;

implementation

{$R *.dfm}

end.
