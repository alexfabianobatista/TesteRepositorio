object DMContasReceberPostgre: TDMContasReceberPostgre
  OldCreateOrder = False
  Left = 513
  Top = 214
  Height = 259
  Width = 368
  object ZQContasReceber: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  T.TITULO TITULO_PARCELA,'
      '  T.TITVLTOTAL VAL_TOTAL,'
      '  (T.TITVLTOTAL - T.TITVLPAG) VAL_TITULO,'
      '  T.TITVENCTO DT_VENCIMENTO,'
      '  T.TITJURO VAL_JUROS,'
      '  T.TITBANCO COD_BANCO_AGENCIA,'
      '  T.TITEMISSAO DT_EMISSAO,'
      '  T.TITSITUA IND_SITUACAO,'
      '  T.TITDOCTO NUM_REFERENTE_DOCUMENTO,'
      '  T.TITDTPAG DT_BAIXA,'
      '  T.TITVLPAG VL_PAGAMENTO,'
      '  T.TITJUROS VL_JUROS,'
      '  T.TITDESCO VL_DESCONTO,'
      '  T.TITTIPO DESC_TIPO_DOCUMENTO,'
      '  T.TITCFCO COD_CADASTRO'
      'FROM'
      '  TITULOS T '
      'WHERE'
      '  T.TITRECPAG = '#39'R'#39)
    Params = <>
    Left = 40
    Top = 24
    object ZQContasRecebertitulo_parcela: TStringField
      FieldName = 'titulo_parcela'
      Required = True
      Size = 10
    end
    object ZQContasReceberval_titulo: TFloatField
      FieldName = 'val_titulo'
    end
    object ZQContasReceberdt_vencimento: TDateField
      FieldName = 'dt_vencimento'
    end
    object ZQContasReceberval_juros: TFloatField
      FieldName = 'val_juros'
    end
    object ZQContasRecebercod_banco_agencia: TStringField
      FieldName = 'cod_banco_agencia'
      Size = 3
    end
    object ZQContasReceberdt_emissao: TDateField
      FieldName = 'dt_emissao'
    end
    object ZQContasReceberind_situacao: TStringField
      FieldName = 'ind_situacao'
      Size = 1
    end
    object ZQContasRecebernum_referente_documento: TStringField
      FieldName = 'num_referente_documento'
      Size = 8
    end
    object ZQContasReceberdt_baixa: TDateField
      FieldName = 'dt_baixa'
    end
    object ZQContasRecebervl_pagamento: TFloatField
      FieldName = 'vl_pagamento'
    end
    object ZQContasRecebervl_juros: TFloatField
      FieldName = 'vl_juros'
    end
    object ZQContasRecebervl_desconto: TFloatField
      FieldName = 'vl_desconto'
    end
    object ZQContasReceberval_total: TFloatField
      FieldName = 'val_total'
    end
    object ZQContasReceberdesc_tipo_documento: TStringField
      FieldName = 'desc_tipo_documento'
      Size = 3
    end
    object ZQContasRecebercod_cadastro: TIntegerField
      FieldName = 'cod_cadastro'
    end
  end
end
