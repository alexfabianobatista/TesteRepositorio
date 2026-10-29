unit UPesagemEntradaSaidaEspelhoImagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRCtrls, QRExport, QRWebFilt, QRPDFFilt, QuickRpt,
  ExtCtrls, UBiblioteca, jpeg;


type
  TFRPesagemEntradaSaidaEspelhoImagem = class(TFTRelSimples)
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel9: TQRLabel;
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
    QRLabel10: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel33: TQRLabel;
    QRLpUmidade: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText29: TQRDBText;
    QRLpImpureza: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel38: TQRLabel;
    QRPesoBrutoSaca: TQRLabel;
    QRLabel39: TQRLabel;
    QRDBText31: TQRDBText;
    QRLArdidos: TQRLabel;
    QRLabel40: TQRLabel;
    QRLDescontos: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRDBText32: TQRDBText;
    QRLAvariados: TQRLabel;
    QRLabel43: TQRLabel;
    QRLLiquido: TQRLabel;
    QRLabel44: TQRLabel;
    QRLSCLiquido: TQRLabel;
    QRLabel47: TQRLabel;
    QRLRenda: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText33: TQRDBText;
    QRLQuebrados: TQRLabel;
    QRLabel49: TQRLabel;
    QRLSaldoCliente: TQRLabel;
    QRLabel50: TQRLabel;
    QRLSaldoClienteScs: TQRLabel;
    QRLabel51: TQRLabel;
    QRDBText34: TQRDBText;
    QRLTriguilho: TQRLabel;
    QRLabel52: TQRLabel;
    QRLTotalDescontos: TQRLabel;
    QRLabel53: TQRLabel;
    QRDBText35: TQRDBText;
    QRLabel54: TQRLabel;
    QRDBText37: TQRDBText;
    QRDBText74: TQRDBText;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRDBText75: TQRDBText;
    QRDBText76: TQRDBText;
    QRImgCam1_Entrada: TQRImage;
    QRImgCam2_Entrada: TQRImage;
    QRImgCam2_Saida: TQRImage;
    QRImgCam1_Saida: TQRImage;
    QRDBText36: TQRDBText;
    QRLabel3: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure incluiImagem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPesagemEntradaSaidaEspelhoImagem: TFRPesagemEntradaSaidaEspelhoImagem;

implementation

uses URomaneioAgricola_cl, UPadraoProduto_cl, DB, UOracle_cl,
  UProdutoAgricola_cl, UParamSistema_cl;


{$R *.dfm}

procedure TFRPesagemEntradaSaidaEspelhoImagem.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  wCodPadrao : String;
begin
  inherited;
  QRLpUmidade.Caption := FloatToStr(DMRomaneioAgricola.pUmidade);

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

    QRLDescontos.Caption := Bib.NumToTexto(pTotalDescontos+pTriguilho,2,7);

    QRLLiquido.Caption := Bib.NumToTexto(QrRomEmissaopesobalanca.Value - (pTotalDescontos + pTriguilho) - PRateio ,2,7);

    if (DMParamSistema.CodEmpresa <> 'ITATIBA') then
    begin
      QRLSCLiquido.Caption :=  Bib.NumToTexto(((QrRomEmissaopesobalanca.Value - (pTotalDescontos + pTriguilho) - PRateio)/60),2,7) + ' Scs';
      QRLSaldoClienteScs.Caption := Bib.NumToTexto((QrRomEmissaopesobalanca.Value - (pTotalDescontos + pTriguilho) - PRateio)/60,2,7)+' Scs';
    end;

    QRLSaldoCliente.Caption := Bib.NumToTexto(QrRomEmissaopesobalanca.Value - (pTotalDescontos + pTriguilho) - PRateio ,2,7);
    QRLRenda.Caption :=  Bib.NumToTexto(DMRomaneioAgricola.PRateio,2,7);
    QRPesoBrutoSaca.Caption := Bib.NumToTexto(QrRomEmissaopesobalanca.Value/60,2,7)+ 'Scs';

    If QrRomEmissaoPERC_QUEBRADOS.Value <> 0 Then
      QRLQuebrados.Caption := Bib.NumToTexto(DMRomaneioAgricola.pQuebrados,0,5)
    else
      QRLQuebrados.Caption := '0';

    If (QrRomEmissaoPERC_TRIGUILHO.Value > 0) Then
      QRLTriguilho.Caption :=Bib.NumToTexto(DMRomaneioAgricola.pTriguilho,1,3)
    else
      QRLTriguilho.Caption := '0';


    QRLTotalDescontos.Caption := Bib.NumToTexto(DMRomaneioAgricola.pTotalDescontos+DMRomaneioAgricola.pTriguilho,0,5);

    
    If QrRomEmissaoInd_Tipo_Romaneio.Value = 'PESAGEM EN' Then
    begin
      QRLabel6.Caption :=  'Pesagem entrada:';
      FRPesagemEntradaSaidaEspelhoImagem.Caption := 'Pesagem entrada';
    end;
    If QrRomEmissaoInd_Tipo_Romaneio.Value = 'PESAGEM SA' Then
    begin
      QRLabel6.Caption :=  'Pesagem saída:';
      FRPesagemEntradaSaidaEspelhoImagem.Caption := 'Pesagem saida';
    end;
    If QrRomEmissaoInd_Tipo_Romaneio.Value = 'PESAGEM PA' Then
    begin
      QRLabel6.Caption :=  'Pesagem diversos:';
      FRPesagemEntradaSaidaEspelhoImagem.Caption := 'Pesagem diversos';
    end;
    if (DMRomaneioAgricola.pRateio <> 0) And (QrRomEmissaoCod_Cadastro.Value = QrRomEmissaoCod_Cadastro_Romaneio.Value) then
    begin
      QRLRenda.Enabled:= true;
      QRLabel47.Enabled := true;
      QRLabel48.Enabled := true;

    end;
    QRLabel51.Caption := 'Empresa: ' + QrRomEmissaoDESC_FILIAL.Value;
  end;

incluiImagem;
end;

procedure TFRPesagemEntradaSaidaEspelhoImagem.incluiImagem;
var
  jpegCam1Entrada, jpegCam2Entrada, jpegCam1Saida, jpegCam2Saida: tjpegimage;
  bufCam1Entrada, bufCam2Entrada, bufCam1Saida, bufCam2Saida: tmemorystream;
begin
  if (DMRomaneioAgricola.QrRomEmissaoIMG_PESAGEM_ENTRADA.Value <> '') or (DMRomaneioAgricola.QrRomEmissaoIMG_PESAGEM_ENTRADA_2.Value <> '') then
  begin
    try
      jpegCam1Entrada := TJpegImage.Create;
      jpegCam2Entrada := TJpegImage.Create;

      bufCam1Entrada := Tmemorystream.Create;
      bufCam2Entrada := Tmemorystream.Create;

      DMRomaneioAgricola.QrRomEmissaoIMG_PESAGEM_ENTRADA.SaveToStream(bufCam1Entrada);
      DMRomaneioAgricola.QrRomEmissaoIMG_PESAGEM_ENTRADA_2.SaveToStream(bufCam2Entrada);

      bufCam1Entrada.Position:=0;
      bufCam2Entrada.Position:=0;

      jpegCam1Entrada.LoadFromStream(bufCam1Entrada);
      jpegCam2Entrada.LoadFromStream(bufCam2Entrada);

      QRImgCam1_Entrada.Picture.Assign(jpegCam1Entrada);
      QRImgCam2_Entrada.Picture.Assign(jpegCam2Entrada);


      finally
        bufCam1Entrada.free;
        bufCam2Entrada.Free;

        jpegCam1Entrada.free;
        jpegCam2Entrada.Free;
      end;
  end
  else // else imagem pesagem entrada
  begin
    QRImgCam1_Entrada.Picture := Nil;
    QRImgCam2_Entrada.Picture := Nil;
  end;

  if (DMRomaneioAgricola.QrRomEmissaoIMG_PESAGEM_SAIDA.Value <> '') or (DMRomaneioAgricola.QrRomEmissaoIMG_PESAGEM_SAIDA_2.Value <> '') then
  begin
    try

      jpegCam1Saida   := TJpegImage.Create;
      jpegCam2Saida   := TJpegImage.Create;

      bufCam1Saida   := Tmemorystream.Create;
      bufCam2Saida   := Tmemorystream.Create;

      DMRomaneioAgricola.QrRomEmissaoIMG_PESAGEM_SAIDA.SaveToStream(bufCam1Saida);
      DMRomaneioAgricola.QrRomEmissaoIMG_PESAGEM_SAIDA_2.SaveToStream(bufCam2Saida);

      bufCam1Saida.Position  :=0;
      bufCam2Saida.Position  :=0;

      jpegCam1Saida.LoadFromSTream(bufCam1Saida);
      jpegCam2Saida.LoadFromSTream(bufCam2Saida);

      QRImgCam1_Saida.Picture.Assign(jpegCam1Saida);
      QRImgCam2_Saida.Picture.Assign(jpegCam2Saida);
    finally
      bufCam1Saida.free;
      bufCam2Saida.Free;

      jpegCam1Saida.Free;
      jpegCam2Saida.Free;
    end;
  end
  else //else imagem pesagem saida
  begin
    QRImgCam1_Saida.Picture := Nil;
    QRImgCam2_Saida.Picture := Nil;
  end;
end;

end.
