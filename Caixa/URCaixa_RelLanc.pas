unit URCaixa_RelLanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRCaixa_RelLanc = class(TFTRelSimples)
    QRLPeriodo: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBTVal_Movimento: TQRDBText;
    QRBand5: TQRBand;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCaixa_RelLanc: TFRCaixa_RelLanc;

implementation

uses UCaixa_cl, UCaixaRel_cl;

{$R *.DFM}

procedure TFRCaixa_RelLanc.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMCaixaRel.QRCaixa_LancInd_Operacao.Value='+' then
    QRDBTVal_Movimento.Left:=384
  else
    QRDBTVal_Movimento.Left:=544;
end;

end.
