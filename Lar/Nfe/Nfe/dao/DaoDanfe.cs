using System;
using System.Collections.Generic;
using System.Text;
using Npgsql;

namespace Nfe.dao
{
    public static class DaoDanfe
    {
        private static string connectionString = StringConexao.retornaString();

        public static void copiaDanfe(string id)
        {
            string sql = "INSERT INTO NFE_TEMP(ID_NFE) VALUES(:ID)";
            string sql1 = "SELECT COUNT(*) FROM NFE_TEMP WHERE ID_NFE = :ID";
            NpgsqlConnection conn = new NpgsqlConnection(connectionString);

            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlCommand cmd1 = new NpgsqlCommand(sql1, conn);
            cmd.Parameters.Add(new NpgsqlParameter(":ID", NpgsqlTypes.NpgsqlDbType.Varchar, 44));
            cmd1.Parameters.Add(new NpgsqlParameter(":ID", NpgsqlTypes.NpgsqlDbType.Varchar, 44));
            cmd.Parameters[":ID"].Value = id;
            cmd1.Parameters[":ID"].Value = id;

            try
            {
                conn.Open();
                if(Convert.ToInt32(cmd1.ExecuteScalar()) == 0)
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
    }
}
