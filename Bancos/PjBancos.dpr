program PjBancos;

uses
  Forms,
  UTMenuPrincipal in '..\TEMPLATE\UTMenuPrincipal.pas' {FTMenuPrincipal},
  UMenuBanco in 'UMenuBanco.pas' {FMenuBancos},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  ULogin in '..\Seguranca\ULogin.pas' {FLogin},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTrocaSenha in '..\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UParamCadFuncao in '..\Seguranca\UParamCadFuncao.pas' {FParamCadFuncao},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UBancosMovCad in 'UBancosMovCad.pas' {FBancosMovCad},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  UHistorico_cl in '..\ContaPagar\UHistorico_cl.pas' {DMHistorico: TDataModule},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UBancoMovCons in 'UBancoMovCons.pas' {FBancoMovCons},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UHistoricoCons in '..\ContaPagar\UHistoricoCons.pas' {FHistoricoCons},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  UBancoscad in '..\ContaPagar\UBancoscad.pas' {FBancosCad},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UEstadoCons in '..\Cadastro\UEstadoCons.pas' {FEstadoCons},
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  UBancoCCorrenteParam in '..\ContaPagar\UBancoCCorrenteParam.pas' {FBancoAgenciaParam},
  URBancoCCorrente in '..\ContaPagar\URBancoCCorrente.pas' {FRBancoCCorrente},
  UEmiteCheque in '..\ContaPagar\UEmiteCheque.pas' {FEmiteCheque},
  UBancoConciliaCad in 'UBancoConciliaCad.pas' {FBancoConciliaCad},
  UBancoConciliaCons in 'UBancoConciliaCons.pas' {FBancoConciliaCons},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UBancoConciliaParam in 'UBancoConciliaParam.pas' {FBancoConciliaParam},
  URBancoConcilia_Cheques in 'URBancoConcilia_Cheques.pas' {FRBancoConcilia_Cheques},
  UBancoMovParam in 'UBancoMovParam.pas' {FBancoMovParam},
  URBancoMov_Cheques_Data in 'URBancoMov_Cheques_Data.pas' {FRBancoMov_Cheques_Data},
  URBancoMov_Cheques_CC in 'URBancoMov_Cheques_CC.pas' {FRBancoMov_Cheques_CC},
  URHistorico in '..\ContaPagar\URHistorico.pas' {FRHistorico},
  UHistoricoParam in '..\ContaPagar\UHistoricoParam.pas' {FHistoricoParam},
  UHistoricoCad in '..\ContaPagar\UHistoricoCad.pas' {FHistoricoCad},
  UHistContabil_cl in '..\Contabil\UHistContabil_cl.pas' {DMHistContabil: TDataModule},
  UHistContabilCons in '..\Contabil\UHistContabilCons.pas' {FHistContabilCons},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  URBancoMov_ChequesPD in 'URBancoMov_ChequesPD.pas' {FRBancoMov_ChequesPD},
  URBancosMov_MovSaldosAvemed in 'URBancosMov_MovSaldosAvemed.pas' {FRBancosMov_MovSaldosAvemed},
  URBancosMov_SaldosBanco in 'URBancosMov_SaldosBanco.pas' {FRBancosMov_SaldosBanco},
  URBancosMov_Lanc in 'URBancosMov_Lanc.pas' {FRBancosMov_Lanc},
  UBancosSaldo in 'UBancosSaldo.pas' {FBancosSaldo},
  URBancoMov_CopCheque in 'URBancoMov_CopCheque.pas' {FRBancoMov_CopCheque},
  USplash in '..\Banco\USplash.pas' {FSplash},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UBancoBaixaCheque in 'UBancoBaixaCheque.pas' {FBancosBaixaCheque},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  UCaixa_cl in '..\ContaPagar\UCaixa_cl.pas' {DMCaixa: TDataModule},
  URCheques_Baixados in 'URCheques_Baixados.pas' {FRCheques_Baixados},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  URMov_Historico in 'URMov_Historico.pas' {FRMov_Historico},
  UContabiliza_cl in '..\Vendas\UContabiliza_cl.pas' {DMContabiliza: TDataModule},
  UContabilizaBancos in 'UContabilizaBancos.pas' {FContabilizaBancos},
  UGrupo_cl in '..\Custos\UGrupo_cl.pas' {DMGrupo: TDataModule},
  UFGrupo_CustosCons in '..\Custos\UFGrupo_CustosCons.pas' {FGrupo_CustosCons},
  URBancosNrCheques in 'URBancosNrCheques.pas' {FRBancosNrCheques},
  UMonitorApl in '..\Banco\UMonitorApl.pas' {FMonitorApl},
  URChequePDatadoPendente in 'URChequePDatadoPendente.pas' {FRChequePDatadoPendente},
  UChequeCad in 'UChequeCad.pas' {FChequeCad},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  URCustodiaCheque in 'URCustodiaCheque.pas' {FRelatorioCustodia},
  URGuiaCustodia in 'URGuiaCustodia.pas' {FRGuiaCustodia},
  URBancoMov_Historico in 'URBancoMov_Historico.pas' {FRMovimentoHistorico},
  URBcoComissaoVendedor in 'URBcoComissaoVendedor.pas' {FRBcoComissaoVendedor},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UCentroCusto_cl in '..\Caixa\UCentroCusto_cl.pas' {DMCentroCusto: TDataModule},
  UCentroCustoCons in '..\Caixa\UCentroCustoCons.pas' {FCentroCustoCons},
  URSaldoDiarioCC in 'URSaldoDiarioCC.pas' {FRSaldoDiarioCC},
  URDep_Pendente in 'URDep_Pendente.pas' {FRDep_Pendente},
  UBancoAgenciaRel_cl in 'UBancoAgenciaRel_cl.pas' {DMBancoAgenciaRel: TDataModule},
  URBaixaDepositoPendente in 'URBaixaDepositoPendente.pas' {FRBaixaDepositoPendente},
  URChequeDevolvido in 'URChequeDevolvido.pas' {FRChequeDevolvido},
  URSaldoMedioPeriodo in 'URSaldoMedioPeriodo.pas' {FRSaldoMedioPeriodo},
  UCidadeCons in '..\Cadastro\UCidadeCons.pas' {FCidadeCons},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UCidadeCad in '..\Cadastro\UCidadeCad.pas' {FCidadeCad},
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
  UBancosBaixaChequeItens in 'UBancosBaixaChequeItens.pas' {FBancosBaixaChequeItens},
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  UContasReceber_cl in '..\ContaReceber\UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UAdiantamento_cl in 'UAdiantamento_cl.pas' {DMAdiantamento: TDataModule},
  UTConsulta in '..\TEMPLATE\UTConsulta.pas' {FTConsulta},
  UAdiantamentoCons in 'UAdiantamentoCons.pas' {FAdiantamentoCons},
  UCaixaCons in '..\Caixa\UCaixaCons.pas' {FCaixaCons},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UAdiantamentoParam in 'UAdiantamentoParam.pas' {FAdiantamentoParam},
  URAdiantamento in 'URAdiantamento.pas' {FRAdiantamento},
  URAdiantamentoBaixa in 'URAdiantamentoBaixa.pas' {FRAdiantamentoBaixa},
  UBloqueto in '..\ContaReceber\UBloqueto.pas',
  UnitBoleta in '..\MyLib\UNITBOLETA.pas' {Boleta},
  URBoletaBB in '..\ContaReceber\URBoletaBB.pas' {FRBoletaBB},
  URBloqueto_Bradesco in '..\ContaReceber\URBloqueto_Bradesco.pas' {FRBloqueto_Bradesco},
  URBloqueto_HSBC in '..\ContaReceber\URBloqueto_HSBC.pas' {FRBloqueto_HSBC},
  URBloqueto_Rural in '..\ContaReceber\URBloqueto_Rural.pas' {FRBloqueto_Rural},
  UFRBloqueto_Itau in '..\ContaReceber\UFRBloqueto_Itau.pas' {FRBloqueto_Itau},
  URBloqueto_Sicredi in '..\ContaReceber\URBloqueto_Sicredi.pas' {FRBloqueto_Sicredi},
  URBloqueto_Santander in '..\ContaReceber\URBloqueto_Santander.pas' {FRBloqueto_Santander},
  URReciboBanco in 'URReciboBanco.pas' {FRReciboBanco},
  URBloqueto_Unibanco in '..\ContaReceber\URBloqueto_Unibanco.pas' {FRBloqueto_Unibanco},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URSaldoMedioPeriodoContaCorrente in 'URSaldoMedioPeriodoContaCorrente.pas' {FRSaldoMedioPeriodoContaCorrente},
  URProtocolo in 'URProtocolo.pas' {FRProtocolo},
  URBloquetoSafra in '..\ContaReceber\URBloquetoSafra.pas' {FRBloqueto_Safra},
  UFinanciamento_cl in 'UFinanciamento_cl.pas' {DMFinanciamento: TDataModule},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UFinanciamentoCad in 'UFinanciamentoCad.pas' {FFinanciamentoCad},
  URBloqueto_Sudameris in '..\ContaReceber\URBloqueto_Sudameris.pas' {FRBloqueto_Sudameris},
  URBloqueto_CEF in '..\ContaReceber\URBloqueto_CEF.pas' {FRBloqueto_CEF},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  UFmClasse in '..\Frames\UFmClasse.pas' {FmClasse: TFrame},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmHistorico in '..\Frames\UFmHistorico.pas' {FmHistorico: TFrame},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UFmFilial in '..\Frames\UFmFilial.pas' {FmFilial: TFrame},
  UAlteraCCMovimento in 'UAlteraCCMovimento.pas' {FAlteraCCMovimento},
  UFmContaCorrente in '..\Frames\UFmContaCorrente.pas' {FmContaCorrente: TFrame},
  UContasReceberParam in '..\ContaReceber\UContasReceberParam.pas',
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  UContasReceberCons in '..\ContaReceber\UContasReceberCons.pas' {FContasReceberCons},
  UNotaSaidaCons in '..\ContaReceber\UNotaSaidaCons.pas' {FNotaSaidaCons},
  UObraContrato_cl in '..\Obra\UObraContrato_cl.pas' {DMObraContrato: TDataModule},
  UObraContrato_Cons in '..\Obra\UObraContrato_Cons.pas' {FObraContrato_Cons},
  UObra_cl in '..\Obra\UObra_cl.pas' {DMObra: TDataModule},
  UObraCons in '..\Obra\UObraCons.pas' {FObraCons},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  URBancosMov_MovSaldos in 'URBancosMov_MovSaldos.pas' {FRBancosMov_MovSaldos},
  URChequesEmitidosContasPagar in 'URChequesEmitidosContasPagar.pas' {FRChequesEmitidosContasPagar},
  UFmContrato in '..\Frames\UFmContrato.pas' {FmContrato: TFrame},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  UContratoVenda_Cons in '..\Agricola\UContratoVenda_Cons.pas' {FContrato_VendaCons},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  UConhecimentoFrete_cl in '..\Agricola\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  UFmFinalidade in '..\Frames\UFmFinalidade.pas' {FmFinalidade: TFrame},
  UScpc_cl in '..\Cadastro\UScpc_cl.pas' {DMScpc: TDataModule},
  UScpcCons in '..\Cadastro\UScpcCons.pas' {FScpcCons},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  UMensagemUsuario_cl in '..\Cadastro\UMensagemUsuario_cl.pas' {DmMensagemUsuario: TDataModule},
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  UFinanciamentoCons in 'UFinanciamentoCons.pas' {FFinanciamentoCons},
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UImagemAtalho in '..\Template\UImagemAtalho.pas',
  UTipoLote_cl in '..\Estoque\UTipoLote_cl.pas' {DMTipoLote: TDataModule},
  UFmNota in '..\Frames\UFmNota.pas' {FmNota: TFrame},
  UFmNfeLote in '..\Frames\UFmNfeLote.pas' {FmNfeLote: TFrame},
  UNotaEntradaCons in '..\Compras\UNotaEntradaCons.pas' {FNotaEntradaCons},
  UNfEletronicaLote_cl in '..\Vendas\UNfEletronicaLote_cl.pas' {DMNfEletronicaLote: TDataModule},
  UNfEletronicaLoteCons in '..\Vendas\UNfEletronicaLoteCons.pas' {FNfEletronicaLoteCons},
  UNfe_cl in '..\MonitorNfe\UNfe_cl.pas' {DMNfe: TDataModule},
  UNFeParam in '..\MonitorNfe\UNFeParam.pas' {FNFeParam},
  UFmBanco in '..\Frames\UFmBanco.pas' {FMBanco: TFrame},
  URBancosMov_Extrato in 'URBancosMov_Extrato.pas' {FRBancosMov_Extrato},
  UNotaItensCons in '..\ContaReceber\UNotaItensCons.pas' {FNotaItensCons},
  UVendaPerdidaCad in '..\Estoque\UVendaPerdidaCad.pas' {FVendaPerdidaCad},
  UProdutos_UltimasCompras in '..\Estoque\UProdutos_UltimasCompras.pas' {FProdutos_UltimasCompras},
  UFinanciamentoParcelas in 'UFinanciamentoParcelas.pas' {FFinanciamentoParcelas},
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  UEnviaEmail in '..\Agricola\UEnviaEmail.pas' {FEnviaEmail},
  USpedValidacao in '..\Compras\USpedValidacao.pas',
  UFmObra in '..\Frames\UFmObra.pas' {FmObra: TFrame},
  UCteLote_cl in '..\Conhecimento\UCteLote_cl.pas' {DMCteLote: TDataModule},
  UConhecimento_cl in '..\Conhecimento\UConhecimento_cl.pas' {DMConhecimento: TDataModule},
  URBloqueto_Sicoob in '..\ContaReceber\URBloqueto_Sicoob.pas' {FRBloqueto_Sicoob},
  UProdutos_UltimasVendas in '..\Estoque\UProdutos_UltimasVendas.pas' {FProdutos_UltimasVendas},
  UFmTitulo in '..\Frames\UFmTitulo.pas' {FmTitulo: TFrame},
  UImpressoraFiscal_cl in '..\Vendas\UImpressoraFiscal_cl.pas' {DMImpressoraFiscal: TDataModule},
  UEmbarque_cl in '..\Vendas\UEmbarque_cl.pas' {DMEmbarque: TDataModule},
  URadioDialog in '..\Vendas\URadioDialog.pas' {FRadioDialog},
  UTef_cl in '..\Vendas\UTef_cl.pas' {DMTEF: TDataModule},
  UTefInputBoxCheque in '..\Vendas\UTefInputBoxCheque.pas' {FTefInputBoxCheque},
  UTefInputBox in '..\Vendas\UTefInputBox.pas' {FTefInputBox},
  UTef in '..\Vendas\UTef.pas' {FTEF},
  UImpressoraFiscalParam in '..\Vendas\UImpressoraFiscalParam.pas' {FImpressoraFiscalParam},
  UNotaSaida_Cancela in '..\Vendas\UNotaSaida_Cancela.pas' {FNotaSaida_Cancela},
  UAliquotasImpressora in '..\Vendas\UAliquotasImpressora.pas' {FAliquotasImpressora},
  UCupomFiscalParam in '..\Vendas\UCupomFiscalParam.pas' {FCupomFiscalParam},
  UImpressoraFiscal in '..\Vendas\UImpressoraFiscal.pas' {FImpressoraFiscal},
  UAguarde in '..\ContaReceber\UAguarde.pas' {FAguarde},
  UMdfeLote_cl in '..\Conhecimento\UMdfeLote_cl.pas' {DMMdfeLote: TDataModule},
  UrHistoricosPlanoConta in '..\Caixa\UrHistoricosPlanoConta.pas' {FrHistoricosPlanoConta},
  URBloqueto_CEF_SIGCB in '..\ContaReceber\URBloqueto_CEF_SIGCB.pas' {FRBloqueto_CEF_SIGCB},
  UDevolucaoTroca_cl in '..\Vendas\UDevolucaoTroca_cl.pas' {DMDevolucaoTroca: TDataModule},
  UTabelaPreco_cl in '..\Estoque\UTabelaPreco_cl.pas' {DMTabelaPreco: TDataModule},
  URBoletaBB_SIC in '..\ContaReceber\URBoletaBB_SIC.pas' {FRBoletaBB_SIC},
  URBloqueto_Cresol in '..\ContaReceber\URBloqueto_Cresol.pas' {FRBloqueto_Cresol},
  URBloqueto_Uniprime in '..\ContaReceber\URBloqueto_Uniprime.pas' {FRBloqueto_Uniprime},
  UCarregando2 in '..\Vendas\UCarregando2.pas' {FCarregando2},
  UOrdemServico_cl in '..\AssitenciaTecnica\UOrdemServico_cl.pas' {DMOrdemServico: TDataModule},
  UVisualizaAmplia in '..\Estoque\UVisualizaAmplia.pas' {FVisualizaAmplia},
  URControleLancamentoCartao in 'URControleLancamentoCartao.pas' {FRControleLancamentoCartao},
  UBandeiraCartao_cl in 'UBandeiraCartao_cl.pas' {DMBandeiraCartao: TDataModule},
  UBandeiraCartaoCad in 'UBandeiraCartaoCad.pas' {FBandeiraCartaoCad},
  UBandeiraCartaoCons in 'UBandeiraCartaoCons.pas' {FBandeiraCartaoCons},
  UObservacao_Cons in '..\Estoque\UObservacao_Cons.pas' {FObservacao_Cons},
  URSerie in '..\Compras\URSerie.pas' {FRSerie},
  USerieCad in '..\Compras\USerieCad.pas' {FSerieCad},
  UPixCad in 'UPixCad.pas' {FContaPixCad},
  UBancoPixCons in 'UBancoPixCons.pas' {FBancoPixCons},
  Cemapa.Conversoes.API in '..\Vendas\Pix\Cemapa.Conversoes.API.pas',
  URBandeiraCartao in 'URBandeiraCartao.pas' {FRBandeiraCartao},
  URBandeiraCartaoTaxas in 'URBandeiraCartaoTaxas.pas' {FRBandeiraCartaoTaxas},
  UMarca_cl in '..\Estoque\UMarca_cl.pas' {DMMarca: TDataModule},
  UMarcaCons in '..\Estoque\UMarcaCons.pas' {FMarca_Cons},
  URReciboOS in '..\AssitenciaTecnica\URReciboOS.pas' {FRReciboOS},
  UVeiculoConhecimento_cl in '..\Conhecimento\UVeiculoConhecimento_cl.pas' {DMVeiculoConhecimento: TDataModule},
  UProprietario_cl in '..\Conhecimento\UProprietario_cl.pas' {DMProprietario: TDataModule},
  UProprietarioCons in '..\Conhecimento\UProprietarioCons.pas' {FProprietarioCons},
  UVeiculoConhecimentoCons in '..\Conhecimento\UVeiculoConhecimentoCons.pas' {FVeiculoConhecimentoCons};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.Title := 'Sistema de Bancos';
  Application.HelpFile := 'F:\Executaveis\Manual\P_bancos.hlp';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMHistContabil, DMHistContabil);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMCaixa, DMCaixa);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMContabiliza, DMContabiliza);
  Application.CreateForm(TDMGrupo, DMGrupo);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMCentroCusto, DMCentroCusto);
  Application.CreateForm(TDMBancoAgenciaRel, DMBancoAgenciaRel);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMAdiantamento, DMAdiantamento);
  Application.CreateForm(TDMFinanciamento, DMFinanciamento);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TDMObraContrato, DMObraContrato);
  Application.CreateForm(TDMObra, DMObra);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMScpc, DMScpc);
  Application.CreateForm(TDmMensagemUsuario, DmMensagemUsuario);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TDMNfe, DMNfe);
  Application.CreateForm(TDMTipoLote, DMTipoLote);
  Application.CreateForm(TDMNfEletronicaLote, DMNfEletronicaLote);
  Application.CreateForm(TDMNfe, DMNfe);
  Application.CreateForm(TDMCteLote, DMCteLote);
  Application.CreateForm(TDMConhecimento, DMConhecimento);
  Application.CreateForm(TDMImpressoraFiscal, DMImpressoraFiscal);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TDMTEF, DMTEF);
  Application.CreateForm(TDMTabelaPreco, DMTabelaPreco);
  Application.CreateForm(TDMDevolucaoTroca, DMDevolucaoTroca);
  Application.CreateForm(TDMBandeiraCartao, DMBandeiraCartao);
  Application.CreateForm(TDMOrdemServico, DMOrdemServico);
  Application.CreateForm(TFMenuBancos, FMenuBancos);
  Application.CreateForm(TDMMarca, DMMarca);
  Application.CreateForm(TDMVeiculoConhecimento, DMVeiculoConhecimento);
  Application.CreateForm(TDMProprietario, DMProprietario);
  FSplash.Hide;
  FSplash.Free;
  Application.Run;
end.
