using System;
using System.Collections.Generic;
using System.Text;

namespace Danfe.entidades
{
    public class Configuracao
    {
        private string servidor;       
        private string[] pastas;       
        private int maxBuffer;
        private int i = 0;
        private string cancelamento;
        private string inutilizacao;
        private string status;
        private string certificado;
        private string logo;
        private string servidorImpressao;

        public string ServidorImpressao
        {
            get { return servidorImpressao; }
            set { servidorImpressao = value; }
        }

        public string Logo
        {
            get { return logo; }
            set { logo = value; }
        }

        public string Certificado
        {
            get { return certificado; }
            set { certificado = value; }
        }

        public string Status
        {
            get { return status; }
            set { status = value; }
        }
        public string Inutilizacao
        {
            get { return inutilizacao; }
            set { inutilizacao = value; }
        }
        public string Cancelamento
        {
            get { return cancelamento; }
            set { cancelamento = value; }
        }
        public string Servidor
        {
            get { return servidor; }
            set { servidor = value; }
        }
        public Configuracao()
        {
        }
        public string[] Pastas
        {
            get { return pastas; }
            set { pastas = value; }
        }
        public int MaxBuffer
        {
            get { return maxBuffer; }
            set { maxBuffer = value; }
        }
        public void setPastas(string p)
        {
            if (pastas == null)
                pastas = new string[100];
            pastas[i] = p;
            i++;
        }
    }
}
