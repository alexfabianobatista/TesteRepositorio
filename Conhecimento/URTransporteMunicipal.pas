unit URTransporteMunicipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TFRTransporteMunicipal = class(TForm)
    QRPrimario: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLINSCRICAO: TQRLabel;
    QRLFilial: TQRLabel;
    QRLCNPJ: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel11: TQRLabel;
    QRShape6: TQRShape;
    QRLabel12: TQRLabel;
    QRShape7: TQRShape;
    QRLabel13: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel14: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRShape11: TQRShape;
    QRDBText2: TQRDBText;
    QRShape12: TQRShape;
    QRDBText3: TQRDBText;
    QRShape13: TQRShape;
    QRDBText4: TQRDBText;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRDBText5: TQRDBText;
    QRShape19: TQRShape;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel15: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRTransporteMunicipal: TFRTransporteMunicipal;

implementation

uses URPA_cl;

{$R *.DFM}

end.
