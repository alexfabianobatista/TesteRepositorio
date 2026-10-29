program PjContasReceber;

uses
  Forms,
  UTMenuPrincipal in '..\TEMPLATE\UTMENUPRINCIPAL.pas' {FTMenuPrincipal},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UMenuContasReceber in 'UMenuContasReceber.pas' {FMenuContasReceber},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UHistorico_cl in '..\ContaPagar\UHistorico_cl.pas' {DMHistorico: TDataModule},
  URFinalidade in '..\ContaPagar\URFinalidade.pas' {FRFinalidade},
  UBancoscad in '..\ContaPagar\UBancoscad.pas' {FBancosCad},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons},
  UFinalidadeCad in '..\ContaPagar\UFinalidadeCad.pas' {FFinalidadeCad},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  UFinalidadeParam in '..\ContaPagar\UFinalidadeParam.pas' {FFinalidadeParam},
  UHistoricoCad in '..\ContaPagar\UHistoricoCad.pas' {FHistoricoCad},
  UHistoricoCons in '..\ContaPagar\UHistoricoCons.pas' {FHistoricoCons},
  URBancoCCorrente in '..\ContaPagar\URBancoCCorrente.pas' {FRBancoCCorrente},
  UBancoCCorrenteParam in '..\ContaPagar\UBancoCCorrenteParam.pas' {FBancoAgenciaParam},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  ULogin in '..\Seguranca\ULogin.pas' {FLogin},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTrocaSenha in '..\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UParamCadFuncao in '..\Seguranca\UParamCadFuncao.pas' {FParamCadFuncao},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UHistContabilCons in '..\Contabil\UHistContabilCons.pas' {FHistContabilCons},
  UHistContabil_cl in '..\Contabil\UHistContabil_cl.pas' {DMHistContabil: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UEstadoCons in '..\Cadastro\UEstadoCons.pas' {FEstadoCons},
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  UMoedaCons in '..\Cadastro\UMoedaCons.pas' {FMoedaCons},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  UContasReceberCad in 'UContasReceberCad.pas' {FContasReceberCad},
  UContasReceber_cl in 'UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  UContasReceberCons in 'UContasReceberCons.pas' {FContasReceberCons},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UContasReceberBaixa in 'UContasReceberBaixa.pas' {FContasReceberBaixa},
  UCaixa_cl in '..\ContaPagar\UCaixa_cl.pas' {DMCaixa: TDataModule},
  URContasReceberClientes in 'URContasReceberClientes.pas' {FRContasReceber_Clientes},
  UContasReceberParam in 'UContasReceberParam.pas' {FContasReceberParam},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  URContasReceber_Vencimentos in 'URContasReceber_Vencimentos.pas' {FRContasReceber_Vencimentos},
  URContasReceberMov in 'URContasReceberMov.pas' {FRContasReceberMov},
  ULiberaBaixa in 'ULiberaBaixa.pas' {FLiberaBaixa},
  UHistoricoParam in '..\ContaPagar\UHistoricoParam.pas' {FHistoricoParam},
  URHistorico in '..\ContaPagar\URHistorico.pas' {FRHistorico},
  UEmiteRecibo in '..\ContaPagar\UEmiteRecibo.pas' {FEmiteRecibo},
  UContasPagarCons in '..\ContaPagar\UContasPagarCons.pas' {FContasPagarCons},
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  URRecibo in '..\ContaPagar\URRecibo.pas' {FRRecibo},
  URContasReceber_TitulosAbertos in 'URContasReceber_TitulosAbertos.pas' {FRContasReceber_TitulosAberto},
  URContasReceber_TitulosBaixados in 'URContasReceber_TitulosBaixados.pas' {FRContasReceber_TitulosBaixados},
  URContasReceber_VencimentosSintetico in 'URContasReceber_VencimentosSintetico.pas' {FRContasReceber_VencimentosSintetico},
  URegiao_cl in '..\Cadastro\URegiao_cl.pas' {DMRegiao: TDataModule},
  URegiaoCons in '..\Cadastro\URegiaoCons.pas' {FRegiaoCons},
  URContasReceber_TitVenc in 'URContasReceber_TitVenc.pas' {FRContasReceber_TitVenc},
  URPromissoria in 'URPromissoria.pas' {FRPromissoria},
  URContasReceber_Duplicatas in 'URContasReceber_Duplicatas.pas' {FRContasReceber_Duplicatas},
  URContasReceber_Saldos in 'URContasReceber_Saldos.pas' {FRContasReceber_Saldos},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  URBloqueto_BRU in 'URBloqueto_BRU.pas' {FRBloqueto_BRU},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  UBloqueto in 'UBloqueto.pas',
  USplash in '..\Banco\USplash.pas' {FSplash},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  URecibos2 in 'URecibos2.pas' {FRRecibos2},
  UContasReceberVoltaBaixa in 'UContasReceberVoltaBaixa.pas' {FContasReceberVoltaBaixa},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  URContasReceber_Duplicatas_CGS in 'URContasReceber_Duplicatas_CGS.pas' {FRContasReceberDuplicatas_CGS},
  URContasReceber_Tit_Vend_Aberto in 'URContasReceber_Tit_Vend_Aberto.pas' {FRContasReceber_Tit_Vend_Aberto},
  URContasReceber_Duplicatas_Ab in 'URContasReceber_Duplicatas_Ab.pas' {FRContasReceberDuplicatas_Ab},
  URPromissoria_Branco in 'URPromissoria_Branco.pas' {FrPromissoria_Branco},
  URComissao in 'URComissao.pas' {FRComissao},
  URContasReceber_Recebidos in 'URContasReceber_Recebidos.pas' {FRContasReceber_Recebidos},
  URContasReceber_Receb_Bancos in 'URContasReceber_Receb_Bancos.pas' {FRContasReceber_Receb_Bancos},
  URContasReceber_Tit_Vend_Aberto_1 in 'URContasReceber_Tit_Vend_Aberto_1.pas' {FRContasReceber_Tit_Vend_Aberto_1},
  URContasReceber_Duplicatas_GONZATTI in 'URContasReceber_Duplicatas_GONZATTI.pas' {FRContasReceberDuplicatas_GONZATTI},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  URRemessas_641 in 'URRemessas_641.pas' {FRRemessas_641},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  UContabiliza_cl in '..\Vendas\UContabiliza_cl.pas' {DMContabiliza: TDataModule},
  UContabiliza_CR in 'UContabiliza_CR.pas' {FContabiliza_CR},
  UFGrupo_CustosCons in '..\Custos\UFGrupo_CustosCons.pas' {FGrupo_CustosCons},
  UGrupo_cl in '..\Custos\UGrupo_cl.pas' {DMGrupo: TDataModule},
  UContasReceber_Capitalizacao in 'UContasReceber_Capitalizacao.pas' {FContasReceber_Capitalizacao},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  URContrato in '..\Agricola\URContrato.pas' {FRContrato},
  URContasReceberResumo in 'URContasReceberResumo.pas' {FrContasReceberResumo},
  UnitBoleta in '..\MyLib\UNITBOLETA.pas' {Boleta},
  URBoletaBB in 'URBoletaBB.pas' {FRBoletaBB},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  UContasReceberVoltaTitEnviado in 'UContasReceberVoltaTitEnviado.pas' {FContasReceberTituloEnviado},
  URContaReceberTotalDia in 'URContaReceberTotalDia.pas' {FRContaReceberTotalDia},
  UPrazoVencimento_cl in 'UPrazoVencimento_cl.pas' {DMPrazoVencimento: TDataModule},
  UPrazoVencimentoCad in 'UPrazoVencimentoCad.pas' {FPrazoVencimentoCad},
  UPrazoVencimentoCons in 'UPrazoVencimentoCons.pas' {FPrazoVencimentoCons},
  UContasReceberPosicao in 'UContasReceberPosicao.pas' {FContasReceberPosicao},
  UFRBloqueto_Itau in 'UFRBloqueto_Itau.pas' {FRBloqueto_Itau},
  URCartaCobranca in 'URCartaCobranca.pas' {FRCartaCobranca},
  UOrdemCompraCons in '..\Compras\UOrdemCompraCons.pas' {FOrdemCompraCons},
  UOrdemCompra_cl in '..\Compras\UOrdemCompra_cl.pas' {DMOrdemCompra: TDataModule},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UTConsulta in '..\TEMPLATE\UTConsulta.pas' {FTConsulta},
  UNotaEntradaConsulta in 'UNotaEntradaConsulta.pas' {FNotaEntradaConsulta},
  URBloqueto_Sicredi in 'URBloqueto_Sicredi.pas' {FRBloqueto_Sicredi},
  URBloqueto_HSBC in 'URBloqueto_HSBC.pas' {FRBloqueto_HSBC},
  URBloqueto_Bradesco in 'URBloqueto_Bradesco.pas' {FRBloqueto_Bradesco},
  URContasReceber_Duplicatas_MEDIBENS in 'URContasReceber_Duplicatas_MEDIBENS.pas' {FRContasReceberDuplicatas_MEDIBENS},
  URContasReceber_Finalidade in 'URContasReceber_Finalidade.pas' {FRContasReceber_Finalidade},
  UOrdem_Compra_ItensCons in '..\Compras\UOrdem_Compra_ItensCons.pas' {FOrdem_Compra_ItensCons},
  URTitulosEmissao in 'URTitulosEmissao.pas' {FRTitulosEmissao},
  UNotaSaidaCons in 'UNotaSaidaCons.pas' {FNotaSaidaCons},
  UCentroCusto_cl in '..\Caixa\UCentroCusto_cl.pas' {DMCentroCusto: TDataModule},
  UCentroCustoCons in '..\Caixa\UCentroCustoCons.pas' {FCentroCustoCons},
  UReciboComissao in 'UReciboComissao.pas' {FReciboComissao},
  URBloqueto_Rural in 'URBloqueto_Rural.pas' {FRBloqueto_Rural},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UBancoAgenciaRel_cl in '..\Bancos\UBancoAgenciaRel_cl.pas' {DMBancoAgenciaRel: TDataModule},
  URCartaCobrancaCiviero in 'URCartaCobrancaCiviero.pas' {FRCartaCobrancaCiviero},
  URCartaCobrancaFaville in 'URCartaCobrancaFaville.pas' {FRCartaCobrancaFaville},
  UCidadeCons in '..\Cadastro\UCidadeCons.pas' {FCidadeCons},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UCidadeCad in '..\Cadastro\UCidadeCad.pas' {FCidadeCad},
  URCidade_Cidade in '..\Cadastro\URCidade_Cidade.pas' {FRCidade_Cidade},
  UCadastroParam in '..\Cadastro\UCadastroParam.pas' {FCadastroParam},
  URamoCons in '..\Cadastro\URamoCons.pas' {FRamoCons},
  URamo_cl in '..\Cadastro\URamo_cl.pas' {DMRamo: TDataModule},
  UMotivoCons in '..\Cadastro\UMotivoCons.pas' {FMotivoCons},
  UMotivo_cl in '..\Cadastro\UMotivo_cl.pas' {DMMotivo: TDataModule},
  UClassCadastroCons in '..\Cadastro\UClassCadastroCons.pas' {FClassCadastroCons},
  UPracaCons in '..\Cadastro\UPracaCons.pas' {FPracaCons},
  UPraca_cl in '..\Cadastro\UPraca_cl.pas' {DMPraca: TDataModule},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  URRomaneioNotas in '..\Agricola\URRomaneioNotas.pas' {FrRomNotaParam},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  URomaneioCons in '..\Agricola\URomaneioCons.pas' {FRomaneioCons},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  UConhecimentoFrete_cl in '..\Conhecimento\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  URBloqueto_Santander in 'URBloqueto_Santander.pas' {FRBloqueto_Santander},
  UObraContrato_cl in '..\Obra\UObraContrato_cl.pas' {DMObraContrato: TDataModule},
  UObraContratoMovCons in '..\Obra\UObraContratoMovCons.pas' {FObraContratoMovCons},
  UObraContrato_Cons in '..\Obra\UObraContrato_Cons.pas' {FObraContrato_Cons},
  UObraCons in '..\Obra\UObraCons.pas' {FObraCons},
  UObra_cl in '..\Obra\UObra_cl.pas' {DMObra: TDataModule},
  URHistoricoContrato in 'URHistoricoContrato.pas' {FRHistoricoContrato},
  URRemessasDesconto in 'URRemessasDesconto.pas' {FRRemessasDesconto},
  URCalculoDesconto in 'URCalculoDesconto.pas' {FRCalculoDesconto},
  URBloqueto_Unibanco in 'URBloqueto_Unibanco.pas' {FRBloqueto_Unibanco},
  URecibo_Dos in 'URecibo_Dos.pas',
  UContasReceber_Rel_cl in 'UContasReceber_Rel_cl.pas' {DMContasReceber_Rel: TDataModule},
  URTotalCRPeriodo in 'URTotalCRPeriodo.pas' {FRTotalCRPeriodo},
  URResumoMovCReceber in 'URResumoMovCReceber.pas' {FRResumoMovCReceber},
  URBloquetoSafra in 'URBloquetoSafra.pas' {FRBloqueto_Safra},
  URTituloAberto_Depto_Sint in 'URTituloAberto_Depto_Sint.pas' {FRTituloAberto_Depto_Sint},
  URMovimentacao in 'URMovimentacao.pas' {FRMovimentacao},
  URPrazoVencimento in 'URPrazoVencimento.pas' {FRPrazoVencimento},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URBloqEmitBanco in 'URBloqEmitBanco.pas' {FRBloqEmitBanco},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  UPromissoria in '..\Vendas\UPromissoria.pas',
  URBloqueto_Sudameris in 'URBloqueto_Sudameris.pas' {FRBloqueto_Sudameris},
  UNotaItensCons in 'UNotaItensCons.pas' {FNotaItensCons},
  URBloqueto_CEF in 'URBloqueto_CEF.pas' {FRBloqueto_CEF},
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame},
  UFmFilial in '..\Frames\UFmFilial.pas' {FmFilial: TFrame},
  URComissaoPublicar in 'URComissaoPublicar.pas' {FRComissaoPublicar},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  URReciboLote in 'URReciboLote.pas' {FRReciboLote},
  UAdiantamentoCons in '..\Bancos\UAdiantamentoCons.pas' {FAdiantamentoCons},
  UAdiantamento_cl in '..\Bancos\UAdiantamento_cl.pas' {DMAdiantamento: TDataModule},
  UCaixaCons in '..\Caixa\UCaixaCons.pas' {FCaixaCons},
  UBancoMovCons in '..\Bancos\UBancoMovCons.pas' {FBancoMovCons},
  UFmContrato in '..\Frames\UFmContrato.pas' {FmContrato: TFrame},
  UContratoVenda_Cons in '..\Agricola\UContratoVenda_Cons.pas' {FContrato_VendaCons},
  UFmFinalidade in '..\Frames\UFmFinalidade.pas' {FmFinalidade: TFrame},
  UFmBanco in '..\Frames\UFmBanco.pas' {FMBanco: TFrame},
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  URTitulosAbertos_OutrasMoedas in 'URTitulosAbertos_OutrasMoedas.pas' {FRTitulosAbertos_OutrasMoedas},
  URProtocoloEntregaDocumento in 'URProtocoloEntregaDocumento.pas' {FRProtocoloEntregaDocumento},
  UScpc_cl in '..\Cadastro\UScpc_cl.pas' {DMScpc: TDataModule},
  UScpcCons in '..\Cadastro\UScpcCons.pas' {FScpcCons},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword},
  URRetornoRemessaBB in 'URRetornoRemessaBB.pas' {FRRetornoRemessaBB},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  UFmContaCorrente in '..\Frames\UFmContaCorrente.pas' {FmContaCorrente: TFrame},
  UMensagemUsuario_cl in '..\Cadastro\UMensagemUsuario_cl.pas' {DmMensagemUsuario: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.Title := 'Sistema Contas à Receber';
  Application.HelpFile := 'F:\Executaveis\Manual\P_CONTAS RECEBER.HLP';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMHistContabil, DMHistContabil);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMCaixa, DMCaixa);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMContabiliza, DMContabiliza);
  Application.CreateForm(TDMGrupo, DMGrupo);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TDMPrazoVencimento, DMPrazoVencimento);
  Application.CreateForm(TDMOrdemCompra, DMOrdemCompra);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMCentroCusto, DMCentroCusto);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMBancoAgenciaRel, DMBancoAgenciaRel);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMObraContrato, DMObraContrato);
  Application.CreateForm(TDMObra, DMObra);
  Application.CreateForm(TDMContasReceber_Rel, DMContasReceber_Rel);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TDMAdiantamento, DMAdiantamento);
  Application.CreateForm(TDMScpc, DMScpc);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TFMenuContasReceber, FMenuContasReceber);
  Application.CreateForm(TDmMensagemUsuario, DmMensagemUsuario);
  FSplash.Hide;
  FSplash.Free;
  Application.Run;
end.
