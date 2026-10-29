unit URRomaneioEmissaoEspelho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, UBiblioteca, grimgctrl;

type
  TFRRomaneioEmissaoEspelho = class(TFTRelSimples)
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
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel55: TQRLabel;
    QRDBText39: TQRDBText;
    QRLabel56: TQRLabel;
    QRDBText40: TQRDBText;
    QRLabel57: TQRLabel;
    QRDBText41: TQRDBText;
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
    QRDBText60: TQRDBText;
    QRLabel76: TQRLabel;
    QRDBText61: TQRDBText;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLpUmidade2: TQRLabel;
    QRLabel82: TQRLabel;
    QRDBText63: TQRDBText;
    QRLabel83: TQRLabel;
    QRLPesoBrutoSaca2: TQRLabel;
    QRDBText64: TQRDBText;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLpImpureza2: TQRLabel;
    QRLArdidos2: TQRLabel;
    QRLabel89: TQRLabel;
    QRDBText67: TQRDBText;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLDescontos2: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLAvariados2: TQRLabel;
    QRLabel96: TQRLabel;
    QRLRenda2: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLQuebrados2: TQRLabel;
    QRLabel102: TQRLabel;
    QRLSaldoCliente2: TQRLabel;
    QRLabel104: TQRLabel;
    QRLSaldoClienteSCS2: TQRLabel;
    QRLabel106: TQRLabel;
    QRLTriguilho2: TQRLabel;
    QRLabel108: TQRLabel;
    QRLTotalDescontos2: TQRLabel;
    QRLabel110: TQRLabel;
    QRDBText71: TQRDBText;
    QRLabel111: TQRLabel;
    QRDBText72: TQRDBText;
    QRLabel112: TQRLabel;
    QRDBText73: TQRDBText;
    QRLabel113: TQRLabel;
    QRLabel92: TQRLabel;
    QRLLiquido2: TQRLabel;
    QRLabel116: TQRLabel;
    QRLScLiquido2: TQRLabel;
    QRLabel81: TQRLabel;
    QRDBText74: TQRDBText;
    QRDBText79: TQRDBText;
    QRDBText80: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRDBText68: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRDBText75: TQRDBText;
    QRDBText76: TQRDBText;
    QRDBText77: TQRDBText;
    QRDBText78: TQRDBText;
    QRDBText81: TQRDBText;
    QRDBText82: TQRDBText;
    QRDBText83: TQRDBText;
    QRDBText84: TQRDBText;
    QRLabel84: TQRLabel;
    QRLabel87: TQRLabel;
    QRDBText85: TQRDBText;
    QRLabel88: TQRLabel;
    QRLabel95: TQRLabel;
    QRDBText86: TQRDBText;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    QRHRule3: TQRHRule;
    QRHRule4: TQRHRule;
    QRDBText87: TQRDBText;
    QRDBText88: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRomaneioEmissaoEspelho: TFRRomaneioEmissaoEspelho;

implementation

uses URomaneioAgricola_cl, UPadraoProduto_cl, UOracle_cl, URomaneioRel_cl,
  UProdutoAgricola_cl, UPesagemEntradaSaidaEspelho, UParamSistema_cl;

{$R *.dfm}

procedure TFRRomaneioEmissaoEspelho.QRBand1BeforePrint(
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

    QRLArdidos2.Caption := QRLArdidos.Caption;
    QRLpImpureza2.Caption := QRLpImpureza.Caption;
    QRLAvariados2.Caption := QRLAvariados.Caption;

    QRLpUmidade.Caption :=  Bib.NumToTexto(DMRomaneioRel.QREmissaoRomaneioPESOBALANCA.Value*(DMRomaneioRel.QREmissaoRomaneioPERC_DESCONTO.Value/100),0,5);
    QRLpUmidade2.Caption := QRLpUmidade.Caption;

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

    QRLLiquido2.Caption := QRLLiquido.Caption;                          //- PRateio retirado da linha de baixo César
    QRLScLiquido2.Caption := QRLSCLiquido.Caption;
    QRLDescontos.Caption := Bib.NumToTexto(QREmissaoRomaneioDESCONTOS.Value,0,7);
    QRLDescontos2.Caption := QRLDescontos.Caption;

    //Caso emissão de momaneio e o cadastro for igual ao romaneio
    if DMRomaneioRel.QREmissaoRomaneioCOD_CADASTRO_ROMANEIO.Value = DMRomaneioRel.QREmissaoRomaneioCOD_CADASTRO.Value then // Romaneio principal
    begin
      vQtRateio := (QREmissaoRomaneioPESO_LIQUIDO.Value * (1-(QREmissaoRomaneioPERC_RATEIO.Value)/100));
      QRLRenda.Caption :=  Bib.NumToTexto(vQtRateio,2,7);
      QRLRenda2.Caption := QRLRenda.Caption;
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

      QRLSaldoCliente2.Caption := QRLSaldoCliente.Caption;
      QRLSaldoClienteSCS2.Caption := QRLSaldoClienteScs.Caption;
      QRLSaldoClienteSCS2.Caption := QRLSaldoClienteScs.Caption;
      QRPesoBrutoSaca.Caption := Bib.NumToTexto(QREmissaoRomaneioPESOBALANCA.Value/60,2,7)+ 'Scs';
      QRLPesoBrutoSaca2.Caption := QRPesoBrutoSaca.Caption;
    End
    Else
    begin     // se for rateio
       vQtRateio := QREmissaoRomaneioPESO_LIQUIDO.Value * (QREmissaoRomaneioPERC_RATEIO.Value/100);
       QRLRenda.Caption :=  '';
       QRLRenda2.Caption := '';
       QRLSaldoCliente.Caption := Bib.NumToTexto(vQtRateio,0,7);
       QRLSaldoCliente2.Caption := QRLSaldoCliente.Caption;
       QRLSaldoClienteScs.Caption := Bib.NumToTexto(vQtRateio /60,2,7)+' Scs';
       QRLSaldoClienteSCS2.Caption := QRLSaldoClienteScs.Caption;
       QRPesoBrutoSaca.Caption := Bib.NumToTexto(QREmissaoRomaneioPESOBALANCA.Value / 60,2,7)+ 'Scs';
       QRLPesoBrutoSaca2.Caption := QRPesoBrutoSaca.Caption;
     End;
    If QREmissaoRomaneioPERC_QUEBRADOS.Value <> 0 Then
      QRLQuebrados.Caption := Bib.NumToTexto((QREmissaoRomaneioPERC_QUEBRADOS.Value/100)*QREmissaoRomaneioPESOBALANCA.Value,0,5)
    else
      QRLQuebrados.Caption := '0';

    QRLQuebrados2.Caption := QRLQuebrados.Caption;

    If (QREmissaoRomaneioPERC_TRIGUILHO.Value > 0) Then
      QRLTriguilho.Caption :=Bib.NumToTexto((QREmissaoRomaneioPERC_TRIGUILHO.Value/100)*QREmissaoRomaneioPESOBALANCA.Value,1,3)
    else
      QRLTriguilho.Caption := '0';

    QRLTriguilho2.Caption := QRLTriguilho.Caption;

    QRLTotalDescontos.Caption := Bib.NumToTexto(QREmissaoRomaneioDESCONTOS.Value,0,5);
    QRLTotalDescontos2.Caption := QRLTotalDescontos.Caption;
{Comentado pois foi adicionado direto na Sql. Alex 08/01/2024.
    QREmissaoRomaneioDESC_MENSAGEM.Value := DMOracle.BuscaNome('SELECT DESC_MENSAGEM FROM TB_MENSAGEM','COD_MENSAGEM = ' +FloatToStr(QREmissaoRomaneioCOD_MENSAGEM.VALUE),True);
}
    If QREmissaoRomaneioIND_TIPO_ROMANEIO.Value = 'PESAGEM EN' Then
    begin
      QRLabel3.Caption :=  'Pesagem entrada:';
      QRLabel54.Caption :=  'Pesagem entrada:';
      FRPesagemEntradaSaidaEspelho.Caption := 'Pesagem entrada';
    end;
    If QREmissaoRomaneioIND_TIPO_ROMANEIO.Value = 'PESAGEM SA' Then
    begin
      QRLabel3.Caption :=  'Pesagem saída:';
      QRLabel54.Caption :=  'Pesagem saída:';
      FRPesagemEntradaSaidaEspelho.Caption := 'Pesagem saida';
    end;
    If QREmissaoRomaneioIND_TIPO_ROMANEIO.Value = 'PESAGEM PA' Then
    begin
      QRLabel3.Caption :=  'Pesagem diversos:';
      QRLabel54.Caption :=  'Pesagem diversos:';
      FRPesagemEntradaSaidaEspelho.Caption := 'Pesagem diversos';
    end;
    if (vQtRateio <> 0) And (QREmissaoRomaneioCOD_CADASTRO.Value = QREmissaoRomaneioCOD_CADASTRO_ROMANEIO.Value) then
      begin
        QRLRenda.Enabled:= true;
        QRLRenda2.Enabled := true;
        QRLabel47.Enabled := true;
        QRLabel48.Enabled := true;
        QRLabel96.Enabled := true;
        QRLabel98.Enabled := true;
      end
    Else
      begin
        QRLRenda.Enabled:= False;
        QRLRenda2.Enabled := False;
        QRLabel47.Enabled := False;
        QRLabel48.Enabled := False;
        QRLabel96.Enabled := False;
        QRLabel98.Enabled := False;
      end;
    QRLabel53.Caption := 'Empresa: ' + QREmissaoRomaneioDESC_FILIAL.Value;

  end;


  if (DMParamSistema.CodEmpresa = 'ALEOESTE') then
  begin
    QRDBText61.Visible:= false;
    QRDBText61.Enabled:= false;
    QRDBText64.Visible:= false;
    QRDBText64.Enabled:= false;
    QRDBText26.Visible:= false;
    QRDBText26.Enabled:= false;
    QRDBText28.Visible:= false;
    QRDBText28.Enabled:= false;
    QRDBText87.Enabled:= True;
    QRDBText87.Visible:= True;
    QRDBText88.Enabled:= True;
    QRDBText88.Visible:= True;

    QRDBText85.DataField := 'DESC_FILIAL';
    QRDBText83.DataField := 'DESC_FILIAL';
  end;
  if (DMParamSistema.CodEmpresa = 'ESPIGAO') then
  begin
    QRDBText61.Visible:= false;
    QRDBText61.Enabled:= false;
    QRDBText64.Visible:= false;
    QRDBText64.Enabled:= false;
    QRDBText26.Visible:= false;
    QRDBText26.Enabled:= false;
    QRDBText28.Visible:= false;
    QRDBText28.Enabled:= false;
    QRDBText87.Enabled:= True;
    QRDBText87.Visible:= True;
    QRDBText88.Enabled:= True;
    QRDBText88.Visible:= True;

    QRDBText85.DataField := 'DESC_FILIAL';
    QRDBText83.DataField := 'DESC_FILIAL';

  end;

end;

procedure TFRRomaneioEmissaoEspelho.FormActivate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'ROGERIOALV' then
  begin
    QRDBText65.Visible := False; //Impureza
    QRDBText76.Visible := False; //Impureza
    QRDBText66.Visible := False; //Ardidos
    QRDBText77.Visible := False; //Ardidos
    QRDBText68.Visible := False; //Avariados
    QRDBText78.Visible := False; //Avariados
  end;

end;

end.
