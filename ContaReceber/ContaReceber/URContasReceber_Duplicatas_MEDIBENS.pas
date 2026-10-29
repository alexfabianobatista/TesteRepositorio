unit URContasReceber_Duplicatas_MEDIBENS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFRContasReceberDuplicatas_MEDIBENS = class(TForm)
    QRPrimario: TQuickRep;
    QRShape5: TQRShape;
    DetailBand1: TQRBand;
    QRLEmpresa: TQRLabel;
    QRLEndereco: TQRLabel;
    QRLabel1: TQRLabel;
    QRLFone: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLCGC: TQRLabel;
    QRLCep: TQRLabel;
    QRLCidade: TQRLabel;
    QRLEstado: TQRLabel;
    QRLabel5: TQRLabel;
    QRLInscricao: TQRLabel;
    QRLEmissao: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText1: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape8: TQRShape;
    QRShape6: TQRShape;
    QRShape9: TQRShape;
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape10: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLEmpresa2: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape15: TQRShape;
    QRLabel31: TQRLabel;
    QRShape16: TQRShape;
    QRLEmpresa3: TQRLabel;
    QRShape13: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel3: TQRLabel;
    QRLE_mail: TQRLabel;
    QRLDt_Aceite: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRShape7: TQRShape;
    QRShape14: TQRShape;
    QRShape19: TQRShape;
    QRLEmpresa5: TQRLabel;
    QRLEndereco1: TQRLabel;
    QRLabel30: TQRLabel;
    QRLfone1: TQRLabel;
    QRShape20: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLCGC1: TQRLabel;
    QRLCEP1: TQRLabel;
    QRLCidade1: TQRLabel;
    QRLEstado1: TQRLabel;
    QRLabel39: TQRLabel;
    QRLInscricao1: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRDBText18: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRDBText19: TQRDBText;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLEmpresa6: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRShape27: TQRShape;
    QRLabel65: TQRLabel;
    QRShape28: TQRShape;
    QRLEmpresa4: TQRLabel;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRLabel67: TQRLabel;
    QRLE_mail1: TQRLabel;
    QRLDt_Aceite1: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasReceberDuplicatas_MEDIBENS: TFRContasReceberDuplicatas_MEDIBENS;

implementation

uses UContasReceber_cl;

{$R *.DFM}

end.
