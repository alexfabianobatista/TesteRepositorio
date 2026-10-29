using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using Scripting;

namespace Nfe.negocios.exclusao
{
    public class ExcluiXmlNaoCarregado
    {
        private string path = string.Empty;
        private bool isDisposed = false;

        public ExcluiXmlNaoCarregado(string path)
        {
            this.path = path;
            checaXml();
        }

        private void checaXml()
        {
            string[] diretorios = Directory.GetFiles(path);
            DateTime dataXml;
            DateTime dataSistema;
            foreach (string s in diretorios)
            {
                dataXml = System.IO.File.GetCreationTime(s);
                dataSistema = System.DateTime.Now;
                if (dataSistema.Second > (dataXml.Second + 600))
                {
                    System.IO.File.Delete(s);
                }
            }            
        }

        #region destrutor
        ~ExcluiXmlNaoCarregado()
        {
            Dispose(true);
        }
        protected void Dispose(bool disposing)
        {
            if (disposing)
            { // Code to dispose the managed resources of the class
                
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
