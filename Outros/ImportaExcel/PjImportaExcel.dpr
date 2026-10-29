program PjImportaExcel;

uses
  Forms,
  UImporta in 'UImporta.pas' {FImporta};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Importa Arquivo Excel (Casa das Tintas)';
  Application.CreateForm(TFImporta, FImporta);
  Application.Run;
end.
