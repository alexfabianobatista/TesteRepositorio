using System;
using System.Collections.Generic;
using System.Text;

namespace Nfe.negocios
{
    public static class BufferPathExclusao
    {
        private static List<string> paths = new List<string>();        

        static BufferPathExclusao()
        {
        }

        public static string[] getPath()
        {
            string[] aux = new string[paths.Count];
            paths.CopyTo(aux);            
            paths.Clear();
            return aux;            
        }

        public static void add(string path)
        {
            paths.Add(path);
        }
    }
}
