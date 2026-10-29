object DMContasPagarPostgre: TDMContasPagarPostgre
  OldCreateOrder = False
  Left = 531
  Top = 207
  Height = 274
  Width = 438
  object ZQContasPagar: TZQuery
    Connection = DMPostgre.ZConnection1
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
      '  T.TITRECPAG = '#39'P'#39)
    Params = <>
    Left = 40
    Top = 24
    object ZQContasPagartitulo_parcela: TStringField
      FieldName = 'titulo_parcela'
      Required = True
      Size = 10
    end
    object ZQContasPagarval_titulo: TFloatField
      FieldName = 'val_titulo'
    end
    object ZQContasPagardt_vencimento: TDateField
      FieldName = 'dt_vencimento'
    end
    object ZQContasPagarval_juros: TFloatField
      FieldName = 'val_juros'
    end
    object ZQContasPagarcod_banco_agencia: TStringField
      FieldName = 'cod_banco_agencia'
      Size = 3
    end
    object ZQContasPagardt_emissao: TDateField
      FieldName = 'dt_emissao'
    end
    object ZQContasPagarind_situacao: TStringField
      FieldName = 'ind_situacao'
      Size = 1
    end
    object ZQContasPagarnum_referente_documento: TStringField
      FieldName = 'num_referente_documento'
      Size = 8
    end
    object ZQContasPagardt_baixa: TDateField
      FieldName = 'dt_baixa'
    end
    object ZQContasPagarvl_pagamento: TFloatField
      FieldName = 'vl_pagamento'
    end
    object ZQContasPagarvl_juros: TFloatField
      FieldName = 'vl_juros'
    end
    object ZQContasPagarvl_desconto: TFloatField
      FieldName = 'vl_desconto'
    end
    object ZQContasPagarval_total: TFloatField
      FieldName = 'val_total'
    end
    object ZQContasPagardesc_tipo_documento: TStringField
      FieldName = 'desc_tipo_documento'
      Size = 3
    end
    object ZQContasPagarcod_cadastro: TIntegerField
      FieldName = 'cod_cadastro'
    end
  end
end
