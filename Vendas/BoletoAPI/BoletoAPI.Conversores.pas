unit BoletoAPI.Conversores;

interface

uses
  // Comuns
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StrUtils, Variants
  // Cemapa
  , UFilial_cl
  , UContasReceber_cl
  , UOracle_cl
  , BoletoApi.Interfaces
  // Banco
  , DB
  //Oracle
  , OraTeste
  //ACBR
  , ACBrBase, ACBrBoleto, ACBrUtil, ACBrMail, ACBrUtil.FilesIO, blcksock,
  ACBrDFeSSL, pcnConversao, ACBrBoletoConversao, ACBrBoletoRetorno,
  ACBrBoletoFCFortesFr;

type
  TConversoresApi = class

  public
    class function ConverteCodigoJuros(sCodigoJuro: String): TACBrCodigoJuros;
    class function ConverteAceiteTitulo(sAceiteTitulo: String): TACBrAceiteTitulo;
    class function ConverteTipoDiasIntrucao(sTipoDiasIntrucao: String): TACBrTipoDiasIntrucao; 
    class function ConverteTipoImpressao(sTipoImpressao: String): TACBrTipoImpressao; 
    class function ConverteTipoDocumento(sTipoDocumento: String): TACBrTipoDocumento; 
    class function ConverteTipoCarteira(sTipoCarteira: String): TACBrTipoCarteira; 
    class function ConverteCarteiraEnvio(sCarteiraEnvio: String): TACBrCarteiraEnvio; 
    class function ConverteCodigoDesconto(sCodigoDesconto: String): TACBrCodigoDesconto; 
    class function ConverteCodigoMulta(sCodigoMulta: String): TACBrCodigoMulta; 
    class function ConverteCodigoNegativacao(sCodigoNegativacao: String): TACBrCodigoNegativacao; 
    class function ConverteOperacao(sOperacao: String): TOperacao; 
    class function ConverteTipoPagamento(sTipoPagamento: String): TTipo_Pagamento; 
    class function ConverteIndicadorSituacaoBoleto(sIndicadorSituacaoBoleto: String): TACBrIndicadorSituacaoBoleto; 
    class function ConverteIndicadorBoletoVencido(sIndicadorBoletoVencido: String): TACBrIndicadorBoletoVencido; 
    class function ConverteResponEmissao(sResponEmissao: String): TACBrResponEmissao; 
    class function ConverteIdentDistribuicao(sIdentDistribuicao: String): TACBrIdentDistribuicao; 
    class function ConverteCaracTitulo(sCaracTitulo: String): TACBrCaracTitulo; 
    class function ConvertePessoa(sPessoa: String): TACBrPessoa; 
    class function ConverteBolLayOut(sBolLayOut: String): TACBrBolLayOut; 
    class function ConverteCodigoMora(sCodMora: String): String; 
    class function ConverteTipoAmbiente(sAmbiente: String): TTipoAmbienteWS;
    class function ConverteCaracteresHTML(sTexto: String): String;

  end;

implementation


 {    Conversores - todos aqui. SE PRECISO, ADICIONAR NOVOS ABAIXO, DEIXAR O BOLETO ACIMA  }

class function TConversoresApi.ConverteAceiteTitulo(
  sAceiteTitulo: String): TACBrAceiteTitulo;
begin
  {
  Result := StrToEnumerado(ok,
                            sAceiteTitulo,
                            ['SIM', 'S', 'NÃO', 'NAO', 'N'],
                            [atSim, atSim, atNao, atNao, atNao]);
  }

  if (sAceiteTitulo = 'SIM') OR (sAceiteTitulo = 'S')  then
    Result := atSim
  else
    Result := atNao;

end;

class function TConversoresApi.ConverteBolLayOut(
  sBolLayOut: String): TACBrBolLayOut;
begin
  {
  Result := StrToEnumerado(ok,
                            sBolLayOut,
                            ['BOLETO', 'CARNE', 'FATURA', 'ENTREGA', 'ENTREGA2', 'RECIBOTOPO',
                                'FATURADETALHADA', 'TERMICA80', 'PIX', 'SERVICOS', 'CARNEA5'],
                            [lPadrao, lCarne, lFatura, lPadraoEntrega, lPadraoEntrega2, lReciboTopo,
                                lFaturaDetal, lTermica80mm, lPadraoPIX, lPrestaServicos, lCarneA5]);

   }
  Result := lPadraoPIX;

end;

class function TConversoresApi.ConverteCaracTitulo(
  sCaracTitulo: String): TACBrCaracTitulo;
begin
  {
  Result := StrToEnumerado(ok,
                            sCaracTitulo,
                            ['DIRETAESPECIAL', 'VINCULADA', 'CAUCIONADA', 'DESCONTADA', 'BBVENDOR',
                                'DIRETA', 'SIMPLESCOMREGISTRO', 'CAUCIONADACOMREGISTRO', 'SIMPLES'],
                            [tcDiretaEspecial, tcVinculada, tcCaucionada, tcDescontada, tcVendor,
                                tcDireta, tcSimplesRapComReg, tcCaucionadaRapComReg, tcSimples]);
  }

  if (sCaracTitulo = 'DIRETAESPECIAL') then
    Result := tcDiretaEspecial;
  if (sCaracTitulo = 'VINCULADA') then
    Result := tcVinculada;
  if (sCaracTitulo = 'CAUCIONADA') then
    Result := tcCaucionada;
  if (sCaracTitulo = 'DESCONTADA') then
    Result := tcDescontada;
  if (sCaracTitulo = 'BBVENDOR') then
    Result := tcVendor;
  if (sCaracTitulo = 'DIRETA') then
    Result := tcDireta;
  if (sCaracTitulo = 'SIMPLESCOMREGISTRO') then
    Result := tcSimplesRapComReg;
  if (sCaracTitulo = 'CAUCIONADACOMREGISTRO') then
    Result := tcCaucionadaRapComReg
  else
    Result := tcSimples;

end;

class function TConversoresApi.ConverteCarteiraEnvio(
  sCarteiraEnvio: String): TACBrCarteiraEnvio;
begin

  {
  Result := StrToEnumerado(ok,
                            sCarteiraEnvio,
                            ['BANCO', 'BANCOEMAIL', 'CEDENTE'],
                            [tceBanco, tceBancoEmail, tceCedente]);
  }

  if (sCarteiraEnvio = 'BANCO') then
    Result := tceBanco;
  if (sCarteiraEnvio = 'BANCOEMAIL') then
    Result := tceBancoEmail
  else
    Result := tceCedente;

end;

class function TConversoresApi.ConverteCodigoDesconto(
  sCodigoDesconto: String): TACBrCodigoDesconto;
begin

{
  Result := StrToEnumerado(ok,
                            sCodigoDesconto,
                            ['VALOR', 'PERCENTUAL', 'SEMDESCONTO'],
                            [cdValorFixo, cdPercentual, cdSemDesconto]);
  }

  if (sCodigoDesconto = 'VALOR') then
    Result := cdValorFixo;
  if (sCodigoDesconto = 'PERCENTUAL') then
    Result := cdPercentual
  else
    Result := cdSemDesconto;

end;

class function TConversoresApi.ConverteCodigoJuros(
  sCodigoJuro: String): TACBrCodigoJuros;
begin

  {
  Result := StrToEnumerado(ok,
                            sCodigoJuro,
                            ['VALORDIA', 'TAXAMENSAL', 'ISENTO', 'VALORMENSAL', 'TAXADIARIA', 'TAXAMENSAL'],
                            [cjValorDia, cjTaxaMensal, cjIsento, cjValorMensal, cjTaxaDiaria, cjTaxaMensal]);
  }

  if (sCodigoJuro = 'VALORDIA') then
    Result := cjValorDia;
  if (sCodigoJuro = 'TAXAMENSAL') then
    Result := cjTaxaMensal;
  if (sCodigoJuro = 'ISENTO') then
    Result := cjIsento;
  if (sCodigoJuro = 'VALORMES') then
    Result := cjValorMensal;
  if (sCodigoJuro = 'TAXADIARIO') then
    Result := cjTaxaDiaria
  else
    Result := cjValorMensal;

end;

class function TConversoresApi.ConverteCodigoMulta(
  sCodigoMulta: String): TACBrCodigoMulta;
begin

  {
  Result := StrToEnumerado(ok,
                            sCodigoMulta,
                            ['VALOR', 'PERCENTUAL', 'ISENTO'],
                            [cmValorFixo, cmPercentual, cmIsento]);
  }

  if (sCodigoMulta = 'VALOR') then
    Result := cmValorFixo;
  if (sCodigoMulta = 'PERCENTUAL') then
    Result := cmPercentual
  else
    Result := cmIsento;

end;

class function TConversoresApi.ConverteCodigoNegativacao(
  sCodigoNegativacao: String): TACBrCodigoNegativacao;
begin

  {
  Result := StrToEnumerado(ok,
                            sCodigoNegativacao,
                            ['CORRIDO', 'UTEIS', 'NAOPROTESTAR', 'NEGATIVAR',
                                  'NAONEGATIVAR', 'CANCELAMENTO', 'NENHUM'],
                            [cnProtestarCorrido, cnProtestarUteis, cnNaoProtestar, cnNegativar,
                                  cnNaoNegativar, cnCancelamento, cnNenhum]);
  }

  if (sCodigoNegativacao = 'CORRIDO') then
    Result := cnProtestarCorrido;
  if (sCodigoNegativacao = 'UTEIS') then
    Result := cnProtestarUteis;
  if (sCodigoNegativacao = 'NAOPROTESTAR') then
    Result := cnNaoProtestar;
  if (sCodigoNegativacao = 'NEGATIVAR') then
    Result := cnNegativar;
  if (sCodigoNegativacao = 'NAONEGATIVAR') then
    Result := cnNaoNegativar;
  if (sCodigoNegativacao = 'CANCELAMENTO') then
    Result := cnCancelamento
  else
    Result := cnNenhum;

end;

class function TConversoresApi.ConverteIndicadorBoletoVencido(
  sIndicadorBoletoVencido: String): TACBrIndicadorBoletoVencido;
begin

  {
  Result := StrToEnumerado(ok,
                            sIndicadorBoletoVencido,
                            ['SIM', 'S', 'NÃO', 'N', 'NENHUM'],
                            [ibvSim, ibvSim, ibvNao, ibvNao, ibvNenhum]);
  }

  if (sIndicadorBoletoVencido = 'SIM') OR (sIndicadorBoletoVencido = 'S') then
    Result := ibvSim;
  if (sIndicadorBoletoVencido = 'NÃO') OR (sIndicadorBoletoVencido = 'N')  then
    Result := ibvNao
  else
    Result := ibvNenhum;

end;

class function TConversoresApi.ConverteIndicadorSituacaoBoleto(
  sIndicadorSituacaoBoleto: String): TACBrIndicadorSituacaoBoleto;
begin

  {
  Result := StrToEnumerado(ok,
                            sIndicadorSituacaoBoleto,
                            ['ABERTO', 'BAIXADO', 'NENHUM'],
                            [isbAberto, isbBaixado, isbNenhum]);
  }

  if (sIndicadorSituacaoBoleto = 'ABERTO') then
    Result := isbAberto;
  if (sIndicadorSituacaoBoleto = 'BAIXADO') then
    Result := isbBaixado
  else
    Result := isbNenhum;

end;

class function TConversoresApi.ConverteOperacao(sOperacao: String): TOperacao;
begin

  {
  Result := StrToEnumerado(ok,
                            sOperacao,
                            ['INCLUI', 'ALTERA', 'BAIXA', 'CONSULTA', 'CONSULTADETALHE',
                               'PIXCRIAR', 'PIXCANCELAR', 'PIXCONSULTAR', 'CANCELAR', 'TICKET'],
                            [  tpInclui, tpAltera, tpBaixa, tpConsulta, tpConsultaDetalhe,
                                tpPIXCriar, tpPIXCancelar, tpPIXConsultar, tpCancelar, tpTicket]);
  }




  if (sOperacao = 'ALTERA') then
    Result := tpAltera;
  if (sOperacao = 'BAIXA') then
    Result := tpBaixa;
  if (sOperacao = 'CONSULTA') then
    Result := tpConsulta;
  if (sOperacao = 'CONSULTADETALHE') then
    Result := tpConsultaDetalhe;
  if (sOperacao = 'PIXCRIAR') then
    Result := tpPIXCriar;
  if (sOperacao = 'PIXCANCELAR') then
    Result := tpPIXCancelar;
  if (sOperacao = 'PIXCONSULTAR') then
    Result := tpPIXConsultar;
  if (sOperacao = 'CANCELAR') then
    Result := tpCancelar;
  if (sOperacao = 'TICKET') then
    Result := tpTicket
  else 
    Result := tpInclui;


end;

class function TConversoresApi.ConvertePessoa(sPessoa: String): TACBrPessoa;
begin

  {
  Result := StrToEnumerado(ok,
                            sPessoa,
                            ['FÍSICA', 'F', 'JURÍDICA', 'J', 'OUTROS', 'NENHUM'],
                            [pFisica, pFisica, pJuridica, pJuridica, pOutras, pNenhum]);
  }

  if (sPessoa = 'FÍSICA') OR (sPessoa = 'F') then
    Result := pFisica;
  if (sPessoa = 'JURÍDICA') OR (sPessoa = 'J') then
    Result := pJuridica;
  if (sPessoa = 'OUTROS') then
    Result := pOutras
  else
    Result := pNenhum;

end;

class function TConversoresApi.ConverteResponEmissao(
  sResponEmissao: String): TACBrResponEmissao;
begin

  {
  Result := StrToEnumerado(ok,
                            sResponEmissao,
                            ['CLIENTE', 'BANCO', 'BANCOREEMITE', 'BANCONAOREEMITE', 'BANCOPREEMITE'],
                            [tbCliEmite, tbBancoEmite, tbBancoReemite, tbBancoNaoReemite, tbBancoPreEmite]);
  }

  if (sResponEmissao = '1') then
    Result := tbBancoEmite;
  if (sResponEmissao = '2') then
    Result := tbCliEmite;
  if (sResponEmissao = '3') then
    Result := tbBancoPreEmite;
  if (sResponEmissao = '4') then
    Result := tbBancoReemite;
  if (sResponEmissao = '5') then
    Result := tbBancoNaoReemite;


end;

class function TConversoresApi.ConverteTipoCarteira(
  sTipoCarteira: String): TACBrTipoCarteira;
begin

  {
  Result := StrToEnumerado(ok,
                            sTipoCarteira,
                            ['SIMPLES', 'REGISTRADA', 'ELETRONICA'],
                            [tctSimples, tctRegistrada, tctEletronica]);
  }



  if (sTipoCarteira = 'SIMPLES') then
    Result := tctSimples;
  if (sTipoCarteira = 'REGISTRADA') then
    Result := tctRegistrada
  else
    Result := tctEletronica;

end;

class function TConversoresApi.ConverteTipoDiasIntrucao(
  sTipoDiasIntrucao: String): TACBrTipoDiasIntrucao;
begin

  {
  Result := StrToEnumerado(ok,
                            sTipoDiasIntrucao,
                            ['CORRIDOS', 'UTEIS'],
                            [diCorridos, diUteis]);
  }


  if (sTipoDiasIntrucao = 'UTEIS') then
    Result := diUteis
  else
    Result := diCorridos;

end;

class function TConversoresApi.ConverteTipoDocumento(
  sTipoDocumento: String): TACBrTipoDocumento;
begin

  {
  Result := StrToEnumerado(ok,
                            sCodigoJuro,
                            ['TRADICIONAL', 'ESCRITURAL'],
                            [1, 2]);
  }

  if (sTipoDocumento = 'TRADICIONAL') then
    Result := TACBrTipoDocumento(1)
  else
    Result := TACBrTipoDocumento(2);

end;

class function TConversoresApi.ConverteTipoImpressao(
  sTipoImpressao: String): TACBrTipoImpressao;
begin

  {
  Result := StrToEnumerado(ok,
                            sTipoImpressao,
                            ['CARNE', 'NORMAL'],
                            [tipCarne, tipNormal]);
  }


  if (sTipoImpressao = 'CARNE') then
    Result := tipCarne
  else
    Result := tipNormal;

end;

class function TConversoresApi.ConverteTipoPagamento(
  sTipoPagamento: String): TTipo_Pagamento;
begin

  {
  Result := StrToEnumerado(ok,
                            sTipoPagamento,
                            ['ACEITA_QUALQUER_VALOR', 'ACEITA_VALORES_ENTRE_MINIMO_MAXIMO',
                              'NAO_ACEITA_VALOR_DIVERGENTE', 'SOMENTE_VALOR_MINIMO'],
                            [tpAceita_Qualquer_Valor, tpAceita_Valores_entre_Minimo_Maximo,
                              tpNao_Aceita_Valor_Divergente, tpSomente_Valor_Minimo]);
  }

  if (sTipoPagamento = 'QUALQUER') then
    Result := tpAceita_Qualquer_Valor;
  if (sTipoPagamento = 'ENTREMINMAX') then
    Result := tpAceita_Valores_entre_Minimo_Maximo;
  if (sTipoPagamento = 'MINIMO') then
    Result := tpSomente_Valor_Minimo
  else
    Result := tpNao_Aceita_Valor_Divergente;

end;

class function TConversoresApi.ConverteIdentDistribuicao(
  sIdentDistribuicao: String): TACBrIdentDistribuicao;
begin

  {
  Result := StrToEnumerado(ok,
                            sIdentDistribuicao,
                            ['BANCO', 'CLIENTE'],
                            [tbBancoDistribui, tbClienteDistribui]);
  }

  if (sIdentDistribuicao = '1') then
    Result := tbBancoDistribui
  else
    Result := tbClienteDistribui;


end;

class function TConversoresApi.ConverteCodigoMora(sCodMora: String): String;
begin
  // Retorna A para valor e B para percentual
  Result := 'A';

  if sCodMora = 'PERCENTUAL' THEN
    Result := 'B';

end;

class function TConversoresApi.ConverteTipoAmbiente(sAmbiente: String): TTipoAmbienteWS;
begin
  // Retorna o tipo de ambiente do boleto
  Result := tawsHomologacao;

  if sAmbiente = 'H' THEN
    Result := tawsHomologacao;

  if sAmbiente = 'P' THEN
    Result := tawsProducao;

  if sAmbiente = 'S' THEN
    Result := tawsSandBox;

end;

class function TConversoresApi.ConverteCaracteresHTML(
  sTexto: String): String;
begin
  Result := sTexto;

  // Pontuação e símbolos comuns
  Result := StringReplace(Result, '&', '&amp;', [rfReplaceAll]);
  Result := StringReplace(Result, '"', '&quot;', [rfReplaceAll]);
  Result := StringReplace(Result, '''', '&#39;', [rfReplaceAll]);
  Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
  Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
  Result := StringReplace(Result, '.', '&sdot;', [rfReplaceAll]);
  Result := StringReplace(Result, '°', '&deg;', [rfReplaceAll]);
  Result := StringReplace(Result, '±', '&plusmn;', [rfReplaceAll]);
  Result := StringReplace(Result, '÷', '&divide;', [rfReplaceAll]);
  Result := StringReplace(Result, '×', '&times;', [rfReplaceAll]);
  Result := StringReplace(Result, '©', '&copy;', [rfReplaceAll]);
  Result := StringReplace(Result, '®', '&reg;', [rfReplaceAll]);
  Result := StringReplace(Result, '™', '&trade;', [rfReplaceAll]);
  Result := StringReplace(Result, '€', '&euro;', [rfReplaceAll]);
  Result := StringReplace(Result, '£', '&pound;', [rfReplaceAll]);
  Result := StringReplace(Result, '¥', '&yen;', [rfReplaceAll]);
  Result := StringReplace(Result, '¢', '&cent;', [rfReplaceAll]);
  Result := StringReplace(Result, '§', '&sect;', [rfReplaceAll]);
  Result := StringReplace(Result, '¶', '&para;', [rfReplaceAll]);
  Result := StringReplace(Result, '¬', '&not;', [rfReplaceAll]);

  // Acentos comuns
  Result := StringReplace(Result, 'á', '&aacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'à', '&agrave;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ã', '&atilde;', [rfReplaceAll]);
  Result := StringReplace(Result, 'â', '&acirc;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ä', '&auml;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Á', '&Aacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'À', '&Agrave;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Â', '&Acirc;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ã', '&Atilde;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ä', '&Auml;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ç', '&ccedil;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ç', '&Ccedil;', [rfReplaceAll]);
  Result := StringReplace(Result, 'é', '&eacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'è', '&egrave;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ê', '&ecirc;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ë', '&euml;', [rfReplaceAll]);
  Result := StringReplace(Result, 'É', '&Eacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'È', '&Egrave;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ê', '&Ecirc;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ë', '&Euml;', [rfReplaceAll]);
  Result := StringReplace(Result, 'í', '&iacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ì', '&igrave;', [rfReplaceAll]);
  Result := StringReplace(Result, 'î', '&icirc;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ï', '&iuml;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Í', '&Iacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ì', '&Igrave;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Î', '&Icirc;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ï', '&Iuml;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ó', '&oacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ò', '&ograve;', [rfReplaceAll]);
  Result := StringReplace(Result, 'õ', '&otilde;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ô', '&ocirc;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ö', '&ouml;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ó', '&Oacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ò', '&Ograve;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ô', '&Ocirc;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Õ', '&Otilde;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ö', '&Ouml;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ú', '&uacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ù', '&ugrave;', [rfReplaceAll]);
  Result := StringReplace(Result, 'û', '&ucirc;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ü', '&uuml;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ú', '&Uacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ù', '&Ugrave;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Û', '&Ucirc;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ü', '&Uuml;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ñ', '&ntilde;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ñ', '&Ntilde;', [rfReplaceAll]);

end;

end.
