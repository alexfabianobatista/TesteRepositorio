using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;

namespace Danfe
{
    public partial class FPrincipal : Form
    {
        private static string logo;
        private static string servidor;
        private static string intervalo;
        private static FPrincipal objeto;
        private static string copias;
        private static string servidorImpressao;         

        public static string ServidorImpressao
        {
            get { return FPrincipal.servidorImpressao; }
            set { FPrincipal.servidorImpressao = value; }
        }

        public static string Copias
        {
            get { return FPrincipal.copias; }
            set { FPrincipal.copias = value; }
        }

        public static string Intervalo
        {
            get { return FPrincipal.intervalo; }
            set { FPrincipal.intervalo = value; }
        }

        public static string Servidor
        {
            get { return FPrincipal.servidor; }
            set { FPrincipal.servidor = value; }
        }

        public static string Logo
        {
            get { return logo; }
            set { logo = value; }
        }
        public FPrincipal()
        {
            InitializeComponent();
        }

        public FPrincipal(string servidor)
        {
            InitializeComponent();
            FPrincipal.servidor = servidor;
        }

        private void btLogo_Click(object sender, EventArgs e)
        {
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                txbLogo.Text = openFileDialog1.FileName;
            }
        }

        private void txbLogo_TextChanged(object sender, EventArgs e)
        {
            if (txbLogo.Text != string.Empty)
            {
                if (File.Exists(txbLogo.Text))
                {
                    pictureBox1.Load(txbLogo.Text);
                    logo = txbLogo.Text;
                    dao.DaoConfiguracao.alterar();
                }
            }
        }

        private void FPrincipal_Load(object sender, EventArgs e)
        {
            entidades.Configuracao c = new Danfe.entidades.Configuracao();
            c = dao.DaoConfiguracao.consultar();
            logo = c.Logo;
            ServidorImpressao = c.ServidorImpressao;
            if (logo != string.Empty)
                txbLogo.Text = logo;            
            if (textBox1.Text != string.Empty)
                intervalo = textBox1.Text;            
            objeto = this;
            new ThreadDanfe().inicializa();
            CheckForIllegalCrossThreadCalls = false;

        }

        private void txbServidor_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            intervalo = textBox1.Text;
        }
    
        public static void mostraNoDisplay(string p)
        {
            FPrincipal.objeto.rtxLog.Text += p + '\n';
        }

        private void textBox2_KeyPress(object sender, KeyPressEventArgs e)
        {
            
        }

        private void FPrincipal_FormClosing(object sender, FormClosingEventArgs e)
        {
            ThreadDanfe.FlagAtiva = false;
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void rtxLog_TextChanged(object sender, EventArgs e)
        {
            rtxLog.SelectionStart = rtxLog.Text.Length;
        }
  }
}