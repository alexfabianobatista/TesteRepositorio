unit URVendaVendedorClasseSintetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRVendaVendedorClasseSintetico = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel16: TQRLabel;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr10: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr21: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr22: TQRExpr;
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRVendaVendedorClasseSintetico: TFRVendaVendedorClasseSintetico;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

end.
