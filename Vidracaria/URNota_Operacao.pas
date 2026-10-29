unit URNota_Operacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNota_Operacao = class(TFTRelSimples)
    QRGFilial: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRBRodTotalFilial: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRGCabVendedor: TQRGroup;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBRodTotalVendedor: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRGroup1: TQRGroup;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRBand5: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRLabel15: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_Operacao: TFRNota_Operacao;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

end.
