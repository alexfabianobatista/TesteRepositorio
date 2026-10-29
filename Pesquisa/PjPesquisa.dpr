program PjPesquisa;

uses
  Forms,
  UTMenuPrincipal in '\\SERVIDOR\TRABALHO\DELPHI_NEW\TEMPLATE\UTMENUPRINCIPAL.pas' {FTMenuPrincipal},
  UMenuPesquisa in 'UMenuPesquisa.pas' {FMenuPesquisa},
  UPesquisa_cl in 'UPesquisa_cl.pas' {DMPesquisa: TDataModule},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UParamSistema_cl in '\\Servidor\trabalho\Delphi_New\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UTCadSimples in '\\SERVIDOR\TRABALHO\DELPHI_NEW\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UPesquisaCad in '\\Servidor\trabalho\Delphi_New\Pesquisa\UPesquisaCad.pas' {FPesquisaCad},
  UTela_cl in '\\Servidor\trabalho\Delphi_New\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  USplash in '\\Servidor\trabalho\Delphi_New\Banco\USplash.pas' {FSplash},
  UUsuario_cl in '..\seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UTConsulta in '\\SERVIDOR\TRABALHO\DELPHI_NEW\TEMPLATE\UTCONSULTA.pas' {FTConsulta},
  UCadastroCons in '\\Servidor\trabalho\Delphi_New\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UCadastro_cl in '\\Servidor\trabalho\Delphi_New\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UClassCadastro_cl in '\\Servidor\trabalho\Delphi_New\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UTipoCadastro_cl in '\\Servidor\trabalho\Delphi_New\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '\\Servidor\trabalho\Delphi_New\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UCidadeCons in '\\Servidor\trabalho\Delphi_New\Cadastro\UCidadeCons.pas' {FCidadeCons},
  UCidade_cl in '\\Servidor\trabalho\Delphi_New\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UCidadeCad in '\\Servidor\trabalho\Delphi_New\Cadastro\UCidadeCad.pas' {FCidadeCad},
  UEstadoCons in '\\Servidor\trabalho\Delphi_New\Cadastro\UEstadoCons.pas' {FEstadoCons},
  UEstado_cl in '\\Servidor\trabalho\Delphi_New\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  URCidade_Cidade in '\\Servidor\trabalho\Delphi_New\Cadastro\URCidade_Cidade.pas',
  URPesquisa in '\\Servidor\trabalho\Delphi_New\Pesquisa\URPesquisa.pas' {FRPesquisaAtivos},
  UTParametro in '\\SERVIDOR\TRABALHO\DELPHI_NEW\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UPesquisaParam in '\\Servidor\trabalho\Delphi_New\Pesquisa\UPesquisaParam.pas' {FPesquisaParam},
  UCadastroParam in '\\Servidor\trabalho\Delphi_New\Cadastro\UCadastroParam.pas' {FCadastroParam},
  URegiaoCons in '\\Servidor\trabalho\Delphi_New\Cadastro\URegiaoCons.pas' {FRegiaoCons},
  URegiao_cl in '\\Servidor\trabalho\Delphi_New\Cadastro\URegiao_cl.pas' {DMRegiao: TDataModule},
  URamoCons in '\\Servidor\trabalho\Delphi_New\Cadastro\URamoCons.pas' {FRamoCons},
  URamo_cl in '\\Servidor\trabalho\Delphi_New\Cadastro\URamo_cl.pas' {DMRamo: TDataModule},
  UMotivoCons in '\\Servidor\trabalho\Delphi_New\Cadastro\UMotivoCons.pas' {FMotivoCons},
  UMotivo_cl in '\\Servidor\trabalho\Delphi_New\Cadastro\UMotivo_cl.pas' {DMMotivo: TDataModule},
  UClassCadastroCons in '\\Servidor\trabalho\Delphi_New\Cadastro\UClassCadastroCons.pas' {FClassCadastroCons},
  UVendedorCons in '\\Servidor\trabalho\Delphi_New\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UVendedor_cl in '\\Servidor\trabalho\Delphi_New\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UFilialCons in '\\Servidor\trabalho\Delphi_New\Cadastro\UFilialCons.pas' {FFilialCons},
  UFilial_cl in '\\Servidor\trabalho\Delphi_New\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UPracaCons in '\\Servidor\trabalho\Delphi_New\Cadastro\UPracaCons.pas' {FPracaCons},
  UPraca_cl in '\\Servidor\trabalho\Delphi_New\Cadastro\UPraca_cl.pas' {DMPraca: TDataModule},
  UPesquisaCons in 'UPesquisaCons.pas' {FPesquisaCons},
  UTRelSimples in '\\SERVIDOR\TRABALHO\DELPHI_NEW\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URPesquisaInativo in 'URPesquisaInativo.pas' {FRPesquisaInativo};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TFMenuPesquisa, FMenuPesquisa);
  Application.CreateForm(TDMPesquisa, DMPesquisa);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TFRPesquisaInativo, FRPesquisaInativo);
  Application.Run;
end.
