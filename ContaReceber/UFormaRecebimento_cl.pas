unit UFormaRecebimento_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDmFormaRecebimento = class(TDataModule)
    QFormaRecebimento: TOracleDataSet1;
    QFormaRecebimentoCOD_FORMA_RECEBIMENTO: TIntegerField;
    QFormaRecebimentoDESC_FORMA_RECEBIMENTO: TStringField;
    QFormaRecebimentoIND_EXIGIR_BANCO: TStringField;
    QFormaRecebimentoCons: TOracleDataSet1;
    QFormaRecebimentoConsCOD_FORMA_RECEBIMENTO: TIntegerField;
    QFormaRecebimentoConsDESC_FORMA_RECEBIMENTO: TStringField;
    QFormaRecebimentoConsIND_EXIGIR_BANCO: TStringField;
    procedure QFormaRecebimentoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmFormaRecebimento: TDmFormaRecebimento;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TDmFormaRecebimento.QFormaRecebimentoAfterInsert(
  DataSet: TDataSet);
begin
  QFormaRecebimentoIND_EXIGIR_BANCO.Value := 'N';
end;

end.
