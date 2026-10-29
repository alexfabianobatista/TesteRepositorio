unit UBandeiraCartao_cl;

interface

uses
  SysUtils, Classes, DB, OracleData;

type
  TDMBandeiraCartao = class(TDataModule)
    QBandeiraCartaoCad: TOracleDataSet;
    QBandeiraCartaoCadCOD_BANDEIRA_CARTAO: TIntegerField;
    QBandeiraCartaoCadDESC_BANDEIRA_CARTAO: TStringField;
    QBandeiraCartaoCons: TOracleDataSet;
    QBandeiraCartaoConsCOD_BANDEIRA_CARTAO: TIntegerField;
    QBandeiraCartaoConsDESC_BANDEIRA_CARTAO: TStringField;
    QRBandeiraCartao: TOracleDataSet;
    QRBandeiraCartaoCOD_BANDEIRA_CARTAO: TIntegerField;
    QRBandeiraCartaoDESC_BANDEIRA_CARTAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBandeiraCartao: TDMBandeiraCartao;

implementation
uses UOracle_cl;

{$R *.dfm}

end.
