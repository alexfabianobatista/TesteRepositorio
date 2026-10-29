unit URResumoContrato_GP2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRResumoContrato_GP2 = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLCodFilial: TQRLabel;
    QRLDescFilial: TQRLabel;
    QRLabel4: TQRLabel;
    QRLCodProduto: TQRLabel;
    QRLDescProduto: TQRLabel;
    QRLabel5: TQRLabel;
    QRLDtPagamento: TQRLabel;
    QRLabel6: TQRLabel;
    QRLDtEntrega: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRGroup2: TQRGroup;
    QRGroup3: TQRGroup;
    QRBand5: TQRBand;
    QRBand6: TQRBand;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel17: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRResumoContrato_GP2: TFRResumoContrato_GP2;

implementation

uses Ucontrato_cl;

{$R *.dfm}

end.
