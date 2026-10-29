program PjPatrimonio;

uses
  Forms,
  UTMenuPrincipal in '..\TEMPLATE\UTMENUPRINCIPAL.pas' {FTMenuPrincipal},
  UMenuPatrimonio in 'UMenuPatrimonio.pas' {FMenuPatrimonio},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UPatrimonioCad in 'UPatrimonioCad.pas' {FPatrimonioCad},
  UPatrimonioCons in 'UPatrimonioCons.pas' {FPatrimonioCons},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  USplash in '..\Banco\USplash.pas' {FSplash},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  ULogin in '..\Seguranca\ULogin.pas' {FLogin},
  UTrocaSenha in '..\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UPatrimonio_cl in 'UPatrimonio_cl.pas' {DMPatrimonio: TDataModule},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  UMoedaCons in '..\Cadastro\UMoedaCons.pas' {FMoedaCons},
  UPatrimonioItensCons in 'UPatrimonioItensCons.pas' {FPatrimonioItensCons},
  URRelacaoPatrimonio in 'URRelacaoPatrimonio.pas' {FRRelacaoPatrimonio},
  UPatrimonioParam in 'UPatrimonioParam.pas' {FPatrimonioParam},
  URPatrimonioItens in 'URPatrimonioItens.pas' {FRPatrimonioItens},
  ULocalizacaoCad in 'ULocalizacaoCad.pas' {FLocalizacaoCad},
  ULocalizacao_cl in 'ULocalizacao_cl.pas' {DMLocalizacao: TDataModule},
  ULocalizacaoCons in 'ULocalizacaoCons.pas' {FLocalizacaoCons},
  URLocalizacao in 'URLocalizacao.pas' {FRLocalizacao},
  UNotaSaidaCons in '..\Vendas\UNotaSaidaCons.pas' {FNotaSaidaCons},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  UNotaEntradaCons in '..\Compras\UNotaEntradaCons.pas' {FNotaEntradaCons},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  URRomaneioNotas in '..\Agricola\URRomaneioNotas.pas' {FrRomNotaParam},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  UUsuarioCons in '..\Seguranca\UUsuarioCons.pas' {FUsuarioCons},
  URomaneioCons in '..\Agricola\URomaneioCons.pas' {FRomaneioCons},
  UConhecimentoFrete_cl in '..\Conhecimento\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  UFatorICMS_cl in 'UFatorICMS_cl.pas' {DMFatorICMS: TDataModule},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UFatorICMSCad in 'UFatorICMSCad.pas' {FFatorICMSCad},
  UTConsulta in '..\TEMPLATE\UTConsulta.pas' {FTConsulta},
  UFatorICMSCons in 'UFatorICMSCons.pas' {FFatorICMSCons},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URRelacaoFatorICMS in 'URRelacaoFatorICMS.pas' {FRRelacaoFatorICMS},
  UApolice_cl in 'UApolice_cl.pas' {DMApolice: TDataModule},
  UApoliceCad in 'UApoliceCad.pas' {FApoliceCad},
  UApoliceCons in 'UApoliceCons.pas' {FApoliceCons},
  URRelacaoApolice in 'URRelacaoApolice.pas' {FRRelacaoApolice},
  UDepreciacao_cl in 'UDepreciacao_cl.pas' {DMDepreciacao: TDataModule},
  UCIAP_cl in 'UCIAP_cl.pas' {DMCIAP: TDataModule},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UGerarParam in 'UGerarParam.pas' {FGerarParam},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  UCIAPCad in 'UCIAPCad.pas' {FCIAPCad},
  UCIAPCons in 'UCIAPCons.pas' {FCIAPCons},
  UIncorporacao_cl in 'UIncorporacao_cl.pas' {DMIncorporacao: TDataModule},
  UHistoricoCons in '..\ContaPagar\UHistoricoCons.pas' {FHistoricoCons},
  UHistorico_cl in '..\ContaPagar\UHistorico_cl.pas' {DMHistorico: TDataModule},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  URApoliceVencimento in 'URApoliceVencimento.pas' {FRApoliceVencimento},
  UHistContabilCons in '..\Contabil\UHistContabilCons.pas' {FHistContabilCons},
  UHistContabil_cl in '..\Contabil\UHistContabil_cl.pas' {DMHistContabil: TDataModule},
  URFichaCIAP in 'URFichaCIAP.pas' {FRFichaCIAP},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  URContabil in 'URContabil.pas' {FRContabil},
  URControle in 'URControle.pas' {FRControle},
  URConferencia in 'URConferencia.pas' {FRConferencia},
  UCFOP_cl in 'UCFOP_cl.pas' {DMCFOP: TDataModule},
  UCFOPCad in 'UCFOPCad.pas' {FCFOPCad},
  UCFOPCons in 'UCFOPCons.pas' {FCFOPCons},
  URCFOP in 'URCFOP.pas' {FRCFOP},
  UCFOPParam in 'UCFOPParam.pas' {FCFOPParam},
  URDepMapaCalculo in 'URDepMapaCalculo.pas' {FRDepMapaCalculo},
  URDepMapaCalculoBem in 'URDepMapaCalculoBem.pas' {FRDepMapaCalculoBem},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
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
  UGrupoContaCad in 'UGrupoContaCad.pas' {FGrupoContaCad},
  UGrupoConta_cl in 'UGrupoConta_cl.pas' {DMGrupoConta: TDataModule},
  UGrupoContaCons in 'UGrupoContaCons.pas' {FGrupoContaCons},
  UDepreciacaoManualCad in 'UDepreciacaoManualCad.pas' {FDepreciacaoManualCad},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  UCIAPParam in 'UCIAPParam.pas' {FCIAPParam},
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  UContasReceber_cl in '..\ContaReceber\UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  UBloqueto in '..\ContaReceber\UBloqueto.pas',
  URBoletaBB in '..\ContaReceber\URBoletaBB.pas',
  UnitBoleta in '..\MyLib\UNITBOLETA.pas' {Boleta},
  URBloquetoTotal in '..\ContaReceber\URBloquetoTotal.pas',
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
  UFRBloqueto_Itau in '..\ContaReceber\UFRBloqueto_Itau.pas' {FRBloqueto_Itau},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  URPatrimonioNaoConfirmado in 'URPatrimonioNaoConfirmado.pas' {FRPatrimonioNaoConfirmado},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame},
  UFmFilial in '..\Frames\UFmFilial.pas' {FmFilial: TFrame},
  UContasReceberParam in '..\ContaReceber\UContasReceberParam.pas',
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  UContasReceberCons in '..\ContaReceber\UContasReceberCons.pas' {FContasReceberCons},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons},
  UObraContrato_cl in '..\Obra\UObraContrato_cl.pas' {DMObraContrato: TDataModule},
  UObraContrato_Cons in '..\Obra\UObraContrato_Cons.pas' {FObraContrato_Cons},
  UObra_cl in '..\Obra\UObra_cl.pas' {DMObra: TDataModule},
  UObraCons in '..\Obra\UObraCons.pas' {FObraCons},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  UFmContrato in '..\Frames\UFmContrato.pas' {FmContrato: TFrame},
  UContratoVenda_Cons in '..\Agricola\UContratoVenda_Cons.pas' {FContrato_VendaCons},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  UFmFinalidade in '..\Frames\UFmFinalidade.pas' {FmFinalidade: TFrame},
  UMensagemUsuario_cl in '..\Cadastro\UMensagemUsuario_cl.pas' {DmMensagemUsuario: TDataModule},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword},
  UScpc_cl in '..\Cadastro\UScpc_cl.pas' {DMScpc: TDataModule},
  UScpcCons in '..\Cadastro\UScpcCons.pas' {FScpcCons},
  UFmContaCorrente in '..\Frames\UFmContaCorrente.pas' {FmContaCorrente: TFrame},
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UImagemAtalho in '..\Template\UImagemAtalho.pas',
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  UFmBanco in '..\Frames\UFmBanco.pas' {FMBanco: TFrame},
  UNotaItensCons in '..\ContaReceber\UNotaItensCons.pas' {FNotaItensCons},
  UTipoLote_cl in '..\Estoque\UTipoLote_cl.pas' {DMTipoLote: TDataModule},
  UNfe_cl in '..\MonitorNfe\UNfe_cl.pas' {DMNfe: TDataModule},
  UNFeParam in '..\MonitorNfe\UNFeParam.pas' {FNFeParam},
  UFmNfeLote in '..\Frames\UFmNfeLote.pas' {FmNfeLote: TFrame},
  UNfEletronicaLote_cl in '..\Vendas\UNfEletronicaLote_cl.pas' {DMNfEletronicaLote: TDataModule},
  UVendaPerdidaCad in '..\Estoque\UVendaPerdidaCad.pas' {FVendaPerdidaCad},
  UProdutos_UltimasCompras in '..\Estoque\UProdutos_UltimasCompras.pas' {FProdutos_UltimasCompras},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  UImpressoraFiscal in '..\Vendas\UImpressoraFiscal.pas' {FImpressoraFiscal},
  UImpressoraFiscal_cl in '..\Vendas\UImpressoraFiscal_cl.pas' {DMImpressoraFiscal: TDataModule},
  UCupomFiscalParam in '..\Vendas\UCupomFiscalParam.pas' {FCupomFiscalParam},
  UAliquotasImpressora in '..\Vendas\UAliquotasImpressora.pas' {FAliquotasImpressora},
  UAguarde in '..\ContaReceber\UAguarde.pas' {FAguarde},
  UTef in '..\Vendas\UTef.pas' {FTEF},
  UTef_cl in '..\Vendas\UTef_cl.pas' {DMTEF: TDataModule},
  UTefInputBoxCheque in '..\Vendas\UTefInputBoxCheque.pas' {FTefInputBoxCheque},
  UTefInputBox in '..\Vendas\UTefInputBox.pas' {FTefInputBox},
  UConhecimento_cl in '..\Conhecimento\UConhecimento_cl.pas' {DMConhecimento: TDataModule},
  URBloqueto_Sicoob in '..\ContaReceber\URBloqueto_Sicoob.pas' {FRBloqueto_Sicoob},
  UFmObra in '..\Frames\UFmObra.pas' {FmObra: TFrame},
  UFmTitulo in '..\Frames\UFmTitulo.pas' {FmTitulo: TFrame},
  UProdutos_UltimasVendas in '..\Estoque\UProdutos_UltimasVendas.pas' {FProdutos_UltimasVendas},
  UEmbarque_cl in '..\Vendas\UEmbarque_cl.pas' {DMEmbarque: TDataModule},
  UCteLote_cl in '..\Conhecimento\UCteLote_cl.pas' {DMCteLote: TDataModule},
  UImpressoraFiscalParam in '..\Vendas\UImpressoraFiscalParam.pas' {FImpressoraFiscalParam},
  UNotaSaida_Cancela in '..\Vendas\UNotaSaida_Cancela.pas' {FNotaSaida_Cancela},
  URadioDialog in '..\Vendas\URadioDialog.pas' {FRadioDialog},
  UMdfeLote_cl in '..\Conhecimento\UMdfeLote_cl.pas' {DMMdfeLote: TDataModule},
  UEnviaEmail in '..\Agricola\UEnviaEmail.pas' {FEnviaEmail},
  URBloqueto_CEF_SIGCB in '..\ContaReceber\URBloqueto_CEF_SIGCB.pas' {FRBloqueto_CEF_SIGCB},
  UDevolucaoTroca_cl in '..\Vendas\UDevolucaoTroca_cl.pas' {DMDevolucaoTroca: TDataModule},
  UTabelaPreco_cl in '..\Estoque\UTabelaPreco_cl.pas' {DMTabelaPreco: TDataModule},
  URBoletaBB_SIC in '..\ContaReceber\URBoletaBB_SIC.pas' {FRBoletaBB_SIC},
  URBloqueto_Cresol in '..\ContaReceber\URBloqueto_Cresol.pas' {FRBloqueto_Cresol},
  URBloqueto_Uniprime in '..\ContaReceber\URBloqueto_Uniprime.pas' {FRBloqueto_Uniprime},
  UOrdemServico_cl in '..\AssitenciaTecnica\UOrdemServico_cl.pas' {DMOrdemServico: TDataModule},
  UVisualizaAmplia in '..\Estoque\UVisualizaAmplia.pas' {FVisualizaAmplia},
  UObservacao_Cons in '..\Estoque\UObservacao_Cons.pas' {FObservacao_Cons},
  URSerie in '..\Compras\URSerie.pas' {FRSerie},
  USerieCad in '..\Compras\USerieCad.pas' {FSerieCad};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.Title := 'Sistema de Patrimônio';
  Application.HelpFile := 'F:\Executaveis\Manual\P_Patrimonio2.hlp';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMPatrimonio, DMPatrimonio);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMLocalizacao, DMLocalizacao);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMFatorICMS, DMFatorICMS);
  Application.CreateForm(TDMApolice, DMApolice);
  Application.CreateForm(TDMDepreciacao, DMDepreciacao);
  Application.CreateForm(TDMCIAP, DMCIAP);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDMIncorporacao, DMIncorporacao);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMHistContabil, DMHistContabil);
  Application.CreateForm(TDMCFOP, DMCFOP);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TDMGrupoConta, DMGrupoConta);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDMObraContrato, DMObraContrato);
  Application.CreateForm(TDMObra, DMObra);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TDmMensagemUsuario, DmMensagemUsuario);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TDMScpc, DMScpc);
  Application.CreateForm(TDMTipoLote, DMTipoLote);
  Application.CreateForm(TDMNfe, DMNfe);
  Application.CreateForm(TDMNfEletronicaLote, DMNfEletronicaLote);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TDMImpressoraFiscal, DMImpressoraFiscal);
  Application.CreateForm(TDMTEF, DMTEF);
  Application.CreateForm(TDMConhecimento, DMConhecimento);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TDMCteLote, DMCteLote);
  Application.CreateForm(TDMMdfeLote, DMMdfeLote);
  Application.CreateForm(TDMDevolucaoTroca, DMDevolucaoTroca);
  Application.CreateForm(TDMTabelaPreco, DMTabelaPreco);
  Application.CreateForm(TDMOrdemServico, DMOrdemServico);
  Application.CreateForm(TFMenuPatrimonio, FMenuPatrimonio);
  FSplash.Hide;
  FSplash.Free;
  Application.Run;

end.
