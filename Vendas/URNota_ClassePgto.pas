unit URNota_ClassePgto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNota_ClassePgto = class(TFTRelSimples)
    QRGFilial: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBRodTotFilial: TQRBand;
    QRBDetalhe: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel10: TQRLabel;
    QRExpr6: TQRExpr;
    QRLabel11: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText8: TQRDBText;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_ClassePgto: TFRNota_ClassePgto;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

end.
