using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Threading;
using Nfe.negocios.monitoramento;
using System.Diagnostics;

namespace Nfe.forms
{
    public partial class FServidor : Form
    {
        public static FServidor servidor;
        private string[] pastas;//guarda o endereço das pastas xml monitoradas
        private int buffer;//guarda o tamanho maximo do buffer
        private int ambiente;//guarda o ambiente que o sistema esta trabalhando
        private string status;//guarda o endereco da pasta de status de servico
        private string cancelamento;//guarda o endereco da pasta de cancelamento
        private string inutilizacao;//guarda o endereco da pasta de inutilizacao
        private string certificado = string.Empty;//guarda o nome do certificado digital
        private string protocolo = string.Empty; // guarda o endereco da pasta de consulta protocolo
        private int intervalo = 0; //guarda o intervalo dos envios de lote ao webservice
        private string copiaDanfe = string.Empty; //guarda o endereco da pasta de copia de danfe
        private string email = string.Empty; //guarda o endereco da pasta de email
        private string smtp = string.Empty; //guarda o endereco do servidor smtp
        private int portaSmtp = 0; //guarda  a porta do servidor smtp
        private string enderecoEmail = string.Empty; //guarda o endereco de email utilizado para enviar as nfe
        private string senha = string.Empty;//guarda senha do email
        private int maxConsulta = 0; //guarda o maximo de consultas que deve ser feita em uma nota

        public int MaxConsulta
        {
            get { return maxConsulta; }
            set { maxConsulta = value; }
        }

        public string Senha
        {
            get { return senha; }
            set { senha = value; }
        }

        public string EnderecoEmail
        {
            get { return enderecoEmail; }
            set { enderecoEmail = value; }
        }


        public int PortaSmtp
        {
            get { return portaSmtp; }
            set { portaSmtp = value; }
        }

        public string Smtp
        {
            get { return smtp; }
            set { smtp = value; }
        }
        

        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        public string CopiaDanfe
        {
            get { return copiaDanfe; }
            set { copiaDanfe = value; }
        }

        public int Intervalo
        {
            get { return intervalo; }
            set { intervalo = value; }
        }
        

        public string Protocolo
        {
            get { return protocolo; }
            set { protocolo = value; }
        }

        public string Certificado
        {
            get { return certificado; }
            set { certificado = value; }
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

        public string Status
        {
            get { return status; }
            set { status = value; }
        }

        public int Ambiente
        {
            get { return ambiente; }
            set { ambiente = value; }
        }

        public int Buffer
        {
            get { return buffer; }
            set { buffer = value; }
        }

        public string[] Pastas
        {
            get { return pastas; }
            set { pastas = value; }
        }

        public FServidor()
        {
            InitializeComponent();
        }       

        public void adicionaMensagemLog(string mensagem)
        {
            rtxLog.Text += System.DateTime.Now.ToString() + "        " + mensagem+ "\n";
            negocios.Log.Lista.Add(System.DateTime.Now.ToString() + "        " + mensagem + "\n");
        }

        public void setProgressBar(int i)
        {
            pbXml.Value = i;
            if (i <= buffer - 10)
            {                
                pbXml.ForeColor = Color.Blue;
            }
            else
                pbXml.ForeColor = Color.Red;
        }

        public void setContagemBuffer(int i)
        {
            lbContXml.Text = i.ToString();
        }

        private void FServidor_Load(object sender, EventArgs e)
        {
            CheckForIllegalCrossThreadCalls = false;
            servidor = this;
            try
            {
                entidades.Configuracao c = new negocios.GerenciaConfiguracao().consultar();
                pastas = c.Pastas;
                status = c.Status;
                certificado = c.Certificado;
                protocolo = c.Protocolo;
                cancelamento = c.Cancelamento;
                inutilizacao = c.Inutilizacao;
                copiaDanfe = c.CopiaDanfe;
                intervalo = Convert.ToInt32(c.Intervalo);
                email = c.DiretorioEmail;
                smtp = c.EnderecoSmpt;
                portaSmtp = c.PortaSmtp;
                senha = c.SenhaEmail;
                enderecoEmail = c.Email;
                dao.DaoNfe.Cont = c.MaxConsulta; //seta o maximo de consultas e envio por nota
                maxConsulta = c.MaxConsulta;
                new negocios.Loader().inicializa();                
                //new negocios.Contingencia().verificaContingencia();
            }
            catch (Exception ex)
            {
                adicionaMensagemLog("Excessão no servidor: " + ex.Message);
            }            
            adicionaMensagemLog("Servidor levantado.");            
        }

        private void tsbConfiguracao_Click(object sender, EventArgs e)
        {            
            FConfiguracao c = new FConfiguracao();
            c.ShowDialog();
        }

        private void FServidor_FormClosing(object sender, FormClosingEventArgs e)
        {
            negocios.monitoramento.CarregaPathArquivo.FlagAlive = false;
            negocios.exclusao.ThreadExclusao.FlagAlive = false;
            negocios.recepcao.ThreadProcessoEnvio.FlagAlive = false;
            negocios.cancelamento.ThreadCancelamento.FlagAlive = false;
            negocios.inutilizacao.ThreadInutilizacao.FlagAlive = false;
            negocios.protocolo.ThreadConsultaProtocolo.FlagAlive = false;
            negocios.recepcao.ThreadProcessoEnvio.FlagAlive = false;
            negocios.retorno.ThreadRetorno.FlagAlive = false;
            negocios.email.ThreadCarregaArquivo.FlagAlive = false;
            negocios.ThreadCopiaDanfe.FlagAlive = false;
            negocios.Log.FlagAlive = false;
            Process.GetCurrentProcess().Kill();
        }

        private void tsbRestart_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Deseja realmente reiniciar o sistema?", "Atenção", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
            {
                FServidor_Load(sender, e);
                Process.GetCurrentProcess().Refresh();
                pictureBox1_Click(sender, e);
            }
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Nfe.forms.FServidor.servidor.pictureBox1.Image = Nfe.forms.FServidor.servidor.imageList1.Images[1];
        }

        private void rtxLog_TextChanged(object sender, EventArgs e)
        {            
            rtxLog.SelectionStart = rtxLog.Text.Length;            
        }

        private void scanToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
        }        

        private void desativarContingênciaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            /*
            if (MessageBox.Show("Deseja realmente sair da contingência?", "Atenção", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                entidades.Configuracao c = new Nfe.entidades.Configuracao();
                c.Contingencia = "NORMAL";
                dao.DaoConfiguracao.contingencia(c);
                verificaContingencia();
            }
             */ 
        }
        public void restart()
        {
            FServidor_Load(null, null);
        }

        private void scanPRToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
        }

        private void scanSPToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
        }

        private void tsbContingência_ButtonClick(object sender, EventArgs e)
        {
            
        }

        private void tsbContingencia_Click(object sender, EventArgs e)
        {
            FContingencia c = new FContingencia();
            c.ShowDialog();
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            FReConsulta cons = new FReConsulta();
            cons.ShowDialog();
        }
    }
}