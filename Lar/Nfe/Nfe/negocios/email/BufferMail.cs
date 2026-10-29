using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using System.Xml;

namespace Nfe.negocios.email
{
    public static class BufferMail
    {
        private static List<XmlDataDocument> buffer = new List<XmlDataDocument>();

        public static List<XmlDataDocument> Buffer
        {
            get { return BufferMail.buffer; }            
        }

        public static void adiciona(XmlDataDocument xml)
        {
            buffer.Add(xml);
        }
    }
}
