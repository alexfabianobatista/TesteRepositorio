program PjEtiquetas;

uses
  Forms,
  UEtiquetas_Cl in 'UEtiquetas_Cl.pas' {DMEtiquetas: TDataModule},
  UProdutoRelatorio_cl in 'UProdutoRelatorio_cl.pas' {DMProdutoRelatorio: TDataModule},
  UOracle_cl in '..\banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UUsuario_cl in '..\seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UMenuEtiquetas in 'UMenuEtiquetas.pas' {FMenuEtiquetas},
  UEmissaoEtiquetas2 in 'UEmissaoEtiquetas2.pas' {FEmissaoEtiquetas2},
  UEmissaoEtiquetasOsare in 'UEmissaoEtiquetasOsare.pas' {FEmissaoEtiquetasOsare},
  UTMenuPrincipal in '..\Template\UTMenuPrincipal.pas' {FTMenuPrincipal},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UEtiquetaCodCartao in 'UEtiquetaCodCartao.pas' {FEtiquetaCodCartao},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UTela_cl in '..\seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UEmissaoEtiquetaStara in 'UEmissaoEtiquetaStara.pas' {FEmissaoEtiquetaStara},
  UFEtiqueta3X6Neusa in 'UFEtiqueta3X6Neusa.pas' {FEtiqueta3X6Neusa};

{$R *.res}

begin                  
  Application.Initialize;
  Application.CreateForm(TDMEtiquetas, DMEtiquetas);
  Application.CreateForm(TDMProdutoRelatorio, DMProdutoRelatorio);
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TFMenuEtiquetas, FMenuEtiquetas);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMTela, DMTela);
  Application.Run;
end.
