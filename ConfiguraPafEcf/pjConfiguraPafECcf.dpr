program pjConfiguraPafECcf;

uses
  Forms,
  uConfig in 'uConfig.pas' {Form1},
  UBiblioteca in '..\MyLib\UBiblioteca.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
