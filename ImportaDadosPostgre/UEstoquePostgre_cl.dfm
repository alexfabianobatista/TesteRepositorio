object DMEstoquePostgre: TDMEstoquePostgre
  OldCreateOrder = False
  Left = 518
  Top = 284
  Height = 280
  Width = 461
  object ZQEstoque: TZQuery
    Connection = DMPostgre.ZConnection1
    SQL.Strings = (
      'SELECT'
      '    1 AS COD_LOTE_TIPO,'
      '    1 AS COD_FILIAL,'
      '    CODIGO AS COD_PRODUTO,'
      '    C_MEDIO AS VL_CUSTO_MEDIO,'
      '    C_MEDIO AS VL_ULTIMO_CUSTO,'
      '    QUANT_ATUAL AS QT_QUANTIDADE,'
      '    LOCALIZACAO AS DESC_LOCALIZACAO'
      'FROM'
      #9'ESTOQUE_DBF')
    Params = <>
    Left = 40
    Top = 32
    object ZQEstoquecod_lote_tipo: TIntegerField
      FieldName = 'cod_lote_tipo'
      ReadOnly = True
    end
    object ZQEstoquecod_filial: TIntegerField
      FieldName = 'cod_filial'
      ReadOnly = True
    end
    object ZQEstoquevl_custo_medio: TFloatField
      FieldName = 'vl_custo_medio'
    end
    object ZQEstoquevl_ultimo_custo: TFloatField
      FieldName = 'vl_ultimo_custo'
    end
    object ZQEstoqueqt_quantidade: TFloatField
      FieldName = 'qt_quantidade'
    end
    object ZQEstoquedesc_localizacao: TStringField
      FieldName = 'desc_localizacao'
    end
    object ZQEstoquecod_produto: TFloatField
      FieldName = 'cod_produto'
    end
  end
  object ZQEstoqueSeta: TZQuery
    Connection = DMPostgre.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  CODIGO AS COD_PRODUTO,'
      '  CUSTO AS VL_CUSTO_MEDIO,'
      '  CUSTO AS VL_ULTIMO_CUSTO,'
      '  1 AS COD_LOTE_TIPO,'
      '  1 AS COD_FILIAL'
      'FROM'
      '  PRODUTOS'
      'ORDER BY'
      '  COD_PRODUTO')
    Params = <>
    Left = 48
    Top = 120
    object ZQEstoqueSetacod_produto: TStringField
      FieldName = 'cod_produto'
      Required = True
      Size = 6
    end
    object ZQEstoqueSetavl_custo_medio: TFloatField
      FieldName = 'vl_custo_medio'
    end
    object ZQEstoqueSetavl_ultimo_custo: TFloatField
      FieldName = 'vl_ultimo_custo'
    end
    object ZQEstoqueSetacod_lote_tipo: TIntegerField
      FieldName = 'cod_lote_tipo'
      ReadOnly = True
    end
    object ZQEstoqueSetacod_filial: TIntegerField
      FieldName = 'cod_filial'
      ReadOnly = True
    end
  end
end
