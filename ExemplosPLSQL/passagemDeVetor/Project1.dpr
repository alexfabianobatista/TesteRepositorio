program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UOracle_cl in '..\..\Banco\UOracle_cl.pas' {DMOracle: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDMOracle, DMOracle);
  Application.Run;
end.
