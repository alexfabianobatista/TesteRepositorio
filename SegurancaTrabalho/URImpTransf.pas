unit URImpTransf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRImpTransf = class(TFTRelSimples)
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape4: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    QRDBText4: TQRDBText;
    QRMemo1: TQRMemo;
    QRLLocalData: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLTecnico: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRImpTransf: TFRImpTransf;

implementation

uses UEstoqueSeguranca_cl;

{$R *.DFM}

end.
