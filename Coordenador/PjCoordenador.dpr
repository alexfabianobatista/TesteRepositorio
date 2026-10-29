program PjCoordenador;

uses
  Forms,
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UUsuarioCons in '..\Seguranca\UUsuarioCons.pas',
  UTConsulta in '..\Template\UTConsulta.pas' {FTConsulta},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UTParametro in '..\Template\UTPARAMETRO.pas' {FTParametro},
  UTRelSimples in '..\Template\UTRELSIMPLES.pas' {FTRelSimples},
  UTMenuPrincipal in '..\Template\UTMenuPrincipal.pas' {FTMenuPrincipal},
  UMenu in 'UMenu.pas' {FMenu},
  UGrupoProduto_cl in 'UGrupoProduto_cl.pas' {DMGrupoProduto: TDataModule},
  UGrupoProduto_Cad in 'UGrupoProduto_Cad.pas' {FGrupoProduto_Cad},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UGrupoProduto_Cons in 'UGrupoProduto_Cons.pas' {FGrupoProduto_Cons},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  UPrecoPocket1_cl in 'UPrecoPocket1_cl.pas' {DMPrecoPocket1: TDataModule},
  UPrecoPocket1_Cad in 'UPrecoPocket1_Cad.pas' {FPrecoPocket1_Cad},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UPrecoPocket1_Cons in 'UPrecoPocket1_Cons.pas' {FPrecoPocket1_Cons},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UGrupoProduto_Param in 'UGrupoProduto_Param.pas' {FGrupoProduto_Param},
  UrPremioMetas in 'UrPremioMetas.pas' {FrPremioMetas},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UVerbaRepresentante_cl in 'UVerbaRepresentante_cl.pas' {DMVerbaRepresentante: TDataModule},
  UVerbaVendedor in 'UVerbaVendedor.pas' {FVerbaVendedor},
  UVerbaRepresentante in 'UVerbaRepresentante.pas' {FVerbaRepresentante},
  UVerbaRepresentanteParam in 'UVerbaRepresentanteParam.pas' {FVerbaRepresentanteParam},
  URVerbaRepresentante in 'URVerbaRepresentante.pas' {FRVerbaRepresentante},
  URGrupoProduto in 'URGrupoProduto.pas' {FRGrupoProduto},
  UrTabelaPocket in 'UrTabelaPocket.pas' {FrTabelaPocket},
  URVerbaVendedor in 'URVerbaVendedor.pas' {FRVerbaVendedor},
  UrPremioCoordenador in 'UrPremioCoordenador.pas' {FrPremioCoordenador},
  UVerbaRepresentanteCons in 'UVerbaRepresentanteCons.pas' {FVerbaRepresentanteCons},
  UVerbaVendedorCons in 'UVerbaVendedorCons.pas' {FVerbaVendedorCons},
  UrPremioNotas in 'UrPremioNotas.pas' {FrPremioNotas},
  UAtualizaListaPreco in 'UAtualizaListaPreco.pas' {FAtualizaListapreco},
  UPrecoPocketPai_Cons in 'UPrecoPocketPai_Cons.pas' {FPrecoPocketPai_Cons},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  UGrupoProduto_Imp in 'UGrupoProduto_Imp.pas' {FGrupoProduto_Imp};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMGrupoProduto, DMGrupoProduto);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TDMPrecoPocket1, DMPrecoPocket1);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TFMenu, FMenu);
  Application.CreateForm(TDMVerbaRepresentante, DMVerbaRepresentante);
  Application.CreateForm(TFVerbaVendedor, FVerbaVendedor);
  Application.CreateForm(TFVerbaRepresentante, FVerbaRepresentante);
  Application.CreateForm(TFVerbaRepresentanteParam, FVerbaRepresentanteParam);
  Application.CreateForm(TFRVerbaRepresentante, FRVerbaRepresentante);
  Application.CreateForm(TFRGrupoProduto, FRGrupoProduto);
  Application.CreateForm(TFrTabelaPocket, FrTabelaPocket);
  Application.CreateForm(TFRVerbaVendedor, FRVerbaVendedor);
  Application.CreateForm(TFrPremioCoordenador, FrPremioCoordenador);
  Application.CreateForm(TFVerbaRepresentanteCons, FVerbaRepresentanteCons);
  Application.CreateForm(TFVerbaVendedorCons, FVerbaVendedorCons);
  Application.CreateForm(TFrPremioNotas, FrPremioNotas);
  Application.Run;
end.
