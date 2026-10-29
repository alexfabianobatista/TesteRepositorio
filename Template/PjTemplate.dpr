program PjTemplate;

uses
  Forms,
  UTConsulta in 'UTConsulta.pas' {FTConsulta},
  UTRelSimples in 'UTRelSimples.pas' {FTRelSimples},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UTCadSimples in 'UTCADSIMPLES.pas' {FTCadSimples},
  UTMenuPrincipal in 'UTMenuPrincipal.pas' {FTMenuPrincipal},
  UTParametro in 'UTParametro.pas' {FTParametro},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTela_cl '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  ULogin in '..\Seguranca\ULogin.pas' {FLogin},
  UTrocaSenha in '..\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UParamCadFuncao in '..\Seguranca\UParamCadFuncao.pas' {FParamCadFuncao},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  UControleInterno_cl in '..\Seguranca\UControleInterno_cl.pas' {DMControleInterno: TDataModule},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  UMensagemSMS in 'UMensagemSMS.pas' {FMensagemSMS};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TFMonitorSistema, FMonitorSistema);
  Application.CreateForm(TDMControleInterno, DMControleInterno);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TFLogin, FLogin);
  Application.Run;
end.
