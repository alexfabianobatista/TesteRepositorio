namespace Danfe
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FServidor));
            this.btServidor = new System.Windows.Forms.Button();
            this.txbServidor = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btServidor
            // 
            this.btServidor.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.btServidor.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btServidor.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btServidor.Image = ((System.Drawing.Image)(resources.GetObject("btServidor.Image")));
            this.btServidor.Location = new System.Drawing.Point(146, 60);
            this.btServidor.Name = "btServidor";
            this.btServidor.Size = new System.Drawing.Size(97, 34);
            this.btServidor.TabIndex = 0;
            this.btServidor.Text = "Conectar";
            this.btServidor.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btServidor.UseVisualStyleBackColor = true;
            this.btServidor.Click += new System.EventHandler(this.btServidor_Click);
            // 
            // txbServidor
            // 
            this.txbServidor.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txbServidor.Location = new System.Drawing.Point(12, 34);
            this.txbServidor.Name = "txbServidor";
            this.txbServidor.Size = new System.Drawing.Size(375, 20);
            this.txbServidor.TabIndex = 1;
            this.txbServidor.Text = "127.0.0.1";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 18);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(146, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Digite o endereço do servidor";
            // 
            // FServidor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(399, 106);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txbServidor);
            this.Controls.Add(this.btServidor);
            this.MaximizeBox = false;
            this.Name = "FServidor";
            this.ShowIcon = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Conexão";
            this.Load += new System.EventHandler(this.FServidor_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btServidor;
        private System.Windows.Forms.TextBox txbServidor;
        private System.Windows.Forms.Label label1;
    }
}