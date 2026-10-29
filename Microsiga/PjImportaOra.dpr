program PjImportaOra;

uses
  Forms,
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UUsuario_cl in '..\seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UImporta_cl in 'UImporta_cl.pas' {DMImporta: TDataModule},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UComissaoClasse_cl in '..\Estoque\UComissaoClasse_cl.pas' {DMComissaoClasse: TDataModule},
  UVerbaRepresentante_cl in '..\Coordenador\UVerbaRepresentante_cl.pas' {DMVerbaRepresentante: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMVerbaRepresentante, DMVerbaRepresentante);
  DMOracle.DBCemapa.Connected     := false;
  DMOracle.DBCemapa.LogonDatabase := 'ORA';
  DMOracle.DBCemapa.Connected     := true;
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  DMParamSistema.QParamSistema.Active := true;
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMImporta, DMImporta);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMComissaoClasse, DMComissaoClasse);
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
