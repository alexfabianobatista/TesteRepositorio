unit URNota_Classe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNota_Classe = class(TFTRelSimples)
    QRBRodTotalFilial: TQRBand;
    QRLabel4: TQRLabel;
    QRBand3: TQRBand;
    QRDBProduto: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRDBText10: TQRDBText;
    QRExpr3: TQRExpr;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRDBText11: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel3: TQRLabel;
    QRLFilial: TQRLabel;
    QRLCidade: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand5: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRLabel13: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel5: TQRLabel;
    QRLEstado: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_Classe: TFRNota_Classe;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

end.
