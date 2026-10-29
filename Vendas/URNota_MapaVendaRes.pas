unit URNota_MapaVendaRes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt, MaskUtils;

type
  TFRNota_MapaVendaRes = class(TFTRelSimples)
    QRGCabFilial: TQRGroup;
    QRLabel5: TQRLabel;
    QRLQuantidade: TQRLabel;
    QRLTotal: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRBRodFilial: TQRBand;
    QRDBTCodProduto: TQRDBText;
    QRDBTDescProduto: TQRDBText;
    QRDBTQuantidade: TQRDBText;
    QRDBTTotal: TQRDBText;
    QRLabel8: TQRLabel;
    QRExprQuantidade: TQRExpr;
    QRExprTotal: TQRExpr;
    QRLabel3: TQRLabel;
    QRLCusto: TQRLabel;
    QRDBTCusto: TQRDBText;
    QRLLucro: TQRLabel;
    QRExprLucro: TQRExpr;
    QRExprCusto: TQRExpr;
    QRExprSumLucro: TQRExpr;
    QRLVendedor_Oper: TQRLabel;
    QRLFornecedor: TQRLabel;
    QRLDepartamento: TQRLabel;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRDBTQtdeEstoque: TQRDBText;
    QRLQtdeEstoque: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRDBNumCGC: TQRDBText;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QRDBNumCGCPrint(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBRodFilialBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FRNota_MapaVendaRes: TFRNota_MapaVendaRes;

implementation

uses URelatorioVenda_cl, UParamSistema_cl, UBiblioteca;

{$R *.DFM}

procedure TFRNota_MapaVendaRes.FormActivate(Sender: TObject);
begin
  inherited;
  QRPrimario.DataSet := DMRelatorio_Venda.QRMapaVendaRes;
end;

procedure TFRNota_MapaVendaRes.FormCreate(Sender: TObject);
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
    QRDBTDescProduto.Width := QRDBTDescProduto.Width - wAux;

    QRDBTCusto.Left := QRDBTCusto.Left + wAux;
    QRDBTTotal.Left := QRDBTTotal.Left + (wAux * 2);
    QRDBTQuantidade.Left := QRDBTQuantidade.Left + (wAux * 3);
    QRDBTDescProduto.Left := QRDBTDescProduto.Left + (wAux * 4);

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

procedure TFRNota_MapaVendaRes.QRDBNumCGCPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := bib.FormataCPF(Value);
end;

procedure TFRNota_MapaVendaRes.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
{CodSuporte: 11681. Alex 30/09/2025}
  if (DMParamSistema.CodEmpresa = 'CEIFAGRIL') then
  begin
    QRLQtdeEstoque.Visible := false;
    QRLQtdeEstoque.Enabled := false;
  end;
end;

procedure TFRNota_MapaVendaRes.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
{CodSuporte: 11681. Alex 30/09/2025}
  if (DMParamSistema.CodEmpresa = 'CEIFAGRIL') then
  begin
    QRDBTQtdeEstoque.Visible := false;
    QRDBTQtdeEstoque.Enabled := false;
  end;
end;

procedure TFRNota_MapaVendaRes.QRBRodFilialBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
{CodSuporte: 11681. Alex 30/09/2025}
  if (DMParamSistema.CodEmpresa = 'CEIFAGRIL') then
  begin
    QRExpr5.Visible := false;
    QRExpr5.Enabled := false;
  end;
end;

procedure TFRNota_MapaVendaRes.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
{CodSuporte: 11681. Alex 30/09/2025}  
  if (DMParamSistema.CodEmpresa = 'CEIFAGRIL') then
  begin
    QRExpr6.Visible := false;
    QRExpr6.Enabled := false;
  end;
end;

end.
