program PJSegurancaTrabalho;

uses
  Forms,
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  USplash in '..\Banco\USplash.pas' {FSplash},
  UTMenuPrincipal in '..\TEMPLATE\UTMenuPrincipal.pas' {FTMenuPrincipal},
  UMenuSegurancaTrabalho in 'UMenuSegurancaTrabalho.pas' {FMenuSegurancaTrabalho},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  UEstadoCons in '..\Cadastro\UEstadoCons.pas' {FEstadoCons},
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  UHistoricoCons in '..\ContaPagar\UHistoricoCons.pas' {FHistoricoCons},
  UHistorico_cl in '..\ContaPagar\UHistorico_cl.pas' {DMHistorico: TDataModule},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  UUsuario_cl in '..\seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UrFuncionario in '..\Manutencao\UrFuncionario.pas' {FRFuncionario},
  UFuncionarioCad in '..\Manutencao\UFuncionarioCad.pas' {FFuncionarioCad},
  UFuncionario_cl in '..\Manutencao\UFuncionario_cl.pas' {DMFuncionario: TDataModule},
  UFFuncionarioCons in '..\Manutencao\UFFuncionarioCons.pas' {FFuncionarioCons},
  UCategoriaProfissional_cl in '..\Manutencao\UCategoriaProfissional_cl.pas' {DMCategoriaProfissional: TDataModule},
  UCidadeCons in '..\Cadastro\UCidadeCons.pas' {FCidadeCons},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UrCategoria in '..\Manutencao\UrCategoria.pas' {FRCategoria},
  UExame_cl in 'UExame_cl.pas' {DMExame: TDataModule},
  UExameCad in 'UExameCad.pas' {FExameCad},
  UExameCons in 'UExameCons.pas' {FExameCons},
  UTipoExameCad in 'UTipoExameCad.pas' {FTipoExameCad},
  UTipoExame_cl in 'UTipoExame_cl.pas' {DMTipoExame: TDataModule},
  UTipoExameCons in 'UTipoExameCons.pas' {FTipoExameCons},
  UFuncaoFuncionario_cl in 'UFuncaoFuncionario_cl.pas' {DMFuncaoFuncionario: TDataModule},
  UFuncaoFuncionarioCad in 'UFuncaoFuncionarioCad.pas' {FFuncaoFuncionarioCad},
  UFuncaoFuncionarioCons in 'UFuncaoFuncionarioCons.pas' {FFuncaoFuncionarioCons},
  UExameFuncionario_cl in 'UExameFuncionario_cl.pas' {DMExameFuncionario: TDataModule},
  UExameFuncionarioCad in 'UExameFuncionarioCad.pas' {FExameFuncionarioCad},
  UEstadoCivil_cl in '..\Cadastro\UEstadoCivil_cl.pas' {DMEstadoCivil: TDataModule},
  UEstadoCivilCons in '..\Cadastro\UEstadoCivilCons.pas' {FEstadoCivilCons},
  UEmprestimo_cl in 'UEmprestimo_cl.pas' {DMEmprestimo: TDataModule},
  UEmprestimoCad in 'UEmprestimoCad.pas' {FEmprestimoCad},
  UEmprestimoCons in 'UEmprestimoCons.pas' {FEmprestimoCons},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  URRelacaoExame in 'URRelacaoExame.pas' {FRRelacaoExame},
  URTipoExame in 'URTipoExame.pas' {FRTipoExame},
  URFuncaoFuncionario in 'URFuncaoFuncionario.pas' {FRFuncaoFuncionario},
  USegurancaParam in 'USegurancaParam.pas' {FSegurancaParam},
  URRelacaoEmprestimo in 'URRelacaoEmprestimo.pas' {FRRelacaoEmprestimo},
  URPosicaoEmprestimo in 'URPosicaoEmprestimo.pas' {FRPosicaoEmprestimo},
  UREmprestimoRetornavel in 'UREmprestimoRetornavel.pas' {FREmprestimoRetornavel},
  URTermoResponsabilidade in 'URTermoResponsabilidade.pas' {FRTermoResponsabilidade},
  UProdutoSegurancaCad in 'UProdutoSegurancaCad.pas' {FProdutoSegurancaCad},
  UProdutoSeguranca_cl in 'UProdutoSeguranca_cl.pas' {DMProdutoSeguranca: TDataModule},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UProdutoSegurancaCons in 'UProdutoSegurancaCons.pas' {FProdutoSegurancaCons},
  URProdutoSeguranca in 'URProdutoSeguranca.pas' {FRProdutoSeguranca},
  UCompraProdutoCad in 'UCompraProdutoCad.pas' {FCompraProdutoCad},
  UCompraProdutoCons in 'UCompraProdutoCons.pas' {FCompraProdutoCons},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  URomaneioCons in '..\Agricola\URomaneioCons.pas' {FRomaneioCons},
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  UNotaEntradaCons in '..\Compras\UNotaEntradaCons.pas' {FNotaEntradaCons},
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
  URMovEstoqueSeg in 'URMovEstoqueSeg.pas' {FRMovEstoqueSeg},
  UEstoqueSeguranca_cl in 'UEstoqueSeguranca_cl.pas' {DMEstoqueSeguranca: TDataModule},
  UCompraSeguranca_cl in 'UCompraSeguranca_cl.pas' {DMCompraSeguranca: TDataModule},
  URNotasRelacao in 'URNotasRelacao.pas' {FRNotasRelacao},
  UBaixaEstoqueCons in 'UBaixaEstoqueCons.pas' {FBaixaEstoqueCons},
  UCaracteristicaProduto_cl in 'UCaracteristicaProduto_cl.pas' {DMCaracteristicaProduto: TDataModule},
  UCaracteristicaProdutoCad in 'UCaracteristicaProdutoCad.pas' {FCaracteristicaProdutoCad},
  UCaracteristicaProdutoCons in 'UCaracteristicaProdutoCons.pas' {FCaracteristicaProdutoCons},
  UtransfEstoqueCons in 'UtransfEstoqueCons.pas' {FTransfEstoqueCons},
  UEstoqueSeguranca in 'UEstoqueSeguranca.pas' {FEstoqueSeguranca},
  UEstoqueImplantadoCons in 'UEstoqueImplantadoCons.pas' {FEstoqueImplantadoCons},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  UCategoriaCons in '..\Manutencao\UCategoriaCons.pas' {FCategoriaCons},
  UCidadeCad in '..\Cadastro\UCidadeCad.pas' {FCidadeCad},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UConhecimentoFrete_cl in '..\Conhecimento\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  URRomaneioNotas in '..\Agricola\URRomaneioNotas.pas' {FrRomNotaParam},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UEstoqueSegurancaCons in 'UEstoqueSegurancaCons.pas' {FEstoqueSegurancaCons},
  URExameFuncionario in 'URExameFuncionario.pas' {FRExameFuncionario},
  URFuncionarioFuncao in 'URFuncionarioFuncao.pas' {FRFuncionarioFuncao},
  URCaracteristicaProduto in 'URCaracteristicaProduto.pas' {FRCaracteristicaProduto},
  URBaixaEstoque in 'URBaixaEstoque.pas' {FRBaixaEstoque},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UTransfEstoqueCad in 'UTransfEstoqueCad.pas' {FTransfEstoqueCad},
  UTecnicoSeguranca_cl in 'UTecnicoSeguranca_cl.pas' {DMTecnicoSeguranca: TDataModule},
  UTecnicoSeguranca in 'UTecnicoSeguranca.pas' {FTecnicoSegurancaCad},
  URImpTransf in 'URImpTransf.pas' {FRImpTransf},
  UREstoqueSeguranca in 'UREstoqueSeguranca.pas' {FREstoqueSeguranca},
  UTConsulta in '..\TEMPLATE\UTConsulta.pas' {FTConsulta},
  UTecnicoSegurancaCons in 'UTecnicoSegurancaCons.pas' {FTecnicoSegurancaCons},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URTecnicoSeguranca in 'URTecnicoSeguranca.pas' {FRTecnicoSeguranca},
  URPosEstoque in 'URPosEstoque.pas' {FRPosEstoque},
  UREstoqueImplantado in 'UREstoqueImplantado.pas' {FREstoqueImplantado},
  URTransfEstoque in 'URTransfEstoque.pas' {FRTransfEstoque},
  UREmprestimoNaoRetornavel in 'UREmprestimoNaoRetornavel.pas' {FREmprestimoNaoRetornavel},
  URPosicaoEstoque in 'URPosicaoEstoque.pas' {FRPosicaoEstoque},
  URPosicaoCompra in 'URPosicaoCompra.pas' {FRPosicaoCompra},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  UMensagemUsuario_cl in '..\Cadastro\UMensagemUsuario_cl.pas' {DmMensagemUsuario: TDataModule},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword},
  UTef_cl in '..\Vendas\UTef_cl.pas' {DMTEF: TDataModule},
  UAguarde in '..\ContaReceber\UAguarde.pas' {FAguarde},
  URadioDialog in '..\Vendas\URadioDialog.pas' {FRadioDialog},
  UTefInputBox in '..\Vendas\UTefInputBox.pas' {FTefInputBox},
  UTefInputBoxCheque in '..\Vendas\UTefInputBoxCheque.pas' {FTefInputBoxCheque},
  UTef in '..\Vendas\UTef.pas' {FTEF},
  UImpressoraFiscalParam in '..\Vendas\UImpressoraFiscalParam.pas',
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UFmFilial in '..\Frames\UFmFilial.pas' {FmFilial: TFrame},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  UEnviaEmail in '..\Agricola\UEnviaEmail.pas' {FEnviaEmail},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  UProdutos_UltimasCompras in '..\Estoque\UProdutos_UltimasCompras.pas' {FProdutos_UltimasCompras},
  UProdutos_UltimasVendas in '..\Estoque\UProdutos_UltimasVendas.pas' {FProdutos_UltimasVendas},
  UVendaPerdidaCad in '..\Estoque\UVendaPerdidaCad.pas' {FVendaPerdidaCad},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons},
  UContratoVenda_Cons in '..\Agricola\UContratoVenda_Cons.pas' {FContrato_VendaCons},
  UFmContaCorrente in '..\Frames\UFmContaCorrente.pas' {FmContaCorrente: TFrame},
  UFmObra in '..\Frames\UFmObra.pas' {FmObra: TFrame},
  UFmTitulo in '..\Frames\UFmTitulo.pas' {FmTitulo: TFrame},
  UFmBanco in '..\Frames\UFmBanco.pas' {FMBanco: TFrame},
  UFmContrato in '..\Frames\UFmContrato.pas' {FmContrato: TFrame},
  UFmFinalidade in '..\Frames\UFmFinalidade.pas' {FmFinalidade: TFrame},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  UObra_cl in '..\Obra\UObra_cl.pas' {DMObra: TDataModule},
  UContasReceberCons in '..\ContaReceber\UContasReceberCons.pas' {FContasReceberCons},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  UNotaSaidaCons in '..\Vendas\UNotaSaidaCons.pas' {FNotaSaidaCons},
  UObraContrato_cl in '..\Obra\UObraContrato_cl.pas' {DMObraContrato: TDataModule},
  UObraContrato_Cons in '..\Obra\UObraContrato_Cons.pas' {FObraContrato_Cons},
  UObraCons in '..\Obra\UObraCons.pas' {FObraCons},
  UNotaItensCons in '..\ContaReceber\UNotaItensCons.pas' {FNotaItensCons},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  UContasReceberParam in '..\ContaReceber\UContasReceberParam.pas',
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  UContasReceber_cl in '..\ContaReceber\UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  UFRBloqueto_Itau in '..\ContaReceber\UFRBloqueto_Itau.pas' {FRBloqueto_Itau},
  URBloqueto_HSBC in '..\ContaReceber\URBloqueto_HSBC.pas' {FRBloqueto_HSBC},
  URBloqueto_Santander in '..\ContaReceber\URBloqueto_Santander.pas' {FRBloqueto_Santander},
  URBloqueto_Sicredi in '..\ContaReceber\URBloqueto_Sicredi.pas' {FRBloqueto_Sicredi},
  URBloqueto_Unibanco in '..\ContaReceber\URBloqueto_Unibanco.pas' {FRBloqueto_Unibanco},
  URBloqueto_Rural in '..\ContaReceber\URBloqueto_Rural.pas' {FRBloqueto_Rural},
  URBloqueto_Sicoob in '..\ContaReceber\URBloqueto_Sicoob.pas' {FRBloqueto_Sicoob},
  URBloquetoSafra in '..\ContaReceber\URBloquetoSafra.pas' {FRBloqueto_Safra},
  URBoletaBB in '..\ContaReceber\URBoletaBB.pas',
  URBloqueto_CEF in '..\ContaReceber\URBloqueto_CEF.pas' {FRBloqueto_CEF},
  URBloqueto_Sudameris in '..\ContaReceber\URBloqueto_Sudameris.pas' {FRBloqueto_Sudameris},
  UNfEletronicaLote_cl in '..\Vendas\UNfEletronicaLote_cl.pas' {DMNfEletronicaLote: TDataModule},
  UConhecimento_cl in '..\Conhecimento\UConhecimento_cl.pas' {DMConhecimento: TDataModule},
  UCteLote_cl in '..\Conhecimento\UCteLote_cl.pas' {DMCteLote: TDataModule},
  UMdfeLote_cl in '..\Conhecimento\UMdfeLote_cl.pas' {DMMdfeLote: TDataModule},
  UFmNfeLote in '..\Frames\UFmNfeLote.pas' {FmNfeLote: TFrame},
  UNfe_cl in '..\MonitorNfe\UNfe_cl.pas' {DMNfe: TDataModule},
  UNFeParam in '..\MonitorNfe\UNFeParam.pas' {FNFeParam},
  UNotaSaida_Cancela in '..\Vendas\UNotaSaida_Cancela.pas' {FNotaSaida_Cancela},
  URBloqueto_Bradesco in '..\ContaReceber\URBloqueto_Bradesco.pas' {FRBloqueto_Bradesco},
  UAliquotasImpressora in '..\Vendas\UAliquotasImpressora.pas' {FAliquotasImpressora},
  UCupomFiscalParam in '..\Vendas\UCupomFiscalParam.pas' {FCupomFiscalParam},
  UImpressoraFiscal_cl in '..\Vendas\UImpressoraFiscal_cl.pas' {DMImpressoraFiscal: TDataModule},
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  UEmbarque_cl in '..\Vendas\UEmbarque_cl.pas' {DMEmbarque: TDataModule},
  UTipoLote_cl in '..\Estoque\UTipoLote_cl.pas' {DMTipoLote: TDataModule},
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UImpressoraFiscal in '..\Vendas\UImpressoraFiscal.pas' {FImpressoraFiscal},
  UCategoriaCad in '..\Manutencao\UCategoriaCad.pas' {FCategoriaCad},
  URBloqueto_CEF_SIGCB in '..\ContaReceber\URBloqueto_CEF_SIGCB.pas' {FRBloqueto_CEF_SIGCB},
  UDevolucaoTroca_cl in '..\Vendas\UDevolucaoTroca_cl.pas' {DMDevolucaoTroca: TDataModule},
  UVisualizaAmplia in '..\Estoque\UVisualizaAmplia.pas' {FVisualizaAmplia},
  UTabelaPreco_cl in '..\Estoque\UTabelaPreco_cl.pas' {DMTabelaPreco: TDataModule},
  URBloqueto_Cresol in '..\ContaReceber\URBloqueto_Cresol.pas' {FRBloqueto_Cresol},
  URBoletaBB_SIC in '..\ContaReceber\URBoletaBB_SIC.pas',
  URBloqueto_Uniprime in '..\ContaReceber\URBloqueto_Uniprime.pas' {FRBloqueto_Uniprime},
  UHistContabil_cl in '..\Contabil\UHistContabil_cl.pas' {DMHistContabil: TDataModule},
  UHistContabilCons in '..\Contabil\UHistContabilCons.pas' {FHistContabilCons},
  UOrdemServico_cl in '..\AssitenciaTecnica\UOrdemServico_cl.pas' {DMOrdemServico: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.Title := 'Sistema de Controle de Segurança do Trabalho';
  Application.HelpFile := 'F:\Executaveis\Manual\P_SEGURANCA_TRABALHO.HLP';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMFuncionario, DMFuncionario);
  Application.CreateForm(TDMCategoriaProfissional, DMCategoriaProfissional);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMExame, DMExame);
  Application.CreateForm(TDMTipoExame, DMTipoExame);
  Application.CreateForm(TDMFuncaoFuncionario, DMFuncaoFuncionario);
  Application.CreateForm(TDMExameFuncionario, DMExameFuncionario);
  Application.CreateForm(TDMEstadoCivil, DMEstadoCivil);
  Application.CreateForm(TDMEmprestimo, DMEmprestimo);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMProdutoSeguranca, DMProdutoSeguranca);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TDMEstoqueSeguranca, DMEstoqueSeguranca);
  Application.CreateForm(TDMCompraSeguranca, DMCompraSeguranca);
  Application.CreateForm(TDMCaracteristicaProduto, DMCaracteristicaProduto);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMTecnicoSeguranca, DMTecnicoSeguranca);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDmMensagemUsuario, DmMensagemUsuario);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TFMenuSegurancaTrabalho, FMenuSegurancaTrabalho);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TDMObra, DMObra);
  Application.CreateForm(TDMObraContrato, DMObraContrato);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDMNfEletronicaLote, DMNfEletronicaLote);
  Application.CreateForm(TDMConhecimento, DMConhecimento);
  Application.CreateForm(TDMCteLote, DMCteLote);
  Application.CreateForm(TDMMdfeLote, DMMdfeLote);
  Application.CreateForm(TDMNfe, DMNfe);
  Application.CreateForm(TDMImpressoraFiscal, DMImpressoraFiscal);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TDMTipoLote, DMTipoLote);
  Application.CreateForm(TDMDevolucaoTroca, DMDevolucaoTroca);
  Application.CreateForm(TDMTabelaPreco, DMTabelaPreco);
  Application.CreateForm(TFRBloqueto_Uniprime, FRBloqueto_Uniprime);
  Application.CreateForm(TDMHistContabil, DMHistContabil);
  Application.CreateForm(TFHistContabilCons, FHistContabilCons);
  Application.CreateForm(TDMOrdemServico, DMOrdemServico);
  FSplash.hide;
  FSplash.Free;
  Application.Run;
end.
