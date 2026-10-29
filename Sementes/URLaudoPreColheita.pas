unit URLaudoPreColheita;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFRLaudoPreColheita = class(TForm)
    QRPrimario: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    PageHeaderBand1: TQRBand;
    QRLEmpresa: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel49: TQRLabel;
    QRShape3: TQRShape;
    QRLabel50: TQRLabel;
    QRLEndereco: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel26: TQRLabel;
    QRLAno: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText33: TQRDBText;
    QRLVia: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel4: TQRLabel;
    QRLTipoLaudo: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText35: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel52: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel23: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText17: TQRDBText;
    QRStringsBand1: TQRStringsBand;
    QRLabel16: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel51: TQRLabel;
    QRDBText34: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRLaudoPreColheita: TFRLaudoPreColheita;

implementation

uses ULaudo_cl;

{$R *.DFM}

end.
