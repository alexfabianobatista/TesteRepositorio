using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using Danfe.relatorios;
using iTextSharp;
using iTextSharp.text.pdf;
using System.IO;
using iTextSharp.text;

namespace Danfe
{
    public class ThreadDanfe
    {
        private Thread t;
        private static bool flagAtiva = true;

        public static bool FlagAtiva
        {
            get { return ThreadDanfe.flagAtiva; }
            set { ThreadDanfe.flagAtiva = value; }
        }

        public void imprimeDanfe()
        {            
            while (t.IsAlive && flagAtiva)
            {
                List<entidades.Nfe> notas = dao.DaoNfe.danfe();
                
                foreach (entidades.Nfe nota in notas)
                {
                    try
                    {
                        ControlaRelatorio c = new ControlaRelatorio();
                        if (c.populaDataSet(nota, nota.Tp_form))
                        {
                            switch(nota.Tp_form)
                            {
                                case "NF":
                                    crDanfeDefault crReport = new crDanfeDefault();
                                    crReport.SetDataSource(relatorios.ControlaRelatorio.getDataSource());
                                    crReport.PrintOptions.PrinterName = nota.Impressora;
                                    crReport.PrintToPrinter(Convert.ToInt32(nota.Num_vias), false, 1, 0);
                                    crReport.Close();
                                    crReport.Dispose();
                                    break;
                                case "M1":
                                    string mensagem = new CompartilhamentoImpressora().compartilha(nota.Impressora);
                                    if (mensagem == string.Empty)
                                    {
                                        if (new MapeamentoImpressora().configuraMapeamento(nota.Impressora))
                                        {
                                            DanfeFormulario danfeForm = new DanfeFormulario();
                                            danfeForm.imprime(relatorios.ControlaRelatorio.getDataSource());
                                        }
                                        else
                                            throw new Exception(string.Format("{0}{1}", "Não foi possível mapear impressora", nota.Impressora));
                                    }
                                    else
                                        throw new Exception(mensagem);
                                    mensagem = string.Empty;
                                    mensagem = new CompartilhamentoImpressora().descompartilha(nota.Impressora);
                                    if (mensagem != string.Empty)
                                        throw new Exception(mensagem);
                                    break;
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        FPrincipal.mostraNoDisplay(ex.Message);
                    }
                    finally
                    {
                        FPrincipal.mostraNoDisplay(System.DateTime.Now.ToString() + " Danfe " + nota.Num_nfe.ToString() + " enviado para impressora " + nota.Impressora);
                        try
                        {
                            dao.DaoNfe.excluiNotaTemp(nota);
                        }
                        catch (Exception ex)
                        {
                            FPrincipal.mostraNoDisplay(string.Format("{0} {1} {2}", System.DateTime.Now.ToString(), ex.Message, ex.StackTrace));
                        }
                    }
                }            
                t.Join(Convert.ToInt32(FPrincipal.Intervalo));
            }
            if (!flagAtiva)
            {
                t.Abort();
            }
        }
        public void inicializa()
        {
            t = new Thread(new ThreadStart(imprimeDanfe));
            t.IsBackground = true;
            t.Start();            
        }
    }
}
