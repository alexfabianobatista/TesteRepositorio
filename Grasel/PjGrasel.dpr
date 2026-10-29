program PjGrasel;

uses
  Forms,
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UImportaDadosGrasel in 'UImportaDadosGrasel.pas' {FImportaDadosGrasel},
  UConexao_cl in 'UConexao_cl.pas' {DMConexao: TDataModule},
  UImportaGrasel_cl in 'UImportaGrasel_cl.pas' {DMImportaGrasel: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TFImportaDadosGrasel, FImportaDadosGrasel);
  Application.CreateForm(TDMConexao, DMConexao);
  Application.CreateForm(TDMImportaGrasel, DMImportaGrasel);
  Application.Run;
end.
