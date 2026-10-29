unit UCustoEntrega_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMCustoEntrega = class(TDataModule)
    QCustoEntrega: TOracleDataSet1;
    QCustoEntregaCOD_CUSTO_ENTREGA: TIntegerField;
    QCustoEntregaCOD_FILIAL: TIntegerField;
    QCustoEntregaCOD_VENDEDOR: TIntegerField;
    QCustoEntregaDT_ENTREGA: TDateTimeField;
    QCustoEntregaDESC_OUTROS: TStringField;
    QCustoEntregaIND_SITUACAO: TStringField;
    QBaixaEntrega: TOracleDataSet1;
    QBaixaEntregaCOD_VENDEDOR: TIntegerField;
    QBaixaEntregaDT_ENTREGA: TDateTimeField;
    QBaixaEntregaIND_SITUACAO: TStringField;
    QCustoEntregaCons: TOracleDataSet1;
    QCustoEntregaConsCOD_CUSTO_ENTREGA: TIntegerField;
    QCustoEntregaConsCOD_FILIAL: TIntegerField;
    QCustoEntregaConsCOD_VENDEDOR: TIntegerField;
    QCustoEntregaConsDT_ENTREGA: TDateTimeField;
    QCustoEntregaConsDESC_OUTROS: TStringField;
    QCustoEntregaConsIND_SITUACAO: TStringField;
    QCustoEntregaCOD_NOTA_CAB: TIntegerField;
    QCustoEntregaConsCOD_NOTA_CAB: TIntegerField;
    QRCustoEntrega: TOracleDataSet1;
    QRCustoEntregaCOD_CUSTO_ENTREGA: TIntegerField;
    QRCustoEntregaCOD_FILIAL: TIntegerField;
    QRCustoEntregaCOD_VENDEDOR: TIntegerField;
    QRCustoEntregaNOME: TStringField;
    QRCustoEntregaCOD_NOTA_CAB: TIntegerField;
    QRCustoEntregaDT_ENTREGA: TDateTimeField;
    QBaixaEntregaCOD_NOTA_CAB: TIntegerField;
    QRCustoEntregaDESC_OUTROS: TStringField;
    QRCustoEntregaIND_SITUACAO: TStringField;
    QCustoEntregaDT_BAIXA: TDateTimeField;
    QCustoEntregaConsDT_BAIXA: TDateTimeField;
    QBaixaEntregaDT_BAIXA: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCustoEntrega: TDMCustoEntrega;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
