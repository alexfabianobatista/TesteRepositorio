unit URContratoMensal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContratoMensal = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRSysData3: TQRSysData;
    QRDBText11: TQRDBText;
    QRLabel14: TQRLabel;
    QRLParceiro: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContratoMensal: TFRContratoMensal;

implementation

uses UOrdemServico_cl;

{$R *.DFM}

end.
