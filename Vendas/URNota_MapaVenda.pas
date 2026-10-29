unit URNota_MapaVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNota_MapaVenda = class(TFTRelSimples)
    QRGCabFilial: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLProduto: TQRLabel;
    QRLQuantidade: TQRLabel;
    QRLTotal: TQRLabel;
    QRBand3: TQRBand;
    QRBRodFilial: TQRBand;
    QRDBTCodProduto: TQRDBText;
    QRDBTProduto: TQRDBText;
    QRDBTQuantidade: TQRDBText;
    QRDBTTotal: TQRDBText;
    QRLabel8: TQRLabel;
    QRExprQuantidade: TQRExpr;
    QRExprTotal: TQRExpr;
    QRDBText7: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLCusto: TQRLabel;
    QRDBTCusto: TQRDBText;
    QRLLucro: TQRLabel;
    QRExprLucro: TQRExpr;
    QRExprCusto: TQRExpr;
    QRExprSumLucro: TQRExpr;
    QRLVendedor_Oper: TQRLabel;
    QRLFornecedor: TQRLabel;
    QRLDepartamento: TQRLabel;
    QRDBDescUnidade: TQRDBText;
    QRDBNumEmbalagem: TQRDBText;
    QRLEmbalagem: TQRLabel;
    QRExprPesoLiquido: TQRExpr;
    QRDBTPeso: TQRDBText;
    QRLPesoLiquido: TQRLabel;
    QRDBLote: TQRDBText;
    QRExpTLitros: TQRExpr;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_MapaVenda: TFRNota_MapaVenda;

implementation

uses URelatorioVenda_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRNota_MapaVenda.FormActivate(Sender: TObject);
begin
  inherited;
  QRPrimario.DataSet := DMRelatorio_Venda.QRMapaVenda;
end;

procedure TFRNota_MapaVenda.FormCreate(Sender: TObject);
var
  wAux: Integer;
begin
  inherited;
  wAux := 20;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIBENS' then
  begin
    QRDBTCodProduto.DataField := 'NUM_FABRICANTE';

    QRDBTCusto.Width := QRDBTCusto.Width - wAux;
    QRDBTTotal.Width := QRDBTTotal.Width - wAux;
    QRDBTQuantidade.Width := QRDBTQuantidade.Width - wAux;
    QRDBTProduto.Width := QRDBTProduto.Width - wAux;

    QRDBTCusto.Left := QRDBTCusto.Left + wAux;
    QRDBTTotal.Left := QRDBTTotal.Left + (wAux * 2);
    QRDBTQuantidade.Left := QRDBTQuantidade.Left + (wAux * 3);
    QRDBTProduto.Left := QRDBTProduto.Left + (wAux * 4);

    QRLTotal.Left := QRLTotal.Left + wAux;
    QRLQuantidade.Left := QRLQuantidade.Left + (wAux * 2);

    QRExprCusto.Width := QRExprCusto.Width - wAux;
    QRExprTotal.Width := QRExprTotal.Width - wAux;
    QRExprQuantidade.Width := QRExprQuantidade.Width - wAux;

    QRExprCusto.Left := QRExprCusto.Left + wAux;
    QRExprTotal.Left := QRExprTotal.Left + (wAux * 2);
    QRExprQuantidade.Left := QRExprQuantidade.Left + (wAux * 3);

    QRDBTCodProduto.Width := QRDBTCodProduto.Width + (wAux * 4);
  end;
end;

end.
