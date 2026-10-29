using System;
using System.Collections.Generic;
using System.Text;
using System.Security.Cryptography.X509Certificates;
using System.Xml;

namespace Nfe.negocios.email
{
    public class MontaXml
    {
        private string cabecalho = @"<?xml version=""1.0"" encoding=""UTF-8""?>" +
            @"<nfeProc xmlns=""http://www.portalfiscal.inf.br/nfe"" xmlns:ds=""http://www.w3.org/2000/09/xmldsig#""" + 
            @" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xsi:schemaLocation=""http://www.portalfiscal.inf.br/nfe procNFe_v1.10.xsd""" +
            @" versao=""1.10"">";
                

        public entidades.Nfe montaArquivo(entidades.Nfe nfe)
        {
            XmlDataDocument xmlRetorno = new XmlDataDocument();
            XmlDataDocument xmlDistribuicao = new XmlDataDocument();
            xmlRetorno.LoadXml(nfe.Xml_retorno);
            xmlDistribuicao.LoadXml(cabecalho + nfe.Xml_nfe.InnerXml.Remove(0,38) + xmlRetorno.DocumentElement.OuterXml + "</nfeProc>");
            nfe.Xml_nfe = xmlDistribuicao;
            validaArquivo(ref nfe);
            //if (nfe.Msg_validacao == "Validaçao completa")
            return nfe;
            //else
                //forms.FServidor.servidor.adicionaMensagemLog(string.Format("NF-e {0} não passou na validação do XML Schema de distribuição, e-mail não enviado"));
        }

        public void validaArquivo(ref entidades.Nfe nfe)
        {
            List<string> resultado = null;
            ParserXML parser = new ParserXML(nfe.Xml_nfe.OuterXml,
                @".\Nfe\Schema\procNFe_v1.10.xsd");
            resultado = parser.valida();
            if (resultado != null)
            {
                nfe.Msg_validacao = resultado[0];
            }            
        }
    }
}
