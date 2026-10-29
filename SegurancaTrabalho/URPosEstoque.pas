unit URPosEstoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRPosEstoque = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand3: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRExpr3: TQRExpr;
    QRDBText12: TQRDBText;
    QRExpr4: TQRExpr;
    QRDBText5: TQRDBText;
    QRExpr1: TQRExpr;
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    SummaryBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr13: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPosEstoque: TFRPosEstoque;

implementation

uses UEstoqueSeguranca_cl;

{$R *.DFM}

end.
