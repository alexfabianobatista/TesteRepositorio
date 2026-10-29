unit UREstoque_Classe_Emb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFREstoque_Classe_Emb = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr1: TQRExpr;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRVal_Varejo: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREstoque_Classe_Emb: TFREstoque_Classe_Emb;

implementation

uses UEstoque_cl;

{$R *.DFM}

end.
