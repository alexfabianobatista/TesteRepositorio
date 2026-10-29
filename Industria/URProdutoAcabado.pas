unit URProdutoAcabado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRCtrls, QuickRpt, ExtCtrls, QRWebFilt,
  QRPDFFilt;

type
  TFRProdutoAcabado = class(TFTRelSimples)
    QRLabel4: TQRLabel;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    QRLFilial: TQRLabel;
    QRLabel12: TQRLabel;
    QRLTurno: TQRLabel;
    QRLabel11: TQRLabel;
    QRLData_I: TQRLabel;
    QRLabel14: TQRLabel;
    QRLData_F: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRExpr1: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProdutoAcabado: TFRProdutoAcabado;

implementation

uses UProducaoAgricola_cl;

{$R *.dfm}

end.
