using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;

namespace Nfe.negocios.protocolo
{
    public class MontaXml
    {
        private string codificacao = @"<?xml version=""1.0"" encoding=""UTF-8""?>";
        private string cabecalho = string.Empty;
        private string dados = string.Empty;
        private string ambiente = string.Empty;
        private string uf = string.Empty;
        private string chave = string.Empty;
        private string contingencia = string.Empty;

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
            set { cabecalho = value; }
        }       

        public string Dados
        {
            get { return dados; }
            set { dados = value; }
        }
 
        public string Codificacao
        {
            get { return codificacao; }            
        }

        public void montaXml(string s)
        {
            if (System.IO.File.Exists(s))
            {
                XmlDataDocument xmlData = new XmlDataDocument();
                xmlData.Load(s);
                XmlNodeList node = xmlData.DocumentElement.SelectNodes("*");
                cabecalho = codificacao + node[0].OuterXml;
                dados = codificacao + node[1].OuterXml;
                XmlNodeList nodeAmb = xmlData.DocumentElement.GetElementsByTagName("tpAmb");
                XmlNodeList nodeChave = xmlData.DocumentElement.GetElementsByTagName("chNFe");
                ambiente = nodeAmb[0].InnerText;
                chave = nodeChave[0].InnerText;
                uf = chave.Substring(0, 2);
                XmlNodeList nodeContingencia = xmlData.DocumentElement.GetElementsByTagName("contingencia");
                contingencia = nodeContingencia[0].InnerText;
                //exclui arquivo da pastas
                exclusao.BufferPathExclusao.add(s);
            }
        }
    }
}
