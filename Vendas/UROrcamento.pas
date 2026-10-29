unit UROrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl;

type
  TFROrcamento = class(TFTRelSimples)
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRBand5: TQRBand;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText28: TQRDBText;
    QRLogo: TQRImage;
    QRLLogo: TQRLabel;
    QRHRule1: TQRHRule;
    QRLabel39: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel25: TQRLabel;
    QRLSubProdutos: TQRLabel;
    QRLabel26: TQRLabel;
    QRLTotalProdutos: TQRLabel;
    QRLabel27: TQRLabel;
    QRLTotalServico: TQRLabel;
    QRLasdf: TQRLabel;
    QRLDescontoProdutos: TQRLabel;
    QRLabel28: TQRLabel;
    QRLSubtotal: TQRLabel;
    QRLabel29: TQRLabel;
    QRLSubServico: TQRLabel;
    QRLabel31: TQRLabel;
    QRLDescontos: TQRLabel;
    QRLabel30: TQRLabel;
    QRLDescontoServico: TQRLabel;
    QRLabel32: TQRLabel;
    QRLAcrescimos: TQRLabel;
    QRLabel33: TQRLabel;
    QRLTotal: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText25: TQRDBText;
    QRBand6: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText30: TQRDBText;
    ChildBand1: TQRChildBand;
    QRDBText27: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText31: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    SubProdutos : Double;
    DescProdutos : Double;
    SubServicos : Double;
    DescServicos : Double;
    TotalProdutos : Double;
    TotalServicos : Double;
    SubTotal : Double;
    Descontos : Double;
    Acrescimos : Double;
    Total : Double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrcamento: TFROrcamento;

implementation

uses
  UPedido_cl, UParamSistema_cl, DB;

{$R *.dfm}

procedure TFROrcamento.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  {SubProdutos := 0;
  DescProdutos := 0;
  SubServicos := 0;
  DescServicos := 0;
  TotalProdutos := 0;
  TotalServicos := 0;
  SubTotal := 0;
  Descontos := 0;
  Acrescimos := 0;
  Total := 0;}
// A Ultramaq utiliza logo diferentes para cada filial. Configurado para que o sistema busque a logo de acordo a filial. Alex - 17/09/2021
  if FileExists(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg') then
  begin
    if ( (DMParamSistema.CodEmpresa = 'ULTRAMAQ') or (DMParamSistema.CodEmpresa = 'NFCE-SINAL') ) and
          (DMPedido.QPedidoCOD_FILIAL.Text = '1') then
    begin
     QRLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg');
     QRLLogo.Enabled := False;
    end;
    if ( (DMParamSistema.CodEmpresa = 'ULTRAMAQ') or (DMParamSistema.CodEmpresa = 'NFCE-SINAL') ) and
         (DMPedido.QPedidoCOD_FILIAL.Text = '2') then
    begin
     QRLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo\logo1.jpg');
     QRLLogo.Enabled := False;
    end
    else
    begin
     //QRLogo:= TJpegImage.Create;
    // QRLogo.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg');
     QRLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg');
     QRLLogo.Enabled := False;
    end
  end
  else
  begin
    QRLogo.Picture := Nil;
    QRLLogo.Enabled := True;
  end;

  if (DMParamSistema.CodEmpresa = 'ULTRAMAQ') then
  begin
    QRLabel8.Enabled := false;
    QRLabel15.Enabled := false;
    QRDBText6.Enabled := false;
    QRDBText7.Enabled := false;
  end;

   if (DMParamSistema.CodEmpresa = 'USIMED') then
    begin
      QRDBText27.Enabled := true;
      QRDBText27.Left:= 142;
      QRDBText27.Height := 5;
      QRDBText27.Width := 279;
      QRDBText19.Alignment := taCenter;
      QRDBText19.Font.Size := 8;
      QRDBText27.AutoStretch := True;
    end;
  if (DMParamSistema.CodEmpresa = 'NFCE-SINAL') then
  begin
    QRLabel15.Enabled := false;
    QRDBText7.Enabled := false;
    QRHRule1.Enabled := false;
    QRLabel39.Enabled := false;
    QRLabel19.Enabled := False;
    QRLabel36.Enabled := true;
    QRDBText20.DataField := 'DESC_UNIDADE';
  end;
//Solicitado pela Elisama para exibir o tipo de frete no relatório de orçamento
//cod_suporte: 3981 - Alex 29/10/2021
  if (DMParamSistema.CodEmpresa = 'DATEL') then
  begin
     QRLabel35.Enabled := False;
     QRDBText30.Enabled := False;

     QRLabel8.Enabled:= True;
     QRLabel8.Top := 106;
     QRLabel8.Left := 8;
     QRDBText6.Enabled := True;
     QRDBText6.Top := 106;
     QRDBText6.Left := 91;
  end;
  
end;

procedure TFROrcamento.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  with DMPedido do
  begin
   if QROrcamentoRetifoztipo_produto.Value = 'S' then
    begin
      SubServicos := SubServicos + (QROrcamentoRetifozQT_PEDIDO.Value*QROrcamentoRetifozVAL_UNITARIO.Value);
      DescServicos := DescServicos + (QROrcamentoRetifozQT_PEDIDO.Value*QROrcamentoRetifozval_desconto.Value);
      TotalServicos := {TotalServicos +} SubServicos;
   end
   else
   begin
     SubProdutos := SubProdutos + (QROrcamentoRetifozQT_PEDIDO.Value*QROrcamentoRetifozVAL_UNITARIO.Value);
     DescProdutos := DescProdutos + (QROrcamentoRetifozQT_PEDIDO.Value*QROrcamentoRetifozval_desconto.Value);
     TotalProdutos := {TotalProdutos +} SubProdutos;
   end;

   SubTotal := SubTotal + (QROrcamentoRetifozQT_PEDIDO.Value*QROrcamentoRetifozVAL_UNITARIO.Value);
   Descontos := Descontos + (QROrcamentoRetifozQT_PEDIDO.Value*QROrcamentoRetifozval_desconto.Value);
   Total := {Total +} (SubTotal-Descontos) + QROrcamentoRetifozVAL_DESPESA_CAB.Value;
  end;
end;

procedure TFROrcamento.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'CONSTRUMED') then
    QRLabel32.Caption := 'Despesas...:';
  QRLSubProdutos.Caption := FormatFloat('#,##0.00', SubProdutos);
  QRLSubServico.Caption := FormatFloat('#,##0.00', SubServicos);
  QRLDescontoProdutos.Caption := FormatFloat('#,##0.00', DescProdutos);
  QRLDescontoServico.Caption := FormatFloat('#,##0.00', DescServicos);
  QRLTotalProdutos.Caption := FormatFloat('#,##0.00', TotalProdutos);
  QRLTotalServico.Caption := FormatFloat('#,##0.00', TotalServicos);
  QRLSubtotal.Caption := FormatFloat('#,##0.00', SubTotal);
  QRLDescontos.Caption := FormatFloat('#,##0.00', DMPedido.QROrcamentoRetifozVAL_DESCONTO_CAB.Value + Descontos);
  QRLTotal.Caption := FormatFloat('#,##0.00', Total - DMPedido.QROrcamentoRetifozVAL_DESCONTO_CAB.Value);
  QRLAcrescimos.Caption := FormatFloat('#,##0.00', DMPedido.QROrcamentoRetifozVAL_DESPESA_CAB.Value);
end;

procedure TFROrcamento.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  SubProdutos := 0;
  DescProdutos := 0;
  SubServicos := 0;
  DescServicos := 0;
  TotalProdutos := 0;
  TotalServicos := 0;
  SubTotal := 0;
  Descontos := 0;
  Acrescimos := 0;
  Total := 0;
end;

procedure TFROrcamento.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
   if (DMPedido.QROrcamentoRetifozDESC_OBS_ITEM.Text <> '') then
   begin
     ChildBand1.Visible := True;
     ChildBand1.Height := 17;
   end
   else
   begin
     ChildBand1.Visible := False;
     ChildBand1.Height := 0;
   end;
end;

procedure TFROrcamento.FormCreate(Sender: TObject);
begin
  inherited;
{Solicitado por Sirlei. CodSuporte: 11861 - Alex 12/11/2025}  
  if (DMParamSistema.CodEmpresa = 'RODOS') then
  begin
     QRDBText18.DataField := 'PRODNUMBARRAS';
     QRDBText18.Width:= 141;
     QRLabel19.Caption := 'Cod. Barras';
//     QRLabel8.Caption := 'Produto - Cod. Barras';
     QRDBText21.Enabled := false;
     QRDBText21.Visible := false;
  end;
end;

end.
