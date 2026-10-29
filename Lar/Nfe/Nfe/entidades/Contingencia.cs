using System;
using System.Collections.Generic;
using System.Text;

namespace Nfe.entidades
{
    public class Contingencia
    {
        private string servidor = string.Empty;
        private int estado = 0;
        private string contingencia = string.Empty;

        public string Servidor
        {
            get { return servidor; }
            set { servidor = value; }
        }        

        public int Estado
        {
            get { return estado; }
            set { estado = value; }
        }        

        public string Conting
        {
            get { return contingencia; }
            set { contingencia = value; }
        }
    }
}
