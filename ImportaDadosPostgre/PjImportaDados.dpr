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
  UPostgre_cl in 'UPostgre_cl.pas' {DMPostgre: TDataModule},
  UProdutoPostgre_cl in 'UProdutoPostgre_cl.pas' {DMProdutoPostgre: TDataModule},
  UCadastroPostgre_cl in 'UCadastroPostgre_cl.pas' {DMCadastroPostgre: TDataModule},
  UContasReceberPostgre_cl in 'UContasReceberPostgre_cl.pas' {DMContasReceberPostgre: TDataModule},
  UContasPagarPostgre_cl in 'UContasPagarPostgre_cl.pas' {DMContasPagarPostgre: TDataModule},
  UOperacaoCons in '..\Compras\UOperacaoCons.pas' {FOperacaoCons},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UTef_cl in '..\Vendas\UTef_cl.pas' {DMTEF: TDataModule},
  UTefInputBox in '..\Vendas\UTefInputBox.pas' {FTefInputBox},
  UTefInputBoxCheque in '..\Vendas\UTefInputBoxCheque.pas' {FTefInputBoxCheque},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  UEnviaEmail in '..\Agricola\UEnviaEmail.pas' {FEnviaEmail},
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UObra_cl in '..\Obra\UObra_cl.pas' {DMObra: TDataModule},
  UObraContrato_cl in '..\Obra\UObraContrato_cl.pas' {DMObraContrato: TDataModule},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UHistorico_cl in '..\ContaPagar\UHistorico_cl.pas' {DMHistorico: TDataModule},
  UDevolucaoTroca_cl in '..\Vendas\UDevolucaoTroca_cl.pas' {DMDevolucaoTroca: TDataModule},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  UNfEletronicaLote_cl in '..\Vendas\UNfEletronicaLote_cl.pas' {DMNfEletronicaLote: TDataModule},
  UConhecimento_cl in '..\Conhecimento\UConhecimento_cl.pas' {DMConhecimento: TDataModule},
  UCteLote_cl in '..\Conhecimento\UCteLote_cl.pas' {DMCteLote: TDataModule},
  UMdfeLote_cl in '..\Conhecimento\UMdfeLote_cl.pas' {DMMdfeLote: TDataModule},
  UNfe_cl in '..\MonitorNfe\UNfe_cl.pas' {DMNfe: TDataModule},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  UTipoLote_cl in '..\Estoque\UTipoLote_cl.pas' {DMTipoLote: TDataModule},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UImpressoraFiscal_cl in '..\Vendas\UImpressoraFiscal_cl.pas' {DMImpressoraFiscal: TDataModule},
  URadioDialog in '..\Vendas\URadioDialog.pas' {FRadioDialog},
  UProdutos_UltimasCompras in '..\Estoque\UProdutos_UltimasCompras.pas' {FProdutos_UltimasCompras},
  UProdutos_UltimasVendas in '..\Estoque\UProdutos_UltimasVendas.pas' {FProdutos_UltimasVendas},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons},
  UContratoVenda_Cons in '..\Agricola\UContratoVenda_Cons.pas' {FContrato_VendaCons},
  UFmContrato in '..\Frames\UFmContrato.pas' {FmContrato: TFrame},
  UFmFinalidade in '..\Frames\UFmFinalidade.pas' {FmFinalidade: TFrame},
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  UFmBanco in '..\Frames\UFmBanco.pas' {FMBanco: TFrame},
  UFmTitulo in '..\Frames\UFmTitulo.pas' {FmTitulo: TFrame},
  UFmContaCorrente in '..\Frames\UFmContaCorrente.pas' {FmContaCorrente: TFrame},
  UFmNfeLote in '..\Frames\UFmNfeLote.pas' {FmNfeLote: TFrame},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  UObraCons in '..\Obra\UObraCons.pas' {FObraCons},
  UFmObra in '..\Frames\UFmObra.pas' {FmObra: TFrame},
  UNotaItensCons in '..\ContaReceber\UNotaItensCons.pas' {FNotaItensCons},
  UContasReceberCons in '..\ContaReceber\UContasReceberCons.pas' {FContasReceberCons},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  UNotaSaidaCons in '..\Vendas\UNotaSaidaCons.pas' {FNotaSaidaCons},
  UObraContrato_Cons in '..\Obra\UObraContrato_Cons.pas' {FObraContrato_Cons},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  UContasReceberParam in '..\ContaReceber\UContasReceberParam.pas' {FContasReceberParam},
  URBoletaBB in '..\ContaReceber\URBoletaBB.pas',
  UContasReceber_cl in '..\ContaReceber\UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  UNFeParam in '..\MonitorNfe\UNFeParam.pas' {FNFeParam},
  UTef in '..\Vendas\UTef.pas' {FTEF},
  UAguarde in '..\ContaReceber\UAguarde.pas' {FAguarde},
  UImpressoraFiscalParam in '..\Vendas\UImpressoraFiscalParam.pas' {FImpressoraFiscalParam},
  UNotaSaida_Cancela in '..\Vendas\UNotaSaida_Cancela.pas' {FNotaSaida_Cancela},
  UAliquotasImpressora in '..\Vendas\UAliquotasImpressora.pas' {FAliquotasImpressora},
  UCupomFiscalParam in '..\Vendas\UCupomFiscalParam.pas' {FCupomFiscalParam},
  UImpressoraFiscal in '..\Vendas\UImpressoraFiscal.pas' {FImpressoraFiscal},
  UConhecimentoFrete_cl in '..\Conhecimento\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  UVendaPerdidaCad in '..\Estoque\UVendaPerdidaCad.pas' {FVendaPerdidaCad},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  URBloquetoSafra in '..\ContaReceber\URBloquetoSafra.pas' {FRBloqueto_Safra},
  URBloqueto_Bradesco in '..\ContaReceber\URBloqueto_Bradesco.pas' {FRBloqueto_Bradesco},
  URBloqueto_Sicoob in '..\ContaReceber\URBloqueto_Sicoob.pas' {FRBloqueto_Sicoob},
  URBloqueto_HSBC in '..\ContaReceber\URBloqueto_HSBC.pas' {FRBloqueto_HSBC},
  URBloqueto_Rural in '..\ContaReceber\URBloqueto_Rural.pas' {FRBloqueto_Rural},
  UFRBloqueto_Itau in '..\ContaReceber\UFRBloqueto_Itau.pas' {FRBloqueto_Itau},
  URBloqueto_Sicredi in '..\ContaReceber\URBloqueto_Sicredi.pas' {FRBloqueto_Sicredi},
  URBloqueto_Santander in '..\ContaReceber\URBloqueto_Santander.pas' {FRBloqueto_Santander},
  URBloqueto_Unibanco in '..\ContaReceber\URBloqueto_Unibanco.pas' {FRBloqueto_Unibanco},
  URBloqueto_Sudameris in '..\ContaReceber\URBloqueto_Sudameris.pas' {FRBloqueto_Sudameris},
  URBloqueto_CEF in '..\ContaReceber\URBloqueto_CEF.pas' {FRBloqueto_CEF},
  URBloqueto_CEF_SIGCB in '..\ContaReceber\URBloqueto_CEF_SIGCB.pas' {FRBloqueto_CEF_SIGCB},
  UEstoquePostgre_cl in 'UEstoquePostgre_cl.pas' {DMEstoquePostgre: TDataModule},
  UnitBoleta in '..\MyLib\UNITBOLETA.pas' {Boleta},
  UTabelaPreco_cl in '..\Estoque\UTabelaPreco_cl.pas' {DMTabelaPreco: TDataModule},
  URBoletaBB_SIC in '..\ContaReceber\URBoletaBB_SIC.pas' {FRBoletaBB_SIC},
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UTMenuPrincipal in '..\Template\UTMenuPrincipal.pas' {FTMenuPrincipal},
  URBloqueto_Cresol in '..\ContaReceber\URBloqueto_Cresol.pas' {FRBloqueto_Cresol},
  URBloqueto_Uniprime in '..\ContaReceber\URBloqueto_Uniprime.pas' {FRBloqueto_Uniprime},
  UHistContabil_cl in '..\Contabil\UHistContabil_cl.pas' {DMHistContabil: TDataModule},
  UHistContabilCons in '..\Contabil\UHistContabilCons.pas' {FHistContabilCons},
  UMarcaPostgre_cl in 'UMarcaPostgre_cl.pas' {DMMarcaPostgre: TDataModule},
  UClassePostgre_cl in 'UClassePostgre_cl.pas' {DMClassePostgre: TDataModule},
  UVisualizaAmplia in '..\Estoque\UVisualizaAmplia.pas' {FVisualizaAmplia},
  UOrdemServico_cl in '..\AssitenciaTecnica\UOrdemServico_cl.pas' {DMOrdemServico: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMImportaDados, DMImportaDados);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMConverte, DMConverte);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TDMPostgre, DMPostgre);
  Application.CreateForm(TDMProdutoPostgre, DMProdutoPostgre);
  Application.CreateForm(TDMCadastroPostgre, DMCadastroPostgre);
  Application.CreateForm(TDMContasReceberPostgre, DMContasReceberPostgre);
  Application.CreateForm(TDMContasPagarPostgre, DMContasPagarPostgre);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMTEF, DMTEF);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TDMObra, DMObra);
  Application.CreateForm(TDMObraContrato, DMObraContrato);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMDevolucaoTroca, DMDevolucaoTroca);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMNfEletronicaLote, DMNfEletronicaLote);
  Application.CreateForm(TDMConhecimento, DMConhecimento);
  Application.CreateForm(TDMCteLote, DMCteLote);
  Application.CreateForm(TDMMdfeLote, DMMdfeLote);
  Application.CreateForm(TDMNfe, DMNfe);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMTipoLote, DMTipoLote);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMImpressoraFiscal, DMImpressoraFiscal);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TFImportaDados, FImportaDados);
  Application.CreateForm(TDMEstoquePostgre, DMEstoquePostgre);
  Application.CreateForm(TDMEstoquePostgre, DMEstoquePostgre);
  Application.CreateForm(TDMTabelaPreco, DMTabelaPreco);
  Application.CreateForm(TFTMenuPrincipal, FTMenuPrincipal);
  Application.CreateForm(TDMHistContabil, DMHistContabil);
  Application.CreateForm(TDMMarcaPostgre, DMMarcaPostgre);
  Application.CreateForm(TDMClassePostgre, DMClassePostgre);
  Application.CreateForm(TDMOrdemServico, DMOrdemServico);
  Application.Run;
end.
