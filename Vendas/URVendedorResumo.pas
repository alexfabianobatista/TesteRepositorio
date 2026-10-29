unit URVendedorResumo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRVendedorResumo = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLPagto: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRExpr2: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRVendedorResumo: TFRVendedorResumo;

implementation

uses URelatorioVenda_cl, UParamSistema_cl;

{$R *.DFM}

end.
