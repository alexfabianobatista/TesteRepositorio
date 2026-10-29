unit UREstoqueSeguranca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFREstoqueSeguranca = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand3: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRExpr3: TQRExpr;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRExpr4: TQRExpr;
    QRDBText5: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel11: TQRLabel;
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    SummaryBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREstoqueSeguranca: TFREstoqueSeguranca;

implementation

uses UEstoqueSeguranca_cl;

{$R *.DFM}

end.
