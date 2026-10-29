unit URReciboComissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFReciboComissao = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText12: TQRDBText;
    QRLData: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRSysData1: TQRSysData;
    QRDBText13: TQRDBText;
    QRLabel1: TQRLabel;
    QRLHistorico: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel10: TQRLabel;
    QRTextFilter1: TQRTextFilter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReciboComissao: TFReciboComissao;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

end.
