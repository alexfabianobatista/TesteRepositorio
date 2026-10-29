using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;
using System.Diagnostics;

namespace Nfe
{
    //verifica se ja existe um processo sendo executado
    //se existir, gera uma excessão e retorna pra chamada da função

    public class Fabrica
    {
        public static Fabrica f = null;

        public Fabrica()
        {
            checaInstancia();
            f = this;
        }

        private void checaInstancia()
        {
            string processo = Process.GetCurrentProcess().ProcessName;
            Process[] processos = Process.GetProcesses();
            int cont = 0;
            try
            {
                foreach (Process p in processos)
                {
                    if (processo == p.ProcessName)
                    {
                        cont++;
                        if (cont > 1)
                            throw new Exception("Já existe uma instância do programa sendo executada");
                    }
                }                
                Application.Run(new forms.FServidor());
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return;
            }
        }        
    }
}
