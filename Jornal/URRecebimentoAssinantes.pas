unit URRecebimentoAssinantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRRecebimentoAssinantes = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRBand5: TQRBand;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText13: TQRDBText;
    QRLabel25: TQRLabel;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRecebimentoAssinantes: TFRRecebimentoAssinantes;

implementation

uses URecebimentoRel_cl;

{$R *.dfm}

procedure TFRRecebimentoAssinantes.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  with DMRecebimentorel do
  begin
    QRDBText12.Enabled := not(QRRecebimentoJornalVALOR_PARCELA4.Value = 0);
    QRDBText10.Enabled := not(QRRecebimentoJornalVALOR_PARCELA3.Value = 0);
    QRDBText8.Enabled := not(QRRecebimentoJornalVALOR_PARCELA2.Value = 0);
    QRDBText5.Enabled := not(QRRecebimentoJornalVALOR_PARCELA1.Value = 0);
  end;
end;

end.
