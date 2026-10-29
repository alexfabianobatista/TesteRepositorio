unit URPedidoOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl;

type
  TFRPedidoOrcamento = class(TFTRelSimples)
    QRLogo: TQRImage;
    QRLLogo: TQRLabel;
    QRBand3: TQRBand;
    QRDBText19: TQRDBText;
    QRLabel44: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel10: TQRLabel;
    QRBand4: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText17: TQRDBText;
    QRBand5: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText18: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText26: TQRDBText;
    QRHRule1: TQRHRule;
    QRLabel23: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText28: TQRDBText;
    QRMemo1: TQRMemo;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedidoOrcamento: TFRPedidoOrcamento;

implementation

uses
  UPedido_cl;

{$R *.dfm}

procedure TFRPedidoOrcamento.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if FileExists(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg') then
  begin
    QRLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg');
    QRLLogo.Enabled := False;
  end
  else
  begin
    QRLogo.Picture := Nil;
    QRLLogo.Enabled := True;
  end;
end;

end.
