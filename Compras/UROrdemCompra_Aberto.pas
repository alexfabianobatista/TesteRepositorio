unit UROrdemCompra_Aberto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFROrdemCompra_Aberto = class(TFTRelSimples)
    QRBand4: TQRBand;
    QRBRodOC: TQRBand;
    QRGFililiaMoeda: TQRGroup;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel14: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText18: TQRDBText;
    QRLPeriodo: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText19: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrdemCompra_Aberto: TFROrdemCompra_Aberto;

implementation

uses UOrdemCompra_cl;

{$R *.DFM}















end.
