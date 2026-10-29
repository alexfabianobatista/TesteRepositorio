unit URNota_MovMercadoria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRNota_MovMercadoria = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBRodTotalCliente: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr3: TQRExpr;
    QRLPeriodo: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText10: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRDBText3: TQRDBText;
    QRLFornecedor: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_MovMercadoria: TFRNota_MovMercadoria;
implementation

uses URelatorioVenda_cl;

{$R *.DFM}

end.
