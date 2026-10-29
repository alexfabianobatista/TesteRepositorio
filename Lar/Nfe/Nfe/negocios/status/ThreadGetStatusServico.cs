using System;
using System.Collections.Generic;
using System.Text;
using Nfe.negocios;
using System.Security.Cryptography.X509Certificates;
using System.Xml;
using System.Threading;

namespace Nfe.negocios.status
{
    public class ThreadGetStatusServico
    {
        private status.MontaXml m;
        private XmlNodeList estado;
        private XmlNodeList ambiente;
        private string contingencia;
        private Thread t;

        public ThreadGetStatusServico(status.MontaXml m)
        {
            this.m = m;
            this.estado = m.Mensagem.GetElementsByTagName("cUF");
            this.ambiente = m.Mensagem.GetElementsByTagName("tpAmb");
            this.contingencia = m.Contingencia;
        }

        public void inicializaThread()
        {
            t = new Thread(new ThreadStart(getStatus));
            t.IsBackground = true;
            t.Start();
        }

        private void getStatus()
        {
            forms.FServidor.servidor.adicionaMensagemLog("Obtendo status de serviço");
            X509Certificate2 x509 = new X509Certificate2();
            Certificado c = new Certificado();
            x509 = c.BuscaNome(forms.FServidor.servidor.Certificado);
            string resultado = string.Empty;

            string conti = string.Empty;
            switch (this.contingencia)
            {
                case "1":
                    conti = "NORMAL";
                    break;
                case "3":
                    conti = "SCAN";
                    break;
            }

            try
            {
                switch (conti)
                {
                    case "SCAN":
                        switch (this.ambiente[0].InnerXml)
                        {
                            case "1":
                                prodStatusServicoScan.NfeStatusServico statusScanProd = new Nfe.prodStatusServicoScan.NfeStatusServico();
                                statusScanProd.ClientCertificates.Add(x509);
                                resultado = statusScanProd.nfeStatusServicoNF(m.Cabecalho.OuterXml, m.Mensagem.OuterXml);
                                break;
                            case "2":
                                homStatusServicoScan.NfeStatusServico statusScanHom = new Nfe.homStatusServicoScan.NfeStatusServico();
                                statusScanHom.ClientCertificates.Add(x509);
                                resultado = statusScanHom.nfeStatusServicoNF(m.Cabecalho.OuterXml, m.Mensagem.OuterXml);
                                break;
                        }
                        break;
                    case "NORMAL":
                        switch (this.estado[0].InnerXml)
                        {
                            case "41":
                                switch (this.ambiente[0].InnerXml)
                                {
                                    case "1":
                                        prodStatusServicoPR.NfeStatusServico statusProd = new Nfe.prodStatusServicoPR.NfeStatusServico();
                                        statusProd.ClientCertificates.Add(x509);
                                        resultado = statusProd.nfeStatusServicoNF(m.Cabecalho.OuterXml, m.Mensagem.OuterXml);
                                        break;
                                    case "2":
                                        homStatusServicoPR.NfeStatusServico statusHom = new homStatusServicoPR.NfeStatusServico();
                                        statusHom.ClientCertificates.Add(x509);
                                        resultado = statusHom.nfeStatusServicoNF(m.Cabecalho.OuterXml, m.Mensagem.OuterXml);
                                        break;
                                }
                                break;
                            case "35":
                                switch (this.ambiente[0].InnerXml)
                                {
                                    case "1":
                                        prodStatusServicoSP.NfeStatusServico statusProd = new Nfe.prodStatusServicoSP.NfeStatusServico();
                                        statusProd.ClientCertificates.Add(x509);
                                        resultado = statusProd.nfeStatusServicoNF(m.Cabecalho.OuterXml, m.Mensagem.OuterXml);
                                        break;
                                    case "2":
                                        homStatusServicoSP.NfeStatusServico statusHom = new homStatusServicoSP.NfeStatusServico();
                                        statusHom.ClientCertificates.Add(x509);
                                        resultado = statusHom.nfeStatusServicoNF(m.Cabecalho.OuterXml, m.Mensagem.OuterXml);
                                        break;
                                }
                                break;
                            case "50":
                                switch (this.ambiente[0].InnerXml)
                                {
                                    case "1":
                                        prodStatusServicoMS.NfeStatusServico statusProd = new Nfe.prodStatusServicoMS.NfeStatusServico();
                                        statusProd.ClientCertificates.Add(x509);
                                        resultado = statusProd.nfeStatusServicoNF(m.Cabecalho.OuterXml, m.Mensagem.OuterXml);
                                        break;
                                    case "2":
                                        homStatusServicoMS.NfeStatusServico statusHom = new homStatusServicoMS.NfeStatusServico();
                                        statusHom.ClientCertificates.Add(x509);
                                        resultado = statusHom.nfeStatusServicoNF(m.Cabecalho.OuterXml, m.Mensagem.OuterXml);
                                        break;
                                }
                                break;
                            default:
                                forms.FServidor.servidor.adicionaMensagemLog(string.Format("Status do serviço na UF {0} não cadastrado no sistema", this.estado[0].InnerXml));
                                return;
                        }
                        break;
                }
                new GerenciaPersistenciaStatus(resultado).persiste();
                forms.FServidor.servidor.adicionaMensagemLog("Processo de status de serviço concluído");
            }
            catch (Exception ex)
            {
                new GerenciaExcessoes(ex);
            }            
            t.Abort();            
        }
    }
}