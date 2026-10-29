unit URNota_VendaFutura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNota_VendaFutura = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRLFilial: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText3: TQRDBText;
    QRBand3: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand5: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRGroup2: TQRGroup;
    QRLVendedor: TQRLabel;
    QRLClasse: TQRLabel;
    QRExpr7: TQRExpr;
    QRGroup3: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText12: TQRDBText;
    QRBand6: TQRBand;
    QRLabel17: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_VendaFutura: TFRNota_VendaFutura;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

end.
