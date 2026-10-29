using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.IO;

namespace Nfe.negocios.exclusao
{
    public class ThreadExclusao
    {
        private Thread excluiTh = null;
        private static bool flagAlive = true;

        public static bool FlagAlive
        {
            get { return ThreadExclusao.flagAlive; }
            set { ThreadExclusao.flagAlive = value; }
        }

        public ThreadExclusao()
        {
            excluiTh = new Thread(new ThreadStart(exclui));
            excluiTh.Start();            
            excluiTh.IsBackground = true;  
        }
        
        private void exclui()
        {
            string[] paths;
            while (excluiTh.IsAlive)
            {
                try
                {
                    paths = BufferPathExclusao.getPath();
                    foreach (string p in paths)
                    {
                        File.Delete(p);
                    }
                    foreach (string s in forms.FServidor.servidor.Pastas)
                    {
                        if (s != null)
                        {
                            ExcluiXmlNaoCarregado e = new ExcluiXmlNaoCarregado(s);
                            e.Dispose();
                        }
                    }
                    excluiTh.Join(5000);
                }
                catch (Exception ex)
                {                    
                    new GerenciaExcessoes(new Exception("Thread de exclusão de arquivos abortada " + ex.Message));
                    flagAlive = false;
                }
                
                if (!flagAlive)
                    excluiTh.Abort();
            }
        }
    }
}
