using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using Nfe.dao;
using Nfe.entidades;

namespace Nfe.forms
{
    public partial class FContingencia : Form
    {
        public FContingencia()
        {
            InitializeComponent();
        }

        private void tsbInserir_Click(object sender, EventArgs e)
        {            
            bindingSource1.AddNew();            
        }

        private void formataGridView()
        {
            dgvContingencia.Columns[0].Visible = false;
            dgvContingencia.Columns[1].HeaderText = "UF";
            dgvContingencia.Columns[2].HeaderText = "Contingência";
        }

        private void FContingencia_Load(object sender, EventArgs e)
        {
            //dgvContingencia.Refresh();
            //entidades.Contingencia c = new Contingencia();
            //c.Servidor = System.Environment.MachineName;
            //DaoContingencia.listar(ref dsContingencia, c);           
            //bindingSource1.DataSource = dsContingencia.Tables["Table"];
            //dgvContingencia.DataSource = bindingSource1;
            //formataGridView();
            //mtxbEstado.DataBindings.Add("text", bindingSource1, "estado"); 
            //cbContingencia.DataBindings.Add("text", bindingSource1, "contingencia");            
        }

        private void tsbExcluir_Click(object sender, EventArgs e)
        {
            //entidades.Contingencia c = new Contingencia();
            //DataRowView drv = (DataRowView)bindingSource1.Current;
            //c.Servidor = drv.Row["servidor"].ToString();
            //c.Estado = Convert.ToInt32(drv.Row["estado"]);
            //DaoContingencia.excluir(c);
            //DaoContingencia.listar(ref dsContingencia, c);
        }

        private void tsbSalvar_Click(object sender, EventArgs e)
        {
            //errorProvider1.Clear();
            //if (mtxbEstado.Text == string.Empty || cbContingencia.Text == string.Empty)
            //{
            //    errorProvider1.SetError(cbContingencia, "UF ou contingência não informado");
            //    return;
            //}            
            //Contingencia c = new Contingencia();
            //c.Servidor = System.Environment.MachineName;
            //c.Estado = Convert.ToInt32(mtxbEstado.Text);
            //c.Conting = cbContingencia.Text;
            //dao.DaoContingencia.incluirOuAlterar(c);
            //DaoContingencia.listar(ref dsContingencia, c);
        }
    }
}