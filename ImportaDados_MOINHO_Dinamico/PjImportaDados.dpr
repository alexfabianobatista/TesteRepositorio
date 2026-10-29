program PjImportaDados;

uses
  Forms,
  UImportaDados_cl in 'UImportaDados_cl.pas' {DMImportaDados: TDataModule},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UImportaDados in 'UImportaDados.pas' {FImportaDados},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMImportaDados, DMImportaDados);
  Application.CreateForm(TFImportaDados, FImportaDados);
  Application.Run;
end.
