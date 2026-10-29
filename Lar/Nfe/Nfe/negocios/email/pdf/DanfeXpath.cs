using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.XPath;
using System.Xml;
using System.Windows.Forms;

namespace Nfe.negocios.email.pdf
{
    public class DanfeXpath
    {
        //atributos
        //Filial
        private string descFilial;
        private string logradouroFilial;
        private string numeroFilial;
        private string bairroFilial;
        private string cidadeFilial;
        private string ufFilial;
        private string telefoneFilial;
        private string cepFilial;
        private string inscricaoFilial;
        private string cnpjFilial;                

        //destinatário
        private string nomeCliente;
        private string cnpjCliente;
        private string logradouroCliente;
        private string numeroCliente;
        private string bairroCliente;
        private string cepCliente;
        private string cidadeCliente;
        private string telefoneCliente;
        private string ufCliente;
        private string inscricaoCliente;        

        //dados nota
        private string dataSaida; 
        private string dataRecebimento;
        private string dataEmissao;
        private string chaveAcesso;
        private string chaveAcessoContingencia;        
        private Int32 serie;
        private string numNfe;
        private Int16 indEntradaSaida;
        private string naturezaOp;
        private string inscEstadualSubsTributario;
        private string horaNF;
        private int ambienteEmiss;
        private int tpAmb;        
        private string msgHomologacao;
        private string codigoUF;
        private string cbContingencia;
        private string codContingencia;
        private string chaveAcessoNaoFormatada;            
               
        //fatura
        private int numFatura;
        private string vencimento;
        private string valorFatura;        
        private string aVista = string.Empty;       

        //calculo imposto - FAZER UMA TABELA A PARTE PRA JOGAR ESSES VALORES
        private string baseCalculoIcms;
        private string valorIcms;
        private string baseCalculoIcmsSubst;
        private string valorIcmsSubst;        
        private string valorTotalProdutos;
        private string valorFrete;
        private string valorSeguro;
        private string valorDesconto;
        private string outrasDespesasAcess;
        private string valIpi;
        private string valorTotalNota;        

        //transportador/volumes
        private string razaoSocialTransp;
        private Int16 fretePorConta;
        private string codAntt;
        private string placaVeiculo;
        private string ufVeiculo;
        private string cnpjTransp;
        private string cidadeTransp;
        private string ufTransp;        
        private string inscEstadualTransp;
        private decimal quantidadeTransp;
        private string especieTransp;
        private string marcaTransp;
        private string numeracaoTransp;
        private string pesoBrutoTransp;
        private string pesoLiqTransp;
        private string enderecoTransp;
        private string volumeTransp;        

        //produtos/servicos
        private Int32[] codProduto;
        private string[] descProduto;
        private string[] ncmSh;
        private string[] cstProduto;
        private string[] cfopProduto;
        private string[] unidadeProduto;
        private string[] quantidadeProduto;
        private string[] valorUnitProduto;
        private string[] valorTotalProduto;
        private string[] bcIcmsProduto;
        private string[] valorIcmsProduto;
        private string[] aliqIcmsProduto;
        private string[] aliqIpiProduto; //nao precisa
        private string[] dadosLote;
        private string[] volume; //nao tem no xml, vai guardar o volume que for passado com o nome do produto .. se tiver
        //imposto do produto
        private string[] baseCalcSubstItem;
        private string[] valorIcmsSubstItem;
        private string[] infAdProd;
               
        //calculo issqn - so vai ter quando for serviço
        private string inscricaoMunicipal;
        private decimal valorTotalServico;
        private decimal baseCalculoIssqn;
        private decimal valorIssqn;        

        //dados adicionais
        private string dadosAdicionais;
        private string dadosAdicFisco;
        private string obsContMatricula;
        private string obsContVendedor;
        private string obsContVecto;
        private string obsContFinalidade;
        private string obsContCmi;


        
        private XmlDataDocument xmlDataDoc;
        private Int32 qtItens;
        private Int32 i = 0;

        public string[] Volume
        {
            get { return volume; }
            set { volume = value; }
        }

        public string ChaveAcessoNaoFormatada
        {
            get { return chaveAcessoNaoFormatada; }
            set { chaveAcessoNaoFormatada = value; }
        }  

        public XmlDataDocument XmlDataDoc
        {
            get { return xmlDataDoc; }
            set { xmlDataDoc = value; }
        }
        public string DescFilial
        {
            get { return descFilial; }
            set { descFilial = value; }
        }
        public string LogradouroFilial
        {
            get { return logradouroFilial; }
            set { logradouroFilial = value; }
        }
        public string NumeroFilial
        {
            get { return numeroFilial; }
            set { numeroFilial = value; }
        }
        public string MsgHomologacao
        {
            get { return msgHomologacao; }
            set { msgHomologacao = value; }
        }
        public string BairroFilial
        {
            get { return bairroFilial; }
            set { bairroFilial = value; }
        }
        public string CidadeFilial
        {
            get { return cidadeFilial; }
            set { cidadeFilial = value; }
        }
        public string UfFilial
        {
            get { return ufFilial; }
            set { ufFilial = value; }
        }
        public string TelefoneFilial
        {
            get { return telefoneFilial; }
            set { telefoneFilial = value; }
        }
        public string CepFilial
        {
            get { return cepFilial; }
            set { cepFilial = value; }
        }
        public string InscricaoFilial
        {
            get { return inscricaoFilial; }
            set { inscricaoFilial = value; }
        }
        public string CnpjFilial
        {
            get { return cnpjFilial; }
            set { cnpjFilial = value; }
        }
        public string HoraNF
        {
            get { return horaNF; }
            set { horaNF = value; }
        }

        public int AmbienteEmiss
        {
            get { return ambienteEmiss; }
            set { ambienteEmiss = value; }
        }

        public string NomeCliente
        {
            get { return nomeCliente; }
            set { nomeCliente = value; }
        }
        public string CnpjCliente
        {
            get { return cnpjCliente; }
            set { cnpjCliente = value; }
        }
        public string LogradouroCliente
        {
            get { return logradouroCliente; }
            set { logradouroCliente = value; }
        }
        public string NumeroCliente
        {
            get { return numeroCliente; }
            set { numeroCliente = value; }
        }
        public string BairroCliente
        {
            get { return bairroCliente; }
            set { bairroCliente = value; }
        }
        public string CepCliente
        {
            get { return cepCliente; }
            set { cepCliente = value; }
        }
        public string CidadeCliente
        {
            get { return cidadeCliente; }
            set { cidadeCliente = value; }
        }
        public string TelefoneCliente
        {
            get { return telefoneCliente; }
            set { telefoneCliente = value; }
        }
        public string UfCliente
        {
            get { return ufCliente; }
            set { ufCliente = value; }
        }
        public string InscricaoCliente
        {
            get { return inscricaoCliente; }
            set { inscricaoCliente = value; }
        }
        public string DataSaida
        {
            get { return dataSaida; }
            set { dataSaida = value; }
        }
        public string DataRecebimento
        {
            get { return dataRecebimento; }
            set { dataRecebimento = value; }
        }
        public string DataEmissao
        {
            get { return dataEmissao; }
            set { dataEmissao = value; }
        }
        public string ChaveAcesso
        {
            get { return chaveAcesso; }
            set { chaveAcesso = value; }
        }
        public string ChaveAcessoContingencia
        {
            get { return chaveAcessoContingencia; }
            set { chaveAcessoContingencia = value; }
        }
        public Int32 Serie
        {
            get { return serie; }
            set { serie = value; }
        }
        public string NumNfe
        {
            get { return numNfe; }
            set { numNfe = value; }
        }
        public Int16 IndEntradaSaida
        {
            get { return indEntradaSaida; }
            set { indEntradaSaida = value; }
        }
        public string CodigoUF
        {
            get { return codigoUF; }
            set { codigoUF = value; }
        }
        public string NaturezaOp
        {
            get { return naturezaOp; }
            set { naturezaOp = value; }
        }
        public string CodContingencia
        {
            get { return codContingencia; }
            set { codContingencia = value; }
        }
        public string CbContingencia
        {
            get { return cbContingencia; }
            set { cbContingencia = value; }
        }
        public string InscEstadualSubsTributario
        {
            get { return inscEstadualSubsTributario; }
            set { inscEstadualSubsTributario = value; }
        }
        public int NumFatura
        {
            get { return numFatura; }
            set { numFatura = value; }
        }        
        public string Vencimento
        {
            get { return vencimento; }
            set { vencimento = value; }
        }        
        public string ValorFatura
        {
            get { return valorFatura; }
            set { valorFatura = value; }
        }
        
        public string BaseCalculoIcms
        {
            get { return baseCalculoIcms; }
            set { baseCalculoIcms = value; }
        }
        public string ValorIcms
        {
            get { return valorIcms; }
            set { valorIcms = value; }
        }
        public string BaseCalculoIcmsSubst
        {
            get { return baseCalculoIcmsSubst; }
            set { baseCalculoIcmsSubst = value; }
        }
        public string ValorIcmsSubst
        {
            get { return valorIcmsSubst; }
            set { valorIcmsSubst = value; }
        }
        public string ValorTotalProdutos
        {
            get { return valorTotalProdutos; }
            set { valorTotalProdutos = value; }
        }
        public string ValorFrete
        {
            get { return valorFrete; }
            set { valorFrete = value; }
        }
        public string ValorSeguro
        {
            get { return valorSeguro; }
            set { valorSeguro = value; }
        }
        public string ValorDesconto
        {
            get { return valorDesconto; }
            set { valorDesconto = value; }
        }
        public string OutrasDespesasAcess
        {
            get { return outrasDespesasAcess; }
            set { outrasDespesasAcess = value; }
        }
        public string ValIpi
        {
            get { return valIpi; }
            set { valIpi = value; }
        }
        public string ValorTotalNota
        {
            get { return valorTotalNota; }
            set { valorTotalNota = value; }
        }
        public string RazaoSocialTransp
        {
            get { return razaoSocialTransp; }
            set { razaoSocialTransp = value; }
        }
        public Int16 FretePorConta
        {
            get { return fretePorConta; }
            set { fretePorConta = value; }
        }
        public string CodAntt
        {
            get { return codAntt; }
            set { codAntt = value; }
        }
        public string PlacaVeiculo
        {
            get { return placaVeiculo; }
            set { placaVeiculo = value; }
        }
        public string UfVeiculo
        {
            get { return ufVeiculo; }
            set { ufVeiculo = value; }
        }
        public string CnpjTransp
        {
            get { return cnpjTransp; }
            set { cnpjTransp = value; }
        }
        public string CidadeTransp
        {
            get { return cidadeTransp; }
            set { cidadeTransp = value; }
        }
        public string InscEstadualTransp
        {
            get { return inscEstadualTransp; }
            set { inscEstadualTransp = value; }
        }
        public decimal QuantidadeTransp
        {
            get { return quantidadeTransp; }
            set { quantidadeTransp = value; }
        }
        public string EspecieTransp
        {
            get { return especieTransp; }
            set { especieTransp = value; }
        }
        public string MarcaTransp
        {
            get { return marcaTransp; }
            set { marcaTransp = value; }
        }
        public string NumeracaoTransp
        {
            get { return numeracaoTransp; }
            set { numeracaoTransp = value; }
        }
        public string PesoBrutoTransp
        {
            get { return pesoBrutoTransp; }
            set { pesoBrutoTransp = value; }
        }
        public string PesoLiqTransp
        {
            get { return pesoLiqTransp; }
            set { pesoLiqTransp = value; }
        }
        public int TpAmb
        {
            get { return tpAmb; }
            set { tpAmb = value; }
        }
        public string EnderecoTransp
        {
            get { return enderecoTransp; }
            set { enderecoTransp = value; }
        }
        public string UfTransp
        {
            get { return ufTransp; }
            set { ufTransp = value; }
        }
        public string VolumeTransp
        {
            get { return volumeTransp; }
            set { volumeTransp = value; }
        }
        public Int32[] CodProduto
        {
            get { return codProduto; }
            set { codProduto = value; }
        }
        public string[] DescProduto
        {
            get { return descProduto; }
            set { descProduto = value; }
        }
        public string[] NcmSh
        {
            get { return ncmSh; }
            set { ncmSh = value; }
        }
        public string[] CstProduto
        {
            get { return cstProduto; }
            set { cstProduto = value; }
        }
        public string[] CfopProduto
        {
            get { return cfopProduto; }
            set { cfopProduto = value; }
        }
        public string[] UnidadeProduto
        {
            get { return unidadeProduto; }
            set { unidadeProduto = value; }
        }
        public string[] QuantidadeProduto
        {
            get { return quantidadeProduto; }
            set { quantidadeProduto = value; }
        }
        public string[] ValorUnitProduto
        {
            get { return valorUnitProduto; }
            set { valorUnitProduto = value; }
        }
        public string[] ValorTotalProduto
        {
            get { return valorTotalProduto; }
            set { valorTotalProduto = value; }
        }
        public string[] BcIcmsProduto
        {
            get { return bcIcmsProduto; }
            set { bcIcmsProduto = value; }
        }
        public string[] ValorIcmsProduto
        {
            get { return valorIcmsProduto; }
            set { valorIcmsProduto = value; }
        }
        public string[] AliqIcmsProduto
        {
            get { return aliqIcmsProduto; }
            set { aliqIcmsProduto = value; }
        }
        public string[] AliqIpiProduto
        {
            get { return aliqIpiProduto; }
            set { aliqIpiProduto = value; }
        }
        public string[] DadosLote
        {
            get { return dadosLote; }
            set { dadosLote = value; }
        }
        public string[] BaseCalcSubstItem
        {
            get { return baseCalcSubstItem; }
            set { baseCalcSubstItem = value; }
        }
        public string[] ValorIcmsSubstItem
        {
            get { return valorIcmsSubstItem; }
            set { valorIcmsSubstItem = value; }
        }
        public string[] InfAdProd
        {
            get { return infAdProd; }
            set { infAdProd = value; }
        }
        public string InscricaoMunicipal
        {
            get { return inscricaoMunicipal; }
            set { inscricaoMunicipal = value; }
        }
        public string AVista
        {
            get { return aVista; }
            set { aVista = value; }
        }
        public decimal ValorTotalServico
        {
            get { return valorTotalServico; }
            set { valorTotalServico = value; }
        }
        public decimal BaseCalculoIssqn
        {
            get { return baseCalculoIssqn; }
            set { baseCalculoIssqn = value; }
        }
        public decimal ValorIssqn
        {
            get { return valorIssqn; }
            set { valorIssqn = value; }
        }
        public string DadosAdicionais
        {
            get { return dadosAdicionais; }
            set { dadosAdicionais = value; }
        }
        public string ObsContMatricula
        {
            get { return obsContMatricula; }
            set { obsContMatricula = value; }
        }
        public string ObsContCmi
        {
            get { return obsContCmi; }
            set { obsContCmi = value; }
        }
        public string ObsContFinalidade
        {
            get { return obsContFinalidade; }
            set { obsContFinalidade = value; }
        }
        public string ObsContVendedor
        {
            get { return obsContVendedor; }
            set { obsContVendedor = value; }
        }
        public string ObsContVecto
        {
            get { return obsContVecto; }
            set { obsContVecto = value; }
        }
        public string DadosAdicFisco
        {
            get { return dadosAdicFisco; }
            set { dadosAdicFisco = value; }
        }
        public DanfeXpath()
        {
            this.xmlDataDoc = new XmlDataDocument();
        }

        public void calculaQtItens()
        {
            
            //XPathNavigator xPathNavItens = xmlDataDoc.CreateNavigator();
            //XPathNodeIterator xPathNodeItens = xPathNavItens.Select("//@nItem");
            //while (xPathNodeItens.MoveNext())
            //{
            //    qtItens = Convert.ToInt32(xPathNodeItens.Current.Value.ToString());
            //}
            XmlNodeList nodeListProd = xmlDataDoc.DocumentElement.GetElementsByTagName("det");
            qtItens = nodeListProd.Count;
        }

        private string TrocaPontoPorVirgula(string numero)
        {
            string n = string.Empty;
            foreach (char c in numero)
            {
                if (c != '.')
                {
                    n += c.ToString();                    
                }
                else
                {
                    n += ','.ToString(); ;                   
                }
            }
            return n;
        }

        /*
         *Pega o volume da descricao do produto se existir 
         */
        private void getVolumeProduto(Int32 i)
        {
            Int32 tamanho = DescProduto[i].Length;
            Int32 res;
            List<int> volume = new List<int>();
            string resultado = string.Empty;

            for (int index = DescProduto[i].Length; index > 0; index-- )
            {
                if (DescProduto[i][index-1].ToString() != string.Empty )
                {
                    if (Int32.TryParse(DescProduto[i][index-1].ToString(), out res))
                    {                        
                            volume.Add(res);                        
                    }
                }
            }
            if (volume.Count > 0)
            {
                volume.Reverse();
                for (int c = 0; c < volume.Count; c++)
                {
                    resultado = resultado + volume[c].ToString();
                }     
            }
        }
        /*
         * Este metodo retorna a hora que foi gerada a nota 
         * para sair no campo hora da danfe
         */
        private string getHoraNF(string chave)
        {
            /*
            string hora = string.Empty;
            OracleConnection conn = new OracleConnection(PjNfe.FNfe.objNfe.connectionString);
            OracleCommand cmd  = new OracleCommand("SELECT TO_CHAR(DT_MOVIMENTO,'hh24:mi:ss') FROM " +
                                              "TB_NOTA_CAB WHERE DESC_CHAVE_ACESSO = " + "'"+chave+"'", conn);
            try
            {
                conn.Open();
                hora = (string)cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                conn.Close();
            }
            return hora;
             */
            return "danfexpath";
        }

        private string formataData(string data)
        {
            string dia = string.Empty;
            string mes = string.Empty;
            string ano = string.Empty;
            ano = data.Substring(0, 4);            
            mes = data.Substring(5, 2);
            dia = data.Substring(8, 2);
            return dia + "/" + mes + "/" + ano;
        }

        /*
         * Este metodo formata a chave de acesso conforme o ambiente de emissao da NF-e
         * item 7 manutal de integraçao 3.0
         */
        private string formataChaveAcesso(string chave)
        {
            string c = chave.Remove(0,3);
            //if (AmbienteEmiss == 2)
            //{
                for (int i = 4; i <= chave.Length+11; i += 5)
                {
                    c = c.Insert(i, " ");
                }
            //}
            return "NFe" + c;
        }
        
        public void setCamposXpath()
        {
            codProduto = new Int32[qtItens];
            descProduto = new string[qtItens];
            ncmSh = new string[qtItens];
            cstProduto = new string[qtItens];
            cfopProduto = new string[qtItens];
            unidadeProduto = new string[qtItens];
            quantidadeProduto = new string[qtItens];
            valorUnitProduto = new string[qtItens];
            valorTotalProduto = new string[qtItens];
            bcIcmsProduto = new string[qtItens];
            valorIcmsProduto = new string[qtItens];
            aliqIcmsProduto = new string[qtItens];
            aliqIpiProduto = new string[qtItens];
            dadosLote = new string[qtItens];
            baseCalcSubstItem = new string[qtItens];
            valorIcmsSubstItem = new string[qtItens];
            infAdProd = new string[qtItens];
            
            int cont = 0;


            XPathNavigator xPathNav = xmlDataDoc.CreateNavigator();
            XPathNodeIterator xPathNode = xPathNav.Select("//@Id");
            while (xPathNode.MoveNext())
            {
                chaveAcessoNaoFormatada = xPathNode.Current.Value.ToString();
                chaveAcesso = formataChaveAcesso(xPathNode.Current.Value.ToString());                
            }

            xPathNode = xPathNav.Select("*/*/*");
            while (xPathNode.MoveNext())
            {
                //dados da nota
                if (xPathNode.Current.LocalName.ToString() == "ide")
                {
                    xPathNode.Current.MoveToChild("cUF", "http://www.portalfiscal.inf.br/nfe");
                    codigoUF = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("natOp", "http://www.portalfiscal.inf.br/nfe");
                    naturezaOp = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("dSaiEnt", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "dSaiEnt")
                    {
                        dataSaida = formataData(xPathNode.Current.Value.ToString());
                        xPathNode.Current.MoveToParent();
                    }
                    xPathNode.Current.MoveToChild("dEmi", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "dEmi")
                    {
                        dataEmissao = formataData(xPathNode.Current.Value.ToString());
                        xPathNode.Current.MoveToParent();
                    }
                    xPathNode.Current.MoveToChild("serie", "http://www.portalfiscal.inf.br/nfe");
                    serie = Convert.ToInt32(xPathNode.Current.Value.ToString());
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("nNF", "http://www.portalfiscal.inf.br/nfe");
                    numNfe = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("tpNF", "http://www.portalfiscal.inf.br/nfe");
                    /* --deixar em comentario pois os fdp da sefaz mudam a cada nova versao do MIC
                    if (xPathNode.Current.Value.ToString() == "1")
                        indEntradaSaida = Convert.ToInt16(xPathNode.Current.Value.ToString());
                    else
                        indEntradaSaida = 2;
                    */                    
                    indEntradaSaida = Convert.ToInt16(xPathNode.Current.Value.ToString());
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("tpEmis", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "tpEmis")
                    {
                        AmbienteEmiss = Convert.ToInt32(xPathNode.Current.Value.ToString());
                        xPathNode.Current.MoveToParent();
                    }
                    xPathNode.Current.MoveToChild("tpAmb", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "tpAmb")
                    {
                        tpAmb = Convert.ToInt32(xPathNode.Current.Value.ToString());
                        xPathNode.Current.MoveToParent();
                    }
                    xPathNode.Current.MoveToParent();
                }

                //emitente
                if (xPathNode.Current.LocalName.ToString() == "emit")
                {
                    xPathNode.Current.MoveToChild("xNome", "http://www.portalfiscal.inf.br/nfe");
                    descFilial = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("IE", "http://www.portalfiscal.inf.br/nfe");
                    inscricaoFilial = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("CNPJ", "http://www.portalfiscal.inf.br/nfe");
                    cnpjFilial = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("enderEmit", "http://www.portalfiscal.inf.br/nfe");
                    xPathNode.Current.MoveToChild("xLgr", "http://www.portalfiscal.inf.br/nfe");
                    logradouroFilial = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("nro","http://www.portalfiscal.inf.br/nfe");
                    numeroFilial = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("xBairro", "http://www.portalfiscal.inf.br/nfe");
                    bairroFilial = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("xMun", "http://www.portalfiscal.inf.br/nfe");
                    cidadeFilial = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("UF", "http://www.portalfiscal.inf.br/nfe");
                    ufFilial = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("fone", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "fone")
                    {
                        telefoneFilial = xPathNode.Current.Value.ToString();
                        xPathNode.Current.MoveToParent();    
                    }                    
                    xPathNode.Current.MoveToChild("CEP", "http://www.portalfiscal.inf.br/nfe");
                    cepFilial = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                }
                
                //destinatario
                if (xPathNode.Current.LocalName.ToString() == "dest")
                {
                    xPathNode.Current.MoveToChild("xNome", "http://www.portalfiscal.inf.br/nfe");
                    nomeCliente = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("CNPJ", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "CNPJ")
                    {
                        cnpjCliente = xPathNode.Current.Value.ToString();
                        xPathNode.Current.MoveToParent();
                    }
                    xPathNode.Current.MoveToChild("CPF", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "CPF")
                    {
                        cnpjCliente = xPathNode.Current.Value.ToString();
                        xPathNode.Current.MoveToParent();
                    }
                    xPathNode.Current.MoveToChild("IE", "http://www.portalfiscal.inf.br/nfe");
                    inscricaoCliente = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("enderDest", "http://www.portalfiscal.inf.br/nfe");
                    xPathNode.Current.MoveToChild("xLgr", "http://www.portalfiscal.inf.br/nfe");
                    logradouroCliente = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("nro", "http://www.portalfiscal.inf.br/nfe");
                    numeroCliente = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("xBairro", "http://www.portalfiscal.inf.br/nfe");
                    bairroCliente = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("CEP", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "CEP")
                    {
                        cepCliente = xPathNode.Current.Value.ToString();
                        xPathNode.Current.MoveToParent();
                    }                    
                    xPathNode.Current.MoveToChild("xMun", "http://www.portalfiscal.inf.br/nfe");
                    cidadeCliente = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("fone", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "fone")
                    {
                        telefoneCliente = xPathNode.Current.Value.ToString();
                        xPathNode.Current.MoveToParent();
                    }                    
                    xPathNode.Current.MoveToChild("UF", "http://www.portalfiscal.inf.br/nfe");
                    ufCliente = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                }
                
                //produtos
                if (xPathNode.Current.LocalName.ToString() == "det")
                {
                    xPathNode.Current.MoveToChild("prod", "http://www.portalfiscal.inf.br/nfe");
                    xPathNode.Current.MoveToChild("cProd", "http://www.portalfiscal.inf.br/nfe");
                    codProduto[i] = Convert.ToInt32(xPathNode.Current.Value.ToString());
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("xProd", "http://www.portalfiscal.inf.br/nfe");
                    descProduto[i] = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("NCM", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "NCM")
                    {
                        ncmSh[i] = xPathNode.Current.Value.ToString();
                        xPathNode.Current.MoveToParent();
                    }                    
                    xPathNode.Current.MoveToChild("CFOP", "http://www.portalfiscal.inf.br/nfe");
                    cfopProduto[i] = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("uCom", "http://www.portalfiscal.inf.br/nfe");
                    unidadeProduto[i] = xPathNode.Current.Value.ToString();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("qCom", "http://www.portalfiscal.inf.br/nfe");
                    quantidadeProduto[i] = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("vUnCom", "http://www.portalfiscal.inf.br/nfe");
                    valorUnitProduto[i] = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("vProd", "http://www.portalfiscal.inf.br/nfe");
                    valorTotalProduto[i] = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("imposto", "http://www.portalfiscal.inf.br/nfe");
                    xPathNode.Current.MoveToChild("ICMS", "http://www.portalfiscal.inf.br/nfe");
                    xPathNode.Current.MoveToChild("ICMS00", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "ICMS00")
                    {
                        xPathNode.Current.MoveToChild("CST", "http://www.portalfiscal.inf.br/nfe");
                        cstProduto[i] = xPathNode.Current.Value.ToString();
                        xPathNode.Current.MoveToParent();
                        xPathNode.Current.MoveToChild("vBC", "http://www.portalfiscal.inf.br/nfe");
                        bcIcmsProduto[i] = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                        xPathNode.Current.MoveToParent();
                        xPathNode.Current.MoveToChild("vICMS", "http://www.portalfiscal.inf.br/nfe");
                        valorIcmsProduto[i] = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                        xPathNode.Current.MoveToParent();                        
                        xPathNode.Current.MoveToChild("pICMS", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "pICMS")
                        {
                            aliqIcmsProduto[i] = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                            xPathNode.Current.MoveToParent();
                        }
                    }       
                    xPathNode.Current.MoveToChild("ICMS10", "http://www.portalfiscal.inf.br/nfe");                    
                    if (xPathNode.Current.LocalName.ToString() == "ICMS10")
                    {
                        xPathNode.Current.MoveToChild("CST", "http://www.portalfiscal.inf.br/nfe");
                        cstProduto[i] = xPathNode.Current.Value.ToString();
                        xPathNode.Current.MoveToParent();
                        xPathNode.Current.MoveToChild("vBC", "http://www.portalfiscal.inf.br/nfe");
                        bcIcmsProduto[i] = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                        xPathNode.Current.MoveToParent();
                        xPathNode.Current.MoveToChild("vICMS", "http://www.portalfiscal.inf.br/nfe");
                        valorIcmsProduto[i] = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                        xPathNode.Current.MoveToParent();
                        xPathNode.Current.MoveToChild("vBCST", "http://www.portalfiscal.inf.br/nfe");
                        BaseCalcSubstItem[i] = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                        xPathNode.Current.MoveToParent();
                        xPathNode.Current.MoveToChild("vICMSST", "http://www.portalfiscal.inf.br/nfe");
                        valorIcmsSubstItem[i] = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                        xPathNode.Current.MoveToParent();
                        xPathNode.Current.MoveToChild("pICMS", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "pICMS")
                        {
                            aliqIcmsProduto[i] = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                            xPathNode.Current.MoveToParent();
                        }
                    }
                    xPathNode.Current.MoveToChild("ICMS20", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "ICMS20")
                    {
                        xPathNode.Current.MoveToChild("CST", "http://www.portalfiscal.inf.br/nfe");
                        cstProduto[i] = xPathNode.Current.Value.ToString();
                        xPathNode.Current.MoveToParent();
                        xPathNode.Current.MoveToChild("vBC", "http://www.portalfiscal.inf.br/nfe");
                        bcIcmsProduto[i] = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                        xPathNode.Current.MoveToParent();
                        xPathNode.Current.MoveToChild("vICMS", "http://www.portalfiscal.inf.br/nfe");
                        valorIcmsProduto[i] = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                        xPathNode.Current.MoveToParent();                       
                        xPathNode.Current.MoveToChild("pICMS", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "pICMS")
                        {
                            aliqIcmsProduto[i] = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                            xPathNode.Current.MoveToParent();
                        }
                    }
                    xPathNode.Current.MoveToChild("ICMS51", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "ICMS51")
                    {
                        xPathNode.Current.MoveToChild("CST", "http://www.portalfiscal.inf.br/nfe");
                        cstProduto[i] = xPathNode.Current.Value.ToString();
                        xPathNode.Current.MoveToParent();
                        xPathNode.Current.MoveToChild("vBC", "http://www.portalfiscal.inf.br/nfe");
                        bcIcmsProduto[i] = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                        xPathNode.Current.MoveToParent();
                        xPathNode.Current.MoveToChild("vICMS", "http://www.portalfiscal.inf.br/nfe");
                        valorIcmsProduto[i] = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                        xPathNode.Current.MoveToParent();
                        //xPathNode.Current.MoveToChild("vBCST", "http://www.portalfiscal.inf.br/nfe");
                        //BaseCalcSubstItem[i] = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                        //xPathNode.Current.MoveToParent();
                        //xPathNode.Current.MoveToChild("vICMSST", "http://www.portalfiscal.inf.br/nfe");
                        //valorIcmsSubstItem[i] = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                        //xPathNode.Current.MoveToParent();
                        xPathNode.Current.MoveToChild("pICMS", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "pICMS")
                        {
                            aliqIcmsProduto[i] = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                            xPathNode.Current.MoveToParent();
                        }
                    }
                    xPathNode.Current.MoveToChild("ICMS40", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "ICMS40")
                    {
                        xPathNode.Current.MoveToChild("CST", "http://www.portalfiscal.inf.br/nfe");
                        cstProduto[i] = xPathNode.Current.Value.ToString();
                        xPathNode.Current.MoveToParent();
                        bcIcmsProduto[i] = "0";
                        valorIcmsProduto[i] = "0";
                        BaseCalcSubstItem[i] = "0";
                        valorIcmsSubstItem[i] = "0";
                        aliqIcmsProduto[i] = "0";
                    }
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("infAdProd", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "infAdProd")
                    {
                        infAdProd[i] = xPathNode.Current.Value.ToString();
                        xPathNode.Current.MoveToParent();
                    }                    
                    getVolumeProduto(i);
                    // terminar .. ver quais os campos que nao sao obrigatorios em todas as notas
                    i++;
                }
                
                //total
                if (xPathNode.Current.LocalName.ToString() == "total")
                {
                    xPathNode.Current.MoveToChild("ICMSTot", "http://www.portalfiscal.inf.br/nfe");
                    xPathNode.Current.MoveToChild("vBC", "http://www.portalfiscal.inf.br/nfe");
                    baseCalculoIcms = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("vICMS", "http://www.portalfiscal.inf.br/nfe");
                    valorIcms = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("vBCST", "http://www.portalfiscal.inf.br/nfe");
                    baseCalculoIcmsSubst = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("vST", "http://www.portalfiscal.inf.br/nfe");
                    ValorIcmsSubst = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("vProd", "http://www.portalfiscal.inf.br/nfe");
                    valorTotalProdutos = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("vFrete", "http://www.portalfiscal.inf.br/nfe");
                    valorFrete = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("vSeg", "http://www.portalfiscal.inf.br/nfe");
                    valorSeguro = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("vDesc", "http://www.portalfiscal.inf.br/nfe");
                    valorDesconto = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("vOutro", "http://www.portalfiscal.inf.br/nfe");
                    outrasDespesasAcess = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("vIPI", "http://www.portalfiscal.inf.br/nfe");
                    valIpi = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                    xPathNode.Current.MoveToParent();
                    xPathNode.Current.MoveToChild("vNF", "http://www.portalfiscal.inf.br/nfe");
                    valorTotalNota = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                    xPathNode.Current.MoveToParent();
                }

                //fatura
                /*
                if (xPathNode.Current.LocalName.ToString() == "cobr")
                {
                    xPathNode.Current.MoveToChild("dup", "http://www.portalfiscal.inf.br/nfe");

                    while (cont < 36)
                    {
                        if (xPathNode.Current.LocalName.ToString() == "cobr")
                            break;
                        xPathNode.Current.MoveToChild("nDup", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "nDup")
                        {                           
                            numFatura[cont] = Convert.ToInt32(xPathNode.Current.Value);
                            xPathNode.Current.MoveToParent();                           
                        }
                        xPathNode.Current.MoveToChild("dVenc", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "dVenc")
                        {
                            vencimento[cont] = formataData(xPathNode.Current.Value.ToString());
                            xPathNode.Current.MoveToParent();
                        }
                        xPathNode.Current.MoveToChild("vDup", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "vDup")
                        {
                            valorFatura[cont] = TrocaPontoPorVirgula(xPathNode.Current.Value);
                            xPathNode.Current.MoveToParent();
                        }
                        if (xPathNode.Current.MoveToNext())
                            cont++;
                        else
                            break;
                    }                    
                }
                 */
                  
                //notas a vista
                //if (NumFatura[0] == 0)
                    //aVista = "PAGAMENTO A VISTA";
                //else
                    //aVista = string.Empty;

               
                //transportador / volumes
                if (xPathNode.Current.LocalName.ToString() == "transp")
                {
                    xPathNode.Current.MoveToChild("modFrete", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName == "modFrete")
                    {
                        fretePorConta = Convert.ToInt16(xPathNode.Current.Value.ToString());
                        xPathNode.Current.MoveToParent();
                    }
                    xPathNode.Current.MoveToChild("transporta", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "transporta")
                    {
                        xPathNode.Current.MoveToChild("xNome", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "xNome")
                        {
                            razaoSocialTransp = xPathNode.Current.Value.ToString();
                            xPathNode.Current.MoveToParent();
                        }
                        xPathNode.Current.MoveToChild("CNPJ", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "CNPJ")
                        {
                            cnpjTransp = xPathNode.Current.Value.ToString();
                            xPathNode.Current.MoveToParent();
                        }
                        xPathNode.Current.MoveToChild("CPF", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "CPF")
                        {
                            cnpjTransp = xPathNode.Current.Value.ToString();
                            xPathNode.Current.MoveToParent();
                        }
                        xPathNode.Current.MoveToChild("xMun", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "xMun")
                        {
                            cidadeTransp = xPathNode.Current.Value.ToString();
                            xPathNode.Current.MoveToParent();
                        }
                        xPathNode.Current.MoveToChild("IE", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "IE")
                        {
                            inscEstadualTransp = xPathNode.Current.Value.ToString();
                            xPathNode.Current.MoveToParent();
                        }
                        xPathNode.Current.MoveToChild("xEnder", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "xEnder")
                        {
                            enderecoTransp = xPathNode.Current.Value.ToString();
                            xPathNode.Current.MoveToParent();
                        }
                        xPathNode.Current.MoveToChild("UF", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "UF")
                        {
                            ufTransp = xPathNode.Current.Value.ToString();
                            xPathNode.Current.MoveToParent();
                        }
                        xPathNode.Current.MoveToParent();
                    }
                    xPathNode.Current.MoveToChild("veicTransp", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "veicTransp")
                    {
                        xPathNode.Current.MoveToChild("placa", "http://www.portalfiscal.inf.br/nfe");
                        placaVeiculo = xPathNode.Current.Value.ToString();
                        xPathNode.Current.MoveToParent();
                        xPathNode.Current.MoveToChild("UF", "http://www.portalfiscal.inf.br/nfe");
                        ufVeiculo = xPathNode.Current.Value.ToString();
                        xPathNode.Current.MoveToParent();
                        xPathNode.Current.MoveToChild("RNTC", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "RNTC")
                        {
                            codAntt = xPathNode.Current.Value.ToString();
                            xPathNode.Current.MoveToParent();
                        }
                        xPathNode.Current.MoveToParent();
                    }
                    xPathNode.Current.MoveToChild("vol", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "vol")
                    {
                        xPathNode.Current.MoveToChild("qVol", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "qVol")
                        {
                            quantidadeTransp = Convert.ToDecimal(xPathNode.Current.Value.ToString());
                            xPathNode.Current.MoveToParent();
                        }
                        xPathNode.Current.MoveToChild("esp", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "esp")
                        {
                            especieTransp = xPathNode.Current.Value.ToString();
                            xPathNode.Current.MoveToParent();
                        }
                        xPathNode.Current.MoveToChild("nVol", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "nVol")
                        {
                            volumeTransp = xPathNode.Current.Value.ToString();
                            xPathNode.Current.MoveToParent();
                        }
                        xPathNode.Current.MoveToChild("marca", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "marca")
                        {
                            marcaTransp = xPathNode.Current.Value.ToString();
                            xPathNode.Current.MoveToParent();
                        }
                        xPathNode.Current.MoveToChild("nVol", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "nVol")
                        {
                            //numeracaoTransp = xPathNode.Current.Value.ToString();
                            numeracaoTransp = "0";
                            xPathNode.Current.MoveToParent();
                        }
                        xPathNode.Current.MoveToChild("pesoB", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "pesoB")
                        {
                            pesoBrutoTransp = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                            xPathNode.Current.MoveToParent();
                        }
                        xPathNode.Current.MoveToChild("pesoL", "http://www.portalfiscal.inf.br/nfe");
                        if (xPathNode.Current.LocalName.ToString() == "pesoL")
                        {
                            pesoLiqTransp = TrocaPontoPorVirgula(xPathNode.Current.Value.ToString());
                            xPathNode.Current.MoveToParent();
                        }
                        xPathNode.Current.MoveToParent();
                    }
                }
                if (xPathNode.Current.LocalName == "infAdic")
                {
                    xPathNode.Current.MoveToChild("infAdFisco", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "infAdFisco")
                    {
                        dadosAdicFisco = xPathNode.Current.Value.ToString();
                        xPathNode.Current.MoveToParent();
                    }
                    xPathNode.Current.MoveToChild("infCpl", "http://www.portalfiscal.inf.br/nfe");
                    if (xPathNode.Current.LocalName.ToString() == "infCpl")
                    {
                        dadosAdicionais = xPathNode.Current.Value.ToString();
                        xPathNode.Current.MoveToParent();
                    }                    
                }
            }

            XmlNamespaceManager nsMgr = new XmlNamespaceManager(xmlDataDoc.NameTable);
            nsMgr.AddNamespace("xs", "http://www.w3.org/2001/XMLSchema");
            nsMgr.AddNamespace("q1", "http://www.portalfiscal.inf.br/nfe");

            XmlNodeList selectedNodesMatricula = xmlDataDoc.SelectNodes("//q1:obsCont[@xCampo=\"Matricula\"]", nsMgr);
            if(selectedNodesMatricula.Count > 0)
                obsContMatricula = selectedNodesMatricula[0].InnerText;

            XmlNodeList selectedNodesCmi = xmlDataDoc.SelectNodes("//q1:obsCont[@xCampo=\"Cmi\"]", nsMgr);
            if(selectedNodesCmi.Count > 0)
                obsContCmi = selectedNodesCmi[0].InnerText;

            XmlNodeList selectedNodesFinalidade = xmlDataDoc.SelectNodes("//q1:obsCont[@xCampo=\"Finalidade\"]", nsMgr);
            if (selectedNodesFinalidade.Count > 0)
                obsContFinalidade = selectedNodesFinalidade[0].InnerText;

            XmlNodeList selectedNodesVendedor = xmlDataDoc.SelectNodes("//q1:obsCont[@xCampo=\"Vendedor\"]", nsMgr);
            if (selectedNodesVendedor.Count > 0)
                obsContVendedor = selectedNodesVendedor[0].InnerText;

            XmlNodeList selectedNodesVecto = xmlDataDoc.SelectNodes("//q1:obsCont[@xCampo=\"Vencto\"]", nsMgr);
            if (selectedNodesVecto.Count > 0)
                obsContVecto = selectedNodesVecto[0].InnerText;

            HoraNF = getHoraNF(ChaveAcesso);
            if(ambienteEmiss == 2)
                chaveAcessoContingencia = formataChaveAcesso(ChaveAcesso);

            //seta a frase se o tipo de ambiente for homologacao
            if (tpAmb == 1)
                MsgHomologacao = string.Empty;
            else
                if(tpAmb == 2)
                    MsgHomologacao = "SEM VALOR FISCAL";

            /* Gera o codigo de barras em caso de contingencia */
            if (AmbienteEmiss != 1)
            {
                string icmsp = string.Empty;
                string icmss = string.Empty;

                //se existir icms proprio recebe 1, senao recebe 2
                if (valorIcms != "0,00")
                    icmsp = "1";
                else
                    icmsp = "2";

                //se existir substituicao recebe 1, senao recebe 2
                if (valorIcmsSubst != "0,00")
                    icmss = "1";
                else
                    icmss = "2";

                
                codContingencia = codigoUF.PadLeft(2, '0') + AmbienteEmiss.ToString().PadLeft(1, '0') + cnpjFilial.PadLeft(14, '0');
                codContingencia += valorTotalNota.Replace(",", string.Empty).PadLeft(14, '0');
                codContingencia += icmsp + icmss;
                codContingencia += dataEmissao.Substring(0, 2).PadLeft(2, '0');
                codContingencia += calculaDVContingencia(codContingencia);
                cbContingencia = codContingencia;
            }
        }

        private string calculaDVContingencia(string codigo)
        {
            List<int> n = new List<int>();
            int peso = 2;
            int resultado = 0;

            foreach (char s in codigo)
            {
                n.Add(Convert.ToInt32(s.ToString()));
            }
           
            for (i = n.Count-1; i > -1; i--)
            {
                if (peso > 9)
                    peso = 2;
                resultado += (peso * n[i]);
                peso++;
            }
            resultado = resultado % 11;
            
            if (resultado == 0 || resultado == 1)
                resultado = 0;
            else
                resultado = 11 - resultado;
            return resultado.ToString();
        }
    }
}
