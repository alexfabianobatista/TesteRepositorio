unit URPedidoComissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRPedidoComissao = class(TFTRelSimples)
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRGFilial: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRGCabVendedor: TQRGroup;
    QRLabel9: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText10: TQRDBText;
    QRBRodVendedor: TQRBand;
    QRLabel10: TQRLabel;
    QRBRodFilial: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRDBText7: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    procedure QRPrimarioStartPage(Sender: TCustomQuickRep);
  private
    FpTipo: String;
    procedure SetPTipo(const Value: String);
    { Private declarations }

  public
    { Public declarations }
    property pTipo: String read FpTipo write SetPTipo;
  end;

var
  FRPedidoComissao: TFRPedidoComissao;

implementation

uses UPedido_cl;

{$R *.DFM}

{ TFRPedidoComissao }

procedure TFRPedidoComissao.SetPTipo(const Value: String);
begin
  FpTipo := Value;
end;

procedure TFRPedidoComissao.QRPrimarioStartPage(Sender: TCustomQuickRep);
begin
  inherited;
  if FpTipo = 'SINTETICO' then
    QRBand3.Enabled := False
  else
    QRBand3.Enabled := True;
end;

end.
