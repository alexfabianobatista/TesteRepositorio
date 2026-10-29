using System;
using System.Collections.Generic;
using System.Text;

namespace Nfe.negocios
{
    /*
     * Esta classe inicializa os processos da camada de negocios
     */ 
    public class Loader
    {
        public void inicializa()
        {
            try
            {
                //inicializa o buffer
                forms.FServidor.servidor.Buffer = dao.DaoConfiguracao.consultar().MaxBuffer;
                Nfe.forms.FServidor.servidor.adicionaMensagemLog("Buffer de xml inicializado, tamanho máximo: " + forms.FServidor.servidor.Buffer);

                //inicializa o monitoramento das pastas xml NF-e                
                foreach (string s in forms.FServidor.servidor.Pastas)
                {
                    if (s != null)
                    {
                        monitoramento.Monitor g = new Nfe.negocios.monitoramento.Monitor();
                        g.Servico = "nota";
                        g.inicializa(s);
                        Nfe.forms.FServidor.servidor.adicionaMensagemLog("Thread de monitoramento da pasta " + s + " inicializado");
                    }
                }               

                //inicializa o monitoramento da pasta de consulta status do servico

                monitoramento.Monitor t = new monitoramento.Monitor();
                //t.Servico = "situacao";
                //t.inicializa(Nfe.forms.FServidor.servidor.Status);
                new monitoramento.CarregaPathArquivo(Nfe.forms.FServidor.servidor.Status, "status").inicializa();
                Nfe.forms.FServidor.servidor.adicionaMensagemLog("Thread de monitoramento da pasta " + Nfe.forms.FServidor.servidor.Status + " inicializado");

                //inicia monitoramento da pasta de consulta de protocolo
                new monitoramento.CarregaPathArquivo(Nfe.forms.FServidor.servidor.Protocolo, "protocolo").inicializa();
                Nfe.forms.FServidor.servidor.adicionaMensagemLog("Thread de monitoramento da pasta " + Nfe.forms.FServidor.servidor.Protocolo + " inicializado");
                //monitoramento.Monitor mProtocolo = new Nfe.negocios.monitoramento.Monitor();
                //mProtocolo.Servico = "protocolo";
                //mProtocolo.inicializa(forms.FServidor.servidor.Protocolo);
                //Nfe.forms.FServidor.servidor.adicionaMensagemLog("Thread de monitoramento da pasta " + Nfe.forms.FServidor.servidor.Protocolo + " inicializado");
                //new protocolo.ThreadConsultaProtocolo().inicializa();

                //inicia monitoramento da pasta de cancelamento
                //monitoramento.Monitor cancel = new monitoramento.Monitor();
                new monitoramento.CarregaPathArquivo(Nfe.forms.FServidor.servidor.Cancelamento, "cancelamento").inicializa();
                Nfe.forms.FServidor.servidor.adicionaMensagemLog("Thread de monitoramento da pasta " + Nfe.forms.FServidor.servidor.Cancelamento + " inicializado");
                //monitoramento.Monitor mCancelamento = new Nfe.negocios.monitoramento.Monitor();
                //mCancelamento.Servico = "cancelamento";
                //mCancelamento.inicializa(forms.FServidor.servidor.Cancelamento);
                //Nfe.forms.FServidor.servidor.adicionaMensagemLog("Thread de monitoramento da pasta " + Nfe.forms.FServidor.servidor.Cancelamento + " inicializado");
                //new cancelamento.ThreadCancelamento().inicializa();

                //inicia monitoramento da pasta de inutilizacao
                new monitoramento.CarregaPathArquivo(Nfe.forms.FServidor.servidor.Inutilizacao, "inutilizacao").inicializa();
                Nfe.forms.FServidor.servidor.adicionaMensagemLog("Thread de monitoramento da pasta " + Nfe.forms.FServidor.servidor.Inutilizacao + " inicializado");
                //monitoramento.Monitor mInutilizacao = new Nfe.negocios.monitoramento.Monitor();
                //mInutilizacao.Servico = "inutilizacao";
                //mInutilizacao.inicializa(forms.FServidor.servidor.Inutilizacao);
                //Nfe.forms.FServidor.servidor.adicionaMensagemLog("Thread de monitoramento da pasta " + Nfe.forms.FServidor.servidor.Inutilizacao + " inicializado");
                //new inutilizacao.ThreadInutilizacao().inicializa();

                //inicia monitoramento da pasta de copias de danfe
                //monitoramento.Monitor mCopiaDanfe = new Nfe.negocios.monitoramento.Monitor();
                //mCopiaDanfe.Servico = "copia";
                //mCopiaDanfe.inicializa(forms.FServidor.servidor.CopiaDanfe);
                new monitoramento.CarregaPathArquivo(Nfe.forms.FServidor.servidor.CopiaDanfe, "copia").inicializa();
                Nfe.forms.FServidor.servidor.adicionaMensagemLog("Thread de monitoramento da pasta " + Nfe.forms.FServidor.servidor.CopiaDanfe + " inicializado");
                new ThreadCopiaDanfe().inicializa();
                
                //inicializa thread de processo de envio de nfe
                new recepcao.ThreadProcessoEnvio().inicializa();
                Nfe.forms.FServidor.servidor.adicionaMensagemLog("Thread de processo de envio de NF-e inicializado");
                new exclusao.ThreadExclusao();
                Nfe.forms.FServidor.servidor.adicionaMensagemLog("Thread de exclusão de arquivos xml inicializado");

                //inicializa thread de consulta retorno de lote
                new retorno.ThreadRetorno().gerencia();
                Nfe.forms.FServidor.servidor.adicionaMensagemLog("Thread de consulta de lote inicializado");

                //inicializa monitoramento da pasta dos xml
                foreach (string s in forms.FServidor.servidor.Pastas)
                {
                    new negocios.monitoramento.CarregaPathArquivo(s,"nota").inicializa();
                }

                //inicializa monitoramento da pasta de envio de email
                new negocios.email.ThreadCarregaArquivo().inicializa();
                Nfe.forms.FServidor.servidor.adicionaMensagemLog("Thread de envio de e-mail inicializado");

                //inicializa thread de gravacao de log
                new negocios.Log().inicializa();
            }
            catch (Exception ex)
            {
                new GerenciaExcessoes(ex);
            }                      
        }
    }
}
