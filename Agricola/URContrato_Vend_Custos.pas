unit URContrato_Vend_Custos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRContrato_Vend_Custos = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText14: TQRDBText;
    QRLPeriodo: TQRLabel;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel17: TQRLabel;
    QRExpr3: TQRExpr;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContrato_Vend_Custos: TFRContrato_Vend_Custos;

implementation

uses UContrato_Vend_Cl;

{$R *.dfm}

end.
