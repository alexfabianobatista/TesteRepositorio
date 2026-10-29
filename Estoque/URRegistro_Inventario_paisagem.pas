unit URRegistro_Inventario_Paisagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFREstoqueInventario_paisagem = class(TFTRelSimples)
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRTLote: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBValor: TQRDBText;
    QRExprValorTotal: TQRExpr;
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    QRSumQuant: TQRExpr;
    QRSumValorTotal: TQRExpr;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLLote: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    TQRValor: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText2: TQRDBText;
    QRLQuant: TQRLabel;
    QRLFilial: TQRLabel;
    QRTProduto: TQRDBText;
    QRLabel3: TQRLabel;
    QRLPagina: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText8: TQRDBText;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    wPagina : Integer;
  end;

var
  FREstoqueInventario_paisagem: TFREstoqueInventario_paisagem;

implementation

uses UEstoque_cl, UOracle_cl, UEstoqueParam, UParamSistema_cl;

{$R *.DFM}

procedure TFREstoqueInventario_paisagem.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If FestoqueParam.Rg1Quantidade.ItemIndex = 0 then
  begin
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIMADE' then
      QRLQuant.Caption := FormatFloat('#,###,###0.000',DMEstoque.QREstoque_InventarioQT_QUANTIDADE.Value)
    else
      QRLQuant.Caption := FormatFloat('#,###,##0.00',DMEstoque.QREstoque_InventarioQT_QUANTIDADE.Value)
  end
  else
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIMADE' then
      QRLQuant.Caption := FormatFloat('#,###,###0.000',DMEstoque.QREstoque_InventarioQT_INVENTARIO.Value)
    else
      QRLQuant.Caption := FormatFloat('#,###,##0.00',DMEstoque.QREstoque_InventarioQT_INVENTARIO.Value);
end;

procedure TFREstoqueInventario_paisagem.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARZ' then
  begin
    QRLLote.Visible := False;
    QRLLote.Caption := '';
    QRTLote.Visible := False;
    QRTProduto.Width := QRTProduto.Width + QRTLote.Width;
  end;
end;

procedure TFREstoqueInventario_paisagem.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLPagina.Caption := IntToStr(wPagina);
end;

procedure TFREstoqueInventario_paisagem.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  Inc(wPagina);
end;

procedure TFREstoqueInventario_paisagem.QRBand5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wPagina := DMEstoque.pNrPagina;
end;

procedure TFREstoqueInventario_paisagem.QRBand5BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIMADE' then
    QRSumQuant.Mask := '#,###,###0.000';
end;

End.
