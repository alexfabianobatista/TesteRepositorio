using System;
using System.Collections.Generic;
using System.Text;

namespace Nfe.dao
{
    public static class StringConexao
    {
        static string stringCon = "Server=127.0.0.1;Port=5432;Database=nfe;User Id=postgres;Password=karitec;";
        //static string stringCon = "Server=10.0.0.12;Port=5432;Database=nfe;User Id=postgres;Password=karitec;";        
        
        public static string retornaString()
        {
            return stringCon;
        }
    }
}
