unit UContasReceberPostgre_cl;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDMContasReceberPostgre = class(TDataModule)
    ZQContasReceber: TZQuery;
    ZQContasRecebertitulo_parcela: TStringField;
    ZQContasReceberval_titulo: TFloatField;
    ZQContasReceberdt_vencimento: TDateField;
    ZQContasReceberval_juros: TFloatField;
    ZQContasRecebercod_banco_agencia: TStringField;
    ZQContasReceberdt_emissao: TDateField;
    ZQContasReceberind_situacao: TStringField;
    ZQContasRecebernum_referente_documento: TStringField;
    ZQContasReceberdt_baixa: TDateField;
    ZQContasRecebervl_pagamento: TFloatField;
    ZQContasRecebervl_juros: TFloatField;
    ZQContasRecebervl_desconto: TFloatField;
    ZQContasReceberval_total: TFloatField;
    ZQContasReceberdesc_tipo_documento: TStringField;
    ZQContasRecebercod_cadastro: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContasReceberPostgre: TDMContasReceberPostgre;

implementation

uses UFirebird_cl;

{$R *.dfm}

end.
