unit URHistoricoEquipamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRHistoricoEquipamento = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    procedure QRGroup2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRHistoricoEquipamento: TFRHistoricoEquipamento;

implementation

uses UOSPatrimonio_cl;

{$R *.DFM}

procedure TFRHistoricoEquipamento.QRGroup2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  DetailBand1.Enabled:= True;
  with DMOSPatrimonio do
  begin
    if ((trim(QRHistoricoEquipamentoDesc_Observacao.text)) = '') and
       ((trim(QRHistoricoEquipamentoDesc_Complemento1.text)) = '') and
       ((trim(QRHistoricoEquipamentoDesc_Complemento2.text)) = '') then
       DetailBand1.Enabled := false
     else
       DetailBand1.Enabled:= True;
   end;
end;

end.
