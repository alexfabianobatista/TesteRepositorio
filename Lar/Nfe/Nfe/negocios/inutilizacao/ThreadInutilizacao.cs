using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Threading;
using Nfe.negocios;
using System.Security.Cryptography.X509Certificates;
using Nfe.negocios.exclusao;

namespace Nfe.negocios.inutilizacao
{
    public class ThreadInutilizacao
    {
        Thread t = null;
        private static string[] arquivos = null;
        private List<MontaXml> buffer = new List<MontaXml>();
        private static bool flagAlive = true;

        public static bool FlagAlive
        {
            get { return ThreadInutilizacao.flagAlive; }
            set { ThreadInutilizacao.flagAlive = value; }
        }

        public static string[] Arquivos
        {
            get { return ThreadInutilizacao.arquivos; }
            set { ThreadInutilizacao.arquivos = value; }
        }

        private void inutiliza()
        {
            while (t.IsAlive)
            {
                
                    foreach (MontaXml m in buffer)
                    {
                        try
                        {   
                        string res = string.Empty;
                        XmlDataDocument xmlRetorno = new XmlDataDocument();                            
                        AssinaturaDigital assinatura = new AssinaturaDigital();
                        X509Certificate2 x509 = new X509Certificate2();
                        Certificado cert = new Certificado();
                        x509 = cert.BuscaNome(forms.FServidor.servidor.Certificado);
                        switch (assinatura.Assinar(m.Dados, "infInut", x509))
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
                                res = "A TAG DE ASSINATURA infInut INEXISTE";
                                break;
                            case 5:
                                res = "A TAG DE ASSINATURA infInut NÃO É UNICA";
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
                            forms.FServidor.servidor.adicionaMensagemLog(res);
                            break;
                        }
                        string contingencia = string.Empty;
                        switch (m.Contingencia)
                        {
                            case "1":
                                contingencia = "NORMAL";
                                break;
                            case "3":
                                contingencia = "SCAN";
                                break;
                        }
                        switch (contingencia)
                        {
                            case "SCAN":
                                switch (m.Ambiente)
                                {
                                    case "1":
                                        prodInutilizacaoScan.NfeInutilizacaoService pInutScan = new Nfe.prodInutilizacaoScan.NfeInutilizacaoService();
                                        pInutScan.ClientCertificates.Add(x509);
                                        xmlRetorno.LoadXml(pInutScan.nfeInutilizacaoNF(m.Cabecalho, assinatura.XMLDocAssinado.OuterXml));
                                        break;
                                    case "2":
                                        homInutilizacaoScan.NfeInutilizacaoService hInutScan = new Nfe.homInutilizacaoScan.NfeInutilizacaoService();
                                        hInutScan.ClientCertificates.Add(x509);
                                        xmlRetorno.LoadXml(hInutScan.nfeInutilizacaoNF(m.Cabecalho, assinatura.XMLDocAssinado.OuterXml));
                                        break;
                                }
                                break;
                            case "NORMAL":
                                switch (m.Uf)
                                {
                                    case "41":
                                        switch (m.Ambiente)
                                        {
                                            case "1":
                                                prodInutilizacaoPR.NfeInutilizacaoService pInutPR = new Nfe.prodInutilizacaoPR.NfeInutilizacaoService();
                                                pInutPR.ClientCertificates.Add(x509);
                                                xmlRetorno.LoadXml(pInutPR.nfeInutilizacaoNF(m.Cabecalho, assinatura.XMLDocAssinado.OuterXml));
                                                break;
                                            case "2":
                                                homInutilizacaoPR.NfeInutilizacaoService hInutPR = new Nfe.homInutilizacaoPR.NfeInutilizacaoService();
                                                hInutPR.ClientCertificates.Add(x509);
                                                xmlRetorno.LoadXml(hInutPR.nfeInutilizacaoNF(m.Cabecalho, assinatura.XMLStringAssinado));
                                                break;
                                        }
                                        break;
                                    case "35":
                                        switch (m.Ambiente)
                                        {
                                            case "1":
                                                prodInutilizacaoSP.NfeInutilizacaoService pInutSP = new Nfe.prodInutilizacaoSP.NfeInutilizacaoService();
                                                pInutSP.ClientCertificates.Add(x509);
                                                xmlRetorno.LoadXml(pInutSP.nfeInutilizacaoNF(m.Cabecalho, assinatura.XMLDocAssinado.OuterXml));
                                                break;
                                            case "2":
                                                homInutilizacaoSP.NfeInutilizacaoService hInutSP = new Nfe.homInutilizacaoSP.NfeInutilizacaoService();
                                                hInutSP.ClientCertificates.Add(x509);
                                                xmlRetorno.LoadXml(hInutSP.nfeInutilizacaoNF(m.Cabecalho, assinatura.XMLStringAssinado));
                                                break;
                                        }
                                        break;
                                    case "50":
                                        switch (m.Ambiente)
                                        {
                                            case "1":
                                                prodInutilizacaoMS.NfeInutilizacaoService pInutMS = new Nfe.prodInutilizacaoMS.NfeInutilizacaoService();
                                                pInutMS.ClientCertificates.Add(x509);
                                                xmlRetorno.LoadXml(pInutMS.nfeInutilizacaoNF(m.Cabecalho, assinatura.XMLDocAssinado.OuterXml));
                                                break;
                                            case "2":
                                                homInutilizacaoMS.NfeInutilizacaoService hInutMS = new Nfe.homInutilizacaoMS.NfeInutilizacaoService();
                                                hInutMS.ClientCertificates.Add(x509);
                                                xmlRetorno.LoadXml(hInutMS.nfeInutilizacaoNF(m.Cabecalho, assinatura.XMLStringAssinado));
                                                break;
                                        }
                                        break;
                                    default:
                                        forms.FServidor.servidor.adicionaMensagemLog(string.Format("Inutilizacao na UF {0} não cadastrada no sistema", m.Uf));
                                        return;
                                }
                                break;
                            }
                            

                            entidades.Inutilizacao i = new Nfe.entidades.Inutilizacao();
                            XmlNodeList nodeStatus = xmlRetorno.DocumentElement.GetElementsByTagName("cStat");
                            i.Status = nodeStatus[0].InnerText;
                            if (i.Status == "102")
                            {
                                XmlNodeList nodeCnpj = xmlRetorno.DocumentElement.GetElementsByTagName("CNPJ");
                                i.Cnpj = nodeCnpj[0].InnerText;
                                XmlNodeList nodeProtocolo = xmlRetorno.DocumentElement.GetElementsByTagName("nProt");
                                i.Protocolo = nodeProtocolo[0].InnerText;
                                XmlNodeList nodeNumIni = xmlRetorno.DocumentElement.GetElementsByTagName("nNFIni");
                                i.NIni = nodeNumIni[0].InnerText;
                                XmlNodeList nodeNumFim = xmlRetorno.DocumentElement.GetElementsByTagName("nNFFin");
                                i.NFim = nodeNumFim[0].InnerText;
                                XmlNodeList nodeSerie = xmlRetorno.DocumentElement.GetElementsByTagName("serie");
                                i.Serie = nodeSerie[0].InnerText;
                                XmlNodeList nodeAno = xmlRetorno.DocumentElement.GetElementsByTagName("ano");
                                i.Ano = nodeAno[0].InnerText;                                
                            }
                            XmlNodeList nodeAmbiente = xmlRetorno.DocumentElement.GetElementsByTagName("tpAmb");
                            i.Ambiente = nodeAmbiente[0].InnerText;
                            XmlNodeList nodeUf = xmlRetorno.DocumentElement.GetElementsByTagName("cUF");
                            i.Uf = nodeUf[0].InnerText;
                            XmlNodeList nodeMotivo = xmlRetorno.DocumentElement.GetElementsByTagName("xMotivo");
                            i.Motivo = nodeMotivo[0].InnerText;
                            i.Empresa = m.Empresa;
                            dao.DaoInutilizacao.incluirOuAlterar(i);
                            forms.FServidor.servidor.adicionaMensagemLog("Processo de inutilização concluído");
                        }
                        catch (Exception ex)
                        {
                            continue;
                            //new GerenciaExcessoes(ex);                    
                        }
                    }

                    buffer.Clear();
                    populaBuffer();
                                
                t.Join(1000);
                if (!flagAlive)
                    t.Abort();
            }
        }

        private void populaBuffer()
        {
            if (arquivos != null && arquivos.Length > 0)
            {
                foreach (string s in arquivos)
                {
                    MontaXml m = new MontaXml();
                    try
                    {
                        m.montaXml(s);
                    }
                    catch (Exception ex)
                    {
                        new GerenciaExcessoes(ex);
                    }
                    forms.FServidor.servidor.adicionaMensagemLog("Inutilização de numeração iniciado");
                    buffer.Add(m);
                    System.IO.File.Delete(s);
                }
                arquivos = null;
            }
        }

        public void inicializa()
        {
            t = new Thread(new ThreadStart(inutiliza));
            t.IsBackground = false;
            t.Start();
        }
    }
}
