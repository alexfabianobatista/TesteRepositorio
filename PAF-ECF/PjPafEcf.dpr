program PjPafEcf;

uses
  Forms,
  UTMenuPrincipal in '..\Template\UTMenuPrincipal.pas' {FTMenuPrincipal},
  UMenuPafEcf in 'UMenuPafEcf.pas' {FMenuPafEcf},
  UConexao in '..\Banco\UConexao.pas' {FConexao},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UImpressoraFiscal in '..\Vendas\UImpressoraFiscal.pas' {FImpressoraFiscal},
  UImpressoraFiscal_cl in '..\Vendas\UImpressoraFiscal_cl.pas' {DMImpressoraFiscal: TDataModule},
  UImpressoraFiscalParam in '..\Vendas\UImpressoraFiscalParam.pas',
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  UTConsulta in '..\Template\UTConsulta.pas' {FTConsulta},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword},
  UTRelSimples in '..\Template\UTRELSIMPLES.pas' {FTRelSimples},
  UTParametro in '..\Template\UTPARAMETRO.pas' {FTParametro},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UFmFilial in '..\Frames\UFmFilial.pas' {FmFilial: TFrame},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  UEnviaEmail in '..\Agricola\UEnviaEmail.pas' {FEnviaEmail},
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  UVendaPerdidaCad in '..\Estoque\UVendaPerdidaCad.pas' {FVendaPerdidaCad},
  UProdutos_UltimasCompras in '..\Estoque\UProdutos_UltimasCompras.pas' {FProdutos_UltimasCompras},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UProdutos_UltimasVendas in '..\Estoque\UProdutos_UltimasVendas.pas' {FProdutos_UltimasVendas},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons},
  UContratoVenda_Cons in '..\Agricola\UContratoVenda_Cons.pas' {FContrato_VendaCons},
  UFmContrato in '..\Frames\UFmContrato.pas' {FmContrato: TFrame},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  UFmFinalidade in '..\Frames\UFmFinalidade.pas' {FmFinalidade: TFrame},
  UFmBanco in '..\Frames\UFmBanco.pas' {FMBanco: TFrame},
  UFmObra in '..\Frames\UFmObra.pas' {FmObra: TFrame},
  UFmTitulo in '..\Frames\UFmTitulo.pas' {FmTitulo: TFrame},
  UNotaItensCons in '..\ContaReceber\UNotaItensCons.pas' {FNotaItensCons},
  UContasReceberCons in '..\ContaReceber\UContasReceberCons.pas' {FContasReceberCons},
  UObraContrato_cl in '..\Obra\UObraContrato_cl.pas' {DMObraContrato: TDataModule},
  UObraContrato_Cons in '..\Obra\UObraContrato_Cons.pas' {FObraContrato_Cons},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  UContasReceberParam in '..\ContaReceber\UContasReceberParam.pas',
  UFmContaCorrente in '..\Frames\UFmContaCorrente.pas' {FmContaCorrente: TFrame},
  UContasReceber_cl in '..\ContaReceber\UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  URBloqueto_Bradesco in '..\ContaReceber\URBloqueto_Bradesco.pas' {FRBloqueto_Bradesco},
  URBloqueto_CEF in '..\ContaReceber\URBloqueto_CEF.pas' {FRBloqueto_CEF},
  URBloqueto_HSBC in '..\ContaReceber\URBloqueto_HSBC.pas' {FRBloqueto_HSBC},
  URBloqueto_Rural in '..\ContaReceber\URBloqueto_Rural.pas' {FRBloqueto_Rural},
  URBloqueto_Santander in '..\ContaReceber\URBloqueto_Santander.pas' {FRBloqueto_Santander},
  URBloqueto_Sicoob in '..\ContaReceber\URBloqueto_Sicoob.pas' {FRBloqueto_Sicoob},
  URBloqueto_Sicredi in '..\ContaReceber\URBloqueto_Sicredi.pas' {FRBloqueto_Sicredi},
  URBloqueto_Sudameris in '..\ContaReceber\URBloqueto_Sudameris.pas' {FRBloqueto_Sudameris},
  URBloqueto_Unibanco in '..\ContaReceber\URBloqueto_Unibanco.pas' {FRBloqueto_Unibanco},
  URBloquetoSafra in '..\ContaReceber\URBloquetoSafra.pas' {FRBloqueto_Safra},
  URBoletaBB in '..\ContaReceber\URBoletaBB.pas',
  UnitBoleta in '..\MyLib\UNITBOLETA.pas' {Boleta},
  UBloqueto in '..\ContaReceber\UBloqueto.pas',
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  UHistorico_cl in '..\ContaPagar\UHistorico_cl.pas' {DMHistorico: TDataModule},
  UNfEletronicaLote_cl in '..\Vendas\UNfEletronicaLote_cl.pas' {DMNfEletronicaLote: TDataModule},
  UFmNfeLote in '..\Frames\UFmNfeLote.pas' {FmNfeLote: TFrame},
  UNFeParam in '..\MonitorNfe\UNFeParam.pas' {FNFeParam},
  UConhecimento_cl in '..\Conhecimento\UConhecimento_cl.pas' {DMConhecimento: TDataModule},
  UCteLote_cl in '..\Conhecimento\UCteLote_cl.pas' {DMCteLote: TDataModule},
  UNfe_cl in '..\MonitorNfe\UNfe_cl.pas' {DMNfe: TDataModule},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  UConhecimentoFrete_cl in '..\Conhecimento\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  UTipoLote_cl in '..\Estoque\UTipoLote_cl.pas' {DMTipoLote: TDataModule},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  URadioDialog in '..\Vendas\URadioDialog.pas' {FRadioDialog},
  UTef_cl in '..\Vendas\UTef_cl.pas' {DMTEF: TDataModule},
  UTefInputBox in '..\Vendas\UTefInputBox.pas' {FTefInputBox},
  UTefInputBoxCheque in '..\Vendas\UTefInputBoxCheque.pas' {FTefInputBoxCheque},
  UTef in '..\Vendas\UTef.pas' {FTEF},
  UAguarde in '..\ContaReceber\UAguarde.pas' {FAguarde},
  UNotaSaida_Cancela in '..\Vendas\UNotaSaida_Cancela.pas' {FNotaSaida_Cancela},
  UAliquotasImpressora in '..\Vendas\UAliquotasImpressora.pas' {FAliquotasImpressora},
  UObra_cl in '..\Obra\UObra_cl.pas' {DMObra: TDataModule},
  UObraCons in '..\Obra\UObraCons.pas' {FObraCons},
  UFRBloqueto_Itau in '..\ContaReceber\UFRBloqueto_Itau.pas' {FRBloqueto_Itau},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UParamSistema in '..\Cadastro\UParamSistema.pas',
  UTCadSimples in '..\Template\UTCADSIMPLES.pas' {FTCadSimples},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  UHistoricoCons in '..\ContaPagar\UHistoricoCons.pas' {FHistoricoCons},
  UHistContabil_cl in '..\Contabil\UHistContabil_cl.pas' {DMHistContabil: TDataModule},
  UHistContabilCons in '..\Contabil\UHistContabilCons.pas' {FHistContabilCons},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  USplash in '..\Banco\USplash.pas' {FSplash},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UCupomFiscalCad in '..\Vendas\UCupomFiscalCad.pas' {FCupomFiscalCad},
  UFmOperacao in '..\Frames\UFmOperacao.pas' {FmOperacao: TFrame},
  UOperacaoCons in '..\Compras\UOperacaoCons.pas' {FOperacaoCons},
  UNotaSaidaCad in '..\Vendas\UNotaSaidaCad.pas' {FNotaSaidaCad},
  UReceita_cl in '..\Agricola\UReceita_cl.pas' {DMReceita: TDataModule},
  UReceitaCad in '..\Agricola\UReceitaCad.pas' {FReceitaCad},
  UNotaEntradaParam in '..\Compras\UNotaEntradaParam.pas',
  UFmTributacao in '..\Frames\UFmTributacao.pas' {FmTributacao: TFrame},
  UNotaSaidaParam in '..\Vendas\UNotaSaidaParam.pas',
  UFmProduto in '..\Frames\UFmProduto.pas' {FmProduto: TFrame},
  UPedidoParam in '..\Vendas\UPedidoParam.pas' {FPedidoParam},
  UNotaSaidaCons in '..\Vendas\UNotaSaidaCons.pas' {FNotaSaidaCons},
  UPrazoVencimento_cl in '..\ContaReceber\UPrazoVencimento_cl.pas' {DMPrazoVencimento: TDataModule},
  UPrazoVencimentoCons in '..\ContaReceber\UPrazoVencimentoCons.pas' {FPrazoVencimentoCons},
  UCupomFiscalFechamento in '..\Vendas\UCupomFiscalFechamento.pas' {FCupomFiscalFechamento},
  UCupomFiscalParcelas in '..\Vendas\UCupomFiscalParcelas.pas' {FCupomFiscalParcelas},
  UFmClasse in '..\Frames\UFmClasse.pas' {FmClasse: TFrame},
  UFmLote in '..\Frames\UFmLote.pas' {FmLote: TFrame},
  UFmNota in '..\Frames\UFmNota.pas' {FmNota: TFrame},
  UFmSerie in '..\Frames\UFmSerie.pas' {FmSerie: TFrame},
  UPafNfeParam in '..\Vendas\UPafNfeParam.pas' {FPafNfeParam},
  UTransporte_cl in '..\Compras\UTransporte_cl.pas' {DMTransporte: TDataModule},
  UTipoLoteCons in '..\Estoque\UTipoLoteCons.pas' {FTipoLoteCons},
  UTributacaoCons in '..\Estoque\UTributacaoCons.pas' {FTributacaoCons},
  UPedidoItensCons in '..\Vendas\UPedidoItensCons.pas' {FPedidoItensCons},
  UPedidoCons in '..\Vendas\UPedidoCons.pas' {FPedidoCons},
  UPedido_ConsAberto in '..\Vendas\UPedido_ConsAberto.pas' {FPedido_ConsAberto},
  URelatorioVenda_cl in '..\Vendas\URelatorioVenda_cl.pas' {DMRelatorio_Venda: TDataModule},
  URBloqueto in '..\Vendas\URBloqueto.pas' {FRBloqueto},
  UPraga_cl in '..\Agricola\UPraga_cl.pas' {DMPraga: TDataModule},
  UPragaCons in '..\Agricola\UPragaCons.pas' {FPragaCons},
  UAgronomo_cl in '..\Agricola\UAgronomo_cl.pas' {DMAgronomo: TDataModule},
  UAgronomoCons in '..\Agricola\UAgronomoCons.pas' {FAgronomoCons},
  UCultura_cl in '..\Agricola\UCultura_cl.pas' {DMCultura: TDataModule},
  UCulturaCons in '..\Agricola\UCulturaCons.pas' {FCulturaCons},
  URGuiaAplicacao in '..\Agricola\URGuiaAplicacao.pas' {FRGuiaAplicacao},
  UGuiaAplicacao_cl in '..\Agricola\UGuiaAplicacao_cl.pas' {DMGuiaAplicacao: TDataModule},
  UGuiaAplicacaoCons in '..\Agricola\UGuiaAplicacaoCons.pas' {FGuiaAplicacaoCons},
  UGuiaAplicacaoParam in '..\Agricola\UGuiaAplicacaoParam.pas' {FGuiaAplicacaoParam},
  UGuiaTransito_cl in '..\Vendas\UGuiaTransito_cl.pas' {DMGuiaTransito: TDataModule},
  UNotaRDPrint in '..\Vendas\UNotaRDPrint.pas' {FNotaRDPrint},
  URPedido in '..\Vendas\URPedido.pas' {FRPedido},
  UTipoNota in '..\Vendas\UTipoNota.pas' {FTipoNota},
  URPedidoAssistenciaTecnica in '..\AssitenciaTecnica\URPedidoAssistenciaTecnica.pas' {FRPedidoAssistenciaTecnica},
  URContasReceber_Duplicatas_Ab in '..\ContaReceber\URContasReceber_Duplicatas_Ab.pas' {FRContasReceberDuplicatas_Ab},
  URContasReceber_Duplicatas_MEDIBENS in '..\ContaReceber\URContasReceber_Duplicatas_MEDIBENS.pas' {FRContasReceberDuplicatas_MEDIBENS},
  UPragaCulturaCons in '..\Agricola\UPragaCulturaCons.pas' {FPragaCulturaCons},
  UReceitaConsulta in '..\Agricola\UReceitaConsulta.pas' {FReceitaConsulta},
  URReceituario in '..\Agricola\URReceituario.pas' {FRReceituario},
  URReciboCaixa in '..\Caixa\URReciboCaixa.pas' {FRReciboCaixa},
  URPromissorias in '..\Vendas\URPromissorias.pas' {FRPromissorias},
  UNotaSaida_Confirma in '..\Vendas\UNotaSaida_Confirma.pas' {FNotaSaida_Confirma},
  UNotaEntradaCons in '..\Compras\UNotaEntradaCons.pas' {FNotaEntradaCons},
  URNotasES_Conferencia in '..\Compras\URNotasES_Conferencia.pas' {FRNotasES_Conferencia},
  URNotasES_Relacao in '..\Compras\URNotasES_Relacao.pas' {FRNotasES_Relacao},
  URNotasES_Futura in '..\Compras\URNotasES_Futura.pas' {FRNotasES_Futura},
  URNotasES_MovEstoque in '..\Compras\URNotasES_MovEstoque.pas' {FRNotasES_MovEstoque},
  URNota_Pedido in '..\Vendas\URNota_Pedido.pas' {FRNota_Pedido},
  UFmCultura in '..\Frames\UFmCultura.pas' {FmCultura: TFrame},
  UFmMarca in '..\Frames\UFmMarca.pas' {FmMarca: TFrame},
  UFmHistorico in '..\Frames\UFmHistorico.pas' {FmHistorico: TFrame},
  UMarcaCons in '..\Estoque\UMarcaCons.pas' {FMarca_Cons},
  UMarca_cl in '..\Estoque\UMarca_cl.pas' {DMMarca: TDataModule},
  URNota_Comissao in '..\Vendas\URNota_Comissao.pas' {FRNota_Comissao},
  URNota_MapaVenda in '..\Vendas\URNota_MapaVenda.pas' {FRNota_MapaVenda},
  URNota_MapaVendaRes in '..\Vendas\URNota_MapaVendaRes.pas' {FRNota_MapaVendaRes},
  URNota_MovMercadoria in '..\Vendas\URNota_MovMercadoria.pas' {FRNota_MovMercadoria},
  URNota_VendedorPgto in '..\Vendas\URNota_VendedorPgto.pas' {FRNota_VendedorPgto},
  URNota_Classe in '..\Vendas\URNota_Classe.pas' {FRNota_Classe},
  URNota_ClassePgto in '..\Vendas\URNota_ClassePgto.pas' {FRNota_ClassePgto},
  URNota_ClienteSemCompra in '..\Vendas\URNota_ClienteSemCompra.pas' {FRNota_ClienteSemCompra},
  URNota_EntradaSaida in '..\Vendas\URNota_EntradaSaida.pas' {FRNota_EntradaSaida},
  URNota_Operacao in '..\Vendas\URNota_Operacao.pas' {FRNota_Operacao},
  URNota_TipoDocumento in '..\Vendas\URNota_TipoDocumento.pas' {FRNota_TipoDocumento},
  URNota_ComissaoCliente in '..\Vendas\URNota_ComissaoCliente.pas' {FRNota_ComissaoCliente},
  URNota_PrazoVenda in '..\Vendas\URNota_PrazoVenda.pas' {FRNota_PrazoVenda},
  URNota_Secretaria in '..\Vendas\URNota_Secretaria.pas' {FRNota_Secretaria},
  URNota_Secretaria2 in '..\Vendas\URNota_Secretaria2.pas' {FRNota_Secretaria2},
  URNota_VendedorCMedio2 in '..\Vendas\URNota_VendedorCMedio2.pas' {FRNota_VendedorCMedio2},
  URNota_VendedorCMedioMes in '..\Vendas\URNota_VendedorCMedioMes.pas' {FRNota_VendedorCMedioMes},
  UNota_ContaCorrente in '..\Vendas\UNota_ContaCorrente.pas' {FNota_ContaCorrente},
  URNota_Claspar in '..\Vendas\URNota_Claspar.pas' {FRNota_Claspar},
  URNota_ContaCorrente in '..\Vendas\URNota_ContaCorrente.pas' {FRNota_ContaCorrente},
  URNota_Inadimplencia in '..\Vendas\URNota_Inadimplencia.pas' {FRNota_Inadimplencia},
  URNota_QuotaVend in '..\Vendas\URNota_QuotaVend.pas' {FRNota_QuotaVend},
  URNota_QuotaVend3 in '..\Vendas\URNota_QuotaVend3.pas' {FRNota_QuotaVend3},
  UConhecimentoCons in '..\Conhecimento\UConhecimentoCons.pas' {FConhecimentoCons},
  URVendedorClasse in '..\Vendas\URVendedorClasse.pas' {FRVendedorClasse},
  URContaCorrente2 in '..\Vendas\URContaCorrente2.pas' {FRContaCorrente2},
  URNota_ComCheque in '..\Vendas\URNota_ComCheque.pas' {FrNota_ComCheque},
  URMaioresClientes in '..\Vendas\URMaioresClientes.pas' {FrMaioresClientes},
  URMaioresClientesVend in '..\Vendas\URMaioresClientesVend.pas' {FRMaioresClientesVend},
  URNota_ClassePgtoVend in '..\Vendas\URNota_ClassePgtoVend.pas' {FRNota_ClassePgtoVend},
  URNota_VendaFutura in '..\Vendas\URNota_VendaFutura.pas' {FRNota_VendaFutura},
  URResumoCliente in '..\Vendas\URResumoCliente.pas' {FrResumoCliente},
  URTitulos in '..\Vendas\URTitulos.pas' {FrTitulos},
  UNotaSaidaVendasVendedor in '..\Vendas\UNotaSaidaVendasVendedor.pas' {FRVendasPorVendedor},
  URClienteComCompra in '..\Vendas\URClienteComCompra.pas' {FRClienteComCompra},
  URNotaVendasVndRegiao in '..\Vendas\URNotaVendasVndRegiao.pas' {FRVendasVndRegiao},
  URNotaVendProdPeriodo in '..\Vendas\URNotaVendProdPeriodo.pas' {FRVendProdPeriodo},
  UrVendaHistorico in '..\Vendas\UrVendaHistorico.pas' {FRVendaHistorico},
  URVendasVendClasse in '..\Vendas\URVendasVendClasse.pas' {FrVendasVendClasse},
  UNotaCorrecao in '..\Vendas\UNotaCorrecao.pas' {FNotaCorrecao},
  URNota_VendedorCMedio in '..\Vendas\URNota_VendedorCMedio.pas' {FRNota_VendedorCMedio},
  URNotaCorrecao in '..\Vendas\URNotaCorrecao.pas' {FRNotaCorrecao},
  URVendaVendedorCliente in '..\Vendas\URVendaVendedorCliente.pas' {FRVendaVendedorCliente},
  UNotaCorrecao_cl in '..\Conhecimento\UNotaCorrecao_cl.pas' {DMNotaCorrecao: TDataModule},
  UOrdemCarregamento_cl in '..\Conhecimento\UOrdemCarregamento_cl.pas' {DMOrdemCarregamento: TDataModule},
  UOrdemCarregamentoCons in '..\Conhecimento\UOrdemCarregamentoCons.pas' {FOrdemCarregamentoCons},
  UQtChegada in '..\Vendas\UQtChegada.pas' {FQtChegada},
  URComprovanteEntrega in '..\Vendas\URComprovanteEntrega.pas' {FRComprovanteEntrega},
  URVendaVendedorClasse in '..\Vendas\URVendaVendedorClasse.pas' {FRVendaVendedorClasse},
  URVendaVendedorResumo in '..\Vendas\URVendaVendedorResumo.pas' {FRVendaVendedorResumo},
  UNotaComprovanteEntrega in '..\Vendas\UNotaComprovanteEntrega.pas' {FNotaComprovanteEntrega},
  URAcompanhamentoVenda in '..\Vendas\URAcompanhamentoVenda.pas' {FRAcompanhamentoVenda},
  URAcompanhaMeta in '..\Vendas\URAcompanhaMeta.pas' {FRAcompanhaMeta},
  URRelacaoNotasRio in '..\Vendas\URRelacaoNotasRio.pas' {FRNotasRio},
  URVendasRamoCliente in '..\Vendas\URVendasRamoCliente.pas' {FRVendasRamoCliente},
  URVendaVendedorClasseSintetico in '..\Vendas\URVendaVendedorClasseSintetico.pas' {FRVendaVendedorClasseSintetico},
  URNota_MapaVenda2 in '..\Vendas\URNota_MapaVenda2.pas' {FRNota_MapaVenda2},
  URNota_MapaVendaRes2 in '..\Vendas\URNota_MapaVendaRes2.pas' {FRNota_MapaVendaRes2},
  URNotaCultura in '..\Vendas\URNotaCultura.pas' {FRNotaCultura},
  URProdutoCultura in '..\Vendas\URProdutoCultura.pas' {FRProdutoCultura},
  URVendaComDesconto in '..\Vendas\URVendaComDesconto.pas' {FrVendaComDesconto},
  URVendedorResumo in '..\Vendas\URVendedorResumo.pas' {FRVendedorResumo},
  UEmbarque_cl in '..\Vendas\UEmbarque_cl.pas' {DMEmbarque: TDataModule},
  UGrafico_cl in '..\Vendas\UGrafico_cl.pas' {DMGrafico: TDataModule},
  UImprimirNota in '..\Vendas\UImprimirNota.pas' {FImprimirNota},
  URMovMercadoria_Sintetico in '..\Vendas\URMovMercadoria_Sintetico.pas' {FRMovMercadoria_Sintetico},
  URReciboComissao2 in '..\Vendas\URReciboComissao2.pas' {FReciboComissao2},
  UGraficoParam in '..\Vendas\UGraficoParam.pas' {FGraficoParam},
  UGraficoVendaVendedor in '..\Vendas\UGraficoVendaVendedor.pas' {FGraficoVendaVendedor},
  URExtratoProdutoAgricola in '..\Vendas\URExtratoProdutoAgricola.pas' {FRExtratoProdutoAgricola},
  URNota_ClasseData in '..\Vendas\URNota_ClasseData.pas' {FRNota_ClasseData},
  URNota_ClasseDataRes in '..\Vendas\URNota_ClasseDataRes.pas' {FRNota_ClasseDataRes},
  UControleTrem_cl in '..\Conhecimento\UControleTrem_cl.pas' {DMControleTrem: TDataModule},
  UControleTremCons in '..\Conhecimento\UControleTremCons.pas' {FControleTremCons},
  UNotaSaidaPosVenda in '..\Vendas\UNotaSaidaPosVenda.pas' {FNotaSaidaPosVenda},
  URHistoricoVendas in '..\Vendas\URHistoricoVendas.pas' {FRHistoricoVendas},
  URNota_VendaFuturaAtendida in '..\Vendas\URNota_VendaFuturaAtendida.pas' {FRNota_VendaFuturaAtendida},
  URPrecoVendido in '..\Vendas\URPrecoVendido.pas' {FRPrecoVendido},
  UTipoConhecimentoCons in '..\Vendas\UTipoConhecimentoCons.pas' {FTipoConhecimentoCons},
  UAlteraCodigoContrato in '..\Vendas\UAlteraCodigoContrato.pas' {FAlteraCodigoContrato},
  UComparaCadastro in '..\Vendas\UComparaCadastro.pas' {FComparaCadastro},
  UFROperacaoProduto in '..\Vendas\UFROperacaoProduto.pas' {FROperacaoProduto},
  UFROperacaoProduto2 in '..\Vendas\UFROperacaoProduto2.pas' {FROperacaoProduto2},
  UFRVendaClienteOP in '..\Vendas\UFRVendaClienteOP.pas' {FRVendaClienteOP},
  UNfEletronicaLoteCons in '..\Vendas\UNfEletronicaLoteCons.pas' {FNfEletronicaLoteCons},
  UNotaConsumidorNome in '..\Vendas\UNotaConsumidorNome.pas' {FNotaConsumidorNome},
  UObrigacaoICMS_cl in '..\Vendas\UObrigacaoICMS_cl.pas' {DMObrigacaoICMS: TDataModule},
  URComissaoFrete in '..\Vendas\URComissaoFrete.pas' {FRComissaoFrete},
  URControleCarga in '..\Vendas\URControleCarga.pas' {FRControleCarga},
  URCurvaABC in '..\Vendas\URCurvaABC.pas' {FRCurvaABC},
  URNotaContaCorrente in '..\Vendas\URNotaContaCorrente.pas' {FRNotaContaCorrente},
  UContrato_Pjuridica_cl in '..\Agricola\UContrato_Pjuridica_cl.pas' {DMContrato_PJuridica: TDataModule},
  UContrato_PJuridicaCons in '..\Agricola\UContrato_PJuridicaCons.pas' {FContrato_PJuridicaCons},
  UFmUsuario in '..\Frames\UFmUsuario.pas' {FmUsuario: TFrame},
  UNotaUltimasVendas in '..\Vendas\UNotaUltimasVendas.pas' {FNotaUltimasVendas},
  UReciboComissao in '..\ContaReceber\UReciboComissao.pas' {FReciboComissao},
  UPromissoria in '..\Vendas\UPromissoria.pas',
  UPedidoCompostoCons in '..\..\debona\Debona\UPedidoCompostoCons.pas' {FPedidoCompostoCons},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UMoeda_cl in '..\cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  USpedValidacao in '..\Compras\USpedValidacao.pas',
  UNotaImpressao in '..\Vendas\UNotaImpressao.pas',
  UImpFiscal in '..\Vendas\UImpFiscal.pas',
  URCupomFiscal in 'URCupomFiscal.pas' {FRCupomFiscal},
  UCupomFiscalParam in '..\Vendas\UCupomFiscalParam.pas' {FCupomFiscalParam},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  UCartaCorrecaoEletronica in '..\MyLib\UCartaCorrecaoEletronica.pas' {FCartaCorrecaoEletronica},
  UCartaCorrecaoEletronica_cl in '..\MyLib\UCartaCorrecaoEletronica_cl.pas' {DMCartaCorrecaoEletronica: TDataModule},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UImposto_cl in '..\Cadastro\UImposto_cl.pas' {DMImposto: TDataModule},
  UScpc_cl in '..\Cadastro\UScpc_cl.pas' {DMScpc: TDataModule},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UImpostoCons in '..\Cadastro\UImpostoCons.pas' {FImpostoCons},
  UMdfeLote_cl in '..\Conhecimento\UMdfeLote_cl.pas' {DMMdfeLote: TDataModule},
  UContasReceberBaixa in '..\ContaReceber\UContasReceberBaixa.pas' {FContasReceberBaixa},
  UContasReceberVoltaBaixa in '..\ContaReceber\UContasReceberVoltaBaixa.pas' {FContasReceberVoltaBaixa},
  URReciboLote in '..\ContaReceber\URReciboLote.pas' {FRReciboLote},
  UCaixa_cl in '..\ContaPagar\UCaixa_cl.pas' {DMCaixa: TDataModule},
  UContasReceberJuro in '..\ContaReceber\UContasReceberJuro.pas' {FContaReceberJuro},
  UContasPagarCons in '..\ContaPagar\UContasPagarCons.pas' {FContasPagarCons},
  URRecibo in '..\ContaPagar\URRecibo.pas' {FRRecibo},
  UEmiteRecibo in '..\ContaPagar\UEmiteRecibo.pas' {FEmiteRecibo},
  UNotaEntradaConsulta in '..\ContaReceber\UNotaEntradaConsulta.pas' {FNotaEntradaConsulta},
  UContasReceber_Rel_cl in '..\ContaReceber\UContasReceber_Rel_cl.pas' {DMContasReceber_Rel: TDataModule},
  UAdiantamento_cl in '..\Bancos\UAdiantamento_cl.pas' {DMAdiantamento: TDataModule},
  UCaixaCons in '..\Caixa\UCaixaCons.pas' {FCaixaCons},
  UBancoMovCons in '..\Bancos\UBancoMovCons.pas' {FBancoMovCons},
  UAdiantamentoCons in '..\Bancos\UAdiantamentoCons.pas' {FAdiantamentoCons},
  UScpcCons in '..\Cadastro\UScpcCons.pas' {FScpcCons},
  UTipoCadastro_cl in '..\cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '..\cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMImpressoraFiscal, DMImpressoraFiscal);
  Application.CreateForm(TFMenuPafEcf, FMenuPafEcf);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TDMObraContrato, DMObraContrato);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMNfEletronicaLote, DMNfEletronicaLote);
  Application.CreateForm(TDMConhecimento, DMConhecimento);
  Application.CreateForm(TDMCteLote, DMCteLote);
  Application.CreateForm(TDMNfe, DMNfe);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMTipoLote, DMTipoLote);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMTEF, DMTEF);
  Application.CreateForm(TDMObra, DMObra);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TDMHistContabil, DMHistContabil);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TFSplash, FSplash);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMReceita, DMReceita);
  Application.CreateForm(TDMPrazoVencimento, DMPrazoVencimento);
  Application.CreateForm(TDMTransporte, DMTransporte);
  Application.CreateForm(TDMRelatorio_Venda, DMRelatorio_Venda);
  Application.CreateForm(TDMPraga, DMPraga);
  Application.CreateForm(TDMAgronomo, DMAgronomo);
  Application.CreateForm(TDMCultura, DMCultura);
  Application.CreateForm(TDMGuiaAplicacao, DMGuiaAplicacao);
  Application.CreateForm(TDMGuiaTransito, DMGuiaTransito);
  Application.CreateForm(TDMMarca, DMMarca);
  Application.CreateForm(TDMNotaCorrecao, DMNotaCorrecao);
  Application.CreateForm(TDMOrdemCarregamento, DMOrdemCarregamento);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TDMGrafico, DMGrafico);
  Application.CreateForm(TDMControleTrem, DMControleTrem);
  Application.CreateForm(TDMObrigacaoICMS, DMObrigacaoICMS);
  Application.CreateForm(TDMContrato_PJuridica, DMContrato_PJuridica);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMCartaCorrecaoEletronica, DMCartaCorrecaoEletronica);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMImposto, DMImposto);
  Application.CreateForm(TDMScpc, DMScpc);
  Application.CreateForm(TDMMdfeLote, DMMdfeLote);
  Application.CreateForm(TDMCaixa, DMCaixa);
  Application.CreateForm(TDMContasReceber_Rel, DMContasReceber_Rel);
  Application.CreateForm(TDMAdiantamento, DMAdiantamento);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TFTipoCadastroCons, FTipoCadastroCons);
  Application.Run;
end.
