unit UFidelidade_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMFidelidade = class(TDataModule)
    QBaixaFidelidade: TOracleDataSet1;
    QBaixaFidelidadeCOD_BAIXA_FIDELIDADE: TIntegerField;
    QBaixaFidelidadeCOD_CADASTRO: TIntegerField;
    QBaixaFidelidadeVAL_BAIXA: TFloatField;
    QBaixaFidelidadeDT_BAIXA: TDateTimeField;
    QBaixaFidelidadeCOD_USUARIO: TIntegerField;
    QBaixaFidelidadeCOD_FILIAL: TIntegerField;
    QBaixaFidelidadeCOD_NOTA_CAB: TIntegerField;
    QRFidelidade: TOracleDataSet1;
    QRFidelidadeCOD_NOTA_CAB: TIntegerField;
    QRFidelidadeNUM_NOTA: TIntegerField;
    QRFidelidadeDT_RECEBIMENTO: TDateTimeField;
    QRFidelidadeVAL_TOTAL: TFloatField;
    QRBaixaFidelidade: TOracleDataSet1;
    QRBaixaFidelidadeCOD_BAIXA_FIDELIDADE: TIntegerField;
    QRBaixaFidelidadeVAL_BAIXA: TFloatField;
    QRBaixaFidelidadeDT_BAIXA: TDateTimeField;
    QRPontosCliente: TOracleDataSet1;
    QRPontosClienteCOD_CADASTRO: TIntegerField;
    QRPontosClienteNOME: TStringField;
    QRPontosClienteVAL_BAIXA: TFloatField;
    QRPontosClienteDT_BAIXA: TDateTimeField;
    QRPontosClienteCOD_FILIAL: TIntegerField;
    QRPontosClienteDESC_FILIAL: TStringField;
    QFidelidadeSaldo: TOracleDataSet1;
    QFidelidadeSaldoVAL_FIDELIDADE: TFloatField;
    QFidelidadeSaldoVAL_RECEBIDO: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMFidelidade: TDMFidelidade;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
