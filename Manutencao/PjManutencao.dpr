program PjManutencao;

uses
  Forms,
  UTMenuPrincipal in '..\TEMPLATE\UTMENUPRINCIPAL.pas' {FTMenuPrincipal},
  UMenuManutencao in 'UMenuManutencao.pas' {FMenuManutencao},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UEquipamento_cl in 'UEquipamento_cl.pas' {DMEquipamento: TDataModule},
  UEquipamentoCad in 'UEquipamentoCad.pas' {FEquipamentoCad},
  UControleInterno_cl in '..\Seguranca\UControleInterno_cl.pas' {DMControleInterno: TDataModule},
  UAditoria_cl in '..\Seguranca\UAditoria_cl.pas' {DMAuditoria: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UGrupo_cl in '..\Seguranca\UGrupo_cl.pas' {DMGrupo: TDataModule},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UEquipamentoParam in 'UEquipamentoParam.pas' {FEquipamentoParam},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UTipoEquipamentoCons in 'UTipoEquipamentoCons.pas' {FTipoEquipamentoCons},
  UTipoEquipamento_cl in 'UTipoEquipamento_cl.pas' {DMTipoEquipamento: TDataModule},
  UEquipamentoCons in 'UEquipamentoCons.pas' {FEquipamentoCons},
  URTipoEquipamentoCarac in 'URTipoEquipamentoCarac.pas',
  URTipoEquipamento in 'URTipoEquipamento.pas',
  UTipoEquipamentoCad in 'UTipoEquipamentoCad.pas' {FTipoEquipamentoCad},
  UTipoEquipamentoCarac_Cad in 'UTipoEquipamentoCarac_Cad.pas' {FTipoEquipamentoCarac_Cad},
  UTipoEquipamentoCarac_Cons in 'UTipoEquipamentoCarac_Cons.pas' {FTipoEquipamentoCarac_Cons},
  UEquipamentoItemCons in 'UEquipamentoItemCons.pas' {FEquipamentoItemCons},
  URFichaEquipamento in 'URFichaEquipamento.pas' {FRFichaEquipamento},
  UFuncionario_cl in 'UFuncionario_cl.pas' {DMFuncionario: TDataModule},
  UrFuncionario in 'UrFuncionario.pas' {FRFuncionario},
  UFFuncionarioCons in 'UFFuncionarioCons.pas' {FFuncionarioCons},
  UFuncionarioCad in 'UFuncionarioCad.pas' {FFuncionarioCad},
  UCategoriaCad in 'UCategoriaCad.pas' {FCategoriaCad},
  UCategoriaProfissional_cl in 'UCategoriaProfissional_cl.pas' {DMCategoriaProfissional: TDataModule},
  UCategoriaCons in 'UCategoriaCons.pas' {FCategoriaCons},
  UrCategoria in 'UrCategoria.pas' {FRCategoria},
  URAtividade in 'URAtividade.pas' {FRAtividade},
  U_AtividadeCad in 'U_AtividadeCad.pas' {FAtividadeCad},
  UAtividade_cl in 'UAtividade_cl.pas' {DMAtividade: TDataModule},
  UAtividadeCons in 'UAtividadeCons.pas' {FAtividadeCons},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  URTipoServico in 'URTipoServico.pas' {FRTipoServico},
  URProcedimento in 'URProcedimento.pas' {FRProcedimento},
  URPrioridade in 'URPrioridade.pas' {FRPrioridade},
  UProcedimentoCons in 'UProcedimentoCons.pas' {FProcedimentoCons},
  UProcedimentoCad in 'UProcedimentoCad.pas' {FProcedimentoCad},
  UProcedimento_cl in 'UProcedimento_cl.pas' {DMProcedimento: TDataModule},
  UPrioridadeCons in 'UPrioridadeCons.pas' {FPrioridadeCons},
  UPrioridadeCad in 'UPrioridadeCad.pas' {FPrioridadeCad},
  UPrioridade_cl in 'UPrioridade_cl.pas' {DMPrioridade: TDataModule},
  UTipoServicoCons in 'UTipoServicoCons.pas' {FTipoServicoCons},
  UTipoServico_cl in 'UTipoServico_cl.pas' {DMTipoServico: TDataModule},
  U_TipoServicoCad in 'U_TipoServicoCad.pas' {FTipoServicoCad},
  UOSManutencao_cl in 'UOSManutencao_cl.pas' {DMOSManutencao: TDataModule},
  UOSManutencaoCad in 'UOSManutencaoCad.pas' {FOSManutencaoCad},
  UOSManutencaoCons in 'UOSManutencaoCons.pas' {FOSManutencaoCons},
  UOSManutencaoEncerramento in 'UOSManutencaoEncerramento.pas' {FOSManutencaoEncerramento},
  UROSManutencaoFormulario in 'UROSManutencaoFormulario.pas' {FROSManutencaoFormulario},
  URequisicaoPecaCad in 'URequisicaoPecaCad.pas' {FRequisicaoPecaCad},
  URequisicaoPeca_cl in 'URequisicaoPeca_cl.pas' {DMRequisicaoPeca: TDataModule},
  URequisicaoPecaCons in 'URequisicaoPecaCons.pas' {FRequisicaoPecaCons},
  URFichaEquipamentoItem in 'URFichaEquipamentoItem.pas' {FRFichaEquipamentoitem},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UCidadeCons in '..\Cadastro\UCidadeCons.pas' {FCidadeCons},
  UGeraOSCorretiva in 'UGeraOSCorretiva.pas' {FGeraOSCorretiva},
  UFuncaoFuncionarioCons in '..\SegurancaTrabalho\UFuncaoFuncionarioCons.pas' {FFuncaoFuncionarioCons},
  UFuncaoFuncionario_cl in '..\SegurancaTrabalho\UFuncaoFuncionario_cl.pas' {DMFuncaoFuncionario: TDataModule},
  UExameFuncionario_cl in '..\SegurancaTrabalho\UExameFuncionario_cl.pas' {DMExameFuncionario: TDataModule},
  UExameFuncionarioCad in '..\SegurancaTrabalho\UExameFuncionarioCad.pas' {FExameFuncionarioCad},
  UTipoExameCons in '..\SegurancaTrabalho\UTipoExameCons.pas' {FTipoExameCons},
  UTipoExame_cl in '..\SegurancaTrabalho\UTipoExame_cl.pas' {DMTipoExame: TDataModule},
  UExame_cl in '..\SegurancaTrabalho\UExame_cl.pas' {DMExame: TDataModule},
  UExameCons in '..\SegurancaTrabalho\UExameCons.pas' {FExameCons},
  UEstadoCivil_cl in '..\Cadastro\UEstadoCivil_cl.pas' {DMEstadoCivil: TDataModule},
  UEstadoCivilCons in '..\Cadastro\UEstadoCivilCons.pas' {FEstadoCivilCons},
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
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UPracaCons in '..\Cadastro\UPracaCons.pas' {FPracaCons},
  UPraca_cl in '..\Cadastro\UPraca_cl.pas' {DMPraca: TDataModule},
  USegurancaParam in '..\SegurancaTrabalho\USegurancaParam.pas' {FSegurancaParam},
  UProdutoSegurancaCons in '..\SegurancaTrabalho\UProdutoSegurancaCons.pas' {FProdutoSegurancaCons},
  UProdutoSeguranca_cl in '..\SegurancaTrabalho\UProdutoSeguranca_cl.pas' {DMProdutoSeguranca: TDataModule},
  UCompraProdutoCad in '..\SegurancaTrabalho\UCompraProdutoCad.pas' {FCompraProdutoCad},
  UCompraProdutoCons in '..\SegurancaTrabalho\UCompraProdutoCons.pas' {FCompraProdutoCons},
  UCompraSeguranca_cl in '..\SegurancaTrabalho\UCompraSeguranca_cl.pas' {DMCompraSeguranca: TDataModule},
  UEstoqueSeguranca_cl in '..\SegurancaTrabalho\UEstoqueSeguranca_cl.pas' {DMEstoqueSeguranca: TDataModule},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  URRomaneioNotas in '..\Agricola\URRomaneioNotas.pas' {FrRomNotaParam},
  URomaneioCons in '..\Agricola\URomaneioCons.pas' {FRomaneioCons},
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  UConhecimentoFrete_cl in '..\Conhecimento\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  UNotaEntradaCons in '..\Compras\UNotaEntradaCons.pas' {FNotaEntradaCons},
  URMovEstoqueSeg in '..\SegurancaTrabalho\URMovEstoqueSeg.pas' {FRMovEstoqueSeg},
  URNotasRelacao in '..\SegurancaTrabalho\URNotasRelacao.pas' {FRNotasRelacao},
  UCaracteristicaProdutoCons in '..\SegurancaTrabalho\UCaracteristicaProdutoCons.pas' {FCaracteristicaProdutoCons},
  UCaracteristicaProduto_cl in '..\SegurancaTrabalho\UCaracteristicaProduto_cl.pas' {DMCaracteristicaProduto: TDataModule},
  URExameFuncionario in '..\SegurancaTrabalho\URExameFuncionario.pas' {FRExameFuncionario},
  URFuncionarioFuncao in '..\SegurancaTrabalho\URFuncionarioFuncao.pas' {FRFuncionarioFuncao},
  URPosicaoCompra in '..\SegurancaTrabalho\URPosicaoCompra.pas' {FRPosicaoCompra},
  UFerramentaCad in 'UFerramentaCad.pas' {FFerramentaCad},
  UFerramenta_cl in 'UFerramenta_cl.pas' {DMFerramenta: TDataModule},
  UPeriodicidade_cl in 'UPeriodicidade_cl.pas' {DMPeriodicidade: TDataModule},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UPeriodicidadeCad in 'UPeriodicidadeCad.pas' {FPeriodicidadeCad},
  UPeriodicidadeCons in 'UPeriodicidadeCons.pas' {FPeriodicidadeCons},
  UTConsulta in '..\TEMPLATE\UTConsulta.pas' {FTConsulta},
  URFerramentasCons in 'URFerramentasCons.pas' {FRFerramentasCons},
  URFerramentas in 'URFerramentas.pas' {FRFerramentas},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URPeriodicidade in 'URPeriodicidade.pas' {FRPeriodicidade},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  UFmFilial in '..\Frames\UFmFilial.pas' {FmFilial: TFrame},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  UContasReceber_cl in '..\ContaReceber\UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  UBloqueto in '..\ContaReceber\UBloqueto.pas',
  URBoletaBB in '..\ContaReceber\URBoletaBB.pas',
  UContasReceberParam in '..\ContaReceber\UContasReceberParam.pas',
  UFmContrato in '..\Frames\UFmContrato.pas' {FmContrato: TFrame},
  UFmFinalidade in '..\Frames\UFmFinalidade.pas' {FmFinalidade: TFrame},
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  UContratoVenda_Cons in '..\Agricola\UContratoVenda_Cons.pas' {FContrato_VendaCons},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  UContasReceberCons in '..\ContaReceber\UContasReceberCons.pas' {FContasReceberCons},
  UNotaSaidaCons in '..\ContaReceber\UNotaSaidaCons.pas' {FNotaSaidaCons},
  UObraContrato_cl in '..\Obra\UObraContrato_cl.pas' {DMObraContrato: TDataModule},
  UObraContrato_Cons in '..\Obra\UObraContrato_Cons.pas' {FObraContrato_Cons},
  UObraCons in '..\Obra\UObraCons.pas' {FObraCons},
  UObra_cl in '..\Obra\UObra_cl.pas' {DMObra: TDataModule},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  URBloqueto_CEF in '..\ContaReceber\URBloqueto_CEF.pas' {FRBloqueto_CEF},
  URBloqueto_HSBC in '..\ContaReceber\URBloqueto_HSBC.pas' {FRBloqueto_HSBC},
  URBloqueto_Rural in '..\ContaReceber\URBloqueto_Rural.pas' {FRBloqueto_Rural},
  URBloqueto_Santander in '..\ContaReceber\URBloqueto_Santander.pas' {FRBloqueto_Santander},
  URBloqueto_Sicredi in '..\ContaReceber\URBloqueto_Sicredi.pas' {FRBloqueto_Sicredi},
  URBloqueto_Sudameris in '..\ContaReceber\URBloqueto_Sudameris.pas' {FRBloqueto_Sudameris},
  URBloqueto_Unibanco in '..\ContaReceber\URBloqueto_Unibanco.pas' {FRBloqueto_Unibanco},
  URBloquetoSafra in '..\ContaReceber\URBloquetoSafra.pas' {FRBloqueto_Safra},
  UFRBloqueto_Itau in '..\ContaReceber\UFRBloqueto_Itau.pas' {FRBloqueto_Itau},
  URBloqueto_Bradesco in '..\ContaReceber\URBloqueto_Bradesco.pas' {FRBloqueto_Bradesco},
  UHistorico_cl in '..\ContaPagar\UHistorico_cl.pas' {DMHistorico: TDataModule},
  UROsManutencaoPeca in 'UROsManutencaoPeca.pas' {FROsManutencaoPeca},
  UScpc_cl in '..\Cadastro\UScpc_cl.pas' {DMScpc: TDataModule},
  UScpcCons in '..\Cadastro\UScpcCons.pas' {FScpcCons},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  UMensagemUsuario_cl in '..\Cadastro\UMensagemUsuario_cl.pas' {DmMensagemUsuario: TDataModule},
  UFmContaCorrente in '..\Frames\UFmContaCorrente.pas' {FmContaCorrente: TFrame},
  UImagemAtalho in '..\Template\UImagemAtalho.pas',
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  UTipoLote_cl in '..\Estoque\UTipoLote_cl.pas' {DMTipoLote: TDataModule},
  UNfe_cl in '..\MonitorNfe\UNfe_cl.pas' {DMNfe: TDataModule},
  UNFeParam in '..\MonitorNfe\UNFeParam.pas' {FNFeParam},
  URadioDialog in '..\Vendas\URadioDialog.pas' {FRadioDialog},
  UTef in '..\Vendas\UTef.pas' {FTEF},
  UTef_cl in '..\Vendas\UTef_cl.pas' {DMTEF: TDataModule},
  UTefInputBox in '..\Vendas\UTefInputBox.pas' {FTefInputBox},
  UTefInputBoxCheque in '..\Vendas\UTefInputBoxCheque.pas' {FTefInputBoxCheque},
  UFmBanco in '..\Frames\UFmBanco.pas' {FMBanco: TFrame},
  UFmObra in '..\Frames\UFmObra.pas' {FmObra: TFrame},
  UFmTitulo in '..\Frames\UFmTitulo.pas' {FmTitulo: TFrame},
  UVendaPerdidaCad in '..\Estoque\UVendaPerdidaCad.pas' {FVendaPerdidaCad},
  UProdutos_UltimasVendas in '..\Estoque\UProdutos_UltimasVendas.pas' {FProdutos_UltimasVendas},
  UProdutos_UltimasCompras in '..\Estoque\UProdutos_UltimasCompras.pas' {FProdutos_UltimasCompras},
  UAliquotasImpressora in '..\Vendas\UAliquotasImpressora.pas' {FAliquotasImpressora},
  UCupomFiscalParam in '..\Vendas\UCupomFiscalParam.pas' {FCupomFiscalParam},
  UImpressoraFiscal in '..\Vendas\UImpressoraFiscal.pas' {FImpressoraFiscal},
  UImpressoraFiscal_cl in '..\Vendas\UImpressoraFiscal_cl.pas' {DMImpressoraFiscal: TDataModule},
  UImpressoraFiscalParam in '..\Vendas\UImpressoraFiscalParam.pas' {FImpressoraFiscalParam},
  UEmbarque_cl in '..\Vendas\UEmbarque_cl.pas' {DMEmbarque: TDataModule},
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  UEnviaEmail in '..\Agricola\UEnviaEmail.pas' {FEnviaEmail},
  UNotaSaida_Cancela in '..\Vendas\UNotaSaida_Cancela.pas' {FNotaSaida_Cancela},
  UFmNfeLote in '..\Frames\UFmNfeLote.pas' {FmNfeLote: TFrame},
  UCteLote_cl in '..\Conhecimento\UCteLote_cl.pas' {DMCteLote: TDataModule},
  UConhecimento_cl in '..\Conhecimento\UConhecimento_cl.pas' {DMConhecimento: TDataModule},
  UMdfeLote_cl in '..\Conhecimento\UMdfeLote_cl.pas' {DMMdfeLote: TDataModule},
  UAguarde in '..\ContaReceber\UAguarde.pas' {FAguarde},
  URBloqueto_Sicoob in '..\ContaReceber\URBloqueto_Sicoob.pas' {FRBloqueto_Sicoob},
  UNfEletronicaLote_cl in '..\Vendas\UNfEletronicaLote_cl.pas' {DMNfEletronicaLote: TDataModule},
  UNotaItensCons in '..\ContaReceber\UNotaItensCons.pas' {FNotaItensCons},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.HelpFile := 'F:\Executaveis\Manual\P_MANUTENCAO.HLP';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMEquipamento, DMEquipamento);
  Application.CreateForm(TDMControleInterno, DMControleInterno);
  Application.CreateForm(TDMAuditoria, DMAuditoria);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMGrupo, DMGrupo);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMTipoEquipamento, DMTipoEquipamento);
  Application.CreateForm(TDMFuncionario, DMFuncionario);
  Application.CreateForm(TDMCategoriaProfissional, DMCategoriaProfissional);
  Application.CreateForm(TDMAtividade, DMAtividade);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMProcedimento, DMProcedimento);
  Application.CreateForm(TDMPrioridade, DMPrioridade);
  Application.CreateForm(TDMTipoServico, DMTipoServico);
  Application.CreateForm(TDMOSManutencao, DMOSManutencao);
  Application.CreateForm(TDMRequisicaoPeca, DMRequisicaoPeca);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMFuncaoFuncionario, DMFuncaoFuncionario);
  Application.CreateForm(TDMExameFuncionario, DMExameFuncionario);
  Application.CreateForm(TDMTipoExame, DMTipoExame);
  Application.CreateForm(TDMExame, DMExame);
  Application.CreateForm(TDMEstadoCivil, DMEstadoCivil);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TDMProdutoSeguranca, DMProdutoSeguranca);
  Application.CreateForm(TDMCompraSeguranca, DMCompraSeguranca);
  Application.CreateForm(TDMEstoqueSeguranca, DMEstoqueSeguranca);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMCaracteristicaProduto, DMCaracteristicaProduto);
  Application.CreateForm(TDMFerramenta, DMFerramenta);
  Application.CreateForm(TDMPeriodicidade, DMPeriodicidade);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TDMObraContrato, DMObraContrato);
  Application.CreateForm(TDMObra, DMObra);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMScpc, DMScpc);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDmMensagemUsuario, DmMensagemUsuario);
  Application.CreateForm(TDMTipoLote, DMTipoLote);
  Application.CreateForm(TDMNfe, DMNfe);
  Application.CreateForm(TFMenuManutencao, FMenuManutencao);
  Application.CreateForm(TDMTEF, DMTEF);
  Application.CreateForm(TDMImpressoraFiscal, DMImpressoraFiscal);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TDMCteLote, DMCteLote);
  Application.CreateForm(TDMConhecimento, DMConhecimento);
  Application.CreateForm(TDMMdfeLote, DMMdfeLote);
  Application.CreateForm(TDMNfEletronicaLote, DMNfEletronicaLote);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.Run;
end.
