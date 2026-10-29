unit URBaixaEstoqueLeitor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRBaixaEstoqueLeitor = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLEmbarque: TQRLabel;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand3: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel10: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel9: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRBaixaEstoqueLeitor: TFRBaixaEstoqueLeitor;

implementation

uses UEmbarque_cl;

{$R *.DFM}

end.
