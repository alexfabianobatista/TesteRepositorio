program PjControleVeiculo;

uses
  Forms,
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  USplash in '..\Banco\USplash.pas' {FSplash},
  UTMenuPrincipal in '..\TEMPLATE\UTMenuPrincipal.pas' {FTMenuPrincipal},
  UMenuControleVeiculo in 'UMenuControleVeiculo.pas' {FMenuControleVeiculo},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  ULogin in '..\Seguranca\ULOGIN.pas' {FLogin},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UVeiculoModelo_cl in 'UVeiculoModelo_cl.pas' {DMVeiculoModelo: TDataModule},
  UVeiculoModeloCad in 'UVeiculoModeloCad.pas' {FVeiculoModeloCad},
  UVeiculoModeloCons in 'UVeiculoModeloCons.pas' {FVeiculoModeloCons},
  UVeiculo_cl in 'UVeiculo_cl.pas' {DMVeiculo: TDataModule},
  UVeiculoCad in 'UVeiculoCad.pas' {FVeicCad},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UVeiculoCons in 'UVeiculoCons.pas' {FVeiculoCons},
  UCustoVeiculoMov_cl in 'UCustoVeiculoMov_cl.pas' {DMCustoVeiculoMov: TDataModule},
  UCustoVeiculoMovCad in 'UCustoVeiculoMovCad.pas' {FCustoVeiculoMovCad},
  UCustoVeiculoMovCons in 'UCustoVeiculoMovCons.pas' {FCustoVeiculoMovCons},
  UVeiculoFabricante_cl in 'UVeiculoFabricante_cl.pas' {DMVeiculoFabricante: TDataModule},
  UVeiculoFabricanteCad in 'UVeiculoFabricanteCad.pas' {FVeiculoFabricanteCad},
  UVeiculoFabricanteCons in 'UVeiculoFabricanteCons.pas' {FVeiculoFabricanteCons},
  URVeiculoFabricante in 'URVeiculoFabricante.pas' {FRVeiculoFabricante},
  URVeiculoModelo in 'URVeiculoModelo.pas' {FRVeiculoModelo},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  UCor_cl in 'UCor_cl.pas' {DMCor: TDataModule},
  UCorCad in 'UCorCad.pas' {FCorCad},
  UCorCons in 'UCorCons.pas' {FCorCons},
  URCor in 'URCor.pas' {FRCor},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  URVeiculo in 'URVeiculo.pas' {FRVeiculo},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UControleVeiculoParam in 'UControleVeiculoParam.pas' {FControleVeiculoParam},
  URCustoVeiculoMov in 'URCustoVeiculoMov.pas' {FRCustoVeiculoMov},
  UFRCustoPorVeiculo in 'UFRCustoPorVeiculo.pas' {FRCustoPorVeiculo},
  UDespesaRecup_cl in 'UDespesaRecup_cl.pas' {DMDespesaRecup: TDataModule},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UDespesaRecupCad in 'UDespesaRecupCad.pas' {FDespesaRecupCad},
  URGastoVeiculo in 'URGastoVeiculo.pas' {FRGastoVeiculo},
  UMediaKm in 'UMediaKm.pas' {FMediaKm},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  UTConsulta in '..\TEMPLATE\UTConsulta.pas' {FTConsulta},
  UDespesaRecupCons in 'UDespesaRecupCons.pas' {FDespesaRecupCons},
  URRecibo in 'URRecibo.pas' {FRRecibo},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  URDespesaRecup in 'URDespesaRecup.pas' {FRDespesaRecup},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  URMedia in 'URMedia.pas' {FRMedia},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URResumoDespesas in 'URResumoDespesas.pas' {FRResumoDespesas},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UCidadeCons in '..\Cadastro\UCidadeCons.pas' {FCidadeCons},
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
  UFmVeiculo in '..\Frames\UFmVeiculo.pas' {FmVeiculo: TFrame},
  UFmProduto in '..\Frames\UFmProduto.pas' {FmProduto: TFrame},
  UFmFilial in '..\Frames\UFmFilial.pas' {FmFilial: TFrame},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword},
  UScpcCons in '..\Cadastro\UScpcCons.pas' {FScpcCons},
  UScpc_cl in '..\Cadastro\UScpc_cl.pas' {DMScpc: TDataModule},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  URGastoVeiculo2 in 'URGastoVeiculo2.pas' {FRGastoVeiculo2},
  UMensagemUsuario_cl in '..\Cadastro\UMensagemUsuario_cl.pas' {DmMensagemUsuario: TDataModule},
  UImagemAtalho in '..\Template\UImagemAtalho.pas',
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UrReceitaDespesasVeiculos in 'UrReceitaDespesasVeiculos.pas' {FrReceitaDespesasVeiculos},
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  UVendaPerdidaCad in '..\Estoque\UVendaPerdidaCad.pas' {FVendaPerdidaCad},
  UProdutos_UltimasCompras in '..\Estoque\UProdutos_UltimasCompras.pas' {FProdutos_UltimasCompras},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  UProprietario_cl in '..\Conhecimento\UProprietario_cl.pas' {DMProprietario: TDataModule},
  UConhecimento_cl in '..\Conhecimento\UConhecimento_cl.pas' {DMConhecimento: TDataModule},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UFmContrato in '..\Frames\UFmContrato.pas' {FmContrato: TFrame},
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  UFmFinalidade in '..\Frames\UFmFinalidade.pas' {FmFinalidade: TFrame},
  UFmBanco in '..\Frames\UFmBanco.pas' {FMBanco: TFrame},
  UFmObra in '..\Frames\UFmObra.pas' {FmObra: TFrame},
  UFmNfeLote in '..\Frames\UFmNfeLote.pas' {FmNfeLote: TFrame},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons},
  UContratoVenda_Cons in '..\Agricola\UContratoVenda_Cons.pas' {FContrato_VendaCons},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  UObra_cl in '..\Obra\UObra_cl.pas' {DMObra: TDataModule},
  UObraCons in '..\Obra\UObraCons.pas' {FObraCons},
  UContasReceberCons in '..\ContaReceber\UContasReceberCons.pas' {FContasReceberCons},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  UNotaSaidaCons in '..\Vendas\UNotaSaidaCons.pas' {FNotaSaidaCons},
  UObraContrato_Cons in '..\Obra\UObraContrato_Cons.pas' {FObraContrato_Cons},
  UObraContrato_cl in '..\Obra\UObraContrato_cl.pas' {DMObraContrato: TDataModule},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  UContasReceberParam in '..\ContaReceber\UContasReceberParam.pas' {FContasReceberParam},
  URBloqueto_Bradesco in '..\ContaReceber\URBloqueto_Bradesco.pas' {FRBloqueto_Bradesco},
  URBloqueto_HSBC in '..\ContaReceber\URBloqueto_HSBC.pas' {FRBloqueto_HSBC},
  URBloqueto_Rural in '..\ContaReceber\URBloqueto_Rural.pas' {FRBloqueto_Rural},
  URBloqueto_Santander in '..\ContaReceber\URBloqueto_Santander.pas' {FRBloqueto_Santander},
  URBloqueto_Sicredi in '..\ContaReceber\URBloqueto_Sicredi.pas' {FRBloqueto_Sicredi},
  URBloqueto_Sudameris in '..\ContaReceber\URBloqueto_Sudameris.pas' {FRBloqueto_Sudameris},
  URBloqueto_Unibanco in '..\ContaReceber\URBloqueto_Unibanco.pas' {FRBloqueto_Unibanco},
  URBloquetoSafra in '..\ContaReceber\URBloquetoSafra.pas' {FRBloqueto_Safra},
  URBoletaBB in '..\ContaReceber\URBoletaBB.pas',
  UNfEletronicaLote_cl in '..\Vendas\UNfEletronicaLote_cl.pas' {DMNfEletronicaLote: TDataModule},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  UHistorico_cl in '..\ContaPagar\UHistorico_cl.pas' {DMHistorico: TDataModule},
  UConhecimentoFrete_cl in '..\Conhecimento\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  UNfe_cl in '..\MonitorNfe\UNfe_cl.pas' {DMNfe: TDataModule},
  UNFeParam in '..\MonitorNfe\UNFeParam.pas' {FNFeParam},
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UContasReceber_cl in '..\ContaReceber\UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  UCteLote_cl in '..\Conhecimento\UCteLote_cl.pas' {DMCteLote: TDataModule},
  UTipoLote_cl in '..\Estoque\UTipoLote_cl.pas' {DMTipoLote: TDataModule},
  UNotaItensCons in '..\ContaReceber\UNotaItensCons.pas' {FNotaItensCons},
  UFRBloqueto_Itau in '..\ContaReceber\UFRBloqueto_Itau.pas' {FRBloqueto_Itau},
  URBloqueto_CEF in '..\ContaReceber\URBloqueto_CEF.pas' {FRBloqueto_CEF},
  UEnviaEmail in '..\Agricola\UEnviaEmail.pas' {FEnviaEmail},
  UBloqueto in '..\ContaReceber\UBloqueto.pas',
  USpedValidacao in '..\Compras\USpedValidacao.pas',
  UProdutos_UltimasVendas in '..\Estoque\UProdutos_UltimasVendas.pas' {FProdutos_UltimasVendas},
  UFmTitulo in '..\Frames\UFmTitulo.pas' {FmTitulo: TFrame},
  UFmContaCorrente in '..\Frames\UFmContaCorrente.pas' {FmContaCorrente: TFrame},
  URBloqueto_Sicoob in '..\ContaReceber\URBloqueto_Sicoob.pas' {FRBloqueto_Sicoob},
  UImpressoraFiscal_cl in '..\Vendas\UImpressoraFiscal_cl.pas' {DMImpressoraFiscal: TDataModule},
  UEmbarque_cl in '..\Vendas\UEmbarque_cl.pas' {DMEmbarque: TDataModule},
  UMdfeLote_cl in '..\Conhecimento\UMdfeLote_cl.pas' {DMMdfeLote: TDataModule},
  UImpressoraFiscal in '..\Vendas\UImpressoraFiscal.pas' {FImpressoraFiscal},
  TefUtils in '..\MyLib\Tef\TefUtils.pas',
  UTef in '..\Vendas\UTef.pas' {FTEF},
  UTefInputBox in '..\Vendas\UTefInputBox.pas' {FTefInputBox},
  UTefInputBoxCheque in '..\Vendas\UTefInputBoxCheque.pas' {FTefInputBoxCheque},
  UImpressoraFiscalParam in '..\Vendas\UImpressoraFiscalParam.pas' {FImpressoraFiscalParam},
  UNotaSaida_Cancela in '..\Vendas\UNotaSaida_Cancela.pas' {FNotaSaida_Cancela},
  UCupomFiscalParam in '..\Vendas\UCupomFiscalParam.pas' {FCupomFiscalParam},
  URadioDialog in '..\Vendas\URadioDialog.pas' {FRadioDialog},
  UTef_cl in '..\Vendas\UTef_cl.pas' {DMTEF: TDataModule},
  UAliquotasImpressora in '..\Vendas\UAliquotasImpressora.pas' {FAliquotasImpressora},
  UAguarde in '..\ContaReceber\UAguarde.pas' {FAguarde},
  UPneu_cl in 'UPneu_cl.pas' {DMPneu: TDataModule},
  UFPneuCad in 'UFPneuCad.pas' {FPneuCad},
  UFPneuCons in 'UFPneuCons.pas' {FPneuCons},
  UFRPneu in 'UFRPneu.pas' {FRPneu},
  URBloqueto_CEF_SIGCB in '..\ContaReceber\URBloqueto_CEF_SIGCB.pas' {FRBloqueto_CEF_SIGCB},
  UDevolucaoTroca_cl in '..\Vendas\UDevolucaoTroca_cl.pas' {DMDevolucaoTroca: TDataModule},
  UFmLote in '..\Frames\UFmLote.pas' {FmLote: TFrame},
  UTipoLoteCons in '..\Estoque\UTipoLoteCons.pas' {FTipoLoteCons},
  UTabelaPreco_cl in '..\Estoque\UTabelaPreco_cl.pas' {DMTabelaPreco: TDataModule},
  URBoletaBB_SIC in '..\ContaReceber\URBoletaBB_SIC.pas',
  UnitBoleta in '..\MyLib\UNITBOLETA.pas' {Boleta},
  URDadosVeiculo in 'URDadosVeiculo.pas' {FRDadosVeiculo},
  UAguardoNfe in '..\MyLib\UAguardoNfe.pas' {FAguardoNfe},
  UNFeRetorno in '..\MyLib\UNFeRetorno.pas' {FNFeRetorno},
  UMarcaPneuCad in 'UMarcaPneuCad.pas' {FMarcaPneuCad},
  UMarcaPneu_cl in 'UMarcaPneu_cl.pas' {DMMarcaPneu: TDataModule},
  UMarcaPneuCons in 'UMarcaPneuCons.pas' {FMarcaPneuCons},
  URTrocaPneu in 'URTrocaPneu.pas' {FRTrocaPneu},
  UHistContabil_cl in '..\Contabil\UHistContabil_cl.pas' {DMHistContabil: TDataModule},
  UHistContabilCons in '..\Contabil\UHistContabilCons.pas' {FHistContabilCons},
  URBloqueto_Cresol in '..\ContaReceber\URBloqueto_Cresol.pas' {FRBloqueto_Cresol},
  URBloqueto_Uniprime in '..\ContaReceber\URBloqueto_Uniprime.pas' {FRBloqueto_Uniprime},
  UOrdemServico_cl in '..\AssitenciaTecnica\UOrdemServico_cl.pas' {DMOrdemServico: TDataModule},
  UVisualizaAmplia in '..\Estoque\UVisualizaAmplia.pas' {FVisualizaAmplia},
  URCustoVeiculoReqNF in 'URCustoVeiculoReqNF.pas' {FRCustoVeiculoReqNF},
  UrReceitaDespesasVeiculosSintetico in 'UrReceitaDespesasVeiculosSintetico.pas' {FrReceitaDespesasVeiculosSintetico},
  URReceitaDespesasVeiculosMensal in 'URReceitaDespesasVeiculosMensal.pas' {FrReceitaDespesasVeiculosMensal},
  UObservacao_Cons in '..\Estoque\UObservacao_Cons.pas' {FObservacao_Cons},
  URSerie in '..\Compras\URSerie.pas' {FRSerie},
  USerieCad in '..\Compras\USerieCad.pas' {FSerieCad},
  URRequisicaoVeiculo in 'URRequisicaoVeiculo.pas' {FRRequisicaoVeiculo},
  UMarca_cl in '..\Estoque\UMarca_cl.pas' {DMMarca: TDataModule},
  UMarcaCons in '..\Estoque\UMarcaCons.pas' {FMarca_Cons},
  UProprietarioCons in '..\Conhecimento\UProprietarioCons.pas' {FProprietarioCons},
  UVeiculoConhecimentoCons in '..\Conhecimento\UVeiculoConhecimentoCons.pas' {FVeiculoConhecimentoCons};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.Title := 'Sistema de Controle de Veículos';
  Application.HelpFile := 'F:\Executaveis\Manual\P_CONTROLE_VEICULO.HLP';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMVeiculoModelo, DMVeiculoModelo);
  Application.CreateForm(TDMVeiculo, DMVeiculo);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMCustoVeiculoMov, DMCustoVeiculoMov);
  Application.CreateForm(TDMVeiculoFabricante, DMVeiculoFabricante);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMCor, DMCor);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMDespesaRecup, DMDespesaRecup);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TDMScpc, DMScpc);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TDmMensagemUsuario, DmMensagemUsuario);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TDMProprietario, DMProprietario);
  Application.CreateForm(TDMConhecimento, DMConhecimento);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMObra, DMObra);
  Application.CreateForm(TDMObraContrato, DMObraContrato);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMNfEletronicaLote, DMNfEletronicaLote);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMNfe, DMNfe);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDMCteLote, DMCteLote);
  Application.CreateForm(TDMTipoLote, DMTipoLote);
  Application.CreateForm(TDMImpressoraFiscal, DMImpressoraFiscal);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TDMMdfeLote, DMMdfeLote);
  Application.CreateForm(TDMTEF, DMTEF);
  Application.CreateForm(TDMPneu, DMPneu);
  Application.CreateForm(TDMDevolucaoTroca, DMDevolucaoTroca);
  Application.CreateForm(TDMTabelaPreco, DMTabelaPreco);
  Application.CreateForm(TDMMarcaPneu, DMMarcaPneu);
  Application.CreateForm(TDMHistContabil, DMHistContabil);
  Application.CreateForm(TDMOrdemServico, DMOrdemServico);
  Application.CreateForm(TDMMarca, DMMarca);
  Application.CreateForm(TFMenuControleVeiculo, FMenuControleVeiculo);
  FSplash.hide;
  FSplash.Free;
  Application.Run;
end.
