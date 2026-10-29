program PjAssitenciaTecnica;

uses
  Forms,
  UTMenuPrincipal in '\\NT\TRABALHO\DELPHI\TEMPLATE\UTMENUPRINCIPAL.pas' {FTMenuPrincipal},
  UMenuAssitencia in 'UMenuAssitencia.pas' {FMenuAssistencia},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  ULogin in '..\Seguranca\ULogin.pas' {FLogin},
  UTrocaSenha in '..\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UParamCadFuncao in '..\Seguranca\UParamCadFuncao.pas' {FParamCadFuncao},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  UOrdemServico_cl in 'UOrdemServico_cl.pas' {DMOrdemServico: TDataModule},
  UTCadSimples in '\\NT\TRABALHO\DELPHI\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UOrdemServicoCad in 'UOrdemServicoCad.pas' {FOrdemServicoCad},
  UTConsulta in '\\NT\TRABALHO\DELPHI\TEMPLATE\UTCONSULTA.pas' {FTConsulta},
  UOrdemServicoCons in 'UOrdemServicoCons.pas' {FOrdemServicoCons},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UOrdemServicoFecha in 'UOrdemServicoFecha.pas' {FOrdemServicoFecha},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  UContasReceber_cl in '..\ContaReceber\UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  UCaixa_cl in '..\ContaPagar\UCaixa_cl.pas' {DMCaixa: TDataModule},
  UROrdemServico_Saida in 'UROrdemServico_Saida.pas' {FROrdemServico_Saida},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UTParametro in '\\NT\TRABALHO\DELPHI\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UOrdemServicoParam in 'UOrdemServicoParam.pas' {FOrdemServicoParam},
  UROrdemServico_Entrada in 'UROrdemServico_Entrada.pas' {FROrdemServico_Entrada},
  UTRelSimples in '\\NT\TRABALHO\DELPHI\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  UROrdemServico_Media in 'UROrdemServico_Media.pas' {FROrdemServico_Media},
  UROrdemServico_Sintetico in 'UROrdemServico_Sintetico.pas' {FROrdemServico_Sintetico},
  UROrdemServico_Analitico in 'UROrdemServico_Analitico.pas' {FROrdemServico_Analitico},
  URRecibo in 'URRecibo.pas' {FRRecibo},
  UROrdemServico_Aberto in 'UROrdemServico_Aberto.pas' {FROrdemServico_Aberto},
  UReciboParam in 'UReciboParam.pas' {FReciboParam},
  USplash in '..\Banco\USplash.pas' {FSplash},
  URelPreview in '..\Template\URelPreview.pas' {FRelPreview},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UEstoqueCons in '..\Estoque\UEstoqueCons.pas' {FEstoqueCons},
  UContasReceberParam in '..\ContaReceber\UContasReceberParam.pas' {FContasReceberParam},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  URegiaoCons in '..\Cadastro\URegiaoCons.pas' {FRegiaoCons},
  URegiao_cl in '..\Cadastro\URegiao_cl.pas' {DMRegiao: TDataModule},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UNotaSaidaCons in '..\Vendas\UNotaSaidaCons.pas' {FNotaSaidaCons},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UContasReceberCons in '..\ContaReceber\UContasReceberCons.pas' {FContasReceberCons},
  UBloqueto in '..\ContaReceber\UBloqueto.pas';

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TFMenuAssistencia, FMenuAssistencia);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMOrdemServico, DMOrdemServico);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMCaixa, DMCaixa);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TFContasReceberParam, FContasReceberParam);
  Application.CreateForm(TFBancosCons, FBancosCons);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TFRegiaoCons, FRegiaoCons);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TFNotaSaidaCons, FNotaSaidaCons);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TFContasReceberCons, FContasReceberCons);
  FSplash.Hide;
  FSplash.Free;
  Application.Run;
end.
