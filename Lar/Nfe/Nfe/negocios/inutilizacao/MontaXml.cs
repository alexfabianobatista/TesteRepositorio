using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.IO;

namespace Nfe.negocios.inutilizacao
{
    public class MontaXml
    {
        private string codificacao = @"<?xml version=""1.0"" encoding=""utf-8""?>";
        private string cabecalho = string.Empty;
        private string dados = string.Empty;
        private string ambiente = string.Empty;
        private string uf = string.Empty;
        private string empresa = string.Empty;
        private string contingencia = string.Empty;

        public string Contingencia
        {
            get { return contingencia; }
            set { contingencia = value; }
        }

        public string Empresa
        {
            get { return empresa; }
            set { empresa = value; }
        }
        
        public string Uf
        {
            get { return uf; }
            set { uf = value; }
        }

        public string Ambiente
        {
            get { return ambiente; }
            set { ambiente = value; }
        }

        public string Dados
        {
            get { return dados; }
            set { dados = value; }
        }

        public string Cabecalho
        {
            get { return cabecalho; }
            set { cabecalho = value; }
        }

        public void montaXml(string xml)
        {
            if (File.Exists(xml))
            {
                if (!new IsFileOpen().check(xml))
                {
                    try
                    {
                        XmlDataDocument xmlDoc = new XmlDataDocument();
                        xmlDoc.Load(xml);
                        XmlNodeList nodeCabec = xmlDoc.DocumentElement.GetElementsByTagName("cabecMsg");
                        this.cabecalho = this.codificacao + nodeCabec[0].OuterXml;

                        XmlNodeList nodeDados = xmlDoc.DocumentElement.GetElementsByTagName("inutNFe");
                        this.dados = this.codificacao + nodeDados[0].OuterXml;

                        XmlNodeList nodeAmb = xmlDoc.DocumentElement.GetElementsByTagName("tpAmb");
                        this.ambiente = nodeAmb[0].InnerText;

                        XmlNodeList nodeUf = xmlDoc.DocumentElement.GetElementsByTagName("cUF");
                        this.uf = nodeUf[0].InnerText;

                        XmlNodeList nodeEmpresa = xmlDoc.DocumentElement.GetElementsByTagName("empresa");
                        this.empresa = nodeEmpresa[0].InnerText;

                        XmlNodeList nodeContingencia = xmlDoc.DocumentElement.GetElementsByTagName("contingencia");
                        this.contingencia = nodeContingencia[0].InnerText;
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }
            }
        }
    }
}
