unit URReposicao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRReposicao = class(TFTRelSimples)
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel8: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRBand3: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr2: TQRExpr;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRReposicao: TFRReposicao;

implementation

uses UPromoto_cl, UPromotorParam;

{$R *.DFM}

procedure TFRReposicao.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  If FPromotorParam.RG2Tipo.ItemIndex = 1 then
    FRReposicao.DetailBand1.Enabled := False
  else
    FRReposicao.DetailBand1.Enabled := True;
end;

end.
