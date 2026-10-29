using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using Nfe.negocios;
using System.Security.Cryptography.X509Certificates;

namespace Nfe.negocios.recepcao
{
    public class MontaLote
    {
        private string cabecalho;
        private string encoding;
        private static List<entidades.Nfe> nota = new List<Nfe.entidades.Nfe>();
        private XmlDataDocument lote;
        private List<string> resultado;
        private double tAtual = 0;

        public XmlDataDocument Lote
        {
            get { return lote; }
            set { lote = value; }
        }

        public List<entidades.Nfe> Nota
        {
            get { return nota; }
            set { nota = value; }
        }

        public string Cabecalho
        {
            get { return cabecalho; }
            set { cabecalho = value; }
        }

        public MontaLote()
        {
            this.encoding = @"<?xml version=""1.0"" encoding=""UTF-8""?>";
            this.cabecalho = @"<?xml version=""1.0"" encoding=""UTF-8""?>";
            this.cabecalho += @"<cabecMsg xmlns=""http://www.portalfiscal.inf.br/nfe"" versao=""1.02"">";
            this.cabecalho += @"<versaoDados>1.10</versaoDados></cabecMsg>";
            this.lote = new XmlDataDocument();
            this.resultado = new List<string>();
        }

        public bool addNota(entidades.Nfe nota)
        {
            if (tamanhoLote(nota.Xml_nfe) && MontaLote.nota.Count < 50)
            {
                bool contem = false;
                foreach (entidades.Nfe n in MontaLote.nota)
                {
                    if (n.Id_nfe == nota.Id_nfe)
                        contem = true;
                }
                if (!contem)
                {
                    MontaLote.nota.Add(nota);                    
                }               
                    return true; // retorna true se adicionou a nota ao lote ou se ja existia a nota no lote
            }
            else
                return false;
        }

        public void removeLote()
        {
            MontaLote.nota.Clear();
        }

        private bool tamanhoLote(XmlDataDocument nota)
        {
            //o lote nao pode passar de 500k
            double tMax = 512000;
            this.tAtual += nota.OuterXml.Length / 1024;
            return (tMax > tAtual);
        }

        public XmlDataDocument getLote()
        {
            try
            {
                lote = new XmlDataDocument();
                List<string> res = null;
                if (MontaLote.nota.Count > 0)
                {
                    string xml = this.encoding;
                    xml += @"<enviNFe xmlns=""http://www.portalfiscal.inf.br/nfe"" versao=""1.10"">";
                    xml += "<idLote>" + dao.DaoNfe.idLote() + "</idLote>";
                    foreach (entidades.Nfe n in MontaLote.nota)
                    {
                        xml += n.Xml_nfe.OuterXml.Remove(0, 38);
                    }
                    xml += "</enviNFe>";
                    XmlDataDocument xmldataDoc = new XmlDataDocument();
                    ParserXML parser = new ParserXML(xml, @".\nfe\schema\enviNFe_v1.10.xsd");
                    res = parser.valida();
                    if (res[0] == "Validaçao completa")
                    {
                        xmldataDoc.LoadXml(xml);
                        this.lote.LoadXml(xml);
                        MontaLote.nota.Clear();
                        return xmldataDoc;
                    }
                    else
                    {
                        foreach (entidades.Nfe n in nota)
                        {
                            //joga a mensagem de validacao do lote para todas as notas
                            //que compoem o lote
                            foreach (string s in res)
                            {
                                n.Msg_validacao += " " + s;
                            }
                            dao.DaoNfe.incluirOuAlterar(n);
                        }
                        return null;
                    }

                }
                else
                    return null;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
