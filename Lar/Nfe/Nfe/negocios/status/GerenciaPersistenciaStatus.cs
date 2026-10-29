using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;

namespace Nfe.negocios.status
{
    public class GerenciaPersistenciaStatus
    {
        private XmlDataDocument xml = new XmlDataDocument();

        public GerenciaPersistenciaStatus(string msg)
        {            
            xml.LoadXml(msg);
        }

        public void persiste()
        {
            entidades.Status s = new Nfe.entidades.Status();
            XmlNodeList nodeUf = xml.GetElementsByTagName("cUF");
            s.Uf = Convert.ToInt32(nodeUf[0].InnerXml);
            XmlNodeList nodeAmb = xml.GetElementsByTagName("tpAmb");
            s.Ambiente = Convert.ToInt32(nodeAmb[0].InnerXml);
            XmlNodeList nodeCod = xml.GetElementsByTagName("cStat");
            s.Codigo = Convert.ToInt32(nodeCod[0].InnerXml);
            s.Mensagem = xml.InnerXml;
            s.Hora = System.DateTime.Now.ToString();
            try
            {
                dao.DaoStatus.incluirOuAlterar(s);
            }
            catch (Exception ex)
            {
                new GerenciaExcessoes(ex);
            }
        }
    }
}
