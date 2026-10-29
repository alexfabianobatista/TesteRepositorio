program PjIndustria;

uses
  Forms,
  UTMenuPrincipal in '..\TEMPLATE\UTMenuPrincipal.pas' {FTMenuPrincipal},
  UMenuIndustria in 'UMenuIndustria.pas' {FMenuIndustria},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  ULogin in '..\Seguranca\ULogin.pas' {FLogin},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UTrocaSenha in '..\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UParamCadFuncao in '..\Seguranca\UParamCadFuncao.pas' {FParamCadFuncao},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  UFormula_cl in 'UFormula_cl.pas' {DMFormula: TDataModule},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UFormulaCad in 'UFormulaCad.pas' {FFormulaCad},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UTipoLoteCons in '..\Estoque\UTipoLoteCons.pas' {FTipoLoteCons},
  UTipoLote_cl in '..\Estoque\UTipoLote_cl.pas' {DMTipoLote: TDataModule},
  UFormulaCons in 'UFormulaCons.pas' {FFormulaCons},
  UBoletim_cl in 'UBoletim_cl.pas' {DMBoletim: TDataModule},
  UBoletimCad in 'UBoletimCad.pas' {FBoletimCad},
  UTurno_cl in 'UTurno_cl.pas' {DMTurno: TDataModule},
  UTurnoCad in 'UTurnoCad.pas' {FTurnoCad},
  UTurnoCons in 'UTurnoCons.pas' {FTurnoCons},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UBoletimCons in 'UBoletimCons.pas' {FBoletimCons},
  UTurnoControle in 'UTurnoControle.pas' {FTurnoControle},
  UTurnoControleCons in 'UTurnoControleCons.pas' {FTurnoControleCons},
  UFormulaParam in 'UFormulaParam.pas' {FFormulaParam},
  URFormula_Projecao in 'URFormula_Projecao.pas' {FRFormula_Projecao},
  UBoletimParam in 'UBoletimParam.pas' {FBoletimParam},
  URBoletim_ConsMatPrima2 in 'URBoletim_ConsMatPrima2.pas' {FRBoletim_ConsMatPrima2},
  URBoletim_ConsMatPrima in 'URBoletim_ConsMatPrima.pas' {FRBoletim_ConsMatPrima},
  URBoletim_Producao2 in 'URBoletim_Producao2.pas' {FRBoletim_Producao2},
  URBoletim_Producao in 'URBoletim_Producao.pas' {FRBoletim_Producao},
  URFormula_Relacao in 'URFormula_Relacao.pas' {FRFormula_Relacao},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  URBoletim_Relacao in 'URBoletim_Relacao.pas' {FRBoletim_Relacao},
  UTurnoParam in 'UTurnoParam.pas' {FTurnoParam},
  URTurno_Acompanha in 'URTurno_Acompanha.pas' {FRTurno_Acompanha},
  USplash in '..\Banco\USplash.pas' {FSplash},
  URelPreview in '..\Template\URelPreview.pas' {FRelPreview},
  UEstoqueCons in '..\Estoque\UEstoqueCons.pas' {FEstoqueCons},
  UBoletimE in 'UBoletimE.pas' {FBoletimBaixaMatPrim},
  UBoletimS in 'UBoletimS.pas' {FBoletimEntradaProdAcab},
  URBoletim_Perdas in 'URBoletim_Perdas.pas' {FRBoletim_Perdas},
  URFormula_Custo in 'URFormula_Custo.pas' {FRFormula_Custo},
  UProducaoCad in 'UProducaoCad.pas' {FProducaoCad},
  UProducaoCons in 'UProducaoCons.pas' {FProducaoCons},
  URProducaoA in 'URProducaoA.pas' {FRProducaoA},
  URProducaoS in 'URProducaoS.pas' {FRProducaoS},
  UTurnoConsAberto in 'UTurnoConsAberto.pas' {FTurnoConsAberto},
  URProducaoTurnProd in 'URProducaoTurnProd.pas' {FRProducaoTurnoProd},
  URResumo_Prod_Turno in 'URResumo_Prod_Turno.pas' {FRResumo_Prod_Turno},
  URProducaoEstabelecida in 'URProducaoEstabelecida.pas' {FRProducaoEstabelecida},
  UTipoLote in '..\Estoque\UTipoLote.pas' {FTipoLoteCad},
  UTipoLoteParam in '..\Estoque\UTipoLoteParam.pas' {FTipoLoteParam},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  URTipoLote in '..\Estoque\URTipoLote.pas' {FRTipoLote},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UCidadeCons in '..\Cadastro\UCidadeCons.pas' {FCidadeCons},
  UCidadeCad in '..\Cadastro\UCidadeCad.pas' {FCidadeCad},
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  UEstadoCons in '..\Cadastro\UEstadoCons.pas' {FEstadoCons},
  URCidade_Cidade in '..\Cadastro\URCidade_Cidade.pas' {FRCidade_Cidade},
  UCadastroParam in '..\Cadastro\UCadastroParam.pas' {FCadastroParam},
  URegiao_cl in '..\Cadastro\URegiao_cl.pas' {DMRegiao: TDataModule},
  URegiaoCons in '..\Cadastro\URegiaoCons.pas' {FRegiaoCons},
  URamo_cl in '..\Cadastro\URamo_cl.pas' {DMRamo: TDataModule},
  URamoCons in '..\Cadastro\URamoCons.pas' {FRamoCons},
  UMotivo_cl in '..\Cadastro\UMotivo_cl.pas' {DMMotivo: TDataModule},
  UMotivoCons in '..\Cadastro\UMotivoCons.pas' {FMotivoCons},
  UClassCadastroCons in '..\Cadastro\UClassCadastroCons.pas' {FClassCadastroCons},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UPraca_cl in '..\Cadastro\UPraca_cl.pas' {DMPraca: TDataModule},
  UPracaCons in '..\Cadastro\UPracaCons.pas' {FPracaCons},
  UrMovimentoPorLote in '..\Estoque\UrMovimentoPorLote.pas' {FrMovimentoPorLote},
  URPosicaoEstoqueProducao in 'URPosicaoEstoqueProducao.pas' {FRPosicaoEstoqueProducao},
  UOrdemProducao_cl in 'UOrdemProducao_cl.pas' {DMOrdemProducao: TDataModule},
  UConfirmaOrdemProducao in 'UConfirmaOrdemProducao.pas' {FConfirmaOrdemProducao},
  UOrdemProducaoCad in 'UOrdemProducaoCad.pas' {FOrdemProducaoCad},
  URComponenteProducao in 'URComponenteProducao.pas' {FRComponenteProducao},
  UOrdemProducaoCons in 'UOrdemProducaoCons.pas' {FOrdemProducaoCons},
  URFormula_PedidoAberto in 'URFormula_PedidoAberto.pas' {FRFormula_PedidoAberto},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  UREtiquetaProdAcabado in 'UREtiquetaProdAcabado.pas' {FREtiquetaProdAcabado},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  UProducaoAgricola_cl in 'UProducaoAgricola_cl.pas' {DMProducaoAgricola: TDataModule},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UProducaoAgricolaCad in 'UProducaoAgricolaCad.pas' {FProducaoAgricolaCad},
  UTConsulta in '..\TEMPLATE\UTConsulta.pas' {FTConsulta},
  UOperacaoCons in '..\Compras\UOperacaoCons.pas' {FOperacaoCons},
  UProducaoAgricolaCons in 'UProducaoAgricolaCons.pas' {FProducaoAgricolaCons},
  UProducaoAgricolaParam in 'UProducaoAgricolaParam.pas' {FProducaoAgricolaParam},
  UFmFilial in '..\Frames\UFmFilial.pas' {FmFilial: TFrame},
  UFmProduto in '..\Frames\UFmProduto.pas' {FmProduto: TFrame},
  UFmTurno in '..\Frames\UFmTurno.pas' {FmTurno: TFrame},
  URProdMateriaPrima in 'URProdMateriaPrima.pas' {FRProdMateriaPrima},
  URProdutoAcabado in 'URProdutoAcabado.pas' {FRProdutoAcabado},
  URProducaoAgricola in 'URProducaoAgricola.pas' {FRProducaoAgricola},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  URComponenteProducao1 in 'URComponenteProducao1.pas' {FRComponenteProducao1},
  UFmClasse in '..\Frames\UFmClasse.pas' {FmClasse: TFrame},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame},
  URRelacaoFormulas in 'URRelacaoFormulas.pas' {FRRelacaoFormulas},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  ULancaComponente in 'ULancaComponente.pas' {FLancaComponente},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UConhecimentoFrete_cl in '..\Conhecimento\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  UContasReceber_cl in '..\ContaReceber\UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  UBloqueto in '..\ContaReceber\UBloqueto.pas',
  UnitBoleta in '..\MyLib\UNITBOLETA.pas' {Boleta},
  URBoletaBB in '..\ContaReceber\URBoletaBB.pas' {FRBoletaBB},
  UFmBalanca in '..\Frames\UFmBalanca.pas' {FmBalanca: TFrame},
  UFmBanco in '..\Frames\UFmBanco.pas' {FMBanco: TFrame},
  UFmContaCorrente in '..\Frames\UFmContaCorrente.pas' {FmContaCorrente: TFrame},
  UFmContrato in '..\Frames\UFmContrato.pas' {FmContrato: TFrame},
  UFmConvenio in '..\Frames\UFmConvenio.pas' {FmConvenio: TFrame},
  UFmCultura in '..\Frames\UFmCultura.pas' {FmCultura: TFrame},
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  UFmFinalidade in '..\Frames\UFmFinalidade.pas' {FmFinalidade: TFrame},
  UContasReceberParam in '..\ContaReceber\UContasReceberParam.pas' {FContasReceberParam},
  UContratoVenda_Cons in '..\Agricola\UContratoVenda_Cons.pas' {FContrato_VendaCons},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  UContasReceberCons in '..\ContaReceber\UContasReceberCons.pas' {FContasReceberCons},
  UNotaSaidaCons in '..\Vendas\UNotaSaidaCons.pas' {FNotaSaidaCons},
  UObraContrato_cl in '..\Obra\UObraContrato_cl.pas' {DMObraContrato: TDataModule},
  URBloqueto_Bradesco in '..\ContaReceber\URBloqueto_Bradesco.pas' {FRBloqueto_Bradesco},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  UObraContrato_Cons in '..\Obra\UObraContrato_Cons.pas' {FObraContrato_Cons},
  UObra_cl in '..\Obra\UObra_cl.pas' {DMObra: TDataModule},
  UObraCons in '..\Obra\UObraCons.pas' {FObraCons},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  URBloquetoSafra in '..\ContaReceber\URBloquetoSafra.pas' {FRBloqueto_Safra},
  URBloqueto_HSBC in '..\ContaReceber\URBloqueto_HSBC.pas' {FRBloqueto_HSBC},
  URBloqueto_Rural in '..\ContaReceber\URBloqueto_Rural.pas' {FRBloqueto_Rural},
  UFRBloqueto_Itau in '..\ContaReceber\UFRBloqueto_Itau.pas' {FRBloqueto_Itau},
  URBloqueto_Sicredi in '..\ContaReceber\URBloqueto_Sicredi.pas' {FRBloqueto_Sicredi},
  URBloqueto_Santander in '..\ContaReceber\URBloqueto_Santander.pas' {FRBloqueto_Santander},
  URBloqueto_Unibanco in '..\ContaReceber\URBloqueto_Unibanco.pas' {FRBloqueto_Unibanco},
  URBloqueto_Sudameris in '..\ContaReceber\URBloqueto_Sudameris.pas' {FRBloqueto_Sudameris},
  URBloqueto_CEF in '..\ContaReceber\URBloqueto_CEF.pas' {FRBloqueto_CEF},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  UHistorico_cl in '..\ContaPagar\UHistorico_cl.pas' {DMHistorico: TDataModule},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  UBalancaCons in '..\Agricola\UBalancaCons.pas' {FBalancaCons},
  UConvenioCons in '..\Medico\UConvenioCons.pas' {FConvenioCons},
  UConvenio_cl in '..\Medico\UConvenio_cl.pas' {DMConvenio: TDataModule},
  UCulturaCons in '..\Agricola\UCulturaCons.pas' {FCulturaCons},
  UCultura_cl in '..\Agricola\UCultura_cl.pas' {DMCultura: TDataModule},
  UScpcCons in '..\Cadastro\UScpcCons.pas' {FScpcCons},
  UScpc_cl in '..\Cadastro\UScpc_cl.pas' {DMScpc: TDataModule},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  UMensagemUsuario_cl in '..\Cadastro\UMensagemUsuario_cl.pas' {DmMensagemUsuario: TDataModule},
  UNfe_cl in '..\MonitorNfe\UNfe_cl.pas' {DMNfe: TDataModule},
  UNFeParam in '..\MonitorNfe\UNFeParam.pas' {FNFeParam},
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UNfEletronicaLote_cl in '..\Vendas\UNfEletronicaLote_cl.pas' {DMNfEletronicaLote: TDataModule},
  UFmNfeLote in '..\Frames\UFmNfeLote.pas' {FmNfeLote: TFrame},
  UImagemAtalho in '..\Template\UImagemAtalho.pas',
  UVendaPerdidaCad in '..\Estoque\UVendaPerdidaCad.pas' {FVendaPerdidaCad},
  UProdutos_UltimasCompras in '..\Estoque\UProdutos_UltimasCompras.pas' {FProdutos_UltimasCompras},
  UNotaItensCons in '..\ContaReceber\UNotaItensCons.pas' {FNotaItensCons},
  URBoletimCusto in 'URBoletimCusto.pas' {FRBoletimCusto},
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  UEnviaEmail in '..\Agricola\UEnviaEmail.pas' {FEnviaEmail},
  UFmObra in '..\Frames\UFmObra.pas' {FmObra: TFrame},
  UCteLote_cl in '..\Conhecimento\UCteLote_cl.pas' {DMCteLote: TDataModule},
  UConhecimento_cl in '..\Conhecimento\UConhecimento_cl.pas' {DMConhecimento: TDataModule},
  USpedValidacao in '..\Compras\USpedValidacao.pas',
  UImpressoraFiscal_cl in '..\Vendas\UImpressoraFiscal_cl.pas' {DMImpressoraFiscal: TDataModule},
  UEmbarque_cl in '..\Vendas\UEmbarque_cl.pas' {DMEmbarque: TDataModule},
  UTefInputBoxCheque in '..\Vendas\UTefInputBoxCheque.pas' {FTefInputBoxCheque},
  UTefInputBox in '..\Vendas\UTefInputBox.pas' {FTefInputBox},
  UTef_cl in '..\Vendas\UTef_cl.pas' {DMTEF: TDataModule},
  UTef in '..\Vendas\UTef.pas' {FTEF},
  UImpressoraFiscal in '..\Vendas\UImpressoraFiscal.pas' {FImpressoraFiscal},
  UCupomFiscalParam in '..\Vendas\UCupomFiscalParam.pas' {FCupomFiscalParam},
  UAliquotasImpressora in '..\Vendas\UAliquotasImpressora.pas' {FAliquotasImpressora},
  UNotaSaida_Cancela in '..\Vendas\UNotaSaida_Cancela.pas' {FNotaSaida_Cancela},
  UImpressoraFiscalParam in '..\Vendas\UImpressoraFiscalParam.pas' {FImpressoraFiscalParam},
  UProdutos_UltimasVendas in '..\Estoque\UProdutos_UltimasVendas.pas' {FProdutos_UltimasVendas},
  UFmTitulo in '..\Frames\UFmTitulo.pas' {FmTitulo: TFrame},
  URBloqueto_Sicoob in '..\ContaReceber\URBloqueto_Sicoob.pas' {FRBloqueto_Sicoob},
  UMdfeLote_cl in '..\Conhecimento\UMdfeLote_cl.pas' {DMMdfeLote: TDataModule},
  URadioDialog in '..\Vendas\URadioDialog.pas' {FRadioDialog},
  UAguarde in '..\ContaReceber\UAguarde.pas' {FAguarde},
  URBloqueto_CEF_SIGCB in '..\ContaReceber\URBloqueto_CEF_SIGCB.pas' {FRBloqueto_CEF_SIGCB},
  UDevolucaoTroca_cl in '..\Vendas\UDevolucaoTroca_cl.pas' {DMDevolucaoTroca: TDataModule},
  UFmLote in '..\Frames\UFmLote.pas' {FmLote: TFrame},
  UrComposicaoEstoque in 'UrComposicaoEstoque.pas' {FrComposicaoEstoque},
  UBoletimOrdemProducao in 'UBoletimOrdemProducao.pas' {FBoletimOrdemProducao},
  UConfirmaBoletimProducao in 'UConfirmaBoletimProducao.pas' {FConfirmaBoletimProducao},
  UROrdemProducao in 'UROrdemProducao.pas' {FRordemProducao},
  UTabelaPreco_cl in '..\Estoque\UTabelaPreco_cl.pas' {DMTabelaPreco: TDataModule},
  URQtdeProducao in 'URQtdeProducao.pas' {FRQtdeProducao},
  URQtdeProducao2 in 'URQtdeProducao2.pas' {FRQtdeProducao2},
  URBoletaBB_SIC in '..\ContaReceber\URBoletaBB_SIC.pas' {FRBoletaBB_SIC},
  UOrdemCompra_cl in '..\Compras\UOrdemCompra_cl.pas' {DMOrdemCompra: TDataModule},
  URelatorioEstoque_cl in '..\Estoque\URelatorioEstoque_cl.pas' {DMRelatorio_Estoque: TDataModule},
  UNotaAutomaticaFlag in '..\Vendas\UNotaAutomaticaFlag.pas',
  UFmSubClasse in '..\Frames\UFmSubClasse.pas' {FmSubClasse: TFrame},
  URMatPrimaFaturada in 'URMatPrimaFaturada.pas' {FRMatPrimaFaturada},
  URFormulaMatPrima in 'URFormulaMatPrima.pas' {FRFormulaMatPrima},
  UHistContabil_cl in '..\Contabil\UHistContabil_cl.pas' {DMHistContabil: TDataModule},
  UDespesaAntecipada_cl in '..\Contabil\UDespesaAntecipada_cl.pas' {DMDespesaAntecipada: TDataModule},
  UHistContabilCons in '..\Contabil\UHistContabilCons.pas' {FHistContabilCons},
  UBibCompra in '..\Compras\UBibCompra.pas',
  URComissoesProducao in 'URComissoesProducao.pas' {FRComissaoProducao},
  URBloqueto_Cresol in '..\ContaReceber\URBloqueto_Cresol.pas' {FRBloqueto_Cresol},
  URBloqueto_Uniprime in '..\ContaReceber\URBloqueto_Uniprime.pas' {FRBloqueto_Uniprime},
  URProducaoEmAberto in 'URProducaoEmAberto.pas' {FRProducaoEmAberto},
  UVisualizaAmplia in '..\Estoque\UVisualizaAmplia.pas' {FVisualizaAmplia},
  UOrdemServico_cl in '..\AssitenciaTecnica\UOrdemServico_cl.pas' {DMOrdemServico: TDataModule},
  UObservacao_Cons in '..\Estoque\UObservacao_Cons.pas' {FObservacao_Cons},
  URSerie in '..\Compras\URSerie.pas' {FRSerie},
  USerieCad in '..\Compras\USerieCad.pas' {FSerieCad},
  URVencimentoPorLote in '..\Estoque\URVencimentoPorLote.pas' {FrVencimentoPorLote},
  URFormulaProjecaoCompras in 'URFormulaProjecaoCompras.pas' {FRFormulaProjecaoCompra},
  UProprietario_cl in '..\Conhecimento\UProprietario_cl.pas' {DMProprietario: TDataModule},
  UProprietarioCons in '..\Conhecimento\UProprietarioCons.pas' {FProprietarioCons},
  UVeiculoConhecimento_cl in '..\Conhecimento\UVeiculoConhecimento_cl.pas' {DMVeiculoConhecimento: TDataModule},
  UVeiculoConhecimentoCons in '..\Conhecimento\UVeiculoConhecimentoCons.pas' {FVeiculoConhecimentoCons},
  UMarca_cl in '..\Estoque\UMarca_cl.pas' {DMMarca: TDataModule},
  UMarcaCons in '..\Estoque\UMarcaCons.pas' {FMarca_Cons};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.HelpFile := 'F:\Executaveis\Manual\P_INDÚSTRIA.HLP';
  Application.Title := 'Projeto Indústria';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMFormula, DMFormula);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMTipoLote, DMTipoLote);
  Application.CreateForm(TDMBoletim, DMBoletim);
  Application.CreateForm(TDMTurno, DMTurno);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TDMOrdemProducao, DMOrdemProducao);
  Application.CreateForm(TDMProducaoAgricola, DMProducaoAgricola);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TDMObraContrato, DMObraContrato);
  Application.CreateForm(TDMObra, DMObra);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMConvenio, DMConvenio);
  Application.CreateForm(TDMCultura, DMCultura);
  Application.CreateForm(TDMScpc, DMScpc);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TDmMensagemUsuario, DmMensagemUsuario);
  Application.CreateForm(TDMNfe, DMNfe);
  Application.CreateForm(TDMNfEletronicaLote, DMNfEletronicaLote);
  Application.CreateForm(TDMCteLote, DMCteLote);
  Application.CreateForm(TDMConhecimento, DMConhecimento);
  Application.CreateForm(TDMImpressoraFiscal, DMImpressoraFiscal);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TDMTEF, DMTEF);
  Application.CreateForm(TDMMdfeLote, DMMdfeLote);
  Application.CreateForm(TDMDevolucaoTroca, DMDevolucaoTroca);
  Application.CreateForm(TDMTabelaPreco, DMTabelaPreco);
  Application.CreateForm(TDMOrdemCompra, DMOrdemCompra);
  Application.CreateForm(TDMRelatorio_Estoque, DMRelatorio_Estoque);
  Application.CreateForm(TDMHistContabil, DMHistContabil);
  Application.CreateForm(TDMDespesaAntecipada, DMDespesaAntecipada);
  Application.CreateForm(TDMOrdemServico, DMOrdemServico);
  Application.CreateForm(TDMProprietario, DMProprietario);
  Application.CreateForm(TDMVeiculoConhecimento, DMVeiculoConhecimento);
  Application.CreateForm(TDMMarca, DMMarca);
  Application.CreateForm(TFMenuIndustria, FMenuIndustria);
  FSplash.Hide;
  FSplash.Free;
  Application.Run;
end.
