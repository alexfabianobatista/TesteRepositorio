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
    ZQContasReceberSeta: TZQuery;
    ZQContasReceberSetacodigo: TStringField;
    ZQContasReceberSetacod_cadastro: TStringField;
    ZQContasReceberSetadt_emissao: TDateField;
    ZQContasReceberSetadt_vencimento: TDateField;
    ZQContasReceberSetadt_pagamento: TDateField;
    ZQContasReceberSetaval_original: TFloatField;
    ZQContasReceberSetaval_titulo: TFloatField;
    ZQContasReceberSetaval_juros: TFloatField;
    ZQContasReceberSetanum_titulo: TMemoField;
    ZQContasReceberSetanum_parcela: TStringField;
    ZQContasReceberSetaind_situacao: TStringField;
    ZQContasReceberSetacod_finalidade: TIntegerField;
    ZQContasReceberSetaobservacao: TMemoField;
    ZQContasReceberSetacod_filial: TStringField;
    ZQContasReceberSetaAbertoFilial: TZQuery;
    ZQContasReceberSetaAbertoFilialcodigo: TStringField;
    ZQContasReceberSetaAbertoFilialcod_filial: TStringField;
    ZQContasReceberSetaAbertoFilialcod_cadastro: TStringField;
    ZQContasReceberSetaAbertoFilialdt_emissao: TDateField;
    ZQContasReceberSetaAbertoFilialdt_vencimento: TDateField;
    ZQContasReceberSetaAbertoFilialdt_pagamento: TDateField;
    ZQContasReceberSetaAbertoFilialval_original: TFloatField;
    ZQContasReceberSetaAbertoFilialval_titulo: TFloatField;
    ZQContasReceberSetaAbertoFilialval_juros: TFloatField;
    ZQContasReceberSetaAbertoFilialnum_titulo: TMemoField;
    ZQContasReceberSetaAbertoFilialnum_parcela: TStringField;
    ZQContasReceberSetaAbertoFilialind_situacao: TStringField;
    ZQContasReceberSetaAbertoFilialcod_finalidade: TIntegerField;
    ZQContasReceberSetaAbertoFilialobservacao: TMemoField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContasReceberPostgre: TDMContasReceberPostgre;

implementation

uses UPostgre_cl;

{$R *.dfm}

end.
