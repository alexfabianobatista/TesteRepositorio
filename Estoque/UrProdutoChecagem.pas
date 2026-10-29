unit UrProdutoChecagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFrProdutoChecagem = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QrLDtInventario: TQRLabel;
    QRLabel4: TQRLabel;
    QrLQtInventario: TQRLabel;
    QRLabel5: TQRLabel;
    QrLProduto: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    QrLQtEstoque: TQRLabel;
    QRLabel14: TQRLabel;
    QrlTotal: TQRLabel;
    QRLabel13: TQRLabel;
    QrLDiferenca: TQRLabel;
    QRLFilial: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrProdutoChecagem: TFrProdutoChecagem;
  wQtTotal:Real;

implementation

uses UEstoque_cl;


{$R *.DFM}

procedure TFrProdutoChecagem.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wQtTotal := wQtTotal + DMEstoque.QrChecagemEstoqueQt_Quantidade.Value;
end;

procedure TFrProdutoChecagem.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
//  wQtTotal := wQtTotal + StrToFloat(FrProdutoChecagem.QRLTotal.Caption);
  wQtTotal := wQtTotal + DmEstoque.pInventario;
  FrProdutoChecagem.QRLTotal.Caption:=FormatFloat('###,###,##0.00',wQtTotal);
//  wQtTotal := wQtTotal - StrToFloat(FrProdutoChecagem.QRLDiferenca.Caption);
  wQtTotal := wQtTotal - DmEstoque.pEstoque;
  FrProdutoChecagem.QRLDiferenca.Caption:=FormatFloat('###,###,##0.00',wQtTotal);
end;

procedure TFrProdutoChecagem.QRBand5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wQtTotal := 0;
end;

end.
