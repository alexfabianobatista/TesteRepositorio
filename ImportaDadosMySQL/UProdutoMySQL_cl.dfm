object DMProdutoMySQL: TDMProdutoMySQL
  OldCreateOrder = False
  Left = 557
  Top = 295
  Height = 254
  Width = 481
  object ZQProduto: TZQuery
    Connection = DMMySQL.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  T.PRO_CODIGO,'
      '  T.PRO_DESCRICAO,'
      '  T.PRO_UNIDADE,'
      '  T.PRO_PESOBRUTO,'
      '  T.PRO_PESOLIQUIDO,'
      '  T.PRO_COMISSAO,'
      '  T.PRO_PERCIPI,'
      '  T.PRO_PIS,'
      '  T.PRO_COFINS,'
      '  T.PRO_ATIVO,'
      '  T.PRO_DATACAD,'
      '  T.SBGR_CODIGO,'
      '  T.PRO_INDUSTRIALIZADO,'
      '  T.PRO_ISS,'
      '  T.TRIBIPI_CODIGO,'
      '  T.TRIBPIS_CODIGO,'
      '  T.TRIBCOFINS_CODIGO,'
      '  T.PRO_PERCISS,'
      '  T.PRO_NATRECEITA,'
      '  T.GRU_CODIGO,'
      '  T.PRO_NCM,'
      '  T.CEST_CODIGO,'
      '  T.PRO_CODBARRA,'
      '  SUM(T.VAL_VAREJO) AS  VAL_VAREJO,'
      '  SUM(T.VAL_ATACADO) AS VAL_ATACADO'
      'FROM ('
      '  SELECT'
      '  P.PRO_CODIGO,'
      '  P.PRO_DESCRICAO,'
      '  EMB.EMB_UNIDADE AS PRO_UNIDADE,'
      '  P.PRO_PESOBRUTO,'
      '  P.PRO_PESOLIQUIDO,'
      '  P.PRO_COMISSAO,'
      '  P.PRO_PERCIPI,'
      '  P.PRO_PIS,'
      '  P.PRO_COFINS,'
      '  P.PRO_ATIVO,'
      '  P.PRO_DATACAD,'
      '  P.SBGR_CODIGO,'
      '  P.PRO_INDUSTRIALIZADO,'
      '  P.PRO_ISS,'
      '  P.TRIBIPI_CODIGO,'
      '  P.TRIBPIS_CODIGO,'
      '  P.TRIBCOFINS_CODIGO,'
      '  P.PRO_PERCISS,'
      '  P.PRO_NATRECEITA,'
      '  P.GRU_CODIGO,'
      '  COMPL.PRO_NCM,'
      '  COMPL.CEST_CODIGO,'
      '  CODBAR.PRO_CODBARRA,'
      '  0 AS VAL_VAREJO,'
      '  0 AS VAL_ATACADO'
      'FROM'
      '  PRODCOMPLEMENTO COMPL,'
      
        '  PRODUTOS P LEFT JOIN PRODCODBARRAS CODBAR ON P.PRO_CODIGO = CO' +
        'DBAR.Pro_Codigo'
      '  LEFT JOIN PRODEMBALAGEM EMB ON P.PRO_CODIGO = EMB.PRO_CODIGO'
      'where'
      '  P.PRO_CODIGO = COMPL.PRO_CODIGO'
      '  AND'
      '  EMB.FIL_CODIGO = 1'
      '  AND'
      '  EMB.EMB_UNIDADEPADRAO = '#39'S'#39
      'GROUP BY'
      '  P.PRO_CODIGO,'
      '  P.PRO_DESCRICAO,'
      '  EMB.EMB_UNIDADE,'
      '  P.PRO_PESOBRUTO,'
      '  P.PRO_PESOLIQUIDO,'
      '  P.PRO_COMISSAO,'
      '  P.PRO_PERCIPI,'
      '  P.PRO_PIS,'
      '  P.PRO_COFINS,'
      '  P.PRO_ATIVO,'
      '  P.PRO_DATACAD,'
      '  P.SBGR_CODIGO,'
      '  P.PRO_INDUSTRIALIZADO,'
      '  P.PRO_ISS,'
      '  P.TRIBIPI_CODIGO,'
      '  P.TRIBPIS_CODIGO,'
      '  P.TRIBCOFINS_CODIGO,'
      '  P.PRO_PERCISS,'
      '  P.PRO_NATRECEITA,'
      '  P.GRU_CODIGO,'
      '  COMPL.PRO_NCM,'
      '  COMPL.CEST_CODIGO,'
      '  CODBAR.PRO_CODBARRA'
      ''
      'UNION  '
      ''
      'SELECT'
      '  P.PRO_CODIGO,'
      '  P.PRO_DESCRICAO,'
      '  EMB.EMB_UNIDADE AS PRO_UNIDADE,'
      '  P.PRO_PESOBRUTO,'
      '  P.PRO_PESOLIQUIDO,'
      '  P.PRO_COMISSAO,'
      '  P.PRO_PERCIPI,'
      '  P.PRO_PIS,'
      '  P.PRO_COFINS,'
      '  P.PRO_ATIVO,'
      '  P.PRO_DATACAD,'
      '  P.SBGR_CODIGO,'
      '  P.PRO_INDUSTRIALIZADO,'
      '  P.PRO_ISS,'
      '  P.TRIBIPI_CODIGO,'
      '  P.TRIBPIS_CODIGO,'
      '  P.TRIBCOFINS_CODIGO,'
      '  P.PRO_PERCISS,'
      '  P.PRO_NATRECEITA,'
      '  P.GRU_CODIGO,'
      '  COMPL.PRO_NCM,'
      '  COMPL.CEST_CODIGO,'
      '  CODBAR.PRO_CODBARRA,'
      '  PRECO.TPRCITM_VALOR AS VAL_VAREJO,'
      '  0 AS VAL_ATACADO'
      'FROM'
      '  PRODCOMPLEMENTO COMPL,'
      
        '  PRODUTOS P LEFT JOIN PRODCODBARRAS CODBAR ON P.PRO_CODIGO = CO' +
        'DBAR.Pro_Codigo'
      '  LEFT JOIN PRODEMBALAGEM EMB ON P.PRO_CODIGO = EMB.PRO_CODIGO'
      
        '  LEFT JOIN TABPRECOITEM PRECO ON P.PRO_CODIGO = PRECO.PRO_CODIG' +
        'O'
      'where'
      '  P.PRO_CODIGO = COMPL.PRO_CODIGO'
      '  AND'
      '  EMB.FIL_CODIGO = 1'
      '  AND'
      '  EMB.EMB_UNIDADEPADRAO = '#39'S'#39
      '  AND'
      '  PRECO.TPRC_CODIGO = 111'
      'GROUP BY'
      '  P.PRO_CODIGO,'
      '  P.PRO_DESCRICAO,'
      '  EMB.EMB_UNIDADE,'
      '  P.PRO_PESOBRUTO,'
      '  P.PRO_PESOLIQUIDO,'
      '  P.PRO_COMISSAO,'
      '  P.PRO_PERCIPI,'
      '  P.PRO_PIS,'
      '  P.PRO_COFINS,'
      '  P.PRO_ATIVO,'
      '  P.PRO_DATACAD,'
      '  P.SBGR_CODIGO,'
      '  P.PRO_INDUSTRIALIZADO,'
      '  P.PRO_ISS,'
      '  P.TRIBIPI_CODIGO,'
      '  P.TRIBPIS_CODIGO,'
      '  P.TRIBCOFINS_CODIGO,'
      '  P.PRO_PERCISS,'
      '  P.PRO_NATRECEITA,'
      '  P.GRU_CODIGO,'
      '  COMPL.PRO_NCM,'
      '  COMPL.CEST_CODIGO,'
      '  CODBAR.PRO_CODBARRA'
      '  '
      '  UNION  '
      ''
      'SELECT'
      '  P.PRO_CODIGO,'
      '  P.PRO_DESCRICAO,'
      '  EMB.EMB_UNIDADE AS PRO_UNIDADE,'
      '  P.PRO_PESOBRUTO,'
      '  P.PRO_PESOLIQUIDO,'
      '  P.PRO_COMISSAO,'
      '  P.PRO_PERCIPI,'
      '  P.PRO_PIS,'
      '  P.PRO_COFINS,'
      '  P.PRO_ATIVO,'
      '  P.PRO_DATACAD,'
      '  P.SBGR_CODIGO,'
      '  P.PRO_INDUSTRIALIZADO,'
      '  P.PRO_ISS,'
      '  P.TRIBIPI_CODIGO,'
      '  P.TRIBPIS_CODIGO,'
      '  P.TRIBCOFINS_CODIGO,'
      '  P.PRO_PERCISS,'
      '  P.PRO_NATRECEITA,'
      '  P.GRU_CODIGO,'
      '  COMPL.PRO_NCM,'
      '  COMPL.CEST_CODIGO,'
      '  CODBAR.PRO_CODBARRA,'
      '  0 AS VAL_VAREJO,'
      '  PRECO.TPRCITM_VALOR AS VAL_ATACADO'
      'FROM'
      '  PRODCOMPLEMENTO COMPL,'
      
        '  PRODUTOS P LEFT JOIN PRODCODBARRAS CODBAR ON P.PRO_CODIGO = CO' +
        'DBAR.Pro_Codigo'
      '  LEFT JOIN PRODEMBALAGEM EMB ON P.PRO_CODIGO = EMB.PRO_CODIGO'
      
        '  LEFT JOIN TABPRECOITEM PRECO ON P.PRO_CODIGO = PRECO.PRO_CODIG' +
        'O'
      'where'
      '  P.PRO_CODIGO = COMPL.PRO_CODIGO'
      '  AND'
      '  EMB.FIL_CODIGO = 1'
      '  AND'
      '  EMB.EMB_UNIDADEPADRAO = '#39'S'#39
      '  AND'
      '  PRECO.TPRC_CODIGO = 115'
      'GROUP BY'
      '  P.PRO_CODIGO,'
      '  P.PRO_DESCRICAO,'
      '  EMB.EMB_UNIDADE,'
      '  P.PRO_PESOBRUTO,'
      '  P.PRO_PESOLIQUIDO,'
      '  P.PRO_COMISSAO,'
      '  P.PRO_PERCIPI,'
      '  P.PRO_PIS,'
      '  P.PRO_COFINS,'
      '  P.PRO_ATIVO,'
      '  P.PRO_DATACAD,'
      '  P.SBGR_CODIGO,'
      '  P.PRO_INDUSTRIALIZADO,'
      '  P.PRO_ISS,'
      '  P.TRIBIPI_CODIGO,'
      '  P.TRIBPIS_CODIGO,'
      '  P.TRIBCOFINS_CODIGO,'
      '  P.PRO_PERCISS,'
      '  P.PRO_NATRECEITA,'
      '  P.GRU_CODIGO,'
      '  COMPL.PRO_NCM,'
      '  COMPL.CEST_CODIGO,'
      '  CODBAR.PRO_CODBARRA  '
      '  ) T'
      'GROUP BY'
      '  PRO_CODIGO,'
      '  PRO_DESCRICAO,'
      '  T.PRO_UNIDADE,'
      '  PRO_PESOBRUTO,'
      '  PRO_PESOLIQUIDO,'
      '  PRO_COMISSAO,'
      '  PRO_PERCIPI,'
      '  PRO_PIS,'
      '  PRO_COFINS,'
      '  PRO_ATIVO,'
      '  PRO_DATACAD,'
      '  SBGR_CODIGO,'
      '  PRO_INDUSTRIALIZADO,'
      '  PRO_ISS,'
      '  TRIBIPI_CODIGO,'
      '  TRIBPIS_CODIGO,'
      '  TRIBCOFINS_CODIGO,'
      '  PRO_PERCISS,'
      '  PRO_NATRECEITA,'
      '  GRU_CODIGO,'
      '  PRO_NCM,'
      '  CEST_CODIGO,'
      '  PRO_CODBARRA')
    Params = <>
    Left = 40
    Top = 24
    object ZQProdutoPRO_CODIGO: TIntegerField
      FieldName = 'PRO_CODIGO'
      Required = True
    end
    object ZQProdutoPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 50
    end
    object ZQProdutoPRO_UNIDADE: TStringField
      FieldName = 'PRO_UNIDADE'
      Size = 5
    end
    object ZQProdutoPRO_PESOBRUTO: TFloatField
      FieldName = 'PRO_PESOBRUTO'
    end
    object ZQProdutoPRO_PESOLIQUIDO: TFloatField
      FieldName = 'PRO_PESOLIQUIDO'
    end
    object ZQProdutoPRO_COMISSAO: TFloatField
      FieldName = 'PRO_COMISSAO'
    end
    object ZQProdutoPRO_PERCIPI: TFloatField
      FieldName = 'PRO_PERCIPI'
    end
    object ZQProdutoPRO_PIS: TStringField
      FieldName = 'PRO_PIS'
      Size = 1
    end
    object ZQProdutoPRO_COFINS: TStringField
      FieldName = 'PRO_COFINS'
      Size = 1
    end
    object ZQProdutoPRO_ATIVO: TStringField
      FieldName = 'PRO_ATIVO'
      Size = 1
    end
    object ZQProdutoPRO_DATACAD: TDateField
      FieldName = 'PRO_DATACAD'
    end
    object ZQProdutoSBGR_CODIGO: TIntegerField
      FieldName = 'SBGR_CODIGO'
    end
    object ZQProdutoPRO_INDUSTRIALIZADO: TStringField
      FieldName = 'PRO_INDUSTRIALIZADO'
      Size = 1
    end
    object ZQProdutoPRO_ISS: TStringField
      FieldName = 'PRO_ISS'
      Size = 1
    end
    object ZQProdutoTRIBIPI_CODIGO: TIntegerField
      FieldName = 'TRIBIPI_CODIGO'
    end
    object ZQProdutoTRIBPIS_CODIGO: TIntegerField
      FieldName = 'TRIBPIS_CODIGO'
    end
    object ZQProdutoTRIBCOFINS_CODIGO: TIntegerField
      FieldName = 'TRIBCOFINS_CODIGO'
    end
    object ZQProdutoPRO_PERCISS: TFloatField
      FieldName = 'PRO_PERCISS'
    end
    object ZQProdutoPRO_NATRECEITA: TIntegerField
      FieldName = 'PRO_NATRECEITA'
    end
    object ZQProdutoGRU_CODIGO: TIntegerField
      FieldName = 'GRU_CODIGO'
    end
    object ZQProdutoPRO_NCM: TStringField
      FieldName = 'PRO_NCM'
      Size = 8
    end
    object ZQProdutoCEST_CODIGO: TStringField
      FieldName = 'CEST_CODIGO'
      Size = 7
    end
    object ZQProdutoPRO_CODBARRA: TStringField
      FieldName = 'PRO_CODBARRA'
      Required = True
      Size = 35
    end
    object ZQProdutoVAL_VAREJO: TFloatField
      FieldName = 'VAL_VAREJO'
      ReadOnly = True
    end
    object ZQProdutoVAL_ATACADO: TFloatField
      FieldName = 'VAL_ATACADO'
      ReadOnly = True
    end
  end
  object ZQSubClasse: TZQuery
    Connection = DMMySQL.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  GRU_CODIGO AS NUM_GRUPO,'
      '  SBGR_CODIGO AS NUM_SUBGRUPO,'
      '  SBGR_DESCRICAO'
      'FROM'
      '  SUBGRUPOS')
    Params = <>
    Left = 120
    Top = 24
    object ZQSubClasseNUM_SUBGRUPO: TIntegerField
      FieldName = 'NUM_SUBGRUPO'
      Required = True
    end
    object ZQSubClasseSBGR_DESCRICAO: TStringField
      FieldName = 'SBGR_DESCRICAO'
      Size = 50
    end
    object ZQSubClasseNUM_GRUPO: TIntegerField
      FieldName = 'NUM_GRUPO'
      Required = True
    end
  end
  object ZQEstoque: TZQuery
    Connection = DMMySQL.ZConnection1
    SQL.Strings = (
      'SELECT '
      '  ESTOQUE.FIL_CODIGO,'
      '  ESTOQUE.PRO_CODIGO,'
      '  ESTOQUE.EST_QTDE,'
      '  CUSTO.PRO_CUSTOCOMPRA'
      'FROM'
      '  ESTOQUE'
      
        '  LEFT JOIN PRODCUSTOS CUSTO ON ESTOQUE.PRO_CODIGO = CUSTO.PRO_C' +
        'ODIGO')
    Params = <>
    Left = 192
    Top = 24
    object ZQEstoqueFIL_CODIGO: TIntegerField
      FieldName = 'FIL_CODIGO'
      Required = True
    end
    object ZQEstoquePRO_CODIGO: TIntegerField
      FieldName = 'PRO_CODIGO'
      Required = True
    end
    object ZQEstoqueEST_QTDE: TFloatField
      FieldName = 'EST_QTDE'
    end
    object ZQEstoquePRO_CUSTOCOMPRA: TFloatField
      FieldName = 'PRO_CUSTOCOMPRA'
    end
  end
  object ZQFormula: TZQuery
    Connection = DMMySQL.ZConnection1
    SQL.Strings = (
      'SELECT * FROM deion.prodcomposicao')
    Params = <>
    Left = 280
    Top = 24
    object ZQFormulaPro_Codigo: TIntegerField
      FieldName = 'Pro_Codigo'
      Required = True
    end
    object ZQFormulaPro_CodMatPrima: TIntegerField
      FieldName = 'Pro_CodMatPrima'
      Required = True
    end
    object ZQFormulaComp_Qtde: TFloatField
      FieldName = 'Comp_Qtde'
    end
    object ZQFormulaComp_TipoCompos: TIntegerField
      FieldName = 'Comp_TipoCompos'
      Required = True
    end
    object ZQFormulaComp_PercPerda: TFloatField
      FieldName = 'Comp_PercPerda'
    end
  end
  object ZQTabelaPreco: TZQuery
    Connection = DMMySQL.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  TABELASPRECO.TPRC_CODIGO,'
      '  TABELASPRECO.TPRC_DESCRICAO,'
      '  TABPRECOITEM.PRO_CODIGO,'
      '  TABPRECOITEM.PRO_CODBARRAS,'
      '  TABPRECOITEM.TPRCITM_VALOR'
      'FROM'
      ' TABELASPRECO,'
      ' TABPRECOITEM'
      'WHERE'
      '  TABELASPRECO.TPRC_CODIGO = TABPRECOITEM.TPRC_CODIGO'
      '/*  AND'
      
        '  TABELASPRECO.TPRC_CODIGO IN(111,115,31,32,37,45,22,94,93,42,36' +
        ',35,87,61,57,56,60,34,83,41,101,1)*/'
      'ORDER BY'
      '  TABELASPRECO.TPRC_CODIGO'
      '')
    Params = <>
    Left = 40
    Top = 80
    object ZQTabelaPrecoTPRC_CODIGO: TIntegerField
      FieldName = 'TPRC_CODIGO'
      Required = True
    end
    object ZQTabelaPrecoTPRC_DESCRICAO: TStringField
      FieldName = 'TPRC_DESCRICAO'
      Size = 50
    end
    object ZQTabelaPrecoPRO_CODIGO: TIntegerField
      FieldName = 'PRO_CODIGO'
      Required = True
    end
    object ZQTabelaPrecoPRO_CODBARRAS: TStringField
      FieldName = 'PRO_CODBARRAS'
      Required = True
      Size = 35
    end
    object ZQTabelaPrecoTPRCITM_VALOR: TFloatField
      FieldName = 'TPRCITM_VALOR'
    end
  end
  object QTabelaPreco: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Rowid,'
      '  TB_TABELA_PRECO_CAB.*'
      'FROM'
      '  TB_TABELA_PRECO_CAB'
      'WHERE'
      '   COD_TABELA_PRECO_CAB = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000014000000434F445F544142454C415F505245434F5F434142
      01000000000011000000444553435F544142454C415F505245434F0100000000
      000C000000494E445F534954554143414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 120
    Top = 80
    object QTabelaPrecoCOD_TABELA_PRECO_CAB: TIntegerField
      FieldName = 'COD_TABELA_PRECO_CAB'
      Required = True
    end
    object QTabelaPrecoDESC_TABELA_PRECO: TStringField
      FieldName = 'DESC_TABELA_PRECO'
      Required = True
      Size = 30
    end
    object QTabelaPrecoIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Required = True
    end
  end
  object QTabelaPrecoItem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Rowid,'
      '  TB_TABELA_PRECO_ITEM.*'
      'FROM'
      '  TB_TABELA_PRECO_ITEM'
      'WHERE'
      '   COD_TABELA_PRECO_ITEM = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_TABELA_PRECO_ITEM'
    SequenceField.Sequence = 'SQTABELAPRECOITEM'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000400000014000000434F445F544142454C415F505245434F5F434142
      01000000000015000000434F445F544142454C415F505245434F5F4954454D01
      00000000000B000000434F445F50524F4455544F010000000000090000005641
      4C5F505245434F010000000000}
    Session = DMOracle.DBCemapa
    Left = 208
    Top = 88
    object QTabelaPrecoItemCOD_TABELA_PRECO_ITEM: TIntegerField
      FieldName = 'COD_TABELA_PRECO_ITEM'
      Required = True
    end
    object QTabelaPrecoItemCOD_TABELA_PRECO_CAB: TIntegerField
      FieldName = 'COD_TABELA_PRECO_CAB'
      Required = True
    end
    object QTabelaPrecoItemCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QTabelaPrecoItemVAL_PRECO: TFloatField
      FieldName = 'VAL_PRECO'
      Required = True
    end
  end
  object ZQProdutoTRemove: TZQuery
    Connection = DMMySQL.ZConnection1
    SQL.Strings = (
      '  SELECT'#10
      '  P.PRO_CODIGO,'#10
      '  P.PRO_DESCRICAO,'#10
      '  P.PRO_PESOBRUTO,'#10
      '  P.PRO_PESOLIQUIDO,'#10
      '  P.PRO_COMISSAO,'#10
      '  P.PRO_PERCIPI,'#10
      '  P.PRO_PIS,'#10
      '  P.PRO_COFINS,'#10
      '  P.PRO_ATIVO,'#10
      '  P.PRO_DATACAD,'#10
      '  P.SBGR_CODIGO,'#10
      '  P.PRO_INDUSTRIALIZADO,'#10
      '  P.PRO_ISS,'#10
      '  P.TRIBIPI_CODIGO,'#10
      '  P.TRIBPIS_CODIGO,'#10
      '  P.TRIBCOFINS_CODIGO,'#10
      '  P.PRO_PERCISS,'#10
      '  P.PRO_NATRECEITA,'#10
      '  P.GRU_CODIGO'#10
      'FROM'#10
      '  PRODUTOS P '#10
      'ORDER BY P.PRO_CODIGO')
    Params = <>
    Left = 312
    Top = 96
    object ZQProdutoTRemovePRO_CODIGO: TIntegerField
      FieldName = 'PRO_CODIGO'
      Required = True
    end
    object ZQProdutoTRemovePRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 120
    end
    object ZQProdutoTRemovePRO_PESOBRUTO: TFloatField
      FieldName = 'PRO_PESOBRUTO'
    end
    object ZQProdutoTRemovePRO_PESOLIQUIDO: TFloatField
      FieldName = 'PRO_PESOLIQUIDO'
    end
    object ZQProdutoTRemovePRO_COMISSAO: TFloatField
      FieldName = 'PRO_COMISSAO'
    end
    object ZQProdutoTRemovePRO_PERCIPI: TFloatField
      FieldName = 'PRO_PERCIPI'
    end
    object ZQProdutoTRemovePRO_PIS: TStringField
      FieldName = 'PRO_PIS'
      Size = 1
    end
    object ZQProdutoTRemovePRO_COFINS: TStringField
      FieldName = 'PRO_COFINS'
      Size = 1
    end
    object ZQProdutoTRemovePRO_ATIVO: TStringField
      FieldName = 'PRO_ATIVO'
      Size = 1
    end
    object ZQProdutoTRemovePRO_DATACAD: TDateField
      FieldName = 'PRO_DATACAD'
    end
    object ZQProdutoTRemoveSBGR_CODIGO: TIntegerField
      FieldName = 'SBGR_CODIGO'
    end
    object ZQProdutoTRemovePRO_INDUSTRIALIZADO: TStringField
      FieldName = 'PRO_INDUSTRIALIZADO'
      Size = 1
    end
    object ZQProdutoTRemovePRO_ISS: TStringField
      FieldName = 'PRO_ISS'
      Size = 1
    end
    object ZQProdutoTRemoveTRIBIPI_CODIGO: TIntegerField
      FieldName = 'TRIBIPI_CODIGO'
    end
    object ZQProdutoTRemoveTRIBPIS_CODIGO: TIntegerField
      FieldName = 'TRIBPIS_CODIGO'
    end
    object ZQProdutoTRemoveTRIBCOFINS_CODIGO: TIntegerField
      FieldName = 'TRIBCOFINS_CODIGO'
    end
    object ZQProdutoTRemovePRO_PERCISS: TFloatField
      FieldName = 'PRO_PERCISS'
    end
    object ZQProdutoTRemovePRO_NATRECEITA: TIntegerField
      FieldName = 'PRO_NATRECEITA'
    end
    object ZQProdutoTRemoveGRU_CODIGO: TIntegerField
      FieldName = 'GRU_CODIGO'
    end
  end
end
