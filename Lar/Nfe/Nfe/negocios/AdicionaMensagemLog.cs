using System;
using System.Collections.Generic;
using System.Text;

namespace Nfe.negocios
{
    public static class AdicionaMensagemLog
    {        
        public static void adicionar(string mensagem)
        {
            Nfe.forms.FServidor.servidor.adicionaMensagemLog(mensagem);
        }
    }
}
