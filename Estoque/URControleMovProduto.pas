unit URControleMovProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRControleMovProduto = class(TFTRelSimples)
    QRLPeriodo: TQRLabel;
    QRGroup1: TQRGroup;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLProduto: TQRLabel;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
   wEstoque_Final : Real;
  end;

var
  FRControleMovProduto: TFRControleMovProduto;

implementation

uses URelatorioEstoque_cl;

{$R *.DFM}

procedure TFRControleMovProduto.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wEstoque_Final := DMRelatorio_Estoque.QrEstoque_InicialQt_Estoque.Value;
end;

procedure TFRControleMovProduto.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  If DMRelatorio_Estoque.QRControleMovProdutoDesc_Tipo_Operacao.Value = 'ENTRADA' Then
     wEstoque_Final := wEstoque_Final + DMRelatorio_Estoque.QRControleMovProdutoTotal_Quantidade.Value
  Else
     wEstoque_Final := wEstoque_Final - DMRelatorio_Estoque.QRControleMovProdutoTotal_Quantidade.Value;
end;

procedure TFRControleMovProduto.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLabel10.Caption := FormatFloat('#,##0.00',wEstoque_Final);
end;

end.
