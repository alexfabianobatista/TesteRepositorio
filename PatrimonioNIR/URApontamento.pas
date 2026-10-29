unit URApontamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRApontamento = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLHora: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRApontamento: TFRApontamento;

implementation

uses UApontamento_cl;

{$R *.DFM}

end.
