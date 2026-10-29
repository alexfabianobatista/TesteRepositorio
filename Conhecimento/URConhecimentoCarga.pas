unit URConhecimentoCarga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QRExport, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRConhecimentoCarga = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText1: TQRDBText;
    QRLbFilial: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel19: TQRLabel;
    QRExpr8: TQRExpr;
    QRLbParceiro: TQRLabel;
    Conhecimento: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLFinalidade: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText15: TQRDBText;
    QRBand3: TQRBand;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRLabel22: TQRLabel;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRBand4: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel17: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLFilialDestino: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRConhecimentoCarga: TFRConhecimentoCarga;

implementation

uses UConhecimento_cl;

{$R *.DFM}

end.
