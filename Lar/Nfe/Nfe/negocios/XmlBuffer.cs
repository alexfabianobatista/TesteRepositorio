using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.IO;
using System.Security.Cryptography.X509Certificates;

namespace Nfe.negocios
{
    /// <summary>
    ///Classe estática que funciona como um buffer 
    /// de notas que são enviadas para SEFAZ
    /// </summary>
    public static class XmlBuffer
    {
        private static List<entidades.Nfe> buffer = new List<entidades.Nfe>();
        private static List<entidades.Nfe> bufferOrdenado = new List<entidades.Nfe>();        
        private static bool isLock = false;

        public static bool IsLock
        {
            get { return XmlBuffer.isLock; }
            set { XmlBuffer.isLock = value; }
        }

        public static List<entidades.Nfe> BufferOrdenado
        {
            get { return XmlBuffer.bufferOrdenado; }
            set { XmlBuffer.bufferOrdenado = value; }
        }

        public static List<entidades.Nfe> Buffer
        {
            get { return XmlBuffer.buffer; }
            set { XmlBuffer.buffer = value; }
        }

        public static void atualizaBufferPainel()
        {
            Nfe.forms.FServidor.servidor.setProgressBar(buffer.Count);
            Nfe.forms.FServidor.servidor.setContagemBuffer(buffer.Count);
        }

        /// <summary>
        /// percorre o buffer procurando elementos iguais (estado, ambiente e cnpj)
        /// monta o buffer ordenado com os elementos iguais para compor o lote
        /// </summary>
        public static void ordenaBuffer()
        {
            while (isLock)
            {
                continue;
            }
            isLock = true;

            try
            {
                bufferOrdenado.Clear();
                if (buffer.Count > 0)
                {
                    string ambiente = string.Empty;
                    string uf = string.Empty;
                    string cnpj = string.Empty;
                    string tipoEmis = string.Empty;
                    string ambienteOrd = string.Empty;
                    string ufOrd = string.Empty;
                    string emisOrd = string.Empty;
                    string cnpjOrd = string.Empty;

                    if (bufferOrdenado.Count == 0)
                    {
                        bufferOrdenado.Add(buffer[0]);
                        buffer.Remove(buffer[0]);
                    }
                    else
                        return;                    
                    
                    ufOrd = bufferOrdenado[0].Xml_nfe.DocumentElement.GetElementsByTagName("cUF")[0].InnerText;
                    ambienteOrd = bufferOrdenado[0].Xml_nfe.DocumentElement.GetElementsByTagName("tpAmb")[0].InnerText;
                    emisOrd = bufferOrdenado[0].Xml_nfe.DocumentElement.GetElementsByTagName("tpEmis")[0].InnerText;
                    cnpjOrd = BufferOrdenado[0].Xml_nfe.DocumentElement.GetElementsByTagName("CNPJ")[0].InnerText;
                                        
                    foreach (entidades.Nfe n in buffer)
                    {
                        uf = n.Xml_nfe.DocumentElement.GetElementsByTagName("cUF")[0].InnerText;
                        ambiente = n.Xml_nfe.DocumentElement.GetElementsByTagName("tpAmb")[0].InnerText;
                        tipoEmis = n.Xml_nfe.DocumentElement.GetElementsByTagName("tpEmis")[0].InnerText;
                        cnpj = n.Xml_nfe.DocumentElement.GetElementsByTagName("CNPJ")[0].InnerText;
                        if ((uf == ufOrd) && (ambiente == ambienteOrd) && (tipoEmis == emisOrd) && (cnpj == cnpjOrd))
                        {
                            bufferOrdenado.Add(n);
                        }
                    }                    
                    //percorre bufferOrdenado para excluir do buffer os itens encotrados           
                    foreach (entidades.Nfe n in bufferOrdenado)
                    {
                        buffer.Remove(n);
                    }
                }
            }
            catch (Exception ex)
            {
                forms.FServidor.servidor.adicionaMensagemLog(ex.Message);
                isLock = false;
                return;
                //throw ex;
            }
            isLock = false;
        }
                        
        /// <summary>
        /// Este metodo carrega os arquivos, assina, valida, insere no buffer e persiste no banco de dados.
        /// Caso ocorra algum erro persite a nota e o erro no banco de dados
        /// deleta o arquivo do repositorio
        /// </summary>
        /// <param name="paths"></param>
        public static void adiciona(string[] paths)
        {
            string[] aux = new string[paths.Length];
            List<string> resultado;
            isLock = true;
            int contAux = 0;
                        
            //verifica se existe um arquivo nulo ou em branco no meio do vetor 
            //se existir deve desconsiderar este arquivo
            if (buffer.Count == 0)
            {
                for (int i = 0; i < 100; i++)
                {
                    if (i < paths.Length)
                    {
                        if (!string.IsNullOrEmpty(paths[i]))
                        {
                            if (File.Exists(paths[i]))
                            {
                                aux[contAux] = paths[i];
                                contAux++;
                            }
                        }
                    }
                    else
                        break;
                }

                foreach (string s in aux)
                {
                    if (File.Exists(s) && buffer.Count <= forms.FServidor.servidor.Buffer)
                    {                        
                        GC.WaitForPendingFinalizers();
                        Nfe.negocios.ArquivoNfe arquivo = new ArquivoNfe();
                        try
                        {
                            if (!arquivo.arquivoNfe(s))
                            {
                                forms.FServidor.servidor.adicionaMensagemLog("Impossível carregar " + s);
                                isLock = false;
                                return;
                            }
                            else
                            {
                                Certificado cert = new Certificado();
                                X509Certificate2 x509Cert = new X509Certificate2();
                                x509Cert = cert.BuscaNome(Nfe.forms.FServidor.servidor.Certificado);
                                AssinaturaDigital a = new AssinaturaDigital();
                                string res = string.Empty;
                                switch (a.Assinar(arquivo.Nfe.Xml_nfe.OuterXml, "infNFe", x509Cert))
                                {
                                    case 1:
                                        res = "ERRO: PROBLEMA AO ACESSAR O CERTIFICADO DIGITAL";
                                        break;
                                    case 2:
                                        res = "PROBLEMAS NO CERTIFICADO DIGITAL";
                                        break;
                                    case 3:
                                        res = "XML MAL FORMADO";
                                        break;
                                    case 4:
                                        res = "A TAG DE ASSINATURA infNFe INEXISTE";
                                        break;
                                    case 5:
                                        res = "A TAG DE ASSINATURA infNFe NÃO É UNICA";
                                        break;
                                    case 6:
                                        res = "ERRO AO ASSINAR O DOCUMENTO - ID DEVE SER STRING infNFe(ATRIBUTO)%";
                                        break;
                                    case 7:
                                        res = "ERRO: AO ASSINAR O DOCUMENTO";
                                        break;
                                }

                                if (res != string.Empty)
                                {
                                    forms.FServidor.servidor.adicionaMensagemLog("Erro ao adicionar certificado digital, verificar banco de dados ");
                                    arquivo.Nfe.Msg_validacao = "Erro na Assinatura Digital " + res;
                                    dao.DaoNfe.incluirOuAlterar(arquivo.Nfe);
                                    negocios.XmlBuffer.Buffer.Remove(arquivo.Nfe);
                                    while (new IsFileOpen().check(s))
                                    {
                                        continue;
                                    }
                                    File.Delete(s);
                                    isLock = false;
                                    atualizaBufferPainel();
                                    return;
                                }
                                else
                                {
                                    ParserXML parser = new ParserXML(a.XMLDocAssinado.OuterXml,
                                        @".\Nfe\Schema\nfe_v1.10.xsd");
                                    resultado = parser.valida();
                                    if (resultado[0] == "Validaçao completa")
                                    {
                                        XmlDataDocument doc = new XmlDataDocument();
                                        doc.LoadXml(a.XMLDocAssinado.OuterXml);
                                        arquivo.Nfe.Xml_nfe = doc;
                                        arquivo.Nfe.Cod_retorno_processamento = 1002;
                                        arquivo.Nfe.Cont = arquivo.Nfe.Cont + 1; //atualiza o contador de envios da nota
                                        dao.DaoNfe.incluirOuAlterar(arquivo.Nfe);
                                        buffer.Add(arquivo.Nfe);
                                    }
                                    else
                                    {
                                        //remover a nota do buffer pois nota esta com problema
                                        buffer.Remove(arquivo.Nfe);
                                        foreach (string r in resultado)
                                            arquivo.Nfe.Msg_validacao += r + " ";
                                        XmlDataDocument doc = new XmlDataDocument();
                                        doc.LoadXml(a.XMLDocAssinado.OuterXml);
                                        arquivo.Nfe.Xml_nfe = doc;
                                        dao.DaoNfe.incluirOuAlterar(arquivo.Nfe);
                                        while (new IsFileOpen().check(s))
                                        {
                                            continue;
                                        }
                                        File.Delete(s);
                                    }
                                }
                                atualizaBufferPainel();
                            }
                        }
                        catch (Exception ex)
                        {
                            //new GerenciaExcessoes(ex);
                        }
                    }
                    if (!string.IsNullOrEmpty(s))
                    {
                        while (new IsFileOpen().check(s))
                        {
                            continue;
                        }
                        File.Delete(s);
                    }
                }                
            }
            isLock = false;
        }
        /// <summary>
        /// busca no bd as notas que por alguma razao ainda nao foram enviadas para SEFAZ
        /// ex: timeout da conexao, lote nao é enviado naquela conexao e fica salvo no bd
        /// </summary>
        public static void adicionaNotasNaoEnviadas()
        {            
            try
            {
                if (!isLock && buffer.Count == 0)
                {
                    isLock = true;

                    List<entidades.Nfe> listaNfe = dao.DaoNfe.buscaNotasNaoEnviadas();
                    if (listaNfe.Count > 0)
                    {
                        bool contem;
                        forms.FServidor.servidor.adicionaMensagemLog(string.Format("Tentando adicionar ao buffer notas não enviadas anteriormente"));
                        foreach (entidades.Nfe nfe in listaNfe)
                        {
                            if (buffer.Count < forms.FServidor.servidor.Buffer)
                            {
                                contem = false;
                                foreach (entidades.Nfe nfeBuffer in buffer)
                                {
                                    if (nfeBuffer.Id_nfe == nfe.Id_nfe)
                                        contem = true;
                                }
                                if (!contem)
                                {
                                    buffer.Add(nfe);
                                    atualizaBufferPainel();
                                }
                            }
                            else
                                break;
                        }
                        listaNfe.Clear();
                    }
                    isLock = false;
                }
            }
            catch (Exception ex)
            {
                new GerenciaExcessoes(ex);
            }
        }
    }
}
