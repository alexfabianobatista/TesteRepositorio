program PjContasPagar;

uses
  Forms,
  UTMenuPrincipal in '..\TEMPLATE\UTMenuPrincipal.pas' {FTMenuPrincipal},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UTConsulta in '..\TEMPLATE\UTConsulta.pas' {FTConsulta},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UMenuContasPagar in 'UMenuContasPagar.pas' {FMenuContasPagar},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  ULogin in '..\Seguranca\ULogin.pas' {FLogin},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UParamCadFuncao in '..\Seguranca\UParamCadFuncao.pas' {FParamCadFuncao},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UTrocaSenha in '..\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UBancoAgencia_cl in 'UBancoAgencia_cl.pas' {DMBancos: TDataModule},
  UBancoscad in 'UBancoscad.pas' {FBancosCad},
  UEstadoCons in '..\Cadastro\UEstadoCons.pas' {FEstadoCons},
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  UBancosCons in 'UBancosCons.pas' {FBancosCons},
  UFinalidade_cl in 'UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UFinalidadeCad in 'UFinalidadeCad.pas' {FFinalidadeCad},
  UMoedaCons in '..\Cadastro\UMoedaCons.pas' {FMoedaCons},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  UFinalidadeCons in 'UFinalidadeCons.pas' {FFinalidadeCons},
  UContasPagarCad in 'UContasPagarCad.pas' {FContasPagarCad},
  UContasPagar_cl in 'UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UContasPagarCons in 'UContasPagarCons.pas' {FContasPagarCons},
  UContasPagarBaixa in 'UContasPagarBaixa.pas' {FContaPagarBaixa},
  UContasPagarParam in 'UContasPagarParam.pas' {FContasPagarParam},
  URContasPagar_Vencimento in 'URContasPagar_Vencimento.pas' {FRContasPagar_Vencimentos},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UCaixa_cl in 'UCaixa_cl.pas' {DMCaixa: TDataModule},
  UContaCorrenteCons in 'UContaCorrenteCons.pas' {FContaCorrenteCons},
  UHistContabil_cl in '..\Contabil\UHistContabil_cl.pas' {DMHistContabil: TDataModule},
  UHistContabilCons in '..\Contabil\UHistContabilCons.pas' {FHistContabilCons},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UHistoricoCad in 'UHistoricoCad.pas' {FHistoricoCad},
  UHistorico_cl in 'UHistorico_cl.pas' {DMHistorico: TDataModule},
  UHistoricoCons in 'UHistoricoCons.pas' {FHistoricoCons},
  URContasPagarFornecedor in 'URContasPagarFornecedor.pas' {FRContasPagar_Fornecedor},
  URBancoCCorrente in 'URBancoCCorrente.pas' {FRBancoCCorrente},
  UBancoCCorrenteParam in 'UBancoCCorrenteParam.pas' {FBancoAgenciaParam},
  UFinalidadeParam in 'UFinalidadeParam.pas' {FFinalidadeParam},
  URFinalidade in 'URFinalidade.pas' {FRFinalidade},
  URContasPagarMov in 'URContasPagarMov.pas' {FRContasPagarMov},
  URContasPagar_TitulosBaixados in 'URContasPagar_TitulosBaixados.pas' {FRContasPagar_TitulosBaixados},
  UEmiteCheque in 'UEmiteCheque.pas' {FEmiteCheque},
  URContasPagar_TitulosAbertos in 'URContasPagar_TitulosAbertos.pas' {FRContasPagar_TitulosAberto},
  URRecibo in 'URRecibo.pas' {FRRecibo},
  UEmiteRecibo in 'UEmiteRecibo.pas' {FEmiteRecibo},
  ULiberarBaixa in 'ULiberarBaixa.pas' {FLiberaBaixa},
  UContasReceber_cl in '..\ContaReceber\UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  UContasReceberCons in '..\ContaReceber\UContasReceberCons.pas' {FContasReceberCons},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  USplash in '..\Banco\USplash.pas' {FSplash},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UContasPagarVoltaBaixa in 'UContasPagarVoltaBaixa.pas' {FContaPagarVoltaBaixa},
  UContasReceberParam in '..\ContaReceber\UContasReceberParam.pas' {FContasReceberParam},
  URegiaoCons in '..\Cadastro\URegiaoCons.pas' {FRegiaoCons},
  URegiao_cl in '..\Cadastro\URegiao_cl.pas' {DMRegiao: TDataModule},
  UNotaSaidaCons in '..\Vendas\UNotaSaidaCons.pas' {FNotaSaidaCons},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  URRomaneioNotas in '..\Agricola\URRomaneioNotas.pas' {FrRomNotaParam},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UEstoqueCons in '..\Estoque\UEstoqueCons.pas' {FEstoqueCons},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  UContabiliza_cl in '..\Vendas\UContabiliza_cl.pas' {DMContabiliza: TDataModule},
  UContabiliza_CP in 'UContabiliza_CP.pas' {FContabiliza_CP},
  UFGrupo_CustosCons in '..\Custos\UFGrupo_CustosCons.pas' {FGrupo_CustosCons},
  UGrupo_cl in '..\Custos\UGrupo_cl.pas' {DMGrupo: TDataModule},
  URBancoMov_CopCheque in '..\Bancos\URBancoMov_CopCheque.pas' {FRBancoMov_CopCheque},
  URPgto_Dpto_Finalidade in 'URPgto_Dpto_Finalidade.pas' {FRPagto_Dpto_Finalidade},
  URContaPagarTotalDia in 'URContaPagarTotalDia.pas' {FRContaPagarTotalDia},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  URomaneioCons in '..\Agricola\URomaneioCons.pas' {FRomaneioCons},
  UObra_cl in '..\Obra\UObra_cl.pas' {DMObra: TDataModule},
  UObraCons in '..\Obra\UObraCons.pas' {FObraCons},
  UConhecimentoFrete_cl in '..\Conhecimento\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  UCentroCusto_cl in '..\Caixa\UCentroCusto_cl.pas' {DMCentroCusto: TDataModule},
  UCentroCustoCons in '..\Caixa\UCentroCustoCons.pas' {FCentroCustoCons},
  UCustoVeiculo_CP in 'UCustoVeiculo_CP.pas' {FCustoVeiculo_CP},
  UVeiculo_cl in '..\ControleVeiculo\UVeiculo_cl.pas' {DMVeiculo: TDataModule},
  UCustoVeiculoMov_cl in '..\ControleVeiculo\UCustoVeiculoMov_cl.pas' {DMCustoVeiculoMov: TDataModule},
  UVeiculoCons in '..\ControleVeiculo\UVeiculoCons.pas' {FVeiculoCons},
  UVeiculoModelo_cl in '..\ControleVeiculo\UVeiculoModelo_cl.pas' {DMVeiculoModelo: TDataModule},
  UVeiculoModeloCons in '..\ControleVeiculo\UVeiculoModeloCons.pas' {FVeiculoModeloCons},
  UVeiculoFabricante_cl in '..\ControleVeiculo\UVeiculoFabricante_cl.pas' {DMVeiculoFabricante: TDataModule},
  UVeiculoFabricanteCons in '..\ControleVeiculo\UVeiculoFabricanteCons.pas' {FVeiculoFabricanteCons},
  URelContasPagar_cl in 'URelContasPagar_cl.pas' {DMRelContasPagar: TDataModule},
  URContasPagar_Finalidade in 'URContasPagar_Finalidade.pas' {FRContasPagar_Finalidade},
  UBancoAgenciaRel_cl in '..\Bancos\UBancoAgenciaRel_cl.pas' {DMBancoAgenciaRel: TDataModule},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  UOrdemCompra_cl in '..\Compras\UOrdemCompra_cl.pas' {DMOrdemCompra: TDataModule},
  UOrdem_Compra_ItensCons in '..\Compras\UOrdem_Compra_ItensCons.pas' {FOrdem_Compra_ItensCons},
  UOrdemCompraCons in '..\Compras\UOrdemCompraCons.pas' {FOrdemCompraCons},
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
  UAdiantamentoCons in '..\Bancos\UAdiantamentoCons.pas' {FAdiantamentoCons},
  UAdiantamento_cl in '..\Bancos\UAdiantamento_cl.pas' {DMAdiantamento: TDataModule},
  UCaixaCons in '..\Caixa\UCaixaCons.pas' {FCaixaCons},
  UBancoMovCons in '..\Bancos\UBancoMovCons.pas' {FBancoMovCons},
  UBloqueto in '..\ContaReceber\UBloqueto.pas',
  UnitBoleta in '..\MyLib\UNITBOLETA.pas' {Boleta},
  URBoletaBB in '..\ContaReceber\URBoletaBB.pas' {FRBoletaBB},
  URBloqueto_Bradesco in '..\ContaReceber\URBloqueto_Bradesco.pas' {FRBloqueto_Bradesco},
  URBloqueto_HSBC in '..\ContaReceber\URBloqueto_HSBC.pas' {FRBloqueto_HSBC},
  URBloqueto_Rural in '..\ContaReceber\URBloqueto_Rural.pas' {FRBloqueto_Rural},
  UFRBloqueto_Itau in '..\ContaReceber\UFRBloqueto_Itau.pas' {FRBloqueto_Itau},
  URBloqueto_Sicredi in '..\ContaReceber\URBloqueto_Sicredi.pas' {FRBloqueto_Sicredi},
  URBloqueto_Santander in '..\ContaReceber\URBloqueto_Santander.pas' {FRBloqueto_Santander},
  UObraContrato_Cons in '..\Obra\UObraContrato_Cons.pas' {FObraContrato_Cons},
  UObraContrato_cl in '..\Obra\UObraContrato_cl.pas' {DMObraContrato: TDataModule},
  URTotalPagarFornecedor in 'URTotalPagarFornecedor.pas' {FRTotalPagarFornecedor},
  URBloqueto_Unibanco in '..\ContaReceber\URBloqueto_Unibanco.pas' {FRBloqueto_Unibanco},
  URecibo_Dos in '..\ContaReceber\URecibo_Dos.pas',
  URBloquetoSafra in '..\ContaReceber\URBloquetoSafra.pas' {FRBloqueto_Safra},
  URTitulosAberto_Depto_Sintetico in 'URTitulosAberto_Depto_Sintetico.pas' {FRTituloAberto_Depto_Sintetico},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URConcilia_Cp_Cr in 'URConcilia_Cp_Cr.pas' {FRConcilia_Cp_Cr},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  URBloqueto_Sudameris in '..\ContaReceber\URBloqueto_Sudameris.pas' {FRBloqueto_Sudameris},
  URBloqueto_CEF in '..\ContaReceber\URBloqueto_CEF.pas' {FRBloqueto_CEF},
  UContasPagarRel_cl in 'UContasPagarRel_cl.pas' {DMContasPagarRel: TDataModule},
  URContasPagar_Descontos in 'URContasPagar_Descontos.pas' {FRContasPagar_Descontos},
  URPromissoria_Branco in '..\ContaReceber\URPromissoria_Branco.pas' {FrPromissoria_Branco},
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  URVeiculoModelo in '..\ControleVeiculo\URVeiculoModelo.pas' {FRVeiculoModelo},
  UVeiculoModeloCad in '..\ControleVeiculo\UVeiculoModeloCad.pas' {FVeiculoModeloCad},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame},
  UFmFilial in '..\Frames\UFmFilial.pas' {FmFilial: TFrame},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  UFmBanco in '..\Frames\UFmBanco.pas' {FMBanco: TFrame},
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  URContasPagarAgendaBaixa in 'URContasPagarAgendaBaixa.pas' {FRContasPagarAgendaBaixa},
  UContasReceber_Rel_cl in '..\ContaReceber\UContasReceber_Rel_cl.pas' {DMContasReceber_Rel: TDataModule},
  URReciboLote in '..\ContaReceber\URReciboLote.pas' {FRReciboLote},
  UFmFinalidade in '..\Frames\UFmFinalidade.pas' {FmFinalidade: TFrame},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  UFmContrato in '..\Frames\UFmContrato.pas' {FmContrato: TFrame},
  UContratoVenda_Cons in '..\Agricola\UContratoVenda_Cons.pas' {FContrato_VendaCons},
  URTitulosAbertos_OutrasMoedas in 'URTitulosAbertos_OutrasMoedas.pas' {FRTitulosAbertos_OutrasMoedas},
  UScpc_cl in '..\Cadastro\UScpc_cl.pas' {DMScpc: TDataModule},
  UScpcCons in '..\Cadastro\UScpcCons.pas' {FScpcCons},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  UFmContaCorrente in '..\Frames\UFmContaCorrente.pas' {FmContaCorrente: TFrame},
  UMensagemUsuario_cl in '..\Cadastro\UMensagemUsuario_cl.pas' {DmMensagemUsuario: TDataModule},
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UImagemAtalho in '..\Template\UImagemAtalho.pas',
  UContasPagarExclusaoLote in 'UContasPagarExclusaoLote.pas' {FContasPagarExclusaoLote},
  UTipoLote_cl in '..\Estoque\UTipoLote_cl.pas' {DMTipoLote: TDataModule},
  UNfe_cl in '..\MonitorNfe\UNfe_cl.pas' {DMNfe: TDataModule},
  UNFeParam in '..\MonitorNfe\UNFeParam.pas' {FNFeParam},
  UFmNfeLote in '..\Frames\UFmNfeLote.pas' {FmNfeLote: TFrame},
  UNfEletronicaLote_cl in '..\Vendas\UNfEletronicaLote_cl.pas' {DMNfEletronicaLote: TDataModule},
  UNotaItensCons in '..\ContaReceber\UNotaItensCons.pas' {FNotaItensCons},
  URContasPagarSintetico in 'URContasPagarSintetico.pas' {FRContasPagarSintetico},
  UVendaPerdidaCad in '..\Estoque\UVendaPerdidaCad.pas' {FVendaPerdidaCad},
  UProdutos_UltimasCompras in '..\Estoque\UProdutos_UltimasCompras.pas' {FProdutos_UltimasCompras},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  UEnviaEmail in '..\Agricola\UEnviaEmail.pas' {FEnviaEmail},
  USpedValidacao in '..\Compras\USpedValidacao.pas',
  UVeiculoConhecimento_cl in '..\ControleVeiculo\UVeiculoConhecimento_cl.pas' {DMVeiculoConhecimento: TDataModule},
  UProprietario_cl in '..\Conhecimento\UProprietario_cl.pas' {DMProprietario: TDataModule},
  UConhecimento_cl in '..\Conhecimento\UConhecimento_cl.pas' {DMConhecimento: TDataModule},
  UFmObra in '..\Frames\UFmObra.pas' {FmObra: TFrame},
  UCteLote_cl in '..\Conhecimento\UCteLote_cl.pas' {DMCteLote: TDataModule},
  URBloqueto_Sicoob in '..\ContaReceber\URBloqueto_Sicoob.pas' {FRBloqueto_Sicoob},
  UProdutos_UltimasVendas in '..\Estoque\UProdutos_UltimasVendas.pas' {FProdutos_UltimasVendas},
  UFmTitulo in '..\Frames\UFmTitulo.pas' {FmTitulo: TFrame},
  URadioDialog in '..\Vendas\URadioDialog.pas' {FRadioDialog},
  UTef_cl in '..\Vendas\UTef_cl.pas' {DMTEF: TDataModule},
  UTefInputBox in '..\Vendas\UTefInputBox.pas' {FTefInputBox},
  UTefInputBoxCheque in '..\Vendas\UTefInputBoxCheque.pas' {FTefInputBoxCheque},
  UTef in '..\Vendas\UTef.pas' {FTEF},
  UImpressoraFiscal_cl in '..\Vendas\UImpressoraFiscal_cl.pas' {DMImpressoraFiscal: TDataModule},
  UImpressoraFiscalParam in '..\Vendas\UImpressoraFiscalParam.pas' {FImpressoraFiscalParam},
  UAguarde in '..\ContaReceber\UAguarde.pas' {FAguarde},
  UNotaSaida_Cancela in '..\Vendas\UNotaSaida_Cancela.pas' {FNotaSaida_Cancela},
  UAliquotasImpressora in '..\Vendas\UAliquotasImpressora.pas' {FAliquotasImpressora},
  UImpressoraFiscal in '..\Vendas\UImpressoraFiscal.pas' {FImpressoraFiscal},
  UEmbarque_cl in '..\Vendas\UEmbarque_cl.pas' {DMEmbarque: TDataModule},
  UMdfeLote_cl in '..\Conhecimento\UMdfeLote_cl.pas' {DMMdfeLote: TDataModule},
  UCupomFiscalParam in '..\Vendas\UCupomFiscalParam.pas' {FCupomFiscalParam},
  UContasReceberJuro in '..\ContaReceber\UContasReceberJuro.pas' {FContaReceberJuro},
  UContasReceberVoltaBaixa in '..\ContaReceber\UContasReceberVoltaBaixa.pas' {FContasReceberVoltaBaixa},
  UNotaEntradaConsulta in '..\ContaReceber\UNotaEntradaConsulta.pas' {FNotaEntradaConsulta},
  ULancaParcelamento in 'ULancaParcelamento.pas' {FLancaParcelamento},
  URBloqueto_CEF_SIGCB in '..\ContaReceber\URBloqueto_CEF_SIGCB.pas' {FRBloqueto_CEF_SIGCB},
  UDevolucaoTroca_cl in '..\Vendas\UDevolucaoTroca_cl.pas' {DMDevolucaoTroca: TDataModule},
  UrHistoricosPlanoConta in '..\Caixa\UrHistoricosPlanoConta.pas' {FrHistoricosPlanoConta},
  UTabelaPreco_cl in '..\Estoque\UTabelaPreco_cl.pas' {DMTabelaPreco: TDataModule},
  URBoletaBB_SIC in '..\ContaReceber\URBoletaBB_SIC.pas' {FRBoletaBB_SIC},
  UBibVenda in '..\Vendas\UBibVenda.pas',
  UNotaAutomaticaFlag in '..\Vendas\UNotaAutomaticaFlag.pas',
  UBibCompra in '..\Compras\UBibCompra.pas',
  URBloqueto_Cresol in '..\ContaReceber\URBloqueto_Cresol.pas' {FRBloqueto_Cresol},
  URBloqueto_Uniprime in '..\ContaReceber\URBloqueto_Uniprime.pas' {FRBloqueto_Uniprime},
  URCustoProducao_CentroCusto in 'URCustoProducao_CentroCusto.pas' {FRCustoProducao_CentroCusto},
  UCarregando2 in '..\Vendas\UCarregando2.pas' {FCarregando2},
  UOrdemServico_cl in '..\AssitenciaTecnica\UOrdemServico_cl.pas' {DMOrdemServico: TDataModule},
  UBibContasPagar in 'UBibContasPagar.pas',
  UVisualizaAmplia in '..\Estoque\UVisualizaAmplia.pas' {FVisualizaAmplia},
  UBandeiraCartao_cl in '..\Bancos\UBandeiraCartao_cl.pas' {DMBandeiraCartao: TDataModule},
  UBandeiraCartaoCons in '..\Bancos\UBandeiraCartaoCons.pas' {FBandeiraCartaoCons},
  UObservacao_Cons in '..\Estoque\UObservacao_Cons.pas' {FObservacao_Cons},
  URTituloPorFinalidadeAnalitico in 'URTituloPorFinalidadeAnalitico.pas' {FRTitulosFinalidadeAnalitico},
  USerieCad in '..\Compras\USerieCad.pas' {FSerieCad},
  URSerie in '..\Compras\URSerie.pas' {FRSerie},
  URBandeiraCartaoTaxas in '..\Bancos\URBandeiraCartaoTaxas.pas' {FRBandeiraCartaoTaxas},
  UPDFViewer in '..\Caixa\UPDFViewer.pas' {FPDFViewer},
  UMarca_cl in '..\Estoque\UMarca_cl.pas' {DMMarca: TDataModule},
  UMarcaCons in '..\Estoque\UMarcaCons.pas' {FMarca_Cons},
  UVeiculoConhecimentoCons in '..\Conhecimento\UVeiculoConhecimentoCons.pas' {FVeiculoConhecimentoCons},
  UProprietarioCons in '..\Conhecimento\UProprietarioCons.pas' {FProprietarioCons};

// UFRContasReceber_Duplicata_Retifoz in '..\ContaReceber\UFRContasReceber_Duplicata_Retifoz.pas' {FRContasReceber_Duplicata_Retifoz: TQuickRep},
//  URReciboLoteTermica in '..\ContaReceber\URReciboLoteTermica.pas' {FRReciboLoteTermica},
//  UContasReceberBaixa in '..\ContaReceber\UContasReceberBaixa.pas' {FContasReceberBaixa};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.Title := 'Sistema Contas à Pagar';
  Application.HelpFile := 'F:\Executaveis\Manual\P_CONTAS PAGAR.HLP';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMCaixa, DMCaixa);
  Application.CreateForm(TDMHistContabil, DMHistContabil);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMContabiliza, DMContabiliza);
  Application.CreateForm(TDMGrupo, DMGrupo);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMObra, DMObra);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMCentroCusto, DMCentroCusto);
  Application.CreateForm(TDMVeiculo, DMVeiculo);
  Application.CreateForm(TDMCustoVeiculoMov, DMCustoVeiculoMov);
  Application.CreateForm(TDMVeiculoModelo, DMVeiculoModelo);
  Application.CreateForm(TDMVeiculoFabricante, DMVeiculoFabricante);
  Application.CreateForm(TDMRelContasPagar, DMRelContasPagar);
  Application.CreateForm(TDMBancoAgenciaRel, DMBancoAgenciaRel);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDMOrdemCompra, DMOrdemCompra);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TDMAdiantamento, DMAdiantamento);
  Application.CreateForm(TDMObraContrato, DMObraContrato);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMContasPagarRel, DMContasPagarRel);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TDMContasReceber_Rel, DMContasReceber_Rel);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TDMScpc, DMScpc);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TDmMensagemUsuario, DmMensagemUsuario);
  Application.CreateForm(TDMTipoLote, DMTipoLote);
  Application.CreateForm(TDMNfe, DMNfe);
  Application.CreateForm(TDMNfEletronicaLote, DMNfEletronicaLote);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TDMVeiculoConhecimento, DMVeiculoConhecimento);
  Application.CreateForm(TDMProprietario, DMProprietario);
  Application.CreateForm(TDMConhecimento, DMConhecimento);
  Application.CreateForm(TDMCteLote, DMCteLote);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TDMDevolucaoTroca, DMDevolucaoTroca);
  Application.CreateForm(TDMMdfeLote, DMMdfeLote);
  Application.CreateForm(TDMTabelaPreco, DMTabelaPreco);
  Application.CreateForm(TDMBandeiraCartao, DMBandeiraCartao);
  Application.CreateForm(TDMMarca, DMMarca);
  Application.CreateForm(TFMenuContasPagar, FMenuContasPagar);
  FSplash.Hide;
  FSplash.Free;
  Application.Run;
end.
