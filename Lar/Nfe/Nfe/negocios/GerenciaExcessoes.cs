using System;
using System.Collections.Generic;
using System.Text;

namespace Nfe.negocios
{
    public class GerenciaExcessoes
    {
        //apenas reporta excessoes para o log do servidor
        public GerenciaExcessoes(Exception ex)
        {
            if (Nfe.forms.FServidor.servidor.imageList1.Images.Count > 0)
                Nfe.forms.FServidor.servidor.pictureBox1.Image = Nfe.forms.FServidor.servidor.imageList1.Images[0];
            Nfe.forms.FServidor.servidor.adicionaMensagemLog("Excessão no servidor: " + ex.Message +
                " " + ex.StackTrace);
        }
    }
}
