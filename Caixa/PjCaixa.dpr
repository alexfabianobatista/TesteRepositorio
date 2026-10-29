program PjCaixa;

uses
  Forms,
  UTMenuPrincipal in '..\TEMPLATE\UTMenuPrincipal.pas' {FTMenuPrincipal},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UMenuCaixa in 'UMenuCaixa.pas' {FMenuCaixa},
  UCaixa_cl in '..\ContaPagar\UCaixa_cl.pas' {DMCaixa: TDataModule},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  ULogin in '..\Seguranca\ULogin.pas' {FLogin},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTrocaSenha in '..\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UParamCadFuncao in '..\Seguranca\UParamCadFuncao.pas' {FParamCadFuncao},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UCaixa_Cad in 'UCaixa_Cad.pas' {FCaixaCad},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UCaixaCons in 'UCaixaCons.pas' {FCaixaCons},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UHistorico_cl in '..\ContaPagar\UHistorico_cl.pas' {DMHistorico: TDataModule},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UHistoricoCons in '..\ContaPagar\UHistoricoCons.pas' {FHistoricoCons},
  UCaixaParam in 'UCaixaParam.pas' {FCaixaParam},
  URCaixa_MovSaldosAvemed in 'URCaixa_MovSaldosAvemed.pas' {FRCaixa_MovSaldosAvemed},
  URCaixa_RelLanc in 'URCaixa_RelLanc.pas' {FRCaixa_RelLanc},
  URCaixa_MovCaixa in 'URCaixa_MovCaixa.pas' {FRCaixa_MovCaixa},
  URCaixa_ResLanc in 'URCaixa_ResLanc.pas' {FRCaixa_ResLanc},
  UCaixaDetCad in 'UCaixaDetCad.pas' {FCaixaDetCad},
  URCaixa_MovCaixaSint in 'URCaixa_MovCaixaSint.pas' {FRCaixa_MovCaixaSint},
  UCaixaSaldo in 'UCaixaSaldo.pas' {FCaixaSaldo},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  UCaixaDetCons in 'UCaixaDetCons.pas' {FCaixaDetCons},
  UCaixaDetParam in 'UCaixaDetParam.pas' {FCaixaDetParam},
  URCaixaDet in 'URCaixaDet.pas' {FRCaixaDet},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  UHistoricoParam in '..\ContaPagar\UHistoricoParam.pas' {FHistoricoParam},
  UHistoricoCad in '..\ContaPagar\UHistoricoCad.pas' {FHistoricoCad},
  UHistContabil_cl in '..\Contabil\UHistContabil_cl.pas' {DMHistContabil: TDataModule},
  UHistContabilCons in '..\Contabil\UHistContabilCons.pas' {FHistContabilCons},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  URHistorico in '..\ContaPagar\URHistorico.pas' {FRHistorico},
  USplash in '..\Banco\USplash.pas' {FSplash},
  URelPreview in '..\Template\URelPreview.pas' {FRelPreview},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  URReciboCaixa in 'URReciboCaixa.pas' {FRReciboCaixa},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  URCaixa_Fluxo_Caixa in 'URCaixa_Fluxo_Caixa.pas' {FrCaixa_Fluxo_Caixa},
  UCaixaLanc_Cont in 'UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  URCaixa_MovHistorico in 'URCaixa_MovHistorico.pas' {FRCaixa_MovHistorico},
  UContabiliza_cl in '..\Vendas\UContabiliza_cl.pas' {DMContabiliza: TDataModule},
  UContabilizaCaixa in 'UContabilizaCaixa.pas' {FContabilizaCaixa},
  UReciboParam in '..\AssitenciaTecnica\UReciboParam.pas' {FReciboParam},
  UFluxoCaixaCad in 'UFluxoCaixaCad.pas' {FFluxoCaixaCad},
  UFluxoCaixaCons in 'UFluxoCaixaCons.pas' {FFluxoCaixaCons},
  URCaixa_MovCaixa1 in 'URCaixa_MovCaixa1.pas' {FRCaixa_MovCaixa1},
  URResumoLancamentoAgrupadoCaixaBanco in 'URResumoLancamentoAgrupadoCaixaBanco.pas' {FRResumoLancAgrupadoCaixaBanco},
  UCentroCusto_cl in 'UCentroCusto_cl.pas' {DMCentroCusto: TDataModule},
  UCentroCustoCad in 'UCentroCustoCad.pas' {FCentroCustoCad},
  UCentroCustoCons in 'UCentroCustoCons.pas' {FCentroCustoCons},
  URCentroCustoHistorico in 'URCentroCustoHistorico.pas' {FRCentroCustoHistorico},
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  UContasReceber_cl in '..\ContaReceber\UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UVeiculoModeloCons in '..\ControleVeiculo\UVeiculoModeloCons.pas' {FVeiculoModeloCons},
  UVeiculo_cl in '..\ControleVeiculo\UVeiculo_cl.pas' {DMVeiculo: TDataModule},
  UVeiculoCons in '..\ControleVeiculo\UVeiculoCons.pas' {FVeiculoCons},
  UVeiculoFabricante_cl in '..\ControleVeiculo\UVeiculoFabricante_cl.pas' {DMVeiculoFabricante: TDataModule},
  UVeiculoFabricanteCons in '..\ControleVeiculo\UVeiculoFabricanteCons.pas' {FVeiculoFabricanteCons},
  UVeiculoModelo_cl in '..\ControleVeiculo\UVeiculoModelo_cl.pas' {DMVeiculoModelo: TDataModule},
  UCustoVeiculoMov_cl in '..\ControleVeiculo\UCustoVeiculoMov_cl.pas' {DMCustoVeiculoMov: TDataModule},
  UCustoVeiculo_CX in 'UCustoVeiculo_CX.pas' {FCustoVeiculo_CX},
  UFluxoCaixa_cl in 'UFluxoCaixa_cl.pas' {DMFluxoCaixa: TDataModule},
  UFluxoCaixaSaldoCad in 'UFluxoCaixaSaldoCad.pas' {FFluxoCaixaSaldoCad},
  UFluxoCaixaSaldoCons in 'UFluxoCaixaSaldoCons.pas' {FFluxoCaixaSaldoCons},
  URFluxoCaixa in 'URFluxoCaixa.pas' {FrFluxoCaixa},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UCaixaRel_cl in 'UCaixaRel_cl.pas' {DMCaixaRel: TDataModule},
  URMovimento in 'URMovimento.pas' {FRMovimento},
  URFluxoCaixaAnalitico in 'URFluxoCaixaAnalitico.pas' {FRFluxoCaixaAnalitico},
  URSaldoDiario in 'URSaldoDiario.pas' {FRSaldoDiario},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  UCidadeCons in '..\Cadastro\UcidadeCons.pas' {FCidadeCons},
  UCidade_cl in '..\Cadastro\Ucidade_cl.pas' {DMCidade: TDataModule},
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
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UPracaCons in '..\Cadastro\UPracaCons.pas' {FPracaCons},
  UPraca_cl in '..\Cadastro\UPraca_cl.pas' {DMPraca: TDataModule},
  UBloqueto in '..\ContaReceber\UBloqueto.pas',
  URBoletaBB in '..\ContaReceber\URBoletaBB.pas',
  UnitBoleta in '..\MyLib\UNITBOLETA.pas' {Boleta},
  URBloqueto_Bradesco in '..\ContaReceber\URBloqueto_Bradesco.pas' {FRBloqueto_Bradesco},
  URBloqueto_HSBC in '..\ContaReceber\URBloqueto_HSBC.pas' {FRBloqueto_HSBC},
  URBloqueto_Rural in '..\ContaReceber\URBloqueto_Rural.pas' {FRBloqueto_Rural},
  UFRBloqueto_Itau in '..\ContaReceber\UFRBloqueto_Itau.pas' {FRBloqueto_Itau},
  URBloqueto_Sicredi in '..\ContaReceber\URBloqueto_Sicredi.pas' {FRBloqueto_Sicredi},
  UNotaPromissoriaParam in 'UNotaPromissoriaParam.pas' {FNotaPromissoriaParam},
  URNotaPromissoriaExtra in 'URNotaPromissoriaExtra.pas' {FRNotaPromissoriaExtra},
  URBloqueto_Santander in '..\ContaReceber\URBloqueto_Santander.pas' {FRBloqueto_Santander},
  URBloqueto_Unibanco in '..\ContaReceber\URBloqueto_Unibanco.pas' {FRBloqueto_Unibanco},
  UCaixa_Transf_cl in 'UCaixa_Transf_cl.pas' {DMCaixa_Transf: TDataModule},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UCaixaTransferencia in 'UCaixaTransferencia.pas' {FCaixaTransferencia},
  UTConsulta in '..\TEMPLATE\UTConsulta.pas' {FTConsulta},
  UCaixaTransferenciaCons in 'UCaixaTransferenciaCons.pas' {FCaixaTransferenciaCons},
  UCaixaTransferencia_Conf in 'UCaixaTransferencia_Conf.pas' {FCaixaTransferencia_Conf},
  UrCaixaTransferencia in 'UrCaixaTransferencia.pas' {FrCaixaTransferencia},
  UrCaixaSaldoDep in 'UrCaixaSaldoDep.pas' {FrCaixaSaldoDep},
  URBloquetoSafra in '..\ContaReceber\URBloquetoSafra.pas' {FRBloqueto_Safra},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URResumoIndicadores in 'URResumoIndicadores.pas' {FRResumoIndicadores},
  URBloqueto_Sudameris in '..\ContaReceber\URBloqueto_Sudameris.pas' {FRBloqueto_Sudameris},
  URBloqueto_CEF in '..\ContaReceber\URBloqueto_CEF.pas' {FRBloqueto_CEF},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UVeiculoModeloCad in '..\ControleVeiculo\UVeiculoModeloCad.pas' {FVeiculoModeloCad},
  URVeiculoModelo in '..\ControleVeiculo\URVeiculoModelo.pas' {FRVeiculoModelo},
  UFmFilial in '..\Frames\UFmFilial.pas' {FmFilial: TFrame},
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  UFmHistorico in '..\Frames\UFmHistorico.pas' {FmHistorico: TFrame},
  URFluxoCaixaRealizado in 'URFluxoCaixaRealizado.pas' {FRFluxoCaixaRealizado},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame},
  URFluxoCaixaRealizadoSint in 'URFluxoCaixaRealizadoSint.pas' {FRFluxoCaixaRealizadoSint},
  URCaixa_MovSaldos in 'URCaixa_MovSaldos.pas' {FRCaixa_MovSaldos},
  UContasReceberParam in '..\ContaReceber\UContasReceberParam.pas' {FContasReceberParam},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  UContasReceberCons in '..\ContaReceber\UContasReceberCons.pas' {FContasReceberCons},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UNotaSaidaCons in '..\Vendas\UNotaSaidaCons.pas' {FNotaSaidaCons},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  UProducaoAgricola_cl in '..\Industria\UProducaoAgricola_cl.pas' {DMProducaoAgricola: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  UConhecimentoFrete_cl in '..\Conhecimento\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  UObraContrato_cl in '..\Obra\UObraContrato_cl.pas' {DMObraContrato: TDataModule},
  UObraContrato_Cons in '..\Obra\UObraContrato_Cons.pas' {FObraContrato_Cons},
  UObra_cl in '..\Obra\UObra_cl.pas' {DMObra: TDataModule},
  UObraCons in '..\Obra\UObraCons.pas' {FObraCons},
  UFmContrato in '..\Frames\UFmContrato.pas' {FmContrato: TFrame},
  UContratoVenda_Cons in '..\Agricola\UContratoVenda_Cons.pas' {FContrato_VendaCons},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  UFmFinalidade in '..\Frames\UFmFinalidade.pas' {FmFinalidade: TFrame},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword},
  UScpc_cl in '..\Cadastro\UScpc_cl.pas' {DMScpc: TDataModule},
  UScpcCons in '..\Cadastro\UScpcCons.pas' {FScpcCons},
  URCaixa_MovCaixaCliente in 'URCaixa_MovCaixaCliente.pas' {FRCaixa_MovCaixaCliente},
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  UVeiculoConhecimento_cl in '..\ControleVeiculo\UVeiculoConhecimento_cl.pas' {DMVeiculoConhecimento: TDataModule},
  UMensagemUsuario_cl in '..\Cadastro\UMensagemUsuario_cl.pas' {DmMensagemUsuario: TDataModule},
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UImagemAtalho in '..\Template\UImagemAtalho.pas',
  UTipoLote_cl in '..\Estoque\UTipoLote_cl.pas' {DMTipoLote: TDataModule},
  UNfe_cl in '..\MonitorNfe\UNfe_cl.pas' {DMNfe: TDataModule},
  UNFeParam in '..\MonitorNfe\UNFeParam.pas' {FNFeParam},
  UFmNfeLote in '..\Frames\UFmNfeLote.pas' {FmNfeLote: TFrame},
  UNfEletronicaLote_cl in '..\Vendas\UNfEletronicaLote_cl.pas' {DMNfEletronicaLote: TDataModule},
  NfeUtils in '..\MyLib\NfeUtils.pas',
  URDreCaixa in 'URDreCaixa.pas' {FrDreCaixa},
  UFmBanco in '..\Frames\UFmBanco.pas' {FMBanco: TFrame},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  UNotaItensCons in '..\ContaReceber\UNotaItensCons.pas' {FNotaItensCons},
  UVendaPerdidaCad in '..\Estoque\UVendaPerdidaCad.pas' {FVendaPerdidaCad},
  UProdutos_UltimasCompras in '..\Estoque\UProdutos_UltimasCompras.pas' {FProdutos_UltimasCompras},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  UROrigemDestinoValores in 'UROrigemDestinoValores.pas' {FROrigemDestinoValores},
  UROrigemDestinoValoresHoje in 'UROrigemDestinoValoresHoje.pas' {FROrigemDestinoValoresHoje},
  UROrigemDestinoValoresFinal in 'UROrigemDestinoValoresFinal.pas' {FROrigemDestinoValoresFinal},
  URRazaoPagamentos in 'URRazaoPagamentos.pas' {FRRazaoPagamentos},
  URCaixaMensal in 'URCaixaMensal.pas' {FRCaixaMensal},
  UFmCondominio in '..\Frames\UFmCondominio.pas' {FmCondominio: TFrame},
  UImovel_Cons in '..\Obra\UImovel_Cons.pas' {FImovel_Cons},
  UCondominio_Cons in '..\Obra\UCondominio_Cons.pas' {FCondominio_Cons},
  UImobiliaria_cl in '..\Obra\UImobiliaria_cl.pas' {DMImobiliaria: TDataModule},
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  UEnviaEmail in '..\Agricola\UEnviaEmail.pas' {FEnviaEmail},
  USpedValidacao in '..\Compras\USpedValidacao.pas',
  UFmObra in '..\Frames\UFmObra.pas' {FmObra: TFrame},
  UConhecimento_cl in '..\Conhecimento\UConhecimento_cl.pas' {DMConhecimento: TDataModule},
  UCteLote_cl in '..\Conhecimento\UCteLote_cl.pas' {DMCteLote: TDataModule},
  URBloqueto_Sicoob in '..\ContaReceber\URBloqueto_Sicoob.pas' {FRBloqueto_Sicoob},
  UProdutos_UltimasVendas in '..\Estoque\UProdutos_UltimasVendas.pas' {FProdutos_UltimasVendas},
  UFmTitulo in '..\Frames\UFmTitulo.pas' {FmTitulo: TFrame},
  UFmContaCorrente in '..\Frames\UFmContaCorrente.pas' {FmContaCorrente: TFrame},
  UAdiantamentoCons in '..\Bancos\UAdiantamentoCons.pas' {FAdiantamentoCons},
  UAdiantamento_cl in '..\Bancos\UAdiantamento_cl.pas' {DMAdiantamento: TDataModule},
  UBancoMovCons in '..\Bancos\UBancoMovCons.pas' {FBancoMovCons},
  UTef_cl in '..\Vendas\UTef_cl.pas' {DMTEF: TDataModule},
  UTefInputBox in '..\Vendas\UTefInputBox.pas' {FTefInputBox},
  UTef in '..\Vendas\UTef.pas' {FTEF},
  UTefInputBoxCheque in '..\Vendas\UTefInputBoxCheque.pas' {FTefInputBoxCheque},
  UImpressoraFiscal_cl in '..\Vendas\UImpressoraFiscal_cl.pas' {DMImpressoraFiscal: TDataModule},
  UImpressoraFiscalParam in '..\Vendas\UImpressoraFiscalParam.pas' {FImpressoraFiscalParam},
  UAguarde in '..\ContaReceber\UAguarde.pas' {FAguarde},
  UNotaSaida_Cancela in '..\Vendas\UNotaSaida_Cancela.pas' {FNotaSaida_Cancela},
  UAliquotasImpressora in '..\Vendas\UAliquotasImpressora.pas' {FAliquotasImpressora},
  UImpressoraFiscal in '..\Vendas\UImpressoraFiscal.pas' {FImpressoraFiscal},
  URadioDialog in '..\Vendas\URadioDialog.pas' {FRadioDialog},
  UPDFViewer in 'UPDFViewer.pas' {FPDFViewer},
  UCupomFiscalParam in '..\Vendas\UCupomFiscalParam.pas' {FCupomFiscalParam},
  UEmbarque_cl in '..\Vendas\UEmbarque_cl.pas' {DMEmbarque: TDataModule},
  UMdfeLote_cl in '..\Conhecimento\UMdfeLote_cl.pas' {DMMdfeLote: TDataModule},
  URBloqueto_CEF_SIGCB in '..\ContaReceber\URBloqueto_CEF_SIGCB.pas' {FRBloqueto_CEF_SIGCB},
  UrHistoricosPlanoConta in 'UrHistoricosPlanoConta.pas' {FrHistoricosPlanoConta},
  UrResumoPlanoContas in 'UrResumoPlanoContas.pas' {FrResumoPlanoContas},
  UDevolucaoTroca_cl in '..\Vendas\UDevolucaoTroca_cl.pas' {DMDevolucaoTroca: TDataModule},
  UTabelaPreco_cl in '..\Estoque\UTabelaPreco_cl.pas' {DMTabelaPreco: TDataModule},
  URBoletaBB_SIC in '..\ContaReceber\URBoletaBB_SIC.pas' {FRBoletaBB_SIC},
  UrCaixaBancosAnalitico in 'UrCaixaBancosAnalitico.pas' {FrCaixaBancosAnalitico},
  URCaixa_MovSaldos40Colunas in 'URCaixa_MovSaldos40Colunas.pas' {FRCaixa_MovSaldos40Colunas},
  URBloqueto_Cresol in '..\ContaReceber\URBloqueto_Cresol.pas' {FRBloqueto_Cresol},
  URDreAnalitico in 'URDreAnalitico.pas' {FRELDREANALITICO},
  URBloqueto_Uniprime in '..\ContaReceber\URBloqueto_Uniprime.pas' {FRBloqueto_Uniprime},
  UFTransferenciaCaixaBanco in 'UFTransferenciaCaixaBanco.pas' {FTransferenciaCaixaBanco},
  URDREFinanceiro in 'URDREFinanceiro.pas' {FRDREFinanceiro},
  UCarregando2 in '..\Vendas\UCarregando2.pas' {FCarregando2},
  UOrdemServico_cl in '..\AssitenciaTecnica\UOrdemServico_cl.pas' {DMOrdemServico: TDataModule},
  URCaixa_ResLanc40Col in 'URCaixa_ResLanc40Col.pas' {FRCaixa_ResLanc40Col},
  UVisualizaAmplia in '..\Estoque\UVisualizaAmplia.pas' {FVisualizaAmplia},
  TefUtils in '..\MyLib\Tef\TefUtils.pas',
  URLancamento40colunas in 'URLancamento40colunas.pas' {FRLancamento40colunas},
  UObservacao_Cons in '..\Estoque\UObservacao_Cons.pas' {FObservacao_Cons},
  URSerie in '..\Compras\URSerie.pas' {FRSerie},
  USerieCad in '..\Compras\USerieCad.pas' {FSerieCad},
  URDemonstrativo in 'URDemonstrativo.pas' {FRDemonstrativo},
  UMarca_cl in '..\Estoque\UMarca_cl.pas' {DMMarca: TDataModule},
  UMarcaCons in '..\Estoque\UMarcaCons.pas' {FMarca_Cons},
  URReciboOS in '..\AssitenciaTecnica\URReciboOS.pas' {FRReciboOS},
  URRecibo in '..\ContaPagar\URRecibo.pas' {FRRecibo},
  UProprietario_cl in '..\Conhecimento\UProprietario_cl.pas' {DMProprietario: TDataModule},
  UProprietarioCons in '..\Conhecimento\UProprietarioCons.pas' {FProprietarioCons},
  UVeiculoConhecimentoCons in '..\Conhecimento\UVeiculoConhecimentoCons.pas' {FVeiculoConhecimentoCons},
  URResumoPlanoContasComp in 'URResumoPlanoContasComp.pas' {FRResumoPlanoContasComp};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.Title := 'Sistema de Caixa';
  Application.HelpFile := 'F:\Executaveis\Manual\P_caixa.hlp';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMCaixa, DMCaixa);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMHistContabil, DMHistContabil);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMContabiliza, DMContabiliza);
  Application.CreateForm(TDMCentroCusto, DMCentroCusto);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMVeiculo, DMVeiculo);
  Application.CreateForm(TDMVeiculoFabricante, DMVeiculoFabricante);
  Application.CreateForm(TDMVeiculoModelo, DMVeiculoModelo);
  Application.CreateForm(TDMCustoVeiculoMov, DMCustoVeiculoMov);
  Application.CreateForm(TDMFluxoCaixa, DMFluxoCaixa);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMCaixaRel, DMCaixaRel);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TDMCaixa_Transf, DMCaixa_Transf);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMProducaoAgricola, DMProducaoAgricola);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMObraContrato, DMObraContrato);
  Application.CreateForm(TDMObra, DMObra);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TDMScpc, DMScpc);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TDMVeiculoConhecimento, DMVeiculoConhecimento);
  Application.CreateForm(TDmMensagemUsuario, DmMensagemUsuario);
  Application.CreateForm(TDMTipoLote, DMTipoLote);
  Application.CreateForm(TDMNfe, DMNfe);
  Application.CreateForm(TDMNfEletronicaLote, DMNfEletronicaLote);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TDMImobiliaria, DMImobiliaria);
  Application.CreateForm(TDMConhecimento, DMConhecimento);
  Application.CreateForm(TDMCteLote, DMCteLote);
  Application.CreateForm(TDMAdiantamento, DMAdiantamento);
  Application.CreateForm(TDMTEF, DMTEF);
  Application.CreateForm(TDMImpressoraFiscal, DMImpressoraFiscal);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TDMMdfeLote, DMMdfeLote);
  Application.CreateForm(TDMTabelaPreco, DMTabelaPreco);
  Application.CreateForm(TDMDevolucaoTroca, DMDevolucaoTroca);
  Application.CreateForm(TDMOrdemServico, DMOrdemServico);
  Application.CreateForm(TDMMarca, DMMarca);
  Application.CreateForm(TDMProprietario, DMProprietario);
  Application.CreateForm(TFMenuCaixa, FMenuCaixa);
  FSplash.Hide;
  FSplash.Free;
  Application.Run;
end.
