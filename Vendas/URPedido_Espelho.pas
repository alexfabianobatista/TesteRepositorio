unit URPedido_Espelho;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt,
  grimgctrl, Printers;

type
  TFRPedido_Espelho = class(TFTRelSimples)
    QRBSumOC: TQRBand;
    QRBCabOC: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
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
    QRLabel16: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel17: TQRLabel;
    QRLTotal: TQRLabel;
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
    QRLabel25: TQRLabel;
    QRLM3: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel28: TQRLabel;
    QRLVolumes: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText29: TQRDBText;
    QRBand3: TQRBand;
    QRDBText11: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBTDescProduto: TQRDBText;
    QRDBTCodProduto: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRMFglass: TQRMemo;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel37: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel38: TQRLabel;
    QRLNcm: TQRLabel;
    QRDBTNcm: TQRDBText;
    QRLabel39: TQRLabel;
    QRLPesoBruto: TQRLabel;
    QRLabel41: TQRLabel;
    QRLPesoLiquido: TQRLabel;
    QRDBText38: TQRDBText;
    QRImage1: TQRImage;
    QRExpr2: TQRExpr;
    QRLabel40: TQRLabel;
    QRLabel42: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel14: TQRLabel;
    QRShape1: TQRShape;
    QRLabel36: TQRLabel;
    QRDBText37: TQRDBText;
    QRHRule1: TQRHRule;
    QRLPlaca: TQRLabel;
    QRDBPlaca: TQRDBText;
    QRShape2: TQRShape;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBTInfAddItem: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBSumOCBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRPrimarioAfterPrint(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedido_Espelho: TFRPedido_Espelho;
  wTotalPedido, wQtdeTotal, wM3, wVolumes, wPesoBruto, wPesoLiquido : Real;

implementation

uses UPedido_cl, UOracle_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRPedido_Espelho.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var wCaminhoImagem : String;
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'DEION' Then
  Begin
    QRPrimario.Font.Name := 'Arial';
    QRLTitulo.Font.Name := 'Arial';
    QRBSumOC.Font.Name := 'Arial';
    QRLabel25.Font.Name := 'Arial';
    QRLabel29.Font.Name := 'Arial';
    QRDBTCodProduto.Font.Name := 'Arial';
    QRDBTDescProduto.Font.Name := 'Arial';
    QRDBTDescProduto.Font.Name := 'Arial';
    QRDBText11.Font.Name := 'Arial';
    QRDBText30.Font.Name := 'Arial';
    QRDBText31.Font.Name := 'Arial';
    QRDBText32.Font.Name := 'Arial';
    QRDBText33.Font.Name := 'Arial';
    QRDBText34.Font.Name := 'Arial';
    QRLabel25.Font.Name := 'Arial';
    QRLabel39.Font.Name := 'Arial';
    QRLabel41.Font.Name := 'Arial';
    QRLabel45.Font.Name := 'Arial';
    QRLPesoBruto.Font.Name := 'Arial';
    QRLPesoLiquido.Font.Name := 'Arial';
    QRLM3.Font.Name := 'Arial';
    QRLVolumes.Font.Name := 'Arial';
    QRLTotalQtde.Font.Name := 'Arial';
  End;
  if DMParamSistema.CodEmpresa = 'WERNER' Then
    if (MessageDlg('Deseja imprimir sem valor?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    Begin
      QRdbText31.Enabled := False;
      QrdbText34.Enabled := False;
      Qrexpr1.Enabled := False;
      Qrexpr2.Enabled := False;
      Qrexpr3.Enabled := False;
      QRLTotal.Enabled := False;
      QRLTitulo.Caption := 'ORDEM DE PRODUÇÃO';
    end
    else
    Begin
      QRdbText31.Enabled := True;
      QrdbText34.Enabled := True;
      Qrexpr1.Enabled := True;
      Qrexpr2.Enabled := True;
      Qrexpr3.Enabled := True;
      QRLTotal.Enabled := True;
      QRLTitulo.Caption := 'PEDIDO';
    end;
  if (DMParamSistema.CodEmpresa = 'BENINI')     or (DMParamSistema.CodEmpresa = 'NUTRIVET')  or (DMParamSistema.CodEmpresa = 'NUTRIPET')  or
     (DMParamSistema.CodEmpresa = 'CASATINTAS') or (DMParamSistema.CodEmpresa = 'DONABENTA') OR (DMParamSistema.CodEmpresa = 'FERRAGMED') or
     (DMParamSistema.CodEmpresa = 'QUERENCIA')  Then
    QRLTitulo.Caption := 'ORÇAMENTO';
  wTotalPedido := 0;
  wQtdeTotal :=0;
  wM3 := 0;
  wVolumes := 0;
  wPesoBruto := 0;
  wPesoLiquido := 0;
  QRMFglass.Lines.Clear;
  if (DMParamSistema.CodEmpresa = 'FGLASS')     or (DMParamSistema.CodEmpresa = 'REDIESEL')  or
     (DMParamSistema.CodEmpresa = 'CASATINTAS') or (DMParamSistema.CodEmpresa = 'DONABENTA') or
     (DMParamSistema.CodEmpresa = 'FERRAGMED') Then
  begin
    QRMFglass.Lines.Add(DMOracle.BuscaNome('SELECT DESC_ENDERECO || '', '' || ' +
        'NUM_ENDERECO || '', '' || DESC_CIDADE || '' - '' || COD_ESTADO || CHR(10) || ' +
        '''CNPJ: '' || NUM_CGC FROM TB_FILIAL',
        'COD_FILIAL = (SELECT COD_FILIAL FROM TB_PEDIDO_CAB WHERE COD_PEDIDO_CAB = ' +
        DMPedido.QRPedidoCOD_PEDIDO_CAB.Text + ')'));
  end;
  if (DMParamSistema.CodEmpresa = 'FERRAGENS') then
  begin
    QRMFglass.Lines.Add(DMOracle.BuscaNome('SELECT ''CNPJ: '' || NUM_CGC || '' '' || ''IE: '' || DESC_INSCRICAO || '+
        'CHR(10) || DESC_ENDERECO || '', '' || ' + 'NUM_ENDERECO || '', '' || DESC_CIDADE || '' - ''' +
        ' || COD_ESTADO || CHR(10) || ''E-mail: '' || DESC_E_MAIL FROM TB_FILIAL',
        'COD_FILIAL = (SELECT COD_FILIAL FROM TB_PEDIDO_CAB WHERE COD_PEDIDO_CAB = ' +
        DMPedido.QRPedidoCOD_PEDIDO_CAB.Text + ')'));
    QRLTitulo.Top := 70;
    QRLEmpresa.Left := 230;
    QRMFglass.Left := 230;
    QRImage1.Visible := True;
    QRImage1.Left := 1;
    wCaminhoImagem := ExtractFilePath(Application.ExeName) + 'logo\logo.jpg';
    QRImage1.Picture.LoadFromFile(wCaminhoImagem);
  end;
  if (DMParamSistema.CodEmpresa = 'GGIRARDI') then
  begin
    QRMFglass.Lines.Add(DMOracle.BuscaNome('SELECT ''CNPJ: '' || NUM_CGC || '' '' || ''IE: '' || DESC_INSCRICAO || '+
        'CHR(10) || DESC_ENDERECO || '', '' || ' + 'NUM_ENDERECO || '', '' || DESC_CIDADE || '' - ''' +
        ' || COD_ESTADO || CHR(10) || ''REPRESENTANTE LEGAL: '' || DESC_NOME_CONTATO FROM TB_FILIAL',
        'COD_FILIAL = (SELECT COD_FILIAL FROM TB_PEDIDO_CAB WHERE COD_PEDIDO_CAB = ' +
        DMPedido.QRPedidoCOD_PEDIDO_CAB.Text + ')'));
    QRLTitulo.Top := 60;
    QRLabel28.Caption := 'V.Desc.';
    QRDBText32.DataField := 'VAL_DESCONTO_ITEM';
    QRLabel10.Enabled := false;
    QRLabel10.Visible := false;
    QRDBText33.Enabled := false;
    QRDBText33.Visible := false;
    QRLabel3.Visible := false;
    QRLabel3.Enabled := false;
    QRDBText30.Enabled := false;
    QRDBText30.Visible := false;
    QRDBText11.Width := 104;
    QRDBText32.Width := 55;
  end;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'NIR') Then
  Begin
    QRLabel39.Enabled := False;
    QRLPesoBruto.Enabled := False;
    QRLabel41.Enabled := False;
    QRLPesoLiquido.Enabled := False;
  End;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'REDIESEL') Then
  Begin
    QRDBTCodProduto.Enabled := False;
    QRDBText30.Enabled := False;
    QRDBText32.Enabled := False;
    QRDBText33.Enabled := False;
    QRLabel3.Enabled := False;
    QRLabel28.Enabled := False;
    QRLabel10.Enabled := False;
    QRDBTDescProduto.Left := 5;
    QRDBTDescProduto.Width := 450;
    QRLabel30.Caption := 'VEÍCULO: ' + Dmpedido.QRPedidoDESC_OBSERVACAO.Value;//+ QRDBText8.DataSet['DESC_OBSERVACAO']; //Operacao
    QRDBText29.Enabled := False;
    QRDBText13.Enabled := False;
    QRLabel16.Enabled := False;
    QRDBText10.Enabled := False;
    QRDBText12.Enabled := False;
    QRLabel27.Enabled := False;
    QRDBText26.Enabled := False;
    QRLabel39.Enabled := False;
    QRLPesoBruto.Enabled := False;
    QRLabel41.Enabled := False;
    QRLPesoLiquido.Enabled := False;

    QRDBText8.DataField := 'DESC_COMPLEMENTO_OBS';// QRDBText8.DataSet['DESC_COMPLEMENTO_OBS2'];
    //QRDBText8.Enabled := False; //DESC_OBS
    QRImage1.Visible := True;

    QRLEmpresa.Left := 230;
    QRMFglass.Left := 230;
    QRLTitulo.Top := 55;
    QRImage1.Left := 1;

    wCaminhoImagem := ExtractFilePath(Application.ExeName) + 'logo\logo.jpg';
    QRImage1.Picture.LoadFromFile(wCaminhoImagem);
  end;
  if (DMParamSistema.CodEmpresa = 'DONABENTA') Then
  Begin

    QRLabel3.Enabled := False; // Tr
    QRDBText30.Enabled := False; // Tr
    QRLabel28.Enabled := False; //Comissao
    QRDBText32.Enabled := False; //Comissao
    QRLabel27.Enabled := False;  //comissao
    QRDBText26.Enabled := False; //comissao

    QRLabel39.Enabled := False;
    QRLabel41.Enabled := False;
    QRLPesoBruto.Enabled := False;
    QRLPesoLiquido.Enabled := False;

    QRImage1.Visible := True;

    QRLEmpresa.Left := 230;
    QRMFglass.Left := 230;
    QRLTitulo.Top := 55;
    QRImage1.Left := 1;

    QRLabel14.Caption := DMPedido.QRPedidoDESC_FILIAL.Value;
    QRLabel1.Enabled := False;
    QRLNomeRel.Enabled := False;

    wCaminhoImagem := ExtractFilePath(Application.ExeName) + 'logo\benta.jpg';
    QRImage1.Picture.LoadFromFile(wCaminhoImagem);
  end;
  if (DMParamSistema.CodEmpresa = 'CASATINTAS') Then
  Begin
    QRBand3.Height := 30;
    QRDBTInfAddItem.Enabled := True;
    QRLabel3.Enabled := False;   // Tr
    QRDBText30.Enabled := False; // Tr
    QRLabel28.Enabled := False;  //Comissao
    QRDBText32.Enabled := False; //Comissao
    QRLabel27.Enabled := False;  //comissao
    QRDBText26.Enabled := False; //comissao
    QRLabel24.Enabled := False;  //CFP
    QRDBText25.Enabled := False; //CPF
    QRLabel26.Enabled := False;  //IE
    QRDBText15.Enabled := False; //IE
    QRLabel30.Enabled := False;  //OPERACAO
    QRDBText29.Enabled := False; //operacao
    QRDBText13.Enabled := False; //operacao
    QRLabel39.Enabled := False;
    QRLabel41.Enabled := False;
    QRLPesoBruto.Enabled := False;
    QRLPesoLiquido.Enabled := False;

    QRImage1.Visible := True;

    QRLEmpresa.Left := 230;
    QRMFglass.Left := 230;
    QRLTitulo.Top := 55;
    QRImage1.Top := 5;
    QRImage1.Left := 1;

    QRLabel1.Enabled := False;
    QRLNomeRel.Enabled := False;

    wCaminhoImagem := ExtractFilePath(Application.ExeName) + 'logo\logo.jpg';
    QRImage1.Picture.LoadFromFile(wCaminhoImagem);
  end;

  if (DMParamSistema.CodEmpresa = 'BIGMETAL') or (DMParamSistema.CodEmpresa = 'DINIZ') then
  begin
    QRLabel28.Enabled  := False;
    QRLabel10.Enabled  := False;
    QRDBText32.Enabled := False;
    QRDBText33.Enabled := False;
    QRLabel27.Enabled  := False;
    QRDBText26.Enabled := False;
    //unica maneira para imprimir certo os pedidos foi pegar os campos pagamento,assinatura e colocar na banda de cima. Junior 11/10/2017.
    QRLabel44.Enabled := True;
    QRDBText9.Enabled := True;
    QRShape2.Enabled  := True;
    QRLabel43.Enabled := True;
    QRBand2.Enabled   := False;
  end;
end;

procedure TFRPedido_Espelho.QRBSumOCBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;   
  //if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RAZENTE') or
  //       (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'QUALIMENTA') then
  wTotalPedido := wTotalPedido - DMPedido.QRPedidoVAL_DESCONTO.Value + DMPedido.QRPedidoVAL_DESPESAS.Value;
  QRLTotal.Caption := FormatFloat(' ###,###,##0.00',wTotalPedido);
  QRLTotalQtde.caption := FormatFloat(' ###,###,##0.00',wQtdeTotal);
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS' Then
   Begin
    QrLabel25.Caption := 'M3:';
    QRLM3.Caption := FormatFloat(' ###,###,##0.00',wM3);
    QRLVolumes.Caption := FormatFloat(' #,##0.00',wVolumes);
   End
  Else
   Begin
    QrLabel25.Caption := '';
    QRLM3.Caption := '';
    QRLVolumes.Caption := '';
    QRLabel29.Enabled := False;
   End;
  if (DMParamSistema.CodEmpresa = 'ZAPOLI') or (DMParamSistema.CodEmpresa = 'BIGMETAL') OR (DMParamSistema.CodEmpresa = 'DINIZ') Then
  begin
    QrLabel25.Caption := 'M3:';
    QRLM3.Caption := FormatFloat('##,##0.00',wM3);
    QRLPesoBruto.Caption := FormatFloat('##,##0.00',wPesoBruto);
    QRLPesoLiquido.Caption := FormatFloat('##,##0.00',wPesoLiquido);
  end;
  if DMParamSistema.CodEmpresa = 'NEOALI' then
  begin
    QRLabel37.Enabled := False;
    QRExpr1.Enabled   := False;
    QRLabel17.Top     := 1;
    QRLTotal.Top      := 1;
  end;
  if DMParamSistema.CodEmpresa = 'POLLYANA' then
  begin
    QRDBText32.Enabled := False;
    QRDBText33.Enabled := False;
    QRDBText30.Enabled := False;
    QRLabel3.Enabled := False;
    QRLabel28.Enabled := False;
    QRLabel10.Enabled := False;
  end;
  if DMParamSistema.CodEmpresa = 'WERNER' then
    QRLTotalQtde.caption := FormatFloat(' #,###0.000',wQtdeTotal);

end;

procedure TFRPedido_Espelho.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLEmpresa.Caption := DMOracle.BuscaNome('SELECT DESC_FILIAL || ' + QuoteDStr(' Fone:') + ' || DESC_TELEFONE FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(DMPedido.QPedidoCod_Filial.Value));
end;

procedure TFRPedido_Espelho.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
Var
  wEmbalagem, wVol: String;
  wVal: Real;
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'RAZENTE' then
  begin
    wVal := DMPedido.QrPedidoValor_Total.Value;
    wVal := wVal - (wVal * DMPedido.QRPedidoPERC_DESCONTO.Value / 100);
    wTotalPedido := wTotalPedido + wVal;
  end
  else
    wTotalPedido := wTotalPedido+ (DMPedido.QrPedidoValor_Total.Value - (DMPedido.QRPedidoQT_PEDIDO.Value *
      (DMPedido.QRPedidoVAL_UNITARIO.Value * DMPedido.QRPedidoPERC_DESCONTO.Value/100)))+
      DMPedido.QRPedidoVal_substituicao.Value;
  wQtdeTotal  := wQtdeTotal+DMPedido.QrPedidoQrQuantidade.Value;
  wEmbalagem := FloatToStr(DMPedido.QrPedidoNUM_EMBALAGEM.Value);
  wVol := FloatToStr(DMPedido.QrPedidoNUM_VOLUMES.Value);
  If (DMParamSistema.CodEmpresa = 'ZAPOLI') or (DMParamSistema.CodEmpresa = 'BIGMETAL') OR (DMParamSistema.CodEmpresa = 'DINIZ') Then
   Begin
     wM3 := wM3 + DMPedido.QrPedidoQt_Pedido.Value * DMPedido.QrPedidoNUM_METROS_CUBICOS.Value;
     wPesoBruto := wPesoBruto + DMPedido.QrPedidoQt_Pedido.Value * DMPedido.QrPedidoNUM_PESO_BRUTO.Value;
     wPesoLiquido := wPesoLiquido + DMPedido.QrPedidoQt_Pedido.Value * DMPedido.QrPedidoNUM_PESO_LIQUIDO.Value;
   End
  Else
    If Trim(wEmbalagem) <> '' Then
       wM3 := wM3 + DMPedido.QrPedidoQt_Pedido.Value * StrToFloat(wEmbalagem);
  If Trim(wVol) <> '' Then
     wVolumes := wVolumes + DMPedido.QrPedidoQt_Pedido.Value * StrToFloat(wVol);
end;

procedure TFRPedido_Espelho.FormCreate(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'FGLASS')     or (DMParamSistema.CodEmpresa = 'REDIESEL')  or
     (DMParamSistema.CodEmpresa = 'CASATINTAS') or (DMParamSistema.CodEmpresa = 'DONABENTA') or
     (DMParamSistema.CodEmpresa = 'FERRAGMED')  or (DMParamSistema.CodEmpresa = 'FERRAGENS') or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GGIRARDI') Then
  begin
      QRMFglass.Height := QRMFglass.Height + 15;
      QRMFglass.Width := QRMFglass.Width + 60;
      QRBand1.Height := QRBand1.Height + 35;
  end
  else
    QRMFglass.Width := 0;

  if (DMParamSistema.CodEmpresa = 'DINIZ')   or  (DMParamSistema.CodEmpresa= 'MEDIBENS') or
     (DMParamSistema.CodEmpresa = 'RETIFOZ') or (DMParamSistema.CodEmpresa= 'RETIFOZ2')  Then   //Inserido a pedido da Raquel. Vanessa 12-03-2014
  begin
    QRDBTCodProduto.DataField := 'NUM_FABRICANTE';
    QRDBTCodProduto.Font.Size := 8;
  End;
  if (DMParamSistema.CodEmpresa = 'NEOALI') then
  begin
    QRDBTCodProduto.DataField := 'NUM_FABRICANTE';
    //QRDBTDescProduto.DataField := 'DESC_PRODUTO2';
    QRBand3.Font.Size          := 8; //deixtar toda a banda com fonte 8.
    QRDBTCodProduto.Width      := 155;
    QRDBTDescProduto.Left      := 165;
    QRDBTDescProduto.Width     := 320;
  end;

  if (DMParamSistema.CodEmpresa = 'GGIRARDI')  or (DMParamSistema.CodEmpresa = 'RODOS') then
  begin
    QRDBTDescProduto.Width := 410;
    QRDBTDescProduto.DataField := 'DESC_PRODUTO2';
  end;

  if (DMParamSistema.CodEmpresa = 'GRAZAPEL') then
  begin
    QRDBTDescProduto.Width := 380;
    QRDBTDescProduto.DataField := 'DESC_PRODUTO2';
  end;

  if DMParamSistema.CodEmpresa = 'RAELETRO' then  //Adicionar ncm no espelho pedido a pedido Marlise Ra. Vanessa 21/07/2014
  begin
    QRDBTDescProduto.Width := 285;
    QRDBTNcm.Enabled := true;
    QRLNcm.Enabled := true;
  end;
  if (DMParamSistema.CodEmpresa = 'FURGOESMED') or (DMParamSistema.CodEmpresa = 'FURGMED') then
  begin
    QRLPlaca.Enabled := true;
    QRDBPlaca.Enabled:= true;
  end;
{Solicitado por Sirlei. CodSuporte: 11861 - Alex 12/11/2025}  
  if (DMParamSistema.CodEmpresa = 'RODOS') then
  begin
     //QRDBTCodProduto.DataField := 'PRODNUMBARRAS';
     QRBand3.Height := 30;
     QRDBTInfAddItem.Enabled := True;
     QRDBTInfAddItem.DataField := 'PRODNUMBARRAS';
     QRDBTInfAddItem.Left := 4;
//     QRLabel8.Caption := 'Produto - Cod. Barras';
  end;
end;

procedure TFRPedido_Espelho.QRPrimarioAfterPrint(Sender: TObject);
begin
  inherited;
  if DMPedido.QRPedidoIND_SITUACAO.Value = '1' then
    DMOracle.ExecutaSql('UPDATE TB_PEDIDO_CAB SET STEP_PEDIDO_WEB = 2, LOCAL_ULTIMA_ALTERACAO = ' +
      QuotedStr('CEMAPA') + ' WHERE COD_PEDIDO_CAB = '+ DMPedido.QRPedidoCOD_PEDIDO_CAB.Text);
end;

procedure TFRPedido_Espelho.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'REDIESEL') then
  begin
    QRLabel46.Enabled := True;
    QRLabel47.Enabled := True;
    QRLabel47.Caption := 'A EMPRESA REDIESEL SANTOS E FAVATO LTDA EXIME-SE DE GARANTIA EM CASO DE CONTAMINAÇÃO NO COMBUSTIVEL.'
  end;
end;

end.
