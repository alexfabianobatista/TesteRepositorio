program PjOficina;

uses
  Forms,
  UTMenuPrincipal in '..\TEMPLATE\UTMenuPrincipal.pas' {FTMenuPrincipal},
  UMenuOficina in 'UMenuOficina.pas' {FMenuOficina},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  ULogin in '..\Seguranca\ULogin.pas' {FLogin},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UTrocaSenha in '..\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UParamCadFuncao in '..\Seguranca\UParamCadFuncao.pas' {FParamCadFuncao},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UOficina_cl in 'UOficina_cl.pas' {DMOficina: TDataModule},
  UMecanicoCad in 'UMecanicoCad.pas' {FOFI0001},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UMecanicoCons in 'UMecanicoCons.pas' {FMecanicoCons},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  URMecanicoCad in 'URMecanicoCad.pas' {FRMecanicoCad},
  UVeiculoCad in 'UVeiculoCad.pas' {FOFI0020},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UVeiculoModeloCad in 'UVeiculoModeloCad.pas' {FOFI0023},
  UVeiculoModeloCons in 'UVeiculoModeloCons.pas' {FVeiculoModeloCons},
  URVeiculoModelo in 'URVeiculoModelo.pas' {FRVeiculoModelo},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UOficinaParam in 'UOficinaParam.pas' {FOficinaParam},
  UVeiculoCons in 'UVeiculoCons.pas' {FVeiculoCons},
  URVeiculoCad in 'URVeiculoCad.pas' {FRVeiculoCad},
  UOSCad in 'UOSCad.pas' {FOFI0009},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UOS_TipoCad in 'UOS_TipoCad.pas' {FOFI0007},
  UOS_TipoCons in 'UOS_TipoCons.pas' {FOFI0008},
  UROS_Tipo in 'UROS_Tipo.pas' {FROS_Tipo},
  UOSCons in 'UOSCons.pas' {FOsCons},
  UOSFechamento in 'UOSFechamento.pas' {FOSFechamento},
  URequisicaoCad in 'URequisicaoCad.pas' {FOFI0011},
  URequisicaoCons in 'URequisicaoCons.pas' {FOFI0016},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UROSPeriodo in 'UROSPeriodo.pas' {FROSPeriodo},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UEstoqueCons in '..\Estoque\UEstoqueCons.pas' {FEstoqueCons},
  UOSMarcacao in 'UOSMarcacao.pas' {FOFI0010},
  UMarcacaoCons in 'UMarcacaoCons.pas' {FMarcacaoCons},
  UServico_Terceiro in 'UServico_Terceiro.pas' {FOFI0017},
  UServico_TerceiroCons in 'UServico_TerceiroCons.pas' {FOFI0019},
  URServico_Terceiro in 'URServico_Terceiro.pas' {FRServico_Terceiro},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  UControleInterno_cl in '..\Seguranca\UControleInterno_cl.pas' {DMControleInterno: TDataModule},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  URRomaneioNotas in '..\Agricola\URRomaneioNotas.pas' {FrRomNotaParam},
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UOperacaoCons in '..\Compras\UOperacaoCons.pas' {FOperacaoCons},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  URBloqueto in '..\Vendas\URBloqueto.pas' {FRBloqueto},
  URelatorioVenda_cl in '..\Vendas\URelatorioVenda_cl.pas' {DMRelatorio_Venda: TDataModule},
  UContasReceber_cl in '..\ContaReceber\UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  URContasReceber_Duplicatas_Ab in '..\ContaReceber\URContasReceber_Duplicatas_Ab.pas' {FRContasReceberDuplicatas_Ab},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  UOSCancelaNF in 'UOSCancelaNF.pas' {FOFI0012},
  UMarcacaoFinaliza in 'UMarcacaoFinaliza.pas' {FMarcacaoFinalizar},
  URelatorio_cl in 'URelatorio_cl.pas' {DMOficina_Relatorio: TDataModule},
  UROSPendente in 'UROSPendente.pas' {FROSPendente},
  UROSCustoItem in 'UROSCustoItem.pas' {FROSCustoItem},
  UTipoLoteCons in '..\Estoque\UTipoLoteCons.pas' {FTipoLoteCons},
  UTipoLote_cl in '..\Estoque\UTipoLote_cl.pas' {DMTipoLote: TDataModule},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UProdutoSemCusto in 'UProdutoSemCusto.pas' {FRProdutoSemCusto: TQuickRep},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UOrcamento_Oficina in 'UOrcamento_Oficina.pas' {FOFI0006},
  UTConsulta in '..\TEMPLATE\UTConsulta.pas' {FTConsulta},
  UOrcamento_OficinaCons in 'UOrcamento_OficinaCons.pas' {FOFI0005},
  UROrcamento_Oficina in 'UROrcamento_Oficina.pas' {FROrcamento_Oficina},
  UAtualizaEstoque_Custo in 'UAtualizaEstoque_Custo.pas' {FOFI0002},
  URMapaVenda_Oficina in 'URMapaVenda_Oficina.pas' {FRMapaVendaOficina},
  UFechamentoOS in 'UFechamentoOS.pas' {FOFI0018},
  UCaixa_cl in '..\ContaPagar\UCaixa_cl.pas' {DMCaixa: TDataModule},
  UConhecimentoFrete_cl in '..\Conhecimento\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  UREtiquetaCodBarraNF in 'UREtiquetaCodBarraNF.pas' {FREtiquetaCodBarraNF},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  UOficinaPassword in 'UOficinaPassword.pas' {FOficinaPassword},
  URVendaAvistaBalcao in 'URVendaAvistaBalcao.pas' {FRVendaAvistaBalcao},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  URomaneioCons in '..\Agricola\URomaneioCons.pas' {FRomaneioCons},
  FRRelatorioProdutividadePendente in 'FRRelatorioProdutividadePendente.pas' {FRProdutividadePendente},
  URProdutividadeEncerrada in 'URProdutividadeEncerrada.pas' {FRProdutividadeEncerrada},
  URelOSVeiculo in 'URelOSVeiculo.pas' {FRelOSVeiculo},
  URPecasEstoque in 'URPecasEstoque.pas' {FRPecasEstoque},
  URPecasOEMEstoque in 'URPecasOEMEstoque.pas' {FRPecasOEMEstoque},
  URContagemPecas in 'URContagemPecas.pas' {FRContagemPecas},
  URContagemPecasOEM in 'URContagemPecasOEM.pas' {FRContagemPecasOEM},
  URProdutividadeChapeacao in 'URProdutividadeChapeacao.pas' {FRProdutividadeChapeacao},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URProdutividadeServEletrico in 'URProdutividadeServEletrico.pas' {FRProdutividadeServEletrico},
  UCidadeCons in '..\Cadastro\UCidadeCons.pas' {FCidadeCons},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UCidadeCad in '..\Cadastro\UCidadeCad.pas' {FCidadeCad},
  UEstadoCons in '..\Cadastro\UEstadoCons.pas' {FEstadoCons},
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  URCidade_Cidade in '..\Cadastro\URCidade_Cidade.pas' {FRCidade_Cidade},
  UCadastroParam in '..\Cadastro\UCadastroParam.pas' {FCadastroParam},
  URegiaoCons in '..\Cadastro\URegiaoCons.pas' {FRegiaoCons},
  URegiao_cl in '..\Cadastro\URegiao_cl.pas' {DMRegiao: TDataModule},
  URamoCons in '..\Cadastro\URamoCons.pas' {FRamoCons},
  URamo_cl in '..\Cadastro\URamo_cl.pas' {DMRamo: TDataModule},
  UMotivoCons in '..\Cadastro\UMotivoCons.pas' {FMotivoCons},
  UMotivo_cl in '..\Cadastro\UMotivo_cl.pas' {DMMotivo: TDataModule},
  UClassCadastroCons in '..\Cadastro\UClassCadastroCons.pas' {FClassCadastroCons},
  UPracaCons in '..\Cadastro\UPracaCons.pas' {FPracaCons},
  UPraca_cl in '..\Cadastro\UPraca_cl.pas' {DMPraca: TDataModule},
  UVeiculoModelo_cl in '..\ControleVeiculo\UVeiculoModelo_cl.pas' {DMVeiculoModelo: TDataModule},
  UVeiculoFabricante_cl in '..\ControleVeiculo\UVeiculoFabricante_cl.pas' {DMVeiculoFabricante: TDataModule},
  UVeiculoFabricanteCons in '..\ControleVeiculo\UVeiculoFabricanteCons.pas' {FVeiculoFabricanteCons},
  UBloqueto in '..\ContaReceber\UBloqueto.pas',
  UnitBoleta in '..\MyLib\UNITBOLETA.pas' {Boleta},
  URBoletaBB in '..\ContaReceber\URBoletaBB.pas' {FRBoletaBB},
  URBloqueto_Bradesco in '..\ContaReceber\URBloqueto_Bradesco.pas' {FRBloqueto_Bradesco},
  URBloqueto_HSBC in '..\ContaReceber\URBloqueto_HSBC.pas' {FRBloqueto_HSBC},
  URBloqueto_Rural in '..\ContaReceber\URBloqueto_Rural.pas' {FRBloqueto_Rural},
  UFRBloqueto_Itau in '..\ContaReceber\UFRBloqueto_Itau.pas' {FRBloqueto_Itau},
  URBloqueto_Sicredi in '..\ContaReceber\URBloqueto_Sicredi.pas' {FRBloqueto_Sicredi},
  URBloqueto_Santander in '..\ContaReceber\URBloqueto_Santander.pas' {FRBloqueto_Santander},
  URBloqueto_Unibanco in '..\ContaReceber\URBloqueto_Unibanco.pas' {FRBloqueto_Unibanco},
  URBloquetoSafra in '..\ContaReceber\URBloquetoSafra.pas' {FRBloqueto_Safra},
  UVeiculo_cl in '..\ControleVeiculo\UVeiculo_cl.pas' {DMVeiculo: TDataModule},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  UFmFilial in '..\Frames\UFmFilial.pas' {FmFilial: TFrame},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UContasReceberParam in '..\ContaReceber\UContasReceberParam.pas',
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  UContasReceberCons in '..\ContaReceber\UContasReceberCons.pas' {FContasReceberCons},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons},
  UNotaSaidaCons in '..\ContaReceber\UNotaSaidaCons.pas' {FNotaSaidaCons},
  UObraContrato_Cons in '..\Obra\UObraContrato_Cons.pas' {FObraContrato_Cons},
  UObraContrato_cl in '..\Obra\UObraContrato_cl.pas' {DMObraContrato: TDataModule},
  UObraCons in '..\Obra\UObraCons.pas' {FObraCons},
  UObra_cl in '..\Obra\UObra_cl.pas' {DMObra: TDataModule},
  URBloqueto_Sudameris in '..\ContaReceber\URBloqueto_Sudameris.pas',
  URBloqueto_CEF in '..\ContaReceber\URBloqueto_CEF.pas',
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  UHistorico_cl in '..\ContaPagar\UHistorico_cl.pas' {DMHistorico: TDataModule},
  UConhecimento_cl in '..\Conhecimento\UConhecimento_cl.pas' {DMConhecimento: TDataModule},
  URControleEstoque in 'URControleEstoque.pas' {FRControleEstoque},
  UFmContrato in '..\Frames\UFmContrato.pas' {FmContrato: TFrame},
  UContratoVenda_Cons in '..\Agricola\UContratoVenda_Cons.pas' {FContrato_VendaCons},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  UFmFinalidade in '..\Frames\UFmFinalidade.pas' {FmFinalidade: TFrame},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  URequisicaoParam in 'URequisicaoParam.pas' {FRequisicaoParam},
  UFmProduto in '..\Frames\UFmProduto.pas' {FmProduto: TFrame},
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  URMovimentacaoProduto in 'URMovimentacaoProduto.pas' {FRMovimentacaoProduto},
  UOSEmite_cl in 'UOSEmite_cl.pas' {DMOSEmite: TDataModule},
  UNotaSaida_Cancela in '..\Vendas\UNotaSaida_Cancela.pas' {FNotaSaida_Cancela},
  UImpressoraFiscal in '..\Vendas\UImpressoraFiscal.pas' {FImpressoraFiscal},
  UImpFiscal in '..\Vendas\UImpFiscal.pas',
  UOficinaCad in 'UOficinaCad.pas' {FOficinaCad},
  UMarca_cl in '..\Estoque\UMarca_cl.pas' {DMMarca: TDataModule},
  UMarcaCons in '..\Estoque\UMarcaCons.pas' {FMarca_Cons},
  UOficinaCons in 'UOficinaCons.pas' {FOficinaCons},
  UOficinaConfirma in 'UOficinaConfirma.pas' {FOficinaConfirma},
  UNotaImpressao in '..\Vendas\UNotaImpressao.pas',
  UPromissoria in '..\Vendas\UPromissoria.pas',
  UGuiaTransito_cl in '..\Vendas\UGuiaTransito_cl.pas' {DMGuiaTransito: TDataModule},
  UNotaRDPrint in '..\Vendas\UNotaRDPrint.pas',
  URPedido in '..\Vendas\URPedido.pas' {FRPedido},
  UTipoNota in '..\Vendas\UTipoNota.pas' {FTipoNota},
  UNfeImpressao in '..\Vendas\UNfeImpressao.pas',
  UOficinaOrcamento in 'UOficinaOrcamento.pas' {FOficinaOrcamento},
  UOficinaOrcamentoCons in 'UOficinaOrcamentoCons.pas' {FOficinaOrcamentoCons},
  URComissao in 'URComissao.pas' {FRComissao},
  UOficinaOrcamentoParam in 'UOficinaOrcamentoParam.pas' {FOficinaOrcamentoParam},
  UFmVeiculo in '..\Frames\UFmVeiculo.pas' {FmVeiculo: TFrame},
  UFmMarca in '..\Frames\UFmMarca.pas' {FmMarca: TFrame},
  UROficinaOrcamento in 'UROficinaOrcamento.pas' {FROficinaOrcamento},
  UROficinaOrcamentoSintetico in 'UROficinaOrcamentoSintetico.pas' {FROficinaOrcamentoSintetico},
  UFmOperacao in '..\Frames\UFmOperacao.pas' {FmOperacao: TFrame},
  UROficina in 'UROficina.pas' {FROficina},
  UrReceberCobranca in 'UrReceberCobranca.pas' {FrReceberCobranca},
  UROficinaSintetico in 'UROficinaSintetico.pas' {FROficinaSintetico},
  UPrazoVencimento_cl in '..\ContaReceber\UPrazoVencimento_cl.pas' {DMPrazoVencimento: TDataModule},
  URComissaoSintetico in 'URComissaoSintetico.pas' {FRComissaoSintetico},
  UScpc_cl in '..\Cadastro\UScpc_cl.pas' {DMScpc: TDataModule},
  UScpcCons in '..\Cadastro\UScpcCons.pas' {FScpcCons},
  UVeiculoConhecimento_cl in '..\ControleVeiculo\UVeiculoConhecimento_cl.pas' {DMVeiculoConhecimento: TDataModule},
  UProprietario_cl in '..\Conhecimento\UProprietario_cl.pas' {DMProprietario: TDataModule},
  UProprietarioCons in '..\Conhecimento\UProprietarioCons.pas' {FProprietarioCons},
  UROSPreFechamento in 'UROSPreFechamento.pas' {FROSPreFechamento},
  URVendasLiquidasPeriodo in 'URVendasLiquidasPeriodo.pas' {FRVendasLiquidasPeriodo},
  UComissaoCons in '..\Cadastro\UComissaoCons.pas' {FComissaoCons},
  UComissao_cl in '..\Cadastro\UComissao_cl.pas' {DMComissao: TDataModule},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  UFmMensagem in '..\Frames\UFmMensagem.pas' {FmMensagem: TFrame},
  UNotaEntradaCons in '..\Compras\UNotaEntradaCons.pas' {FNotaEntradaCons},
  URComissaoMecanico in 'URComissaoMecanico.pas' {FRComissaoMecanico},
  UFmMecanico in '..\Frames\UFmMecanico.pas' {FmMecanico: TFrame},
  UFmComissao in '..\Frames\UFmComissao.pas' {FmComissao: TFrame},
  UOs_cl in 'UOs_cl.pas' {DMOs: TDataModule},
  UServicoTerceiro_cl in 'UServicoTerceiro_cl.pas' {DMServicoTerceiro: TDataModule},
  UMensagemOs in 'UMensagemOs.pas' {FMensagemOs},
  URComissaoProdutoVendedor in 'URComissaoProdutoVendedor.pas' {FRComissaoProdutoVendedor},
  UAguardoNfe in '..\MyLib\UAguardoNfe.pas' {FAguardoNfe},
  UNfe_cl in '..\MonitorNfe\UNfe_cl.pas' {DMNfe: TDataModule},
  UNFeParam in '..\MonitorNfe\UNFeParam.pas' {FNFeParam},
  UFmContaCorrente in '..\Frames\UFmContaCorrente.pas' {FmContaCorrente: TFrame},
  UFmNota in '..\Frames\UFmNota.pas' {FmNota: TFrame},
  UMensagemUsuario_cl in '..\Cadastro\UMensagemUsuario_cl.pas' {DmMensagemUsuario: TDataModule},
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UImagemAtalho in '..\Template\UImagemAtalho.pas',
  UFmNfeLote in '..\Frames\UFmNfeLote.pas' {FmNfeLote: TFrame},
  UNfEletronicaLote_cl in '..\Vendas\UNfEletronicaLote_cl.pas' {DMNfEletronicaLote: TDataModule},
  UFmBanco in '..\Frames\UFmBanco.pas' {FMBanco: TFrame},
  USplash in '..\Banco\USplash.pas' {FSplash},
  UNotaItensCons in '..\ContaReceber\UNotaItensCons.pas' {FNotaItensCons},
  UVendaPerdidaCad in '..\Estoque\UVendaPerdidaCad.pas' {FVendaPerdidaCad},
  UProdutos_UltimasCompras in '..\Estoque\UProdutos_UltimasCompras.pas' {FProdutos_UltimasCompras},
  URPedidoAssistenciaTecnica in '..\AssitenciaTecnica\URPedidoAssistenciaTecnica.pas' {FRPedidoAssistenciaTecnica},
  UFmLote in '..\Frames\UFmLote.pas' {FmLote: TFrame},
  URCustoFornecedor in 'URCustoFornecedor.pas' {FRCustoFornecedor},
  TefUtils in '..\MyLib\Tef\TefUtils.pas',
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  UEnviaEmail in '..\Agricola\UEnviaEmail.pas' {FEnviaEmail},
  USpedValidacao in '..\Compras\USpedValidacao.pas',
  URadioDialog in '..\Vendas\URadioDialog.pas' {FRadioDialog},
  UTefInputBox in '..\Vendas\UTefInputBox.pas' {FTefInputBox},
  UTefInputBoxCheque in '..\Vendas\UTefInputBoxCheque.pas' {FTefInputBoxCheque},
  UTef in '..\Vendas\UTef.pas' {FTEF},
  UTef_cl in '..\Vendas\UTef_cl.pas' {DMTEF: TDataModule},
  URQtdePecasOSAbertas in 'URQtdePecasOSAbertas.pas' {FRQtdePecasOSAbertas},
  URequisicaoCad2 in 'URequisicaoCad2.pas' {FRequisicaoCad2},
  UFmObra in '..\Frames\UFmObra.pas' {FmObra: TFrame},
  UCteLote_cl in '..\Conhecimento\UCteLote_cl.pas' {DMCteLote: TDataModule},
  URBloqueto_Sicoob in '..\ContaReceber\URBloqueto_Sicoob.pas' {FRBloqueto_Sicoob},
  UImpressoraFiscalParam in '..\Vendas\UImpressoraFiscalParam.pas' {FImpressoraFiscalParam},
  UImpressoraFiscal_cl in '..\Vendas\UImpressoraFiscal_cl.pas' {DMImpressoraFiscal: TDataModule},
  UAguarde in '..\ContaReceber\UAguarde.pas' {FAguarde},
  UPrazoVencimentoCons in '..\ContaReceber\UPrazoVencimentoCons.pas' {FPrazoVencimentoCons},
  UProdutos_UltimasVendas in '..\Estoque\UProdutos_UltimasVendas.pas' {FProdutos_UltimasVendas},
  UFmTitulo in '..\Frames\UFmTitulo.pas' {FmTitulo: TFrame},
  UAliquotasImpressora in '..\Vendas\UAliquotasImpressora.pas' {FAliquotasImpressora},
  UCupomFiscalParam in '..\Vendas\UCupomFiscalParam.pas' {FCupomFiscalParam},
  UEmbarque_cl in '..\Vendas\UEmbarque_cl.pas' {DMEmbarque: TDataModule},
  UMdfeLote_cl in '..\Conhecimento\UMdfeLote_cl.pas' {DMMdfeLote: TDataModule},
  URBloqueto_CEF_SIGCB in '..\ContaReceber\URBloqueto_CEF_SIGCB.pas' {FRBloqueto_CEF_SIGCB},
  UNFCeParcelas in '..\Vendas\UNFCeParcelas.pas' {FNFCeParcelas},
  UNFCeParam in '..\Vendas\UNFCeParam.pas' {FNFCeParam},
  UNFCeFechamento in '..\Vendas\UNFCeFechamento.pas' {FNFCeFechamento},
  UDevolucaoTroca_cl in '..\Vendas\UDevolucaoTroca_cl.pas' {DMDevolucaoTroca: TDataModule},
  URValeProduto48Colunas in '..\Vendas\URValeProduto48Colunas.pas' {FRValeProduto48Colunas},
  URValeProdutoNormal in '..\Vendas\URValeProdutoNormal.pas' {FRValeProdutoNormal},
  UBibVenda in '..\Vendas\UBibVenda.pas',
  UTabelaPreco_cl in '..\Estoque\UTabelaPreco_cl.pas' {DMTabelaPreco: TDataModule},
  URBoletaBB_SIC in '..\ContaReceber\URBoletaBB_SIC.pas' {FRBoletaBB_SIC},
  URPedido40Colunas in '..\Vendas\URPedido40Colunas.pas' {FRPedido40Colunas},
  URBloqueto_Cresol in '..\ContaReceber\URBloqueto_Cresol.pas' {FRBloqueto_Cresol},
  URBloqueto_Uniprime in '..\ContaReceber\URBloqueto_Uniprime.pas' {FRBloqueto_Uniprime},
  UHistContabil_cl in '..\Contabil\UHistContabil_cl.pas' {DMHistContabil: TDataModule},
  UHistContabilCons in '..\Contabil\UHistContabilCons.pas' {FHistContabilCons};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.Title := 'Oficina';
  Application.HelpFile := 'F:\Executaveis\Manual\P_OFICINA.HLP';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMOficina, DMOficina);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMControleInterno, DMControleInterno);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TDMRelatorio_Venda, DMRelatorio_Venda);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMOficina_Relatorio, DMOficina_Relatorio);
  Application.CreateForm(TDMTipoLote, DMTipoLote);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TDMCaixa, DMCaixa);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TDMVeiculoModelo, DMVeiculoModelo);
  Application.CreateForm(TDMVeiculoFabricante, DMVeiculoFabricante);
  Application.CreateForm(TDMVeiculo, DMVeiculo);
  Application.CreateForm(TDMObraContrato, DMObraContrato);
  Application.CreateForm(TDMObra, DMObra);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMConhecimento, DMConhecimento);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TDMOSEmite, DMOSEmite);
  Application.CreateForm(TDMMarca, DMMarca);
  Application.CreateForm(TDMGuiaTransito, DMGuiaTransito);
  Application.CreateForm(TDMPrazoVencimento, DMPrazoVencimento);
  Application.CreateForm(TDMScpc, DMScpc);
  Application.CreateForm(TDMVeiculoConhecimento, DMVeiculoConhecimento);
  Application.CreateForm(TDMProprietario, DMProprietario);
  Application.CreateForm(TDMComissao, DMComissao);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TDMOs, DMOs);
  Application.CreateForm(TDMServicoTerceiro, DMServicoTerceiro);
  Application.CreateForm(TDMNfe, DMNfe);
  Application.CreateForm(TDmMensagemUsuario, DmMensagemUsuario);
  Application.CreateForm(TDMNfEletronicaLote, DMNfEletronicaLote);
  Application.CreateForm(TDMTEF, DMTEF);
  Application.CreateForm(TDMCteLote, DMCteLote);
  Application.CreateForm(TDMImpressoraFiscal, DMImpressoraFiscal);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TDMMdfeLote, DMMdfeLote);
  Application.CreateForm(TFMenuOficina, FMenuOficina);
  Application.CreateForm(TDMDevolucaoTroca, DMDevolucaoTroca);
  Application.CreateForm(TDMTabelaPreco, DMTabelaPreco);
  Application.CreateForm(TFRPedido40Colunas, FRPedido40Colunas);
  Application.CreateForm(TFRBloqueto_Cresol, FRBloqueto_Cresol);
  Application.CreateForm(TFRBloqueto_Uniprime, FRBloqueto_Uniprime);
  Application.CreateForm(TDMHistContabil, DMHistContabil);
  Application.CreateForm(TFHistContabilCons, FHistContabilCons);
  FSplash.Hide;
  FSplash.Free;
  Application.Run;
end.
