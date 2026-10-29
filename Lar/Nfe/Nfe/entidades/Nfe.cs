using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;

namespace Nfe.entidades
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
        private int cod_retorno_processamento;
        private XmlDataDocument xml_nfe;
        private string msg_validacao;
        private string num_recibo;
        private string impressora;
        private string msg_validacao_lote_ws;
        private string xml_retorno;
        private string obs_lar;
        private DateTime dt_autorizacao;
        private string num_prot_autorizacao_dpec;
        private string num_vias;
        private int cont;
        private string tp_form;
        private int cod_retorno_cancelamento;

        public int Cod_retorno_cancelamento
        {
            get { return cod_retorno_cancelamento; }
            set { cod_retorno_cancelamento = value; }
        }

        public string Tp_form
        {
            get { return tp_form; }
            set { tp_form = value; }
        }        

        public int Cont
        {
            get { return cont; }
            set { cont = value; }
        }

        public string Num_vias
        {
            get { return num_vias; }
            set { num_vias = value; }
        }

        public string Num_prot_autorizacao_dpec
        {
            get { return num_prot_autorizacao_dpec; }
            set { num_prot_autorizacao_dpec = value; }
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
        public int Cod_retorno_processamento
        {
            get { return cod_retorno_processamento; }
            set { cod_retorno_processamento = value; }
        }
        public XmlDataDocument Xml_nfe
        {
            get { return xml_nfe; }
            set { xml_nfe = value; }
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
            cod_retorno_processamento = 0;
            msg_validacao = string.Empty;
            num_recibo = string.Empty;
            impressora = string.Empty;
            msg_validacao_lote_ws = string.Empty;
            xml_retorno = string.Empty;
            obs_lar = string.Empty;
            dt_autorizacao = new DateTime();
            num_prot_autorizacao_dpec = string.Empty;
            num_vias = string.Empty;
            cont = 0;
            tp_form = string.Empty;
        }
    }
}
