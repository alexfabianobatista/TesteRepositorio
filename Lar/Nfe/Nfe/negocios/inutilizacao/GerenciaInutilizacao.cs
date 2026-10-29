using System;
using System.Collections.Generic;
using System.Text;
using Nfe.negocios.inutilizacao;

namespace Nfe.negocios.inutilizacao
{
    public static class GerenciaInutilizacao
    {
        public static void gerencia(string[] paths)
        {
            ThreadInutilizacao.Arquivos = paths;
            ThreadInutilizacao t = new ThreadInutilizacao();
            t.inicializa();            
        }
    }
}
