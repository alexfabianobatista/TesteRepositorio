program PjVenda;

uses
  Forms,
  UTMenuPrincipal in '..\TEMPLATE\UTMenuPrincipal.pas' {FTMenuPrincipal},
  UTConsulta in '..\TEMPLATE\UTConsulta.pas' {FTConsulta},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UMenuVenda in 'UMenuVenda.pas' {FMenuVenda},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  ULogin in '..\Seguranca\ULogin.pas' {FLogin},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTrocaSenha in '..\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UParamCadFuncao in '..\Seguranca\UParamCadFuncao.pas' {FParamCadFuncao},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UPedido_cl in 'UPedido_cl.pas' {DMPedido: TDataModule},
  UPedidoCad in 'UPedidoCad.pas' {FPedidoCad},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UPedidoCons in 'UPedidoCons.pas' {FPedidoCons},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UOperacaoCons in '..\Compras\UOperacaoCons.pas' {FOperacaoCons},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UTipoLote_cl in '..\Estoque\UTipoLote_cl.pas' {DMTipoLote: TDataModule},
  UTipoLoteCons in '..\Estoque\UTipoLoteCons.pas' {FTipoLoteCons},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UTributacaoCons in '..\Estoque\UTributacaoCons.pas' {FTributacaoCons},
  UPedidoParam in 'UPedidoParam.pas' {FPedidoParam},
  URPedido_Aberto in 'URPedido_Aberto.pas' {FRPedido_Aberto},
  UNotaSaida_cl in 'UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UNotaSaidaCad in 'UNotaSaidaCad.pas' {FNotaSaidaCad},
  UTransporte_cl in '..\Compras\UTransporte_cl.pas' {DMTransporte: TDataModule},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  UNotaSaidaCons in 'UNotaSaidaCons.pas' {FNotaSaidaCons},
  UPedido_ConsAberto in 'UPedido_ConsAberto.pas' {FPedido_ConsAberto},
  UNotaSaida_Confirma in 'UNotaSaida_Confirma.pas' {FNotaSaida_Confirma},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  UNotaSaida_Cancela in 'UNotaSaida_Cancela.pas' {FNotaSaida_Cancela},
  UMotivoCons in '..\Cadastro\UMotivoCons.pas' {FMotivoCons},
  UMotivo_cl in '..\Cadastro\UMotivo_cl.pas' {DMMotivo: TDataModule},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  UNotaEntradaParam in '..\Compras\UNotaEntradaParam.pas' {FNotaEntradaParam},
  URNotasES_Relacao in '..\Compras\URNotasES_Relacao.pas' {FRNotasES_Relacao},
  URNotasES_Conferencia in '..\Compras\URNotasES_Conferencia.pas' {FRNotasES_Conferencia},
  URNotasES_Futura in '..\Compras\URNotasES_Futura.pas' {FRNotasES_Futura},
  URNotasES_MovEstoque in '..\Compras\URNotasES_MovEstoque.pas' {FRNotasES_MovEstoque},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  URBloqueto in 'URBloqueto.pas' {FRBloqueto},
  UTipoProdCons in '..\Estoque\UTipoProdCons.pas' {FTipoProdCons},
  URNota_Pedido in 'URNota_Pedido.pas' {FRNota_Pedido},
  UNotaSaidaParam in 'UNotaSaidaParam.pas' {FNotaSaidaParam},
  URNota_MapaVendaRes in 'URNota_MapaVendaRes.pas' {FRNota_MapaVendaRes},
  URNota_MapaVenda in 'URNota_MapaVenda.pas' {FRNota_MapaVenda},
  URNota_Comissao in 'URNota_Comissao.pas' {FRNota_Comissao},
  URNota_VendedorPgto in 'URNota_VendedorPgto.pas' {FRNota_VendedorPgto},
  URNota_MovMercadoria in 'URNota_MovMercadoria.pas' {FRNota_MovMercadoria},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  URNota_ClienteSemCompra in 'URNota_ClienteSemCompra.pas' {FRNota_ClienteSemCompra},
  URNota_Operacao in 'URNota_Operacao.pas' {FRNota_Operacao},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  URNota_TipoDocumento in 'URNota_TipoDocumento.pas' {FRNota_TipoDocumento},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  URNota_Classe in 'URNota_Classe.pas' {FRNota_Classe},
  URNota_ClassePgto in 'URNota_ClassePgto.pas' {FRNota_ClassePgto},
  URNota_EntradaSaida in 'URNota_EntradaSaida.pas' {FRNota_EntradaSaida},
  URNota_ComissaoCliente in 'URNota_ComissaoCliente.pas' {FRNota_ComissaoCliente},
  URNota_PrazoVenda in 'URNota_PrazoVenda.pas' {FRNota_PrazoVenda},
  URNota_VendedorCMedio2 in 'URNota_VendedorCMedio2.pas' {FRNota_VendedorCMedio2},
  URNota_VendedorCMedio in 'URNota_VendedorCMedio.pas' {FRNota_VendedorCMedio},
  URNota_Secretaria in 'URNota_Secretaria.pas' {FRNota_Secretaria},
  URNota_QuotaVend in 'URNota_QuotaVend.pas' {FRNota_QuotaVend},
  URNota_QuotaVend3 in 'URNota_QuotaVend3.pas' {FRNota_QuotaVend3},
  URNota_Inadimplencia in 'URNota_Inadimplencia.pas' {FRNota_Inadimplencia},
  URNota_ContaCorrente in 'URNota_ContaCorrente.pas' {FRNota_ContaCorrente},
  UNotaConsumidor in 'UNotaConsumidor.pas' {FNotaConsumidor},
  UNotaConsum_Confirma in 'UNotaConsum_Confirma.pas' {FNotaConsum_Confirma},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DmRomaneioAgricola: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  URPedido_Produto in 'URPedido_Produto.pas' {FRPedido_Produto},
  URNota_Claspar in 'URNota_Claspar.pas' {FRNota_Claspar},
  UNota_ContaCorrente in 'UNota_ContaCorrente.pas' {FNota_ContaCorrente},
  USplash in '..\Banco\USplash.pas' {FSplash},
  UEmbarque_cl in 'UEmbarque_cl.pas' {DMEmbarque: TDataModule},
  UEmbarqueCad in 'UEmbarqueCad.pas' {FEmbarqueCad},
  UEmbarqueCons in 'UEmbarqueCons.pas' {FEmbarqueCons},
  UEmbarqueParam in 'UEmbarqueParam.pas' {FEmbarqueParam},
  UREmbarque3 in 'UREmbarque3.pas' {FREmbarque3},
  UREmbarque in 'UREmbarque.pas' {FREmbarque},
  UREmbarque2 in 'UREmbarque2.pas' {FREmbarque2},
  UREmbarque_Acerto in 'UREmbarque_Acerto.pas' {FREmbarque_Acerto},
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  UGuiaAplicacaoParam in '..\Agricola\UGuiaAplicacaoParam.pas' {FGuiaAplicacaoParam},
  UPraga_cl in '..\Agricola\UPraga_cl.pas' {DMPraga: TDataModule},
  UPragaCons in '..\Agricola\UPragaCons.pas' {FPragaCons},
  UAgronomo_cl in '..\Agricola\UAgronomo_cl.pas' {DMAgronomo: TDataModule},
  UCultura_cl in '..\Agricola\UCultura_cl.pas' {DMCultura: TDataModule},
  UAgronomoCons in '..\Agricola\UAgronomoCons.pas' {FAgronomoCons},
  UCulturaCons in '..\Agricola\UCulturaCons.pas' {FCulturaCons},
  URGuiaAplicacao in '..\Agricola\URGuiaAplicacao.pas' {FRGuiaAplicacao},
  UGuiaAplicacao_cl in '..\Agricola\UGuiaAplicacao_cl.pas' {DMGuiaAplicacao: TDataModule},
  UGuiaAplicacaoCons in '..\Agricola\UGuiaAplicacaoCons.pas' {FGuiaAplicacaoCons},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  UNotaImpressao in 'UNotaImpressao.pas',
  UImpressoraFiscal in 'UImpressoraFiscal.pas' {FImpressoraFiscal},
  URPedido_Espelho in 'URPedido_Espelho.pas' {FRPedido_Espelho},
  UConhecimentoCons in '..\Compras\UConhecimentoCons.pas' {FConhecimentoCons},
  URVendedorClasse in 'URVendedorClasse.pas' {FRVendedorClasse},
  UPedidoCancela in 'UPedidoCancela.pas' {FPedidoCancela},
  URPedido_Cancelado in 'URPedido_Cancelado.pas' {FRPedido_Cancelado},
  URContaCorrente2 in 'URContaCorrente2.pas' {FRContaCorrente2},
  URReciboComissao in 'URReciboComissao.pas' {FReciboComissao},
  UPedidoBaixaCons in 'UPedidoBaixaCons.pas' {FPedidoBaixaCons},
  UREmbarquePedNf in 'UREmbarquePedNf.pas' {FrEmbarque_Ped_Nf},
  URNota_ComCheque in 'URNota_ComCheque.pas' {FrNota_ComCheque},
  URMaioresClientes in 'URMaioresClientes.pas' {FrMaioresClientes},
  URMaioresClientesVend in 'URMaioresClientesVend.pas' {FRMaioresClientesVend},
  URNota_ClassePgtoVend in 'URNota_ClassePgtoVend.pas' {FRNota_ClassePgtoVend},
  ULotesClaspar in 'ULotesClaspar.pas',
  ULiberaFrete in 'ULiberaFrete.pas' {FLiberaFrete},
  URSeguroCargas in 'URSeguroCargas.pas' {FRSeguroCargas},
  UREmbarquePagto in 'UREmbarquePagto.pas' {FrEmbarquePagto},
  URResumoCliente in 'URResumoCliente.pas' {FrResumoCliente},
  UrEmbarquePedNf1 in 'UrEmbarquePedNf1.pas' {FREmbarque_Ped_Nf1},
  UClassCadastroCons in '..\Cadastro\UClassCadastroCons.pas' {FClassCadastroCons},
  UDesdobramentoCad in 'UDesdobramentoCad.pas' {FDesdobramentoCad},
  UDesdobramento_ClasparCons in 'UDesdobramento_ClasparCons.pas' {FDesdobramento_ClasparCons},
  UREmbarque_Rota in 'UREmbarque_Rota.pas' {FREmbarque_Rota},
  UHistorico_cl in '..\ContaPagar\UHistorico_cl.pas' {DMHistorico: TDataModule},
  URNota_VendaFutura in 'URNota_VendaFutura.pas' {FRNota_VendaFutura},
  UNotaTransfFilialCad in 'UNotaTransfFilialCad.pas' {FNotaTransfFilialCad},
  UGeraNFTransEntrada in 'UGeraNFTransEntrada.pas' {FGeraNFTransEntrada},
  URRomaneioNotas in '..\Agricola\URRomaneioNotas.pas' {FrRomNotaParam},
  UrVendaHistorico in 'UrVendaHistorico.pas' {FRVendaHistorico},
  UNotaSaidaVendasVendedor in 'UNotaSaidaVendasVendedor.pas' {FRVendasPorVendedor},
  ULimpezaVendas in 'ULimpezaVendas.pas' {FLimpezaVendas},
  ULimpeza_cl in 'ULimpeza_cl.pas' {DMLimpeza: TDataModule},
  URNotaVendasVndRegiao in 'URNotaVendasVndRegiao.pas' {FRVendasVndRegiao},
  URegiao_cl in '..\Cadastro\URegiao_cl.pas' {DMRegiao: TDataModule},
  URegiaoCons in '..\Cadastro\URegiaoCons.pas' {FRegiaoCons},
  URNotaVendProdPeriodo in 'URNotaVendProdPeriodo.pas' {FRVendProdPeriodo},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  UHistoricoCons in '..\ContaPagar\UHistoricoCons.pas' {FHistoricoCons},
  UFRPedidoPeriodo in 'UFRPedidoPeriodo.pas' {FRPedido_Periodo},
  UNotaConsumidorNome in 'UNotaConsumidorNome.pas' {FNotaConsumidorNome},
  URPedidoAcomp in 'URPedidoAcomp.pas' {FRPedido_Acomp},
  URPedido_Preco_Medio in 'URPedido_Preco_Medio.pas' {FRPedido_Preco_Medio},
  UContasReceber_cl in '..\ContaReceber\UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  URContasReceber_Duplicatas_Ab in '..\ContaReceber\URContasReceber_Duplicatas_Ab.pas' {FRContasReceberDuplicatas_Ab},
  URPedAberto_Venc in 'URPedAberto_Venc.pas' {FRPedAberto_Venc},
  UReceita_cl in '..\Agricola\UReceita_cl.pas' {DMReceita: TDataModule},
  UReceitaCad in '..\Agricola\UReceitaCad.pas' {FReceitaCad},
  UPragaCulturaCons in '..\Agricola\UPragaCulturaCons.pas' {FPragaCulturaCons},
  UContabilidadeParam in 'UContabilidadeParam.pas' {FContabilidadeParam},
  UContabiliza_cl in 'UContabiliza_cl.pas' {DMContabiliza: TDataModule},
  URTitulos in 'URTitulos.pas' {FrTitulos},
  URVendasVendClasse in 'URVendasVendClasse.pas' {FrVendasVendClasse},
  UVenda_Regiao in 'UVenda_Regiao.pas' {FVenda_regiao},
  UVenda_regiaoCons in 'UVenda_regiaoCons.pas' {FVenda_regiaoCons},
  URVenda_regiao in 'URVenda_regiao.pas' {FRVenda_regiao},
  URelatorioVenda_cl in 'URelatorioVenda_cl.pas' {DMRelatorio_Venda: TDataModule},
  URPedidoEstoque in 'URPedidoEstoque.pas' {FrPedidoEstoque},
  URClienteComCompra in 'URClienteComCompra.pas' {FRClienteComCompra},
  URPedido_BaseTroca in 'URPedido_BaseTroca.pas' {FRPedido_BaseTroca},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  UConhecimentoFrete_cl in '..\Conhecimento\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  URNotaContaCorrente in 'URNotaContaCorrente.pas' {FRNotaContaCorrente},
  USenha in 'USenha.pas' {FSenha},
  URPedidosComNota in 'URPedidosComNota.pas' {FRPedidoComNota},
  UREmbarqueImposto in 'UREmbarqueImposto.pas' {FREmbarqueImposto},
  UPrazoVencimento_cl in '..\ContaReceber\UPrazoVencimento_cl.pas' {DMPrazoVencimento: TDataModule},
  UPrazoVencimentoCons in '..\ContaReceber\UPrazoVencimentoCons.pas' {FPrazoVencimentoCons},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UNotaCorrecao in 'UNotaCorrecao.pas' {FNotaCorrecao},
  URNotaCorrecao in 'URNotaCorrecao.pas' {FRNotaCorrecao},
  UEmbarqueNota in 'UEmbarqueNota.pas' {FEmbarqueNota},
  UNotaCorrecao_cl in '..\Conhecimento\UNotaCorrecao_cl.pas' {DMNotaCorrecao: TDataModule},
  URSeguroCargas1 in 'URSeguroCargas1.pas' {FRSeguroCargas1},
  URVendaVendedorCliente in 'URVendaVendedorCliente.pas' {FRVendaVendedorCliente},
  UOrdemCarregamento_cl in '..\Conhecimento\UOrdemCarregamento_cl.pas' {DMOrdemCarregamento: TDataModule},
  UOrdemCarregamentoCons in '..\Conhecimento\UOrdemCarregamentoCons.pas' {FOrdemCarregamentoCons},
  URomaneioCons in '..\Agricola\URomaneioCons.pas' {FRomaneioCons},
  UNotaEntradaCons in '..\Compras\UNotaEntradaCons.pas' {FNotaEntradaCons},
  UREmbarqueCarga in 'UREmbarqueCarga.pas' {FREmbarqueCarga},
  UEstadoCons in '..\Cadastro\UEstadoCons.pas' {FEstadoCons},
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  URVendaVendedorClasse in 'URVendaVendedorClasse.pas' {FRVendaVendedorClasse},
  UQtChegada in 'UQtChegada.pas' {FQtChegada},
  UNotaComprovanteEntrega in 'UNotaComprovanteEntrega.pas' {FNotaComprovanteEntrega},
  URComprovanteEntrega in 'URComprovanteEntrega.pas' {FRComprovanteEntrega},
  UrEmbarquePedido in 'UrEmbarquePedido.pas' {FrEmbarquePedido},
  URPedidoValor in 'URPedidoValor.pas' {FRPedidoValor},
  UREmbarqueBaixado in 'UREmbarqueBaixado.pas' {FREmbarqueBaixado},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UCidadeCons in '..\Cadastro\UCidadeCons.pas' {FCidadeCons},
  UCidadeCad in '..\Cadastro\UCidadeCad.pas' {FCidadeCad},
  URCidade_Cidade in '..\Cadastro\URCidade_Cidade.pas' {FRCidade_Cidade},
  UCadastroParam in '..\Cadastro\UCadastroParam.pas' {FCadastroParam},
  URamoCons in '..\Cadastro\URamoCons.pas' {FRamoCons},
  URamo_cl in '..\Cadastro\URamo_cl.pas' {DMRamo: TDataModule},
  UPracaCons in '..\Cadastro\UPracaCons.pas' {FPracaCons},
  UPraca_cl in '..\Cadastro\UPraca_cl.pas' {DMPraca: TDataModule},
  URPedidoCusto in 'URPedidoCusto.pas' {FRPedidoCusto},
  URProdutoEmbarcado in 'URProdutoEmbarcado.pas' {FRProdutoEmbarcado},
  URPedidoComissao in 'URPedidoComissao.pas' {FRPedidoComissao},
  URAcompanhaMeta in 'URAcompanhaMeta.pas' {FRAcompanhaMeta},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URTotalVenda in 'URTotalVenda.pas' {FRTotalVenda},
  UBloqueto in '..\ContaReceber\UBloqueto.pas',
  URBoletaBB in '..\ContaReceber\URBoletaBB.pas',
  UnitBoleta in '..\MyLib\UNITBOLETA.pas' {Boleta},
  URBloqueto_Bradesco in '..\ContaReceber\URBloqueto_Bradesco.pas' {FRBloqueto_Bradesco},
  URBloqueto_HSBC in '..\ContaReceber\URBloqueto_HSBC.pas' {FRBloqueto_HSBC},
  URBloqueto_Rural in '..\ContaReceber\URBloqueto_Rural.pas' {FRBloqueto_Rural},
  UFRBloqueto_Itau in '..\ContaReceber\UFRBloqueto_Itau.pas' {FRBloqueto_Itau},
  URBloqueto_Sicredi in '..\ContaReceber\URBloqueto_Sicredi.pas' {FRBloqueto_Sicredi},
  URBloqueto_Santander in '..\ContaReceber\URBloqueto_Santander.pas',
  URBloqueto_Unibanco in '..\ContaReceber\URBloqueto_Unibanco.pas' {FRBloqueto_Unibanco},
  URBloquetoSafra in '..\ContaReceber\URBloquetoSafra.pas' {FRBloqueto_Safra},
  UFmFilial in '..\Frames\UFmFilial.pas' {FmFilial: TFrame},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  URBloqueto_CEF in '..\ContaReceber\URBloqueto_CEF.pas' {FRBloqueto_CEF},
  URBloqueto_Sudameris in '..\ContaReceber\URBloqueto_Sudameris.pas' {FRBloqueto_Sudameris},
  URBloqEmitBanco in '..\ContaReceber\URBloqEmitBanco.pas' {FRBloqEmitBanco},
  UReceitaConsulta in '..\Agricola\UReceitaConsulta.pas' {FReceitaConsulta},
  UFmOperacao in '..\Frames\UFmOperacao.pas' {FmOperacao: TFrame},
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  UFmLote in '..\Frames\UFmLote.pas' {FmLote: TFrame},
  UFmProduto in '..\Frames\UFmProduto.pas' {FmProduto: TFrame},
  UFmSerie in '..\Frames\UFmSerie.pas' {FmSerie: TFrame},
  UFmTributacao in '..\Frames\UFmTributacao.pas' {FmTributacao: TFrame},
  UFmClasse in '..\Frames\UFmClasse.pas' {FmClasse: TFrame},
  UBancoAgenciaRel_cl in '..\Bancos\UBancoAgenciaRel_cl.pas' {DMBancoAgenciaRel: TDataModule},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword},
  UContasReceberParam in '..\ContaReceber\UContasReceberParam.pas' {FContasReceberParam},
  UFmContrato in '..\Frames\UFmContrato.pas' {FmContrato: TFrame},
  UFmFinalidade in '..\Frames\UFmFinalidade.pas' {FmFinalidade: TFrame},
  UContratoVenda_Cons in '..\Agricola\UContratoVenda_Cons.pas' {FContrato_VendaCons},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons},
  UContasReceberCons in '..\ContaReceber\UContasReceberCons.pas' {FContasReceberCons},
  UObraContrato_Cons in '..\Obra\UObraContrato_Cons.pas' {FObraContrato_Cons},
  UObraContrato_cl in '..\Obra\UObraContrato_cl.pas' {DMObraContrato: TDataModule},
  UObra_cl in '..\Obra\UObra_cl.pas' {DMObra: TDataModule},
  UObraCons in '..\Obra\UObraCons.pas' {FObraCons},
  UFmContaCorrente in '..\Frames\UFmContaCorrente.pas' {FmContaCorrente: TFrame},
  UMensagemUsuario_cl in '..\Cadastro\UMensagemUsuario_cl.pas' {DmMensagemUsuario: TDataModule},
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UFmBanco in '..\Frames\UFmBanco.pas' {FMBanco: TFrame},
  UNfEletronicaLote_cl in '..\Vendas\UNfEletronicaLote_cl.pas' {DMNfEletronicaLote: TDataModule},
  UNFeParam in '..\MonitorNfe\UNFeParam.pas' {FNFeParam},
  UNfe_cl in '..\MonitorNfe\UNfe_cl.pas' {DMNfe: TDataModule},
  UFmNfeLote in '..\Frames\UFmNfeLote.pas' {FmNfeLote: TFrame},
  URReceituario in '..\Agricola\URReceituario.pas' {FRReceituario},
  UNotaItensCons in '..\ContaReceber\UNotaItensCons.pas' {FNotaItensCons},
  UVendaPerdidaCad in '..\Estoque\UVendaPerdidaCad.pas' {FVendaPerdidaCad},
  UImagemAtalho in '..\Template\UImagemAtalho.pas',
  UProdutos_UltimasCompras in '..\Estoque\UProdutos_UltimasCompras.pas' {FProdutos_UltimasCompras},
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  UEnviaEmail in '..\Agricola\UEnviaEmail.pas' {FEnviaEmail},
  UFmObra in '..\Frames\UFmObra.pas' {FmObra: TFrame},
  UCteLote_cl in '..\Conhecimento\UCteLote_cl.pas' {DMCteLote: TDataModule},
  UConhecimento_cl in '..\Conhecimento\UConhecimento_cl.pas' {DMConhecimento: TDataModule},
  USpedValidacao in '..\Compras\USpedValidacao.pas',
  URBloqueto_Sicoob in '..\ContaReceber\URBloqueto_Sicoob.pas' {FRBloqueto_Sicoob},
  UFmTitulo in '..\Frames\UFmTitulo.pas' {FmTitulo: TFrame},
  UProdutos_UltimasVendas in '..\Estoque\UProdutos_UltimasVendas.pas' {FProdutos_UltimasVendas},
  UImpressoraFiscal_cl in '..\Vendas\UImpressoraFiscal_cl.pas' {DMImpressoraFiscal: TDataModule},
  UMdfeLote_cl in '..\Conhecimento\UMdfeLote_cl.pas' {DMMdfeLote: TDataModule},
  URBloqueto_CEF_SIGCB in '..\ContaReceber\URBloqueto_CEF_SIGCB.pas' {FRBloqueto_CEF_SIGCB},
  UMensReceitaCons in '..\Agricola\UMensReceitaCons.pas' {FMensReceitaCons},
  UMensReceita_cl in '..\Agricola\UMensReceita_cl.pas' {DMMensReceita: TDataModule},
  UDevolucaoTroca_cl in '..\Vendas\UDevolucaoTroca_cl.pas' {DMDevolucaoTroca: TDataModule},
  UFmMarca in '..\Frames\UFmMarca.pas' {FmMarca: TFrame},
  URBoletaBB_SIC in '..\ContaReceber\URBoletaBB_SIC.pas' {FRBoletaBB_SIC},
  UPragaCulturaSelect in '..\Agricola\UPragaCulturaSelect.pas' {FPragaCulturaSelect},
  UMarca_cl in '..\Estoque\UMarca_cl.pas' {DMMarca: TDataModule},
  UMarcaCons in '..\Estoque\UMarcaCons.pas' {FMarca_Cons},
  UBibVenda in 'UBibVenda.pas',
  UFmAgronomo in '..\Frames\UFmAgronomo.pas' {FmAgronomo: TFrame},
  UReceitaParam in '..\Agricola\UReceitaParam.pas' {FReceitaParam},
  URReceitaRel in '..\Agricola\URReceitaRel.pas' {FRReceitaRel},
  URTermoReconhecimentoRisco in '..\Agricola\URTermoReconhecimentoRisco.pas' {FRTermoReconhecimentoRisco},
  UAguarde in '..\Contabil\UAguarde.pas' {FAguarde},
  UHistContabil_cl in '..\Contabil\UHistContabil_cl.pas' {DMHistContabil: TDataModule},
  UHistContabilCons in '..\Contabil\UHistContabilCons.pas' {FHistContabilCons},
  URTermoCienciaResponsabilidade in '..\Agricola\URTermoCienciaResponsabilidade.pas' {FRTermoCienciaResponsabilidade};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.HelpFile := 'F:\Executaveis\Manual\Vendas.hlp';
  Application.Title := 'Sistema Vendas';
  Application.CreateForm(TFMenuVenda, FMenuVenda);
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMTipoLote, DMTipoLote);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMTransporte, DMTransporte);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TDmRomaneioAgricola, DmRomaneioAgricola);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMPraga, DMPraga);
  Application.CreateForm(TDMAgronomo, DMAgronomo);
  Application.CreateForm(TDMCultura, DMCultura);
  Application.CreateForm(TDMGuiaAplicacao, DMGuiaAplicacao);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMLimpeza, DMLimpeza);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDMReceita, DMReceita);
  Application.CreateForm(TDMContabiliza, DMContabiliza);
  Application.CreateForm(TDMRelatorio_Venda, DMRelatorio_Venda);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMPrazoVencimento, DMPrazoVencimento);
  Application.CreateForm(TDMNotaCorrecao, DMNotaCorrecao);
  Application.CreateForm(TDMOrdemCarregamento, DMOrdemCarregamento);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TDMBancoAgenciaRel, DMBancoAgenciaRel);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TDMObraContrato, DMObraContrato);
  Application.CreateForm(TDMObra, DMObra);
  Application.CreateForm(TDmMensagemUsuario, DmMensagemUsuario);
  Application.CreateForm(TDMNfEletronicaLote, DMNfEletronicaLote);
  Application.CreateForm(TDMNfe, DMNfe);
  Application.CreateForm(TDMCteLote, DMCteLote);
  Application.CreateForm(TDMConhecimento, DMConhecimento);
  Application.CreateForm(TDMImpressoraFiscal, DMImpressoraFiscal);
  Application.CreateForm(TDMMdfeLote, DMMdfeLote);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TFMensReceitaCons, FMensReceitaCons);
  Application.CreateForm(TDMMensReceita, DMMensReceita);
  Application.CreateForm(TDMDevolucaoTroca, DMDevolucaoTroca);
  Application.CreateForm(TFRBoletaBB_SIC, FRBoletaBB_SIC);
  Application.CreateForm(TFPragaCulturaSelect, FPragaCulturaSelect);
  Application.CreateForm(TDMMarca, DMMarca);
  Application.CreateForm(TFMarca_Cons, FMarca_Cons);
  Application.CreateForm(TFReceitaParam, FReceitaParam);
  Application.CreateForm(TFRReceitaRel, FRReceitaRel);
  Application.CreateForm(TFRTermoReconhecimentoRisco, FRTermoReconhecimentoRisco);
  Application.CreateForm(TFAguarde, FAguarde);
  Application.CreateForm(TDMHistContabil, DMHistContabil);
  Application.CreateForm(TFHistContabilCons, FHistContabilCons);
  Application.CreateForm(TFRTermoCienciaResponsabilidade, FRTermoCienciaResponsabilidade);
  FSplash.Hide;
  FSplash.Free;
  Application.CreateForm(TFMenuVenda, FMenuVenda);
  Application.Run;
end.
