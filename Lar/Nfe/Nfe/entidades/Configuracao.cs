using System;
using System.Collections.Generic;
using System.Text;

namespace Nfe.entidades
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
        private string protocolo;
        private string copiaDanfe;
        private string intervalo;
        private string email;
        private string senhaEmail;
        private string enderecoSmpt;
        private int portaSmtp;
        private string diretorioEmail;
        private int maxConsulta;       

        public int MaxConsulta
        {
          get { return maxConsulta; }
          set { maxConsulta = value; }
        }
        
        public string DiretorioEmail
        {
            get { return diretorioEmail; }
            set { diretorioEmail = value; }
        }
        
        public int PortaSmtp
        {
            get { return portaSmtp; }
            set { portaSmtp = value; }
        }

        public string EnderecoSmpt
        {
            get { return enderecoSmpt; }
            set { enderecoSmpt = value; }
        }

        public string SenhaEmail
        {
            get { return senhaEmail; }
            set { senhaEmail = value; }
        }

        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        public string Intervalo
        {
            get { return intervalo; }
            set { intervalo = value; }
        }

        public string CopiaDanfe
        {
            get { return copiaDanfe; }
            set { copiaDanfe = value; }
        }       

        public string Protocolo
        {
            get { return protocolo; }
            set { protocolo = value; }
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
