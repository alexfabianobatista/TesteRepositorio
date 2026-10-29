unit URecebeBloqueto_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDMRecebeBloqueto = class(TDataModule)
    QRecebeBloqueto: TQuery;
    QRecebeBloquetoCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRecebeBloquetoNUM_TITULO: TIntegerField;
    QRecebeBloquetoVAL_TITULO: TFloatField;
    QRecebeBloquetoVAL_JUROS: TFloatField;
    QRecebeBloquetoVAL_DESCONTO: TFloatField;
    QRecebeBloquetoCOD_MOEDA: TSmallintField;
    QRecebeBloquetoNOSSO_NUMERO: TStringField;
    QRecebeBloquetoDT_RECEBIMENTO: TDateTimeField;
    QRecebeBloquetoDT_VENCIMENTO: TDateTimeField;
    QRecebeBloquetoCOD_BANCO: TSmallintField;
    QRecebeBloquetoCOD_AGENCIA: TSmallintField;
    QRecebeBloquetoDV_AGENCIA: TSmallintField;
    QRecebeBloquetoNUM_CONTA: TIntegerField;
    QRecebeBloquetoDV_CONTA: TSmallintField;
    QRecebeBloquetoCOD_CARTEIRA: TSmallintField;
    QRecebeBloquetoCons: TQuery;
    QRecebeBloquetoConsCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRecebeBloquetoConsNUM_TITULO: TIntegerField;
    QRecebeBloquetoConsVAL_TITULO: TFloatField;
    QRecebeBloquetoConsVAL_JUROS: TFloatField;
    QRecebeBloquetoConsVAL_DESCONTO: TFloatField;
    QRecebeBloquetoConsCOD_MOEDA: TSmallintField;
    QRecebeBloquetoConsNOSSO_NUMERO: TStringField;
    QRecebeBloquetoConsDT_RECEBIMENTO: TDateTimeField;
    QRecebeBloquetoConsDT_VENCIMENTO: TDateTimeField;
    QRecebeBloquetoConsCOD_BANCO: TSmallintField;
    QRecebeBloquetoConsCOD_AGENCIA: TSmallintField;
    QRecebeBloquetoConsDV_AGENCIA: TSmallintField;
    QRecebeBloquetoConsNUM_CONTA: TIntegerField;
    QRecebeBloquetoConsDV_CONTA: TSmallintField;
    QRecebeBloquetoConsCOD_CARTEIRA: TSmallintField;
    QRRecebeBloqueto: TQuery;
    QRRecebeBloquetoCOD_AGENCIA: TSmallintField;
    QRRecebeBloquetoDV_AGENCIA: TSmallintField;
    QRRecebeBloquetoNUM_CONTA: TIntegerField;
    QRRecebeBloquetoDV_CONTA: TSmallintField;
    QRRecebeBloquetoCOD_CARTEIRA: TSmallintField;
    QRRecebeBloquetoNUM_TITULO: TIntegerField;
    QRRecebeBloquetoNOSSO_NUMERO: TStringField;
    QRRecebeBloquetoDT_RECEBIMENTO: TDateTimeField;
    QRRecebeBloquetoDT_VENCIMENTO: TDateTimeField;
    QRRecebeBloquetoVAL_TITULO: TFloatField;
    QRRecebeBloquetoVAL_JUROS: TFloatField;
    QRRecebeBloquetoVAL_DESCONTO: TFloatField;
    QRetorno: TQuery;
    QRetornoNUM_TITULO: TIntegerField;
    QRetornoVAL_TITULO: TFloatField;
    QRetornoVAL_JUROS: TFloatField;
    QRetornoVAL_DESCONTO: TFloatField;
    QRetornoCOD_MOEDA: TSmallintField;
    QRetornoNOSSO_NUMERO: TStringField;
    QRetornoDT_VENCIMENTO: TDateTimeField;
    QRetornoCOD_BANCO: TSmallintField;
    QRetornoCOD_AGENCIA: TSmallintField;
    QRetornoDV_AGENCIA: TSmallintField;
    QRetornoDV_NOSSO_NUMERO: TStringField;
    QRetornoDT_RECEBIMENTO: TDateTimeField;
    QRecebeBloquetoDV_NOSSO_NUMERO: TStringField;
    QRecebeBloquetoIND_SITUACAO: TStringField;
    QRecebeBloquetoIND_EMITIDO: TStringField;
    QRetornoCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRRecebeBloquetoDV_NOSSO_NUMERO: TStringField;
    procedure QRecebeBloquetoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRecebeBloqueto: TDMRecebeBloqueto;

implementation

uses UAcesso_cl;

{$R *.DFM}

procedure TDMRecebeBloqueto.QRecebeBloquetoAfterInsert(DataSet: TDataSet);
begin
  QRecebeBloquetoCOD_CONTA_RECEBER_CAB.Value := DMAcesso.ValorCodigo('COD_CONTA_RECEBER_CAB','TB_CONTA_RECEBER_CAB');
end;

end.
