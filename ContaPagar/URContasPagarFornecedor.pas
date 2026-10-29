unit URContasPagarFornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContasPagar_Fornecedor = class(TFTRelSimples)
    QRBCPagarCab: TQRBand;
    QRSDCPagarMov: TQRSubDetail;
    QRSDCPagarMovNota: TQRSubDetail;
    GHBCPagarMov: TQRBand;
    GHBCPagarNota: TQRBand;
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel16: TQRLabel;
    QRBand4: TQRBand;
    QRLabel17: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel9: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText13: TQRDBText;
    QRLPeriodo: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel22: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasPagar_Fornecedor: TFRContasPagar_Fornecedor;

implementation

uses UContasPagar_cl;

{$R *.DFM}

end.
