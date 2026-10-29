using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Xml.Schema;
using System.IO;

namespace Nfe.negocios
{
    public class ParserXML : IDisposable
    {
        //atributos
        private string xml = string.Empty;
        private string schema = string.Empty;
        private bool hasErrorFlag = false;
        private List<string> retorno = new List<string>();        
        private bool isDisposed = false;

        ~ParserXML()
        {
            Dispose(false);
        }

        //construtor
        public ParserXML(string xml, string schema)
        {
            this.xml = xml;
            this.schema = schema;
            this.hasErrorFlag = false;
        }

        public List<string> valida()
        {
            XmlValidatingReader reader = new XmlValidatingReader(new XmlTextReader(new StringReader(xml)));   
            
            try
            {
                // cria uma collection de schemas e adiciona o xsd
                XmlSchemaCollection schemaCollection = new XmlSchemaCollection();
                schemaCollection.Add("http://www.portalfiscal.inf.br/nfe", schema);

                //adiciona a collection de schema em xmlValidateReader
                reader.Schemas.Add(schemaCollection);

                //inicia a validacao
                reader.ValidationEventHandler += new ValidationEventHandler(this.reader_ValidationEventHandler);

                //iteracao com o documento xml
                while (reader.Read())
                { }

                if (hasErrorFlag == false)
                {                    
                    retorno.Add("Validaçao completa");
                    reader.Close();
                    return retorno;
                }
                else
                {
                    return retorno;
                }
            }
            catch (Exception ex)
            {
                new GerenciaExcessoes(ex);
                return retorno;
            }

            

        }
        private void reader_ValidationEventHandler(object sender, ValidationEventArgs e)
        {
            //reporta o erro
            retorno.Add("Erro no XML");
            retorno.Add("Posiçao: " + e.Exception.LinePosition);
            retorno.Add("Numero Linha: " + e.Exception.LineNumber);
            retorno.Add("Mensagem: " + e.Exception.Message);
            this.hasErrorFlag = true;
        }


        protected void Dispose(bool disposing)
        {
            if (disposing)
            {
                // Code to dispose the managed resources of the class

            }
            // Code to dispose the un-managed resources of the class

            isDisposed = true;

        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

    }

}
