program PjFutura;

uses
  Forms,
  UTMenuPrincipal in '..\TEMPLATE\UTMENUPRINCIPAL.pas' {FTMenuPrincipal},
  UMenuFutura in 'UMenuFutura.pas' {FMenuFutura},
  ULogin in 'ULogin.pas' {FLogin},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  USplash in '..\Banco\USplash.pas' {FSplash},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UExporta_Futura in 'UExporta_Futura.pas' {FExporta_Futura},
  UExportaFutura_cl in 'UExportaFutura_cl.pas' {DMExportaFutura: TDataModule},
  UImportaFutura_cl in 'UImportaFutura_cl.pas' {DMimportaFutura: TDataModule},
  UImporta_Futura in 'UImporta_Futura.pas' {FImporta_Futura},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UTrocaSenha in '..\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UParamCadFuncao in '..\Seguranca\UParamCadFuncao.pas' {FParamCadFuncao},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  UTConsulta in '..\TEMPLATE\UTCONSULTA.pas' {FTConsulta},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  ULiberaPedidos in 'ULiberaPedidos.pas' {FLiberaPedidos},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  ULiberaPedidos_cl in 'ULiberaPedidos_cl.pas' {DMLiberaPedidos: TDataModule},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  UrPedidosVendedorCidade in 'UrPedidosVendedorCidade.pas' {FrPedidosVendedorCidade},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  ULiberaPedidosParam in 'ULiberaPedidosParam.pas' {FLiberaPedidosParam},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UCidadeCons in '..\Cadastro\UCidadeCons.pas' {FCidadeCons},
  UCidadeCad in '..\Cadastro\UCidadeCad.pas' {FCidadeCad},
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  UEstadoCons in '..\Cadastro\UEstadoCons.pas' {FEstadoCons},
  URCidade_Cidade in '..\Cadastro\URCidade_Cidade.pas' {FRCidade_Cidade},
  UCadastroParam in '..\Cadastro\UCadastroParam.pas' {FCadastroParam},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  URegiao_cl in '..\Cadastro\URegiao_cl.pas' {DMRegiao: TDataModule},
  URamoCons in '..\Cadastro\URamoCons.pas' {FRamoCons},
  URegiaoCons in '..\Cadastro\URegiaoCons.pas' {FRegiaoCons},
  URamo_cl in '..\Cadastro\URamo_cl.pas' {DMRamo: TDataModule},
  UMotivo_cl in '..\Cadastro\UMotivo_cl.pas' {DMMotivo: TDataModule},
  UMotivoCons in '..\Cadastro\UMotivoCons.pas' {FMotivoCons},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UClassCadastroCons in '..\Cadastro\UClassCadastroCons.pas' {FClassCadastroCons},
  UPraca_cl in '..\Cadastro\UPraca_cl.pas' {DMPraca: TDataModule},
  UPracaCons in '..\Cadastro\UPracaCons.pas' {FPracaCons},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  URPedidosProblemaPreco in 'URPedidosProblemaPreco.pas' {FRPedidosProblemaPreco};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.Title := 'Sistema Futura';
  Application.HelpFile := 'F:\Executaveis\Manual\P_CONTAS RECEBER.HLP';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMExportaFutura, DMExportaFutura);
  Application.CreateForm(TDMimportaFutura, DMimportaFutura);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMLiberaPedidos, DMLiberaPedidos);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TFMenuFutura, FMenuFutura);
  FSplash.Hide;
  FSplash.Free;
  Application.Run;
end.
