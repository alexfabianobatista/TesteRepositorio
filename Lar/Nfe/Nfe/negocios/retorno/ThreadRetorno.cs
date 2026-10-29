using System;
using System.Collections.Generic;
using System.Text;
using Nfe.negocios;
using System.Threading;
using System.Security.Cryptography.X509Certificates;
using System.Xml;
using System.IO;
using System.Xml.XPath;
using System.Collections;

namespace Nfe.negocios.retorno
{
    public class ThreadRetorno
    {
        private Thread t = null;
        private static bool flagAlive = true;

        public static bool FlagAlive
        {
            get { return ThreadRetorno.flagAlive; }
            set { ThreadRetorno.flagAlive = value; }
        }

        private void acessaWebService()
        {              
            while (t.IsAlive)
            {
                try
                {

                    List<Nfe.entidades.Nfe> nfes = new List<Nfe.entidades.Nfe>();
                    List<Nfe.entidades.Nfe> nfesAux = new List<Nfe.entidades.Nfe>();
                    string numAutorizacao = string.Empty;
                    XmlDataDocument xmlRetorno = null;
                    XmlNodeList nodesXmlRetorno = null;
                    XmlNodeList nodesXmlRetornoCabec = null;
                    
                    Hashtable htXmlRetorno = new Hashtable();
                    Hashtable htDHRecbto = new Hashtable();
                    Hashtable htNumProtocolo = new Hashtable();
                    Hashtable htCStat = new Hashtable();
                    Hashtable htMotivo = new Hashtable();

                    nfes = dao.DaoNfe.buscaLotesNaoValidados();
                    if (nfes.Count == 0)
                        continue;

                    nfesAux.AddRange(nfes);
                    string motivoLote = string.Empty;
                    string retorno = string.Empty;

                    X509Certificate2 x509 = new X509Certificate2();
                    Certificado cert = new Certificado();

                    

                    foreach (entidades.Nfe nfe in nfes)
                    {
                        //se a nota ja tiver sido consultada, passa pra proxima
                        if (nfe.Num_prot_autorizacao != string.Empty)
                            continue;

                        string uf = string.Empty;
                        string ambiente = string.Empty;
                        xmlRetorno = new XmlDataDocument();               

                        forms.FServidor.servidor.adicionaMensagemLog("Consultando lote " + nfe.Num_recibo);
                        x509 = cert.BuscaNome(Nfe.forms.FServidor.servidor.Certificado);
                        XmlNodeList nodeUf = nfe.Xml_nfe.GetElementsByTagName("cUF");
                        foreach (XmlNode node in nodeUf)
                        {
                            if (node.ParentNode.LocalName == "ide")
                                uf = node.InnerXml;
                        }
                        XmlNodeList nodeAmb = nfe.Xml_nfe.GetElementsByTagName("tpAmb");
                        foreach (XmlNode n in nodeAmb)
                        {
                            ambiente = n.InnerXml;
                        }
                        MontaXml xml = new MontaXml(nfe);
                        string contingencia = string.Empty;
                        switch (xml.Contingencia)
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
                                switch (ambiente)
                                {
                                    case "1":
                                        prodRetRecepcaoScan.NfeRetRecepcaoService pRet = new Nfe.prodRetRecepcaoScan.NfeRetRecepcaoService();
                                        pRet.ClientCertificates.Add(x509);
                                        xmlRetorno.LoadXml(pRet.nfeRetRecepcao(xml.Cabecalho, xml.Dados));                                        
                                        break;
                                    case "2":
                                        homRetRecepcaoScan.NfeRetRecepcaoService hRet = new Nfe.homRetRecepcaoScan.NfeRetRecepcaoService();
                                        hRet.ClientCertificates.Add(x509);
                                        xmlRetorno.LoadXml(hRet.nfeRetRecepcao(xml.Cabecalho, xml.Dados));                                        
                                        break;
                                }
                                break;
                            case "NORMAL":
                                switch (uf)
                                {
                                    case "41":
                                        switch (ambiente)
                                        {
                                            case "1":
                                                prodRetRecepcaoPR.NfeRetRecepcaoService pRet = new Nfe.prodRetRecepcaoPR.NfeRetRecepcaoService();
                                                pRet.ClientCertificates.Add(x509);
                                                xmlRetorno.LoadXml(pRet.nfeRetRecepcao(xml.Cabecalho, xml.Dados));                                                
                                                break;
                                            case "2":
                                                homRetRecepcaoPR.NfeRetRecepcaoService hRet = new Nfe.homRetRecepcaoPR.NfeRetRecepcaoService();
                                                hRet.ClientCertificates.Add(x509);
                                                xmlRetorno.LoadXml(hRet.nfeRetRecepcao(xml.Cabecalho, xml.Dados));                                                
                                                break;
                                        }
                                        break;
                                    case "35":
                                        switch (ambiente)
                                        {
                                            case "1":
                                                prodRetRecepcaoSP.NfeRetRecepcaoService pRet = new Nfe.prodRetRecepcaoSP.NfeRetRecepcaoService();
                                                pRet.ClientCertificates.Add(x509);
                                                xmlRetorno.LoadXml(pRet.nfeRetRecepcao(xml.Cabecalho, xml.Dados));                                                
                                                break;
                                            case "2":
                                                homRetRecepcaoSP.NfeRetRecepcaoService hRet = new Nfe.homRetRecepcaoSP.NfeRetRecepcaoService();
                                                hRet.ClientCertificates.Add(x509);
                                                xmlRetorno.LoadXml(hRet.nfeRetRecepcao(xml.Cabecalho, xml.Dados));                                                
                                                break;
                                        }
                                        break;
                                    case "50":
                                        switch (ambiente)
                                        {
                                            case "1":
                                                prodRetRecepcaoMS.NfeRetRecepcaoService pRet = new Nfe.prodRetRecepcaoMS.NfeRetRecepcaoService();
                                                pRet.ClientCertificates.Add(x509);
                                                xmlRetorno.LoadXml(pRet.nfeRetRecepcao(xml.Cabecalho, xml.Dados));
                                                break;
                                            case "2":
                                                homRetRecepcaoMS.NfeRetRecepcaoService hRet = new Nfe.homRetRecepcaoMS.NfeRetRecepcaoService();
                                                hRet.ClientCertificates.Add(x509);
                                                xmlRetorno.LoadXml(hRet.nfeRetRecepcao(xml.Cabecalho, xml.Dados));
                                                break;
                                        }
                                        break;
                                    default:                                        
                                            forms.FServidor.servidor.adicionaMensagemLog(string.Format("Retorno de recepção na UF {0} não cadastrado no sistema", uf));
                                            return;                                 
                                }
                                break;                               
                        }                       

                        htXmlRetorno.Clear();
                        htDHRecbto.Clear();
                        htNumProtocolo.Clear();
                        htCStat.Clear();
                        htMotivo.Clear();
                        
                        motivoLote = xmlRetorno.DocumentElement.GetElementsByTagName("xMotivo")[0].InnerText;

                        nodesXmlRetorno = xmlRetorno.DocumentElement.GetElementsByTagName("protNFe");
                        nodesXmlRetornoCabec = xmlRetorno.ChildNodes;

                        if (nodesXmlRetorno.Count > 0)
                        {
                            foreach (XmlNode nodeXmlRetorno in nodesXmlRetorno)
                            {
                                XmlDataDocument xmlDoc = new XmlDataDocument();
                                xmlDoc.LoadXml(nodeXmlRetorno.OuterXml);
                                if (xmlDoc.DocumentElement.GetElementsByTagName("chNFe")[0] != null)
                                {
                                    if (xmlDoc.GetElementsByTagName("protNFe")[0] != null)
                                        htXmlRetorno.Add(xmlDoc.DocumentElement.GetElementsByTagName("chNFe")[0].InnerText,
                                            xmlDoc.GetElementsByTagName("protNFe")[0].OuterXml);
                                    if (xmlDoc.DocumentElement.GetElementsByTagName("dhRecbto")[0] != null)
                                        htDHRecbto.Add(xmlDoc.DocumentElement.GetElementsByTagName("chNFe")[0].InnerText,
                                            xmlDoc.DocumentElement.GetElementsByTagName("dhRecbto")[0].InnerText);
                                    if (xmlDoc.DocumentElement.GetElementsByTagName("nProt")[0] != null)
                                        htNumProtocolo.Add(xmlDoc.DocumentElement.GetElementsByTagName("chNFe")[0].InnerText,
                                            xmlDoc.DocumentElement.GetElementsByTagName("nProt")[0].InnerText);
                                    if (xmlDoc.DocumentElement.GetElementsByTagName("cStat")[0] != null)
                                        htCStat.Add(xmlDoc.DocumentElement.GetElementsByTagName("chNFe")[0].InnerText,
                                            xmlDoc.DocumentElement.GetElementsByTagName("cStat")[0].InnerText);
                                    if (xmlDoc.DocumentElement.GetElementsByTagName("xMotivo")[0] != null)
                                        htMotivo.Add(xmlDoc.DocumentElement.GetElementsByTagName("chNFe")[0].InnerText,
                                            xmlDoc.DocumentElement.GetElementsByTagName("xMotivo")[0].InnerText);
                                }
                            }
                        }
                        else
                        {
                            //no caso de dar erro 999 - erro nao catalogado
                            //nfe.Cod_retorno_processamento = nodesXmlRetorno
                            nfe.Cod_retorno_processamento = 1000; //codigo interno do sistema
                            dao.DaoNfe.incluirOuAlterar(nfe);
                            dao.DaoNfe.atualizaStatusNfeConsulta(nfe);
                        }
                        
                        forms.FServidor.servidor.adicionaMensagemLog("Processo de consulta de lote concluído");
                        break;
                    }
                    foreach (entidades.Nfe nfeAux in nfesAux)
                    {
                        if (!htXmlRetorno.Contains(nfeAux.Id_nfe))
                            continue;

                        if (nodesXmlRetorno.Count == 0)
                        {
                            XmlDataDocument xmlDoc = new XmlDataDocument();
                            xmlDoc.LoadXml(nodesXmlRetornoCabec[1].OuterXml);
                            if (xmlDoc.ChildNodes.Count > 0)
                            {
                                if (xmlDoc.DocumentElement.GetElementsByTagName("xMotivo")[0] != null)
                                    nfeAux.Msg_validacao_lote_ws = xmlDoc.DocumentElement.GetElementsByTagName("xMotivo")[0].InnerText;
                                if (xmlDoc.DocumentElement.GetElementsByTagName("cStat")[0] != null)
                                    nfeAux.Cod_retorno_processamento = Int32.Parse(xmlDoc.DocumentElement.GetElementsByTagName("cStat")[0].InnerText);
                                if (xmlDoc.DocumentElement.GetElementsByTagName("nRec")[0] != null)
                                    nfeAux.Num_recibo = xmlDoc.DocumentElement.GetElementsByTagName("nRec")[0].InnerText;
                            }
                            else
                            {
                                nfeAux.Cod_retorno_processamento = 1000; //codigo interno do sistema
                                nfeAux.Msg_validacao_lote_ws = "Xml retornado do webservice incompleto ou nulo";
                            }
                            dao.DaoNfe.incluirOuAlterar(nfeAux);
                            dao.DaoNfe.atualizaStatusNfeConsulta(nfeAux);
                            nfes.Remove(nfeAux);
                        }
                        else
                        {
                            dao.DaoNfe.atualizaStatusNfeConsulta(nfeAux);
                            nfes.Remove(nfeAux);
                        }
                        if (htXmlRetorno.Contains(nfeAux.Id_nfe))
                        {
                            if (htXmlRetorno[nfeAux.Id_nfe] != null)
                                nfeAux.Xml_retorno = htXmlRetorno[nfeAux.Id_nfe].ToString();
                            if (htDHRecbto[nfeAux.Id_nfe] != null)
                                nfeAux.Dt_autorizacao = Convert.ToDateTime(htDHRecbto[nfeAux.Id_nfe]);
                            if (htNumProtocolo[nfeAux.Id_nfe] != null)
                                nfeAux.Num_prot_autorizacao = htNumProtocolo[nfeAux.Id_nfe].ToString();
                            if (htCStat[nfeAux.Id_nfe] != null)
                                nfeAux.Cod_retorno_processamento = Convert.ToInt32(htCStat[nfeAux.Id_nfe].ToString());
                            if (htMotivo[nfeAux.Id_nfe] != null)
                                nfeAux.Msg_validacao_lote_ws = htMotivo[nfeAux.Id_nfe].ToString();
                            dao.DaoNfe.incluirOuAlterar(nfeAux);
                            dao.DaoNfe.atualizaStatusNfeConsulta(nfeAux);
                            nfes.Remove(nfeAux);
                        }
                    }                    
                    nfesAux.Clear();
                    t.Join(forms.FServidor.servidor.Intervalo);
                }
                catch (Exception ex)
                {                    
                    new GerenciaExcessoes(ex);
                }

                if (!flagAlive)
                {
                    t.Abort();
                }
            }
        }

        public void gerencia()
        {
            t = new Thread(new ThreadStart(acessaWebService));
            t.IsBackground = true;
            t.Start();
        }
    }
}
