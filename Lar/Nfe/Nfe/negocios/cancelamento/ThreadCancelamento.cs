using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Security.Cryptography.X509Certificates;
using System.Xml;

namespace Nfe.negocios.cancelamento
{
    public class ThreadCancelamento
    {
        private Thread t = null;        
        private static string[] arquivos = null;
        private static List<MontaXml> buffer = new List<MontaXml>();
        private static bool isLock = false;
        private static bool flagAlive = true;
        private static ThreadCancelamento threadCancelamento = null;  

        public static List<MontaXml> Buffer
        {
            get { return ThreadCancelamento.buffer; }
            set { ThreadCancelamento.buffer = value; }
        }       

        public static bool FlagAlive
        {
            get { return ThreadCancelamento.flagAlive; }
            set { ThreadCancelamento.flagAlive = value; }
        }

        public static string[] Arquivos
        {
            get { return ThreadCancelamento.arquivos; }
            set { ThreadCancelamento.arquivos = value; }
        }

        public static void instanciaSingleton()
        {
            if (threadCancelamento == null)
            {
                threadCancelamento = new ThreadCancelamento();
                threadCancelamento.inicializa();
            }
        }

        private void cancelamento()
        {
            while (t.IsAlive)
            {                
                try
                {
                    if (!isLock)
                    {
                        isLock = true;
                        foreach (MontaXml m in buffer)
                        {
                            Certificado cert = new Certificado();
                            X509Certificate2 x509 = new X509Certificate2();
                            x509 = cert.BuscaNome(forms.FServidor.servidor.Certificado);
                            string res = string.Empty;
                            XmlDataDocument xmlRetorno = new XmlDataDocument();
                            AssinaturaDigital a = new AssinaturaDigital();
                            switch (a.Assinar(m.Dados, "infCanc", x509))
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
                                    res = "A TAG DE ASSINATURA infCanc INEXISTE";
                                    break;
                                case 5:
                                    res = "A TAG DE ASSINATURA infCanc NÃO É UNICA";
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
                                throw new Exception(res);
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
                                            prodCancelamentoScan.NfeCancelamentoService pCancelamentoScan = new Nfe.prodCancelamentoScan.NfeCancelamentoService();
                                            pCancelamentoScan.ClientCertificates.Add(x509);
                                            xmlRetorno.LoadXml(pCancelamentoScan.nfeCancelamentoNF(m.Cabecalho, a.XMLDocAssinado.OuterXml));
                                            break;
                                        case "2":
                                            homCancelamentoScan.NfeCancelamentoService hCancelamentoScan = new Nfe.homCancelamentoScan.NfeCancelamentoService();
                                            hCancelamentoScan.ClientCertificates.Add(x509);
                                            xmlRetorno.LoadXml(hCancelamentoScan.nfeCancelamentoNF(m.Cabecalho, a.XMLDocAssinado.OuterXml));
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
                                                    prodCancelamentoPR.NfeCancelamentoService pCancelamentoPR = new Nfe.prodCancelamentoPR.NfeCancelamentoService();
                                                    pCancelamentoPR.ClientCertificates.Add(x509);
                                                    xmlRetorno.LoadXml(pCancelamentoPR.nfeCancelamentoNF(m.Cabecalho, a.XMLDocAssinado.OuterXml));
                                                    break;
                                                case "2":
                                                    homCancelamentoPR.NfeCancelamentoService hCancelamentoPR = new Nfe.homCancelamentoPR.NfeCancelamentoService();
                                                    hCancelamentoPR.ClientCertificates.Add(x509);
                                                    xmlRetorno.LoadXml(hCancelamentoPR.nfeCancelamentoNF(m.Cabecalho, a.XMLDocAssinado.OuterXml));
                                                    break;
                                            }
                                            break;
                                        case "35":
                                            switch (m.Ambiente)
                                            {
                                                case "1":
                                                    prodCancelamentoSP.NfeCancelamentoService pCancelamentoSP = new Nfe.prodCancelamentoSP.NfeCancelamentoService();
                                                    pCancelamentoSP.ClientCertificates.Add(x509);
                                                    xmlRetorno.LoadXml(pCancelamentoSP.nfeCancelamentoNF(m.Cabecalho, a.XMLDocAssinado.OuterXml));
                                                    break;
                                                case "2":
                                                    homCancelamentoSP.NfeCancelamentoService hCancelamentoSP = new Nfe.homCancelamentoSP.NfeCancelamentoService();
                                                    hCancelamentoSP.ClientCertificates.Add(x509);
                                                    xmlRetorno.LoadXml(hCancelamentoSP.nfeCancelamentoNF(m.Cabecalho, a.XMLDocAssinado.OuterXml));
                                                    break;
                                            }
                                            break;
                                        case "50":
                                            switch (m.Ambiente)
                                            {
                                                case "1":
                                                    prodCancelamentoMS.NfeCancelamentoService pCancelamentoMS = new Nfe.prodCancelamentoMS.NfeCancelamentoService();
                                                    pCancelamentoMS.ClientCertificates.Add(x509);
                                                    xmlRetorno.LoadXml(pCancelamentoMS.nfeCancelamentoNF(m.Cabecalho, a.XMLDocAssinado.OuterXml));
                                                    break;
                                                case "2":
                                                    homCancelamentoMS.NfeCancelamentoService hCancelamentoMS = new Nfe.homCancelamentoMS.NfeCancelamentoService();
                                                    hCancelamentoMS.ClientCertificates.Add(x509);
                                                    xmlRetorno.LoadXml(hCancelamentoMS.nfeCancelamentoNF(m.Cabecalho, a.XMLDocAssinado.OuterXml));
                                                    break;
                                            }
                                            break;
                                        default:
                                            forms.FServidor.servidor.adicionaMensagemLog(string.Format("Cancelamento em UF {0} não cadastrada no sistema", m.Uf));
                                            return;
                                    }
                                    break;
                            }
                            entidades.Nfe nfe = new Nfe.entidades.Nfe();

                            XmlNodeList nodeStatus = xmlRetorno.DocumentElement.GetElementsByTagName("cStat");
                            
                            if (nodeStatus[0].InnerText == "101") //cancelamento homologado
                            {
                                nfe.Cod_retorno_cancelamento = Convert.ToInt32(nodeStatus[0].InnerText);
                                XmlNodeList nodeProt = xmlRetorno.DocumentElement.GetElementsByTagName("nProt");
                                XmlNodeList nodeChave = xmlRetorno.DocumentElement.GetElementsByTagName("chNFe");
                                nfe.Id_nfe = nodeChave[0].InnerText;
                                nfe.Num_prot_cancelamento = nodeProt[0].InnerText;
                            }
                            else
                            {                                
                                nfe.Cod_retorno_cancelamento = Convert.ToInt32(nodeStatus[0].InnerText);
                                //nfe.Num_prot_cancelamento = nodeStatus[0].InnerText;
                                nfe.Id_nfe = m.Chave;
                            }
                            dao.DaoNfe.cancelar(nfe);
                            forms.FServidor.servidor.adicionaMensagemLog("Processo de cancelamento concluído");
                        }
                        buffer.Clear();
                    }                 
                    isLock = false;                        
                    populaBuffer();
                
                }
                catch (Exception ex)
                {
                    buffer.Clear();
                    new GerenciaExcessoes(ex);                    
                }                
                
                if (!flagAlive)
                    t.Abort();
                t.Join(1000);
            }
        }

        private void populaBuffer()
        {
            if (!isLock)
            {
                if (arquivos != null && arquivos.Length > 0)
                {
                    foreach (string s in arquivos)
                    {
                        MontaXml m = new MontaXml();
                        m.montaXml(s);
                        forms.FServidor.servidor.adicionaMensagemLog("Cancelamento da NF-e " + m.Chave);
                        buffer.Add(m);
                        System.IO.File.Delete(s);
                    }
                    arquivos = null;
                }
            }
        }

        public void inicializa()
        {            
            t = new Thread(new ThreadStart(cancelamento));
            t.IsBackground = true;
            t.Start();
        }

    }
}
