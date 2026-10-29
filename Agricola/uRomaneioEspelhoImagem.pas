unit uRomaneioEspelhoImagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, UBiblioteca, jpeg;


type
  TfrRomaneioEspelhoImagem = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText27: TQRDBText;
    QRLpUmidade: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel33: TQRLabel;
    QRLpImpureza: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText29: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRLArdidos: TQRLabel;
    QRLAvariados: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel35: TQRLabel;
    QRLDescontos: TQRLabel;
    QRLabel40: TQRLabel;
    QRLLiquido: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLSaldoCliente: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLRenda: TQRLabel;
    QRLSCLiquido: TQRLabel;
    QRLabel48: TQRLabel;
    QRLSaldoClienteScs: TQRLabel;
    QRDBText33: TQRDBText;
    QRLQuebrados: TQRLabel;
    QRDBText34: TQRDBText;
    QRLTriguilho: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRDBText35: TQRDBText;
    QRLTotalDescontos: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel51: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel52: TQRLabel;
    QRDBText37: TQRDBText;
    QRPesoBrutoSaca: TQRLabel;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRDBText68: TQRDBText;
    QRDBText81: TQRDBText;
    QRDBText85: TQRDBText;
    QRLabel88: TQRLabel;
    QRLabel95: TQRLabel;
    QRDBText86: TQRDBText;
    QRImgCam1_Entrada: TQRImage;
    QRImgCam2_Entrada: TQRImage;
    QRImgCam2_Saida: TQRImage;
    QRImgCam1_Saida: TQRImage;
    QRLabel53: TQRLabel;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    procedure incluiImagem;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frRomaneioEspelhoImagem: TfrRomaneioEspelhoImagem;

implementation

uses URomaneioAgricola_cl, UPadraoProduto_cl, UOracle_cl, URomaneioRel_cl,
  UProdutoAgricola_cl, UPesagemEntradaSaidaEspelho, UParamSistema_cl;

{$R *.dfm}

procedure TfrRomaneioEspelhoImagem.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  wCodPadrao : String;
  vLiquido, vLiquidoRateio, vQtRateio: real;

begin
  inherited;

  with DMRomaneioAgricola, DMRomaneioRel, DMProdutoAgricola, DMPadraoProduto do
  begin

    If QrRomEmissaoCOD_CONTRATO_VEND.Text <> '' Then
      wCodPadrao := DMOracle.Buscanome('SELECT COD_PADRAO_DESCONTO_PRODUTO FROM TB_CONTRATO_VEND','COD_CONTRATO_VEND = '+FloatToStr(QrRomEmissaoCOD_CONTRATO_VEND.Value))
    Else
      wCodPadrao := DMOracle.Buscanome('SELECT COD_PADRAO_DESCONTO_PRODUTO FROM TB_CONTRATO_PJURIDICA','COD_CONTRATO_PJURIDICA = '+FloatToStr(QrRomEmissaoCOD_CONTRATO_PJURIDICA.Value));

    If wCodPadrao <> '' Then
    Begin
      QPadraoDescontoProduto.Close;
      QPadraoDescontoProduto.SetVariable('Pk',wCodPadrao);
      QPadraoDescontoProduto.Open;
    End;

    QProdutoAgricola.Close;
    QProdutoAgricola.SetVariable('Pk', QREmissaoRomaneioCOD_PRODUTO.Value);
    QProdutoAgricola.Open;


    if (FloatToStr(QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA.Value) <> '' ) and (wCodPadrao <> '') then
    begin
      If (QREmissaoRomaneioPERC_IMPUREZA.Value > QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA.Value) And
                (QPadraoDescontoProdutoNUM_IMPUREZA_DESCONTO.Value > 0) Then
        QRLpImpureza.Caption := FloatToStr(((QREmissaoRomaneioPERC_IMPUREZA.value - QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA.Value) * QPadraoDescontoProdutoNUM_IMPUREZA_DESCONTO.Value / 100)* QREmissaoRomaneioPESOBALANCA.Value)
      else if (QREmissaoRomaneioPERC_IMPUREZA.value > QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA.Value) then
        QRLpImpureza.Caption := FloatToStr(((QREmissaoRomaneioPERC_IMPUREZA.value - QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA.Value)  / 100)* QREmissaoRomaneioPESOBALANCA.Value)
      else
        QRLpImpureza.Caption := '0';
    end
    else
    begin
       If (QREmissaoRomaneioPERC_IMPUREZA.value > QREmissaoRomaneioPERC_TOLERA_IMPUREZA.Value) Then
        QRLpImpureza.Caption := FloatToStr(round(((QREmissaoRomaneioPERC_IMPUREZA.value - QREmissaoRomaneioPERC_TOLERA_IMPUREZA.Value) / 100)* QREmissaoRomaneioPESOBALANCA.Value))
      else
        QRLpImpureza.Caption := '0';
    end;

    if (FloatToStr(QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA.Value) <> '') and (wCodPadrao <> '') then
    begin
      If (QREmissaoRomaneioPERC_ARDIDOS.value > QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA.Value) And
                 (QPadraoDescontoProdutoNUM_ARDIDOS_DESCONTO.Value > 0) Then
        QRLArdidos.Caption := FloatToStr(round(((QREmissaoRomaneioPERC_ARDIDOS.value - QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA.Value) * QPadraoDescontoProdutoNUM_ARDIDOS_DESCONTO.Value / 100) * QREmissaoRomaneioPESOBALANCA.Value))
      else if (QREmissaoRomaneioPERC_ARDIDOS.value > QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA.Value) then
        QRLArdidos.Caption :=  FloatToStr(round(((QREmissaoRomaneioPERC_ARDIDOS.value - QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA.Value) / 100) * QREmissaoRomaneioPESOBALANCA.Value))
      else
        QRLArdidos.Caption := '0';

    end
    else
    begin
      If (QREmissaoRomaneioPERC_ARDIDOS.value > QREmissaoRomaneioPERC_TOLERA_ARDIDOS.Value) Then
        QRLArdidos.Caption := FloatToStr(round(((QREmissaoRomaneioPERC_ARDIDOS.value - QREmissaoRomaneioPERC_TOLERA_ARDIDOS.Value) / 100)* QREmissaoRomaneioPESOBALANCA.value))
      else
        QRLArdidos.Caption := '0';
    end;

    if (FloatToStr(QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA.Value) <> '') and (wCodPadrao <> '') then
    begin
      If (QREmissaoRomaneioPERC_AVARIADO.value > QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA.Value) And
                (QPadraoDescontoProdutoNUM_AVARIADO_DESCONTO.Value > 0) Then
         QRLAvariados.Caption := FloatToStr(round(((QREmissaoRomaneioPERC_AVARIADO.value - QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA.Value) * QPadraoDescontoProdutoNUM_AVARIADO_DESCONTO.Value / 100) * QREmissaoRomaneioPESOBALANCA.value))
      else if (QREmissaoRomaneioPERC_AVARIADO.value > QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA.Value) then
         QRLAvariados.Caption := FloatToStr(round(((QREmissaoRomaneioPERC_AVARIADO.value - QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA.Value) / 100) * QREmissaoRomaneioPESOBALANCA.value))
      else
         QRLAvariados.Caption := '0';
    end
    else
    begin
      If (QREmissaoRomaneioPERC_AVARIADO.value > QREmissaoRomaneioPERC_TOLERA_AVARIADO.Value) Then
        QRLAvariados.Caption := FloatToStr(round(((QREmissaoRomaneioPERC_AVARIADO.value - QREmissaoRomaneioPERC_TOLERA_AVARIADO.Value) / 100) * QREmissaoRomaneioPESOBALANCA.value))
      else
        QRLAvariados.Caption := '0';
    end;

    pAvariados := StrToFloat(QRLAvariados.Caption);
    pArdidos := StrToFloat(QRLArdidos.Caption);
    pImpureza := StrToFloat(QRLpImpureza.Caption);
    pTriguilho := (QREmissaoRomaneioPERC_TRIGUILHO.Value/100)*QREmissaoRomaneioPESOBALANCA.Value;
    pQuebrados := (QREmissaoRomaneioPERC_QUEBRADOS.Value/100)*QREmissaoRomaneioPESOBALANCA.Value;


      QRLpUmidade.Caption :=  Bib.NumToTexto(DMRomaneioRel.QREmissaoRomaneioPESOBALANCA.Value*(DMRomaneioRel.QREmissaoRomaneioPERC_DESCONTO.Value/100),0,5);
      QREmissaoRomaneioDESCONTOS.Value :=  (DMRomaneioRel.QREmissaoRomaneioPESOBALANCA.Value*(DMRomaneioRel.QREmissaoRomaneioPERC_DESCONTO.Value/100)
                        + pTriguilho
                        + pImpureza
                        + pAvariados
                        + pArdidos);

      QREmissaoRomaneioPESO_LIQUIDO.Value := QREmissaoRomaneioPESOBALANCA.Value - QREmissaoRomaneioDESCONTOS.Value;
//Adicionado para aparecer as casas decimais para a Stein. Alex 23/06/2022
    if (DMParamSistema.CodEmpresa = 'STEIN') then
    begin
      QRLLiquido.Caption := FloatToStr(QREmissaoRomaneioPESO_LIQUIDO.Value);
      QRLSCLiquido.Caption :=  Bib.NumToTexto(QREmissaoRomaneioPESO_LIQUIDO.Value/60,2,7) + ' Scs';
    end
    else
    begin
      QRLLiquido.Caption := Bib.NumToTexto(QREmissaoRomaneioPESO_LIQUIDO.Value,0,7);
      QRLSCLiquido.Caption :=  Bib.NumToTexto(QREmissaoRomaneioPESO_LIQUIDO.Value/60,2,7) + ' Scs';
    end;

                             //- PRateio retirado da linha de baixo César

      QRLDescontos.Caption := Bib.NumToTexto(QREmissaoRomaneioDESCONTOS.Value,0,7);


        //Caso emissão de momaneio e o cadastro for igual ao romaneio
    if DMRomaneioRel.QREmissaoRomaneioCOD_CADASTRO_ROMANEIO.Value = DMRomaneioRel.QREmissaoRomaneioCOD_CADASTRO.Value then // Romaneio principal
    begin
      vQtRateio := (QREmissaoRomaneioPESO_LIQUIDO.Value * (1-(QREmissaoRomaneioPERC_RATEIO.Value)/100));
      QRLRenda.Caption :=  Bib.NumToTexto(vQtRateio,2,7);

      //Adicionado para aparecer as casas decimais para a Stein. Alex 23/06/2022
      if (DMParamSistema.CodEmpresa = 'STEIN') then
      begin
        QRLSaldoCliente.Caption := FloatToStr(QREmissaoRomaneioPESO_LIQUIDO.Value - vQtRateio);
        QRLSaldoClienteScs.Caption := Bib.NumToTexto((QREmissaoRomaneioPESO_LIQUIDO.Value - vQtRateio)/60,2,7)+' Scs';
      end
      else
      begin
        QRLSaldoCliente.Caption := Bib.NumToTexto(QREmissaoRomaneioPESO_LIQUIDO.Value - vQtRateio,0,7);
        QRLSaldoClienteScs.Caption := Bib.NumToTexto((QREmissaoRomaneioPESO_LIQUIDO.Value - vQtRateio)/60,2,7)+' Scs';
      end;
        QRPesoBrutoSaca.Caption := Bib.NumToTexto(QREmissaoRomaneioPESOBALANCA.Value/60,2,7)+ 'Scs';
    End
    Else
    begin     // se for rateio
       vQtRateio := QREmissaoRomaneioPESO_LIQUIDO.Value * (QREmissaoRomaneioPERC_RATEIO.Value/100);
       QRLRenda.Caption :=  '';
       QRLSaldoCliente.Caption := Bib.NumToTexto(vQtRateio,0,7);
       QRLSaldoClienteScs.Caption := Bib.NumToTexto(vQtRateio /60,2,7)+' Scs';
       QRPesoBrutoSaca.Caption := Bib.NumToTexto(QREmissaoRomaneioPESOBALANCA.Value / 60,2,7)+ 'Scs';

     End;
    If QREmissaoRomaneioPERC_QUEBRADOS.Value <> 0 Then
      QRLQuebrados.Caption := Bib.NumToTexto((QREmissaoRomaneioPERC_QUEBRADOS.Value/100)*QREmissaoRomaneioPESOBALANCA.Value,0,5)
    else
      QRLQuebrados.Caption := '0';

    If (QREmissaoRomaneioPERC_TRIGUILHO.Value > 0) Then
      QRLTriguilho.Caption :=Bib.NumToTexto((QREmissaoRomaneioPERC_TRIGUILHO.Value/100)*QREmissaoRomaneioPESOBALANCA.Value,1,3)
    else
      QRLTriguilho.Caption := '0';
      QRLTotalDescontos.Caption := Bib.NumToTexto(QREmissaoRomaneioDESCONTOS.Value,0,5);
      QREmissaoRomaneioDESC_MENSAGEM.Value := DMOracle.BuscaNome('SELECT DESC_MENSAGEM FROM TB_MENSAGEM','COD_MENSAGEM = ' +FloatToStr(QREmissaoRomaneioCOD_MENSAGEM.VALUE),True);

    If QREmissaoRomaneioIND_TIPO_ROMANEIO.Value = 'PESAGEM EN' Then
    begin
      QRLabel3.Caption :=  'Pesagem entrada:';
      FRPesagemEntradaSaidaEspelho.Caption := 'Pesagem entrada';
    end;
    If QREmissaoRomaneioIND_TIPO_ROMANEIO.Value = 'PESAGEM SA' Then
    begin
      QRLabel3.Caption :=  'Pesagem saída:';
      FRPesagemEntradaSaidaEspelho.Caption := 'Pesagem saida';
    end;
    If QREmissaoRomaneioIND_TIPO_ROMANEIO.Value = 'PESAGEM PA' Then
    begin
      QRLabel3.Caption :=  'Pesagem diversos:';
      FRPesagemEntradaSaidaEspelho.Caption := 'Pesagem diversos';
    end;
    if (vQtRateio <> 0) And (QREmissaoRomaneioCOD_CADASTRO.Value = QREmissaoRomaneioCOD_CADASTRO_ROMANEIO.Value) then
      begin
        QRLRenda.Enabled:= true;
        QRLabel47.Enabled := true;
        QRLabel48.Enabled := true;
      end
    Else
      begin
        QRLRenda.Enabled:= False;
        QRLabel47.Enabled := False;
        QRLabel48.Enabled := False;
      end;

  end;
 incluiImagem;
end;

procedure TfrRomaneioEspelhoImagem.incluiImagem;
var
  jpegCam1Entrada, jpegCam2Entrada, jpegCam1Saida, jpegCam2Saida: tjpegimage;
  bufCam1Entrada, bufCam2Entrada, bufCam1Saida, bufCam2Saida: tmemorystream;
begin
  if (DMRomaneioRel.QREmissaoRomaneioIMG_PESAGEM_ENTRADA.Value <> '') or (DMRomaneioRel.QREmissaoRomaneioIMG_PESAGEM_ENTRADA_2.Value <> '') then
  begin
    try
      jpegCam1Entrada := TJpegImage.Create;
      jpegCam2Entrada := TJpegImage.Create;

      bufCam1Entrada := Tmemorystream.Create;
      bufCam2Entrada := Tmemorystream.Create;

      DMRomaneioRel.QREmissaoRomaneioIMG_PESAGEM_ENTRADA.SaveToStream(bufCam1Entrada);
      DMRomaneioRel.QREmissaoRomaneioIMG_PESAGEM_ENTRADA_2.SaveToStream(bufCam2Entrada);

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

  if (DMRomaneioRel.QREmissaoRomaneioIMG_PESAGEM_SAIDA.Value <> '') or (DMRomaneioRel.QREmissaoRomaneioIMG_PESAGEM_SAIDA_2.Value <> '') then
  begin
    try

      jpegCam1Saida   := TJpegImage.Create;
      jpegCam2Saida   := TJpegImage.Create;

      bufCam1Saida   := Tmemorystream.Create;
      bufCam2Saida   := Tmemorystream.Create;

      DMRomaneioRel.QREmissaoRomaneioIMG_PESAGEM_SAIDA.SaveToStream(bufCam1Saida);
      DMRomaneioRel.QREmissaoRomaneioIMG_PESAGEM_SAIDA_2.SaveToStream(bufCam2Saida);

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
