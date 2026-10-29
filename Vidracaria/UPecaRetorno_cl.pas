unit UPecaRetorno_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMPecaRetorno = class(TDataModule)
    QPecaRetorno: TOracleDataSet1;
    QPecaRetornoCOD_PECA_RETORNO: TFloatField;
    QPecaRetornoCOD_PECA: TStringField;
    QPecaRetornoDT_RETORNO: TDateTimeField;
    QPecaRetornoNUM_SERIE: TIntegerField;
    QPecaRetornoCons: TOracleDataSet1;
    QPecaRetornoConsCOD_PECA_RETORNO: TFloatField;
    QPecaRetornoConsCOD_PECA: TStringField;
    QPecaRetornoConsNUM_SERIE: TIntegerField;
    QPecaRetornoConsDT_RETORNO: TDateTimeField;
    QRPecaRetorno: TOracleDataSet1;
    QRPecaRetornoCOD_PECA_RETORNO: TFloatField;
    QRPecaRetornoCOD_PECA: TStringField;
    QRPecaRetornoNUM_SERIE: TIntegerField;
    QRPecaRetornoDT_RETORNO: TDateTimeField;
    QRPecaRetornoCOD_PRODUTO: TFloatField;
    QRPecaRetornoDESC_PRODUTO: TStringField;
    QRPecaRetornoMEDIDA: TStringField;
    QRPecaRetornoCOD_PEDIDO: TIntegerField;
    QPecaRetornoDESC_OBSERVACAO: TStringField;
    QRPecaRetornoDESC_OBSERVACAO: TStringField;
    QPecaRetornoIND_SITUACAO: TStringField;
    QRPecaRetornoIND_SITUACAO: TStringField;
    procedure QPecaRetornoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPecaRetorno: TDMPecaRetorno;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TDMPecaRetorno.QPecaRetornoAfterInsert(DataSet: TDataSet);
begin
  QPecaRetornoDT_RETORNO.Value := Date;
end;

end.
