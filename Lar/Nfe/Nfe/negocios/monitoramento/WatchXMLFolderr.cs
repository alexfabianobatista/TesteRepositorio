using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Windows.Forms;
using Nfe.forms;

namespace Nfe.negocios.monitoramento
{
    public class WatchXMLFolderr
    {
        private string servico;

        public string Servico
        {
            get { return servico; }
            set { servico = value; }
        }

        public WatchXMLFolderr(string path)
        {
            try
            {
                //cria o objeto FileSystemWatcher e configura suas propriedades
                FileSystemWatcher watch = new FileSystemWatcher();                
                watch.Path = path;
                watch.SynchronizingObject = FServidor.servidor;
                watch.Filter = "*.xml";
                if (watch.Path != string.Empty)
                    watch.EnableRaisingEvents = true;
                //adiciona manipulador de evento
                watch.Created += new FileSystemEventHandler(this.OnCreated);
                watch.EndInit();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void OnCreated(object source, FileSystemEventArgs e)
        {            
            switch(servico)
            {
                case "nota":
                    //XmlBuffer.adiciona(e.FullPath);
                    break;
                case "situacao":                                        
                    //status.GerenciaStatusServico.gerencia(e.FullPath);
                    break;
                case "protocolo":
                    //protocolo.ThreadConsultaProtocolo.Arquivos.Add(e.FullPath);
                    break;
                case "cancelamento":
                    //cancelamento.ThreadCancelamento.Arquivos.Add(e.FullPath);
                    break;
                case "inutilizacao":
                    //inutilizacao.ThreadInutilizacao.Arquivos.Add(e.FullPath);
                    break;
                case "copia":
                    //ThreadCopiaDanfe.Paths.Add(e.FullPath);
                    break;
            }
        }     
    }
}
