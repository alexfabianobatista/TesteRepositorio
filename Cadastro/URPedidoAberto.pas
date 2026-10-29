unit URPedidoAberto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRPedidoAberto = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRLTotalM2: TQRLabel;
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedidoAberto: TFRPedidoAberto;
  var gTotalM2 : Double = 0;

implementation

uses UPedido_cl;

{$R *.dfm}

procedure TFRPedidoAberto.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  gTotalM2 := 0;
end;

procedure TFRPedidoAberto.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLTotalM2.Caption := FloatToStr(gTotalM2/1000000);
end;

procedure TFRPedidoAberto.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  wLargura, wAltura : Integer;
  wRestoLargura, wRestoAltura : Integer;
begin
  inherited;
  // Gian - 11/10/2018 à pedido do Marcos
  // Arredondar alturas e larguras sempre com valores 50 em 50
  
  if (Round(DMPedido.QRPedidoAbertoVAL_LARGURA.Value) mod 50) > 0 then
  begin
    wLargura := Round(DMPedido.QRPedidoAbertoVAL_LARGURA.Value)+50;
    wRestoLargura := wLargura mod 50;  
    wLargura := wLargura-wRestoLargura;
  end
  else
    wLargura := Round(DMPedido.QRPedidoAbertoVAL_LARGURA.Value);

  if (Round(DMPedido.QRPedidoAbertoVAL_ALTURA.Value) mod 50) > 0 then
  begin
    wAltura := Round(DMPedido.QRPedidoAbertoVAL_ALTURA.Value)+50; 
    wRestoAltura := wAltura mod 50;
    wAltura := wAltura-wRestoAltura;
  end
  else
    wAltura := Round(DMPedido.QRPedidoAbertoVAL_ALTURA.Value);

  gTotalM2 := gTotalM2 + (wLargura*wAltura);
end;

end.
