unit URPedido_Produto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRPedido_Produto = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRLFilial: TQRLabel;
    QRDBText6: TQRDBText;
    QRExpr5: TQRExpr;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedido_Produto: TFRPedido_Produto;

implementation

uses UPedido_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRPedido_Produto.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QrLabel11.Caption := Trim(DmPedido.QrPedProdutoDesc_produto.Text) + ' - ' + Trim(DmPedido.QrPedProdutoDesc_Peneira.Text);
  IF DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' then
  Begin
    QRDBText1.Enabled := False;
    QRDBText6.Enabled := True;
    QRLabel8.Caption := 'Tec.';
    QRExpr5.Enabled := True;
  end;  
end;

end.
