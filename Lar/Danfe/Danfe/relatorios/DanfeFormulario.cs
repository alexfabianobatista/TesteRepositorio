using System;
using System.Collections.Generic;
using System.Text;
using Danfe.relatorios.dataSource;
using CDSSoftware;
using System.Data;
using System.Diagnostics;

namespace Danfe.relatorios
{
    /// <summary>
    /// Esta classe imprime danfe para impressoras matriciais
    /// que utilizem linguagem Epson ESC/P2
    /// </summary>
    class DanfeFormulario
    {
        private string msg = "Consulta de autenticidade no portal nacional de NF-e";
        private string msg1 = "www.nfe.fazenda.gov.br/portal ou no site da Sefaz Autorizadora";
        private ImprimeTexto imp;
        private int contLinhasAd = 0;
        private int linhasAdPorFolha = 6;
        private int linhasPorFolha = 17;
        private int contLinhas = 0;
        
        public void geraCodBarraMatricial(string chave)
        {   
            //52       
            imp.ImpLF(imp.Comprimido + criaEspaco(52) + (char)27 + (char)40 + (char)66 + (char)51 + (char)0 +
                (char)6 + (char)1 + (char)0 + (char)21 + (char)0 + (char)3 +
                (char)67 + chave);                 
        }

        public void imprime(notasDataSource dados)
        {
            imp = new ImprimeTexto();
            imp.Inicio("LPT1");
            bool isLastPage = false;                        
            List<string> infAdicProd = new List<string>();            
            List<string> infObsLar = new List<string>();
            string obsLar = string.Empty;
            int numPagina = 0;
            int numFolhas = contaPaginas(dados);

            while (!isLastPage)
            {
                #region filial
                geraCodBarraMatricial(dados.TB_NFE[0].CHAVE_ACESSO_NAO_FORMATADA);                
                //imp.Imp((char)27 + "2"); // 1/6
                imp.Pula(1);                
                imp.ImpLF(criaEspaco(42) + imp.Comprimido + dados.TB_NFE[0].IND_ENTRADA_SAIDA);
                imp.ImpLF(criaEspaco(32) + imp.Comprimido + dados.TB_NFE[0].NUM_NFE);                
                imp.Imp(criaEspaco(33) + imp.Comprimido + dados.TB_NFE[0].SERIE);
                imp.Imp(criaEspaco(45) + imp.Comprimido + string.Format("{0}/{1}", (++numPagina).ToString(), numFolhas.ToString()));
                imp.ImpLF(criaEspaco(64) + imp.Comprimido + dados.TB_NFE[0].CHAVE_ACESSO);
                imp.Pula(1);
                imp.ImpLF(criaEspaco(0) + imp.Comprimido + dados.TB_FILIAL[0].DESC_ENDERECO);

                imp.Imp(criaEspaco(0) + string.Format("{0} - {1} - {2}",
                    imp.Comprimido + dados.TB_FILIAL[0].DESC_BAIRRO,
                    imp.Comprimido + dados.TB_FILIAL[0].DESC_CIDADE,
                    imp.Comprimido + dados.TB_FILIAL[0].COD_ESTADO));

                imp.ImpLF(criaEspaco(64) + imp.Comprimido + msg);
                imp.Imp(string.Format("FONE.: {0} CEP.: {1}",
                    imp.Comprimido + dados.TB_FILIAL[0].DESC_TELEFONE,
                    imp.Comprimido + dados.TB_FILIAL[0].DESC_CEP));
                imp.ImpLF(criaEspaco(64) + imp.Comprimido + msg1);
                imp.Pula(1);
                imp.Imp(criaEspaco(0) + imp.Comprimido + dados.TB_NFE[0].NATUREZA_OP);
                imp.ImpLF(criaEspaco(77) + imp.Comprimido + dados.TB_NFE[0].DADOS_DANFE);
                imp.Pula(1);
                imp.Imp(criaEspaco(0) + imp.Comprimido + dados.TB_FILIAL[0].DESC_INSCRICAO);
                //imp.Imp(criaEspaco(45) + imp.Comprimido + dados.TB_FILIAL[0].DESC_INSCRICAO_MUNICIPAL);
                imp.Imp(criaEspaco(100) + imp.Comprimido + dados.TB_FILIAL[0].NUM_CGC);
                #endregion

                #region destinatario
                imp.Pula(3);
                imp.Imp(criaEspaco(0) + imp.Comprimido + dados.TB_CADASTRO[0].NOME);
                imp.Imp(criaEspaco(93) + imp.Comprimido + dados.TB_CADASTRO[0].CNPJ);
                imp.ImpLF(criaEspaco(120) + imp.Comprimido + dados.TB_NFE[0].DT_EMISSAO);
                imp.Pula(1);
                imp.Imp(criaEspaco(0) + imp.Comprimido + dados.TB_CADASTRO[0].LOGRADOURO);
                imp.Imp(criaEspaco(79) + imp.Comprimido + dados.TB_CADASTRO[0].BAIRRO);
                imp.Imp(criaEspaco(100) + imp.Comprimido + dados.TB_CADASTRO[0].CEP);
                imp.ImpLF(criaEspaco(120) + imp.Comprimido + dados.TB_NFE[0].DT_SAIDA);
                imp.Pula(1);
                imp.Imp(criaEspaco(0) + imp.Comprimido + dados.TB_CADASTRO[0].CIDADE);
                imp.Imp(criaEspaco(49) + imp.Comprimido + dados.TB_CADASTRO[0].TELEFONE);
                imp.Imp(criaEspaco(75) + imp.Comprimido + dados.TB_CADASTRO[0].UF);
                imp.Imp(criaEspaco(95) + imp.Comprimido + dados.TB_CADASTRO[0].INSCRICAO_ESTADUAL);
                //imp.ImpLF(criaEspaco(120) + imp.Comprimido + dados.TB_NFE[0].HORA_NF);
                #endregion

                #region fatura
                imp.Pula(3);
                if (!string.IsNullOrEmpty(dados.TB_FATURA[0].MATRICULA))
                    imp.Imp(criaEspaco(0) + imp.Comprimido + dados.TB_FATURA[0].MATRICULA);
                if (!string.IsNullOrEmpty(dados.TB_FATURA[0].CMI))
                    imp.Imp(criaEspaco(30) + imp.Comprimido + dados.TB_FATURA[0].CMI);
                if (!string.IsNullOrEmpty(dados.TB_FATURA[0].CONDICAO_PAG))
                    imp.Imp(criaEspaco(45) + imp.Comprimido + dados.TB_FATURA[0].CONDICAO_PAG);
                if (!string.IsNullOrEmpty(dados.TB_FATURA[0].FINALIDADE))
                    imp.Imp(criaEspaco(95) + imp.Comprimido + dados.TB_FATURA[0].FINALIDADE);
                if (!string.IsNullOrEmpty(dados.TB_FATURA[0].VECTO))
                    imp.Imp(criaEspaco(115) + imp.Comprimido + dados.TB_FATURA[0].VECTO);
                if (!string.IsNullOrEmpty(dados.TB_FATURA[0].VENDEDOR))
                    imp.Imp(criaEspaco(125) + imp.Comprimido + dados.TB_FATURA[0].VENDEDOR);
                #endregion

                #region calculo imposto
                imp.Pula(3);
                imp.Imp(criaEspaco(0) + imp.Comprimido + dados.TB_CALCULO_IMPOSTO[0].BASE_CALCULO_ICMS);
                imp.Imp(criaEspaco(35) + imp.Comprimido + dados.TB_CALCULO_IMPOSTO[0].VALOR_ICMS);
                imp.Imp(criaEspaco(63) + imp.Comprimido + dados.TB_CALCULO_IMPOSTO[0].BASE_CALCULO_ICMS_SUBST);
                imp.Imp(criaEspaco(97) + imp.Comprimido + dados.TB_CALCULO_IMPOSTO[0].VALOR_ICMS_SUBST);
                imp.ImpLF(criaEspaco(125) + imp.Comprimido + dados.TB_CALCULO_IMPOSTO[0].VALOR_TOTAL_PRODUTOS);
                imp.Pula(1);
                imp.Imp(criaEspaco(0) + imp.Comprimido + dados.TB_CALCULO_IMPOSTO[0].VALOR_FRETE);
                imp.Imp(criaEspaco(35) + imp.Comprimido + dados.TB_CALCULO_IMPOSTO[0].VALOR_SEGURO);
                imp.Imp(criaEspaco(63) + imp.Comprimido + dados.TB_CALCULO_IMPOSTO[0].OUTRAS_DESPESAS_ACESS);
                imp.Imp(criaEspaco(97) + imp.Comprimido + dados.TB_CALCULO_IMPOSTO[0].VALOR_IPI);
                imp.ImpLF(criaEspaco(125) + imp.Comprimido + dados.TB_CALCULO_IMPOSTO[0].VALOR_TOTAL_NOTA);

                #endregion

                #region Transportador
                imp.Pula(2);
                imp.Imp(criaEspaco(0) + imp.Comprimido + dados.TB_TRANSPORTADOR[0].RAZAO_SOCIAL_TRANSP);
                imp.Imp(criaEspaco(75) + imp.Comprimido + dados.TB_TRANSPORTADOR[0].FRETE_POR_CONTA);
                imp.Imp(criaEspaco(91) + imp.Comprimido + dados.TB_TRANSPORTADOR[0].COD_ANTT);
                imp.Imp(criaEspaco(95) + imp.Comprimido + dados.TB_TRANSPORTADOR[0].PLACA_VEICULO);
                imp.Imp(criaEspaco(106) + imp.Comprimido + dados.TB_TRANSPORTADOR[0].UF_VEICULO);
                imp.ImpLF(criaEspaco(120) + imp.Comprimido + dados.TB_TRANSPORTADOR[0].CNPJ_TRANSP);
                imp.Pula(1);
                imp.Imp(criaEspaco(0) + imp.Comprimido + dados.TB_TRANSPORTADOR[0].ENDERECO_TRANSP);
                imp.Imp(criaEspaco(75) + imp.Comprimido + dados.TB_TRANSPORTADOR[0].CIDADE_TRANSP);
                imp.Imp(criaEspaco(109) + imp.Comprimido + dados.TB_TRANSPORTADOR[0].UF_TRANSP);
                imp.ImpLF(criaEspaco(120) + imp.Comprimido + dados.TB_TRANSPORTADOR[0].INSC_ESTADUAL_TRANSP);
                imp.Pula(1);
                imp.Imp(criaEspaco(0) + imp.Comprimido + dados.TB_TRANSPORTADOR[0].QUANTIDADE_TRANSP);
                imp.Imp(criaEspaco(25) + imp.Comprimido + dados.TB_TRANSPORTADOR[0].ESPECIE_TRANSP);
                imp.Imp(criaEspaco(40) + imp.Comprimido + dados.TB_TRANSPORTADOR[0].MARCA_TRANSP);
                imp.Imp(criaEspaco(75) + imp.Comprimido + dados.TB_TRANSPORTADOR[0].NUMERACAO_TRANSP);
                imp.Imp(criaEspaco(103) + imp.Comprimido + dados.TB_TRANSPORTADOR[0].PESO_BRUTO_TRANSP);
                imp.ImpLF(criaEspaco(125) + imp.Comprimido + dados.TB_TRANSPORTADOR[0].PESO_LIQ_TRANSP);
                #endregion

                #region Produtos                
                imp.Pula(1);                
                
                string codigo = string.Empty;
                string ncm = string.Empty;
                string cst = string.Empty;
                string cfop = string.Empty;
                string unid = string.Empty;
                string qtde = string.Empty;
                string valorUnit = string.Empty;
                string valorTot = string.Empty;
                string bCalcIcms = string.Empty;
                string valIcms = string.Empty;
                string aliqIcms = string.Empty;
                
                List<DataRow> drRemover = new List<DataRow>();
                foreach (DataRow drProd in dados.TB_PRODUTO.Rows)
                {
                    if (contLinhas < linhasPorFolha)
                    {
                        imp.Pula(1);
                        contLinhas++;

                        string infAdicionais = (string)drProd["INFADPROD"];
                        if (infAdicionais == ".")
                            infAdicionais = string.Empty;
                        string linhaInfAdicionais = string.Empty;
                        for (int i = 0; i <= infAdicionais.Length - 1; i++)
                        {
                            if (infAdicionais[i] == '\n')
                            {
                                if (!string.IsNullOrEmpty(linhaInfAdicionais))
                                {
                                    infAdicProd.Add(linhaInfAdicionais);
                                    linhaInfAdicionais = string.Empty;
                                }
                            }
                            else
                            {
                                linhaInfAdicionais += infAdicionais[i];
                                if (i == infAdicionais.Length - 1)
                                {                                    
                                    infAdicProd.Add(linhaInfAdicionais);
                                    linhaInfAdicionais = string.Empty;
                                }
                            }
                        }
                        if ((contLinhas + infAdicProd.Count) > linhasPorFolha)
                        {
                            isLastPage = false;
                            imprimeDadosAdicionais(imp, dados);
                            continue;                        
                        }
                        imp.Imp(criaEspaco(0) + imp.Comprimido + (string)drProd["COD_PRODUTO"]);
                        imp.Imp(criaEspaco(8) + imp.Comprimido + (string)drProd["DESC_PRODUTO"]);
                        if (drProd["NCM_SH"].ToString() != string.Empty)                                    
                            imp.Imp(criaEspaco(49) + imp.Comprimido + alinhaDireita(8,drProd["NCM_SH"].ToString()));
                        else
                            imp.Imp(criaEspaco(49) + imp.Comprimido + alinhaDireita(8,"0"));
                        if (drProd["CST_PRODUTO"].ToString() != string.Empty)
                            imp.Imp(criaEspaco(58) + imp.Comprimido + (string)drProd["CST_PRODUTO"]);
                        else
                            imp.Imp(criaEspaco(58) + imp.Comprimido + "00");
                        imp.Imp(criaEspaco(62) + imp.Comprimido + (string)drProd["CFOP_PRODUTO"]);
                        imp.Imp(criaEspaco(68) + imp.Comprimido + (string)drProd["UNIDADE_PRODUTO"]);
                        if (drProd["QT_PRODUTO"].ToString() != string.Empty)
                            imp.Imp(criaEspaco(72) + imp.Comprimido + alinhaDireita(12,(string)drProd["QT_PRODUTO"]));
                        else
                            imp.Imp(criaEspaco(72) + imp.Comprimido + alinhaDireita(12,"0,0000"));
                        if (drProd["VALOR_UNIT_PRODUTO"].ToString() != string.Empty)
                            imp.Imp(criaEspaco(85) + imp.Comprimido + alinhaDireita(11,(string)drProd["VALOR_UNIT_PRODUTO"]));
                        else
                            imp.Imp(criaEspaco(85) + imp.Comprimido + alinhaDireita(11, "0,0000"));
                        if (drProd["VALOR_TOTAL_PRODUTO"].ToString() != string.Empty)
                            imp.Imp(criaEspaco(97) + imp.Comprimido + alinhaDireita(12,(string)drProd["VALOR_TOTAL_PRODUTO"]));
                        else
                            imp.Imp(criaEspaco(97) + imp.Comprimido + alinhaDireita(12,"0,00"));
                        if (drProd["BC_ICMS_PRODUTO"].ToString() != string.Empty)
                            imp.Imp(criaEspaco(110) + imp.Comprimido + alinhaDireita(10,(string)drProd["BC_ICMS_PRODUTO"]));
                        else
                            imp.Imp(criaEspaco(110) + imp.Comprimido + alinhaDireita(10,"0,00"));
                        if (drProd["VALOR_ICMS_PRODUTO"].ToString() != string.Empty)
                            imp.Imp(criaEspaco(121) + imp.Comprimido + alinhaDireita(8,(string)drProd["VALOR_ICMS_PRODUTO"]));
                        else
                            imp.Imp(criaEspaco(121) + imp.Comprimido + alinhaDireita(8,"0,00"));
                        if (drProd["ALIQ_ICMS_PRODUTO"].ToString() != string.Empty)
                            imp.Imp(criaEspaco(131) + imp.Comprimido + alinhaDireita(4,(string)drProd["ALIQ_ICMS_PRODUTO"]));
                        else
                            imp.Imp(criaEspaco(131) + imp.Comprimido + alinhaDireita(4,"0,00"));
                        foreach (string s in infAdicProd)
                        {
                            imp.Pula(1);
                            imp.Imp(criaEspaco(0) + imp.Comprimido + s);
                            contLinhas++;
                        }
                        drRemover.Add(drProd);
                        infAdicProd.Clear();
                    }
                }
                foreach (DataRow dr in drRemover)
                {
                    dados.TB_PRODUTO.Rows.Remove(dr);
                }
                drRemover.Clear();

                
                obsLar = (string)dados.TB_NFE[0].OBS_LAR;
                
                string linhaObsLar = string.Empty;
                for (int i = 0; i <= obsLar.Length - 1; i++)
                {
                    if (obsLar[i] == '\n')
                    {
                        if (!string.IsNullOrEmpty(linhaObsLar))
                        {
                            infObsLar.Add(linhaObsLar);
                            linhaObsLar = string.Empty;
                        }
                    }
                    else
                    {
                        linhaObsLar += obsLar[i];
                        if (i == obsLar.Length - 1)
                        {
                            infObsLar.Add(linhaObsLar);
                            linhaObsLar = string.Empty;
                        }                                                
                    }
                }
                if ((infObsLar.Count + contLinhas) > linhasPorFolha)
                {
                    isLastPage = false;
                    infObsLar.Clear();
                    imprimeDadosAdicionais(imp, dados);
                    contLinhas = 0;
                    continue;
                }
                foreach (string s in infObsLar)
                {
                    imp.Pula(1);
                    imp.Imp(criaEspaco(0) + imp.Comprimido + s);
                    contLinhas++;
                }
                infObsLar.Clear();
                obsLar = string.Empty;
                imprimeDadosAdicionais(imp, dados);                
                isLastPage = true;
                #endregion
            }
            imp.Fim();
        }

        /// <summary>
        /// metodo que imprime os dados adicionais da danfe
        /// este codigo foi separado do metodo imprime pois precisa ser chamado
        /// em mais de 1 lugar no código no caso de a danfe possuir mais de 1 pagina
        /// </summary>
        /// <param name="imp">ImpremeTexto</param>
        /// <param name="dados">Dataset</param>
        public void imprimeDadosAdicionais(ImprimeTexto imp, notasDataSource dados)
        {
            List<string> infAdic = new List<string>();

            imp.Pula(linhasPorFolha - contLinhas + 2);            

            string infAd = dados.TB_NFE[0].DADOS_ADICIONAIS;
            if (infAd == ".")
                infAd = string.Empty;
            string linhaInfAd = string.Empty;
            for (int i = 0; i <= infAd.Length - 1; i++)
            {
                if (infAd[i] == '\n')                
                {
                    if (i < infAd.Length)
                    {
                        if (!string.IsNullOrEmpty(linhaInfAd))
                        {
                            infAdic.Add(linhaInfAd);
                            linhaInfAd = string.Empty;
                        }
                    }
                }
                else
                {
                    linhaInfAd += infAd[i];
                    if (i == infAd.Length - 1)
                    {                       
                        infAdic.Add(linhaInfAd);                        
                    }
                }
            }
            foreach (string s in infAdic)
            {
                if (contLinhasAd <= linhasAdPorFolha)
                {
                    imp.Pula(1);
                    imp.Imp(criaEspaco(0) + imp.Comprimido + s);
                    contLinhasAd++;
                }
            }
            imprimeCanhoto(imp, dados);
            contLinhasAd = 0; 
        }

        public void imprimeCanhoto(ImprimeTexto imp, notasDataSource dados)
        {
            imp.Pula(linhasAdPorFolha - contLinhasAd + 6);
            imp.Imp(criaEspaco(5) + imp.Comprimido + dados.TB_NFE[0].NUM_NFE);
            imp.Pula(5); //pula para proxima pagina
        }

        public int contaPaginas(notasDataSource dados)
        {
            int linhas = 0;
            string linhaAd = string.Empty;

            foreach (DataRow dr in dados.TB_PRODUTO.Rows)
            {
                linhas++;
                
                linhaAd = (string)dr["INFADPROD"];

                if (linhaAd != ".")
                {
                    linhas++;
                    for (int i = 0; i <= linhaAd.Length - 1; i++)
                    {
                        if (linhaAd[i] == '\n')
                        {
                            if(i < linhaAd.Length - 1)
                                linhas++;
                        }
                    }
                }
            }
           
            string obsLar = (string)dados.TB_NFE[0].OBS_LAR;
            if (!string.IsNullOrEmpty(obsLar))
            {
                linhas++;
                for (int i = 0; i <= obsLar.Length - 1; i++)
                {
                    if (obsLar[i] == '\n')
                    {
                        if(i < obsLar.Length - 1)
                        linhas++;
                    }
                }
            }
            if ((linhas % linhasPorFolha) > 0)
                return linhas / linhasPorFolha + 1;
            else
                return linhas / linhasPorFolha;                  
        }

        public string criaEspaco(int numero)
        {
            imp.Imp((char)13 + "");   
            string espaco = string.Empty;
            while (numero > 0)
            {
                espaco += " ";
                numero--;
            }
            return espaco;
        }

        private string alinhaDireita(int espaco, string valor)
        {
            string espacoEsquerda = string.Empty;
            espacoEsquerda = criaEspaco(espaco - valor.Length);
            return espacoEsquerda + valor;
        }
    }
}
