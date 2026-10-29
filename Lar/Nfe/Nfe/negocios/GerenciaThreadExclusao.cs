using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.IO;

namespace Nfe.negocios
{
    public class GerenciaThreadExclusao
    {
        private Thread excluiTh = null;        

        public GerenciaThreadExclusao()
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
                    excluiTh.Join(5000);
                }
                catch (Exception ex)
                {
                    new GerenciaExcessoes(ex);
                }
            }
        }
    }
}
