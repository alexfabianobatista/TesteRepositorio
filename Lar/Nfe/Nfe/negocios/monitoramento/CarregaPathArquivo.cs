using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.IO;

namespace Nfe.negocios.monitoramento
{
    /*
     * Esta classe carrega os arquivos do repositorio xml     
     *  e envia para classe XmlBuffer (buffer principal)
     */ 
    public class CarregaPathArquivo
    {
        private string path = string.Empty;
        private string operacao = string.Empty;
        private static bool flagAlive = true;
        private Thread t = null;
        
        public CarregaPathArquivo(string path, string operacao)
        {
            this.path = path;
            this.operacao = operacao;
        }              

        public static bool FlagAlive
        {
            get { return flagAlive; }
            set { flagAlive = value; }
        }
        
        private void gerencia()
        {
            switch(operacao)
            {
                case "nota":
                    while (t.IsAlive && flagAlive)
                    {
                        if (!XmlBuffer.IsLock)
                        {
                            if (!string.IsNullOrEmpty(path))
                            {                                
                                XmlBuffer.adiciona(Directory.GetFiles(path));
                            }
                        }
                        t.Join(3000);
                    }
                    t.Abort();
                    break;
                case "status":
                    while (t.IsAlive && flagAlive)
                    {
                        string[] paths = Directory.GetFiles(path);
                        negocios.status.GerenciaStatusServico.gerencia(paths);
                        t.Join(3000);
                    }
                    break;
                case "cancelamento":
                    while (t.IsAlive && flagAlive)
                    {
                        string[] paths = Directory.GetFiles(path);
                        if(paths.Length > 0)
                            negocios.cancelamento.GerenciaCancelamento.gerencia(paths);
                        t.Join(3000);
                    }
                    break;
                case "inutilizacao":
                    while (t.IsAlive && flagAlive)
                    {
                        string[] paths = Directory.GetFiles(path);
                        if (paths.Length > 0)
                            negocios.inutilizacao.GerenciaInutilizacao.gerencia(paths);
                        t.Join(3000);
                    }
                    break;
                case "protocolo":
                    while (t.IsAlive && flagAlive)
                    {
                        string[] paths = Directory.GetFiles(path);
                        if (paths.Length > 0)
                            negocios.protocolo.GerenciaProtocolo.gerencia(paths);
                        t.Join(3000);
                    }
                    break;    
                case "copia":
                    while (t.IsAlive && flagAlive)
                    {
                        string[] paths = Directory.GetFiles(path);
                        if (paths.Length > 0)
                            negocios.ThreadCopiaDanfe.Paths = paths;
                        t.Join(3000);
                    }
                    break;
            }
        }

        public void inicializa()
        {
            t = new Thread(new ThreadStart(gerencia));
            t.Start();
        }
    }
}
