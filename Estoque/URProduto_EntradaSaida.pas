unit URProduto_EntradaSaida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRProduto_EntradaSaida = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRLEmbEntrada: TQRLabel;
    QRDBEmbEntrada: TQRDBText;
    QRLEmbSaida: TQRLabel;
    QRDBEmbSaida: TQRDBText;
    QRLDescricao: TQRLabel;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpEmbEntrada: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpEmbSaida: TQRExpr;
    QRLFilial: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRExpr5: TQRExpr;
    QRLClasse: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel11: TQRLabel;
    QRLEmbTotal: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBEmbTotal: TQRDBText;
    QRExpr6: TQRExpr;
    QRExpEmbTotal: TQRExpr;
    QRExpr8: TQRExpr;
    QRLCadastro: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProduto_EntradaSaida: TFRProduto_EntradaSaida;

implementation

uses UProdutoRelatorio_cl;

{$R *.DFM}

procedure TFRProduto_EntradaSaida.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DMProdutoRelatorio do
    QRLDescricao.Caption := Trim(QRMovEntradaSaidaDesc_Produto.Value);
end;

end.
