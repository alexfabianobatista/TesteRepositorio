unit URLaudoFloracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  TFRLaudoFloracao = class(TForm)
    QRPrimario: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
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
    QRLEmpresa: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText22: TQRDBText;
    QRStringsBand1: TQRStringsBand;
    QRLabel16: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel51: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLAno: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLTipoLaudo: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel47: TQRLabel;
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
    QRLabel17: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel48: TQRLabel;
    QRLVia: TQRLabel;
    QRDBText32: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText34: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRLaudoFloracao: TFRLaudoFloracao;

implementation

uses ULaudo_cl;

{$R *.DFM}

end.
