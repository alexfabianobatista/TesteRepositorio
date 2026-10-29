using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Xml;
using System.Security.Cryptography.X509Certificates;

namespace Nfe.negocios.protocolo
{
    public class ThreadConsultaProtocolo
    {
        private Thread t;
        private static string[] arquivos = null;

        public static string[] Arquivos
        {
            get { return ThreadConsultaProtocolo.arquivos; }
            set { ThreadConsultaProtocolo.arquivos = value; }
        }
        private List<MontaXml> buffer = new List<MontaXml>();
        private static bool flagAlive = true;

        public static bool FlagAlive
        {
            get { return ThreadConsultaProtocolo.flagAlive; }
            set { ThreadConsultaProtocolo.flagAlive = value; }
        }

        private void consultaProtocolo()
        {
            while (t.IsAlive)
            {
                try
                {
                    foreach (MontaXml m in buffer)
                    {                        
                        Certificado cert = new Certificado();
                        X509Certificate2 x509 = new X509Certificate2();
                        x509 = cert.BuscaNome(forms.FServidor.servidor.Certificado);
                        XmlDataDocument xmlRes = new XmlDataDocument();
                        entidades.Nfe nfe = new Nfe.entidades.Nfe();
                        nfe.Id_nfe = m.Chave;
                        XmlNodeList nodeStatus = null;
                        XmlNodeList nodeMsg = null;
                        XmlNodeList nodeProt = null;

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
                                        prodConsProtocoloScan.NfeConsultaService prodConsScan = new Nfe.prodConsProtocoloScan.NfeConsultaService();
                                        prodConsScan.ClientCertificates.Add(x509);
                                        xmlRes.LoadXml(prodConsScan.nfeConsultaNF(m.Cabecalho, m.Dados));
                                        nodeStatus = xmlRes.DocumentElement.GetElementsByTagName("cStat");
                                        nfe.Cod_retorno_processamento = Convert.ToInt32(nodeStatus[0].InnerText);
                                        nodeMsg = xmlRes.DocumentElement.GetElementsByTagName("xMotivo");
                                        nfe.Msg_validacao_lote_ws = nodeMsg[0].InnerText;
                                        nodeProt = xmlRes.DocumentElement.GetElementsByTagName("nProt");
                                        if (nodeProt[0] != null)
                                            nfe.Num_prot_autorizacao = nodeProt[0].InnerText;
                                        nfe.Xml_retorno = xmlRes.OuterXml;
                                        break;
                                    case "2":
                                        homConsProtocoloScan.NfeConsultaService homConsScan = new Nfe.homConsProtocoloScan.NfeConsultaService();
                                        homConsScan.ClientCertificates.Add(x509);
                                        xmlRes.LoadXml(homConsScan.nfeConsultaNF(m.Cabecalho, m.Dados));
                                        nodeStatus = xmlRes.DocumentElement.GetElementsByTagName("cStat");
                                        nfe.Cod_retorno_processamento = Convert.ToInt32(nodeStatus[0].InnerText);
                                        nodeMsg = xmlRes.DocumentElement.GetElementsByTagName("xMotivo");
                                        nfe.Msg_validacao_lote_ws = nodeMsg[0].InnerText;
                                        nodeProt = xmlRes.DocumentElement.GetElementsByTagName("nProt");
                                        if (nodeProt[0] != null)
                                            nfe.Num_prot_autorizacao = nodeProt[0].InnerText;
                                        nfe.Xml_retorno = xmlRes.OuterXml;
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
                                                prodConsProtocoloPR.NfeConsultaService prodConsPR = new Nfe.prodConsProtocoloPR.NfeConsultaService();
                                                prodConsPR.ClientCertificates.Add(x509);
                                                xmlRes.LoadXml(prodConsPR.nfeConsultaNF(m.Cabecalho, m.Dados));
                                                nodeStatus = xmlRes.DocumentElement.GetElementsByTagName("cStat");
                                                nfe.Cod_retorno_processamento = Convert.ToInt32(nodeStatus[0].InnerText);
                                                nodeMsg = xmlRes.DocumentElement.GetElementsByTagName("xMotivo");
                                                nfe.Msg_validacao_lote_ws = nodeMsg[0].InnerText;
                                                nodeProt = xmlRes.DocumentElement.GetElementsByTagName("nProt");
                                                if (nodeProt[0] != null)
                                                    nfe.Num_prot_autorizacao = nodeProt[0].InnerText;
                                                nfe.Xml_retorno = xmlRes.OuterXml;
                                                break;
                                            case "2":
                                                homConsProtocoloPR.NfeConsultaService homConsPR = new Nfe.homConsProtocoloPR.NfeConsultaService();
                                                homConsPR.ClientCertificates.Add(x509);
                                                xmlRes.LoadXml(homConsPR.nfeConsultaNF(m.Cabecalho, m.Dados));
                                                nodeStatus = xmlRes.DocumentElement.GetElementsByTagName("cStat");
                                                nfe.Cod_retorno_processamento = Convert.ToInt32(nodeStatus[0].InnerText);
                                                nodeMsg = xmlRes.DocumentElement.GetElementsByTagName("xMotivo");
                                                nfe.Msg_validacao_lote_ws = nodeMsg[0].InnerText;
                                                nodeProt = xmlRes.DocumentElement.GetElementsByTagName("nProt");
                                                if (nodeProt[0] != null)
                                                    nfe.Num_prot_autorizacao = nodeProt[0].InnerText;
                                                nfe.Xml_retorno = xmlRes.OuterXml;
                                                break;
                                        }
                                        break;
                                    case "35":
                                        switch (m.Ambiente)
                                        {
                                            case "1":
                                                prodConsProtocoloSP.NfeConsultaService prodConsSP = new Nfe.prodConsProtocoloSP.NfeConsultaService();
                                                prodConsSP.ClientCertificates.Add(x509);
                                                xmlRes.LoadXml(prodConsSP.nfeConsultaNF(m.Cabecalho, m.Dados));
                                                nodeStatus = xmlRes.DocumentElement.GetElementsByTagName("cStat");
                                                nfe.Cod_retorno_processamento = Convert.ToInt32(nodeStatus[0].InnerText);
                                                nodeMsg = xmlRes.DocumentElement.GetElementsByTagName("xMotivo");
                                                nfe.Msg_validacao_lote_ws = nodeMsg[0].InnerText;
                                                nodeProt = xmlRes.DocumentElement.GetElementsByTagName("nProt");
                                                if (nodeProt[0] != null)
                                                    nfe.Num_prot_autorizacao = nodeProt[0].InnerText;
                                                nfe.Xml_retorno = xmlRes.OuterXml;
                                                break;
                                            case "2":
                                                homConsProtocoloSP.NfeConsultaService homConsSP = new Nfe.homConsProtocoloSP.NfeConsultaService();
                                                homConsSP.ClientCertificates.Add(x509);
                                                xmlRes.LoadXml(homConsSP.nfeConsultaNF(m.Cabecalho, m.Dados));
                                                nodeStatus = xmlRes.DocumentElement.GetElementsByTagName("cStat");
                                                nfe.Cod_retorno_processamento = Convert.ToInt32(nodeStatus[0].InnerText);
                                                nodeMsg = xmlRes.DocumentElement.GetElementsByTagName("xMotivo");
                                                nfe.Msg_validacao_lote_ws = nodeMsg[0].InnerText;
                                                nodeProt = xmlRes.DocumentElement.GetElementsByTagName("nProt");
                                                if (nodeProt[0] != null)
                                                    nfe.Num_prot_autorizacao = nodeProt[0].InnerText;
                                                nfe.Xml_retorno = xmlRes.OuterXml;
                                                break;
                                        }
                                        break;
                                    case "50":
                                        switch (m.Ambiente)
                                        {
                                            case "1":
                                                prodConsProtocoloMS.NfeConsultaService prodConsMS = new Nfe.prodConsProtocoloMS.NfeConsultaService();
                                                prodConsMS.ClientCertificates.Add(x509);
                                                xmlRes.LoadXml(prodConsMS.nfeConsultaNF(m.Cabecalho, m.Dados));
                                                nodeStatus = xmlRes.DocumentElement.GetElementsByTagName("cStat");
                                                nfe.Cod_retorno_processamento = Convert.ToInt32(nodeStatus[0].InnerText);
                                                nodeMsg = xmlRes.DocumentElement.GetElementsByTagName("xMotivo");
                                                nfe.Msg_validacao_lote_ws = nodeMsg[0].InnerText;
                                                nodeProt = xmlRes.DocumentElement.GetElementsByTagName("nProt");
                                                if (nodeProt[0] != null)
                                                    nfe.Num_prot_autorizacao = nodeProt[0].InnerText;
                                                nfe.Xml_retorno = xmlRes.OuterXml;
                                                break;
                                            case "2":
                                                homConsProtocoloMS.NfeConsultaService homConsMS = new Nfe.homConsProtocoloMS.NfeConsultaService();
                                                homConsMS.ClientCertificates.Add(x509);
                                                xmlRes.LoadXml(homConsMS.nfeConsultaNF(m.Cabecalho, m.Dados));
                                                nodeStatus = xmlRes.DocumentElement.GetElementsByTagName("cStat");
                                                nfe.Cod_retorno_processamento = Convert.ToInt32(nodeStatus[0].InnerText);
                                                nodeMsg = xmlRes.DocumentElement.GetElementsByTagName("xMotivo");
                                                nfe.Msg_validacao_lote_ws = nodeMsg[0].InnerText;
                                                nodeProt = xmlRes.DocumentElement.GetElementsByTagName("nProt");
                                                if (nodeProt[0] != null)
                                                    nfe.Num_prot_autorizacao = nodeProt[0].InnerText;
                                                nfe.Xml_retorno = xmlRes.OuterXml;
                                                break;
                                        }
                                        break;
                                    default:
                                        forms.FServidor.servidor.adicionaMensagemLog(string.Format("Consulta na UF {0} não cadastrada no sistema", m.Uf));
                                        return;
                                }
                                break;
                        }
                                                
                        dao.DaoNfe.incluirOuAlterar(nfe);
                        forms.FServidor.servidor.adicionaMensagemLog("Processo de consulta de protocolo concluído");
                    }
                    buffer.Clear();
                    populaBuffer();
                }
                catch (Exception ex)
                {
                    new GerenciaExcessoes(ex);
                }
                finally
                {

                }

                //foreach (string s in aux)
                //{
                //    requisicoes.Remove(s);
                //    exclusao.BufferPathExclusao.add(s);
                //}                
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
                    m.montaXml(s);
                    forms.FServidor.servidor.adicionaMensagemLog("Consultando protocolo " + m.Chave);
                    buffer.Add(m);
                    System.IO.File.Delete(s);
                }
                arquivos = null;
            }
        }

        public void inicializa()
        {
            t = new Thread(new ThreadStart(consultaProtocolo));
            t.IsBackground = true;
            t.Start();
        }
    }
}
