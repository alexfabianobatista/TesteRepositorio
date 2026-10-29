program PImporta;

uses
  Forms,
  UImporta in 'UImporta.pas' {Form1},
  uConecta_cl in 'uConecta_cl.pas' {DMConecta: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDMConecta, DMConecta);
  Application.Run;
end.
