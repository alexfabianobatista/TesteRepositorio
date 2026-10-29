unit URBoletim_Relacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRBoletim_Relacao = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLDepartamento: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLEnvasador: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRBoletim_Relacao: TFRBoletim_Relacao;

implementation

uses UBoletim_cl;

{$R *.DFM}

end.
