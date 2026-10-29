using System;
using System.Collections.Generic;
using System.Text;
using Nfe.entidades;
using Npgsql;

namespace Nfe.dao
{
    public static class DaoStatus
    {
        private static string connectionString = StringConexao.retornaString();
        
        public static void incluirOuAlterar(Status s)
        {
            NpgsqlConnection conn = new NpgsqlConnection(connectionString);
            string sql1 = "SELECT COUNT(*) FROM STATUS WHERE UF = :UF AND AMBIENTE = :AMBIENTE";
            string sql2 = "INSERT INTO STATUS(UF,AMBIENTE,CODIGO,MENSAGEM,HORA) VALUES(:UF,:AMBIENTE,:CODIGO,:MENSAGEM,:HORA)";
            string sql3 = "UPDATE STATUS SET CODIGO = :CODIGO, MENSAGEM = :MENSAGEM, HORA = :HORA WHERE UF = :UF AND AMBIENTE = :AMBIENTE";

            NpgsqlCommand cmd1 = new NpgsqlCommand(sql1, conn);
            cmd1.Parameters.Add(new NpgsqlParameter(":UF", NpgsqlTypes.NpgsqlDbType.Numeric, 2));
            cmd1.Parameters[":UF"].Value = s.Uf;
            cmd1.Parameters.Add(new NpgsqlParameter(":AMBIENTE", NpgsqlTypes.NpgsqlDbType.Numeric, 1));
            cmd1.Parameters[":AMBIENTE"].Value = s.Ambiente;
            NpgsqlCommand cmd2 = new NpgsqlCommand(sql2, conn);
            cmd2.Parameters.Add(new NpgsqlParameter(":UF", NpgsqlTypes.NpgsqlDbType.Numeric, 2));
            cmd2.Parameters[":UF"].Value = s.Uf;
            cmd2.Parameters.Add(new NpgsqlParameter(":AMBIENTE", NpgsqlTypes.NpgsqlDbType.Numeric, 1));
            cmd2.Parameters[":AMBIENTE"].Value = s.Ambiente;
            cmd2.Parameters.Add(new NpgsqlParameter(":CODIGO", NpgsqlTypes.NpgsqlDbType.Numeric, 3));
            cmd2.Parameters[":CODIGO"].Value = s.Codigo;
            cmd2.Parameters.Add(new NpgsqlParameter(":MENSAGEM", NpgsqlTypes.NpgsqlDbType.Xml, s.Mensagem.Length));
            cmd2.Parameters[":MENSAGEM"].Value = s.Mensagem;
            cmd2.Parameters.Add(new NpgsqlParameter(":HORA", NpgsqlTypes.NpgsqlDbType.Time, s.Hora.Length));
            cmd2.Parameters[":HORA"].Value = Convert.ToDateTime(s.Hora);
            NpgsqlCommand cmd3 = new NpgsqlCommand(sql3, conn);
            cmd3.Parameters.Add(new NpgsqlParameter(":UF", NpgsqlTypes.NpgsqlDbType.Numeric, 2));
            cmd3.Parameters[":UF"].Value = s.Uf;
            cmd3.Parameters.Add(new NpgsqlParameter(":AMBIENTE", NpgsqlTypes.NpgsqlDbType.Numeric, 1));
            cmd3.Parameters[":AMBIENTE"].Value = s.Ambiente;
            cmd3.Parameters.Add(new NpgsqlParameter(":CODIGO", NpgsqlTypes.NpgsqlDbType.Numeric, 3));
            cmd3.Parameters[":CODIGO"].Value = s.Codigo;
            cmd3.Parameters.Add(new NpgsqlParameter(":MENSAGEM", NpgsqlTypes.NpgsqlDbType.Xml, s.Mensagem.Length));
            cmd3.Parameters[":MENSAGEM"].Value = s.Mensagem;
            cmd3.Parameters.Add(new NpgsqlParameter(":HORA", NpgsqlTypes.NpgsqlDbType.Time, s.Hora.Length));
            cmd3.Parameters[":HORA"].Value = Convert.ToDateTime(s.Hora);
            try
            {
                conn.Open();

                if (Convert.ToInt32(cmd1.ExecuteScalar()) > 0)
                    cmd3.ExecuteNonQuery();
                else
                    cmd2.ExecuteNonQuery();
                
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
