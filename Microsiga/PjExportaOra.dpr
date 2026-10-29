program PjExportaOra;

uses
  Forms,
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UExporta_Cl in 'UExporta_Cl.pas' {DmExporta: TDataModule},
  UTCadSimples in '..\Template\UTCADSIMPLES.pas' {FTCadSimples},
  UExporta in 'UExporta.pas' {FExporta},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDMOracle, DMOracle);
  DMOracle.DBCemapa.Connected     := false;
  DMOracle.DBCemapa.LogonDatabase := 'ORA';
  DMOracle.DBCemapa.Connected     := true;
  
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  DMParamSistema.QParamSistema.Active := true;

  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDmExporta, DmExporta);
  Application.CreateForm(TFExporta, FExporta);
  Application.CreateForm(TDMTela, DMTela);
  Application.Run;
end.
