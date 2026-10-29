object DMContasReceberPostgre: TDMContasReceberPostgre
  OldCreateOrder = False
  Left = 277
  Top = 135
  Height = 259
  Width = 368
  object ZQContasReceber: TZQuery
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
  object ZQContasReceberSeta: TZQuery
    Connection = DMPostgre.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  CODIGO AS CODIGO,'
      '  EMPRESA AS COD_FILIAL,'
      '  PESSOA AS COD_CADASTRO,'
      '  LANCAMENTO AS DT_EMISSAO,'
      '  VENCIMENTO AS DT_VENCIMENTO,'
      '  PAGAMENTO AS DT_PAGAMENTO,'
      '  VALOR AS VAL_ORIGINAL,'
      '  VALOR - VALORPAGO AS VAL_TITULO,'
      '  AJUSTES AS VAL_JUROS,'
      '  substr(DOCUMENTO,3,6) AS NUM_TITULO,'
      '  PARCELA  AS NUM_PARCELA,'
      '  STATUS AS IND_SITUACAO,'
      '  2 AS COD_FINALIDADE,'
      '  DOCUMENTO || '#39'-'#39' || DESCRICAO AS OBSERVACAO'
      'FROM'
      '  FINANCEIRO_TITULOS'
      'WHERE'
      '  ITEM IN ('#39'002'#39','#39'003'#39')'
      'AND '
      ' EMPRESA IN ('#39'03'#39','#39'08'#39','#39'10'#39')'
      'AND'
      '  STATUS NOT IN ('#39'C'#39','#39'S'#39')'
      'AND'
      '  RP = '#39'R'#39
      'AND'
      '  PORTADOR = '#39'001'#39
      'AND'
      '  TIPO = '#39'4'#39
      'AND'
      '  VALOR >= 0'
      'ORDER BY'
      '  NUM_TITULO, NUM_PARCELA')
    Params = <>
    Left = 48
    Top = 96
    object ZQContasReceberSetacodigo: TStringField
      FieldName = 'codigo'
      Required = True
      Size = 8
    end
    object ZQContasReceberSetacod_cadastro: TStringField
      FieldName = 'cod_cadastro'
      Size = 6
    end
    object ZQContasReceberSetadt_emissao: TDateField
      FieldName = 'dt_emissao'
    end
    object ZQContasReceberSetadt_vencimento: TDateField
      FieldName = 'dt_vencimento'
    end
    object ZQContasReceberSetadt_pagamento: TDateField
      FieldName = 'dt_pagamento'
    end
    object ZQContasReceberSetaval_original: TFloatField
      FieldName = 'val_original'
    end
    object ZQContasReceberSetaval_titulo: TFloatField
      FieldName = 'val_titulo'
      ReadOnly = True
    end
    object ZQContasReceberSetaval_juros: TFloatField
      FieldName = 'val_juros'
    end
    object ZQContasReceberSetanum_titulo: TMemoField
      FieldName = 'num_titulo'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQContasReceberSetanum_parcela: TStringField
      FieldName = 'num_parcela'
      Size = 3
    end
    object ZQContasReceberSetaind_situacao: TStringField
      FieldName = 'ind_situacao'
      Size = 1
    end
    object ZQContasReceberSetacod_finalidade: TIntegerField
      FieldName = 'cod_finalidade'
      ReadOnly = True
    end
    object ZQContasReceberSetaobservacao: TMemoField
      FieldName = 'observacao'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQContasReceberSetacod_filial: TStringField
      FieldName = 'cod_filial'
      Size = 2
    end
  end
  object ZQContasReceberSetaAbertoFilial: TZQuery
    Connection = DMPostgre.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  CODIGO AS CODIGO,'
      '  EMPRESA AS COD_FILIAL,'
      '  PESSOA AS COD_CADASTRO,'
      '  LANCAMENTO AS DT_EMISSAO,'
      '  VENCIMENTO AS DT_VENCIMENTO,'
      '  PAGAMENTO AS DT_PAGAMENTO,'
      '  VALOR AS VAL_ORIGINAL,'
      '  VALOR - VALORPAGO AS VAL_TITULO,'
      '  AJUSTES AS VAL_JUROS,'
      '  substr(DOCUMENTO,3,6) AS NUM_TITULO,'
      '  PARCELA  AS NUM_PARCELA,'
      '  STATUS AS IND_SITUACAO,'
      '  1 AS COD_FINALIDADE,'
      '  DOCUMENTO || '#39'-'#39' || DESCRICAO AS OBSERVACAO'
      'FROM'
      '  FINANCEIRO_TITULOS'
      'WHERE'
      '  ITEM IN ('#39'002'#39','#39'003'#39')'
      'AND'
      '  /*EMPRESA NOT IN ('#39'03'#39','#39'08'#39','#39'10'#39')*/'
      '  EMPRESA = '#39'04'#39
      'AND'
      '  STATUS NOT IN ('#39'C'#39','#39'S'#39')'
      'AND'
      '  RP = '#39'R'#39
      '/*AND'
      '  PORTADOR = '#39'001'#39'*/'
      'AND'
      '  TIPO = '#39'4'#39
      'AND'
      '  VALORPAGO = 0'
      'AND'
      '  VALOR > 0'
      'ORDER BY'
      '  NUM_TITULO, NUM_PARCELA'
      '')
    Params = <>
    Left = 160
    Top = 136
    object ZQContasReceberSetaAbertoFilialcodigo: TStringField
      FieldName = 'codigo'
      Required = True
      Size = 8
    end
    object ZQContasReceberSetaAbertoFilialcod_filial: TStringField
      FieldName = 'cod_filial'
      Size = 2
    end
    object ZQContasReceberSetaAbertoFilialcod_cadastro: TStringField
      FieldName = 'cod_cadastro'
      Size = 6
    end
    object ZQContasReceberSetaAbertoFilialdt_emissao: TDateField
      FieldName = 'dt_emissao'
    end
    object ZQContasReceberSetaAbertoFilialdt_vencimento: TDateField
      FieldName = 'dt_vencimento'
    end
    object ZQContasReceberSetaAbertoFilialdt_pagamento: TDateField
      FieldName = 'dt_pagamento'
    end
    object ZQContasReceberSetaAbertoFilialval_original: TFloatField
      FieldName = 'val_original'
    end
    object ZQContasReceberSetaAbertoFilialval_titulo: TFloatField
      FieldName = 'val_titulo'
      ReadOnly = True
    end
    object ZQContasReceberSetaAbertoFilialval_juros: TFloatField
      FieldName = 'val_juros'
    end
    object ZQContasReceberSetaAbertoFilialnum_titulo: TMemoField
      FieldName = 'num_titulo'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQContasReceberSetaAbertoFilialnum_parcela: TStringField
      FieldName = 'num_parcela'
      Size = 3
    end
    object ZQContasReceberSetaAbertoFilialind_situacao: TStringField
      FieldName = 'ind_situacao'
      Size = 1
    end
    object ZQContasReceberSetaAbertoFilialcod_finalidade: TIntegerField
      FieldName = 'cod_finalidade'
      ReadOnly = True
    end
    object ZQContasReceberSetaAbertoFilialobservacao: TMemoField
      FieldName = 'observacao'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
end
