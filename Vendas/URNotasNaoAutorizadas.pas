unit URNotasNaoAutorizadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, StdCtrls, DBCtrls, QRExport, QRWebFilt, QRPDFFilt,
  QRCtrls, QuickRpt, ExtCtrls;

type
  TFRNotasNaoAutorizadas = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNotasNaoAutorizadas: TFRNotasNaoAutorizadas;

implementation

uses URelatorioVenda_cl;

{$R *.dfm}

end.
