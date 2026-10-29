unit ULocalizacao_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMLocalizacao = class(TDataModule)
    QLocalizacao: TOracleDataSet1;
    QLocalizacaoCOD_LOCALIZACAO: TIntegerField;
    QLocalizacaoDESC_LOCALIZACAO: TStringField;
    QLocalizacaoCons: TOracleDataSet1;
    QLocalizacaoConsCOD_LOCALIZACAO: TIntegerField;
    QLocalizacaoConsDESC_LOCALIZACAO: TStringField;
    QRLocalizacao: TOracleDataSet1;
    QRLocalizacaoCOD_LOCALIZACAO: TIntegerField;
    QRLocalizacaoDESC_LOCALIZACAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMLocalizacao: TDMLocalizacao;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
