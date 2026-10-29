unit URPedido_Espelho;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRPedido_Espelho = class(TFTRelSimples)
    QRBSumOC: TQRBand;
    QRLabel14: TQRLabel;
    QRShape1: TQRShape;
    QRBCabOC: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel17: TQRLabel;
    QRLTotal: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText25: TQRDBText;
    QRLTotalQtde: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel28: TQRLabel;
    QRLVolumes: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText29: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText37: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRBand3: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRLabel33: TQRLabel;
    QRLTotalUnit: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel42: TQRLabel;
    QRLabel44: TQRLabel;
    QRLAcabamento: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRLabel43: TQRLabel;
    QRDBText42: TQRDBText;
    QRLEndereco: TQRLabel;
    QRLEndereco2: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBSumOCBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBCabOCBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedido_Espelho: TFRPedido_Espelho;
  wTotalPedido, wQtdeTotal, wVolumes, wQtdeAcabamento, wTotalUnit : Real;
  wCont : integer;


implementation

uses UPedido_cl, UOracle_cl, UParamSistema_cl, UBiblioteca;

{$R *.DFM}

procedure TFRPedido_Espelho.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  wTotalPedido := 0;
  wQtdeTotal :=0;
  wVolumes := 0;
  wCont := 0;
  wQtdeAcabamento := 0;
end;

procedure TFRPedido_Espelho.QRBSumOCBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
wTipoProduto : string;
begin
  inherited;

  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED') then
  Begin
    DMPedido.QPedidoItem.First;
    while not DMPedido.QPedidoItem.Eof do
    Begin
      wTipoProduto := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+DMPedido.QPedidoItemCOD_PRODUTO.Text);
      If wTipoProduto = 'INDUSTRIAL' Then
        wQtdeTotal  := wQtdeTotal+DMPedido.QPedidoItemQT_PEDIDO.Value;
      wTotalPedido := wTotalPedido+DMPedido.QPedidoItemQT_PEDIDO.Value*DMPedido.QPedidoItemVAL_UNITARIO.Value;
      DMPedido.QPedidoItem.Next;
    end;
  end; 
  QRLTotal.Caption := FormatFloat(' ###,###,##0.00',wTotalPedido);
  QRLTotalQtde.caption := FormatFloat(' ###,###,##0.00',wQtdeTotal);
  if DMPedido.QRPedidoNUM_METROS_CUBICOS.Text <> '' then
    QRLVolumes.Caption := FloatToStr(StrToFloat(DMPedido.QRPedidoNUM_METROS_CUBICOS.Text) * wQtdeTotal)+'Kg';
    
  QRLAcabamento.Caption := FormatFloat(' ###,###,##0.00', wQtdeAcabamento);
end;

procedure TFRPedido_Espelho.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO' then
    QRLEmpresa.Enabled := False;
  QRLEmpresa.Caption := DMOracle.BuscaNome('SELECT DESC_FILIAL || '' - '' || DESC_TELEFONE FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(DMPedido.QPedidoCod_Filial.Value));
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ' then
  begin
     QRLEndereco.Enabled  := True;
     QRLEndereco2.Enabled := True;
     QRLEndereco.Caption  := DMOracle.BuscaNome('SELECT DESC_ENDERECO || '' - '' || DESC_BAIRRO FROM TB_FILIAL','COD_FILIAL = ' +FloatToStr(DMPedido.QPedidoCod_Filial.Value));
     QRLEndereco2.Caption := DMOracle.BuscaNome('SELECT DESC_CIDADE || '' - '' || COD_ESTADO|| ''  '' || DESC_CEP FROM TB_FILIAL','COD_FILIAL = ' +FloatToStr(DMPedido.QPedidoCod_Filial.Value));
  end;
end;

procedure TFRPedido_Espelho.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean); 
begin
  inherited;
  DMPedido.QRMaterial.Close;
  DMPedido.QRMaterial.SetVariable('PEDIDO_ITEM',DMPedido.QRPedidoCOD_PEDIDO_ITEM.Text);
  DMPedido.QRMaterial.Open;
end;

procedure TFRPedido_Espelho.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var wEmbalagem, wVol : String;
wProduto : string;
begin
  inherited;
  DMPedido.QPedidoItem.Close;
  DMPedido.QPedidoItem.SetVariable('COD_PEDIDO_CAB',DMPedido.QRPedidoCOD_PEDIDO_CAB.Value);
  DMPedido.QPedidoItem.Open;
  DMPedido.QRPedidoqrquantidade.Value := 0;
  wProduto := DMPedido.QRPedidoCOD_PRODUTO.Text;
  while not DMPedido.QPedidoItem.Eof do
  Begin
    if wProduto = DMPedido.QPedidoItemCOD_PRODUTO.Text then
    Begin
      DMPedido.QRPedidoqrquantidade.Value := DMPedido.QRPedidoqrquantidade.Value + DMPedido.QPedidoItemQT_PEDIDO.Value;
      wTotalUnit := wTotalUnit+ DMPedido.QPedidoItemQT_PEDIDO.Value*DMPedido.QPedidoItemVAL_UNITARIO.Value;//ALTERADO MARCOS 04/11/10
    end;
    wProduto := DMPedido.QRPedidoCOD_PRODUTO.Text;
    DMPedido.QPedidoItem.Next;
  end;

  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'TEMPERMED') Then 
  Begin
    DMPedido.QSomaPedido.Close;
    DMPedido.QSomaPedido.SetVariable('COD_PEDIDO_CAB',DMPedido.QPedidoCOD_PEDIDO_CAB.Value);
    DMPedido.QSomaPedido.Open;
    DMPedido.QSomaPedido.First;
    while not DMPedido.QSomaPedido.Eof do
    Begin
      wTotalUnit := DMPedido.QSomaPedidoSTOTAL_PEDIDO.Value;
      DMPedido.QSomaPedido.Next;
    end;
   // wTotalUnit := (DMPedido.QRPedidoVAL_UNITARIO.Value*DMPedido.QrPedidoQrQuantidade.Value) -(((DMPedido.QrPedidoQrQuantidade.Value*DMPedido.QRPedidoVAL_UNITARIO.Value)*DMPedido.QRPedidoPERC_DESCONTO.Value)/100);
    wTotalPedido := wTotalUnit;
    wQtdeTotal  := wQtdeTotal+DMPedido.QrPedidoQrQuantidade.Value;
    wEmbalagem := FloatToStr(DMPedido.QrPedidoNUM_EMBALAGEM.Value);
    wVol := FloatToStr(DMPedido.QrPedidoNUM_VOLUMES.Value);
  end;
  QRLTotalUnit.Caption := FormatFloat(' ###,###,##0.00', wTotalUnit);

  If Trim(wVol) <> '' Then
     wVolumes := wVolumes + DMPedido.QrPedidoQt_Pedido.Value * StrToFloat(wVol);
end;

procedure TFRPedido_Espelho.QRBCabOCBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ' Then
  Begin
    QRLabel13.Enabled := False;
    QRDBText31.Enabled := False;
    QRLabel3.Left := 553;
    QRLabel28.Left := 605;
    QRLabel10.Left := 639;
    QRDBText30.Left := 548;
    QRDBText32.Left := 601;
    QRDBText33.Left := 635;
  end
  else
  Begin
    QRLabel18.Visible := False;
    QRDBText19.Visible := False;
    QRLabel18.Enabled := False;
    QRDBText19.Enabled := False;
    QRBCabOC.Height := 53;
    QRLabel11.Top := 35;
    QRLabel3.Top := 35;
    QRLabel13.Top := 35;
    QRLabel10.Top := 35;
    QRLabel9.Top := 35;
    QRLabel28.Top := 35;
  end;
  QRLabel8.Caption := 'Num.'+ DMPedido.QRPedidoDESC_COMPLEMENTO_OBS.Text;
end;

procedure TFRPedido_Espelho.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean); 
begin
  inherited;
  inc(wCont);
  QRLabel42.Caption := IntToStr(wCont);
  If DMPedido.QRMaterialDESC_CANTO.Text <> '' then
    QRDBText27.Enabled := True
  else
    QRDBText27.Enabled := False;
  DMPedido.QRMaterialQT_ACABAMENTO.Value := DMPedido.QRMaterialQT_ACABAMENTO.Value/1000;
  wQtdeAcabamento := wQtdeAcabamento + DMPedido.QRMaterialQT_ACABAMENTO.Value;
end;

procedure TFRPedido_Espelho.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO' then
  Begin
    QRLabel1.Enabled := False;
    QRLNomeRel.Enabled := False;
  end;
end;

end.
