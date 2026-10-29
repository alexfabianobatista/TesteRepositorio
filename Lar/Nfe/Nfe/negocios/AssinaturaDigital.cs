using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Xml;
using System.Xml.Schema;
using System.Security.Cryptography.Xml;
using System.Security.Cryptography.X509Certificates;
using System.Windows.Forms;
using Nfe.negocios;

namespace Nfe.negocios
{
    public class AssinaturaDigital
    {
        public int Assinar(string xmlString, string RefUri, X509Certificate2 X509Cert)
        {   
           /*
            * ENTRADAS:
            * XMLSTRING: STRING XML A SER ASSINADA
            * REFURI : REFERÊNCIA DA URI A SER ASSINADA (EX. INFNFE
            * X509CERT : CERTIFICADO DIGITAL A SER UTILIZADO NA ASSINATURA DIGITAL
            *
            * RETORNOS:
            * ASSINAR : 0 - ASSINATURA REALIZADA COM SUCESSO
            * 1 - ERRO: PROBLEMA AO ACESSAR O CERTIFICADO DIGITAL - %EXCEÇÃO%
            * 2 - PROBLEMAS NO CERTIFICADO DIGITAL
            * 3 - XML MAL FORMADO + EXCEÇÃO
            * 4 - A TAG DE ASSINATURA %REFURI% INEXISTE
            * 5 - A TAG DE ASSINATURA %REFURI% NÃO É UNICA
            * 6 - ERRO AO ASSINAR O DOCUMENTO - ID DEVE SER STRING %REFURI(ATRIBUTO)%
            * 7 - ERRO: AO ASSINAR O DOCUMENTO - %EXCEÇÃO%
            *
            * XMLSTRINGASSINADO : STRING XML ASSINADA
            *
            * XMLDOCASSINADO : XMLDOCUMENT DO XML ASSINADO
            */
            
            int resultado = 0;
            //string msgResultado = "Assinatura realizada com sucesso";
            
            try
            {
                //certificado para ser usado na assinatura
                string xnome = "";

                if (X509Cert != null)
                {
                    xnome = X509Cert.Subject.ToString();
                }

                X509Certificate2 certX509 = new X509Certificate2();
                X509Store store = new X509Store("MY", StoreLocation.CurrentUser);
                store.Open(OpenFlags.ReadOnly | OpenFlags.OpenExistingOnly);
                X509Certificate2Collection collection = (X509Certificate2Collection)store.Certificates;
                X509Certificate2Collection collection1 = (X509Certificate2Collection)collection.Find(X509FindType.FindBySubjectDistinguishedName, xnome, false);

                if (collection1.Count == 0)
                {
                    resultado = 2;
                    msgResultado = "Problemas no certificado digital";
                }
                else
                {
                    //certificado ok
                    certX509 = collection1[0];
                    string x = certX509.GetKeyAlgorithm().ToString();

                    //cria um novo documento XML
                    XmlDocument doc = new XmlDocument();
                    //formata o documento para ignorar espaços em branco
                    doc.PreserveWhitespace = false;

                    try
                    {
                        //carrega o arquivo XML validado pelo parser                                              
                        doc.LoadXml(xmlString);                        

                        //Verifica se a tag a ser assinada existe e é unica
                        int qtdeRefUri = doc.GetElementsByTagName(RefUri).Count;

                        if (qtdeRefUri == 0)
                        {
                            // a Uri nao existe
                            resultado = 4;
                            msgResultado = "A tag de assinatura " + RefUri.Trim() + " inexiste";
                        }
                        else
                        {   //exite mais de 1 tag a ser assinada
                            if (qtdeRefUri > 1)
                            {
                                //existe mais de 1 Uri a ser assinada
                                resultado = 5;
                                msgResultado = "A tag de assinatura " + RefUri.Trim() + " não é unica";
                            }
                            else
                            {
                                try
                                {
                                    //cria um objeto XML assinado
                                    SignedXml signedXml = new SignedXml(doc);

                                    //adiciona key para o signedXML document
                                    signedXml.SigningKey = certX509.PrivateKey;

                                    //cria referencia para ser assinado
                                    Reference reference = new Reference();

                                    //pega o uri que deve ser assinada
                                    XmlAttributeCollection uri = doc.GetElementsByTagName(RefUri).Item(0).Attributes;
                                    foreach (XmlAttribute atributo in uri)
                                    {
                                        if (atributo.Name == "Id")
                                        {
                                            reference.Uri = "#" + atributo.InnerText;
                                        }
                                    }
                                    //adiciona um enveloped transformation para a referencia
                                    XmlDsigEnvelopedSignatureTransform env = new XmlDsigEnvelopedSignatureTransform();
                                    reference.AddTransform(env);

                                    XmlDsigC14NTransform c14 = new XmlDsigC14NTransform();
                                    reference.AddTransform(c14);

                                    //adiciona a reference para o signedXml object
                                    signedXml.AddReference(reference);

                                    //cria um novo objeto keyinfo
                                    KeyInfo keyInfo = new KeyInfo();

                                    // carrega o certificado no KeyInfoX509Data object
                                    // e adiciona no KeyInfo object.
                                    keyInfo.AddClause(new KeyInfoX509Data(certX509));

                                    //adiciona o keyinfo no signedxml
                                    signedXml.KeyInfo = keyInfo;
                                    signedXml.ComputeSignature();

                                    //pega a representacao da assinatura do xml e salva
                                    //no xmlelement
                                    XmlElement xmlDigitalSignature = signedXml.GetXml();

                                    //concatena o elemento ao documento xml
                                    doc.DocumentElement.AppendChild(doc.ImportNode(xmlDigitalSignature, true));
                                    XMLDoc = new XmlDocument();
                                    XMLDoc.PreserveWhitespace = false;
                                    XMLDoc = doc;
                                }
                                catch (Exception caught)
                                {
                                    resultado = 7;
                                    msgResultado = "Erro: Ao assinar o documento - " + caught.Message;
                                }
                            }

                        }
                    }
                    catch (Exception caught)
                    {
                        resultado = 3;
                        msgResultado = "Erro: XML mal formado - " + caught.Message;
                    }
                }

            }
            catch (Exception caught)
            {
                resultado = 1;
                msgResultado = "Erro: Problema ao acessar o certificado digital" + caught.Message;
            }
            return resultado;
        }

        //mensagem de retorno

        string msgResultado = "Assinatura realizada com sucesso";
        private XmlDocument XMLDoc;

        public XmlDocument XMLDocAssinado
        {
            get {return XMLDoc;}
        }

        public string XMLStringAssinado
        {
            get { return XMLDoc.OuterXml; }
        }

        public string mensagemResultado
        {
            get { return msgResultado; }
        }
    }
    public class Certificado
    {
        public X509Certificate2 BuscaNome(string Nome)
        {
            X509Certificate2 _X509Cert = new X509Certificate2();

            try
            {
                X509Store store = new X509Store("MY", StoreLocation.CurrentUser);
                store.Open(OpenFlags.ReadOnly | OpenFlags.OpenExistingOnly);
                X509Certificate2Collection collection = (X509Certificate2Collection)store.Certificates;
                X509Certificate2Collection collection1 = (X509Certificate2Collection)collection.Find(X509FindType.FindByKeyUsage,
                                                          X509KeyUsageFlags.DigitalSignature, false);
                X509Certificate2Collection collection2 = (X509Certificate2Collection)collection.Find(X509FindType.FindByKeyUsage, 
                                                          X509KeyUsageFlags.DigitalSignature, false);

                if (Nome == "")
                {
                    X509Certificate2Collection scollection = X509Certificate2UI.SelectFromCollection(collection2, "Certificado(s) Digital(is) disponível(is)",
                                                                                                     "Selecione o Certificado Digital para uso no aplicativo", X509SelectionFlag.SingleSelection);
                    if (scollection.Count == 0)
                    {
                        _X509Cert.Reset();
                        MessageBox.Show("Nenhum certificado válido foi encontrado com o nome informado: " + Nome, "Atenção");
                        _X509Cert.Reset();
                    }
                    else
                    {
                        _X509Cert = scollection[0];
                    }
                }
                else
                {
                    int countCert = store.Certificates.Count;
                    for (int i = 0; i < countCert; i++)
                    {
                        string nameCert = store.Certificates[i].GetNameInfo(X509NameType.SimpleName,false);
                        if (nameCert == Nome)
                        {
                            _X509Cert = store.Certificates[i];
                            break;
                        }
                    }
                }               
                store.Close();
                return _X509Cert;
            }
            catch(System.Exception ex)
            {
                //MessageBox.Show(ex.Message);
                new GerenciaExcessoes(ex);
                return _X509Cert;
            }
        }
        public X509Certificate2 BuscaNroSerie(string NroSerie)
        {
            X509Certificate2 _X509Cert = new X509Certificate2();
            try
            {
                X509Store store = new X509Store("MY", StoreLocation.CurrentUser); 
                store.Open(OpenFlags.ReadOnly | OpenFlags.OpenExistingOnly);
                X509Certificate2Collection collection = (X509Certificate2Collection)store.Certificates;
                X509Certificate2Collection collection1 = (X509Certificate2Collection)collection.Find(X509FindType.FindByTimeValid, DateTime.Now, true);
                X509Certificate2Collection collection2 = (X509Certificate2Collection)collection1.Find(X509FindType.FindByKeyUsage, X509KeyUsageFlags.DigitalSignature, true);

                if (NroSerie == "")
                {
                    X509Certificate2Collection scollection = X509Certificate2UI.SelectFromCollection(collection2, "Certificados Digitais", "Selecione o Certificado Digital para uso no aplicativo",
                                                             X509SelectionFlag.SingleSelection);
                    if (scollection.Count == 0)
                    {
                        _X509Cert.Reset();
                        MessageBox.Show("Nenhum certificado válido foi encontrado com o número de série informado: " + NroSerie, "Atenção");
                    }
                    else
                    {
                        _X509Cert = scollection[0];
                    }
                }
                else
                {
                    X509Certificate2Collection scollection = (X509Certificate2Collection)collection2.Find(X509FindType.FindBySerialNumber, NroSerie, true);
                    if (scollection.Count == 0)
                    {
                        _X509Cert.Reset();
                        MessageBox.Show("Nenhum certificado válido foi encontrado com o número de série informado: " + NroSerie, "Atenção");
                    }
                    else
                    {
                        _X509Cert = scollection[0];
                    }
                }
                store.Close();
                return _X509Cert;
            }
            catch (System.Exception ex)
            {
                //MessageBox.Show(ex.Message);
                new GerenciaExcessoes(ex);
                return _X509Cert;
            }
        }
    }

}
