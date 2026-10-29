unit URReciboBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFRReciboBanco = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRLValorExtenso: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRLData: TQRLabel;
    QRLabel13: TQRLabel;
    QRLResponsavel: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRSysData1: TQRSysData;
    QRLRecibo: TQRLabel;
    QRLNumero: TQRLabel;
    QRLabel1: TQRLabel;
    QRLComplemento: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRReciboBanco: TFRReciboBanco;

implementation

uses UFilial_cl, UFinalidade_cl, UBancoAgencia_cl;

{$R *.DFM}

end.
