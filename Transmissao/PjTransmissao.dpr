program PjTransmissao;

uses
  Forms,
  UTransmissaoCad in 'UTransmissaoCad.pas' {FTransmissaoCad},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UTransmissao_cl in 'UTransmissao_cl.pas' {DMTransmissao: TDataModule},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  UBanco_cl in 'UBanco_cl.pas' {DMBanco: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFTransmissaoCad, FTransmissaoCad);
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMTransmissao, DMTransmissao);
  Application.CreateForm(TDMBanco, DMBanco);
  Application.Run;
end.
