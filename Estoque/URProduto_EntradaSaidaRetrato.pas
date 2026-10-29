unit URProduto_EntradaSaidaRetrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRProduto_EntradaSaidaRetrato = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRLClasse: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRLDescricao: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel3: TQRLabel;
    QRLCadastro: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRExpr4: TQRExpr;
    QRLabel13: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr7: TQRExpr;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProduto_EntradaSaidaRetrato: TFRProduto_EntradaSaidaRetrato;

implementation

uses UProdutoRelatorio_cl;

{$R *.dfm}

procedure TFRProduto_EntradaSaidaRetrato.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  With DMProdutoRelatorio do
    QRLDescricao.Caption := Trim(QRMovEntradaSaidaDesc_Produto.Value);
end;

end.
