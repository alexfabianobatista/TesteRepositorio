unit UREmbarqueTemperatura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFREmbarqueTemperatura = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRDBText4: TQRDBText;
    QRBRodPedido: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand4: TQRBand;
    QrDescricao: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel15: TQRLabel;
    QRBand5: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRExpr13: TQRExpr;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape1: TQRShape;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREmbarqueTemperatura: TFREmbarqueTemperatura;

implementation

uses UEmbarque_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFREmbarqueTemperatura.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  with DmEmbarque do
    QrDescricao.Caption := Trim(QREmbarqueTemperaturaDESC_PRODUTO.Value) + '-' + Trim(QREmbarqueTemperaturaDESC_LOTE.Value);
end;

procedure TFREmbarqueTemperatura.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
//  QrNrPedidos.Caption := '';
end;

end.
