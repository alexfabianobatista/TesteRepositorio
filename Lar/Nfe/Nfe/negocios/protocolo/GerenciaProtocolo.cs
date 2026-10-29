using System;
using System.Collections.Generic;
using System.Text;
using Nfe.negocios.protocolo;

namespace Nfe.negocios.protocolo
{
    public static class GerenciaProtocolo
    {
        public static void gerencia(string[] paths)
        {
            ThreadConsultaProtocolo.Arquivos = paths;
            ThreadConsultaProtocolo t = new ThreadConsultaProtocolo();
            t.inicializa();            
        }
    }
}
