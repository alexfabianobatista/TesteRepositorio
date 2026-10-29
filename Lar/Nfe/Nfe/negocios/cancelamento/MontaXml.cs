using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.IO;

namespace Nfe.negocios.cancelamento
{
    public class MontaXml
    {
        private string cabecalho = string.Empty;
        private string dados = string.Empty;
        private string uf = string.Empty;
        private string ambiente = string.Empty;
        private string chave = string.Empty;
        private string contingencia = string.Empty;       
        private string codificacao = @"<?xml version=""1.0"" encoding=""utf-8""?>";
        private string ultimoArquivo = string.Empty;

        public string Contingencia
        {
            get { return contingencia; }
            set { contingencia = value; }
        }

        public string Chave
        {
            get { return chave; }
            set { chave = value; }
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

        public string Cabecalho
        {
            get { return cabecalho; }            
        }
        
        public string Dados
        {
            get { return dados; }            
        }        

        public void montaXml(string xml)
        {
            try
            {          
                if (File.Exists(xml))
                {
                    if (!new IsFileOpen().check(xml))
                    {
                        XmlDataDocument xmlData = new XmlDataDocument();
                        xmlData.Load(xml);
                        xmlData.PreserveWhitespace = false;
                        XmlNodeList nodeCabec = xmlData.DocumentElement.GetElementsByTagName("cabecMsg");
                        cabecalho = codificacao + nodeCabec[0].OuterXml;
                        XmlNodeList nodeDados = xmlData.DocumentElement.GetElementsByTagName("cancNFe");
                        dados = codificacao + nodeDados[0].OuterXml;
                        XmlNodeList nodeAmb = xmlData.DocumentElement.GetElementsByTagName("tpAmb");
                        ambiente = nodeAmb[0].InnerText;
                        XmlNodeList nodeUf = xmlData.DocumentElement.GetElementsByTagName("chNFe");
                        chave = nodeUf[0].InnerText;
                        XmlNodeList nodeContingencia = xmlData.DocumentElement.GetElementsByTagName("contingencia");
                        contingencia = nodeContingencia[0].InnerText;
                        uf = nodeUf[0].InnerText.Substring(0, 2);
                    }
                }
            }
            catch(Exception ex)
            {
                new GerenciaExcessoes(ex);
            }
        }
    }
}
