using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Nfe.forms;
using Nfe.dao;

namespace Nfe.negocios
{
    public class GerenciaReConsulta
    {
        public DataSet reConsulta(DataSet ds)
        {
            return DaoNfe.reConsulta(ds);
        }
        public void reConsultaUpdate(DataSet ds)
        {
            DaoNfe.reConsultaUpdate(ds);
        }
    }
}
