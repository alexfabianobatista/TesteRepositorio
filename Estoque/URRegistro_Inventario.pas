unit URRegistro_Inventario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFREstoqueInventario = class(TFTRelSimples)
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
    QRLOutrasEmpresas: TQRLabel;
    QRLNaEmpresa: TQRLabel;
    QRLQtOutras: TQRLabel;
    QRLQtEmpresa: TQRLabel;
    QRLVlEmpresa: TQRLabel;
    QRLVlOutras: TQRLabel;
    QRLabel6: TQRLabel;
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
  FREstoqueInventario: TFREstoqueInventario;

implementation

uses UEstoque_cl, UOracle_cl, UEstoqueParam, UParamSistema_cl;

{$R *.DFM}

procedure TFREstoqueInventario.QRBand4BeforePrint(Sender: TQRCustomBand;
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

procedure TFREstoqueInventario.FormCreate(Sender: TObject);
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

procedure TFREstoqueInventario.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLPagina.Caption := IntToStr(wPagina);
end;

procedure TFREstoqueInventario.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  Inc(wPagina);
end;

procedure TFREstoqueInventario.QRBand5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wPagina := DMEstoque.pNrPagina;
end;

procedure TFREstoqueInventario.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIMADE' then
    QRSumQuant.Mask := '#,###,###0.000';
  If Not (DMEstoque.QEstoqueOEmpresa.Eof) Then
   Begin
     If DMEstoque.QEstoqueOEmpresaSOMA.Value = 0 Then
      Begin
        QRLOutrasEmpresas.Caption := ' ';
        QRLQtOutras.Caption := ' ';
        QRLVlOutras.Caption := ' ';
      End
     Else
      Begin
        QRLOutrasEmpresas.Caption := 'Depósito em outras empresas';
        QRLQtOutras.Caption := FormatFloat('#,##0.00',DMEstoque.QEstoqueOEmpresaSOMA.Value);
        QRLVlOutras.Caption := FormatFloat('#,##0.00',DMEstoque.QEstoqueOEmpresaVAL_SOMA.Value);
      End;
     If DMEstoque.QEstoqueOEmpresaSOMA_EMP.Value = 0 Then
      Begin
        QRLNaEmpresa.Caption := ' ';
        QRLQtEmpresa.Caption := ' ';
        QRLVlEmpresa.Caption := ' ';
      End
     Else
      Begin
        QRLNaEmpresa.Caption := 'Depósito na empresa';
        QRLQtEmpresa.Caption := FormatFloat('#,##0.00',DMEstoque.QEstoqueOEmpresaSOMA_EMP.Value);
        QRLVlEmpresa.Caption := FormatFloat('#,##0.00',DMEstoque.QEstoqueOEmpresaVAL_SOMA_EMP.Value);
      End
   End;
end;

End.
