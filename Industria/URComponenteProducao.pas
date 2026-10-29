unit URComponenteProducao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRComponenteProducao = class(TFTRelSimples)
    QRBand4: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    QRDBText3: TQRDBText;
    QRLUsuario: TQRLabel;
    QRLPeriodo: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRComponenteProducao: TFRComponenteProducao;

implementation

uses UOrdemProducao_cl;

{$R *.DFM}

end.
