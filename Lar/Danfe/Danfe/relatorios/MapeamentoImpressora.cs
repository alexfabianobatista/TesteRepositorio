using System;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;

namespace Danfe.relatorios
{
    /// <summary>
    /// Esta classe faz o mapeamento da impressora de rede para
    /// a porta LPT1 do computador
    /// </summary>
    class MapeamentoImpressora
    {
        public bool configuraMapeamento(string impressora)
        {
            bool mapeado = false;            
            try
            {
                Process limpa = new Process();                
                limpa.StartInfo.FileName = "cmd.exe";
                limpa.StartInfo.Arguments = "/C net use lpt1 /delete";
                limpa.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
                limpa.Start();                
                limpa.WaitForExit();

                Process conecta = new Process();
                conecta.StartInfo.FileName = "cmd.exe";
                conecta.StartInfo.Arguments = string.Format("{0}{1}", @"/C net use lpt1 \\127.0.0.1\",
                    impressora);
                conecta.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
                conecta.Start();
                conecta.WaitForExit();              

                mapeado = true;
            }
            catch(Exception ex)
            {
                mapeado = false;
            }
            return mapeado;
        }        
    }
}
