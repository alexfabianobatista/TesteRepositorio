unit URContratoJornal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRContratoJornal = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRGroup1: TQRGroup;
    QRBand5: TQRBand;
    QRLabel3: TQRLabel;
    QRLFilial: TQRLabel;
    QRLabel5: TQRLabel;
    QRLCliente: TQRLabel;
    QRLabel7: TQRLabel;
    QRLVendedor: TQRLabel;
    QRLabel9: TQRLabel;
    QRLEdicao: TQRLabel;
    QRLPeriodoContrato: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLPeriodoVencimento: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand6: TQRBand;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContratoJornal: TFRContratoJornal;

implementation

uses UContratoJornalRel_cl;

{$R *.dfm}

end.
