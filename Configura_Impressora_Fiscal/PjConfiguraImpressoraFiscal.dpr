program PjConfiguraImpressoraFiscal;

uses
  Forms,
  UTMenuPrincipal in '..\Template\UTMenuPrincipal.pas' {FTMenuPrincipal},
  UMenuPrincipal in 'UMenuPrincipal.pas' {FMenuPrincipal},
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UUsuario_cl in '..\seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UTela_cl in '..\seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UCadastraAliquota in 'UCadastraAliquota.pas' {FCadastraAliquota},
  UBiblioteca in '..\MyLib\UBiblioteca.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMenuPrincipal, FMenuPrincipal);
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMTela, DMTela);
  Application.Run;
end.
