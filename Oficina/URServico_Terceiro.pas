unit URServico_Terceiro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRServico_Terceiro = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand5: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRBand6: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRServico_Terceiro: TFRServico_Terceiro;

implementation

uses UOficina_cl;

{$R *.DFM}

end.
