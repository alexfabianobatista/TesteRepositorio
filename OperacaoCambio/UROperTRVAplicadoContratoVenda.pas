unit UROperTRVAplicadoContratoVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFROperTRVAplicadoContratoVenda = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLDtOperacao: TQRLabel;
    QRLDtAplicacao: TQRLabel;
    QRLabel28: TQRLabel;
    QRLNumContrato: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROperTRVAplicadoContratoVenda: TFROperTRVAplicadoContratoVenda;

implementation

uses UOperacaoCambio_cl;

{$R *.DFM}

end.
