using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Npgsql;

namespace Nfe.dao
{
    public static class DaoContingencia
    {
        //private static string connectionString = StringConexao.retornaString();

        //public static void incluirOuAlterar(entidades.Contingencia c)
        //{
        //    NpgsqlConnection conn = new NpgsqlConnection(connectionString);
        //    string sql = "SELECT COUNT(*) FROM CONTINGENCIA WHERE SERVIDOR = :SERVIDOR AND ESTADO = :ESTADO";
        //    NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
        //    cmd.Parameters.Add(new NpgsqlParameter(":SERVIDOR", NpgsqlTypes.NpgsqlDbType.Varchar, 60));
        //    cmd.Parameters[":SERVIDOR"].Value = c.Servidor;
        //    cmd.Parameters.Add(new NpgsqlParameter(":ESTADO", NpgsqlTypes.NpgsqlDbType.Integer, 2));
        //    cmd.Parameters[":ESTADO"].Value = c.Estado;
        //    string sql1 = "INSERT INTO CONTINGENCIA(SERVIDOR, ESTADO, CONTINGENCIA) VALUES ";
        //    sql1 += "(:SERVIDOR, :ESTADO, :CONTINGENCIA)";
        //    NpgsqlCommand cmd1 = new NpgsqlCommand(sql1, conn);
        //    cmd1.Parameters.Add(new NpgsqlParameter(":SERVIDOR", NpgsqlTypes.NpgsqlDbType.Varchar, 60));
        //    cmd1.Parameters[":SERVIDOR"].Value = c.Servidor;
        //    cmd1.Parameters.Add(new NpgsqlParameter(":ESTADO", NpgsqlTypes.NpgsqlDbType.Integer, 2));
        //    cmd1.Parameters[":ESTADO"].Value = c.Estado;
        //    cmd1.Parameters.Add(new NpgsqlParameter(":CONTINGENCIA", NpgsqlTypes.NpgsqlDbType.Varchar, 6));
        //    cmd1.Parameters[":CONTINGENCIA"].Value = c.Conting;
        //    string sql2 = "UPDATE CONTINGENCIA SET CONTINGENCIA = :CONTINGENCIA WHERE SERVIDOR = :SERVIDOR ";
        //    sql2 += " AND ESTADO = :ESTADO";
        //    NpgsqlCommand cmd2 = new NpgsqlCommand(sql2, conn);
        //    cmd2.Parameters.Add(new NpgsqlParameter(":SERVIDOR", NpgsqlTypes.NpgsqlDbType.Varchar, 60));
        //    cmd2.Parameters[":SERVIDOR"].Value = c.Servidor;
        //    cmd2.Parameters.Add(new NpgsqlParameter(":ESTADO", NpgsqlTypes.NpgsqlDbType.Integer, 2));
        //    cmd2.Parameters[":ESTADO"].Value = c.Estado;
        //    cmd2.Parameters.Add(new NpgsqlParameter(":CONTINGENCIA", NpgsqlTypes.NpgsqlDbType.Varchar, 6));
        //    cmd2.Parameters[":CONTINGENCIA"].Value = c.Conting;
        //    try
        //    {
        //        conn.Open();
        //        if (Convert.ToInt32(cmd.ExecuteScalar()) > 0)
        //            cmd2.ExecuteNonQuery();
        //        else
        //            cmd1.ExecuteNonQuery();
        //    }
        //    catch(Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //}

        //public static void listar(ref DataSet ds, entidades.Contingencia c)
        //{
        //    string sql = "SELECT * FROM CONTINGENCIA WHERE SERVIDOR = '" + c.Servidor + "'";
        //    sql += " ORDER BY ESTADO";

        //    NpgsqlDataAdapter adpter = new NpgsqlDataAdapter(sql, connectionString);
        //    try
        //    {
        //        ds.Clear();
        //        adpter.Fill(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }            
        //}

        //public static string procurar(entidades.Contingencia c)
        //{
        //    NpgsqlConnection conn = new NpgsqlConnection(connectionString);
        //    string sql = "SELECT CONTINGENCIA FROM CONTINGENCIA WHERE SERVIDOR = :SERVIDOR AND ESTADO = :ESTADO";
        //    sql += " ORDER BY ESTADO";
        //    NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
        //    cmd.Parameters.Add(new NpgsqlParameter(":SERVIDOR", NpgsqlTypes.NpgsqlDbType.Varchar, 60));
        //    cmd.Parameters[":SERVIDOR"].Value = c.Servidor;
        //    cmd.Parameters.Add(new NpgsqlParameter(":ESTADO", NpgsqlTypes.NpgsqlDbType.Integer, 2));
        //    cmd.Parameters[":ESTADO"].Value = c.Estado;

        //    try
        //    {
        //        conn.Open();
        //        return cmd.ExecuteScalar().ToString();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //}

        //public static void excluir(entidades.Contingencia c)
        //{
        //    NpgsqlConnection conn = new NpgsqlConnection(connectionString);
        //    string sql = "DELETE FROM CONTINGENCIA WHERE SERVIDOR = :SERVIDOR AND ESTADO = :ESTADO";
        //    //sql += "CONTINGENCIA = :CONTINGENCIA";
        //    NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
        //    cmd.Parameters.Add(new NpgsqlParameter(":SERVIDOR", NpgsqlTypes.NpgsqlDbType.Varchar, 60));
        //    cmd.Parameters[":SERVIDOR"].Value = c.Servidor;
        //    cmd.Parameters.Add(new NpgsqlParameter(":ESTADO", NpgsqlTypes.NpgsqlDbType.Integer, 2));
        //    cmd.Parameters[":ESTADO"].Value = c.Estado;
        //    //cmd.Parameters.Add(new NpgsqlParameter(":CONTINGENCIA", NpgsqlTypes.NpgsqlDbType.Varchar, 6));
        //    //cmd.Parameters[":CONTINGENCIA"].Value = c.Conting;

        //    try
        //    {
        //        conn.Open();
        //        cmd.ExecuteNonQuery();
        //    }
        //    catch(Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //}
    }
}
