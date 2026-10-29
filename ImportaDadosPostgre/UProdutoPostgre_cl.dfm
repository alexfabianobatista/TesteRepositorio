object DMProdutoPostgre: TDMProdutoPostgre
  OldCreateOrder = False
  Left = 565
  Top = 285
  Height = 286
  Width = 312
  object ZQProduto: TZQuery
    Connection = DMPostgre.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  ESTOQUE_DBF.CODIGO COD_PRODUTO,'
      '  ESTOQUE_DBF.COD_PRODUTO NUM_FABRICANTE,'
      '  ESTOQUE_DBF.NOME DESC_PRODUTO,'
      '  ESTOQUE_DBF.UNIDADE DESC_UNIDADE,'
      '  ESTOQUE_DBF.GRUPO NUM_CLASSE,'
      '  ESTOQUE_DBF.SUBGRUPO NUM_SUBCLASSE,'
      '  ESTOQUE_DBF.VALORVENDA VAL_VAREJO,'
      '  ESTOQUE_DBF.ATACADO VAL_ATACADO,'
      '  ESTOQUE_DBF.PESO_BRUTO NUM_PESO_BRUTO,'
      '  ESTOQUE_DBF.PESO_LIQUIDO NUM_PESO_LIQUIDO,'
      '  ESTOQUE_DBF.P_IPI PERC_IPI,'
      '  1 NUM_VOLUMES,'
      '  ESTOQUE_DBF.VENDA_ATIVA IND_SITUACAO,'
      '  NCM_DBF.NCM NUM_GENERO_NCM,'
      '  ESTOQUE_DBF.LOCALIZACAO,'
      '  ESTOQUE_DBF.P_LUCRO PERC_MARGEM_VAREJO,'
      '  1 COD_TRIBUTACAO,'
      '  0 PERC_ISS,'
      '  0 PERC_INSS'
      'FROM'
      '  ESTOQUE_DBF'
      '  LEFT JOIN NCM_DBF'
      '  '#9'ON ESTOQUE_DBF.NCM = NCM_DBF.CODIGO'
      'WHERE'
      '  ESTOQUE_DBF.CODIGO > 0')
    Params = <>
    Left = 24
    Top = 16
    object ZQProdutocod_produto: TFloatField
      FieldName = 'cod_produto'
    end
    object ZQProdutonum_fabricante: TStringField
      FieldName = 'num_fabricante'
    end
    object ZQProdutodesc_produto: TStringField
      FieldName = 'desc_produto'
      Size = 80
    end
    object ZQProdutodesc_unidade: TStringField
      FieldName = 'desc_unidade'
      Size = 2
    end
    object ZQProdutonum_classe: TFloatField
      FieldName = 'num_classe'
    end
    object ZQProdutonum_subclasse: TFloatField
      FieldName = 'num_subclasse'
    end
    object ZQProdutoval_varejo: TFloatField
      FieldName = 'val_varejo'
    end
    object ZQProdutoval_atacado: TFloatField
      FieldName = 'val_atacado'
    end
    object ZQProdutonum_peso_bruto: TFloatField
      FieldName = 'num_peso_bruto'
    end
    object ZQProdutonum_peso_liquido: TFloatField
      FieldName = 'num_peso_liquido'
    end
    object ZQProdutoperc_ipi: TFloatField
      FieldName = 'perc_ipi'
    end
    object ZQProdutonum_volumes: TIntegerField
      FieldName = 'num_volumes'
      ReadOnly = True
    end
    object ZQProdutoind_situacao: TFloatField
      FieldName = 'ind_situacao'
    end
    object ZQProdutocod_tributacao: TIntegerField
      FieldName = 'cod_tributacao'
      ReadOnly = True
    end
    object ZQProdutoperc_iss: TIntegerField
      FieldName = 'perc_iss'
      ReadOnly = True
    end
    object ZQProdutoperc_inss: TIntegerField
      FieldName = 'perc_inss'
      ReadOnly = True
    end
    object ZQProdutolocalizacao: TStringField
      FieldName = 'localizacao'
    end
    object ZQProdutonum_genero_ncm: TStringField
      FieldName = 'num_genero_ncm'
      Size = 10
    end
    object ZQProdutoperc_margem_varejo: TFloatField
      FieldName = 'perc_margem_varejo'
    end
  end
  object DSProduto: TDataSource
    DataSet = ZQProduto
    Left = 88
    Top = 16
  end
  object ZQGrupo: TZQuery
    Connection = DMPostgre.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  CODIGO NUM_CLASSE,'
      '  0 AS NUM_SUBCLASSE,'
      '  NOME DESC_CLASSE'
      'FROM'
      '  GRUPO_DBF'
      'ORDER BY'
      '  NUM_CLASSE')
    Params = <>
    Left = 24
    Top = 72
    object ZQGruponum_classe: TFloatField
      FieldName = 'num_classe'
    end
    object ZQGruponum_subclasse: TIntegerField
      FieldName = 'num_subclasse'
      ReadOnly = True
    end
    object ZQGrupodesc_classe: TStringField
      FieldName = 'desc_classe'
      Size = 40
    end
  end
  object ZQSubGrupo: TZQuery
    Connection = DMPostgre.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  GRUPO NUM_CLASSE,'
      '  CODIGO NUM_SUBCLASSE,'
      '  NOME DESC_SUBCLASSE'
      'FROM'
      '  SUBGRUPO_DBF'
      'WHERE'
      '  GRUPO = :NUM_CLASSE'
      'ORDER BY'
      '  CODIGO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NUM_CLASSE'
        ParamType = ptUnknown
      end>
    Left = 88
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NUM_CLASSE'
        ParamType = ptUnknown
      end>
    object ZQSubGruponum_classe: TFloatField
      FieldName = 'num_classe'
    end
    object ZQSubGruponum_subclasse: TFloatField
      FieldName = 'num_subclasse'
    end
    object ZQSubGrupodesc_subclasse: TStringField
      FieldName = 'desc_subclasse'
      Size = 40
    end
  end
  object ZQProdutoSeta: TZQuery
    Connection = DMPostgre.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  DISTINCT ON (P.CODIGO) P.CODIGO,'
      '  P.DESCRICAO AS DESC_PRODUTO,'
      '  P.MARCA AS COD_MARCA,'
      '  P.FORNECEDOR AS COD_FORNECEDOR,'
      '  Trim(G.DESCRICAO) AS DESC_CLASSE,'
      '  P.REFERENCIA AS NUM_FABRICANTE,'
      '  P.COMPLEMENTO AS DESC_COMPLEMENTO,'
      '  P.PRECO AS VAL_VAREJO,'
      '  P.PRECO2 AS VAL_ATACADO,'
      '  P.UNIDADE DESC_UNIDADE,'
      '  P.NCM AS DESC_NCM,'
      '  P.CEST AS COD_CEST,'
      '  1 AS COD_TRIBUTACAO,'
      '  '#39'COMERCIAL'#39' AS IND_TIPO_PRODUTO,'
      '  '#39'ATIVO'#39' AS DESC_SITUACAO,'
      '  1 AS NUM_EMBALAGEM,'
      '  0 AS PERC_ISS,'
      '  0 AS PERC_INSS'
      'FROM'
      '  PRODUTOS P'
      'INNER JOIN GRUPOS G ON (P.GRUPO = G.CODIGO)'
      'ORDER BY'
      '  CODIGO'
      '')
    Params = <>
    Left = 48
    Top = 160
    object ZQProdutoSetadesc_produto: TStringField
      FieldName = 'desc_produto'
      Size = 50
    end
    object ZQProdutoSetacod_marca: TStringField
      FieldName = 'cod_marca'
      Size = 6
    end
    object ZQProdutoSetacod_fornecedor: TStringField
      FieldName = 'cod_fornecedor'
      Size = 6
    end
    object ZQProdutoSetanum_fabricante: TStringField
      FieldName = 'num_fabricante'
      Size = 15
    end
    object ZQProdutoSetadesc_complemento: TStringField
      FieldName = 'desc_complemento'
      Size = 50
    end
    object ZQProdutoSetaval_varejo: TFloatField
      FieldName = 'val_varejo'
    end
    object ZQProdutoSetaval_atacado: TFloatField
      FieldName = 'val_atacado'
    end
    object ZQProdutoSetadesc_unidade: TStringField
      FieldName = 'desc_unidade'
      Size = 2
    end
    object ZQProdutoSetadesc_ncm: TStringField
      FieldName = 'desc_ncm'
      Size = 8
    end
    object ZQProdutoSetacod_cest: TStringField
      FieldName = 'cod_cest'
      Size = 7
    end
    object ZQProdutoSetacod_tributacao: TIntegerField
      FieldName = 'cod_tributacao'
      ReadOnly = True
    end
    object ZQProdutoSetaind_tipo_produto: TStringField
      FieldName = 'ind_tipo_produto'
      ReadOnly = True
      Size = 255
    end
    object ZQProdutoSetadesc_situacao: TStringField
      FieldName = 'desc_situacao'
      ReadOnly = True
      Size = 255
    end
    object ZQProdutoSetanum_embalagem: TIntegerField
      FieldName = 'num_embalagem'
      ReadOnly = True
    end
    object ZQProdutoSetaperc_iss: TIntegerField
      FieldName = 'perc_iss'
      ReadOnly = True
    end
    object ZQProdutoSetaperc_inss: TIntegerField
      FieldName = 'perc_inss'
      ReadOnly = True
    end
    object ZQProdutoSetacodigo: TStringField
      FieldName = 'codigo'
      Required = True
      Size = 6
    end
    object ZQProdutoSetadesc_classe: TMemoField
      FieldName = 'desc_classe'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
end
