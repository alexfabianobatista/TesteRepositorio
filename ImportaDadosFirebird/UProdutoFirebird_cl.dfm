object DMProdutoFirebird: TDMProdutoFirebird
  OldCreateOrder = False
  Left = 462
  Top = 256
  Height = 383
  Width = 616
  object ZQProduto: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  P.PROCODIGO AS COD_PRODUTO,'
      '  P.PROCODBARRA AS DESC_COD_BARRA,'
      '  COALESCE(P.GRUCODIGO,19) AS NUM_SUBGRUPO,'
      '  P.MARCODIGO AS COD_MARCA,'
      '  P.PROATIVO AS IND_SITUACAO,'
      '  P.FORCODIGO AS COD_CADASTRO,'
      '  P.PRODESC AS DESC_PRODUTO,'
      '  P.PROCLFISC AS NUM_GENERO_NCM,'
      '  P.PROPESO AS NUM_PESO_BRUTO,'
      '  P.PROUNDFATOR AS NUM_EMBALAGEM,'
      '  P.PRONRFABRIC AS NUM_FABRICANTE,'
      '  P.PROUNDVEND AS DESC_UNIDADE,'
      '  E.ESTPRECO AS VAL_VAREJO,'
      '  E.ESTMARGFIXA AS PERC_MARGEM_VAREJO'
      ''
      'FROM'
      '  TBPRODUTOS P,'
      '  TBESTOQUE E'
      'WHERE'
      '  P.PROCODIGO = E.PROCODIGO')
    Params = <>
    Left = 24
    Top = 16
    object ZQProdutoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object ZQProdutoNUM_SUBGRUPO: TIntegerField
      FieldName = 'NUM_SUBGRUPO'
    end
    object ZQProdutoCOD_MARCA: TIntegerField
      FieldName = 'COD_MARCA'
    end
    object ZQProdutoIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 1
    end
    object ZQProdutoCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object ZQProdutoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 50
    end
    object ZQProdutoNUM_GENERO_NCM: TStringField
      FieldName = 'NUM_GENERO_NCM'
      Size = 10
    end
    object ZQProdutoNUM_PESO_BRUTO: TFloatField
      FieldName = 'NUM_PESO_BRUTO'
    end
    object ZQProdutoNUM_EMBALAGEM: TFloatField
      FieldName = 'NUM_EMBALAGEM'
    end
    object ZQProdutoNUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
      Size = 15
    end
    object ZQProdutoDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 3
    end
    object ZQProdutoVAL_VAREJO: TFloatField
      FieldName = 'VAL_VAREJO'
    end
    object ZQProdutoPERC_MARGEM_VAREJO: TFloatField
      FieldName = 'PERC_MARGEM_VAREJO'
    end
    object ZQProdutoDESC_COD_BARRA: TStringField
      FieldName = 'DESC_COD_BARRA'
      Required = True
      Size = 13
    end
  end
  object DSProduto: TDataSource
    DataSet = ZQProduto
    Left = 88
    Top = 16
  end
  object ZQEstoque: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  PROCODIGO AS COD_PRODUTO,'
      '  ESTCUSTO AS VAL_CUSTO,'
      '  ESTVENDA AS QT_ESTOQUE,'
      '  ESTMINIMO AS QT_MINIMO'
      'FROM'
      '  TBESTOQUE'
      '')
    Params = <>
    Left = 152
    Top = 16
    object ZQEstoqueCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object ZQEstoqueVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
    end
    object ZQEstoqueQT_ESTOQUE: TFloatField
      FieldName = 'QT_ESTOQUE'
    end
    object ZQEstoqueQT_MINIMO: TFloatField
      FieldName = 'QT_MINIMO'
    end
  end
  object ZQQt_Estoque: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  COD_PRODUTO COD_PRODUTO,'
      '  QDE_ESTOQUE QT_QUANTIDADE,'
      '  VAL_CUSTO VAL_CUSTO,'
      '  QDE_MINIMA QT_MINIMO'
      'FROM'
      '  TBLJ_ESTOQUE'
      'ORDER BY'
      '  COD_PRODUTO'
      '')
    Params = <>
    Left = 224
    Top = 16
    object ZQQt_EstoqueCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object ZQQt_EstoqueQT_QUANTIDADE: TIntegerField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object ZQQt_EstoqueVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
      Required = True
    end
    object ZQQt_EstoqueQT_MINIMO: TIntegerField
      FieldName = 'QT_MINIMO'
      Required = True
    end
  end
  object ZQMarca: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  MARCODIGO,'
      '  MARNOME'
      'FROM'
      '  TBMARCA')
    Params = <>
    Left = 304
    Top = 16
    object ZQMarcaMARCODIGO: TIntegerField
      FieldName = 'MARCODIGO'
      Required = True
    end
    object ZQMarcaMARNOME: TStringField
      FieldName = 'MARNOME'
      Required = True
      Size = 30
    end
  end
  object ZQProdutoAtenas: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  P.COD_PRODUTO,'
      '  P.DESC_PRODUTO,'
      '  F.VLR_PRODUTO AS VAL_VAREJO,'
      '  p.COD_NCM AS NUM_GENERO_NCM,'
      '  P.DESC_UNIDADE,'
      '  P.IND_SITUACAO,'
      '  F.VAL_CUSTO,'
      '  F.QDE_ESTOQUE,'
      '  F.COD_FILIAL,'
      '/*  B.COD_CODBARRAS_AMARRADO AS DESC_COD_BARRA,*/'
      
        '  '#39'NUMERO: '#39' || P.DESC_NUMERO || '#39' COLECAO: '#39' || P.DESC_COLECAO ' +
        '||'
      '  '#39' MODELO: '#39' || P.DESC_MODELO AS DESC_OBSERVACAO,'
      '  P.DESC_MARCA,'
      '  P.REFERENCIA,'
      '  P.DESC_GTIN AS DESC_COD_BARRA,'
      '  P.IND_CEST AS COD_CEST'
      'FROM'
      '  TBLJ_PRODUTO AS P'
      '/*LEFT JOIN'
      '  TBLJ_CODBARRAS_PRODUTO AS B ON P.COD_PRODUTO = B.COD_PRODUTO*/'
      'inner JOIN'
      '  TBLJ_PRODUTO_FILIAL AS F ON F.COD_FILIAL = P.COD_FILIAL'
      'AND F.COD_PRODUTO = P.COD_PRODUTO'
      'AND (P.IND_SITUACAO IS NULL or P.IND_SITUACAO = '#39'ATIVO'#39')'
      '/*AND'
      '  f.COD_PRODUTO > 88814*/'
      'order by P.COD_PRODUTO')
    Params = <>
    Left = 40
    Top = 96
    object ZQProdutoAtenasCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object ZQProdutoAtenasDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Required = True
      Size = 500
    end
    object ZQProdutoAtenasVAL_VAREJO: TFloatField
      FieldName = 'VAL_VAREJO'
      Required = True
    end
    object ZQProdutoAtenasNUM_GENERO_NCM: TStringField
      FieldName = 'NUM_GENERO_NCM'
      Size = 30
    end
    object ZQProdutoAtenasDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 10
    end
    object ZQProdutoAtenasIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 10
    end
    object ZQProdutoAtenasVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
      Required = True
    end
    object ZQProdutoAtenasDESC_COD_BARRA: TStringField
      FieldName = 'DESC_COD_BARRA'
      Required = True
      Size = 50
    end
    object ZQProdutoAtenasDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      ReadOnly = True
      Size = 242
    end
    object ZQProdutoAtenasDESC_MARCA: TStringField
      FieldName = 'DESC_MARCA'
      Size = 100
    end
    object ZQProdutoAtenasREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object ZQProdutoAtenasQDE_ESTOQUE: TFloatField
      FieldName = 'QDE_ESTOQUE'
      Required = True
    end
    object ZQProdutoAtenasCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object ZQProdutoAtenasCOD_CEST: TStringField
      FieldName = 'COD_CEST'
      Size = 12
    end
  end
  object ZQMarcaIntelic: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  NOME'
      'FROM'
      '  MARCA')
    Params = <>
    Left = 526
    Top = 3
    object ZQMarcaIntelicCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ZQMarcaIntelicNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
  object ZQClasseIntelic: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      ' CODIGO,'
      ' UPPER(GRUPO) AS GRUPO'
      'FROM'
      '  PRODGRUPOS'
      'ORDER BY CODIGO')
    Params = <>
    Left = 526
    Top = 51
    object ZQClasseIntelicCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ZQClasseIntelicGRUPO: TStringField
      FieldName = 'GRUPO'
      ReadOnly = True
      Size = 50
    end
  end
  object ZQProdutoIntelic: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  PROD.CODIGO,'
      '  CODEMP,'
      '  UPPER(MERCADORIA) AS MERCADORIA,'
      
        '  (SELECT PRECO_FINAL FROM MERCADORIAS_LISTA_PRECOS LISTA1 WHERE' +
        ' LISTA1.codigo_mercadorias = prod.codigo'
      '          AND LISTA1.codigo_lista_preco = 1) AS VAREJO,'
      
        '  (SELECT PRECO_FINAL FROM MERCADORIAS_LISTA_PRECOS LISTA3 WHERE' +
        ' LISTA3.codigo_mercadorias = prod.codigo AND'
      '            LISTA3.codigo_lista_preco = 3) AS ATACADO,'
      '  UPPER(CODFAB) AS CODFAB,'
      '  UPPER(UNIDADEDESC) AS UNIDADEDESC,'
      '  UPPER(OBS) AS OBS,'
      '  UPPER(MARCA)AS MARCA,'
      '  DT_INSERT,'
      '  CODIGO_NCM,'
      '  CEST,'
      '  COMPRIMENTO,'
      '  LARGURA,'
      '  PESO_LIQUIDO,'
      '  PESO_BRUTO,'
      '  LOCALIZACAO,'
      '  CODIGO_FORNECEDOR,'
      '  CODIGO_GRUPO,'
      '  CUSTO,'
      '  MST.CODIGO_SITUACAO_TRIBUTARIA'
      'FROM'
      ' MERCADORIAS PROD'
      'LEFT JOIN'
      '  MERCADORIA_SITUACAO_TRIBUTARIA MST ON PROD.CODIGO = MST.CODIGO'
      'ORDER BY CODIGO')
    Params = <>
    Left = 526
    Top = 99
    object ZQProdutoIntelicCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ZQProdutoIntelicCODEMP: TStringField
      FieldName = 'CODEMP'
    end
    object ZQProdutoIntelicMERCADORIA: TStringField
      FieldName = 'MERCADORIA'
      ReadOnly = True
      Size = 250
    end
    object ZQProdutoIntelicVAREJO: TFloatField
      FieldName = 'VAREJO'
      ReadOnly = True
    end
    object ZQProdutoIntelicCODFAB: TStringField
      FieldName = 'CODFAB'
      ReadOnly = True
    end
    object ZQProdutoIntelicUNIDADEDESC: TStringField
      FieldName = 'UNIDADEDESC'
      ReadOnly = True
      Size = 50
    end
    object ZQProdutoIntelicOBS: TMemoField
      FieldName = 'OBS'
      ReadOnly = True
      BlobType = ftMemo
    end
    object ZQProdutoIntelicMARCA: TStringField
      FieldName = 'MARCA'
      ReadOnly = True
      Size = 50
    end
    object ZQProdutoIntelicDT_INSERT: TDateTimeField
      FieldName = 'DT_INSERT'
    end
    object ZQProdutoIntelicCODIGO_NCM: TStringField
      FieldName = 'CODIGO_NCM'
      Size = 15
    end
    object ZQProdutoIntelicCEST: TStringField
      FieldName = 'CEST'
    end
    object ZQProdutoIntelicCOMPRIMENTO: TFloatField
      FieldName = 'COMPRIMENTO'
    end
    object ZQProdutoIntelicLARGURA: TFloatField
      FieldName = 'LARGURA'
    end
    object ZQProdutoIntelicPESO_LIQUIDO: TFloatField
      FieldName = 'PESO_LIQUIDO'
    end
    object ZQProdutoIntelicPESO_BRUTO: TFloatField
      FieldName = 'PESO_BRUTO'
    end
    object ZQProdutoIntelicLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      Size = 200
    end
    object ZQProdutoIntelicCODIGO_FORNECEDOR: TIntegerField
      FieldName = 'CODIGO_FORNECEDOR'
    end
    object ZQProdutoIntelicCODIGO_GRUPO: TIntegerField
      FieldName = 'CODIGO_GRUPO'
    end
    object ZQProdutoIntelicCUSTO: TFloatField
      FieldName = 'CUSTO'
    end
    object ZQProdutoIntelicATACADO: TFloatField
      FieldName = 'ATACADO'
      ReadOnly = True
    end
    object ZQProdutoIntelicCODIGO_SITUACAO_TRIBUTARIA: TIntegerField
      FieldName = 'CODIGO_SITUACAO_TRIBUTARIA'
    end
  end
  object ZQEStoqueINTELIC: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  1 AS COD_FILIAL,'
      '  1 AS COD_LOTE_TIPO,'
      '  PROD.CODIGO,'
      '  CUSTO,'
      '  EST.SALDO_ESTOQUE,'
      '  EST.INVENTARIO,'
      '  DT_UPDATE'
      'FROM'
      ' MERCADORIAS PROD'
      'LEFT JOIN'
      ' MERCADORIAS_ESTOQUE EST ON PROD.CODIGO = EST.CODIGO_MERCADORIA'
      'ORDER BY CODIGO')
    Params = <>
    Left = 526
    Top = 147
    object ZQEStoqueINTELICCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      ReadOnly = True
    end
    object ZQEStoqueINTELICCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
      ReadOnly = True
    end
    object ZQEStoqueINTELICCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ZQEStoqueINTELICCUSTO: TFloatField
      FieldName = 'CUSTO'
    end
    object ZQEStoqueINTELICSALDO_ESTOQUE: TFloatField
      FieldName = 'SALDO_ESTOQUE'
    end
    object ZQEStoqueINTELICDT_UPDATE: TDateTimeField
      FieldName = 'DT_UPDATE'
    end
    object ZQEStoqueINTELICINVENTARIO: TFloatField
      FieldName = 'INVENTARIO'
    end
  end
  object ZQTabelaPrecoIntelitec: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  CODIGO_MERCADORIAS,'
      '  CODIGO_LISTA_PRECO,'
      '  PRECO_FINAL'
      'FROM'
      '  MERCADORIAS_LISTA_PRECOS'
      'ORDER BY CODIGO_LISTA_PRECO')
    Params = <>
    Left = 430
    Top = 115
    object ZQTabelaPrecoIntelitecCODIGO_MERCADORIAS: TIntegerField
      FieldName = 'CODIGO_MERCADORIAS'
      Required = True
    end
    object ZQTabelaPrecoIntelitecCODIGO_LISTA_PRECO: TIntegerField
      FieldName = 'CODIGO_LISTA_PRECO'
      Required = True
    end
    object ZQTabelaPrecoIntelitecPRECO_FINAL: TFloatField
      FieldName = 'PRECO_FINAL'
    end
  end
  object ZQMarcaAtenas: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  DISTINCT'
      '  P.DESC_MARCA'
      'FROM'
      '  TBLJ_PRODUTO AS P'
      'WHERE'
      '  P.DESC_MARCA IS NOT NULL'
      'AND'
      '  P.DESC_MARCA <> '#39#39
      'ORDER BY P.DESC_MARCA')
    Params = <>
    Left = 40
    Top = 152
    object ZQMarcaAtenasDESC_MARCA: TStringField
      FieldName = 'DESC_MARCA'
      Size = 100
    end
  end
  object ZQEstoqueAtenas: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  PF.COD_FILIAL,'
      '  PF.COD_PRODUTO,'
      '  PF.QDE_ESTOQUE,'
      '  PF.VAL_CUSTO,'
      '  P.IND_SITUACAO'
      'FROM'
      '  TBLJ_PRODUTO_FILIAL PF, tblj_produto P'
      'WHERE'
      '  PF.COD_PRODUTO = P.COD_PRODUTO'
      'AND'
      ' (P.IND_SITUACAO IS NULL or P.IND_SITUACAO = '#39'ATIVO'#39')'
      'ORDER BY COD_PRODUTO')
    Params = <>
    Left = 136
    Top = 96
    object ZQEstoqueAtenasCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object ZQEstoqueAtenasCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object ZQEstoqueAtenasQDE_ESTOQUE: TFloatField
      FieldName = 'QDE_ESTOQUE'
      Required = True
    end
    object ZQEstoqueAtenasVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
      Required = True
    end
    object ZQEstoqueAtenasIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 10
    end
  end
  object ZQMarcaRetifoz: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  CODIGO AS COD_MARCA,'
      '  UPPER(NOME) AS DESC_MARCA'
      'FROM'
      '  CAD_MARCAS'
      'ORDER BY'
      '  CODIGO')
    Params = <>
    Left = 56
    Top = 240
    object ZQMarcaRetifozCOD_MARCA: TIntegerField
      FieldName = 'COD_MARCA'
      Required = True
    end
    object ZQMarcaRetifozDESC_MARCA: TStringField
      FieldName = 'DESC_MARCA'
      ReadOnly = True
      Size = 50
    end
  end
  object ZQClasseRetifoz: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  UPPER(NOME) AS NOME,'
      '  CLASSIFICACAO'
      'FROM'
      '  CAD_SETORES'
      'ORDER BY CODIGO')
    Params = <>
    Left = 56
    Top = 288
    object ZQClasseRetifozCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ZQClasseRetifozNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object ZQClasseRetifozCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      Required = True
      Size = 40
    end
  end
  object ZQProdutoRetifoz: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  PRODUTO.CODIGO AS COD_PRODUTO,'
      '  UPPER(PRODUTO.NOME) AS DESC_PRODUTO,'
      '  UPPER(PRODUTO.NOME_REDUZIDO) AS DESC_PRODUTO_REDUZIDO,'
      '  PRODUTO.MARCA AS COD_MARCA,'
      '  PRODUTO.SETOR AS COD_CLASSE,'
      '  PRODUTO.REFERENCIA AS NUM_FABRICANTE,'
      '  PRODUTO.IPI AS PERC_IPI,'
      '  PRODUTO.COD_CEST AS COD_CEST,'
      '  PRODUTO.ATIVO AS IND_SITUACAO ,'
      '  PRODUTO.SUBST_TRIBUTARIA AS IND_SUBST_TRIB,'
      '  PRODUTO.TIPO_ITEM_SPED AS COD_TIPO_PRODUTO,'
      '  PRODUTO.TIPO_PRODUTO AS IND_TIPO_PRODUTO,'
      '  PRODUTO.ALIQ_ISSQN AS PERC_ISS,'
      '  PRODUTO.CODIGO_SERVICO AS COD_ORDEM_SERVICO,'
      '  PRODUTO.PESO_BRUTO AS NUM_PESO_BRUTO,'
      '  PRODUTO.PESO_ITEM AS NUM_PESO_LIQUIDO,'
      '  PRODUTO.SPED_TIPO_SERVICO AS COD_LISTA_SERVICO,'
      '  PRODUTO.SPED_TIPO_SERVICO AS COD_SERVICO_MUNICIPAL,'
      
        '  PRODUTO.APLICACAO || '#39'-'#39' || PRODUTO.OBSERVACAO AS DESC_OBSERVA' +
        'CAO,'
      '  PRODUTOPRECO.PERC,'
      '  PRODUTOPRECO.TABELA_PRECO,'
      '  PRODUTOPRECO.PRECO AS VAL_VAREJO,'
      '  PRODUTOPRECO.PRECO AS VAL_ATACADO,'
      '  CLASSIFICACAONCM.NOME AS NUM_GENERO_NCM,'
      '  PRODUTOUNIDADE.NOME_REDUZIDO AS DESC_UNIDADE,'
      '  PRODUTOTRIBUTACAO.TAB_TRIB AS COD_TRIBUTACAO,'
      '  PRODUTODEP.LOCACAO AS COD_LOCALIZACAO,'
      '  UPPER(DEPOSITOLOC.DESCRICAO) AS DESC_LOCALIZACAO'
      'FROM CAD_PRODUTOS PRODUTO'
      'LEFT JOIN CAD_PRODUTOS_PRECOS PRODUTOPRECO ON ('
      '      PRODUTO.CODIGO = PRODUTOPRECO.CODIGO AND'
      '      PRODUTOPRECO.TABELA_PRECO = 1 AND'
      '      PRODUTOPRECO.EMPRESA = PRODUTO.EMPRESA AND'
      '      PRODUTOPRECO.ESTABELEC = PRODUTO.ESTABELEC)'
      'LEFT JOIN CAD_CLASSIF_FISCAL CLASSIFICACAONCM ON ('
      '      PRODUTO.CLASSIF_FISCAL   = CLASSIFICACAONCM.CODIGO AND'
      '      CLASSIFICACAONCM.EMPRESA = PRODUTO.EMPRESA AND'
      '      CLASSIFICACAONCM.ESTABELEC = PRODUTO.ESTABELEC )'
      'INNER JOIN CAD_UNIDADES PRODUTOUNIDADE ON ('
      '      PRODUTO.UNIDADE        = PRODUTOUNIDADE.CODIGO AND'
      '      PRODUTOUNIDADE.EMPRESA = PRODUTO.EMPRESA       AND'
      '      PRODUTOUNIDADE.ESTABELEC = PRODUTO.ESTABELEC)'
      'LEFT JOIN CAD_PRODUTOS_TAB_TRIB PRODUTOTRIBUTACAO ON ('
      '      PRODUTO.CODIGO = PRODUTOTRIBUTACAO.CODIGO AND'
      '      PRODUTOTRIBUTACAO.EMPRESA   = PRODUTO.EMPRESA AND'
      '      PRODUTOTRIBUTACAO.ESTABELEC = PRODUTO.ESTABELEC)'
      'LEFT JOIN CAD_PRODUTOS_DEPOSITOS PRODUTODEP ON ('
      '      PRODUTO.CODIGO = PRODUTODEP.CODIGO AND'
      '      PRODUTO.EMPRESA = PRODUTODEP.EMPRESA)'
      'LEFT JOIN CAD_DEPOSITOS_LOCACOES DEPOSITOLOC ON ('
      '      PRODUTODEP.LOCACAO = DEPOSITOLOC.SEQUENCIA AND'
      '      PRODUTODEP.EMPRESA = DEPOSITOLOC.EMPRESA AND'
      '      DEPOSITOLOC.CODIGO = 1)'
      'WHERE PRODUTO.CODIGO >= 20000')
    Params = <>
    Left = 168
    Top = 224
    object ZQProdutoRetifozCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object ZQProdutoRetifozDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      ReadOnly = True
      Size = 80
    end
    object ZQProdutoRetifozDESC_PRODUTO_REDUZIDO: TStringField
      FieldName = 'DESC_PRODUTO_REDUZIDO'
      ReadOnly = True
      Size = 50
    end
    object ZQProdutoRetifozCOD_MARCA: TIntegerField
      FieldName = 'COD_MARCA'
      Required = True
    end
    object ZQProdutoRetifozCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object ZQProdutoRetifozNUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
    end
    object ZQProdutoRetifozPERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
    end
    object ZQProdutoRetifozCOD_CEST: TStringField
      FieldName = 'COD_CEST'
      Size = 7
    end
    object ZQProdutoRetifozIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 1
    end
    object ZQProdutoRetifozIND_SUBST_TRIB: TStringField
      FieldName = 'IND_SUBST_TRIB'
      Size = 1
    end
    object ZQProdutoRetifozCOD_TIPO_PRODUTO: TStringField
      FieldName = 'COD_TIPO_PRODUTO'
      Required = True
      Size = 2
    end
    object ZQProdutoRetifozIND_TIPO_PRODUTO: TStringField
      FieldName = 'IND_TIPO_PRODUTO'
      Size = 1
    end
    object ZQProdutoRetifozPERC_ISS: TFloatField
      FieldName = 'PERC_ISS'
    end
    object ZQProdutoRetifozCOD_ORDEM_SERVICO: TIntegerField
      FieldName = 'COD_ORDEM_SERVICO'
    end
    object ZQProdutoRetifozNUM_PESO_BRUTO: TFloatField
      FieldName = 'NUM_PESO_BRUTO'
    end
    object ZQProdutoRetifozNUM_PESO_LIQUIDO: TFloatField
      FieldName = 'NUM_PESO_LIQUIDO'
    end
    object ZQProdutoRetifozCOD_LISTA_SERVICO: TStringField
      FieldName = 'COD_LISTA_SERVICO'
      Size = 10
    end
    object ZQProdutoRetifozCOD_SERVICO_MUNICIPAL: TStringField
      FieldName = 'COD_SERVICO_MUNICIPAL'
      Size = 10
    end
    object ZQProdutoRetifozDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      ReadOnly = True
      Size = 2001
    end
    object ZQProdutoRetifozPERC: TFloatField
      FieldName = 'PERC'
    end
    object ZQProdutoRetifozTABELA_PRECO: TSmallintField
      FieldName = 'TABELA_PRECO'
      Required = True
    end
    object ZQProdutoRetifozVAL_VAREJO: TFloatField
      FieldName = 'VAL_VAREJO'
    end
    object ZQProdutoRetifozVAL_ATACADO: TFloatField
      FieldName = 'VAL_ATACADO'
    end
    object ZQProdutoRetifozNUM_GENERO_NCM: TStringField
      FieldName = 'NUM_GENERO_NCM'
      Required = True
      Size = 50
    end
    object ZQProdutoRetifozDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 10
    end
    object ZQProdutoRetifozCOD_TRIBUTACAO: TIntegerField
      FieldName = 'COD_TRIBUTACAO'
    end
    object ZQProdutoRetifozCOD_LOCALIZACAO: TSmallintField
      FieldName = 'COD_LOCALIZACAO'
      Required = True
    end
    object ZQProdutoRetifozDESC_LOCALIZACAO: TStringField
      FieldName = 'DESC_LOCALIZACAO'
      ReadOnly = True
      Size = 50
    end
  end
  object ZQEstoqueRetifoz: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  ESTOQUE.EMPRESA AS COD_FILIAL,'
      '  ESTOQUE.PRODUTO AS COD_PRODUTO,'
      '  ESTOQUE.QTD_EMPRESA,'
      '  PRODUTO.CUSTO_BRUTO AS VL_ULTIMO_CUSTO,'
      '  PRODUTO.CUSTO_LIQUIDO AS VL_CUSTO_MEDIO'
      'FROM'
      '   CAD_PRODUTOS PRODUTO, EST_ESTOQUES ESTOQUE'
      'WHERE'
      '  ESTOQUE.PRODUTO = PRODUTO.CODIGO'
      'AND'
      '  ESTOQUE.EMPRESA = PRODUTO.EMPRESA')
    Params = <>
    Left = 168
    Top = 272
    object ZQEstoqueRetifozCOD_FILIAL: TSmallintField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object ZQEstoqueRetifozCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object ZQEstoqueRetifozQTD_EMPRESA: TFloatField
      FieldName = 'QTD_EMPRESA'
    end
    object ZQEstoqueRetifozVL_ULTIMO_CUSTO: TFloatField
      FieldName = 'VL_ULTIMO_CUSTO'
    end
    object ZQEstoqueRetifozVL_CUSTO_MEDIO: TFloatField
      FieldName = 'VL_CUSTO_MEDIO'
    end
  end
  object ZQProdutoRelacionadoRetifoz: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  PRODUTOSIMILAR.CODIGO AS COD_PRODUTO_PRINCIPAL,'
      '  PRODUTOSIMILAR.PRODUTO AS COD_PRODUTO_SIMILAR'
      'FROM'
      '  CAD_PRODUTOS_SIMILARES PRODUTOSIMILAR')
    Params = <>
    Left = 256
    Top = 200
    object ZQProdutoRelacionadoRetifozCOD_PRODUTO_PRINCIPAL: TIntegerField
      FieldName = 'COD_PRODUTO_PRINCIPAL'
      Required = True
    end
    object ZQProdutoRelacionadoRetifozCOD_PRODUTO_SIMILAR: TIntegerField
      FieldName = 'COD_PRODUTO_SIMILAR'
      Required = True
    end
  end
  object ZQProdutoSGB: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  PRODUTO AS DESC_PRODUTO,'
      '  UNIDADE AS DESC_UNIDADE,'
      '  PRECOVENDA AS VAL_VAREJO,'
      '  NCM AS NUM_GENERO_NCM,'
      '  1 AS COD_TRIBUTACAO,'
      '  112 AS COD_CLASSE'
      'from'
      '  TESTOQUE'
      'ORDER BY'
      '  DESC_PRODUTO')
    Params = <>
    Left = 432
    Top = 248
    object ZQProdutoSGBDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Required = True
      Size = 100
    end
    object ZQProdutoSGBDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Required = True
      Size = 6
    end
    object ZQProdutoSGBVAL_VAREJO: TFloatField
      FieldName = 'VAL_VAREJO'
      Required = True
    end
    object ZQProdutoSGBNUM_GENERO_NCM: TStringField
      FieldName = 'NUM_GENERO_NCM'
      Size = 50
    end
    object ZQProdutoSGBCOD_TRIBUTACAO: TIntegerField
      FieldName = 'COD_TRIBUTACAO'
      ReadOnly = True
    end
    object ZQProdutoSGBCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      ReadOnly = True
    end
  end
  object ZQProdutoMHNFE: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  ID AS COD_PRODUTO,'
      '  UPPER(DESCRICAO) AS DESC_PRODUTO,'
      '  NCM AS NUM_GENERO_NCM,'
      '  UPPER(UNIDADE) AS DESC_UNIDADE,'
      '  '#39'COMERCIAL'#39' AS IND_TIPO_PRODUTO,'
      '  6 AS COD_CLASSE,'
      '  PRECO AS VAL_VAREJO,'
      '  PESOL AS NUM_PESO_LIQUIDO,'
      '  PESOB AS NUM_PESO_BRUTO,'
      '  0 AS PERC_INSS,'
      '  0 AS PERC_ISS,'
      '  1 COD_TRIBUTACAO'
      'FROM'
      '  PRODUTO')
    Params = <>
    Left = 336
    Top = 272
    object ZQProdutoMHNFECOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object ZQProdutoMHNFEDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      ReadOnly = True
      Size = 400
    end
    object ZQProdutoMHNFENUM_GENERO_NCM: TStringField
      FieldName = 'NUM_GENERO_NCM'
      Size = 10
    end
    object ZQProdutoMHNFEDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      ReadOnly = True
      Size = 10
    end
    object ZQProdutoMHNFEIND_TIPO_PRODUTO: TStringField
      FieldName = 'IND_TIPO_PRODUTO'
      ReadOnly = True
      Size = 9
    end
    object ZQProdutoMHNFECOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      ReadOnly = True
    end
    object ZQProdutoMHNFEVAL_VAREJO: TFloatField
      FieldName = 'VAL_VAREJO'
    end
    object ZQProdutoMHNFENUM_PESO_LIQUIDO: TFloatField
      FieldName = 'NUM_PESO_LIQUIDO'
    end
    object ZQProdutoMHNFENUM_PESO_BRUTO: TFloatField
      FieldName = 'NUM_PESO_BRUTO'
    end
    object ZQProdutoMHNFEPERC_INSS: TIntegerField
      FieldName = 'PERC_INSS'
      ReadOnly = True
    end
    object ZQProdutoMHNFEPERC_ISS: TIntegerField
      FieldName = 'PERC_ISS'
      ReadOnly = True
    end
    object ZQProdutoMHNFECOD_TRIBUTACAO: TIntegerField
      FieldName = 'COD_TRIBUTACAO'
      ReadOnly = True
    end
  end
end
