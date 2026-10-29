unit UPesagemEntradaSaidaEspelho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRCtrls, QRExport, QRWebFilt, QRPDFFilt, QuickRpt,
  ExtCtrls, UBiblioteca, jpeg;

type
  TFRPesagemEntradaSaidaEspelho = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel25: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel28: TQRLabel;
    QRLpUmidade: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText29: TQRDBText;
    QRLpImpureza: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel38: TQRLabel;
    QRPesoBrutoSaca: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText31: TQRDBText;
    QRLArdidos: TQRLabel;
    QRLabel39: TQRLabel;
    QRLDescontos: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel36: TQRLabel;
    QRDBText32: TQRDBText;
    QRLAvariados: TQRLabel;
    QRLabel35: TQRLabel;
    QRLLiquido: TQRLabel;
    QRLabel41: TQRLabel;
    QRLSCLiquido: TQRLabel;
    QRLabel47: TQRLabel;
    QRLRenda: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel45: TQRLabel;
    QRDBText33: TQRDBText;
    QRLQuebrados: TQRLabel;
    QRLabel43: TQRLabel;
    QRLSaldoCliente: TQRLabel;
    QRLabel44: TQRLabel;
    QRLSaldoClienteScs: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText34: TQRDBText;
    QRLTriguilho: TQRLabel;
    QRLabel49: TQRLabel;
    QRLTotalDescontos: TQRLabel;
    QRLabel50: TQRLabel;
    QRDBText35: TQRDBText;
    QRLabel52: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel53: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel54: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel55: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel56: TQRLabel;
    QRDBText39: TQRDBText;
    QRLabel57: TQRLabel;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRLabel81: TQRLabel;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRLabel58: TQRLabel;
    QRDBText44: TQRDBText;
    QRLabel59: TQRLabel;
    QRDBText45: TQRDBText;
    QRLabel60: TQRLabel;
    QRDBText46: TQRDBText;
    QRLabel61: TQRLabel;
    QRDBText47: TQRDBText;
    QRLabel62: TQRLabel;
    QRDBText48: TQRDBText;
    QRLabel63: TQRLabel;
    QRDBText49: TQRDBText;
    QRLabel64: TQRLabel;
    QRDBText50: TQRDBText;
    QRLabel65: TQRLabel;
    QRDBText51: TQRDBText;
    QRLabel66: TQRLabel;
    QRDBText52: TQRDBText;
    QRLabel67: TQRLabel;
    QRDBText53: TQRDBText;
    QRLabel68: TQRLabel;
    QRDBText54: TQRDBText;
    QRLabel69: TQRLabel;
    QRDBText55: TQRDBText;
    QRLabel70: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel71: TQRLabel;
    QRDBText57: TQRDBText;
    QRLabel72: TQRLabel;
    QRDBText58: TQRDBText;
    QRLabel73: TQRLabel;
    QRDBText59: TQRDBText;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRDBText60: TQRDBText;
    QRLabel76: TQRLabel;
    QRDBText61: TQRDBText;
    QRLabel80: TQRLabel;
    QRDBText62: TQRDBText;
    QRLpUmidade2: TQRLabel;
    QRLabel84: TQRLabel;
    QRDBText67: TQRDBText;
    QRLabel87: TQRLabel;
    QRDBText64: TQRDBText;
    QRLabel85: TQRLabel;
    QRDBText65: TQRDBText;
    QRLpImpureza2: TQRLabel;
    QRLabel82: TQRLabel;
    QRDBText63: TQRDBText;
    QRLabel83: TQRLabel;
    QRLPesoBrutoSaca2: TQRLabel;
    QRLabel86: TQRLabel;
    QRDBText66: TQRDBText;
    QRLArdidos2: TQRLabel;
    QRLabel88: TQRLabel;
    QRLDescontos2: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRDBText68: TQRDBText;
    QRLAvariados2: TQRLabel;
    QRLabel91: TQRLabel;
    QRLLiquido2: TQRLabel;
    QRLabel92: TQRLabel;
    QRLScLiquido2: TQRLabel;
    QRLabel93: TQRLabel;
    QRLRenda2: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRDBText69: TQRDBText;
    QRLQuebrados2: TQRLabel;
    QRLabel97: TQRLabel;
    QRLSaldoCliente2: TQRLabel;
    QRLabel98: TQRLabel;
    QRLSaldoClienteSCS2: TQRLabel;
    QRLabel99: TQRLabel;
    QRDBText70: TQRDBText;
    QRLTriguilho2: TQRLabel;
    QRLabel100: TQRLabel;
    QRLTotalDescontos2: TQRLabel;
    QRLabel110: TQRLabel;
    QRDBText71: TQRDBText;
    QRLabel112: TQRLabel;
    QRDBText73: TQRDBText;
    QRDBText72: TQRDBText;
    QRLabel111: TQRLabel;
    QRDBText74: TQRDBText;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRDBText75: TQRDBText;
    QRDBText76: TQRDBText;
    QRLabel104: TQRLabel;
    QRDBText77: TQRDBText;
    QRDBText78: TQRDBText;
    QRLabel105: TQRLabel;
    QRIPesagemEntrada1_1: TQRImage;
    QRIPesagemEntrada2_1: TQRImage;
    QRIPesagemEntrada1_2: TQRImage;
    QRIPesagemEntrada2_2: TQRImage;
    QRIPesagemSaida1_1: TQRImage;
    QRIPesagemSaida2_1: TQRImage;
    QRIPesagemSaida1_2: TQRImage;
    QRIPesagemSaida2_2: TQRImage;
    QRLabel106: TQRLabel;
    QRDBText79: TQRDBText;
    QRLabel107: TQRLabel;
    QRDBText80: TQRDBText;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    procedure incluiImagem;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPesagemEntradaSaidaEspelho: TFRPesagemEntradaSaidaEspelho;

implementation

uses URomaneioAgricola_cl, UPadraoProduto_cl, DB, UOracle_cl,
  UProdutoAgricola_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFRPesagemEntradaSaidaEspelho.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  wCodPadrao : String;
begin
  inherited;
  QRLpUmidade.Caption := FloatToStr(DMRomaneioAgricola.pUmidade);
  QRLpUmidade2.Caption := QRLpUmidade.Caption;

  with DMRomaneioAgricola do
  begin

    If QrRomEmissaoCOD_CONTRATO_VEND.Text <> '' Then
      wCodPadrao := DMOracle.Buscanome('SELECT COD_PADRAO_DESCONTO_PRODUTO FROM TB_CONTRATO_VEND','COD_CONTRATO_VEND = '+FloatToStr(QrRomEmissaoCOD_CONTRATO_VEND.Value))
    Else
      wCodPadrao := DMOracle.Buscanome('SELECT COD_PADRAO_DESCONTO_PRODUTO FROM TB_CONTRATO_PJURIDICA','COD_CONTRATO_PJURIDICA = '+FloatToStr(QrRomEmissaoCOD_CONTRATO_PJURIDICA.Value));

    If wCodPadrao <> '' Then
    Begin
      DMPadraoProduto.QPadraoDescontoProduto.Close;
      DMPadraoProduto.QPadraoDescontoProduto.SetVariable('Pk',wCodPadrao);
      DMPadraoProduto.QPadraoDescontoProduto.Open;
    End;

    DMProdutoAgricola.QProdutoAgricola.Close;
    DMProdutoAgricola.QProdutoAgricola.SetVariable('Pk', QrRomEmissaoCOD_PRODUTO.Value);
    DMProdutoAgricola.QProdutoAgricola.Open;


    if (FloatToStr(DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA.Value) <> '' ) and (wCodPadrao <> '') then
    begin
      If (QrRomEmissaoPerc_Impureza.value > DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA.Value) And
                (DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_DESCONTO.Value > 0) Then
        QRLpImpureza.Caption := FloatToStr(((QrRomEmissaoPerc_Impureza.value - DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_DESCONTO.Value / 100)* QrRomEmissaopesobalanca.Value)
      else if (QrRomEmissaoPerc_Impureza.value > DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA.Value) then
        QRLpImpureza.Caption := FloatToStr(((QrRomEmissaoPerc_Impureza.value - DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA.Value)  / 100)* QrRomEmissaopesobalanca.Value)
      else
        QRLpImpureza.Caption := '0';
    end
    else
    begin   //verificados se existem 
       If (QrRomEmissaoPerc_Impureza.value > DMProdutoAgricola.QProdutoAgricolaPERC_TOLERA_IMPUREZA.Value) And
                (DMProdutoAgricola.QProdutoAgricolaPERC_TOLERA_IMPUREZA.Value > 0) Then
        QRLpImpureza.Caption := FloatToStr(round(((QrRomEmissaoPerc_Impureza.value - DMProdutoAgricola.QProdutoAgricolaPERC_TOLERA_IMPUREZA.Value) * DMProdutoAgricola.QProdutoAgricolaPERC_TOLERA_IMPUREZA.Value / 100)* QrRomEmissaopesobalanca.Value))
      else if (QrRomEmissaoPerc_Impureza.value > DMProdutoAgricola.QProdutoAgricolaPERC_TOLERA_IMPUREZA.Value) then
        QRLpImpureza.Caption := FloatToStr(round(((QrRomEmissaoPerc_Impureza.value - DMProdutoAgricola.QProdutoAgricolaPERC_TOLERA_IMPUREZA.Value) / 100)* QrRomEmissaopesobalanca.Value))
      else
        QRLpImpureza.Caption := '0';
    end;

    if (FloatToStr(DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA.Value) <> '') and (wCodPadrao <> '') then
    begin
      If (QrRomEmissaoPerc_ardidos.Value > DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA.Value) And
                 (DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_DESCONTO.Value > 0) Then
        QRLArdidos.Caption := FloatToStr(round(((QrRomEmissaoPerc_ardidos.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_DESCONTO.Value / 100) * QrRomEmissaopesobalanca.Value))
      else if (QrRomEmissaoPerc_ardidos.Value > DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA.Value) then
        QRLArdidos.Caption :=  FloatToStr(round(((QrRomEmissaoPerc_ardidos.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA.Value) / 100) * QrRomEmissaopesobalanca.Value))
      else
        QRLArdidos.Caption := '0';

    end
    else
    begin
      If (QrRomEmissaoPERC_ARDIDOS.value > DMProdutoAgricola.QProdutoAgricolaPERC_TOLERA_ARDIDOS.Value) And
              (DMProdutoAgricola.QProdutoAgricolaPERC_TOLERA_ARDIDOS.Value > 0) Then
        QRLArdidos.Caption := FloatToStr(round(((QrRomEmissaoPerc_ardidos.Value - DMProdutoAgricola.QProdutoAgricolaPERC_TOLERA_ARDIDOS.Value) * DMProdutoAgricola.QProdutoAgricolaPERC_TOLERA_ARDIDOS.Value / 100)* QrRomEmissaopesobalanca.Value))
      else if (QrRomEmissaoPERC_ARDIDOS.value > DMProdutoAgricola.QProdutoAgricolaPERC_TOLERA_ARDIDOS.Value) then
        QRLArdidos.Caption := FloatToStr(round(((QrRomEmissaoPerc_ardidos.Value - DMProdutoAgricola.QProdutoAgricolaPERC_TOLERA_ARDIDOS.Value) / 100)* QrRomEmissaopesobalanca.Value))
      else
        QRLArdidos.Caption := '0';
    end;

    if (FloatToStr(DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA.Value) <> '') and (wCodPadrao <> '') then
    begin
      If (QrRomEmissaoPerc_Avariado.Value > DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA.Value) And
                (DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_DESCONTO.Value > 0) Then
         QRLAvariados.Caption := FloatToStr(round(((QrRomEmissaoPerc_Avariado.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_DESCONTO.Value / 100) * QrRomEmissaopesobalanca.Value))
      else if (QrRomEmissaoPerc_Avariado.Value > DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA.Value) then
         QRLAvariados.Caption := FloatToStr(round(((QrRomEmissaoPerc_Avariado.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA.Value) / 100) * QrRomEmissaopesobalanca.Value))
      else
         QRLAvariados.Caption := '0';
    end
    else
    begin
      If (QrRomEmissaoPerc_Avariado.value > DMProdutoAgricola.QProdutoAgricolaPERC_TOLERA_AVARIADO.Value) And
              (DMProdutoAgricola.QProdutoAgricolaPERC_TOLERA_AVARIADO.Value > 0) Then
        QRLAvariados.Caption := FloatToStr(round(((QrRomEmissaoPerc_Avariado.Value - DMProdutoAgricola.QProdutoAgricolaPERC_TOLERA_AVARIADO.Value) * DMProdutoAgricola.QProdutoAgricolaPERC_TOLERA_AVARIADO.Value / 100) * QrRomEmissaopesobalanca.Value))
      else if (QrRomEmissaoPerc_Impureza.value > DMProdutoAgricola.QProdutoAgricolaPERC_TOLERA_AVARIADO.Value) then
        QRLAvariados.Caption := FloatToStr(round(((QrRomEmissaoPerc_Avariado.Value - DMProdutoAgricola.QProdutoAgricolaPERC_TOLERA_AVARIADO.Value) / 100) * QrRomEmissaopesobalanca.Value))
      else
        QRLAvariados.Caption := '0';

    end;



    QRLArdidos2.Caption := QRLArdidos.Caption;
    QRLpImpureza2.Caption := QRLpImpureza.Caption;
    QRLAvariados2.Caption := QRLAvariados.Caption;

    QRLDescontos.Caption := Bib.NumToTexto(pTotalDescontos+pTriguilho,2,7);
    QRLDescontos2.Caption := QRLDescontos.Caption;

    QRLLiquido.Caption := Bib.NumToTexto(QrRomEmissaopesobalanca.Value - (pTotalDescontos + pTriguilho) - PRateio ,2,7);
    QRLLiquido2.Caption := QRLLiquido.Caption;

    if (DMParamSistema.CodEmpresa <> 'ITATIBA') then
    begin
      QRLSCLiquido.Caption :=  Bib.NumToTexto(((QrRomEmissaopesobalanca.Value - (pTotalDescontos + pTriguilho) - PRateio)/60),2,7) + ' Scs';
      QRLScLiquido2.Caption := QRLSCLiquido.Caption;
      QRLSaldoClienteScs.Caption := Bib.NumToTexto((QrRomEmissaopesobalanca.Value - (pTotalDescontos + pTriguilho) - PRateio)/60,2,7)+' Scs';
      QRLSaldoClienteSCS2.Caption := QRLSaldoClienteScs.Caption;
    end;

    QRLSaldoCliente.Caption := Bib.NumToTexto(QrRomEmissaopesobalanca.Value - (pTotalDescontos + pTriguilho) - PRateio ,2,7);
    QRLSaldoCliente2.Caption := QRLSaldoCliente.Caption;
    QRLRenda.Caption :=  Bib.NumToTexto(DMRomaneioAgricola.PRateio,2,7);
    QRLRenda2.Caption := QRLRenda.Caption;
    QRPesoBrutoSaca.Caption := Bib.NumToTexto(QrRomEmissaopesobalanca.Value/60,2,7)+ 'Scs';
    QRLPesoBrutoSaca2.Caption := QRPesoBrutoSaca.Caption;

    If QrRomEmissaoPERC_QUEBRADOS.Value <> 0 Then
      QRLQuebrados.Caption := Bib.NumToTexto(DMRomaneioAgricola.pQuebrados,0,5)
    else
      QRLQuebrados.Caption := '0';

    QRLQuebrados2.Caption := QRLQuebrados.Caption;

    If (QrRomEmissaoPERC_TRIGUILHO.Value > 0) Then
      QRLTriguilho.Caption :=Bib.NumToTexto(DMRomaneioAgricola.pTriguilho,1,3)
    else
      QRLTriguilho.Caption := '0';

    QRLTriguilho2.Caption := QRLTriguilho.Caption;

    QRLTotalDescontos.Caption := Bib.NumToTexto(DMRomaneioAgricola.pTotalDescontos+DMRomaneioAgricola.pTriguilho,0,5);
    QRLTotalDescontos2.Caption := QRLTotalDescontos.Caption;

    
    If QrRomEmissaoInd_Tipo_Romaneio.Value = 'PESAGEM EN' Then
    begin
      QRLabel3.Caption :=  'Pesagem entrada:';
      QRLabel54.Caption :=  'Pesagem entrada:';
      FRPesagemEntradaSaidaEspelho.Caption := 'Pesagem entrada';
    end;
    If QrRomEmissaoInd_Tipo_Romaneio.Value = 'PESAGEM SA' Then
    begin
      QRLabel3.Caption :=  'Pesagem saída:';
      QRLabel54.Caption :=  'Pesagem saída:';
      FRPesagemEntradaSaidaEspelho.Caption := 'Pesagem saida';
    end;
    If QrRomEmissaoInd_Tipo_Romaneio.Value = 'PESAGEM PA' Then
    begin
      QRLabel3.Caption :=  'Pesagem diversos:';
      QRLabel54.Caption :=  'Pesagem diversos:';
      FRPesagemEntradaSaidaEspelho.Caption := 'Pesagem diversos';
    end;
    if (DMRomaneioAgricola.pRateio <> 0) And (QrRomEmissaoCod_Cadastro.Value = QrRomEmissaoCod_Cadastro_Romaneio.Value) then
    begin
      QRLRenda.Enabled:= true;
      QRLRenda2.Enabled := true;
      QRLabel47.Enabled := true;
      QRLabel48.Enabled := true;
      QRLabel96.Enabled := true;
      QRLabel98.Enabled := true;

    end;
    QRLabel51.Caption := 'Empresa: ' + QrRomEmissaoDESC_FILIAL.Value;
  end;
  if DMParamSistema.CodEmpresa = 'BMG' then
  begin
    QRLabel103.Enabled := False; //linha assinatura
    QRLabel105.Enabled := False; //linha assinatura
    QRDBText76.Enabled := False; //nome cadastro
    QRDBText78.Enabled := False; //nome cadastro
    QRDBText73.Enabled := false; //desc observação
    QRLabel112.Enabled := false; // observação
    QRDBText37.Enabled := false; //desc observação
    QRLabel52.Enabled := false; // observação
    QRLabel106.Enabled := true; //linha assinatura
    QRDBText79.Enabled := true; //nome cadastro
    QRLabel107.Enabled := true; //linha assinatura
    QRDBText80.Enabled := true; //nome cadastro
    QRLabel71.Caption := 'NFE: ';
    QRLabel23.Caption := 'NFE: ';
  end;
  incluiImagem;
end;

procedure TFRPesagemEntradaSaidaEspelho.incluiImagem;
var
  jpegEntradaIMG1, jpegEntradaIMG2, jpegSaidaIMG1, jpegSaidaIMG2: tjpegimage;
  bufIEntradaIMG1, bufIEntradaIMG2, bufISaidaIMG1, bufISaidaIMG2: tmemorystream;
begin
  if DMParamSistema.QParamSistemaIND_CAMERA_PESAGEM_BALANCA.Value = 'S' then
  begin
    if (DMRomaneioAgricola.QrRomEmissaoIMG_PESAGEM_ENTRADA.Value <> '') or (DMRomaneioAgricola.QrRomEmissaoIMG_PESAGEM_ENTRADA_2.Value <> '') then
    begin
      try
        QRIPesagemEntrada1_1.Visible := True;
        QRIPesagemEntrada1_2.Visible := True;
        QRIPesagemSaida2_1.Visible   := True;
        QRIPesagemSaida2_2.Visible   := True;

        jpegEntradaIMG1 := TJpegImage.Create;
        jpegEntradaIMG2 := TJpegImage.Create;

        bufIEntradaIMG1 := Tmemorystream.Create;
        bufIEntradaIMG2 := Tmemorystream.Create;

        DMRomaneioAgricola.QrRomEmissaoIMG_PESAGEM_ENTRADA.SaveToStream(bufIEntradaIMG1);
        DMRomaneioAgricola.QrRomEmissaoIMG_PESAGEM_ENTRADA_2.SaveToStream(bufIEntradaIMG2);

        bufIEntradaIMG1.Position:=0;
        bufIEntradaIMG2.Position:=0;

        jpegEntradaIMG1.LoadFromStream(bufIEntradaIMG1);
        jpegEntradaIMG2.LoadFromStream(bufIEntradaIMG2);

        QRIPesagemEntrada1_1.Picture.Assign(jpegEntradaIMG1);
        QRIPesagemEntrada1_2.Picture.Assign(jpegEntradaIMG1);
        QRIPesagemEntrada2_1.Picture.Assign(jpegEntradaIMG2);
        QRIPesagemEntrada2_2.Picture.Assign(jpegEntradaIMG2);

      finally
        bufIEntradaIMG1.free;
        bufIEntradaIMG2.Free;

        jpegEntradaIMG1.free;
        jpegEntradaIMG2.Free;
      end;
    end
    else // else imagem pesagem entrada
    begin
      QRIPesagemEntrada1_1.Picture := Nil;
      QRIPesagemEntrada1_2.Picture := Nil;
      QRIPesagemEntrada2_1.Picture := Nil;
      QRIPesagemEntrada2_2.Picture := Nil;
    end;

    if (DMRomaneioAgricola.QrRomEmissaoIMG_PESAGEM_SAIDA.Value <> '') or (DMRomaneioAgricola.QrRomEmissaoIMG_PESAGEM_SAIDA_2.Value <> '') then
    begin
      try
        QRIPesagemSaida1_1.Visible   := True;
        QRIPesagemSaida1_2.Visible   := True;
        QRIPesagemSaida2_1.Visible   := True;
        QRIPesagemSaida2_2.Visible   := True;

        jpegSaidaIMG1   := TJpegImage.Create;
        jpegSaidaIMG2   := TJpegImage.Create;

        bufISaidaIMG1   := Tmemorystream.Create;
        bufISaidaIMG2   := Tmemorystream.Create;

        DMRomaneioAgricola.QrRomEmissaoIMG_PESAGEM_SAIDA.SaveToStream(bufISaidaIMG1);
        DMRomaneioAgricola.QrRomEmissaoIMG_PESAGEM_SAIDA_2.SaveToStream(bufISaidaIMG2);

        bufISaidaIMG1.Position  :=0;
        bufISaidaIMG2.Position  :=0;

        jpegSaidaIMG1.LoadFromSTream(bufISaidaIMG1);
        jpegSaidaIMG2.LoadFromSTream(bufISaidaIMG2);

        QRIPesagemSaida1_1.Picture.Assign(jpegSaidaIMG1);
        QRIPesagemSaida1_2.Picture.Assign(jpegSaidaIMG1);
        QRIPesagemSaida2_1.Picture.Assign(jpegSaidaIMG2);
        QRIPesagemSaida2_2.Picture.Assign(jpegSaidaIMG2);
      finally
        bufISaidaIMG1.free;
        bufISaidaIMG2.Free;

        jpegSaidaIMG1.Free;
        jpegSaidaIMG2.Free;
      end;
    end
    else //else imagem pesagem saida
    begin
      QRIPesagemSaida1_1.Picture := Nil;
      QRIPesagemSaida1_2.Picture := Nil;
      QRIPesagemSaida2_1.Picture := Nil;
      QRIPesagemSaida2_2.Picture := Nil;
    end;
  end;
end;



procedure TFRPesagemEntradaSaidaEspelho.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
// Solicitado por Dana da Pedreira Itatiba para que não apareça a NF de produtor. Alex 13/05/2022
  if (DMParamSistema.CodEmpresa = 'ITATIBA') then
  begin
    QRLabel23.Enabled := false;
    QRDBText23.Enabled := false;
    QRLabel71.Enabled := false;
    QRDBText57.Enabled := false;
  end; {
  if (DMParamSistema.QParamSistemaDESC_EMPRESA.Value = 'FAZENDA ESPIGAO') then
  begin
    QRDBText26.Enabled:= false;
    QRDBText28.Enabled:= false;
    QRDBText61.Enabled:= false;
    QRDBText64.Enabled:= false;
    QRLabel103.Top := 555;
    QRDBText76.Top := 575;

    QRLabel53.Enabled  := false;
    QRLabel51.Enabled  := false;
    QRLabel54.Enabled  := false;
    QRDBText36.Enabled := false;
    QRLabel55.Enabled  := false;
    QRDBText38.Enabled := false;
    QRLabel56.Enabled  := false;
    QRDBText39.Enabled := false;
    QRLabel57.Enabled  := false;
    QRDBText40.Enabled := false;

  end;}
end;

end.
