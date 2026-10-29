using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.IO;
using System.Xml.XPath;
using Oracle.DataAccess.Client;
using System.Configuration;

namespace PjNfe
{
    public static class XmlMT
    {
        static string xmlCabec = string.Empty;
        static string xmlDados = string.Empty;

        public static string getCabecStatusServicoMT()
        {
            xmlCabec = String.Empty;

            xmlCabec = @"<?xml version=""1.0"" encoding=""utf-8""?>";
            xmlCabec = xmlCabec + @"<cabecMsg xmlns=""http://www.portalfiscal.inf.br/nfe"" versao=""1.02"">";
            xmlCabec = xmlCabec + @"<versaoDados>1.07</versaoDados>";
            xmlCabec = xmlCabec + @"</cabecMsg>";
            return xmlCabec;
        }

        public static string getCabecMsgRecepcaoMT()
        {
            xmlCabec = String.Empty;

            xmlCabec = @"<?xml version=""1.0"" encoding=""utf-8""?>";
            xmlCabec = xmlCabec + @"<cabecMsg xmlns=""http://www.portalfiscal.inf.br/nfe"" versao=""1.02"">";
            xmlCabec = xmlCabec + @"<versaoDados>1.10</versaoDados>";
            xmlCabec = xmlCabec + @"</cabecMsg>";
            return xmlCabec;
        }

        public static string getCabecMsgRetRecepcaoMT()
        {
            xmlCabec = String.Empty;

            xmlCabec = @"<?xml version=""1.0"" encoding=""utf-8""?>";
            xmlCabec = xmlCabec + @"<cabecMsg xmlns=""http://www.portalfiscal.inf.br/nfe"" versao=""1.02"">";
            xmlCabec = xmlCabec + @"<versaoDados>1.10</versaoDados>";
            xmlCabec = xmlCabec + @"</cabecMsg>";
            return xmlCabec;
        }

        public static string getCabecCancelamentoMT()
        {
            xmlCabec = string.Empty;

            xmlCabec = @"<?xml version=""1.0"" encoding=""utf-8""?>";
            xmlCabec = xmlCabec + @"<cabecMsg xmlns=""http://www.portalfiscal.inf.br/nfe"" versao=""1.02"">";
            xmlCabec = xmlCabec + @"<versaoDados>1.07</versaoDados>";
            xmlCabec = xmlCabec + @"</cabecMsg>";
            return xmlCabec;
        }

        public static string getCabecInutilizacaoMT()
        {
            xmlCabec = string.Empty;

            xmlCabec = @"<?xml version=""1.0"" encoding=""utf-8""?>";
            xmlCabec = xmlCabec + @"<cabecMsg xmlns=""http://www.portalfiscal.inf.br/nfe"" versao=""1.02"">";
            xmlCabec = xmlCabec + @"<versaoDados>1.07</versaoDados>";
            xmlCabec = xmlCabec + @"</cabecMsg>";
            return xmlCabec;
        }

        public static string getCabecConsProtocoloMT()
        {
            xmlCabec = string.Empty;

            xmlCabec = @"<?xml version=""1.0"" encoding=""utf-8""?>";
            xmlCabec = xmlCabec + @"<cabecMsg xmlns=""http://www.portalfiscal.inf.br/nfe"" versao=""1.02"">";
            xmlCabec = xmlCabec + @"<versaoDados>1.07</versaoDados>";
            xmlCabec = xmlCabec + @"</cabecMsg>";
            return xmlCabec;
        }


        //-----------------------------------------DADOS-----------------------------------------------------

        public static string getDadosStatusServicoMT()
        {
            xmlDados = String.Empty;

            xmlDados = @"<?xml version=""1.0"" encoding=""utf-8""?>";
            xmlDados = xmlDados + @"<consStatServ xmlns=""http://www.portalfiscal.inf.br/nfe"" versao=""1.07"">";
            //xmlDados = xmlDados + @"<tpAmb>"+PjNfe.FNfe.objNfe.ambienteNfe.ToString()+"</tpAmb>";
            xmlDados = xmlDados + @"<cUF>51</cUF>";
            xmlDados = xmlDados + @"<xServ>STATUS</xServ>";
            xmlDados = xmlDados + @"</consStatServ>";
            return xmlDados;
        }

        public static string getPedidoLoteMT(List<string> arquivos)
        {
            Int32 idLote = 0;
            //string connString = ConfigurationManager.ConnectionStrings["PjNfe.Properties.Settings.ConnectionString"].ConnectionString;
            //OracleConnection conn = new OracleConnection(connString);
            //OracleCommand command = new OracleCommand("SELECT SQLOTE_NFE.NEXTVAL FROM DUAL",conn);
            //command.CommandType = System.Data.CommandType.Text;
            try
            {
                conn.Open();
                //idLote = Convert.ToInt32(command.ExecuteScalar());
            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Clone();
            }
            xmlDados = String.Empty;
            xmlDados = @"<?xml version=""1.0"" encoding=""utf-8""?>";
            xmlDados = xmlDados + @"<enviNFe xmlns=""http://www.portalfiscal.inf.br/nfe"" versao=""1.10"">";
            xmlDados = xmlDados + @"<idLote>" + idLote.ToString() + "</idLote>"; //numero sequencial do sistema -- criar uma conexao com o banco de dados
            foreach (String arquivo in arquivos)
            {
                XmlDataDocument xmlDataDoc = new XmlDataDocument();
                xmlDataDoc.Load(arquivo);
                XmlTextReader xmlReader = new XmlTextReader(new StringReader(xmlDataDoc.InnerXml));
                XPathDocument xPathDoc = new XPathDocument(xmlReader);
                XPathNavigator xPathNav = xPathDoc.CreateNavigator();
                XPathNodeIterator xPathNode = xPathNav.Select("*");//pegar os elementos da nota
                xmlDados = xmlDados + xPathNode.Current.InnerXml;
            }
            xmlDados = xmlDados + @"</enviNFe>";

            return xmlDados;
        }

        public static string getDadosRetLoteMT(string numRecibo)
        {
            xmlDados = String.Empty;
            xmlDados = @"<?xml version=""1.0"" encoding=""utf-8""?>";
            xmlDados = xmlDados + @"<consReciNFe xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" versao=""1.10"" xmlns=""http://www.portalfiscal.inf.br/nfe"">";
            //xmlDados = xmlDados + @"<tpAmb>" + PjNfe.FNfe.objNfe.ambienteNfe.ToString() + "</tpAmb>";
            //xmlDados = xmlDados + @"<nRec>" + numRecibo + "</nRec>";
            xmlDados = xmlDados + "</consReciNFe>";
            return xmlDados;
        }

        public static string getDadosCancelamentoMT(string chave, string nProt, string justificativa)
        {
            xmlDados = String.Empty;
            xmlDados = @"<?xml version=""1.0"" encoding=""utf-8""?>";
            xmlDados = xmlDados + @"<cancNFe xmlns=""http://www.portalfiscal.inf.br/nfe"" versao=""1.07"">";
            xmlDados = xmlDados + @"<infCanc Id=" + (Char)34 + "ID" + chave + (Char)34 + ">";
            xmlDados = xmlDados + @"<tpAmb>" + PjNfe.FNfe.objNfe.ambienteNfe.ToString() + "</tpAmb>";
            xmlDados = xmlDados + @"<xServ>CANCELAR</xServ>";
            xmlDados = xmlDados + @"<chNFe>" + chave + "</chNFe>";
            xmlDados = xmlDados + @"<nProt>" + nProt + "</nProt>";
            xmlDados = xmlDados + @"<xJust>" + justificativa + "</xJust>";
            xmlDados = xmlDados + @"</infCanc>";
            xmlDados = xmlDados + @"</cancNFe>";
         
            return xmlDados;
        }

        public static string getDadosInutilizacaoMT(string id, int uf, string ano,
                                                    string cnpj, int mod, int serie,
                                                    string numIni, string numFim,
                                                    string justificativa)
        {
            xmlDados = String.Empty;
            xmlDados = @"<?xml version=""1.0"" encoding=""utf-8""?>";
            xmlDados = xmlDados + @"<inutNFe xmlns=""http://www.portalfiscal.inf.br/nfe"" versao=""1.07"">";
            xmlDados = xmlDados + @"<infInut Id=" + (Char)34 + "ID" + id + (Char)34 + ">";
            xmlDados = xmlDados + @"<tpAmb>" + PjNfe.FNfe.objNfe.ambienteNfe.ToString() + "</tpAmb>";
            xmlDados = xmlDados + @"<xServ>INUTILIZAR</xServ>";
            xmlDados = xmlDados + @"<cUF>" + uf + "</cUF>";
            xmlDados = xmlDados + @"<ano>" + ano + "</ano>";
            xmlDados = xmlDados + @"<CNPJ>" + cnpj + "</CNPJ>";
            xmlDados = xmlDados + @"<mod>" + mod + "</mod>";
            xmlDados = xmlDados + @"<serie>" + serie + "</serie>";
            xmlDados = xmlDados + @"<nNFIni>" + numIni + "</nNFIni>";
            xmlDados = xmlDados + @"<nNFFin>" + numFim + "</nNFFin>";
            xmlDados = xmlDados + @"<xJust>" + justificativa + "</xJust>";
            xmlDados = xmlDados + @"</infInut>";
            xmlDados = xmlDados + @"</inutNFe>";

            return xmlDados;

        }

        public static string getDadosConsProtocoloMT(string chave)
        {
            xmlDados = string.Empty;
            xmlDados = @"<?xml version=""1.0"" encoding=""utf-8""?>";
            xmlDados = xmlDados + @"<consSitNFe xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" versao=""1.07"" xmlns=""http://www.portalfiscal.inf.br/nfe"">";
            xmlDados = xmlDados + @"<tpAmb>" + PjNfe.FNfe.objNfe.ambienteNfe.ToString() + "</tpAmb>";
            xmlDados = xmlDados + @"<xServ>CONSULTAR</xServ>";
            xmlDados = xmlDados + @"<chNFe>" + chave + "</chNFe>";
            xmlDados = xmlDados + @"</consSitNFe>";
            XmlDataDocument xmlDataDoc = new XmlDataDocument();
            xmlDataDoc.LoadXml(xmlDados);
            //xmlDataDoc.Save(@"c:\xmlConsProtocolo.xml");
            return xmlDados;
        }
    }
        
}
