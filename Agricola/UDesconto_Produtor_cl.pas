unit UDesconto_Produtor_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMDescontoProdutor = class(TDataModule)
    QDescontoProdutor: TOracleDataSet1;
    QDescontoProdutorCOD_DESCONTO_PRODUTOR: TIntegerField;
    QDescontoProdutorCOD_CADASTRO: TIntegerField;
    QDescontoProdutorCOD_PRODUTO: TIntegerField;
    QDescontoProdutorPERC_BASE: TFloatField;
    QDescontoProdutorPERC_MULTIPLICADOR: TFloatField;
    QDescontoProdutorCons: TOracleDataSet1;
    QDescontoProdutorConsCOD_DESCONTO_PRODUTOR: TIntegerField;
    QDescontoProdutorConsCOD_CADASTRO: TIntegerField;
    QDescontoProdutorConsCOD_PRODUTO: TIntegerField;
    QDescontoProdutorConsPERC_BASE: TFloatField;
    QDescontoProdutorConsPERC_MULTIPLICADOR: TFloatField;
    QDescontoProdutorPERC_ATE: TFloatField;
    QDescontoProdutorPERC_BASE1: TFloatField;
    QDescontoProdutorPERC_ATE1: TFloatField;
    QDescontoProdutorPERC_MULTIPLICADOR1: TFloatField;
    QDescontoProdutorPERC_BASE2: TFloatField;
    QDescontoProdutorPERC_ATE2: TFloatField;
    QDescontoProdutorPERC_MULTIPLICADOR2: TFloatField;
    QDescontoProdutorConsPERC_ATE: TFloatField;
    QDescontoProdutorConsPERC_BASE1: TFloatField;
    QDescontoProdutorConsPERC_ATE1: TFloatField;
    QDescontoProdutorConsPERC_MULTIPLICADOR1: TFloatField;
    QDescontoProdutorConsPERC_BASE2: TFloatField;
    QDescontoProdutorConsPERC_ATE2: TFloatField;
    QDescontoProdutorConsPERC_MULTIPLICADOR2: TFloatField;
    QDescontoProdutorDT_VALIDADE: TDateTimeField;
    QDescontoProdutorConsDT_VALIDADE: TDateTimeField;
    QDescontoProdutorPERC_TOLERA_IMPUREZA: TFloatField;
    QDescontoProdutorConsPERC_TOLERA_IMPUREZA: TFloatField;
    QDescontoProdutorConsDESC_CLIENTE: TStringField;
    QDescontoProdutorConsDESC_PRODUTO: TStringField;
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDescontoProdutor: TDMDescontoProdutor;

implementation

uses UOracle_cl;

{$R *.DFM}

end.


