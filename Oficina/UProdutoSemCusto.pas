unit UProdutoSemCusto;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TFRProdutoSemCusto = class(TQuickRep)
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand3: TQRBand;
    QRSysData1: TQRSysData;
    QRBand4: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel9: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
  private

  public

  end;

var
  FRProdutoSemCusto: TFRProdutoSemCusto;

implementation

uses URelatorio_cl;

{$R *.DFM}

end.
