namespace Nfe.forms
{
    partial class FContingencia
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FContingencia));
            this.label1 = new System.Windows.Forms.Label();
            this.mtxbEstado = new System.Windows.Forms.MaskedTextBox();
            this.cbContingencia = new System.Windows.Forms.ComboBox();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.tsbSalvar = new System.Windows.Forms.ToolStripButton();
            this.tsbExcluir = new System.Windows.Forms.ToolStripButton();
            this.dsContingencia = new System.Data.DataSet();
            this.dgvContingencia = new System.Windows.Forms.DataGridView();
            this.bindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.tsbInserir = new System.Windows.Forms.ToolStripButton();
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider(this.components);
            this.toolStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dsContingencia)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvContingencia)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(9, 47);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(21, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "UF";
            // 
            // mtxbEstado
            // 
            this.mtxbEstado.Location = new System.Drawing.Point(12, 63);
            this.mtxbEstado.Mask = "00";
            this.mtxbEstado.Name = "mtxbEstado";
            this.mtxbEstado.Size = new System.Drawing.Size(50, 20);
            this.mtxbEstado.TabIndex = 1;
            // 
            // cbContingencia
            // 
            this.cbContingencia.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.cbContingencia.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbContingencia.FormattingEnabled = true;
            this.cbContingencia.Items.AddRange(new object[] {
            "NORMAL",
            "FS",
            "SCAN",
            "DPEC"});
            this.cbContingencia.Location = new System.Drawing.Point(68, 63);
            this.cbContingencia.Name = "cbContingencia";
            this.cbContingencia.Size = new System.Drawing.Size(319, 21);
            this.cbContingencia.TabIndex = 2;
            // 
            // toolStrip1
            // 
            this.toolStrip1.AutoSize = false;
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsbInserir,
            this.tsbExcluir,
            this.tsbSalvar});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(399, 41);
            this.toolStrip1.TabIndex = 3;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // tsbSalvar
            // 
            this.tsbSalvar.Image = ((System.Drawing.Image)(resources.GetObject("tsbSalvar.Image")));
            this.tsbSalvar.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.tsbSalvar.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbSalvar.Name = "tsbSalvar";
            this.tsbSalvar.Size = new System.Drawing.Size(73, 38);
            this.tsbSalvar.Text = "Salvar";
            this.tsbSalvar.Click += new System.EventHandler(this.tsbSalvar_Click);
            // 
            // tsbExcluir
            // 
            this.tsbExcluir.Image = ((System.Drawing.Image)(resources.GetObject("tsbExcluir.Image")));
            this.tsbExcluir.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.tsbExcluir.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbExcluir.Name = "tsbExcluir";
            this.tsbExcluir.Size = new System.Drawing.Size(74, 38);
            this.tsbExcluir.Text = "Excluir";
            this.tsbExcluir.Click += new System.EventHandler(this.tsbExcluir_Click);
            // 
            // dsContingencia
            // 
            this.dsContingencia.DataSetName = "dsContingencia";
            // 
            // dgvContingencia
            // 
            this.dgvContingencia.AllowUserToAddRows = false;
            this.dgvContingencia.AllowUserToDeleteRows = false;
            this.dgvContingencia.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvContingencia.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvContingencia.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvContingencia.Location = new System.Drawing.Point(12, 90);
            this.dgvContingencia.Name = "dgvContingencia";
            this.dgvContingencia.ReadOnly = true;
            this.dgvContingencia.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvContingencia.Size = new System.Drawing.Size(375, 161);
            this.dgvContingencia.TabIndex = 4;
            // 
            // tsbInserir
            // 
            this.tsbInserir.Image = ((System.Drawing.Image)(resources.GetObject("tsbInserir.Image")));
            this.tsbInserir.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.tsbInserir.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbInserir.Name = "tsbInserir";
            this.tsbInserir.Size = new System.Drawing.Size(74, 38);
            this.tsbInserir.Text = "Inserir";
            this.tsbInserir.Click += new System.EventHandler(this.tsbInserir_Click);
            // 
            // errorProvider1
            // 
            this.errorProvider1.BlinkStyle = System.Windows.Forms.ErrorBlinkStyle.AlwaysBlink;
            this.errorProvider1.ContainerControl = this;
            // 
            // FContingencia
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(399, 263);
            this.Controls.Add(this.dgvContingencia);
            this.Controls.Add(this.toolStrip1);
            this.Controls.Add(this.cbContingencia);
            this.Controls.Add(this.mtxbEstado);
            this.Controls.Add(this.label1);
            this.Name = "FContingencia";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Contingência";
            this.Load += new System.EventHandler(this.FContingencia_Load);
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dsContingencia)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvContingencia)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.MaskedTextBox mtxbEstado;
        private System.Windows.Forms.ComboBox cbContingencia;
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton tsbSalvar;
        private System.Data.DataSet dsContingencia;
        private System.Windows.Forms.DataGridView dgvContingencia;
        private System.Windows.Forms.BindingSource bindingSource1;
        private System.Windows.Forms.ToolStripButton tsbExcluir;
        private System.Windows.Forms.ToolStripButton tsbInserir;
        private System.Windows.Forms.ErrorProvider errorProvider1;
    }
}