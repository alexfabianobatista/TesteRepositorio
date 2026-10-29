using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;

namespace Nfe.negocios.email.pdf
{
    public static class BufferPDF
    {
        private static List<XmlDataDocument> buffer = new List<XmlDataDocument>();

        public static List<XmlDataDocument> Buffer
        {
            get { return BufferPDF.buffer; }
        }

        public static void adiciona(XmlDataDocument xml)
        {
            buffer.Add(xml);
        }
    }
}
