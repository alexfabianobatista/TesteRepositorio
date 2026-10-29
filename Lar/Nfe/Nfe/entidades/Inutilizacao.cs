using System;
using System.Collections.Generic;
using System.Text;

namespace Nfe.entidades
{
    public class Inutilizacao
    {
        private string ano = string.Empty;
        private string serie = string.Empty;
        private string uf = string.Empty;
        private string nIni = string.Empty;
        private string nFim = string.Empty;
        private string protocolo = string.Empty;
        private string ambiente = string.Empty;
        private string cnpj = string.Empty;
        private string xml = string.Empty;
        private string status = string.Empty;
        private string motivo = string.Empty;
        private string empresa = string.Empty;

        public string Empresa
        {
            get { return empresa; }
            set { empresa = value; }
        }

        public string Motivo
        {
            get { return motivo; }
            set { motivo = value; }
        }
        public string Status
        {
          get { return status; }
          set { status = value; }
        }
        public string Xml
        {
            get { return xml; }
            set { xml = value; }
        }

        public string Ano
        {
            get { return ano; }
            set { ano = value; }
        }        

        public string Cnpj
        {
            get { return cnpj; }
            set { cnpj = value; }
        }        

        public string Serie
        {
            get { return serie; }
            set { serie = value; }
        }        

        public string Uf
        {
            get { return uf; }
            set { uf = value; }
        }        

        public string NIni
        {
            get { return nIni; }
            set { nIni = value; }
        }        

        public string NFim
        {
            get { return nFim; }
            set { nFim = value; }
        }        

        public string Protocolo
        {
            get { return protocolo; }
            set { protocolo = value; }
        }        

        public string Ambiente
        {
            get { return ambiente; }
            set { ambiente = value; }
        }
    }
}