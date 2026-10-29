unit URContaCorrente2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QuickRpt, Qrctrls, ExtCtrls;

type
  TFRContaCorrente2 = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand5: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRLClientes: TQRLabel;
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContaCorrente2: TFRContaCorrente2;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

procedure TFRContaCorrente2.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QrlClientes.Caption := FloatToStr(DMRelatorio_Venda.QRContaCorrente2.Recordcount);
end;

end.
