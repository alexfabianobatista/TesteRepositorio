using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Security.Cryptography.X509Certificates;
using System.IO;
using Nfe.negocios;

namespace Nfe.forms
{
    public partial class FConfiguracao : Form
    {
        private string servidor = string.Empty;

        public string Servidor
        {
            get { return servidor; }
            set { servidor = value; }
        }

        public FConfiguracao()
        {
            InitializeComponent();
        }

        private void btDiretorio_Click(object sender, EventArgs e)
        {
            if (fdbFolders.ShowDialog() == DialogResult.OK)
            {
                txbDiretorio.Text = fdbFolders.SelectedPath;
            }
            txbDiretorio_Leave(sender,e);
        }

        private void txbDiretorio_Leave(object sender, EventArgs e)
        {
            if(txbDiretorio.Text != string.Empty)
                lbDiretorios.Items.Add(txbDiretorio.Text);
            txbDiretorio.Clear();
        }

        private void txbDiretorio_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == 13)
                txbDiretorio_Leave(sender, e);
        }

        private void btExcluir_Click(object sender, EventArgs e)
        {
            if (lbDiretorios.Items.Count > 0 && lbDiretorios.SelectedItem != null)
            {                
                object[] obj = new object[lbDiretorios.Items.Count];
                lbDiretorios.Items.RemoveAt(lbDiretorios.SelectedIndex);
                List<string> lista = new List<string>();
                for (int i = 0; i < lbDiretorios.Items.Count; i++)
                {
                    lbDiretorios.Items.CopyTo(obj, i);
                }
                foreach (string s in obj)
                {
                    lista.Add(s);
                }
                new GerenciaConfiguracao().removePastasNegocio(lista, servidor);                
            }
        }

        private void btCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btOk_Click(object sender, EventArgs e)
        {
            string[] s = new string[lbDiretorios.Items.Count];
            int i=0; 

            foreach (string linha in lbDiretorios.Items)
            {
                s[i] = linha;
                i++;
            }
            try
            {
                new negocios.GerenciaConfiguracao().incluir(Convert.ToInt32(mtxbBuffer.Text), s,txbCancelamento.Text,txbInutilizacao.Text,
                    txbConsulta.Text,txbCertificado.Text, txbProtocolo.Text, txbCopia.Text, mtxbIntervalo.Text, txbMail.Text, mtxbSenha.Text,
                    txbSmtp.Text, Convert.ToInt32(mtxbPorta.Text), txbMailFolder.Text);
                forms.FServidor.servidor.restart();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            this.Close();
        }

        private void FConfiguracao_Load(object sender, EventArgs e)
        {
            entidades.Configuracao c = new negocios.GerenciaConfiguracao().consultar();
            mtxbBuffer.Text = c.MaxBuffer.ToString();
            txbConsulta.Text = c.Status;
            txbCancelamento.Text = c.Cancelamento;
            txbInutilizacao.Text = c.Inutilizacao;
            txbCertificado.Text = c.Certificado;
            txbProtocolo.Text = c.Protocolo;
            txbCopia.Text = c.CopiaDanfe;
            mtxbIntervalo.Text = c.Intervalo;
            txbMail.Text = c.Email;
            mtxbSenha.Text = c.SenhaEmail;
            txbSmtp.Text = c.EnderecoSmpt;
            mtxbPorta.Text = c.PortaSmtp.ToString();
            txbMailFolder.Text = c.DiretorioEmail;
            servidor = c.Servidor;
            tsslServidor.Text = string.Format("Servidor: {0}",c.Servidor);
            if (c.Pastas != null)
            {
                foreach (string s in c.Pastas)
                {
                    if (s != null)
                        lbDiretorios.Items.Add(s);
                }
            }
        }

        private void btStatus_Click(object sender, EventArgs e)
        {
            if (fdbFolders.ShowDialog() == DialogResult.OK)
            {
                txbConsulta.Text = fdbFolders.SelectedPath;
            }
        }

        private void btCancelamento_Click(object sender, EventArgs e)
        {
            if (fdbFolders.ShowDialog() == DialogResult.OK)
            {
                txbCancelamento.Text = fdbFolders.SelectedPath;
            }
        }

        private void btInutilizacao_Click(object sender, EventArgs e)
        {
            if (fdbFolders.ShowDialog() == DialogResult.OK)
            {
                txbInutilizacao.Text = fdbFolders.SelectedPath;
            }
        }

        private void btCertificado_Click(object sender, EventArgs e)
        {            
            X509Certificate2 X509Cert = new X509Certificate2();
            X509Store store = new X509Store("MY", StoreLocation.CurrentUser);
            store.Open(OpenFlags.ReadOnly | OpenFlags.OpenExistingOnly);
            X509Certificate2Collection collection = (X509Certificate2Collection)store.Certificates;
            X509Certificate2Collection collection2 = (X509Certificate2Collection)collection.Find(X509FindType.FindByKeyUsage,
                                                          X509KeyUsageFlags.DigitalSignature, false);
            X509Certificate2Collection scollection = X509Certificate2UI.SelectFromCollection(collection2, "Certificado(s) Digital(is) disponível(is)",
                                                                                             "Selecione o Certificado Digital para uso no aplicativo", X509SelectionFlag.SingleSelection);
            if (scollection.Count > 0)
            {
                X509Cert = scollection[0];
                txbCertificado.Text = X509Cert.GetNameInfo(X509NameType.SimpleName, false);
            }
        }

        private void btLogo_Click(object sender, EventArgs e)
        {
            
        }

        private void txbLogo_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void btProtocolo_Click(object sender, EventArgs e)
        {
            if (fdbFolders.ShowDialog() == DialogResult.OK)
            {
                txbProtocolo.Text = fdbFolders.SelectedPath;
            }
        }

        private void btCopia_Click(object sender, EventArgs e)
        {
            if (fdbFolders.ShowDialog() == DialogResult.OK)
            {
                txbCopia.Text = fdbFolders.SelectedPath;
            }
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void btBuscaMail_Click(object sender, EventArgs e)
        {
            if (fdbFolders.ShowDialog() == DialogResult.OK)
            {
                txbMailFolder.Text = fdbFolders.SelectedPath;
            }
        }
    }
}