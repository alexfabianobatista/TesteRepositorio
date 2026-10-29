program pjResistor;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
