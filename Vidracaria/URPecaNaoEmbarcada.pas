unit URPecaNaoEmbarcada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRPecaNaoEmbarcada = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRSysData3: TQRSysData;
    procedure QRPrimarioEndPage(Sender: TCustomQuickRep);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPecaNaoEmbarcada: TFRPecaNaoEmbarcada;

implementation

uses UEmbarque_cl;

{$R *.dfm}

procedure TFRPecaNaoEmbarcada.QRPrimarioEndPage(Sender: TCustomQuickRep);
begin
  inherited;
  DMEmbarque.QAcompanhaEmbarque.Close;
end;

end.
