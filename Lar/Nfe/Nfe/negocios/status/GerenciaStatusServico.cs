using System;
using System.Collections.Generic;
using System.Text;

namespace Nfe.negocios.status
{
    public static class GerenciaStatusServico
    {        
        public static void gerencia(string[] paths)
        {
            foreach (string path in paths)
            {
                ThreadGetStatusServico t = new ThreadGetStatusServico(new MontaXml(path));
                t.inicializaThread();
                System.IO.File.Delete(path);
            }
        }
    }
}
