unit UContasPagarPostgre_cl;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDMContasPagarPostgre = class(TDataModule)
    ZQContasPagar: TZQuery;
    ZQContasPagartitulo_parcela: TStringField;
    ZQContasPagarval_titulo: TFloatField;
    ZQContasPagardt_vencimento: TDateField;
    ZQContasPagarval_juros: TFloatField;
    ZQContasPagarcod_banco_agencia: TStringField;
    ZQContasPagardt_emissao: TDateField;
    ZQContasPagarind_situacao: TStringField;
    ZQContasPagarnum_referente_documento: TStringField;
    ZQContasPagardt_baixa: TDateField;
    ZQContasPagarvl_pagamento: TFloatField;
    ZQContasPagarvl_juros: TFloatField;
    ZQContasPagarvl_desconto: TFloatField;
    ZQContasPagarval_total: TFloatField;
    ZQContasPagardesc_tipo_documento: TStringField;
    ZQContasPagarcod_cadastro: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContasPagarPostgre: TDMContasPagarPostgre;

implementation

{$R *.dfm}

end.
