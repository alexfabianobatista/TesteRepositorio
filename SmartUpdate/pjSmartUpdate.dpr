program pjSmartUpdate;

uses
  Forms,
  UCarregando in 'UCarregando.pas' {FInicio},
  UMenu in 'UMenu.pas' {FMenu},
  UCOnfiguracao in 'UConfiguracao.pas' {FConfiguracao},
  UOracle_cl in 'UOracle_cl.pas' {DMOracle: TDataModule},
  UMysql_cl in 'UMysql_cl.pas' {DMMysql: TDataModule},
  USmartThread in 'USmartThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Smart Update';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMMysql, DMMysql);
  Application.CreateForm(TFInicio, FInicio);
  Application.CreateForm(TFMenu, FMenu);
  Application.Run;
end.
