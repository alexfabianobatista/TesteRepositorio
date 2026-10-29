using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Threading;

namespace Nfe.negocios
{
    public class GerenciaThreadProcessoEnvio
    {
        private Thread t = null;
        public void gerencia()
        {
            try
            {
                while (t.IsAlive)
                {                    
                    List<string> resultado = new List<string>();

                    int j = 0;
                    while (j < 50)
                    {
                        if (j < XmlBuffer.Buffer.Count)
                        {
                            if (XmlBuffer.Buffer.Count > 0)
                            {                                
                                ParserXML parser = new ParserXML(XmlBuffer.Buffer[j].InnerXml,
                                    @".\Nfe\Schema\nfe_v1.10.xsd");
                                resultado = parser.valida();
                                XmlBuffer.Buffer.RemoveAt(j);
                            }
                        }
                        j++;
                    }

                    t.Join(1000);
                }
            }
            catch (Exception ex)
            {
                new GerenciaExcessoes(ex);
            }

        }
        public void inicializa()
        {
            t = new Thread(new ThreadStart(gerencia));
            t.Start();
        }

    }  
}
