
program PjContabil;

uses
  Forms,
  UTMenuPrincipal in '..\TEMPLATE\UTMenuPrincipal.pas' {FTMenuPrincipal},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UMenuContabil in 'UMenuContabil.pas' {FMenuContabil},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  ULogin in '..\Seguranca\ULogin.pas' {FLogin},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTrocaSenha in '..\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UParamCadFuncao in '..\Seguranca\UParamCadFuncao.pas' {FParamCadFuncao},
  UHistContabil_cl in 'UHistContabil_cl.pas' {DMHistContabil: TDataModule},
  UHistContabilCad in 'UHistContabilCad.pas' {FHistContabilCad},
  UHistContabilCons in 'UHistContabilCons.pas' {FHistContabilCons},
  UPlanoConta_cl in 'UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  UPlanoContaCad in 'UPlanoContaCad.pas' {FPlanoContaCad},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UPlanoContaCons in 'UPlanoContaCons.pas' {FPlanoContaCons},
  UPlanilha_cl in 'UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  USplash in '..\Banco\USplash.pas' {FSplash},
  ULanctoContabilCad in 'ULanctoContabilCad.pas' {FLanctoContabilCad},
  ULanctoContabilCons in 'ULanctoContabilCons.pas' {FLanctoContabilCons},
  UContasReceber_cl in '..\ContaReceber\UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  UContasReceberCons in '..\ContaReceber\UContasReceberCons.pas' {FContasReceberCons},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UContasPagarCons in '..\ContaPagar\UContasPagarCons.pas' {FContasPagarCons},
  UCaixa_cl in '..\ContaPagar\UCaixa_cl.pas' {DMCaixa: TDataModule},
  UCaixaCons in '..\Caixa\UCaixaCons.pas' {FCaixaCons},
  UHistorico_cl in '..\ContaPagar\UHistorico_cl.pas' {DMHistorico: TDataModule},
  UHistoricoCons in '..\ContaPagar\UHistoricoCons.pas' {FHistoricoCons},
  UBancoMovCons in '..\Bancos\UBancoMovCons.pas' {FBancoMovCons},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UNotaSaidaCons in '..\Vendas\UNotaSaidaCons.pas' {FNotaSaidaCons},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UNotaEntradaCons in '..\Compras\UNotaEntradaCons.pas' {FNotaEntradaCons},
  USaldoContabilCad in 'USaldoContabilCad.pas' {FSaldoContabilCad},
  USaldoContabilCons in 'USaldoContabilCons.pas' {FSaldoContabilCons},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  UContabilParam in 'UContabilParam.pas' {FContabilParam},
  URContabil_RazaoAnalitico in 'URContabil_RazaoAnalitico.pas' {FRContabil_RazaoAnalitico},
  UViradaMes in 'UViradaMes.pas' {FViradaMes},
  URContabil_Balancete_Analit_Mes in 'URContabil_Balancete_Analit_Mes.pas' {FRContabil_Balancete_Analit_Mes},
  URContabil_Balancete_Analit_Acum in 'URContabil_Balancete_Analit_Acum.pas' {FRContabil_Balancete_Analit_Acum},
  UPlanoContasParam in 'UPlanoContasParam.pas' {FPlanoContasParam},
  URPlanoContas in 'URPlanoContas.pas' {FRPlanoContas},
  UZeraExercicio in 'UZeraExercicio.pas' {FZeraExercicio},
  URContabil_Diario in 'URContabil_Diario.pas' {FRContabil_Diario},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UContasReceberParam in '..\ContaReceber\UContasReceberParam.pas' {FContasReceberParam},
  URegiaoCons in '..\Cadastro\URegiaoCons.pas' {FRegiaoCons},
  URegiao_cl in '..\Cadastro\URegiao_cl.pas' {DMRegiao: TDataModule},
  UDRECad in 'UDRECad.pas' {FDRECad},
  UDRECons in 'UDRECons.pas' {FDRECons},
  URDRE in 'URDRE.pas' {FRDRE},
  URDREParam in 'URDREParam.pas' {FDREParam},
  UDRE_cl in 'UDRE_cl.pas' {DMDRE: TDataModule},
  URBalancoPatrimonial in 'URBalancoPatrimonial.pas' {FRBalancoPatrimonial},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  URRomaneioNotas in '..\Agricola\URRomaneioNotas.pas' {FrRomNotaParam},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UEstoqueCons in '..\Estoque\UEstoqueCons.pas' {FEstoqueCons},
  URContabilMovConf in 'URContabilMovConf.pas' {FrContabilMovConf},
  UAtualizaSaldo in 'UAtualizaSaldo.pas' {FAtualizaSaldo},
  ULanctoContabilCad1 in 'ULanctoContabilCad1.pas' {FLanctoContabilCad1},
  ULanctoContabilSimples in 'ULanctoContabilSimples.pas' {FLanctoContabilSimples},
  UContabilAcerto in 'UContabilAcerto.pas' {FContabilAcerto},
  URContabil_Diario1 in 'URContabil_Diario1.pas' {FRContabil_Diario1},
  URHistContabil in 'URHistContabil.pas' {FrHistContabil},
  UHistContabilParam in 'UHistContabilParam.pas' {FHistContabilParam},
  UFGrupo_CustosCons in '..\Custos\UFGrupo_CustosCons.pas' {FGrupo_CustosCons},
  UDMCustos in '..\Custos\UDMCustos.pas' {DMCustos: TDataModule},
  UGrupo_cl in '..\Custos\UGrupo_cl.pas' {DMGrupo: TDataModule},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  UIndiceDesempenhoCad in 'UIndiceDesempenhoCad.pas' {FIndiceDesempenhoCad},
  UIndiceDesempenho_cl in 'UIndiceDesempenho_cl.pas' {DMIndiceDesempenho: TDataModule},
  UIndiceDesempenhoCons in 'UIndiceDesempenhoCons.pas' {FIndiceDesempenhoCons},
  URIndiceDesempenho in 'URIndiceDesempenho.pas' {FRIndiceDesempenho},
  URAvaliacaoDesempenho in 'URAvaliacaoDesempenho.pas' {FRAvaliacaoDesempenho},
  URAnaliseVertical in 'URAnaliseVertical.pas' {FRAnaliseVertical},
  URomaneioCons in '..\Agricola\URomaneioCons.pas' {FRomaneioCons},
  UConhecimentoFrete_cl in '..\Conhecimento\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  URResumoAnual in 'URResumoAnual.pas' {FRResumoAnual},
  UDespesaAntecipada_cl in 'UDespesaAntecipada_cl.pas' {DMDespesaAntecipada: TDataModule},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UDespesaAntecipadaCad in 'UDespesaAntecipadaCad.pas' {FDespesaAntecipadaCad},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  UTConsulta in '..\TEMPLATE\UTConsulta.pas' {FTConsulta},
  UDespesaAntecipadaCons in 'UDespesaAntecipadaCons.pas' {FDespesaAntecipadaCons},
  URDespesaAntecipada in 'URDespesaAntecipada.pas' {FRDespesaAntecipada},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  URelContabil_cl in 'URelContabil_cl.pas' {DMRelContabil: TDataModule},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URSaldoContabil in 'URSaldoContabil.pas' {FRSaldoContabil},
  UCidadeCons in '..\Cadastro\UCidadeCons.pas' {FCidadeCons},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UCidadeCad in '..\Cadastro\UCidadeCad.pas' {FCidadeCad},
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  UEstadoCons in '..\Cadastro\UEstadoCons.pas' {FEstadoCons},
  URCidade_Cidade in '..\Cadastro\URCidade_Cidade.pas' {FRCidade_Cidade},
  UCadastroParam in '..\Cadastro\UCadastroParam.pas' {FCadastroParam},
  URamo_cl in '..\Cadastro\URamo_cl.pas' {DMRamo: TDataModule},
  URamoCons in '..\Cadastro\URamoCons.pas' {FRamoCons},
  UMotivo_cl in '..\Cadastro\UMotivo_cl.pas' {DMMotivo: TDataModule},
  UMotivoCons in '..\Cadastro\UMotivoCons.pas' {FMotivoCons},
  UClassCadastroCons in '..\Cadastro\UClassCadastroCons.pas' {FClassCadastroCons},
  UPraca_cl in '..\Cadastro\UPraca_cl.pas' {DMPraca: TDataModule},
  UPracaCons in '..\Cadastro\UPracaCons.pas' {FPracaCons},
  UnitBoleta in '..\MyLib\UNITBOLETA.pas' {Boleta},
  UBloqueto in '..\ContaReceber\UBloqueto.pas',
  URBoletaBB in '..\ContaReceber\URBoletaBB.pas' {FRBoletaBB},
  URBloqueto_Bradesco in '..\ContaReceber\URBloqueto_Bradesco.pas' {FRBloqueto_Bradesco},
  URBloqueto_HSBC in '..\ContaReceber\URBloqueto_HSBC.pas' {FRBloqueto_HSBC},
  URBloqueto_Rural in '..\ContaReceber\URBloqueto_Rural.pas' {FRBloqueto_Rural},
  UFRBloqueto_Itau in '..\ContaReceber\UFRBloqueto_Itau.pas' {FRBloqueto_Itau},
  URBloqueto_Sicredi in '..\ContaReceber\URBloqueto_Sicredi.pas' {FRBloqueto_Sicredi},
  URBloqueto_Santander in '..\ContaReceber\URBloqueto_Santander.pas' {FRBloqueto_Santander},
  UObraContrato_Cons in '..\Obra\UObraContrato_Cons.pas' {FObraContrato_Cons},
  UObraContrato_cl in '..\Obra\UObraContrato_cl.pas' {DMObraContrato: TDataModule},
  UObraCons in '..\Obra\UObraCons.pas' {FObraCons},
  UObra_cl in '..\Obra\UObra_cl.pas' {DMObra: TDataModule},
  URBloqueto_Unibanco in '..\ContaReceber\URBloqueto_Unibanco.pas' {FRBloqueto_Unibanco},
  URBloquetoSafra in '..\ContaReceber\URBloquetoSafra.pas' {FRBloqueto_Safra},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  URBloqueto_Sudameris in '..\ContaReceber\URBloqueto_Sudameris.pas' {FRBloqueto_Sudameris},
  URBloqueto_CEF in '..\ContaReceber\URBloqueto_CEF.pas' {FRBloqueto_CEF},
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  UFmFilial in '..\Frames\UFmFilial.pas' {FmFilial: TFrame},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UFmContrato in '..\Frames\UFmContrato.pas' {FmContrato: TFrame},
  UContratoVenda_Cons in '..\Agricola\UContratoVenda_Cons.pas' {FContrato_VendaCons},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  UFmFinalidade in '..\Frames\UFmFinalidade.pas' {FmFinalidade: TFrame},
  UTermoAberturaCad in 'UTermoAberturaCad.pas' {FTermoAberturaCad},
  UTermoAbertura_cl in 'UTermoAbertura_cl.pas' {DMTermoAbertura: TDataModule},
  UTermoAberturaCons in 'UTermoAberturaCons.pas' {FTermoAberturaCons},
  UPlanoContaReferencial_cl in 'UPlanoContaReferencial_cl.pas' {DmPlanoContaReferencial: TDataModule},
  UPlanoContaReferencialCad in 'UPlanoContaReferencialCad.pas' {FPlanoContaReferencialCad},
  UPlanoContaReferencialCons in 'UPlanoContaReferencialCons.pas' {FPlanoContaReferencialCons},
  UArquivoSinco in '..\Livros\UArquivoSinco.pas' {FArquivoSinco},
  URegINSS in '..\Livros\URegINSS.pas' {FRegINSSParam},
  URegINSS_cl in '..\Livros\URegINSS_cl.pas' {DMRegINSS: TDataModule},
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword},
  UScpc_cl in '..\Cadastro\UScpc_cl.pas' {DMScpc: TDataModule},
  UScpcCons in '..\Cadastro\UScpcCons.pas' {FScpcCons},
  UTermoAberturaParam in 'UTermoAberturaParam.pas' {FTermoAberturaParam},
  URTermoDiario in 'URTermoDiario.pas' {FRTermoDiario},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  URPlanoContaReferencial in 'URPlanoContaReferencial.pas' {FRPlanoContaReferencial},
  URDRECadastro in 'URDRECadastro.pas' {FRDRECadastro},
  UPlanoContaAntigoCad in 'UPlanoContaAntigoCad.pas' {FPlanoContaAntigoCad},
  UFmContaCorrente in '..\Frames\UFmContaCorrente.pas' {FmContaCorrente: TFrame},
  UMensagemUsuario_cl in '..\Cadastro\UMensagemUsuario_cl.pas' {DmMensagemUsuario: TDataModule},
  UPlanoContaAntigoCons in 'UPlanoContaAntigoCons.pas' {FPlanoContaAntigoCons},
  URPlanoContas_Relacionamento in 'URPlanoContas_Relacionamento.pas' {FRPlanoContas_Relacionamento},
  UImagemAtalho in '..\Template\UImagemAtalho.pas',
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UTipoLote_cl in '..\Estoque\UTipoLote_cl.pas' {DMTipoLote: TDataModule},
  UNfe_cl in '..\MonitorNfe\UNfe_cl.pas' {DMNfe: TDataModule},
  UNFeParam in '..\MonitorNfe\UNFeParam.pas',
  UFmNfeLote in '..\Frames\UFmNfeLote.pas' {FmNfeLote: TFrame},
  UNfEletronicaLote_cl in '..\Vendas\UNfEletronicaLote_cl.pas' {DMNfEletronicaLote: TDataModule},
  UFmBanco in '..\Frames\UFmBanco.pas' {FMBanco: TFrame},
  UNotaItensCons in '..\ContaReceber\UNotaItensCons.pas' {FNotaItensCons},
  UVendaPerdidaCad in '..\Estoque\UVendaPerdidaCad.pas' {FVendaPerdidaCad},
  UProdutos_UltimasCompras in '..\Estoque\UProdutos_UltimasCompras.pas' {FProdutos_UltimasCompras},
  USped_cl in '..\SPED\USped_cl.pas' {DmSped: TDataModule},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  UMensagemNotaExplicativa in 'UMensagemNotaExplicativa.pas' {FMensagemNotaExplicativa},
  URDfc in 'URDfc.pas' {FRDfc},
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  UEnviaEmail in '..\Agricola\UEnviaEmail.pas' {FEnviaEmail},
  USpedValidacao in '..\Compras\USpedValidacao.pas',
  UFmObra in '..\Frames\UFmObra.pas' {FmObra: TFrame},
  UConhecimento_cl in '..\Conhecimento\UConhecimento_cl.pas' {DMConhecimento: TDataModule},
  UCteLote_cl in '..\Conhecimento\UCteLote_cl.pas' {DMCteLote: TDataModule},
  URBloqueto_Sicoob in '..\ContaReceber\URBloqueto_Sicoob.pas' {FRBloqueto_Sicoob},
  UAguarde in '..\ContaReceber\UAguarde.pas' {FAguarde},
  UFmTitulo in '..\Frames\UFmTitulo.pas' {FmTitulo: TFrame},
  UProdutos_UltimasVendas in '..\Estoque\UProdutos_UltimasVendas.pas' {FProdutos_UltimasVendas},
  UImpressoraFiscal in '..\Vendas\UImpressoraFiscal.pas' {FImpressoraFiscal},
  UImpressoraFiscal_cl in '..\Vendas\UImpressoraFiscal_cl.pas' {DMImpressoraFiscal: TDataModule},
  UImpressoraFiscalParam in '..\Vendas\UImpressoraFiscalParam.pas' {FImpressoraFiscalParam},
  UTef in '..\Vendas\UTef.pas' {FTEF},
  UTef_cl in '..\Vendas\UTef_cl.pas' {DMTEF: TDataModule},
  UTefInputBox in '..\Vendas\UTefInputBox.pas' {FTefInputBox},
  UTefInputBoxCheque in '..\Vendas\UTefInputBoxCheque.pas' {FTefInputBoxCheque},
  UAliquotasImpressora in '..\Vendas\UAliquotasImpressora.pas' {FAliquotasImpressora},
  UNotaSaida_Cancela in '..\Vendas\UNotaSaida_Cancela.pas' {FNotaSaida_Cancela},
  URadioDialog in '..\Vendas\URadioDialog.pas' {FRadioDialog},
  UEmbarque_cl in '..\Vendas\UEmbarque_cl.pas' {DMEmbarque: TDataModule},
  UCupomFiscalParam in '..\Vendas\UCupomFiscalParam.pas' {FCupomFiscalParam},
  UNotaExplicativaCad in 'UNotaExplicativaCad.pas' {FNotaExplicativaCad},
  UNotaExplicativaCons in 'UNotaExplicativaCons.pas' {FNotaExplicativaCons},
  UMdfeLote_cl in '..\Conhecimento\UMdfeLote_cl.pas' {DMMdfeLote: TDataModule},
  URNotaExplicativa in 'URNotaExplicativa.pas' {FRNotaExplicativa},
  URBloqueto_CEF_SIGCB in '..\ContaReceber\URBloqueto_CEF_SIGCB.pas' {FRBloqueto_CEF_SIGCB},
  UDevolucaoTroca_cl in '..\Vendas\UDevolucaoTroca_cl.pas' {DMDevolucaoTroca: TDataModule},
  UTabelaPreco_cl in '..\Estoque\UTabelaPreco_cl.pas' {DMTabelaPreco: TDataModule},
  URBoletaBB_SIC in '..\ContaReceber\URBoletaBB_SIC.pas' {FRBoletaBB_SIC},
  URNotaExplicativaAux in 'URNotaExplicativaAux.pas' {FRNotaExplicativaAux},
  URBloqueto_Cresol in '..\ContaReceber\URBloqueto_Cresol.pas' {FRBloqueto_Cresol},
  URBloqueto_Uniprime in '..\ContaReceber\URBloqueto_Uniprime.pas' {FRBloqueto_Uniprime},
  UCarregando2 in '..\Vendas\UCarregando2.pas' {FCarregando2},
  UOrdemServico_cl in '..\AssitenciaTecnica\UOrdemServico_cl.pas' {DMOrdemServico: TDataModule},
  UComposicaoCustos_cl in 'UComposicaoCustos_cl.pas' {DMComposicaoCustos: TDataModule},
  UComposicaoCustosCons in 'UComposicaoCustosCons.pas' {FComposicaoCustosCons},
  UComposicaoCustosCad in 'UComposicaoCustosCad.pas' {FComposicaoCustosCad},
  UVisualizaAmplia in '..\Estoque\UVisualizaAmplia.pas' {FVisualizaAmplia},
  UBibVenda in '..\Vendas\UBibVenda.pas',
  UObservacao_Cons in '..\Estoque\UObservacao_Cons.pas' {FObservacao_Cons},
  URSerie in '..\Compras\URSerie.pas' {FRSerie},
  USerieCad in '..\Compras\USerieCad.pas' {FSerieCad},
  UExportaLancamentosContabeis in 'UExportaLancamentosContabeis.pas' {FExportaLancamentosContabeis},
  UMarca_cl in '..\Estoque\UMarca_cl.pas' {DMMarca: TDataModule},
  UMarcaCons in '..\Estoque\UMarcaCons.pas' {FMarca_Cons};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.Title := 'Contabilidade';
  Application.HelpFile := 'F:\Executaveis\Manual\P_CONTÁBIL.HLP';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMHistContabil, DMHistContabil);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TDMCaixa, DMCaixa);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMDRE, DMDRE);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMCustos, DMCustos);
  Application.CreateForm(TDMGrupo, DMGrupo);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMIndiceDesempenho, DMIndiceDesempenho);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMDespesaAntecipada, DMDespesaAntecipada);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDMRelContabil, DMRelContabil);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TDMObraContrato, DMObraContrato);
  Application.CreateForm(TDMObra, DMObra);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TDMTermoAbertura, DMTermoAbertura);
  Application.CreateForm(TDmPlanoContaReferencial, DmPlanoContaReferencial);
  Application.CreateForm(TDMRegINSS, DMRegINSS);
  Application.CreateForm(TDMScpc, DMScpc);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TDmMensagemUsuario, DmMensagemUsuario);
  Application.CreateForm(TDMTipoLote, DMTipoLote);
  Application.CreateForm(TDMNfe, DMNfe);
  Application.CreateForm(TDMNfEletronicaLote, DMNfEletronicaLote);
  Application.CreateForm(TDmSped, DmSped);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TDMConhecimento, DMConhecimento);
  Application.CreateForm(TDMCteLote, DMCteLote);
  Application.CreateForm(TDMImpressoraFiscal, DMImpressoraFiscal);
  Application.CreateForm(TDMTEF, DMTEF);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TDMDevolucaoTroca, DMDevolucaoTroca);
  Application.CreateForm(TDMMdfeLote, DMMdfeLote);
  Application.CreateForm(TDMTabelaPreco, DMTabelaPreco);
  Application.CreateForm(TDMOrdemServico, DMOrdemServico);
  Application.CreateForm(TDMComposicaoCustos, DMComposicaoCustos);
  Application.CreateForm(TDMMarca, DMMarca);
  Application.CreateForm(TFMenuContabil, FMenuContabil);
  Application.CreateForm(TFExportaLancamentosContabeis, FExportaLancamentosContabeis);
  FSplash.Hide;
  FSplash.Free;
  Application.CreateForm(TFMenuContabil, FMenuContabil);
  Application.Run;
end.
