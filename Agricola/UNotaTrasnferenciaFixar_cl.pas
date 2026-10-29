unit UNotaTrasnferenciaFixar_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMNotaTrasnferenciaFixar = class(TDataModule)
    QNotaTransferenciaFixar: TOracleDataSet1;
    QNotaTransferenciaFixarCOD_NOTA_TRANSFERENCIA: TIntegerField;
    QNotaTransferenciaFixarCOD_FILIAL: TIntegerField;
    QNotaTransferenciaFixarCOD_PRODUTO: TIntegerField;
    QNotaTransferenciaFixarCOD_LOTE_TIPO: TIntegerField;
    QNotaTransferenciaFixarCOD_CADASTRO_ORIGEM: TIntegerField;
    QNotaTransferenciaFixarCOD_CADASTRO_DESTINO: TIntegerField;
    QNotaTransferenciaFixarCOD_OPERACAO_SAIDA: TIntegerField;
    QNotaTransferenciaFixarCOD_OPERACAO_ENTRADA: TIntegerField;
    QNotaTransferenciaFixarVAL_PRECO: TFloatField;
    QNotaTransferenciaFixarQT_QUANTIDADE: TFloatField;
    QNotaTransferenciaFixarCOD_SERIE: TStringField;
    QNotaTransferenciaFixarCOD_CADASTRO_PARCEIRO: TIntegerField;
    QNotaTransferenciaFixarDESC_OBSERVACAO: TStringField;
    QNotaTransferenciaFixarDESC_COMPLEMENTO: TStringField;
    QNotaTransferenciaFixarCOD_SERIE_ENTRADA: TStringField;
    QNotaTransferenciaFixarDESC_OBS_ENTRADA: TStringField;
    QNotaTransferenciaFixarIND_SITUACAO: TStringField;
    QNotaTransferenciaFixarCOD_CADASTRO_TESTEMUNHA1: TIntegerField;
    QNotaTransferenciaFixarCOD_CADASTRO_TESTEMUNHA2: TIntegerField;
    QNotaTransferenciaFixarDT_TRANSFERENCIA: TDateTimeField;
    QNotaTransferenciaCons: TOracleDataSet1;
    QNotaTransferenciaConsCOD_NOTA_TRANSFERENCIA: TIntegerField;
    QNotaTransferenciaConsCOD_PRODUTO: TIntegerField;
    QNotaTransferenciaConsQT_QUANTIDADE: TFloatField;
    QNotaTransferenciaConsCOD_FILIAL: TIntegerField;
    QNotaTransferenciaConsCOD_CADASTRO_ORIGEM: TIntegerField;
    QNotaTransferenciaConsCOD_CADASTRO_DESTINO: TIntegerField;
    QNotaTransferenciaConsNOME: TStringField;
    QNotaTransferenciaConsDESC_PRODUTO: TStringField;
    procedure QNotaTransferenciaFixarAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMNotaTrasnferenciaFixar: TDMNotaTrasnferenciaFixar;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMNotaTrasnferenciaFixar.QNotaTransferenciaFixarAfterInsert(
  DataSet: TDataSet);
begin
  QNotaTransferenciaFixarDT_TRANSFERENCIA.Value := Date;
  QNotaTransferenciaFixarIND_SITUACAO.Value := '1'
end;

end.
