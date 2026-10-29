using System;
using System.Collections.Generic;
using System.Text;
using Nfe.dao;
using Nfe.entidades;

namespace Nfe.negocios
{
    public class GerenciaConfiguracao
    {
        public void incluir(int buffer, string[] endereco, string cancelamento, string inutilizacao, string status, string certificado, 
            string protocolo, string copia, string intervalo, string email, string senha, string smtp, int porta, string diretorioEmail)
        {
            Configuracao c = new Configuracao();
            c.Servidor = System.Environment.MachineName;
            c.MaxBuffer = buffer;
            c.Pastas = endereco;
            c.Cancelamento = cancelamento;
            c.Inutilizacao = inutilizacao;
            c.Status = status;
            c.Certificado = certificado;
            c.Protocolo = protocolo;
            c.CopiaDanfe = copia;
            c.Intervalo = intervalo;
            c.Email = email;
            c.SenhaEmail = senha;
            c.EnderecoSmpt = smtp;
            c.PortaSmtp = porta;
            c.DiretorioEmail = diretorioEmail;
            try
            {
                DaoConfiguracao.incluirOuAlterar(c);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            Nfe.forms.FServidor.servidor.Pastas = c.Pastas;
        }
        public entidades.Configuracao consultar()
        {
            try
            {
                return dao.DaoConfiguracao.consultar();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void removePastasNegocio(List<string> pastas, string servidor)
        {
            DaoConfiguracao.removePastas(pastas, servidor);
        }
    }
}
