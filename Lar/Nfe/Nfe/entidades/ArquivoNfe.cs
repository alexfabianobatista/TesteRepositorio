using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.IO;

namespace Nfe.entidades
{
    public class ArquivoNfe
    {                
        private StringReader sr;
        private bool isDisposed = false;
        private entidades.Nfe nfe;
        private XmlDataDocument xmlDataDoc;
        private string cabecalho = @"<?xml version=""1.0"" encoding=""utf-8""?>";

        public entidades.Nfe Nfe
        {
            get { return nfe; }
            set { nfe = value; }
        }

        private void setNfe(XmlDataDocument xmlDataDoc)
        {
            //este metodo instancia um objeto Nfe e adiciona seus dados
            nfe = new Nfe();
            nfe.Xml_nfe.PreserveWhitespace = true;
            XmlNodeList nodeEmpresa = xmlDataDoc.GetElementsByTagName("empresa");
            nfe.Cod_empresa = Convert.ToInt32(nodeEmpresa[0].InnerXml);
            XmlNodeList nodeLocal = xmlDataDoc.GetElementsByTagName("local");
            nfe.Cod_local = Convert.ToInt32(nodeLocal[0].InnerXml);
            XmlNodeList nodeImp = xmlDataDoc.GetElementsByTagName("impressora");
            nfe.Impressora = nodeImp[0].InnerXml;
            XmlNodeList nodeNf = xmlDataDoc.GetElementsByTagName("nNF");
            nfe.Num_nfe = Convert.ToInt32(nodeNf[0].InnerXml);
            XmlNodeList nodeSerie = xmlDataDoc.GetElementsByTagName("serie");
            nfe.Desc_serie = nodeSerie[0].InnerXml;
            XmlNodeList nodeLar = xmlDataDoc.GetElementsByTagName("NFe");
            XmlNodeList nodeId = xmlDataDoc.GetElementsByTagName("infNFe");            
            XmlAttributeCollection attributes = nodeId[0].Attributes;
            XmlAttribute att = attributes["Id"];
            nfe.Id_nfe = att.Value.Remove(0, 3);            
            XmlDataDocument xmlData = new XmlDataDocument();
            xmlData.LoadXml(this.cabecalho + nodeLar[0].OuterXml);
            nfe.Xml_nfe = xmlData;            
        }

        //construtor sobrecarregado
        public ArquivoNfe(string path)
        {
            xmlDataDoc = new XmlDataDocument();            
            try
            {
                sr = new StringReader(path);
                xmlDataDoc.PreserveWhitespace = true;
                xmlDataDoc.Load(sr.ReadToEnd());
                setNfe(xmlDataDoc);               
            }
            catch (Exception ex)
            {
                throw ex;
            } 
        }
        #region destrutor
        ~ArquivoNfe()
        {
            Dispose(false);
        }
        protected void Dispose(bool disposing)
        {
            if (disposing)
            { // Code to dispose the managed resources of the class
                sr.Dispose();
                GC.SuppressFinalize(nfe);
            }
            // Code to dispose the un-managed resources of the class
            isDisposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        #endregion


    }
}
