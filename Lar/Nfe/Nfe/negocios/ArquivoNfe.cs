using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.IO;
using Nfe.entidades;

namespace Nfe.negocios
{
    public class ArquivoNfe
    {                
        private StreamReader sr;
        private bool isDisposed = false;
        private entidades.Nfe nfe;
        private XmlDataDocument xmlDataDoc;
        private XmlDataDocument xmlDataDocAux;        
        private string cabecalho = @"<?xml version=""1.0"" encoding=""utf-8""?>";

        public entidades.Nfe Nfe
        {
            get { return nfe; }
            set { nfe = value; }
        }

        /*
         * Este método checa se a nota carregada possui todas as tags
         * para não dar erro durante a execução
         * obs: atualizar sempre que forem criados novos campos no xml da nfe
         */ 
        private bool checaIntegridadeNota(XmlDataDocument xmlDataDoc, string path)
        {
            XmlNodeList nodeEmpresa = null;
            XmlNodeList nodeLocal = null;
            XmlNodeList nodeVias = null;
            XmlNodeList nodeForm = null;
            XmlNodeList nodeImp = null;
            XmlNodeList nodeNfe = null;
            try
            {
                if (xmlDataDoc != null)
                {
                    if (xmlDataDoc.DocumentElement != null)
                    {
                        if (xmlDataDoc.OuterXml.Length > 0)
                        {
                            nodeEmpresa = xmlDataDoc.DocumentElement.GetElementsByTagName("empresa");
                            if (nodeEmpresa[0] == null)
                                return false;
                            nodeLocal = xmlDataDoc.DocumentElement.GetElementsByTagName("local");
                            if (nodeLocal[0] == null)
                                return false;
                            nodeVias = xmlDataDoc.DocumentElement.GetElementsByTagName("numVias");
                            if (nodeVias[0] == null)
                                return false;                            
                            nodeForm = xmlDataDoc.DocumentElement.GetElementsByTagName("tpForm");
                            if (nodeForm[0] == null)
                                return false;
                            nodeImp = xmlDataDoc.DocumentElement.GetElementsByTagName("impressora");                       
                            if (nodeImp[0] == null)
                                return false;
                            nodeNfe = xmlDataDoc.DocumentElement.GetElementsByTagName("NFe");
                            if (nodeNfe[0] == null)
                                return false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                forms.FServidor.servidor.adicionaMensagemLog(string.Format("Tentou carregar nota {0}: nota incompleta",path));
                return false;
            }
            return true;
        }

        //este metodo instancia um objeto Nfe e adiciona seus dados
        private void setNfe(XmlDataDocument xmlDataDoc)
        {            
            XmlNodeList nodeEmpresa = xmlDataDoc.DocumentElement.GetElementsByTagName("empresa");
            if (nodeEmpresa[0] != null) //se existir tag empresa é uma nota fiscal
            {
                nfe = new entidades.Nfe();
                nfe.Xml_nfe.PreserveWhitespace = true;                
                nfe.Cod_empresa = nodeEmpresa[0].InnerXml;
                XmlNodeList nodeLocal = xmlDataDoc.DocumentElement.GetElementsByTagName("local");
                nfe.Cod_local = Convert.ToInt32(nodeLocal[0].InnerXml);
                XmlNodeList nodeVias = xmlDataDoc.DocumentElement.GetElementsByTagName("numVias");
                nfe.Num_vias = nodeVias[0].InnerXml;
                XmlNodeList nodeImp = xmlDataDoc.DocumentElement.GetElementsByTagName("impressora");
                nfe.Impressora = nodeImp[0].InnerXml;
                XmlNodeList nodeObsLar = xmlDataDoc.DocumentElement.GetElementsByTagName("obsLar");
                if(nodeObsLar.Count > 0)
                    nfe.Obs_lar = nodeObsLar[0].InnerXml;
                XmlNodeList nodeForm = xmlDataDoc.DocumentElement.GetElementsByTagName("tpForm");
                if (nodeForm.Count > 0)
                    nfe.Tp_form = nodeForm[0].InnerXml;
                XmlNodeList nodeNf = xmlDataDoc.DocumentElement.GetElementsByTagName("nNF");
                nfe.Num_nfe = Convert.ToInt32(nodeNf[0].InnerXml);
                XmlNodeList nodeSerie = xmlDataDoc.DocumentElement.GetElementsByTagName("serie");
                nfe.Desc_serie = nodeSerie[0].InnerXml;
                XmlNodeList nodeNfe = xmlDataDoc.DocumentElement.GetElementsByTagName("NFe");
                XmlNodeList nodeId = xmlDataDoc.DocumentElement.GetElementsByTagName("infNFe");
                XmlAttributeCollection attributes = nodeId[0].Attributes;
                XmlAttribute att = attributes["Id"];
                nfe.Id_nfe = att.Value.Remove(0, 3);
                XmlDataDocument xmlData = new XmlDataDocument();
                xmlData.LoadXml(this.cabecalho + nodeNfe[0].OuterXml);
                nfe.Xml_nfe = xmlData;
            }
        }

        private string formataStringXml(XmlDataDocument xmlData)
        {
            string aux = xmlData.OuterXml;
            aux = aux.Replace("          ", " ");
            aux = aux.Replace("         ", " ");
            aux = aux.Replace("        ", " ");
            aux = aux.Replace("       ", " ");
            aux = aux.Replace("      ", " ");
            aux = aux.Replace("     ", " ");
            aux = aux.Replace("    ", " ");
            aux = aux.Replace("   ", " ");            
            aux = aux.Replace("  ", " ");
            aux = aux.Replace("\n", string.Empty);
            aux = aux.Replace("\r", string.Empty);
            aux = aux.Replace("\t", string.Empty);
            
            return aux;
        }        

        public bool arquivoNfe(string path)
        {
            if (path == string.Empty && path == null)
                return false;

            xmlDataDoc = new XmlDataDocument();
            xmlDataDocAux = new XmlDataDocument();
            System.Timers.Timer t = new System.Timers.Timer();
            t.Interval = 1000;

            if (new IsFileOpen().check(path))
            {
                return false;
            }

            try
            {
                /*
                 *para abrir arquivo com acentos utilizar codificacao ISO8859-1
                 *ex: new StreamReader(@"C:\Arquivo.txt", Encoding.GetEncoding("ISO8859-1") 
                 */

                sr = File.OpenText(path);
                string arquivo = sr.ReadToEnd().Trim();
                sr.Close();
                sr.Dispose();
                //xmlDataDoc.PreserveWhitespace = true;
                //xmlDataDoc.Load(sr.ReadToEnd().Trim());
                xmlDataDoc.PreserveWhitespace = false;
                xmlDataDoc.LoadXml(arquivo);
                xmlDataDocAux.LoadXml(formataStringXml(xmlDataDoc));
                if (checaIntegridadeNota(xmlDataDocAux, path)) 
                {
                    setNfe(xmlDataDocAux);
                    return true;
                }
                else
                    return false;
                
            }
            catch (Exception ex)
            {                
                if (checaIntegridadeNota(xmlDataDoc, path))
                {
                    entidades.Nfe n = new Nfe.entidades.Nfe();
                    XmlNodeList nodeNf = xmlDataDoc.DocumentElement.GetElementsByTagName("nNF");
                    n.Num_nfe = Convert.ToInt32(nodeNf[0].InnerXml);
                    XmlNodeList nodeId = xmlDataDocAux.DocumentElement.GetElementsByTagName("infNFe");
                    XmlAttributeCollection attributes = nodeId[0].Attributes;
                    XmlAttribute att = attributes["Id"];
                    n.Id_nfe = att.Value.Remove(0, 3);
                    n.Cod_retorno_processamento = Convert.ToInt32("900");
                    dao.DaoNfe.incluirOuAlterar(n);
                    forms.FServidor.servidor.adicionaMensagemLog("Arquivo XML com erros, possivelmente faltando tags");
                }
                return false;
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
