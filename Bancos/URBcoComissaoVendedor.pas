unit URBcoComissaoVendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRBcoComissaoVendedor = class(TFTRelSimples)
    QRLabel4: TQRLabel;
    QRLPeriodo: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel6: TQRLabel;
    Cliente: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText10: TQRDBText;
    QRBand3: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel5: TQRLabel;
    QRLEmissao: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRBcoComissaoVendedor: TFRBcoComissaoVendedor;

implementation

uses UBancoAgencia_cl, UBancoAgenciaRel_cl;

{$R *.DFM}

end.
