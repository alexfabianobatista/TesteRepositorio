using System;
using System.Collections.Generic;
using System.Text;
using Npgsql;

namespace Nfe.dao
{
    public static class DaoConfiguracao
    {
        private static string connectionString = StringConexao.retornaString();
        
        public static void incluirOuAlterar(entidades.Configuracao config)
        {
            string sql = "INSERT INTO CONFIG(SERVIDOR, MAX_BUFFER, PASTA_CANCELAMENTO, PASTA_INUTILIZACAO,";
            sql += " PASTA_STATUS, CERTIFICADO, PASTA_CONSULTA_PROTOCOLO, PASTA_COPIA_DANFE, INTERVALO, EMAIL, SENHA_MAIL, ENDERECO_SMTP, PORTA_SMTP, PASTA_EMAIL)"; 
            sql += " VALUES(:SERVIDOR,:BUFFER,";
            sql += ":CANCELAMENTO, :INUTILIZACAO, :STATUS, :CERTIFICADO, :PROTOCOLO, :COPIA_DANFE, :INTERVALO, :EMAIL, :SENHA, :SMTP, :PORTA, :DIRETORIO_EMAIL)";
            string sql1 = "INSERT INTO PASTAS(ENDERECO, SERVIDOR) VALUES(:ENDERECO,:SERVIDOR)";
            string sql2 = "UPDATE CONFIG SET MAX_BUFFER = :BUFFER, PASTA_CANCELAMENTO = :CANCELAMENTO, PASTA_INUTILIZACAO = :INUTILIZACAO,";
            sql2 += " PASTA_STATUS = :STATUS, CERTIFICADO = :CERTIFICADO, PASTA_CONSULTA_PROTOCOLO = :PROTOCOLO, PASTA_COPIA_DANFE = :COPIA_DANFE,";
            sql2 += " INTERVALO = :INTERVALO, EMAIL = :EMAIL, SENHA_MAIL = :SENHA, ENDERECO_SMTP = :SMTP, PORTA_SMTP = :PORTA, PASTA_EMAIL = :DIRETORIO_EMAIL";
            sql2 += " WHERE SERVIDOR = :SERVIDOR";
            string sql3 = "DELETE FROM PASTAS WHERE SERVIDOR = :SERVIDOR";
            string sql4 = "SELECT COUNT(*) FROM PASTAS";

            NpgsqlConnection conn = new NpgsqlConnection(connectionString);
           
            NpgsqlCommand cmd = new NpgsqlCommand(sql,conn);            
            cmd.Parameters.Add(new NpgsqlParameter(":SERVIDOR", NpgsqlTypes.NpgsqlDbType.Varchar, 60));
            cmd.Parameters[":SERVIDOR"].Value = config.Servidor;
            cmd.Parameters.Add(new NpgsqlParameter(":BUFFER",NpgsqlTypes.NpgsqlDbType.Integer,6));
            cmd.Parameters[":BUFFER"].Value = config.MaxBuffer;
            cmd.Parameters.Add(new NpgsqlParameter(":CANCELAMENTO", NpgsqlTypes.NpgsqlDbType.Varchar, 200));
            cmd.Parameters[":CANCELAMENTO"].Value = config.Cancelamento;
            cmd.Parameters.Add(new NpgsqlParameter(":INUTILIZACAO", NpgsqlTypes.NpgsqlDbType.Varchar, 200));
            cmd.Parameters[":INUTILIZACAO"].Value = config.Inutilizacao;
            cmd.Parameters.Add(new NpgsqlParameter(":STATUS", NpgsqlTypes.NpgsqlDbType.Varchar, 200));
            cmd.Parameters[":STATUS"].Value = config.Status;
            cmd.Parameters.Add(new NpgsqlParameter(":CERTIFICADO", NpgsqlTypes.NpgsqlDbType.Varchar, 200));
            cmd.Parameters[":CERTIFICADO"].Value = config.Certificado;
            cmd.Parameters.Add(new NpgsqlParameter(":PROTOCOLO", NpgsqlTypes.NpgsqlDbType.Varchar, 200));
            cmd.Parameters[":PROTOCOLO"].Value = config.Protocolo;
            cmd.Parameters.Add(new NpgsqlParameter(":COPIA_DANFE", NpgsqlTypes.NpgsqlDbType.Varchar, 200));
            cmd.Parameters[":COPIA_DANFE"].Value = config.CopiaDanfe;
            cmd.Parameters.Add(new NpgsqlParameter(":INTERVALO", NpgsqlTypes.NpgsqlDbType.Integer, 6));
            cmd.Parameters[":INTERVALO"].Value = config.Intervalo;
            cmd.Parameters.Add(new NpgsqlParameter(":EMAIL", NpgsqlTypes.NpgsqlDbType.Varchar, 100));
            cmd.Parameters[":EMAIL"].Value = config.Email;
            cmd.Parameters.Add(new NpgsqlParameter(":SENHA", NpgsqlTypes.NpgsqlDbType.Varchar, config.SenhaEmail.Length));
            cmd.Parameters[":SENHA"].Value = config.SenhaEmail;
            cmd.Parameters.Add(new NpgsqlParameter(":SMTP", NpgsqlTypes.NpgsqlDbType.Varchar, 100));
            cmd.Parameters[":SMTP"].Value = config.EnderecoSmpt;
            cmd.Parameters.Add(new NpgsqlParameter(":PORTA", NpgsqlTypes.NpgsqlDbType.Integer, 6));
            cmd.Parameters[":PORTA"].Value = config.PortaSmtp;
            cmd.Parameters.Add(new NpgsqlParameter(":DIRETORIO_EMAIL", NpgsqlTypes.NpgsqlDbType.Varchar, 200));
            cmd.Parameters[":DIRETORIO_EMAIL"].Value = config.DiretorioEmail;

            //este comando faz parte do update
            NpgsqlCommand cmd2 = new NpgsqlCommand(sql2, conn);
            cmd2.Parameters.Add(new NpgsqlParameter(":SERVIDOR", NpgsqlTypes.NpgsqlDbType.Varchar, 60));
            cmd2.Parameters[":SERVIDOR"].Value = config.Servidor;
            cmd2.Parameters.Add(new NpgsqlParameter(":BUFFER", NpgsqlTypes.NpgsqlDbType.Integer, 6));
            cmd2.Parameters[":BUFFER"].Value = config.MaxBuffer;
            cmd2.Parameters.Add(new NpgsqlParameter(":CANCELAMENTO", NpgsqlTypes.NpgsqlDbType.Varchar, 200));
            cmd2.Parameters[":CANCELAMENTO"].Value = config.Cancelamento;
            cmd2.Parameters.Add(new NpgsqlParameter(":INUTILIZACAO", NpgsqlTypes.NpgsqlDbType.Varchar, 200));
            cmd2.Parameters[":INUTILIZACAO"].Value = config.Inutilizacao;
            cmd2.Parameters.Add(new NpgsqlParameter(":STATUS", NpgsqlTypes.NpgsqlDbType.Varchar, 200));
            cmd2.Parameters[":STATUS"].Value = config.Status;
            cmd2.Parameters.Add(new NpgsqlParameter(":CERTIFICADO", NpgsqlTypes.NpgsqlDbType.Varchar, 200));
            cmd2.Parameters[":CERTIFICADO"].Value = config.Certificado;
            cmd2.Parameters.Add(new NpgsqlParameter(":PROTOCOLO", NpgsqlTypes.NpgsqlDbType.Varchar, 200));
            cmd2.Parameters[":PROTOCOLO"].Value = config.Protocolo;
            cmd2.Parameters.Add(new NpgsqlParameter(":COPIA_DANFE", NpgsqlTypes.NpgsqlDbType.Varchar, 200));
            cmd2.Parameters[":COPIA_DANFE"].Value = config.CopiaDanfe;
            cmd2.Parameters.Add(new NpgsqlParameter(":INTERVALO", NpgsqlTypes.NpgsqlDbType.Integer, 6));
            cmd2.Parameters[":INTERVALO"].Value = config.Intervalo;
            cmd2.Parameters.Add(new NpgsqlParameter(":EMAIL", NpgsqlTypes.NpgsqlDbType.Varchar, 100));
            cmd2.Parameters[":EMAIL"].Value = config.Email;
            cmd2.Parameters.Add(new NpgsqlParameter(":SENHA", NpgsqlTypes.NpgsqlDbType.Varchar, config.SenhaEmail.Length));
            cmd2.Parameters[":SENHA"].Value = config.SenhaEmail;
            cmd2.Parameters.Add(new NpgsqlParameter(":SMTP", NpgsqlTypes.NpgsqlDbType.Varchar, 100));
            cmd2.Parameters[":SMTP"].Value = config.EnderecoSmpt;
            cmd2.Parameters.Add(new NpgsqlParameter(":PORTA", NpgsqlTypes.NpgsqlDbType.Integer, 6));
            cmd2.Parameters[":PORTA"].Value = config.PortaSmtp;
            cmd2.Parameters.Add(new NpgsqlParameter(":DIRETORIO_EMAIL", NpgsqlTypes.NpgsqlDbType.Varchar, 200));
            cmd2.Parameters[":DIRETORIO_EMAIL"].Value = config.DiretorioEmail;


            NpgsqlCommand cmd3 = new NpgsqlCommand(sql3, conn);
            cmd3.Parameters.Add(new NpgsqlParameter(":SERVIDOR", NpgsqlTypes.NpgsqlDbType.Varchar, 60));
            cmd3.Parameters[":SERVIDOR"].Value = config.Servidor;

            try
            {
                conn.Open();
                if (consultar().Servidor != null)
                {
                    cmd3.ExecuteNonQuery();
                    cmd2.ExecuteNonQuery();
                }
                else
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


            NpgsqlCommand cmd4 = new NpgsqlCommand(sql4, conn);

            bool hasFolders = false;
            
            try
            {
                conn.Open();
                if (Convert.ToInt32(cmd4.ExecuteScalar()) > 0)
                    hasFolders = true;
            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }

            if (!hasFolders)
            {
                foreach (string s in config.Pastas)
                {
                    NpgsqlCommand cmd1 = new NpgsqlCommand(sql1, conn);
                    cmd1.Parameters.Add(new NpgsqlParameter(":ENDERECO", NpgsqlTypes.NpgsqlDbType.Varchar, 60));
                    cmd1.Parameters[":ENDERECO"].Value = s;
                    cmd1.Parameters.Add(new NpgsqlParameter(":SERVIDOR", NpgsqlTypes.NpgsqlDbType.Varchar, 60));
                    cmd1.Parameters[":SERVIDOR"].Value = config.Servidor;

                    try
                    {
                        conn.Open();
                        cmd1.ExecuteNonQuery();
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
            }
        }
        public static entidades.Configuracao consultar()
        {
            string sql = "SELECT * FROM CONFIG";
            string sql1 = "SELECT * FROM PASTAS WHERE SERVIDOR = :SERVIDOR";
            NpgsqlConnection conn = new NpgsqlConnection(connectionString);
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            NpgsqlCommand cmd1 = new NpgsqlCommand(sql1,conn);            
            entidades.Configuracao c = new Nfe.entidades.Configuracao();

            try
            {
                conn.Open();
                NpgsqlDataReader r = cmd.ExecuteReader();
                while (r.Read())
                {
                    if (r[0] != null && !r.IsDBNull(0))
                        c.Servidor = r.GetString(0);
                    if (r[1] != null && !r.IsDBNull(1))
                        c.MaxBuffer = Convert.ToInt32(r.GetValue(1).ToString());
                    if (r[2] != null && !r.IsDBNull(2))
                        c.Cancelamento = r.GetString(2);
                    if (r[3] != null && !r.IsDBNull(3))
                        c.Inutilizacao = r.GetString(3);
                    if (r[4] != null && !r.IsDBNull(4))
                        c.Status = r.GetString(4);
                    if (r[5] != null && !r.IsDBNull(5))
                        c.Certificado = r.GetString(5);
                    if (r[6] != null && !r.IsDBNull(6))
                        c.Logo = r.GetString(6);
                    if (r[7] != null && !r.IsDBNull(7))
                        c.Protocolo = r.GetString(7);
                    if (r[9] != null && !r.IsDBNull(9))
                        c.CopiaDanfe = r.GetString(9);
                    if (r[10] != null && !r.IsDBNull(10))
                        c.Intervalo = r.GetValue(10).ToString();
                    if (r[11] != null && !r.IsDBNull(11))
                        c.MaxConsulta = r.GetInt32(11);
                    if (r[12] != null && !r.IsDBNull(12))
                        c.Email = r.GetString(12);
                    if (r[13] != null && !r.IsDBNull(13))
                        c.SenhaEmail = r.GetString(13);
                    if (r[16] != null && !r.IsDBNull(16))
                        c.EnderecoSmpt = r.GetString(16);
                    if (r[14] != null && !r.IsDBNull(14))
                        c.PortaSmtp = r.GetInt32(14);
                    if (r[15] != null && !r.IsDBNull(15))
                        c.DiretorioEmail = r.GetString(15);                    
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

        public static void contingencia(entidades.Configuracao c)
        {
            string sql = "UPDATE CONFIG SET CONTINGENCIA = :CONTINGENCIA";
            NpgsqlConnection conn = new NpgsqlConnection(connectionString);
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.Add(new NpgsqlParameter(":CONTINGENCIA", NpgsqlTypes.NpgsqlDbType.Varchar, 6));
            //cmd.Parameters[":CONTINGENCIA"].Value = c.Contingencia;
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

        public static void removePastas(List<string> pastas, string servidor)
        {
            NpgsqlConnection conn = new NpgsqlConnection(connectionString);
            string enderecos = string.Empty;
            string sql1 = "DELETE FROM PASTAS WHERE SERVIDOR = :SERVIDOR AND ";            
            sql1 += "ENDERECO NOT IN(:ENDERECOS)";           
            NpgsqlCommand cmd1 = new NpgsqlCommand(sql1,conn);

            for(int i=0; i < pastas.Count; i++)
            {
                if(i != pastas.Count - 1)
                    enderecos += pastas[i] + ", ";
                else
                    enderecos += pastas[i];
            }           
            
            cmd1.Parameters.Add(new NpgsqlParameter(":SERVIDOR", NpgsqlTypes.NpgsqlDbType.Varchar, servidor.Length));
            cmd1.Parameters[":SERVIDOR"].Value = servidor;
            cmd1.Parameters.Add(new NpgsqlParameter(":ENDERECOS", NpgsqlTypes.NpgsqlDbType.Varchar, enderecos.Length));
            cmd1.Parameters[":ENDERECOS"].Value = enderecos;

            try
            {
                conn.Open();
                cmd1.ExecuteNonQuery();
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
