program PjLePortaCom;

uses
  Forms,
  ULePortaCom in 'ULePortaCom.pas' {FLePorta},
  LePortaCom in '..\..\MyLib\LePortaCom.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFLePorta, FLePorta);
  Application.Run;
end.
