using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using Nfe.dao;
using Nfe.entidades;
using Nfe.forms;
using System.Net.Mail;
using System.IO;
using System.Net;
using Nfe.negocios.email.pdf;
using System.Net.Mime;

namespace Nfe.negocios.email
{
    public class EnviaEmail
    {
        public void enviaXML()
        {
            foreach (XmlDataDocument xmlDoc in BufferMail.Buffer)
            {
                XmlNodeList xmlNode = xmlDoc.GetElementsByTagName("item");
                foreach (XmlNode node in xmlNode)
                {
                    XmlNodeList xmlNodeChilds = node.ChildNodes;
                    XmlNode nodeId = xmlNodeChilds.Item(0);
                    XmlNode nodeEmail = xmlNodeChilds.Item(1);
                    XmlNode nodeSubject = xmlNodeChilds.Item(2);
                    XmlNode nodeAttName = xmlNodeChilds.Item(3);
                    XmlNode nodeBody = xmlNodeChilds.Item(4);

                    string id = nodeId.InnerText;
                    string email = nodeEmail.InnerText;
                    string subject = nodeSubject.InnerText;
                    string attName = nodeAttName.InnerText;
                    string body = nodeBody.InnerText;
                    
                    entidades.Nfe nfe = new Nfe.entidades.Nfe();
                    nfe.Id_nfe = id;
                    try
                    {
                        nfe = DaoNfe.buscaPorId(nfe);
                        if (string.IsNullOrEmpty(nfe.Xml_nfe.InnerText))
                            throw new Exception(string.Format("Nota {0} não encontrada", id));
                        MontaXml m = new MontaXml();
                        nfe = m.montaArquivo(nfe);
                        if (nfe.Msg_validacao != "Validaçao completa")
                        {
                            forms.FServidor.servidor.adicionaMensagemLog(string.Format("NF-e {0} não passou na validação do XML Schema de distribuição, e-mail não enviado"));
                            continue;
                        }
                    }
                    catch(Exception ex)
                    {
                        new GerenciaExcessoes(ex);
                    }

                    if (!String.IsNullOrEmpty(nfe.Xml_nfe.InnerXml))
                    {
                        SmtpClient smtpClient = new SmtpClient(FServidor.servidor.Smtp,FServidor.servidor.PortaSmtp);
                        
                        MailAddress remetente = new MailAddress(FServidor.servidor.EnderecoEmail,"Cooperativa Agroindustrial Lar");
                        MailAddress destinatario = new MailAddress(email);
                        
                        MailMessage mensagem = new MailMessage(remetente, destinatario);
                        mensagem.IsBodyHtml = true;

                        smtpClient.Timeout = 5000;

                        byte[] bytes = System.Text.Encoding.UTF8.GetBytes(nfe.Xml_nfe.InnerXml);
                        MemoryStream ms = new MemoryStream(bytes);
                        Attachment anexo = new Attachment(ms, attName, "text/plain");
                        mensagem.Attachments.Add(anexo);
                        mensagem.Body = body;
                        mensagem.Subject = subject;
                        NetworkCredential credenciais = new NetworkCredential(FServidor.servidor.EnderecoEmail, FServidor.servidor.Senha);
                        smtpClient.Credentials = credenciais;
                        try
                        {
                            FServidor.servidor.adicionaMensagemLog(string.Format("Enviando NF-e para o e-mail {0}", email));
                            smtpClient.Send(mensagem);
                        }
                        catch (Exception ex)
                        {
                            new GerenciaExcessoes(ex);
                            FServidor.servidor.adicionaMensagemLog(string.Format("E-mail {0} não pode ser enviado", email));
                        }                        
                        mensagem.Dispose();
                        forms.FServidor.servidor.adicionaMensagemLog("E-mail enviado com sucesso");
                    }
                }
            }            
            BufferMail.Buffer.Clear();
        }

        public void enviaPDF()
        {
            foreach (XmlDataDocument xmlDoc in BufferPDF.Buffer)
            {
                XmlNodeList xmlNode = xmlDoc.GetElementsByTagName("item");
                foreach (XmlNode node in xmlNode)
                {
                    XmlNodeList xmlNodeChilds = node.ChildNodes;
                    XmlNode nodeId = xmlNodeChilds.Item(0);
                    XmlNode nodeEmail = xmlNodeChilds.Item(1);
                    XmlNode nodeSubject = xmlNodeChilds.Item(2);
                    XmlNode nodeAttName = xmlNodeChilds.Item(3);
                    XmlNode nodeBody = xmlNodeChilds.Item(4);

                    string id = nodeId.InnerText;
                    string email = nodeEmail.InnerText;
                    string subject = nodeSubject.InnerText;
                    string attName = nodeAttName.InnerText;
                    string body = nodeBody.InnerText;

                    entidades.Nfe nfe = new Nfe.entidades.Nfe();
                    nfe.Id_nfe = id;

                    try
                    {
                        nfe = DaoNfe.buscaPorId(nfe);
                        if (string.IsNullOrEmpty(nfe.Xml_nfe.InnerText))
                            throw new Exception(string.Format("Nota {0} não encontrada", id));                        
                    }
                    catch (Exception ex)
                    {
                        new GerenciaExcessoes(ex);
                    }

                    //Gera nota em pdf
                    MemoryStream ms = null;
                    ControlaRelatorio c = new ControlaRelatorio();
                    if (c.populaDataSet(nfe, "NF"))
                    {
                        crDanfeDefault crReport = new crDanfeDefault();
                        crReport.SetDataSource(ControlaRelatorio.getDataSource());
                        //crReport.PrintOptions.PrinterName = nota.Impressora;
                        //crReport.PrintToPrinter(Convert.ToInt32(nota.Num_vias), false, 1, 0);
                        ms =(MemoryStream)
                        crReport.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                        crReport.Close();
                        crReport.Dispose();
                    }
                    //----------------
                                        
                    SmtpClient smtpClient = new SmtpClient(FServidor.servidor.Smtp, FServidor.servidor.PortaSmtp);

                    MailAddress remetente = new MailAddress(FServidor.servidor.EnderecoEmail, "Cooperativa Agroindustrial Lar");
                    MailAddress destinatario = new MailAddress(email);

                    MailMessage mensagem = new MailMessage(remetente, destinatario);
                    mensagem.IsBodyHtml = true;

                    
                    //MemoryStream ms = new MemoryStream(bytes);
                    Attachment anexo = new Attachment(ms, attName, MediaTypeNames.Application.Pdf);
                    mensagem.Attachments.Add(anexo);
                    mensagem.Body = body;
                    mensagem.Subject = subject;
                    NetworkCredential credenciais = new NetworkCredential(FServidor.servidor.EnderecoEmail, FServidor.servidor.Senha);
                    smtpClient.Credentials = credenciais;
                    try
                    {
                        FServidor.servidor.adicionaMensagemLog(string.Format("Enviando NF-e para o e-mail {0}", email));
                        smtpClient.Send(mensagem);
                    }
                    catch (Exception ex)
                    {
                        new GerenciaExcessoes(ex);
                        FServidor.servidor.adicionaMensagemLog(string.Format("E-mail {0} não pode ser enviado", email));
                    }
                    mensagem.Dispose();
                    forms.FServidor.servidor.adicionaMensagemLog("E-mail enviado com sucesso");
                }
            }
            BufferPDF.Buffer.Clear();
        }

    }
}
