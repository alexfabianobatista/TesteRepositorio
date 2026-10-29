using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Threading;
using System.Security.Cryptography.X509Certificates;

namespace Nfe.negocios.recepcao
{
    public class ThreadProcessoEnvio
    {
        private Thread t = null;
        private static bool flagAlive = true;

        public static bool FlagAlive
        {
            get { return ThreadProcessoEnvio.flagAlive; }
            set { ThreadProcessoEnvio.flagAlive = value; }
        }

        private void enviaLote(recepcao.MontaLote m)
        {
            if (m.Nota.Count == 0)
                return;
            try
            {
                forms.FServidor.servidor.adicionaMensagemLog("Enviando lote para webservice"); 
                string resultado = string.Empty;
                string uf = string.Empty;
                string ambiente = string.Empty;
                XmlDataDocument xmlLote = new XmlDataDocument();
                XmlDataDocument xmlRetorno = new XmlDataDocument();
                List<entidades.Nfe> nfe = new List<Nfe.entidades.Nfe>();
                //pega o estado que vai ser enviado o lote
                XmlNodeList nodeUf = m.Nota[0].Xml_nfe.GetElementsByTagName("cUF");
                foreach (XmlNode node in nodeUf)
                {
                    if (node.ParentNode.LocalName == "ide")
                        uf = node.InnerXml;
                }
                //pega o ambiente que vai ser enviado o lote
                XmlNodeList nodeAmb = m.Nota[0].Xml_nfe.GetElementsByTagName("tpAmb");
                foreach (XmlNode n in nodeAmb)
                {
                    ambiente = n.InnerXml;
                }
                nfe.AddRange(m.Nota);
                string lote = string.Empty;
                XmlDataDocument xmlLoteRes = m.getLote();
                if (xmlLoteRes != null)
                    lote = xmlLoteRes.OuterXml;
                if (lote != string.Empty)
                    xmlLote.LoadXml(lote);
                else
                {
                    Nfe.forms.FServidor.servidor.pictureBox1.Image = Nfe.forms.FServidor.servidor.imageList1.Images[0];
                    forms.FServidor.servidor.adicionaMensagemLog("Lote reprovado na validação por schemas, verificar mensagem no banco de dados");                    
                    return;
                }
                if (xmlLote.OuterXml != null)
                {
                    X509Certificate2 cert = new X509Certificate2();
                    Certificado c = new Certificado();
                    string contingencia = string.Empty;

                    XmlNodeList nodeContingencia = xmlLote.DocumentElement.GetElementsByTagName("tpEmis");

                    switch (nodeContingencia[0].InnerText)
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
                                    homRecepcaoScan.NfeRecepcao pRecep = new Nfe.homRecepcaoScan.NfeRecepcao();
                                    cert = c.BuscaNome(Nfe.forms.FServidor.servidor.Certificado);
                                    pRecep.ClientCertificates.Add(cert);
                                    xmlRetorno.LoadXml(pRecep.nfeRecepcaoLote(m.Cabecalho, xmlLote.OuterXml));
                                    break;
                                case "2":
                                    homRecepcaoScan.NfeRecepcao hRecep = new Nfe.homRecepcaoScan.NfeRecepcao();
                                    cert = c.BuscaNome(Nfe.forms.FServidor.servidor.Certificado);
                                    hRecep.ClientCertificates.Add(cert);
                                    xmlRetorno.LoadXml(hRecep.nfeRecepcaoLote(m.Cabecalho, xmlLote.OuterXml));
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
                                            prodRecepcaoPR.NfeRecepcao pRecep = new Nfe.prodRecepcaoPR.NfeRecepcao();
                                            cert = c.BuscaNome(Nfe.forms.FServidor.servidor.Certificado);
                                            pRecep.ClientCertificates.Add(cert);
                                            //pega o retorno do webservice da sefaz
                                            xmlRetorno.LoadXml(pRecep.nfeRecepcaoLote(m.Cabecalho, xmlLote.OuterXml));
                                            break;
                                        case "2":
                                            homRecepcaoPR.NfeRecepcao hRecep = new Nfe.homRecepcaoPR.NfeRecepcao();
                                            cert = c.BuscaNome(Nfe.forms.FServidor.servidor.Certificado);
                                            hRecep.ClientCertificates.Add(cert);
                                            //pega o retorno do webservice da sefaz
                                            xmlRetorno.LoadXml(hRecep.nfeRecepcaoLote(m.Cabecalho, xmlLote.OuterXml));
                                            break;
                                    }
                                    break;
                                case "35":
                                    switch (ambiente)
                                    {
                                        case "1":
                                            prodRecepcaoSP.NfeRecepcao pRecep = new Nfe.prodRecepcaoSP.NfeRecepcao();
                                            cert = c.BuscaNome(Nfe.forms.FServidor.servidor.Certificado);
                                            pRecep.ClientCertificates.Add(cert);
                                            //pega o retorno do webservice da sefaz
                                            xmlRetorno.LoadXml(pRecep.nfeRecepcaoLote(m.Cabecalho, xmlLote.OuterXml));
                                            break;
                                        case "2":
                                            homRecepcaoSP.NfeRecepcao hRecep = new Nfe.homRecepcaoSP.NfeRecepcao();
                                            cert = c.BuscaNome(Nfe.forms.FServidor.servidor.Certificado);
                                            hRecep.ClientCertificates.Add(cert);
                                            //pega o retorno do webservice da sefaz
                                            xmlRetorno.LoadXml(hRecep.nfeRecepcaoLote(m.Cabecalho, xmlLote.OuterXml));
                                            break;
                                    }
                                    break;
                                case "50":
                                    switch (ambiente)
                                    {
                                        case "1":
                                            prodRecepcaoMS.NfeRecepcao pRecep = new Nfe.prodRecepcaoMS.NfeRecepcao();
                                            cert = c.BuscaNome(Nfe.forms.FServidor.servidor.Certificado);
                                            pRecep.ClientCertificates.Add(cert);
                                            //pega o retorno do webservice da sefaz
                                            xmlRetorno.LoadXml(pRecep.nfeRecepcaoLote(m.Cabecalho, xmlLote.OuterXml));
                                            break;
                                        case "2":
                                            homRecepcaoMS.NfeRecepcao hRecep = new Nfe.homRecepcaoMS.NfeRecepcao();
                                            cert = c.BuscaNome(Nfe.forms.FServidor.servidor.Certificado);
                                            hRecep.ClientCertificates.Add(cert);
                                            //pega o retorno do webservice da sefaz
                                            xmlRetorno.LoadXml(hRecep.nfeRecepcaoLote(m.Cabecalho, xmlLote.OuterXml));
                                            break;
                                    }
                                    break;
                                default:
                                    forms.FServidor.servidor.adicionaMensagemLog(string.Format("Recepção na UF {0} não cadastrada no sistema", uf));
                                    return;
                            }
                            break;
                    }



                    XmlNodeList nodeStatus = xmlRetorno.GetElementsByTagName("cStat");
                    XmlNodeList nodeNumRec = xmlRetorno.GetElementsByTagName("nRec");

                    //verifica se o lote foi recebido com sucesso
                    if (nodeStatus[0].InnerXml == "103")
                    {
                        XmlNodeList nodeNota = xmlLote.GetElementsByTagName("NFe");
                        foreach (entidades.Nfe n in nfe)
                        {
                            n.Num_recibo = nodeNumRec[0].InnerXml;
                            n.Cod_retorno_processamento = 1004;

                            //persistir a nota
                            dao.DaoNfe.incluirOuAlterar(n);
                        }
                        forms.FServidor.servidor.adicionaMensagemLog("Processo de envio de lote concluído");
                    }
                    else
                    {
                        XmlNodeList nodeNota = xmlLote.GetElementsByTagName("NFe");
                        foreach (entidades.Nfe n in nfe)
                        {
                            Int32 codigo = 0;
                            if (int.TryParse(nodeStatus[0].InnerXml, out codigo))
                            {
                                if (codigo > 0)
                                    n.Cod_retorno_processamento = codigo;
                                else
                                    n.Cod_retorno_processamento = 1003;
                                //persistir a nota
                                dao.DaoNfe.incluirOuAlterar(n);
                            }
                        }
                        forms.FServidor.servidor.adicionaMensagemLog("Lote não aceito");
                    }
                    m.removeLote();

                }
            }
            catch (Exception ex)
            {
                forms.FServidor.servidor.adicionaMensagemLog("Não conseguiu enviar lote, tentando novamente");
                return;                
            }
        }

        public void gerencia()
        {            
            try
            {
                while (t.IsAlive)
                {
                    recepcao.MontaLote m = null;
                    int j = 0; 
                    if(XmlBuffer.Buffer.Count == 0)
                        XmlBuffer.adicionaNotasNaoEnviadas();
                    if(XmlBuffer.BufferOrdenado.Count == 0)
                        XmlBuffer.ordenaBuffer();
                    while (XmlBuffer.BufferOrdenado.Count > 0 && j < 50)
                    {                  
                        if(m == null)
                            m = new recepcao.MontaLote();
                        if (XmlBuffer.BufferOrdenado[0] != null)
                        {
                            if(m.addNota(XmlBuffer.BufferOrdenado[0]))
                                XmlBuffer.BufferOrdenado.Remove(XmlBuffer.BufferOrdenado[0]);
                        }
                        else
                        {
                            XmlBuffer.BufferOrdenado.Remove(null);
                        }
                        XmlBuffer.atualizaBufferPainel();                        
                        j++;
                    }            

                    //só chama o metodo enviaLote quando tiver lote montado para ser enviado
                    if(m != null)
                        if(m.Cabecalho != string.Empty && m.Lote != null)
                            this.enviaLote(m);
                    
                    t.Join(forms.FServidor.servidor.Intervalo);//período que o buffer de notas é montado
                    
                    if (!flagAlive)
                        t.Abort();
                }
            }
            catch (Exception ex)
            {
                new GerenciaExcessoes(ex);                
            }

        }
        public void inicializa()
        {
            t = new Thread(new ThreadStart(gerencia));
            t.IsBackground = true;
            t.Start();            
        }

    }  
}
