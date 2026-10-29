using System;
using System.Collections.Generic;
using System.Text;

namespace Nfe.negocios.cancelamento
{
    public static class GerenciaCancelamento
    {
        public static void gerencia(string[] paths)
        {
            ThreadCancelamento.Arquivos = paths;
            ThreadCancelamento.instanciaSingleton();                                
        }
    }
}
