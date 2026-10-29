unit URTitulosAbertos_OutrasMoedas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRTitulosAbertos_OutrasMoedas = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLFilial: TQRLabel;
    QRLFinalidade: TQRLabel;
    QRLDtInicial: TQRLabel;
    QRLDtFinal: TQRLabel;
    QRLDepartamento: TQRLabel;
    QRLabel14: TQRLabel;
    QRLDtBase: TQRLabel;
    QRBand4: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText7: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText8: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRTitulosAbertos_OutrasMoedas: TFRTitulosAbertos_OutrasMoedas;

implementation

uses UContasReceber_cl;

{$R *.dfm}

end.
