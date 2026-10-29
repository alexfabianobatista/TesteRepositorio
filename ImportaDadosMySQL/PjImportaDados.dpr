program PjImportaDados;

uses
  Forms,
  UImportaDados in 'UImportaDados.pas' {FImportaDados},
  UOracle_cl in '..\banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UImportaDados_cl in 'UImportaDados_cl.pas' {DMImportaDados: TDataModule},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UConverte_cl in 'UConverte_cl.pas' {DMConverte: TDataModule},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UTConsulta in '..\Template\UTConsulta.pas' {FTConsulta},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UEmbarque_cl in '..\Vendas\UEmbarque_cl.pas' {DMEmbarque: TDataModule},
  UEmbarqueCons in '..\Vendas\UEmbarqueCons.pas' {FEmbarqueCons},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOFI0004},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UClassCadastroCons in '..\Cadastro\UClassCadastroCons.pas' {FClassCadastroCons},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UCidadeCons in '..\Cadastro\UCidadeCons.pas' {FCidadeCons},
  UCidadeCad in '..\Cadastro\UCidadeCad.pas',
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  UEstadoCons in '..\Cadastro\UEstadoCons.pas' {FEstadoCons},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URCidade_Cidade in '..\Cadastro\URCidade_Cidade.pas' {FRCidade_Cidade},
  UCadastroParam in '..\Cadastro\UCadastroParam.pas',
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  URegiao_cl in '..\Cadastro\URegiao_cl.pas' {DMRegiao: TDataModule},
  URegiaoCons in '..\Cadastro\URegiaoCons.pas' {FRegiaoCons},
  URamo_cl in '..\Cadastro\URamo_cl.pas' {DMRamo: TDataModule},
  URamoCons in '..\Cadastro\URamoCons.pas' {FRamoCons},
  UMotivoCons in '..\Cadastro\UMotivoCons.pas' {FMotivoCons},
  UMotivo_cl in '..\Cadastro\UMotivo_cl.pas' {DMMotivo: TDataModule},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UPracaCons in '..\Cadastro\UPracaCons.pas' {FPracaCons},
  UPraca_cl in '..\Cadastro\UPraca_cl.pas' {DMPraca: TDataModule},
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
  UUsuarioCons in '..\Seguranca\UUsuarioCons.pas' {FUsuarioCons},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  UScpc_cl in '..\Cadastro\UScpc_cl.pas' {DMScpc: TDataModule},
  UScpcCons in '..\Cadastro\UScpcCons.pas' {FScpcCons},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UProdutoMySQL_cl in 'UProdutoMySQL_cl.pas' {DMProdutoMySQL: TDataModule},
  UMySQL_cl in 'UMySQL_cl.pas' {DMMySQL: TDataModule},
  UCadastroMySQL_cl in 'UCadastroMySQL_cl.pas' {DMCadastroMySQL: TDataModule},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UImpressoraFiscal_cl in '..\Vendas\UImpressoraFiscal_cl.pas' {DMImpressoraFiscal: TDataModule},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  UProdutos_UltimasCompras in '..\Estoque\UProdutos_UltimasCompras.pas' {FProdutos_UltimasCompras},
  UProdutos_UltimasVendas in '..\Estoque\UProdutos_UltimasVendas.pas' {FProdutos_UltimasVendas},
  UEnviaEmail in '..\Agricola\UEnviaEmail.pas' {FEnviaEmail},
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  UVendaPerdidaCad in '..\Estoque\UVendaPerdidaCad.pas' {FVendaPerdidaCad},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons},
  UContratoVenda_Cons in '..\Agricola\UContratoVenda_Cons.pas' {FContrato_VendaCons},
  UFmContrato in '..\Frames\UFmContrato.pas' {FmContrato: TFrame},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  UFmFinalidade in '..\Frames\UFmFinalidade.pas' {FmFinalidade: TFrame},
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  UFmBanco in '..\Frames\UFmBanco.pas' {FMBanco: TFrame},
  UFmObra in '..\Frames\UFmObra.pas' {FmObra: TFrame},
  UFmTitulo in '..\Frames\UFmTitulo.pas' {FmTitulo: TFrame},
  UFmContaCorrente in '..\Frames\UFmContaCorrente.pas' {FmContaCorrente: TFrame},
  UFmNfeLote in '..\Frames\UFmNfeLote.pas' {FmNfeLote: TFrame},
  UObra_cl in '..\Obra\UObra_cl.pas' {DMObra: TDataModule},
  UObraCons in '..\Obra\UObraCons.pas' {FObraCons},
  UNotaItensCons in '..\ContaReceber\UNotaItensCons.pas' {FNotaItensCons},
  UContasReceberCons in '..\ContaReceber\UContasReceberCons.pas' {FContasReceberCons},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  UNotaSaidaCons in '..\Vendas\UNotaSaidaCons.pas' {FNotaSaidaCons},
  UObraContrato_cl in '..\Obra\UObraContrato_cl.pas' {DMObraContrato: TDataModule},
  UObraContrato_Cons in '..\Obra\UObraContrato_Cons.pas' {FObraContrato_Cons},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  UContasReceberParam in '..\ContaReceber\UContasReceberParam.pas' {FContasReceberParam},
  URBoletaBB in '..\ContaReceber\URBoletaBB.pas',
  URBloqueto_Bradesco in '..\ContaReceber\URBloqueto_Bradesco.pas' {FRBloqueto_Bradesco},
  URBloqueto_HSBC in '..\ContaReceber\URBloqueto_HSBC.pas' {FRBloqueto_HSBC},
  URBloqueto_Rural in '..\ContaReceber\URBloqueto_Rural.pas' {FRBloqueto_Rural},
  URBloqueto_Sicoob in '..\ContaReceber\URBloqueto_Sicoob.pas' {FRBloqueto_Sicoob},
  URBloquetoSafra in '..\ContaReceber\URBloquetoSafra.pas' {FRBloqueto_Safra},
  UFRBloqueto_Itau in '..\ContaReceber\UFRBloqueto_Itau.pas' {FRBloqueto_Itau},
  URBloqueto_Sicredi in '..\ContaReceber\URBloqueto_Sicredi.pas' {FRBloqueto_Sicredi},
  URBloqueto_Santander in '..\ContaReceber\URBloqueto_Santander.pas' {FRBloqueto_Santander},
  URBloqueto_Unibanco in '..\ContaReceber\URBloqueto_Unibanco.pas' {FRBloqueto_Unibanco},
  URBloqueto_Sudameris in '..\ContaReceber\URBloqueto_Sudameris.pas' {FRBloqueto_Sudameris},
  URBloqueto_CEF in '..\ContaReceber\URBloqueto_CEF.pas' {FRBloqueto_CEF},
  URBloqueto_CEF_SIGCB in '..\ContaReceber\URBloqueto_CEF_SIGCB.pas' {FRBloqueto_CEF_SIGCB},
  UContasReceber_cl in '..\ContaReceber\UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  UHistorico_cl in '..\ContaPagar\UHistorico_cl.pas' {DMHistorico: TDataModule},
  UNfEletronicaLote_cl in '..\Vendas\UNfEletronicaLote_cl.pas' {DMNfEletronicaLote: TDataModule},
  UNFeParam in '..\MonitorNfe\UNFeParam.pas' {FNFeParam},
  UConhecimento_cl in '..\Conhecimento\UConhecimento_cl.pas' {DMConhecimento: TDataModule},
  UCteLote_cl in '..\Conhecimento\UCteLote_cl.pas' {DMCteLote: TDataModule},
  UMdfeLote_cl in '..\Conhecimento\UMdfeLote_cl.pas' {DMMdfeLote: TDataModule},
  UDevolucaoTroca_cl in '..\Vendas\UDevolucaoTroca_cl.pas' {DMDevolucaoTroca: TDataModule},
  UNfe_cl in '..\MonitorNfe\UNfe_cl.pas' {DMNfe: TDataModule},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  UConhecimentoFrete_cl in '..\Conhecimento\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  UTipoLote_cl in '..\Estoque\UTipoLote_cl.pas' {DMTipoLote: TDataModule},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UTef_cl in '..\Vendas\UTef_cl.pas' {DMTEF: TDataModule},
  UTefInputBox in '..\Vendas\UTefInputBox.pas' {FTefInputBox},
  UTefInputBoxCheque in '..\Vendas\UTefInputBoxCheque.pas' {FTefInputBoxCheque},
  UTef in '..\Vendas\UTef.pas' {FTEF},
  UImpressoraFiscalParam in '..\Vendas\UImpressoraFiscalParam.pas' {FImpressoraFiscalParam},
  UAliquotasImpressora in '..\Vendas\UAliquotasImpressora.pas' {FAliquotasImpressora},
  UCupomFiscalParam in '..\Vendas\UCupomFiscalParam.pas' {FCupomFiscalParam},
  UImpressoraFiscal in '..\Vendas\UImpressoraFiscal.pas' {FImpressoraFiscal},
  UNotaSaida_Cancela in '..\Vendas\UNotaSaida_Cancela.pas' {FNotaSaida_Cancela},
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UTMenuPrincipal in '..\Template\UTMenuPrincipal.pas' {FTMenuPrincipal},
  URadioDialog in '..\Vendas\URadioDialog.pas' {FRadioDialog},
  UAguarde in '..\ContaReceber\UAguarde.pas' {FAguarde},
  UTabelaPreco_cl in '..\Estoque\UTabelaPreco_cl.pas' {DMTabelaPreco: TDataModule},
  URBoletaBB_SIC in '..\ContaReceber\URBoletaBB_SIC.pas',
  URBloqueto_Cresol in '..\ContaReceber\URBloqueto_Cresol.pas' {FRBloqueto_Cresol},
  URBloqueto_Uniprime in '..\ContaReceber\URBloqueto_Uniprime.pas' {FRBloqueto_Uniprime},
  UHistContabil_cl in '..\Contabil\UHistContabil_cl.pas' {DMHistContabil: TDataModule},
  UHistContabilCons in '..\Contabil\UHistContabilCons.pas' {FHistContabilCons},
  UFornecedorMySQL_cl in 'UFornecedorMySQL_cl.pas' {DMFornecedorMySql: TDataModule},
  UOrdemServicoMySQL_cl in 'UOrdemServicoMySQL_cl.pas' {DMOrdemServicoMySQL: TDataModule},
  UVisualizaAmplia in '..\Estoque\UVisualizaAmplia.pas' {FVisualizaAmplia},
  UObservacao_Cons in '..\Estoque\UObservacao_Cons.pas' {FObservacao_Cons},
  URSerie in '..\Compras\URSerie.pas' {FRSerie},
  USerieCad in '..\Compras\USerieCad.pas' {FSerieCad},
  UOrdemServico_cl in '..\AssitenciaTecnica\UOrdemServico_cl.pas' {DMOrdemServico: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMImportaDados, DMImportaDados);
  Application.CreateForm(TFImportaDados, FImportaDados);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMConverte, DMConverte);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TFTConsulta, FTConsulta);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TFCadastroCons, FCadastroCons);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TFClassCadastroCons, FClassCadastroCons);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TFTipoCadastroCons, FTipoCadastroCons);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TFCidadeCons, FCidadeCons);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TFEstadoCons, FEstadoCons);
  Application.CreateForm(TFRCidade_Cidade, FRCidade_Cidade);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TFRegiaoCons, FRegiaoCons);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TFRamoCons, FRamoCons);
  Application.CreateForm(TFMotivoCons, FMotivoCons);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TFFilialCons, FFilialCons);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TFPracaCons, FPracaCons);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TFUsuarioCons, FUsuarioCons);
  Application.CreateForm(TDMScpc, DMScpc);
  Application.CreateForm(TFScpcCons, FScpcCons);
  Application.CreateForm(TFPersonalizaRelatorio, FPersonalizaRelatorio);
  Application.CreateForm(TFRConsulta, FRConsulta);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TFMensagemSMS, FMensagemSMS);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMProdutoMySQL, DMProdutoMySQL);
  Application.CreateForm(TDMMySQL, DMMySQL);
  Application.CreateForm(TDMCadastroMySQL, DMCadastroMySQL);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMImpressoraFiscal, DMImpressoraFiscal);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TFSenha, FSenha);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TFProdutos_UltimasCompras, FProdutos_UltimasCompras);
  Application.CreateForm(TFProdutos_UltimasVendas, FProdutos_UltimasVendas);
  Application.CreateForm(TFEnviaEmail, FEnviaEmail);
  Application.CreateForm(TFVendaPerdidaCad, FVendaPerdidaCad);
  Application.CreateForm(TFProdutoCons, FProdutoCons);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TFBancosCons, FBancosCons);
  Application.CreateForm(TFContaCorrenteCons, FContaCorrenteCons);
  Application.CreateForm(TFContrato_VendaCons, FContrato_VendaCons);
  Application.CreateForm(TFFinalidadeCons, FFinalidadeCons);
  Application.CreateForm(TDMObra, DMObra);
  Application.CreateForm(TFObraCons, FObraCons);
  Application.CreateForm(TFNotaItensCons, FNotaItensCons);
  Application.CreateForm(TFContasReceberCons, FContasReceberCons);
  Application.CreateForm(TFSerieCons, FSerieCons);
  Application.CreateForm(TFNotaSaidaCons, FNotaSaidaCons);
  Application.CreateForm(TDMObraContrato, DMObraContrato);
  Application.CreateForm(TFObraContrato_Cons, FObraContrato_Cons);
  Application.CreateForm(TFMensagemCons, FMensagemCons);
  Application.CreateForm(TFContasReceberParam, FContasReceberParam);
  Application.CreateForm(TFRBloqueto_Bradesco, FRBloqueto_Bradesco);
  Application.CreateForm(TFRBloqueto_HSBC, FRBloqueto_HSBC);
  Application.CreateForm(TFRBloqueto_Rural, FRBloqueto_Rural);
  Application.CreateForm(TFRBloqueto_Sicoob, FRBloqueto_Sicoob);
  Application.CreateForm(TFRBloqueto_Safra, FRBloqueto_Safra);
  Application.CreateForm(TFRBloqueto_Itau, FRBloqueto_Itau);
  Application.CreateForm(TFRBloqueto_Sicredi, FRBloqueto_Sicredi);
  Application.CreateForm(TFRBloqueto_Santander, FRBloqueto_Santander);
  Application.CreateForm(TFRBloqueto_Unibanco, FRBloqueto_Unibanco);
  Application.CreateForm(TFRBloqueto_Sudameris, FRBloqueto_Sudameris);
  Application.CreateForm(TFRBloqueto_CEF, FRBloqueto_CEF);
  Application.CreateForm(TFRBloqueto_CEF_SIGCB, FRBloqueto_CEF_SIGCB);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TFPlanoContaCons, FPlanoContaCons);
  Application.CreateForm(TFCaixa_Lanc_Cont, FCaixa_Lanc_Cont);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMNfEletronicaLote, DMNfEletronicaLote);
  Application.CreateForm(TFNFeParam, FNFeParam);
  Application.CreateForm(TDMConhecimento, DMConhecimento);
  Application.CreateForm(TDMCteLote, DMCteLote);
  Application.CreateForm(TDMMdfeLote, DMMdfeLote);
  Application.CreateForm(TDMDevolucaoTroca, DMDevolucaoTroca);
  Application.CreateForm(TDMNfe, DMNfe);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMTipoLote, DMTipoLote);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMTEF, DMTEF);
  Application.CreateForm(TFTMenuPrincipal, FTMenuPrincipal);
  Application.CreateForm(TDMTabelaPreco, DMTabelaPreco);
  Application.CreateForm(TDMHistContabil, DMHistContabil);
  Application.CreateForm(TDMFornecedorMySql, DMFornecedorMySql);
  Application.CreateForm(TDMOrdemServicoMySQL, DMOrdemServicoMySQL);
  Application.CreateForm(TDMOrdemServico, DMOrdemServico);
  Application.Run;
end.
