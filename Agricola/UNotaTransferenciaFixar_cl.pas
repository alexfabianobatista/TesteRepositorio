unit UNotaTransferenciaFixar_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMNotaTransferenciaFixar = class(TDataModule)
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
    QNotaTransferenciaFixarNUM_NOTA_PRODUTOR: TIntegerField;
    QNotaTransferenciaFixarCOD_FILIAL_DESTINO: TIntegerField;
    QNotaTransferenciaFixarCOD_SERIE_MODELO: TStringField;
    procedure QNotaTransferenciaFixarAfterInsert(DataSet: TDataSet);
    procedure QNotaTransferenciaFixarCOD_FILIALChange(Sender: TField);
    procedure QNotaTransferenciaFixarAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMNotaTransferenciaFixar: TDMNotaTransferenciaFixar;

implementation

uses UOracle_cl, UParamSistema_cl;

{$R *.DFM}

procedure TDMNotaTransferenciaFixar.QNotaTransferenciaFixarAfterInsert(
  DataSet: TDataSet);
begin
  QNotaTransferenciaFixarDT_TRANSFERENCIA.Value := Date;
  QNotaTransferenciaFixarIND_SITUACAO.Value := '1';
  If DmParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
  Begin
    QNotaTransferenciaFixarCod_Lote_Tipo.Value := 1;
    QNotaTransferenciaFixarCod_Serie.Value := '1';
    QNotaTransferenciaFixarCod_Operacao_Saida.Value := 1440;
    QNotaTransferenciaFixarCod_Operacao_Entrada.Value := 130;
  end;

end;

procedure TDMNotaTransferenciaFixar.QNotaTransferenciaFixarCOD_FILIALChange(
  Sender: TField);
begin
  QNotaTransferenciaFixarCod_Filial_Destino.Text := QNotaTransferenciaFixarCod_Filial.Text;

end;

procedure TDMNotaTransferenciaFixar.QNotaTransferenciaFixarAfterPost(
  DataSet: TDataSet);
var
  wCodigo: Integer;
begin
  begin
    wCodigo := QNotaTransferenciaFixarCod_Nota_Transferencia.Value;
    QNotaTransferenciaFixar.Close;
    QNotaTransferenciaFixar.SetVariable('PK', wCodigo);
    QNotaTransferenciaFixar.Open;
  end;

end;

end.
