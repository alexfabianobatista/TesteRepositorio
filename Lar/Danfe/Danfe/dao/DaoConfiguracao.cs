using System;
using System.Collections.Generic;
using System.Text;
using Npgsql;

namespace Danfe.dao
{
    public static class DaoConfiguracao
    {
        private static string connectionString = StringConexao.retornaString();
        
        public static void alterar()
        {           
            NpgsqlConnection conn = new NpgsqlConnection(connectionString);
            string sql = "UPDATE CONFIG SET LOGO = :LOGO, SERVIDOR_IMPRESSAO = :IMPRESSAO";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.Add(new NpgsqlParameter(":LOGO", NpgsqlTypes.NpgsqlDbType.Varchar, 200));
            cmd.Parameters[":LOGO"].Value = FPrincipal.Logo;
            cmd.Parameters.Add(new NpgsqlParameter(":IMPRESSAO", NpgsqlTypes.NpgsqlDbType.Varchar, 200));
            cmd.Parameters[":IMPRESSAO"].Value = FPrincipal.ServidorImpressao;
            try
            {
                conn.Open();
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
        public static entidades.Configuracao consultar()
        {
            string sql = "SELECT * FROM CONFIG";
            string sql1 = "SELECT * FROM PASTAS WHERE SERVIDOR = :SERVIDOR";
            NpgsqlConnection conn = new NpgsqlConnection(connectionString);
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlCommand cmd1 = new NpgsqlCommand(sql1,conn);            
            entidades.Configuracao c = new Danfe.entidades.Configuracao();

            try
            {
                conn.Open();
                NpgsqlDataReader r = cmd.ExecuteReader();
                while (r.Read())
                {
                    if (!r.IsDBNull(0))
                        c.Servidor = r.GetString(0);
                    if (!r.IsDBNull(1))
                        c.MaxBuffer = Convert.ToInt32( r.GetValue(1).ToString());
                    if (!r.IsDBNull(2))
                        c.Cancelamento = r.GetString(2);
                    if (!r.IsDBNull(3))
                        c.Inutilizacao = r.GetString(3);
                    if (!r.IsDBNull(4))
                        c.Status = r.GetString(4);
                    if (!r.IsDBNull(5))
                        c.Certificado = r.GetString(5);                    
                    if(!r.IsDBNull(6))
                        c.Logo = r.GetString(6);
                    if (!r.IsDBNull(8))
                        c.ServidorImpressao = r.GetString(8);
                }            
            }
            catch(Exception ex)
            {
                throw ex;
            }

            cmd1.Parameters.Add(new NpgsqlParameter(":SERVIDOR", NpgsqlTypes.NpgsqlDbType.Varchar, 60));
            cmd1.Parameters[":SERVIDOR"].Value = c.Servidor;
            try
            {                
                NpgsqlDataReader r = cmd1.ExecuteReader();
                while (r.Read())
                {
                    c.setPastas(r.GetString(0).ToString());
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
            return c;
        }
    }
}
