using System;
using System.Collections.Generic;
using System.Text;

namespace Nfe.negocios
{
    public class GerenciaContingencia
    {
        public string verificaContingencia(string uf)
        {
            entidades.Contingencia c = new Nfe.entidades.Contingencia();
            c.Servidor = System.Environment.MachineName;
            c.Estado = Convert.ToInt32(uf);
            return dao.DaoContingencia.procurar(c);
        }
    }
}
