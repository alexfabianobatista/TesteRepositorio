namespace Nfe.forms
{
    partial class FServidor
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FServidor));
            this.rtxLog = new System.Windows.Forms.RichTextBox();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.tsbConfiguracao = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.tsbRestart = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator3 = new System.Windows.Forms.ToolStripSeparator();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.pbXml = new System.Windows.Forms.ProgressBar();
            this.panel1 = new System.Windows.Forms.Panel();
            this.lbContXml = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.imageList1 = new System.Windows.Forms.ImageList(this.components);
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.tsbConsulta = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStrip1.SuspendLayout();
            this.panel1.SuspendLayout();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // rtxLog
            // 
            this.rtxLog.AcceptsTab = true;
            this.rtxLog.AccessibleRole = System.Windows.Forms.AccessibleRole.ScrollBar;
            this.rtxLog.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.rtxLog.AutoWordSelection = true;
            this.rtxLog.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rtxLog.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.rtxLog.Location = new System.Drawing.Point(0, 143);
            this.rtxLog.Name = "rtxLog";
            this.rtxLog.Size = new System.Drawing.Size(792, 410);
            this.rtxLog.TabIndex = 0;
            this.rtxLog.Text = "";
            this.rtxLog.TextChanged += new System.EventHandler(this.rtxLog_TextChanged);
            // 
            // toolStrip1
            // 
            this.toolStrip1.AutoSize = false;
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsbConfiguracao,
            this.toolStripSeparator3,
            this.tsbConsulta,
            this.toolStripSeparator1,
            this.tsbRestart,
            this.toolStripSeparator2});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(792, 38);
            this.toolStrip1.Stretch = true;
            this.toolStrip1.TabIndex = 1;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // tsbConfiguracao
            // 
            this.tsbConfiguracao.Font = new System.Drawing.Font("Tahoma", 10F, System.Drawing.FontStyle.Bold);
            this.tsbConfiguracao.Image = ((System.Drawing.Image)(resources.GetObject("tsbConfiguracao.Image")));
            this.tsbConfiguracao.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.tsbConfiguracao.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.tsbConfiguracao.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbConfiguracao.Name = "tsbConfiguracao";
            this.tsbConfiguracao.Size = new System.Drawing.Size(136, 35);
            this.tsbConfiguracao.Text = "Configuração";
            this.tsbConfiguracao.Click += new System.EventHandler(this.tsbConfiguracao_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(6, 38);
            // 
            // tsbRestart
            // 
            this.tsbRestart.AutoSize = false;
            this.tsbRestart.Font = new System.Drawing.Font("Tahoma", 10F, System.Drawing.FontStyle.Bold);
            this.tsbRestart.Image = ((System.Drawing.Image)(resources.GetObject("tsbRestart.Image")));
            this.tsbRestart.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.tsbRestart.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.tsbRestart.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbRestart.Name = "tsbRestart";
            this.tsbRestart.Size = new System.Drawing.Size(100, 35);
            this.tsbRestart.Text = "Restart";
            this.tsbRestart.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.tsbRestart.Click += new System.EventHandler(this.tsbRestart_Click);
            // 
            // toolStripSeparator3
            // 
            this.toolStripSeparator3.Name = "toolStripSeparator3";
            this.toolStripSeparator3.Size = new System.Drawing.Size(6, 38);
            // 
            // statusStrip1
            // 
            this.statusStrip1.Location = new System.Drawing.Point(0, 554);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(792, 22);
            this.statusStrip1.TabIndex = 2;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // pbXml
            // 
            this.pbXml.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.pbXml.Location = new System.Drawing.Point(6, 14);
            this.pbXml.Name = "pbXml";
            this.pbXml.Size = new System.Drawing.Size(707, 45);
            this.pbXml.Style = System.Windows.Forms.ProgressBarStyle.Continuous;
            this.pbXml.TabIndex = 3;
            // 
            // panel1
            // 
            this.panel1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.panel1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.lbContXml);
            this.panel1.Location = new System.Drawing.Point(719, 14);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(67, 45);
            this.panel1.TabIndex = 5;
            // 
            // lbContXml
            // 
            this.lbContXml.Font = new System.Drawing.Font("Times New Roman", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbContXml.Location = new System.Drawing.Point(6, 7);
            this.lbContXml.Name = "lbContXml";
            this.lbContXml.Size = new System.Drawing.Size(55, 29);
            this.lbContXml.TabIndex = 0;
            this.lbContXml.Text = "0";
            this.lbContXml.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.Controls.Add(this.pbXml);
            this.groupBox1.Controls.Add(this.panel1);
            this.groupBox1.Location = new System.Drawing.Point(0, 73);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(792, 64);
            this.groupBox1.TabIndex = 6;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Buffer de arquivos XML";
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(0, 41);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(26, 26);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 7;
            this.pictureBox1.TabStop = false;
            this.pictureBox1.Click += new System.EventHandler(this.pictureBox1_Click);
            // 
            // imageList1
            // 
            this.imageList1.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imageList1.ImageStream")));
            this.imageList1.TransparentColor = System.Drawing.Color.Transparent;
            this.imageList1.Images.SetKeyName(0, "CRIMSON.png");
            this.imageList1.Images.SetKeyName(1, "GREEN.png");
            // 
            // tsbConsulta
            // 
            this.tsbConsulta.Font = new System.Drawing.Font("Tahoma", 10F, System.Drawing.FontStyle.Bold);
            this.tsbConsulta.Image = ((System.Drawing.Image)(resources.GetObject("tsbConsulta.Image")));
            this.tsbConsulta.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.tsbConsulta.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.tsbConsulta.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbConsulta.Name = "tsbConsulta";
            this.tsbConsulta.Size = new System.Drawing.Size(166, 35);
            this.tsbConsulta.Text = "Re-Consulta NF-e";
            this.tsbConsulta.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.tsbConsulta.Click += new System.EventHandler(this.toolStripButton1_Click);
            // 
            // toolStripSeparator2
            // 
            this.toolStripSeparator2.Name = "toolStripSeparator2";
            this.toolStripSeparator2.Size = new System.Drawing.Size(6, 38);
            // 
            // FServidor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(792, 576);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.toolStrip1);
            this.Controls.Add(this.rtxLog);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FServidor";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Servidor Nota Fiscal Eletrônica";
            this.Load += new System.EventHandler(this.FServidor_Load);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FServidor_FormClosing);
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.RichTextBox rtxLog;
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripButton tsbConfiguracao;
        private System.Windows.Forms.ProgressBar pbXml;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label lbContXml;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ToolStripButton tsbRestart;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator3;
        public System.Windows.Forms.PictureBox pictureBox1;
        public System.Windows.Forms.ImageList imageList1;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.ToolStripButton tsbConsulta;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator2;
    }
}