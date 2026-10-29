unit UDMComprasDia_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMComprasDia = class(TDataModule)
    QNotasFixacao: TOracleDataSet1;
    QNotasCompras: TOracleDataSet1;
    QNotasComprasCOD_FILIAL: TIntegerField;
    QNotasComprasCOD_PRODUTO: TFloatField;
    QNotasComprasDESC_PRODUTO: TStringField;
    QNotasComprasNUM_EMBALAGEM: TFloatField;
    QNotasComprasTOTAL_ITEM: TFloatField;
    QNotasComprasVAL_TOTAL: TFloatField;
    QNotasFixacaoCOD_FILIAL: TIntegerField;
    QNotasFixacaoCOD_PRODUTO: TFloatField;
    QNotasFixacaoDESC_PRODUTO: TStringField;
    QNotasFixacaoNUM_EMBALAGEM: TFloatField;
    QNotasFixacaoTOTAL_ITEM: TFloatField;
    QNotasFixacaoVAL_TOTAL: TFloatField;
    DSNotaFixacao: TDataSource;
    DSNotasCompras: TDataSource;
    QContratoGp: TOracleDataSet1;
    QContratoGpCOD_PRODUTO: TIntegerField;
    QContratoGpDESC_TIPO_PRECO: TStringField;
    QContratoGpIND_RETIRAR_ENTREGUE: TStringField;
    QContratoGpDESC_PRODUTO: TStringField;
    QContratoGpNUM_EMBALAGEM: TFloatField;
    QContratoGpDT_PERIODO: TFloatField;
    QContratoGpVALOR: TFloatField;
    QContratoGpQT_SALDO: TFloatField;
    DSContratoGp: TDataSource;
    QContratoCf: TOracleDataSet1;
    QContratoCfDESC_PRODUTO: TStringField;
    QContratoCfNUM_EMBALAGEM: TFloatField;
    QContratoCfCOD_PRODUTO: TIntegerField;
    QContratoCfIND_RETIRAR_ENTREGUE: TStringField;
    QContratoCfDT_PERIODO: TFloatField;
    QContratoCfQT_QUANTIDADE: TFloatField;
    QContratoCfVAL_TOTAL: TFloatField;
    QContratoCfQT_SALDO: TFloatField;
    DSContratoCf: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMComprasDia: TDMComprasDia;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
