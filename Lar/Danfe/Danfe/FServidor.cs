using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Diagnostics;

namespace Danfe
{
    public partial class FServidor : Form
    {
        private static FServidor servidor;
        
        public void fechaFormulario()
        {
            servidor.Close();
            servidor.Dispose(); 
            Process[] processos = Process.GetProcessesByName("Danfe.vshost");
            Process[] pcs = Process.GetProcessesByName("Danfe");            
            foreach (Process p in processos)
            {
                p.Kill();
                p.WaitForExit();
            }
            foreach (Process ps in pcs)
            {
                ps.Kill();
                ps.WaitForExit();
            }
        }

        public FServidor()
        {
            InitializeComponent();
            servidor = this;    
        }

        private void btServidor_Click(object sender, EventArgs e)
        {
            if (txbServidor.Text != string.Empty)
            {
                new FPrincipal(txbServidor.Text).Show();
                this.Visible = false;
            }
        }

        private void FServidor_Load(object sender, EventArgs e)
        {

        }
    }
}