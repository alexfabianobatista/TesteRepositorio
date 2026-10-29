using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Xml;
using Nfe.forms;
using System.IO;
using Nfe.negocios.email.pdf;

namespace Nfe.negocios.email
{
    public class ThreadCarregaArquivo
    {
        private Thread t = null;
        private static bool flagAlive = true;
        private string[] paths = null;        
        //private DateTime horaInicio = new DateTime(System.DateTime.Now.Year, System.DateTime.Now.Month, System.DateTime.Now.Day, 0, 0, 0, 0);
        //private DateTime horaInicio = new DateTime(System.DateTime.Now.Year, System.DateTime.Now.Month, System.DateTime.Now.Day, 01, 30, 0, 0);

        public static bool FlagAlive
        {
            get { return ThreadCarregaArquivo.flagAlive; }
            set { ThreadCarregaArquivo.flagAlive = value; }
        }
        private void gerencia()
        {
            while (t.IsAlive && flagAlive)
            {
                //DateTime horaAux = horaInicio;
                //DateTime horaFim = horaAux.AddHours(1);
                //if ((System.DateTime.Now > horaInicio) && (System.DateTime.Now < horaFim))
                //{
                    XmlDataDocument xml = new XmlDataDocument();
                    paths = Directory.GetFiles(FServidor.servidor.Email);
                    foreach (string s in paths)
                    {
                        if (!new IsFileOpen().check(s))
                        {
                            try
                            {
                                xml.Load(s);
                                XmlNodeList nodeArquivo = xml.DocumentElement.GetElementsByTagName("tpArquivo");
                                switch (nodeArquivo[0].InnerText)
                                {
                                    case "xml":
                                        BufferMail.adiciona(xml);
                                        break;
                                    case "pdf":
                                        BufferPDF.adiciona(xml);
                                        break;
                                }
                                
                            }
                            catch (Exception ex)
                            {
                                new GerenciaExcessoes(ex);
                            }
                        }
                    }
                    foreach (string s in paths)
                    {
                        if (!new IsFileOpen().check(s))
                        {
                            File.Delete(s);
                        }
                    }
                    //chama a classe de envio dos emails
                    EnviaEmail enviaEmail = new EnviaEmail();
                    enviaEmail.enviaXML();
                    enviaEmail.enviaPDF();
    
                //}
                t.Join(5000);
            }
            t.Abort();
        }
        public void inicializa()
        {
            t = new Thread(new ThreadStart(gerencia));
            t.Start();
        }
    }
}
