program PjRecebeBloqueto;

uses
  Forms,
  URecebeBloqueto in 'URecebeBloqueto.pas' {FRecebeBloqueto},
  USplash in '..\Banco\USplash.pas' {FSplash},
  URecebeBloqueto_cl in 'URecebeBloqueto_cl.pas' {DMRecebeBloqueto: TDataModule},
  UAcesso_cl in 'UAcesso_cl.pas' {DMAcesso: TDataModule},
  URotinas in 'URotinas.pas',
  UTConsulta in '\\SERVIDOR\TRABALHO\DELPHI_NEW\TEMPLATE\UTCONSULTA.pas' {FTConsulta},
  URecebeBloquetoCons in 'URecebeBloquetoCons.pas' {FRecebeBloquetoCons},
  URRecebeBloqueto in 'URRecebeBloqueto.pas' {FRRecebeBloqueto},
  UTParametro in '\\SERVIDOR\TRABALHO\DELPHI_NEW\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  URecebeBloquetoParam in 'URecebeBloquetoParam.pas' {FRecebeBloquetoParam},
  UContaCad in 'UContaCad.pas' {FContaCad},
  UConta_cl in 'UConta_cl.pas' {DMConta: TDataModule},
  UContaCons in 'UContaCons.pas' {FContaCons},
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UModificaSerie in 'UModificaSerie.pas' {FModificaSerie},
  USobre in 'USobre.pas' {FSobre};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.HelpFile := 'C:\Executaveis\Manual\P_Recebe_Bloqueto.hlp';
  Application.Title := 'Sistema de Recebimento de Bloquetos';
  Application.CreateForm(TDMAcesso, DMAcesso);
  Application.CreateForm(TDMConta, DMConta);
  Application.CreateForm(TDMRecebeBloqueto, DMRecebeBloqueto);
  Application.CreateForm(TFPrincipal, FPrincipal);
  FSplash.Hide;
  FSplash.Free;
  Application.Run;
end.
