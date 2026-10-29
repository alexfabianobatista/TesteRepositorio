
program PjSeguranca;

uses
  Forms,
  UTMenuPrincipal in '..\TEMPLATE\UTMenuPrincipal.pas' {FTMenuPrincipal},
  USegurancaMenu in 'USegurancaMenu.pas' {FSegurancaMenu},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UGrupoCad in 'UGrupoCad.pas' {FGrupoCad},
  UGrupo_cl in 'UGrupo_cl.pas' {DMGrupo: TDataModule},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UUsuario_cl in 'UUsuario_cl.pas' {DMUsuario: TDataModule},
  UUsuarioCad in 'UUsuarioCad.pas' {FUsuarioCad},
  UTela_cl in 'UTela_cl.pas' {DMTela: TDataModule},
  UTelaCad in 'UTelaCad.pas' {FTelaCad},
  UUsuarioCons in 'UUsuarioCons.pas' {FUsuarioCons},
  UGrupoCons in 'UGrupoCons.pas' {FGrupoCons},
  UTelaCons in 'UTelaCons.pas' {FTelaCons},
  ULogin in 'ULOGIN.pas' {FLogin},
  UFuncao_cl in 'UFuncao_cl.pas' {DMFuncao: TDataModule},
  UFuncaoCad in 'UFuncaoCad.pas' {FFuncaoCad},
  UParamCadFuncao in 'UParamCadFuncao.pas' {FParamCadFuncao},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  USplash in '..\Banco\USplash.pas' {FSplash},
  UrRelSeguranca in 'UrRelSeguranca.pas' {FrRelSeguranca},
  URelPreview in '..\TEMPLATE\URelPreview.pas' {FRelPreview},
  UControleInternoParam in 'UControleInternoParam.pas' {FcontroleInternoParam},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  URControleInterno in 'URControleInterno.pas' {FRControleInterno},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UAditoria_cl in 'UAditoria_cl.pas' {DMAuditoria: TDataModule},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URAuditoria in 'URAuditoria.pas' {FRAuditoria},
  UUsuarioFilialCad in 'UUsuarioFilialCad.pas' {FUsuarioFilialCad},
  UTConsulta in '..\TEMPLATE\UTConsulta.pas' {FTConsulta},
  UModuloCons in 'UModuloCons.pas' {FModuloCons},
  UUsuarioFilialCons in 'UUsuarioFilialCons.pas' {FUsuarioFilialCons},
  URGrupos in 'URGrupos.pas' {FRGrupos},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UGrupoParam in 'UGrupoParam.pas' {FGrupoParam},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UMensagemUsuario_cl in '..\Cadastro\UMensagemUsuario_cl.pas' {DmMensagemUsuario: TDataModule},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UOperacaoCons in '..\Compras\UOperacaoCons.pas' {FOperacaoCons},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UCidadeCons in '..\Cadastro\UCidadeCons.pas' {FCidadeCons},
  UScpc_cl in '..\Cadastro\UScpc_cl.pas' {DMScpc: TDataModule},
  UScpcCons in '..\Cadastro\UScpcCons.pas' {FScpcCons},
  UCidadeCad in '..\Cadastro\UCidadeCad.pas' {FCidadeCad},
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  UEstadoCons in '..\Cadastro\UEstadoCons.pas' {FEstadoCons},
  UCadastroParam in '..\Cadastro\UCadastroParam.pas',
  UPraca_cl in '..\Cadastro\UPraca_cl.pas' {DMPraca: TDataModule},
  UPracaCons in '..\Cadastro\UPracaCons.pas' {FPracaCons},
  URCidade_Cidade in '..\Cadastro\URCidade_Cidade.pas' {FRCidade_Cidade},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  URegiao_cl in '..\Cadastro\URegiao_cl.pas' {DMRegiao: TDataModule},
  URegiaoCons in '..\Cadastro\URegiaoCons.pas' {FRegiaoCons},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  URamo_cl in '..\Cadastro\URamo_cl.pas' {DMRamo: TDataModule},
  URamoCons in '..\Cadastro\URamoCons.pas' {FRamoCons},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UClassCadastroCons in '..\Cadastro\UClassCadastroCons.pas' {FClassCadastroCons},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame},
  UMotivo_cl in '..\Cadastro\UMotivo_cl.pas' {DMMotivo: TDataModule},
  UMotivoCons in '..\Cadastro\UMotivoCons.pas' {FMotivoCons},
  UFmFilial in '..\Frames\UFmFilial.pas' {FmFilial: TFrame},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  UImagemAtalho in '..\Template\UImagemAtalho.pas',
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UImpressoraFiscal_cl in '..\Vendas\UImpressoraFiscal_cl.pas' {DMImpressoraFiscal: TDataModule},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UEmbarque_cl in '..\Vendas\UEmbarque_cl.pas' {DMEmbarque: TDataModule},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  UEnviaEmail in '..\Agricola\UEnviaEmail.pas' {FEnviaEmail},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  UVendaPerdidaCad in '..\Estoque\UVendaPerdidaCad.pas' {FVendaPerdidaCad},
  UProdutos_UltimasCompras in '..\Estoque\UProdutos_UltimasCompras.pas' {FProdutos_UltimasCompras},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  UProdutos_UltimasVendas in '..\Estoque\UProdutos_UltimasVendas.pas' {FProdutos_UltimasVendas},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons},
  UFmContrato in '..\Frames\UFmContrato.pas' {FmContrato: TFrame},
  UFmFinalidade in '..\Frames\UFmFinalidade.pas' {FmFinalidade: TFrame},
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  UFmBanco in '..\Frames\UFmBanco.pas' {FMBanco: TFrame},
  UObra_cl in '..\Obra\UObra_cl.pas' {DMObra: TDataModule},
  UObraCons in '..\Obra\UObraCons.pas' {FObraCons},
  UFmObra in '..\Frames\UFmObra.pas' {FmObra: TFrame},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  UFmTitulo in '..\Frames\UFmTitulo.pas' {FmTitulo: TFrame},
  UFmContaCorrente in '..\Frames\UFmContaCorrente.pas' {FmContaCorrente: TFrame},
  UNotaSaidaCons in '..\Vendas\UNotaSaidaCons.pas' {FNotaSaidaCons},
  UObraContrato_cl in '..\Obra\UObraContrato_cl.pas' {DMObraContrato: TDataModule},
  UObraContrato_Cons in '..\Obra\UObraContrato_Cons.pas' {FObraContrato_Cons},
  URBoletaBB in '..\ContaReceber\URBoletaBB.pas',
  URBloqueto_Bradesco in '..\ContaReceber\URBloqueto_Bradesco.pas' {FRBloqueto_Bradesco},
  URBloqueto_CEF in '..\ContaReceber\URBloqueto_CEF.pas' {FRBloqueto_CEF},
  URBloqueto_HSBC in '..\ContaReceber\URBloqueto_HSBC.pas' {FRBloqueto_HSBC},
  URBloqueto_Rural in '..\ContaReceber\URBloqueto_Rural.pas' {FRBloqueto_Rural},
  URBloqueto_Santander in '..\ContaReceber\URBloqueto_Santander.pas' {FRBloqueto_Santander},
  URBloqueto_Sicoob in '..\ContaReceber\URBloqueto_Sicoob.pas' {FRBloqueto_Sicoob},
  URBloqueto_Sicredi in '..\ContaReceber\URBloqueto_Sicredi.pas' {FRBloqueto_Sicredi},
  URBloqueto_Sudameris in '..\ContaReceber\URBloqueto_Sudameris.pas' {FRBloqueto_Sudameris},
  URBloqueto_Unibanco in '..\ContaReceber\URBloqueto_Unibanco.pas' {FRBloqueto_Unibanco},
  URBloquetoSafra in '..\ContaReceber\URBloquetoSafra.pas' {FRBloqueto_Safra},
  UContratoVenda_Cons in '..\Agricola\UContratoVenda_Cons.pas' {FContrato_VendaCons},
  UNotaItensCons in '..\ContaReceber\UNotaItensCons.pas' {FNotaItensCons},
  UContasReceberCons in '..\ContaReceber\UContasReceberCons.pas' {FContasReceberCons},
  UContasReceberParam in '..\ContaReceber\UContasReceberParam.pas' {FContasReceberParam},
  UContasReceber_cl in '..\ContaReceber\UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UFRBloqueto_Itau in '..\ContaReceber\UFRBloqueto_Itau.pas' {FRBloqueto_Itau},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  UHistorico_cl in '..\ContaPagar\UHistorico_cl.pas' {DMHistorico: TDataModule},
  UNfEletronicaLote_cl in '..\Vendas\UNfEletronicaLote_cl.pas' {DMNfEletronicaLote: TDataModule},
  UTefInputBoxCheque in '..\Vendas\UTefInputBoxCheque.pas' {FTefInputBoxCheque},
  UTefInputBox in '..\Vendas\UTefInputBox.pas' {FTefInputBox},
  UTef_cl in '..\Vendas\UTef_cl.pas' {DMTEF: TDataModule},
  UTef in '..\Vendas\UTef.pas' {FTEF},
  UMdfeLote_cl in '..\Conhecimento\UMdfeLote_cl.pas' {DMMdfeLote: TDataModule},
  UCteLote_cl in '..\Conhecimento\UCteLote_cl.pas' {DMCteLote: TDataModule},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UNotaSaida_Cancela in '..\Vendas\UNotaSaida_Cancela.pas' {FNotaSaida_Cancela},
  UImpressoraFiscal in '..\Vendas\UImpressoraFiscal.pas' {FImpressoraFiscal},
  UCupomFiscalParam in '..\Vendas\UCupomFiscalParam.pas' {FCupomFiscalParam},
  UAliquotasImpressora in '..\Vendas\UAliquotasImpressora.pas' {FAliquotasImpressora},
  UImpressoraFiscalParam in '..\Vendas\UImpressoraFiscalParam.pas' {FImpressoraFiscalParam},
  UConhecimentoFrete_cl in '..\Conhecimento\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  UFmNfeLote in '..\Frames\UFmNfeLote.pas' {FmNfeLote: TFrame},
  UNfe_cl in '..\MonitorNfe\UNfe_cl.pas' {DMNfe: TDataModule},
  UNFeParam in '..\MonitorNfe\UNFeParam.pas' {FNFeParam},
  UConhecimento_cl in '..\Conhecimento\UConhecimento_cl.pas' {DMConhecimento: TDataModule},
  UTipoLote in '..\Estoque\UTipoLote.pas' {FTipoLoteCad},
  UTipoLote_cl in '..\Estoque\UTipoLote_cl.pas' {DMTipoLote: TDataModule},
  URadioDialog in '..\Vendas\URadioDialog.pas' {FRadioDialog},
  UAguarde in '..\ContaReceber\UAguarde.pas' {FAguarde},
  UTipoLoteCons in '..\Estoque\UTipoLoteCons.pas' {FTipoLoteCons},
  UTipoLoteParam in '..\Estoque\UTipoLoteParam.pas' {FTipoLoteParam},
  URTipoLote in '..\Estoque\URTipoLote.pas' {FRTipoLote},
  UrMovimentoPorLote in '..\Estoque\UrMovimentoPorLote.pas' {FrMovimentoPorLote},
  UTributacaoCons in '..\Estoque\UTributacaoCons.pas' {FTributacaoCons},
  URBloqueto_CEF_SIGCB in '..\ContaReceber\URBloqueto_CEF_SIGCB.pas' {FRBloqueto_CEF_SIGCB},
  UDevolucaoTroca_cl in '..\Vendas\UDevolucaoTroca_cl.pas' {DMDevolucaoTroca: TDataModule},
  UTabelaPreco_cl in '..\Estoque\UTabelaPreco_cl.pas' {DMTabelaPreco: TDataModule},
  URBoletaBB_SIC in '..\ContaReceber\URBoletaBB_SIC.pas',
  UFuncaoCons in 'UFuncaoCons.pas' {FFuncaoCons},
  UBibVenda in '..\Vendas\UBibVenda.pas',
  UHistContabil_cl in '..\Contabil\UHistContabil_cl.pas' {DMHistContabil: TDataModule},
  UHistContabilCons in '..\Contabil\UHistContabilCons.pas' {FHistContabilCons},
  URBloqueto_Cresol in '..\ContaReceber\URBloqueto_Cresol.pas' {FRBloqueto_Cresol},
  URBloqueto_Uniprime in '..\ContaReceber\URBloqueto_Uniprime.pas' {FRBloqueto_Uniprime},
  UCarregando2 in '..\Vendas\UCarregando2.pas' {FCarregando2},
  UOrdemServico_cl in '..\AssitenciaTecnica\UOrdemServico_cl.pas' {DMOrdemServico: TDataModule},
  UVisualizaAmplia in '..\Estoque\UVisualizaAmplia.pas' {FVisualizaAmplia},
  UObservacao_Cons in '..\Estoque\UObservacao_Cons.pas' {FObservacao_Cons},
  UAuditoriaCons in 'UAuditoriaCons.pas' {FAuditoriaCons},
  URSerie in '..\Compras\URSerie.pas' {FRSerie},
  USerieCad in '..\Compras\USerieCad.pas' {FSerieCad},
  URVencimentoPorLote in '..\Estoque\URVencimentoPorLote.pas' {FrVencimentoPorLote},
  UFmLote in '..\Frames\UFmLote.pas' {FmLote: TFrame},
  UFmSubClasse in '..\Frames\UFmSubClasse.pas' {FmSubClasse: TFrame},
  UDispositivoCad in 'UDispositivoCad.pas' {FDispositivoCad},
  UDispositivoCons in 'UDispositivoCons.pas' {FDispositivoCons},
  URDispositivoDtAcesso in 'URDispositivoDtAcesso.pas' {FRDispositivoDtAcesso},
  UDispositivoParam in 'UDispositivoParam.pas' {FDispositivoParam},
  URConfereBaixaContaReceber in 'URConfereBaixaContaReceber.pas' {FRConfereBaixaContaReceber},
  UAuditoriaParam in 'UAuditoriaParam.pas' {FAuditoriaParam},
  UConsultaAuditoriaParam in 'UConsultaAuditoriaParam.pas' {FConsultaAuditoriaParam},
  UMarca_cl in '..\Estoque\UMarca_cl.pas' {DMMarca: TDataModule},
  UMarcaCons in '..\Estoque\UMarcaCons.pas' {FMarca_Cons};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMGrupo, DMGrupo);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMAuditoria, DMAuditoria);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDmMensagemUsuario, DmMensagemUsuario);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMScpc, DMScpc);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMImpressoraFiscal, DMImpressoraFiscal);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TDMObra, DMObra);
  Application.CreateForm(TDMObraContrato, DMObraContrato);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMNfEletronicaLote, DMNfEletronicaLote);
  Application.CreateForm(TDMTEF, DMTEF);
  Application.CreateForm(TDMMdfeLote, DMMdfeLote);
  Application.CreateForm(TDMCteLote, DMCteLote);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMNfe, DMNfe);
  Application.CreateForm(TDMConhecimento, DMConhecimento);
  Application.CreateForm(TDMTipoLote, DMTipoLote);
  Application.CreateForm(TDMDevolucaoTroca, DMDevolucaoTroca);
  Application.CreateForm(TDMTabelaPreco, DMTabelaPreco);
  Application.CreateForm(TDMHistContabil, DMHistContabil);
  Application.CreateForm(TDMOrdemServico, DMOrdemServico);
  Application.CreateForm(TFSegurancaMenu, FSegurancaMenu);
  Application.CreateForm(TDMMarca, DMMarca);
  FSplash.Hide;
  FSplash.Free;
  Application.CreateForm(TFSegurancaMenu, FSegurancaMenu);
  Application.Run;
end.
