object DMProdutoSqlServer: TDMProdutoSqlServer
  OldCreateOrder = False
  Left = 807
  Top = 184
  Height = 217
  Width = 299
  object SSQProduto: TADOQuery
    Connection = DMSqlServer.ConexaoSqlServer
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '       [C'#243'digo produto] as COD_PRODUTO'
      '      ,[Descri'#231#227'o produto] as DESC_PRODUTO'
      '      ,[Unidade] as DESC_UNIDADE'
      '      ,[Tipo produto] as IND_TIPO_PRODUTO'
      '      ,[Codigo grupo] as COD_CLASSE'
      '      ,[Marca] as DESC_MARCA'
      '      ,[Ean] as DESC_COD_BARRA'
      '      ,[Referencia fornecedor] as NUM_FABRICANTE'
      '      ,[Custo unit'#225'rio] as VL_ULTIMO_CUSTO'
      '      ,[Custo medio] as VL_CUSTO_MEDIO'
      '      ,[Margem] as PERC_MARGEM_VAREJO'
      '      ,[Valor 1] as VAL_VAREJO'
      '      ,[Valor 2] as VAL_ATACADO'
      '      ,[Estoque] as QT_QUANTIDADE'
      '      ,[Ultima entrada] as QT_COMPRA'
      '      ,[Data ultima entrada] as DT_COMPRA'
      '      ,[Data ultima saida] as DT_VENDA'
      '      ,[Cst]'
      '      ,[Csosn]'
      '      ,[Cst pis] as COD_CST_PIS'
      '      ,[Ncm] as NUM_GENERO_NCM'
      '      ,[CEST] as COD_CEST'
      '      ,[Margem2] as PERC_MARGEM_ATACADO'
      '      ,[Similar] AS NUM_SIMILAR'
      '      ,[Similar] AS NUM_SIMILAR2'
      '      ,[Similar] AS NUM_SIMILAR3'
      '      ,[Similar] AS NUM_SIMILAR4'
      '  FROM [SIGIND].[dbo].[Produtos];'
      ' '
      ' '
      ' ')
    Left = 24
    Top = 16
    object SSQProdutoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object SSQProdutoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 100
    end
    object SSQProdutoDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 3
    end
    object SSQProdutoIND_TIPO_PRODUTO: TStringField
      FieldName = 'IND_TIPO_PRODUTO'
      Size = 13
    end
    object SSQProdutoCOD_CLASSE: TSmallintField
      FieldName = 'COD_CLASSE'
    end
    object SSQProdutoDESC_MARCA: TStringField
      FieldName = 'DESC_MARCA'
      Size = 30
    end
    object SSQProdutoDESC_COD_BARRA: TStringField
      FieldName = 'DESC_COD_BARRA'
      Size = 13
    end
    object SSQProdutoVL_ULTIMO_CUSTO: TBCDField
      FieldName = 'VL_ULTIMO_CUSTO'
      Precision = 12
      Size = 5
    end
    object SSQProdutoVL_CUSTO_MEDIO: TBCDField
      FieldName = 'VL_CUSTO_MEDIO'
      Precision = 12
      Size = 5
    end
    object SSQProdutoPERC_MARGEM_VAREJO: TBCDField
      FieldName = 'PERC_MARGEM_VAREJO'
      Precision = 10
    end
    object SSQProdutoVAL_VAREJO: TBCDField
      FieldName = 'VAL_VAREJO'
      Precision = 10
      Size = 2
    end
    object SSQProdutoVAL_ATACADO: TBCDField
      FieldName = 'VAL_ATACADO'
      Precision = 10
      Size = 2
    end
    object SSQProdutoQT_QUANTIDADE: TBCDField
      FieldName = 'QT_QUANTIDADE'
      Precision = 10
      Size = 2
    end
    object SSQProdutoQT_COMPRA: TBCDField
      FieldName = 'QT_COMPRA'
      Precision = 10
      Size = 2
    end
    object SSQProdutoDT_COMPRA: TDateTimeField
      FieldName = 'DT_COMPRA'
    end
    object SSQProdutoDT_VENDA: TDateTimeField
      FieldName = 'DT_VENDA'
    end
    object SSQProdutoCsosn: TStringField
      FieldName = 'Csosn'
      Size = 3
    end
    object SSQProdutoCOD_CST_PIS: TStringField
      FieldName = 'COD_CST_PIS'
      Size = 2
    end
    object SSQProdutoNUM_GENERO_NCM: TStringField
      FieldName = 'NUM_GENERO_NCM'
      Size = 8
    end
    object SSQProdutoCOD_CEST: TStringField
      FieldName = 'COD_CEST'
      Size = 7
    end
    object SSQProdutoPERC_MARGEM_ATACADO: TBCDField
      FieldName = 'PERC_MARGEM_ATACADO'
      Precision = 10
    end
    object SSQProdutoCst: TStringField
      FieldName = 'Cst'
      Size = 3
    end
    object SSQProdutoNUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
    end
    object SSQProdutoNUM_SIMILAR: TStringField
      FieldName = 'NUM_SIMILAR'
    end
    object SSQProdutoNUM_SIMILAR2: TStringField
      FieldName = 'NUM_SIMILAR2'
    end
    object SSQProdutoNUM_SIMILAR3: TStringField
      FieldName = 'NUM_SIMILAR3'
    end
    object SSQProdutoNUM_SIMILAR4: TStringField
      FieldName = 'NUM_SIMILAR4'
    end
  end
  object SSQProdutoRelacionado: TADOQuery
    Connection = DMSqlServer.ConexaoSqlServer
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT [C'#243'digo produto] as COD_PRODUTO'
      '      ,[Descri'#231#227'o produto] as DESC_PRODUTO'
      '      ,[Referencia fornecedor] as REF_FORNECEDOR'
      '      ,[Referencia] as COD_NUM_FABRICANTE'
      '      ,[Similar] AS COD_PRODUTO_FILHO'
      '  FROM [SIGIND].[dbo].[Produtos]'
      '  where [Similar] <> '#39#39)
    Left = 112
    Top = 32
    object SSQProdutoRelacionadoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object SSQProdutoRelacionadoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 100
    end
    object SSQProdutoRelacionadoREF_FORNECEDOR: TStringField
      FieldName = 'REF_FORNECEDOR'
    end
    object SSQProdutoRelacionadoCOD_NUM_FABRICANTE: TStringField
      FieldName = 'COD_NUM_FABRICANTE'
    end
    object SSQProdutoRelacionadoCOD_PRODUTO_FILHO: TStringField
      FieldName = 'COD_PRODUTO_FILHO'
    end
  end
end
