using System;
using System.Collections.Generic;
using System.Text;
using Npgsql;

namespace Nfe.dao
{
    public static class DaoInutilizacao
    {
        private static string connectionString = StringConexao.retornaString();

        public static void incluirOuAlterar(entidades.Inutilizacao i)
        {
            NpgsqlConnection conn = new NpgsqlConnection(connectionString);
            string sql = "INSERT INTO INUTILIZACAO(CNPJ, AMBIENTE, PROTOCOLO, NUM_INI, NUM_FIM, UF, SERIE, ANO, MOTIVO, COD_EMPRESA) ";
            sql += "VALUES(:CNPJ, :AMBIENTE, :PROTOCOLO, :NUM_INI, :NUM_FIM, :UF, :SERIE, :ANO, :MOTIVO, :EMPRESA)";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);

            
            cmd.Parameters.Add(new NpgsqlParameter(":CNPJ", NpgsqlTypes.NpgsqlDbType.Varchar, 14));
            cmd.Parameters[":CNPJ"].Value = i.Cnpj; 
      
            cmd.Parameters.Add(new NpgsqlParameter(":AMBIENTE", NpgsqlTypes.NpgsqlDbType.Integer, i.Ambiente.Length));
            cmd.Parameters[":AMBIENTE"].Value = Convert.ToInt32(i.Ambiente);        
        
            cmd.Parameters.Add(new NpgsqlParameter(":PROTOCOLO", NpgsqlTypes.NpgsqlDbType.Varchar, i.Protocolo.Length));
            cmd.Parameters[":PROTOCOLO"].Value = i.Protocolo;       
        
            cmd.Parameters.Add(new NpgsqlParameter(":NUM_INI", NpgsqlTypes.NpgsqlDbType.Varchar, i.NIni.Length));
            cmd.Parameters[":NUM_INI"].Value = i.NIni;       
        
            cmd.Parameters.Add(new NpgsqlParameter(":NUM_FIM", NpgsqlTypes.NpgsqlDbType.Varchar, i.NFim.Length));
            cmd.Parameters[":NUM_FIM"].Value = i.NFim;
        
            cmd.Parameters.Add(new NpgsqlParameter(":UF", NpgsqlTypes.NpgsqlDbType.Varchar, 2));
            cmd.Parameters[":UF"].Value = i.Uf;
        
            cmd.Parameters.Add(new NpgsqlParameter(":SERIE", NpgsqlTypes.NpgsqlDbType.Varchar, 3));
            cmd.Parameters[":SERIE"].Value = i.Serie;
        
            cmd.Parameters.Add(new NpgsqlParameter(":ANO", NpgsqlTypes.NpgsqlDbType.Varchar, 2));
            cmd.Parameters[":ANO"].Value = i.Ano;
        
            cmd.Parameters.Add(new NpgsqlParameter(":MOTIVO", NpgsqlTypes.NpgsqlDbType.Varchar, i.Motivo.Length));
            cmd.Parameters[":MOTIVO"].Value = i.Motivo;

            cmd.Parameters.Add(new NpgsqlParameter(":EMPRESA", NpgsqlTypes.NpgsqlDbType.Varchar, i.Empresa.Length));
            cmd.Parameters[":EMPRESA"].Value = i.Empresa;

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
    }
}
