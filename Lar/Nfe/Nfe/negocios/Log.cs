using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Threading;

namespace Nfe.negocios
{
    public class Log
    {
        private static List<string> lista = new List<string>();
        private static bool flagAlive = true;       
        Thread t = null;

        public static bool FlagAlive
        {
            get { return Log.flagAlive; }
            set { Log.flagAlive = value; }
        }

        public static List<string> Lista
        {
            get { return lista; }
            set { lista = value; }
        }

        public void salvaLog()
        {
            while (flagAlive && t.IsAlive)
            {
                if (!new IsFileOpen().check(string.Format("{0}\\{1}.log", System.Environment.CurrentDirectory,
                        string.Format("{0}-{1}", System.DateTime.Now.Month, System.DateTime.Now.Year))))
                {
                    if (lista.Count > 0)
                    {
                        StreamWriter stw = new StreamWriter(string.Format("{0}\\{1}.log", System.Environment.CurrentDirectory,
                            string.Format("{0}-{1}", System.DateTime.Now.Month, System.DateTime.Now.Year)),
                            true, Encoding.ASCII, 1000);
                        stw.Write(new StringBuilder(lista[0]));
                        lista.RemoveAt(0);
                        stw.Close();
                        stw.Dispose();
                        t.Join(500);
                    }
                }
                t.Join(5000);
            }
            t.Abort();
        }
        public void inicializa()
        {
            t = new Thread(new ThreadStart(salvaLog));
            t.Start();
        }
    }
}
