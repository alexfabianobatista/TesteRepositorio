using System;
using System.Collections.Generic;
using System.Text;
using Nfe.entidades;
using System.Xml;
using System.Xml.XPath;

namespace Nfe.negocios.status
{
    public class MontaXml
    {
        private XmlDataDocument xml;
        private string path;
        private XmlDataDocument cabecalho;
        private XmlDataDocument mensagem;
        private string contingencia = string.Empty;        
        private string codificacao = @"<?xml version=""1.0"" encoding=""utf-8""?>";

        public string Contingencia
        {
            get { return contingencia; }
            set { contingencia = value; }
        }

        public XmlDataDocument Cabecalho
        {
            get { return cabecalho; }
            set { cabecalho = value; }
        }        

        public XmlDataDocument Mensagem
        {
            get { return mensagem; }
            set { mensagem = value; }
        }

        public MontaXml(string path)
        {
            this.path = path;
            cabecalho = new XmlDataDocument();
            mensagem = new XmlDataDocument();
            inicializa();
        }

        private void inicializa()
        {
            try
            {
                if (!new IsFileOpen().check(path))
                {
                    xml = new XmlDataDocument();
                    xml.Load(path);
                    xml.PreserveWhitespace = false;
                    XmlNodeList nodes = xml.DocumentElement.SelectNodes(@"*");
                    XmlDataDocument xmlCabec = new XmlDataDocument();
                    xmlCabec.LoadXml(codificacao + nodes[0].OuterXml);
                    XmlDataDocument xmlMsg = new XmlDataDocument();
                    xmlMsg.LoadXml(nodes[1].OuterXml);
                    cabecalho.LoadXml(xmlCabec.OuterXml);
                    mensagem.LoadXml(codificacao + xmlMsg.OuterXml);
                    this.contingencia = xml.DocumentElement.GetElementsByTagName("contingencia")[0].InnerText;
                    //exclusao.BufferPathExclusao.add(path);
                }
            }
            catch (Exception ex)
            {
                new Nfe.negocios.GerenciaExcessoes(ex);
            }
        }
    }
}
