using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using Nfe.forms;
using System.IO;



namespace Nfe.negocios.monitoramento
{
    public class Monitor
    {
        private string path;
        private string servico;

        public string Servico
        {
            get { return servico; }
            set { servico = value; }
        }

        public Monitor()
        {
        }

        private void monitoraFolders()
        {
            try
            {
                new WatchXMLFolderr(path).Servico = servico;               
            }
            catch (Exception ex)
            {
                new negocios.GerenciaExcessoes(ex);
            }
        
        }                
        public void inicializa(string path)
        {
            //era uma thread, agora e apenas uma chamada
            this.path = path;
            monitoraFolders();  
        }
    }
}
