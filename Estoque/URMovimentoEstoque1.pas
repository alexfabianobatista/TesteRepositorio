unit URMovimentoEstoque1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRMovimentoEstoque1 = class(TFTRelSimples)
    QRLbProduto: TQRLabel;
    QRLbFilial: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBTittle: TQRBand;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    procedure QRBTittleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMovimentoEstoque1: TFRMovimentoEstoque1;

implementation

uses UEstoque_cl;

{$R *.DFM}

procedure TFRMovimentoEstoque1.QRBTittleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
//  QRPrimario.NewPage;
end;

end.
