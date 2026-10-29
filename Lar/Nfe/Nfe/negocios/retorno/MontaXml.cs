using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;

namespace Nfe.negocios.retorno
{
    public class MontaXml
    {
        private string xml = string.Empty;
        private string codificacao = @"<?xml version=""1.0"" encoding=""UTF-8""?>";
        private string cabecalho = string.Empty;
        private string dados = string.Empty;
        private string contingencia = string.Empty;

        public string Contingencia
        {
            get { return contingencia; }
            set { contingencia = value; }
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

        public string Xml
        {
          get { return xml; }
          set { xml = value; }
        }

        public MontaXml(entidades.Nfe nfe)
        {
            XmlNodeList node = nfe.Xml_nfe.GetElementsByTagName("tpAmb");

            cabecalho = codificacao;
            cabecalho = cabecalho + @"<cabecMsg xmlns=""http://www.portalfiscal.inf.br/nfe"" versao=""1.02"">";
            cabecalho = cabecalho + @"<versaoDados>1.10</versaoDados>";
            cabecalho = cabecalho + @"</cabecMsg>";

            dados = codificacao;
            dados = dados + @"<consReciNFe xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" versao=""1.10"" xmlns=""http://www.portalfiscal.inf.br/nfe"">";
            dados = dados + @"<tpAmb>" + node[0].InnerXml + "</tpAmb>";
            dados = dados + @"<nRec>" + nfe.Num_recibo + "</nRec>";
            dados = dados + "</consReciNFe>";

            contingencia = nfe.Xml_nfe.DocumentElement.GetElementsByTagName("tpEmis")[0].InnerText;
        }
    }
}
