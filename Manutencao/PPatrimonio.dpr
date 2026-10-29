program PPatrimonio;

uses
  Forms,
  UTMenuPrincipal in '..\TEMPLATE\UTMENUPRINCIPAL.pas' {FTMenuPrincipal},
  UMenuPatrimonio in 'UMenuPatrimonio.pas' {FMenuPatrimonio},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  ULogin in '..\Seguranca\ULogin.pas' {FLogin},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTrocaSenha in '..\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UParamCadFuncao in '..\Seguranca\UParamCadFuncao.pas' {FParamCadFuncao},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  Upatrimonio_cl in 'Upatrimonio_cl.pas' {DMPatrimonio: TDataModule},
  UPatrimonioCad in 'UPatrimonioCad.pas' {FPatrimonioCad},
  UFilialCons in '..\Cadastro\UFilialCons.pas',
  UpatrimonioCons in 'UpatrimonioCons.pas' {FPatrimonioCons},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UUsuarioCons in '..\Seguranca\UUsuarioCons.pas' {FUsuarioCons},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  URPatrimonio in 'URPatrimonio.pas' {FRPatrimonio},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UPatrimonio_Param in 'UPatrimonio_Param.pas' {FPatrimonio_Param},
  UrPatrimonioFicha in 'UrPatrimonioFicha.pas' {FrPatrimonioFicha},
  UTipoEquipamento_cl in 'UTipoEquipamento_cl.pas' {DMTipoEquipamento: TDataModule},
  UTipoEquipamentoCad in 'UTipoEquipamentoCad.pas' {FTipoEquipamentoCad},
  UTipoEquipamentoCons in 'UTipoEquipamentoCons.pas' {FTipoEquipamentoCons},
  URTipoEquipamento in 'URTipoEquipamento.pas' {FrTipoEquipamento},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UTipoEquipamentoCarac_Cad in 'UTipoEquipamentoCarac_Cad.pas' {FTipoEquipamentoCarac_Cad},
  UTipoEquipamentoCarac_Cons in 'UTipoEquipamentoCarac_Cons.pas' {FTipoEquipamentoCarac_Cons},
  UCategoriaProfissional_cl in 'UCategoriaProfissional_cl.pas' {DMCategoriaProfissional: TDataModule},
  UCategoriaCad in 'UCategoriaCad.pas' {FCategoriaCad},
  UCategoriaCons in 'UCategoriaCons.pas' {FCategoriaCons},
  UrCategoria in 'UrCategoria.pas' {FRCategoria},
  UFuncionario_cl in 'UFuncionario_cl.pas' {DMFuncionario: TDataModule},
  UFuncionarioCad in 'UFuncionarioCad.pas' {FFuncionarioCad},
  UFFuncionarioCons in 'UFFuncionarioCons.pas' {FFuncionarioCons},
  UrFuncionario in 'UrFuncionario.pas' {FRFuncionario},
  UPrioridade_cl in 'UPrioridade_cl.pas' {DMPrioridade: TDataModule},
  UPrioridadeCad in 'UPrioridadeCad.pas' {FPrioridadeCad},
  UPrioridadeCons in 'UPrioridadeCons.pas' {FPrioridadeCons},
  URPrioridade in 'URPrioridade.pas' {FRPrioridade},
  UTipoServico_cl in 'UTipoServico_cl.pas' {DMTipoServico: TDataModule},
  U_TipoServicoCad in 'U_TipoServicoCad.pas' {FTipoServicoCad},
  UTipoServicoCons in 'UTipoServicoCons.pas' {FTipoServicoCons},
  URTipoServico in 'URTipoServico.pas' {FRTipoServico},
  U_AtividadeCad in 'U_AtividadeCad.pas' {FAtividadeCad},
  UAtividade_cl in 'UAtividade_cl.pas' {DMAtividade: TDataModule},
  UAtividadeCons in 'UAtividadeCons.pas' {FAtividadeCons},
  UProcedimentoCad in 'UProcedimentoCad.pas' {FProcedimentoCad},
  UProcedimento_cl in 'UProcedimento_cl.pas' {DMProcedimento: TDataModule},
  UProcedimentoCons in 'UProcedimentoCons.pas' {FProcedimentoCons},
  URAtividade in 'URAtividade.pas' {FRAtividade},
  URProcedimento in 'URProcedimento.pas' {FRProcedimento},
  UPatrimonioItemCons in 'UPatrimonioItemCons.pas' {FPatrimonioItemCons},
  UOSPatrimonio in 'UOSPatrimonio.pas' {FOSPatrimonio},
  UOSPatrimonio_cl in 'UOSPatrimonio_cl.pas' {DMOSPatrimonio: TDataModule},
  UOSPatrimonioCons in 'UOSPatrimonioCons.pas' {FOSPatrimonioCons},
  UROSPatrimonio in 'UROSPatrimonio.pas' {FROSPatrimonio},
  URHistoricoEquipamento in 'URHistoricoEquipamento.pas' {FRHistoricoEquipamento},
  UROSAberto in 'UROSAberto.pas' {FROSAberto},
  UEncerramentoDescAtividade in 'UEncerramentoDescAtividade.pas' {FEncerramentoDescAtividade},
  URFormularioOS in 'URFormularioOS.pas' {FRFormularioOS},
  UOSdoDia in 'UOSdoDia.pas' {FOSdoDia},
  URTipoEquipamentoCarac in 'URTipoEquipamentoCarac.pas' {FRTipoEquipamentoCarac},
  UTCadSimples in '\\SERVIDOR\TRABALHO\DELPHI_NEW\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UApontamentoCad in 'UApontamentoCad.pas' {FApontamentoCad},
  UApontamento_cl in 'UApontamento_cl.pas' {DMApontamento: TDataModule},
  UTConsulta in '\\SERVIDOR\TRABALHO\DELPHI_NEW\TEMPLATE\UTCONSULTA.pas' {FTConsulta},
  UApontamentoCons in 'UApontamentoCons.pas' {FApontamentoCons},
  UTRelSimples in '\\SERVIDOR\TRABALHO\DELPHI_NEW\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URApontamento in 'URApontamento.pas' {FRApontamento};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Patrimônio';
  Application.HelpFile := 'F:\Executaveis\Manual\P_Patrimonio.hlp';
  Application.CreateForm(TFMenuPatrimonio, FMenuPatrimonio);
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMPatrimonio, DMPatrimonio);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMTipoEquipamento, DMTipoEquipamento);
  Application.CreateForm(TDMCategoriaProfissional, DMCategoriaProfissional);
  Application.CreateForm(TDMFuncionario, DMFuncionario);
  Application.CreateForm(TDMPrioridade, DMPrioridade);
  Application.CreateForm(TDMTipoServico, DMTipoServico);
  Application.CreateForm(TDMAtividade, DMAtividade);
  Application.CreateForm(TDMProcedimento, DMProcedimento);
  Application.CreateForm(TDMOSPatrimonio, DMOSPatrimonio);
  Application.CreateForm(TDMApontamento, DMApontamento);
  Application.CreateForm(TFRApontamento, FRApontamento);
  Application.Run;
end.
