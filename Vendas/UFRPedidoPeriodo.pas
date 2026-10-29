unit UFRPedidoPeriodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRPedido_Periodo = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel9: TQRLabel;
    QRLabel5: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedido_Periodo: TFRPedido_Periodo;

implementation

uses UPedido_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRPedido_Periodo.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  if (dmparamsistema.codempresa <> 'INJEPAR') then
  begin
    QRLabel12.Enabled := false;
    QRLabel12.Visible := false;
    QRDBText8.Enabled := false;
    QRDBText8.Visible := false;
  end;
end;

end.
