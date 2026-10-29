program PjTesteImpressora;

uses
  Forms,
  UTesteImpressora in 'UTesteImpressora.pas' {Form1},
  uCharPrinter in 'uCharPrinter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
