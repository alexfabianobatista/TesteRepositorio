unit UProdutoSeguranca_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMProdutoSeguranca = class(TDataModule)
    QProdutoSeguranca: TOracleDataSet1;
    QProdutoSegurancaCons: TOracleDataSet1;
    QRProdutoSeguranca: TOracleDataSet1;
    QProdutoSegurancaCOD_PRODUTO_SEGURANCA: TIntegerField;
    QProdutoSegurancaDESC_PRODUTO_SEGURANCA: TStringField;
    QProdutoSegurancaDESC_UNIDADE: TStringField;
    QProdutoSegurancaNUM_EMBALAGEM: TFloatField;
    QProdutoSegurancaCOD_CADASTRO: TIntegerField;
    QProdutoSegurancaIND_SITUACAO: TStringField;
    QProdutoSegurancaNUM_VOLUMES: TFloatField;
    QProdutoSegurancaIND_RETORNAVEL: TStringField;
    QProdutoSegurancaQUANT_ESTOQUE_MINIMO: TIntegerField;
    QProdutoSegurancadesc_cadastro: TStringField;
    QProdutoSegurancaConsCOD_PRODUTO_SEGURANCA: TIntegerField;
    QProdutoSegurancaConsDESC_PRODUTO_SEGURANCA: TStringField;
    QProdutoSegurancaConsDESC_UNIDADE: TStringField;
    QProdutoSegurancaConsIND_SITUACAO: TStringField;
    QProdutoSegurancaConsIND_RETORNAVEL: TStringField;
    QRProdutoSegurancaCOD_PRODUTO_SEGURANCA: TIntegerField;
    QRProdutoSegurancaDESC_PRODUTO_SEGURANCA: TStringField;
    QRProdutoSegurancaDESC_UNIDADE: TStringField;
    QRProdutoSegurancaIND_SITUACAO: TStringField;
    QRProdutoSegurancaIND_RETORNAVEL: TStringField;
    QRProdutoSegurancaNUM_EMBALAGEM: TFloatField;
    QRProdutoSegurancaQUANT_ESTOQUE_MINIMO: TIntegerField;
    QRProdutoSegurancaCOD_CADASTRO: TIntegerField;
    QRProdutoSegurancaNOME: TStringField;
    procedure QProdutoSegurancaCalcFields(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
   end;

var
  DMProdutoSeguranca: TDMProdutoSeguranca;

implementation

uses UOracle_cl, UCompraProdutoCad;

{$R *.DFM}

//Atualiza o estoque de Proudutos de Seguranca
//Opeacoes: '+' adiciona Qtdade ao estoque
//          '-' desconta Qtdade do estoque

procedure TDMProdutoSeguranca.QProdutoSegurancaCalcFields(
  DataSet: TDataSet);
begin
  QProdutoSegurancaDESC_CADASTRO.Value:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO='+IntToStr(QProdutoSegurancaCOD_CADASTRO.value));
end;

end.
