unit URelatorioRPA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRelacaoRPA = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRExpr4: TQRExpr;
    QRLabel12: TQRLabel;
    QRLDescricao: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRBand4: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel15: TQRLabel;
    QRDBText11: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelacaoRPA: TFRelacaoRPA;

implementation

uses URPA_cl;

{$R *.DFM}

end.
