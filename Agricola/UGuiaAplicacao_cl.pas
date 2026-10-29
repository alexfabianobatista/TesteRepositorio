unit UGuiaAplicacao_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMGuiaAplicacao = class(TDataModule)
    QGuiaAplicacao: TOracleDataSet1;
    QGuiaAplicacaoCOD_PRODUTO: TFloatField;
    QGuiaAplicacaoDESC_FORMA_APLICACAO: TStringField;
    QGuiaAplicacaoDESC_RISCOS: TStringField;
    QGuiaAplicacaoDESC_CUIDADOS: TStringField;
    QGuiaAplicacaodesc_produto: TStringField;
    procedure QGuiaAplicacaoAfterPost(DataSet: TDataSet);
    procedure QGuiaAplicacaoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMGuiaAplicacao: TDMGuiaAplicacao;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMGuiaAplicacao.QGuiaAplicacaoAfterPost(DataSet: TDataSet);
var wCodigo:Real;
begin
   wCodigo := QGuiaAplicacaoCod_Produto.Value;
   QGuiaAplicacao.Close;
   QGuiaAplicacao.SetVariable('PK',wCodigo);
   QGuiaAplicacao.Open;

end;

procedure TDMGuiaAplicacao.QGuiaAplicacaoCalcFields(DataSet: TDataSet);
begin
  QGuiaAplicacaoDesc_Produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+FloatToStr(QGuiaAplicacaoCod_Produto.Value));

end;

end.
