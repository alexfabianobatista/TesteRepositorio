unit URBaixaDepositoPendente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRBaixaDepositoPendente = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLBanco: TQRLabel;
    QRBand3: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRBaixaDepositoPendente: TFRBaixaDepositoPendente;

implementation

uses UBancoAgenciaRel_cl;

{$R *.DFM}

end.
