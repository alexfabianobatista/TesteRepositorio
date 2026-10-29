unit URRelatorioFiscalServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFRelatorioFiscalServico = class(TForm)
    QRPrimario: TQuickRep;
    TitleBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape5: TQRShape;
    QRShape4: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRShape3: TQRShape;
    DetailBand1: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel20: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr6: TQRExpr;
    QRLCompetencia: TQRLabel;
    QRShape6: TQRShape;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRSysData1: TQRSysData;
    QRDBText9: TQRDBText;
    QRExpr2: TQRExpr;
    QRShape8: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape10: TQRShape;
    QRLabel16: TQRLabel;
    QRDBText10: TQRDBText;
    QRExpr3: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioFiscalServico: TFRelatorioFiscalServico;

implementation

uses URPA_cl;

{$R *.DFM}

end.
