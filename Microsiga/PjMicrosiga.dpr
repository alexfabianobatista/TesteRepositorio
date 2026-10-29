program PjMicrosiga;

uses
  Forms,
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTMenuPrincipal in '..\TEMPLATE\UTMENUPRINCIPAL.pas' {FTMenuPrincipal},
  UMenuMicrosiga in 'UMenuMicrosiga.pas' {FMenuMicrosiga},
  ULogin in '..\Seguranca\ULOGIN.pas' {FLogin},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  USplash in '..\Banco\USplash.pas' {FSplash},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UTrocaSenha in '..\Seguranca\UTROCASENHA.pas' {FTrocaSenha},
  UExporta in 'UExporta.pas' {FExporta},
  UImportaMicrosiga in 'UImportaMicrosiga.pas' {FImportaMicrosiga},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  UImporta in 'UImporta.pas' {FImporta},
  UExporta_Cl in 'UExporta_Cl.pas' {DmExporta: TDataModule},
  UImporta_cl in 'UImporta_cl.pas' {DMImporta: TDataModule},
  UComissaoClasse_cl in '..\Estoque\UComissaoClasse_cl.pas' {DMComissaoClasse: TDataModule},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  ULiberarPedido_cl in 'ULiberarPedido_cl.pas' {DMLiberarPedido: TDataModule},
  ULiberaPedido in 'ULiberaPedido.pas' {FLiberaPedido},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas',
  UTConsulta in '..\Template\UTConsulta.pas' {FTConsulta},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UConfirmacaoLiberarComercial in 'UConfirmacaoLiberarComercial.pas' {FConfirmacaoLiberarComercial},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UImportaCadastro in 'UImportaCadastro.pas' {FImportaCadastro},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  ULiberaPedidoParam in 'ULiberaPedidoParam.pas' {FLiberaPedidoParam},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  URPedidosProblemaComercial in 'URPedidosProblemaComercial.pas' {FRPedidosProblemaComercial},
  URPedidosProblemaFinanceiro in 'URPedidosProblemaFinanceiro.pas' {FRPedidosProblemaFinanceiro},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URPedidosProblemaCadastro in 'URPedidosProblemaCadastro.pas' {FRPedidosProblemaCadastro},
  UVerbaRepresentante_cl in '..\Coordenador\UVerbaRepresentante_cl.pas' {DMVerbaRepresentante: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.HelpFile := 'F:\Executaveis\Manual\P_LIVROS FISCAIS.HLP';
  Application.Title := 'Projeto Microsiga';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDmExporta, DmExporta);
  Application.CreateForm(TDMImporta, DMImporta);
  Application.CreateForm(TDMComissaoClasse, DMComissaoClasse);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMLiberarPedido, DMLiberarPedido);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TFMenuMicrosiga, FMenuMicrosiga);
  Application.CreateForm(TFExporta, FExporta);
  Application.CreateForm(TDMVerbaRepresentante, DMVerbaRepresentante);
  Application.CreateForm(TDMOperacao, DMOperacao);
  FSplash.Hide;
  FSplash.Free;
  Application.Run;

end.
