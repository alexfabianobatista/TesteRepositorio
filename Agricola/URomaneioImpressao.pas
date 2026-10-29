unit URomaneioImpressao;

interface

Uses Dialogs, SysUtils, UBiblioteca, Windows,
 Messages,  Variants, Classes, Graphics, Controls, Forms,
   ComCtrls, StdCtrls, Buttons, ExtCtrls,

   Printers;

Type
  TFRomaneioImpressao = Class
  Private
    Procedure RomaneioMoinho;
    Procedure RomaneioGonzatti;
    Procedure Romaneio_Generico;
    Procedure Romaneio_Tofeco;
  Public
    Procedure EmiteRomaneio;
    Procedure EmitePesagem;
    Procedure EmitePesagem40Col;
  End;

Var
  FRomaneioImpressao : TFRomaneioImpressao;
  wUsuario : String;
Const
  wBranco : String = '                                                                                                                            ';

implementation

Uses UOracle_cl, URomaneioAgricola_cl, UPadraoProduto_cl, UParamSistema_cl,
  UFilial_cl, URPesagem40Col, UUsuario_cl, UPesagemEntradaSaidaEspelho, UProduto_cl,
  Math, UPesagemEntradaSaidaEspelhoImagem;

Procedure TFRomaneioImpressao.EmiteRomaneio;
begin

  if Imp = Nil Then
    Imp := TImp.Create;
  //Abrir em porta de Nota
  with DMFilial do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK', DMRomaneioAgricola.QrRomEmissaoCOD_FILIAL.Value);
    QFilial.Open;

    Imp.AbreImpressora(QFilialDESC_LPT_NOTA.Value);
  end;
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'NIR' Then
  begin
    Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',33);
    FRomaneioImpressao.RomaneioMoinho;
  end;
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' Then   // CEREALISTA SÃO JORGE - G. GONZATTI & CIA. LTDA.
  begin
    Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',33);
    FRomaneioImpressao.RomaneioGonzatti;
  end;
  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO')   Or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL')   or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'RAMBO')    or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ALEOESTE') or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'CITY')     or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'NUTRI')    or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ESPIGAO')  or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INOVAR')   or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'BMG') Then
  begin
    Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',33);
    FRomaneioImpressao.Romaneio_Generico;
  end;
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'CEREAIS' Then   // CEREAIS IGUACU
  begin
    FRomaneioImpressao.EmitePesagem40Col;
  end;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'TOFECO') Then
  begin
    Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',33);
    FRomaneioImpressao.Romaneio_Tofeco;
  end;
  Imp.SaltaPagina;
  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao}

end;

Procedure TFRomaneioImpressao.RomaneioMoinho;    // EMISSAO ROMANEIO MOINHO IGUAÇU
Var
  wCont : Byte;
  wRenda : String;
begin
  wCont := 0;
  With DMRomaneioAgricola do
  Begin
    Imp.WriteXY(7.5,wCont,'N O T A    D E    P E S A G E M ');
    Inc(wCont);
    Inc(wCont);
    Imp.WriteXY(1,wCont,'Romaneio:'+QrRomEmissaoNUM_ROMANEIO.Text);
    Imp.WriteXY(4.9,wCont,'Ticket:'+QrRomEmissaoNUM_TICKET.text);
    Imp.WriteXY(9,wCont,'Nr.Amostra:'+QrRomEmissaoNUM_AMOSTRA.text);
    Imp.WriteXY(13.5,wCont,'Data Emissao:'+QrRomEmissaoDT_EMISSAO.Text);
    Inc(wCont);
    Imp.WriteXY(1,wCont,'____________________________________________________________________________');
    Inc(wCont);
    Imp.WriteXY(1,wCont,'Razao Social.:'+QrRomEmissaoDESC_FILIAL.Text);
    Inc(wCont);
    Imp.WriteXY(4.4,wCont,QrRomEmissaoENDERECO_FILIAL.text);
    Imp.WriteXY(12.5,wCont,'Telefone: '+QrRomEmissaoDESC_TELEFONE.TEXT);
    Inc(wCont);
    Imp.WriteXY(4.4,wCont,QrRomEmissaoCIDADE_FILIAL.text);
    Inc(wCont);
    Imp.WriteXY(4.4,wCont,QrRomEmissaoNUM_CGC.text);
    Imp.WriteXY(12.5,wCont,'Inscr. Estadual: '+QrRomEmissaoDESC_INSCRICAO.Text);
    wCont:=wCont+1;
    Imp.WriteXY(1,wCont,'____________________________________________________________________________');
    Inc(WCont);
    Imp.WriteXY(1,wCont,'Cliente......:'+QrRomEmissaoNOME.text+' -  '+QrRomEmissaoCOD_CADASTRO.text);
    Inc(WCont);
    Imp.WriteXY(4.5,wCont,QrRomEmissaoENDERECO_CADASTRO.Text + ' - '+QrRomEmissaoCIDADE_CADASTRO.text);
    wCont:=wCont+1;
    Imp.WriteXY(1,wCont,'____________________________________________________________________________');
    Inc(wCont);
    Imp.WriteXY(1,wCont,'Produto......:'+QrRomEmissaoDESC_PRODUTO.text);
    Imp.WriteXY(12.5,wCont,'NF.Produtor:'+QrRomEmissaoNUM_NOTA_PRODUTOR.text);
    wCont:=wCont+1;
    Imp.WriteXY(1,wCont,'Motorista....:'+QrRomEmissaoNOME_MOTORISTA.Text);
    Imp.WriteXY(12.5,wCont,'Placa....: '+QrRomEmissaoDESC_PLACA.text);
    wCont:=wCont+1;
    Imp.WriteXY(1,wCont,'____________________________________________________________________________');
    wCont:=wCont+1;
    Imp.WriteXY(1,wCont,'CONTROLE DE BALANCA');
    Imp.WriteXY(14.5,wCont,'DESCONTOS');
    Inc(wCont);
    Imp.WriteXY(12.5,wCont,'             %        KG');
    Inc(wCont);
    wRenda := '';
    If QrRomEmissaoCod_Cadastro.Value = QrRomEmissaoCod_Cadastro_Romaneio.Value Then
     Begin
      Imp.WriteXY(1,wCont,'Bruto+Tara...: '+Bib.NumToTexto(QrRomEmissaoQT_PESO_BRUTO.Value,0,8));
      Imp.WriteXY(7,wCont,copy(DateTimeToStr(QrRomEmissaoDT_PRIMEIRA_PESAGEM.Value),12,8));
      Imp.WriteXY(12.5,wCont,'Umidade..: '+Bib.NumToTexto(QrRomEmissaoPERC_UMIDADE.Value,1,2));
      Imp.WriteXY(16.5,wcont,Bib.NumToTexto(QrRomEmissaoUmidade.Value,0,8));
      Inc(wCont);
      Imp.WriteXY(1,wCont,'Tara.........: '+Bib.NumToTexto(QrRomEmissaoQT_TARA.Value,0,8));
      Imp.WriteXY(7,wCont,copy(DateTimeToStr(QrRomEmissaoDT_SEGUNDA_PESAGEM.Value),12,8));
      Imp.WriteXY(12.5,wCont,'Impureza.:  '+Bib.NumToTexto(QrRomEmissaoPERC_IMPUREZA.Value,1,2));
      Imp.WriteXY(16.5,wcont,Bib.NumToTexto(QrRomEmissaoimpureza.Value,0,8));
      Inc(wCont);
      Imp.WriteXY(1,wCont,'Peso Bruto...: '+Bib.NumToTexto(QrRomEmissaopesobalanca.Value,0,8));
      Imp.WriteXY(7,wCont,Bib.NumToTexto(QrRomEmissaopesobalanca.Value/QrRomEmissaoNUM_CONVERTE_FARDO.Value,2,7)+' Scs');
      Imp.WriteXY(12.5,wCont,'Ardidos..:  '+Bib.NumToTexto(QrRomEmissaoPERC_ARDIDOS.Value,1,2));
      Imp.WriteXY(16.5,wcont,Bib.NumToTexto(QrRomEmissaoardidos.Value,0,8));
      Inc(wCont);
      Imp.WriteXY(12.5,wCont,'Avariados:  '+Bib.NumToTexto(QrRomEmissaoPERC_AVARIADO.Value,1,2));
      Imp.WriteXY(16.5,wcont,Bib.NumToTexto(QrRomEmissaoavariados.Value,0,8));
      Inc(wCont);
      Imp.WriteXY(1,wCont,'Descontos....: '+Bib.NumToTexto(QrRomEmissaototaldesconto.Value,0,8));
      Imp.WriteXY(12.5,wCont,'Diversos.:  '+Bib.NumToTexto(QrRomEmissaoPERC_DIVERSOS.Value,1,3));
      Imp.WriteXY(16.5,wcont,Bib.NumToTexto(QrRomEmissaoDiversos.Value,0,8));
      Inc(wCont);
      wRenda := DmOracle.BuscaNome('SELECT SUM(QT_RATEIO) FROM TB_RATEIO_ROMANEIO', 'COD_ROMANEIO_AGRICOLA = ' + QrRomEmissaoCod_Romaneio_Agricola.Text
                                    + ' AND COD_CADASTRO <> ' + QRRomEmissaoCod_Cadastro_Romaneio.Text);
      If wRenda = ''  Then
       Begin
         Imp.WriteXY(1,wCont,'Peso Liquido.: '+Bib.NumToTexto(QrRomEmissaoliquido.Value,0,8));
         Imp.WriteXY(7,wCont,Bib.NumToTexto(QrRomEmissaoliquido.Value/QrRomEmissaoNUM_CONVERTE_FARDO.Value,2,7)+' Scs');
       End
      Else
       Begin
         Imp.WriteXY(1,wCont,'Peso Liquido.: '+Bib.NumToTexto(QrRomEmissaopesobalanca.Value-QrRomEmissaototaldesconto.Value,0,8));
         Imp.WriteXY(7,wCont,Bib.NumToTexto((QrRomEmissaopesobalanca.Value-QrRomEmissaototaldesconto.Value)/QrRomEmissaoNUM_CONVERTE_FARDO.Value,2,7)+' Scs');
       End;
      Imp.WriteXY(12.5,wCont,'DERIVADOS');
      Inc(wCont);
      If pRateio <> 0 Then
       Begin
         Imp.WriteXY(1,wCont,'Renda(s).....: '+Bib.NumToTexto(pRateio,0,8));
         Imp.WriteXY(7,wCont,Bib.NumToTexto(pRateio/QrRomEmissaoNUM_CONVERTE_FARDO.Value,2,7)+' Scs');
       End;
      Imp.WriteXY(12.5,wCont,'Quebrados:  '+Bib.NumToTexto(QrRomEmissaoPERC_QUEBRADOS.Value,1,2));
      Imp.WriteXY(16.5,wcont,Bib.NumToTexto(QrRomEmissaoquebrados.Value,0,8));
      Inc(wCont);
     End
    Else
     Begin
//      Imp.WriteXY(1,wCont,'Peso Bruto...: '+Bib.NumToTexto(QrRomEmissaoQt_Rateio.Value,0,8));
//      Imp.WriteXY(7,wCont,Bib.NumToTexto(QrRomEmissaoQt_Rateio.Value/QrRomEmissaoNum_Embalagem.Value,2,7)+' Scs');
//      Inc(wCont);
//      Imp.WriteXY(1,wCont,'Descontos....: '+Bib.NumToTexto(QrRomEmissaototaldesconto.Value,0,8));
      Inc(wCont);
     End;
    If wRenda <> ''  Then
     Begin
       Imp.WriteXY(1,wCont,'Saldo Cliente: '+Bib.NumToTexto(QrRomEmissaoLiquido.Value + StrToFloat(wRenda) - pRateio,0,8));
       Imp.WriteXY(7,wCont,Bib.NumToTexto((QrRomEmissaoliquido.Value + StrToFloat(wRenda) - pRateio )/QrRomEmissaoNUM_CONVERTE_FARDO.Value,2,7)+' Scs');
     End
    Else
     Begin
       Imp.WriteXY(1,wCont,'Saldo Cliente: '+Bib.NumToTexto(QrRomEmissaoLiquido.Value,0,8));
       Imp.WriteXY(7,wCont,Bib.NumToTexto(QrRomEmissaoliquido.Value/QrRomEmissaoNUM_CONVERTE_FARDO.Value,2,7)+' Scs');
     End;
    If QrRomEmissaoCod_Cadastro.Value = QrRomEmissaoCod_Cadastro_Romaneio.Value Then
    Begin
      Imp.WriteXY(12.5,wCont,'Triguilho:  '+Bib.NumToTexto(QrRomEmissaoPERC_TRIGUILHO.Value,1,2));
      Imp.WriteXY(16.5,wcont,Bib.NumToTexto(QrRomEmissaotriguilho.Value,0,8));
      Inc(wCont);
      Imp.WriteXY(1,wCont,'Ph Trigo.....: '+Bib.NumToTexto(QrRomEmissaoPERC_PH.Value,0,2));
      Imp.WriteXY(12.5,wCont,'Total Descontos:');
      Imp.WriteXY(16.5,wcont,Bib.NumToTexto(QrRomEmissaototaldesconto.Value + QrRomEmissaotriguilho.Value,0,8));
    End
   Else
    Begin
      Inc(wCont);
      Imp.WriteXY(1,wCont,'Renda Recebida: '+DmOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRRomEmissaoCod_Cadastro_Romaneio.Text));
    End;
    Inc(wCont);
    Imp.WriteXY(1,wCont,'OBS.: '+QrRomEmissaoDESC_OBSERVACAO.text);
    Inc(wCont);
    Imp.WriteXY(1,wCont,'Mens: '+QrRomEmissaoDESC_MENSAGEM.Text);
    wCont := wCont + 2;
    If QrRomEmissaoIND_CESTA_BASICA.Value = 'SIM' Then // emitindo romaneio de produto transgenico
       Imp.WriteXY(1,wCont,'Esta carga contem soja ROUNDUP READY');
    Inc(wCont);
    Imp.WriteXY(15,wCont,QrRomEmissaoDESC_USUARIO.text);
  End;
End;

// INICIO PROCEDIMENTO IMPRESSÃO ROMANEIO G.GONZATTI //
Procedure TFRomaneioImpressao.RomaneioGonzatti;
var wCont : Byte;
begin
  wCont := 0;
  with DMRomaneioAgricola do
  begin
    Imp.WriteXY(18.5,wCont,QrRomEmissaoNUM_ROMANEIO.Text);
    wCont:=wCont+8;
    Imp.WriteXY(3.5,wCont,Bib.NumToTexto(QrRomEmissaoQT_PESO_BRUTO.Value,0,10));
    Imp.WriteXY(10.2,wCont,QrRomEmissaoDESC_PRODUTO.Text);
    Imp.WriteXY(19.2,wCont,QrRomEmissaoCOD_PRODUTO.Text);
    Inc(wCont);
    Imp.WriteXY(3.5,wCont,Bib.NumToTexto(QrRomEmissaoQT_TARA.Value,0,10));
    Inc(wCont);
    Imp.WriteXY(3.5,wCont,Bib.NumToTexto((QrRomEmissaoQT_PESO_BRUTO.Value-QrRomEmissaoQT_TARA.Value),0,10));  // SUB-TOTAL
    Imp.WriteXY(5.5,wCont,Bib.NumToTexto((QrRomEmissaoQT_PESO_BRUTO.Value-QrRomEmissaoQT_TARA.Value)/QrRomEmissaoNUM_CONVERTE_FARDO.Value,2,7)+' Scs');
    Inc(wCont);
    Imp.WriteXY(3.5,wCont,Bib.NumToTexto(QrRomEmissaototaldesconto.Value+QrRomEmissaotriguilho.Value,0,10));  // DESCONTO
    Inc(wCont);
    Imp.WriteXY(3.5,wCont,Bib.NumToTexto(QrRomEmissaoliquido.Value,0,10));
    Imp.WriteXY(5.5,wCont,Bib.NumToTexto(QrRomEmissaoliquido.Value/QrRomEmissaoNUM_CONVERTE_FARDO.Value,2,7)+' Scs');
    If QrRomEmissaoPERC_UMIDADE.Value <> 0 Then
    Begin
      Imp.WriteXY(12.6,wCont,QrRomEmissaoPERC_UMIDADE.text);
      Imp.WriteXY(14.6,wCont,QrRomEmissaoPerc_Desconto.Text);
      Imp.WriteXY(18.5,wcont,Bib.NumToTexto(QrRomEmissaoumidade.Value,0,10));
    End;
    Inc(wCont);
    If QrRomEmissaoPERC_IMPUREZA.Value <> 0 Then
    Begin
      Imp.WriteXY(12.6,wCont,QrRomEmissaoPERC_IMPUREZA.text);
      Imp.WriteXY(14.6,wCont,QrRomEmissaoPerc_liq_Impureza.Text);
      Imp.WriteXY(18.5,wcont,Bib.NumToTexto(QrRomEmissaoimpureza.Value,0,10));
    End;
    Inc(wCont);
    If QrRomEmissaoPERC_AVARIADO.Value <> 0 Then
    Begin
      Imp.WriteXY(12.6,wCont,QrRomEmissaoPERC_AVARIADO.text);
      Imp.WriteXY(14.6,wCont,QrRomEmissaoPerc_liq_Avariado.Text);
      Imp.WriteXY(18.5,wcont,Bib.NumToTexto(QrRomEmissaoavariados.Value,0,10));
    End;
    Inc(wCont);
    Imp.WriteXY(4,wCont,QrRomEmissaoDT_EMISSAO.Text);
    If QrRomEmissaoPERC_ARDIDOS.Value <> 0 Then
    Begin
      Imp.WriteXY(12.6,wCont,QrRomEmissaoPERC_ARDIDOS.text);
      Imp.WriteXY(14.6,wCont,QrRomEmissaoPerc_liq_Ardidos.Text);
      Imp.WriteXY(18.5,wCont,Bib.NumToTexto(QrRomEmissaoardidos.Value,0,10));
    End;
    Inc(wCont);
    Imp.WriteXY(4,wCont,TimeToStr(Time));
    Imp.WriteXY(12.6,wCont,Bib.NumToTexto(QrRomEmissaoPERC_PH.Value,0,2));
    wCont:=wCont + 1;
    Imp.WriteXY(4,wCont,QrRomEmissaoNUM_CLASSIFICACAO.text);
    Imp.WriteXY(12.6,wCont,QrRomEmissaoPERC_TRIGUILHO.text);
    Imp.WriteXY(18.5,wcont,Bib.NumToTexto(QrRomEmissaotriguilho.Value,0,10));
    wCont:=wCont + 1;
    Imp.WriteXY(4,wCont,QrRomEmissaoNUM_TICKET.text);
    Imp.WriteXY(9.2,wCont,'DIVERSOS');     // 8.7
    Imp.WriteXY(12.5,wCont,QrRomEmissaoPERC_DIVERSOS.text);
    Imp.WriteXY(18.5,wcont,Bib.NumToTexto(QrRomEmissaodiversos.Value,0,10));
    Inc(wCont);
    Imp.WriteXY(4,wCont,QrRomEmissaoDESC_PLACA.text);
    Imp.WriteXY(18.5,wCont,Bib.NumToTexto(QrRomEmissaototaldesconto.Value+QrRomEmissaotriguilho.Value,0,10));
    wCont:=wCont + 3;
    Imp.WriteXY(2.7,wCont,QrRomEmissaoNUM_NOTA_PRODUTOR.text);
    Imp.WriteXY(6.7,wCont,QrRomEmissaoDESC_OBSERVACAO.text);
    Inc(wCont);
    Imp.WriteXY(6.7,wCont,QrRomEmissaoDESC_MENSAGEM.Text);
    wCont:=wCont + 2;
    Imp.WriteXY(5,wCont,Trim(QrRomEmissaoNOME.text)+' - '+QrRomEmissaoCOD_CADASTRO.text);
    Imp.WriteXY(16,wCont,QrRomEmissaoCGC_CPF_CLIENTE.text);
    wCont:=wCont + 3;
    Imp.WriteXY(1.7,wCont,QrRomEmissaoNUM_INSCRICAO.Text);
    Imp.WriteXY(7,wCont,QrRomEmissaoENDERECO_CADASTRO.text);
    Imp.WriteXY(15.7,wCont,QrRomEmissaoCIDADE_CADASTRO.text);
//    Imp.WriteXY(20.8,wCont,QrRomEmissaoESTADO_CADASTRO.Text);
  end;
end;
// FINAL PROCEDIMENTO IMPRESSÃO ROMANEIO G.GONZATTI \\

Procedure TFRomaneioImpressao.EmitePesagem;
var wCont : Byte;
    wCodPadrao,wObra : String;
    wLiquido,wDesconto,wMetroCubico, wTonelada : Real;
begin
  //incluido para possibilitar calcular o volume para Pedreira Itatiba - Cleber 12/09/2019
  DMProduto.QProduto.Close;
  DMProduto.QProduto.SetVariable('PK', DMRomaneioAgricola.QRomaneioCOD_PRODUTO.Text);
  DMProduto.QProduto.Open;

  if (DMFilial.QFilialIND_IMPRIME_ROMANEIO.Value = 'MATRICIAL') then
  begin
    if Imp = Nil Then
       Imp := TImp.Create;
    Imp.AbreImpressora;
    Imp.ConfiguraImpressora('CONDENSADO_OFF', 'SEXTOS', 33);
    wCont := 0;
    with DMRomaneioAgricola do
    begin
    //    Imp.ConfiguraNegrito('NEGRITO_ON');
      Imp.WriteXY(0,wCont,Chr(27)+chr(71));
      if DMParamSistema.CodEmpresa <> 'JATINHO' then
      begin
        If QrRomEmissaoInd_Tipo_Romaneio.Value = 'PESAGEM EN' Then
           Imp.WriteXY(0,wCont,'Pesagem Entrada.:'+QrRomEmissaoNUM_ROMANEIO.Text);
        If QrRomEmissaoInd_Tipo_Romaneio.Value = 'PESAGEM SA' Then
           Imp.WriteXY(0,wCont,'Pesagem Saida.:'+QrRomEmissaoNUM_ROMANEIO.Text);
        If QrRomEmissaoInd_Tipo_Romaneio.Value = 'PESAGEM PA' Then
           Imp.WriteXY(0,wCont,'Pesagem Diversos.:'+QrRomEmissaoNUM_ROMANEIO.Text);
        Imp.WriteXY(0,wCont,Chr(27)+chr(72));
      //    Imp.ConfiguraNegrito('NEGRITO_OFF');
        Imp.WriteXY(5.2,wCont,'Ticket:'+QrRomEmissaoNUM_TICKET.text);
        Imp.WriteXY(9,wCont,'Nr.Amostra:'+QrRomEmissaoNUM_AMOSTRA.text);
        Imp.WriteXY(13.5,wCont,'Dt.Emissao:'+QrRomEmissaoDt_Emissao.Text);
        Inc(wCont);
        Imp.WriteXY(0,wCont,'--------------------------------------------------------------------------------');
        Inc(wCont);
      end;
      if DMParamSistema.CodEmpresa = 'JATINHO' then
        Imp.WriteXY(0,wCont,QrRomEmissaoDESC_EMPRESA.Text+'   FONE:'+QrRomEmissaoDesc_Telefone.Value)
      else
        Imp.WriteXY(0,wCont,QrRomEmissaoDESC_FILIAL.Text+'   FONE:'+QrRomEmissaoDesc_Telefone.Value);
      Inc(wCont);
      Imp.WriteXY(0,wCont,Trim(QrRomEmissaoENDERECO_FILIAL.Text)+' -  '+Trim(QrRomEmissaoCIDADE_FILIAL.Text)+ ' - '+QrRomEmissaoEstado_Filial.Value);
      Inc(wCont);
      Imp.WriteXY(0,wCont,'CNPJ:'+QrRomEmissaoNUM_CGC.text+ '   IE:'+QrRomEmissaoDESC_INSCRICAO.Text);
      Inc(wCont);
      Imp.WriteXY(0,wCont,'--------------------------------------------------------------------------------');
      Inc(wCont);
    //    Imp.ConfiguraNegrito('NEGRITO_ON');
      Imp.WriteXY(0,wCont,Chr(27)+chr(71));
      if DMParamSistema.CodEmpresa <> 'JATINHO' then
      begin
        Imp.WriteXY(0,wCont,'CLIENTE...'+Trim(QrRomEmissaoNOME.Text) + '-' + QrRomEmissaoCOD_CADASTRO.Text);
        Imp.WriteXY(0,wCont,Chr(27)+chr(72));
    //    Imp.ConfiguraNegrito('NEGRITO_OFF');
        Inc(wCont);
        Imp.WriteXY(0,wCont,'ENDERECO..'+Trim(QrRomEmissaoENDERECO_CADASTRO.Text)+' - ' + Trim(QrRomEmissaoCIDADE_CADASTRO.Text) + ' - ' + Trim(QrRomEmissaoESTADO_CADASTRO.Text));
        Inc(wCont);
        Imp.WriteXY(0,wCont,'CNPJ/CPF..'+QrRomEmissaoCGC_CPF_CLIENTE.Text + '   IE/RG..:'+QrRomEmissaoNUM_INSCRICAO.Text);
        Inc(wCont);
        Imp.WriteXY(0,wCont,'--------------------------------------------------------------------------------');
        Inc(wCont);
      end;
    //    Imp.ConfiguraNegrito('NEGRITO_ON');
      Imp.WriteXY(0,wCont,Chr(27)+chr(71));
      Imp.WriteXY(0,wCont,'PRODUTO...'+QrRomEmissaoCOD_PRODUTO.Text + ' - '+QrRomEmissaoDESC_PRODUTO.Text);
      Imp.WriteXY(0,wCont,Chr(27)+chr(72));
    //    Imp.ConfiguraNegrito('NEGRITO_OFF');
      Inc(wCont);
      if DMParamSistema.CodEmpresa = 'JATINHO' then
        Imp.WriteXY(0,wCont,'Placa.....'+QrRomEmissaoDESC_PLACA.text+' Cliente:'+QrRomEmissaoNOME_MOTORISTA.Text)
      else
        Imp.WriteXY(0,wCont,'Placa.....'+QrRomEmissaoDESC_PLACA.text+'   Motorista:'+QrRomEmissaoNOME_MOTORISTA.Text);
      Inc(wCont);
      Imp.WriteXY(0,wCont,'--------------------------------------------------------------------------------');
      Inc(wCont);
      Imp.WriteXY(0,wCont,'CONTROLE DE BALANCA');
      If QrRomEmissaoInd_Tipo_Romaneio.Value <> 'PESAGEM PA' Then
       Begin
         Imp.WriteXY(17,wCont,'CLASSIFICACAO                  TOL(%)       DESC(KG)');
         Inc(wCont);
         Imp.ConfiguraCondensado('CONDENSADO_ON');
       End
      Else
         Inc(wCont);
      Imp.WriteXY(0,wCont,'Peso Bruto.....'+Bib.NumToTexto(QrRomEmissaoQT_PESO_BRUTO.Value,0,7)+'Kg   '+QrRomEmissaoDT_PRIMEIRA_PESAGEM.Text);
      If QrRomEmissaoInd_Tipo_Romaneio.Value <> 'PESAGEM PA' Then
       Begin
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
         Imp.WriteXY(17,wCont,'( - ) Umidade');
         Imp.WriteXY(22,wCont,Bib.NumToTexto(QrRomEmissaoPerc_Umidade.Value,1,3));
         If Not DMPadraoProduto.QPadraoDescontoProduto.Eof Then
           If (QrRomEmissaoPerc_Umidade.Value > DMPadraoProduto.QPadraoDescontoProdutoNUM_UMIDADE_TOLERANCIA.Value) And
              (DMPadraoProduto.QPadraoDescontoProdutoNUM_UMIDADE_DESCONTO.Value > 0) Then
            Begin
    //            Imp.WriteXY(13,wCont,Bib.NumToTexto((QrRomEmissaoPerc_Umidade.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_UMIDADE_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_UMIDADE_DESCONTO.Value,2,2));
              Imp.WriteXY(29,wCont,Bib.NumToTexto(((QrRomEmissaoPerc_Umidade.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_UMIDADE_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_UMIDADE_DESCONTO.Value / 100) * QrRomEmissaopesobalanca.Value ,0,5));
            End;
       End;
      Inc(wCont);
      Imp.WriteXY(0,wCont,'(-) Tara.......'+Bib.NumToTexto(QrRomEmissaoQT_TARA.Value,0,7)+'Kg   '+QrRomEmissaoDT_SEGUNDA_PESAGEM.Text);
      If QrRomEmissaoInd_Tipo_Romaneio.Value <> 'PESAGEM PA' Then
       Begin
         Imp.WriteXY(17,wCont,'( - ) Impureza');
         Imp.WriteXY(22,wCont,Bib.NumToTexto(QrRomEmissaoPerc_Impureza.Value,1,2));
         If Not DMPadraoProduto.QPadraoDescontoProduto.Eof Then
           If (QrRomEmissaoPerc_Impureza.value > DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA.Value) And
              (DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_DESCONTO.Value > 0) Then
            Begin
             Imp.WriteXY(25,wCont,Bib.NumToTexto(DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA.Value,2,2));
             Imp.WriteXY(29,wCont,Bib.NumToTexto(((QrRomEmissaoPerc_Impureza.value - DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_DESCONTO.Value / 100)* QrRomEmissaopesobalanca.Value,0,5));
            End;
       End;
      Inc(wCont);
      Imp.WriteXY(0,wCont,'Total Bruto....'+Bib.NumToTexto(QrRomEmissaopesobalanca.Value,0,7)+'Kg  ');

      If QrRomEmissaoInd_Tipo_Romaneio.Value <> 'PESAGEM PA' Then
       Begin
         Imp.WriteXY(0,wCont,Bib.NumToTexto(QrRomEmissaopesobalanca.Value/QrRomEmissaoNUM_CONVERTE_FARDO.Value,2,7)+'Sc');
         Imp.WriteXY(17,wCont,'( - ) Ardidos');
         Imp.WriteXY(22,wCont,Bib.NumToTexto(QrRomEmissaoPerc_Ardidos.Value,1,3));
         If Not DMPadraoProduto.QPadraoDescontoProduto.Eof Then
            If (QrRomEmissaoPerc_ardidos.Value > DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA.Value) And
               (DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_DESCONTO.Value > 0) Then
            Begin
               Imp.WriteXY(25,wCont,Bib.NumToTexto(DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA.Value,2,2));
               Imp.WriteXY(29,wCont,Bib.NumToTexto(((QrRomEmissaoPerc_ardidos.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_DESCONTO.Value / 100) * QrRomEmissaopesobalanca.Value,0,5));
            End;
         Inc(wCont);
         wDesconto := 0;
         wLiquido := QrRomEmissaopesobalanca.Value;
         if wCodPadrao <> '' then
            CalculoDesconto_Saida(QrRomEmissaopesobalanca.Value,
                                  QrRomEmissaoPerc_ardidos.Value,
                                  QrRomEmissaoPerc_Umidade.Value,
                                  QrRomEmissaoPerc_Impureza.Value,
                                  QrRomEmissaoPerc_Avariado.Value,
                                  QrRomEmissaoPerc_Quebrados.Value,
                                  QrRomEmissaoPerc_Triguilho.Value,
                                  StrToInt(wCodPadrao),
                                  wLiquido, wDesconto);

         Imp.WriteXY(0,wCont,'Descontos......'+Bib.NumToTexto(wDesconto,0,7)+'Kg');
         Imp.WriteXY(17,wCont,'( - ) Avariados');
         Imp.WriteXY(22,wCont,Bib.NumToTexto(QrRomEmissaoPerc_Avariado.Value,1,2));
         If Not DMPadraoProduto.QPadraoDescontoProduto.Eof Then
           If (QrRomEmissaoPerc_Avariado.Value > DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA.Value) And
              (DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_DESCONTO.Value > 0) Then
            Begin
              Imp.WriteXY(25,wCont,Bib.NumToTexto(DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA.Value,2,2));
              Imp.WriteXY(29,wCont,Bib.NumToTexto(((QrRomEmissaoPerc_Avariado.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_DESCONTO.Value / 100) * QrRomEmissaopesobalanca.Value,0,5));
            End;
         Inc(wCont);
    //       Imp.ConfiguraNegrito('NEGRITO_ON');
         Imp.WriteXY(0,wCont,Chr(27)+chr(71));
         Imp.WriteXY(0,wCont,'Peso Liquido...'+Bib.NumToTexto(wLiquido,0,7)+'Kg  '+Bib.NumToTexto(wLiquido / QrRomEmissaoNUM_CONVERTE_FARDO.Value,2,7)+' Scs');
         Imp.WriteXY(0,wCont,Chr(27)+chr(72));
    //       Imp.ConfiguraNegrito('NEGRITO_OFF');
       End
      Else
       Begin
         Inc(wCont);
         Imp.WriteXY(0,wCont,Chr(27)+chr(71));
    //       Imp.ConfiguraNegrito('NEGRITO_ON');
         Imp.WriteXY(0,wCont,'Peso Liquido...'+Bib.NumToTexto(QrRomEmissaopesobalanca.Value,0,7)+'Kg  ');
         If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ITATIBA') Or
            (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'SRTERRA') Or
            (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'SAMP')    Then
            //Rosangela - Pedreira SR solicitou a UNIDADE DE MEDIDA NA IMPRESSÃO, pois estava dando problema em questão de acerto com o cliente
            //quando o produto é por tonelada e estava imprimindo M3. César autorizou e solicitou ajustar a UNIDADE DE MEDIDA dos produto. //Junior - 28/11/2014.
            Imp.WriteXY(0,wCont,Bib.NumToTexto((QrRomEmissaopesobalanca.Value / QrRomEmissaoNum_Volumes.Value),2,7)+ ' ' + QrRomEmissaoDESC_UNIDADE.Value); // +' M3  ');
            If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ITATIBA') and  (DMProduto.QProdutoNUM_METROS_CUBICOS.Value > 0) then    //solicitado por Rodrigo para exibir metros cubicos juntamente com a tonelada - Cleber 12/09/2019
              Imp.WriteXY(17.5,wCont,Bib.NumToTexto((QrRomEmissaopesobalanca.Value / DMProduto.QProdutoNUM_METROS_CUBICOS.Value),2,7)+ ' ' +' M3  ');
         Imp.WriteXY(0,wCont,Chr(27)+chr(72));
    //       Imp.ConfiguraNegrito('NEGRITO_OFF');
       End;
      If QrRomEmissaoPerc_Beneficiado.Value > 0 Then
       Begin
         Imp.WriteXY(17.8,wCont,'( - ) Beneficiado: '+Bib.NumToTexto(QrRomEmissaoPerc_Beneficiado.Value,1,2));
         Imp.WriteXY(24.5,wCont,'Inteiros: '+Bib.NumToTexto(QrRomEmissaoPerc_Inteiro_Arroz.Value,1,2));
         Imp.WriteXY(29.5,wCont,'Quebrado: '+Bib.NumToTexto(QrRomEmissaoPerc_Quebrado_Arroz.Value,1,2));
       End;
      Inc(wCont);
      If QrRomEmissaoInd_Tipo_Romaneio.Value <> 'PESAGEM PA' Then
       Begin
         Imp.WriteXY(17,wCont,'( - ) Quebrado');
         Imp.WriteXY(22,wCont,Bib.NumToTexto(QrRomEmissaoPerc_Quebrados.Value,1,2));
         If Not DMPadraoProduto.QPadraoDescontoProduto.Eof Then
           If (QrRomEmissaoPerc_Quebrados.Value > DMPadraoProduto.QPadraoDescontoProdutoNUM_QUEBRADO_TOLERANCIA.Value) And
              (DMPadraoProduto.QPadraoDescontoProdutoNUM_QUEBRADO_DESCONTO.Value > 0) Then
            Begin
              Imp.WriteXY(25,wCont,Bib.NumToTexto(DMPadraoProduto.QPadraoDescontoProdutoNUM_QUEBRADO_TOLERANCIA.Value,2,2));
              Imp.WriteXY(29,wCont,Bib.NumToTexto(((QrRomEmissaoPerc_Quebrados.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_QUEBRADO_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_QUEBRADO_DESCONTO.Value / 100) * QrRomEmissaopesobalanca.Value,0,5));
            End;
         Inc(wCont);
         Imp.WriteXY(17,wCont,'( - ) Triguilho');
         Imp.WriteXY(22,wCont,Bib.NumToTexto(QrRomEmissaoPerc_Triguilho.Value,1,2));
         If Not DMPadraoProduto.QPadraoDescontoProduto.Eof Then
           If (QrRomEmissaoPerc_Triguilho.Value > DMPadraoProduto.QPadraoDescontoProdutoNUM_TRIGUILHO_TOLERANCIA.Value) And
              (DMPadraoProduto.QPadraoDescontoProdutoNUM_TRIGUILHO_DESCONTO.Value > 0) Then
            Begin
             Imp.WriteXY(25,wCont,Bib.NumToTexto(DMPadraoProduto.QPadraoDescontoProdutoNUM_TRIGUILHO_TOLERANCIA.Value,2,2));
             Imp.WriteXY(29,wCont,Bib.NumToTexto(((QrRomEmissaoPerc_Triguilho.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_TRIGUILHO_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_TRIGUILHO_DESCONTO.Value / 100) * QrRomEmissaopesobalanca.Value ,0,5));
            End;
         Inc(wCont);
         Imp.WriteXY(0,wCont,'PH: '+FloatToStr(QrRomEmissaoPerc_PH.Value));
         Imp.WriteXY(17,wCont,'Total Descontos');
         Imp.WriteXY(29,wCont,Bib.NumToTexto(wDesconto,0,5));
       End;
      if DMParamSistema.CodEmpresa = 'JATINHO' then
        wCont:=wCont+9
      else
        Inc(wCont);
      Imp.WriteXY(0,wCont,'.');
      Imp.ConfiguraCondensado('CONDENSADO_OFF');
      if DMParamSistema.CodEmpresa <> 'JATINHO' then
      begin
        Imp.WriteXY(0,wCont,'-------------------------------------------------------------------------------');
        Inc(wCont);
        Imp.WriteXY(0,wCont,QrRomEmissaoDESC_OBSERVACAO.text);
        Inc(wCont);
        Imp.WriteXY(0,wCont,'Msg:'+QrRomEmissaoDESC_MENSAGEM.text);
        If QrRomEmissaoCOD_OBRA.text <> '' Then
        Begin
          Inc(wCont);
          wObra := DMOracle.BuscaNome('SELECT DESC_OBRA FROM TB_OBRA','COD_OBRA = '+FloatToStr(QrRomEmissaoCOD_OBRA.Value));
          Imp.WriteXY(0,wCont,'Obra:'+QrRomEmissaoCOD_OBRA.text+' - '+wObra);
        End;
        Inc(wCont,2);
        Imp.WriteXY(0,wCont,'___________________________________');
        Imp.WriteXY(11,wCont,'___________________________________');
        Inc(wCont,2);
        wUsuario := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO','COD_USUARIO = '+FloatToStr(DMRomaneioAgricola.QRomaneioCod_Usuario.Value));
        Imp.WriteXY(0,wCont,wUsuario);
        Imp.WriteXY(11,wCont,QrRomEmissaoNOME_MOTORISTA.Text);
      end;
    end;

    Imp.SaltaPagina;
    Imp.FechaImpressora;  // Finaliza os serviços de Impressao}
  end
  else
  begin
    if (DMParamSistema.QParamSistemaIND_CAMERA_PESAGEM_BALANCA.Value = 'S') then
    begin
     if (FRPesagemEntradaSaidaEspelhoImagem = nil) then
        FRPesagemEntradaSaidaEspelhoImagem := TFRPesagemEntradaSaidaEspelhoImagem.Create(Application);
     FRPesagemEntradaSaidaEspelhoImagem.QRPrimario.Preview;
    end
    else
    begin
      if (FRPesagemEntradaSaidaEspelho = nil) then
        FRPesagemEntradaSaidaEspelho := TFRPesagemEntradaSaidaEspelho.Create(Application);
      if DMParamSistema.CodEmpresa = 'ESPIGAO' then
      begin
        //FRPesagemEntradaSaidaEspelho.QRPrimario.Height := 705;
        FRPesagemEntradaSaidaEspelho.QRBand2.Enabled := True;
        FRPesagemEntradaSaidaEspelho.QRDBText75.DataField := 'DESC_FILIAL';
        FRPesagemEntradaSaidaEspelho.QRBand1.Font.Style := FRPesagemEntradaSaidaEspelho.QRBand1.Font.Style + [fsBold];
      end
      else
        FRPesagemEntradaSaidaEspelho.QRPrimario.Height := 1572;
      //Adicionado para a ITATIBA para impressão do M³ no romaneio. Alex 12/05/2022
      if (DMParamSistema.CodEmpresa = 'ITATIBA') and (DMProduto.QProdutoNUM_METROS_CUBICOS.Value > 0) then
      begin
        wMetroCubico := (RoundTo(DMRomaneioAgricola.QrRomEmissaopesobalanca.Value,-2) / RoundTo(DMProduto.QProdutoNUM_METROS_CUBICOS.Value,-2));
        FRPesagemEntradaSaidaEspelho.QRLSCLiquido.Caption := FloatToStr(RoundTo(wMetroCubico,-2)) + ' M3';
        FRPesagemEntradaSaidaEspelho.QRLSCLiquido2.Caption := FloatToStr(RoundTo(wMetroCubico,-2)) + ' M3';
        wTonelada := (RoundTo(DMRomaneioAgricola.QrRomEmissaopesobalanca.Value,-2) / 1000);
        FRPesagemEntradaSaidaEspelho.QRLSaldoClienteSCS.Caption := FloatToStr(RoundTo(wTonelada,-2)) + ' T';
        FRPesagemEntradaSaidaEspelho.QRLSaldoClienteSCS2.Caption := FloatToStr(RoundTo(wTonelada,-2)) + ' T';
      end;
      FRPesagemEntradaSaidaEspelho.QRPrimario.Preview;
    end;
  end;

end;

// INICIO PROCEDIMENTO IMPRESSÃO ROMANEIO generico \\
Procedure TFRomaneioImpressao.Romaneio_Generico;
var wCont : Byte;
begin


  wCont := 0;
  with DMRomaneioAgricola do
  begin

    Imp.WriteXY(0,wCont,Chr(27)+chr(71));
    If QrRomEmissaoIND_TIPO_ROMANEIO.Value = 'ROMANEIO' Then
      Imp.WriteXY(0,wCont,'Romaneio:'+QrRomEmissaoNUM_ROMANEIO.Text+'  '+IntToStr(QrRomEmissao.RecNo)+'/'+IntToStr(QrRomEmissao.RecordCount))
    Else If QrRomEmissaoIND_TIPO_ROMANEIO.Value = 'TRANSF ENT' Then
      Imp.WriteXY(0,wCont,'Transf. Entrada:'+QrRomEmissaoNUM_ROMANEIO.Text)
    Else
      Imp.WriteXY(0,wCont,'Transf. Saída:'+QrRomEmissaoNUM_ROMANEIO.Text);
    Imp.WriteXY(0,wCont,Chr(27)+chr(72));
    Imp.WriteXY(4.9,wCont,'Ticket:'+QrRomEmissaoNUM_TICKET.text);
    Imp.WriteXY(9,wCont,'Nr.Amostra:'+QrRomEmissaoNUM_AMOSTRA.text);
    Imp.WriteXY(13.5,wCont,'Dt.Emissao:'+QrRomEmissaoDt_Emissao.Text);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'--------------------------------------------------------------------------------');
    Inc(wCont);
    Imp.WriteXY(0,wCont,QrRomEmissaoDESC_FILIAL.Text+'   FONE:'+QrRomEmissaoDesc_Telefone.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,Trim(QrRomEmissaoENDERECO_FILIAL.Text)+' -  '+Trim(QrRomEmissaoCIDADE_FILIAL.Text)+ ' - '+QrRomEmissaoEstado_Filial.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'CNPJ:'+QrRomEmissaoNUM_CGC.text+ '   IE:'+QrRomEmissaoDESC_INSCRICAO.Text);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'--------------------------------------------------------------------------------');
    Inc(wCont);
    Imp.WriteXY(0,wCont,Chr(27)+chr(71));
    Imp.WriteXY(0,wCont,'CLIENTE...'+Trim(QrRomEmissaoNOME.Text) + '-' + QrRomEmissaoCOD_CADASTRO.Text);
    Imp.WriteXY(0,wCont,Chr(27)+chr(72));
    Inc(wCont);
    Imp.WriteXY(0,wCont,'ENDERECO..'+Trim(QrRomEmissaoENDERECO_CADASTRO.Text)+' - ' + Trim(QrRomEmissaoCIDADE_CADASTRO.Text) + ' - ' + Trim(QrRomEmissaoESTADO_CADASTRO.Text));
    Inc(wCont);
    Imp.WriteXY(0,wCont,'CNPJ/CPF..'+QrRomEmissaoCGC_CPF_CLIENTE.Text + '   IE/RG..:'+QrRomEmissaoNUM_INSCRICAO.Text);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'--------------------------------------------------------------------------------');
    Inc(wCont);
    Imp.WriteXY(0,wCont,Chr(27)+chr(71));
    Imp.WriteXY(0,wCont,'PRODUTO...'+QrRomEmissaoCOD_PRODUTO.Text + ' - '+QrRomEmissaoDESC_PRODUTO.Text+'   NF PRODUTOR:'+QrRomEmissaoNUM_NOTA_PRODUTOR.Text);
    Imp.WriteXY(0,wCont,Chr(27)+chr(72));
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Placa.....'+QrRomEmissaoDESC_PLACA.text+'   Motorista:'+QrRomEmissaoNOME_MOTORISTA.Text);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'--------------------------------------------------------------------------------');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'CONTROLE DE BALANCA');
    Imp.WriteXY(17,wCont,'CLASSIFICACAO                  TOL(%)       DESC(KG)');
    Inc(wCont);
    Imp.ConfiguraCondensado('CONDENSADO_ON');
    Imp.WriteXY(0,wCont,'Peso Bruto.....'+Bib.NumToTexto(QrRomEmissaoQT_PESO_BRUTO.Value,0,7)+'Kg   '+QrRomEmissaoDT_PRIMEIRA_PESAGEM.Text);
    Imp.WriteXY(17,wCont,'( - ) Umidade');
    If QrRomEmissaoPERC_UMIDADE.Value <> 0 Then
    Begin
      Imp.WriteXY(22,wCont,Bib.NumToTexto(QrRomEmissaoPerc_Umidade.Value,1,3));
//      Imp.WriteXY(25,wCont,Bib.NumToTexto(QrRomEmissaoPerc_Desconto.Value,2,3));
      Imp.WriteXY(29,wCont,Bib.NumToTexto(pUmidade,0,5));
    End;
    Inc(wCont);
    Imp.WriteXY(0,wCont,'(-) Tara.......'+Bib.NumToTexto(QrRomEmissaoQT_TARA.Value,0,7)+'Kg   '+QrRomEmissaoDT_SEGUNDA_PESAGEM.Text);
    Imp.WriteXY(17,wCont,'( - ) Impureza');
    If QrRomEmissaoPERC_IMPUREZA.Value <> 0 Then
    Begin
      Imp.WriteXY(22,wCont,Bib.NumToTexto(QrRomEmissaoPerc_Impureza.Value,1,3));
//      Imp.WriteXY(25,wCont,Bib.NumToTexto(QrRomEmissaoPerc_liq_Impureza.Value,2,3));
      Imp.WriteXY(25,wCont,Bib.NumToTexto(QrRomEmissaoPerc_Tolera_Impureza.Value,2,3));
      Imp.WriteXY(29,wCont,Bib.NumToTexto(pImpureza,0,5));
    End;
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Total Bruto....'+Bib.NumToTexto(QrRomEmissaopesobalanca.Value,0,7)+'Kg  '+Bib.NumToTexto(QrRomEmissaopesobalanca.Value/QrRomEmissaoNUM_CONVERTE_FARDO.Value,2,7)+'Sc');
    Imp.WriteXY(17,wCont,'( - ) Ardidos');
    If QrRomEmissaoPERC_ARDIDOS.Value <> 0 Then
    Begin
      Imp.WriteXY(22,wCont,Bib.NumToTexto(QrRomEmissaoPerc_Ardidos.Value,1,3));
//      Imp.WriteXY(25,wCont,Bib.NumToTexto(QrRomEmissaoPerc_liq_Ardidos.Value,2,3));
      Imp.WriteXY(25,wCont,Bib.NumToTexto(QrRomEmissaoPerc_Tolera_Ardidos.Value,2,3));
      Imp.WriteXY(29,wCont,Bib.NumToTexto(pArdidos,0,5));
    End;
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Descontos......'+Bib.NumToTexto(pTotalDescontos+pTriguilho,0,7)+'Kg');
    Imp.WriteXY(17,wCont,'( - ) Avariados');
    If QrRomEmissaoPERC_AVARIADO.Value <> 0 Then
    Begin
      Imp.WriteXY(22,wCont,Bib.NumToTexto(QrRomEmissaoPerc_Avariado.Value,1,3));
//      Imp.WriteXY(22,wCont,Bib.NumToTexto(QrRomEmissaoPerc_liq_Avariado.Value,2,3));
      Imp.WriteXY(25,wCont,Bib.NumToTexto(QrRomEmissaoPerc_Tolera_Avariado.Value,2,3));
      Imp.WriteXY(29,wCont,Bib.NumToTexto(pAvariados,0,5));
    End;
    Inc(wCont);
    Imp.WriteXY(0,wCont,Chr(27)+chr(71));
    Imp.WriteXY(0,wCont,'Peso Liquido...'+Bib.NumToTexto(QrRomEmissaopesobalanca.Value - pTotalDescontos - pTriguilho,0,7)+'Kg  '+Bib.NumToTexto((QrRomEmissaopesobalanca.Value - pTotalDescontos - pTriguilho)/QrRomEmissaoNUM_CONVERTE_FARDO.Value,2,7)+' Scs');
    Imp.WriteXY(0,wCont,Chr(27)+chr(72));
    Inc(wCont);
    If (PRateio <> 0) And (QrRomEmissaoCod_Cadastro.Value = QrRomEmissaoCod_Cadastro_Romaneio.Value) Then // quando for diferente do principal tem rateio senao nao tem
       Imp.WriteXY(0,wCont,'Renda(-).......'+Bib.NumToTexto(PRateio,0,7)+'Kg');
    Imp.WriteXY(17,wcont,'DERIVADOS');
    Inc(wCont);
    Imp.WriteXY(0,wCont,Chr(27)+chr(71));
    If (QrRomEmissaoCod_Cadastro.Value = QrRomEmissaoCod_Cadastro_Romaneio.Value) Then
       Imp.WriteXY(0,wCont,'Saldo Cliente..'+Bib.NumToTexto(QrRomEmissaopesobalanca.Value - QrRomEmissaoTotalDesconto.Value - PRateio ,0,7)+'Kg  '+Bib.NumToTexto((QrRomEmissaopesobalanca.Value - QrRomEmissaoTotalDesconto.Value - PRateio)/QrRomEmissaoNUM_CONVERTE_FARDO.Value,2,7)+' Scs')
    Else
       Imp.WriteXY(0,wCont,'Saldo Cliente..'+Bib.NumToTexto(QrRomEmissaoliquido.Value,0,7)+'Kg  '+Bib.NumToTexto(QrRomEmissaoliquido.Value/QrRomEmissaoNUM_CONVERTE_FARDO.Value,2,7)+' Scs');
    Imp.WriteXY(16,wCont,Chr(27)+chr(72));
    Imp.WriteXY(18,wCont,'( - ) Quebrados');
    If QrRomEmissaoPERC_QUEBRADOS.Value <> 0 Then
    Begin
      Imp.WriteXY(22,wCont,Bib.NumToTexto(QrRomEmissaoPERC_QUEBRADOS.Value,1,3));
      Imp.WriteXY(29,wCont,Bib.NumToTexto(pQuebrados,0,5));
    End;
    Inc(wCont);
    If (QrRomEmissaoCod_Cadastro.Value <> QrRomEmissaoCod_Cadastro_Romaneio.Value) Then
       Imp.WriteXY(0,wCont,'Renda Recebida: '+DmOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRRomEmissaoCod_Cadastro_Romaneio.Text));
    Imp.WriteXY(17,wCont,'( - ) Triguilho');
    If (QrRomEmissaoPERC_TRIGUILHO.Value > 0) Or (QrRomEmissaoPerc_PH.Value > 0) Then
     Begin
       Inc(wCont);
       Imp.WriteXY(22,wCont,Bib.NumToTexto(QrRomEmissaoPERC_TRIGUILHO.Value,1,3));
       Imp.WriteXY(29,wCont,Bib.NumToTexto(pTriguilho,0,5));
     End;
    Inc(wCont);
    Imp.WriteXY(0,wCont,'PH: '+FloatToStr(QrRomEmissaoPerc_PH.Value));
    Imp.WriteXY(17,wCont,'Total Descontos');
    Imp.WriteXY(29,wCont,Bib.NumToTexto(pTotalDescontos+pTriguilho,0,5));
    Inc(wCont);
    Imp.WriteXY(0,wCont,'.');
    Imp.ConfiguraCondensado('CONDENSADO_OFF');
    Imp.WriteXY(0,wCont,'-------------------------------------------------------------------------------');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Obs:'+QrRomEmissaoDESC_OBSERVACAO.text);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Msg:'+QrRomEmissaoDESC_MENSAGEM.text);
    Inc(wCont,2);
    Imp.WriteXY(0,wCont,'___________________________________');
    Imp.WriteXY(11,wCont,'___________________________________');
    Inc(wCont);
    wUsuario := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO','COD_USUARIO = '+FloatToStr(DMRomaneioAgricola.QRomaneioCod_Usuario.Value));
    Imp.WriteXY(0,wCont,wUsuario);
    Imp.WriteXY(11,wCont,QrRomEmissaoNOME_MOTORISTA.Text);
  end;
end;
// FINAL PROCEDIMENTO IMPRESSÃO ROMANEIO generico \\

Procedure TFRomaneioImpressao.EmitePesagem40Col;
var
  wCont : Byte;
  Str, Divisao: String;
begin
//  if Imp = Nil Then
//    Imp := TImp.Create;
//  Imp.AbreImpressora;
//  Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',27);
//  wCont := 0;
  with DMRomaneioAgricola do
  begin
    if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CEREAIS')  or
         (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ALIANCA') or
         (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ITATIBA')) And
       (QrRomEmissaoInd_Tipo_Romaneio.Value = 'PESAGEM PA') Then
    Begin
      if FRpesagem40Col = Nil then
        FRPesagem40Col := TFRPesagem40Col.Create(Application);

      if DMUsuario.ImpressoraPadraoNFCe <> '' then
      begin
        if pos('\\', DMUsuario.ImpressoraPadraoNFCe) > 0 then
          Printer.PrinterIndex :=
            Printer.Printers.IndexOf(Bib.PegaImpressoraPorNomeRede(DMUsuario.ImpressoraPadraoNFCe))
        else
          Printer.Printers.IndexOf(DMUsuario.ImpressoraPadraoNFCe);
      end
      else
      begin
        MessageDlg('Impressora de NFC-e não informada no cadastro de usuário'
          ,mtError, [mbOk], 0);
        Abort;
      end;

      FRPesagem40Col.QRPrimario.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
      FRPesagem40Col.QRPrimario.Print;

    end
    else
    Begin
      wCont := 0;
      Divisao := '----------------------------------------';
      with DMRomaneioAgricola do
      begin
        Imp.ConfiguraNegrito(IMP_CONF_NEGRITO_ON);
        If QrRomEmissaoIND_TIPO_ROMANEIO.Value = 'ROMANEIO' Then
          Imp.WriteXY(0,wCont,'Romaneio:'+QrRomEmissaoNUM_ROMANEIO.Text+'  '+IntToStr(QrRomEmissao.RecNo)+'/'+IntToStr(QrRomEmissao.RecordCount))
        Else If QrRomEmissaoIND_TIPO_ROMANEIO.Value = 'TRANSF ENT' Then
          Imp.WriteXY(0,wCont,'Transf. Entrada:'+QrRomEmissaoNUM_ROMANEIO.Text)
        Else
          Imp.WriteXY(0,wCont,'Transf. Saída:'+QrRomEmissaoNUM_ROMANEIO.Text);
        Imp.ConfiguraNegrito(IMP_CONF_NEGRITO_OFF);
        Imp.WriteXY(0,wCont,' Ticket:'+QrRomEmissaoNUM_TICKET.text);
        inc(wCont);
        Imp.WriteXY(0,wCont,' Amostra:'+QrRomEmissaoNUM_AMOSTRA.text);
        Imp.WriteXY(0,wCont,' Dt.Emissao:'+QrRomEmissaoDt_Emissao.Text);
        Inc(wCont);
        Imp.WriteXY(0,wCont,Divisao);
        Inc(wCont);
        Imp.WriteXY(0,wCont,QrRomEmissaoDESC_FILIAL.Text+'   FONE:'+QrRomEmissaoDesc_Telefone.Value);
        Inc(wCont);
        Imp.WriteXY(0,wCont,Trim(QrRomEmissaoENDERECO_FILIAL.Text)+' -  '+Trim(QrRomEmissaoCIDADE_FILIAL.Text)+ ' - '+QrRomEmissaoEstado_Filial.Value);
        Inc(wCont);
        Imp.WriteXY(0,wCont,'CNPJ:'+QrRomEmissaoNUM_CGC.text+ ' IE:'+QrRomEmissaoDESC_INSCRICAO.Text);
        Inc(wCont);
        Imp.WriteXY(0,wCont,Divisao);
        Inc(wCont);
        Imp.ConfiguraNegrito(IMP_CONF_NEGRITO_ON);
        Imp.WriteXY(0,wCont,Copy('CLIENTE:'+Trim(QrRomEmissaoNOME.Text) + '-' + QrRomEmissaoCOD_CADASTRO.Text, 1, 40));
        Imp.ConfiguraNegrito(IMP_CONF_NEGRITO_OFF);
        Inc(wCont);
        Imp.WriteXY(0,wCont,Copy('ENDERECO:'+Trim(QrRomEmissaoENDERECO_CADASTRO.Text), 1, 40));
        Inc(wCont);
        Imp.WriteXY(0,wCont,Copy('CIDADE:'+Trim(QrRomEmissaoCIDADE_CADASTRO.Text) + ' - ' + Trim(QrRomEmissaoESTADO_CADASTRO.Text), 1, 40));
        Inc(wCont);
        Imp.WriteXY(0,wCont,'CNPJ/CPF:'+QrRomEmissaoCGC_CPF_CLIENTE.Text + ' IE/RG:'+QrRomEmissaoNUM_INSCRICAO.Text);
        Inc(wCont);
        Imp.WriteXY(0,wCont,Divisao);
        Inc(wCont);
        Imp.ConfiguraNegrito(IMP_CONF_NEGRITO_ON);
        Imp.WriteXY(0,wCont,'PRODUTO...'+QrRomEmissaoCOD_PRODUTO.Text + ' - '+QrRomEmissaoDESC_PRODUTO.Text+'   NF PRODUTOR:'+QrRomEmissaoNUM_NOTA_PRODUTOR.Text);
        Imp.ConfiguraNegrito(IMP_CONF_NEGRITO_OFF);
        Inc(wCont);
        Imp.WriteXY(0,wCont,'Placa.....'+QrRomEmissaoDESC_PLACA.text+'   Motorista:'+QrRomEmissaoNOME_MOTORISTA.Text);
        inc(wCont);
        Imp.WriteXY(0,wCont,'Placa Carreta:'+QrRomEmissaoDESC_PLACA_CARRETA.text);
        Inc(wCont);
        Imp.WriteXY(0,wCont,Divisao);
        Inc(wCont);
        Imp.WriteXY(0,wCont,'CONTROLE DE BALANCA');
        inc(wCont);
        Imp.WriteXY(0,wCont,'Peso Bruto..'+Bib.NumToTexto(QrRomEmissaoQT_PESO_BRUTO.Value,0,7)+'Kg  '+ FormatDateTime('dd/mm/yyyy hh:nn', QrRomEmissaoDT_PRIMEIRA_PESAGEM.Value));
        inc(wCont);
        Str := '(-) Tara....'+Bib.NumToTexto(QrRomEmissaoQT_TARA.Value,0,7)+'Kg';
        if not QrRomEmissaoDT_SEGUNDA_PESAGEM.IsNull then
          Str := Str + '  ' + FormatDateTime('dd/mm/yyyy hh:nn', QrRomEmissaoDT_SEGUNDA_PESAGEM.Value);
        Imp.WriteXY(0,wCont, Str);
        Inc(wCont);
        Imp.WriteXY(0,wCont,'Total Bruto.'+Bib.NumToTexto(QrRomEmissaopesobalanca.Value,0,7)+'Kg  '+Bib.NumToTexto(QrRomEmissaopesobalanca.Value/QrRomEmissaoNUM_CONVERTE_FARDO.Value,2,7)+'Sc');
        inc(wCont);
        Imp.WriteXY(0,wCont,'CLASSIFICACAO  TOT(%)  DESC(%)  DESC(KG)');
        inc(wCont);
        Imp.WriteXY(0,wCont,'(-) Umidade ');
        If QrRomEmissaoPERC_UMIDADE.Value <> 0 Then
        Begin
          Imp.WriteXY(2.5,wCont,'    ' + Bib.NumToTexto(QrRomEmissaoPerc_Umidade.Value,1,3));
          Imp.WriteXY(3.7,wCont,'    ' + Bib.NumToTexto(QrRomEmissaoPerc_Desconto.Value,2,3));
          Imp.WriteXY(4.9,wCont,'    ' + Bib.NumToTexto(pUmidade,0,5));
        End;

        inc(wCont);
        Imp.WriteXY(0,wCont,'(-) Impureza ');
        If QrRomEmissaoPERC_IMPUREZA.Value <> 0 Then
        Begin
          Imp.WriteXY(2.5,wCont,'    ' + Bib.NumToTexto(QrRomEmissaoPerc_Impureza.Value,1,3));
          Imp.WriteXY(3.7,wCont,'    ' + Bib.NumToTexto((QrRomEmissaoPerc_Impureza.Value-QrRomEmissaoPerc_Tolera_Impureza.Value),2,3));
          Imp.WriteXY(4.9,wCont,'    ' + Bib.NumToTexto(pImpureza,0,5));
        End;

        Inc(wCont);
        Imp.WriteXY(0,wCont,'(-) Ardidos ');
        If QrRomEmissaoPERC_ARDIDOS.Value <> 0 Then
        Begin
          Imp.WriteXY(2.5,wCont,'    ' + Bib.NumToTexto(QrRomEmissaoPerc_Ardidos.Value,1,3));
          Imp.WriteXY(3.7,wCont,'    ' + Bib.NumToTexto((QrRomEmissaoPerc_Ardidos.Value - QrRomEmissaoPerc_Tolera_Ardidos.Value),2,3));
          Imp.WriteXY(4.9,wCont,'    ' + Bib.NumToTexto(pArdidos,0,5));
        End;

        inc(wCont);
        Imp.WriteXY(0,wCont,'(-) Avariados ');
        If QrRomEmissaoPERC_AVARIADO.Value <> 0 Then
        Begin
          Imp.WriteXY(2.5,wCont,'    ' + Bib.NumToTexto(QrRomEmissaoPerc_Avariado.Value,1,3));
          Imp.WriteXY(3.7,wCont,'    ' + Bib.NumToTexto((QrRomEmissaoPerc_Avariado.Value - QrRomEmissaoPerc_Tolera_Avariado.Value),2,3));
          Imp.WriteXY(4.9,wCont,'    ' + Bib.NumToTexto(pAvariados,0,5));
        End;

        Inc(wCont);
        Imp.WriteXY(0,wCont,'Descontos......'+Bib.NumToTexto(pTotalDescontos+pTriguilho,0,7)+'Kg');
        Inc(wCont);
        Imp.ConfiguraNegrito(IMP_CONF_NEGRITO_ON);
        Imp.WriteXY(0,wCont,'Peso Liquido...'+Bib.NumToTexto(QrRomEmissaopesobalanca.Value - pTotalDescontos - pTriguilho,0,7)+'Kg  '+Bib.NumToTexto((QrRomEmissaopesobalanca.Value - pTotalDescontos - pTriguilho)/QrRomEmissaoNUM_CONVERTE_FARDO.Value,2,7)+' Scs');
        Imp.ConfiguraNegrito(IMP_CONF_NEGRITO_OFF);
        Inc(wCont);

        If (PRateio <> 0) And (QrRomEmissaoCod_Cadastro.Value = QrRomEmissaoCod_Cadastro_Romaneio.Value) Then // quando for diferente do principal tem rateio senao nao tem
           Imp.WriteXY(0,wCont,'Renda(-).......'+Bib.NumToTexto(PRateio,0,7)+'Kg');
        Inc(wCont);
        Imp.ConfiguraNegrito(IMP_CONF_NEGRITO_ON);
        If (QrRomEmissaoCod_Cadastro.Value = QrRomEmissaoCod_Cadastro_Romaneio.Value) Then
           Imp.WriteXY(0,wCont,'Saldo Cliente..'+Bib.NumToTexto(QrRomEmissaopesobalanca.Value - QrRomEmissaoTotalDesconto.Value - PRateio ,0,7)+'Kg  '+Bib.NumToTexto((QrRomEmissaopesobalanca.Value - QrRomEmissaoTotalDesconto.Value - PRateio)/QrRomEmissaoNUM_CONVERTE_FARDO.Value,2,7)+' Scs')
        Else
        Begin
          Imp.WriteXY(0,wCont,'Saldo Cliente..'+Bib.NumToTexto(QrRomEmissaoliquido.Value,0,7)+'Kg  '+Bib.NumToTexto(QrRomEmissaoliquido.Value/QrRomEmissaoNUM_CONVERTE_FARDO.Value,2,7)+' Scs');
          inc(wCont);
          Imp.WriteXY(0,wCont,'Renda Recebida: '+DmOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRRomEmissaoCod_Cadastro_Romaneio.Text));
        end;
        Imp.ConfiguraNegrito(IMP_CONF_NEGRITO_OFF);

        inc(wCont);
        Imp.WriteXY(0,wcont,'DERIVADOS');
        inc(wCont);
        Imp.WriteXY(0,wCont,'(-) Quebrados');
        If QrRomEmissaoPERC_QUEBRADOS.Value <> 0 Then
        Begin
          Imp.WriteXY(2.5,wCont,Bib.NumToTexto(QrRomEmissaoPERC_QUEBRADOS.Value,1,3));
          Imp.WriteXY(4.5,wCont,Bib.NumToTexto(pQuebrados,0,5));
        End;

        Inc(wCont);
        Imp.WriteXY(0,wCont,'(-) Triguilho');
        If (QrRomEmissaoPERC_TRIGUILHO.Value > 0) Or (QrRomEmissaoPerc_PH.Value > 0) Then
         Begin
           Inc(wCont);
           Imp.WriteXY(2.5,wCont,Bib.NumToTexto(QrRomEmissaoPERC_TRIGUILHO.Value,1,3));
           Imp.WriteXY(4.5,wCont,Bib.NumToTexto(pTriguilho,0,5));
         End;
        Inc(wCont);
        Imp.WriteXY(0,wCont,'PH: '+FloatToStr(QrRomEmissaoPerc_PH.Value));
       // inc(wCont);
        //Imp.WriteXY(0,wCont,'Total Descontos');
        //Imp.WriteXY(4.5,wCont,Bib.NumToTexto(pTotalDescontos+pTriguilho,0,5)+'Kg');
        Inc(wCont);
        Imp.WriteXY(0,wCont,'.');
        Imp.ConfiguraCondensado('CONDENSADO_OFF');
        Imp.WriteXY(0,wCont,Divisao);
        Inc(wCont);
        Imp.WriteXY(0,wCont,'Obs:'+QrRomEmissaoDESC_OBSERVACAO.text);
        Inc(wCont);
        Imp.WriteXY(0,wCont,'Msg:'+QrRomEmissaoDESC_MENSAGEM.text);
        Inc(wCont,2);
        Imp.WriteXY(0,wCont,'___________________________________');
        Inc(wCont);
        wUsuario := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO','COD_USUARIO = '+FloatToStr(DMRomaneioAgricola.QRomaneioCod_Usuario.Value));
        Imp.WriteXY(0,wCont,wUsuario);
        Imp.WriteXY(11,wCont,QrRomEmissaoNOME_MOTORISTA.Text);
        Inc(wCont);
        Imp.WriteXY(11,wCont,'');
        Inc(wCont);
        Imp.WriteXY(11,wCont,'');
        wCont := wCont + 7; //Necessário o espaço para no picote do papel aparecer o nome do motorista. Junior-07/7/2017. Solicitado Marcos
        Inc(wCont);
        Imp.WriteXY(11,wCont,'');
      end;
    end;
  end;
end;

Procedure TFRomaneioImpressao.Romaneio_Tofeco;
var wCont : Byte;
begin
  wCont := 0;
  with DMRomaneioAgricola do
  begin
    Imp.WriteXY(0,wCont,Chr(27)+chr(71));
    Imp.WriteXY(0,wCont,QrRomEmissaoDESC_FILIAL.Text+'   FONE:'+QrRomEmissaoDesc_Telefone.Value);
    Inc(wCont);
    If QrRomEmissaoIND_TIPO_ROMANEIO.Value = 'ROMANEIO' Then
      Imp.WriteXY(0,wCont,'Romaneio de Entrada Nr.:'+QrRomEmissaoNUM_ROMANEIO.Text+'  '+IntToStr(QrRomEmissao.RecNo)+'/'+IntToStr(QrRomEmissao.RecordCount))
    Else If QrRomEmissaoIND_TIPO_ROMANEIO.Value = 'TRANSF ENT' Then
      Imp.WriteXY(0,wCont,'Transf. Entrada:'+QrRomEmissaoNUM_ROMANEIO.Text)
    Else
      Imp.WriteXY(0,wCont,'Transf. Saída:'+QrRomEmissaoNUM_ROMANEIO.Text);
    Imp.WriteXY(0,wCont,Chr(27)+chr(72));
    Inc(wCont);
    Imp.WriteXY(0,wCont,Trim(QrRomEmissaoCIDADE_FILIAL.Text)+ ' - '+QrRomEmissaoEstado_Filial.Value);
    Imp.WriteXY(11,wCont,'Dt.Emissao:'+QrRomEmissaoDt_Emissao.Text+'  '+TimeToStr(Time));
    Inc(wCont);
    Imp.WriteXY(0,wCont,'--------------------------------------------------------------------------------');
    Inc(wCont);
    Imp.WriteXY(0,wCont,Chr(27)+chr(71));
    Imp.WriteXY(0,wCont,'CLIENTE..:'+Trim(QrRomEmissaoNOME.Text) + '-' + QrRomEmissaoCOD_CADASTRO.Text);
    Imp.WriteXY(0,wCont,Chr(27)+chr(72));
    Inc(wCont);
    Imp.WriteXY(0,wCont,'ENDERECO.:'+Trim(QrRomEmissaoENDERECO_CADASTRO.Text)+' - ' + Trim(QrRomEmissaoCIDADE_CADASTRO.Text) + ' - ' + Trim(QrRomEmissaoESTADO_CADASTRO.Text));
    Inc(wCont);
    Imp.WriteXY(0,wCont,'CNPJ/CPF.:'+QrRomEmissaoCGC_CPF_CLIENTE.Text + '   IE/RG..:'+QrRomEmissaoNUM_INSCRICAO.Text);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Placa....:'+QrRomEmissaoDESC_PLACA.text);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Ticket...:'+QrRomEmissaoNUM_TICKET.text + '    NF PRODUTOR:'+QrRomEmissaoNUM_NOTA_PRODUTOR.Text + '  DT. PAGAMENTO:'+QrRomEmissaoDt_Vencto.Text);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'--------------------------------------------------------------------------------');
    Inc(wCont);
    Imp.WriteXY(0,wCont,Chr(27)+chr(71));
    Imp.WriteXY(0,wCont,QrRomEmissaoDESC_PRODUTO.Text);
    Imp.WriteXY(0,wCont,Chr(27)+chr(72));
    Inc(wCont);
    Imp.WriteXY(0,wCont,'VALOR P/TON:'+Bib.NumToTexto(QrRomEmissaoVal_Preco_Venda.Value,2,9));
    Imp.WriteXY(9,wCont,'RENDA:'+Bib.NumToTexto(QrRomEmissaoPerc_Renda.Value,2,5));
    Imp.WriteXY(14,wCont,'DESCONTO        DESCONTO');
    Inc(wCont);
    Imp.WriteXY(4.3,wCont,'KILOS');
    Imp.WriteXY(14,wCont,'       %           KILOS');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'--------------------------------------------------------------------------------');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Peso Bruto....:'+Bib.NumToTexto(QrRomEmissaoQT_PESO_BRUTO.Value,0,7)+'Kg   ');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'(-) Tara......:'+Bib.NumToTexto(QrRomEmissaoQT_TARA.Value,0,7)+'Kg   ');
    Imp.WriteXY(10.5,wCont,'(-) Impureza');
    If QrRomEmissaoPERC_IMPUREZA.Value <> 0 Then
    Begin
      Imp.WriteXY(15.1,wCont,Bib.NumToTexto(QrRomEmissaoPerc_Impureza.Value,1,3));
      Imp.WriteXY(18.7,wCont,Bib.NumToTexto(pImpureza,0,5));
    End;
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Total Bruto...;'+Bib.NumToTexto(QrRomEmissaopesobalanca.Value,0,7)+'Kg  ');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Descontos.....:'+Bib.NumToTexto(pTotalDescontos+pTriguilho,0,7)+'Kg');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Peso Liquido..:'+Bib.NumToTexto(QrRomEmissaopesobalanca.Value - pTotalDescontos - pTriguilho,0,7)+'Kg  ');
    If (QrRomEmissaoCod_Transportadora.Value > 0) Then
     Begin
       Inc(wCont);
       Imp.WriteXY(0,wCont,'Freteiro......: '+DmOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRRomEmissaoCod_Transportadora.Text));
       Imp.WriteXY(11,wCont,'Valor.:'+Bib.NumToTexto(QrRomEmissaoVl_Frete.Value,2,9)+' Vencto:'+QrRomEmissaoDt_Vencto_Frete.Text);
       {Adicionado para exibir o valor total do freteiro a pedido da Daniele. Junior - 30-11-2012}
       Inc(wCont);
       Imp.WriteXY(0,wCont,'Total do freteiro: '+bib.numToTexto(((QrRomEmissaopesobalanca.Value - pTotalDescontos - pTriguilho)*QrRomEmissaoVl_Frete.Value),0,7));
     End;
    If (QrRomEmissaoCod_Arranquio.Value > 0) Then
     Begin
       Inc(wCont);
       Imp.WriteXY(0,wCont,'Arranquio.....: '+DmOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + QrRomEmissaoCod_Arranquio.Text));
       Imp.WriteXY(11,wCont,'Valor.:'+Bib.NumToTexto(QrRomEmissaoVl_Arranquio.Value,2,9)+' Vencto:'+QrRomEmissaoDt_Vencto_Arranquio.Text);
     End;
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Observacao....:'+QrRomEmissaoDESC_OBSERVACAO.text);
    Inc(wCont,2);
    Imp.WriteXY(0,wCont,'___________________________________');
    Imp.WriteXY(11,wCont,'___________________________________');
  end;
end;


end.
