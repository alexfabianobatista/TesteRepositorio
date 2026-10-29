program PjLivrosFiscais;

uses
  Forms,
  UTMenuPrincipal in '..\TEMPLATE\UTMenuPrincipal.pas' {FTMenuPrincipal},
  UMenuLivroFiscal in 'UMenuLivroFiscal.pas' {FMenuLivroFiscal},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  ULogin in '..\Seguranca\ULogin.pas' {FLogin},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UTrocaSenha in '..\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UParamCadFuncao in '..\Seguranca\UParamCadFuncao.pas' {FParamCadFuncao},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  URegEntrada_cl in 'URegEntrada_cl.pas' {DMRegEntrada: TDataModule},
  URegEntradaParam in 'URegEntradaParam.pas' {FRegEntradaParam},
  URRegSaida in 'URRegSaida.pas' {FRRegSaida: TQuickRep},
  UFilialCons in '..\Cadastro\UFilialCons.pas',
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  URegSaida_cl in 'URegSaida_cl.pas' {DMRegSaida: TDataModule},
  URegSaidaParam in 'URegSaidaParam.pas' {FRegSaidaParam},
  URRegEntrada in 'URRegEntrada.pas' {FRRegEntrada: TQuickRep},
  UApuracaoParam in 'UApuracaoParam.pas' {FApuracaoParam},
  URApuracaoS in 'URApuracaoS.pas' {FRApuracaoS},
  URApuracaoE in 'URApuracaoE.pas' {FRApuracaoE},
  URApuracaoResumo in 'URApuracaoResumo.pas' {FRApuracaoResumo},
  ULivroFiscal_Cl in 'ULivroFiscal_Cl.pas' {DMLivroFiscal: TDataModule},
  ULivroFiscalCad in 'ULivroFiscalCad.pas' {FLivroFiscalCad},
  ULivroFiscalCons in 'ULivroFiscalCons.pas' {FLivroFiscalCons},
  USplash in '..\Banco\USplash.pas' {FSplash},
  URelPreview in '..\Template\URelPreview.pas' {FRelPreview},
  UGia_cl in 'UGia_cl.pas' {DMGia: TDataModule},
  UGiaCad in 'UGiaCad.pas' {FGiaCad},
  UGiaCons in 'UGiaCons.pas' {FGiaCons},
  URGia in 'URGia.pas' {FRGia},
  URNotasOperacao in 'URNotasOperacao.pas' {FRNotasOperacao},
  ULivroFiscalParam in 'ULivroFiscalParam.pas' {FLivroFiscalParam},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UOperacaoCons in '..\Compras\UOperacaoCons.pas' {FOperacaoCons},
  URNotasOperacaoResumo in 'URNotasOperacaoResumo.pas' {FRNotasOperacaoResumo},
  URLivroFResumoOp in 'URLivroFResumoOp.pas' {FRLivroFResumoOpA},
  URLivroFResumoOpS in 'URLivroFResumoOpS.pas' {FRLivroFResumoOpS},
  FResumoApuracaoParam in 'FResumoApuracaoParam.pas' {FApuracaoResumoParam},
  URLivroFiscalNotaImposto in 'URLivroFiscalNotaImposto.pas' {FrLivroFiscalNotasImposto},
  UFRLivroNEPrefeitura in 'UFRLivroNEPrefeitura.pas' {FRLivroNEPrefeitura},
  URegiao_cl in '..\Cadastro\URegiao_cl.pas' {DMRegiao: TDataModule},
  URegiaoCons in '..\Cadastro\URegiaoCons.pas' {FRegiaoCons},
  URLivroRel_NF_Periodo in 'URLivroRel_NF_Periodo.pas' {FRLivroRel_NF_Periodo},
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  UEstadoCons in '..\Cadastro\UEstadoCons.pas' {FEstadoCons},
  URLivro_DFC in 'URLivro_DFC.pas' {FRLivro_DFC},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  URNFEmitidas in 'URNFEmitidas.pas' {FRNF_Emitidas},
  URegINSS in 'URegINSS.pas' {FRegINSSParam},
  URegINSS_cl in 'URegINSS_cl.pas' {DMRegINSS: TDataModule},
  URRegINSS in 'URRegINSS.pas' {FRRegINSS},
  URegServPrestadosParam in 'URegServPrestadosParam.pas' {FRegServPrestadosParam},
  URegServPrestados_cl in 'URegServPrestados_cl.pas' {DMRegServPrestados: TDataModule},
  URRegServPrestados in 'URRegServPrestados.pas' {FRRegServPrestados},
  URNotasOperacao2 in 'URNotasOperacao2.pas' {FRNotasOperacao2},
  UCidadeCons in '..\Cadastro\UCidadeCons.pas' {FCidadeCons},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  URegNota in 'URegNota.pas' {FRegNota},
  URegNota_cl in 'URegNota_cl.pas' {DMRegNota: TDataModule},
  UTributacaoCons in '..\Estoque\UTributacaoCons.pas' {FTributacaoCons},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  URegNotaCons in 'URegNotaCons.pas' {FRegNotaCons},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UNotaSaida_Cancela in '..\Vendas\UNotaSaida_Cancela.pas' {FNotaSaida_Cancela},
  UMotivo_cl in '..\Cadastro\UMotivo_cl.pas' {DMMotivo: TDataModule},
  UMotivoCad in '..\Cadastro\UMotivoCad.pas' {FMotivoCad},
  UMotivoCons in '..\Cadastro\UMotivoCons.pas' {FMotivoCons},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  URRomaneioNotas in '..\Agricola\URRomaneioNotas.pas' {FrRomNotaParam},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  URomaneioCons in '..\Agricola\URomaneioCons.pas' {FRomaneioCons},
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  UConhecimentoFrete_cl in '..\Conhecimento\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  URMotivo_Motivo in '..\Cadastro\URMotivo_Motivo.pas' {FRMotivo_Motivo},
  UNotaEntrada_Cancela in '..\Compras\UNotaEntrada_Cancela.pas' {FNotaEntrada_Cancela},
  UCidadeCad in '..\Cadastro\UCidadeCad.pas' {FCidadeCad},
  URCidade_Cidade in '..\Cadastro\URCidade_Cidade.pas' {FRCidade_Cidade},
  UCadastroParam in '..\Cadastro\UCadastroParam.pas' {FCadastroParam},
  URamoCons in '..\Cadastro\URamoCons.pas' {FRamoCons},
  URamo_cl in '..\Cadastro\URamo_cl.pas' {DMRamo: TDataModule},
  UClassCadastroCons in '..\Cadastro\UClassCadastroCons.pas' {FClassCadastroCons},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UPraca_cl in '..\Cadastro\UPraca_cl.pas' {DMPraca: TDataModule},
  UPracaCons in '..\Cadastro\UPracaCons.pas' {FPracaCons},
  URPisCofins in 'URPisCofins.pas' {FRPisCofins},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  URLivro_Siscredi in 'URLivro_Siscredi.pas' {FRLivro_Siscredi},
  URApuracaoGrupoFiscalE in 'URApuracaoGrupoFiscalE.pas' {FRApuracaoGrupoFiscalE},
  URApuracaoGrupoFiscalS in 'URApuracaoGrupoFiscalS.pas' {FRApuracaoGrupoFiscalS},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UGrupoFiscalCad in 'UGrupoFiscalCad.pas' {FGrupoFiscalCad},
  UGrupoFiscal_cl in 'UGrupoFiscal_cl.pas' {DMGrupoFiscal: TDataModule},
  UTConsulta in '..\TEMPLATE\UTConsulta.pas' {FTConsulta},
  UGrupoFiscalCons in 'UGrupoFiscalCons.pas' {FGrupoFiscalCons},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  URImpostoClasse in 'URImpostoClasse.pas' {FRImpostoClasse},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  UrImpostoProduto in 'UrImpostoProduto.pas' {FrImpostoProduto},
  URRetornoImposto in 'URRetornoImposto.pas' {FRRetornoImposto},
  USiscredi_Cl in 'USiscredi_Cl.pas' {DMSiscredi: TDataModule},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  USiscrediParam in 'USiscrediParam.pas' {FSiscrediParam},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URResumo_Valor_IPI_ICMS in 'URResumo_Valor_IPI_ICMS.pas' {FRResumo_IPI_ICMS},
  URRegEntradaIPI in 'URRegEntradaIPI.pas' {FRRegEntradaIPI},
  URegEntradaIPIParam in 'URegEntradaIPIParam.pas' {FRegEntradaIPIParam},
  URegSaidaIPIParam in 'URegSaidaIPIParam.pas' {FRegSaidaIPIParam},
  URRegSaidaIPI in 'URRegSaidaIPI.pas' {FRRegSaidaIPI},
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  UContasReceber_cl in '..\ContaReceber\UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  UBloqueto in '..\ContaReceber\UBloqueto.pas',
  URBoletaBB in '..\ContaReceber\URBoletaBB.pas',
  URBloqueto_BB in '..\ContaReceber\URBloqueto_BB.pas' {FRBloqueto_BB},
  URBloqueto_Bradesco in '..\ContaReceber\URBloqueto_Bradesco.pas' {FRBloqueto_Bradesco},
  URBloqueto_BRU in '..\ContaReceber\URBloqueto_BRU.pas' {FRBloqueto_BRU},
  URBloqueto_CE in '..\ContaReceber\URBloqueto_CE.pas' {FRBloqueto_CE},
  URBloqueto_CEF in '..\ContaReceber\URBloqueto_CEF.pas' {FRBloqueto_CEF},
  URBloqueto_HSBC in '..\ContaReceber\URBloqueto_HSBC.pas' {FRBloqueto_HSBC},
  URBloqueto_Rural in '..\ContaReceber\URBloqueto_Rural.pas' {FRBloqueto_Rural},
  URBloqueto_Santander in '..\ContaReceber\URBloqueto_Santander.pas' {FRBloqueto_Santander},
  URBloqueto_Sicredi in '..\ContaReceber\URBloqueto_Sicredi.pas' {FRBloqueto_Sicredi},
  URBloqueto_Sudameris in '..\ContaReceber\URBloqueto_Sudameris.pas' {FRBloqueto_Sudameris},
  URBloqueto_Unibanco in '..\ContaReceber\URBloqueto_Unibanco.pas' {FRBloqueto_Unibanco},
  URBloquetoSafra in '..\ContaReceber\URBloquetoSafra.pas' {FRBloqueto_Safra},
  URBloquetoTotal in '..\ContaReceber\URBloquetoTotal.pas',
  UFRBloqueto_Itau in '..\ContaReceber\UFRBloqueto_Itau.pas' {FRBloqueto_Itau},
  UnitBoleta in '..\MyLib\UNITBOLETA.pas' {Boleta},
  URImpostoProdutoNota in 'URImpostoProdutoNota.pas' {FRImpostoProdutoNota},
  UFmFilial in '..\Frames\UFmFilial.pas' {FmFilial: TFrame},
  UFmOperacao in '..\Frames\UFmOperacao.pas' {FmOperacao: TFrame},
  UFmProduto in '..\Frames\UFmProduto.pas' {FmProduto: TFrame},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  URGruposFiscais in 'URGruposFiscais.pas' {FRGruposFiscais},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UGrupoFiscalParam in 'UGrupoFiscalParam.pas' {FGrupoFiscalParam},
  URGrupoFiscalValor in 'URGrupoFiscalValor.pas' {FRGrupoFiscalValor},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame},
  UHistorico_cl in '..\ContaPagar\UHistorico_cl.pas' {DMHistorico: TDataModule},
  UArquivoDIMEWordSC in 'UArquivoDIMEWordSC.pas',
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  UContasReceberParam in '..\ContaReceber\UContasReceberParam.pas' {FContasReceberParam},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  UContasReceberCons in '..\ContaReceber\UContasReceberCons.pas' {FContasReceberCons},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons},
  UNotaSaidaCons in '..\Vendas\UNotaSaidaCons.pas' {FNotaSaidaCons},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  UObraContrato_cl in '..\Obra\UObraContrato_cl.pas' {DMObraContrato: TDataModule},
  UObraContrato_Cons in '..\Obra\UObraContrato_Cons.pas' {FObraContrato_Cons},
  UObraCons in '..\Obra\UObraCons.pas' {FObraCons},
  UObra_cl in '..\Obra\UObra_cl.pas' {DMObra: TDataModule},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  URRegimeEspecialPR in 'URRegimeEspecialPR.pas' {FRRegimeEspecialPR},
  URegistro60 in 'URegistro60.pas' {FRegistro60},
  ULivroFiscalIPICons in 'ULivroFiscalIPICons.pas' {FLivroFiscalIPICons},
  ULivroFiscalIPI_cl in 'ULivroFiscalIPI_cl.pas' {DMLivroFiscalIPI: TDataModule},
  ULivroFiscalIPICad in 'ULivroFiscalIPICad.pas' {FLivroFiscalIPICad},
  URLivroFiscalIPI in 'URLivroFiscalIPI.pas' {FRLivroFiscalIPI},
  UFmContrato in '..\Frames\UFmContrato.pas' {FmContrato: TFrame},
  UContratoVenda_Cons in '..\Agricola\UContratoVenda_Cons.pas' {FContrato_VendaCons},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  UFmFinalidade in '..\Frames\UFmFinalidade.pas' {FmFinalidade: TFrame},
  UArquivoSinco in 'UArquivoSinco.pas' {FArquivoSinco},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword},
  UScpc_cl in '..\Cadastro\UScpc_cl.pas' {DMScpc: TDataModule},
  UScpcCons in '..\Cadastro\UScpcCons.pas' {FScpcCons},
  UEmissaoTermo in 'UEmissaoTermo.pas' {FEmissaoTermo},
  UEmissaoTermoParam in 'UEmissaoTermoParam.pas' {FEmissaoTermoParam},
  UEmissaoTermo_cl in 'UEmissaoTermo_cl.pas' {DMEmissaoTermo: TDataModule},
  URTermo in 'URTermo.pas' {FRTermo},
  URegistro60ResumoCad in 'URegistro60ResumoCad.pas' {FRegistro60ResumoCad},
  URegistro60ResumoCons in 'URegistro60ResumoCons.pas' {FRegistro60ResumoCons},
  UFmSerie in '..\Frames\UFmSerie.pas' {FmSerie: TFrame},
  URegistro60MestreCad in 'URegistro60MestreCad.pas' {FRegistro60MestreCad},
  URegistro60MestreCons in 'URegistro60MestreCons.pas' {FRegistro60MestreCons},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  UNfe_cl in '..\MonitorNfe\UNfe_cl.pas' {DMNfe: TDataModule},
  UNFeParam in '..\MonitorNfe\UNFeParam.pas' {FNFeParam},
  UFmContaCorrente in '..\Frames\UFmContaCorrente.pas' {FmContaCorrente: TFrame},
  UMensagemUsuario_cl in '..\Cadastro\UMensagemUsuario_cl.pas' {DmMensagemUsuario: TDataModule},
  URLivroGiIcms in 'URLivroGiIcms.pas' {FRLivroGiIcms},
  UPercPisCofinsCons in 'UPercPisCofinsCons.pas' {FPercPisCofinsCons},
  UParamPisCofins in 'UParamPisCofins.pas' {FParamPisCofins},
  UParamPisCofinsCons in 'UParamPisCofinsCons.pas' {FParamPisCofinsCons},
  UPercPisCofins in 'UPercPisCofins.pas' {FPercPisCofins},
  UREcf_Periodo in 'UREcf_Periodo.pas' {FrEcf_Periodo},
  UImagemAtalho in '..\Template\UImagemAtalho.pas',
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UTipoLote_cl in '..\Estoque\UTipoLote_cl.pas' {DMTipoLote: TDataModule},
  UrCreditoPresumidoIcms in 'UrCreditoPresumidoIcms.pas' {FrCreditoPresumidoIcms},
  UNfEletronicaLote_cl in '..\Vendas\UNfEletronicaLote_cl.pas' {DMNfEletronicaLote: TDataModule},
  UFmNfeLote in '..\Frames\UFmNfeLote.pas' {FmNfeLote: TFrame},
  UFmBanco in '..\Frames\UFmBanco.pas' {FMBanco: TFrame},
  UNotaItensCons in '..\ContaReceber\UNotaItensCons.pas' {FNotaItensCons},
  UVendaPerdidaCad in '..\Estoque\UVendaPerdidaCad.pas' {FVendaPerdidaCad},
  UProdutos_UltimasCompras in '..\Estoque\UProdutos_UltimasCompras.pas' {FProdutos_UltimasCompras},
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  UEnviaEmail in '..\Agricola\UEnviaEmail.pas' {FEnviaEmail},
  USpedValidacao in '..\Compras\USpedValidacao.pas',
  UConexao in '..\Banco\UConexao.pas' {FConexao},
  UFmObra in '..\Frames\UFmObra.pas' {FmObra: TFrame},
  UConhecimento_cl in '..\Conhecimento\UConhecimento_cl.pas' {DMConhecimento: TDataModule},
  UCteLote_cl in '..\Conhecimento\UCteLote_cl.pas' {DMCteLote: TDataModule},
  Cte in '..\MyLib\CteTypes\Cte.pas',
  CteTypes in '..\MyLib\CteTypes\CteTypes.pas',
  IdeCte in '..\MyLib\CteTypes\IdeCte.pas',
  Toma in '..\MyLib\CteTypes\Toma.pas',
  EnderecoCte in '..\MyLib\CteTypes\EnderecoCte.pas',
  CteConsts in '..\MyLib\CteTypes\CteConsts.pas',
  ICMSCte in '..\MyLib\CteTypes\ICMSCte.pas',
  Compl in '..\MyLib\CteTypes\Compl.pas',
  Entrega in '..\MyLib\CteTypes\Entrega.pas',
  CteVersao in '..\MyLib\CteTypes\CteVersao.pas',
  InfCTeNorm in '..\MyLib\CteTypes\InfCteNorm.pas',
  Cobr in '..\MyLib\CteTypes\Cobr.pas',
  InfCarga in '..\MyLib\CteTypes\InfCarga.pas',
  DocAnt in '..\MyLib\CteTypes\DocAnt.pas',
  Envolvido in '..\MyLib\CteTypes\Envolvido.pas',
  TomaICMS in '..\MyLib\CteTypes\TomaICMS.pas',
  Rodo in '..\MyLib\CteTypes\Rodo.pas',
  Occ in '..\MyLib\CteTypes\Occ.pas',
  InfCteComp in '..\MyLib\CteTypes\InfCteComp.pas',
  InfCteAnu in '..\MyLib\CteTypes\InfCteAnu.pas',
  URBloqueto_Sicoob in '..\ContaReceber\URBloqueto_Sicoob.pas' {FRBloqueto_Sicoob},
  UProdutos_UltimasVendas in '..\Estoque\UProdutos_UltimasVendas.pas' {FProdutos_UltimasVendas},
  UFmTitulo in '..\Frames\UFmTitulo.pas' {FmTitulo: TFrame},
  UImpressoraFiscal in '..\Vendas\UImpressoraFiscal.pas' {FImpressoraFiscal},
  URadioDialog in '..\Vendas\URadioDialog.pas' {FRadioDialog},
  UImpressoraFiscalParam in '..\Vendas\UImpressoraFiscalParam.pas' {FImpressoraFiscalParam},
  UTef in '..\Vendas\UTef.pas' {FTEF},
  UTef_cl in '..\Vendas\UTef_cl.pas' {DMTEF: TDataModule},
  UTefInputBox in '..\Vendas\UTefInputBox.pas' {FTefInputBox},
  UTefInputBoxCheque in '..\Vendas\UTefInputBoxCheque.pas' {FTefInputBoxCheque},
  UAguarde in '..\ContaReceber\UAguarde.pas' {FAguarde},
  UImpressoraFiscal_cl in '..\Vendas\UImpressoraFiscal_cl.pas' {DMImpressoraFiscal: TDataModule},
  UReducaoZCad in 'UReducaoZCad.pas' {FReducaoZCad},
  UAliquotasImpressora in '..\Vendas\UAliquotasImpressora.pas' {FAliquotasImpressora},
  UCupomFiscalParam in '..\Vendas\UCupomFiscalParam.pas' {FCupomFiscalParam},
  UEmbarque_cl in '..\Vendas\UEmbarque_cl.pas' {DMEmbarque: TDataModule},
  URRegEntradaIPIAnalitico in 'URRegEntradaIPIAnalitico.pas' {FRRegEntradaIPIAnalitico},
  URRegSaidaIPIAnalitico in 'URRegSaidaIPIAnalitico.pas' {FRRegSaidaIPIAnalitico},
  UMdfeLote_cl in '..\Conhecimento\UMdfeLote_cl.pas' {DMMdfeLote: TDataModule},
  URegistroTipo60DCad in 'URegistroTipo60DCad.pas' {FRegistroTipo60DCad},
  URegistroTipo60DCons in 'URegistroTipo60DCons.pas' {FRegistroTipo60DCons},
  UrResumoCFOPxCSOSN in 'UrResumoCFOPxCSOSN.pas' {FrResumoCFOPxCSOSN},
  URBloqueto_CEF_SIGCB in '..\ContaReceber\URBloqueto_CEF_SIGCB.pas' {FRBloqueto_CEF_SIGCB},
  UDevolucaoTroca_cl in '..\Vendas\UDevolucaoTroca_cl.pas' {DMDevolucaoTroca: TDataModule},
  URNotasCfopPagto in 'URNotasCfopPagto.pas' {FRNotasCfopPagto},
  URRegSaidaIcms in 'URRegSaidaIcms.pas' {FrRegSaidaIcms},
  UTabelaPreco_cl in '..\Estoque\UTabelaPreco_cl.pas' {DMTabelaPreco: TDataModule},
  URBoletaBB_SIC in '..\ContaReceber\URBoletaBB_SIC.pas' {FRBoletaBB_SIC},
  UNotaEntradaCons in '..\Compras\UNotaEntradaCons.pas' {FNotaEntradaCons},
  UHistContabil_cl in '..\Contabil\UHistContabil_cl.pas' {DMHistContabil: TDataModule},
  UHistContabilCons in '..\Contabil\UHistContabilCons.pas' {FHistContabilCons},
  UBibVenda in '..\Vendas\UBibVenda.pas',
  URBloqueto_Uniprime in '..\ContaReceber\URBloqueto_Uniprime.pas' {FRBloqueto_Uniprime},
  URBloqueto_Cresol in '..\ContaReceber\URBloqueto_Cresol.pas' {FRBloqueto_Cresol},
  UOrdemServico_cl in '..\AssitenciaTecnica\UOrdemServico_cl.pas' {DMOrdemServico: TDataModule},
  UVisualizaAmplia in '..\Estoque\UVisualizaAmplia.pas' {FVisualizaAmplia},
  UObservacao_Cons in '..\Estoque\UObservacao_Cons.pas' {FObservacao_Cons},
  URSerie in '..\Compras\URSerie.pas' {FRSerie},
  USerieCad in '..\Compras\USerieCad.pas' {FSerieCad},
  UMarca_cl in '..\Estoque\UMarca_cl.pas' {DMMarca: TDataModule},
  UMarcaCons in '..\Estoque\UMarcaCons.pas' {FMarca_Cons};

{$R *.RES}

begin
  Application.Initialize;

  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.HelpFile := 'F:\Executaveis\Manual\P_LIVROS FISCAIS.HLP';
  Application.Title := 'Projeto Livros Fiscais';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMRegEntrada, DMRegEntrada);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMRegSaida, DMRegSaida);
  Application.CreateForm(TDMLivroFiscal, DMLivroFiscal);
  Application.CreateForm(TDMGia, DMGia);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMRegINSS, DMRegINSS);
  Application.CreateForm(TDMRegServPrestados, DMRegServPrestados);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMRegNota, DMRegNota);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDMGrupoFiscal, DMGrupoFiscal);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TDMSiscredi, DMSiscredi);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TDMObraContrato, DMObraContrato);
  Application.CreateForm(TDMObra, DMObra);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMLivroFiscalIPI, DMLivroFiscalIPI);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TDMScpc, DMScpc);
  Application.CreateForm(TDMEmissaoTermo, DMEmissaoTermo);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TDMNfe, DMNfe);
  Application.CreateForm(TDmMensagemUsuario, DmMensagemUsuario);
  Application.CreateForm(TDMTipoLote, DMTipoLote);
  Application.CreateForm(TDMNfEletronicaLote, DMNfEletronicaLote);
  Application.CreateForm(TDMConhecimento, DMConhecimento);
  Application.CreateForm(TDMCteLote, DMCteLote);
  Application.CreateForm(TDMTEF, DMTEF);
  Application.CreateForm(TDMImpressoraFiscal, DMImpressoraFiscal);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TDMMdfeLote, DMMdfeLote);
  Application.CreateForm(TDMDevolucaoTroca, DMDevolucaoTroca);
  Application.CreateForm(TDMTabelaPreco, DMTabelaPreco);
  Application.CreateForm(TDMHistContabil, DMHistContabil);
  Application.CreateForm(TDMOrdemServico, DMOrdemServico);
  Application.CreateForm(TFMenuLivroFiscal, FMenuLivroFiscal);
  Application.CreateForm(TDMMarca, DMMarca);
  FSplash.Hide;
  FSplash.Free;
  Application.Run;
end.
