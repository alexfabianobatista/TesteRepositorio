using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace Nfe.negocios
{
    public class IsFileOpen
    {
        public bool check(string path)
        {
            bool fileOpened = false;
            try
            {
                System.IO.FileStream fs = System.IO.File.OpenWrite(path);
                fs.Close();
            }
            catch (System.IO.IOException ex)
            {
                fileOpened = true;
            }
            return fileOpened;
        }
    }
}
