program PjOperacaoCambio;

uses
  Forms,
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UOperacaoCambio_cl in 'UOperacaoCambio_cl.pas' {DMOperacaoCambio: TDataModule},
  USplash in '..\Banco\USplash.pas' {FSplash},
  UTMenuPrincipal in '..\Template\UTMenuPrincipal.pas' {FTMenuPrincipal},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UMenuOperacaoCambio in 'UMenuOperacaoCambio.pas' {FMenuOperacaoCambio},
  UUsuario_cl in '..\seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UTela_cl in '..\seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UOperacaoCambioACCCad in 'UOperacaoCambioACCCad.pas' {FOperacaoCambioACCCad},
  UTConsulta in '..\TEMPLATE\UTConsulta.pas' {FTConsulta},
  UOperacaoCambioACCCons in 'UOperacaoCambioACCCons.pas' {FOperacaoCambioACCCons},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  UContratoVenda_Cons in '..\Agricola\UContratoVenda_Cons.pas' {FContrato_VendaCons},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons},
  UNotaSaidaCons in '..\ContaReceber\UNotaSaidaCons.pas' {FNotaSaidaCons},
  UContasReceber_cl in '..\ContaReceber\UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UHistoricoCons in '..\ContaPagar\UHistoricoCons.pas' {FHistoricoCons},
  UHistorico_cl in '..\ContaPagar\UHistorico_cl.pas' {DMHistorico: TDataModule},
  UOperacaoCambioPRTCad in 'UOperacaoCambioPRTCad.pas' {FOperacaoCambioPRTCad},
  UOperacaoCambioPRTCons in 'UOperacaoCambioPRTCons.pas' {FOperacaoCambioPRTCons},
  UOperacaoCambioTRVCad in 'UOperacaoCambioTRVCad.pas' {FOperacaoCambioTRVCad},
  UOperacaoCambioTRVCons in 'UOperacaoCambioTRVCons.pas' {FOperacaoCambioTRVCons},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URRelacaoOperacaoCambioACC in 'URRelacaoOperacaoCambioACC.pas' {FRRelacaoOperacaoCambioACC},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UOperacaoCambioParam in 'UOperacaoCambioParam.pas' {FOperacaoCambioParam},
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
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
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
  URomaneioCons in '..\Agricola\URomaneioCons.pas' {FRomaneioCons},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  UConhecimentoFrete_cl in '..\Conhecimento\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  URLiquidacoesOpercaoCambioACC in 'URLiquidacoesOpercaoCambioACC.pas' {FRLiquidacoesOpercaoCambioACC},
  URRelacaoOperacaoCambioPRT in 'URRelacaoOperacaoCambioPRT.pas' {FROperacaoCambioPRT},
  UROperacaoCambioTRV in 'UROperacaoCambioTRV.pas' {FROperacaoCambioTRV},
  UROperacaoCambioTRVLiq in 'UROperacaoCambioTRVLiq.pas' {FROperacaoCambioTRVLiq},
  ULimiteBancoCad in 'ULimiteBancoCad.pas' {FLimiteBancoCad},
  ULimiteBanco_cl in 'ULimiteBanco_cl.pas' {DMLimiteBanco: TDataModule},
  ULimiteBancoCons in 'ULimiteBancoCons.pas' {FLimiteBancoCons},
  ULimiteBancoParam in 'ULimiteBancoParam.pas' {FLimiteBancoParam},
  URRelacaoLimiteBanco in 'URRelacaoLimiteBanco.pas' {FRRelacaoLimiteBanco},
  URLiquidacoeOperacaoCambioPRT in 'URLiquidacoeOperacaoCambioPRT.pas' {FRLiquidacoeOperacaoCambioPRT},
  URLimiteACC in 'URLimiteACC.pas' {FRLimiteACC},
  UEGF_cl in 'UEGF_cl.pas' {DMEGF: TDataModule},
  UEGFCad in 'UEGFCad.pas' {FEGFCad},
  UEGFCons in 'UEGFCons.pas' {FEGFCons},
  UEGFParam in 'UEGFParam.pas' {FEGFParam},
  UREGF in 'UREGF.pas' {FREGF},
  URPenhorProduto in 'URPenhorProduto.pas' {FRPenhorProduto},
  UREGFMensal in 'UREGFMensal.pas' {FREGFMensal},
  UEGFBaixaPenhor in 'UEGFBaixaPenhor.pas' {FEGFBaixaPenhor},
  UBloqueto in '..\ContaReceber\UBloqueto.pas',
  UnitBoleta in '..\MyLib\UNITBOLETA.pas' {Boleta},
  URBoletaBB in '..\ContaReceber\URBoletaBB.pas' {FRBoletaBB},
  URBloqueto_Bradesco in '..\ContaReceber\URBloqueto_Bradesco.pas' {FRBloqueto_Bradesco},
  URBloqueto_HSBC in '..\ContaReceber\URBloqueto_HSBC.pas' {FRBloqueto_HSBC},
  URBloqueto_Rural in '..\ContaReceber\URBloqueto_Rural.pas' {FRBloqueto_Rural},
  UFRBloqueto_Itau in '..\ContaReceber\UFRBloqueto_Itau.pas' {FRBloqueto_Itau},
  URBloqueto_Sicredi in '..\ContaReceber\URBloqueto_Sicredi.pas' {FRBloqueto_Sicredi},
  UROperACCAplicadoContratoVenda in 'UROperACCAplicadoContratoVenda.pas' {FROperACCAplicadoContratoVenda},
  UROperPRTAplicadoContratoVenda in 'UROperPRTAplicadoContratoVenda.pas' {FROperPRTAplicadoContratoVenda},
  UROperTRVAplicadoContratoVenda in 'UROperTRVAplicadoContratoVenda.pas' {FROperTRVAplicadoContratoVenda},
  UROperACCAplicarContratoVenda in 'UROperACCAplicarContratoVenda.pas' {FROperACCAplicarContratoVenda},
  UROperPRTAplicarContratoVenda in 'UROperPRTAplicarContratoVenda.pas' {FROperPRTAplicarContratoVenda},
  UROperTRVAplicarContratoVenda in 'UROperTRVAplicarContratoVenda.pas' {FROperTRVAplicarContratoVenda},
  URBloqueto_Santander in '..\ContaReceber\URBloqueto_Santander.pas' {FRBloqueto_Santander},
  UVariacaoCambialParam in 'UVariacaoCambialParam.pas' {FVariacaoCambialParam},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  URVariacaoCambialACC in 'URVariacaoCambialACC.pas' {FRVariacaoCambialACC},
  URBloqueto_Unibanco in '..\ContaReceber\URBloqueto_Unibanco.pas' {FRBloqueto_Unibanco},
  UOperacaoCambioSWPCad in 'UOperacaoCambioSWPCad.pas' {FOperacaoCambioSWPCad},
  UOperacaoCambioSWPCons in 'UOperacaoCambioSWPCons.pas' {FOperacaoCambioSWPCons},
  URRelacaoOperacaoCambioSWP in 'URRelacaoOperacaoCambioSWP.pas' {FRRelacaoOperacaoCambioSWP},
  UOperacaoCambioEPTCad in 'UOperacaoCambioEPTCad.pas' {FOperacaoCambioEPTCad},
  UOperacaoCambioEPTCons in 'UOperacaoCambioEPTCons.pas' {FOperacaoCambioEPTCons},
  URRelacaoOperacaoCambioEPT in 'URRelacaoOperacaoCambioEPT.pas' {FRRelacaoOperacaoCambioEPT},
  URLiquidacaoOpercaoCambioEPT in 'URLiquidacaoOpercaoCambioEPT.pas' {FRLiquidacaoOpercaoCambioEPT},
  URVariacaoCambialEPT in 'URVariacaoCambialEPT.pas' {FRVariacaoCambialEPT},
  URLiquidacoesOpercaoCambioSWP in 'URLiquidacoesOpercaoCambioSWP.pas' {FRLiquidacoesOpercaoCambioSWP},
  URBloquetoSafra in '..\ContaReceber\URBloquetoSafra.pas' {FRBloqueto_Safra},
  URBloqueto_Sudameris in '..\ContaReceber\URBloqueto_Sudameris.pas' {FRBloqueto_Sudameris},
  URBloqueto_CEF in '..\ContaReceber\URBloqueto_CEF.pas' {FRBloqueto_CEF},
  UAplicacaoFinanceira_cl in 'UAplicacaoFinanceira_cl.pas' {DMAplicacaoFinanceira: TDataModule},
  UAplicacaoFinanceiraCad in 'UAplicacaoFinanceiraCad.pas' {FAplicacaoFinanceiraCad},
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  UAplicacaoFinanceiraCons in 'UAplicacaoFinanceiraCons.pas' {FAplicacaoFinanceiraCons},
  UAplicacaoFinanceiraMov in 'UAplicacaoFinanceiraMov.pas' {FAplicacaoFinanceiraMov},
  UAplicacaoFinanceiraVoltaMov in 'UAplicacaoFinanceiraVoltaMov.pas' {FAplicacaoFinanceiraVoltaMov},
  UAplicacaoFinanceiraMovCons in 'UAplicacaoFinanceiraMovCons.pas' {FAplicacaoFinanceiraMovCons},
  URAplicacaoFinanceira in 'URAplicacaoFinanceira.pas' {FRAplicacaoFinanceira},
  UAplicacaoFinanceiraParam in 'UAplicacaoFinanceiraParam.pas' {FAplicacaoFinanceiraParam},
  UFmFilial in '..\Frames\UFmFilial.pas' {FmFilial: TFrame},
  UFmHistorico in '..\Frames\UFmHistorico.pas' {FmHistorico: TFrame},
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  UPremioExportacao in 'UPremioExportacao.pas' {FPremioExportacao},
  UPremioExportacao_cl in 'UPremioExportacao_cl.pas' {DMPremioExportacao: TDataModule},
  UPremioExportacaoCons in 'UPremioExportacaoCons.pas' {FPremioExportacaoCons},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  URPremioExportacao in 'URPremioExportacao.pas' {FRPremioExportacao},
  UPremioExportacaoParam in 'UPremioExportacaoParam.pas' {FPremioExportacaoParam},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UFmContaCorrente in '..\Frames\UFmContaCorrente.pas' {FmContaCorrente: TFrame},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame},
  UContasReceberParam in '..\ContaReceber\UContasReceberParam.pas' {FContasReceberParam},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  UContasReceberCons in '..\ContaReceber\UContasReceberCons.pas' {FContasReceberCons},
  UObraContrato_Cons in '..\Obra\UObraContrato_Cons.pas' {FObraContrato_Cons},
  UObraContrato_cl in '..\Obra\UObraContrato_cl.pas' {DMObraContrato: TDataModule},
  UObraCons in '..\Obra\UObraCons.pas' {FObraCons},
  UObra_cl in '..\Obra\UObra_cl.pas' {DMObra: TDataModule},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UImagemAtalho in '..\Template\UImagemAtalho.pas',
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword},
  UVendaPerdidaCad in '..\Estoque\UVendaPerdidaCad.pas' {FVendaPerdidaCad},
  UProdutos_UltimasCompras in '..\Estoque\UProdutos_UltimasCompras.pas' {FProdutos_UltimasCompras},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UFmContrato in '..\Frames\UFmContrato.pas' {FmContrato: TFrame},
  UFmFinalidade in '..\Frames\UFmFinalidade.pas' {FmFinalidade: TFrame},
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  UFmBanco in '..\Frames\UFmBanco.pas' {FMBanco: TFrame},
  UNfe_cl in '..\MonitorNfe\UNfe_cl.pas' {DMNfe: TDataModule},
  UNFeParam in '..\MonitorNfe\UNFeParam.pas' {FNFeParam},
  UFmNfeLote in '..\Frames\UFmNfeLote.pas' {FmNfeLote: TFrame},
  UNfEletronicaLote_cl in '..\Vendas\UNfEletronicaLote_cl.pas' {DMNfEletronicaLote: TDataModule},
  UTipoLote_cl in '..\Estoque\UTipoLote_cl.pas' {DMTipoLote: TDataModule},
  UNotaItensCons in '..\ContaReceber\UNotaItensCons.pas' {FNotaItensCons},
  UImpressoraFiscal_cl in '..\Vendas\UImpressoraFiscal_cl.pas' {DMImpressoraFiscal: TDataModule},
  UEmbarque_cl in '..\Vendas\UEmbarque_cl.pas' {DMEmbarque: TDataModule},
  UProdutos_UltimasVendas in '..\Estoque\UProdutos_UltimasVendas.pas' {FProdutos_UltimasVendas},
  UFmTitulo in '..\Frames\UFmTitulo.pas' {FmTitulo: TFrame},
  UFmObra in '..\Frames\UFmObra.pas' {FmObra: TFrame},
  URBloqueto_Sicoob in '..\ContaReceber\URBloqueto_Sicoob.pas' {FRBloqueto_Sicoob},
  UConhecimento_cl in '..\Conhecimento\UConhecimento_cl.pas' {DMConhecimento: TDataModule},
  UCteLote_cl in '..\Conhecimento\UCteLote_cl.pas' {DMCteLote: TDataModule},
  UMdfeLote_cl in '..\Conhecimento\UMdfeLote_cl.pas' {DMMdfeLote: TDataModule},
  UTef_cl in '..\Vendas\UTef_cl.pas' {DMTEF: TDataModule},
  UTefInputBox in '..\Vendas\UTefInputBox.pas' {FTefInputBox},
  UTefInputBoxCheque in '..\Vendas\UTefInputBoxCheque.pas' {FTefInputBoxCheque},
  UTef in '..\Vendas\UTef.pas' {FTEF},
  UAliquotasImpressora in '..\Vendas\UAliquotasImpressora.pas' {FAliquotasImpressora},
  UNotaSaida_Cancela in '..\Vendas\UNotaSaida_Cancela.pas' {FNotaSaida_Cancela},
  UCupomFiscalParam in '..\Vendas\UCupomFiscalParam.pas' {FCupomFiscalParam},
  UImpressoraFiscalParam in '..\Vendas\UImpressoraFiscalParam.pas' {FImpressoraFiscalParam},
  UImpressoraFiscal in '..\Vendas\UImpressoraFiscal.pas' {FImpressoraFiscal},
  URBloqueto_CEF_SIGCB in '..\ContaReceber\URBloqueto_CEF_SIGCB.pas' {FRBloqueto_CEF_SIGCB},
  UDevolucaoTroca_cl in '..\Vendas\UDevolucaoTroca_cl.pas' {DMDevolucaoTroca: TDataModule},
  URadioDialog in '..\Vendas\URadioDialog.pas' {FRadioDialog},
  UAguarde in '..\ContaReceber\UAguarde.pas' {FAguarde},
  UEnviaEmail in '..\Agricola\UEnviaEmail.pas' {FEnviaEmail},
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  UTabelaPreco_cl in '..\Estoque\UTabelaPreco_cl.pas' {DMTabelaPreco: TDataModule},
  URBoletaBB_SIC in '..\ContaReceber\URBoletaBB_SIC.pas' {FRBoletaBB_SIC};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;

  Application.Title := 'Sistema de Operação de Câmbio';
  Application.HelpFile := 'F:\Executaveis\Manual\P_caixa.hlp';

  Application.CreateForm(TFMenuOperacaoCambio, FMenuOperacaoCambio);
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMOperacaoCambio, DMOperacaoCambio);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMLimiteBanco, DMLimiteBanco);
  Application.CreateForm(TDMEGF, DMEGF);
  Application.CreateForm(TDMAplicacaoFinanceira, DMAplicacaoFinanceira);
  Application.CreateForm(TFAplicacaoFinanceiraCad, FAplicacaoFinanceiraCad);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TFAplicacaoFinanceiraVoltaMov, FAplicacaoFinanceiraVoltaMov);
  Application.CreateForm(TFAplicacaoFinanceiraMovCons, FAplicacaoFinanceiraMovCons);
  Application.CreateForm(TFRAplicacaoFinanceira, FRAplicacaoFinanceira);
  Application.CreateForm(TFAplicacaoFinanceiraParam, FAplicacaoFinanceiraParam);
  Application.CreateForm(TFPremioExportacao, FPremioExportacao);
  Application.CreateForm(TDMPremioExportacao, DMPremioExportacao);
  Application.CreateForm(TFPremioExportacaoCons, FPremioExportacaoCons);
  Application.CreateForm(TFRPremioExportacao, FRPremioExportacao);
  Application.CreateForm(TFPremioExportacaoParam, FPremioExportacaoParam);
  Application.CreateForm(TFContasReceberParam, FContasReceberParam);
  Application.CreateForm(TFFinalidadeCons, FFinalidadeCons);
  Application.CreateForm(TFContasReceberCons, FContasReceberCons);
  Application.CreateForm(TFObraContrato_Cons, FObraContrato_Cons);
  Application.CreateForm(TDMObraContrato, DMObraContrato);
  Application.CreateForm(TFObraCons, FObraCons);
  Application.CreateForm(TDMObra, DMObra);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TFMensagemCons, FMensagemCons);
  Application.CreateForm(TFEscolheTela, FEscolheTela);
  Application.CreateForm(TFRConsulta, FRConsulta);
  Application.CreateForm(TFPersonalizaRelatorio, FPersonalizaRelatorio);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TFOficinaPassword, FOficinaPassword);
  Application.CreateForm(TFVendaPerdidaCad, FVendaPerdidaCad);
  Application.CreateForm(TFProdutos_UltimasCompras, FProdutos_UltimasCompras);
  Application.CreateForm(TFClasseCons, FClasseCons);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TDMNfe, DMNfe);
  Application.CreateForm(TFNFeParam, FNFeParam);
  Application.CreateForm(TDMNfEletronicaLote, DMNfEletronicaLote);
  Application.CreateForm(TDMTipoLote, DMTipoLote);
  Application.CreateForm(TFNotaItensCons, FNotaItensCons);
  Application.CreateForm(TDMImpressoraFiscal, DMImpressoraFiscal);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TFProdutos_UltimasVendas, FProdutos_UltimasVendas);
  Application.CreateForm(TFRBloqueto_Sicoob, FRBloqueto_Sicoob);
  Application.CreateForm(TDMConhecimento, DMConhecimento);
  Application.CreateForm(TDMCteLote, DMCteLote);
  Application.CreateForm(TDMMdfeLote, DMMdfeLote);
  Application.CreateForm(TDMTEF, DMTEF);
  Application.CreateForm(TFTefInputBox, FTefInputBox);
  Application.CreateForm(TFTefInputBoxCheque, FTefInputBoxCheque);
  Application.CreateForm(TFTEF, FTEF);
  Application.CreateForm(TFAliquotasImpressora, FAliquotasImpressora);
  Application.CreateForm(TFNotaSaida_Cancela, FNotaSaida_Cancela);
  Application.CreateForm(TFCupomFiscalParam, FCupomFiscalParam);
  Application.CreateForm(TFImpressoraFiscalParam, FImpressoraFiscalParam);
  Application.CreateForm(TFImpressoraFiscal, FImpressoraFiscal);
  Application.CreateForm(TFRBloqueto_CEF_SIGCB, FRBloqueto_CEF_SIGCB);
  Application.CreateForm(TDMDevolucaoTroca, DMDevolucaoTroca);
  Application.CreateForm(TFRadioDialog, FRadioDialog);
  Application.CreateForm(TFAguarde, FAguarde);
  Application.CreateForm(TFEnviaEmail, FEnviaEmail);
  Application.CreateForm(TFMensagemSMS, FMensagemSMS);
  Application.CreateForm(TDMTabelaPreco, DMTabelaPreco);
  Application.CreateForm(TFRBoletaBB_SIC, FRBoletaBB_SIC);
  FSplash.Hide;
  FSplash.Free;
  Application.Run;
end.
