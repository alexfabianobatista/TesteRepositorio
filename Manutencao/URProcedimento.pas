unit URProcedimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRProcedimento = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBRichText1: TQRDBRichText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProcedimento: TFRProcedimento;

implementation

uses UProcedimento_cl;

{$R *.DFM}

end.
