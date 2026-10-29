program PjReport;

uses
  Forms,
  UTMenuPrincipal in '..\TEMPLATE\UTMenuPrincipal.pas' {FTMenuPrincipal},
  UMenuReporter in 'UMenuReporter.pas' {FMenuReporter},
  ULogin in '..\Seguranca\ULogin.pas' {FLogin},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTrocaSenha in '..\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UParamCadFuncao in '..\Seguranca\UParamCadFuncao.pas' {FParamCadFuncao},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  URelatorio_cl in 'URelatorio_cl.pas' {DMRelatorio: TDataModule},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  URelatorio in 'URelatorio.pas' {FRelatorio},
  UReporterWiz in 'UReporterWiz.pas' {FReporterWiz},
  URelatorioFiltro in 'URelatorioFiltro.pas' {FRelatorioFiltro},
  URelatorioVar in 'URelatorioVar.pas' {FRelatorioVar},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URelatorio_Rel in 'URelatorio_Rel.pas' {FRelatorio_Rel},
  UTConsulta in '..\TEMPLATE\UTConsulta.pas' {FTConsulta},
  URelatorioCons in 'URelatorioCons.pas' {FRelatorioCons},
  URExecRel in 'URExecRel.pas' {FRExecRel},
  URelatorio_Sumary in 'URelatorio_Sumary.pas' {FRelatorio_sumary},
  URelatorio_Fonte in 'URelatorio_Fonte.pas' {FRelatorio_Fonte},
  URelatorio_Grupo in 'URelatorio_Grupo.pas' {FRelatorio_Grupo},
  URExecRel_paisagem in 'URExecRel_paisagem.pas' {FRExecRel_paisagem},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TFMenuReporter, FMenuReporter);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TDMRelatorio, DMRelatorio);
  Application.CreateForm(TFRelatorioCons, FRelatorioCons);
  Application.CreateForm(TFRExecRel, FRExecRel);
  Application.CreateForm(TFRelatorio_sumary, FRelatorio_sumary);
  Application.CreateForm(TFRelatorio_Fonte, FRelatorio_Fonte);
  Application.CreateForm(TFRelatorio_Grupo, FRelatorio_Grupo);
  Application.CreateForm(TFRExecRel_paisagem, FRExecRel_paisagem);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.Run;
end.
