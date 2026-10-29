unit ULimiteBanco_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMLimiteBanco = class(TDataModule)
    QLimiteBanco: TOracleDataSet1;
    QLimiteBancoCOD_LIMITE_BANCO: TIntegerField;
    QLimiteBancoCOD_BANCO_AGENCIA: TIntegerField;
    QLimiteBancoIND_TIPO_LIMITE: TStringField;
    QLimiteBancoVAL_LIM_LINHA_EXP: TFloatField;
    QLimiteBancoDESC_GARANTIA_LIM_LIN_EXP: TStringField;
    QLimiteBancoVAL_LIM_LINHA_RURAL: TFloatField;
    QLimiteBancoDESC_GARANTIA_LIM_LIN_RURAL: TStringField;
    QLimiteBancoVAL_OUTRO_LIM: TFloatField;
    QLimiteBancoDESC_GARANTIA_OUTRO_LIM: TStringField;
    QLimiteBancoIND_SITUACAO: TStringField;
    QLimiteBancoCons: TOracleDataSet1;
    QLimiteBancoConsCOD_LIMITE_BANCO: TIntegerField;
    QLimiteBancoConsCOD_BANCO_AGENCIA: TIntegerField;
    QLimiteBancoConsIND_TIPO_LIMITE: TStringField;
    QLimiteBancoConsVAL_LIM_LINHA_EXP: TFloatField;
    QLimiteBancoConsDESC_GARANTIA_LIM_LIN_EXP: TStringField;
    QLimiteBancoConsVAL_LIM_LINHA_RURAL: TFloatField;
    QLimiteBancoConsDESC_GARANTIA_LIM_LIN_RURAL: TStringField;
    QLimiteBancoConsVAL_OUTRO_LIM: TFloatField;
    QLimiteBancoConsDESC_GARANTIA_OUTRO_LIM: TStringField;
    QLimiteBancoConsIND_SITUACAO: TStringField;
    QLimiteBancoConsDESC_BANCO_AGENCIA: TStringField;
    QRLimiteBanco: TOracleDataSet1;
    QRLimiteBancoCOD_LIMITE_BANCO: TIntegerField;
    QRLimiteBancoCOD_BANCO_AGENCIA: TIntegerField;
    QRLimiteBancoIND_TIPO_LIMITE: TStringField;
    QRLimiteBancoVAL_LIM_LINHA_EXP: TFloatField;
    QRLimiteBancoDESC_GARANTIA_LIM_LIN_EXP: TStringField;
    QRLimiteBancoVAL_LIM_LINHA_RURAL: TFloatField;
    QRLimiteBancoDESC_GARANTIA_LIM_LIN_RURAL: TStringField;
    QRLimiteBancoVAL_OUTRO_LIM: TFloatField;
    QRLimiteBancoDESC_GARANTIA_OUTRO_LIM: TStringField;
    QRLimiteBancoIND_SITUACAO: TStringField;
    QRLimiteBancoDESC_BANCO_AGENCIA: TStringField;
    QRLimiteACC: TOracleDataSet1;
    QRLimiteACCVAL_LIMITE: TFloatField;
    QRLimiteACCVAL_ACC: TFloatField;
    QRLimiteACCDESC_BANCO_AGENCIA: TStringField;
    QRLimiteACCVAL_SALDO: TFloatField;
    procedure QLimiteBancoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMLimiteBanco: TDMLimiteBanco;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMLimiteBanco.QLimiteBancoAfterInsert(DataSet: TDataSet);
begin
  QLimiteBancoIND_TIPO_LIMITE.Value := 'ACC';
  QLimiteBancoIND_SITUACAO.Value := 'ANALISE';
end;

end.
