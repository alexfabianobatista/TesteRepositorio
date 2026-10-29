program PJSemente;

uses
  Forms,
  UMonitorApl in '..\Banco\UMonitorApl.pas' {FMonitorApl},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  USplash in '..\Banco\USplash.pas' {FSplash},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  ULogin in '..\Seguranca\ULogin.pas' {FLogin},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  UEstadoCons in '..\Cadastro\UEstadoCons.pas',
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UBancoCCorrenteParam in '..\ContaPagar\UBancoCCorrenteParam.pas',
  URBancoCCorrente in '..\ContaPagar\URBancoCCorrente.pas',
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  UBancoscad in '..\ContaPagar\UBancoscad.pas',
  UTMenuPrincipal in '..\TEMPLATE\UTMENUPRINCIPAL.pas' {FTMenuPrincipal},
  UMenuSemente in 'UMenuSemente.pas' {FMenuSemente},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UClassePlantioCad in 'UClassePlantioCad.pas' {FClassePlantioCad},
  UClassePlantio_cl in 'UClassePlantio_cl.pas' {DMClassePlantio: TDataModule},
  UPlantioSafraCad in 'UPlantioSafraCad.pas' {FPlantioSafraCad},
  UPlantioSafra_cl in 'UPlantioSafra_cl.pas' {DMPlantioSafra: TDataModule},
  UCulturaCons in '..\Agricola\UCulturaCons.pas' {FCulturaCons},
  UCultura_cl in '..\Agricola\UCultura_cl.pas' {DMCultura: TDataModule},
  UClassePlantioCons in 'UClassePlantioCons.pas' {FClassePlantioCons},
  UPlantioSafraCons in 'UPlantioSafraCons.pas' {FPlantioSafraCons},
  UCampoPlantioCad in 'UCampoPlantioCad.pas' {FCampoPlantioCad},
  UCampoPlantio_cl in 'UCampoPlantio_cl.pas' {DMCampoPlantio: TDataModule},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UNotaSaidaCons in '..\Vendas\UNotaSaidaCons.pas' {FNotaSaidaCons},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  URRomaneioNotas in '..\Agricola\URRomaneioNotas.pas' {FrRomNotaParam},
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  USementeParam in 'USementeParam.pas' {FSementeParam},
  URClassePlantio in 'URClassePlantio.pas' {FRClassePlantio},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  URPlantioSafra in 'URPlantioSafra.pas' {FRPlantioSafra},
  URRelacaoCampos in 'URRelacaoCampos.pas' {FRRelacaoCampos},
  UCampoPlantioCons in 'UCampoPlantioCons.pas' {FCampoPlantioCons},
  UEstimativaMetaCad in 'UEstimativaMetaCad.pas' {FEstimativaMetaCad},
  UEstimativaMeta_cl in 'UEstimativaMeta_cl.pas' {DMEstimativaMeta: TDataModule},
  URDadosGerais in 'URDadosGerais.pas' {FRDadosGerais},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  UAreaCultivar_cl in 'UAreaCultivar_cl.pas' {DMAreaCultivar: TDataModule},
  UAreaCultivarCad in 'UAreaCultivarCad.pas' {FAreaCultivarCad},
  UAreaCultivarCons in 'UAreaCultivarCons.pas' {FAreaCultivarCons},
  ULaudo_cl in 'ULaudo_cl.pas' {DMLaudo: TDataModule},
  ULaudoFloracaoCad in 'ULaudoFloracaoCad.pas' {FLaudoFloracaoCad},
  UPraga_cl in '..\Agricola\UPraga_cl.pas' {DMPraga: TDataModule},
  UPragaCons in '..\Agricola\UPragaCons.pas' {FPragaCons},
  ULaudoFloracaoCons in 'ULaudoFloracaoCons.pas' {FLaudoFloracaoCons},
  ULaudoFloracaoItemCons in 'ULaudoFloracaoItemCons.pas' {FLaudoFloracaoItemCons},
  ULaudoPreColheitaCad in 'ULaudoPreColheitaCad.pas' {FLaudoPreColheitaCad},
  ULaudoPreColheitaCons in 'ULaudoPreColheitaCons.pas' {FLaudoPreColheitaCons},
  URLaudoFloracao in 'URLaudoFloracao.pas' {FRLaudoFloracao},
  URLaudoPreColheita in 'URLaudoPreColheita.pas' {FRLaudoPreColheita},
  UPrevisaoLaudo_cl in 'UPrevisaoLaudo_cl.pas' {DMPrevisaoLaudo: TDataModule},
  UPrevisaoLaudoCad in 'UPrevisaoLaudoCad.pas' {FPrevisaoLaudoCad},
  UPrevisaoLaudoCons in 'UPrevisaoLaudoCons.pas' {FPrevisaoLaudoCons},
  URPrevisaoLaudo in 'URPrevisaoLaudo.pas' {FRPrevisaoLaudo},
  UDoenca_cl in 'UDoenca_cl.pas' {DMDoenca: TDataModule},
  UDoencaCad in 'UDoencaCad.pas' {FDoencaCad},
  UDoencaCons in 'UDoencaCons.pas' {FDoencaCons},
  URDoenca in 'URDoenca.pas' {FRDoenca},
  UProducaoSemente_cl in 'UProducaoSemente_cl.pas' {DMProducaoSemente: TDataModule},
  UProducaoSementeCad in 'UProducaoSementeCad.pas' {FProducaoSementeCad},
  URProducaoSemente in 'URProducaoSemente.pas' {FRProducaoSemente},
  URPrevisaoPreColheita in 'URPrevisaoPreColheita.pas' {FRPrevisaoLaudoPreColheita},
  URProducaoBrutaSementes in 'URProducaoBrutaSementes.pas' {FRProducaoBrutaSementes},
  UHistoricoCons in '..\ContaPagar\UHistoricoCons.pas' {FHistoricoCons},
  UHistorico_cl in '..\ContaPagar\UHistorico_cl.pas' {DMHistorico: TDataModule},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  ULoteSementeCad in 'ULoteSementeCad.pas' {FLoteSementeCad},
  ULoteSementeCons in 'ULoteSementeCons.pas' {FLoteSementeCons},
  URIdentificacaoAmostras in 'URIdentificacaoAmostras.pas' {FRIdentificacaoAmostras},
  URAtestadoSemente in 'URAtestadoSemente.pas' {FRAtestadoSemente},
  UAtestado_cl in 'UAtestado_cl.pas' {DMAtestado: TDataModule},
  UAtestadoCad in 'UAtestadoCad.pas' {FAtestadoCad},
  UFFuncionarioCons in '..\Patrimonio\UFFuncionarioCons.pas' {FFuncionarioCons},
  UAtestadoCons in 'UAtestadoCons.pas' {FAtestadoCons},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  UFuncionarioCad in '..\Manutencao\UFuncionarioCad.pas' {FFuncionarioCad},
  UCategoriaCons in '..\Manutencao\UCategoriaCons.pas' {FCategoriaCons},
  UCategoriaProfissional_cl in '..\Manutencao\UCategoriaProfissional_cl.pas' {DMCategoriaProfissional: TDataModule},
  UrFuncionario in '..\Manutencao\UrFuncionario.pas' {FRFuncionario},
  UCidadeCons in '..\Cadastro\UCidadeCons.pas' {FCidadeCons},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UExameFuncionario_cl in '..\SegurancaTrabalho\UExameFuncionario_cl.pas' {DMExameFuncionario: TDataModule},
  UExameFuncionarioCad in '..\SegurancaTrabalho\UExameFuncionarioCad.pas' {FExameFuncionarioCad},
  UTipoExameCons in '..\SegurancaTrabalho\UTipoExameCons.pas' {FTipoExameCons},
  UTipoExame_cl in '..\SegurancaTrabalho\UTipoExame_cl.pas' {DMTipoExame: TDataModule},
  UExame_cl in '..\SegurancaTrabalho\UExame_cl.pas' {DMExame: TDataModule},
  UExameCons in '..\SegurancaTrabalho\UExameCons.pas' {FExameCons},
  UFuncaoFuncionario_cl in '..\SegurancaTrabalho\UFuncaoFuncionario_cl.pas' {DMFuncaoFuncionario: TDataModule},
  UFuncaoFuncionarioCons in '..\SegurancaTrabalho\UFuncaoFuncionarioCons.pas' {FFuncaoFuncionarioCons},
  UEstadoCivil_cl in '..\Cadastro\UEstadoCivil_cl.pas' {DMEstadoCivil: TDataModule},
  UEstadoCivilCons in '..\Cadastro\UEstadoCivilCons.pas' {FEstadoCivilCons},
  UFuncionario_cl in '..\Manutencao\UFuncionario_cl.pas' {DMFuncionario: TDataModule},
  URomaneioCons in '..\Agricola\URomaneioCons.pas' {FRomaneioCons},
  UConhecimentoFrete_cl in '..\Conhecimento\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  UCidadeCad in '..\Cadastro\UCidadeCad.pas' {FCidadeCad},
  URCidade_Cidade in '..\Cadastro\URCidade_Cidade.pas' {FRCidade_Cidade},
  UCadastroParam in '..\Cadastro\UCadastroParam.pas' {FCadastroParam},
  URegiaoCons in '..\Cadastro\URegiaoCons.pas' {FRegiaoCons},
  URegiao_cl in '..\Cadastro\URegiao_cl.pas' {DMRegiao: TDataModule},
  URamoCons in '..\Cadastro\URamoCons.pas' {FRamoCons},
  URamo_cl in '..\Cadastro\URamo_cl.pas' {DMRamo: TDataModule},
  UMotivo_cl in '..\Cadastro\UMotivo_cl.pas' {DMMotivo: TDataModule},
  UMotivoCons in '..\Cadastro\UMotivoCons.pas' {FMotivoCons},
  UClassCadastroCons in '..\Cadastro\UClassCadastroCons.pas' {FClassCadastroCons},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UPracaCons in '..\Cadastro\UPracaCons.pas' {FPracaCons},
  UPraca_cl in '..\Cadastro\UPraca_cl.pas' {DMPraca: TDataModule},
  USegurancaParam in '..\SegurancaTrabalho\USegurancaParam.pas' {FSegurancaParam},
  UProdutoSegurancaCons in '..\SegurancaTrabalho\UProdutoSegurancaCons.pas' {FProdutoSegurancaCons},
  UProdutoSeguranca_cl in '..\SegurancaTrabalho\UProdutoSeguranca_cl.pas' {DMProdutoSeguranca: TDataModule},
  UCompraProdutoCad in '..\SegurancaTrabalho\UCompraProdutoCad.pas' {FCompraProdutoCad},
  UCompraSeguranca_cl in '..\SegurancaTrabalho\UCompraSeguranca_cl.pas' {DMCompraSeguranca: TDataModule},
  UCompraProdutoCons in '..\SegurancaTrabalho\UCompraProdutoCons.pas' {FCompraProdutoCons},
  UEstoqueSeguranca_cl in '..\SegurancaTrabalho\UEstoqueSeguranca_cl.pas' {DMEstoqueSeguranca: TDataModule},
  UNotaEntradaCons in '..\Compras\UNotaEntradaCons.pas' {FNotaEntradaCons},
  URMovEstoqueSeg in '..\SegurancaTrabalho\URMovEstoqueSeg.pas' {FRMovEstoqueSeg},
  URNotasRelacao in '..\SegurancaTrabalho\URNotasRelacao.pas' {FRNotasRelacao},
  UCaracteristicaProdutoCons in '..\SegurancaTrabalho\UCaracteristicaProdutoCons.pas' {FCaracteristicaProdutoCons},
  UCaracteristicaProduto_cl in '..\SegurancaTrabalho\UCaracteristicaProduto_cl.pas' {DMCaracteristicaProduto: TDataModule},
  URExameFuncionario in '..\SegurancaTrabalho\URExameFuncionario.pas' {FRExameFuncionario},
  URFuncionarioFuncao in '..\SegurancaTrabalho\URFuncionarioFuncao.pas' {FRFuncionarioFuncao},
  URPosicaoCompra in '..\SegurancaTrabalho\URPosicaoCompra.pas' {FRPosicaoCompra},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons},
  UBancoAgenciaRel_cl in '..\Bancos\UBancoAgenciaRel_cl.pas' {DMBancoAgenciaRel: TDataModule},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  URAtestadoMoinho in 'URAtestadoMoinho.pas' {FRAtestadoMoinho},
  UrRelacaoCampos_Anexo in 'UrRelacaoCampos_Anexo.pas' {FrRelacaoCampos_Anexo},
  URRelacaoCamposLocalizacao in 'URRelacaoCamposLocalizacao.pas' {FRRelacaoCamposLocalizacao},
  UEstimativaProduto_cl in 'UEstimativaProduto_cl.pas' {DMEstimativaProduto: TDataModule},
  UEstimativaProduto_Cad in 'UEstimativaProduto_Cad.pas' {FEstimativaProduto_Cad},
  UEstimativaProduto_Cons in 'UEstimativaProduto_Cons.pas' {FEstimativaProduto_Cons},
  UTCadSimples in '\\SERVIDOR\TRABALHO\DELPHI_NEW\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  ULaudoVistoriaCad in 'ULaudoVistoriaCad.pas' {FLaudoVistoriaCad},
  UTRelSimples in '\\SERVIDOR\TRABALHO\DELPHI_NEW\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URLaudoVistoria in 'URLaudoVistoria.pas' {FRLaudoVistoria},
  UTConsulta in '\\SERVIDOR\TRABALHO\DELPHI_NEW\TEMPLATE\UTCONSULTA.pas' {FTConsulta},
  ULaudoVistoriaCons in 'ULaudoVistoriaCons.pas' {FLaudoVistoriaCons},
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
  URBloquetoTotal in '..\ContaReceber\URBloquetoTotal.pas' {FRBloquetoTotal},
  UnitBoleta in '..\MyLib\UNITBOLETA.pas' {Boleta},
  UFRBloqueto_Itau in '..\ContaReceber\UFRBloqueto_Itau.pas' {FRBloqueto_Itau},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.HelpFile := 'F:\Executaveis\Manual\P_SEMENTES.HLP';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMClassePlantio, DMClassePlantio);
  Application.CreateForm(TDMPlantioSafra, DMPlantioSafra);
  Application.CreateForm(TDMCultura, DMCultura);
  Application.CreateForm(TDMCampoPlantio, DMCampoPlantio);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMEstimativaMeta, DMEstimativaMeta);
  Application.CreateForm(TDMAreaCultivar, DMAreaCultivar);
  Application.CreateForm(TDMLaudo, DMLaudo);
  Application.CreateForm(TDMPraga, DMPraga);
  Application.CreateForm(TDMPrevisaoLaudo, DMPrevisaoLaudo);
  Application.CreateForm(TDMDoenca, DMDoenca);
  Application.CreateForm(TDMProducaoSemente, DMProducaoSemente);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMAtestado, DMAtestado);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMCategoriaProfissional, DMCategoriaProfissional);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMExameFuncionario, DMExameFuncionario);
  Application.CreateForm(TDMTipoExame, DMTipoExame);
  Application.CreateForm(TDMExame, DMExame);
  Application.CreateForm(TDMFuncaoFuncionario, DMFuncaoFuncionario);
  Application.CreateForm(TDMEstadoCivil, DMEstadoCivil);
  Application.CreateForm(TDMFuncionario, DMFuncionario);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TDMProdutoSeguranca, DMProdutoSeguranca);
  Application.CreateForm(TDMCompraSeguranca, DMCompraSeguranca);
  Application.CreateForm(TDMEstoqueSeguranca, DMEstoqueSeguranca);
  Application.CreateForm(TDMCaracteristicaProduto, DMCaracteristicaProduto);
  Application.CreateForm(TDMBancoAgenciaRel, DMBancoAgenciaRel);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDMEstimativaProduto, DMEstimativaProduto);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TFMenuSemente, FMenuSemente);
  FSplash.hide;
  FSplash.free;
  Application.Run;
end.
