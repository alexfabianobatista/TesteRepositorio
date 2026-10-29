using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Threading;
using Nfe.entidades;
using Nfe.dao;

namespace Nfe.negocios
{
    public class ThreadCopiaDanfe
    {
        static string[] paths = null;
        private Thread t = null;
        private static bool flagAlive = true;

        public static bool FlagAlive
        {
            get { return ThreadCopiaDanfe.flagAlive; }
            set { ThreadCopiaDanfe.flagAlive = value; }
        }

        public static string[] Paths
        {
            get { return paths; }
            set { paths = value; }
        }

        public bool isFileOpen(string filePath)
        {
            bool fileOpened = false;
            try
            {
                System.IO.FileStream fs = System.IO.File.OpenWrite(filePath);
                fs.Close();
            }
            catch (System.IO.IOException ex)
            {
                fileOpened = true;
            }
            return fileOpened;
        }

        private void gerencia()
        {
            
            string idNFe = string.Empty;
            string vias = string.Empty;
            string impressora = string.Empty;
            string tpForm = string.Empty;
       
            while (t.IsAlive && flagAlive)
            {
                try
                {
                    if (paths != null && paths.Length > 0)
                    {
                        System.Timers.Timer time = new System.Timers.Timer();
                        time.Interval = 1000;
                        foreach (string s in paths)
                        {
                            while (isFileOpen(s))
                            {
                                time.Start();
                                time.Stop();
                            }
                            XmlDataDocument xmlDoc = new XmlDataDocument();
                            try
                            {
                                xmlDoc.Load(s);
                                idNFe = xmlDoc.DocumentElement.GetElementsByTagName("idNFe")[0].InnerText;
                                vias = xmlDoc.DocumentElement.GetElementsByTagName("numVias")[0].InnerText;
                                impressora = xmlDoc.DocumentElement.GetElementsByTagName("impressora")[0].InnerText;
                                tpForm = xmlDoc.DocumentElement.GetElementsByTagName("tpForm")[0].InnerText;                                
                            }
                            catch(Exception ex)
                            {
                                exclusao.BufferPathExclusao.add(s);
                                throw ex;
                            }

                            entidades.Nfe n = new entidades.Nfe();
                            n.Id_nfe = idNFe;
                            n = DaoNfe.buscaPorId(n);

                            //verifica se nota existe na tabela nfe e se foi enviada para sefaz
                            if (!string.IsNullOrEmpty(n.Num_recibo))
                            {
                                n.Num_vias = vias;
                                n.Impressora = impressora;
                                n.Tp_form = tpForm;
                                //DaoNfe.incluirOuAlterar(n);
                                DaoNfe.copiaDanfe(n);
                                exclusao.BufferPathExclusao.add(s);
                                DaoDanfe.copiaDanfe(idNFe);
                            }
                            else
                            {
                                forms.FServidor.servidor.adicionaMensagemLog(string.Format("Não foi possível enviar cópia de danfe {0}, NF-e inexistente", s));
                                exclusao.BufferPathExclusao.add(s);
                            }
                        }
                        paths = null;
                    }
                    t.Join(1000);
                }
                catch (Exception ex)
                {
                    paths = null;
                    new GerenciaExcessoes(ex);
                }
            }           
        }

        public void inicializa()
        {
            t = new Thread(new ThreadStart(gerencia));
            t.IsBackground = true;
            t.Start();
        }
    }
}
