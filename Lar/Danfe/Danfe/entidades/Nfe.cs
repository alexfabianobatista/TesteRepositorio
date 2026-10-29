using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;

namespace Danfe.entidades
{
    public class Nfe
    {
        private string id_nfe;
        private string cod_empresa;
        private int cod_local;
        private int num_nfe;
        private string desc_serie;
        private string num_prot_autorizacao;
        private string num_prot_cancelamento;
        private string cod_retorno_processamento;
        private XmlDataDocument xml_nfe;
        private string msg_validacao;
        private string num_recibo;
        private string impressora;
        private string msg_validacao_lote_ws;
        private string xml_retorno;
        private int num_vias;
        private string obs_lar;
        private DateTime dt_autorizacao;
        private string situacao;
        private string tp_form;

        public string Tp_form
        {
            get { return tp_form; }
            set { tp_form = value; }
        }

        public string Situacao
        {
            get { return situacao; }
            set { situacao = value; }
        }

        public DateTime Dt_autorizacao
        {
            get { return dt_autorizacao; }
            set { dt_autorizacao = value; }
        }

        public string Obs_lar
        {
            get { return obs_lar; }
            set { obs_lar = value; }
        }

        public int Num_vias
        {
            get { return num_vias; }
            set { num_vias = value; }
        }

        public string Xml_retorno
        {
            get { return xml_retorno; }
            set { xml_retorno = value; }
        } 

        public string Msg_validacao_lote_ws
        {
            get { return msg_validacao_lote_ws; }
            set { msg_validacao_lote_ws = value; }
        }

        public string Impressora
        {
            get { return impressora; }
            set { impressora = value; }
        }

        public string Num_recibo
        {
            get { return num_recibo; }
            set { num_recibo = value; }
        }

        public Nfe()
        {
            xml_nfe = new XmlDataDocument();
            id_nfe = string.Empty;
            cod_empresa = string.Empty;
            cod_local = 0;
            num_nfe = 0;
            desc_serie = string.Empty;
            num_prot_autorizacao = string.Empty;
            num_prot_cancelamento = string.Empty;
            cod_retorno_processamento = string.Empty;
            msg_validacao = string.Empty;
            num_recibo = string.Empty;
            impressora = string.Empty;
            msg_validacao_lote_ws = string.Empty;
            xml_retorno = string.Empty;
            num_vias = 0;
        }

        public string Msg_validacao
        {
            get { return msg_validacao; }
            set { msg_validacao = value; }
        }

        public string Id_nfe
        {
            get { return id_nfe; }
            set { id_nfe = value; }
        }
        public string Cod_empresa
        {
            get { return cod_empresa; }
            set { cod_empresa = value; }
        }
        public int Cod_local
        {
            get { return cod_local; }
            set { cod_local = value; }
        }
        public int Num_nfe
        {
            get { return num_nfe; }
            set { num_nfe = value; }
        }
        public string Desc_serie
        {
            get { return desc_serie; }
            set { desc_serie = value; }
        }
        public string Num_prot_autorizacao
        {
            get { return num_prot_autorizacao; }
            set { num_prot_autorizacao = value; }
        }
        public string Num_prot_cancelamento
        {
            get { return num_prot_cancelamento; }
            set { num_prot_cancelamento = value; }
        }
        public string Cod_retorno_processamento
        {
            get { return cod_retorno_processamento; }
            set { cod_retorno_processamento = value; }
        }
        public XmlDataDocument Xml_nfe
        {
            get { return xml_nfe; }
            set { xml_nfe = value; }
        }
    }
}
