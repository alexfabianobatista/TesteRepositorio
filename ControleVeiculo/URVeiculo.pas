unit URVeiculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRVeiculo = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRGroup2: TQRGroup;
    QRLProprietario: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText7: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRVeiculo: TFRVeiculo;

implementation

uses UVeiculo_cl;

{$R *.DFM}

end.
