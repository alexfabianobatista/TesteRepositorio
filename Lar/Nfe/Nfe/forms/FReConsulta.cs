using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using Nfe.negocios;

namespace Nfe.forms
{
    public partial class FReConsulta : Form
    {
        public FReConsulta()
        {
            InitializeComponent();
        }

        private void FReConsulta_Load(object sender, EventArgs e)
        {
            if (dataGridView1.Columns.Count == 0)
            {
                DataGridViewCheckBoxColumn column = new DataGridViewCheckBoxColumn();
                column.HeaderText = string.Empty;
                dataGridView1.Columns.Add(column);
            }
            dataSet1.Clear();
            dataGridView1.DataSource = (DataTable)new GerenciaReConsulta().reConsulta(dataSet1).Tables[0];
            dataGridView1.Columns[0].Width = 40;
            formataGridView();
            foreach (DataGridViewRow rows in dataGridView1.Rows)
            {
                rows.Cells[0].Value = true;
            }
            foreach (DataGridViewColumn c in dataGridView1.Columns)
            {
                c.SortMode = DataGridViewColumnSortMode.NotSortable;
            }
        }

        private void formataGridView()
        {
            dataGridView1.Columns[1].HeaderText = "Id";
            dataGridView1.Columns[1].Width = dataGridView1.Columns[1].GetPreferredWidth(DataGridViewAutoSizeColumnMode.DisplayedCells,true);
            dataGridView1.Columns[2].HeaderText = "Contador";
            dataGridView1.Columns[3].HeaderText = "Hora";
            dataGridView1.Columns[4].HeaderText = "Código Retorno";
            dataGridView1.Columns[5].HeaderText = "Sicop";
        }

        private void button1_Click(object sender, EventArgs e)
        {
           
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (DataGridViewRow rows in dataGridView1.Rows)
                {
                    if (rows.Cells[0].Value != null)
                    {
                        if ((bool)rows.Cells[0].Value)
                        {
                            if ((int)dataSet1.Tables[0].Rows[rows.Index]["cont"] >= FServidor.servidor.MaxConsulta)
                                dataSet1.Tables[0].Rows[rows.Index]["cont"] = 0;
                        }
                    }
                }
                new GerenciaReConsulta().reConsultaUpdate(dataSet1);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {            
            FReConsulta_Load(sender, e);
        }
    }
}