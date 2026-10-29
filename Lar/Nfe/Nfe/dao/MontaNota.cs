using System;
using System.Collections.Generic;
using System.Text;
using Npgsql;

namespace Nfe.dao
{
    public class MontaNota
    {
        /// <summary>
        /// Monta uma lista de Nfe a partir de um DataReader
        /// </summary>
        /// <param name="dr">DataReader com os dados da busca no banco de dados</param>
        /// <returns>Lista de NFe</returns>
        public List<entidades.Nfe> montaListaNota(NpgsqlDataReader dr)
        {
            List<entidades.Nfe> listaNfe = new List<Nfe.entidades.Nfe>();
            if (dr.HasRows)
            {                
                while (dr.Read())
                {
                    entidades.Nfe nfe = new Nfe.entidades.Nfe();
                    if (dr[0] != null && !dr.IsDBNull(0))
                        nfe.Id_nfe = dr.GetString(0);
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
                    if (dr[19] != null && !dr.IsDBNull(19))
                        nfe.Cont = dr.GetInt32(19);
                    if (dr[20] != null && !dr.IsDBNull(20))
                        nfe.Tp_form = dr.GetString(20);
                    listaNfe.Add(nfe);
                }
            }
            return listaNfe;
        }
    }
}
