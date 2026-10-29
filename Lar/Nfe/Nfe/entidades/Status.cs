using System;
using System.Collections.Generic;
using System.Text;

namespace Nfe.entidades
{
    public class Status
    {
        private int uf;
        private int ambiente;
        private int codigo;
        private string mensagem;
        private string hora;

        public string Hora
        {
            get { return hora; }
            set { hora = value; }
        }

        public string Mensagem
        {
            get { return mensagem; }
            set { mensagem = value; }
        }

        public int Codigo
        {
            get { return codigo; }
            set { codigo = value; }
        }

        public int Ambiente
        {
            get { return ambiente; }
            set { ambiente = value; }
        }

        public int Uf
        {
            get { return uf; }
            set { uf = value; }
        }
        
    }
}
