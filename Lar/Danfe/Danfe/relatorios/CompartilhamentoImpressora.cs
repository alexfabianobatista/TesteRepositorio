using System;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;

namespace Danfe.relatorios
{
    public class CompartilhamentoImpressora
    {
        public string compartilha(string impressora)
        {
            string retorno = string.Empty;            
            try
            {                
                Process compartilha = new Process();
                compartilha.StartInfo.FileName = "cmd.exe";
                compartilha.StartInfo.Arguments =
                    string.Format("/C rundll32 printui.dll,PrintUIEntry /Xs /n {0} SHARENAME {0} attributes +Shared", impressora);
                compartilha.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
                compartilha.Start();
                compartilha.WaitForExit();                
            }
            catch (Exception ex)
            {               
                retorno = "Não foi possível compartilhar impressora" + impressora;
                return retorno;
            }
            return retorno;
        }

        public string descompartilha(string impressora)
        {
            string retorno = string.Empty;
            try
            {
                Process descompartilha = new Process();
                descompartilha.StartInfo.FileName = "cmd.exe";
                descompartilha.StartInfo.Arguments =
                    string.Format("/C rundll32 printui.dll,PrintUIEntry /Xs /n {0} SHARENAME {0} attributes -Shared", impressora);
                descompartilha.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
                descompartilha.Start();
                descompartilha.WaitForExit();                
            }
            catch (Exception ex)
            {
                retorno = "Não foi possível descompartilhar impressora" + impressora;
                return retorno;
            }
            return retorno;
        }
    }
}
