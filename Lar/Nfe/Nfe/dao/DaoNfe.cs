using System;
using System.Collections.Generic;
using System.Text;
using System.Data.Odbc;
using Npgsql;
using System.Xml;
using System.Collections;
using Microsoft.VisualBasic;
using System.Data;
using System.Data.SqlClient;

namespace Nfe.dao
{
    public static class DaoNfe
    {
        private static string connectionString = StringConexao.retornaString();        
        private static int cont = 0;

        /// <summary>
        /// variavel que guarda a quantidade de tentativas que devem ser feitas para
        /// enviar e consultar notas na SEFAZ -(setada na inicializacao do sistema)
        /// </summary>
        public static int Cont
        {
            get { return DaoNfe.cont; }
            set { DaoNfe.cont = value; }
        }
        //private static NpgsqlConnection conn = new NpgsqlConnection(connectionString);
       
        public static void incluirOuAlterar(entidades.Nfe nfe)
        {   
            NpgsqlConnection conn = new NpgsqlConnection(connectionString);
            string sql = "INSERT INTO NFE(ID_NFE, COD_EMPRESA, COD_LOCAL, NUM_NFE, DESC_SERIE,";
            sql += " NUM_PROT_AUTORIZACAO, NUM_PROT_CANCELAMENTO, COD_RETORNO_PROCESSAMENTO, XML_NFE, MSG_VALIDACAO, NUM_RECIBO, IMPRESSORA, MSG_VALIDACAO_LOTE_WS, XML_RETORNO,";
            sql += " OBS_LAR, DT_AUTORIZACAO, NUM_PROT_AUTORIZACAO_DPEC, NUM_VIAS, CONT, TP_FORM, COD_RETORNO_CANCELAMENTO)";
            sql += " VALUES(:ID_NFE,:COD_EMPRESA,:COD_LOCAL,:NUM_NFE,:DESC_SERIE,:NUM_PROT_AUTORIZACAO,:NUM_PROT_CANCELAMENTO,:COD_RETORNO_PROCESSAMENTO,:XML_NFE,:VALIDACAO,";
            sql += ":NUM_RECIBO, :IMPRESSORA, :MSG_VALIDACAO_LOTE_WS, :XML_RETORNO, :OBS_LAR, :DT_AUTORIZACAO, :NUM_PROT_AUTORIZACAO_DPEC, :NUM_VIAS, :CONT, :TP_FORM, :COD_RETORNO_CANCELAMENTO)";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);            
            cmd.Parameters.Add(new NpgsqlParameter(":ID_NFE", NpgsqlTypes.NpgsqlDbType.Varchar, 44));
            cmd.Parameters.Add(new NpgsqlParameter(":COD_EMPRESA", NpgsqlTypes.NpgsqlDbType.Varchar, nfe.Cod_empresa.Length));
            cmd.Parameters.Add(new NpgsqlParameter(":COD_LOCAL", NpgsqlTypes.NpgsqlDbType.Integer, 6));
            cmd.Parameters.Add(new NpgsqlParameter(":NUM_NFE", NpgsqlTypes.NpgsqlDbType.Integer, 6));
            cmd.Parameters.Add(new NpgsqlParameter(":DESC_SERIE", NpgsqlTypes.NpgsqlDbType.Varchar, 9));
            cmd.Parameters.Add(new NpgsqlParameter(":NUM_PROT_AUTORIZACAO", NpgsqlTypes.NpgsqlDbType.Varchar, 15));
            cmd.Parameters.Add(new NpgsqlParameter(":NUM_PROT_CANCELAMENTO", NpgsqlTypes.NpgsqlDbType.Varchar, 15));
            cmd.Parameters.Add(new NpgsqlParameter(":COD_RETORNO_PROCESSAMENTO", NpgsqlTypes.NpgsqlDbType.Varchar, 4));
            cmd.Parameters.Add(new NpgsqlParameter(":XML_NFE", NpgsqlTypes.NpgsqlDbType.Text, nfe.Xml_nfe.OuterXml.Length));
            cmd.Parameters.Add(new NpgsqlParameter(":VALIDACAO", NpgsqlTypes.NpgsqlDbType.Text, nfe.Msg_validacao.Length));
            cmd.Parameters.Add(new NpgsqlParameter(":NUM_RECIBO", NpgsqlTypes.NpgsqlDbType.Text, nfe.Num_recibo.Length));
            cmd.Parameters.Add(new NpgsqlParameter(":IMPRESSORA", NpgsqlTypes.NpgsqlDbType.Text, nfe.Impressora.Length));
            cmd.Parameters.Add(new NpgsqlParameter(":MSG_VALIDACAO_LOTE_WS", NpgsqlTypes.NpgsqlDbType.Text, nfe.Msg_validacao_lote_ws.Length));
            cmd.Parameters.Add(new NpgsqlParameter(":XML_RETORNO", NpgsqlTypes.NpgsqlDbType.Text, nfe.Xml_retorno.Length));
            cmd.Parameters.Add(new NpgsqlParameter(":OBS_LAR", NpgsqlTypes.NpgsqlDbType.Text, nfe.Obs_lar.Length));
            cmd.Parameters.Add(new NpgsqlParameter(":DT_AUTORIZACAO", NpgsqlTypes.NpgsqlDbType.Timestamp, nfe.Dt_autorizacao.ToString().Length));
            cmd.Parameters.Add(new NpgsqlParameter(":NUM_PROT_AUTORIZACAO_DPEC", NpgsqlTypes.NpgsqlDbType.Text, 3));
            cmd.Parameters.Add(new NpgsqlParameter(":NUM_VIAS", NpgsqlTypes.NpgsqlDbType.Integer, 3));
            cmd.Parameters.Add(new NpgsqlParameter(":CONT", NpgsqlTypes.NpgsqlDbType.Integer, 2));
            cmd.Parameters.Add(new NpgsqlParameter(":TP_FORM", NpgsqlTypes.NpgsqlDbType.Varchar, 2));
            cmd.Parameters.Add(new NpgsqlParameter(":COD_RETORNO_CANCELAMENTO", NpgsqlTypes.NpgsqlDbType.Integer, 6));
            //PROCESSO DE INSERCAO, SO INSERE CAMPOS QUE TIVEREM VALOR
            if(nfe.Id_nfe != string.Empty)
                cmd.Parameters[":ID_NFE"].Value = nfe.Id_nfe;
            if(nfe.Cod_empresa != string.Empty)
                cmd.Parameters[":COD_EMPRESA"].Value = nfe.Cod_empresa;
            if(nfe.Cod_local > 0)
                cmd.Parameters[":COD_LOCAL"].Value = nfe.Cod_local;
            if (nfe.Num_nfe > 0)
                cmd.Parameters[":NUM_NFE"].Value = nfe.Num_nfe;
            if(nfe.Desc_serie != string.Empty)
                cmd.Parameters[":DESC_SERIE"].Value = nfe.Desc_serie;
            if(nfe.Num_prot_autorizacao != string.Empty)
                cmd.Parameters[":NUM_PROT_AUTORIZACAO"].Value = nfe.Num_prot_autorizacao;
            if(nfe.Num_prot_cancelamento != string.Empty)
                cmd.Parameters[":NUM_PROT_CANCELAMENTO"].Value = nfe.Num_prot_cancelamento;
            if(nfe.Cod_retorno_processamento > 0)
                cmd.Parameters[":COD_RETORNO_PROCESSAMENTO"].Value = nfe.Cod_retorno_processamento;
            if(nfe.Xml_nfe.OuterXml != string.Empty)
                cmd.Parameters[":XML_NFE"].Value = nfe.Xml_nfe.OuterXml;
            if (nfe.Msg_validacao != string.Empty)
                cmd.Parameters[":VALIDACAO"].Value = nfe.Msg_validacao;
            if(nfe.Num_recibo != string.Empty)
                cmd.Parameters[":NUM_RECIBO"].Value = nfe.Num_recibo;
            if (nfe.Impressora!= string.Empty)
                cmd.Parameters[":IMPRESSORA"].Value = nfe.Impressora;
            if (nfe.Msg_validacao_lote_ws != string.Empty)
                cmd.Parameters[":MSG_VALIDACAO_LOTE_WS"].Value = nfe.Msg_validacao_lote_ws;
            if (nfe.Xml_retorno != string.Empty)
                cmd.Parameters[":XML_RETORNO"].Value = nfe.Xml_retorno;
            if (nfe.Obs_lar != string.Empty)
                cmd.Parameters[":OBS_LAR"].Value = nfe.Obs_lar;
            if (nfe.Dt_autorizacao.ToString() != "01/01/0001 00:00:00")
                cmd.Parameters[":DT_AUTORIZACAO"].Value = nfe.Dt_autorizacao;
            if (nfe.Num_prot_autorizacao_dpec != string.Empty)
                cmd.Parameters[":NUM_PROT_AUTORIZACAO_DPEC"].Value = nfe.Num_prot_autorizacao_dpec;
            if (nfe.Num_vias != string.Empty)
                cmd.Parameters[":NUM_VIAS"].Value = Convert.ToInt32(nfe.Num_vias);
            if (nfe.Cont > 0)
                cmd.Parameters[":CONT"].Value = nfe.Cont;
            if (nfe.Tp_form != string.Empty)
                cmd.Parameters[":TP_FORM"].Value = nfe.Tp_form;
            if (nfe.Cod_retorno_cancelamento > 0)
                cmd.Parameters[":COD_RETORNO_CANCELAMENTO"].Value = nfe.Cod_retorno_cancelamento;
            
            string sql1 = "SELECT COUNT(*) FROM NFE WHERE ID_NFE = :ID_NFE";
            NpgsqlCommand cmd1 = new NpgsqlCommand(sql1, conn);
            cmd1.Parameters.Add(new NpgsqlParameter(":ID_NFE", NpgsqlTypes.NpgsqlDbType.Varchar, 44));
            cmd1.Parameters[":ID_NFE"].Value = nfe.Id_nfe;

            //PROCESSO DE UPDATE - SO ATUALIZA OS CAMPOS QUE TIVEREM VALOR

            string sql2 = "UPDATE NFE SET ";
            if (nfe.Cod_empresa != string.Empty)
                sql2 += "COD_EMPRESA = :COD_EMPRESA, ";
            if (nfe.Cod_local > 0)
                sql2 += "COD_LOCAL = :COD_LOCAL, ";            
            if (nfe.Num_nfe > 0)
                sql2 += "NUM_NFE = :NUM_NFE, ";
            if (nfe.Desc_serie != string.Empty)
                sql2 += "DESC_SERIE = :DESC_SERIE, ";
            if (nfe.Num_prot_autorizacao != string.Empty)
                sql2 += "NUM_PROT_AUTORIZACAO = :NUM_PROT_AUTORIZACAO, ";
            if (nfe.Num_prot_cancelamento != string.Empty)
                sql2 += "NUM_PROT_CANCELAMENTO = :NUM_PROT_CANCELAMENTO, ";
            if (nfe.Cod_retorno_processamento > 0)
                sql2 += "COD_RETORNO_PROCESSAMENTO = :COD_RETORNO_PROCESSAMENTO, ";
            if (nfe.Xml_nfe.OuterXml != string.Empty)
                sql2 += "XML_NFE = :XML_NFE, ";
            if (nfe.Msg_validacao != string.Empty)
                sql2 += "MSG_VALIDACAO = :VALIDACAO, ";
            if (nfe.Num_recibo != string.Empty)
                sql2 += "NUM_RECIBO = :NUM_RECIBO, ";
            if (nfe.Impressora != string.Empty)
                sql2 += "IMPRESSORA = :IMPRESSORA, ";
            if (nfe.Msg_validacao_lote_ws != string.Empty)
                sql2 += "MSG_VALIDACAO_LOTE_WS = :MSG_VALIDACAO_LOTE_WS, ";
            if (nfe.Xml_retorno != string.Empty)
                sql2 += "XML_RETORNO = :XML_RETORNO, ";
            if (nfe.Obs_lar != string.Empty)
                sql2 += "OBS_LAR = :OBS_LAR, ";
            if (nfe.Dt_autorizacao.ToString() != "01/01/0001 00:00:00")
                sql2 += "DT_AUTORIZACAO = :DT_AUTORIZACAO, ";
            if (nfe.Num_prot_autorizacao_dpec != string.Empty)
                sql2 += "NUM_PROT_AUTORIZACAO_DPEC = :NUM_PROT_AUTORIZACAO_DPEC, ";
            if (nfe.Num_vias != string.Empty)
                sql2 += "NUM_VIAS = :NUM_VIAS, ";
            if (nfe.Cont > 0)
                sql2 += "CONT = :CONT, ";
            if (nfe.Tp_form != string.Empty)
                sql2 += "TP_FORM = :TP_FORM, ";
            if (nfe.Cod_retorno_cancelamento > 0)
                sql2 += "COD_RETORNO_CANCELAMENTO = :COD_RETORNO_CANCELAMENTO, ";
            sql2 += "WHERE (ID_NFE = :ID_NFE) AND (COD_RETORNO_PROCESSAMENTO NOT IN('100','301','302')";
            sql2 += "OR COD_RETORNO_PROCESSAMENTO IS NULL)";
            
            if (sql2.Substring(sql2.IndexOf("WHERE") - 2, 1) == ",")
            {
                sql2 = sql2.Remove(sql2.IndexOf("WHERE") - 2,1);
            }
            
            NpgsqlCommand cmd2 = new NpgsqlCommand(sql2, conn);

            if (nfe.Cod_empresa != string.Empty)
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":COD_EMPRESA", NpgsqlTypes.NpgsqlDbType.Varchar, 6));
                cmd2.Parameters[":COD_EMPRESA"].Value = nfe.Cod_empresa;
            }
            if (nfe.Cod_local > 0)
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":COD_LOCAL", NpgsqlTypes.NpgsqlDbType.Integer, 6));
                cmd2.Parameters[":COD_LOCAL"].Value = nfe.Cod_local;
            }
            if (nfe.Num_nfe > 0)
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":NUM_NFE", NpgsqlTypes.NpgsqlDbType.Integer, 6));
                cmd2.Parameters[":NUM_NFE"].Value = nfe.Num_nfe;
            }
            if (nfe.Desc_serie != string.Empty)
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":DESC_SERIE", NpgsqlTypes.NpgsqlDbType.Varchar, 9));
                cmd2.Parameters[":DESC_SERIE"].Value = nfe.Desc_serie;
            }
            if (nfe.Num_prot_autorizacao != string.Empty)
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":NUM_PROT_AUTORIZACAO", NpgsqlTypes.NpgsqlDbType.Varchar, 15));
                cmd2.Parameters[":NUM_PROT_AUTORIZACAO"].Value = nfe.Num_prot_autorizacao;
            }
            if (nfe.Num_prot_cancelamento != string.Empty)
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":NUM_PROT_CANCELAMENTO", NpgsqlTypes.NpgsqlDbType.Varchar, 15));
                cmd2.Parameters[":NUM_PROT_CANCELAMENTO"].Value = nfe.Num_prot_cancelamento;
            }
            if (nfe.Cod_retorno_processamento > 0)
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":COD_RETORNO_PROCESSAMENTO", NpgsqlTypes.NpgsqlDbType.Varchar, 4));
                cmd2.Parameters[":COD_RETORNO_PROCESSAMENTO"].Value = nfe.Cod_retorno_processamento;
            }
            if (nfe.Xml_nfe.OuterXml != string.Empty)
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":XML_NFE", NpgsqlTypes.NpgsqlDbType.Text, nfe.Xml_nfe.OuterXml.Length));
                cmd2.Parameters[":XML_NFE"].Value = nfe.Xml_nfe.OuterXml;
            }
            if (nfe.Msg_validacao != string.Empty)
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":VALIDACAO", NpgsqlTypes.NpgsqlDbType.Text, nfe.Msg_validacao.Length));
                cmd2.Parameters[":VALIDACAO"].Value = nfe.Msg_validacao;
            }
            if (nfe.Num_recibo != string.Empty)
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":NUM_RECIBO", NpgsqlTypes.NpgsqlDbType.Text, nfe.Num_recibo.Length));
                cmd2.Parameters[":NUM_RECIBO"].Value = nfe.Num_recibo;
            }
            if (nfe.Impressora != string.Empty)
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":IMPRESSORA", NpgsqlTypes.NpgsqlDbType.Text, nfe.Impressora.Length));
                cmd2.Parameters[":IMPRESSORA"].Value = nfe.Impressora;
            }
            if (nfe.Msg_validacao_lote_ws != string.Empty)
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":MSG_VALIDACAO_LOTE_WS", NpgsqlTypes.NpgsqlDbType.Text, nfe.Msg_validacao_lote_ws.Length));
                cmd2.Parameters[":MSG_VALIDACAO_LOTE_WS"].Value = nfe.Msg_validacao_lote_ws;
            }
            if (nfe.Xml_retorno != string.Empty)
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":XML_RETORNO", NpgsqlTypes.NpgsqlDbType.Text, nfe.Xml_retorno.Length));
                cmd2.Parameters[":XML_RETORNO"].Value = nfe.Xml_retorno;
            }
            if (nfe.Obs_lar != string.Empty)
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":OBS_LAR", NpgsqlTypes.NpgsqlDbType.Text, nfe.Obs_lar.Length));
                cmd2.Parameters[":OBS_LAR"].Value = nfe.Obs_lar;
            }
            if (nfe.Dt_autorizacao.ToString() != "01/01/0001 00:00:00")
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":DT_AUTORIZACAO", NpgsqlTypes.NpgsqlDbType.Timestamp, nfe.Dt_autorizacao.ToString().Length));
                cmd2.Parameters[":DT_AUTORIZACAO"].Value = nfe.Dt_autorizacao;
            }
            if (nfe.Num_prot_autorizacao_dpec != string.Empty)
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":NUM_PROT_AUTORIZACAO_DPEC", NpgsqlTypes.NpgsqlDbType.Text, 3));
                cmd2.Parameters[":NUM_PROT_AUTORIZACAO_DPEC"].Value = nfe.Num_prot_autorizacao_dpec;
            }
            if (nfe.Num_vias != string.Empty)
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":NUM_VIAS", NpgsqlTypes.NpgsqlDbType.Integer, 3));
                cmd2.Parameters[":NUM_VIAS"].Value = Convert.ToInt32(nfe.Num_vias);
            }
            if (nfe.Cont > 0)
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":CONT", NpgsqlTypes.NpgsqlDbType.Integer, 2));
                cmd2.Parameters[":CONT"].Value = nfe.Cont;
            }
            if (nfe.Tp_form != string.Empty)
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":TP_FORM", NpgsqlTypes.NpgsqlDbType.Varchar, 2));
                cmd2.Parameters[":TP_FORM"].Value = nfe.Tp_form;
            }
            if (nfe.Cod_retorno_cancelamento > 0)
            {
                cmd2.Parameters.Add(new NpgsqlParameter(":COD_RETORNO_CANCELAMENTO", NpgsqlTypes.NpgsqlDbType.Integer, 6));
                cmd2.Parameters[":COD_RETORNO_CANCELAMENTO"].Value = nfe.Cod_retorno_cancelamento;
            }

            cmd2.Parameters.Add(new NpgsqlParameter(":ID_NFE", NpgsqlTypes.NpgsqlDbType.Varchar, 44));
            cmd2.Parameters[":ID_NFE"].Value = nfe.Id_nfe;

            try
            {
                conn.Open();
                //cmd.ExecuteNonQuery();
                if (Convert.ToInt32(cmd1.ExecuteScalar()) > 0)
                    cmd2.ExecuteNonQuery();
                else
                    cmd.ExecuteNonQuery();
            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();                
            }            
        }

        public static void copiaDanfe(entidades.Nfe nfe)
        {
            NpgsqlConnection conn = new NpgsqlConnection(connectionString);
            string sql = "UPDATE NFE SET NUM_VIAS = :NUM_VIAS, IMPRESSORA = :IMPRESSORA, TP_FORM = :TP_FORM";
            sql += " WHERE ID_NFE = :ID_NFE";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.Add(new NpgsqlParameter(":NUM_VIAS", NpgsqlTypes.NpgsqlDbType.Numeric, nfe.Num_vias.Length));
            cmd.Parameters[":NUM_VIAS"].Value = nfe.Num_vias;
            cmd.Parameters.Add(new NpgsqlParameter(":IMPRESSORA", NpgsqlTypes.NpgsqlDbType.Text, nfe.Impressora.Length));
            cmd.Parameters[":IMPRESSORA"].Value = nfe.Impressora;
            cmd.Parameters.Add(new NpgsqlParameter(":ID_NFE", NpgsqlTypes.NpgsqlDbType.Varchar, 44));
            cmd.Parameters[":ID_NFE"].Value = nfe.Id_nfe;
            cmd.Parameters.Add(new NpgsqlParameter(":TP_FORM", NpgsqlTypes.NpgsqlDbType.Varchar, 2));
            cmd.Parameters[":TP_FORM"].Value = nfe.Tp_form;

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }

        public static int idLote()
        {
            NpgsqlConnection conn = new NpgsqlConnection(connectionString);
            string sql = "SELECT NEXTVAL('SQ_IDLOTE')";
            NpgsqlCommand cmd = new NpgsqlCommand(sql,conn);

            try
            {
                conn.Open();
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }

        public static List<entidades.Nfe> buscaLotesNaoValidados()
        {
            NpgsqlConnection conn = new NpgsqlConnection(connectionString);
            List<entidades.Nfe> notas = new List<Nfe.entidades.Nfe>();
            int cont = 0; // contador para incluir virgula nas notas(parametro para sql1)    
            int max_consulta = 0;//pega o máximo de vezes que a nota pode ser consultada
            Hashtable contNotas = new Hashtable();//guarda o id e o contador das notas
            string notasParam = string.Empty;

            string sql = "SELECT * FROM NFE_CONSULTA WHERE (COD_RETORNO_PROCESSAMENTO IS NULL OR COD_RETORNO_PROCESSAMENTO IN ('0','105','1000'))";
            sql += " AND CONT < :CONT";
            
            string sql2 = "SELECT MAX_CONSULTA_NFE FROM CONFIG"; //verificar no caso de existir mais de 1 servidor

            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
           
            NpgsqlCommand cmd2 = new NpgsqlCommand(sql2,conn);
            try
            {
                conn.Open();
                max_consulta = (int)cmd2.ExecuteScalar(); 
                //pega todas as notas da tabela nfe_consulta
                cmd.Parameters.Add(new NpgsqlParameter(":CONT", NpgsqlTypes.NpgsqlDbType.Integer, 2));
                cmd.Parameters[":CONT"].Value = max_consulta;
                NpgsqlDataReader readerParam = cmd.ExecuteReader();
                string s = string.Empty;                
                while (readerParam.Read())
                {
                    if (cont == 0)
                    {
                        if(!readerParam.IsDBNull(0))
                            s += "'" + readerParam.GetString(0) + "'";
                    }
                    else
                    {
                        if (!readerParam.IsDBNull(0))
                            s += ", '" + readerParam.GetString(0) + "'";
                    }
                    cont++;
                    contNotas.Add(readerParam.GetString(0).ToString(), readerParam.GetDateTime(2));                    
                }
                notasParam = s;
                string sql1 = "SELECT * FROM NFE WHERE ID_NFE IN(" + notasParam + ")";
                NpgsqlCommand cmd1 = new NpgsqlCommand(sql1, conn);                
                //pega todas as notas da tabela nfe que estavam na tabela nfe_consulta
                //e monta a lista
                if (s != string.Empty)
                {
                    //cmd1.Parameters.Add(new NpgsqlParameter(":NOTAS", NpgsqlTypes.NpgsqlDbType.Text, s.Length));
                    //cmd1.Parameters[":NOTAS"].Value = s;                    
                    NpgsqlDataReader readerNotas = cmd1.ExecuteReader();
                    while (readerNotas.Read())
                    {
                        DateTime agora = DateTime.Now;
                        DateTime consulta = new DateTime();
                        IDictionaryEnumerator myEnumerator = contNotas.GetEnumerator();
                        while(myEnumerator.MoveNext())
                        {
                            if (readerNotas.GetString(0).ToString() == myEnumerator.Key.ToString())
                            {
                                consulta = (DateTime) myEnumerator.Value;      
                                //DateAndTime.DateDiff é da biblioteca VisualBasic, quando puder, trocar por outra soluçao
                                if(DateAndTime.DateDiff("s",consulta,agora,FirstDayOfWeek.Sunday,FirstWeekOfYear.Jan1) >= (forms.FServidor.servidor.Intervalo / 1000))
                                {
                                    entidades.Nfe nota = new Nfe.entidades.Nfe();
                                    nota.Id_nfe = readerNotas.GetString(0).ToString();
                                    if(!readerNotas.IsDBNull(9))
                                    nota.Num_recibo = readerNotas.GetString(9).ToString();
                                if (!readerNotas.IsDBNull(8))
                                    nota.Xml_nfe.LoadXml(readerNotas.GetValue(8).ToString());
                                    notas.Add(nota);
                                }
                            }
                        }                     
                    }                    
                }            

                return notas;
            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                cont = 0;
                contNotas.Clear();
                conn.Close();
            }
        }

        public static void cancelar(entidades.Nfe nfe)
        {
            NpgsqlConnection conn = new NpgsqlConnection(connectionString);
            string sql = string.Empty;
           

            //cancelamento homologado
            if (nfe.Cod_retorno_cancelamento == 101)
            {
                sql = "UPDATE NFE SET COD_RETORNO_CANCELAMENTO = :RETORNO_PROC, NUM_PROT_CANCELAMENTO = :PROTOCOLO ";
                sql += "WHERE ID_NFE = :ID_NFE";                
            }
            else //cancelamento nao homologado
            {
                sql = "UPDATE NFE SET COD_RETORNO_CANCELAMENTO = :RETORNO_PROC ";
                sql += "WHERE ID_NFE = :ID_NFE";                
            }

            NpgsqlCommand cmd = new NpgsqlCommand(sql,conn);

            cmd.Parameters.Add(new NpgsqlParameter(":RETORNO_PROC", NpgsqlTypes.NpgsqlDbType.Integer, nfe.Cod_retorno_processamento.ToString().Length));
            cmd.Parameters[":RETORNO_PROC"].Value = nfe.Cod_retorno_cancelamento;
            cmd.Parameters.Add(new NpgsqlParameter(":PROTOCOLO", NpgsqlTypes.NpgsqlDbType.Varchar, nfe.Num_prot_cancelamento.Length));
            cmd.Parameters[":PROTOCOLO"].Value = nfe.Num_prot_cancelamento;
            cmd.Parameters.Add(new NpgsqlParameter(":ID_NFE", NpgsqlTypes.NpgsqlDbType.Varchar, 44));
            cmd.Parameters[":ID_NFE"].Value = nfe.Id_nfe;

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }

        public static void atualizaStatusNfeConsulta(entidades.Nfe nfe)
        {
            NpgsqlConnection conn = new NpgsqlConnection(connectionString);
            int cont = 0;
            string sql = "UPDATE NFE_CONSULTA SET COD_RETORNO_PROCESSAMENTO = :STATUS, CONT = :CONT, HORA = :HORA WHERE ID_NFE = :ID";                
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.Add(new NpgsqlParameter(":ID", NpgsqlTypes.NpgsqlDbType.Varchar, nfe.Id_nfe.Length));
            cmd.Parameters[":ID"].Value = nfe.Id_nfe;
            cmd.Parameters.Add(new NpgsqlParameter(":STATUS", NpgsqlTypes.NpgsqlDbType.Varchar, 4));
            if (nfe.Cod_retorno_processamento > 0)
            {
                cmd.Parameters[":STATUS"].Value = nfe.Cod_retorno_processamento;
            }
            cmd.Parameters.Add(new NpgsqlParameter(":HORA", NpgsqlTypes.NpgsqlDbType.Timestamp, 20));
            if (nfe.Dt_autorizacao.ToString() != string.Empty)
                cmd.Parameters[":HORA"].Value = nfe.Dt_autorizacao;
            string sql1 = "SELECT CONT FROM NFE_CONSULTA WHERE ID_NFE = :ID";
            NpgsqlCommand cmd1 = new NpgsqlCommand(sql1, conn);
            cmd1.Parameters.Add(new NpgsqlParameter(":ID", NpgsqlTypes.NpgsqlDbType.Varchar, nfe.Id_nfe.Length));
            cmd1.Parameters[":ID"].Value = nfe.Id_nfe;
            
            try
            {
                conn.Open();
                cont = (int)cmd1.ExecuteScalar();
                cmd.Parameters.Add(new NpgsqlParameter(":CONT", NpgsqlTypes.NpgsqlDbType.Integer, 2));
                cmd.Parameters[":CONT"].Value = ++cont;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }

        public static entidades.Nfe buscaPorId(entidades.Nfe nfe)
        {
            string sql = "SELECT * FROM NFE WHERE ID_NFE = :ID_NFE";

            NpgsqlConnection conn = new NpgsqlConnection(connectionString);           
            NpgsqlCommand cmd = new NpgsqlCommand(sql,conn);
            
            cmd.Parameters.Add(new NpgsqlParameter(":ID_NFE", NpgsqlTypes.NpgsqlDbType.Varchar, nfe.Id_nfe.Length));
            cmd.Parameters[":ID_NFE"].Value = nfe.Id_nfe;

            try
            {
                conn.Open();
                NpgsqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        if (dr[1] != null && !dr.IsDBNull(1))
                            nfe.Cod_local = Convert.ToInt32(dr.GetDecimal(1));
                        if (dr[2] != null && !dr.IsDBNull(2))
                            nfe.Num_nfe = Convert.ToInt32(dr.GetDecimal(2));
                        if (dr[3] != null && !dr.IsDBNull(3))
                            nfe.Desc_serie = dr.GetString(3);
                        if (dr[4] != null && !dr.IsDBNull(4))
                            nfe.Num_prot_autorizacao = dr.GetString(4);
                        if (dr[5] != null && !dr.IsDBNull(5))
                            nfe.Num_prot_cancelamento = dr.GetString(5);
                        if (dr[6] != null && !dr.IsDBNull(6))
                            nfe.Cod_retorno_processamento = Convert.ToInt32(dr.GetString(6));
                        if (dr[7] != null && !dr.IsDBNull(7))
                            nfe.Msg_validacao = dr.GetString(7);
                        if (dr[8] != null && !dr.IsDBNull(8))
                            nfe.Xml_nfe.LoadXml(dr.GetString(8));
                        if (dr[9] != null && !dr.IsDBNull(9))
                            nfe.Num_recibo = dr.GetString(9);
                        if (dr[10] != null && !dr.IsDBNull(10))
                            nfe.Impressora = dr.GetString(10);
                        if (dr[11] != null && !dr.IsDBNull(11))
                            nfe.Msg_validacao_lote_ws = dr.GetString(11);
                        if (dr[12] != null && !dr.IsDBNull(12))
                            nfe.Xml_retorno = dr.GetString(12);
                        if (dr[13] != null && !dr.IsDBNull(13))
                            nfe.Cod_empresa = dr.GetString(13);
                        if (dr[14] != null && !dr.IsDBNull(14))
                            nfe.Obs_lar = dr.GetString(14);
                        if (dr[15] != null && !dr.IsDBNull(15))
                            nfe.Dt_autorizacao = dr.GetDateTime(15);
                        if (dr[18] != null && !dr.IsDBNull(18))
                            nfe.Num_vias = Convert.ToString(dr.GetDecimal(18));
                        if (dr[20] != null && !dr.IsDBNull(20))
                            nfe.Tp_form = dr.GetString(20);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }

            return nfe;
        }

        public static List<entidades.Nfe> buscaNotasNaoEnviadas()
        {
            List<entidades.Nfe> listaNfe = null;
            string sql = "SELECT * FROM NFE WHERE NUM_RECIBO IS NULL AND MSG_VALIDACAO IS NULL";
            sql += " AND (COD_RETORNO_PROCESSAMENTO IS NULL OR COD_RETORNO_PROCESSAMENTO IN ('1003','1002'))";
            sql += " AND CONT BETWEEN 1 AND :CONT";
            string sql1 = "UPDATE NFE SET CONT = :NEW_CONT WHERE ID_NFE = :ID_NFE";

            NpgsqlConnection conn = new NpgsqlConnection(connectionString);
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.Add(new NpgsqlParameter(":CONT", NpgsqlTypes.NpgsqlDbType.Integer, 2));
            cmd.Parameters[":CONT"].Value = cont;
            
            try
            {                
                conn.Open();
                NpgsqlDataReader r = cmd.ExecuteReader();
                //conn.Close();
                //conn.Open();
                listaNfe = new MontaNota().montaListaNota(r);
                foreach(entidades.Nfe n in listaNfe)
                {
                    NpgsqlCommand cmd1 = new NpgsqlCommand(sql1, conn);
                    cmd1.Parameters.Add(new NpgsqlParameter(":NEW_CONT", NpgsqlTypes.NpgsqlDbType.Integer, 2));
                    cmd1.Parameters[":NEW_CONT"].Value = n.Cont + 1;
                    cmd1.Parameters.Add(new NpgsqlParameter(":ID_NFE", NpgsqlTypes.NpgsqlDbType.Varchar, 44));
                    cmd1.Parameters[":ID_NFE"].Value = n.Id_nfe;
                    cmd1.ExecuteNonQuery();
                }
                return listaNfe;
            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
                
        }

        public static DataSet reConsulta(DataSet ds)
        {
            try
            {
                NpgsqlDataAdapter da = new NpgsqlDataAdapter("SELECT * FROM NFE_CONSULTA WHERE COD_RETORNO_PROCESSAMENTO IN('1000','1001','1002','1003','1004')", connectionString);
                NpgsqlCommandBuilder cb = new NpgsqlCommandBuilder(da);
                da.Fill(ds);
                //da.Update(ds);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
        }

        public static void reConsultaUpdate(DataSet ds)
        {
            try
            {
                NpgsqlDataAdapter da = new NpgsqlDataAdapter("SELECT * FROM NFE_CONSULTA WHERE COD_RETORNO_PROCESSAMENTO IN('1000','1001','1002','1003','1004')", connectionString);
                NpgsqlCommandBuilder cb = new NpgsqlCommandBuilder(da);
                da.Update(ds);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
