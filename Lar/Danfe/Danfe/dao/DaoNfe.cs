using System;
using System.Collections.Generic;
using System.Text;
using System.Data.Odbc;
using Npgsql;
using System.Xml;

namespace Danfe.dao
{
    public static class DaoNfe
    {
        private static string connectionString = StringConexao.retornaString();
        private static NpgsqlConnection conn = new NpgsqlConnection(connectionString);
               
        public static List<entidades.Nfe> danfe()
        {
            NpgsqlConnection conn = new NpgsqlConnection(connectionString);
            List<entidades.Nfe> notas = new List<Danfe.entidades.Nfe>();
            List<string> idNfe = new List<string>();
            
            string sql = "SELECT ID_NFE, IMPRESSORA, XML_NFE, NUM_NFE, NUM_VIAS, TP_FORM FROM NFE WHERE ID_NFE = :ID_NFE";
            string sql2 = "SELECT * FROM NFE_TEMP";

            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlCommand cmd2 = new NpgsqlCommand(sql2, conn);

            try
            {
                conn.Open();

                NpgsqlDataReader reader = cmd2.ExecuteReader();
                while (reader.Read())
                {
                    idNfe.Add(reader.GetString(0));
                }

                foreach(string id in idNfe)
                {
                    cmd.Parameters.Add(new NpgsqlParameter(":ID_NFE", NpgsqlTypes.NpgsqlDbType.Varchar, 44));
                    cmd.Parameters[":ID_NFE"].Value = id; 

                    NpgsqlDataReader r = cmd.ExecuteReader();
                    while(r.Read())
                    {
                        entidades.Nfe nota = new Danfe.entidades.Nfe();
                        nota.Id_nfe = r.GetString(0);
                        nota.Impressora = r.GetString(1);
                        nota.Xml_nfe.LoadXml(r.GetValue(2).ToString());
                        nota.Num_nfe = Convert.ToInt32(r.GetDecimal(3));
                        nota.Num_vias = Convert.ToInt32(r.GetDecimal(4));
                        nota.Tp_form = r.GetString(5);
                        notas.Add(nota);
                    }
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();                
            }
            return notas;
        }

        public static void excluiNotaTemp(entidades.Nfe nota)
        {
            string sql = "DELETE FROM NFE_TEMP WHERE ID_NFE = :ID_NFE";
            NpgsqlConnection conn = new NpgsqlConnection(connectionString);
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.Add(new NpgsqlParameter(":ID_NFE", NpgsqlTypes.NpgsqlDbType.Varchar, 44));
            cmd.Parameters[":ID_NFE"].Value = nota.Id_nfe;

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

        public static entidades.Nfe procurar(entidades.Nfe nota)
        {
            string sql = "SELECT * FROM NFE WHERE ID_NFE = :ID_NFE";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.Add(new NpgsqlParameter(":ID_NFE", NpgsqlTypes.NpgsqlDbType.Varchar, 44));
            cmd.Parameters[":ID_NFE"].Value = nota.Id_nfe;
            try
            {
                conn.Open();
                NpgsqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                if (!dr.IsDBNull(1))
                    nota.Cod_local = Convert.ToInt32(dr.GetDecimal(1));
                if (!dr.IsDBNull(2))
                    nota.Num_nfe = Convert.ToInt32(dr.GetDecimal(2));
                if (!dr.IsDBNull(3))
                    nota.Desc_serie = dr.GetString(3);
                if (!dr.IsDBNull(4))
                    nota.Num_prot_autorizacao = dr.GetString(4);
                if (!dr.IsDBNull(5))
                    nota.Num_prot_cancelamento = dr.GetString(5);
                if (!dr.IsDBNull(6))
                    nota.Cod_retorno_processamento = dr.GetString(6);
                if(!dr.IsDBNull(7))
                    nota.Msg_validacao = dr.GetString(7);
                if(!dr.IsDBNull(8))
                    nota.Xml_nfe.LoadXml(dr.GetString(8));
                if (!dr.IsDBNull(9))
                    nota.Num_recibo = dr.GetString(9);
                if (!dr.IsDBNull(10))
                    nota.Impressora = dr.GetString(10);
                if (!dr.IsDBNull(11))
                    nota.Msg_validacao_lote_ws = dr.GetString(11);
                if (!dr.IsDBNull(12))
                    nota.Xml_retorno = dr.GetString(12);
                if (!dr.IsDBNull(13))
                    nota.Cod_empresa = dr.GetString(13);
                if (!dr.IsDBNull(14))
                    nota.Obs_lar = dr.GetString(14);
                if (!dr.IsDBNull(15))
                    nota.Dt_autorizacao = dr.GetDateTime(15);
                if (!dr.IsDBNull(16))
                    nota.Situacao = dr.GetString(16);
                if (!dr.IsDBNull(18))
                    nota.Num_vias = Convert.ToInt32(dr.GetDecimal(18));
                return nota;
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
    }
}
