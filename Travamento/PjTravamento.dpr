program PjTravamento;

uses
  Forms,
  UConexao in '..\Banco\UConexao.pas' {FConexao},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  ULogin in '..\Seguranca\ULOGIN.pas' {FLogin},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTravamento_cl in 'UTravamento_cl.pas' {DMTravamento: TDataModule},
  UTConsulta in '..\Template\UTConsulta.pas' {FTConsulta},
  UTravamentoCons in 'UTravamentoCons.pas' {FTravamentoCons},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UImagemAtalho in '..\Template\UImagemAtalho.pas',
  UTMenuPrincipal in '..\Template\UTMenuPrincipal.pas' {FTMenuPrincipal},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTravamento, DMTravamento);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TFTravamentoCons, FTravamentoCons);
  Application.Run;
end.
