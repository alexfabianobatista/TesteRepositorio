unit URChequeDevolvido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, StdCtrls, QRWebFilt,
  QRPDFFilt;

type
  TFRChequeDevolvido = class(TFTRelSimples)
    QRLPeriodo: TQRLabel;
    QRLConta: TQRLabel;
    QRGroup1: TQRGroup;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLDepartamento: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText2: TQRDBText;
    QRExpr3: TQRExpr;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRDBText10: TQRDBText;
    QRSysData3: TQRSysData;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel14: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRChequeDevolvido: TFRChequeDevolvido;

implementation

uses UBancoAgenciaRel_cl;

{$R *.DFM}

end.
