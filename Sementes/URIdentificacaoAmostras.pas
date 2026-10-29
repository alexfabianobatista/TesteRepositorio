unit URIdentificacaoAmostras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRIdentificacaoAmostras = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr1: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRIdentificacaoAmostras: TFRIdentificacaoAmostras;

implementation

uses UProducaoSemente_cl;

{$R *.DFM}

end.
