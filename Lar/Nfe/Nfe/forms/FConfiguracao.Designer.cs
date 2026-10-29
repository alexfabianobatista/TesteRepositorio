namespace Nfe.forms
{
    partial class FConfiguracao
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FConfiguracao));
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btExcluir = new System.Windows.Forms.Button();
            this.lbDiretorios = new System.Windows.Forms.ListBox();
            this.btDiretorio = new System.Windows.Forms.Button();
            this.txbDiretorio = new System.Windows.Forms.TextBox();
            this.fdbFolders = new System.Windows.Forms.FolderBrowserDialog();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label2 = new System.Windows.Forms.Label();
            this.mtxbIntervalo = new System.Windows.Forms.MaskedTextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.mtxbBuffer = new System.Windows.Forms.MaskedTextBox();
            this.btOk = new System.Windows.Forms.Button();
            this.btCancel = new System.Windows.Forms.Button();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.btStatus = new System.Windows.Forms.Button();
            this.txbConsulta = new System.Windows.Forms.TextBox();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.btCancelamento = new System.Windows.Forms.Button();
            this.txbCancelamento = new System.Windows.Forms.TextBox();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.btInutilizacao = new System.Windows.Forms.Button();
            this.txbInutilizacao = new System.Windows.Forms.TextBox();
            this.groupBox6 = new System.Windows.Forms.GroupBox();
            this.btCertificado = new System.Windows.Forms.Button();
            this.txbCertificado = new System.Windows.Forms.TextBox();
            this.ofdLogo = new System.Windows.Forms.OpenFileDialog();
            this.groupBox7 = new System.Windows.Forms.GroupBox();
            this.btProtocolo = new System.Windows.Forms.Button();
            this.txbProtocolo = new System.Windows.Forms.TextBox();
            this.groupBox8 = new System.Windows.Forms.GroupBox();
            this.btCopia = new System.Windows.Forms.Button();
            this.txbCopia = new System.Windows.Forms.TextBox();
            this.groupBox9 = new System.Windows.Forms.GroupBox();
            this.mtxbPorta = new System.Windows.Forms.MaskedTextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txbSmtp = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.mtxbSenha = new System.Windows.Forms.MaskedTextBox();
            this.Senha = new System.Windows.Forms.Label();
            this.txbMail = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.groupBox10 = new System.Windows.Forms.GroupBox();
            this.btBuscaMail = new System.Windows.Forms.Button();
            this.txbMailFolder = new System.Windows.Forms.TextBox();
            this.tsslServidor = new System.Windows.Forms.ToolStripStatusLabel();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.groupBox5.SuspendLayout();
            this.groupBox6.SuspendLayout();
            this.groupBox7.SuspendLayout();
            this.groupBox8.SuspendLayout();
            this.groupBox9.SuspendLayout();
            this.statusStrip1.SuspendLayout();
            this.groupBox10.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)));
            this.groupBox1.Controls.Add(this.btExcluir);
            this.groupBox1.Controls.Add(this.lbDiretorios);
            this.groupBox1.Controls.Add(this.btDiretorio);
            this.groupBox1.Controls.Add(this.txbDiretorio);
            this.groupBox1.Location = new System.Drawing.Point(12, 0);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(398, 134);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Repositório";
            // 
            // btExcluir
            // 
            this.btExcluir.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btExcluir.Location = new System.Drawing.Point(318, 105);
            this.btExcluir.Name = "btExcluir";
            this.btExcluir.Size = new System.Drawing.Size(75, 23);
            this.btExcluir.TabIndex = 3;
            this.btExcluir.Text = "Remover";
            this.btExcluir.UseVisualStyleBackColor = true;
            this.btExcluir.Click += new System.EventHandler(this.btExcluir_Click);
            // 
            // lbDiretorios
            // 
            this.lbDiretorios.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)));
            this.lbDiretorios.BackColor = System.Drawing.SystemColors.Window;
            this.lbDiretorios.FormattingEnabled = true;
            this.lbDiretorios.Location = new System.Drawing.Point(6, 42);
            this.lbDiretorios.Name = "lbDiretorios";
            this.lbDiretorios.Size = new System.Drawing.Size(386, 56);
            this.lbDiretorios.TabIndex = 2;
            // 
            // btDiretorio
            // 
            this.btDiretorio.Image = ((System.Drawing.Image)(resources.GetObject("btDiretorio.Image")));
            this.btDiretorio.Location = new System.Drawing.Point(361, 12);
            this.btDiretorio.Name = "btDiretorio";
            this.btDiretorio.Size = new System.Drawing.Size(32, 24);
            this.btDiretorio.TabIndex = 1;
            this.btDiretorio.UseVisualStyleBackColor = true;
            this.btDiretorio.Click += new System.EventHandler(this.btDiretorio_Click);
            // 
            // txbDiretorio
            // 
            this.txbDiretorio.BackColor = System.Drawing.SystemColors.Window;
            this.txbDiretorio.Location = new System.Drawing.Point(6, 16);
            this.txbDiretorio.Name = "txbDiretorio";
            this.txbDiretorio.Size = new System.Drawing.Size(348, 20);
            this.txbDiretorio.TabIndex = 0;
            this.txbDiretorio.Leave += new System.EventHandler(this.txbDiretorio_Leave);
            this.txbDiretorio.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txbDiretorio_KeyPress);
            // 
            // groupBox2
            // 
            this.groupBox2.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox2.Controls.Add(this.label2);
            this.groupBox2.Controls.Add(this.mtxbIntervalo);
            this.groupBox2.Controls.Add(this.label1);
            this.groupBox2.Controls.Add(this.mtxbBuffer);
            this.groupBox2.Location = new System.Drawing.Point(12, 436);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(709, 38);
            this.groupBox2.TabIndex = 8;
            this.groupBox2.TabStop = false;
            this.groupBox2.Enter += new System.EventHandler(this.groupBox2_Enter);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(245, 16);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(170, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "*Intervalo de envio (milissegundos)";
            // 
            // mtxbIntervalo
            // 
            this.mtxbIntervalo.Location = new System.Drawing.Point(182, 13);
            this.mtxbIntervalo.Mask = "000000";
            this.mtxbIntervalo.Name = "mtxbIntervalo";
            this.mtxbIntervalo.Size = new System.Drawing.Size(57, 20);
            this.mtxbIntervalo.TabIndex = 2;
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(63, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(101, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "*Tamanho do buffer";
            // 
            // mtxbBuffer
            // 
            this.mtxbBuffer.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.mtxbBuffer.BackColor = System.Drawing.SystemColors.Window;
            this.mtxbBuffer.Location = new System.Drawing.Point(6, 13);
            this.mtxbBuffer.Mask = "000";
            this.mtxbBuffer.Name = "mtxbBuffer";
            this.mtxbBuffer.Size = new System.Drawing.Size(51, 20);
            this.mtxbBuffer.TabIndex = 0;
            // 
            // btOk
            // 
            this.btOk.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btOk.Location = new System.Drawing.Point(280, 492);
            this.btOk.Name = "btOk";
            this.btOk.Size = new System.Drawing.Size(75, 23);
            this.btOk.TabIndex = 9;
            this.btOk.Text = "Ok";
            this.btOk.UseVisualStyleBackColor = true;
            this.btOk.Click += new System.EventHandler(this.btOk_Click);
            // 
            // btCancel
            // 
            this.btCancel.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.btCancel.Location = new System.Drawing.Point(385, 492);
            this.btCancel.Name = "btCancel";
            this.btCancel.Size = new System.Drawing.Size(75, 23);
            this.btCancel.TabIndex = 10;
            this.btCancel.Text = "Cancelar";
            this.btCancel.UseVisualStyleBackColor = true;
            this.btCancel.Click += new System.EventHandler(this.btCancel_Click);
            // 
            // groupBox3
            // 
            this.groupBox3.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox3.Controls.Add(this.btStatus);
            this.groupBox3.Controls.Add(this.txbConsulta);
            this.groupBox3.Location = new System.Drawing.Point(12, 183);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(709, 44);
            this.groupBox3.TabIndex = 3;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Repositório xml de consulta de status de serviço";
            // 
            // btStatus
            // 
            this.btStatus.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btStatus.Image = ((System.Drawing.Image)(resources.GetObject("btStatus.Image")));
            this.btStatus.Location = new System.Drawing.Point(671, 15);
            this.btStatus.Name = "btStatus";
            this.btStatus.Size = new System.Drawing.Size(32, 24);
            this.btStatus.TabIndex = 2;
            this.btStatus.UseVisualStyleBackColor = true;
            this.btStatus.Click += new System.EventHandler(this.btStatus_Click);
            // 
            // txbConsulta
            // 
            this.txbConsulta.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txbConsulta.BackColor = System.Drawing.SystemColors.Window;
            this.txbConsulta.Location = new System.Drawing.Point(6, 18);
            this.txbConsulta.Name = "txbConsulta";
            this.txbConsulta.Size = new System.Drawing.Size(659, 20);
            this.txbConsulta.TabIndex = 0;
            // 
            // groupBox4
            // 
            this.groupBox4.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox4.Controls.Add(this.btCancelamento);
            this.groupBox4.Controls.Add(this.txbCancelamento);
            this.groupBox4.Location = new System.Drawing.Point(12, 229);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(709, 41);
            this.groupBox4.TabIndex = 4;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Repositório xml de cancelamento";
            // 
            // btCancelamento
            // 
            this.btCancelamento.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btCancelamento.Image = ((System.Drawing.Image)(resources.GetObject("btCancelamento.Image")));
            this.btCancelamento.Location = new System.Drawing.Point(671, 12);
            this.btCancelamento.Name = "btCancelamento";
            this.btCancelamento.Size = new System.Drawing.Size(32, 24);
            this.btCancelamento.TabIndex = 3;
            this.btCancelamento.UseVisualStyleBackColor = true;
            this.btCancelamento.Click += new System.EventHandler(this.btCancelamento_Click);
            // 
            // txbCancelamento
            // 
            this.txbCancelamento.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txbCancelamento.BackColor = System.Drawing.SystemColors.Window;
            this.txbCancelamento.Location = new System.Drawing.Point(6, 15);
            this.txbCancelamento.Name = "txbCancelamento";
            this.txbCancelamento.Size = new System.Drawing.Size(659, 20);
            this.txbCancelamento.TabIndex = 0;
            // 
            // groupBox5
            // 
            this.groupBox5.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox5.Controls.Add(this.btInutilizacao);
            this.groupBox5.Controls.Add(this.txbInutilizacao);
            this.groupBox5.Location = new System.Drawing.Point(12, 272);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(709, 40);
            this.groupBox5.TabIndex = 5;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Repositório xml de inutilização de numeração";
            // 
            // btInutilizacao
            // 
            this.btInutilizacao.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btInutilizacao.Image = ((System.Drawing.Image)(resources.GetObject("btInutilizacao.Image")));
            this.btInutilizacao.Location = new System.Drawing.Point(671, 11);
            this.btInutilizacao.Name = "btInutilizacao";
            this.btInutilizacao.Size = new System.Drawing.Size(32, 24);
            this.btInutilizacao.TabIndex = 4;
            this.btInutilizacao.UseVisualStyleBackColor = true;
            this.btInutilizacao.Click += new System.EventHandler(this.btInutilizacao_Click);
            // 
            // txbInutilizacao
            // 
            this.txbInutilizacao.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txbInutilizacao.BackColor = System.Drawing.SystemColors.Window;
            this.txbInutilizacao.Location = new System.Drawing.Point(6, 14);
            this.txbInutilizacao.Name = "txbInutilizacao";
            this.txbInutilizacao.Size = new System.Drawing.Size(659, 20);
            this.txbInutilizacao.TabIndex = 0;
            // 
            // groupBox6
            // 
            this.groupBox6.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox6.Controls.Add(this.btCertificado);
            this.groupBox6.Controls.Add(this.txbCertificado);
            this.groupBox6.Location = new System.Drawing.Point(12, 135);
            this.groupBox6.Name = "groupBox6";
            this.groupBox6.Size = new System.Drawing.Size(709, 46);
            this.groupBox6.TabIndex = 2;
            this.groupBox6.TabStop = false;
            this.groupBox6.Text = "Certificado digital";
            // 
            // btCertificado
            // 
            this.btCertificado.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btCertificado.Image = ((System.Drawing.Image)(resources.GetObject("btCertificado.Image")));
            this.btCertificado.Location = new System.Drawing.Point(671, 16);
            this.btCertificado.Name = "btCertificado";
            this.btCertificado.Size = new System.Drawing.Size(32, 24);
            this.btCertificado.TabIndex = 2;
            this.btCertificado.UseVisualStyleBackColor = true;
            this.btCertificado.Click += new System.EventHandler(this.btCertificado_Click);
            // 
            // txbCertificado
            // 
            this.txbCertificado.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txbCertificado.BackColor = System.Drawing.SystemColors.Window;
            this.txbCertificado.Location = new System.Drawing.Point(6, 19);
            this.txbCertificado.Name = "txbCertificado";
            this.txbCertificado.Size = new System.Drawing.Size(659, 20);
            this.txbCertificado.TabIndex = 0;
            // 
            // ofdLogo
            // 
            this.ofdLogo.FileName = "openFileDialog1";
            // 
            // groupBox7
            // 
            this.groupBox7.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox7.Controls.Add(this.btProtocolo);
            this.groupBox7.Controls.Add(this.txbProtocolo);
            this.groupBox7.Location = new System.Drawing.Point(12, 313);
            this.groupBox7.Name = "groupBox7";
            this.groupBox7.Size = new System.Drawing.Size(709, 42);
            this.groupBox7.TabIndex = 6;
            this.groupBox7.TabStop = false;
            this.groupBox7.Text = "Repositório xml de consulta protocolo";
            // 
            // btProtocolo
            // 
            this.btProtocolo.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btProtocolo.Image = ((System.Drawing.Image)(resources.GetObject("btProtocolo.Image")));
            this.btProtocolo.Location = new System.Drawing.Point(671, 12);
            this.btProtocolo.Name = "btProtocolo";
            this.btProtocolo.Size = new System.Drawing.Size(32, 24);
            this.btProtocolo.TabIndex = 5;
            this.btProtocolo.UseVisualStyleBackColor = true;
            this.btProtocolo.Click += new System.EventHandler(this.btProtocolo_Click);
            // 
            // txbProtocolo
            // 
            this.txbProtocolo.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txbProtocolo.BackColor = System.Drawing.SystemColors.Window;
            this.txbProtocolo.Location = new System.Drawing.Point(6, 16);
            this.txbProtocolo.Name = "txbProtocolo";
            this.txbProtocolo.Size = new System.Drawing.Size(659, 20);
            this.txbProtocolo.TabIndex = 0;
            // 
            // groupBox8
            // 
            this.groupBox8.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox8.Controls.Add(this.btCopia);
            this.groupBox8.Controls.Add(this.txbCopia);
            this.groupBox8.Location = new System.Drawing.Point(12, 355);
            this.groupBox8.Name = "groupBox8";
            this.groupBox8.Size = new System.Drawing.Size(709, 40);
            this.groupBox8.TabIndex = 7;
            this.groupBox8.TabStop = false;
            this.groupBox8.Text = "Repositório cópia de danfe";
            // 
            // btCopia
            // 
            this.btCopia.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btCopia.Image = ((System.Drawing.Image)(resources.GetObject("btCopia.Image")));
            this.btCopia.Location = new System.Drawing.Point(671, 10);
            this.btCopia.Name = "btCopia";
            this.btCopia.Size = new System.Drawing.Size(32, 24);
            this.btCopia.TabIndex = 6;
            this.btCopia.UseVisualStyleBackColor = true;
            this.btCopia.Click += new System.EventHandler(this.btCopia_Click);
            // 
            // txbCopia
            // 
            this.txbCopia.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txbCopia.Location = new System.Drawing.Point(6, 14);
            this.txbCopia.Name = "txbCopia";
            this.txbCopia.Size = new System.Drawing.Size(659, 20);
            this.txbCopia.TabIndex = 0;
            // 
            // groupBox9
            // 
            this.groupBox9.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox9.Controls.Add(this.mtxbPorta);
            this.groupBox9.Controls.Add(this.label5);
            this.groupBox9.Controls.Add(this.txbSmtp);
            this.groupBox9.Controls.Add(this.label4);
            this.groupBox9.Controls.Add(this.mtxbSenha);
            this.groupBox9.Controls.Add(this.Senha);
            this.groupBox9.Controls.Add(this.txbMail);
            this.groupBox9.Controls.Add(this.label3);
            this.groupBox9.Location = new System.Drawing.Point(416, 0);
            this.groupBox9.Name = "groupBox9";
            this.groupBox9.Size = new System.Drawing.Size(305, 134);
            this.groupBox9.TabIndex = 1;
            this.groupBox9.TabStop = false;
            this.groupBox9.Text = "Configuração do E-Mail";
            // 
            // mtxbPorta
            // 
            this.mtxbPorta.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.mtxbPorta.Location = new System.Drawing.Point(258, 107);
            this.mtxbPorta.Mask = "0000";
            this.mtxbPorta.Name = "mtxbPorta";
            this.mtxbPorta.Size = new System.Drawing.Size(41, 20);
            this.mtxbPorta.TabIndex = 7;
            // 
            // label5
            // 
            this.label5.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(255, 94);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(32, 13);
            this.label5.TabIndex = 6;
            this.label5.Text = "Porta";
            // 
            // txbSmtp
            // 
            this.txbSmtp.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txbSmtp.Location = new System.Drawing.Point(9, 108);
            this.txbSmtp.Name = "txbSmtp";
            this.txbSmtp.Size = new System.Drawing.Size(243, 20);
            this.txbSmtp.TabIndex = 5;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(6, 94);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(86, 13);
            this.label4.TabIndex = 4;
            this.label4.Text = "Endereço SMTP";
            // 
            // mtxbSenha
            // 
            this.mtxbSenha.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.mtxbSenha.Location = new System.Drawing.Point(9, 71);
            this.mtxbSenha.Name = "mtxbSenha";
            this.mtxbSenha.PasswordChar = '*';
            this.mtxbSenha.Size = new System.Drawing.Size(290, 20);
            this.mtxbSenha.TabIndex = 3;
            // 
            // Senha
            // 
            this.Senha.AutoSize = true;
            this.Senha.Location = new System.Drawing.Point(6, 55);
            this.Senha.Name = "Senha";
            this.Senha.Size = new System.Drawing.Size(38, 13);
            this.Senha.TabIndex = 2;
            this.Senha.Text = "Senha";
            // 
            // txbMail
            // 
            this.txbMail.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txbMail.Location = new System.Drawing.Point(9, 32);
            this.txbMail.Name = "txbMail";
            this.txbMail.Size = new System.Drawing.Size(290, 20);
            this.txbMail.TabIndex = 1;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(6, 16);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(36, 13);
            this.label3.TabIndex = 0;
            this.label3.Text = "E-Mail";
            // 
            // statusStrip1
            // 
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsslServidor});
            this.statusStrip1.Location = new System.Drawing.Point(0, 527);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(733, 22);
            this.statusStrip1.TabIndex = 11;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // groupBox10
            // 
            this.groupBox10.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox10.Controls.Add(this.btBuscaMail);
            this.groupBox10.Controls.Add(this.txbMailFolder);
            this.groupBox10.Location = new System.Drawing.Point(12, 395);
            this.groupBox10.Name = "groupBox10";
            this.groupBox10.Size = new System.Drawing.Size(709, 40);
            this.groupBox10.TabIndex = 12;
            this.groupBox10.TabStop = false;
            this.groupBox10.Text = "Repositório xml de envio de e-mail";
            // 
            // btBuscaMail
            // 
            this.btBuscaMail.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btBuscaMail.Image = ((System.Drawing.Image)(resources.GetObject("btBuscaMail.Image")));
            this.btBuscaMail.Location = new System.Drawing.Point(671, 11);
            this.btBuscaMail.Name = "btBuscaMail";
            this.btBuscaMail.Size = new System.Drawing.Size(32, 24);
            this.btBuscaMail.TabIndex = 7;
            this.btBuscaMail.UseVisualStyleBackColor = true;
            this.btBuscaMail.Click += new System.EventHandler(this.btBuscaMail_Click);
            // 
            // txbMailFolder
            // 
            this.txbMailFolder.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txbMailFolder.Location = new System.Drawing.Point(6, 14);
            this.txbMailFolder.Name = "txbMailFolder";
            this.txbMailFolder.Size = new System.Drawing.Size(659, 20);
            this.txbMailFolder.TabIndex = 0;
            // 
            // tsslServidor
            // 
            this.tsslServidor.Name = "tsslServidor";
            this.tsslServidor.Size = new System.Drawing.Size(47, 17);
            this.tsslServidor.Text = "Servidor";
            // 
            // FConfiguracao
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(733, 549);
            this.Controls.Add(this.groupBox10);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.groupBox9);
            this.Controls.Add(this.groupBox8);
            this.Controls.Add(this.groupBox7);
            this.Controls.Add(this.groupBox6);
            this.Controls.Add(this.groupBox5);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.btCancel);
            this.Controls.Add(this.btOk);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FConfiguracao";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Configuração";
            this.Load += new System.EventHandler(this.FConfiguracao_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.groupBox5.ResumeLayout(false);
            this.groupBox5.PerformLayout();
            this.groupBox6.ResumeLayout(false);
            this.groupBox6.PerformLayout();
            this.groupBox7.ResumeLayout(false);
            this.groupBox7.PerformLayout();
            this.groupBox8.ResumeLayout(false);
            this.groupBox8.PerformLayout();
            this.groupBox9.ResumeLayout(false);
            this.groupBox9.PerformLayout();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.groupBox10.ResumeLayout(false);
            this.groupBox10.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btDiretorio;
        private System.Windows.Forms.TextBox txbDiretorio;
        private System.Windows.Forms.Button btExcluir;
        private System.Windows.Forms.ListBox lbDiretorios;
        private System.Windows.Forms.FolderBrowserDialog fdbFolders;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.MaskedTextBox mtxbBuffer;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btOk;
        private System.Windows.Forms.Button btCancel;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.TextBox txbConsulta;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.TextBox txbCancelamento;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.TextBox txbInutilizacao;
        private System.Windows.Forms.Button btStatus;
        private System.Windows.Forms.Button btCancelamento;
        private System.Windows.Forms.Button btInutilizacao;
        private System.Windows.Forms.GroupBox groupBox6;
        private System.Windows.Forms.TextBox txbCertificado;
        private System.Windows.Forms.Button btCertificado;
        private System.Windows.Forms.OpenFileDialog ofdLogo;
        private System.Windows.Forms.GroupBox groupBox7;
        private System.Windows.Forms.TextBox txbProtocolo;
        private System.Windows.Forms.Button btProtocolo;
        private System.Windows.Forms.GroupBox groupBox8;
        private System.Windows.Forms.TextBox txbCopia;
        private System.Windows.Forms.Button btCopia;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.MaskedTextBox mtxbIntervalo;
        private System.Windows.Forms.GroupBox groupBox9;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.MaskedTextBox mtxbSenha;
        private System.Windows.Forms.Label Senha;
        private System.Windows.Forms.TextBox txbMail;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txbSmtp;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.MaskedTextBox mtxbPorta;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.GroupBox groupBox10;
        private System.Windows.Forms.Button btBuscaMail;
        private System.Windows.Forms.TextBox txbMailFolder;
        private System.Windows.Forms.ToolStripStatusLabel tsslServidor;
    }
}