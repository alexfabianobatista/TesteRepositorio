unit URInformacaoVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRInformacaoVenda = class(TFTRelSimples)
    QRBand3: TQRBand;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    TitleBand1: TQRBand;
    QRMemo1: TQRMemo;
    QRLPeriodo: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRBand4: TQRBand;
    QRExpr4: TQRExpr;
    QRLabel15: TQRLabel;
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  FRInformacaoVenda: TFRInformacaoVenda;

implementation

uses URelatorioVenda_cl;

{$R *.dfm}

end.
