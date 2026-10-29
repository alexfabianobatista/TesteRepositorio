object DMRelatorio_Venda: TDMRelatorio_Venda
  OldCreateOrder = False
  Left = 177
  Top = 55
  Height = 659
  Width = 1161
  object QRSecretaria: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  DESC_UNIDADE,'
      '  IND_CLASSE_TOX,'
      '  DESC_CLASSE,'
      '  SUM(QT_QUANTIDADE_PRI) AS QT_QUANTIDADE_PRI,'
      '  SUM(QT_QUANTIDADE_SEG) AS QT_QUANTIDADE_SEG,'
      '  SUM(QT_QUANTIDADE_TER) AS QT_QUANTIDADE_TER,'
      '  SUM(QT_QUANTIDADE_QUA) AS QT_QUANTIDADE_QUA'
      'FROM'
      '('
      '  SELECT'
      '    Tb_produto.COD_PRODUTO,'
      '    Tb_produto.DESC_PRODUTO,'
      '    Tb_produto.DESC_UNIDADE,'
      '    Tb_produto.IND_CLASSE_TOX,'
      '    Tb_classe.DESC_CLASSE,'
      
        '    decode(tb_operacao.IND_VENDAS,'#39'V'#39',Tb_nota_item.QT_QUANTIDADE' +
        ' * TB_PRODUTO.NUM_EMBALAGEM,Tb_nota_item.QT_QUANTIDADE * TB_PROD' +
        'UTO.NUM_EMBALAGEM * -1) AS QT_QUANTIDADE_PRI,'
      '    0 AS QT_QUANTIDADE_SEG,'
      '    0 AS QT_QUANTIDADE_TER,'
      '    0 AS QT_QUANTIDADE_QUA'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_CLASSE,'
      '    TB_PRODUTO,'
      '    TB_OPERACAO'
      '  WHERE'
      '    TB_CLASSE.COD_CLASSE = TB_PRODUTO.COD_CLASSE'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '    AND'
      '    Tb_nota_cab.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    ((TB_operacao.IND_VENDAS = '#39'V'#39') OR'
      '     (TB_operacao.IND_VENDAS = '#39'D'#39'))'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I_PRI'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F_PRI'
      '    AND'
      '      (:FILIAL IS NULL OR'
      '       :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '    AND'
      '      (:CLASSE_I IS NULL OR'
      
        '       :CLASSE_I <= LTRIM(TO_CHAR(TB_CLASSE.NUM_CLASSE,'#39'000'#39')) |' +
        '| LTRIM(TO_CHAR(TB_CLASSE.NUM_SUBCLASSE,'#39'000'#39'))'
      '      )'
      '    AND'
      '      (:CLASSE_F IS NULL OR'
      
        '       :CLASSE_F >= LTRIM(TO_CHAR(TB_CLASSE.NUM_CLASSE,'#39'000'#39')) |' +
        '| LTRIM(TO_CHAR(TB_CLASSE.NUM_SUBCLASSE,'#39'000'#39'))'
      '      )'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_produto.COD_PRODUTO,'
      '    Tb_produto.DESC_PRODUTO,'
      '    Tb_produto.DESC_UNIDADE,'
      '    Tb_produto.IND_CLASSE_TOX,'
      '    Tb_classe.DESC_CLASSE,'
      '    0 AS QT_QUANTIDADE_PRI,'
      
        '    decode(tb_operacao.IND_VENDAS,'#39'V'#39',Tb_nota_item.QT_QUANTIDADE' +
        ' * TB_PRODUTO.NUM_EMBALAGEM,Tb_nota_item.QT_QUANTIDADE * TB_PROD' +
        'UTO.NUM_EMBALAGEM * -1) AS QT_QUANTIDADE_SEG,'
      '    0 AS QT_QUANTIDADE_TER,'
      '    0 AS QT_QUANTIDADE_QUA'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_CLASSE,'
      '    TB_PRODUTO,'
      '    TB_OPERACAO'
      '  WHERE'
      '    TB_CLASSE.COD_CLASSE = TB_PRODUTO.COD_CLASSE'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '    AND'
      '    Tb_nota_cab.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    ((TB_operacao.IND_VENDAS = '#39'V'#39') OR'
      '     (TB_operacao.IND_VENDAS = '#39'D'#39'))'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I_SEG'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F_SEG'
      '    AND'
      '      (:FILIAL IS NULL OR'
      '       :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '    AND'
      '      (:CLASSE_I IS NULL OR'
      
        '       :CLASSE_I <= LTRIM(TO_CHAR(TB_CLASSE.NUM_CLASSE,'#39'000'#39')) |' +
        '| LTRIM(TO_CHAR(TB_CLASSE.NUM_SUBCLASSE,'#39'000'#39'))'
      '      )'
      '    AND'
      '      (:CLASSE_F IS NULL OR'
      
        '       :CLASSE_F >= LTRIM(TO_CHAR(TB_CLASSE.NUM_CLASSE,'#39'000'#39')) |' +
        '| LTRIM(TO_CHAR(TB_CLASSE.NUM_SUBCLASSE,'#39'000'#39'))'
      '      )'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_produto.COD_PRODUTO,'
      '    Tb_produto.DESC_PRODUTO,'
      '    Tb_produto.DESC_UNIDADE,'
      '    Tb_produto.IND_CLASSE_TOX,'
      '    Tb_classe.DESC_CLASSE,'
      '    0 AS QT_QUANTIDADE_PRI,'
      '    0 AS QT_QUANTIDADE_SEG,'
      
        '    decode(tb_operacao.IND_VENDAS,'#39'V'#39',Tb_nota_item.QT_QUANTIDADE' +
        ' * TB_PRODUTO.NUM_EMBALAGEM,Tb_nota_item.QT_QUANTIDADE * TB_PROD' +
        'UTO.NUM_EMBALAGEM * -1) AS QT_QUANTIDADE_TER,'
      '    0 AS QT_QUANTIDADE_QUA'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_CLASSE,'
      '    TB_PRODUTO,'
      '    TB_OPERACAO'
      '  WHERE'
      '    TB_CLASSE.COD_CLASSE = TB_PRODUTO.COD_CLASSE'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '    AND'
      '    Tb_nota_cab.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    ((TB_operacao.IND_VENDAS = '#39'V'#39') OR'
      '     (TB_operacao.IND_VENDAS = '#39'D'#39'))'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I_TER'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F_TER'
      '    AND'
      '      (:FILIAL IS NULL OR'
      '       :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '    AND'
      '      (:CLASSE_I IS NULL OR'
      
        '       :CLASSE_I <= LTRIM(TO_CHAR(TB_CLASSE.NUM_CLASSE,'#39'000'#39')) |' +
        '| LTRIM(TO_CHAR(TB_CLASSE.NUM_SUBCLASSE,'#39'000'#39'))'
      '      )'
      '    AND'
      '      (:CLASSE_F IS NULL OR'
      
        '       :CLASSE_F >= LTRIM(TO_CHAR(TB_CLASSE.NUM_CLASSE,'#39'000'#39')) |' +
        '| LTRIM(TO_CHAR(TB_CLASSE.NUM_SUBCLASSE,'#39'000'#39'))'
      '      )'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_produto.COD_PRODUTO,'
      '    Tb_produto.DESC_PRODUTO,'
      '    Tb_produto.DESC_UNIDADE,'
      '    Tb_produto.IND_CLASSE_TOX,'
      '    Tb_classe.DESC_CLASSE,'
      '    0 As QT_QUANTIDADE_PRI,'
      '    0 AS QT_QUANTIDADE_SEG,'
      '    0 AS QT_QUANTIDADE_TER,'
      
        '    decode(tb_operacao.IND_VENDAS,'#39'V'#39',Tb_nota_item.QT_QUANTIDADE' +
        ' * TB_PRODUTO.NUM_EMBALAGEM,Tb_nota_item.QT_QUANTIDADE * TB_PROD' +
        'UTO.NUM_EMBALAGEM * -1) AS QT_QUANTIDADE_QUA'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_CLASSE,'
      '    TB_PRODUTO,'
      '    TB_OPERACAO'
      '  WHERE'
      '    TB_CLASSE.COD_CLASSE = TB_PRODUTO.COD_CLASSE'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '    AND'
      '    Tb_nota_cab.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    ((TB_operacao.IND_VENDAS = '#39'V'#39') OR'
      '     (TB_operacao.IND_VENDAS = '#39'D'#39'))'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I_QUA'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F_QUA'
      '    AND'
      '      (:FILIAL IS NULL OR'
      '       :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '    AND'
      '      (:CLASSE_I IS NULL OR'
      
        '       :CLASSE_I <= LTRIM(TO_CHAR(TB_CLASSE.NUM_CLASSE,'#39'000'#39')) |' +
        '| LTRIM(TO_CHAR(TB_CLASSE.NUM_SUBCLASSE,'#39'000'#39'))'
      '      )'
      '    AND'
      '      (:CLASSE_F IS NULL OR'
      
        '       :CLASSE_F >= LTRIM(TO_CHAR(TB_CLASSE.NUM_CLASSE,'#39'000'#39')) |' +
        '| LTRIM(TO_CHAR(TB_CLASSE.NUM_SUBCLASSE,'#39'000'#39'))'
      '      )'
      ')'
      'GROUP BY'
      '  COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  DESC_UNIDADE,'
      '  IND_CLASSE_TOX,'
      '  DESC_CLASSE'
      'ORDER BY'
      '  DESC_PRODUTO'
      '')
    Variables.Data = {
      030000000B000000070000003A46494C49414C03000000000000000000000009
      0000003A434C415353455F49030000000000000000000000090000003A434C41
      5353455F460300000000000000000000000B0000003A444154415F495F505249
      0C00000000000000000000000B0000003A444154415F465F5052490C00000000
      000000000000000B0000003A444154415F495F5345470C000000000000000000
      00000B0000003A444154415F465F5345470C00000000000000000000000B0000
      003A444154415F495F5445520C00000000000000000000000B0000003A444154
      415F465F5445520C00000000000000000000000B0000003A444154415F495F51
      55410C00000000000000000000000B0000003A444154415F465F5155410C0000
      000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000C000000444553435F50524F4455544F0100000000000C00
      0000444553435F554E49444144450100000000000E000000494E445F434C4153
      53455F544F580100000000000B000000444553435F434C415353450100000000
      001100000051545F5155414E5449444144455F50524901000000000011000000
      51545F5155414E5449444144455F5345470100000000001100000051545F5155
      414E5449444144455F5445520100000000001100000051545F5155414E544944
      4144455F5155410100000000000B000000434F445F50524F4455544F01000000
      0000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 576
    Top = 15
    object QRSecretariaDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 3
    end
    object QRSecretariaIND_CLASSE_TOX: TStringField
      FieldName = 'IND_CLASSE_TOX'
      Size = 3
    end
    object QRSecretariaDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QRSecretariaQT_QUANTIDADE_PRI: TFloatField
      FieldName = 'QT_QUANTIDADE_PRI'
    end
    object QRSecretariaQT_QUANTIDADE_SEG: TFloatField
      FieldName = 'QT_QUANTIDADE_SEG'
    end
    object QRSecretariaQT_QUANTIDADE_TER: TFloatField
      FieldName = 'QT_QUANTIDADE_TER'
    end
    object QRSecretariaQT_QUANTIDADE_QUA: TFloatField
      FieldName = 'QT_QUANTIDADE_QUA'
    end
    object QRSecretariaCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRSecretariaDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
  end
  object QRVendedor: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  DESC_PRODUTO,'
      '  COD_VENDEDOR + 0.00 AS COD_VENDEDOR,'
      '  NOME_VENDEDOR,'
      '  COD_FILIAL + 0.00 AS COD_FILIAL,'
      '  DESC_FILIAL,'
      '  COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  SUM(SQT_QUANTIDADE) AS SQT_QUANTIDADE,'
      '  SUM(SVAL_TOTAL) AS SVAL_TOTAL'
      'FROM'
      '('
      '  SELECT'
      '    Tb_produto.DESC_PRODUTO,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_produto.COD_PRODUTO,'
      '    SUM(Tb_nota_item.QT_QUANTIDADE) AS SQT_QUANTIDADE,'
      '    SUM(Tb_nota_item.VAL_TOTAL) AS SVAL_TOTAL'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_PRODUTO,'
      '    TB_FILIAL,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '    AND'
      '    Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_ITEM.PERC_COMISSAO > 0'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      ''
      '  GROUP BY'
      '    Tb_produto.DESC_PRODUTO,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME,'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_produto.COD_PRODUTO'
      ''
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_produto.DESC_PRODUTO,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_produto.COD_PRODUTO,'
      '    SUM(Tb_nota_item.QT_QUANTIDADE*-1) AS SQT_QUANTIDADE,'
      '    SUM(Tb_nota_item.VAL_TOTAL*-1) AS SVAL_TOTAL'
      '  FROM'
      '    TB_OPERACAO,'
      '    TB_PRODUTO,'
      '    TB_FILIAL,'
      '    TB_VENDEDOR,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM'
      '  WHERE'
      '    TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '    AND'
      '    Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_ITEM.PERC_COMISSAO > 0'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'D'#39
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '  GROUP BY'
      '    Tb_produto.DESC_PRODUTO,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME,'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_produto.COD_PRODUTO'
      ')'
      'GROUP BY'
      '  COD_FILIAL,'
      '  COD_VENDEDOR,'
      '  COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  NOME_VENDEDOR,'
      '  DESC_FILIAL'
      ' ')
    Variables.Data = {
      0300000004000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000090000003A56454E4445
      444F52030000000000000000000000070000003A46494C49414C030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000C000000444553435F50524F4455544F0100000000000C00
      0000434F445F56454E4445444F520100000000000D0000004E4F4D455F56454E
      4445444F520100000000000A000000434F445F46494C49414C0100000000000B
      000000444553435F46494C49414C0100000000000B000000434F445F50524F44
      55544F0100000000000E0000005351545F5155414E5449444144450100000000
      000A0000005356414C5F544F54414C010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 480
    Top = 322
    object QRVendedorCOD_VENDEDOR: TFloatField
      FieldName = 'COD_VENDEDOR'
    end
    object QRVendedorNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 40
    end
    object QRVendedorCOD_FILIAL: TFloatField
      FieldName = 'COD_FILIAL'
    end
    object QRVendedorDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRVendedorCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRVendedorSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRVendedorSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRVendedorDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
  end
  object QRMapaVendaRes: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_FILIAL + 0.00 AS COD_FILIAL,'
      '  DESC_FILIAL,'
      '  NUM_CGC,'
      '  COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  NUM_FABRICANTE,'
      '  NUM_EMBALAGEM,'
      '  DESC_UNIDADE,'
      '  SUM(SQT_LITRAGEM) AS SQT_LITRAGEM,'
      '  SUM(SQT_QUANTIDADE) AS SQT_QUANTIDADE,'
      '  SUM(SVAL_TOTAL) AS SVAL_TOTAL,'
      '  SUM(VAL_CUSTO) AS VAL_CUSTO,'
      '  SUM(SQT_QUANTIDADE*NUM_PESO_BRUTO) AS SPESO_BRUTO,'
      '  SUM(SQT_QUANTIDADE*NUM_PESO_LIQUIDO) AS SPESO_LIQUIDO'
      'FROM'
      '('
      '  SELECT'
      
        '    DECODE(:TIPO_QUEBRA,'#39'F'#39',Tb_filial.COD_FILIAL, DECODE(:TIPO_Q' +
        'UEBRA, '#39'V'#39',TB_NOTA_CAB.COD_VENDEDOR, TB_NOTA_CAB.COD_CADASTRO)) ' +
        'AS COD_FILIAL,'
      
        '    DECODE(:TIPO_QUEBRA,'#39'F'#39',Tb_filial.DESC_FILIAL, DECODE(:TIPO_' +
        'QUEBRA, '#39'V'#39', TB_VENDEDOR.NOME, TB_CADASTRO.NOME))AS DESC_FILIAL,'
      '    TB_FILIAL.NUM_CGC,'
      '    TB_PRODUTO.COD_PRODUTO,'
      '    TB_PRODUTO.DESC_PRODUTO,'
      '    TB_PRODUTO.NUM_FABRICANTE,'
      '    TB_PRODUTO.NUM_EMBALAGEM,'
      '    TB_PRODUTO.DESC_UNIDADE,'
      
        '    SUM(TB_NOTA_ITEM.QT_QUANTIDADE*TB_PRODUTO.NUM_CONVERTE_FARDO' +
        ') AS SQT_LITRAGEM,'
      '    SUM(Tb_nota_item.QT_QUANTIDADE) AS SQT_QUANTIDADE,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - NVL(PEGA_DESCONTO_ITEM(TB_NOTA_' +
        'ITEM.COD_NOTA_ITEM),0) + Tb_nota_item.VAL_DESPESAS +decode(:MOST' +
        'RA_FRETE, '#39'N'#39', 0, Tb_nota_item.VAL_FRETE)+TB_NOTA_ITEM.VAL_ICMS_' +
        'SUBST + Tb_nota_item.VAL_IPI) AS SVAL_TOTAL,'
      
        '    SUM(Tb_nota_item.VAL_CUSTO*Tb_nota_item.QT_QUANTIDADE) AS VA' +
        'L_CUSTO,'
      '    TB_PRODUTO.NUM_PESO_BRUTO,'
      '    TB_PRODUTO.NUM_PESO_LIQUIDO'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_VENDEDOR,'
      '    TB_PRODUTO,'
      '    TB_FILIAL,'
      '    TB_LOTE_TIPO,'
      '    TB_CADASTRO,'
      '    TB_CLASSE,'
      '    TB_REGIAO'
      '  WHERE'
      '    (TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO)'
      '    AND'
      '    (TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39')'
      '    AND'
      '    (TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39')'
      '    AND'
      '    (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)'
      '    AND'
      '    (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO)'
      '    AND'
      '    (TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE)'
      '    AND'
      '    (Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL)'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_Vendedor.COD_VENDEDOR(+)'
      '    AND'
      '    TB_CADASTRO.COD_REGIAO = TB_REGIAO.COD_REGIAO(+)'
      '    AND'
      '    (TB_NOTA_ITEM.COD_LOTE_TIPO = TB_LOTE_TIPO.COD_LOTE_TIPO)'
      '    AND'
      '    TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '    AND'
      '    (TB_NOTA_CAB.DT_EMISSAO >= :DATA_I)'
      '    AND'
      '    (TB_NOTA_CAB.DT_EMISSAO <= :DATA_F)'
      '    AND'
      '    (:OPERACAO IS NULL OR'
      '     TB_OPERACAO.IND_VENDAS = :OPERACAO)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '    AND'
      '    :COD_SERIE'
      '    AND'
      '    (:COD_PRODUTO)'
      '    AND'
      '    :COD_OPERACAO'
      '    AND'
      '    :COD_CFOP'
      '    AND'
      '    :VENDEDOR'
      '    AND'
      '    :COD_REGIAO'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO = :VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:TECNICO IS NULL OR'
      '      TB_NOTA_CAB.COD_TECNICO = :TECNICO)'
      '    AND'
      '    (:TIPO_PAGTO IS NULL OR'
      '      TB_NOTA_CAB.IND_CONDICAO_PAGTO = :TIPO_PAGTO)'
      '    AND'
      '    (:FORNECEDOR IS NULL OR'
      '      TB_PRODUTO.COD_CADASTRO = :FORNECEDOR)'
      '    AND'
      '    (:COD_MARCA IS NULL OR'
      '      TB_PRODUTO.COD_MARCA = :COD_MARCA)'
      '    AND'
      '    (:IND_TIPO_PRODUCAO IS NULL'
      '     OR'
      '     TB_LOTE_TIPO.IND_TIPO_PRODUCAO = :IND_TIPO_PRODUCAO)'
      '    AND'
      '    (:COD_CULTURA IS NULL OR'
      '      TB_NOTA_ITEM.COD_CULTURA = :COD_CULTURA)'
      '    AND'
      '    (:COD_CADASTRO IS NULL OR'
      '      TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO)'
      '    AND'
      '    (:ESTADO IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_ESTADO = :ESTADO)'
      '    AND'
      '    (:CLASSE IS NULL OR TB_CLASSE.NUM_CLASSE = :CLASSE)'
      '    AND'
      '    (:SUBCLASSE IS NULL OR TB_CLASSE.NUM_SUBCLASSE = :SUBCLASSE)'
      '    AND'
      '    (:DEPARTAMENTO IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_DEPARTAMENTO = :DEPARTAMENTO)'
      '    AND'
      '    (:CIDADE IS NULL'
      '     OR'
      '      TB_CADASTRO.DESC_CIDADE =:CIDADE)'
      '    AND'
      '    (:COD_NOTA_CAB IS NULL'
      '    OR'
      '      TB_NOTA_CAB.COD_NOTA_CAB = :COD_NOTA_CAB)'
      '    AND'
      '    (:TIPO_PRODUTO IS NULL'
      '    OR'
      '     TB_PRODUTO.IND_TIPO_PRODUTO = :TIPO_PRODUTO)'
      '  GROUP BY'
      
        '    DECODE(:TIPO_QUEBRA,'#39'F'#39',Tb_filial.COD_FILIAL, DECODE(:TIPO_Q' +
        'UEBRA, '#39'V'#39',TB_NOTA_CAB.COD_VENDEDOR, TB_NOTA_CAB.COD_CADASTRO)),'
      
        '    DECODE(:TIPO_QUEBRA,'#39'F'#39',Tb_filial.DESC_FILIAL, DECODE(:TIPO_' +
        'QUEBRA, '#39'V'#39', TB_VENDEDOR.NOME, TB_CADASTRO.NOME)),'
      '    TB_FILIAL.NUM_CGC,'
      '    TB_PRODUTO.COD_PRODUTO,'
      '    TB_PRODUTO.DESC_PRODUTO,'
      '    TB_PRODUTO.NUM_FABRICANTE,'
      '    TB_PRODUTO.NUM_EMBALAGEM,'
      '    TB_PRODUTO.DESC_UNIDADE,'
      '    TB_PRODUTO.NUM_PESO_BRUTO,'
      '    TB_PRODUTO.NUM_PESO_LIQUIDO'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      
        '    DECODE(:TIPO_QUEBRA,'#39'F'#39',Tb_filial.COD_FILIAL, DECODE(:TIPO_Q' +
        'UEBRA, '#39'V'#39',TB_NOTA_CAB.COD_VENDEDOR, TB_NOTA_CAB.COD_CADASTRO)) ' +
        'AS COD_FILIAL,'
      
        '    DECODE(:TIPO_QUEBRA,'#39'F'#39',Tb_filial.DESC_FILIAL, DECODE(:TIPO_' +
        'QUEBRA, '#39'V'#39', TB_VENDEDOR.NOME, TB_CADASTRO.NOME))AS DESC_FILIAL,'
      '    TB_FILIAL.NUM_CGC,'
      '    TB_PRODUTO.COD_PRODUTO,'
      '    TB_PRODUTO.DESC_PRODUTO,'
      '    TB_PRODUTO.NUM_FABRICANTE,'
      '    TB_PRODUTO.NUM_EMBALAGEM,'
      '    TB_PRODUTO.DESC_UNIDADE,'
      
        '    SUM(TB_NOTA_ITEM.QT_QUANTIDADE*TB_PRODUTO.NUM_CONVERTE_FARDO' +
        ') AS SQT_LITRAGEM,'
      '    SUM(Tb_nota_item.QT_QUANTIDADE*-1) AS SQT_QUANTIDADE,'
      
        '    SUM((Tb_nota_item.VAL_TOTAL - NVL(PEGA_DESCONTO_ITEM(TB_NOTA' +
        '_ITEM.COD_NOTA_ITEM),0)  + Tb_nota_item.VAL_DESPESAS + Tb_nota_i' +
        'tem.VAL_FRETE+TB_NOTA_ITEM.VAL_ICMS_SUBST+ Tb_nota_item.VAL_IPI)' +
        '*-1) AS SVAL_TOTAL,'
      '    SUM((TB_NOTA_ITEM.VAL_CUSTO)*-1) AS VAL_CUSTO,'
      '    TB_PRODUTO.NUM_PESO_BRUTO,'
      '    TB_PRODUTO.NUM_PESO_LIQUIDO'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_VENDEDOR,'
      '    TB_PRODUTO,'
      '    TB_FILIAL,'
      '    TB_LOTE_TIPO,'
      '    TB_CADASTRO,'
      '    TB_CLASSE,'
      '    TB_REGIAO'
      '  WHERE'
      '    (TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO)'
      '    AND'
      '    (TB_OPERACAO.IND_VENDAS = '#39'D'#39')'
      '    AND'
      '    (TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39')'
      '    AND'
      '    (TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39')'
      '    AND'
      '    (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_Vendedor.COD_VENDEDOR(+)'
      '    AND'
      '    TB_CADASTRO.COD_REGIAO = TB_REGIAO.COD_REGIAO(+)'
      '    AND'
      '    (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO)'
      '    AND'
      '    (TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE)'
      '    AND'
      '    (Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL)'
      '    AND'
      '    (TB_NOTA_ITEM.COD_LOTE_TIPO = TB_LOTE_TIPO.COD_LOTE_TIPO)'
      '    AND'
      '    TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '    AND'
      '    (TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I)'
      '    AND'
      '    (TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '    AND'
      '    (:COD_SERIE)'
      '    AND'
      '    (:COD_PRODUTO)'
      '    AND'
      '    (:COD_OPERACAO)'
      '    AND'
      '    :COD_CFOP'
      '    AND'
      '    :VENDEDOR'
      '    AND'
      '    :COD_REGIAO'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO = :VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:TECNICO IS NULL OR'
      '      TB_NOTA_CAB.COD_TECNICO = :TECNICO)'
      '    AND'
      
        '    (:OPERACAO IS NULL OR  /*somente mostra as operacoes de devo' +
        'lu'#231#227'o quando informado a operacao nos parametros*/'
      '     TB_OPERACAO.IND_VENDAS = :OPERACAO)'
      '    AND'
      '    (:FORNECEDOR IS NULL OR'
      '      TB_PRODUTO.COD_CADASTRO = :FORNECEDOR)'
      '    AND'
      '    (:COD_MARCA IS NULL OR'
      '      TB_PRODUTO.COD_MARCA = :COD_MARCA)'
      '    AND'
      '    (:IND_TIPO_PRODUCAO IS NULL'
      '     OR'
      '     TB_LOTE_TIPO.IND_TIPO_PRODUCAO = :IND_TIPO_PRODUCAO)'
      '    AND'
      '    (:COD_CULTURA IS NULL OR'
      '      TB_NOTA_ITEM.COD_CULTURA = :COD_CULTURA)'
      '    AND'
      '    (:COD_CADASTRO IS NULL OR'
      '      TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO)'
      '    AND'
      '    (:ESTADO IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_ESTADO = :ESTADO)'
      '    AND'
      '    (:CLASSE IS NULL OR TB_CLASSE.NUM_CLASSE = :CLASSE)'
      '    AND'
      '    (:SUBCLASSE IS NULL OR TB_CLASSE.NUM_SUBCLASSE = :SUBCLASSE)'
      '    AND'
      '    (:DEPARTAMENTO IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_DEPARTAMENTO = :DEPARTAMENTO)'
      '    AND'
      '    (:CIDADE IS NULL'
      '     OR'
      '      TB_CADASTRO.DESC_CIDADE = :CIDADE)'
      '    AND'
      '    (:COD_NOTA_CAB IS NULL'
      '    OR'
      '      TB_NOTA_CAB.COD_NOTA_CAB = :COD_NOTA_CAB)'
      '    AND'
      '    (:TIPO_PRODUTO IS NULL'
      '    OR'
      '     TB_PRODUTO.IND_TIPO_PRODUTO = :TIPO_PRODUTO)'
      '  GROUP BY'
      
        '    DECODE(:TIPO_QUEBRA,'#39'F'#39',Tb_filial.COD_FILIAL, DECODE(:TIPO_Q' +
        'UEBRA, '#39'V'#39',TB_NOTA_CAB.COD_VENDEDOR, TB_NOTA_CAB.COD_CADASTRO)),'
      
        '    DECODE(:TIPO_QUEBRA,'#39'F'#39',Tb_filial.DESC_FILIAL, DECODE(:TIPO_' +
        'QUEBRA, '#39'V'#39', TB_VENDEDOR.NOME, TB_CADASTRO.NOME)),'
      '    TB_FILIAL.NUM_CGC,'
      '    TB_PRODUTO.COD_PRODUTO,'
      '    TB_PRODUTO.DESC_PRODUTO,'
      '    TB_PRODUTO.NUM_FABRICANTE,'
      '    TB_PRODUTO.NUM_EMBALAGEM,'
      '    TB_PRODUTO.DESC_UNIDADE,'
      '    TB_PRODUTO.NUM_PESO_BRUTO,'
      '    TB_PRODUTO.NUM_PESO_LIQUIDO'
      ')'
      'GROUP BY'
      '  COD_FILIAL,'
      '  DESC_FILIAL,'
      '  COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  NUM_FABRICANTE,'
      '  NUM_EMBALAGEM,'
      '  DESC_UNIDADE,'
      '  NUM_CGC'
      'ORDER BY COD_PRODUTO')
    Variables.Data = {
      030000001B000000090000003A4F5045524143414F0500000000000000000000
      00070000003A444154415F490C0000000000000000000000070000003A444154
      415F460C0000000000000000000000070000003A46494C49414C030000000000
      000000000000090000003A56454E4445444F520100000004000000313D310000
      0000000D0000003A434F445F4F5045524143414F0100000004000000313D3100
      000000000B0000003A5449504F5F504147544F0500000000000000000000000C
      0000003A434F445F50524F4455544F0100000004000000313D31000000000012
      0000003A56454E4445444F525F505245504F53544F0300000000000000000000
      000B0000003A464F524E454345444F5203000000000000000000000012000000
      3A494E445F5449504F5F50524F445543414F0500000000000000000000000C00
      00003A434F445F43554C545552410300000000000000000000000D0000003A43
      4F445F434144415354524F030000000000000000000000070000003A45535441
      444F0500000000000000000000000D0000003A444550415254414D454E544F03
      00000000000000000000000C0000003A5449504F5F5155454252410500000000
      00000000000000070000003A4349444144450500000000000000000000000A00
      00003A434F445F53455249450100000004000000313D3100000000000A000000
      3A434F445F4D415243410300000000000000000000000D0000003A4D4F535452
      415F46524554450500000002000000530000000000070000003A434C41535345
      0300000000000000000000000A0000003A535542434C41535345030000000000
      0000000000000D0000003A434F445F4E4F54415F434142050000000000000000
      0000000B0000003A434F445F52454749414F0100000004000000313D31000000
      00000D0000003A5449504F5F50524F4455544F05000000000000000000000009
      0000003A434F445F43464F500100000004000000313D31000000000008000000
      3A5445434E49434F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E0000000A000000434F445F46494C49414C0100000000000B000000
      444553435F46494C49414C0100000000000B000000434F445F50524F4455544F
      0100000000000C000000444553435F50524F4455544F0100000000000E000000
      5351545F5155414E5449444144450100000000000A0000005356414C5F544F54
      414C0100000000000900000056414C5F435553544F0100000000000E0000004E
      554D5F464142524943414E54450100000000000D0000004E554D5F454D42414C
      4147454D0100000000000C000000444553435F554E4944414445010000000000
      0B000000535045534F5F425255544F0100000000000D000000535045534F5F4C
      49515549444F0100000000000C0000005351545F4C4954524147454D01000000
      0000070000004E554D5F434743010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRMapaVendaResCalcFields
    Left = 480
    Top = 424
    object QRMapaVendaResCOD_FILIAL: TFloatField
      FieldName = 'COD_FILIAL'
    end
    object QRMapaVendaResDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRMapaVendaResDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRMapaVendaResNUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
      Size = 15
    end
    object QRMapaVendaResCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRMapaVendaResSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
      DisplayFormat = '###,###,##0.00'
    end
    object QRMapaVendaResVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
    end
    object QRMapaVendaResSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object QRMapaVendaRessval_custo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sval_custo'
      Calculated = True
    end
    object QRMapaVendaResSPESO_BRUTO: TFloatField
      FieldName = 'SPESO_BRUTO'
    end
    object QRMapaVendaResSPESO_LIQUIDO: TFloatField
      FieldName = 'SPESO_LIQUIDO'
    end
    object QRMapaVendaResNUM_EMBALAGEM: TFloatField
      FieldName = 'NUM_EMBALAGEM'
    end
    object QRMapaVendaResDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
    end
    object QRMapaVendaResqt_quantidade: TFloatField
      FieldKind = fkCalculated
      FieldName = 'qt_quantidade'
      Calculated = True
    end
    object QRMapaVendaResSQT_LITRAGEM: TFloatField
      FieldName = 'SQT_LITRAGEM'
    end
    object QRMapaVendaResNUM_CGC: TStringField
      FieldName = 'NUM_CGC'
      Size = 18
    end
  end
  object QRVendedorCMedio2: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  COD_CLASSE + 0.00 AS COD_CLASSE,'
      '  DESC_CLASSE,'
      '  SUM(SVAL_TOTAL) AS SVAL_TOTAL,'
      '  SUM(SQT_QUANTIDADE) AS SQT_QUANTIDADE,'
      '  SUM(SQT_KILOS) AS SQT_KILOS,'
      '  SUM(SQT_KILOS_BONIFICACAO) AS SQT_KILOS_BONIFICACAO,'
      '  SUM(SNUM_PESO_LIQUIDO) AS SNUM_PESO_LIQUIDO,'
      '  SUM(SNUM_PESO_BRUTO) AS SNUM_PESO_BRUTO'
      'FROM'
      '('
      '  SELECT'
      '      Tb_produto.COD_PRODUTO,'
      '      Tb_produto.DESC_PRODUTO,'
      '      Tb_classe.COD_CLASSE,'
      '      Tb_classe.DESC_CLASSE,'
      
        '      SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_IT' +
        'EM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL' +
        '_IPI + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS ' +
        'SVAL_TOTAL,'
      '      SUM(Tb_nota_item.QT_QUANTIDADE) AS SQT_QUANTIDADE,'
      
        '      SUM(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM) A' +
        'S SQT_KILOS,'
      '      TO_NUMBER('#39'0'#39') AS SQT_KILOS_BONIFICACAO,'
      
        '      SUM(Tb_nota_item.QT_QUANTIDADE*TB_PRODUTO.NUM_PESO_LIQUIDO' +
        ') AS SNUM_PESO_LIQUIDO,'
      
        '      SUM(TB_NOTA_ITEM.QT_QUANTIDADE*TB_PRODUTO.NUM_PESO_BRUTO) ' +
        'AS SNUM_PESO_BRUTO'
      '    FROM'
      '      TB_NOTA_CAB,'
      '      TB_NOTA_ITEM,'
      '      TB_PRODUTO,'
      '      TB_VENDEDOR,'
      '      TB_OPERACAO,'
      '      TB_CLASSE,'
      '      TB_CADASTRO'
      '    WHERE'
      '      TB_VENDEDOR.COD_VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR'
      '      AND'
      '      Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '      AND'
      '      Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '      AND'
      '      Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '      AND'
      '      TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '      AND'
      '      TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '      AND'
      '      (:ind_vendas is null'
      '       or'
      '        Tb_operacao.ind_vendas = :ind_vendas)'
      '      AND'
      '      (:OPERACAO IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_OPERACAO = :OPERACAO)'
      '      AND'
      '      (:RAMO IS NULL'
      '        OR'
      '        TB_OPERACAO.COD_RAMO = :RAMO)'
      '      AND'
      '      TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '      AND'
      '      (:FILIAL IS NULL OR'
      '       :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '      AND'
      '      (:VENDEDOR IS NULL OR'
      '       :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '      AND'
      '      (:SUPERVISOR IS NULL OR'
      '       :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '      AND'
      '      (:COD_CADASTRO IS NULL OR'
      '       :COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO)'
      '      AND'
      '      (:COD_DEPARTAMENTO IS NULL OR'
      '       :COD_DEPARTAMENTO = TB_NOTA_CAB.COD_DEPARTAMENTO)'
      '      AND'
      '      (:COD_SERIE IS NULL OR'
      '       :COD_SERIE = TB_NOTA_CAB.COD_SERIE)'
      '      AND'
      '      (:VAL_TOTAL_INI IS NULL'
      '       OR'
      '        TB_NOTA_ITEM.VAL_TOTAL >= :VAL_TOTAL_INI)'
      '      AND'
      '      (:VAL_TOTAL_FIM IS NULL'
      '       OR'
      '        TB_NOTA_ITEM.VAL_TOTAL <= :VAL_TOTAL_FIM)'
      '      AND'
      '      (:ESTADO IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_ESTADO = :ESTADO)   '
      '      AND'
      '        (:CIDADE IS NULL'
      '         OR'
      '          TB_cadastro.COD_CIDADE = :CIDADE)'
      '      AND'
      '      TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '      AND'
      '      TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '      AND'
      '      (:CLASSE IS NULL'
      '       OR'
      '        TB_CLASSE.NUM_CLASSE =:CLASSE)'
      '    GROUP BY'
      '      Tb_produto.COD_PRODUTO,'
      '      Tb_produto.DESC_PRODUTO,'
      '      Tb_classe.COD_CLASSE,'
      '      Tb_classe.DESC_CLASSE'
      ''
      ' UNION ALL'
      ''
      '   SELECT'
      '      Tb_produto.COD_PRODUTO,'
      '      Tb_produto.DESC_PRODUTO,'
      '      Tb_classe.COD_CLASSE,'
      '      Tb_classe.DESC_CLASSE,'
      
        '      SUM((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_I' +
        'TEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VA' +
        'L_IPI + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1' +
        ') AS SVAL_TOTAL,'
      '      SUM((Tb_nota_item.QT_QUANTIDADE)*-1) AS SQT_QUANTIDADE,'
      
        '      SUM((Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*' +
        '-1) AS SQT_KILOS,'
      '      TO_NUMBER('#39'0'#39') AS SQT_KILOS_BONIFICACAO,'
      
        '      SUM(Tb_nota_item.QT_QUANTIDADE*TB_PRODUTO.NUM_PESO_LIQUIDO' +
        ') AS SNUM_PESO_LIQUIDO,'
      
        '      SUM(TB_NOTA_ITEM.QT_QUANTIDADE*TB_PRODUTO.NUM_PESO_BRUTO) ' +
        'AS SNUM_PESO_BRUTO'
      '    FROM'
      '      TB_NOTA_CAB,'
      '      TB_NOTA_ITEM,'
      '      TB_PRODUTO,'
      '      TB_VENDEDOR,'
      '      TB_OPERACAO,'
      '      TB_CLASSE,'
      '      TB_CADASTRO'
      '    WHERE'
      '      TB_VENDEDOR.COD_VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR'
      '      AND'
      '      Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '      AND'
      '      Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '      AND'
      '      Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '      AND'
      '      TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '      AND'
      '      TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '      AND'
      '      (Tb_operacao.ind_vendas = '#39'D'#39')'
      '      AND'
      '      (:OPERACAO IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_OPERACAO = :OPERACAO)'
      '      AND'
      '      (:RAMO IS NULL'
      '        OR'
      '        TB_OPERACAO.COD_RAMO = :RAMO)'
      '      AND'
      '      TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '      AND'
      '      (:FILIAL IS NULL OR'
      '       :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '      AND'
      '      (:VENDEDOR IS NULL OR'
      '       :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '      AND'
      '      (:SUPERVISOR IS NULL OR'
      '       :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '      AND'
      '      (:COD_CADASTRO IS NULL OR'
      '       :COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO)'
      '      AND'
      '      (:COD_DEPARTAMENTO IS NULL OR'
      '       :COD_DEPARTAMENTO = TB_NOTA_CAB.COD_DEPARTAMENTO)'
      '      AND'
      '      (:COD_SERIE IS NULL OR'
      '       :COD_SERIE = TB_NOTA_CAB.COD_SERIE)'
      '      AND'
      '      (:VAL_TOTAL_INI IS NULL'
      '       OR'
      '        TB_NOTA_ITEM.VAL_TOTAL >= :VAL_TOTAL_INI)'
      '      AND'
      '      (:VAL_TOTAL_FIM IS NULL'
      '       OR'
      '        TB_NOTA_ITEM.VAL_TOTAL <= :VAL_TOTAL_FIM)'
      '      AND'
      '      (:ESTADO IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_ESTADO = :ESTADO)'
      '      AND'
      '        (:CIDADE IS NULL'
      '         OR'
      '          TB_cadastro.COD_CIDADE = :CIDADE)'
      '      AND'
      '      TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '      AND'
      '      TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '      AND'
      '      (:CLASSE IS NULL'
      '       OR'
      '        TB_CLASSE.NUM_CLASSE =:CLASSE)'
      '    GROUP BY'
      '      Tb_produto.COD_PRODUTO,'
      '      Tb_produto.DESC_PRODUTO,'
      '      Tb_classe.COD_CLASSE,'
      '      Tb_classe.DESC_CLASSE'
      ''
      ''
      ' UNION ALL'
      ''
      '   SELECT'
      '      Tb_produto.COD_PRODUTO,'
      '      Tb_produto.DESC_PRODUTO,'
      '      Tb_classe.COD_CLASSE,'
      '      Tb_classe.DESC_CLASSE,'
      '      TO_NUMBER('#39'0'#39') AS SVAL_TOTAL,'
      '      TO_NUMBER('#39'0'#39') AS SQT_QUANTIDADE,'
      '      TO_NUMBER('#39'0'#39') AS SQT_KILOS,'
      
        '      SUM(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM) A' +
        'S SQT_KILOS_BONIFICACAO,'
      
        '      SUM(Tb_nota_item.QT_QUANTIDADE*TB_PRODUTO.NUM_PESO_LIQUIDO' +
        ') AS SNUM_PESO_LIQUIDO,'
      
        '      SUM(TB_NOTA_ITEM.QT_QUANTIDADE*TB_PRODUTO.NUM_PESO_BRUTO) ' +
        'AS SNUM_PESO_BRUTO'
      '    FROM'
      '      TB_NOTA_CAB,'
      '      TB_NOTA_ITEM,'
      '      TB_PRODUTO,'
      '      TB_VENDEDOR,'
      '      TB_OPERACAO,'
      '      TB_CLASSE,'
      '      TB_CADASTRO'
      '    WHERE'
      '      TB_VENDEDOR.COD_VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR'
      '      AND'
      '      Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '      AND'
      '      Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '      AND'
      '      Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '      AND'
      '      Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '      AND'
      '      TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '      AND'
      '      (Tb_operacao.ind_bonificacao = '#39'S'#39')'
      '      AND'
      '      (:OPERACAO IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_OPERACAO = :OPERACAO)'
      '      AND'
      '      (:RAMO IS NULL'
      '        OR'
      '        TB_OPERACAO.COD_RAMO = :RAMO)'
      '      AND'
      '      TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '      AND'
      '      (:FILIAL IS NULL OR'
      '       :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '      AND'
      '      (:VENDEDOR IS NULL OR'
      '       :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '      AND'
      '      (:SUPERVISOR IS NULL OR'
      '       :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '      AND'
      '      (:COD_CADASTRO IS NULL OR'
      '       :COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO)'
      '      AND'
      '      (:COD_DEPARTAMENTO IS NULL OR'
      '       :COD_DEPARTAMENTO = TB_NOTA_CAB.COD_DEPARTAMENTO)'
      '      AND'
      '      (:COD_SERIE IS NULL OR'
      '       :COD_SERIE = TB_NOTA_CAB.COD_SERIE)'
      '      AND'
      '      (:VAL_TOTAL_INI IS NULL'
      '       OR'
      '        TB_NOTA_ITEM.VAL_TOTAL >= :VAL_TOTAL_INI)'
      '      AND'
      '      (:VAL_TOTAL_FIM IS NULL'
      '       OR'
      '        TB_NOTA_ITEM.VAL_TOTAL <= :VAL_TOTAL_FIM)'
      '      AND'
      '      (:ESTADO IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_ESTADO = :ESTADO)'
      '      AND'
      '        (:CIDADE IS NULL'
      '         OR'
      '          TB_CADASTRO.COD_CIDADE = :CIDADE)'
      '      AND'
      '      TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '      AND'
      '      TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '      AND'
      '      (:CLASSE IS NULL'
      '       OR'
      '        TB_CLASSE.NUM_CLASSE =:CLASSE)'
      '    GROUP BY'
      '      Tb_produto.COD_PRODUTO,'
      '      Tb_produto.DESC_PRODUTO,'
      '      Tb_classe.COD_CLASSE,'
      '      Tb_classe.DESC_CLASSE'
      ')'
      'GROUP BY'
      '  COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  COD_CLASSE,'
      '  DESC_CLASSE'
      'ORDER BY'
      '  COD_CLASSE,'
      '  COD_PRODUTO')
    Variables.Data = {
      03000000100000000B0000003A494E445F56454E444153050000000000000000
      000000090000003A4F5045524143414F03000000000000000000000007000000
      3A444154415F490C0000000000000000000000070000003A444154415F460C00
      00000000000000000000070000003A46494C49414C0300000000000000000000
      00090000003A56454E4445444F520300000000000000000000000D0000003A43
      4F445F434144415354524F030000000000000000000000110000003A434F445F
      444550415254414D454E544F0300000000000000000000000A0000003A434F44
      5F53455249450500000000000000000000000B0000003A53555045525649534F
      520300000000000000000000000E0000003A56414C5F544F54414C5F494E4904
      00000000000000000000000E0000003A56414C5F544F54414C5F46494D040000
      000000000000000000070000003A45535441444F050000000000000000000000
      070000003A434C41535345030000000000000000000000050000003A52414D4F
      030000000000000000000000070000003A434944414445050000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000B000000434F445F50524F4455544F0100000000000C0000
      00444553435F50524F4455544F0100000000000A000000434F445F434C415353
      450100000000000B000000444553435F434C415353450100000000000A000000
      5356414C5F544F54414C0100000000000E0000005351545F5155414E54494441
      4445010000000000090000005351545F4B494C4F530100000000001500000053
      51545F4B494C4F535F424F4E494649434143414F01000000000011000000534E
      554D5F5045534F5F4C49515549444F0100000000000F000000534E554D5F5045
      534F5F425255544F010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRVendedorCMedio2CalcFields
    Left = 256
    Top = 384
    object QRVendedorCMedio2COD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRVendedorCMedio2COD_CLASSE: TFloatField
      FieldName = 'COD_CLASSE'
    end
    object QRVendedorCMedio2DESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QRVendedorCMedio2SVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
      DisplayFormat = '###,##0.00'
    end
    object QRVendedorCMedio2SQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
      DisplayFormat = '###,##0.00'
    end
    object QRVendedorCMedio2SQT_KILOS: TFloatField
      FieldName = 'SQT_KILOS'
      DisplayFormat = '###,##0.00'
    end
    object QRVendedorCMedio2SQT_KILOS_BONIFICACAO: TFloatField
      FieldName = 'SQT_KILOS_BONIFICACAO'
      DisplayFormat = '###,##0.00'
    end
    object QRVendedorCMedio2sPreco_Medio_KG: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_KG'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object QRVendedorCMedio2sPreco_Medio: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object QRVendedorCMedio2DESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRVendedorCMedio2SNUM_PESO_LIQUIDO: TFloatField
      FieldName = 'SNUM_PESO_LIQUIDO'
    end
    object QRVendedorCMedio2SNUM_PESO_BRUTO: TFloatField
      FieldName = 'SNUM_PESO_BRUTO'
    end
  end
  object QrVendaHistorico: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_nota_cab.COD_CADASTRO,'
      '  Tb_nota_cab.NUM_NOTA,'
      '  Tb_nota_cab.COD_SERIE,'
      '  Tb_nota_cab.IND_CONDICAO_PAGTO,'
      '  Tb_nota_cab.COD_NOTA_CAB,'
      '  Tb_nota_cab.DT_EMISSAO,'
      '  Tb_cadastro.NOME,'
      
        '  sum(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.C' +
        'OD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + TB_NOTA_ITEM.VAL_ICM' +
        'S_SUBST) as val_total'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_CADASTRO'
      'WHERE'
      '  (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB)'
      '  AND'
      '  (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO)'
      '  AND'
      '  (:FILIAL IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_FILIAL =  :FILIAL)'
      '  AND'
      '  (:CADASTRO IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_CADASTRO =  :CADASTRO)'
      '  AND'
      '  (TB_NOTA_CAB.DT_EMISSAO >= :DATA_I)'
      '  AND'
      '  (TB_NOTA_CAB.DT_EMISSAO <= :DATA_F)'
      ''
      'GROUP BY'
      '  Tb_nota_cab.COD_CADASTRO,'
      '  Tb_nota_cab.NUM_NOTA,'
      '  Tb_nota_cab.COD_SERIE,'
      '  Tb_nota_cab.IND_CONDICAO_PAGTO,'
      '  Tb_nota_cab.COD_NOTA_CAB,'
      '  Tb_nota_cab.DT_EMISSAO,'
      '  Tb_cadastro.NOME'
      'ORDER BY NOME,COD_CADASTRO,DT_EMISSAO')
    QBEDefinition.QBEFieldDefs = {
      04000000080000000C000000434F445F434144415354524F0100000000000800
      00004E554D5F4E4F544101000000000009000000434F445F5345524945010000
      00000012000000494E445F434F4E444943414F5F504147544F0100000000000C
      000000434F445F4E4F54415F4341420100000000000A00000044545F454D4953
      53414F010000000000040000004E4F4D450100000000000900000056414C5F54
      4F54414C010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 144
    Top = 216
    object QrVendaHistoricoCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QrVendaHistoricoNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QrVendaHistoricoCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QrVendaHistoricoIND_CONDICAO_PAGTO: TStringField
      FieldName = 'IND_CONDICAO_PAGTO'
      Required = True
      Size = 1
    end
    object QrVendaHistoricoCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QrVendaHistoricoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QrVendaHistoricoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QrVendaHistoricoVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QrVendaHistoricodt_vencimento: TDateField
      FieldKind = fkCalculated
      FieldName = 'dt_vencimento'
      Calculated = True
    end
    object QrVendaHistoricocond_pagamento: TStringField
      FieldKind = fkCalculated
      FieldName = 'cond_pagamento'
      Calculated = True
    end
  end
  object QRComissao: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      
        '  Tb_produto.DESC_PRODUTO || '#39' '#39' || TB_NOTA_ITEM.DESC_INF_ADICIO' +
        'NAL AS DESC_PRODUTO,'
      '  Tb_vendedor.COD_VENDEDOR,'
      '  Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '  Tb_vendedor.PERC_IRRF,'
      '  Tb_filial.COD_FILIAL,'
      '  Tb_filial.DESC_FILIAL,'
      '  Tb_produto.COD_PRODUTO,'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      '  to_date(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'dd/mm/yy'#39'),'
      '  TB_NOTA_CAB.NUM_NOTA,'
      '  TB_NOTA_CAB.COD_OPERACAO,'
      '  Tb_nota_item.PERC_COMISSAO PERC_COMISSAO_ITEM,'
      '  Tb_nota_CAB.PERC_COMISSAO PERC_COMISSAO_NOTA,'
      '  Tb_nota_item.PERC_DESCONTO,'
      '  Tb_produto.COD_CLASSE,'
      '  TB_NOTA_CAB.OBS,'
      
        '  SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.QT_QUANTIDA' +
        'DE,'
      
        '                                        Tb_nota_item.QT_QUANTIDA' +
        'DE*-1)) AS SQT_QUANTIDADE,'
      '  SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.VAL_TOTAL -'
      
        '                                        DECODE(TB_PARAM_SISTEMA.' +
        'COD_EMPRESA,'#39'GRASEL'#39',0,PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_' +
        'ITEM)) +'
      
        '                                        Tb_nota_item.VAL_DESPESA' +
        'S+TB_NOTA_ITEM.VAL_ICMS_SUBST,'
      '                                       (Tb_nota_item.VAL_TOTAL -'
      
        '                                        DECODE(TB_PARAM_SISTEMA.' +
        'COD_EMPRESA,'#39'GRASEL'#39',0,PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_' +
        'ITEM)) +'
      
        '                                        Tb_nota_item.VAL_DESPESA' +
        'S+TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1)) AS SVAL_TOTAL,'
      '  TB_CADASTRO.NOME'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_OPERACAO,'
      '  TB_PRODUTO,'
      '  TB_FILIAL,'
      '  TB_VENDEDOR,'
      '  TB_CADASTRO,'
      '  TB_CADASTRO TB_FABRICANTE,'
      '  TB_PARAM_SISTEMA'
      'WHERE'
      '  TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '  AND'
      '  Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '  AND'
      '  Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '  AND'
      '  Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '  AND'
      '  TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      '  TB_PRODUTO.COD_CADASTRO = TB_FABRICANTE.COD_CADASTRO(+)'
      '  AND'
      '  Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '  AND'
      '    ((TB_NOTA_ITEM.PERC_COMISSAO > 0) OR'
      '    (Tb_nota_CAB.PERC_COMISSAO > 0))'
      '  AND'
      
        '  ((TB_OPERACAO.IND_VENDAS = '#39'V'#39') or (TB_OPERACAO.IND_VENDAS = '#39 +
        'D'#39'))'
      '  AND'
      '  (:VENDEDOR IS NULL OR'
      '    TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '  AND'
      '  (:VENDEDOR_PREPOSTO IS NULL OR'
      '    TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO = :VENDEDOR_PREPOSTO)'
      '  AND'
      '  (:FILIAL IS NULL OR'
      '    TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '  AND'
      '  ((:SERIE IS NULL OR'
      '    TB_NOTA_CAB.COD_SERIE = :SERIE)'
      '    or'
      '   (:SERIE1 IS NULL OR'
      '      TB_NOTA_CAB.COD_SERIE = :SERIE1))'
      '  AND'
      
        '  to_date(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'dd/mm/yy'#39') between to_date' +
        '(:DATA_I, '#39'dd/mm/yy'#39') and to_date(:DATA_F, '#39'dd/mm/yy'#39')'
      '  AND'
      '  (:IND_CONDICAO_PAGTO IS NULL'
      '  OR'
      '  TB_NOTA_CAB.IND_CONDICAO_PAGTO = :IND_CONDICAO_PAGTO)'
      '  AND'
      '  (:SUPERVISOR IS NULL'
      '   OR'
      '    TB_VENDEDOR.COD_SUPERVISOR =:SUPERVISOR)'
      '  AND'
      '  (:TIPO_PRODUTO IS NULL'
      '   OR'
      '    TB_PRODUTO.IND_TIPO_PRODUTO = :TIPO_PRODUTO)'
      '  AND'
      '  (:COD_PRODUTO IS NULL'
      '   OR'
      '    Tb_nota_item.COD_PRODUTO = :COD_PRODUTO)'
      '  AND'
      '  (:COD_FABRICANTE IS NULL'
      '  OR'
      '  TB_PRODUTO.COD_CADASTRO = :COD_FABRICANTE)'
      'GROUP BY'
      '  Tb_filial.COD_FILIAL,'
      '  Tb_vendedor.COD_VENDEDOR,'
      '  Tb_vendedor.PERC_IRRF,'
      '  Tb_produto.COD_PRODUTO,'
      
        '  Tb_produto.DESC_PRODUTO || '#39' '#39' || TB_NOTA_ITEM.DESC_INF_ADICIO' +
        'NAL,'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      '  to_date(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'dd/mm/yy'#39'),'
      '  TB_NOTA_CAB.COD_OPERACAO,'
      '  TB_NOTA_CAB.NUM_NOTA,'
      '  Tb_vendedor.NOME,'
      '  Tb_filial.DESC_FILIAL,'
      '  Tb_nota_item.PERC_COMISSAO,'
      '  Tb_nota_CAB.PERC_COMISSAO,'
      '  Tb_nota_item.PERC_DESCONTO,'
      '  Tb_produto.COD_CLASSE,'
      '  TB_CADASTRO.NOME,'
      '  TB_NOTA_CAB.OBS'
      'ORDER BY :ORDEM')
    Variables.Data = {
      030000000D000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000090000003A56454E4445
      444F52030000000000000000000000070000003A46494C49414C030000000000
      000000000000060000003A534552494505000000000000000000000012000000
      3A56454E4445444F525F505245504F53544F0300000000000000000000000700
      00003A534552494531050000000000000000000000130000003A494E445F434F
      4E444943414F5F504147544F0300000000000000000000000B0000003A535550
      45525649534F520300000000000000000000000D0000003A5449504F5F50524F
      4455544F050000000000000000000000060000003A4F5244454D010000000000
      0000000000000C0000003A434F445F50524F4455544F03000000000000000000
      00000F0000003A434F445F464142524943414E54450300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      04000000110000000C000000444553435F50524F4455544F0100000000000C00
      0000434F445F56454E4445444F520100000000000D0000004E4F4D455F56454E
      4445444F520100000000000A000000434F445F46494C49414C0100000000000B
      000000444553435F46494C49414C0100000000000B000000434F445F50524F44
      55544F0100000000000E0000005351545F5155414E5449444144450100000000
      000A0000005356414C5F544F54414C01000000000012000000504552435F434F
      4D495353414F5F4954454D01000000000012000000504552435F434F4D495353
      414F5F4E4F544101000000000009000000504552435F49525246010000000000
      0A00000044545F454D495353414F010000000000080000004E554D5F4E4F5441
      0100000000000C000000434F445F4F5045524143414F0100000000000D000000
      504552435F444553434F4E544F0100000000000A000000434F445F434C415353
      45010000000000040000004E4F4D45010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRComissaoCalcFields
    Left = 256
    Top = 74
    object QRComissaoNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 40
    end
    object QRComissaoDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRComissaoSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
      DisplayFormat = '###,###,##0.00'
    end
    object QRComissaoSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object QRComissaoCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object QRComissaoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QRComissaoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRComissaoPERC_COMISSAO_ITEM: TFloatField
      FieldName = 'PERC_COMISSAO_ITEM'
      Required = True
    end
    object QRComissaoPERC_COMISSAO_NOTA: TFloatField
      FieldName = 'PERC_COMISSAO_NOTA'
      Required = True
    end
    object QRComissaoval_comissao: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_comissao'
      Calculated = True
    end
    object QRComissaoPERC_IRRF: TFloatField
      FieldName = 'PERC_IRRF'
    end
    object QRComissaosval_irrf: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sval_irrf'
      Calculated = True
    end
    object QRComissaoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRComissaoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRComissaoNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRComissaoCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
      Required = True
    end
    object QRComissaoPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
      Required = True
    end
    object QRComissaoCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object QRComissaoperc_comissao: TFloatField
      FieldKind = fkCalculated
      FieldName = 'perc_comissao'
      Calculated = True
    end
    object QRComissaoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QRComissaoOBS: TStringField
      FieldName = 'OBS'
    end
  end
  object QRComissaoCliente: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_vendedor.COD_VENDEDOR,'
      '  Tb_vendedor.NOME NOME_VENDEDOR,'
      '  Tb_vendedor.PERC_IRRF,'
      '  Tb_vendedor.PERC_COMISSAO1,'
      '  Tb_cadastro.COD_CADASTRO,'
      '  Tb_cadastro.NOME NOME_CADASTRO,'
      '  Tb_Nota_Cab.Num_Nota,'
      '  Tb_Nota_Cab.Cod_Serie,'
      '  Tb_Nota_Cab.Dt_Emissao,'
      '  Tb_Nota_Cab.Cod_Nota_Cab,'
      '  Tb_Nota_Cab.Perc_Comissao perc_comissao_nota,'
      
        '  decode(Tb_Nota_Item.Perc_Comissao,0,Tb_Produto.PERC_COMISSAO,T' +
        'b_Nota_Item.Perc_Comissao) perc_comissao_item,'
      '  Tb_Produto.PERC_COMISSAO AS perc_comissao_produto,'
      
        '  SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.QT_QUANTIDA' +
        'DE,'
      
        '                                         Tb_nota_item.QT_QUANTID' +
        'ADE*-1)) AS SQT_QUANTIDADE,'
      '  /* Modificado Marlon 31/05/2007'
      
        '  SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.VAL_TOTAL -' +
        ' Tb_nota_item.VAL_DESCONTO,'
      
        '                                        (Tb_nota_item.VAL_TOTAL ' +
        '- Tb_nota_item.VAL_DESCONTO)*-1)) AS SVAL_TOTAL'
      
        '  Retirada a soma do valor da substitui'#231#227'o a pedido do Junior da' +
        ' Zapoli  */'
      
        '  SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',(Tb_nota_item.VAL_TOTAL ' +
        '- (Tb_nota_item.VAL_DESCONTO * TB_NOTA_ITEM.QT_QUANTIDADE) - Tb_' +
        'nota_item.VAL_DESCONTO_RATEIO +TB_NOTA_ITEM.VAL_DESPESAS + TB_NO' +
        'TA_ITEM.VAL_FRETE), '
      
        '                                        (Tb_nota_item.VAL_TOTAL ' +
        '- (Tb_nota_item.VAL_DESCONTO * TB_NOTA_ITEM.QT_QUANTIDADE) - Tb_' +
        'nota_item.VAL_DESCONTO_RATEIO +TB_NOTA_ITEM.VAL_DESPESAS + TB_NO' +
        'TA_ITEM.VAL_FRETE)*-1)) AS SVAL_TOTAL,'
      
        '  SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',(Tb_nota_item.VAL_TOTAL ' +
        '+TB_NOTA_ITEM.VAL_DESPESAS + TB_NOTA_ITEM.VAL_FRETE), '
      
        '                                        (Tb_nota_item.VAL_TOTAL ' +
        '+TB_NOTA_ITEM.VAL_DESPESAS + TB_NOTA_ITEM.VAL_FRETE)*-1)) AS SVA' +
        'L_TOTAL_INJEPAR'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_CADASTRO,'
      '  TB_VENDEDOR,'
      '  TB_OPERACAO,'
      '  TB_PRODUTO'
      'WHERE'
      '  Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB'
      '  AND'
      '  TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '  AND'
      '  Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO'
      '  AND'
      '  Tb_nota_item.COD_PRODUTO = Tb_Produto.COD_PRODUTO'
      '  AND'
      '  Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR(+)'
      '  AND'
      
        '  ((TB_OPERACAO.IND_VENDAS = '#39'V'#39') OR (TB_OPERACAO.IND_VENDAS = '#39 +
        'D'#39'))'
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  (:FILIAL IS NULL OR'
      '   :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '  AND'
      '  (:VENDEDOR IS NULL OR'
      '   :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '  AND'
      '  (:VENDEDOR_PREPOSTO IS NULL OR'
      '   :VENDEDOR_PREPOSTO = TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO)'
      '  AND'
      '  (:NOTA IS NULL OR'
      '    TB_NOTA_CAB.NUM_NOTA = :NOTA)'
      '  AND'
      '  ((:SERIE IS NULL OR'
      '    TB_NOTA_CAB.COD_SERIE = :SERIE)'
      '   OR'
      '  (:SERIE1 IS NULL OR'
      '    TB_NOTA_CAB.COD_SERIE = :SERIE1))'
      '  AND'
      
        '    DECODE(TB_NOTA_CAB.IND_ENTRADA_SAIDA, '#39'E'#39',TB_NOTA_CAB.DT_REC' +
        'EBIMENTO, TB_NOTA_CAB.DT_EMISSAO) BETWEEN :DATA_I AND :DATA_F'
      '  AND'
      '  (:IND_CONDICAO_PAGTO IS NULL OR'
      '   TB_NOTA_CAB.IND_CONDICAO_PAGTO = :IND_CONDICAO_PAGTO)'
      '  AND'
      '    (:TIPO_PRODUTO IS NULL'
      '    OR'
      '     TB_PRODUTO.IND_TIPO_PRODUTO = :TIPO_PRODUTO)'
      'GROUP BY'
      '  Tb_vendedor.COD_VENDEDOR,'
      '  Tb_vendedor.NOME,'
      '  Tb_vendedor.PERC_IRRF,'
      '  Tb_vendedor.PERC_COMISSAO1,'
      '  Tb_cadastro.COD_CADASTRO,'
      '  Tb_cadastro.NOME,'
      '  Tb_Nota_Cab.Num_Nota,'
      '  Tb_Nota_Cab.Cod_Serie,'
      '  Tb_Nota_Cab.Dt_Emissao,'
      '  Tb_Nota_Cab.Cod_Nota_Cab,'
      '  Tb_Nota_Cab.Perc_Comissao,'
      '  Tb_Nota_Item.Perc_Comissao,'
      '  Tb_Produto.PERC_COMISSAO'
      ''
      'UNION ALL'
      ''
      
        '/* ESTE SQL SERVE APENAS PARA LISTAR VALORES A VISTA DE NOTA FIS' +
        'CAL A PRAZO - E QUANDO FOI SOLICITADO SOMENTE NOTAS A VISTA PARA' +
        ' LISTAR NO RELATORIO */'
      'SELECT'
      '  Tb_vendedor.COD_VENDEDOR,'
      '  Tb_vendedor.NOME NOME_VENDEDOR,'
      '  Tb_vendedor.PERC_IRRF,'
      '  Tb_vendedor.PERC_COMISSAO1,'
      '  Tb_cadastro.COD_CADASTRO,'
      '  Tb_cadastro.NOME NOME_CADASTRO,'
      '  Tb_Nota_Cab.Num_Nota,'
      '  Tb_Nota_Cab.Cod_Serie,'
      '  Tb_Nota_Cab.Dt_Emissao,'
      '  Tb_Nota_Cab.Cod_Nota_Cab,'
      '  Tb_Nota_Cab.Perc_Comissao perc_comissao_nota,'
      '  Tb_Nota_Cab.Perc_Comissao perc_comissao_item,'
      '  Tb_Nota_Cab.Perc_Comissao AS perc_comissao_produto,'
      '  0 AS SQT_QUANTIDADE,'
      '  Tb_Nota_Cab.Val_AVista AS SVAL_TOTAL,'
      '  Tb_Nota_Cab.Val_AVista AS SVAL_TOTAL_INJEPAR'
      '  '
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_CADASTRO,'
      '  TB_VENDEDOR,'
      '  TB_OPERACAO'
      'WHERE'
      '  TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '  AND'
      '  Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO'
      '  AND'
      '  Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR(+)'
      '  AND'
      
        '  ((TB_OPERACAO.IND_VENDAS = '#39'V'#39') OR (TB_OPERACAO.IND_VENDAS = '#39 +
        'D'#39'))'
      '  AND'
      
        '  TB_NOTA_CAB.IND_CONDICAO_PAGTO = '#39'2'#39' AND :IND_CONDICAO_PAGTO =' +
        ' '#39'1'#39
      '  AND'
      '  TB_NOTA_CAB.VAL_AVISTA > 0'
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  (:FILIAL IS NULL OR'
      '   :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '  AND'
      '  (:VENDEDOR IS NULL OR'
      '   :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '  AND'
      '  (:VENDEDOR_PREPOSTO IS NULL OR'
      '   :VENDEDOR_PREPOSTO = TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO)'
      '  AND'
      '  (:NOTA IS NULL OR'
      '    TB_NOTA_CAB.NUM_NOTA = :NOTA)'
      '  AND'
      '  ((:SERIE IS NULL OR'
      '    TB_NOTA_CAB.COD_SERIE = :SERIE)'
      '   OR'
      '  (:SERIE1 IS NULL OR'
      '    TB_NOTA_CAB.COD_SERIE = :SERIE1))'
      '  AND'
      
        '    DECODE(TB_NOTA_CAB.IND_ENTRADA_SAIDA, '#39'E'#39',TB_NOTA_CAB.DT_REC' +
        'EBIMENTO, TB_NOTA_CAB.DT_EMISSAO) BETWEEN :DATA_I AND :DATA_F'
      ''
      'ORDER BY NOME_VENDEDOR,Num_Nota')
    Variables.Data = {
      030000000A000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000070000003A46494C4941
      4C030000000000000000000000090000003A56454E4445444F52030000000000
      000000000000060000003A534552494505000000000000000000000012000000
      3A56454E4445444F525F505245504F53544F0300000000000000000000000700
      00003A534552494531050000000000000000000000130000003A494E445F434F
      4E444943414F5F504147544F030000000000000000000000050000003A4E4F54
      410500000000000000000000000D0000003A5449504F5F50524F4455544F0500
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000100000000C000000434F445F56454E4445444F520100000000000D00
      00004E4F4D455F56454E4445444F520100000000000C000000434F445F434144
      415354524F0100000000000D0000004E4F4D455F434144415354524F01000000
      0000080000004E554D5F4E4F544101000000000009000000434F445F53455249
      450100000000000A00000044545F454D495353414F0100000000000C00000043
      4F445F4E4F54415F4341420100000000000E0000005351545F5155414E544944
      4144450100000000000A0000005356414C5F544F54414C010000000000120000
      00504552435F434F4D495353414F5F4E4F544101000000000012000000504552
      435F434F4D495353414F5F4954454D01000000000009000000504552435F4952
      52460100000000000E000000504552435F434F4D495353414F31010000000000
      15000000504552435F434F4D495353414F5F50524F4455544F01000000000012
      0000005356414C5F544F54414C5F494E4A45504152010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRComissaoClienteCalcFields
    Left = 256
    Top = 128
    object QRComissaoClienteNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 40
    end
    object QRComissaoClienteNOME_CADASTRO: TStringField
      FieldName = 'NOME_CADASTRO'
      Size = 50
    end
    object QRComissaoClienteCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Size = 3
    end
    object QRComissaoClienteDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QRComissaoClienteSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRComissaoClienteSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRComissaoClienteCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object QRComissaoClienteCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRComissaoClienteCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QRComissaoClienteNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRComissaoClientePERC_COMISSAO_NOTA: TFloatField
      FieldName = 'PERC_COMISSAO_NOTA'
      Required = True
    end
    object QRComissaoClientePERC_COMISSAO_ITEM: TFloatField
      FieldName = 'PERC_COMISSAO_ITEM'
      Required = True
    end
    object QRComissaoClienteval_comissao: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_comissao'
      Calculated = True
    end
    object QRComissaoClientePERC_IRRF: TFloatField
      FieldName = 'PERC_IRRF'
    end
    object QRComissaoClientePERC_COMISSAO1: TFloatField
      FieldName = 'PERC_COMISSAO1'
    end
    object QRComissaoClientePERC_COMISSAO_PRODUTO: TFloatField
      FieldName = 'PERC_COMISSAO_PRODUTO'
    end
    object QRComissaoClienteval_comdesconto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_comdesconto'
      Calculated = True
    end
    object QRComissaoClienteSVAL_TOTAL_INJEPAR: TFloatField
      FieldName = 'SVAL_TOTAL_INJEPAR'
    end
  end
  object QrReceberHistorico: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '   Tb_conta_receber_cab.DT_VENCIMENTO,'
      '   Tb_conta_receber_cab.COD_NOTA_CAB,'
      '   Tb_conta_receber_mov.DT_MOVIMENTO,'
      '   Tb_conta_receber_mov.VAL_MOVIMENTO,'
      '   Tb_conta_receber_mov.IND_TIPO_MOVIMENTO,'
      '   Tb_conta_receber_mov.DESC_OBSERVACAO'
      'FROM'
      '   TB_CONTA_RECEBER_CAB,'
      '   TB_CONTA_RECEBER_MOV'
      'WHERE'
      
        '   (Tb_conta_receber_cab.COD_CONTA_RECEBER_CAB = Tb_conta_recebe' +
        'r_mov.COD_CONTA_RECEBER_CAB)'
      '   AND'
      '   (Tb_conta_receber_mov.IND_TIPO_MOVIMENTO <> '#39'PRINCIPAL'#39
      '    AND'
      '    Tb_conta_receber_mov.IND_TIPO_MOVIMENTO <> '#39'JURO'#39')'
      '   AND'
      '   (Tb_conta_receber_cab.COD_NOTA_CAB = :COD_NOTA_CAB)')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000D00000044545F56454E43494D454E544F0100000000000C
      000000434F445F4E4F54415F4341420100000000000C00000044545F4D4F5649
      4D454E544F0100000000000D00000056414C5F4D4F56494D454E544F01000000
      000012000000494E445F5449504F5F4D4F56494D454E544F0100000000000F00
      0000444553435F4F42534552564143414F010000000000}
    Master = QrVendaHistorico
    MasterFields = 'COD_NOTA_CAB'
    DetailFields = 'COD_NOTA_CAB'
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 144
    Top = 264
    object QrReceberHistoricoDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object QrReceberHistoricoCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QrReceberHistoricoDT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
    end
    object QrReceberHistoricoVAL_MOVIMENTO: TFloatField
      FieldName = 'VAL_MOVIMENTO'
    end
    object QrReceberHistoricoIND_TIPO_MOVIMENTO: TStringField
      FieldName = 'IND_TIPO_MOVIMENTO'
      Required = True
    end
    object QrReceberHistoricoDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 50
    end
  end
  object QRVendedorCMedio: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_VENDEDOR + 0.00 AS COD_VENDEDOR, /*moinho*/'
      '  NOME_VENDEDOR AS NOME_VENDEDOR,'
      '  COD_PRODUTO + 0.00 AS COD_PRODUTO, /*moinho*/'
      '  DESC_PRODUTO,'
      '  COD_CLASSE + 0.00 AS COD_CLASSE,  /*moinho*/'
      '  DESC_CLASSE,'
      '  num_classe + 0.00 AS NUM_CLASSE,'
      '  NUM_EMBALAGEM,'
      '  NUM_PESO_LIQUIDO,'
      '  NUM_PESO_BRUTO,'
      '  SUM(SVAL_TOTAL) AS SVAL_TOTAL,'
      '  SUM(SQT_QUANTIDADE) AS SQT_QUANTIDADE,'
      '  SUM(SQT_KILOS) AS SQT_KILOS,'
      '  SUM(SQT_KILOS_BONIFICACAO) AS SQT_KILOS_BONIFICACAO,'
      '  SUM(SNUM_PESO_LIQUIDO) AS SNUM_PESO_LIQUIDO,'
      '  SUM(SNUM_PESO_BRUTO) AS SNUM_PESO_BRUTO'
      'FROM'
      '('
      '  SELECT'
      '        Tb_vendedor.COD_VENDEDOR,'
      '        Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '        Tb_produto.COD_PRODUTO,'
      '        Tb_produto.DESC_PRODUTO,'
      '        Tb_Classe.Cod_Classe,'
      '        Tb_Classe.Desc_Classe,'
      '        tb_classe.num_classe,'
      '        TB_PRODUTO.NUM_EMBALAGEM,'
      '        TB_PRODUTO.NUM_PESO_LIQUIDO,'
      '        TB_PRODUTO.NUM_PESO_BRUTO,'
      
        '        SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_' +
        'ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.V' +
        'AL_IPI + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST) A' +
        'S SVAL_TOTAL,'
      '        SUM(Tb_nota_item.QT_QUANTIDADE) AS SQT_QUANTIDADE,'
      
        '        SUM(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)' +
        ' AS SQT_KILOS,'
      '        TO_NUMBER('#39'0'#39') AS SQT_KILOS_BONIFICACAO,        '
      
        '        SUM(Tb_nota_item.QT_QUANTIDADE*TB_PRODUTO.NUM_PESO_LIQUI' +
        'DO) AS SNUM_PESO_LIQUIDO,'
      
        '        SUM(TB_NOTA_ITEM.QT_QUANTIDADE*TB_PRODUTO.NUM_PESO_BRUTO' +
        ') AS SNUM_PESO_BRUTO'
      '      FROM'
      '        TB_NOTA_CAB,'
      '        TB_NOTA_ITEM,'
      '        TB_PRODUTO,'
      '        TB_FILIAL,'
      '        TB_VENDEDOR,'
      '        TB_OPERACAO,'
      '        TB_CLASSE,'
      '        tb_cadastro'
      '      WHERE'
      '        Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '        AND'
      '        Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '        AND'
      '        Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '        AND'
      '        Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '        AND'
      '        Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '        AND'
      '        TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '        AND'
      '        TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '        AND'
      '        (:ind_vendas is null'
      '         or'
      '          Tb_operacao.ind_vendas = :ind_vendas)'
      '        AND'
      '        (:OPERACAO IS NULL'
      '         OR'
      '          TB_NOTA_CAB.COD_OPERACAO = :OPERACAO)'
      '        AND'
      '        TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '        AND'
      '        (:RAMO IS NULL'
      '        OR'
      '          TB_OPERACAO.COD_RAMO = :RAMO)'
      '        AND'
      '        (:FILIAL IS NULL OR'
      '         :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '        AND'
      '        (:VENDEDOR IS NULL OR'
      '         :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '        AND'
      '        (:SUPERVISOR IS NULL OR'
      '         :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '        AND'
      '        (:COD_CADASTRO IS NULL OR'
      '         :COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO)'
      '        AND'
      '        (:COD_DEPARTAMENTO IS NULL OR'
      '         :COD_DEPARTAMENTO = TB_NOTA_CAB.COD_DEPARTAMENTO)'
      '        AND'
      '        (:COD_SERIE IS NULL OR'
      '         :COD_SERIE = TB_NOTA_CAB.COD_SERIE)'
      '        AND'
      '        (:VAL_TOTAL_INI IS NULL'
      '         OR'
      '          TB_NOTA_ITEM.VAL_TOTAL >= :VAL_TOTAL_INI)'
      '        AND'
      '        (:VAL_TOTAL_FIM IS NULL'
      '         OR'
      '          TB_NOTA_ITEM.VAL_TOTAL <= :VAL_TOTAL_FIM)'
      '        AND'
      '        (:ESTADO IS NULL'
      '         OR'
      '          TB_NOTA_CAB.COD_ESTADO = :ESTADO)'
      '        AND'
      '        (:CIDADE IS NULL'
      '         OR'
      '          TB_cadastro.COD_CIDADE = :CIDADE)'
      '        AND'
      '        TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '        AND'
      '        TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '        AND'
      '        (:CLASSE IS NULL'
      '         OR'
      '          TB_CLASSE.NUM_CLASSE =:CLASSE)'
      ''
      '      GROUP BY'
      '        Tb_vendedor.COD_VENDEDOR,'
      '        Tb_vendedor.NOME,'
      '        Tb_produto.COD_PRODUTO,'
      '        Tb_produto.DESC_PRODUTO,'
      '        Tb_Classe.Cod_Classe,'
      '        Tb_Classe.Desc_Classe,'
      '        TB_CLASSE.NUM_CLASSE,'
      '        TB_PRODUTO.NUM_EMBALAGEM,'
      '        TB_PRODUTO.NUM_PESO_LIQUIDO,'
      '        TB_PRODUTO.NUM_PESO_BRUTO'
      '        '
      '  UNION ALL'
      ''
      '  /* *** DEVOLUCOES ****  */'
      '  SELECT'
      '        Tb_vendedor.COD_VENDEDOR,'
      '        Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '        Tb_produto.COD_PRODUTO,'
      '        Tb_produto.DESC_PRODUTO,'
      '        Tb_Classe.Cod_Classe,'
      '        Tb_Classe.Desc_Classe,'
      '        tb_classe.num_classe,'
      '        TB_PRODUTO.NUM_EMBALAGEM,'
      '        TB_PRODUTO.NUM_PESO_LIQUIDO,'
      '        TB_PRODUTO.NUM_PESO_BRUTO,'
      
        '        SUM((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA' +
        '_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.' +
        'VAL_IPI + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*' +
        '-1) AS SVAL_TOTAL,'
      '        SUM((Tb_nota_item.QT_QUANTIDADE)*-1) AS SQT_QUANTIDADE,'
      
        '        SUM((TB_NOTA_ITEM.QT_QUANTIDADE*TB_PRODUTO.NUM_EMBALAGEM' +
        ')*-1) AS SQT_KILOS,'
      '        TO_NUMBER('#39'0'#39') AS SQT_KILOS_BONIFICACAO,'
      
        '        SUM(Tb_nota_item.QT_QUANTIDADE*TB_PRODUTO.NUM_PESO_LIQUI' +
        'DO) AS SNUM_PESO_LIQUIDO,'
      
        '        SUM(TB_NOTA_ITEM.QT_QUANTIDADE*TB_PRODUTO.NUM_PESO_BRUTO' +
        ') AS SNUM_PESO_BRUTO'
      '      FROM'
      '        TB_NOTA_CAB,'
      '        TB_NOTA_ITEM,'
      '        TB_PRODUTO,'
      '        TB_FILIAL,'
      '        TB_VENDEDOR,'
      '        TB_OPERACAO,'
      '        TB_CLASSE,'
      '        tb_cadastro'
      '      WHERE'
      '        Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '        AND'
      '        Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '        AND'
      '        Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '        AND'
      '        Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '        AND'
      '        Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '        AND'
      '        Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '        AND'
      '        tb_nota_cab.cod_cadastro = tb_cadastro.cod_cadastro'
      '        and'
      '        (Tb_operacao.ind_vendas = '#39'D'#39')'
      '        AND'
      '        (:OPERACAO IS NULL'
      '         OR'
      '          TB_NOTA_CAB.COD_OPERACAO = :OPERACAO)'
      '        AND'
      '        (:RAMO IS NULL'
      '          OR'
      '          TB_OPERACAO.COD_RAMO = :RAMO)'
      '        AND'
      '        TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '        AND'
      '        (:FILIAL IS NULL OR'
      '         :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '        AND'
      '        (:VENDEDOR IS NULL OR'
      '         :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '        AND'
      '        (:SUPERVISOR IS NULL OR'
      '         :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '        AND'
      '        (:COD_CADASTRO IS NULL OR'
      '         :COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO)'
      '        AND'
      '        (:COD_DEPARTAMENTO IS NULL OR'
      '         :COD_DEPARTAMENTO = TB_NOTA_CAB.COD_DEPARTAMENTO)'
      '        AND'
      '        (:COD_SERIE IS NULL OR'
      '         :COD_SERIE = TB_NOTA_CAB.COD_SERIE)'
      '        AND'
      '        (:VAL_TOTAL_INI IS NULL'
      '         OR'
      '          TB_NOTA_ITEM.VAL_TOTAL >= :VAL_TOTAL_INI)'
      '        AND'
      '        (:VAL_TOTAL_FIM IS NULL'
      '         OR'
      '          TB_NOTA_ITEM.VAL_TOTAL <= :VAL_TOTAL_FIM)'
      '        AND'
      '        (:ESTADO IS NULL'
      '         OR'
      '          TB_NOTA_CAB.COD_ESTADO = :ESTADO)'
      '        AND'
      '        (:CIDADE IS NULL'
      '         OR'
      '          TB_CADASTRO.COD_CIDADE = :CIDADE)'
      '        and'
      '        TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '        AND'
      '        TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '        AND'
      '        (:CLASSE IS NULL'
      '         OR'
      '          TB_CLASSE.NUM_CLASSE =:CLASSE)'
      ''
      '      GROUP BY'
      '        Tb_vendedor.COD_VENDEDOR,'
      '        Tb_vendedor.NOME,'
      '        Tb_produto.COD_PRODUTO,'
      '        Tb_produto.DESC_PRODUTO,'
      '        Tb_Classe.Cod_Classe,'
      '        Tb_Classe.Desc_Classe,'
      '        tb_classe.num_classe,'
      '        TB_PRODUTO.NUM_EMBALAGEM,'
      '        TB_PRODUTO.NUM_PESO_LIQUIDO,'
      '        TB_PRODUTO.NUM_PESO_BRUTO'
      ''
      '  UNION ALL'
      ''
      '  /* *** BONIFICA'#199#213'ES ****  */'
      ''
      '  SELECT'
      '        Tb_vendedor.COD_VENDEDOR,'
      '        Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '        Tb_produto.COD_PRODUTO,'
      '        Tb_produto.DESC_PRODUTO,'
      '        Tb_Classe.Cod_Classe,'
      '        Tb_Classe.Desc_Classe,'
      '        tb_classe.num_classe,'
      '        TB_PRODUTO.NUM_EMBALAGEM,'
      '        TB_PRODUTO.NUM_PESO_LIQUIDO,'
      '        TB_PRODUTO.NUM_PESO_BRUTO,'
      '        TO_NUMBER('#39'0'#39') AS SVAL_TOTAL,'
      '        TO_NUMBER('#39'0'#39') AS SQT_QUANTIDADE,'
      '        TO_NUMBER('#39'0'#39') AS SQT_KILOS,'
      
        '        SUM(TB_NOTA_ITEM.QT_QUANTIDADE*TB_PRODUTO.NUM_EMBALAGEM)' +
        ' AS SQT_KILOS_BONIFICACAO,'
      
        '        SUM(Tb_nota_item.QT_QUANTIDADE*TB_PRODUTO.NUM_PESO_LIQUI' +
        'DO) AS SNUM_PESO_LIQUIDO,'
      
        '        SUM(TB_NOTA_ITEM.QT_QUANTIDADE*TB_PRODUTO.NUM_PESO_BRUTO' +
        ') AS SNUM_PESO_BRUTO'
      '      FROM'
      '        TB_NOTA_CAB,'
      '        TB_NOTA_ITEM,'
      '        TB_PRODUTO,'
      '        TB_FILIAL,'
      '        TB_VENDEDOR,'
      '        TB_OPERACAO,'
      '        TB_CLASSE,'
      '        tb_cadastro'
      '      WHERE'
      '        Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '        AND'
      '        Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '        AND'
      '        Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '        AND'
      '        Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '        AND'
      '        Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '        AND'
      '        TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '        AND'
      '        tb_nota_cab.cod_cadastro = tb_cadastro.cod_cadastro'
      '        AND'
      '        (Tb_operacao.ind_bonificacao = '#39'S'#39')'
      '        AND'
      '        (:OPERACAO IS NULL'
      '         OR'
      '          TB_NOTA_CAB.COD_OPERACAO = :OPERACAO)'
      '        AND'
      '        (:RAMO IS NULL'
      '          OR'
      '          TB_OPERACAO.COD_RAMO = :RAMO)'
      '        AND'
      '        TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '        AND'
      '        (:FILIAL IS NULL OR'
      '         :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '        AND'
      '        (:VENDEDOR IS NULL OR'
      '         :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '        AND'
      '        (:SUPERVISOR IS NULL OR'
      '         :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '        AND'
      '        (:COD_CADASTRO IS NULL OR'
      '         :COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO)'
      '        AND'
      '        (:COD_DEPARTAMENTO IS NULL OR'
      '         :COD_DEPARTAMENTO = TB_NOTA_CAB.COD_DEPARTAMENTO)'
      '        AND'
      '        (:COD_SERIE IS NULL OR'
      '         :COD_SERIE = TB_NOTA_CAB.COD_SERIE)'
      '        AND'
      '        (:VAL_TOTAL_INI IS NULL'
      '         OR'
      '          TB_NOTA_ITEM.VAL_TOTAL >= :VAL_TOTAL_INI)'
      '        AND'
      '        (:VAL_TOTAL_FIM IS NULL'
      '         OR'
      '          TB_NOTA_ITEM.VAL_TOTAL <= :VAL_TOTAL_FIM)'
      '        AND'
      '        (:ESTADO IS NULL'
      '         OR'
      '          TB_NOTA_CAB.COD_ESTADO = :ESTADO)'
      '        AND'
      '        (:CIDADE IS NULL'
      '         OR'
      '          TB_cadastro.COD_CIDADE = :CIDADE)'
      '        AND'
      '        TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '        AND'
      '        TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '        AND'
      '        (:CLASSE IS NULL'
      '         OR'
      '          TB_CLASSE.NUM_CLASSE =:CLASSE)'
      ''
      '      GROUP BY'
      '        Tb_vendedor.COD_VENDEDOR,'
      '        Tb_vendedor.NOME,'
      '        Tb_produto.COD_PRODUTO,'
      '        Tb_produto.DESC_PRODUTO,'
      '        Tb_Classe.Cod_Classe,'
      '        Tb_Classe.Desc_Classe,'
      '        tb_classe.num_classe,'
      '        TB_PRODUTO.NUM_EMBALAGEM,'
      '        TB_PRODUTO.NUM_PESO_LIQUIDO,'
      '        TB_PRODUTO.NUM_PESO_BRUTO'
      ')'
      ' GROUP BY'
      '   COD_VENDEDOR,'
      '   NOME_VENDEDOR,'
      '   COD_PRODUTO,'
      '   DESC_PRODUTO,'
      '   COD_CLASSE,'
      '   DESC_CLASSE,'
      '   num_classe,'
      '   NUM_EMBALAGEM,'
      '   NUM_PESO_LIQUIDO,'
      '   NUM_PESO_BRUTO'
      ' ORDER BY'
      '   COD_VENDEDOR,'
      '   COD_CLASSE')
    Variables.Data = {
      0300000010000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C00000000000000000000000B0000003A494E445F56
      454E444153050000000000000000000000090000003A4F5045524143414F0300
      00000000000000000000070000003A46494C49414C0300000000000000000000
      00090000003A56454E4445444F520300000000000000000000000D0000003A43
      4F445F434144415354524F030000000000000000000000110000003A434F445F
      444550415254414D454E544F0300000000000000000000000A0000003A434F44
      5F53455249450500000000000000000000000B0000003A53555045525649534F
      520300000000000000000000000E0000003A56414C5F544F54414C5F494E4904
      00000000000000000000000E0000003A56414C5F544F54414C5F46494D040000
      000000000000000000070000003A45535441444F050000000000000000000000
      070000003A434C41535345030000000000000000000000050000003A52414D4F
      030000000000000000000000070000003A434944414445050000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      04000000100000000C000000434F445F56454E4445444F520100000000000D00
      00004E4F4D455F56454E4445444F520100000000000B000000434F445F50524F
      4455544F0100000000000C000000444553435F50524F4455544F010000000000
      0A000000434F445F434C415353450100000000000B000000444553435F434C41
      5353450100000000000A0000005356414C5F544F54414C0100000000000E0000
      005351545F5155414E544944414445010000000000090000005351545F4B494C
      4F53010000000000150000005351545F4B494C4F535F424F4E49464943414341
      4F0100000000000A0000004E554D5F434C415353450100000000000D0000004E
      554D5F454D42414C4147454D010000000000100000004E554D5F5045534F5F4C
      49515549444F01000000000011000000534E554D5F5045534F5F4C4951554944
      4F0100000000000E0000004E554D5F5045534F5F425255544F0100000000000F
      000000534E554D5F5045534F5F425255544F010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRVendedorCMedioCalcFields
    Left = 256
    Top = 331
    object QRVendedorCMedioCOD_VENDEDOR: TFloatField
      FieldName = 'COD_VENDEDOR'
    end
    object QRVendedorCMedioNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 40
    end
    object QRVendedorCMedioCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRVendedorCMedioCOD_CLASSE: TFloatField
      FieldName = 'COD_CLASSE'
    end
    object QRVendedorCMedioDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QRVendedorCMedioSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRVendedorCMedioSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRVendedorCMedioSQT_KILOS: TFloatField
      FieldName = 'SQT_KILOS'
    end
    object QRVendedorCMedioSQT_KILOS_BONIFICACAO: TFloatField
      FieldName = 'SQT_KILOS_BONIFICACAO'
    end
    object QRVendedorCMediosPreco_Medio: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio'
      Calculated = True
    end
    object QRVendedorCMediosPreco_Medio_KG: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_KG'
      Calculated = True
    end
    object QRVendedorCMedioNUM_CLASSE: TFloatField
      FieldName = 'NUM_CLASSE'
    end
    object QRVendedorCMedioDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRVendedorCMedioNUM_EMBALAGEM: TFloatField
      FieldName = 'NUM_EMBALAGEM'
    end
    object QRVendedorCMedioNUM_PESO_LIQUIDO: TFloatField
      FieldName = 'NUM_PESO_LIQUIDO'
    end
    object QRVendedorCMedioSNUM_PESO_LIQUIDO: TFloatField
      FieldName = 'SNUM_PESO_LIQUIDO'
    end
    object QRVendedorCMedioNUM_PESO_BRUTO: TFloatField
      FieldName = 'NUM_PESO_BRUTO'
    end
    object QRVendedorCMedioSNUM_PESO_BRUTO: TFloatField
      FieldName = 'SNUM_PESO_BRUTO'
    end
  end
  object QRMapaVenda: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TO_CHAR(DT_EMISSAO,'#39'DD/MM'#39') AS DIA,'
      '  COD_FILIAL + 0.00 AS COD_FILIAL,'
      '  DESC_FILIAL,'
      '  NUM_CGC,'
      
        '  DECODE(:TIPO, '#39'FATURAMENTODIARIO'#39', 0, COD_PRODUTO + 0.00) AS C' +
        'OD_PRODUTO,'
      
        '  DECODE(:TIPO, '#39'FATURAMENTODIARIO'#39', '#39'TOTAL DE ITENS VENDIDOS NO' +
        ' DIA:'#39', DESC_PRODUTO) AS DESC_PRODUTO,'
      
        '  DECODE(:TIPO, '#39'FATURAMENTODIARIO'#39', NULL, NUM_FABRICANTE) AS NU' +
        'M_FABRICANTE,'
      
        '  DECODE(:TIPO, '#39'FATURAMENTODIARIO'#39', 0, COD_LOTE_TIPO + 0) as CO' +
        'D_LOTE_TIPO,'
      '  NUM_EMBALAGEM,'
      '  DESC_UNIDADE,'
      '  EMISSAO,'
      '  SUM(SQT_LITRAGEM) AS SQT_LITRAGEM,'
      '  SUM(SQT_QUANTIDADE) AS SQT_QUANTIDADE,'
      '  SUM(SVAL_TOTAL) AS SVAL_TOTAL,'
      '  SUM(VAL_CUSTO) AS VAL_CUSTO,'
      '  SUM(SQT_QUANTIDADE*NUM_PESO_BRUTO) AS SPESO_BRUTO,'
      '  SUM(SQT_QUANTIDADE*NUM_PESO_LIQUIDO) AS SPESO_LIQUIDO'
      'FROM'
      '('
      '  SELECT'
      '    TB_NOTA_CAB.DT_EMISSAO,'
      
        '    DECODE(:TIPO_QUEBRA,'#39'F'#39',Tb_filial.COD_FILIAL, DECODE(:TIPO_Q' +
        'UEBRA, '#39'V'#39',TB_NOTA_CAB.COD_VENDEDOR, TB_NOTA_CAB.COD_CADASTRO)) ' +
        'AS COD_FILIAL,'
      
        '    DECODE(:TIPO_QUEBRA,'#39'F'#39',Tb_filial.DESC_FILIAL, DECODE(:TIPO_' +
        'QUEBRA, '#39'V'#39', TB_VENDEDOR.NOME, TB_CADASTRO.NOME))AS DESC_FILIAL,'
      '    TB_FILIAL.NUM_CGC,'
      '    TB_PRODUTO.COD_PRODUTO,'
      '    TB_PRODUTO.DESC_PRODUTO,'
      '    TB_PRODUTO.NUM_FABRICANTE,'
      '    TB_NOTA_ITEM.COD_LOTE_TIPO,'
      '    TB_PRODUTO.NUM_EMBALAGEM,'
      '    TB_PRODUTO.DESC_UNIDADE,'
      '    TB_NOTA_CAB.DT_EMISSAO as EMISSAO,'
      
        '    SUM(TB_NOTA_ITEM.QT_QUANTIDADE*TB_PRODUTO.NUM_CONVERTE_FARDO' +
        ') AS SQT_LITRAGEM,'
      '    SUM(Tb_nota_item.QT_QUANTIDADE) AS SQT_QUANTIDADE,'
      
        '    SUM(TB_NOTA_ITEM.VAL_TOTAL - NVL(PEGA_DESCONTO_ITEM(TB_NOTA_' +
        'ITEM.COD_NOTA_ITEM),0) +TB_NOTA_ITEM.VAL_DESPESAS+DECODE(:MOSTRA' +
        '_FRETE, '#39'N'#39', 0, TB_NOTA_ITEM.VAL_FRETE)+TB_NOTA_ITEM.VAL_ICMS_SU' +
        'BST + TB_NOTA_ITEM.VAL_IPI) AS SVAL_TOTAL,'
      
        '    SUM(TB_NOTA_ITEM.VAL_CUSTO*TB_NOTA_ITEM.QT_QUANTIDADE) AS VA' +
        'L_CUSTO,'
      '    TB_PRODUTO.NUM_PESO_BRUTO,'
      '    TB_PRODUTO.NUM_PESO_LIQUIDO'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_VENDEDOR,'
      '    TB_PRODUTO,'
      '    TB_FILIAL,'
      '    TB_LOTE_TIPO,'
      '    TB_CADASTRO,'
      '    TB_CLASSE,'
      '    TB_REGIAO'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_Vendedor.COD_VENDEDOR(+)'
      '    AND'
      '    TB_CADASTRO.COD_REGIAO = TB_REGIAO.COD_REGIAO'
      '    AND'
      '    Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL'
      '    AND'
      '    TB_NOTA_ITEM.COD_LOTE_TIPO = TB_LOTE_TIPO.COD_LOTE_TIPO'
      '    AND'
      '    TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '    AND'
      '    (:OPERACAO IS NULL OR'
      '      TB_OPERACAO.IND_VENDAS = :OPERACAO)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '    AND'
      '    (:VENDEDOR)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO = :VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:TECNICO IS NULL OR'
      '      TB_NOTA_CAB.COD_TECNICO = :TECNICO)'
      '    AND'
      '    (:TIPO_PAGTO IS NULL OR'
      '      TB_NOTA_CAB.IND_CONDICAO_PAGTO = :TIPO_PAGTO)'
      '    AND'
      '    (:COD_PRODUTO)'
      '    AND'
      '    :COD_OPERACAO'
      '    AND'
      '    :COD_CFOP'
      '    AND'
      '    :COD_SERIE'
      '    AND'
      '    :COD_REGIAO'
      '    AND'
      '    (:FORNECEDOR IS NULL OR'
      '      TB_PRODUTO.COD_CADASTRO = :FORNECEDOR)'
      '    AND'
      '    (:COD_MARCA IS NULL OR'
      '      TB_PRODUTO.COD_MARCA = :COD_MARCA)'
      '    AND'
      '    (:IND_TIPO_PRODUCAO IS NULL'
      '     OR'
      '      TB_LOTE_TIPO.IND_TIPO_PRODUCAO = :IND_TIPO_PRODUCAO)'
      '    AND'
      '    (:COD_CULTURA IS NULL OR'
      '      TB_NOTA_ITEM.COD_CULTURA = :COD_CULTURA)'
      '    AND'
      '    (:COD_CADASTRO IS NULL OR'
      '      TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO)'
      '    AND'
      '    (:ESTADO IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_ESTADO = :ESTADO)'
      '    AND'
      '    (:CLASSE IS NULL OR TB_CLASSE.NUM_CLASSE = :CLASSE)'
      '    AND'
      '    (:SUBCLASSE IS NULL OR TB_CLASSE.NUM_SUBCLASSE = :SUBCLASSE)'
      '    AND'
      '    (:DEPARTAMENTO IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_DEPARTAMENTO = :DEPARTAMENTO)'
      '    AND'
      '    (:CIDADE IS NULL'
      '     OR'
      '      TB_CADASTRO.DESC_CIDADE = :CIDADE)'
      '    AND'
      '    (:COD_NOTA_CAB IS NULL'
      '    OR'
      '      TB_NOTA_CAB.COD_NOTA_CAB = :COD_NOTA_CAB)'
      '    AND'
      '    (:TIPO_PRODUTO IS NULL'
      '    OR'
      '     TB_PRODUTO.IND_TIPO_PRODUTO = :TIPO_PRODUTO)'
      '  GROUP BY'
      '    TB_NOTA_CAB.DT_EMISSAO,'
      
        '    DECODE(:TIPO_QUEBRA,'#39'F'#39',Tb_filial.COD_FILIAL, DECODE(:TIPO_Q' +
        'UEBRA, '#39'V'#39',TB_NOTA_CAB.COD_VENDEDOR, TB_NOTA_CAB.COD_CADASTRO)),'
      
        '    DECODE(:TIPO_QUEBRA,'#39'F'#39',Tb_filial.DESC_FILIAL, DECODE(:TIPO_' +
        'QUEBRA, '#39'V'#39', TB_VENDEDOR.NOME, TB_CADASTRO.NOME)),'
      '    TB_FILIAL.NUM_CGC,'
      '    TB_PRODUTO.COD_PRODUTO,'
      '    TB_PRODUTO.DESC_PRODUTO,'
      '    TB_PRODUTO.NUM_FABRICANTE,'
      '    TB_NOTA_ITEM.COD_LOTE_TIPO,'
      '    TB_PRODUTO.NUM_EMBALAGEM,'
      '    TB_PRODUTO.DESC_UNIDADE,'
      '    TB_NOTA_CAB.DT_EMISSAO,'
      '    TB_PRODUTO.NUM_PESO_BRUTO,'
      '    TB_PRODUTO.NUM_PESO_LIQUIDO'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    TB_NOTA_CAB.DT_EMISSAO,'
      
        '    DECODE(:TIPO_QUEBRA,'#39'F'#39',Tb_filial.COD_FILIAL, DECODE(:TIPO_Q' +
        'UEBRA, '#39'V'#39',TB_NOTA_CAB.COD_VENDEDOR, TB_NOTA_CAB.COD_CADASTRO)) ' +
        'AS COD_FILIAL,'
      
        '    DECODE(:TIPO_QUEBRA,'#39'F'#39',Tb_filial.DESC_FILIAL, DECODE(:TIPO_' +
        'QUEBRA, '#39'V'#39', TB_VENDEDOR.NOME, TB_CADASTRO.NOME))AS DESC_FILIAL,'
      '    TB_FILIAL.NUM_CGC,'
      '    TB_PRODUTO.COD_PRODUTO,'
      '    TB_PRODUTO.DESC_PRODUTO,'
      '    TB_PRODUTO.NUM_FABRICANTE,'
      '    TB_NOTA_ITEM.COD_LOTE_TIPO,'
      '    TB_PRODUTO.NUM_EMBALAGEM,'
      '    TB_PRODUTO.DESC_UNIDADE,'
      '    TB_NOTA_CAB.DT_EMISSAO as EMISSAO,'
      
        '    SUM((TB_NOTA_ITEM.QT_QUANTIDADE*-1)-TB_PRODUTO.NUM_CONVERTE_' +
        'FARDO) AS SQT_LITRAGEM,'
      '    SUM(Tb_nota_item.QT_QUANTIDADE*-1) AS SQT_QUANTIDADE,'
      
        '    SUM((TB_NOTA_ITEM.VAL_TOTAL - NVL(PEGA_DESCONTO_ITEM(TB_NOTA' +
        '_ITEM.COD_NOTA_ITEM),0)  +TB_NOTA_ITEM.VAL_DESPESAS+TB_NOTA_ITEM' +
        '.VAL_FRETE+TB_NOTA_ITEM.VAL_ICMS_SUBST+TB_NOTA_ITEM.VAL_IPI)*-1)' +
        ' AS SVAL_TOTAL,'
      '    SUM((Tb_nota_item.VAL_CUSTO)*-1) AS VAL_CUSTO,'
      '    TB_PRODUTO.NUM_PESO_BRUTO,'
      '    TB_PRODUTO.NUM_PESO_LIQUIDO'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_PRODUTO,'
      '    TB_VENDEDOR,'
      '    TB_FILIAL,'
      '    TB_LOTE_TIPO,'
      '    TB_CADASTRO,'
      '    TB_CLASSE,'
      '    TB_REGIAO'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'D'#39
      '    AND'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_Vendedor.COD_VENDEDOR(+)'
      '    AND'
      '    TB_CADASTRO.COD_REGIAO = TB_REGIAO.COD_REGIAO'
      '    AND'
      '    Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL'
      ' /* AND'
      '    TB_PRODUTO.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO(+)   */'
      '    AND'
      '    TB_NOTA_ITEM.COD_LOTE_TIPO = TB_LOTE_TIPO.COD_LOTE_TIPO'
      '    AND'
      '    TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '    AND'
      '    (:VENDEDOR)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO = :VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:TECNICO IS NULL OR'
      '      TB_NOTA_CAB.COD_TECNICO = :TECNICO)'
      '    AND'
      '    :COD_OPERACAO'
      '    AND'
      '    :COD_CFOP'
      '    AND'
      '    (:COD_PRODUTO)'
      '    AND'
      '    :COD_SERIE'
      '    AND'
      '    :COD_REGIAO'
      '    AND   '
      '    (:FORNECEDOR IS NULL OR'
      '      TB_PRODUTO.COD_CADASTRO = :FORNECEDOR)'
      '    AND'
      '    (:COD_MARCA IS NULL OR'
      '      TB_PRODUTO.COD_MARCA = :COD_MARCA)'
      '    AND'
      '    (:IND_TIPO_PRODUCAO IS NULL'
      '     OR'
      '      TB_LOTE_TIPO.IND_TIPO_PRODUCAO = :IND_TIPO_PRODUCAO)'
      '    AND'
      '    (:COD_CULTURA IS NULL OR'
      '      TB_NOTA_ITEM.COD_CULTURA = :COD_CULTURA)'
      '    AND'
      '    (:COD_CADASTRO IS NULL OR'
      '      TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO)'
      '    AND'
      '    (:ESTADO IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_ESTADO = :ESTADO)'
      '    AND'
      '    (:CLASSE IS NULL OR TB_CLASSE.NUM_CLASSE = :CLASSE)'
      '    AND'
      '    (:SUBCLASSE IS NULL OR TB_CLASSE.NUM_SUBCLASSE = :SUBCLASSE)'
      '    AND'
      '    (:DEPARTAMENTO IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_DEPARTAMENTO = :DEPARTAMENTO)'
      '    AND'
      '    (:CIDADE IS NULL'
      '     OR'
      '      TB_CADASTRO.DESC_CIDADE = :CIDADE)'
      '    AND'
      '    (:COD_NOTA_CAB IS NULL'
      '    OR'
      '      TB_NOTA_CAB.COD_NOTA_CAB = :COD_NOTA_CAB)   '
      '    AND'
      '    (:TIPO_PRODUTO IS NULL'
      '    OR'
      '     TB_PRODUTO.IND_TIPO_PRODUTO = :TIPO_PRODUTO)'
      '  GROUP BY'
      '    TB_NOTA_CAB.DT_EMISSAO,'
      
        '    DECODE(:TIPO_QUEBRA,'#39'F'#39',Tb_filial.COD_FILIAL, DECODE(:TIPO_Q' +
        'UEBRA, '#39'V'#39',TB_NOTA_CAB.COD_VENDEDOR, TB_NOTA_CAB.COD_CADASTRO)),'
      
        '    DECODE(:TIPO_QUEBRA,'#39'F'#39',Tb_filial.DESC_FILIAL, DECODE(:TIPO_' +
        'QUEBRA, '#39'V'#39', TB_VENDEDOR.NOME, TB_CADASTRO.NOME)),'
      '    TB_FILIAL.NUM_CGC,'
      '    TB_PRODUTO.COD_PRODUTO,'
      '    TB_PRODUTO.DESC_PRODUTO,'
      '    TB_PRODUTO.NUM_FABRICANTE,'
      '    TB_NOTA_ITEM.COD_LOTE_TIPO,'
      '    TB_PRODUTO.NUM_EMBALAGEM,'
      '    TB_PRODUTO.DESC_UNIDADE,'
      '    TB_NOTA_CAB.DT_EMISSAO,'
      '    TB_PRODUTO.NUM_PESO_BRUTO,'
      '    TB_PRODUTO.NUM_PESO_LIQUIDO'
      ')'
      'GROUP BY'
      '  TO_CHAR(DT_EMISSAO,'#39'DD/MM'#39'),'
      '  COD_FILIAL,'
      '  DESC_FILIAL,'
      '  DECODE(:TIPO, '#39'FATURAMENTODIARIO'#39', 0, COD_PRODUTO + 0.00),'
      
        '  DECODE(:TIPO, '#39'FATURAMENTODIARIO'#39', '#39'TOTAL DE ITENS VENDIDOS NO' +
        ' DIA:'#39', DESC_PRODUTO),'
      '  DECODE(:TIPO, '#39'FATURAMENTODIARIO'#39', NULL, NUM_FABRICANTE),'
      '  DECODE(:TIPO, '#39'FATURAMENTODIARIO'#39', 0, COD_LOTE_TIPO + 0),'
      '  NUM_EMBALAGEM,'
      '  DESC_UNIDADE,'
      '  EMISSAO,'
      '  NUM_CGC'
      'ORDER BY COD_PRODUTO')
    Variables.Data = {
      030000001C000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000070000003A46494C4941
      4C030000000000000000000000090000003A56454E4445444F52010000000400
      0000313D3100000000000B0000003A5449504F5F504147544F05000000000000
      00000000000C0000003A434F445F50524F4455544F0100000004000000313D31
      0000000000120000003A56454E4445444F525F505245504F53544F0300000000
      000000000000000B0000003A464F524E454345444F5203000000000000000000
      0000120000003A494E445F5449504F5F50524F445543414F0500000000000000
      000000000C0000003A434F445F43554C54555241030000000000000000000000
      0D0000003A434F445F434144415354524F0300000000000000000000000A0000
      003A434F445F53455249450100000004000000313D310000000000070000003A
      45535441444F0500000000000000000000000D0000003A444550415254414D45
      4E544F0300000000000000000000000C0000003A5449504F5F51554542524105
      0000000000000000000000070000003A43494441444505000000000000000000
      00000A0000003A434F445F4D415243410300000000000000000000000D000000
      3A4D4F535452415F46524554450500000002000000530000000000070000003A
      434C415353450300000000000000000000000A0000003A535542434C41535345
      030000000000000000000000090000003A4F5045524143414F05000000000000
      00000000000D0000003A434F445F4F5045524143414F0100000004000000313D
      310000000000050000003A5449504F0500000000000000000000000D0000003A
      434F445F4E4F54415F4341420500000000000000000000000B0000003A434F44
      5F52454749414F0100000004000000313D3100000000000D0000003A5449504F
      5F50524F4455544F050000000000000000000000090000003A434F445F43464F
      500100000004000000313D310000000000080000003A5445434E49434F030000
      000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000011000000030000004449410100000000000A000000434F445F46494C
      49414C0100000000000B000000444553435F46494C49414C0100000000000B00
      0000434F445F50524F4455544F0100000000000C000000444553435F50524F44
      55544F0100000000000E0000005351545F5155414E5449444144450100000000
      000A0000005356414C5F544F54414C0100000000000900000056414C5F435553
      544F0100000000000D000000434F445F4C4F54455F5449504F0100000000000E
      0000004E554D5F464142524943414E544501000000000007000000454D495353
      414F0100000000000D0000004E554D5F454D42414C4147454D0100000000000C
      000000444553435F554E49444144450100000000000B000000535045534F5F42
      5255544F0100000000000D000000535045534F5F4C49515549444F0100000000
      000C0000005351545F4C4954524147454D010000000000070000004E554D5F43
      4743010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRMapaVendaCalcFields
    Left = 480
    Top = 373
    object QRMapaVendaDIA: TStringField
      FieldName = 'DIA'
      Size = 5
    end
    object QRMapaVendaSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
      DisplayFormat = '###,###,##0.00'
    end
    object QRMapaVendaSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object QRMapaVendaCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRMapaVendaDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRMapaVendaNUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
      Size = 15
    end
    object QRMapaVendaVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
    end
    object QRMapaVendasval_custo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sval_custo'
      Calculated = True
    end
    object QRMapaVendaCOD_FILIAL: TFloatField
      FieldName = 'COD_FILIAL'
    end
    object QRMapaVendaDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRMapaVendaCOD_LOTE_TIPO: TFloatField
      FieldName = 'COD_LOTE_TIPO'
    end
    object QRMapaVendaSPESO_BRUTO: TFloatField
      FieldName = 'SPESO_BRUTO'
    end
    object QRMapaVendaSPESO_LIQUIDO: TFloatField
      FieldName = 'SPESO_LIQUIDO'
    end
    object QRMapaVendaNUM_EMBALAGEM: TFloatField
      FieldName = 'NUM_EMBALAGEM'
    end
    object QRMapaVendaDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
    end
    object QRMapaVendaSQT_LITRAGEM: TFloatField
      FieldName = 'SQT_LITRAGEM'
    end
    object QRMapaVendaNUM_CGC: TStringField
      FieldName = 'NUM_CGC'
      Size = 18
    end
  end
  object QrSeguroCarga: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '    COD_FILIAL + 0.00 AS COD_FILIAL,'
      '    COD_ESTADO,'
      '    COD_CADASTRO + 0.00 AS COD_CADASTRO,'
      '    NUM_NOTA + 0.00 AS NUM_NOTA,'
      '    COD_SERIE,'
      '    DT_EMISSAO,'
      '    IND_ENTRADA_SAIDA,'
      '    COD_CIDADE + 0.00 AS COD_CIDADE,'
      '    NOME,'
      '    DESC_CIDADE,'
      '    PERC_FRETE,'
      '    DESC_ESTADO,'
      '    SVal_Total'
      'FROM'
      '('
      '  SELECT'
      '    Tb_nota_cab.COD_FILIAL,'
      '    Tb_nota_cab.COD_ESTADO,'
      '    Tb_nota_cab.COD_CADASTRO,'
      '    Tb_nota_cab.NUM_NOTA,'
      '    Tb_nota_cab.COD_SERIE,'
      '    Tb_nota_cab.DT_EMISSAO,'
      '    Tb_nota_cab.IND_ENTRADA_SAIDA,'
      '    Tb_cadastro.COD_CIDADE,'
      '    Tb_cadastro.NOME,'
      '    Tb_cadastro.DESC_CIDADE,'
      '    Tb_estado.PERC_FRETE,'
      '    Tb_estado.DESC_ESTADO,'
      '    SUM(Tb_nota_item.VAL_TOTAL) AS SVal_Total'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_CADASTRO,'
      '    TB_ESTADO,'
      '    TB_OPERACAO'
      '  WHERE'
      '     (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)'
      '     AND'
      '     (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO)'
      '     AND'
      '     (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)'
      '     AND'
      '     (Tb_nota_cab.COD_ESTADO = Tb_estado.COD_ESTADO)'
      '     AND'
      '     (Tb_nota_cab.COD_SERIE <> '#39'PE'#39')'
      '     AND'
      '     (TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39')'
      '     AND'
      '     (TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39')'
      '  /*   AND'
      '     (TB_OPERACAO.IND_VENDAS = '#39'V'#39') ALTERADO SERGIO 29/11/2002*/'
      '  /*   AND'
      
        '     (TB_OPERACAO.IND_EMITE = '#39'F'#39') A PEDIDO DA ROSI DIA 08/09/20' +
        '04 */'
      '     AND'
      '     (TB_NOTA_CAB.IND_NOTA_SEGURO = '#39'SIM'#39')'
      '     AND'
      '     (:FILIAL IS NULL OR'
      '       TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '     AND'
      '     (:COD_OPERACAO IS NULL OR'
      '       TB_NOTA_CAB.COD_OPERACAO = :COD_OPERACAO)'
      '     AND'
      '     (:IND_ENT_SAIDA IS NULL OR'
      '       TB_NOTA_CAB.IND_ENTRADA_SAIDA = :IND_ENT_SAIDA)'
      '     AND'
      '     (TB_NOTA_CAB.DT_EMISSAO >= :DATA_I)'
      '     AND'
      '     (TB_NOTA_CAB.DT_EMISSAO <= :DATA_F)'
      '  GROUP BY'
      '    Tb_nota_cab.COD_FILIAL,'
      '    Tb_nota_cab.COD_ESTADO,'
      '    Tb_nota_cab.COD_CADASTRO,'
      '    Tb_nota_cab.NUM_NOTA,'
      '    Tb_nota_cab.COD_SERIE,'
      '    Tb_nota_cab.DT_EMISSAO,'
      '    Tb_nota_cab.IND_ENTRADA_SAIDA,'
      '    Tb_cadastro.NOME,'
      '    Tb_cadastro.COD_CIDADE,'
      '    Tb_cadastro.DESC_CIDADE,'
      '    Tb_estado.PERC_FRETE,'
      '    Tb_estado.DESC_ESTADO'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_nota_cab.COD_FILIAL,'
      '    Tb_nota_cab.COD_ESTADO,'
      '    Tb_nota_cab.COD_CADASTRO,'
      '    Tb_nota_cab.NUM_NOTA,'
      '    Tb_nota_cab.COD_SERIE,'
      '    Tb_nota_cab.DT_EMISSAO,'
      '    Tb_nota_cab.IND_ENTRADA_SAIDA,'
      '    Tb_cadastro.COD_CIDADE,'
      '    Tb_cadastro.NOME,'
      '    Tb_cadastro.DESC_CIDADE,'
      '    Tb_estado.PERC_FRETE,'
      '    Tb_estado.DESC_ESTADO,'
      '    SUM(Tb_nota_item.VAL_TOTAL) AS SVal_Total'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_CADASTRO,'
      '    TB_ESTADO,'
      '    TB_OPERACAO'
      '  WHERE'
      '     (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)'
      '     AND'
      '     (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO)'
      '     AND'
      '     (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)'
      '     AND'
      '     (Tb_nota_cab.COD_ESTADO = Tb_estado.COD_ESTADO)'
      '     AND'
      '     (Tb_nota_cab.COD_SERIE <> '#39'PE'#39')'
      '     AND'
      '     (TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39')'
      '     AND'
      '     (TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39')'
      '  /*   AND'
      '     (TB_OPERACAO.IND_VENDAS = '#39'V'#39') ALTERADO SERGIO 29/11/2002*/'
      '  /*   AND'
      
        '     (TB_OPERACAO.IND_EMITE = '#39'F'#39') A PEDIDO DA ROSI DIA 08/09/20' +
        '04 */'
      '     AND'
      '     (TB_NOTA_CAB.IND_NOTA_SEGURO = '#39'SIM'#39')'
      '     AND'
      '     (:FILIAL IS NULL OR'
      '       TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '     AND'
      '     (:COD_OPERACAO IS NULL OR'
      '       TB_NOTA_CAB.COD_OPERACAO = :COD_OPERACAO)'
      '     AND'
      '     (:IND_ENT_SAIDA IS NULL OR'
      '       TB_NOTA_CAB.IND_ENTRADA_SAIDA = :IND_ENT_SAIDA)'
      '     AND'
      '     (TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I)'
      '     AND'
      '     (TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F)'
      '  GROUP BY'
      '    Tb_nota_cab.COD_FILIAL,'
      '    Tb_nota_cab.COD_ESTADO,'
      '    Tb_nota_cab.COD_CADASTRO,'
      '    Tb_nota_cab.NUM_NOTA,'
      '    Tb_nota_cab.COD_SERIE,'
      '    Tb_nota_cab.DT_EMISSAO,'
      '    Tb_nota_cab.IND_ENTRADA_SAIDA,'
      '    Tb_cadastro.NOME,'
      '    Tb_cadastro.COD_CIDADE,'
      '    Tb_cadastro.DESC_CIDADE,'
      '    Tb_estado.PERC_FRETE,'
      '    Tb_estado.DESC_ESTADO'
      ' )'
      'ORDER BY'
      '  COD_ESTADO,'
      '  DT_EMISSAO,'
      '  NUM_NOTA,'
      '  DESC_CIDADE'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Variables.Data = {
      0300000005000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000070000003A46494C4941
      4C0300000000000000000000000E0000003A494E445F454E545F534149444105
      00000000000000000000000D0000003A434F445F4F5045524143414F03000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000D0000000A000000434F445F46494C49414C0100000000000A000000
      434F445F45535441444F0100000000000C000000434F445F434144415354524F
      010000000000080000004E554D5F4E4F544101000000000009000000434F445F
      53455249450100000000000A00000044545F454D495353414F01000000000004
      0000004E4F4D450100000000000A000000504552435F46524554450100000000
      000A0000005356414C5F544F54414C0100000000000B000000444553435F4553
      5441444F01000000000011000000494E445F454E54524144415F534149444101
      00000000000B000000444553435F4349444144450100000000000A000000434F
      445F434944414445010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 144
    Top = 424
    object QrSeguroCargaCOD_FILIAL: TFloatField
      FieldName = 'COD_FILIAL'
    end
    object QrSeguroCargaCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
    object QrSeguroCargaCOD_CADASTRO: TFloatField
      FieldName = 'COD_CADASTRO'
    end
    object QrSeguroCargaNUM_NOTA: TFloatField
      FieldName = 'NUM_NOTA'
    end
    object QrSeguroCargaCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Size = 3
    end
    object QrSeguroCargaDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QrSeguroCargaIND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 1
    end
    object QrSeguroCargaCOD_CIDADE: TFloatField
      FieldName = 'COD_CIDADE'
    end
    object QrSeguroCargaNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object QrSeguroCargaDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object QrSeguroCargaPERC_FRETE: TFloatField
      FieldName = 'PERC_FRETE'
    end
    object QrSeguroCargaDESC_ESTADO: TStringField
      FieldName = 'DESC_ESTADO'
      Size = 30
    end
    object QrSeguroCargaSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
  end
  object QrResumoCliente: TOracleDataSet1
    SQL.Strings = (
      '/* esta sql '#233' montada na rotina */'
      'SELECT'
      '   STIPO,'
      '   COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '   COD_LOTE_TIPO,'
      '   NUM_EMBALAGEM,'
      '   DESC_PRODUTO,'
      '   COD_CADASTRO + 0.00 AS COD_CADASTRO,'
      '   NOMECADASTRO,'
      '   FONECADASTRO,'
      '   COD_VENDEDOR + 0.00 AS COD_VENDEDOR,'
      '   NUM_NOTA + 0.00 AS NUM_NOTA,'
      '   DT_EMISSAO,'
      '   DT_MES,'
      '   DESC_MES,'
      '   Sum(SQT_QUANTIDADE) as SQT_QUANTIDADE,'
      '   Sum(SVAL_TOTAL) as SVAL_TOTAL,'
      '   cod_regiao,'
      '   VAL_CUSTO,'
      '   DESC_REGIAO'
      'FROM'
      '('
      '  SELECT'
      '     '#39'MOVIMENTO'#39' AS STIPO,'
      '     Tb_nota_item.COD_PRODUTO,'
      '     Tb_nota_item.COD_LOTE_TIPO,'
      '     TB_PRODUTO.NUM_EMBALAGEM,'
      '     Tb_produto.DESC_PRODUTO,'
      '     Tb_cadastro.COD_CADASTRO,'
      '     Tb_cadastro.NOME AS NOMECADASTRO,'
      '     Tb_cadastro.DESC_TELEFONE AS FONECADASTRO,'
      '     Tb_nota_cab.COD_VENDEDOR,'
      '     Tb_nota_cab.NUM_NOTA,'
      '     Tb_nota_cab.DT_EMISSAO,'
      '     TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,'#39'MM'#39')) DT_MES,'
      '     to_char(Tb_Nota_Cab.DT_EMISSAO,'#39'Month'#39') desc_mes,'
      '     Sum(Tb_nota_item.QT_QUANTIDADE) as SQT_QUANTIDADE,'
      
        '     Sum(Tb_nota_item.VAL_TOTAL + TB_NOTA_ITEM.VAL_ICMS_SUBST) a' +
        's SVAL_TOTAL,'
      '     tb_cadastro.cod_regiao,'
      '     Tb_nota_item.VAL_CUSTO,'
      '     TB_REGIAO.DESC_REGIAO'
      '  FROM'
      '     TB_NOTA_CAB,'
      '     TB_NOTA_ITEM,'
      '     TB_CADASTRO,'
      '     TB_OPERACAO,'
      '     TB_PRODUTO,'
      '     TB_CLASSE,'
      '     TB_REGIAO'
      '  WHERE'
      '     (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO)'
      '     AND'
      '     (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO)'
      '     AND'
      '     (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB)'
      '     AND'
      '     (Tb_CADASTRO.COD_REGIAO = Tb_REGIAO.COD_REGIAO)'
      '     AND'
      '     (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)'
      '     AND'
      '     (Tb_produto.COD_CLASSE = TB_CLASSE.COD_CLASSE)'
      '     AND'
      '     TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '     AND'
      '     TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      '     AND'
      '     TB_OPERACAO.IND_BONIFICACAO <> '#39'S'#39
      '     AND'
      '     (:VENDEDOR IS NULL OR'
      '       TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '     AND'
      '     (:FILIAL IS NULL OR'
      '        TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '     AND'
      '     (:OPERACAO IS NULL OR'
      '        TB_NOTA_CAB.COD_OPERACAO = :OPERACAO)'
      '     AND'
      '     (:CADASTRO IS NULL OR'
      '        TB_NOTA_CAB.COD_CADASTRO = :CADASTRO)'
      '     AND'
      '     (:PRODUTO IS NULL OR'
      '        TB_NOTA_ITEM.COD_PRODUTO = :PRODUTO)'
      '     AND'
      '     (TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I)'
      '     AND'
      '     (TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F)'
      '     AND'
      '     (:COD_CLASSE IS NULL'
      '     OR'
      '     Tb_Classe.NUM_CLASSE = :COD_CLASSE)'
      '     AND'
      '     (:COD_SUBCLASSE IS NULL'
      '     OR'
      '     Tb_Classe.NUM_SUBCLASSE = :COD_SUBCLASSE)'
      '  GROUP BY'
      '     Tb_nota_item.COD_PRODUTO,'
      '     Tb_nota_item.COD_LOTE_TIPO,'
      '     TB_PRODUTO.NUM_EMBALAGEM,'
      '     Tb_produto.DESC_PRODUTO,'
      '     Tb_cadastro.COD_CADASTRO,'
      '     Tb_cadastro.NOME,'
      '     Tb_cadastro.DESC_TELEFONE,'
      '     Tb_nota_cab.COD_VENDEDOR,'
      '     Tb_nota_cab.NUM_NOTA,'
      '     Tb_nota_cab.DT_EMISSAO,'
      '     TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,'#39'MM'#39')),'
      '     to_char(Tb_Nota_Cab.DT_EMISSAO,'#39'Month'#39'),'
      '     tb_cadastro.cod_regiao,'
      '     Tb_nota_item.VAL_CUSTO,'
      '     TB_REGIAO.DESC_REGIAO'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '     '#39'MOVIMENTO'#39' AS STIPO,'
      '     Tb_nota_item.COD_PRODUTO,'
      '     Tb_nota_item.COD_LOTE_TIPO,'
      '     TB_PRODUTO.NUM_EMBALAGEM,'
      '     Tb_produto.DESC_PRODUTO,'
      '     Tb_cadastro.COD_CADASTRO,'
      '     Tb_cadastro.NOME AS NOMECADASTRO,'
      '     Tb_cadastro.DESC_TELEFONE AS FONECADASTRO,'
      '     Tb_nota_cab.COD_VENDEDOR,'
      '     Tb_nota_cab.NUM_NOTA,'
      '     Tb_nota_cab.DT_EMISSAO,'
      '     TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,'#39'MM'#39')) DT_MES,'
      '     to_char(Tb_Nota_Cab.DT_EMISSAO,'#39'Month'#39') desc_mes,'
      '     Sum(Tb_nota_item.QT_QUANTIDADE) * (-1) as SQT_QUANTIDADE,'
      
        '     Sum(Tb_nota_item.VAL_TOTAL + TB_NOTA_ITEM.VAL_ICMS_SUBST) *' +
        ' (-1) as SVAL_TOTAL,'
      '     TB_CADASTRO.cod_regiao,'
      '     Tb_nota_item.VAL_CUSTO,'
      '     TB_REGIAO.DESC_REGIAO'
      '  FROM'
      '     TB_NOTA_CAB,'
      '     TB_NOTA_ITEM,'
      '     TB_CADASTRO,'
      '     TB_OPERACAO,'
      '     TB_PRODUTO,'
      '     TB_CLASSE,'
      '     TB_REGIAO'
      '  WHERE'
      '     (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO)'
      '     AND'
      '     (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO)'
      '     AND'
      '     (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB)'
      '     AND'
      '     (Tb_CADASTRO.COD_REGIAO = Tb_REGIAO.COD_REGIAO)'
      '     AND'
      '     (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)'
      '     and'
      '     (Tb_produto.COD_CLASSE = TB_CLASSE.COD_CLASSE)'
      '     AND'
      '     TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '     AND'
      '     TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39
      '     AND'
      '     TB_OPERACAO.IND_VENDAS = '#39'D'#39
      '     AND'
      '     (:VENDEDOR IS NULL OR'
      '       TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '     AND'
      '     (:FILIAL IS NULL OR'
      '        TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '     AND'
      '     (:CADASTRO IS NULL OR'
      '        TB_NOTA_CAB.COD_CADASTRO = :CADASTRO)'
      '     AND'
      '     (:PRODUTO IS NULL OR'
      '        TB_NOTA_ITEM.COD_PRODUTO = :PRODUTO)'
      '     AND'
      '     (TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I)'
      '     AND'
      '     (TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F)'
      '      AND'
      '     (:COD_CLASSE IS NULL'
      '     OR'
      '     Tb_Classe.NUM_CLASSE = :COD_CLASSE)'
      '     AND'
      '     (:COD_SUBCLASSE IS NULL'
      '     or'
      '     Tb_Classe.NUM_SUBCLASSE = :COD_SUBCLASSE)'
      '  GROUP BY'
      '     Tb_nota_item.COD_PRODUTO,'
      '     Tb_nota_item.COD_LOTE_TIPO,'
      '     TB_PRODUTO.NUM_EMBALAGEM,'
      '     Tb_produto.DESC_PRODUTO,'
      '     Tb_cadastro.COD_CADASTRO,'
      '     Tb_cadastro.NOME,'
      '     Tb_cadastro.DESC_TELEFONE,'
      '     Tb_nota_cab.COD_VENDEDOR,'
      '     Tb_nota_cab.NUM_NOTA,'
      '     Tb_nota_cab.DT_EMISSAO,'
      '     TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,'#39'MM'#39')),'
      '     to_char(Tb_Nota_Cab.DT_EMISSAO,'#39'Month'#39'),'
      '     tb_cadastro.cod_regiao,'
      '     Tb_nota_item.VAL_CUSTO,'
      '     TB_REGIAO.DESC_REGIAO'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '     '#39'BONIFICACAO'#39' AS STIPO,'
      '     Tb_nota_item.COD_PRODUTO,'
      '     Tb_nota_item.COD_LOTE_TIPO,'
      '     TB_PRODUTO.NUM_EMBALAGEM,'
      '     Tb_produto.DESC_PRODUTO,'
      '     Tb_cadastro.COD_CADASTRO,'
      '     Tb_cadastro.NOME AS NOMECADASTRO,'
      '     Tb_cadastro.DESC_TELEFONE AS FONECADASTRO,'
      '     Tb_nota_cab.COD_VENDEDOR,'
      '     Tb_nota_cab.NUM_NOTA,'
      '     Tb_nota_cab.DT_EMISSAO,'
      '     TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,'#39'MM'#39')) DT_MES,'
      '     to_char(Tb_Nota_Cab.DT_EMISSAO,'#39'Month'#39') desc_mes,'
      '     Sum(Tb_nota_item.QT_QUANTIDADE) as SQT_QUANTIDADE,'
      
        '     Sum(Tb_nota_item.VAL_TOTAL + TB_NOTA_ITEM.VAL_ICMS_SUBST) a' +
        's SVAL_TOTAL,'
      '     tb_cadastro.cod_regiao,'
      '     Tb_nota_item.VAL_CUSTO,'
      '     TB_REGIAO.DESC_REGIAO'
      '  FROM'
      '     TB_NOTA_CAB,'
      '     TB_NOTA_ITEM,'
      '     TB_CADASTRO,'
      '     TB_OPERACAO,'
      '     TB_PRODUTO,'
      '     TB_CLASSE,'
      '     TB_REGIAO'
      '  WHERE'
      '     (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO)'
      '     AND'
      '     (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO)'
      '     AND'
      '     (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB)'
      '     AND'
      '     (Tb_CADASTRO.COD_REGIAO = Tb_REGIAO.COD_REGIAO)'
      '     AND'
      '     (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)'
      '     and'
      '     (Tb_produto.COD_CLASSE = TB_CLASSE.COD_CLASSE)'
      '     AND'
      '     TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '     AND'
      '     TB_OPERACAO.IND_BONIFICACAO = '#39'S'#39
      '     AND'
      '     (:VENDEDOR IS NULL OR'
      '       TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '     AND'
      '     (:FILIAL IS NULL OR'
      '        TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '     AND'
      '     (:CADASTRO IS NULL OR'
      '        TB_NOTA_CAB.COD_CADASTRO = :CADASTRO)'
      '     AND'
      '     (:PRODUTO IS NULL OR'
      '        TB_NOTA_ITEM.COD_PRODUTO = :PRODUTO)'
      '     AND'
      '     (TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I)'
      '     AND'
      '     (TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F)'
      '      AND'
      '     (:COD_CLASSE IS NULL'
      '     OR'
      '     Tb_Classe.NUM_CLASSE = :COD_CLASSE)'
      '     AND'
      '     (:COD_SUBCLASSE IS NULL'
      '     or'
      '     Tb_Classe.NUM_SUBCLASSE = :COD_SUBCLASSE)'
      '  GROUP BY'
      '     Tb_nota_item.COD_PRODUTO,'
      '     Tb_nota_item.COD_LOTE_TIPO,'
      '     TB_PRODUTO.NUM_EMBALAGEM,'
      '     Tb_produto.DESC_PRODUTO,'
      '     Tb_cadastro.COD_CADASTRO,'
      '     Tb_cadastro.NOME,'
      '     Tb_cadastro.DESC_TELEFONE,'
      '     Tb_nota_cab.COD_VENDEDOR,'
      '     Tb_nota_cab.NUM_NOTA,'
      '     Tb_nota_cab.DT_EMISSAO,'
      '     TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,'#39'MM'#39')),'
      '     to_char(Tb_Nota_Cab.DT_EMISSAO,'#39'Month'#39'),'
      '     tb_cadastro.cod_regiao,'
      '     Tb_nota_item.VAL_CUSTO,'
      '     TB_REGIAO.DESC_REGIAO'
      ')'
      'GROUP BY'
      '   STIPO,'
      '   COD_PRODUTO,'
      '   COD_LOTE_TIPO,'
      '   NUM_EMBALAGEM,'
      '   DESC_PRODUTO,'
      '   COD_CADASTRO,'
      '   NOMECADASTRO,'
      '   FONECADASTRO,'
      '   COD_VENDEDOR,'
      '   NUM_NOTA,'
      '   DT_EMISSAO,'
      '   DT_MES,'
      '   DESC_MES,'
      '   cod_regiao,'
      '   VAL_CUSTO,'
      '   DESC_REGIAO'
      'ORDER BY'
      '   cod_regiao,'
      '   COD_VENDEDOR,'
      '   NOMECADASTRO,'
      '   DT_MES,'
      '   STIPO')
    QBEDefinition.QBEFieldDefs = {
      040000001200000005000000535449504F0100000000000B000000434F445F50
      524F4455544F0100000000000C000000444553435F50524F4455544F01000000
      00000C000000434F445F434144415354524F0100000000000C0000004E4F4D45
      434144415354524F0100000000000C000000434F445F56454E4445444F520100
      00000000080000004E554D5F4E4F54410100000000000A00000044545F454D49
      5353414F0100000000000600000044545F4D45530100000000000E0000005351
      545F5155414E5449444144450100000000000A0000005356414C5F544F54414C
      0100000000000C000000464F4E45434144415354524F0100000000000D000000
      4E554D5F454D42414C4147454D0100000000000D000000434F445F4C4F54455F
      5449504F0100000000000900000056414C5F435553544F0100000000000A0000
      00434F445F52454749414F01000000000008000000444553435F4D4553010000
      0000000B000000444553435F52454749414F010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 256
    Top = 11
    object QrResumoClienteSTIPO: TStringField
      FieldName = 'STIPO'
      Size = 11
    end
    object QrResumoClienteCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QrResumoClienteCOD_CADASTRO: TFloatField
      FieldName = 'COD_CADASTRO'
    end
    object QrResumoClienteNOMECADASTRO: TStringField
      FieldName = 'NOMECADASTRO'
      Size = 50
    end
    object QrResumoClienteCOD_VENDEDOR: TFloatField
      FieldName = 'COD_VENDEDOR'
    end
    object QrResumoClienteNUM_NOTA: TFloatField
      FieldName = 'NUM_NOTA'
    end
    object QrResumoClienteDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QrResumoClienteDT_MES: TFloatField
      FieldName = 'DT_MES'
    end
    object QrResumoClienteSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QrResumoClienteSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QrResumoClienteFONECADASTRO: TStringField
      FieldName = 'FONECADASTRO'
      Size = 12
    end
    object QrResumoClienteDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QrResumoClienteNUM_EMBALAGEM: TFloatField
      FieldName = 'NUM_EMBALAGEM'
    end
    object QrResumoClienteCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
    end
    object QrResumoClienteVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
    end
    object QrResumoClienteCOD_REGIAO: TIntegerField
      FieldName = 'COD_REGIAO'
    end
    object QrResumoClienteDESC_MES: TStringField
      FieldName = 'DESC_MES'
      Size = 9
    end
    object QrResumoClienteDESC_REGIAO: TStringField
      FieldName = 'DESC_REGIAO'
      Size = 30
    end
  end
  object QRMaioresClientesVend: TOracleDataSet1
    SQL.Strings = (
      '  SELECT'
      '    Tb_Nota_Cab.COD_CADASTRO,'
      '    Tb_Cadastro.NOME,'
      '    Tb_Cadastro.NUM_CGC_CPF,'
      '    Tb_Cadastro.DESC_CIDADE,'
      '    Tb_Nota_Cab.COD_VENDEDOR,'
      '    Tb_Vendedor.Nome as NOME_VENDEDOR,'
      
        '    SUM(decode(:IND_COMPRA_VENDA,Tb_nota_item.QT_QUANTIDADE,Tb_n' +
        'ota_item.QT_QUANTIDADE*-1)) AS SQT_QUANTIDADE,'
      
        '    SUM(decode(:IND_COMPRA_VENDA,Tb_nota_item.VAL_TOTAL- PEGA_DE' +
        'SCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) +Tb_nota_item.VAL_IPI+Tb' +
        '_nota_item.VAL_DESPESAS+Tb_nota_item.VAL_FRETE+TB_NOTA_ITEM.VAL_' +
        'ICMS_SUBST,(Tb_nota_item.VAL_TOTAL- PEGA_DESCONTO_ITEM(TB_NOTA_I' +
        'TEM.COD_NOTA_ITEM) +Tb_nota_item.VAL_IPI+Tb_nota_item.VAL_DESPES' +
        'AS+Tb_nota_item.VAL_FRETE+TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1)) AS S' +
        'VAL_TOTAL'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_CADASTRO,'
      '    TB_PRODUTO,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    :IND_COMPRA_VENDA1/*MARCOS 26/06/10 VER QRMAIORESCLIENTES*/'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_Nota_Cab.COD_CADASTRO = Tb_Cadastro.COD_CADASTRO'
      '    AND'
      '    Tb_Nota_Cab.COD_VENDEDOR = Tb_Vendedor.COD_VENDEDOR'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '/*    AND'
      '    Tb_Cadastro.DT_CANCELAMENTO Is Null  */'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO = :VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:COD_DEPARTAMENTO IS NULL OR'
      '      TB_NOTA_CAB.COD_DEPARTAMENTO = :COD_DEPARTAMENTO)'
      '    AND'
      '    (:COD_SERIE IS NULL OR'
      '      TB_NOTA_CAB.COD_SERIE = :COD_SERIE)'
      '    AND'
      '    (:TIPO_PRODUTO IS NULL'
      '     OR'
      '      :TIPO_PRODUTO = TB_PRODUTO.IND_TIPO_PRODUTO)'
      '    AND'
      '    (:TIPO_CADASTRO IS NULL'
      '     OR'
      '      :TIPO_CADASTRO = TB_CADASTRO.COD_TIPO_CADASTRO)'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    (:SUPERVISOR IS NULL'
      '     OR'
      '      TB_VENDEDOR.COD_SUPERVISOR =:SUPERVISOR)'
      '  GROUP BY'
      '    Tb_Nota_Cab.COD_CADASTRO,'
      '    Tb_Cadastro.NOME,'
      '    Tb_Cadastro.NUM_CGC_CPF,'
      '    Tb_Cadastro.DESC_CIDADE,'
      '    Tb_Nota_Cab.COD_VENDEDOR,'
      '    Tb_Vendedor.Nome'
      'ORDER BY  COD_VENDEDOR,  SVAL_TOTAL DESC')
    Variables.Data = {
      030000000C000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000070000003A46494C4941
      4C030000000000000000000000090000003A56454E4445444F52030000000000
      000000000000120000003A56454E4445444F525F505245504F53544F03000000
      00000000000000000D0000003A5449504F5F50524F4455544F05000000000000
      00000000000E0000003A5449504F5F434144415354524F030000000000000000
      0000000B0000003A53555045525649534F520300000000000000000000001100
      00003A434F445F444550415254414D454E544F0300000000000000000000000A
      0000003A434F445F5345524945050000000000000000000000110000003A494E
      445F434F4D5052415F56454E4441010000000000000000000000120000003A49
      4E445F434F4D5052415F56454E444131010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000C000000434F445F434144415354524F0100000000000400
      00004E4F4D450100000000000C000000434F445F56454E4445444F5201000000
      00000D0000004E4F4D455F56454E4445444F520100000000000E000000535154
      5F5155414E5449444144450100000000000A0000005356414C5F544F54414C01
      00000000000B000000444553435F4349444144450100000000000B0000004E55
      4D5F4347435F435046010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 680
    Top = 401
    object QRMaioresClientesVendCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRMaioresClientesVendNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRMaioresClientesVendCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QRMaioresClientesVendNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Required = True
      Size = 40
    end
    object QRMaioresClientesVendSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRMaioresClientesVendSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRMaioresClientesVendDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object QRMaioresClientesVendNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
  end
  object QRQuotaVend2: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  SUM(TB_VENDEDOR_QUOTA.QT_QUOTA) AS SQT_QUOTA'
      'FROM'
      '  TB_VENDEDOR_QUOTA'
      'WHERE'
      '  TB_VENDEDOR_QUOTA.NUM_ANO = :ANO'
      '  AND'
      '  TB_VENDEDOR_QUOTA.NUM_MES = :MES'
      '  AND'
      '  TB_VENDEDOR_QUOTA.COD_VENDEDOR = :VENDEDOR'
      '  AND'
      '  (:VENDEDOR_PREPOSTO IS NULL OR'
      '   :VENDEDOR_PREPOSTO = TB_VENDEDOR_QUOTA.COD_VENDEDOR)')
    Variables.Data = {
      0300000004000000040000003A414E4F03000000000000000000000004000000
      3A4D4553030000000000000000000000090000003A56454E4445444F52030000
      000000000000000000120000003A56454E4445444F525F505245504F53544F03
      0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {0400000001000000090000005351545F51554F5441010000000000}
    ReadOnly = True
    QueryAllRecords = False
    Session = DMOracle.DBCemapa
    Left = 480
    Top = 220
    object QRQuotaVend2SQT_QUOTA: TFloatField
      FieldName = 'SQT_QUOTA'
    end
  end
  object QRMilhagem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_nota_cab.DT_EMISSAO,'
      '  Tb_nota_cab.NUM_NOTA,'
      '  Tb_nota_cab.COD_OPERACAO,'
      '  Tb_nota_cab.COD_SERIE,'
      '  Tb_nota_cab.IND_CONDICAO_PAGTO,'
      '  Tb_nota_cab.IND_MILHAGEM,'
      
        '  SUM(Tb_nota_item.VAL_TOTAL-Tb_nota_item.VAL_DESCONTO+Tb_nota_i' +
        'tem.VAL_DESPESAS) AS VAL_TOTAL'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM'
      'WHERE'
      '  Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB'
      '  AND'
      '  Tb_nota_cab.IND_ENTRADA_SAIDA = '#39'S'#39
      '  AND'
      '  Tb_nota_cab.DT_RECEBIMENTO >= :DATA_I'
      '  AND'
      '  Tb_nota_cab.DT_RECEBIMENTO <= :DATA_F'
      '  AND'
      '  (:FILIAL IS NULL OR'
      '   :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '  AND'
      '  (:CADASTRO IS NULL OR'
      '   :CADASTRO = TB_NOTA_CAB.COD_CADASTRO)'
      ' GROUP BY'
      '  Tb_nota_cab.DT_EMISSAO,'
      '  Tb_nota_cab.NUM_NOTA,'
      '  Tb_nota_cab.COD_OPERACAO,'
      '  Tb_nota_cab.COD_SERIE,'
      '  Tb_nota_cab.IND_CONDICAO_PAGTO,'
      '  Tb_nota_cab.IND_MILHAGEM')
    Variables.Data = {
      0300000004000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000070000003A46494C4941
      4C030000000000000000000000090000003A434144415354524F030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000A00000044545F454D495353414F01000000000008000000
      4E554D5F4E4F54410100000000000C000000434F445F4F5045524143414F0100
      0000000009000000434F445F534552494501000000000012000000494E445F43
      4F4E444943414F5F504147544F0100000000000C000000494E445F4D494C4841
      47454D0100000000000900000056414C5F544F54414C010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRMilhagemCalcFields
    Left = 480
    Top = 113
    object QRMilhagemDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRMilhagemNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRMilhagemCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
    end
    object QRMilhagemCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QRMilhagemIND_CONDICAO_PAGTO: TStringField
      FieldName = 'IND_CONDICAO_PAGTO'
      Required = True
      Size = 1
    end
    object QRMilhagemIND_MILHAGEM: TStringField
      FieldName = 'IND_MILHAGEM'
      Size = 3
    end
    object QRMilhagemVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QRMilhagemCondPGTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CondPGTO'
      Size = 10
      Calculated = True
    end
    object QRMilhagemTotalPago: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalPago'
      Calculated = True
    end
    object QRMilhagemTotalAberto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalAberto'
      Calculated = True
    end
  end
  object QRContaCorrente: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_Nota_Cab.Cod_Nota_Cab,'
      '  Tb_nota_cab.DT_EMISSAO,'
      '  Tb_nota_cab.NUM_NOTA,'
      '  Tb_nota_cab.COD_SERIE,'
      '  Tb_cadastro.COD_CADASTRO,'
      '  Tb_cadastro.NOME AS NOME_CADASTRO,'
      '  TB_NOTA_CAB.VAL_AVISTA,'
      '  TB_VENDEDOR.NOME AS NOME_VENDEDOR,'
      
        '  SUM(TB_NOTA_ITEM.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.C' +
        'OD_NOTA_ITEM)) AS VAL_TOTAL_ITENS,'
      '  '#39'S'#39' IND_SELECIONADO'
      'FROM TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_CADASTRO,'
      '  TB_OPERACAO,'
      '  TB_VENDEDOR'
      'WHERE'
      '  TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '  AND'
      '  TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '  AND'
      '  Tb_cadastro.COD_CADASTRO = Tb_nota_cab.COD_CADASTRO'
      '  AND'
      '  Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR(+)'
      '  AND'
      '  TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  TB_NOTA_CAB.COD_NOTA_CONTA_CORRENTE IS NULL'
      '  AND'
      '  (:COD_FILIAL IS NULL OR'
      '   TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      '  AND'
      '  (:COD_CADASTRO IS NULL OR'
      '   TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO)'
      '  AND'
      '  (:COD_VENDEDOR IS NULL OR'
      '  TB_NOTA_CAB.COD_VENDEDOR = :COD_VENDEDOR)'
      '  AND'
      '  (:COD_DEPARTAMENTO IS NULL OR'
      '  TB_NOTA_CAB.COD_DEPARTAMENTO = :COD_DEPARTAMENTO)'
      '  AND'
      '  (:SERIE IS NULL OR'
      '   TB_NOTA_CAB.COD_SERIE = :SERIE)'
      '  AND'
      '  (:HISTORICO_CAIXA IS NULL OR'
      '   TB_OPERACAO.COD_HISTORICO_CAIXA = :HISTORICO_CAIXA)'
      '  AND'
      '  (:COD_CLASS_CADASTRO IS NULL OR'
      '   TB_CADASTRO.COD_CLASS_CADASTRO = :COD_CLASS_CADASTRO)'
      '  AND'
      '  (:COD_PRODUTO IS NULL OR'
      '   TB_NOTA_ITEM.COD_PRODUTO = :COD_PRODUTO)'
      '  AND'
      '  DT_EMISSAO >= :DATA_I AND DT_EMISSAO <= :DATA_F'
      '  AND'
      '  (:NOTA_CAB IS NULL OR'
      
        '   TB_NOTA_CAB.COD_NOTA_CAB IN (select regexp_substr(:NOTA_CAB,'#39 +
        '[^,]+'#39', 1, level) from dual'
      ''
      
        '    connect by regexp_substr(:NOTA_CAB, '#39'[^,]+'#39', 1, level) is no' +
        't null))'
      '  AND'
      '  (:CONDICAO_PAGTO IS NULL OR'
      
        '   (:CONDICAO_PAGTO <> '#39'1'#39' AND TB_NOTA_CAB.IND_CONDICAO_PAGTO = ' +
        ':CONDICAO_PAGTO) OR'
      
        '   (:CONDICAO_PAGTO = '#39'1'#39' AND (TB_NOTA_CAB.IND_CONDICAO_PAGTO = ' +
        #39'1'#39' OR NVL(TB_NOTA_CAB.VAL_AVISTA,0) > 0)))'
      
        'GROUP BY Tb_Nota_Cab.Cod_Nota_Cab, Tb_nota_cab.DT_EMISSAO, Tb_no' +
        'ta_cab.NUM_NOTA, Tb_nota_cab.COD_SERIE, Tb_nota_cab.VAL_AVISTA, ' +
        'Tb_cadastro.COD_CADASTRO, Tb_cadastro.NOME, Tb_vendedor.NOME'
      'Order By Tb_nota_cab.NUM_NOTA')
    Variables.Data = {
      030000000C0000000B0000003A434F445F46494C49414C030000000000000000
      0000000D0000003A434F445F434144415354524F030000000000000000000000
      0D0000003A434F445F56454E4445444F52030000000000000000000000110000
      003A434F445F444550415254414D454E544F0300000000000000000000000600
      00003A5345524945050000000000000000000000090000003A4E4F54415F4341
      42050000000000000000000000130000003A434F445F434C4153535F43414441
      5354524F0300000000000000000000000C0000003A434F445F50524F4455544F
      030000000000000000000000070000003A444154415F490C0000000000000000
      000000070000003A444154415F460C00000000000000000000000F0000003A43
      4F4E444943414F5F504147544F050000000000000000000000100000003A4849
      53544F5249434F5F4341495841030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000C000000434F445F4E4F54415F4341420100000000000A00
      000044545F454D495353414F010000000000080000004E554D5F4E4F54410100
      0000000009000000434F445F53455249450100000000000C000000434F445F43
      4144415354524F0100000000000D0000004E4F4D455F434144415354524F0100
      000000000A00000056414C5F4156495354410100000000000D0000004E4F4D45
      5F56454E4445444F520100000000000F00000056414C5F544F54414C5F495445
      4E530100000000000F000000494E445F53454C4543494F4E41444F0100000000
      00}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRContaCorrenteCalcFields
    Left = 40
    Top = 166
    object QRContaCorrenteCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QRContaCorrenteDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRContaCorrenteNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRContaCorrenteCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QRContaCorrenteCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRContaCorrenteNOME_CADASTRO: TStringField
      FieldName = 'NOME_CADASTRO'
      Required = True
      Size = 50
    end
    object QRContaCorrenteVal_Total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Val_Total'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRContaCorrenteVAL_AVISTA: TFloatField
      FieldName = 'VAL_AVISTA'
    end
    object QRContaCorrenteNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Required = True
      Size = 40
    end
    object QRContaCorrenteVAL_TOTAL_ITENS: TFloatField
      FieldName = 'VAL_TOTAL_ITENS'
    end
    object QRContaCorrenteIND_SELECIONADO: TStringField
      FieldName = 'IND_SELECIONADO'
      Size = 1
    end
  end
  object QRVendClasse: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '   COD_VENDEDOR + 0.00 AS COD_VENDEDOR,'
      '   NOME,'
      '   DESC_CLASSE,'
      '   SUM(QT_QUANTIDADE) AS QT_QUANTIDADE,'
      '   SUM(QT_QUANT_KG) AS QT_QUANT_KG,'
      '   SUM(SVAL_TOTAL_CX) as SVAL_TOTAL_CX,'
      '   SUM(SVAL_TOTAL_CR) as SVAL_TOTAL_CR,'
      '   SUM(SVAL_TOTAL_CC) as SVAL_TOTAL_CC,'
      '   SUM(SVAL_TOTAL_CCRD + SVAL_TOTAL_CDEB) AS SVAL_TOTAL_CCRD,'
      '   SUM(SVAL_TOTAL_CDEB) AS SVAL_TOTAL_CDEB,'
      '   SUM(SVAL_TOTAL_PIX) AS SVAL_TOTAL_PIX,'
      '   SUM(SQT_BONIFICACAO) as SQT_BONIFICACAO,'
      '   SUM(VAL_CUSTO) AS VAL_CUSTO,'
      '   SUM(VAL_MARGEM) AS VAL_MARGEM'
      'FROM'
      '('
      '   SELECT'
      '       Tb_nota_cab.COD_VENDEDOR,'
      '       Tb_vendedor.NOME,'
      '       Tb_classe.DESC_CLASSE,'
      '       SUM(Tb_nota_item.QT_QUANTIDADE) AS QT_QUANTIDADE,'
      
        '       SUM(Tb_nota_item.QT_QUANTIDADE * Tb_Produto.NUM_EMBALAGEM' +
        ') AS QT_QUANT_KG,'
      
        '       SUM(Decode(Tb_nota_cab.IND_CONDICAO_PAGTO,'#39'1'#39',Tb_nota_ite' +
        'm.VAL_TOTAL - (Tb_nota_item.VAL_DESCONTO * TB_NOTA_ITEM.QT_QUANT' +
        'IDADE) - Tb_nota_item.VAL_DESCONTO_RATEIO + Tb_nota_item.VAL_DES' +
        'PESAS + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST,0))' +
        ' as SVAL_TOTAL_CX,'
      
        '       SUM(Decode(Tb_nota_cab.IND_CONDICAO_PAGTO,'#39'2'#39',Tb_nota_ite' +
        'm.VAL_TOTAL - (Tb_nota_item.VAL_DESCONTO * TB_NOTA_ITEM.QT_QUANT' +
        'IDADE) - Tb_nota_item.VAL_DESCONTO_RATEIO + Tb_nota_item.VAL_DES' +
        'PESAS + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST,0))' +
        ' as SVAL_TOTAL_CR,'
      
        '       SUM(Decode(Tb_nota_cab.IND_CONDICAO_PAGTO,'#39'3'#39',Tb_nota_ite' +
        'm.VAL_TOTAL - (Tb_nota_item.VAL_DESCONTO * TB_NOTA_ITEM.QT_QUANT' +
        'IDADE) - Tb_nota_item.VAL_DESCONTO_RATEIO + Tb_nota_item.VAL_DES' +
        'PESAS + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST,0))' +
        ' as SVAL_TOTAL_CC,'
      
        '       SUM(Decode(Tb_nota_cab.IND_CONDICAO_PAGTO,'#39'4'#39',Tb_nota_ite' +
        'm.VAL_TOTAL - (Tb_nota_item.VAL_DESCONTO * TB_NOTA_ITEM.QT_QUANT' +
        'IDADE) - Tb_nota_item.VAL_DESCONTO_RATEIO + Tb_nota_item.VAL_DES' +
        'PESAS + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST,0))' +
        ' as SVAL_TOTAL_CCRD,'
      
        '       SUM(Decode(Tb_nota_cab.IND_CONDICAO_PAGTO,'#39'5'#39',Tb_nota_ite' +
        'm.VAL_TOTAL - (Tb_nota_item.VAL_DESCONTO * TB_NOTA_ITEM.QT_QUANT' +
        'IDADE) - Tb_nota_item.VAL_DESCONTO_RATEIO + Tb_nota_item.VAL_DES' +
        'PESAS + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST,0))' +
        ' as SVAL_TOTAL_CDEB,'
      
        '       SUM(Decode(Tb_nota_cab.IND_CONDICAO_PAGTO,'#39'6'#39',Tb_nota_ite' +
        'm.VAL_TOTAL - (Tb_nota_item.VAL_DESCONTO * TB_NOTA_ITEM.QT_QUANT' +
        'IDADE) - Tb_nota_item.VAL_DESCONTO_RATEIO + Tb_nota_item.VAL_DES' +
        'PESAS + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST,0))' +
        ' as SVAL_TOTAL_PIX,'
      '       To_Number(0) AS SQT_BONIFICACAO,'
      
        '       SUM(Decode(Tb_nota_cab.IND_ENTRADA_SAIDA,'#39'S'#39',TB_NOTA_ITEM' +
        '.QT_QUANTIDADE * TB_NOTA_ITEM.VAL_CUSTO,TB_NOTA_ITEM.VAL_CUSTO))' +
        ' AS VAL_CUSTO,'
      '       SUM('
      
        '         DECODE(TB_NOTA_ITEM.VAL_CUSTO * Tb_nota_item.QT_QUANTID' +
        'ADE,0.00,0.00,'
      '           (Tb_nota_item.VAL_TOTAL -'
      
        '            (Tb_nota_item.VAL_DESCONTO * TB_NOTA_ITEM.QT_QUANTID' +
        'ADE) - Tb_nota_item.VAL_DESCONTO_RATEIO +'
      '            Tb_nota_item.VAL_DESPESAS +'
      '            Tb_nota_item.VAL_FRETE    +'
      
        '            TB_NOTA_ITEM.VAL_ICMS_SUBST) / (TB_NOTA_ITEM.VAL_CUS' +
        'TO * Tb_nota_item.QT_QUANTIDADE) - 1'
      '         ) * 100'
      '       ) AS VAL_MARGEM'
      '    FROM'
      '       TB_NOTA_CAB,'
      '       TB_NOTA_ITEM,'
      '       TB_OPERACAO,'
      '       TB_PRODUTO,'
      '       TB_CLASSE,'
      '       TB_VENDEDOR'
      '    WHERE'
      '       (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB)'
      '       AND'
      '       (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)'
      '       AND'
      '       (Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR)'
      '       AND'
      '       (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO)'
      '       AND'
      '       (Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE)'
      '       AND'
      '       (Tb_nota_cab.IND_SITUACAO = '#39'2'#39')'
      '       AND'
      '       (:MONTA_NA_ROTINA_VENDA)'
      '       AND'
      '       (TB_NOTA_CAB.DT_EMISSAO >= :DATA_I)'
      '       AND'
      '       (TB_NOTA_CAB.DT_EMISSAO <= :DATA_F)'
      '       AND'
      '       (:FILIAL IS NULL OR'
      '        :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '       AND'
      '       (:VENDEDOR IS NULL OR'
      '        :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '       AND'
      '       (:SUPERVISOR IS NULL OR'
      '        :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '       AND'
      '       (:VENDEDOR_PREPOSTO IS NULL OR'
      '        :VENDEDOR_PREPOSTO = TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO)'
      '   GROUP BY'
      '       Tb_nota_cab.COD_VENDEDOR,'
      '       Tb_vendedor.NOME,'
      '       Tb_classe.DESC_CLASSE'
      ''
      '   UNION ALL'
      ''
      '   SELECT'
      '       Tb_nota_cab.COD_VENDEDOR,'
      '       Tb_vendedor.NOME,'
      '       Tb_classe.DESC_CLASSE,'
      '       sum(Tb_nota_item.QT_QUANTIDADE * -1) AS QT_QUANTIDADE,'
      
        '       sum((Tb_nota_item.QT_QUANTIDADE * Tb_Produto.NUM_EMBALAGE' +
        'M) * -1) AS QT_QUANT_KG,'
      
        '       sum((Tb_nota_item.VAL_TOTAL - (Tb_nota_item.VAL_DESCONTO ' +
        '* TB_NOTA_ITEM.QT_QUANTIDADE) - Tb_nota_item.VAL_DESCONTO_RATEIO' +
        ' + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_FRETE + TB_NOTA_' +
        'ITEM.VAL_ICMS_SUBST)*-1) as SVAL_TOTAL_CX,'
      '       0 as SVAL_TOTAL_CR,'
      '       0 as SVAL_TOTAL_CC,'
      '       0 as SVAL_TOTAL_CCRD,'
      '       0 asSVAL_TOTAL_CDEB,'
      '       0 as SVAL_TOTAL_PIX,'
      '       0 AS SQT_BONIFICACAO,'
      '       0 AS VAL_CUSTO,'
      '       0 AS VAL_MARGEM'
      '   FROM'
      '       TB_NOTA_CAB,'
      '       TB_NOTA_ITEM,'
      '       TB_OPERACAO,'
      '       TB_PRODUTO,'
      '       TB_CLASSE,'
      '       TB_VENDEDOR'
      '    WHERE'
      '        (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB)'
      '        AND'
      '        (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)'
      '        AND'
      '        (Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR)'
      '        AND'
      '        (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO)'
      '        AND'
      '        (Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE)'
      '        AND'
      '        (Tb_nota_cab.IND_SITUACAO = '#39'2'#39')'
      '        AND'
      '        :MONTA_NA_ROTINA_DEVOLUCAO'
      '        AND'
      '        (TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I)'
      '        AND'
      '        (TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F)'
      '        AND'
      '        (:FILIAL IS NULL OR'
      '         :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '        AND'
      '        (:VENDEDOR IS NULL OR'
      '         :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '        AND'
      '        (:SUPERVISOR IS NULL OR'
      '         :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '        AND'
      '        (:VENDEDOR_PREPOSTO IS NULL OR'
      '         :VENDEDOR_PREPOSTO = TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO)'
      '   GROUP BY'
      '       Tb_nota_cab.COD_VENDEDOR,'
      '       Tb_vendedor.NOME,'
      '       Tb_classe.DESC_CLASSE'
      ''
      '   UNION ALL'
      ''
      '   SELECT'
      '       Tb_nota_cab.COD_VENDEDOR,'
      '       Tb_vendedor.NOME,'
      '       Tb_classe.DESC_CLASSE,'
      '       0 AS QT_QUANTIDADE,'
      '       0 AS QT_QUANT_KG,'
      '       0 AS SVAL_TOTAL_CX,'
      '       0 AS SVAL_TOTAL_CR,'
      '       0 AS SVAL_TOTAL_CC,'
      '       0 as SVAL_TOTAL_CCRD,'
      '       0 asSVAL_TOTAL_CDEB,'
      '       0 as SVAL_TOTAL_PIX,'
      
        '       sum(Tb_nota_item.QT_QUANTIDADE * Tb_Produto.NUM_EMBALAGEM' +
        ') AS SQT_BONIFICACAO,'
      '       0 AS VAL_CUSTO,'
      '       0 AS VAL_MARGEM'
      '    FROM'
      '       TB_NOTA_CAB,'
      '       TB_NOTA_ITEM,'
      '       TB_OPERACAO,'
      '       TB_PRODUTO,'
      '       TB_CLASSE,'
      '       TB_VENDEDOR'
      '    WHERE'
      '        (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB)'
      '        AND'
      '        (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)'
      '        AND'
      '        (Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR)'
      '        AND'
      '        (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO)'
      '        AND'
      '        (Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE)'
      '        AND'
      '        (Tb_nota_cab.IND_SITUACAO = '#39'2'#39')'
      '        AND'
      '        (Tb_operacao.ind_bonificacao = '#39'S'#39')'
      '        AND'
      '        (TB_NOTA_CAB.DT_EMISSAO >= :DATA_I)'
      '        AND'
      '        (TB_NOTA_CAB.DT_EMISSAO <= :DATA_F)'
      '        AND'
      '        (:FILIAL IS NULL OR'
      '         :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '        AND'
      '        (:VENDEDOR IS NULL OR'
      '         :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '        AND'
      '        (:SUPERVISOR IS NULL OR'
      '         :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '        AND'
      '        (:VENDEDOR_PREPOSTO IS NULL OR'
      '         :VENDEDOR_PREPOSTO = TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO)'
      '   GROUP BY'
      '       Tb_nota_cab.COD_VENDEDOR,'
      '       Tb_vendedor.NOME,'
      '       Tb_classe.DESC_CLASSE'
      ')'
      'GROUP BY'
      '  COD_VENDEDOR,'
      '  NOME,'
      '  DESC_CLASSE'
      ''
      'ORDER BY'
      '  COD_VENDEDOR,'
      '  NOME,'
      '  DESC_CLASSE'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Variables.Data = {
      0300000008000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000070000003A46494C4941
      4C030000000000000000000000090000003A56454E4445444F52030000000000
      000000000000120000003A56454E4445444F525F505245504F53544F03000000
      00000000000000000B0000003A53555045525649534F52030000000000000000
      000000160000003A4D4F4E54415F4E415F524F54494E415F56454E4441010000
      0000000000000000001A0000003A4D4F4E54415F4E415F524F54494E415F4445
      564F4C5543414F010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E0000000C000000434F445F56454E4445444F520100000000000400
      00004E4F4D450100000000000B000000444553435F434C415353450100000000
      000D0000005356414C5F544F54414C5F43580100000000000D0000005356414C
      5F544F54414C5F43520100000000000D0000005356414C5F544F54414C5F4343
      0100000000000D00000051545F5155414E5449444144450100000000000B0000
      0051545F5155414E545F4B470100000000000F0000005351545F424F4E494649
      434143414F0100000000000900000056414C5F435553544F0100000000000A00
      000056414C5F4D415247454D0100000000000F0000005356414C5F544F54414C
      5F434352440100000000000F0000005356414C5F544F54414C5F434445420100
      000000000E0000005356414C5F544F54414C5F504958010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 480
    Top = 67
    object QRVendClasseCOD_VENDEDOR: TFloatField
      FieldName = 'COD_VENDEDOR'
    end
    object QRVendClasseNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object QRVendClasseDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QRVendClasseSVAL_TOTAL_CX: TFloatField
      FieldName = 'SVAL_TOTAL_CX'
    end
    object QRVendClasseSVAL_TOTAL_CR: TFloatField
      FieldName = 'SVAL_TOTAL_CR'
    end
    object QRVendClasseSVAL_TOTAL_CC: TFloatField
      FieldName = 'SVAL_TOTAL_CC'
    end
    object QRVendClasseQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QRVendClasseQT_QUANT_KG: TFloatField
      FieldName = 'QT_QUANT_KG'
    end
    object QRVendClasseSQT_BONIFICACAO: TFloatField
      FieldName = 'SQT_BONIFICACAO'
    end
    object QRVendClasseVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
      DisplayFormat = '#,##0.00'
    end
    object QRVendClasseVAL_MARGEM: TFloatField
      FieldName = 'VAL_MARGEM'
      DisplayFormat = '#,##0.00'
    end
    object QRVendClasseSVAL_TOTAL_CCRD: TFloatField
      FieldName = 'SVAL_TOTAL_CCRD'
    end
    object QRVendClasseSVAL_TOTAL_CDEB: TFloatField
      FieldName = 'SVAL_TOTAL_CDEB'
    end
    object QRVendClasseSVAL_TOTAL_PIX: TFloatField
      FieldName = 'SVAL_TOTAL_PIX'
    end
  end
  object QRQuotaVend3: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_VENDEDOR + 0.00 AS COD_VENDEDOR,'
      '  NOME,'
      '  SUM(SQT_VENDA) AS SQT_VENDA,'
      '  SUM(SQT_QUOTA) AS SQT_QUOTA,'
      '  SUM(SVAL_VENDA) AS SVAL_VENDA'
      'FROM'
      '('
      '  SELECT'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME,'
      '    SUM(Tb_nota_item.QT_QUANTIDADE) AS SQT_VENDA,'
      '    TO_NUMBER('#39'0'#39') AS SQT_QUOTA,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL-PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.C' +
        'OD_NOTA_ITEM)+Tb_nota_item.VAL_IPI+Tb_nota_item.VAL_DESPESAS+Tb_' +
        'nota_item.VAL_FRETE)  AS SVAL_VENDA'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_VENDEDOR,'
      '    TB_OPERACAO,'
      '    TB_PRODUTO'
      '  WHERE'
      '    TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    (:CLASSE IS NULL OR'
      '     :CLASSE = TB_PRODUTO.COD_CLASSE)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '     :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '     :VENDEDOR_PREPOSTO = TB_NOTA_CAB.COD_VENDEDOR)'
      '    AND'
      '    LTRIM(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'YYYY'#39')) = :ANO'
      '  GROUP BY'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME'
      ''
      '  UNION ALL'
      '  /* DEVOLU'#199#213'ES */'
      '  SELECT'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME,'
      '    SUM(Tb_nota_item.QT_QUANTIDADE * -1) AS SQT_VENDA,'
      '    TO_NUMBER('#39'0'#39') AS SQT_QUOTA,'
      
        '    SUM((Tb_nota_item.VAL_TOTAL- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) +Tb_nota_item.VAL_IPI+Tb_nota_item.VAL_DESPESAS+' +
        'Tb_nota_item.VAL_FRETE) * -1) AS SVAL_VENDA'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_VENDEDOR,'
      '    TB_OPERACAO,'
      '    TB_PRODUTO'
      '  WHERE'
      '    TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'D'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    (:CLASSE IS NULL OR'
      '     :CLASSE = TB_PRODUTO.COD_CLASSE)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '     :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '    and'
      '    LTRIM(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'YYYY'#39')) = :ANO'
      '  GROUP BY'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME,'
      '    TO_NUMBER('#39'0'#39') AS SQT_VENDA,'
      '    SUM(TB_VENDEDOR_QUOTA.QT_QUOTA) AS SQT_QUOTA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_VENDA'
      '  FROM'
      '    TB_VENDEDOR,'
      '    TB_VENDEDOR_QUOTA'
      '  WHERE'
      '    TB_VENDEDOR.COD_VENDEDOR = TB_VENDEDOR_QUOTA.COD_VENDEDOR'
      '    AND'
      '    LTRIM(TO_CHAR(TB_VENDEDOR_QUOTA.NUM_ANO,'#39'0000'#39')) = :ANO'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '     :VENDEDOR = TB_VENDEDOR_QUOTA.COD_VENDEDOR)'
      '    AND'
      '    (:CLASSE IS NULL OR'
      '     :CLASSE = TB_VENDEDOR_QUOTA.COD_CLASSE)'
      '  GROUP BY'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME'
      ')'
      'GROUP BY'
      '  COD_VENDEDOR,'
      '  NOME'
      ' '
      ' ')
    Variables.Data = {
      0300000005000000070000003A434C4153534503000000000000000000000007
      0000003A46494C49414C030000000000000000000000090000003A56454E4445
      444F52030000000000000000000000040000003A414E4F030000000000000000
      000000120000003A56454E4445444F525F505245504F53544F03000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000C000000434F445F56454E4445444F520100000000000400
      00004E4F4D45010000000000090000005351545F56454E444101000000000009
      0000005351545F51554F54410100000000000A0000005356414C5F56454E4441
      010000000000}
    ReadOnly = True
    QueryAllRecords = False
    Session = DMOracle.DBCemapa
    Left = 480
    Top = 268
    object QRQuotaVend3COD_VENDEDOR: TFloatField
      FieldName = 'COD_VENDEDOR'
    end
    object QRQuotaVend3NOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object QRQuotaVend3SQT_VENDA: TFloatField
      FieldName = 'SQT_VENDA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRQuotaVend3SQT_QUOTA: TFloatField
      FieldName = 'SQT_QUOTA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRQuotaVend3SVAL_VENDA: TFloatField
      FieldName = 'SVAL_VENDA'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object QRQuotaVend: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      'COD_VENDEDOR,'
      'NOME,'
      'COD_CLASSE,'
      'DESC_CLASSE,'
      'SUM(VAL_JANEIRO)AS VAL_JANEIRO,'
      'SUM(VAL_FEVEREIRO)AS VAL_FEVEREIRO,'
      'SUM(VAL_MARCO)AS VAL_MARCO,'
      'SUM(VAL_ABRIL)AS VAL_ABRIL,'
      'SUM(VAL_MAIO)AS VAL_MAIO,'
      'SUM(VAL_JUNHO)AS VAL_JUNHO,'
      'SUM(VAL_JULHO)AS VAL_JULHO,'
      'SUM(VAL_AGOSTO)AS VAL_AGOSTO,'
      'SUM(VAL_SETEMBRO)AS VAL_SETEMBRO,'
      'SUM(VAL_OUTUBRO)AS VAL_OUTUBRO,'
      'SUM(VAL_NOVEMBRO)AS VAL_NOVEMBRO,'
      'SUM(VAL_DEZEMBRO)AS VAL_DEZEMBRO,'
      'SUM(QT_JANEIRO)AS QT_JANEIRO,'
      'SUM(QT_FEVEREIRO)AS QT_FEVEREIRO,'
      'SUM(QT_MARCO)AS QT_MARCO,'
      'SUM(QT_ABRIL)AS QT_ABRIL,'
      'SUM(QT_MAIO)AS QT_MAIO,'
      'SUM(QT_JUNHO)AS QT_JUNHO,'
      'SUM(QT_JULHO)AS QT_JULHO,'
      'SUM(QT_AGOSTO)AS QT_AGOSTO,'
      'SUM(QT_SETEMBRO)AS QT_SETEMBRO,'
      'SUM(QT_OUTUBRO)AS QT_OUTUBRO,'
      'SUM(QT_NOVEMBRO)AS QT_NOVEMBRO,'
      'SUM(QT_DEZEMBRO)AS QT_DEZEMBRO,'
      'SUM(SVAL_TOTAL) AS SVAL_TOTAL,'
      'SUM(SQT_QUANTIDADE) AS SQT_QUANTIDADE,'
      'SUM(QUOTA_JAN)AS QUOTA_JAN,'
      'SUM(QUOTA_FEV)AS QUOTA_FEV,'
      'SUM(QUOTA_MAR)AS QUOTA_MAR,'
      'SUM(QUOTA_ABR)AS QUOTA_ABR,'
      'SUM(QUOTA_MAI)AS QUOTA_MAI,'
      'SUM(QUOTA_JUN)AS QUOTA_JUN,'
      'SUM(QUOTA_JUL)AS QUOTA_JUL,'
      'SUM(QUOTA_AGO)AS QUOTA_AGO,'
      'SUM(QUOTA_SET)AS QUOTA_SET,'
      'SUM(QUOTA_OUT)AS QUOTA_OUT,'
      'SUM(QUOTA_NOV)AS QUOTA_NOV,'
      'SUM(QUOTA_DEZ)AS QUOTA_DEZ,'
      'SUM(QUOTA_KG_JAN)AS QUOTA_KG_JAN,'
      'SUM(QUOTA_KG_FEV)AS QUOTA_KG_FEV,'
      'SUM(QUOTA_KG_MAR)AS QUOTA_KG_MAR,'
      'SUM(QUOTA_KG_ABR)AS QUOTA_KG_ABR,'
      'SUM(QUOTA_KG_MAI)AS QUOTA_KG_MAI,'
      'SUM(QUOTA_KG_JUN)AS QUOTA_KG_JUN,'
      'SUM(QUOTA_KG_JUL)AS QUOTA_KG_JUL,'
      'SUM(QUOTA_KG_AGO)AS QUOTA_KG_AGO,'
      'SUM(QUOTA_KG_SET)AS QUOTA_KG_SET,'
      'SUM(QUOTA_KG_OUT)AS QUOTA_KG_OUT,'
      'SUM(QUOTA_KG_NOV)AS QUOTA_KG_NOV,'
      'SUM(QUOTA_KG_DEZ)AS QUOTA_KG_DEZ'
      'FROM'
      '('
      '  SELECT'
      '    TB_CLASSE.COD_CLASSE,'
      '    TB_CLASSE.DESC_CLASSE,'
      '    TB_VENDEDOR.COD_VENDEDOR,'
      '    TB_VENDEDOR.NOME,'
      
        '    SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RECEB' +
        'IMENTO,4,2),'#39'01'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB' +
        '_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_' +
        'item.VAL_IPI + Tb_nota_item.VAL_FRETE),0),0)) AS VAL_JANEIRO,'
      
        '    SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RECEB' +
        'IMENTO,4,2),'#39'02'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB' +
        '_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_' +
        'item.VAL_IPI + Tb_nota_item.VAL_FRETE),0),0)) AS VAL_FEVEREIRO,'
      
        '    SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RECEB' +
        'IMENTO,4,2),'#39'03'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB' +
        '_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_' +
        'item.VAL_IPI + Tb_nota_item.VAL_FRETE),0),0)) AS VAL_MARCO,'
      
        '    SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RECEB' +
        'IMENTO,4,2),'#39'04'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB' +
        '_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_' +
        'item.VAL_IPI + Tb_nota_item.VAL_FRETE),0),0)) AS VAL_ABRIL,'
      
        '    SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RECEB' +
        'IMENTO,4,2),'#39'05'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB' +
        '_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_' +
        'item.VAL_IPI + Tb_nota_item.VAL_FRETE),0),0)) AS VAL_MAIO,'
      
        '    SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RECEB' +
        'IMENTO,4,2),'#39'06'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB' +
        '_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_' +
        'item.VAL_IPI + Tb_nota_item.VAL_FRETE),0),0)) AS VAL_JUNHO,'
      
        '    SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RECEB' +
        'IMENTO,4,2),'#39'07'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB' +
        '_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_' +
        'item.VAL_IPI + Tb_nota_item.VAL_FRETE),0),0)) AS VAL_JULHO,'
      
        '    SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RECEB' +
        'IMENTO,4,2),'#39'08'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB' +
        '_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_' +
        'item.VAL_IPI + Tb_nota_item.VAL_FRETE),0),0)) AS VAL_AGOSTO,'
      
        '    SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RECEB' +
        'IMENTO,4,2),'#39'09'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB' +
        '_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_' +
        'item.VAL_IPI + Tb_nota_item.VAL_FRETE),0),0)) AS VAL_SETEMBRO,'
      
        '    SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RECEB' +
        'IMENTO,4,2),'#39'10'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB' +
        '_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_' +
        'item.VAL_IPI + Tb_nota_item.VAL_FRETE),0),0)) AS VAL_OUTUBRO,'
      
        '    SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RECEB' +
        'IMENTO,4,2),'#39'11'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB' +
        '_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_' +
        'item.VAL_IPI + Tb_nota_item.VAL_FRETE),0),0)) AS VAL_NOVEMBRO,'
      
        '    SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RECEB' +
        'IMENTO,4,2),'#39'12'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB' +
        '_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_' +
        'item.VAL_IPI + Tb_nota_item.VAL_FRETE),0),0)) AS VAL_DEZEMBRO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'01'#39',(Tb_nota_item.QT_' +
        'QUANTIDADE))) AS QT_JANEIRO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'02'#39',(Tb_nota_item.QT_' +
        'QUANTIDADE))) AS QT_FEVEREIRO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'03'#39',(Tb_nota_item.QT_' +
        'QUANTIDADE))) AS QT_MARCO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'04'#39',(Tb_nota_item.QT_' +
        'QUANTIDADE))) AS QT_ABRIL,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'05'#39',(Tb_nota_item.QT_' +
        'QUANTIDADE))) AS QT_MAIO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'06'#39',(Tb_nota_item.QT_' +
        'QUANTIDADE))) AS QT_JUNHO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'07'#39',(Tb_nota_item.QT_' +
        'QUANTIDADE))) AS QT_JULHO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'08'#39',(Tb_nota_item.QT_' +
        'QUANTIDADE))) AS QT_AGOSTO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'09'#39',(Tb_nota_item.QT_' +
        'QUANTIDADE))) AS QT_SETEMBRO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'10'#39',(Tb_nota_item.QT_' +
        'QUANTIDADE))) AS QT_OUTUBRO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'11'#39',(Tb_nota_item.QT_' +
        'QUANTIDADE))) AS QT_NOVEMBRO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'12'#39',(Tb_nota_item.QT_' +
        'QUANTIDADE))) AS QT_DEZEMBRO,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_I' +
        'PI + Tb_nota_item.VAL_FRETE) AS SVAL_TOTAL,'
      '    SUM(Tb_nota_item.QT_QUANTIDADE) AS SQT_QUANTIDADE,'
      '    0 AS QUOTA_JAN,'
      '    0 AS QUOTA_FEV,'
      '    0 AS QUOTA_MAR,'
      '    0 AS QUOTA_ABR,'
      '    0 AS QUOTA_MAI,'
      '    0 AS QUOTA_JUN,'
      '    0 AS QUOTA_JUL,'
      '    0 AS QUOTA_AGO,'
      '    0 AS QUOTA_SET,'
      '    0 AS QUOTA_OUT,'
      '    0 AS QUOTA_NOV,'
      '    0 AS QUOTA_DEZ,'
      '    0 AS QUOTA_KG_JAN,'
      '    0 AS QUOTA_KG_FEV,'
      '    0 AS QUOTA_KG_MAR,'
      '    0 AS QUOTA_KG_ABR,'
      '    0 AS QUOTA_KG_MAI,'
      '    0 AS QUOTA_KG_JUN,'
      '    0 AS QUOTA_KG_JUL,'
      '    0 AS QUOTA_KG_AGO,'
      '    0 AS QUOTA_KG_SET,'
      '    0 AS QUOTA_KG_OUT,'
      '    0 AS QUOTA_KG_NOV,'
      '    0 AS QUOTA_KG_DEZ'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_FILIAL,'
      '    TB_VENDEDOR,'
      '    TB_OPERACAO,'
      '    TB_CLASSE,'
      '    TB_PRODUTO'
      '  WHERE'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '    AND'
      '    TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '    AND'
      '    TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '    AND'
      '    ((Tb_operacao.ind_vendas = '#39'V'#39')'
      '     or'
      '    (Tb_operacao.ind_bonificacao = '#39'S'#39'))'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    (:VENDEDOR IS NULL'
      '     OR'
      '      TB_VENDEDOR.COD_VENDEDOR = :VENDEDOR)'
      '    AND'
      '    LTRIM(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'YYYY'#39')) = :ANO'
      '  GROUP BY'
      '    TB_CLASSE.COD_CLASSE,'
      '    TB_CLASSE.DESC_CLASSE,'
      '    TB_VENDEDOR.COD_VENDEDOR,'
      '    TB_VENDEDOR.NOME'
      ''
      ''
      'UNION ALL'
      ''
      '/* *** DEVOLUCOES ****  */'
      '  SELECT'
      '    TB_CLASSE.COD_CLASSE,'
      '    TB_CLASSE.DESC_CLASSE,'
      '    TB_VENDEDOR.COD_VENDEDOR,'
      '    TB_VENDEDOR.NOME,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'01'#39',((Tb_nota_item.VA' +
        'L_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_no' +
        'ta_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_F' +
        'RETE)*-1),0)) AS VAL_JANEIRO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'02'#39',((Tb_nota_item.VA' +
        'L_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_no' +
        'ta_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_F' +
        'RETE)*-1),0)) AS VAL_FEVEREIRO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'03'#39',((Tb_nota_item.VA' +
        'L_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_no' +
        'ta_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_F' +
        'RETE)*-1),0)) AS VAL_MARCO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'04'#39',((Tb_nota_item.VA' +
        'L_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_no' +
        'ta_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_F' +
        'RETE)*-1),0)) AS VAL_ABRIL,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'05'#39',((Tb_nota_item.VA' +
        'L_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_no' +
        'ta_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_F' +
        'RETE)*-1),0)) AS VAL_MAIO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'06'#39',((Tb_nota_item.VA' +
        'L_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_no' +
        'ta_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_F' +
        'RETE)*-1),0)) AS VAL_JUNHO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'07'#39',((Tb_nota_item.VA' +
        'L_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_no' +
        'ta_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_F' +
        'RETE)*-1),0)) AS VAL_JULHO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'08'#39',((Tb_nota_item.VA' +
        'L_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_no' +
        'ta_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_F' +
        'RETE)*-1),0)) AS VAL_AGOSTO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'09'#39',((Tb_nota_item.VA' +
        'L_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_no' +
        'ta_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_F' +
        'RETE)*-1),0)) AS VAL_SETEMBRO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'10'#39',((Tb_nota_item.VA' +
        'L_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_no' +
        'ta_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_F' +
        'RETE)*-1),0)) AS VAL_OUTUBRO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'11'#39',((Tb_nota_item.VA' +
        'L_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_no' +
        'ta_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_F' +
        'RETE)*-1),0)) AS VAL_NOVEMBRO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'12'#39',((Tb_nota_item.VA' +
        'L_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_no' +
        'ta_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_F' +
        'RETE)*-1),0)) AS VAL_DEZEMBRO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'01'#39',((Tb_nota_item.QT' +
        '_QUANTIDADE)*-1))) AS QT_JANEIRO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'02'#39',((Tb_nota_item.QT' +
        '_QUANTIDADE)*-1))) AS QT_FEVEREIRO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'03'#39',((Tb_nota_item.QT' +
        '_QUANTIDADE)*-1))) AS QT_MARCO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'04'#39',((Tb_nota_item.QT' +
        '_QUANTIDADE)*-1))) AS QT_ABRIL,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'05'#39',((Tb_nota_item.QT' +
        '_QUANTIDADE)*-1))) AS QT_MAIO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'06'#39',((Tb_nota_item.QT' +
        '_QUANTIDADE)*-1))) AS QT_JUNHO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'07'#39',((Tb_nota_item.QT' +
        '_QUANTIDADE)*-1))) AS QT_JULHO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'08'#39',((Tb_nota_item.QT' +
        '_QUANTIDADE)*-1))) AS QT_AGOSTO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'09'#39',((Tb_nota_item.QT' +
        '_QUANTIDADE)*-1))) AS QT_SETEMBRO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'10'#39',((Tb_nota_item.QT' +
        '_QUANTIDADE)*-1))) AS QT_OUTUBRO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'11'#39',((Tb_nota_item.QT' +
        '_QUANTIDADE)*-1))) AS QT_NOVEMBRO,'
      
        '    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'12'#39',((Tb_nota_item.QT' +
        '_QUANTIDADE)*-1))) AS QT_DEZEMBRO,'
      
        '    SUM((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITE' +
        'M.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_' +
        'IPI + Tb_nota_item.VAL_FRETE)*-1) AS SVAL_TOTAL,'
      '    SUM((Tb_nota_item.QT_QUANTIDADE)*-1) AS SQT_QUANTIDADE,'
      '    0 AS QUOTA_JAN,'
      '    0 AS QUOTA_FEV,'
      '    0 AS QUOTA_MAR,'
      '    0 AS QUOTA_ABR,'
      '    0 AS QUOTA_MAI,'
      '    0 AS QUOTA_JUN,'
      '    0 AS QUOTA_JUL,'
      '    0 AS QUOTA_AGO,'
      '    0 AS QUOTA_SET,'
      '    0 AS QUOTA_OUT,'
      '    0 AS QUOTA_NOV,'
      '    0 AS QUOTA_DEZ,'
      '    0 AS QUOTA_KG_JAN,'
      '    0 AS QUOTA_KG_FEV,'
      '    0 AS QUOTA_KG_MAR,'
      '    0 AS QUOTA_KG_ABR,'
      '    0 AS QUOTA_KG_MAI,'
      '    0 AS QUOTA_KG_JUN,'
      '    0 AS QUOTA_KG_JUL,'
      '    0 AS QUOTA_KG_AGO,'
      '    0 AS QUOTA_KG_SET,'
      '    0 AS QUOTA_KG_OUT,'
      '    0 AS QUOTA_KG_NOV,'
      '    0 AS QUOTA_KG_DEZ'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_FILIAL,'
      '    TB_VENDEDOR,'
      '    TB_OPERACAO,'
      '    TB_CLASSE,'
      '    TB_PRODUTO'
      '  WHERE'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '    AND'
      '    TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '    AND'
      '    TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '    AND'
      '    (Tb_operacao.ind_vendas = '#39'D'#39')'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    (:VENDEDOR IS NULL'
      '     OR'
      '      TB_VENDEDOR.COD_VENDEDOR = :VENDEDOR)'
      '    AND'
      '    LTRIM(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'YYYY'#39')) = :ANO'
      '  GROUP BY'
      '    TB_CLASSE.COD_CLASSE,'
      '    TB_CLASSE.DESC_CLASSE,'
      '    TB_VENDEDOR.COD_VENDEDOR,'
      '    TB_VENDEDOR.NOME'
      ''
      ''
      'UNION ALL'
      ''
      '/* *** QUOTA ****  */'
      ''
      '  SELECT'
      '    TB_CLASSE.COD_CLASSE,'
      '    TB_CLASSE.DESC_CLASSE,'
      '    TB_VENDEDOR.COD_VENDEDOR,'
      '    TB_VENDEDOR.NOME,'
      '    TO_NUMBER('#39'0'#39') AS VAL_JANEIRO,'
      '    TO_NUMBER('#39'0'#39') AS VAL_FEVEREIRO,'
      '    TO_NUMBER('#39'0'#39') AS VAL_MARCO,'
      '    TO_NUMBER('#39'0'#39') AS VAL_ABRIL,'
      '    TO_NUMBER('#39'0'#39') AS VAL_MAIO,'
      '    TO_NUMBER('#39'0'#39') AS VAL_JUNHO,'
      '    TO_NUMBER('#39'0'#39') AS VAL_JULHO,'
      '    TO_NUMBER('#39'0'#39') AS VAL_AGOSTO,'
      '    TO_NUMBER('#39'0'#39') AS VAL_SETEMBRO,'
      '    TO_NUMBER('#39'0'#39') AS VAL_OUTUBRO,'
      '    TO_NUMBER('#39'0'#39') AS VAL_NOVEMBRO,'
      '    TO_NUMBER('#39'0'#39') AS VAL_DEZEMBRO,'
      '    TO_NUMBER('#39'0'#39') AS QT_JANEIRO,'
      '    TO_NUMBER('#39'0'#39') AS QT_FEVEREIRO,'
      '    TO_NUMBER('#39'0'#39') AS QT_MARCO,'
      '    TO_NUMBER('#39'0'#39') AS QT_ABRIL,'
      '    TO_NUMBER('#39'0'#39') AS QT_MAIO,'
      '    TO_NUMBER('#39'0'#39') AS QT_JUNHO,'
      '    TO_NUMBER('#39'0'#39') AS QT_JULHO,'
      '    TO_NUMBER('#39'0'#39') AS QT_AGOSTO,'
      '    TO_NUMBER('#39'0'#39') AS QT_SETEMBRO,'
      '    TO_NUMBER('#39'0'#39') AS QT_OUTUBRO,'
      '    TO_NUMBER('#39'0'#39') AS QT_NOVEMBRO,'
      '    TO_NUMBER('#39'0'#39') AS QT_DEZEMBRO,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_TOTAL,'
      '    TO_NUMBER('#39'0'#39') AS SQT_QUANTIDADE,'
      '    SUM(DECODE(NUM_MES,1,QT_QUOTA,0))AS QUOTA_JAN,'
      '    SUM(DECODE(NUM_MES,2,QT_QUOTA,0))AS QUOTA_FEV,'
      '    SUM(DECODE(NUM_MES,3,QT_QUOTA,0))AS QUOTA_MAR,'
      '    SUM(DECODE(NUM_MES,4,QT_QUOTA,0))AS QUOTA_ABR,'
      '    SUM(DECODE(NUM_MES,5,QT_QUOTA,0))AS QUOTA_MAI,'
      '    SUM(DECODE(NUM_MES,6,QT_QUOTA,0))AS QUOTA_JUN,'
      '    SUM(DECODE(NUM_MES,7,QT_QUOTA,0))AS QUOTA_JUL,'
      '    SUM(DECODE(NUM_MES,8,QT_QUOTA,0))AS QUOTA_AGO,'
      '    SUM(DECODE(NUM_MES,9,QT_QUOTA,0))AS QUOTA_SET,'
      '    SUM(DECODE(NUM_MES,10,QT_QUOTA,0))AS QUOTA_OUT,'
      '    SUM(DECODE(NUM_MES,11,QT_QUOTA,0))AS QUOTA_NOV,'
      '    SUM(DECODE(NUM_MES,12,QT_QUOTA,0))AS QUOTA_DEZ,'
      '    SUM(DECODE(NUM_MES,1,QT_QUOTA_KG,0))AS QUOTA_KG_JAN,'
      '    SUM(DECODE(NUM_MES,2,QT_QUOTA_KG,0))AS QUOTA_KG_FEV,'
      '    SUM(DECODE(NUM_MES,3,QT_QUOTA_KG,0))AS QUOTA_KG_MAR,'
      '    SUM(DECODE(NUM_MES,4,QT_QUOTA_KG,0))AS QUOTA_KG_ABR,'
      '    SUM(DECODE(NUM_MES,5,QT_QUOTA_KG,0))AS QUOTA_KG_MAI,'
      '    SUM(DECODE(NUM_MES,6,QT_QUOTA_KG,0))AS QUOTA_KG_JUN,'
      '    SUM(DECODE(NUM_MES,7,QT_QUOTA_KG,0))AS QUOTA_KG_JUL,'
      '    SUM(DECODE(NUM_MES,8,QT_QUOTA_KG,0))AS QUOTA_KG_AGO,'
      '    SUM(DECODE(NUM_MES,9,QT_QUOTA_KG,0))AS QUOTA_KG_SET,'
      '    SUM(DECODE(NUM_MES,10,QT_QUOTA_KG,0))AS QUOTA_KG_OUT,'
      '    SUM(DECODE(NUM_MES,11,QT_QUOTA_KG,0))AS QUOTA_KG_NOV,'
      '    SUM(DECODE(NUM_MES,12,QT_QUOTA_KG,0))AS QUOTA_KG_DEZ'
      '  FROM'
      '    TB_VENDEDOR,'
      '    TB_VENDEDOR_QUOTA,'
      '    TB_CLASSE'
      '  WHERE'
      '    TB_VENDEDOR_QUOTA.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '    AND'
      '    TB_VENDEDOR_QUOTA.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '    AND'
      '    (:VENDEDOR IS NULL'
      '     OR'
      '      TB_VENDEDOR.COD_VENDEDOR = :VENDEDOR)'
      '    AND'
      '    TB_VENDEDOR_QUOTA.NUM_ANO = :ANO'
      '  GROUP BY'
      '    TB_CLASSE.COD_CLASSE,'
      '    TB_CLASSE.DESC_CLASSE,'
      '    TB_VENDEDOR.COD_VENDEDOR,'
      '    TB_VENDEDOR.NOME'
      ''
      ')'
      'GROUP BY'
      '  COD_CLASSE,'
      '  DESC_CLASSE,'
      '  COD_VENDEDOR,'
      '  NOME'
      'ORDER BY'
      '  COD_VENDEDOR,'
      '  NOME,'
      '  COD_CLASSE,'
      '  DESC_CLASSE')
    Variables.Data = {
      0300000002000000090000003A56454E4445444F520300000000000000000000
      00040000003A414E4F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000360000000C000000434F445F56454E4445444F520100000000000400
      00004E4F4D450100000000000B00000056414C5F4A414E4549524F0100000000
      000D00000056414C5F46455645524549524F0100000000000900000056414C5F
      4D4152434F0100000000000900000056414C5F414252494C0100000000000800
      000056414C5F4D41494F0100000000000900000056414C5F4A554E484F010000
      0000000900000056414C5F4A554C484F0100000000000A00000056414C5F4147
      4F53544F0100000000000C00000056414C5F534554454D42524F010000000000
      0B00000056414C5F4F55545542524F0100000000000C00000056414C5F4E4F56
      454D42524F0100000000000C00000056414C5F44455A454D42524F0100000000
      000A00000051545F4A414E4549524F0100000000000C00000051545F46455645
      524549524F0100000000000800000051545F4D4152434F010000000000080000
      0051545F414252494C0100000000000700000051545F4D41494F010000000000
      0800000051545F4A554E484F0100000000000800000051545F4A554C484F0100
      000000000900000051545F41474F53544F0100000000000B00000051545F5345
      54454D42524F0100000000000A00000051545F4F55545542524F010000000000
      0B00000051545F4E4F56454D42524F0100000000000B00000051545F44455A45
      4D42524F0100000000000A0000005356414C5F544F54414C0100000000000E00
      00005351545F5155414E5449444144450100000000000900000051554F54415F
      4A414E0100000000000900000051554F54415F46455601000000000009000000
      51554F54415F4D41520100000000000900000051554F54415F41425201000000
      00000900000051554F54415F4D41490100000000000900000051554F54415F4A
      554E0100000000000900000051554F54415F4A554C0100000000000900000051
      554F54415F41474F0100000000000900000051554F54415F5345540100000000
      000900000051554F54415F4F55540100000000000900000051554F54415F4E4F
      560100000000000900000051554F54415F44455A0100000000000C0000005155
      4F54415F4B475F4A414E0100000000000C00000051554F54415F4B475F464556
      0100000000000C00000051554F54415F4B475F4D41520100000000000C000000
      51554F54415F4B475F4142520100000000000C00000051554F54415F4B475F4D
      41490100000000000C00000051554F54415F4B475F4A554E0100000000000C00
      000051554F54415F4B475F4A554C0100000000000C00000051554F54415F4B47
      5F41474F0100000000000C00000051554F54415F4B475F534554010000000000
      0C00000051554F54415F4B475F4F55540100000000000C00000051554F54415F
      4B475F4E4F560100000000000C00000051554F54415F4B475F44455A01000000
      00000A000000434F445F434C415353450100000000000B000000444553435F43
      4C41535345010000000000}
    ReadOnly = True
    QueryAllRecords = False
    Session = DMOracle.DBCemapa
    Left = 480
    Top = 169
    object QRQuotaVendCOD_VENDEDOR: TFloatField
      FieldName = 'COD_VENDEDOR'
    end
    object QRQuotaVendNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object QRQuotaVendVAL_JANEIRO: TFloatField
      FieldName = 'VAL_JANEIRO'
    end
    object QRQuotaVendVAL_FEVEREIRO: TFloatField
      FieldName = 'VAL_FEVEREIRO'
    end
    object QRQuotaVendVAL_MARCO: TFloatField
      FieldName = 'VAL_MARCO'
    end
    object QRQuotaVendVAL_ABRIL: TFloatField
      FieldName = 'VAL_ABRIL'
    end
    object QRQuotaVendVAL_MAIO: TFloatField
      FieldName = 'VAL_MAIO'
    end
    object QRQuotaVendVAL_JUNHO: TFloatField
      FieldName = 'VAL_JUNHO'
    end
    object QRQuotaVendVAL_JULHO: TFloatField
      FieldName = 'VAL_JULHO'
    end
    object QRQuotaVendVAL_AGOSTO: TFloatField
      FieldName = 'VAL_AGOSTO'
    end
    object QRQuotaVendVAL_SETEMBRO: TFloatField
      FieldName = 'VAL_SETEMBRO'
    end
    object QRQuotaVendVAL_OUTUBRO: TFloatField
      FieldName = 'VAL_OUTUBRO'
    end
    object QRQuotaVendVAL_NOVEMBRO: TFloatField
      FieldName = 'VAL_NOVEMBRO'
    end
    object QRQuotaVendVAL_DEZEMBRO: TFloatField
      FieldName = 'VAL_DEZEMBRO'
    end
    object QRQuotaVendQT_JANEIRO: TFloatField
      FieldName = 'QT_JANEIRO'
    end
    object QRQuotaVendQT_FEVEREIRO: TFloatField
      FieldName = 'QT_FEVEREIRO'
    end
    object QRQuotaVendQT_MARCO: TFloatField
      FieldName = 'QT_MARCO'
    end
    object QRQuotaVendQT_ABRIL: TFloatField
      FieldName = 'QT_ABRIL'
    end
    object QRQuotaVendQT_MAIO: TFloatField
      FieldName = 'QT_MAIO'
    end
    object QRQuotaVendQT_JUNHO: TFloatField
      FieldName = 'QT_JUNHO'
    end
    object QRQuotaVendQT_JULHO: TFloatField
      FieldName = 'QT_JULHO'
    end
    object QRQuotaVendQT_AGOSTO: TFloatField
      FieldName = 'QT_AGOSTO'
    end
    object QRQuotaVendQT_SETEMBRO: TFloatField
      FieldName = 'QT_SETEMBRO'
    end
    object QRQuotaVendQT_OUTUBRO: TFloatField
      FieldName = 'QT_OUTUBRO'
    end
    object QRQuotaVendQT_NOVEMBRO: TFloatField
      FieldName = 'QT_NOVEMBRO'
    end
    object QRQuotaVendQT_DEZEMBRO: TFloatField
      FieldName = 'QT_DEZEMBRO'
    end
    object QRQuotaVendSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRQuotaVendSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRQuotaVendQUOTA_JAN: TFloatField
      FieldName = 'QUOTA_JAN'
    end
    object QRQuotaVendQUOTA_FEV: TFloatField
      FieldName = 'QUOTA_FEV'
    end
    object QRQuotaVendQUOTA_MAR: TFloatField
      FieldName = 'QUOTA_MAR'
    end
    object QRQuotaVendQUOTA_ABR: TFloatField
      FieldName = 'QUOTA_ABR'
    end
    object QRQuotaVendQUOTA_MAI: TFloatField
      FieldName = 'QUOTA_MAI'
    end
    object QRQuotaVendQUOTA_JUN: TFloatField
      FieldName = 'QUOTA_JUN'
    end
    object QRQuotaVendQUOTA_JUL: TFloatField
      FieldName = 'QUOTA_JUL'
    end
    object QRQuotaVendQUOTA_AGO: TFloatField
      FieldName = 'QUOTA_AGO'
    end
    object QRQuotaVendQUOTA_SET: TFloatField
      FieldName = 'QUOTA_SET'
    end
    object QRQuotaVendQUOTA_OUT: TFloatField
      FieldName = 'QUOTA_OUT'
    end
    object QRQuotaVendQUOTA_NOV: TFloatField
      FieldName = 'QUOTA_NOV'
    end
    object QRQuotaVendQUOTA_DEZ: TFloatField
      FieldName = 'QUOTA_DEZ'
    end
    object QRQuotaVendQUOTA_KG_JAN: TFloatField
      FieldName = 'QUOTA_KG_JAN'
    end
    object QRQuotaVendQUOTA_KG_FEV: TFloatField
      FieldName = 'QUOTA_KG_FEV'
    end
    object QRQuotaVendQUOTA_KG_MAR: TFloatField
      FieldName = 'QUOTA_KG_MAR'
    end
    object QRQuotaVendQUOTA_KG_ABR: TFloatField
      FieldName = 'QUOTA_KG_ABR'
    end
    object QRQuotaVendQUOTA_KG_MAI: TFloatField
      FieldName = 'QUOTA_KG_MAI'
    end
    object QRQuotaVendQUOTA_KG_JUN: TFloatField
      FieldName = 'QUOTA_KG_JUN'
    end
    object QRQuotaVendQUOTA_KG_JUL: TFloatField
      FieldName = 'QUOTA_KG_JUL'
    end
    object QRQuotaVendQUOTA_KG_AGO: TFloatField
      FieldName = 'QUOTA_KG_AGO'
    end
    object QRQuotaVendQUOTA_KG_SET: TFloatField
      FieldName = 'QUOTA_KG_SET'
    end
    object QRQuotaVendQUOTA_KG_OUT: TFloatField
      FieldName = 'QUOTA_KG_OUT'
    end
    object QRQuotaVendQUOTA_KG_NOV: TFloatField
      FieldName = 'QUOTA_KG_NOV'
    end
    object QRQuotaVendQUOTA_KG_DEZ: TFloatField
      FieldName = 'QUOTA_KG_DEZ'
    end
    object QRQuotaVendCOD_CLASSE: TFloatField
      FieldName = 'COD_CLASSE'
    end
    object QRQuotaVendDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
  end
  object QRVendaVendClasse: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_produto.COD_PRODUTO,'
      '  Tb_produto.DESC_PRODUTO,'
      '  Tb_produto.COD_CADASTRO,'
      '  Tb_classe.COD_CLASSE,'
      '  Tb_classe.DESC_CLASSE,'
      
        '  Decode(:IND_QUEBRA,'#39'S'#39',Tb_nota_cab.COD_VENDEDOR,0) AS COD_VEND' +
        'EDOR,'
      '  Decode(:IND_QUEBRA,'#39'S'#39',Tb_Vendedor.NOME,'#39#39') AS NOME,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.QT_QUANTIDA' +
        'DE,(Tb_nota_item.QT_QUANTIDADE * -1))) AS SQT_QUANTIDADE,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.VAL_TOTAL -' +
        ' PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.V' +
        'AL_DESPESAS + Tb_nota_item.VAL_FRETE+TB_NOTA_ITEM.VAL_ICMS_SUBST' +
        ',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_N' +
        'OTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_FRETE+T' +
        'B_NOTA_ITEM.VAL_ICMS_SUBST)*-1)) AS SVAL_TOTAL,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.QT_QUANTIDA' +
        'DE * Tb_nota_item.VAL_CUSTO,TB_NOTA_ITEM.VAL_CUSTO * -1)) AS SVA' +
        'L_CUSTO'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_PRODUTO,'
      '  TB_OPERACAO,'
      '  TB_CLASSE,'
      '  TB_VENDEDOR'
      'WHERE'
      '   TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '   AND'
      '   TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '   AND'
      '   Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '   AND'
      '   Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '   AND'
      '   Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '   AND'
      '   Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '   AND'
      '   (:MONTADO_NA_ROTINA)'
      '   AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '   AND'
      '    (:CLASSEI IS NULL OR'
      '     TB_CLASSE.NUM_CLASSE = :CLASSEI)'
      '   AND'
      '    (:SUBCLASSE IS NULL OR'
      '     TB_CLASSE.NUM_SUBCLASSE = :SUBCLASSE)'
      '   AND'
      '    (:VENDEDOR IS NULL OR'
      '     TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '   AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '     TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR_PREPOSTO)'
      '   AND'
      '    (:PRODUTO IS NULL OR'
      '     TB_NOTA_ITEM.COD_PRODUTO = :PRODUTO)'
      '   AND'
      '   TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '   AND'
      '   TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      'GROUP BY'
      '  Tb_produto.COD_PRODUTO,'
      '  Tb_produto.DESC_PRODUTO,'
      '  Tb_produto.COD_CADASTRO,'
      '  Tb_classe.COD_CLASSE,'
      '  Tb_classe.DESC_CLASSE,'
      '  Decode(:IND_QUEBRA,'#39'S'#39',Tb_nota_cab.COD_VENDEDOR,0),'
      '  Decode(:IND_QUEBRA,'#39'S'#39',Tb_Vendedor.NOME,'#39#39')'
      'ORDER BY  COD_CADASTRO, DESC_CLASSE, COD_VENDEDOR, COD_PRODUTO')
    Variables.Data = {
      030000000A000000070000003A46494C49414C03000000000000000000000008
      0000003A434C41535345490300000000000000000000000A0000003A53554243
      4C41535345030000000000000000000000090000003A56454E4445444F520300
      00000000000000000000080000003A50524F4455544F03000000000000000000
      0000070000003A444154415F490C0000000000000000000000070000003A4441
      54415F460C0000000000000000000000120000003A56454E4445444F525F5052
      45504F53544F0300000000000000000000000B0000003A494E445F5155454252
      41050000000000000000000000120000003A4D4F4E5441444F5F4E415F524F54
      494E41010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000B000000434F445F50524F4455544F0100000000000C0000
      00444553435F50524F4455544F0100000000000C000000434F445F4341444153
      54524F0100000000000A000000434F445F434C415353450100000000000B0000
      00444553435F434C415353450100000000000C000000434F445F56454E444544
      4F52010000000000040000004E4F4D450100000000000E0000005351545F5155
      414E5449444144450100000000000A0000005356414C5F544F54414C01000000
      00000A0000005356414C5F435553544F010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRVendaVendClasseCalcFields
    Left = 256
    Top = 280
    object QRVendaVendClasseCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRVendaVendClasseCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object QRVendaVendClasseCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object QRVendaVendClasseDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QRVendaVendClasseNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 40
    end
    object QRVendaVendClasseSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRVendaVendClasseSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRVendaVendClassenome_fornecedor: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome_fornecedor'
      Size = 50
      Calculated = True
    end
    object QRVendaVendClasseDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRVendaVendClasseCOD_VENDEDOR: TFloatField
      FieldName = 'COD_VENDEDOR'
    end
    object QRVendaVendClasseSVAL_CUSTO: TFloatField
      FieldName = 'SVAL_CUSTO'
    end
  end
  object QrReceber_Titulos: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_conta_receber_cab.COD_FINALIDADE,'
      '  Tb_conta_receber_cab.COD_FILIAL,'
      '  Tb_conta_receber_cab.NUM_TITULO,'
      '  Tb_conta_receber_cab.NUM_PARCELA,'
      '  Tb_conta_receber_cab.DESC_TIPO_DOCUMENTO,'
      '  Tb_conta_receber_cab.DT_VENCIMENTO,'
      '  Tb_conta_receber_cab.DT_EMISSAO,'
      '  Tb_conta_receber_cab.VAL_TITULO,'
      '  Tb_conta_receber_cab.IND_SITUACAO,'
      '  Tb_conta_receber_cab.COD_CADASTRO,'
      '  Tb_cadastro.NOME'
      'FROM'
      '  TB_CONTA_RECEBER_CAB,'
      '  TB_CADASTRO'
      'WHERE'
      '  (Tb_conta_receber_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO)'
      '  AND'
      '  (Tb_conta_receber_cab.COD_NOTA_CAB IS NULL)'
      '  AND'
      '  (:COD_FILIAL IS NULL'
      '   OR'
      '    Tb_conta_receber_cab.COD_FILIAL = :COD_FILIAL)'
      '  AND'
      '  (:COD_CADASTRO IS NULL'
      '   OR'
      '    Tb_conta_receber_cab.COD_CADASTRO = :COD_CADASTRO)'
      '  AND'
      '  (Tb_conta_receber_cab.DT_VENCIMENTO >= :DATA_I)'
      '  AND'
      '  (Tb_conta_receber_cab.DT_VENCIMENTO <= :DATA_F)'
      ' '
      ' ')
    QBEDefinition.QBEFieldDefs = {
      040000000B0000000E000000434F445F46494E414C4944414445010000000000
      0A000000434F445F46494C49414C0100000000000A0000004E554D5F54495455
      4C4F0100000000000B0000004E554D5F50415243454C41010000000000130000
      00444553435F5449504F5F444F43554D454E544F0100000000000D0000004454
      5F56454E43494D454E544F0100000000000A00000044545F454D495353414F01
      00000000000A00000056414C5F544954554C4F0100000000000C000000494E44
      5F534954554143414F0100000000000C000000434F445F434144415354524F01
      0000000000040000004E4F4D45010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 256
    Top = 232
    object QrReceber_TitulosCOD_FINALIDADE: TIntegerField
      FieldName = 'COD_FINALIDADE'
    end
    object QrReceber_TitulosCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QrReceber_TitulosNUM_TITULO: TIntegerField
      FieldName = 'NUM_TITULO'
    end
    object QrReceber_TitulosNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object QrReceber_TitulosDESC_TIPO_DOCUMENTO: TStringField
      FieldName = 'DESC_TIPO_DOCUMENTO'
      Size = 3
    end
    object QrReceber_TitulosDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object QrReceber_TitulosDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QrReceber_TitulosVAL_TITULO: TFloatField
      FieldName = 'VAL_TITULO'
    end
    object QrReceber_TitulosIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 13
    end
    object QrReceber_TitulosCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QrReceber_TitulosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
  end
  object QRNota_ComCheque: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Nome,'
      '  SUM(SVAL_PRAZO1) AS SVAL_PRAZO1,'
      '  SUM(SVAL_PRAZO2) AS SVAL_PRAZO2,'
      '  SUM(SVAL_PRAZO3) AS SVAL_PRAZO3,'
      '  SUM(SVAL_PRAZO4) AS SVAL_PRAZO4,'
      '  SUM(SVAL_LONGO_PRAZO) AS SVAL_LONGO_PRAZO,'
      '  SUM(SVAL_PRAZO1+SVAL_PRAZO2'
      '      +SVAL_PRAZO3+SVAL_PRAZO4+SVAL_LONGO_PRAZO) AS SVAL_TOTAL'
      'FROM'
      '('
      '   SELECT'
      '     Tb_vendedor.NOME,'
      
        '     SUM(Tb_nota_item.VAL_TOTAL- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) +Tb_nota_item.VAL_DESPESAS+Tb_nota_item.VAL_FRET' +
        'E + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SVAL_PRAZO1,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_PRAZO2,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_PRAZO3,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_PRAZO4,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_LONGO_PRAZO'
      '   FROM'
      '     TB_NOTA_CAB,'
      '     TB_NOTA_ITEM,'
      '     TB_VENDEDOR,'
      '     TB_OPERACAO'
      '   WHERE'
      '     (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB)'
      '      AND'
      '     (Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR)'
      '      AND'
      '     (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)'
      '      And'
      '      TB_NOTA_CAB.IND_CONDICAO_PAGTO = '#39'3'#39
      '      AND'
      '      TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '      AND'
      '      TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '      AND'
      '      TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '      AND'
      '      TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '      AND'
      '      (:FILIAL IS NULL OR'
      '       :FILIAL = TB_NOTA_CAB.COD_FILIAL )'
      '      AND'
      '      TB_NOTA_CAB.NR_DIAS_CHEQUE <= :PRAZO1'
      '     GROUP BY'
      '       Tb_vendedor.NOME'
      ''
      '  UNION ALL'
      ''
      '     SELECT'
      '     Tb_vendedor.NOME,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_PRAZO1,'
      
        '     SUM(Tb_nota_item.VAL_TOTAL- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) +Tb_nota_item.VAL_DESPESAS+Tb_nota_item.VAL_FRET' +
        'E + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SVAL_PRAZO2,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_PRAZO3,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_PRAZO4,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_LONGO_PRAZO'
      '   FROM'
      '     TB_NOTA_CAB,'
      '     TB_NOTA_ITEM,'
      '     TB_VENDEDOR,'
      '     TB_OPERACAO'
      '   WHERE'
      '     (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB)'
      '      AND'
      '     (Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR)'
      '      AND'
      '     (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)'
      '      And'
      '      TB_NOTA_CAB.IND_CONDICAO_PAGTO = '#39'3'#39
      '      AND'
      '      TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '      AND'
      '      TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '      AND'
      '      TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '      AND'
      '      TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '      AND'
      '      (:FILIAL IS NULL OR'
      '       :FILIAL = TB_NOTA_CAB.COD_FILIAL )'
      '      AND'
      '      TB_NOTA_CAB.NR_DIAS_CHEQUE > :PRAZO1'
      '      AND'
      '      TB_NOTA_CAB.NR_DIAS_CHEQUE <= :PRAZO2'
      '    GROUP BY'
      '      Tb_vendedor.NOME'
      ''
      '  UNION ALL'
      ''
      '     SELECT'
      '     Tb_vendedor.NOME,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_PRAZO1,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_PRAZO2,'
      
        '     SUM(Tb_nota_item.VAL_TOTAL- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) +Tb_nota_item.VAL_DESPESAS+Tb_nota_item.VAL_FRET' +
        'E + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SVAL_PRAZO3,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_PRAZO4,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_LONGO_PRAZO'
      '   FROM'
      '     TB_NOTA_CAB,'
      '     TB_NOTA_ITEM,'
      '     TB_VENDEDOR,'
      '     TB_OPERACAO'
      '   WHERE'
      '     (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB)'
      '      AND'
      '     (Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR)'
      '      AND'
      '     (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)'
      '      AND'
      '      TB_NOTA_CAB.IND_CONDICAO_PAGTO = '#39'3'#39
      '      AND'
      '      TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '      AND'
      '      TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '      AND'
      '      TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '      AND'
      '      TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '      AND'
      '      (:FILIAL IS NULL OR'
      '       :FILIAL = TB_NOTA_CAB.COD_FILIAL )'
      '      AND'
      '      TB_NOTA_CAB.NR_DIAS_CHEQUE > :PRAZO2'
      '      AND'
      '      TB_NOTA_CAB.NR_DIAS_CHEQUE <= :PRAZO3'
      '    GROUP BY'
      '      Tb_vendedor.NOME'
      ''
      '  UNION ALL'
      ''
      '     SELECT'
      '     Tb_vendedor.NOME,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_PRAZO1,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_PRAZO2,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_PRAZO3,'
      
        '     SUM(Tb_nota_item.VAL_TOTAL- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) +Tb_nota_item.VAL_DESPESAS+Tb_nota_item.VAL_FRET' +
        'E + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SVAL_PRAZO4,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_LONGO_PRAZO'
      '   FROM'
      '     TB_NOTA_CAB,'
      '     TB_NOTA_ITEM,'
      '     TB_VENDEDOR,'
      '     TB_OPERACAO'
      '   WHERE'
      '     (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB)'
      '      AND'
      '     (Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR)'
      '      AND'
      '     (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)'
      '      AND'
      '      TB_NOTA_CAB.IND_CONDICAO_PAGTO = '#39'3'#39
      '      AND'
      '      TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '      AND'
      '      TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '      AND'
      '      TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '      AND'
      '      TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '      AND'
      '      (:FILIAL IS NULL OR'
      '       :FILIAL = TB_NOTA_CAB.COD_FILIAL )'
      '      AND'
      '      TB_NOTA_CAB.NR_DIAS_CHEQUE > :PRAZO3'
      '      AND'
      '      TB_NOTA_CAB.NR_DIAS_CHEQUE <= :PRAZO4'
      '    GROUP BY'
      '      Tb_vendedor.NOME'
      ''
      '  UNION ALL'
      ''
      '     SELECT'
      '     Tb_vendedor.NOME,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_PRAZO1,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_PRAZO2,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_PRAZO3,'
      '     TO_NUMBER('#39'0'#39') AS SVAL_PRAZO4,'
      
        '     SUM(Tb_nota_item.VAL_TOTAL- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) +Tb_nota_item.VAL_DESPESAS+Tb_nota_item.VAL_FRET' +
        'E + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SVAL_LONGO_PRAZO'
      '   FROM'
      '     TB_NOTA_CAB,'
      '     TB_NOTA_ITEM,'
      '     TB_VENDEDOR,'
      '     TB_OPERACAO'
      '   WHERE'
      '     (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB)'
      '      AND'
      '     (Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR)'
      '      AND'
      '     (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)'
      '      AND'
      '      TB_NOTA_CAB.IND_CONDICAO_PAGTO = '#39'3'#39
      '      AND'
      '      TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '      AND'
      '      TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '      AND'
      '      TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '      AND'
      '      TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '      AND'
      '      (:FILIAL IS NULL OR'
      '       :FILIAL = TB_NOTA_CAB.COD_FILIAL )'
      '      AND'
      '      TB_NOTA_CAB.NR_DIAS_CHEQUE > :PRAZO4'
      '    GROUP BY'
      '      Tb_vendedor.NOME'
      ')'
      'GROUP BY'
      '  NOME'
      ' '
      ' ')
    Variables.Data = {
      0300000007000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000070000003A46494C4941
      4C030000000000000000000000070000003A5052415A4F310400000000000000
      00000000070000003A5052415A4F32040000000000000000000000070000003A
      5052415A4F33040000000000000000000000070000003A5052415A4F34040000
      000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000007000000040000004E4F4D450100000000000B0000005356414C5F50
      52415A4F310100000000000B0000005356414C5F5052415A4F32010000000000
      0B0000005356414C5F5052415A4F330100000000000B0000005356414C5F5052
      415A4F34010000000000100000005356414C5F4C4F4E474F5F5052415A4F0100
      000000000A0000005356414C5F544F54414C010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 266
    object QRNota_ComChequeNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object QRNota_ComChequeSVAL_PRAZO1: TFloatField
      FieldName = 'SVAL_PRAZO1'
    end
    object QRNota_ComChequeSVAL_PRAZO2: TFloatField
      FieldName = 'SVAL_PRAZO2'
    end
    object QRNota_ComChequeSVAL_PRAZO3: TFloatField
      FieldName = 'SVAL_PRAZO3'
    end
    object QRNota_ComChequeSVAL_PRAZO4: TFloatField
      FieldName = 'SVAL_PRAZO4'
    end
    object QRNota_ComChequeSVAL_LONGO_PRAZO: TFloatField
      FieldName = 'SVAL_LONGO_PRAZO'
    end
    object QRNota_ComChequeSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
  end
  object QRClaspar: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_LOTE_CLASPAR.NUM_CERTIFICADO,'
      '  TB_LOTE_CLASPAR.COD_SERIE AS CL_COD_SERIE,'
      '  TB_LOTE_CLASPAR.COD_ESTADO AS CL_COD_ESTADO,'
      '  TB_LOTE_CLASPAR.DT_EMISSAO AS CL_DT_EMISSAO,'
      '  TB_LOTE_CLASPAR.DT_VALIDADE,'
      '  TB_LOTE_CLASPAR.COD_REG_MAARA,'
      '  TB_LOTE_CLASPAR.PERC_UMIDADE,'
      '  TB_LOTE_CLASPAR.DESC_SAFRA,'
      '  TB_LOTE_CLASPAR.QT_CLASSIFICADO,'
      '  TB_LOTE_CLASPAR.DESC_RENDA,'
      '  TB_LOTE_CLASPAR.PERC_INTEIRO,'
      '  TB_LOTE_CLASPAR.PERC_QUEBRADOS,'
      '  TB_LOTE_CLASPAR.DESC_MARCA,'
      '  TB_LOTE_CLASPAR.DESC_GRUPO,'
      '  TB_LOTE_CLASPAR.DESC_CLASSE,'
      '  TB_LOTE_CLASPAR.DESC_TIPO,'
      '  TB_LOTE_CLASPAR.DESC_REGIONAL,'
      '  TB_LOTE_CLASPAR.DESC_POSTO,'
      '  TB_NOTA_CAB.DT_EMISSAO AS NF_EMISSAO,'
      '  TB_NOTA_CAB.NUM_NOTA,'
      
        '  TB_NOTA_ITEM.QT_QUANTIDADE*TB_PRODUTO.NUM_EMBALAGEM AS QT_QUAN' +
        'TIDADE,'
      '  TB_CADASTRO.NOME AS NOME_CADASTRO,'
      '  TB_CADASTRO.DESC_CIDADE,'
      '  TB_FILIAL.DESC_FILIAL,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_LOTE_TIPO.DESC_LOTE,'
      '  TB_DESDOBRAMENTO_CLASPAR.NUM_DESDOBRAMENTO,'
      '  TB_DESDOBRAMENTO_CLASPAR.IND_SITUACAO'
      'FROM'
      '  TB_PRODUTO,'
      '  TB_FILIAL,'
      '  TB_LOTE_CLASPAR,'
      '  TB_LOTE_TIPO,'
      '  TB_CADASTRO,'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_DESDOBRAMENTO_CLASPAR'
      'WHERE'
      '  TB_PRODUTO.COD_PRODUTO = TB_NOTA_ITEM.COD_PRODUTO'
      '  AND'
      '  TB_FILIAL.COD_FILIAL = TB_NOTA_CAB.COD_FILIAL'
      '  AND'
      '  TB_CADASTRO.COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO'
      '  AND'
      '  TB_LOTE_TIPO.COD_LOTE_TIPO = TB_LOTE_CLASPAR.COD_LOTE_TIPO'
      '  AND'
      '  TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '  AND'
      '  TB_NOTA_ITEM.COD_LOTE_TIPO = TB_LOTE_TIPO.COD_LOTE_TIPO'
      '  AND'
      
        '  TB_NOTA_ITEM.COD_NOTA_ITEM = TB_DESDOBRAMENTO_CLASPAR.COD_NOTA' +
        '_ITEM'
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO <> 1'
      '  AND'
      '  TB_LOTE_CLASPAR.COD_LOTE_TIPO = :LOTE'
      'ORDER BY'
      '  TB_DESDOBRAMENTO_CLASPAR.NUM_DESDOBRAMENTO')
    Variables.Data = {0300000001000000050000003A4C4F5445030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001C0000000F0000004E554D5F434552544946494341444F0100000000
      000C000000434C5F434F445F53455249450100000000000D000000434C5F434F
      445F45535441444F0100000000000D000000434C5F44545F454D495353414F01
      00000000000B00000044545F56414C49444144450100000000000D000000434F
      445F5245475F4D414152410100000000000C000000504552435F554D49444144
      450100000000000A000000444553435F53414652410100000000000F00000051
      545F434C4153534946494341444F0100000000000A000000444553435F52454E
      44410100000000000C000000504552435F494E544549524F0100000000000E00
      0000504552435F515545425241444F530100000000000A000000444553435F4D
      415243410100000000000A000000444553435F475255504F0100000000000B00
      0000444553435F434C4153534501000000000009000000444553435F5449504F
      0100000000000D000000444553435F524547494F4E414C0100000000000A0000
      00444553435F504F53544F0100000000000A0000004E465F454D495353414F01
      0000000000080000004E554D5F4E4F54410100000000000D00000051545F5155
      414E5449444144450100000000000D0000004E4F4D455F434144415354524F01
      00000000000B000000444553435F4349444144450100000000000B0000004445
      53435F46494C49414C0100000000000C000000444553435F50524F4455544F01
      000000000009000000444553435F4C4F5445010000000000110000004E554D5F
      444553444F4252414D454E544F0100000000000C000000494E445F5349545541
      43414F010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 371
    Top = 308
    object QRClasparNUM_CERTIFICADO: TFloatField
      FieldName = 'NUM_CERTIFICADO'
      Required = True
    end
    object QRClasparCL_COD_SERIE: TStringField
      FieldName = 'CL_COD_SERIE'
      Required = True
      Size = 2
    end
    object QRClasparCL_COD_ESTADO: TStringField
      FieldName = 'CL_COD_ESTADO'
      Required = True
      Size = 2
    end
    object QRClasparCL_DT_EMISSAO: TDateTimeField
      FieldName = 'CL_DT_EMISSAO'
      Required = True
    end
    object QRClasparDT_VALIDADE: TDateTimeField
      FieldName = 'DT_VALIDADE'
      Required = True
      EditMask = '!99/99/##00;1;_'
    end
    object QRClasparCOD_REG_MAARA: TStringField
      FieldName = 'COD_REG_MAARA'
      Required = True
      Size = 15
    end
    object QRClasparPERC_UMIDADE: TFloatField
      FieldName = 'PERC_UMIDADE'
      Required = True
    end
    object QRClasparDESC_SAFRA: TStringField
      FieldName = 'DESC_SAFRA'
      Required = True
      Size = 10
    end
    object QRClasparQT_CLASSIFICADO: TFloatField
      FieldName = 'QT_CLASSIFICADO'
      Required = True
      DisplayFormat = '###,###,##0'
    end
    object QRClasparDESC_RENDA: TStringField
      FieldName = 'DESC_RENDA'
      Size = 7
    end
    object QRClasparPERC_INTEIRO: TFloatField
      FieldName = 'PERC_INTEIRO'
    end
    object QRClasparPERC_QUEBRADOS: TFloatField
      FieldName = 'PERC_QUEBRADOS'
    end
    object QRClasparDESC_MARCA: TStringField
      FieldName = 'DESC_MARCA'
    end
    object QRClasparDESC_GRUPO: TStringField
      FieldName = 'DESC_GRUPO'
    end
    object QRClasparDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
    end
    object QRClasparDESC_TIPO: TStringField
      FieldName = 'DESC_TIPO'
    end
    object QRClasparDESC_REGIONAL: TStringField
      FieldName = 'DESC_REGIONAL'
    end
    object QRClasparDESC_POSTO: TStringField
      FieldName = 'DESC_POSTO'
    end
    object QRClasparNF_EMISSAO: TDateTimeField
      FieldName = 'NF_EMISSAO'
      Required = True
    end
    object QRClasparNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRClasparQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      DisplayFormat = '###,###,##0'
    end
    object QRClasparNOME_CADASTRO: TStringField
      FieldName = 'NOME_CADASTRO'
      Required = True
      Size = 50
    end
    object QRClasparDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object QRClasparDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRClasparDESC_LOTE: TStringField
      FieldName = 'DESC_LOTE'
    end
    object QRClasparNUM_DESDOBRAMENTO: TIntegerField
      FieldName = 'NUM_DESDOBRAMENTO'
      Required = True
    end
    object QRClasparIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Required = True
      Size = 10
    end
    object QRClasparDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
  end
  object QRVendProdPeriodo: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_produto.COD_CLASSE,'
      '  Tb_nota_item.COD_PRODUTO,'
      '  Tb_produto.DESC_PRODUTO,'
      '  Tb_classe.DESC_CLASSE,'
      '  SUM(Tb_nota_item.QT_QUANTIDADE) AS QT_QUANTIDADE,'
      
        '  SUM(Tb_nota_item.VAL_TOTAL- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.CO' +
        'D_NOTA_ITEM) +Tb_nota_item.VAL_DESPESAS+TB_NOTA_ITEM.VAL_ICMS_SU' +
        'BST) AS VAL_TOTAL,'
      
        '  SUM(Tb_nota_item.VAL_TOTAL+Tb_nota_item.VAL_DESPESAS+TB_NOTA_I' +
        'TEM.VAL_ICMS_SUBST) AS VAL_TOTAL_COM_DESC,'
      
        '  SUM(DECODE(Tb_nota_cab.IND_ENTRADA_SAIDA,'#39'S'#39',Tb_nota_item.VAL_' +
        'CUSTO * Tb_nota_item.QT_QUANTIDADE,Tb_nota_item.VAL_CUSTO)) AS V' +
        'AL_CUSTO_TOTAL'
      'FROM'
      '  Tb_nota_cab,'
      '  Tb_nota_item,'
      '  Tb_produto,'
      '  Tb_operacao,'
      '  Tb_Classe'
      'WHERE'
      '  Tb_produto.COD_PRODUTO = Tb_nota_item.COD_PRODUTO'
      '  AND'
      '  Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '  AND'
      '  Tb_operacao.COD_OPERACAO = Tb_nota_cab.COD_OPERACAO'
      '  AND'
      '  Tb_Classe.COD_CLASSE = Tb_produto.COD_CLASSE'
      '  AND'
      '  Tb_nota_cab.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  (:FILIAL IS NULL OR'
      '    TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '  AND'
      '   (:PRODUTO)'
      '  AND'
      '  (:VENDEDOR IS NULL OR'
      '    TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '  AND'
      '  TB_CLASSE.NUM_CLASSE >= :CLASSE_I'
      '  AND'
      '  TB_CLASSE.NUM_CLASSE <= :CLASSE_F'
      '  AND'
      '  (:IND_VENDAS IS NULL OR'
      '    TB_OPERACAO.IND_VENDAS = :IND_VENDAS)'
      '  AND'
      '  (:IND_COMPRAS IS NULL OR'
      '    TB_OPERACAO.IND_COMPRAS = :IND_COMPRAS)'
      '  AND'
      '  Tb_nota_cab.DT_EMISSAO >= :DATA_I'
      '  AND'
      '  Tb_nota_cab.DT_EMISSAO <= :DATA_F'
      'GROUP BY'
      '  Tb_produto.COD_CLASSE,'
      '  Tb_nota_item.COD_PRODUTO,'
      '  Tb_produto.DESC_PRODUTO,'
      '  Tb_Classe.DESC_CLASSE'
      ''
      ''
      ''
      ' ')
    Variables.Data = {
      0300000009000000070000003A46494C49414C03000000000000000000000008
      0000003A50524F4455544F010000000000000000000000090000003A434C4153
      53455F49030000000000000000000000090000003A434C415353455F46030000
      0000000000000000000B0000003A494E445F56454E4441530500000000000000
      000000000C0000003A494E445F434F4D50524153050000000000000000000000
      070000003A444154415F490C0000000000000000000000070000003A44415441
      5F460C0000000000000000000000090000003A56454E4445444F520300000000
      00000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000A000000434F445F434C415353450100000000000B000000
      434F445F50524F4455544F0100000000000C000000444553435F50524F445554
      4F0100000000000B000000444553435F434C415353450100000000000D000000
      51545F5155414E5449444144450100000000000900000056414C5F544F54414C
      0100000000000F00000056414C5F435553544F5F544F54414C01000000000012
      00000056414C5F544F54414C5F434F4D5F44455343010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRVendProdPeriodoCalcFields
    Left = 371
    Top = 252
    object QRVendProdPeriodoVal_Custo_Medio: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Val_Custo_Medio'
      Calculated = True
    end
    object QRVendProdPeriodoCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object QRVendProdPeriodoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRVendProdPeriodoDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QRVendProdPeriodoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QRVendProdPeriodoVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QRVendProdPeriodoVAL_CUSTO_TOTAL: TFloatField
      FieldName = 'VAL_CUSTO_TOTAL'
    end
    object QRVendProdPeriodoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRVendProdPeriodoVAL_TOTAL_COM_DESC: TFloatField
      FieldName = 'VAL_TOTAL_COM_DESC'
    end
  end
  object QRMaioresClientes: TOracleDataSet1
    SQL.Strings = (
      '  SELECT'
      '    Tb_Nota_Cab.COD_CADASTRO,'
      '    Tb_Cadastro.NOME,'
      '    Tb_Cadastro.NUM_CGC_CPF,'
      '    Tb_Cadastro.DESC_CIDADE,'
      
        '    SUM(decode(:IND_COMPRA_VENDA,Tb_nota_item.QT_QUANTIDADE,Tb_n' +
        'ota_item.QT_QUANTIDADE*-1)) AS SQT_QUANTIDADE,'
      
        '    SUM(decode(:IND_COMPRA_VENDA,Tb_nota_item.VAL_TOTAL- PEGA_DE' +
        'SCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) +Tb_nota_item.VAL_IPI+Tb' +
        '_nota_item.VAL_DESPESAS+Tb_nota_item.VAL_FRETE+TB_NOTA_ITEM.VAL_' +
        'ICMS_SUBST,(Tb_nota_item.VAL_TOTAL- PEGA_DESCONTO_ITEM(TB_NOTA_I' +
        'TEM.COD_NOTA_ITEM) +Tb_nota_item.VAL_IPI+Tb_nota_item.VAL_DESPES' +
        'AS+Tb_nota_item.VAL_FRETE+TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1)) AS S' +
        'VAL_TOTAL'
      
        '   /*VARIAVEL IND_COMPRA_VENDA(SUBSTITUI'#199'AO) USADA PARA SELECION' +
        'AR MAIORES FORNECEDORES - MARCOS 26/06/10'
      
        '   /* SUM(decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.QT_QUAN' +
        'TIDADE,Tb_nota_item.QT_QUANTIDADE*-1)) AS SQT_QUANTIDADE,'
      
        '    SUM(decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.VAL_TOTAL' +
        '-Tb_nota_item.VAL_DESCONTO+Tb_nota_item.VAL_IPI+Tb_nota_item.VAL' +
        '_DESPESAS+Tb_nota_item.VAL_FRETE,(Tb_nota_item.VAL_TOTAL-Tb_nota' +
        '_item.VAL_DESCONTO+Tb_nota_item.VAL_IPI+Tb_nota_item.VAL_DESPESA' +
        'S+Tb_nota_item.VAL_FRETE)*-1)) AS SVAL_TOTAL'
      '      */'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_CADASTRO,'
      '    TB_PRODUTO,'
      '    TB_OPERACAO,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB'
      '    AND'
      '    TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '    AND'
      '    Tb_Nota_Cab.COD_CADASTRO = Tb_Cadastro.COD_CADASTRO'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO '
      '    AND'
      '    TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '    AND'
      '    :IND_COMPRA_VENDA1'
      '    and'
      '    tb_produto.cod_produto = 4056'
      ''
      ''
      ''
      
        '   /*VARIAVEL IND_COMPRA_VENDA1(SUBSTITUI'#199'AO) USADA PARA SELECIO' +
        'NAR MAIORES FORNECEDORES - MARCOS 26/06/10'
      '   /* ((TB_OPERACAO.IND_VENDAS = '#39'V'#39') OR'
      '     (TB_OPERACAO.IND_VENDAS = '#39'D'#39'))'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39' */'
      '/*    AND'
      '    Tb_Cadastro.DT_CANCELAMENTO IS NULL  */'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '    AND'
      '    (:COD_DEPARTAMENTO IS NULL OR'
      '      TB_NOTA_CAB.COD_DEPARTAMENTO = :COD_DEPARTAMENTO)'
      '    AND'
      '    (:COD_SERIE IS NULL OR'
      '      TB_NOTA_CAB.COD_SERIE = :COD_SERIE)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO = :VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:TIPO_PRODUTO IS NULL'
      '     OR :TIPO_PRODUTO = TB_PRODUTO.IND_TIPO_PRODUTO)'
      '    AND'
      '    (:TIPO_CADASTRO IS NULL'
      '     OR :TIPO_CADASTRO = TB_CADASTRO.COD_TIPO_CADASTRO)'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    (:SUPERVISOR IS NULL'
      '     OR TB_VENDEDOR.COD_SUPERVISOR =:SUPERVISOR)'
      '  GROUP BY'
      '    Tb_Nota_Cab.COD_CADASTRO,'
      '    Tb_Cadastro.NOME,'
      '    Tb_Cadastro.NUM_CGC_CPF,'
      '    Tb_Cadastro.DESC_CIDADE'
      ''
      'ORDER BY SVAL_TOTAL DESC')
    Variables.Data = {
      030000000C000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000070000003A46494C4941
      4C030000000000000000000000090000003A56454E4445444F52030000000000
      000000000000120000003A56454E4445444F525F505245504F53544F03000000
      00000000000000000D0000003A5449504F5F50524F4455544F05000000000000
      00000000000E0000003A5449504F5F434144415354524F030000000000000000
      0000000B0000003A53555045525649534F520300000000000000000000001100
      00003A434F445F444550415254414D454E544F0300000000000000000000000A
      0000003A434F445F5345524945050000000000000000000000110000003A494E
      445F434F4D5052415F56454E4441010000000000000000000000120000003A49
      4E445F434F4D5052415F56454E444131010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000C000000434F445F434144415354524F0100000000000400
      00004E4F4D450100000000000E0000005351545F5155414E5449444144450100
      000000000A0000005356414C5F544F54414C0100000000000B00000044455343
      5F4349444144450100000000000B0000004E554D5F4347435F43504601000000
      0000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 683
    Top = 338
    object QRMaioresClientesCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRMaioresClientesNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRMaioresClientesSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRMaioresClientesSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRMaioresClientesDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object QRMaioresClientesNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
  end
  object QRVendasVndRegiao: TOracleDataSet1
    SQL.Strings = (
      '  SELECT'
      '    tb_nota_cab.COD_VENDEDOR,'
      '    tb_cadastro.COD_REGIAO,'
      '    tb_nota_item.COD_PRODUTO,'
      '    tb_regiao.DESC_REGIAO,'
      '    tb_produto.DESC_PRODUTO,'
      '    tb_vendedor.NOME,'
      
        '    SUM(DECODE(Tb_operacao.IND_VENDAS,'#39'V'#39',Tb_nota_item.QT_QUANTI' +
        'DADE,Tb_nota_item.QT_QUANTIDADE * -1)) AS SQT_QUANTIDADE,'
      
        '    SUM(DECODE(Tb_operacao.IND_VENDAS,'#39'V'#39',Tb_nota_item.VAL_TOTAL' +
        '- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) +Tb_nota_item.V' +
        'AL_DESPESAS,'
      
        '                                         (Tb_nota_item.VAL_TOTAL' +
        '- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) +Tb_nota_item.V' +
        'AL_DESPESAS) * -1)) AS SVAL_TOTAL'
      '  FROM'
      '    Tb_nota_item,'
      '    Tb_nota_cab,'
      '    Tb_cadastro,'
      '    Tb_produto,'
      '    Tb_regiao,'
      '    Tb_vendedor,'
      '    Tb_Operacao'
      '  WHERE'
      '    Tb_produto.COD_PRODUTO = Tb_nota_item.COD_PRODUTO'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_vendedor.COD_VENDEDOR = Tb_nota_cab.COD_VENDEDOR'
      '    AND'
      '    Tb_operacao.COD_OPERACAO = Tb_nota_cab.COD_OPERACAO'
      '    AND'
      '    Tb_cadastro.COD_CADASTRO = Tb_nota_cab.COD_CADASTRO'
      '    AND'
      '    Tb_regiao.COD_REGIAO = Tb_cadastro.COD_REGIAO'
      '    AND'
      '    Tb_nota_cab.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    ((Tb_operacao.IND_VENDAS = '#39'V'#39')'
      '     OR'
      '     (Tb_operacao.IND_VENDAS = '#39'D'#39'))'
      '    AND'
      '    (:VENDEDOR IS NULL'
      '     OR'
      '      Tb_nota_cab.COD_VENDEDOR =:VENDEDOR)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL'
      '     OR'
      '      Tb_nota_cab.COD_VENDEDOR_PREPOSTO =:VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:REGIAO IS NULL'
      '     OR'
      '      Tb_regiao.COD_REGIAO =:REGIAO)'
      '    AND'
      '    (:FILIAL IS NULL'
      '     OR'
      '      Tb_nota_cab.COD_FILIAL =:FILIAL)'
      '    AND'
      '    (:COD_PRODUTO IS NULL'
      '     OR'
      '      Tb_nota_item.COD_PRODUTO = :COD_PRODUTO)'
      '    AND'
      '    Tb_nota_cab.DT_EMISSAO >=:DATA_I'
      '    AND'
      '    Tb_nota_cab.DT_EMISSAO <=:DATA_F'
      '  GROUP BY'
      '    Tb_nota_cab.COD_VENDEDOR,'
      '    Tb_cadastro.COD_REGIAO,'
      '    Tb_nota_item.COD_PRODUTO,'
      '    Tb_regiao.DESC_REGIAO,'
      '    Tb_produto.DESC_PRODUTO,'
      '    Tb_vendedor.NOME'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Variables.Data = {
      0300000007000000090000003A56454E4445444F520300000000000000000000
      00070000003A52454749414F030000000000000000000000070000003A444154
      415F490C0000000000000000000000070000003A444154415F460C0000000000
      000000000000070000003A46494C49414C030000000000000000000000120000
      003A56454E4445444F525F505245504F53544F0300000000000000000000000C
      0000003A434F445F50524F4455544F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000C000000434F445F56454E4445444F520100000000000A00
      0000434F445F52454749414F0100000000000B000000434F445F50524F445554
      4F0100000000000B000000444553435F52454749414F0100000000000C000000
      444553435F50524F4455544F010000000000040000004E4F4D45010000000000
      0E0000005351545F5155414E5449444144450100000000000A0000005356414C
      5F544F54414C010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 371
    Top = 196
    object QRVendasVndRegiaoDESC_REGIAO: TStringField
      FieldName = 'DESC_REGIAO'
      Size = 30
    end
    object QRVendasVndRegiaoNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object QRVendasVndRegiaoSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRVendasVndRegiaoSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRVendasVndRegiaoCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QRVendasVndRegiaoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRVendasVndRegiaoCOD_REGIAO: TIntegerField
      FieldName = 'COD_REGIAO'
    end
    object QRVendasVndRegiaoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
  end
  object QRVendasporVendedor: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  NOME,'
      '  COD_VENDEDOR + 0.00 AS COD_VENDEDOR,'
      '  COD_ESTADO,'
      '  SUM(QT_QUANTIDADE) AS QT_QUANTIDADE,'
      '  SUM(VAL_TOTAL) AS VAL_TOTAL'
      'FROM'
      '('
      ' SELECT'
      '     Tb_vendedor.NOME,'
      '     Tb_nota_cab.COD_VENDEDOR,'
      '     Tb_vendedor.COD_ESTADO,'
      '     SUM(Tb_nota_item.QT_QUANTIDADE) AS QT_QUANTIDADE,'
      
        '     SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITE' +
        'M.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_' +
        'FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST/*+ Tb_nota_item.VAL_IPI*/) A' +
        'S VAL_TOTAL'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    (Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR)'
      '    AND'
      '    (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)'
      '    AND'
      '    (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO = :VENDEDOR_PREPOSTO)'
      '    AND'
      '    :COD_OPERACAO'
      ' GROUP BY'
      '      Tb_vendedor.NOME,'
      '      Tb_nota_cab.COD_VENDEDOR,'
      '      Tb_vendedor.COD_ESTADO'
      ''
      ' UNION ALL'
      ''
      ' SELECT'
      '     Tb_vendedor.NOME,'
      '     Tb_nota_cab.COD_VENDEDOR,'
      '     Tb_vendedor.COD_ESTADO,'
      '     SUM(TB_NOTA_ITEM.QT_QUANTIDADE * (-1)) as QT_QUANTIDADE,'
      
        '     /*Estava dando erro no relat'#243'rio FRVendasPorVendedor para a' +
        ' dispart (tirei: '#39'TB_NOTA_ITEM.VAL_TOTAL -'#39'). Vanessa 04/12/2013'
      
        '     SUM((TB_NOTA_ITEM.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_IT' +
        'EM.COD_NOTA_ITEM) + TB_NOTA_ITEM.VAL_DESPESAS + TB_NOTA_ITEM.VAL' +
        '_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST) * (-1)) as VAL_TOTAL*/'
      
        '     SUM((PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + TB_NO' +
        'TA_ITEM.VAL_DESPESAS + TB_NOTA_ITEM.VAL_FRETE + TB_NOTA_ITEM.VAL' +
        '_ICMS_SUBST) * (-1)) as VAL_TOTAL'
      ''
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    (Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR)'
      '    AND'
      '    (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)'
      '    AND'
      '    (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'D'#39
      '    AND'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO = :VENDEDOR_PREPOSTO)'
      '    AND'
      '    :COD_OPERACAO'
      ' GROUP BY'
      '      Tb_vendedor.NOME,'
      '      Tb_nota_cab.COD_VENDEDOR,'
      '      Tb_vendedor.COD_ESTADO'
      ''
      ')'
      ' GROUP BY'
      '     NOME,'
      '     COD_VENDEDOR,'
      '     COD_ESTADO'
      ' ORDER BY'
      '    QT_QUANTIDADE DESC')
    Variables.Data = {
      0300000006000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000070000003A46494C4941
      4C030000000000000000000000090000003A56454E4445444F52030000000000
      000000000000120000003A56454E4445444F525F505245504F53544F03000000
      00000000000000000D0000003A434F445F4F5045524143414F01000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000005000000040000004E4F4D450100000000000C000000434F445F5645
      4E4445444F520100000000000A000000434F445F45535441444F010000000000
      0D00000051545F5155414E5449444144450100000000000900000056414C5F54
      4F54414C010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 371
    Top = 136
    object QRVendasporVendedorNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object QRVendasporVendedorCOD_VENDEDOR: TFloatField
      FieldName = 'COD_VENDEDOR'
    end
    object QRVendasporVendedorCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
    object QRVendasporVendedorQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QRVendasporVendedorVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object QRMovMercadoria: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PRODUTO.DESC_PRODUTO,'
      
        '  DECODE(TB_NOTA_CAB.IND_ENTRADA_SAIDA,'#39'E'#39',TB_NOTA_ITEM.QT_QUANT' +
        'IDADE,TB_NOTA_ITEM.QT_QUANTIDADE * -1) AS QT_QUANTIDADE,'
      
        '  DECODE(TB_NOTA_CAB.IND_ENTRADA_SAIDA,'#39'E'#39',TB_NOTA_ITEM.VAL_TOTA' +
        'L - (TB_NOTA_ITEM.QT_QUANTIDADE*TB_NOTA_ITEM.VAL_DESCONTO),(TB_N' +
        'OTA_ITEM.VAL_TOTAL  - (TB_NOTA_ITEM.QT_QUANTIDADE*TB_NOTA_ITEM.V' +
        'AL_DESCONTO)) * -1) AS VAL_TOTAL,'
      '  TB_NOTA_ITEM.PERC_IPI,'
      '  TB_NOTA_ITEM.COD_PRODUTO,'
      '  TB_NOTA_ITEM.COD_CFOP,'
      
        '  TB_NOTA_ITEM.VAL_UNITARIO - TB_NOTA_ITEM.VAL_DESCONTO AS VAL_U' +
        'NITARIO,'
      '  TB_NOTA_ITEM.VAL_IPI,'
      
        '  (TB_NOTA_ITEM.QT_QUANTIDADE * TB_PRODUTO.NUM_EMBALAGEM) AS QT_' +
        'KILOS,'
      '  Tb_cadastro.COD_CADASTRO,'
      '  Tb_cadastro.NOME NOME_CADASTRO,'
      '  Tb_cadastro.DESC_ENDERECO,'
      '  Tb_cadastro.COD_ESTADO,'
      '  Tb_nota_cab.COD_NOTA_CAB,'
      '  Tb_nota_cab.COD_SERIE,'
      '  Tb_nota_cab.NUM_NOTA,'
      '  Tb_nota_cab.DT_EMISSAO,'
      '  Tb_nota_cab.COD_OPERACAO,'
      '  TB_NOTA_CAB.COD_USUARIO,'
      '  TB_OPERACAO.DESC_OPERACAO,'
      '  TB_NOTA_CAB.NUM_PEDIDO'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_CADASTRO,'
      '  TB_PRODUTO,'
      '  TB_OPERACAO,'
      '  TB_CLASSE,'
      '  TB_MARCA'
      'WHERE'
      '  TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '  AND'
      '  Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '  AND'
      '  Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO'
      '  AND'
      '  Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '  AND'
      '  Tb_produto.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '  AND'
      '  TB_PRODUTO.COD_MARCA = TB_MARCA.COD_MARCA(+)'
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  (:FILIAL IS NULL OR'
      '    TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '  AND'
      '  (:CADASTRO IS NULL OR'
      '    TB_NOTA_CAB.COD_CADASTRO = :CADASTRO)'
      '  AND'
      '  (:CIDADE IS NULL OR'
      '    TB_CADASTRO.COD_CIDADE = :CIDADE)'
      '  AND'
      '  (:OPERACAO IS NULL OR'
      '    TB_NOTA_CAB.COD_OPERACAO = :OPERACAO)'
      '  AND'
      '  (:ENTRADA_SAIDA IS NULL OR'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = :ENTRADA_SAIDA)'
      '  AND'
      '  (:CONDICAO_PAGTO IS NULL OR'
      '    TB_NOTA_CAB.IND_CONDICAO_PAGTO = :CONDICAO_PAGTO)'
      '  AND'
      '  (:COD_PRODUTO IS NULL'
      '   OR'
      '    TB_NOTA_ITEM.COD_PRODUTO = :COD_PRODUTO)'
      '  AND'
      '  (:FORNECEDOR IS NULL'
      '   OR'
      '    TB_PRODUTO.COD_CADASTRO = :FORNECEDOR)'
      '  AND'
      '  (:VENDEDOR IS NULL'
      '    OR'
      '      TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '  AND'
      '  (:CULTURA IS NULL'
      '    OR'
      '      TB_NOTA_ITEM.COD_CULTURA = :CULTURA)'
      '  AND'
      '  (:DEPARTAMENTO IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_DEPARTAMENTO = :DEPARTAMENTO)'
      '  AND'
      '  (:SERIE IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_SERIE = :SERIE)'
      '  AND'
      '  (:COD_CLASSE IS NULL'
      '   OR'
      '    Tb_Classe.NUM_CLASSE = :COD_CLASSE)'
      '  AND'
      '  (:COD_SUBCLASSE IS NULL'
      '   OR'
      '    Tb_Classe.NUM_SUBCLASSE = :COD_SUBCLASSE)'
      '  AND'
      '  (:COD_LOTE_TIPO IS NULL'
      '   OR'
      '    TB_NOTA_ITEM.COD_LOTE_TIPO = :COD_LOTE_TIPO)'
      '  AND'
      '  (:COD_ARMAZEM_ALFANDEGADO IS NULL'
      '   OR'
      
        '    TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO = :COD_ARMAZEM_ALFANDEGA' +
        'DO)'
      '  AND'
      '  (:IND_FISICA_JURIDICA IS NULL'
      '   OR'
      '    TB_CADASTRO.IND_FISICA_JURIDICA = :IND_FISICA_JURIDICA)'
      '  AND'
      '  (:NUM_PEDIDO IS NULL'
      '    OR'
      '    TB_NOTA_CAB.NUM_PEDIDO = :NUM_PEDIDO)'
      '  AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '  AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '  AND'
      '  :CADASTRO_PARCEIRO'
      '  AND'
      '  (:COD_CFOP)'
      '  AND'
      '  (:COD_MARCA IS NULL OR'
      '    TB_PRODUTO.COD_MARCA = :COD_MARCA)'
      
        'ORDER BY TB_CADASTRO.NOME,TB_CADASTRO.COD_CADASTRO,TB_NOTA_CAB.N' +
        'UM_NOTA')
    Variables.Data = {
      0300000017000000070000003A46494C49414C03000000000000000000000009
      0000003A434144415354524F030000000000000000000000090000003A4F5045
      524143414F030000000000000000000000070000003A444154415F490C000000
      0000000000000000070000003A444154415F460C00000000000000000000000C
      0000003A434F445F50524F4455544F0400000000000000000000000E0000003A
      454E54524144415F53414944410500000000000000000000000F0000003A434F
      4E444943414F5F504147544F0500000000000000000000000B0000003A464F52
      4E454345444F52030000000000000000000000090000003A56454E4445444F52
      030000000000000000000000080000003A43554C545552410300000000000000
      000000000D0000003A444550415254414D454E544F0300000000000000000000
      00060000003A53455249450500000000000000000000000E0000003A434F445F
      4C4F54455F5449504F0300000000000000000000000B0000003A434F445F434C
      415353450300000000000000000000000E0000003A434F445F535542434C4153
      5345030000000000000000000000140000003A494E445F4649534943415F4A55
      524944494341050000000000000000000000120000003A434144415354524F5F
      504152434549524F010000000000000000000000180000003A434F445F41524D
      415A454D5F414C46414E44454741444F03000000000000000000000007000000
      3A4349444144450300000000000000000000000B0000003A4E554D5F50454449
      444F0500000000000000000000000A0000003A434F445F4D4152434103000000
      0000000000000000090000003A434F445F43464F500100000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      04000000150000000C000000434F445F434144415354524F0100000000000D00
      00004E4F4D455F434144415354524F0100000000000C000000434F445F4E4F54
      415F43414201000000000009000000434F445F53455249450100000000000800
      00004E554D5F4E4F54410100000000000A00000044545F454D495353414F0100
      000000000C000000434F445F4F5045524143414F0100000000000D0000004445
      53435F4F5045524143414F0100000000000C000000444553435F50524F445554
      4F0100000000000D00000051545F5155414E5449444144450100000000000900
      000056414C5F544F54414C01000000000008000000504552435F495049010000
      0000000B000000434F445F50524F4455544F0100000000000C00000056414C5F
      554E49544152494F0100000000000700000056414C5F49504901000000000008
      00000051545F4B494C4F530100000000000D000000444553435F454E44455245
      434F0100000000000B000000434F445F5553554152494F0100000000000A0000
      00434F445F45535441444F01000000000008000000434F445F43464F50010000
      0000000A0000004E554D5F50454449444F010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 371
    Top = 12
    object QRMovMercadoriaCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRMovMercadoriaNOME_CADASTRO: TStringField
      FieldName = 'NOME_CADASTRO'
      Required = True
      Size = 50
    end
    object QRMovMercadoriaCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QRMovMercadoriaCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QRMovMercadoriaNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRMovMercadoriaDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRMovMercadoriaCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
    end
    object QRMovMercadoriaDESC_OPERACAO: TStringField
      FieldName = 'DESC_OPERACAO'
      Required = True
      Size = 30
    end
    object QRMovMercadoriaQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object QRMovMercadoriaVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
      Required = True
    end
    object QRMovMercadoriaPERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
      Required = True
    end
    object QRMovMercadoriaCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRMovMercadoriaVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
    end
    object QRMovMercadoriaVAL_IPI: TFloatField
      FieldName = 'VAL_IPI'
      Required = True
    end
    object QRMovMercadoriaQT_KILOS: TFloatField
      FieldName = 'QT_KILOS'
    end
    object QRMovMercadoriaDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      Size = 40
    end
    object QRMovMercadoriaCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QRMovMercadoriaCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
    object QRMovMercadoriaDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRMovMercadoriaCOD_CFOP: TIntegerField
      FieldName = 'COD_CFOP'
    end
    object QRMovMercadoriaNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
  end
  object QRInadimplencia: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  NOME_VENDEDOR,'
      '  COD_SUPERVISOR + 0.00 AS COD_SUPERVISOR,'
      '  COD_VENDEDOR + 0.00 AS COD_VENDEDOR,'
      '  SUM(SVAL_VENDA) AS SVAL_VENDA,'
      '  SUM(SVAL_RECEBER) AS SVAL_RECEBER'
      'FROM'
      '('
      '  SELECT'
      '    Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '    Tb_vendedor.COD_SUPERVISOR,'
      '    Tb_vendedor.COD_VENDEDOR,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.VAL_TOTAL' +
        '- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) +Tb_nota_item.V' +
        'AL_DESPESAS+TB_NOTA_ITEM.VAL_ICMS_SUBST,'
      
        '                                         (Tb_nota_item.VAL_TOTAL' +
        '- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) +tb_nota_item.V' +
        'AL_DESPESAS+TB_NOTA_ITEM.VAL_ICMS_SUBST) * -1)) AS SVAL_VENDA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_RECEBER'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    ((TB_OPERACAO.IND_VENDAS = '#39'V'#39')'
      '     OR'
      '     (TB_OPERACAO.IND_VENDAS = '#39'D'#39'))'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '    AND'
      '    (:TIPO_PAGAMENTO IS NULL OR'
      '     :TIPO_PAGAMENTO = TB_NOTA_CAB.IND_CONDICAO_PAGTO)'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '     :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '    AND'
      '   (:VENDEDOR_PREPOSTO IS NULL OR'
      '    :VENDEDOR_PREPOSTO = TB_NOTA_CAB.COD_VENDEDOR)'
      '    AND'
      '    (:IND_SITUACAO IS NULL OR'
      '     :IND_SITUACAO = TB_VENDEDOR.IND_SITUACAO)'
      '    AND'
      '    (:COD_SUPERVISOR IS NULL OR'
      '     :COD_SUPERVISOR = TB_VENDEDOR.COD_SUPERVISOR)'
      '    AND'
      '    (:COD_ESTADO IS NULL OR'
      '     :COD_ESTADO = TB_NOTA_CAB.COD_ESTADO)'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      ' GROUP BY'
      '    Tb_vendedor.NOME,'
      '    Tb_vendedor.COD_SUPERVISOR,'
      '    Tb_vendedor.COD_VENDEDOR'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    TB_VENDEDOR.NOME AS NOME_VENDEDOR,'
      '    Tb_vendedor.COD_SUPERVISOR,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_VENDA,'
      '    SUM(TB_CONTA_RECEBER_CAB.VAL_TITULO) AS SVAL_RECEBER'
      '  FROM'
      '    TB_CONTA_RECEBER_CAB,'
      '    TB_CADASTRO,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    Tb_conta_receber_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    Tb_conta_receber_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO'
      '    AND'
      '    Tb_conta_receber_cab.IND_SITUACAO <> '#39'BAIXA TOTAL'#39
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = Tb_conta_receber_cab.COD_FILIAL)'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '     :VENDEDOR = Tb_conta_receber_cab.COD_VENDEDOR)'
      '    AND'
      '    (:IND_SITUACAO IS NULL OR'
      '     :IND_SITUACAO = TB_VENDEDOR.IND_SITUACAO)'
      '    AND'
      '    (:COD_SUPERVISOR IS NULL OR'
      '     :COD_SUPERVISOR = TB_VENDEDOR.COD_SUPERVISOR)'
      '    AND'
      '    (:COD_FINALIDADE IS NULL OR'
      '     :COD_FINALIDADE = Tb_conta_receber_cab.COD_FINALIDADE)'
      '    AND'
      '    (:COD_ESTADO IS NULL OR'
      '     :COD_ESTADO = TB_CADASTRO.COD_ESTADO)'
      '    AND'
      '    :DATA_CONTA_RECEBER'
      '  GROUP BY'
      '    Tb_vendedor.NOME,'
      '    Tb_vendedor.COD_SUPERVISOR,'
      '    Tb_vendedor.COD_VENDEDOR'
      ')'
      'GROUP BY'
      '  NOME_VENDEDOR,'
      '  COD_SUPERVISOR,'
      '  COD_VENDEDOR'
      'ORDER BY COD_SUPERVISOR,NOME_VENDEDOR')
    Variables.Data = {
      030000000B000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000070000003A46494C4941
      4C030000000000000000000000090000003A56454E4445444F52030000000000
      000000000000120000003A56454E4445444F525F505245504F53544F03000000
      00000000000000000D0000003A494E445F534954554143414F05000000000000
      00000000000F0000003A434F445F53555045525649534F520300000000000000
      000000000F0000003A434F445F46494E414C4944414445030000000000000000
      0000000B0000003A434F445F45535441444F0500000000000000000000000F00
      00003A5449504F5F504147414D454E544F050000000000000000000000130000
      003A444154415F434F4E54415F52454345424552010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000D0000004E4F4D455F56454E4445444F520100000000000A
      0000005356414C5F56454E44410100000000000C0000005356414C5F52454345
      4245520100000000000C000000434F445F56454E4445444F520100000000000E
      000000434F445F53555045525649534F52010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRInadimplenciaCalcFields
    Left = 144
    Top = 312
    object QRInadimplenciaNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 40
    end
    object QRInadimplenciaSVAL_VENDA: TFloatField
      FieldName = 'SVAL_VENDA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRInadimplenciaSVAL_RECEBER: TFloatField
      FieldName = 'SVAL_RECEBER'
      DisplayFormat = '###,###,##0.00'
    end
    object QRInadimplenciaCOD_VENDEDOR: TFloatField
      FieldName = 'COD_VENDEDOR'
    end
    object QRInadimplenciaCOD_SUPERVISOR: TFloatField
      FieldName = 'COD_SUPERVISOR'
    end
    object QRInadimplencianome_supervisor: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome_supervisor'
      Size = 30
      Calculated = True
    end
  end
  object QRClassePgtoVend: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_FILIAL,'
      '  DESC_FILIAL,'
      '  DESC_CLASSE,'
      '  COD_VENDEDOR,'
      '  NOME_VENDEDOR,'
      '  SUM(SVAL_VISTA) AS SVAL_VISTA,'
      '  SUM(SVAL_PRAZO) AS SVAL_PRAZO,'
      '  SUM(SVAL_OUTROS) AS SVAL_OUTROS,'
      '  SUM(SVAL_CARTAO) AS SVAL_CARTAO,'
      '  SUM(SVAL_TOTAL) AS SVAL_TOTAL'
      'FROM'
      '('
      '  /* *** VENDAS ****  */'
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME as NOME_VENDEDOR,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SV' +
        'AL_VISTA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_OUTROS,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_CARTAO,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SV' +
        'AL_TOTAL'
      '  FROM'
      '    TB_FILIAL,'
      '    TB_CLASSE,'
      '    TB_PRODUTO,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '    AND'
      '    TB_NOTA_CAB.IND_CONDICAO_PAGTO = '#39'1'#39
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '     :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '     :VENDEDOR_PREPOSTO = TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_FILIAL.COD_FILIAL)'
      '         AND'
      '        (:CLASSE IS NULL OR'
      '         :CLASSE = TB_CLASSE.NUM_CLASSE)'
      '    AND'
      '    (:SUB_CLASSE IS NULL OR'
      '     :SUB_CLASSE = TB_CLASSE.NUM_SUBCLASSE)'
      ''
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME as NOME_VENDEDOR,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_VISTA,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SV' +
        'AL_PRAZO,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_OUTROS,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_CARTAO,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SV' +
        'AL_TOTAL'
      '  FROM'
      '    TB_FILIAL,'
      '    TB_CLASSE,'
      '    TB_PRODUTO,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '    AND'
      '    TB_NOTA_CAB.IND_CONDICAO_PAGTO = '#39'2'#39
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '     :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '     :VENDEDOR_PREPOSTO = TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_FILIAL.COD_FILIAL)'
      '         AND'
      '        (:CLASSE IS NULL OR'
      '         :CLASSE = TB_CLASSE.NUM_CLASSE)'
      '    AND'
      '    (:SUB_CLASSE IS NULL OR'
      '     :SUB_CLASSE = TB_CLASSE.NUM_SUBCLASSE)'
      ''
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME as NOME_VENDEDOR,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_VISTA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SV' +
        'AL_OUTROS,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_CARTAO,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SV' +
        'AL_TOTAL'
      '  FROM'
      '    TB_FILIAL,'
      '    TB_CLASSE,'
      '    TB_PRODUTO,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '    AND'
      '    TB_NOTA_CAB.IND_CONDICAO_PAGTO = '#39'3'#39
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '     :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '     :VENDEDOR_PREPOSTO = TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_FILIAL.COD_FILIAL)'
      '         AND'
      '        (:CLASSE IS NULL OR'
      '         :CLASSE = TB_CLASSE.NUM_CLASSE)'
      '    AND'
      '    (:SUB_CLASSE IS NULL OR'
      '     :SUB_CLASSE = TB_CLASSE.NUM_SUBCLASSE)'
      ''
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME as NOME_VENDEDOR,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_VISTA,    '
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_OUTROS,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SV' +
        'AL_CARTAO,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SV' +
        'AL_TOTAL'
      '  FROM'
      '    TB_FILIAL,'
      '    TB_CLASSE,'
      '    TB_PRODUTO,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '    AND'
      '    TB_NOTA_CAB.IND_CONDICAO_PAGTO in (4,5)'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '     :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '     :VENDEDOR_PREPOSTO = TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_FILIAL.COD_FILIAL)'
      '         AND'
      '        (:CLASSE IS NULL OR'
      '         :CLASSE = TB_CLASSE.NUM_CLASSE)'
      '    AND'
      '    (:SUB_CLASSE IS NULL OR'
      '     :SUB_CLASSE = TB_CLASSE.NUM_SUBCLASSE)'
      ''
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME'
      '    '
      ' '
      '  UNION ALL'
      ''
      '  /* *** DEVOLUCOES ****  */'
      ''
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME as NOME_VENDEDOR,'
      
        '    SUM((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITE' +
        'M.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_' +
        'FRETE + Tb_nota_item.VAL_IPI + TB_NOTA_ITEM.VAL_ICMS_SUBST) *-1)' +
        ' AS SVAL_VISTA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_OUTROS,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_CARTAO, '
      
        '    SUM((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITE' +
        'M.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_' +
        'FRETE + Tb_nota_item.VAL_IPI + TB_NOTA_ITEM.VAL_ICMS_SUBST) *-1)' +
        ' AS SVAL_TOTAL'
      '  FROM'
      '    TB_FILIAL,'
      '    TB_CLASSE,'
      '    TB_PRODUTO,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'D'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '     :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '     :VENDEDOR_PREPOSTO = TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_FILIAL.COD_FILIAL)'
      '         AND'
      '        (:CLASSE IS NULL OR'
      '         :CLASSE = TB_CLASSE.NUM_CLASSE)'
      '    AND'
      '    (:SUB_CLASSE IS NULL OR'
      '     :SUB_CLASSE = TB_CLASSE.NUM_SUBCLASSE)'
      ''
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME'
      ''
      ')'
      'GROUP BY'
      '  COD_FILIAL,'
      '  DESC_FILIAL,'
      '  DESC_CLASSE,'
      '  COD_VENDEDOR,'
      '  NOME_VENDEDOR'
      'ORDER BY'
      '  COD_VENDEDOR,'
      '  DESC_CLASSE'
      ' ')
    Variables.Data = {
      0300000007000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000090000003A56454E4445
      444F52030000000000000000000000070000003A46494C49414C030000000000
      000000000000070000003A434C415353450300000000000000000000000B0000
      003A5355425F434C41535345030000000000000000000000120000003A56454E
      4445444F525F505245504F53544F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000A000000434F445F46494C49414C0100000000000B000000
      444553435F46494C49414C0100000000000B000000444553435F434C41535345
      0100000000000C000000434F445F56454E4445444F520100000000000D000000
      4E4F4D455F56454E4445444F520100000000000A0000005356414C5F56495354
      410100000000000A0000005356414C5F5052415A4F0100000000000B00000053
      56414C5F4F5554524F530100000000000A0000005356414C5F544F54414C0100
      000000000B0000005356414C5F43415254414F010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 376
    object QRClassePgtoVendDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRClassePgtoVendDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QRClassePgtoVendNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 40
    end
    object QRClassePgtoVendSVAL_VISTA: TFloatField
      FieldName = 'SVAL_VISTA'
      DisplayFormat = '###,###.#0'
    end
    object QRClassePgtoVendSVAL_PRAZO: TFloatField
      FieldName = 'SVAL_PRAZO'
      DisplayFormat = '###,###.#0'
    end
    object QRClassePgtoVendSVAL_OUTROS: TFloatField
      FieldName = 'SVAL_OUTROS'
      DisplayFormat = '###,###.#0'
    end
    object QRClassePgtoVendSVAL_CARTAO: TFloatField
      FieldName = 'SVAL_CARTAO'
      DisplayFormat = '###,###,##0.00'
    end
    object QRClassePgtoVendSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
      DisplayFormat = '###,###.#0'
    end
    object QRClassePgtoVendCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QRClassePgtoVendCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
  end
  object QRClassePgto: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_FILIAL,'
      '  DESC_FILIAL,'
      '  DESC_CLASSE,'
      '  SUM(SVAL_VISTA) AS SVAL_VISTA,'
      '  SUM(SVAL_PRAZO) AS SVAL_PRAZO,'
      '  SUM(SVAL_OUTROS) AS SVAL_OUTROS,'
      '  SUM(SVAL_CARTAO) AS SVAL_CARTAO,'
      '  SUM(SVAL_TOTAL) AS SVAL_TOTAL'
      'FROM'
      '('
      '  /* *** VENDAS ****  */'
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI  + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS S' +
        'VAL_VISTA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_OUTROS,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_CARTAO,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI  + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS S' +
        'VAL_TOTAL'
      '  FROM'
      '    TB_FILIAL,'
      '    TB_CLASSE,'
      '    TB_PRODUTO,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '    AND'
      '    TB_NOTA_CAB.IND_CONDICAO_PAGTO = '#39'1'#39
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '     :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '     :VENDEDOR_PREPOSTO = TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_FILIAL.COD_FILIAL)'
      '         AND'
      '        (:CLASSE IS NULL OR'
      '         :CLASSE = TB_CLASSE.NUM_CLASSE)'
      '    AND'
      '    (:SUB_CLASSE IS NULL OR'
      '     :SUB_CLASSE = TB_CLASSE.NUM_SUBCLASSE)'
      ''
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_VISTA,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI  + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS S' +
        'VAL_PRAZO,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_OUTROS,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_CARTAO,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI  + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS S' +
        'VAL_TOTAL'
      '  FROM'
      '    TB_FILIAL,'
      '    TB_CLASSE,'
      '    TB_PRODUTO,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '    AND'
      '    TB_NOTA_CAB.IND_CONDICAO_PAGTO = '#39'2'#39
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '     :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '     :VENDEDOR_PREPOSTO = TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_FILIAL.COD_FILIAL)'
      '         AND'
      '        (:CLASSE IS NULL OR'
      '         :CLASSE = TB_CLASSE.NUM_CLASSE)'
      '    AND'
      '    (:SUB_CLASSE IS NULL OR'
      '     :SUB_CLASSE = TB_CLASSE.NUM_SUBCLASSE)'
      ''
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_VISTA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI  + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS S' +
        'VAL_OUTROS,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_CARTAO,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI  + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS S' +
        'VAL_TOTAL'
      '  FROM'
      '    TB_FILIAL,'
      '    TB_CLASSE,'
      '    TB_PRODUTO,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '    AND'
      '    TB_NOTA_CAB.IND_CONDICAO_PAGTO = '#39'3'#39
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '     :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '     :VENDEDOR_PREPOSTO = TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_FILIAL.COD_FILIAL)'
      '         AND'
      '        (:CLASSE IS NULL OR'
      '         :CLASSE = TB_CLASSE.NUM_CLASSE)'
      '    AND'
      '    (:SUB_CLASSE IS NULL OR'
      '     :SUB_CLASSE = TB_CLASSE.NUM_SUBCLASSE)'
      ''
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE'
      '      '
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_VISTA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_OUTROS,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI  + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS S' +
        'VAL_CARTAO,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI  + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS S' +
        'VAL_TOTAL'
      '  FROM'
      '    TB_FILIAL,'
      '    TB_CLASSE,'
      '    TB_PRODUTO,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '    AND'
      '    TB_NOTA_CAB.IND_CONDICAO_PAGTO IN ('#39'4'#39','#39'5'#39')'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '     :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '     :VENDEDOR_PREPOSTO = TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_FILIAL.COD_FILIAL)'
      '         AND'
      '        (:CLASSE IS NULL OR'
      '         :CLASSE = TB_CLASSE.NUM_CLASSE)'
      '    AND'
      '    (:SUB_CLASSE IS NULL OR'
      '     :SUB_CLASSE = TB_CLASSE.NUM_SUBCLASSE)'
      ''
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE'
      ''
      '  UNION ALL'
      ''
      '  /* *** DEVOLUCOES ****  */'
      ''
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE,'
      
        '    SUM((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITE' +
        'M.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_' +
        'FRETE + Tb_nota_item.VAL_IPI  + TB_NOTA_ITEM.VAL_ICMS_SUBST) *-1' +
        ') AS SVAL_VISTA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_OUTROS,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_CARTAO,'
      
        '    SUM((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITE' +
        'M.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_' +
        'FRETE + Tb_nota_item.VAL_IPI  + TB_NOTA_ITEM.VAL_ICMS_SUBST) *-1' +
        ') AS SVAL_TOTAL'
      '  FROM'
      '    TB_FILIAL,'
      '    TB_CLASSE,'
      '    TB_PRODUTO,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'D'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '     :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '     :VENDEDOR_PREPOSTO = TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_FILIAL.COD_FILIAL)'
      '         AND'
      '        (:CLASSE IS NULL OR'
      '         :CLASSE = TB_CLASSE.NUM_CLASSE)'
      '    AND'
      '    (:SUB_CLASSE IS NULL OR'
      '     :SUB_CLASSE = TB_CLASSE.NUM_SUBCLASSE)'
      ''
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_classe.DESC_CLASSE'
      ''
      ')'
      'GROUP BY'
      '  COD_FILIAL,'
      '  DESC_FILIAL,'
      '  DESC_CLASSE'
      ''
      ' ')
    Variables.Data = {
      0300000007000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000090000003A56454E4445
      444F52030000000000000000000000070000003A46494C49414C030000000000
      000000000000070000003A434C415353450300000000000000000000000B0000
      003A5355425F434C41535345030000000000000000000000120000003A56454E
      4445444F525F505245504F53544F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000A000000434F445F46494C49414C0100000000000B000000
      444553435F46494C49414C0100000000000B000000444553435F434C41535345
      0100000000000A0000005356414C5F56495354410100000000000A0000005356
      414C5F5052415A4F0100000000000B0000005356414C5F4F5554524F53010000
      0000000A0000005356414C5F544F54414C0100000000000B0000005356414C5F
      43415254414F010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 320
    object QRClassePgtoDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRClassePgtoDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QRClassePgtoSVAL_VISTA: TFloatField
      FieldName = 'SVAL_VISTA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRClassePgtoSVAL_PRAZO: TFloatField
      FieldName = 'SVAL_PRAZO'
      DisplayFormat = '###,###,##0.00'
    end
    object QRClassePgtoSVAL_OUTROS: TFloatField
      FieldName = 'SVAL_OUTROS'
      DisplayFormat = '###,###,##0.00'
    end
    object QRClassePgtoSVAL_CARTAO: TFloatField
      FieldName = 'SVAL_CARTAO'
      DisplayFormat = '###,###,##0.00'
    end
    object QRClassePgtoSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object QRClassePgtoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
  end
  object QRMovEntradaSaida: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_FILIAL,  '
      '  COD_PRODUTO,'
      '  NUM_EMBALAGEM,'
      '  NUM_MES,'
      '  NUM_ANO,  '
      
        '  SQT_ENTRADA + DECODE(COD_EMPRESA,'#39'ARISTIDES'#39',0,SQT_SAIDA_DEV) ' +
        'AS SQT_ENTRADA,'
      
        '  SQT_EMB_ENTRADA + DECODE(COD_EMPRESA,'#39'ARISTIDES'#39',0,SQT_EMB_SAI' +
        'DA_DEV) AS SQT_EMB_ENTRADA,'
      
        '  SVAL_UNIT_ENTRADA + DECODE(COD_EMPRESA,'#39'ARISTIDES'#39',0,SVAL_UNIT' +
        '_SAIDA_DEV) AS SVAL_UNIT_ENTRADA,'
      
        '  SVAL_TOTAL_ENTRADA + DECODE(COD_EMPRESA,'#39'ARISTIDES'#39',0,SVAL_TOT' +
        'AL_SAIDA_DEV) AS SVAL_TOTAL_ENTRADA,'
      
        '  SQT_SAIDA + SQT_ENTRADA_DEV - DECODE(COD_EMPRESA,'#39'ARISTIDES'#39',S' +
        'QT_SAIDA_DEV,0) AS SQT_SAIDA,'
      
        '  SQT_EMB_SAIDA + SQT_EMB_ENTRADA_DEV - DECODE(COD_EMPRESA,'#39'ARIS' +
        'TIDES'#39',SQT_EMB_SAIDA_DEV,0) AS SQT_EMB_SAIDA,'
      
        '  SVAL_UNIT_SAIDA + SVAL_UNIT_ENTRADA_DEV - DECODE(COD_EMPRESA,'#39 +
        'ARISTIDES'#39',SVAL_UNIT_SAIDA_DEV,0) AS SVAL_UNIT_SAIDA,'
      
        '  SVAL_TOTAL_SAIDA + SVAL_TOTAL_ENTRADA_DEV - DECODE(COD_EMPRESA' +
        ','#39'ARISTIDES'#39',SVAL_TOTAL_SAIDA_DEV,0) AS SVAL_TOTAL_SAIDA,'
      
        '  ((SQT_ENTRADA + SQT_SAIDA_DEV) - (SQT_SAIDA + SQT_ENTRADA_DEV)' +
        ') AS SQT_TOTAL,'
      
        '  ((SQT_EMB_ENTRADA + SQT_SAIDA_DEV) - (SQT_EMB_SAIDA + SQT_EMB_' +
        'ENTRADA_DEV)) AS SQT_EMB_TOTAL,'
      '  DESC_PRODUTO'
      'FROM'
      '('
      'SELECT'
      '  TB_PRODUTO.COD_PRODUTO,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_NOTA_CAB.COD_FILIAL,  '
      '  TB_PRODUTO.NUM_EMBALAGEM,  '
      '  CAST(TO_CHAR(TO_DATE(:DATA_I),'#39'MM'#39') AS INTEGER) AS NUM_MES,'
      '  CAST(TO_CHAR(TO_DATE(:DATA_I),'#39'YYYY'#39') AS INTEGER) AS NUM_ANO,'
      '  '
      '  /*PEGA NOTAS DE ENTRADA + */'
      
        '  SUM(DECODE(TB_OPERACAO.IND_COMPRAS,'#39'C'#39',TB_NOTA_ITEM.QT_QUANTID' +
        'ADE,0)) AS SQT_ENTRADA,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_COMPRAS,'#39'C'#39',TB_NOTA_ITEM.QT_QUANTID' +
        'ADE * TB_PRODUTO.NUM_EMBALAGEM,0)) AS SQT_EMB_ENTRADA,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_COMPRAS,'#39'C'#39',TB_NOTA_ITEM.VAL_UNITAR' +
        'IO,0)) AS SVAL_UNIT_ENTRADA,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_COMPRAS,'#39'C'#39',TB_NOTA_ITEM.VAL_TOTAL,' +
        '0)) AS SVAL_TOTAL_ENTRADA,'
      '  '
      '  /* PEGA AS DEVOLUCOES DE COMPRA (FEITAS NO VENDAS) + */'
      
        '  SUM(DECODE(TB_OPERACAO.IND_COMPRAS,'#39'D'#39',TB_NOTA_ITEM.QT_QUANTID' +
        'ADE,0)) AS SQT_ENTRADA_DEV,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_COMPRAS,'#39'D'#39',TB_NOTA_ITEM.QT_QUANTID' +
        'ADE * TB_PRODUTO.NUM_EMBALAGEM,0)) AS SQT_EMB_ENTRADA_DEV,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_COMPRAS,'#39'D'#39',TB_NOTA_ITEM.VAL_UNITAR' +
        'IO,0))  AS SVAL_UNIT_ENTRADA_DEV,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_COMPRAS,'#39'D'#39',TB_NOTA_ITEM.VAL_TOTAL,' +
        '0)) AS SVAL_TOTAL_ENTRADA_DEV,'
      ''
      '   /* PEGA AS NOTAS DE SAIDA */'
      
        '  SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',TB_NOTA_ITEM.QT_QUANTIDA' +
        'DE, 0)) AS SQT_SAIDA,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',(TB_NOTA_ITEM.QT_QUANTID' +
        'ADE * TB_PRODUTO.NUM_EMBALAGEM), 0)) AS SQT_EMB_SAIDA,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',(TB_NOTA_ITEM.VAL_UNITAR' +
        'IO - TB_NOTA_ITEM.VAL_DESCONTO), 0)) AS SVAL_UNIT_SAIDA,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',(TB_NOTA_ITEM.VAL_TOTAL ' +
        '- (TB_NOTA_ITEM.VAL_DESCONTO * TB_NOTA_ITEM.QT_QUANTIDADE)), 0))' +
        ' AS SVAL_TOTAL_SAIDA,   '
      ''
      '  /* PEGA AS DEVOLUCOES DE VENDA (FEITAS NO COMPRAS) */'
      
        '  SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'D'#39',TB_NOTA_ITEM.QT_QUANTIDA' +
        'DE, 0)) AS SQT_SAIDA_DEV,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'D'#39',(TB_NOTA_ITEM.QT_QUANTID' +
        'ADE * TB_PRODUTO.NUM_EMBALAGEM), 0)) AS SQT_EMB_SAIDA_DEV,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'D'#39',(TB_NOTA_ITEM.VAL_UNITAR' +
        'IO - TB_NOTA_ITEM.VAL_DESCONTO), 0)) AS SVAL_UNIT_SAIDA_DEV,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'D'#39',(TB_NOTA_ITEM.VAL_TOTAL ' +
        '- (TB_NOTA_ITEM.VAL_DESCONTO * TB_NOTA_ITEM.QT_QUANTIDADE)), 0))' +
        ' AS SVAL_TOTAL_SAIDA_DEV,'
      ''
      '  0 AS SQT_TOTAL,'
      '  0 AS SQT_EMB_TOTAL,'
      '  TB_PARAM_SISTEMA.COD_EMPRESA'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_PRODUTO,'
      '  TB_MARCA,'
      '  TB_OPERACAO,'
      '  TB_LOTE_TIPO,'
      '  TB_CLASSE,'
      '  TB_NOTA_ITEM,'
      '  TB_CADASTRO,'
      '  TB_PARAM_SISTEMA'
      'WHERE'
      '  TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB'
      '  AND'
      '  TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '  AND'
      '  TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_NOTA_ITEM.COD_LOTE_TIPO = TB_LOTE_TIPO.COD_LOTE_TIPO'
      '  AND'
      '  TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '  AND'
      '  TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      '  TB_PRODUTO.COD_MARCA = TB_MARCA.COD_MARCA(+)'
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  TB_OPERACAO.IND_ESTOQUE = '#39'S'#39
      '  AND'
      '  (:FILIAL = TB_NOTA_CAB.COD_FILIAL) '
      '  AND'
      '  ((:OPERACAO IS NULL OR'
      '   :OPERACAO = TB_NOTA_CAB.COD_OPERACAO)'
      '   OR'
      '    (:OPERACAO1 IS NULL OR'
      '      :OPERACAO1 = TB_NOTA_CAB.COD_OPERACAO)) '
      '  AND'
      '  (:IND_ENTRADA_SAIDA IS NULL'
      '   OR'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = :IND_ENTRADA_SAIDA)'
      '  AND'
      '  (:LOTE IS NULL OR'
      '   :LOTE = TB_NOTA_ITEM.COD_LOTE_TIPO)'
      '  AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '  AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '  AND'
      '  (:CLASSE IS NULL'
      '   OR'
      '    TB_CLASSE.NUM_CLASSE =:CLASSE)'
      '  AND'
      '  (:SUBCLASSE IS NULL'
      '   OR'
      '    TB_CLASSE.NUM_SUBCLASSE =:SUBCLASSE)'
      '  AND'
      '  (:PRODUTO)'
      '  AND'
      '  (:COD_PRODUTOS_NOTA)'
      '  AND'
      '  (:COD_MARCA IS NULL'
      '  OR'
      '   TB_PRODUTO.COD_MARCA = :COD_MARCA)'
      '  AND'
      
        '  ((:COD_CADASTRO IS NULL)      /* SOMENTE CONSIDERA O QUE TEVE ' +
        'COD_CADASTRO ENTRADAS OU TUDO */'
      '  OR'
      '  (TB_PRODUTO.COD_PRODUTO IN('
      '                SELECT '
      '                  TB_NOTA_ITEM.COD_PRODUTO'
      '                FROM'
      '                  TB_NOTA_CAB,'
      '                  TB_NOTA_ITEM,'
      '                  TB_OPERACAO'
      '                WHERE'
      
        '                  TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NO' +
        'TA_CAB'
      '                  AND'
      
        '                  TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPE' +
        'RACAO'
      '                  AND'
      '                  TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO'
      '                  AND'
      '                  TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39
      '                  AND'
      '                  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '                  AND'
      '                  TB_OPERACAO.IND_ESTOQUE = '#39'S'#39
      '                  AND'
      '                  TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '                  AND'
      '                  TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F)))'
      ' '
      '  GROUP BY  '
      '  TB_PRODUTO.COD_PRODUTO, '
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_NOTA_CAB.COD_FILIAL,  '
      '  TB_PRODUTO.NUM_EMBALAGEM,'
      '  CAST(TO_CHAR(TO_DATE(:DATA_I),'#39'MM'#39') AS INTEGER),'
      '  CAST(TO_CHAR(TO_DATE(:DATA_I),'#39'YYYY'#39') AS INTEGER),'
      '  TB_PARAM_SISTEMA.COD_EMPRESA'
      ' )'
      'ORDER BY COD_PRODUTO, DESC_PRODUTO')
    Variables.Data = {
      030000000D000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000070000003A46494C4941
      4C030000000000000000000000090000003A4F5045524143414F030000000000
      0000000000000A0000003A4F5045524143414F31030000000000000000000000
      080000003A50524F4455544F010000000000000000000000050000003A4C4F54
      45030000000000000000000000070000003A434C415353450300000000000000
      000000000A0000003A535542434C415353450300000000000000000000001200
      00003A434F445F50524F4455544F535F4E4F5441010000000000000000000000
      120000003A494E445F454E54524144415F534149444105000000000000000000
      00000D0000003A434F445F434144415354524F0300000000000000000000000A
      0000003A434F445F4D41524341030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000100000000B000000434F445F50524F4455544F0100000000000C0000
      00444553435F50524F4455544F0100000000000B0000005351545F454E545241
      4441010000000000110000005356414C5F554E49545F454E5452414441010000
      000000120000005356414C5F544F54414C5F454E54524144410100000000000F
      0000005351545F454D425F454E5452414441010000000000090000005351545F
      53414944410100000000000F0000005356414C5F554E49545F53414944410100
      00000000100000005356414C5F544F54414C5F53414944410100000000000D00
      00005351545F454D425F5341494441010000000000090000005351545F544F54
      414C0100000000000D0000005351545F454D425F544F54414C0100000000000A
      000000434F445F46494C49414C010000000000070000004E554D5F4D45530100
      00000000070000004E554D5F414E4F0100000000000D0000004E554D5F454D42
      414C4147454D010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRMovEntradaSaidaCalcFields
    Left = 371
    Top = 364
    object QRMovEntradaSaidaCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRMovEntradaSaidaSQT_ENTRADA: TFloatField
      FieldName = 'SQT_ENTRADA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRMovEntradaSaidaSVAL_UNIT_ENTRADA: TFloatField
      FieldName = 'SVAL_UNIT_ENTRADA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRMovEntradaSaidaSVAL_TOTAL_ENTRADA: TFloatField
      FieldName = 'SVAL_TOTAL_ENTRADA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRMovEntradaSaidaSQT_EMB_ENTRADA: TFloatField
      FieldName = 'SQT_EMB_ENTRADA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRMovEntradaSaidaSQT_SAIDA: TFloatField
      FieldName = 'SQT_SAIDA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRMovEntradaSaidaSVAL_UNIT_SAIDA: TFloatField
      FieldName = 'SVAL_UNIT_SAIDA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRMovEntradaSaidaSVAL_TOTAL_SAIDA: TFloatField
      FieldName = 'SVAL_TOTAL_SAIDA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRMovEntradaSaidaSQT_EMB_SAIDA: TFloatField
      FieldName = 'SQT_EMB_SAIDA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRMovEntradaSaidacusto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'custo'
      Calculated = True
    end
    object QRMovEntradaSaidaDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRMovEntradaSaidaSQT_TOTAL: TFloatField
      FieldName = 'SQT_TOTAL'
    end
    object QRMovEntradaSaidaSQT_EMB_TOTAL: TFloatField
      FieldName = 'SQT_EMB_TOTAL'
    end
    object QRMovEntradaSaidaqt_quantidade: TFloatField
      FieldKind = fkCalculated
      FieldName = 'qt_quantidade'
      Calculated = True
    end
    object QRMovEntradaSaidaCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QRMovEntradaSaidaNUM_MES: TFloatField
      FieldName = 'NUM_MES'
    end
    object QRMovEntradaSaidaNUM_ANO: TFloatField
      FieldName = 'NUM_ANO'
    end
    object QRMovEntradaSaidasqt_estoque_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sqt_estoque_total'
      Calculated = True
    end
    object QRMovEntradaSaidasqt_estoque_emb_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sqt_estoque_emb_total'
      Calculated = True
    end
    object QRMovEntradaSaidaNUM_EMBALAGEM: TFloatField
      FieldName = 'NUM_EMBALAGEM'
    end
  end
  object QRReciboComissao: TOracleDataSet1
    SQL.Strings = (
      '  SELECT'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.PERC_IRRF,'
      '    Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '    Tb_nota_cab.COD_SERIE,'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.DESC_CIDADE,'
      '    Tb_vendedor.DESC_CEP,'
      '    Tb_vendedor.DESC_ENDERECO,'
      '    Tb_vendedor.DESC_CPF NUM_CGC,'
      '    Tb_vendedor.DESC_TELEFONE,'
      '    Tb_vendedor.COD_ESTADO,'
      
        '    SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.VAL_TOTAL' +
        ' - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM),'
      
        '                                         (Tb_nota_item.VAL_TOTAL' +
        ' - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM))*-1)) AS SVAL_' +
        'TOTAL,'
      
        '    SUM((Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.VAL_TOTA' +
        'L - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM),'
      
        '                                         (Tb_nota_item.VAL_TOTAL' +
        ' - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM))*-1)) * Tb_not' +
        'a_cab.PERC_COMISSAO / 100) AS Sval_comissao'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_FILIAL,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '    AND'
      '    Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      
        '    ((TB_NOTA_ITEM.PERC_COMISSAO > 0) OR (TB_NOTA_CAB.PERC_COMIS' +
        'SAO > 0))'
      '    AND'
      
        '    ((TB_OPERACAO.IND_VENDAS = '#39'V'#39') OR (TB_OPERACAO.IND_VENDAS =' +
        ' '#39'D'#39'))'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '    AND'
      '    (:SERIE IS NULL OR'
      '      TB_NOTA_CAB.COD_SERIE = :SERIE)'
      '    AND'
      '    (:SERIE1 IS NULL OR'
      '      TB_NOTA_CAB.COD_SERIE = :SERIE1)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO = :VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '  GROUP BY'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.PERC_IRRF,'
      '    Tb_vendedor.NOME,'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_nota_cab.COD_SERIE,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.DESC_CIDADE,'
      '    Tb_vendedor.DESC_CEP,'
      '    Tb_vendedor.DESC_ENDERECO,'
      '    Tb_vendedor.DESC_CPF,'
      '    Tb_vendedor.DESC_TELEFONE,'
      '    Tb_vendedor.COD_ESTADO'
      ''
      ''
      ' '
      ' '
      ' ')
    Variables.Data = {
      0300000007000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000090000003A56454E4445
      444F52030000000000000000000000070000003A46494C49414C030000000000
      000000000000120000003A56454E4445444F525F505245504F53544F03000000
      0000000000000000060000003A53455249450500000000000000000000000700
      00003A534552494531050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E0000000C000000434F445F56454E4445444F520100000000000D00
      00004E4F4D455F56454E4445444F520100000000000A000000434F445F46494C
      49414C0100000000000B000000444553435F46494C49414C0100000000000B00
      0000444553435F43494441444501000000000008000000444553435F43455001
      00000000000D000000444553435F454E44455245434F01000000000007000000
      4E554D5F4347430100000000000D000000444553435F54454C45464F4E450100
      000000000A000000434F445F45535441444F0100000000000A0000005356414C
      5F544F54414C01000000000009000000504552435F495252460100000000000D
      0000005356414C5F434F4D495353414F01000000000009000000434F445F5345
      524945010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRReciboComissaoCalcFields
    Left = 248
    Top = 176
    object QRReciboComissaoNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 40
    end
    object QRReciboComissaoDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRReciboComissaoDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object QRReciboComissaoDESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 9
    end
    object QRReciboComissaoDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      Size = 30
    end
    object QRReciboComissaoDESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 12
    end
    object QRReciboComissaoCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
    object QRReciboComissaoval_extenso: TStringField
      FieldKind = fkCalculated
      FieldName = 'val_extenso'
      Size = 80
      Calculated = True
    end
    object QRReciboComissaoSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRReciboComissaoCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object QRReciboComissaoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QRReciboComissaoPERC_IRRF: TFloatField
      FieldName = 'PERC_IRRF'
    end
    object QRReciboComissaoval_irrf: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_irrf'
      Calculated = True
    end
    object QRReciboComissaoval_liquido: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_liquido'
      Calculated = True
    end
    object QRReciboComissaoSVAL_COMISSAO: TFloatField
      FieldName = 'SVAL_COMISSAO'
    end
    object QRReciboComissaoNUM_CGC: TStringField
      FieldName = 'NUM_CGC'
      Size = 15
    end
    object QRReciboComissaoCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
  end
  object QRContaCorrente2: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  SUM(VAL_TOTAL) AS VAL_TOTAL,'
      '  VAL_AVISTA,'
      '  COD_CADASTRO,'
      '  COD_FILIAL,'
      '  DESC_FILIAL,'
      '  NOME'
      'FROM'
      '('
      '  SELECT'
      
        '    SUM(Tb_nota_item.VAL_TOTAL+TB_NOTA_ITEM.VAL_ICMS_SUBST- PEGA' +
        '_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM)) VAL_TOTAL,'
      '    TB_NOTA_CAB.VAL_AVISTA,'
      '    TB_NOTA_CAB.COD_CADASTRO,'
      '    TB_FILIAL.COD_FILIAL,'
      '    TB_FILIAL.DESC_FILIAL,'
      '    TB_CADASTRO.NOME'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_CADASTRO,'
      '    TB_FILIAL'
      '  WHERE'
      '    Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_cab.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '    AND'
      '    TB_NOTA_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.IND_CONDICAO_PAGTO = '#39'3'#39
      '    AND'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    TB_NOTA_CAB.COD_NOTA_CONTA_CORRENTE IS NULL'
      '    AND'
      '     (:FILIAL IS NULL OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '    AND'
      '     (:CADASTRO IS NULL OR'
      '      TB_NOTA_CAB.COD_CADASTRO = :CADASTRO)'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '  GROUP BY'
      '    TB_NOTA_CAB.VAL_AVISTA,'
      '    TB_NOTA_CAB.COD_CADASTRO,'
      '    TB_FILIAL.COD_FILIAL,'
      '    TB_FILIAL.DESC_FILIAL,'
      '    TB_CADASTRO.NOME'
      ')'
      ' WHERE'
      '   (:VALOR IS NULL OR'
      '     VAL_TOTAL < :VALOR)'
      'GROUP BY'
      '  VAL_AVISTA,'
      '  COD_CADASTRO,'
      '  COD_FILIAL,'
      '  DESC_FILIAL,'
      '  NOME'
      'ORDER BY'
      '  NOME'
      ' '
      ' '
      ' '
      ' '
      ' ')
    QBEDefinition.QBEFieldDefs = {
      04000000060000000C000000434F445F434144415354524F0100000000000A00
      0000434F445F46494C49414C0100000000000B000000444553435F46494C4941
      4C010000000000040000004E4F4D450100000000000900000056414C5F544F54
      414C0100000000000A00000056414C5F415649535441010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRContaCorrente2CalcFields
    Left = 40
    Top = 216
    object QRContaCorrente2COD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRContaCorrente2COD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QRContaCorrente2DESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRContaCorrente2NOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRContaCorrente2VAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QRContaCorrente2VAL_AVISTA: TFloatField
      FieldName = 'VAL_AVISTA'
    end
    object QRContaCorrente2sval_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sval_total'
      Calculated = True
    end
  end
  object QRPrazoVenda: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_FILIAL + 0.00 AS COD_FILIAL,'
      '  DESC_FILIAL,'
      '  COD_VENDEDOR + 0.00 AS COD_VENDEDOR,'
      '  NOME_VENDEDOR,'
      '  SUM(SVAL_AVISTA) AS SVAL_AVISTA,'
      '  SUM(SVAL_PRAZO1) AS SVAL_PRAZO1,'
      '  SUM(SVAL_PRAZO2) AS SVAL_PRAZO2,'
      '  SUM(SVAL_PRAZO3) AS SVAL_PRAZO3,'
      '  SUM(SVAL_PRAZO4) AS SVAL_PRAZO4,'
      '  SUM(SVAL_PRAZO5) AS SVAL_PRAZO5,'
      '  SUM(SVAL_PRAZO6) AS SVAL_PRAZO6,'
      '  SUM(SVAL_LONGO_PRAZO) AS SVAL_LONGO_PRAZO,'
      '  SUM( SVAL_AVISTA+SVAL_PRAZO1+SVAL_PRAZO2'
      '      +SVAL_PRAZO3+SVAL_PRAZO4+SVAL_LONGO_PRAZO) AS SVAL_TOTAL'
      'FROM'
      '('
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME AS NOME_VENDEDOR,'
      
        '    SUM(Tb_Nota_item.Val_Total- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.' +
        'COD_NOTA_ITEM) +Tb_nota_item.VAL_DESPESAS+Tb_nota_item.VAL_FRETE' +
        ') AS SVAL_AVISTA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO1,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO2,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO3,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO4,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO5,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO6,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_LONGO_PRAZO'
      '  FROM'
      '    TB_OPERACAO,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_FILIAL,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_Nota_item.Cod_Nota_Cab = TB_NOTA_CAB.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    TB_NOTA_CAB.IND_CONDICAO_PAGTO = '#39'1'#39
      '    AND'
      '    (TB_OPERACAO.IND_VENDAS = '#39'V'#39')'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL )'
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME AS NOME_VENDEDOR,'
      
        '    SUM((Tb_Nota_item.Val_Total-PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.' +
        'COD_NOTA_ITEM)+Tb_nota_item.VAL_DESPESAS+Tb_nota_item.VAL_FRETE)' +
        '*-1) AS SVAL_AVISTA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO1,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO2,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO3,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO4,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO5,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO6,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_LONGO_PRAZO'
      '  FROM'
      '    TB_OPERACAO,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_FILIAL,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_Nota_item.Cod_Nota_Cab = TB_NOTA_CAB.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    (TB_OPERACAO.IND_VENDAS = '#39'D'#39')'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      
        '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I    /* PARA DEVOLUCAO D' +
        'EVE SER DATA DE RECEBIMENTO */'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL )'
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_AVISTA,'
      '    SUM(Tb_Conta_Receber_Cab.VAL_ORIGINAL) AS SVAL_PRAZO1,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO2,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO3,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO4,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO5,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO6,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_LONGO_PRAZO'
      '  FROM'
      '    TB_OPERACAO,'
      '    TB_NOTA_CAB,'
      '    TB_CONTA_RECEBER_CAB,'
      '    TB_FILIAL,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_conta_receber_cab.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL )'
      '    AND'
      
        '    TB_CONTA_RECEBER_CAB.DT_VENCIMENTO-TB_NOTA_CAB.DT_EMISSAO <=' +
        ' :PRAZO1'
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME'
      ''
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_AVISTA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO1,'
      '    SUM(Tb_Conta_Receber_Cab.VAL_ORIGINAL) AS SVAL_PRAZO2,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO3,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO4,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO5,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO6,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_LONGO_PRAZO'
      '  FROM'
      '    TB_OPERACAO,'
      '    TB_NOTA_CAB,'
      '    TB_CONTA_RECEBER_CAB,'
      '    TB_FILIAL,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_conta_receber_cab.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL )'
      '    AND'
      
        '    TB_CONTA_RECEBER_CAB.DT_VENCIMENTO-TB_NOTA_CAB.DT_EMISSAO > ' +
        ':PRAZO1'
      '    AND'
      
        '    TB_CONTA_RECEBER_CAB.DT_VENCIMENTO-TB_NOTA_CAB.DT_EMISSAO <=' +
        ' :PRAZO2'
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_AVISTA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO1,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO2,'
      '    SUM(Tb_Conta_Receber_Cab.VAL_ORIGINAL) AS SVAL_PRAZO3,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO4,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO5,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO6,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_LONGO_PRAZO'
      '  FROM'
      '    TB_OPERACAO,'
      '    TB_NOTA_CAB,'
      '    TB_CONTA_RECEBER_CAB,'
      '    TB_FILIAL,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_conta_receber_cab.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL )'
      '    AND'
      
        '    TB_CONTA_RECEBER_CAB.DT_VENCIMENTO-TB_NOTA_CAB.DT_EMISSAO > ' +
        ':PRAZO2'
      '    AND'
      
        '    TB_CONTA_RECEBER_CAB.DT_VENCIMENTO-TB_NOTA_CAB.DT_EMISSAO <=' +
        ' :PRAZO3'
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_AVISTA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO1,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO2,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO3,'
      '    SUM(Tb_Conta_Receber_Cab.VAL_ORIGINAL) AS SVAL_PRAZO4,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO5,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO6,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_LONGO_PRAZO'
      '  FROM'
      '    TB_OPERACAO,'
      '    TB_NOTA_CAB,'
      '    TB_CONTA_RECEBER_CAB,'
      '    TB_FILIAL,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_conta_receber_cab.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL )'
      '    AND'
      
        '    TB_CONTA_RECEBER_CAB.DT_VENCIMENTO-TB_NOTA_CAB.DT_EMISSAO > ' +
        ':PRAZO3'
      '    AND'
      
        '    TB_CONTA_RECEBER_CAB.DT_VENCIMENTO-TB_NOTA_CAB.DT_EMISSAO <=' +
        ' :PRAZO4'
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_AVISTA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO1,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO2,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO3,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO4,'
      '    SUM(Tb_Conta_Receber_Cab.VAL_ORIGINAL) AS SVAL_PRAZO5,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO6,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_LONGO_PRAZO'
      '  FROM'
      '    TB_OPERACAO,'
      '    TB_NOTA_CAB,'
      '    TB_CONTA_RECEBER_CAB,'
      '    TB_FILIAL,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_conta_receber_cab.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL )'
      '    AND'
      
        '    TB_CONTA_RECEBER_CAB.DT_VENCIMENTO-TB_NOTA_CAB.DT_EMISSAO > ' +
        ':PRAZO4'
      '    AND'
      
        '    TB_CONTA_RECEBER_CAB.DT_VENCIMENTO-TB_NOTA_CAB.DT_EMISSAO <=' +
        ' :PRAZO5'
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_AVISTA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO1,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO2,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO3,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO4,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO5,'
      '    SUM(Tb_Conta_Receber_Cab.VAL_ORIGINAL) AS SVAL_PRAZO6,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_LONGO_PRAZO'
      '  FROM'
      '    TB_OPERACAO,'
      '    TB_NOTA_CAB,'
      '    TB_CONTA_RECEBER_CAB,'
      '    TB_FILIAL,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_conta_receber_cab.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL )'
      '    AND'
      
        '    TB_CONTA_RECEBER_CAB.DT_VENCIMENTO-TB_NOTA_CAB.DT_EMISSAO > ' +
        ':PRAZO5'
      '    AND'
      
        '    TB_CONTA_RECEBER_CAB.DT_VENCIMENTO-TB_NOTA_CAB.DT_EMISSAO <=' +
        ' :PRAZO6'
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_AVISTA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO1,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO2,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO3,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO4,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO5,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO6,'
      '    SUM(Tb_Conta_Receber_Cab.VAL_ORIGINAL) AS SVAL_LONGO_PRAZO'
      '  FROM'
      '    TB_OPERACAO,'
      '    TB_NOTA_CAB,'
      '    TB_CONTA_RECEBER_CAB,'
      '    TB_FILIAL,'
      '    TB_VENDEDOR'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_conta_receber_cab.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL )'
      '    AND'
      
        '    TB_CONTA_RECEBER_CAB.DT_VENCIMENTO-TB_NOTA_CAB.DT_EMISSAO > ' +
        ':PRAZO6'
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_vendedor.COD_VENDEDOR,'
      '    Tb_vendedor.NOME'
      ')'
      'GROUP BY'
      '  COD_FILIAL,'
      '  DESC_FILIAL,'
      '  COD_VENDEDOR,'
      '  NOME_VENDEDOR'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Variables.Data = {
      0300000009000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000070000003A46494C4941
      4C030000000000000000000000070000003A5052415A4F310300000000000000
      00000000070000003A5052415A4F32030000000000000000000000070000003A
      5052415A4F33030000000000000000000000070000003A5052415A4F34030000
      000000000000000000070000003A5052415A4F35030000000000000000000000
      070000003A5052415A4F36030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000D0000000A000000434F445F46494C49414C0100000000000B000000
      444553435F46494C49414C0100000000000C000000434F445F56454E4445444F
      520100000000000D0000004E4F4D455F56454E4445444F520100000000000B00
      00005356414C5F4156495354410100000000000B0000005356414C5F5052415A
      4F310100000000000B0000005356414C5F5052415A4F320100000000000B0000
      005356414C5F5052415A4F330100000000000B0000005356414C5F5052415A4F
      34010000000000100000005356414C5F4C4F4E474F5F5052415A4F0100000000
      000A0000005356414C5F544F54414C0100000000000B0000005356414C5F5052
      415A4F350100000000000B0000005356414C5F5052415A4F36010000000000}
    Session = DMOracle.DBCemapa
    Left = 144
    Top = 168
    object QRPrazoVendaCOD_FILIAL: TFloatField
      FieldName = 'COD_FILIAL'
    end
    object QRPrazoVendaDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRPrazoVendaCOD_VENDEDOR: TFloatField
      FieldName = 'COD_VENDEDOR'
    end
    object QRPrazoVendaNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 40
    end
    object QRPrazoVendaSVAL_AVISTA: TFloatField
      FieldName = 'SVAL_AVISTA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRPrazoVendaSVAL_PRAZO1: TFloatField
      FieldName = 'SVAL_PRAZO1'
      DisplayFormat = '###,###,##0.00'
    end
    object QRPrazoVendaSVAL_PRAZO2: TFloatField
      FieldName = 'SVAL_PRAZO2'
      DisplayFormat = '###,###,##0.00'
    end
    object QRPrazoVendaSVAL_PRAZO3: TFloatField
      FieldName = 'SVAL_PRAZO3'
      DisplayFormat = '###,###,##0.00'
    end
    object QRPrazoVendaSVAL_PRAZO4: TFloatField
      FieldName = 'SVAL_PRAZO4'
      DisplayFormat = '###,###,##0.00'
    end
    object QRPrazoVendaSVAL_LONGO_PRAZO: TFloatField
      FieldName = 'SVAL_LONGO_PRAZO'
      DisplayFormat = '###,###,##0.00'
    end
    object QRPrazoVendaSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object QRPrazoVendaSVAL_PRAZO5: TFloatField
      FieldName = 'SVAL_PRAZO5'
    end
    object QRPrazoVendaSVAL_PRAZO6: TFloatField
      FieldName = 'SVAL_PRAZO6'
    end
  end
  object QRVendaClasse: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_classe.NUM_CLASSE,'
      '  Tb_classe.NUM_SUBCLASSE,'
      '  Tb_produto.COD_PRODUTO,'
      '  Tb_produto.DESC_PRODUTO,'
      '  Tb_produto.NUM_FABRICANTE,'
      '  Tb_classe.DESC_CLASSE,'
      '  :Desc_Mes AS Desc_Mes,'
      '  :Num_Mes As Num_mes,'
      
        '  SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.QT_QUANTIDA' +
        'DE * Tb_produto.VAL_VAREJO,(Tb_nota_item.QT_QUANTIDADE * Tb_prod' +
        'uto.VAL_VAREJO) * -1)) AS SVAL_TABELA,'
      
        '  SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.QT_QUANTIDA' +
        'DE,Tb_nota_item.QT_QUANTIDADE*-1)) AS SQT_QUANTIDADE,'
      
        '  SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.VAL_TOTAL -' +
        ' PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.V' +
        'AL_DESPESAS + Tb_nota_item.VAL_FRETE+TB_NOTA_ITEM.VAL_ICMS_SUBST' +
        ','
      
        '             (Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOT' +
        'A_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item' +
        '.VAL_FRETE+TB_NOTA_ITEM.VAL_ICMS_SUBST) * -1)) AS SVAL_TOTAL,'
      
        '  SUM(Decode(:TIPO_CUSTO,0,Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_' +
        'nota_item.QT_QUANTIDADE*Tb_nota_item.VAL_CUSTO,Tb_nota_item.VAL_' +
        'CUSTO * -1),0)) AS SVAL_CUSTO1 '
      'FROM'
      '  TB_CADASTRO,'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_PRODUTO,'
      '  TB_OPERACAO,'
      '  TB_CLASSE,'
      '  TB_REGIAO'
      'WHERE'
      '   TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '   AND'
      '   Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '   AND'
      '   TB_CADASTRO.COD_CADASTRO = Tb_nota_cab.COD_CADASTRO'
      '   AND'
      '   Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '   AND'
      '   Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '   AND'
      '   TB_CADASTRO.COD_REGIAO = TB_REGIAO.COD_REGIAO'
      '   AND'
      '   (:REGIAO IS NULL'
      '   OR'
      '    TB_CADASTRO.COD_REGIAO in :REGIAO)'
      '   AND'
      '   TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '   AND'
      
        '  (:MONTA_NA_SQL) /* Serve para o caso de informar uma operacao ' +
        'que nao '#233' venda e nem devolucao de venda */'
      '  AND'
      '  (:FILIAL IS NULL'
      '   OR'
      '    :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '   AND'
      '   (:CLASSE IS NULL'
      '   OR'
      '    TB_CLASSE.NUM_CLASSE >= :CLASSE)'
      '   AND'
      '  (:SUB_CLASSE IS NULL'
      '   OR'
      '    TB_CLASSE.NUM_SUBCLASSE >= :SUB_CLASSE)'
      '   AND'
      '  (:CLASSE_FINAL IS NULL'
      '   OR'
      '    TB_CLASSE.NUM_CLASSE <= :CLASSE_FINAL)'
      '   AND'
      '  (:SUB_CLASSE_FINAL IS NULL'
      '   OR'
      '    TB_CLASSE.NUM_SUBCLASSE <= :SUB_CLASSE_FINAL)'
      '   AND'
      '  :VENDEDOR /* IS NULL'
      '    OR'
      '    TB_NOTA_CAB.COD_VENDEDOR in :VENDEDOR)*/'
      '   AND   '
      '  (:TECNICO IS NULL'
      '    OR'
      '    TB_NOTA_CAB.COD_TECNICO = :TECNICO)'
      '  AND'
      '  (:FABRICANTE IS NULL'
      '    OR'
      '    TB_PRODUTO.COD_CADASTRO = :FABRICANTE)'
      '  AND'
      '  (:CIDADE IS NULL'
      '   OR'
      '    TB_CADASTRO.COD_CIDADE = :CIDADE)'
      '  AND'
      '  (:ESTADO IS NULL'
      '   OR'
      '    TB_CADASTRO.COD_ESTADO = :ESTADO) '
      '   AND'
      '   TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '   AND'
      '   TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '   AND'
      '   TB_OPERACAO.IND_DEPOSITO_OUTRAS <> '#39'S'#39
      
        'GROUP BY Tb_classe.COD_CLASSE,Tb_classe.DESC_CLASSE,Tb_produto.C' +
        'OD_PRODUTO,Tb_classe.NUM_CLASSE,Tb_classe.NUM_SUBCLASSE,Tb_produ' +
        'to.DESC_PRODUTO,Tb_produto.NUM_FABRICANTE,:Desc_Mes,'
      '  :NUM_MES'
      'ORDER BY Tb_classe.COD_CLASSE,Tb_produto.COD_PRODUTO')
    Variables.Data = {
      0300000011000000070000003A46494C49414C03000000000000000000000007
      0000003A434C415353450300000000000000000000000B0000003A5355425F43
      4C41535345030000000000000000000000070000003A444154415F490C000000
      0000000000000000070000003A444154415F460C000000000000000000000009
      0000003A56454E4445444F520100000004000000313D3100000000000B000000
      3A464142524943414E54450300000000000000000000000B0000003A5449504F
      5F435553544F030000000000000000000000070000003A434944414445050000
      0004000000313D310000000000090000003A444553435F4D4553010000002800
      0000546F5F436861722874625F6E6F74615F6361622E64745F656D697373616F
      2C274D4F4E544827290000000000080000003A4E554D5F4D4553010000002500
      0000546F5F436861722874625F6E6F74615F6361622E64745F656D697373616F
      2C274D4D27290000000000070000003A45535441444F05000000000000000000
      00000D0000003A4D4F4E54415F4E415F53514C01000000000000000000000008
      0000003A5445434E49434F030000000000000000000000070000003A52454749
      414F050000000000000000000000110000003A5355425F434C415353455F4649
      4E414C0500000000000000000000000D0000003A434C415353455F46494E414C
      050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C0000000A0000004E554D5F434C415353450100000000000D000000
      4E554D5F535542434C415353450100000000000B000000434F445F50524F4455
      544F0100000000000C000000444553435F50524F4455544F0100000000000B00
      0000444553435F434C415353450100000000000B0000005356414C5F54414245
      4C410100000000000E0000005351545F5155414E544944414445010000000000
      0A0000005356414C5F544F54414C0100000000000B0000005356414C5F435553
      544F310100000000000E0000004E554D5F464142524943414E54450100000000
      0008000000444553435F4D4553010000000000070000004E554D5F4D45530100
      00000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRVendaClasseCalcFields
    Left = 144
    Top = 120
    object QRVendaClasseNUM_CLASSE: TIntegerField
      FieldName = 'NUM_CLASSE'
      Required = True
    end
    object QRVendaClasseNUM_SUBCLASSE: TIntegerField
      FieldName = 'NUM_SUBCLASSE'
      Required = True
    end
    object QRVendaClasseCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRVendaClasseDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QRVendaClasseSVAL_TABELA: TFloatField
      FieldName = 'SVAL_TABELA'
    end
    object QRVendaClasseSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRVendaClasseSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRVendaClassesval_custo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sval_custo'
      Calculated = True
    end
    object QRVendaClasseSVAL_CUSTO1: TFloatField
      FieldName = 'SVAL_CUSTO1'
    end
    object QRVendaClasseDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRVendaClasseNUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
      Size = 15
    end
    object QRVendaClasseDESC_MES: TStringField
      FieldName = 'DESC_MES'
      Size = 9
    end
    object QRVendaClasseNUM_MES: TStringField
      FieldName = 'NUM_MES'
      Size = 2
    end
  end
  object QrLotesClaspar: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_nota_cab.NUM_NOTA,'
      '  Tb_nota_cab.DT_EMISSAO AS DT_EMISSAO_NOTA,'
      '  Tb_nota_cab.DESC_PLACA,'
      '  Tb_cadastro.NOME,'
      '  Tb_cadastro.COD_ESTADO AS COD_ESTADO_CADASTRO,'
      '  Tb_nota_item.QT_QUANTIDADE,'
      '  Tb_nota_item.COD_NOTA_ITEM,'
      '  Tb_produto.DESC_PRODUTO,'
      '  Tb_produto.NUM_EMBALAGEM,'
      '  Tb_lote_claspar.COD_LOTE_TIPO,'
      '  Tb_lote_claspar.NUM_CERTIFICADO,'
      '  Tb_lote_claspar.COD_SERIE,'
      '  Tb_lote_claspar.COD_ESTADO AS COD_ESTADO_CLASPAR,'
      '  Tb_lote_claspar.DT_EMISSAO AS DT_EMISSAO_CLASPAR,'
      '  Tb_lote_claspar.DT_VALIDADE,'
      '  Tb_lote_claspar.COD_REG_MAARA,'
      '  Tb_lote_claspar.PERC_UMIDADE,'
      '  Tb_lote_claspar.DESC_SAFRA,'
      '  Tb_lote_claspar.QT_CLASSIFICADO,'
      '  Tb_lote_claspar.DESC_RENDA,'
      '  Tb_lote_claspar.PERC_INTEIRO,'
      '  Tb_lote_claspar.PERC_QUEBRADOS,'
      '  Tb_lote_claspar.DESC_MARCA,'
      '  Tb_lote_claspar.DESC_GRUPO,'
      '  Tb_lote_claspar.DESC_CLASSE,'
      '  Tb_lote_claspar.DESC_TIPO,'
      '  Tb_lote_claspar.DESC_REGIONAL,'
      '  Tb_lote_claspar.DESC_POSTO,'
      '  Tb_filial.DESC_FILIAL,'
      '  Tb_filial.COD_ESTADO AS COD_ESTADO_FILIAL,'
      '  Tb_lote_tipo.DESC_OBSERVACAO'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_LOTE_CLASPAR,'
      '  TB_CADASTRO,'
      '  TB_PRODUTO,'
      '  TB_FILIAL,'
      '  TB_LOTE_TIPO'
      'WHERE'
      '  (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO)'
      '  AND'
      '  (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB)'
      '  AND'
      '  (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO)'
      '  AND'
      '  (Tb_nota_item.COD_LOTE_TIPO = Tb_lote_claspar.COD_LOTE_TIPO)'
      '  AND'
      '  (Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL)'
      '  AND'
      '  (Tb_nota_item.COD_LOTE_TIPO = Tb_lote_tipo.COD_LOTE_TIPO)'
      '  AND'
      '  (TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I)'
      '  AND'
      '  (TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F)'
      '  AND'
      '  (:FILIAL IS NULL OR'
      '   :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '  AND'
      '  (:NUM_NOTAI IS NULL OR'
      '   TB_NOTA_CAB.NUM_NOTA >= :NUM_NOTAI)'
      '  AND'
      '  (:NUM_NOTAF IS NULL OR'
      '   TB_NOTA_CAB.NUM_NOTA <= :NUM_NOTAF)'
      'ORDER BY'
      '  Tb_nota_cab.NUM_NOTA')
    Variables.Data = {
      0300000005000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000070000003A46494C4941
      4C0300000000000000000000000A0000003A4E554D5F4E4F5441490300000000
      000000000000000A0000003A4E554D5F4E4F5441460300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000001F000000080000004E554D5F4E4F54410100000000000F0000004454
      5F454D495353414F5F4E4F54410100000000000A000000444553435F504C4143
      41010000000000040000004E4F4D4501000000000013000000434F445F455354
      41444F5F434144415354524F0100000000000D00000051545F5155414E544944
      4144450100000000000D000000434F445F4E4F54415F4954454D010000000000
      0C000000444553435F50524F4455544F0100000000000D0000004E554D5F454D
      42414C4147454D0100000000000D000000434F445F4C4F54455F5449504F0100
      000000000F0000004E554D5F434552544946494341444F010000000000090000
      00434F445F534552494501000000000012000000434F445F45535441444F5F43
      4C41535041520100000000001200000044545F454D495353414F5F434C415350
      41520100000000000B00000044545F56414C49444144450100000000000D0000
      00434F445F5245475F4D414152410100000000000C000000504552435F554D49
      444144450100000000000A000000444553435F53414652410100000000000F00
      000051545F434C4153534946494341444F0100000000000A000000444553435F
      52454E44410100000000000C000000504552435F494E544549524F0100000000
      000E000000504552435F515545425241444F530100000000000A000000444553
      435F4D415243410100000000000A000000444553435F475255504F0100000000
      000B000000444553435F434C4153534501000000000009000000444553435F54
      49504F0100000000000D000000444553435F524547494F4E414C010000000000
      0A000000444553435F504F53544F0100000000000B000000444553435F46494C
      49414C01000000000011000000434F445F45535441444F5F46494C49414C0100
      000000000F000000444553435F4F42534552564143414F010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 480
    Top = 16
    object QrLotesClasparNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QrLotesClasparDT_EMISSAO_NOTA: TDateTimeField
      FieldName = 'DT_EMISSAO_NOTA'
      Required = True
    end
    object QrLotesClasparDESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Size = 8
    end
    object QrLotesClasparNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QrLotesClasparCOD_ESTADO_CADASTRO: TStringField
      FieldName = 'COD_ESTADO_CADASTRO'
      Size = 2
    end
    object QrLotesClasparQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object QrLotesClasparCOD_NOTA_ITEM: TIntegerField
      FieldName = 'COD_NOTA_ITEM'
      Required = True
    end
    object QrLotesClasparNUM_EMBALAGEM: TFloatField
      FieldName = 'NUM_EMBALAGEM'
    end
    object QrLotesClasparCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
      Required = True
    end
    object QrLotesClasparNUM_CERTIFICADO: TFloatField
      FieldName = 'NUM_CERTIFICADO'
      Required = True
    end
    object QrLotesClasparCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 2
    end
    object QrLotesClasparCOD_ESTADO_CLASPAR: TStringField
      FieldName = 'COD_ESTADO_CLASPAR'
      Required = True
      Size = 2
    end
    object QrLotesClasparDT_EMISSAO_CLASPAR: TDateTimeField
      FieldName = 'DT_EMISSAO_CLASPAR'
      Required = True
    end
    object QrLotesClasparDT_VALIDADE: TDateTimeField
      FieldName = 'DT_VALIDADE'
      Required = True
    end
    object QrLotesClasparCOD_REG_MAARA: TStringField
      FieldName = 'COD_REG_MAARA'
      Required = True
      Size = 15
    end
    object QrLotesClasparPERC_UMIDADE: TFloatField
      FieldName = 'PERC_UMIDADE'
      Required = True
    end
    object QrLotesClasparDESC_SAFRA: TStringField
      FieldName = 'DESC_SAFRA'
      Required = True
      Size = 10
    end
    object QrLotesClasparQT_CLASSIFICADO: TFloatField
      FieldName = 'QT_CLASSIFICADO'
      Required = True
    end
    object QrLotesClasparDESC_RENDA: TStringField
      FieldName = 'DESC_RENDA'
      Size = 7
    end
    object QrLotesClasparPERC_INTEIRO: TFloatField
      FieldName = 'PERC_INTEIRO'
    end
    object QrLotesClasparPERC_QUEBRADOS: TFloatField
      FieldName = 'PERC_QUEBRADOS'
    end
    object QrLotesClasparDESC_MARCA: TStringField
      FieldName = 'DESC_MARCA'
    end
    object QrLotesClasparDESC_GRUPO: TStringField
      FieldName = 'DESC_GRUPO'
    end
    object QrLotesClasparDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
    end
    object QrLotesClasparDESC_TIPO: TStringField
      FieldName = 'DESC_TIPO'
    end
    object QrLotesClasparDESC_REGIONAL: TStringField
      FieldName = 'DESC_REGIONAL'
    end
    object QrLotesClasparDESC_POSTO: TStringField
      FieldName = 'DESC_POSTO'
    end
    object QrLotesClasparDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QrLotesClasparCOD_ESTADO_FILIAL: TStringField
      FieldName = 'COD_ESTADO_FILIAL'
      Size = 2
    end
    object QrLotesClasparDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 30
    end
    object QrLotesClasparDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
  end
  object QRVendedorPgto: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  NOME_VENDEDOR,'
      '  COD_FILIAL  + 0.00 AS COD_FILIAL,'
      '  DESC_FILIAL,'
      '  SUM(SVAL_PRAZO) AS SVAL_PRAZO,'
      '  SUM(SVAL_CUSTO_PRAZO) AS SVAL_CUSTO_PRAZO,'
      '  SUM(SVAL_VISTA) AS SVAL_VISTA,'
      '  SUM(SVAL_CUSTO_VISTA) AS SVAL_CUSTO_VISTA'
      'FROM'
      '('
      '  SELECT'
      '    TB_VENDEDOR.NOME NOME_VENDEDOR,'
      '    TB_FILIAL.COD_FILIAL,'
      '    TB_FILIAL.DESC_FILIAL,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_PRAZO,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_CUSTO_PRAZO,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',TB_NOTA_ITEM.VAL_TOTAL' +
        ' - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item' +
        '.VAL_DESPESAS + Tb_nota_item.VAL_FRETE + Tb_nota_item.VAL_IPI+TB' +
        '_NOTA_ITEM.VAL_ICMS_SUBST,'
      
        '                                         (TB_NOTA_ITEM.VAL_TOTAL' +
        ' - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item' +
        '.VAL_DESPESAS + Tb_nota_item.VAL_FRETE + Tb_nota_item.VAL_IPI+TB' +
        '_NOTA_ITEM.VAL_ICMS_SUBST)*-1)) AS SVAL_VISTA,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',TB_NOTA_ITEM.VAL_CUSTO' +
        '*TB_NOTA_ITEM.QT_QUANTIDADE,'
      
        '                                         (TB_NOTA_ITEM.VAL_CUSTO' +
        ')*-1))  AS SVAL_CUSTO_VISTA'
      '  FROM'
      '    TB_FILIAL,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_VENDEDOR,'
      '    TB_OPERACAO'
      '  WHERE'
      '    TB_FILIAL.COD_FILIAL = TB_NOTA_CAB.COD_FILIAL'
      '    AND'
      '    TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB'
      '    AND'
      '    TB_NOTA_CAB.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '    AND'
      
        '    ((TB_OPERACAO.IND_VENDAS = '#39'V'#39') OR (TB_OPERACAO.IND_VENDAS =' +
        ' '#39'D'#39'))'
      '    AND'
      '    TB_NOTA_CAB.IND_CONDICAO_PAGTO = '#39'1'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR  = :VENDEDOR)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO  = :VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '      TB_FILIAL.COD_FILIAL  = :FILIAL)'
      '  GROUP BY'
      '    TB_VENDEDOR.NOME,'
      '    TB_FILIAL.COD_FILIAL,'
      '    TB_FILIAL.DESC_FILIAL,'
      '    TO_NUMBER('#39'0'#39'),'
      '    TO_NUMBER('#39'0'#39')'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    TB_VENDEDOR.NOME NOME_VENDEDOR,'
      '    TB_FILIAL.COD_FILIAL,'
      '    TB_FILIAL.DESC_FILIAL,'
      
        '    SUM(TB_NOTA_ITEM.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI+TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SVAL' +
        '_PRAZO,'
      
        '    SUM(TB_NOTA_ITEM.VAL_CUSTO*TB_NOTA_ITEM.QT_QUANTIDADE) AS SV' +
        'AL_CUSTO_PRAZO,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_VISTA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_CUSTO_VISTA'
      '  FROM'
      '    TB_FILIAL,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_VENDEDOR,'
      '    TB_OPERACAO'
      '  WHERE'
      '    TB_FILIAL.COD_FILIAL = TB_NOTA_CAB.COD_FILIAL'
      '    AND'
      '    TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB'
      '    AND'
      '    TB_NOTA_CAB.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39
      '    AND'
      '    TB_NOTA_CAB.IND_CONDICAO_PAGTO <> '#39'1'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    (:VENDEDOR IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR  = :VENDEDOR)'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO  = :VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '      TB_FILIAL.COD_FILIAL  = :FILIAL)'
      '  GROUP BY'
      '    TB_VENDEDOR.NOME,'
      '    TB_FILIAL.COD_FILIAL,'
      '    TB_FILIAL.DESC_FILIAL,'
      '    TO_NUMBER('#39'0'#39'),'
      '    TO_NUMBER('#39'0'#39')'
      ')'
      'GROUP BY'
      '  COD_FILIAL,'
      '  DESC_FILIAL,'
      '  NOME_VENDEDOR'
      ' '
      ' '
      ' ')
    Variables.Data = {
      0300000005000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000090000003A56454E4445
      444F52030000000000000000000000070000003A46494C49414C030000000000
      000000000000120000003A56454E4445444F525F505245504F53544F03000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000D0000004E4F4D455F56454E4445444F520100000000000A
      000000434F445F46494C49414C0100000000000B000000444553435F46494C49
      414C0100000000000A0000005356414C5F5052415A4F01000000000010000000
      5356414C5F435553544F5F5052415A4F0100000000000A0000005356414C5F56
      49535441010000000000100000005356414C5F435553544F5F56495354410100
      00000000}
    Session = DMOracle.DBCemapa
    Left = 144
    Top = 72
    object QRVendedorPgtoNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 40
    end
    object QRVendedorPgtoCOD_FILIAL: TFloatField
      FieldName = 'COD_FILIAL'
    end
    object QRVendedorPgtoDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRVendedorPgtoSVAL_PRAZO: TFloatField
      FieldName = 'SVAL_PRAZO'
      DisplayFormat = '###,###,##0.00'
    end
    object QRVendedorPgtoSVAL_CUSTO_PRAZO: TFloatField
      FieldName = 'SVAL_CUSTO_PRAZO'
      DisplayFormat = '###,###,##0.00'
    end
    object QRVendedorPgtoSVAL_VISTA: TFloatField
      FieldName = 'SVAL_VISTA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRVendedorPgtoSVAL_CUSTO_VISTA: TFloatField
      FieldName = 'SVAL_CUSTO_VISTA'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object QRVendaOperacao: TOracleDataSet1
    SQL.Strings = (
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_nota_cab.COD_VENDEDOR,'
      '    Tb_operacao.COD_OPERACAO,'
      '    Tb_operacao.DESC_OPERACAO,'
      '    Tb_Classe.Desc_Classe,'
      '    Tb_Classe.Cod_Classe,'
      '    Tb_Classe.Num_Classe,'
      '    Tb_Classe.Num_SubClasse,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'D'#39',((Tb_nota_item.VAL_TOT' +
        'AL- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_ite' +
        'm.VAL_DESPESAS + Tb_nota_item.VAL_FRETE + Tb_nota_item.VAL_IPI+T' +
        'B_NOTA_ITEM.VAL_ICMS_SUBST) *-1),(Tb_nota_item.VAL_TOTAL - (Tb_n' +
        'ota_item.VAL_DESCONTO * TB_NOTA_ITEM.QT_QUANTIDADE) - TB_NOTA_IT' +
        'EM.VAL_DESCONTO_RATEIO + Tb_nota_item.VAL_DESPESAS + Tb_nota_ite' +
        'm.VAL_FRETE + Tb_nota_item.VAL_IPI+TB_NOTA_ITEM.VAL_ICMS_SUBST))' +
        ') AS SVAL_TOTAL,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'D'#39',(Tb_nota_item.QT_QUANT' +
        'IDADE*-1),Tb_nota_item.QT_QUANTIDADE)) AS SQT_QUANTIDADE,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'D'#39',(Tb_nota_item.VAL_CUST' +
        'O*-1),DECODE(TB_NOTA_CAB.IND_ENTRADA_SAIDA,'#39'S'#39',Tb_nota_item.VAL_' +
        'CUSTO*Tb_nota_item.QT_QUANTIDADE,Tb_nota_item.VAL_CUSTO))) AS SV' +
        'AL_CUSTO'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_PRODUTO,'
      '    TB_CLASSE,'
      '    TB_OPERACAO,'
      '    TB_FILIAL'
      '  WHERE'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '    AND'
      '    Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    ( :FILIAL IS NULL OR'
      '      :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '    AND'
      '    ( :VENDEDOR IS NULL OR'
      '      :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR )'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '      :VENDEDOR_PREPOSTO = TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO )'
      '    AND'
      '    ( :OPERACAO IS NULL OR'
      '      :OPERACAO = TB_NOTA_CAB.COD_OPERACAO )'
      '    AND'
      '    (:COD_CLASSE IS NULL OR'
      '     TB_CLASSE.NUM_CLASSE = :COD_CLASSE)'
      '    AND'
      '    (:COD_SUBCLASSE IS NULL OR'
      '     TB_CLASSE.NUM_SUBCLASSE = :COD_SUBCLASSE)'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_nota_cab.COD_VENDEDOR,'
      '    Tb_operacao.COD_OPERACAO,'
      '    Tb_operacao.DESC_OPERACAO,'
      '    Tb_Classe.Desc_Classe,'
      '    Tb_Classe.Cod_Classe,'
      '    Tb_Classe.Num_Classe,'
      '    Tb_Classe.Num_SubClasse'
      
        'Order By Tb_filial.COD_FILIAL,Tb_nota_cab.COD_VENDEDOR,Tb_operac' +
        'ao.COD_OPERACAO,Tb_Classe.Cod_Classe')
    Variables.Data = {
      0300000008000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000070000003A46494C4941
      4C030000000000000000000000090000003A56454E4445444F52030000000000
      000000000000090000003A4F5045524143414F03000000000000000000000012
      0000003A56454E4445444F525F505245504F53544F0300000000000000000000
      000B0000003A434F445F434C415353450300000000000000000000000E000000
      3A434F445F535542434C41535345030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C0000000A000000434F445F46494C49414C0100000000000B000000
      444553435F46494C49414C0100000000000C000000434F445F56454E4445444F
      520100000000000C000000434F445F4F5045524143414F0100000000000D0000
      00444553435F4F5045524143414F0100000000000A0000005356414C5F544F54
      414C0100000000000E0000005351545F5155414E544944414445010000000000
      0A0000005356414C5F435553544F0100000000000B000000444553435F434C41
      5353450100000000000A000000434F445F434C415353450100000000000A0000
      004E554D5F434C415353450100000000000D0000004E554D5F535542434C4153
      5345010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRVendaOperacaoCalcFields
    Left = 40
    Top = 120
    object QRVendaOperacaonome_vendedor: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome_vendedor'
      Size = 50
      Calculated = True
    end
    object QRVendaOperacaoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QRVendaOperacaoDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRVendaOperacaoCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QRVendaOperacaoCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
      Required = True
    end
    object QRVendaOperacaoDESC_OPERACAO: TStringField
      FieldName = 'DESC_OPERACAO'
      Required = True
      Size = 30
    end
    object QRVendaOperacaoSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRVendaOperacaoSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRVendaOperacaoSVAL_CUSTO: TFloatField
      FieldName = 'SVAL_CUSTO'
    end
    object QRVendaOperacaoDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QRVendaOperacaoCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object QRVendaOperacaoNUM_CLASSE: TIntegerField
      FieldName = 'NUM_CLASSE'
      Required = True
    end
    object QRVendaOperacaoNUM_SUBCLASSE: TIntegerField
      FieldName = 'NUM_SUBCLASSE'
      Required = True
    end
  end
  object QRClienteSemCompra: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_cadastro.COD_CADASTRO, '
      '  Tb_cadastro.NOME,'
      '  Tb_cadastro.DESC_ENDERECO,'
      '  Tb_cadastro.NUM_CGC_CPF, '
      '  Tb_cadastro.DESC_CIDADE, '
      '  Tb_cadastro.COD_ESTADO,'
      '  Tb_cadastro.DESC_TELEFONE,'
      '  Tb_cadastro.Cod_Cidade,'
      '  TB_CADASTRO.DESC_BAIRRO'
      'FROM'
      '  TB_CADASTRO,'
      '  TB_VENDEDOR'
      'WHERE '
      '  TB_CADASTRO.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR(+)'
      '  AND'
      '  (:COD_VENDEDOR IS NULL'
      '    OR'
      '    TB_CADASTRO.COD_VENDEDOR = :COD_VENDEDOR)'
      '  AND'
      '  (:SUPERVISOR IS NULL'
      '    OR '
      '    TB_VENDEDOR.COD_SUPERVISOR = :SUPERVISOR)'
      '  AND'
      '  (:CLASS_CADASTRO IS NULL'
      '   OR'
      '  :CLASS_CADASTRO = TB_CADASTRO.COD_CLASS_CADASTRO)'
      '  AND'
      '  (:TIPO_CADASTRO IS NULL '
      '    OR '
      '    :TIPO_CADASTRO = TB_CADASTRO.COD_TIPO_CADASTRO)'
      '  AND'
      '  (:CIDADE IS NULL '
      '    OR '
      '    TB_CADASTRO.COD_CIDADE = :CIDADE)'
      '  AND'
      '  (:COD_ESTADO IS NULL'
      '    OR'
      '    TB_CADASTRO.COD_ESTADO = :COD_ESTADO)'
      '  AND'
      '  (:BAIRRO IS NULL'
      '    OR'
      '    TB_CADASTRO.DESC_BAIRRO = :BAIRRO)'
      '  AND'
      '  cod_cadastro NOT in'
      '             (SELECT'
      '                 distinct(TB_NOTA_CAB.COD_CADASTRO)'
      '              FROM'
      '                TB_NOTA_CAB,'
      '                TB_NOTA_ITEM,'
      '                TB_PRODUTO,'
      '                TB_CLASSE,'
      '                TB_VENDEDOR'
      '             WHERE'
      
        '                TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA' +
        '_CAB'
      '                AND'
      
        '                TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUT' +
        'O'
      '                AND'
      
        '                TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDE' +
        'DOR'
      '                AND'
      '                TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '                AND'
      '                TB_NOTA_CAB.IND_SITUACAO = 2'
      '                AND'
      '                TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      '                AND'
      '                TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '                AND'
      '                TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '                AND'
      '                (:COD_VENDEDOR IS NULL'
      '                 OR'
      '                  TB_NOTA_CAB.COD_VENDEDOR = :COD_VENDEDOR)'
      '                AND'
      '                (:FILIAL IS NULL'
      '                  OR'
      '                  TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '                AND'
      '                (:COD_PRODUTO IS NULL'
      '                  OR'
      '                  TB_NOTA_ITEM.COD_PRODUTO = :COD_PRODUTO)'
      '                AND'
      '                (:SUPERVISOR IS NULL'
      '                  OR'
      '                  TB_VENDEDOR.COD_SUPERVISOR = :SUPERVISOR)'
      '                AND'
      '                (:COD_CLASSE IS NULL'
      '                  OR'
      '                  TB_CLASSE.NUM_CLASSE = :COD_CLASSE)'
      '               )'
      
        '    AND ((TB_CADASTRO.DT_CANCELAMENTO IS NULL) AND (TB_CADASTRO.' +
        'COD_MOTIVO IS NULL)) ORDER BY DESC_CIDADE,NOME')
    Variables.Data = {
      030000000C0000000F0000003A434C4153535F434144415354524F0300000000
      000000000000000D0000003A434F445F56454E4445444F520300000000000000
      00000000070000003A444154415F490C0000000000000000000000070000003A
      444154415F460C0000000000000000000000070000003A46494C49414C030000
      0000000000000000000B0000003A434F445F434C415353450300000000000000
      000000000E0000003A5449504F5F434144415354524F03000000000000000000
      0000070000003A4349444144450300000000000000000000000B0000003A5355
      5045525649534F520300000000000000000000000C0000003A434F445F50524F
      4455544F0300000000000000000000000B0000003A434F445F45535441444F05
      0000000000000000000000070000003A42414952524F05000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000C000000434F445F434144415354524F0100000000000400
      00004E4F4D450100000000000D000000444553435F454E44455245434F010000
      0000000A000000434F445F45535441444F0100000000000D000000444553435F
      54454C45464F4E450100000000000B0000004E554D5F4347435F435046010000
      0000000A000000434F445F4349444144450100000000000B000000444553435F
      4349444144450100000000000B000000444553435F42414952524F0100000000
      00}
    ReadOnly = True
    QueryAllRecords = False
    Session = DMOracle.DBCemapa
    OnCalcFields = QRClienteSemCompraCalcFields
    Left = 144
    Top = 8
    object QRClienteSemCompraCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRClienteSemCompraNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRClienteSemCompraDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      Size = 40
    end
    object QRClienteSemCompraCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
    object QRClienteSemCompraDESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 12
    end
    object QRClienteSemCompraNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object QRClienteSemCompraval_venda: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_venda'
      Calculated = True
    end
    object QRClienteSemCompraCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object QRClienteSemCompraDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object QRClienteSemCompraDESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
      Size = 60
    end
  end
  object QRTipoDocumento: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_FILIAL + 0.00 AS COD_FILIAL,'
      '  DESC_FILIAL,'
      '  COD_SERIE,'
      '  COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  SUM(SQT_SAIDA) AS SQT_SAIDA,'
      '  SUM(SVAL_TOTAL_SAIDA) AS SVAL_TOTAL_SAIDA,'
      '  SUM(SQT_ENTRADA) AS SQT_ENTRADA,'
      '  SUM(SVAL_TOTAL_ENTRADA) AS SVAL_TOTAL_ENTRADA'
      'FROM'
      '('
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_nota_cab.COD_SERIE,'
      '    Tb_produto.COD_PRODUTO,'
      '    Tb_produto.DESC_PRODUTO,'
      '    TO_NUMBER('#39'0'#39') AS SQT_SAIDA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_TOTAL_SAIDA,'
      '    SUM(Tb_nota_item.QT_QUANTIDADE) AS SQT_ENTRADA,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SV' +
        'AL_TOTAL_ENTRADA'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_PRODUTO,'
      '    TB_OPERACAO,'
      '    TB_FILIAL'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    TB_OPERACAO.IND_ESTOQUE = '#39'S'#39
      '    AND'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '    AND'
      '    (:SERIE IS NULL OR'
      '     :SERIE = TB_NOTA_CAB.COD_SERIE)'
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_nota_cab.COD_SERIE,'
      '    Tb_produto.COD_PRODUTO,'
      '    Tb_produto.DESC_PRODUTO'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_nota_cab.COD_SERIE,'
      '    Tb_produto.COD_PRODUTO,'
      '    Tb_produto.DESC_PRODUTO,'
      '    SUM(Tb_nota_item.QT_QUANTIDADE) AS SQT_SAIDA,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SV' +
        'AL_TOTAL_SAIDA,'
      '    TO_NUMBER('#39'0'#39') AS SQT_ENTRADA,'
      '    TO_NUMBER('#39'0'#39') AS SVAL_TOTAL_ENTRADA'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_PRODUTO,'
      '    TB_OPERACAO,'
      '    TB_FILIAL'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    TB_OPERACAO.IND_ESTOQUE = '#39'S'#39
      '    AND'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '    AND'
      '    (:SERIE IS NULL OR'
      '     :SERIE = TB_NOTA_CAB.COD_SERIE)'
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    Tb_nota_cab.COD_SERIE,'
      '    Tb_produto.COD_PRODUTO,'
      '    Tb_produto.DESC_PRODUTO'
      ')'
      ''
      'GROUP BY'
      '  COD_FILIAL,'
      '  DESC_FILIAL,'
      '  COD_SERIE,'
      '  COD_PRODUTO,'
      '  DESC_PRODUTO')
    Variables.Data = {
      0300000004000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000070000003A46494C4941
      4C030000000000000000000000060000003A5345524945050000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000A000000434F445F46494C49414C0100000000000B000000
      444553435F46494C49414C01000000000009000000434F445F53455249450100
      000000000B000000434F445F50524F4455544F0100000000000C000000444553
      435F50524F4455544F010000000000090000005351545F534149444101000000
      0000100000005356414C5F544F54414C5F53414944410100000000000B000000
      5351545F454E5452414441010000000000120000005356414C5F544F54414C5F
      454E5452414441010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 72
    object QRTipoDocumentoCOD_FILIAL: TFloatField
      FieldName = 'COD_FILIAL'
    end
    object QRTipoDocumentoDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRTipoDocumentoCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Size = 3
    end
    object QRTipoDocumentoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRTipoDocumentoSQT_SAIDA: TFloatField
      FieldName = 'SQT_SAIDA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRTipoDocumentoSVAL_TOTAL_SAIDA: TFloatField
      FieldName = 'SVAL_TOTAL_SAIDA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRTipoDocumentoSQT_ENTRADA: TFloatField
      FieldName = 'SQT_ENTRADA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRTipoDocumentoSVAL_TOTAL_ENTRADA: TFloatField
      FieldName = 'SVAL_TOTAL_ENTRADA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRTipoDocumentoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
  end
  object QRBloqueto: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_banco_agencia.DESC_LOCAL_PGTO_BLOQ,'
      '  Tb_banco_agencia.DESC_INSTRUCAO_BLOQUETO,'
      '  Tb_banco_agencia.IND_TIPO_JURO,'
      '  Tb_banco_agencia.PERC_JURO_BLOQUETO,'
      '  Tb_conta_receber_cab.DT_VENCIMENTO,'
      '  Tb_conta_receber_cab.VAL_TITULO,'
      '  Tb_conta_receber_cab.DT_EMISSAO,'
      '  Tb_conta_receber_cab.NUM_TITULO,'
      '  Tb_conta_receber_cab.NUM_PARCELA,'
      '  Tb_conta_receber_cab.DESC_TIPO_DOCUMENTO,'
      '  TB_CADASTRO.NOME AS NOME_SACADO,'
      '  TB_CADASTRO.DESC_ENDERECO,'
      '  TB_CADASTRO.DESC_CIDADE,'
      '  TB_CADASTRO.COD_ESTADO'
      'FROM'
      '  TB_CADASTRO,'
      '  TB_CONTA_RECEBER_CAB,'
      '  TB_BANCO_AGENCIA'
      'WHERE'
      '  TB_CONTA_RECEBER_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      
        '  Tb_banco_agencia.COD_BANCO_AGENCIA = Tb_conta_receber_cab.COD_' +
        'BANCO_AGENCIA'
      '  AND'
      '  TB_CONTA_RECEBER_CAB.COD_NOTA_CAB = :COD_NOTA_CAB')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E00000014000000444553435F4C4F43414C5F5047544F5F424C4F51
      01000000000017000000444553435F494E5354525543414F5F424C4F51554554
      4F0100000000000D000000494E445F5449504F5F4A55524F0100000000001200
      0000504552435F4A55524F5F424C4F515545544F0100000000000D0000004454
      5F56454E43494D454E544F0100000000000A00000056414C5F544954554C4F01
      00000000000A00000044545F454D495353414F0100000000000A0000004E554D
      5F544954554C4F0100000000000B0000004E554D5F50415243454C4101000000
      000013000000444553435F5449504F5F444F43554D454E544F0100000000000B
      0000004E4F4D455F53414341444F0100000000000D000000444553435F454E44
      455245434F0100000000000B000000444553435F434944414445010000000000
      0A000000434F445F45535441444F010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRBloquetoCalcFields
    Left = 40
    Top = 8
    object QRBloquetoDESC_LOCAL_PGTO_BLOQ: TStringField
      FieldName = 'DESC_LOCAL_PGTO_BLOQ'
      Size = 50
    end
    object QRBloquetoDESC_INSTRUCAO_BLOQUETO: TStringField
      FieldName = 'DESC_INSTRUCAO_BLOQUETO'
      Size = 250
    end
    object QRBloquetoIND_TIPO_JURO: TStringField
      FieldName = 'IND_TIPO_JURO'
      Size = 12
    end
    object QRBloquetoDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object QRBloquetoPERC_JURO_BLOQUETO: TFloatField
      FieldName = 'PERC_JURO_BLOQUETO'
    end
    object QRBloquetoVAL_TITULO: TFloatField
      FieldName = 'VAL_TITULO'
    end
    object QRBloquetoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QRBloquetoNUM_TITULO: TIntegerField
      FieldName = 'NUM_TITULO'
    end
    object QRBloquetoNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object QRBloquetoDESC_TIPO_DOCUMENTO: TStringField
      FieldName = 'DESC_TIPO_DOCUMENTO'
      Size = 3
    end
    object QRBloquetoNOME_SACADO: TStringField
      FieldName = 'NOME_SACADO'
      Required = True
      Size = 50
    end
    object QRBloquetoDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      Size = 40
    end
    object QRBloquetoDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object QRBloquetoCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
    object QRBloquetoinstrucao_juro: TStringField
      FieldKind = fkCalculated
      FieldName = 'instrucao_juro'
      Size = 50
      Calculated = True
    end
  end
  object QRFutura_Cliente: TOracleDataSet1
    SQL.Strings = (
      
        '/*  SQL est'#225' sendo utilizado diretamento no fonte do formulario.' +
        ' */'
      'SELECT'
      '  Tb_nota_aux.QT_ATENDIDO,'
      '  Tb_nota_aux.QT_CANCELADO,'
      '  Tb_nota_aux.QT_DEVOLVIDO,'
      '  Tb_nota_aux.QT_NOTA_ITEM,'
      '  Tb_nota_aux.IND_TIPO,'
      '  Tb_produto.COD_PRODUTO,'
      '  Tb_produto.DESC_PRODUTO,'
      '  Tb_produto.IND_TIPO_PRODUTO,'
      '  Tb_produto.NUM_EMBALAGEM,'
      '  Tb_nota_cab.NUM_NOTA,'
      '  Tb_nota_cab.COD_SERIE,'
      '  Tb_nota_cab.VAL_FUNRURAL,'
      
        '  DECODE(TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO,NULL,TB_NOTA_CAB.CO' +
        'D_CADASTRO,TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO) AS COD_CADASTRO,'
      '  TB_LOTE_TIPO.DESC_LOTE,'
      '  Tb_nota_cab.DT_EMISSAO,'
      '  Tb_nota_item.COD_LOTE_TIPO,'
      '  Tb_nota_item.VAL_UNITARIO,'
      '  NVL(Tb_nota_item.VAL_DESCONTO,0) AS VAL_DESCONTO,'
      '  tb_vendedor.nome as nome_vendedor,'
      '  TB_CADASTRO.NOME as NOME_CLIENTE,'
      '  TB_NOTA_ITEM.VAL_ICMS_SUBST'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_NOTA_AUX,'
      '  TB_VENDEDOR,'
      '  TB_PRODUTO,'
      '  TB_LOTE_TIPO,'
      '  TB_CADASTRO'
      'WHERE'
      '    TB_LOTE_TIPO.COD_LOTE_TIPO = TB_NOTA_ITEM.COD_LOTE_TIPO'
      '   AND'
      '    Tb_nota_item.COD_NOTA_ITEM = Tb_nota_aux.COD_NOTA_ITEM'
      '   AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '   AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '   AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '   AND'
      
        '    TB_CADASTRO.COD_CADASTRO = DECODE(TB_NOTA_CAB.COD_ARMAZEM_AL' +
        'FANDEGADO,NULL,TB_NOTA_CAB.COD_CADASTRO,TB_NOTA_CAB.COD_ARMAZEM_' +
        'ALFANDEGADO)'
      '   AND'
      '    QT_NOTA_ITEM > (QT_ATENDIDO+QT_CANCELADO+QT_DEVOLVIDO)'
      '   AND'
      '    Tb_nota_aux.IND_TIPO = :IND_TIPO'
      '   AND'
      '    Tb_nota_cab.DT_RECEBIMENTO >= :DATA_I'
      '   AND'
      '    Tb_nota_cab.DT_RECEBIMENTO <= :DATA_F'
      '   AND'
      '    (:CADASTRO IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_CADASTRO = :CADASTRO)'
      '   AND'
      '    (:FILIAL IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '   AND'
      '    (:PRODUTO IS NULL'
      '     OR'
      '      TB_NOTA_ITEM.COD_PRODUTO = :PRODUTO)'
      '   AND'
      '    (:LOTE IS NULL'
      '     OR'
      '      TB_NOTA_ITEM.COD_LOTE_TIPO = :LOTE)'
      'ORDER BY'
      '  Tb_nota_cab.COD_CADASTRO,'
      '  Tb_nota_cab.NUM_NOTA'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    QBEDefinition.QBEFieldDefs = {
      04000000150000000B00000051545F4154454E4449444F0100000000000C0000
      0051545F43414E43454C41444F0100000000000C00000051545F4445564F4C56
      49444F0100000000000C00000051545F4E4F54415F4954454D01000000000008
      000000494E445F5449504F0100000000000B000000434F445F50524F4455544F
      0100000000000C000000444553435F50524F4455544F01000000000008000000
      4E554D5F4E4F544101000000000009000000434F445F53455249450100000000
      000C000000434F445F434144415354524F01000000000009000000444553435F
      4C4F54450100000000000A00000044545F454D495353414F0100000000000D00
      0000434F445F4C4F54455F5449504F0100000000000C00000056414C5F554E49
      544152494F01000000000010000000494E445F5449504F5F50524F4455544F01
      00000000000D0000004E554D5F454D42414C4147454D0100000000000C000000
      56414C5F444553434F4E544F0100000000000C00000056414C5F46554E525552
      414C0100000000000D0000004E4F4D455F56454E4445444F520100000000000C
      0000004E4F4D455F434C49454E54450100000000000E00000056414C5F49434D
      535F5355425354010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRFutura_ClienteCalcFields
    Left = 576
    Top = 120
    object QRFutura_ClienteQT_ATENDIDO: TFloatField
      FieldName = 'QT_ATENDIDO'
      Required = True
    end
    object QRFutura_ClienteQT_CANCELADO: TFloatField
      FieldName = 'QT_CANCELADO'
      Required = True
    end
    object QRFutura_ClienteQT_DEVOLVIDO: TFloatField
      FieldName = 'QT_DEVOLVIDO'
      Required = True
    end
    object QRFutura_ClienteQT_NOTA_ITEM: TFloatField
      FieldName = 'QT_NOTA_ITEM'
      Required = True
    end
    object QRFutura_ClienteIND_TIPO: TStringField
      FieldName = 'IND_TIPO'
      Required = True
      Size = 7
    end
    object QRFutura_ClienteCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRFutura_ClienteNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRFutura_ClienteCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QRFutura_ClienteDESC_LOTE: TStringField
      FieldName = 'DESC_LOTE'
    end
    object QRFutura_ClienteDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRFutura_ClienteCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
      Required = True
    end
    object QRFutura_ClienteVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
    end
    object QRFutura_ClienteIND_TIPO_PRODUTO: TStringField
      FieldName = 'IND_TIPO_PRODUTO'
      Required = True
      Size = 10
    end
    object QRFutura_ClienteNUM_EMBALAGEM: TFloatField
      FieldName = 'NUM_EMBALAGEM'
    end
    object QRFutura_ClienteDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRFutura_ClienteVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
    end
    object QRFutura_ClienteVAL_FUNRURAL: TFloatField
      FieldName = 'VAL_FUNRURAL'
      Required = True
    end
    object QRFutura_ClienteNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Required = True
      Size = 40
    end
    object QRFutura_Clientenome: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome'
      Size = 50
      Calculated = True
    end
    object QRFutura_ClienteCOD_CADASTRO: TFloatField
      FieldName = 'COD_CADASTRO'
    end
    object QRFutura_ClienteVAL_ICMS_SUBST: TFloatField
      FieldName = 'VAL_ICMS_SUBST'
    end
  end
  object QRMovEstoque: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  DISTINCT'
      '  NUM_NOTA+0.00 AS NUM_NOTA,'
      '  COD_SERIE,'
      '  DT_RECEBIMENTO,'
      '  DT_EMISSAO,'
      '  COD_OPERACAO,'
      '  DESC_LOTE,'
      '  DESC_PRODUTO,'
      '  NUM_FABRICANTE,'
      '  QT_QUANTIDADE,'
      '  QT_CHEGADA,'
      '  VAL_TOTAL,'
      '  VAL_TOTAL_NOTA,'
      '  VAL_CUSTO_SQL,'
      '  COD_PRODUTO,'
      '  IND_ESTOQUE,'
      '  NOME,'
      '  DESC_PLACA,'
      '  cod_nota_item,'
      '  IND_ENTRADA_SAIDA,'
      '  QT_POR_M3'
      'FROM('
      ' SELECT '
      '  TB_OBRA_REQ_CAB.NUM_REQUISICAO+0.00 AS NUM_NOTA,'
      '  '#39'REQ'#39' AS COD_SERIE,'
      '  TB_OBRA_REQ_CAB.DT_EMISSAO, '
      '  TB_OBRA_REQ_CAB.DT_EMISSAO AS DT_RECEBIMENTO,'
      '  TB_OBRA_REQ_CAB.COD_OPERACAO,'
      '  TB_LOTE_TIPO.DESC_LOTE,'
      '  Tb_produto.DESC_PRODUTO,'
      '  TB_PRODUTO.NUM_FABRICANTE,'
      
        '  DECODE(TB_OPERACAO.IND_TIPO_OPERACAO,'#39'S'#39',TB_OBRA_REQ_ITEM.QT_Q' +
        'UANTIDADE * -1,TB_OBRA_REQ_ITEM.QT_QUANTIDADE) AS QT_QUANTIDADE,'
      '  0 AS QT_CHEGADA,'
      
        '  DECODE(TB_OPERACAO.IND_TIPO_OPERACAO,'#39'S'#39',(TB_OBRA_REQ_ITEM.VAL' +
        '_UNITARIO * TB_OBRA_REQ_ITEM.QT_QUANTIDADE) *-1,(TB_OBRA_REQ_ITE' +
        'M.VAL_UNITARIO * TB_OBRA_REQ_ITEM.QT_QUANTIDADE))  AS VAL_TOTAL,'
      
        '  DECODE(TB_OPERACAO.IND_TIPO_OPERACAO,'#39'S'#39',(TB_OBRA_REQ_ITEM.VAL' +
        '_UNITARIO * TB_OBRA_REQ_ITEM.QT_QUANTIDADE) *-1,(TB_OBRA_REQ_ITE' +
        'M.VAL_UNITARIO * TB_OBRA_REQ_ITEM.QT_QUANTIDADE)) AS VAL_TOTAL_N' +
        'OTA,    '
      '  TB_ESTOQUE.VL_CUSTO_MEDIO AS VAL_CUSTO_SQL,'
      '  TB_OBRA_REQ_ITEM.COD_PRODUTO,'
      '  '#39#39' AS IND_ESTOQUE,'
      '  TB_CADASTRO.NOME,'
      '  '#39#39' AS DESC_PLACA,'
      '  0 as cod_nota_item,'
      '  TB_OPERACAO.IND_TIPO_OPERACAO as IND_ENTRADA_SAIDA,'
      '  DECODE('
      '    NVL(TB_PRODUTO.NUM_METROS_CUBICOS,0),'
      '    0,'
      '    0,'
      '    DECODE('
      '      TB_OPERACAO.IND_TIPO_OPERACAO,'
      '      '#39'S'#39','
      
        '      (TB_OBRA_REQ_ITEM.QT_QUANTIDADE * -1)/TB_PRODUTO.NUM_METRO' +
        'S_CUBICOS,'
      
        '      TB_OBRA_REQ_ITEM.QT_QUANTIDADE/TB_PRODUTO.NUM_METROS_CUBIC' +
        'OS'
      '    )'
      '  ) as QT_POR_M3'
      'FROM'
      '  TB_OBRA_REQ_CAB,'
      '  TB_OBRA_REQ_ITEM,'
      '  TB_PRODUTO,'
      '  TB_ESTOQUE,'
      '  TB_CADASTRO,'
      '  TB_OPERACAO,'
      '  TB_LOTE_TIPO,'
      '  TB_CLASSE,'
      '  TB_CLASSE C2'
      'WHERE'
      '  TB_CLASSE.NUM_CLASSE = C2.NUM_CLASSE'
      '  AND'
      '  (TB_CLASSE.NUM_SUBCLASSE = 0'
      '    OR TB_CLASSE.NUM_SUBCLASSE = C2.NUM_SUBCLASSE)'
      '  AND'
      
        '  TB_OBRA_REQ_CAB.COD_OBRA_REQ_CAB = TB_OBRA_REQ_ITEM.COD_OBRA_R' +
        'EQ_CAB'
      '  AND'
      '  TB_OBRA_REQ_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      '  TB_OBRA_REQ_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_OBRA_REQ_CAB.COD_FILIAL = TB_ESTOQUE.COD_FILIAL'
      '  AND'
      '  TB_OBRA_REQ_ITEM.COD_PRODUTO = TB_ESTOQUE.COD_PRODUTO'
      '  AND'
      '  TB_OBRA_REQ_ITEM.COD_LOTE_TIPO = TB_ESTOQUE.COD_LOTE_TIPO'
      '  AND'
      '  (TB_OBRA_REQ_ITEM.COD_LOTE_TIPO = TB_LOTE_TIPO.COD_LOTE_TIPO)'
      '  AND'
      '  TB_OBRA_REQ_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '  AND'
      '  TB_OBRA_REQ_CAB.IND_SITUACAO = 2'
      '  AND'
      '  (:COD_OPERACAO Is Null'
      '   OR'
      '    TB_OBRA_REQ_CAB.COD_OPERACAO = :COD_OPERACAO)'
      '  AND'
      '  (:CADASTRO IS NULL'
      '   OR'
      '    TB_OBRA_REQ_CAB.COD_CADASTRO = :CADASTRO)'
      '  AND'
      '  (:CIDADE IS NULL'
      '   OR'
      '    TB_CADASTRO.COD_CIDADE = :CIDADE)'
      '--  AND'
      '--  :CADASTRO_PARCEIRO'
      '  AND'
      '  (:FILIAL IS NULL'
      '   OR'
      '    TB_OBRA_REQ_CAB.COD_FILIAL = :FILIAL)'
      '  AND'
      '  (:PRODUTO IS NULL'
      '   OR'
      '    TB_OBRA_REQ_ITEM.COD_PRODUTO = :PRODUTO)'
      '  AND'
      '  (TB_PRODUTO.COD_CLASSE = C2.COD_CLASSE)'
      '  AND'
      '  (:LOTE IS NULL'
      '   OR'
      '   TB_OBRA_REQ_ITEM.COD_LOTE_TIPO = :LOTE)'
      '  AND'
      '  (:TIPO_PRODUTO IS NULL'
      '   OR'
      '   TB_PRODUTO.IND_TIPO_PRODUTO = :TIPO_PRODUTO)'
      '   AND'
      '  (:CLASSE IS NULL'
      '   OR'
      '   :CLASSE = TB_CLASSE.COD_CLASSE)'
      '  AND'
      '  (:FORNECEDOR IS NULL'
      '   OR'
      '    TB_PRODUTO.COD_CADASTRO = :FORNECEDOR)'
      '  AND'
      '  (:IND_FISICA_JURIDICA IS NULL'
      '   OR'
      '    TB_CADASTRO.IND_FISICA_JURIDICA = :IND_FISICA_JURIDICA)'
      '  AND'
      '  (TB_OBRA_REQ_CAB.DT_EMISSAO >= :DATA_I)'
      '  AND'
      '  (TB_OBRA_REQ_CAB.DT_EMISSAO <= :DATA_F)'
      '  AND'
      '  (:TIPO_NOTA IS NULL'
      '   OR'
      '    TB_OPERACAO.IND_TIPO_OPERACAO = :TIPO_NOTA)'
      ''
      'UNION ALL'
      ''
      'SELECT'
      '  Tb_nota_cab.NUM_NOTA+0.00 AS NUM_NOTA,'
      '  Tb_nota_cab.COD_SERIE,'
      '  Tb_nota_cab.DT_RECEBIMENTO,'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      '  Tb_nota_cab.COD_OPERACAO,'
      '  Tb_lote_tipo.DESC_LOTE,'
      '  Tb_produto.DESC_PRODUTO,'
      '  TB_PRODUTO.NUM_FABRICANTE,'
      
        '  DECODE(Tb_nota_cab.IND_ENTRADA_SAIDA,'#39'S'#39',Tb_nota_item.QT_QUANT' +
        'IDADE * -1,Tb_nota_item.QT_QUANTIDADE) AS QT_QUANTIDADE,'
      
        '  DECODE(Tb_nota_cab.IND_ENTRADA_SAIDA,'#39'S'#39',Tb_nota_item.QT_CHEGA' +
        'DA * -1,Tb_nota_item.QT_CHEGADA) AS QT_CHEGADA,'
      '  CASE'
      
        '    WHEN ((TB_TRIBUTACAO.DESC_SITUACAO_TRIB LIKE '#39'%60'#39' OR TB_TRI' +
        'BUTACAO.DESC_CSOSN LIKE '#39'500'#39')'
      
        '        AND (TB_CADASTRO.IND_FISICA_JURIDICA = '#39'J'#39' AND TB_CADAST' +
        'RO.NUM_INSCRICAO IS NOT NULL AND TB_CADASTRO.NUM_INSCRICAO <> '#39'I' +
        'SENTO'#39
      '        AND TB_CADASTRO.IND_CONTRIBUINTE = '#39'SIM'#39')) THEN    '
      
        '            DECODE(Tb_nota_cab.IND_ENTRADA_SAIDA,'#39'S'#39',(Tb_nota_it' +
        'em.VAL_TOTAL+Tb_nota_item.VAL_IPI+TB_NOTA_ITEM.VAL_ICMS_SUBST+Tb' +
        '_nota_item.VAL_FRETE+Tb_nota_item.VAL_Despesas- PEGA_DESCONTO_IT' +
        'EM(TB_NOTA_ITEM.COD_NOTA_ITEM))* -1,Tb_nota_item.VAL_TOTAL+Tb_no' +
        'ta_item.VAL_IPI+Tb_nota_item.VAL_FRETE+Tb_nota_item.VAL_Despesas' +
        '- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM))'
      '        ELSE            '
      
        '            DECODE(Tb_nota_cab.IND_ENTRADA_SAIDA,'#39'S'#39',(Tb_nota_it' +
        'em.VAL_TOTAL+Tb_nota_item.VAL_IPI+TB_NOTA_ITEM.VAL_ICMS_SUBST+Tb' +
        '_nota_item.VAL_FRETE+Tb_nota_item.VAL_Despesas- PEGA_DESCONTO_IT' +
        'EM(TB_NOTA_ITEM.COD_NOTA_ITEM))* -1,Tb_nota_item.VAL_TOTAL+Tb_no' +
        'ta_item.VAL_IPI+TB_NOTA_ITEM.VAL_ICMS_SUBST+Tb_nota_item.VAL_FRE' +
        'TE+Tb_nota_item.VAL_Despesas- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.CO' +
        'D_NOTA_ITEM))'
      '  END AS VAL_TOTAL,'
      '  CASE'
      
        '    WHEN ((TB_TRIBUTACAO.DESC_SITUACAO_TRIB LIKE '#39'%60'#39' OR TB_TRI' +
        'BUTACAO.DESC_CSOSN LIKE '#39'500'#39')'
      
        '        AND (TB_CADASTRO.IND_FISICA_JURIDICA = '#39'J'#39' AND TB_CADAST' +
        'RO.NUM_INSCRICAO IS NOT NULL AND TB_CADASTRO.NUM_INSCRICAO <> '#39'I' +
        'SENTO'#39
      '        AND TB_CADASTRO.IND_CONTRIBUINTE = '#39'SIM'#39')) THEN    '
      
        '            DECODE(Tb_nota_cab.IND_ENTRADA_SAIDA,'#39'S'#39',(Tb_nota_it' +
        'em.VAL_TOTAL+Tb_nota_item.VAL_IPI+TB_NOTA_ITEM.VAL_ICMS_SUBST+Tb' +
        '_nota_item.VAL_Despesas- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOT' +
        'A_ITEM))* -1,Tb_nota_item.VAL_TOTAL+Tb_nota_item.VAL_IPI+Tb_nota' +
        '_item.VAL_Despesas- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITE' +
        'M))'
      '        ELSE            '
      
        '            DECODE(Tb_nota_cab.IND_ENTRADA_SAIDA,'#39'S'#39',(Tb_nota_it' +
        'em.VAL_TOTAL+Tb_nota_item.VAL_IPI+TB_NOTA_ITEM.VAL_ICMS_SUBST+Tb' +
        '_nota_item.VAL_Despesas- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOT' +
        'A_ITEM))* -1,Tb_nota_item.VAL_TOTAL+Tb_nota_item.VAL_IPI+TB_NOTA' +
        '_ITEM.VAL_ICMS_SUBST+Tb_nota_item.VAL_Despesas- PEGA_DESCONTO_IT' +
        'EM(TB_NOTA_ITEM.COD_NOTA_ITEM))'
      '  END AS VAL_TOTAL_NOTA,'
      '  DECODE('
      
        '    :IND_MOSTRA_VAL_CUSTO, /*USADO PARA MOSTRAR O VALOR DE CUSTO' +
        ' OU O VALOR DE VENDA*/'
      '    '#39'SIM'#39','
      '    DECODE('
      '      Tb_nota_cab.IND_ENTRADA_SAIDA,'
      '      '#39'S'#39','
      '      Tb_nota_item.VAL_CUSTO,'
      
        '      DECODE(TB_NOTA_ITEM.QT_QUANTIDADE,0,0,Tb_nota_item.VAL_CUS' +
        'TO  / Tb_nota_item.QT_QUANTIDADE))'
      '     /*SE FOR PARA NAO MOSTRAR VALOR DE CUSTO ENTRA AQUI*/'
      '    ,TB_NOTA_ITEM.VAL_UNITARIO) AS VAL_CUSTO_SQL,'
      '  Tb_nota_item.COD_PRODUTO,'
      '  Tb_operacao.IND_ESTOQUE,'
      '  Tb_cadastro.NOME,'
      ' TB_NOTA_CAB.DESC_PLACA,'
      ' TB_NOTA_ITEM.COD_NOTA_ITEM,'
      '  TB_NOTA_CAB.IND_ENTRADA_SAIDA,'
      '  DECODE('
      '    NVL(TB_PRODUTO.NUM_METROS_CUBICOS,0),'
      '    0,'
      '    0,'
      '    DECODE('
      '      Tb_nota_cab.IND_ENTRADA_SAIDA,'
      '      '#39'S'#39','
      
        '      (Tb_nota_item.QT_QUANTIDADE * -1)/TB_PRODUTO.NUM_METROS_CU' +
        'BICOS,'
      '      Tb_nota_item.QT_QUANTIDADE/TB_PRODUTO.NUM_METROS_CUBICOS'
      '    )'
      '  ) as QT_POR_M3'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_CADASTRO,'
      '  TB_PRODUTO,'
      '  TB_LOTE_TIPO,'
      '  TB_OPERACAO,'
      '  TB_PARAM_SISTEMA,'
      '  TB_TRIBUTACAO,'
      '  TB_CLASSE,'
      '  TB_CLASSE C2'
      'WHERE'
      '  TB_CLASSE.NUM_CLASSE = C2.NUM_CLASSE'
      '  AND'
      '  (TB_CLASSE.NUM_SUBCLASSE = 0'
      '    OR TB_CLASSE.NUM_SUBCLASSE = C2.NUM_SUBCLASSE)'
      '  AND'
      '  TB_NOTA_ITEM.COD_TRIBUTACAO = TB_TRIBUTACAO.COD_TRIBUTACAO'
      '  AND'
      '  (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)'
      '  AND'
      '  (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)'
      '  AND'
      '  (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO)'
      '  AND'
      '  (Tb_nota_item.COD_LOTE_TIPO = Tb_lote_tipo.COD_LOTE_TIPO)'
      '  AND'
      '  (Tb_nota_cab.COD_CADASTRO = Tb_Cadastro.COD_CADASTRO)'
      '  AND'
      '  (Tb_produto.COD_CLASSE = C2.COD_CLASSE)'
      '  AND'
      '  (Tb_nota_cab.IND_SITUACAO = '#39'2'#39')'
      '  AND'
      '  (:IND_ESTOQUE Is Null'
      '   OR'
      '    Tb_operacao.IND_ESTOQUE = :IND_ESTOQUE)'
      '  AND'
      '  (:COD_OPERACAO Is Null'
      '   OR'
      '    Tb_nota_cab.COD_OPERACAO = :COD_OPERACAO)'
      '  AND'
      '  (:TIPO_NOTA IS NULL'
      '   OR'
      '    Tb_nota_cab.IND_ENTRADA_SAIDA = :TIPO_NOTA)'
      '  AND'
      '  (:CADASTRO IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_CADASTRO = :CADASTRO)'
      '  AND'
      '  (:CIDADE IS NULL'
      '   OR'
      '    TB_CADASTRO.COD_CIDADE = :CIDADE)'
      '--  AND'
      '--  :CADASTRO_PARCEIRO'
      '  AND'
      '  (:FILIAL IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '  AND'
      '  (:COD_DEPARTAMENTO IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_DEPARTAMENTO = :COD_DEPARTAMENTO)'
      '  AND'
      '  (:PRODUTO IS NULL'
      '   OR'
      '    TB_NOTA_ITEM.COD_PRODUTO = :PRODUTO)'
      '  AND'
      '  (:LOTE IS NULL'
      '   OR'
      '   TB_NOTA_ITEM.COD_LOTE_TIPO = :LOTE)'
      '  AND'
      '  (:TIPO_PRODUTO IS NULL'
      '   OR'
      '   TB_PRODUTO.IND_TIPO_PRODUTO = :TIPO_PRODUTO)'
      '  AND'
      '  (:CLASSE IS NULL'
      '   OR'
      '   :CLASSE = TB_CLASSE.COD_CLASSE)'
      '  AND'
      '  (:VENDEDOR IS NULL'
      '    OR'
      '    TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '  AND'
      '  (:SERIE IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_SERIE = :SERIE)'
      '  AND'
      '  (:NUM_DCO IS NULL'
      '   OR'
      '    TB_NOTA_CAB.NUM_DCO = :NUM_DCO)'
      '  AND'
      '  (:FORNECEDOR IS NULL'
      '   OR'
      '    TB_PRODUTO.COD_CADASTRO = :FORNECEDOR)'
      '  AND'
      '  (:COD_ARMAZEM_ALFANDEGADO IS NULL'
      '   OR'
      
        '    TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO = :COD_ARMAZEM_ALFANDEGA' +
        'DO)'
      '  AND'
      '  (:COD_CONTRATO_VEND IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_CONTRATO_VEND = :COD_CONTRATO_VEND)'
      '  AND'
      '  (:IND_FISICA_JURIDICA IS NULL'
      '   OR'
      '    TB_CADASTRO.IND_FISICA_JURIDICA = :IND_FISICA_JURIDICA)'
      '  AND'
      '  (:COD_ESTADO IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_ESTADO = :COD_ESTADO)'
      '  AND'
      '  (Tb_nota_cab.DT_RECEBIMENTO >= :DATA_I)'
      '  AND'
      '  (Tb_nota_cab.DT_RECEBIMENTO <= :DATA_F)'
      ')')
    Variables.Data = {
      0300000016000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000090000003A4341444153
      54524F030000000000000000000000070000003A46494C49414C030000000000
      000000000000080000003A50524F4455544F0300000000000000000000000500
      00003A4C4F54450300000000000000000000000A0000003A5449504F5F4E4F54
      410500000000000000000000000D0000003A5449504F5F50524F4455544F0500
      000000000000000000000C0000003A494E445F4553544F515545050000000000
      0000000000000D0000003A434F445F4F5045524143414F030000000000000000
      000000090000003A56454E4445444F5203000000000000000000000007000000
      3A434C41535345030000000000000000000000060000003A5345524945050000
      000000000000000000080000003A4E554D5F44434F0500000000000000000000
      000B0000003A464F524E454345444F5203000000000000000000000012000000
      3A434F445F434F4E545241544F5F56454E440300000000000000000000001500
      00003A494E445F4D4F535452415F56414C5F435553544F050000000000000000
      000000140000003A494E445F4649534943415F4A555249444943410500000000
      00000000000000180000003A434F445F41524D415A454D5F414C46414E444547
      41444F030000000000000000000000110000003A434F445F444550415254414D
      454E544F030000000000000000000000070000003A4349444144450300000000
      000000000000000B0000003A434F445F45535441444F05000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      0400000014000000080000004E554D5F4E4F544101000000000009000000434F
      445F53455249450100000000000E00000044545F5245434542494D454E544F01
      00000000000C000000434F445F4F5045524143414F0100000000000900000044
      4553435F4C4F54450100000000000C000000444553435F50524F4455544F0100
      000000000D00000051545F5155414E5449444144450100000000000900000056
      414C5F544F54414C0100000000000B000000434F445F50524F4455544F010000
      0000000B000000494E445F4553544F515545010000000000040000004E4F4D45
      0100000000000A00000051545F434845474144410100000000000A0000004445
      53435F504C4143410100000000000E00000056414C5F544F54414C5F4E4F5441
      0100000000000D00000056414C5F435553544F5F53514C0100000000000A0000
      0044545F454D495353414F0100000000000E0000004E554D5F46414252494341
      4E54450100000000000D000000434F445F4E4F54415F4954454D010000000000
      11000000494E445F454E54524144415F53414944410100000000000900000051
      545F504F525F4D33010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRMovEstoqueCalcFields
    Left = 576
    Top = 72
    object QRMovEstoqueCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QRMovEstoqueDT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
    end
    object QRMovEstoqueCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
      Required = True
    end
    object QRMovEstoqueDESC_LOTE: TStringField
      FieldName = 'DESC_LOTE'
    end
    object QRMovEstoqueQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QRMovEstoqueVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
      Required = True
    end
    object QRMovEstoqueIND_ESTOQUE: TStringField
      FieldName = 'IND_ESTOQUE'
      Required = True
      Size = 1
    end
    object QRMovEstoqueNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRMovEstoqueQT_CHEGADA: TFloatField
      FieldName = 'QT_CHEGADA'
    end
    object QRMovEstoqueDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRMovEstoqueDESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Size = 8
    end
    object QRMovEstoqueVAL_TOTAL_NOTA: TFloatField
      FieldName = 'VAL_TOTAL_NOTA'
      DisplayFormat = '#,##0.00'
    end
    object QRMovEstoqueVAL_CUSTO_SQL: TFloatField
      FieldName = 'VAL_CUSTO_SQL'
    end
    object QRMovEstoqueval_custo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_custo'
      Calculated = True
    end
    object QRMovEstoqueDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QRMovEstoqueNUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
      Size = 21
    end
    object QRMovEstoqueNUM_NOTA: TFloatField
      FieldName = 'NUM_NOTA'
    end
    object QRMovEstoqueCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRMovEstoqueIND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 1
    end
    object QRMovEstoqueQT_POR_M3: TFloatField
      FieldName = 'QT_POR_M3'
    end
  end
  object QRFutura: TOracleDataSet1
    SQL.Strings = (
      '/* SQL Diretamente no fonte do form */'
      'SELECT'
      '  Tb_nota_aux.QT_ATENDIDO,'
      '  Tb_nota_aux.QT_CANCELADO,'
      '  Tb_nota_aux.QT_DEVOLVIDO,'
      '  Tb_nota_aux.QT_NOTA_ITEM,'
      '  Tb_nota_aux.IND_TIPO,'
      '  Tb_produto.DESC_PRODUTO,'
      '  Tb_produto.IND_TIPO_PRODUTO,'
      '  Tb_produto.NUM_EMBALAGEM,'
      '  Tb_nota_cab.NUM_NOTA,'
      
        '  DECODE(TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO,NULL,TB_NOTA_CAB.CO' +
        'D_CADASTRO,TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO) AS COD_CADASTRO,'
      '  Tb_nota_cab.COD_SERIE,'
      '  Tb_nota_Cab.VAL_FUNRURAL,'
      '  Tb_cadastro.NOME,'
      '  TB_NOTA_ITEM.COD_LOTE_TIPO,'
      '  Tb_nota_item.VAL_UNITARIO'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_NOTA_AUX,'
      '  TB_PRODUTO,'
      '  TB_CADASTRO,'
      '  TB_CLASSE'
      'WHERE'
      '   Tb_nota_item.COD_NOTA_ITEM = Tb_nota_aux.COD_NOTA_ITEM'
      '   AND'
      '   Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '   AND'
      '   Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO'
      '   AND'
      '   Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '   AND'
      '   TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '   AND'
      '   QT_NOTA_ITEM > (QT_ATENDIDO+QT_CANCELADO+QT_DEVOLVIDO)'
      '   AND'
      '   Tb_nota_aux.IND_TIPO = :IND_TIPO'
      '   AND'
      '   (:CADASTRO IS NULL'
      '     OR'
      '     TB_NOTA_CAB.COD_CADASTRO = :CADASTRO)'
      '   AND'
      '   (:FILIAL IS NULL'
      '     OR'
      '     TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '   AND'
      '   (:PRODUTO IS NULL'
      '     OR'
      '     TB_NOTA_ITEM.COD_PRODUTO = :PRODUTO)'
      '   AND'
      '   (:LOTE IS NULL'
      '     OR'
      '     TB_NOTA_ITEM.COD_LOTE_TIPO = :LOTE)'
      '   AND'
      '   (:CLASSE IS NULL'
      '    OR'
      '     TB_CLASSE.NUM_CLASSE =:CLASSE)'
      '   AND'
      '   (:SUBCLASSE IS NULL'
      '    OR'
      '     TB_CLASSE.NUM_SUBCLASSE =:SUBCLASSE)'
      '   AND'
      '   Tb_nota_cab.DT_RECEBIMENTO >= :DATA_I'
      '   AND'
      '   Tb_nota_cab.DT_RECEBIMENTO <= :DATA_F'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    QBEDefinition.QBEFieldDefs = {
      04000000100000000B00000051545F4154454E4449444F0100000000000C0000
      0051545F43414E43454C41444F0100000000000C00000051545F4445564F4C56
      49444F0100000000000C00000051545F4E4F54415F4954454D01000000000008
      000000494E445F5449504F0100000000000C000000444553435F50524F445554
      4F010000000000080000004E554D5F4E4F544101000000000009000000434F44
      5F5345524945010000000000040000004E4F4D450100000000000D000000434F
      445F4C4F54455F5449504F01000000000010000000494E445F5449504F5F5052
      4F4455544F0100000000000D0000004E554D5F454D42414C4147454D01000000
      00000C00000056414C5F554E49544152494F0100000000000C00000056414C5F
      46554E525552414C0100000000000C000000434F445F434144415354524F0100
      000000000E00000056414C5F49434D535F5355425354010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRFuturaCalcFields
    Left = 576
    Top = 170
    object QRFuturaQT_ATENDIDO: TFloatField
      FieldName = 'QT_ATENDIDO'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object QRFuturaQT_CANCELADO: TFloatField
      FieldName = 'QT_CANCELADO'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object QRFuturaQT_DEVOLVIDO: TFloatField
      FieldName = 'QT_DEVOLVIDO'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object QRFuturaQT_NOTA_ITEM: TFloatField
      FieldName = 'QT_NOTA_ITEM'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object QRFuturaIND_TIPO: TStringField
      FieldName = 'IND_TIPO'
      Required = True
      Size = 7
    end
    object QRFuturaNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRFuturaCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QRFuturaCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
      Required = True
    end
    object QRFuturaIND_TIPO_PRODUTO: TStringField
      FieldName = 'IND_TIPO_PRODUTO'
      Required = True
      Size = 10
    end
    object QRFuturaNUM_EMBALAGEM: TFloatField
      FieldName = 'NUM_EMBALAGEM'
    end
    object QRFuturaVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
    end
    object QRFuturasval_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sval_total'
      Calculated = True
    end
    object QRFuturaDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRFuturaVAL_FUNRURAL: TFloatField
      FieldName = 'VAL_FUNRURAL'
      Required = True
    end
    object QRFuturanome: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome'
      Size = 40
      Calculated = True
    end
    object QRFuturaCOD_CADASTRO: TFloatField
      FieldName = 'COD_CADASTRO'
    end
  end
  object QRFunRural: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_nota_cab.COD_NOTA_CAB,'
      '  Tb_nota_cab.COD_USUARIO,'
      '  Tb_nota_cab.COD_FILIAL,'
      '  Tb_nota_cab.COD_MENSAGEM,'
      '  Tb_nota_cab.COD_TRANSPORTE,'
      '  Tb_nota_cab.COD_OPERACAO,'
      '  Tb_nota_cab.COD_ESTADO,'
      '  Tb_nota_cab.COD_VENDEDOR,'
      '  Tb_nota_cab.COD_CADASTRO,'
      '  Tb_nota_cab.NUM_NOTA,'
      '  Tb_nota_cab.COD_SERIE,'
      '  Tb_nota_cab.IND_SITUACAO,'
      '  Tb_nota_cab.IND_CONDICAO_PAGTO,'
      '  Tb_nota_cab.DT_EMISSAO,'
      '  Tb_nota_cab.DT_MOVIMENTO,'
      '  Tb_nota_cab.DT_RECEBIMENTO,'
      '  Tb_nota_cab.COD_MOTIVO_CANC,'
      '  Tb_nota_cab.VAL_DESPESAS,'
      '  Tb_nota_cab.IND_ENTRADA_SAIDA,'
      '  Tb_nota_cab.VAL_FRETE,'
      '  Tb_nota_cab.VAL_DESCONTO,'
      '  Tb_nota_cab.COD_TRANSPORTADOR,'
      '  Tb_nota_cab.NUM_CONHECIMENTO_FRETE,'
      '  Tb_nota_cab.VAL_AVISTA,'
      '  Tb_nota_cab.IND_TIPO_FRETE,'
      '  Tb_nota_cab.NUM_VOLUMES,'
      '  Tb_nota_cab.OBS,'
      '  Tb_nota_cab.OBS_COMPLEMENTO,'
      '  Tb_nota_cab.DT_USUARIO,'
      '  Tb_nota_cab.COD_TRIBUTACAO_FRETE,'
      '  Tb_nota_cab.VAL_TOTAL_IPI,'
      '  Tb_nota_cab.VAL_ICM_FRETE,'
      '  Tb_nota_cab.VAL_ICM_BASE_FRETE,'
      '  Tb_nota_cab.VAL_FUNRURAL,'
      '  Tb_nota_cab.DESC_PLACA,'
      '  Tb_nota_cab.DESC_TRANSPORTADORA,'
      '  Tb_nota_cab.COD_NOTA_CONTA_CORRENTE,'
      '  Tb_nota_cab.DT_EMISSAO_CF,'
      '  Tb_nota_cab.COD_OPERACAO_CF,'
      '  Tb_nota_cab.NR_DIAS_CHEQUE,'
      '  Tb_nota_cab.COD_CONTRATO_MOV,'
      '  Tb_nota_cab.COD_CONTRATO_GP_MOV,'
      '  Tb_nota_cab.NR_DIAS_CHEQUE1,'
      '  Tb_nota_cab.NR_DIAS_CHEQUE2,'
      '  Tb_nota_cab.IND_NOTA_SEGURO,'
      '  Tb_nota_cab.COD_CONTRATO_VEND,'
      '  Tb_nota_cab.NR_ROTA,'
      '  Tb_cadastro.NOME,'
      '  Tb_filial.DESC_FILIAL'
      'FROM'
      '  TB_NOTA_CAB ,'
      '  TB_CADASTRO ,'
      '  TB_FILIAL'
      'WHERE'
      '  (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO)'
      '  AND'
      '  (Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL)'
      '  AND'
      '  (Tb_nota_cab.IND_SITUACAO = 2)'
      '  AND'
      '  (TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL'
      '   OR'
      '    :COD_FILIAL IS NULL)'
      '  AND'
      '  (TB_NOTA_CAB.DT_RECEBIMENTO >= :DT_INICIAL)'
      '  AND'
      '  (TB_NOTA_CAB.DT_RECEBIMENTO <= :DT_FINAL)'
      '  AND'
      '  (TB_NOTA_CAB.VAL_FUNRURAL > 0)'
      'ORDER BY'
      '  TB_NOTA_CAB.COD_FILIAL,'
      '  TB_NOTA_CAB.DT_EMISSAO')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      0000000B0000003A44545F494E494349414C0C00000000000000000000000900
      00003A44545F46494E414C0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000310000000C000000434F445F4E4F54415F4341420100000000000B00
      0000434F445F5553554152494F0100000000000A000000434F445F46494C4941
      4C0100000000000C000000434F445F4D454E534147454D0100000000000E0000
      00434F445F5452414E53504F5254450100000000000C000000434F445F4F5045
      524143414F0100000000000A000000434F445F45535441444F0100000000000C
      000000434F445F56454E4445444F520100000000000C000000434F445F434144
      415354524F010000000000080000004E554D5F4E4F5441010000000000090000
      00434F445F53455249450100000000000C000000494E445F534954554143414F
      01000000000012000000494E445F434F4E444943414F5F504147544F01000000
      00000A00000044545F454D495353414F0100000000000C00000044545F4D4F56
      494D454E544F0100000000000E00000044545F5245434542494D454E544F0100
      000000000F000000434F445F4D4F5449564F5F43414E430100000000000C0000
      0056414C5F444553504553415301000000000011000000494E445F454E545241
      44415F53414944410100000000000900000056414C5F46524554450100000000
      000C00000056414C5F444553434F4E544F01000000000011000000434F445F54
      52414E53504F525441444F52010000000000160000004E554D5F434F4E484543
      494D454E544F5F46524554450100000000000A00000056414C5F415649535441
      0100000000000E000000494E445F5449504F5F46524554450100000000000B00
      00004E554D5F564F4C554D4553010000000000030000004F4253010000000000
      0F0000004F42535F434F4D504C454D454E544F0100000000000A00000044545F
      5553554152494F01000000000014000000434F445F5452494255544143414F5F
      46524554450100000000000D00000056414C5F544F54414C5F49504901000000
      00000D00000056414C5F49434D5F46524554450100000000001200000056414C
      5F49434D5F424153455F46524554450100000000000C00000056414C5F46554E
      525552414C0100000000000A000000444553435F504C41434101000000000013
      000000444553435F5452414E53504F525441444F524101000000000017000000
      434F445F4E4F54415F434F4E54415F434F5252454E54450100000000000D0000
      0044545F454D495353414F5F43460100000000000F000000434F445F4F504552
      4143414F5F43460100000000000E0000004E525F444941535F43484551554501
      000000000010000000434F445F434F4E545241544F5F4D4F5601000000000013
      000000434F445F434F4E545241544F5F47505F4D4F560100000000000F000000
      4E525F444941535F434845515545310100000000000F0000004E525F44494153
      5F434845515545320100000000000F000000494E445F4E4F54415F5345475552
      4F01000000000011000000434F445F434F4E545241544F5F56454E4401000000
      0000070000004E525F524F5441010000000000040000004E4F4D450100000000
      000B000000444553435F46494C49414C010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 576
    Top = 216
    object QRFunRuralCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QRFunRuralCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QRFunRuralCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QRFunRuralCOD_MENSAGEM: TIntegerField
      FieldName = 'COD_MENSAGEM'
    end
    object QRFunRuralCOD_TRANSPORTE: TIntegerField
      FieldName = 'COD_TRANSPORTE'
    end
    object QRFunRuralCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
    end
    object QRFunRuralCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Required = True
      Size = 2
    end
    object QRFunRuralCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QRFunRuralCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRFunRuralNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRFunRuralCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QRFunRuralIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Required = True
      Size = 1
    end
    object QRFunRuralIND_CONDICAO_PAGTO: TStringField
      FieldName = 'IND_CONDICAO_PAGTO'
      Required = True
      Size = 1
    end
    object QRFunRuralDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRFunRuralDT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Required = True
    end
    object QRFunRuralDT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
    end
    object QRFunRuralCOD_MOTIVO_CANC: TIntegerField
      FieldName = 'COD_MOTIVO_CANC'
    end
    object QRFunRuralVAL_DESPESAS: TFloatField
      FieldName = 'VAL_DESPESAS'
      Required = True
    end
    object QRFunRuralIND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 1
    end
    object QRFunRuralVAL_FRETE: TFloatField
      FieldName = 'VAL_FRETE'
      Required = True
    end
    object QRFunRuralVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
    end
    object QRFunRuralCOD_TRANSPORTADOR: TIntegerField
      FieldName = 'COD_TRANSPORTADOR'
    end
    object QRFunRuralNUM_CONHECIMENTO_FRETE: TIntegerField
      FieldName = 'NUM_CONHECIMENTO_FRETE'
    end
    object QRFunRuralVAL_AVISTA: TFloatField
      FieldName = 'VAL_AVISTA'
    end
    object QRFunRuralIND_TIPO_FRETE: TStringField
      FieldName = 'IND_TIPO_FRETE'
      Size = 3
    end
    object QRFunRuralNUM_VOLUMES: TIntegerField
      FieldName = 'NUM_VOLUMES'
    end
    object QRFunRuralOBS: TStringField
      FieldName = 'OBS'
      Size = 60
    end
    object QRFunRuralOBS_COMPLEMENTO: TStringField
      FieldName = 'OBS_COMPLEMENTO'
      Size = 60
    end
    object QRFunRuralDT_USUARIO: TDateTimeField
      FieldName = 'DT_USUARIO'
      Required = True
    end
    object QRFunRuralCOD_TRIBUTACAO_FRETE: TIntegerField
      FieldName = 'COD_TRIBUTACAO_FRETE'
    end
    object QRFunRuralVAL_TOTAL_IPI: TFloatField
      FieldName = 'VAL_TOTAL_IPI'
    end
    object QRFunRuralVAL_ICM_FRETE: TFloatField
      FieldName = 'VAL_ICM_FRETE'
      Required = True
    end
    object QRFunRuralVAL_ICM_BASE_FRETE: TFloatField
      FieldName = 'VAL_ICM_BASE_FRETE'
      Required = True
    end
    object QRFunRuralVAL_FUNRURAL: TFloatField
      FieldName = 'VAL_FUNRURAL'
      Required = True
    end
    object QRFunRuralDESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Size = 8
    end
    object QRFunRuralDESC_TRANSPORTADORA: TStringField
      FieldName = 'DESC_TRANSPORTADORA'
      Size = 50
    end
    object QRFunRuralCOD_NOTA_CONTA_CORRENTE: TIntegerField
      FieldName = 'COD_NOTA_CONTA_CORRENTE'
    end
    object QRFunRuralDT_EMISSAO_CF: TDateTimeField
      FieldName = 'DT_EMISSAO_CF'
    end
    object QRFunRuralCOD_OPERACAO_CF: TIntegerField
      FieldName = 'COD_OPERACAO_CF'
    end
    object QRFunRuralNR_DIAS_CHEQUE: TIntegerField
      FieldName = 'NR_DIAS_CHEQUE'
    end
    object QRFunRuralCOD_CONTRATO_MOV: TIntegerField
      FieldName = 'COD_CONTRATO_MOV'
    end
    object QRFunRuralCOD_CONTRATO_GP_MOV: TIntegerField
      FieldName = 'COD_CONTRATO_GP_MOV'
    end
    object QRFunRuralNR_DIAS_CHEQUE1: TIntegerField
      FieldName = 'NR_DIAS_CHEQUE1'
    end
    object QRFunRuralNR_DIAS_CHEQUE2: TIntegerField
      FieldName = 'NR_DIAS_CHEQUE2'
    end
    object QRFunRuralIND_NOTA_SEGURO: TStringField
      FieldName = 'IND_NOTA_SEGURO'
      Size = 3
    end
    object QRFunRuralCOD_CONTRATO_VEND: TIntegerField
      FieldName = 'COD_CONTRATO_VEND'
    end
    object QRFunRuralNR_ROTA: TIntegerField
      FieldName = 'NR_ROTA'
    end
    object QRFunRuralNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRFunRuralDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
  end
  object QRCustoCompra: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_cadastro.COD_CADASTRO,'
      '  Tb_cadastro.NOME,'
      '  Tb_nota_cab.NUM_NOTA,'
      '  Tb_nota_cab.COD_SERIE,'
      '  Tb_nota_cab.DT_RECEBIMENTO,'
      '  Tb_produto.COD_PRODUTO,'
      '  Tb_produto.DESC_PRODUTO,'
      '  Tb_produto.DESC_COD_BARRA,'
      '  Tb_nota_item.QT_QUANTIDADE,'
      
        '  Tb_nota_item.VAL_CUSTO/DECODE(Tb_nota_item.QT_QUANTIDADE,0,1,T' +
        'b_nota_item.QT_QUANTIDADE) as VAL_CUSTO,'
      '  Tb_produto.VAL_VAREJO,'
      '  Tb_estoque.qt_quantidade as qt_estoque'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_CADASTRO,'
      '  TB_PRODUTO,'
      '  TB_ESTOQUE,'
      '  TB_OPERACAO'
      'WHERE'
      '  Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '  AND'
      '  Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO'
      '  AND'
      '  Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '  AND'
      '  TB_NOTA_CAB.COD_FILIAL = TB_ESTOQUE.COD_FILIAL'
      '  AND'
      '  TB_NOTA_ITEM.COD_PRODUTO = TB_ESTOQUE.COD_PRODUTO'
      '  AND'
      '  TB_NOTA_ITEM.COD_LOTE_TIPO = TB_ESTOQUE.COD_LOTE_TIPO'
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39
      '  AND'
      '  TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '  AND'
      '  (:FILIAL IS NULL OR'
      '   :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '  AND'
      '  (:CADASTRO IS NULL OR'
      '   :CADASTRO = TB_NOTA_CAB.COD_CADASTRO)'
      '  AND'
      '  (:PRODUTO IS NULL OR'
      '   :PRODUTO = TB_NOTA_ITEM.COD_PRODUTO)'
      '  AND'
      '  (:LOTE IS NULL OR'
      '   :LOTE = TB_NOTA_ITEM.COD_LOTE_TIPO)'
      '  AND'
      '  (TB_NOTA_CAB.DT_RECEBIMENTO >= :DT_INICIAL)'
      '  AND'
      '  (TB_NOTA_CAB.DT_RECEBIMENTO <= :DT_FINAL)'
      '  AND'
      '  (TB_OPERACAO.IND_COMPRAS =  '#39'C'#39')'
      'ORDER BY'
      
        '  TB_NOTA_CAB.DT_RECEBIMENTO,TB_NOTA_CAB.NUM_NOTA,TB_NOTA_CAB.CO' +
        'D_CADASTRO,TB_NOTA_CAB.COD_SERIE,TB_PRODUTO.DESC_PRODUTO')
    Variables.Data = {
      0300000006000000070000003A46494C49414C03000000000000000000000009
      0000003A434144415354524F030000000000000000000000080000003A50524F
      4455544F030000000000000000000000050000003A4C4F544503000000000000
      00000000000B0000003A44545F494E494349414C0C0000000000000000000000
      090000003A44545F46494E414C0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C0000000C000000434F445F434144415354524F0100000000000400
      00004E4F4D45010000000000080000004E554D5F4E4F54410100000000000900
      0000434F445F53455249450100000000000E00000044545F5245434542494D45
      4E544F0100000000000B000000434F445F50524F4455544F0100000000000C00
      0000444553435F50524F4455544F0100000000000D00000051545F5155414E54
      49444144450100000000000900000056414C5F435553544F0100000000000A00
      000056414C5F564152454A4F0100000000000E000000444553435F434F445F42
      415252410100000000000A00000051545F4553544F515545010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRCustoCompraCalcFields
    Left = 680
    Top = 16
    object QRCustoCompraCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRCustoCompraNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRCustoCompraNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRCustoCompraCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QRCustoCompraDT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
    end
    object QRCustoCompraCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRCustoCompraQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object QRCustoCompraVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
    end
    object QRCustoCompraVAL_VAREJO: TFloatField
      FieldName = 'VAL_VAREJO'
    end
    object QRCustoCompraPerc_Diferenca: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Perc_Diferenca'
      Calculated = True
    end
    object QRCustoCompraDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRCustoCompraDESC_COD_BARRA: TStringField
      FieldName = 'DESC_COD_BARRA'
    end
    object QRCustoCompraQT_ESTOQUE: TFloatField
      FieldName = 'QT_ESTOQUE'
      Required = True
    end
  end
  object QRelacao: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_NOTA_CAB + 0.00 AS COD_NOTA_CAB,'
      '  NUM_NOTA + 0.00 AS NUM_NOTA,'
      '  COD_FILIAL + 0.00 AS COD_FILIAL,'
      '  COD_SERIE AS COD_SERIE,'
      '  DT_RECEBIMENTO,'
      '  COD_ESTADO,'
      '  IND_SITUACAO,'
      '  IND_CONDICAO_PAGTO,'
      '  DT_EMISSAO,'
      '  COD_OPERACAO + 0.00 AS COD_OPERACAO,'
      '  COD_CADASTRO + 0.00 AS COD_CADASTRO,'
      '  NOME,'
      '  NOME_TRANSP,'
      '  Sum(SVAL_TOTAL) AS SVAL_TOTAL,'
      '  SUM(SVAL_CUSTO) AS SVAL_CUSTO,'
      '  SUM(SVAL_DESCONTO) AS SVAL_DESCONTO,'
      '  NUM_VOLUMES + 0.00 AS NUM_VOLUMES,'
      '  SUM(QT_QUANTIDADE) AS QT_QUANTIDADE,'
      '  NUM_CGC_CPF,'
      '  CIDADE,'
      '  NUM_PEDIDO,'
      '  COD_DEPARTAMENTO,'
      '  DESC_FILIAL,'
      '  NUM_CGC'
      '  FROM'
      '  ('
      '    SELECT'
      '      TB_NOTA_CAB."COD_NOTA_CAB",'
      '      CASE'
      '        WHEN (TB_PARAM_SISTEMA.COD_EMPRESA = '#39'NFCE-MINGO'#39') THEN'
      
        '          DECODE(TB_OPERACAO.IND_SERVICO,'#39'S'#39',TO_NUMBER(TB_NOTA_C' +
        'AB.NUM_NFSE),TRUNC(TB_NOTA_CAB."NUM_NOTA"))'
      '        ELSE'
      '          TRUNC(TB_NOTA_CAB."NUM_NOTA")'
      '      END AS "NUM_NOTA",'
      '      TB_NOTA_CAB."COD_FILIAL" ,'
      '      TB_NOTA_CAB."COD_SERIE" ,'
      '      TB_NOTA_CAB."DT_RECEBIMENTO",'
      '      TB_NOTA_CAB."COD_ESTADO" ,'
      '      TB_NOTA_CAB."IND_SITUACAO" ,'
      '      TB_NOTA_CAB."IND_CONDICAO_PAGTO" ,'
      '      TB_NOTA_CAB."DT_EMISSAO" ,'
      '      TB_NOTA_CAB."COD_OPERACAO" ,'
      '      TB_CADASTRO."COD_CADASTRO" ,'
      #9'    TB_CADASTRO."NUM_CGC_CPF" ,'
      #9'    TB_CIDADE."DESC_CIDADE" AS CIDADE,'
      '      TB_NOTA_CAB.NUM_VOLUMES AS NUM_VOLUMES,'
      '      TB_NOTA_CAB.COD_TRANSPORTADOR AS COD_TRANSP,'
      '      TB_TRANSPORTADOR.NOME AS NOME_TRANSP,'
      '      CASE'
      
        '        WHEN ((TB_PARAM_SISTEMA.COD_EMPRESA = '#39'POLLYANA'#39') OR (TB' +
        '_PARAM_SISTEMA.COD_EMPRESA = '#39'RETIFOZ'#39')) THEN'
      '          TB_CADASTRO.NOME'
      '      ELSE'
      '         NVL(TB_CADASTRO.DESC_FANTASIA,TB_CADASTRO.NOME)  '
      '      END AS NOME,'
      
        '      /*DECODE(TB_PARAM_SISTEMA.COD_EMPRESA,'#39'POLLYANA'#39', TB_CADAS' +
        'TRO.NOME, NVL(TB_CADASTRO.DESC_FANTASIA,TB_CADASTRO."NOME")) AS ' +
        'NOME,*/'
      
        '      /*SUM(TB_NOTA_ITEM."VAL_TOTAL" - PEGA_DESCONTO_ITEM(TB_NOT' +
        'A_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS+decode(:MOSTRA' +
        '_FRETE, '#39'N'#39', 0, Tb_nota_item.VAL_FRETE)+TB_NOTA_ITEM.VAL_IPI+TB_' +
        'NOTA_ITEM.VAL_ICMS_SUBST) AS SVAL_TOTAL,*/'
      '      CASE'
      
        '        WHEN ((TB_TRIBUTACAO.DESC_SITUACAO_TRIB LIKE '#39'%60'#39' OR TB' +
        '_TRIBUTACAO.DESC_CSOSN LIKE '#39'500'#39')'
      
        '            AND (TB_CADASTRO.IND_FISICA_JURIDICA = '#39'J'#39' AND TB_CA' +
        'DASTRO.NUM_INSCRICAO IS NOT NULL AND TB_CADASTRO.NUM_INSCRICAO <' +
        '> '#39'ISENTO'#39
      '            AND TB_CADASTRO.IND_CONTRIBUINTE = '#39'SIM'#39')) THEN    '
      
        '                SUM(TB_NOTA_ITEM."VAL_TOTAL") - SUM(nvl(PEGA_DES' +
        'CONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM),0))      +'
      
        '              SUM(Tb_nota_item.VAL_DESPESAS)+decode(:MOSTRA_FRET' +
        'E, '#39'N'#39', 0, SUM(Tb_nota_item.VAL_FRETE))+'
      '              SUM(TB_NOTA_ITEM.VAL_IPI)     '
      '            ELSE            '
      
        '                SUM(TB_NOTA_ITEM."VAL_TOTAL") - SUM(nvl(PEGA_DES' +
        'CONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM),0))      +'
      
        '              SUM(Tb_nota_item.VAL_DESPESAS)+decode(:MOSTRA_FRET' +
        'E, '#39'N'#39', 0, SUM(Tb_nota_item.VAL_FRETE))+'
      '              SUM(TB_NOTA_ITEM.VAL_IPI)     +'
      
        '              DECODE(NVL(TB_NOTA_CAB.VAL_SUBST_TRIBUT,0),0,SUM(n' +
        'vl(TB_NOTA_ITEM.VAL_ICMS_SUBST,0)),TB_NOTA_CAB.VAL_SUBST_TRIBUT)'
      '      END AS SVAL_TOTAL,'
      
        '      SUM(DECODE(IND_ENTRADA_SAIDA,'#39'E'#39',TB_NOTA_ITEM.VAL_CUSTO,TB' +
        '_NOTA_ITEM.VAL_CUSTO * TB_NOTA_ITEM.QT_QUANTIDADE)) AS SVAL_CUST' +
        'O,'
      
        '      SUM(PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM)) AS  SV' +
        'AL_DESCONTO,'
      '      SUM(TB_NOTA_ITEM.QT_QUANTIDADE) AS QT_QUANTIDADE,'
      '      TB_NOTA_CAB.NUM_PEDIDO,'
      '      TB_NOTA_CAB.COD_DEPARTAMENTO,'
      '      TB_FILIAL.DESC_FILIAL,'
      '      TB_FILIAL.NUM_CGC'
      '    FROM'
      '      TB_NOTA_CAB,'
      '      TB_NOTA_ITEM,'
      '      TB_CADASTRO,'
      '      TB_CADASTRO TB_TRANSPORTADOR,'
      #9'    TB_CIDADE,'
      '      TB_PRODUTO,'
      '      TB_CLASSE,'
      '      TB_PARAM_SISTEMA,'
      '      TB_PRAZO_VENCIMENTO,'
      '      TB_FILIAL,'
      '      TB_TRIBUTACAO,'
      '      TB_OPERACAO'
      '    WHERE'
      '      TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '      AND'
      '      TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '      AND'
      '      TB_CADASTRO.COD_CIDADE = TB_CIDADE.COD_CIDADE(+) '
      '      AND'
      '      Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '      AND'
      '      TB_NOTA_ITEM.COD_TRIBUTACAO = TB_TRIBUTACAO.COD_TRIBUTACAO'
      '      AND'
      '      TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '      AND'
      
        '      TB_NOTA_CAB.COD_PRAZO_VENCIMENTO = TB_PRAZO_VENCIMENTO.COD' +
        '_PRAZO_VENCIMENTO(+)'
      '      AND'
      '      TB_NOTA_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      '      AND'
      '      TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '      AND'
      
        '      TB_NOTA_CAB.COD_TRANSPORTADOR = TB_TRANSPORTADOR.COD_CADAS' +
        'TRO(+)'
      '      AND'
      
        '      TB_PARAM_SISTEMA.COD_EMPRESA NOT IN ('#39'MARTICAR'#39', '#39'TECIDOME' +
        'DI'#39')'
      '      AND'
      '      (TB_NOTA_CAB.IND_ENTRADA_SAIDA = :ENTRADA_SAIDA)'
      '      AND'
      
        '      (Trunc(TB_NOTA_CAB.DT_RECEBIMENTO) >= NVL(:DATA_I,Trunc(TB' +
        '_NOTA_CAB.DT_RECEBIMENTO)))'
      '      AND'
      
        '      (Trunc(TB_NOTA_CAB.DT_RECEBIMENTO) <= NVL(:DATA_F,Trunc(TB' +
        '_NOTA_CAB.DT_RECEBIMENTO)))'
      '      AND'
      '      (:FILIAL IS NULL'
      '        OR'
      '        :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '      AND'
      '      (:SITUACAO IS NULL'
      '        OR'
      '        :SITUACAO = TB_NOTA_CAB.IND_SITUACAO)'
      '      AND'
      '      (:CADASTRO IS NULL'
      '        OR'
      '        TB_NOTA_CAB.COD_CADASTRO = :CADASTRO)'
      '      AND'
      '      (:TRANSPORTADOR IS NULL'
      '        or'
      '        TB_NOTA_CAB.COD_TRANSPORTADOR = :TRANSPORTADOR)'
      '      AND'
      '      :OPERACAO'
      '      AND'
      '      :NUM_NOTA'
      '      AND'
      '      :VENDEDOR'
      '      AND'
      '      (:COD_TECNICO IS NULL'
      '        OR'
      '        TB_NOTA_CAB.COD_TECNICO = :COD_TECNICO)'
      '      AND'
      '      (:COD_SERIE IS NULL'
      '        OR'
      '        TB_NOTA_CAB.COD_SERIE = :COD_SERIE)'
      '      AND'
      '      (:COD_CIDADE IS NULL'
      '       OR'
      '        TB_CADASTRO.COD_CIDADE = :COD_CIDADE)'
      '      AND'
      '      :DEPARTAMENTO'
      '      AND'
      '      (:MOTIVO IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_MOTIVO_CANC = :MOTIVO)'
      '      AND'
      '      (:COD_TRIBUTACAO IS NULL'
      '        OR'
      '        TB_NOTA_ITEM.COD_TRIBUTACAO = :COD_TRIBUTACAO)'
      '      AND'
      '      (:COD_LOTE_TIPO IS NULL'
      '        OR'
      '        TB_NOTA_ITEM.COD_LOTE_TIPO = :COD_LOTE_TIPO)'
      '      AND'
      '      (:ESTADO IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_ESTADO = :ESTADO)'
      '      AND'
      '      :TIPO_PAGTO'
      '      AND'
      '      (:COD_PRODUTO IS NULL'
      '       OR'
      '        TB_NOTA_ITEM.COD_PRODUTO = :COD_PRODUTO)'
      '      AND'
      '      (:COD_OBRA IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_OBRA = :COD_OBRA)'
      '      AND'
      '      (:COD_MARCA IS NULL OR'
      '        TB_PRODUTO.COD_MARCA = :COD_MARCA)'
      '      AND'
      '      (:IND_FISICA_JURIDICA IS NULL'
      '       OR'
      '        TB_CADASTRO.IND_FISICA_JURIDICA = :IND_FISICA_JURIDICA)'
      '      AND'
      '      (:CLASSE IS NULL'
      '       OR'
      '        TB_CLASSE.NUM_CLASSE = :CLASSE)'
      '      AND'
      '      (:SUBCLASSE IS NULL'
      '       OR'
      '        TB_CLASSE.NUM_SUBCLASSE = :SUBCLASSE)'
      '      AND'
      '      (:NUM_PEDIDO IS NULL'
      '        OR'
      '        TB_NOTA_CAB.NUM_PEDIDO = :NUM_PEDIDO)'
      '      AND'
      '      (:COD_RAMO IS NULL'
      '       OR'
      '       TB_CADASTRO.COD_RAMO = :COD_RAMO)'
      '      AND'
      '      (:COD_PRAZO_VENCIMENTO IS NULL'
      '       OR'
      
        '        TB_PRAZO_VENCIMENTO.COD_PRAZO_VENCIMENTO = :COD_PRAZO_VE' +
        'NCIMENTO)'
      '      AND'
      '      (:DESC_BAIRRO IS NULL'
      '       OR'
      '        TB_CADASTRO.DESC_BAIRRO = :DESC_BAIRRO)'
      '      AND'
      '      (:CULTURA IS NULL'
      '       OR'
      '        TB_NOTA_ITEM.COD_CULTURA = :CULTURA)'
      '      AND'
      #9'(:DESC_OBSERVACAO IS NULL'
      #9' OR'
      
        #9'  UPPER(TB_NOTA_CAB.DESC_OBS_CORPO_NOTA) LIKE '#39'%'#39' || :DESC_OBSE' +
        'RVACAO || '#39'%'#39')'
      '      AND'
      
        '      Trunc(TB_NOTA_CAB.DT_EMISSAO) >= NVL(:DT_EMISSAO_I,Trunc(T' +
        'B_NOTA_CAB.DT_EMISSAO))'
      '      AND'
      
        '      Trunc(TB_NOTA_CAB.DT_EMISSAO) <= NVL(:DT_EMISSAO_F,Trunc(T' +
        'B_NOTA_CAB.DT_EMISSAO))'
      '      AND '
      '      (:DT_USUARIO_I IS NULL OR '
      
        '        TB_NOTA_CAB.DT_USUARIO >= TO_DATE(:DT_USUARIO_I, '#39'DD/MM/' +
        'YYYY HH24:MI'#39') )'
      '      AND'
      '      (:DT_USUARIO_F IS NULL OR'
      
        '        TB_NOTA_CAB.DT_USUARIO <= TO_DATE(:DT_USUARIO_F, '#39'DD/MM/' +
        'YYYY HH24:MI'#39') + 1/1440 )'
      '    GROUP BY'
      '      TB_NOTA_CAB."COD_NOTA_CAB" ,'
      '      CASE'
      '        WHEN (TB_PARAM_SISTEMA.COD_EMPRESA = '#39'NFCE-MINGO'#39') THEN'
      
        '          DECODE(TB_OPERACAO.IND_SERVICO,'#39'S'#39',TO_NUMBER(TB_NOTA_C' +
        'AB.NUM_NFSE),TRUNC(TB_NOTA_CAB."NUM_NOTA"))'
      '        ELSE'
      '          TRUNC(TB_NOTA_CAB."NUM_NOTA")'
      '      END,'
      '      TB_NOTA_CAB."COD_FILIAL" ,'
      '      TB_NOTA_CAB."COD_SERIE" ,'
      '      TB_NOTA_CAB."DT_RECEBIMENTO",'
      '      TB_NOTA_CAB."COD_ESTADO" ,'
      '      TB_NOTA_CAB."IND_SITUACAO" ,'
      '      TB_NOTA_CAB."IND_CONDICAO_PAGTO" ,'
      '      TB_NOTA_CAB."DT_EMISSAO" ,'
      '      TB_NOTA_CAB."COD_OPERACAO" ,'
      '      TB_NOTA_CAB."NUM_VOLUMES" ,'
      '      TB_CADASTRO."COD_CADASTRO" ,'
      #9'    TB_CADASTRO."NUM_CGC_CPF" ,'
      #9'    TB_CIDADE."DESC_CIDADE",'
      '      TB_NOTA_CAB.COD_TRANSPORTADOR,'
      '      TB_TRANSPORTADOR.NOME,'
      '      CASE'
      
        '        WHEN ((TB_PARAM_SISTEMA.COD_EMPRESA = '#39'POLLYANA'#39') OR (TB' +
        '_PARAM_SISTEMA.COD_EMPRESA = '#39'RETIFOZ'#39')) THEN'
      '          TB_CADASTRO.NOME'
      '      ELSE'
      '         NVL(TB_CADASTRO.DESC_FANTASIA,TB_CADASTRO.NOME)  '
      '      END,'
      
        '      /*DECODE(TB_PARAM_SISTEMA.COD_EMPRESA,'#39'POLLYANA'#39', TB_CADAS' +
        'TRO.NOME, NVL(TB_CADASTRO.DESC_FANTASIA,TB_CADASTRO."NOME")),*/'
      '      TB_NOTA_CAB.NUM_VOLUMES,'
      '      TB_NOTA_CAB.VAL_SUBST_TRIBUT,'
      '      TB_NOTA_CAB.NUM_PEDIDO,'
      '      TB_NOTA_CAB.COD_DEPARTAMENTO,'
      '      TB_FILIAL.DESC_FILIAL,'
      '      TB_TRIBUTACAO.DESC_SITUACAO_TRIB,'
      '      TB_TRIBUTACAO.DESC_CSOSN,'
      '      TB_CADASTRO.IND_FISICA_JURIDICA,'
      '      TB_CADASTRO.NUM_INSCRICAO,  '
      '      TB_CADASTRO.IND_CONTRIBUINTE,'
      '      TB_FILIAL.NUM_CGC'
      ''
      '  )'
      'GROUP BY'
      'COD_NOTA_CAB,'
      'NUM_NOTA,'
      'COD_FILIAL,'
      'COD_SERIE,'
      'DT_RECEBIMENTO,'
      'COD_ESTADO,'
      'IND_SITUACAO,'
      'IND_CONDICAO_PAGTO,'
      'DT_EMISSAO,'
      'COD_OPERACAO,'
      'COD_CADASTRO,'
      'NOME,'
      'NOME_TRANSP,'
      'NUM_VOLUMES,'
      'NUM_CGC_CPF,'
      'CIDADE,'
      'NUM_PEDIDO,'
      'COD_DEPARTAMENTO,'
      'DESC_FILIAL,'
      'NUM_CGC'
      '  '
      'ORDER BY NOME')
    Variables.Data = {
      03000000240000000E0000003A454E54524144415F5341494441050000000000
      000000000000070000003A444154415F490C0000000000000000000000070000
      003A444154415F460C0000000000000000000000070000003A46494C49414C03
      0000000000000000000000090000003A534954554143414F0500000000000000
      00000000090000003A434144415354524F030000000000000000000000090000
      003A4F5045524143414F0100000004000000313D310000000000090000003A56
      454E4445444F520100000004000000313D3100000000000D0000003A44455041
      5254414D454E544F0100000004000000313D310000000000070000003A4D4F54
      49564F0300000000000000000000000A0000003A434F445F5345524945050000
      0000000000000000000F0000003A434F445F5452494255544143414F03000000
      0000000000000000070000003A45535441444F0500000000000000000000000D
      0000003A44545F454D495353414F5F490C00000000000000000000000D000000
      3A44545F454D495353414F5F460C00000000000000000000000B0000003A5449
      504F5F504147544F0100000004000000313D3100000000000C0000003A434F44
      5F50524F4455544F030000000000000000000000140000003A494E445F464953
      4943415F4A555249444943410500000000000000000000000A0000003A535542
      434C41535345030000000000000000000000070000003A434C41535345030000
      0000000000000000000E0000003A434F445F4C4F54455F5449504F0300000000
      000000000000000B0000003A434F445F43494441444503000000000000000000
      00000D0000003A4D4F535452415F465245544505000000020000005300000000
      000B0000003A4E554D5F50454449444F05000000000000000000000009000000
      3A434F445F52414D4F030000000000000000000000150000003A434F445F5052
      415A4F5F56454E43494D454E544F0300000000000000000000000C0000003A44
      4553435F42414952524F050000000000000000000000090000003A434F445F4F
      425241030000000000000000000000080000003A43554C545552410300000000
      00000000000000090000003A4E554D5F4E4F54410100000004000000313D3100
      000000000A0000003A434F445F4D415243410300000000000000000000000C00
      00003A434F445F5445434E49434F0300000000000000000000000E0000003A54
      52414E53504F525441444F52030000000000000000000000100000003A444553
      435F4F42534552564143414F0500000000000000000000000D0000003A44545F
      5553554152494F5F490500000000000000000000000D0000003A44545F555355
      4152494F5F46050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000180000000C000000434F445F4E4F54415F4341420100000000000800
      00004E554D5F4E4F54410100000000000A000000434F445F46494C49414C0100
      0000000009000000434F445F53455249450100000000000E00000044545F5245
      434542494D454E544F0100000000000A000000434F445F45535441444F010000
      0000000C000000494E445F534954554143414F0100000000000A00000044545F
      454D495353414F0100000000000C000000434F445F4F5045524143414F010000
      0000000B0000004E554D5F564F4C554D45530100000000000C000000434F445F
      434144415354524F010000000000040000004E4F4D450100000000000A000000
      5356414C5F544F54414C0100000000000A0000005356414C5F435553544F0100
      000000000D00000051545F5155414E5449444144450100000000000B0000004E
      554D5F4347435F43504601000000000006000000434944414445010000000000
      0D0000005356414C5F444553434F4E544F0100000000000A0000004E554D5F50
      454449444F01000000000010000000434F445F444550415254414D454E544F01
      00000000000B000000444553435F46494C49414C01000000000012000000494E
      445F434F4E444943414F5F504147544F0100000000000B0000004E4F4D455F54
      52414E5350010000000000070000004E554D5F434743010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRelacaoCalcFields
    Left = 680
    Top = 80
    object QRelacaoCOD_NOTA_CAB: TFloatField
      FieldName = 'COD_NOTA_CAB'
    end
    object QRelacaoNUM_NOTA: TFloatField
      FieldName = 'NUM_NOTA'
    end
    object QRelacaoCOD_FILIAL: TFloatField
      FieldName = 'COD_FILIAL'
    end
    object QRelacaoDT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
    end
    object QRelacaoCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
    object QRelacaoIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 1
    end
    object QRelacaoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QRelacaoCOD_OPERACAO: TFloatField
      FieldName = 'COD_OPERACAO'
    end
    object QRelacaoCOD_CADASTRO: TFloatField
      FieldName = 'COD_CADASTRO'
    end
    object QRelacaoSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
      DisplayFormat = '#,##0.00'
    end
    object QRelacaoSVAL_CUSTO: TFloatField
      FieldName = 'SVAL_CUSTO'
    end
    object QRelacaoNUM_VOLUMES: TFloatField
      FieldName = 'NUM_VOLUMES'
    end
    object QRelacaoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QRelacaoPERC_LUCRATIVIDADE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'perc_lucratividade'
      Calculated = True
    end
    object QRelacaoCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Size = 3
    end
    object QRelacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object QRelacaoNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object QRelacaoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object QRelacaoSVAL_DESCONTO: TFloatField
      FieldName = 'SVAL_DESCONTO'
    end
    object QRelacaoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object QRelacaoCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
    end
    object QRelacaonum_pecas: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'num_pecas'
      Calculated = True
    end
    object QRelacaoDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRelacaoIND_CONDICAO_PAGTO: TStringField
      FieldName = 'IND_CONDICAO_PAGTO'
      Required = True
      OnGetText = QRelacaoIND_CONDICAO_PAGTOGetText
      Size = 1
    end
    object QRelacaoNUM_CGC: TStringField
      FieldName = 'NUM_CGC'
      Size = 18
    end
  end
  object QConferencia: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_FILIAL."DESC_FILIAL",'
      '  TB_CADASTRO."COD_CADASTRO",'
      '  TB_CADASTRO.COD_VENDEDOR_PREPOSTO,'
      '  TB_CADASTRO.NUM_CGC_CPF,'
      '  NVL(TB_NOME_NOTA.NOME,TB_CADASTRO.NOME) AS NOME_FORNECEDOR,'
      '  TB_OPERACAO."COD_OPERACAO" ,'
      '  TB_OPERACAO."DESC_OPERACAO" ,'
      '  TB_NOTA_CAB."COD_NOTA_CAB" ,'
      '  TB_NOTA_CAB."NUM_NOTA" ,'
      '  TB_NOTA_CAB."COD_SERIE" ,'
      '  TB_NOTA_CAB."COD_FILIAL",'
      '  TB_NOTA_CAB."COD_DEPARTAMENTO" ,'
      '  TB_CAD_TRANS.NUM_CGC_CPF AS NUM_CGC_CPF_TRANS,'
      '  TB_NOTA_CAB."DT_EMISSAO" ,'
      '  TB_NOTA_CAB."NUM_CONHECIMENTO_FRETE" ,'
      '  TB_NOTA_CAB."VAL_DESCONTO" ,'
      '  TB_NOTA_CAB."VAL_DESPESAS" ,'
      '  TB_NOTA_CAB."DT_RECEBIMENTO" ,'
      '  TB_NOTA_CAB."VAL_FRETE",'
      '  TB_NOTA_CAB."DESC_TRANSPORTADORA",'
      '  V.NOME || '#39' - '#39' || TB_NOTA_CAB.COD_VENDEDOR AS VENDEDOR,'
      '  TB_OBRA."COD_OBRA",'
      '  TB_OBRA."DESC_OBRA",'
      '  TB_NOTA_CAB."OBS",'
      '  TB_NOTA_CAB.NUM_VOLUMES,'
      '  TB_NOTA_CAB.COD_TRANSPORTADOR,'
      '  TB_NOTA_CAB.IND_TIPO_FRETE,  '
      '  CASE'
      
        '    WHEN ((TB_TRIBUTACAO.DESC_SITUACAO_TRIB LIKE '#39'%60'#39' OR TB_TRI' +
        'BUTACAO.DESC_CSOSN LIKE '#39'500'#39')'
      
        '        AND (TB_CADASTRO.IND_FISICA_JURIDICA = '#39'J'#39' AND TB_CADAST' +
        'RO.NUM_INSCRICAO IS NOT NULL AND TB_CADASTRO.NUM_INSCRICAO <> '#39'I' +
        'SENTO'#39
      '        AND TB_CADASTRO.IND_CONTRIBUINTE = '#39'SIM'#39')) THEN    '
      
        '            SUM(TB_NOTA_ITEM.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_N' +
        'OTA_ITEM.COD_NOTA_ITEM) + TB_NOTA_ITEM.VAL_IPI+TB_NOTA_ITEM.VAL_' +
        'DESPESAS)'
      '        ELSE            '
      
        '            SUM(TB_NOTA_ITEM.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_N' +
        'OTA_ITEM.COD_NOTA_ITEM) + TB_NOTA_ITEM.VAL_IPI+TB_NOTA_ITEM.VAL_' +
        'DESPESAS+TB_NOTA_ITEM.VAL_ICMS_SUBST)'
      '  END AS SVAL_TOTAL'
      'FROM'
      '  TB_NOTA_ITEM,'
      '  TB_NOTA_CAB,'
      '  TB_NOME_NOTA,'
      '  TB_CADASTRO,'
      '  TB_CADASTRO TB_CAD_TRANS,'
      '  TB_FILIAL,'
      '  TB_OPERACAO,'
      '  TB_VENDEDOR V,'
      '  TB_OBRA,'
      '  TB_TRIBUTACAO,'
      '  tb_produto'
      '  :TABELAS'
      'WHERE'
      '  TB_NOTA_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      '  AND'
      '  TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB'
      '  AND'
      '  TB_NOTA_ITEM.COD_TRIBUTACAO = TB_TRIBUTACAO.COD_TRIBUTACAO'
      '  AND'
      '  TB_NOTA_CAB.COD_NOTA_CAB = TB_NOME_NOTA.COD_NOTA_CAB(+)'
      '  AND'
      '  TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '  AND'
      '  TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      '  TB_NOTA_CAB.COD_TRANSPORTADOR = TB_CAD_TRANS.COD_CADASTRO(+)'
      '  AND'
      '  TB_NOTA_CAB.COD_VENDEDOR = V.COD_VENDEDOR(+)'
      '  AND'
      '  TB_NOTA_CAB.COD_OBRA = TB_OBRA.COD_OBRA(+)'
      '  AND'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = :ENTRADA_SAIDA'
      '/*  AND'
      '    TB_NOTA_CAB.IND_SITUACAO = 2  */'
      '  AND'
      '    TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO(+)'
      '  AND'
      '   (:CADASTRO IS NULL'
      '   OR'
      '   TB_NOTA_CAB.COD_CADASTRO = :CADASTRO)'
      '  AND'
      '   (:FILIAL IS NULL'
      '   OR'
      '   TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '  AND'
      '   (:COD_VENDEDOR IS NULL'
      '   OR'
      '   TB_NOTA_CAB.COD_VENDEDOR = :COD_VENDEDOR)'
      '  AND'
      '   (:COD_VENDEDOR_preposto IS NULL'
      '   OR'
      '   TB_CADASTRO.COD_VENDEDOR_PREPOSTO = :COD_VENDEDOR_PREPOSTO)'
      '  AND'
      '   (:OPERACAO IS NULL'
      '   OR'
      '   TB_NOTA_CAB.COD_OPERACAO = :OPERACAO)'
      '  AND'
      '   Trunc(TB_NOTA_CAB.DT_RECEBIMENTO) >= :DATA_I'
      '  AND'
      '   Trunc(TB_NOTA_CAB.DT_RECEBIMENTO) <= :DATA_F'
      '  AND'
      '  (:SITUACAO IS NULL'
      '    OR'
      '    :SITUACAO = TB_NOTA_CAB.IND_SITUACAO)'
      '  AND'
      '  (:COD_OBRA IS NULL'
      '    OR :COD_OBRA = TB_OBRA.COD_OBRA)'
      '  AND'
      '   (:COD_DEPARTAMENTO IS NULL'
      '   OR'
      '   TB_NOTA_CAB.COD_DEPARTAMENTO = :COD_DEPARTAMENTO)'
      '  AND'
      '   (:COD_MARCA IS NULL'
      '   OR'
      '   TB_PRODUTO.COD_MARCA = :COD_MARCA)'
      '  AND'
      '  (:COD_FORNECEDOR IS NULL'
      '  OR'
      '  TB_PRODUTO.COD_cadastro = :COD_FORNECEDOR)'
      '  AND'
      '  (:COD_PRODUTO IS NULL'
      '  OR'
      '  TB_PRODUTO.COD_PRODUTO = :COD_PRODUTO)'
      '  AND'
      '  (:COD_CULTURA IS NULL'
      '  OR'
      '  TB_NOTA_ITEM.COD_CULTURA = :COD_CULTURA)'
      '  AND'
      '  (:COD_TRANSPORTADOR IS NULL'
      '  OR'
      '  TB_NOTA_CAB.COD_TRANSPORTADOR = :COD_TRANSPORTADOR)'
      '  AND'
      '  (:IND_TIPO_FRETE IS NULL'
      '  OR'
      '  TB_NOTA_CAB.IND_TIPO_FRETE = :IND_TIPO_FRETE)'
      '  :FINALIDADE'
      'GROUP BY'
      '  TB_FILIAL."DESC_FILIAL",'
      '  TB_CADASTRO."COD_CADASTRO",'
      '  TB_CADASTRO.COD_VENDEDOR_PREPOSTO,'
      '  TB_CADASTRO.NUM_CGC_CPF,'
      '  NVL(TB_NOME_NOTA.NOME,TB_CADASTRO.NOME),'
      '  TB_OPERACAO."COD_OPERACAO" ,'
      '  TB_OPERACAO."DESC_OPERACAO" ,'
      '  TB_NOTA_CAB."COD_NOTA_CAB" ,'
      '  TB_NOTA_CAB."NUM_NOTA" ,'
      '  TB_NOTA_CAB."COD_SERIE" ,'
      '  TB_NOTA_CAB."COD_FILIAL",'
      '  TB_NOTA_CAB."COD_TRANSPORTADOR" ,'
      '  TB_NOTA_CAB."COD_DEPARTAMENTO" ,'
      '  TB_CAD_TRANS.NUM_CGC_CPF,'
      '  TB_NOTA_CAB."DT_EMISSAO" ,'
      '  TB_NOTA_CAB."IND_TIPO_FRETE" ,'
      '  TB_NOTA_CAB."NUM_CONHECIMENTO_FRETE" ,'
      '  TB_NOTA_CAB."VAL_DESCONTO" ,'
      '  TB_NOTA_CAB."VAL_DESPESAS" ,'
      '  TB_NOTA_CAB."DT_RECEBIMENTO" ,'
      '  TB_NOTA_CAB."VAL_FRETE",'
      '  TB_NOTA_CAB."DESC_TRANSPORTADORA",'
      '  TB_NOTA_CAB.COD_VENDEDOR,'
      '  V.NOME,'
      '  TB_OBRA.COD_OBRA,'
      '  TB_NOTA_CAB.OBS,'
      '  TB_OBRA.DESC_OBRA,'
      '  TB_NOTA_CAB.NUM_VOLUMES,'
      '  TB_TRIBUTACAO.DESC_SITUACAO_TRIB,'
      '  TB_TRIBUTACAO.DESC_CSOSN,'
      '  TB_CADASTRO.IND_FISICA_JURIDICA,'
      '  TB_CADASTRO.NUM_INSCRICAO,  '
      '  TB_CADASTRO.IND_CONTRIBUINTE')
    Variables.Data = {
      03000000130000000E0000003A454E54524144415F5341494441050000000000
      000000000000090000003A434144415354524F03000000000000000000000007
      0000003A46494C49414C030000000000000000000000090000003A4F50455241
      43414F030000000000000000000000070000003A444154415F490C0000000000
      000000000000070000003A444154415F460C0000000000000000000000090000
      003A534954554143414F0500000000000000000000000D0000003A434F445F56
      454E4445444F52030000000000000000000000090000003A434F445F4F425241
      030000000000000000000000110000003A434F445F444550415254414D454E54
      4F0300000000000000000000000A0000003A434F445F4D415243410300000000
      00000000000000080000003A544142454C4153010000000A000000414E442031
      203D203100000000000B0000003A46494E414C4944414445010000000A000000
      414E442031203D20310000000000160000003A434F445F56454E4445444F525F
      505245504F53544F0300000000000000000000000C0000003A434F445F50524F
      4455544F0300000000000000000000000F0000003A434F445F464F524E454345
      444F520300000000000000000000000C0000003A434F445F43554C5455524103
      0000000000000000000000120000003A434F445F5452414E53504F525441444F
      520300000000000000000000000F0000003A494E445F5449504F5F4652455445
      050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001C0000000B000000444553435F46494C49414C0100000000000C0000
      00434F445F434144415354524F0100000000000F0000004E4F4D455F464F524E
      454345444F520100000000000C000000434F445F4F5045524143414F01000000
      00000D000000444553435F4F5045524143414F0100000000000C000000434F44
      5F4E4F54415F434142010000000000080000004E554D5F4E4F54410100000000
      0009000000434F445F53455249450100000000000A000000434F445F46494C49
      414C01000000000011000000434F445F5452414E53504F525441444F52010000
      0000000A00000044545F454D495353414F0100000000000E000000494E445F54
      49504F5F4652455445010000000000160000004E554D5F434F4E484543494D45
      4E544F5F46524554450100000000000C00000056414C5F444553434F4E544F01
      00000000000C00000056414C5F44455350455341530100000000000E00000044
      545F5245434542494D454E544F0100000000000900000056414C5F4652455445
      01000000000013000000444553435F5452414E53504F525441444F5241010000
      0000000A0000005356414C5F544F54414C0100000000000800000056454E4445
      444F5201000000000008000000434F445F4F4252410100000000000900000044
      4553435F4F4252410100000000000B0000004E554D5F4347435F435046010000
      000000110000004E554D5F4347435F4350465F5452414E530100000000000300
      00004F425301000000000010000000434F445F444550415254414D454E544F01
      000000000015000000434F445F56454E4445444F525F505245504F53544F0100
      000000000B0000004E554D5F564F4C554D4553010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QConferenciaCalcFields
    Left = 681
    Top = 184
    object QConferenciaDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QConferenciaCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QConferenciaNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      Required = True
      Size = 50
    end
    object QConferenciaCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
      Required = True
    end
    object QConferenciaDESC_OPERACAO: TStringField
      FieldName = 'DESC_OPERACAO'
      Required = True
      Size = 30
    end
    object QConferenciaCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QConferenciaNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QConferenciaCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QConferenciaCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QConferenciaCOD_TRANSPORTADOR: TIntegerField
      FieldName = 'COD_TRANSPORTADOR'
    end
    object QConferenciaDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QConferenciaIND_TIPO_FRETE: TStringField
      FieldName = 'IND_TIPO_FRETE'
      Size = 3
    end
    object QConferenciaNUM_CONHECIMENTO_FRETE: TIntegerField
      FieldName = 'NUM_CONHECIMENTO_FRETE'
    end
    object QConferenciaVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
      DisplayFormat = '###,###,##0.00'
    end
    object QConferenciaVAL_DESPESAS: TFloatField
      FieldName = 'VAL_DESPESAS'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object QConferenciaDT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
    end
    object QConferenciaVAL_FRETE: TFloatField
      FieldName = 'VAL_FRETE'
      Required = True
    end
    object QConferenciaDESC_TRANSPORTADORA: TStringField
      FieldName = 'DESC_TRANSPORTADORA'
      Size = 50
    end
    object QConferenciaSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object QConferencianome_transportador: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome_transportador'
      Size = 35
      Calculated = True
    end
    object QConferenciaVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Size = 83
    end
    object QConferenciaCOD_OBRA: TIntegerField
      FieldName = 'COD_OBRA'
    end
    object QConferenciaDESC_OBRA: TStringField
      FieldName = 'DESC_OBRA'
      Size = 60
    end
    object QConferenciaOBS: TStringField
      FieldName = 'OBS'
      Size = 60
    end
    object QConferenciaNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object QConferenciaNUM_CGC_CPF_TRANS: TStringField
      FieldName = 'NUM_CGC_CPF_TRANS'
      Size = 18
    end
    object QConferenciaCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
    end
    object QConferenciaNUM_VOLUMES: TIntegerField
      FieldName = 'NUM_VOLUMES'
    end
  end
  object QConfItem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_NOTA_ITEM.COD_NOTA_ITEM,'
      '  TB_NOTA_ITEM.COD_NOTA_CAB,'
      '  TB_NOTA_ITEM.COD_TRIBUTACAO,'
      '  TB_NOTA_ITEM.QT_QUANTIDADE,'
      
        '  -- N'#195'O DEVE CONSIDERAR ST SE CST FOR DE SUBSTITUI'#199#195'O TRIBUT'#193'RI' +
        'A ANTERIOR  '
      '  CASE'
      
        '    WHEN ((TB_TRIBUTACAO.DESC_SITUACAO_TRIB LIKE '#39'%60'#39' OR TB_TRI' +
        'BUTACAO.DESC_CSOSN LIKE '#39'500'#39')'
      
        '        AND (TB_CADASTRO.IND_FISICA_JURIDICA = '#39'J'#39' AND TB_CADAST' +
        'RO.NUM_INSCRICAO IS NOT NULL AND TB_CADASTRO.NUM_INSCRICAO <> '#39'I' +
        'SENTO'#39
      '        AND TB_CADASTRO.IND_CONTRIBUINTE = '#39'SIM'#39')) THEN    '
      
        '            TB_NOTA_ITEM.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_' +
        'ITEM.COD_NOTA_ITEM) + TB_NOTA_ITEM.VAL_IPI+TB_NOTA_ITEM.VAL_DESP' +
        'ESAS'
      '        ELSE            '
      
        '            TB_NOTA_ITEM.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_' +
        'ITEM.COD_NOTA_ITEM) + TB_NOTA_ITEM.VAL_IPI+TB_NOTA_ITEM.VAL_DESP' +
        'ESAS+TB_NOTA_ITEM.VAL_ICMS_SUBST'
      '  END AS VAL_TOTAL,'
      '  TB_NOTA_ITEM.PERC_IPI,'
      '  TB_NOTA_ITEM.PERC_COMISSAO,'
      '  TB_NOTA_ITEM.COD_PRODUTO,'
      '  TB_NOTA_ITEM.COD_LOTE_TIPO,'
      '  TB_NOTA_ITEM.VAL_DESCONTO,'
      '  TB_NOTA_ITEM.VAL_DESPESAS,'
      '  TB_NOTA_ITEM.VAL_FRETE,'
      '  TB_NOTA_ITEM.PERC_DESCONTO,'
      '  TB_NOTA_ITEM.VAL_IPI,'
      
        '  TB_NOTA_ITEM.VAL_UNITARIO - TB_NOTA_ITEM.VAL_DESCONTO AS VAL_U' +
        'NITARIO,'
      '  TB_NOTA_ITEM.VAL_ICM_BASE,'
      '  TB_NOTA_ITEM.VAL_ICM,'
      '  TB_NOTA_ITEM.IND_CLASS_IPI,'
      '  TB_NOTA_ITEM.VAL_ICMS_SUBST,'
      '  TB_NOTA_ITEM.VAL_CUSTO,'
      '  TB_NOTA_ITEM.VAL_ISS,'
      '  TB_NOTA_ITEM.PERC_INSS,'
      '  TB_NOTA_ITEM.PERC_BENEFICIADO,'
      '  TB_NOTA_ITEM.IND_BX_CONTR_VEND,'
      '  TB_NOTA_ITEM.NUM_NOTA_PRODUTOR,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_PRODUTO.NUM_FABRICANTE FABRICANTE,'
      '  TB_PRODUTO.DESC_UNIDADE,'
      '  TB_PRODUTO.NUM_EMBALAGEM,'
      '  TB_LOTE_TIPO.DESC_LOTE,'
      '  TB_CLASSE.DESC_CLASSE'
      'FROM'
      '  TB_NOTA_ITEM,'
      '  TB_PRODUTO,'
      '  TB_LOTE_TIPO,'
      '  TB_CLASSE,'
      '  TB_NOTA_CAB,'
      '  TB_CADASTRO,'
      '  TB_TRIBUTACAO'
      'WHERE'
      '  (TB_LOTE_TIPO.COD_LOTE_TIPO = TB_NOTA_ITEM.COD_LOTE_TIPO)'
      '  AND'
      '  (TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO)'
      '  AND'
      '  TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB'
      '  AND'
      '  TB_CADASTRO.COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO'
      '  AND'
      '  TB_NOTA_ITEM.COD_TRIBUTACAO = TB_TRIBUTACAO.COD_TRIBUTACAO'
      '  AND'
      '  TB_PRODUTO.COD_CLASSE =  TB_CLASSE.COD_CLASSE'
      '  AND'
      '  TB_NOTA_ITEM.COD_NOTA_CAB = :COD_NOTA_CAB')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001F0000000D000000434F445F4E4F54415F4954454D0100000000000C
      000000434F445F4E4F54415F4341420100000000000E000000434F445F545249
      4255544143414F0100000000000D00000051545F5155414E5449444144450100
      000000000900000056414C5F544F54414C01000000000008000000504552435F
      4950490100000000000D000000504552435F434F4D495353414F010000000000
      0B000000434F445F50524F4455544F0100000000000D000000434F445F4C4F54
      455F5449504F0100000000000C00000056414C5F444553434F4E544F01000000
      00000C00000056414C5F44455350455341530100000000000900000056414C5F
      46524554450100000000000D000000504552435F444553434F4E544F01000000
      00000700000056414C5F4950490100000000000C00000056414C5F554E495441
      52494F0100000000000C00000056414C5F49434D5F4241534501000000000007
      00000056414C5F49434D0100000000000D000000494E445F434C4153535F4950
      490100000000000900000056414C5F435553544F010000000000070000005641
      4C5F49535301000000000009000000504552435F494E53530100000000001000
      0000504552435F42454E454649434941444F01000000000011000000494E445F
      42585F434F4E54525F56454E44010000000000110000004E554D5F4E4F54415F
      50524F4455544F520100000000000C000000444553435F50524F4455544F0100
      0000000009000000444553435F4C4F54450100000000000E00000056414C5F49
      434D535F53554253540100000000000B000000444553435F434C415353450100
      000000000A000000464142524943414E54450100000000000C00000044455343
      5F554E49444144450100000000000D0000004E554D5F454D42414C4147454D01
      0000000000}
    Master = QConferencia
    MasterFields = 'COD_NOTA_CAB'
    DetailFields = 'COD_NOTA_CAB'
    Session = DMOracle.DBCemapa
    Left = 680
    Top = 234
    object QConfItemCOD_NOTA_ITEM: TIntegerField
      FieldName = 'COD_NOTA_ITEM'
      Required = True
    end
    object QConfItemCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QConfItemCOD_TRIBUTACAO: TIntegerField
      FieldName = 'COD_TRIBUTACAO'
      Required = True
    end
    object QConfItemQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
      DisplayFormat = '###,##0.00'
    end
    object QConfItemVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object QConfItemPERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
      Required = True
      DisplayFormat = '#0.00'
    end
    object QConfItemPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      Required = True
      DisplayFormat = '#0.00'
    end
    object QConfItemCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QConfItemCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
      Required = True
    end
    object QConfItemVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object QConfItemVAL_DESPESAS: TFloatField
      FieldName = 'VAL_DESPESAS'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object QConfItemVAL_FRETE: TFloatField
      FieldName = 'VAL_FRETE'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object QConfItemPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
      Required = True
      DisplayFormat = '#0.00'
    end
    object QConfItemVAL_IPI: TFloatField
      FieldName = 'VAL_IPI'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object QConfItemVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object QConfItemVAL_ICM_BASE: TFloatField
      FieldName = 'VAL_ICM_BASE'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object QConfItemVAL_ICM: TFloatField
      FieldName = 'VAL_ICM'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object QConfItemIND_CLASS_IPI: TStringField
      FieldName = 'IND_CLASS_IPI'
      Required = True
      Size = 1
    end
    object QConfItemVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object QConfItemVAL_ISS: TFloatField
      FieldName = 'VAL_ISS'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object QConfItemPERC_INSS: TFloatField
      FieldName = 'PERC_INSS'
      DisplayFormat = '#0.00'
    end
    object QConfItemPERC_BENEFICIADO: TFloatField
      FieldName = 'PERC_BENEFICIADO'
      DisplayFormat = '#0.00'
    end
    object QConfItemIND_BX_CONTR_VEND: TStringField
      FieldName = 'IND_BX_CONTR_VEND'
      Size = 1
    end
    object QConfItemNUM_NOTA_PRODUTOR: TIntegerField
      FieldName = 'NUM_NOTA_PRODUTOR'
    end
    object QConfItemDESC_LOTE: TStringField
      FieldName = 'DESC_LOTE'
    end
    object QConfItemDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QConfItemDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QConfItemFABRICANTE: TStringField
      FieldName = 'FABRICANTE'
      Size = 15
    end
    object QConfItemVAL_ICMS_SUBST: TFloatField
      FieldName = 'VAL_ICMS_SUBST'
    end
    object QConfItemDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 3
    end
    object QConfItemNUM_EMBALAGEM: TFloatField
      FieldName = 'NUM_EMBALAGEM'
    end
  end
  object QConfContaPagar: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_CONTA_PAGAR_CAB."DT_VENCIMENTO" AS DT_VENCIMENTO,'
      '  TB_FINALIDADE."DESC_FINALIDADE" AS DESC_FINALIDADE,'
      '  TB_CONTA_PAGAR_CAB."COD_NOTA_CAB" AS COD_NOTA_CAB,'
      '  TB_CONTA_PAGAR_CAB."COD_FINALIDADE" AS COD_FINALIDADE,'
      '  TB_CONTA_PAGAR_CAB."NUM_TITULO" AS NUM_TITULO,'
      '  TB_CONTA_PAGAR_CAB."VAL_TITULO" AS VAL_TITULO,'
      '  TB_CONTA_PAGAR_CAB."NUM_PARCELA" AS NUM_PARCELA'
      'FROM'
      '  TB_CONTA_PAGAR_CAB,'
      '  TB_FINALIDADE'
      'WHERE'
      
        '  (TB_CONTA_PAGAR_CAB.COD_FINALIDADE = TB_FINALIDADE.COD_FINALID' +
        'ADE)'
      '  AND'
      '  TB_CONTA_PAGAR_CAB.COD_NOTA_CAB = :COD_NOTA_CAB'
      '  AND'
      '  (:COD_FINALIDADE IS NULL'
      '   OR'
      '    TB_CONTA_PAGAR_CAB.COD_FINALIDADE = :COD_FINALIDADE)'
      ''
      'UNION'
      ''
      'SELECT'
      '  TB_CONTA_RECEBER_CAB."DT_VENCIMENTO" AS DT_VENCIMENTO,'
      '  TB_FINALIDADE."DESC_FINALIDADE" AS DESC_FINALIDADE,'
      '  TB_CONTA_RECEBER_CAB."COD_NOTA_CAB" AS COD_NOTA_CAB,'
      '  TB_CONTA_RECEBER_CAB."COD_FINALIDADE" AS COD_FINALIDADE,'
      '  TB_CONTA_RECEBER_CAB."NUM_TITULO" AS NUM_TITULO,'
      '  TB_CONTA_RECEBER_CAB."VAL_TITULO" AS VAL_TITULO,'
      '  TB_CONTA_RECEBER_CAB."NUM_PARCELA" AS NUM_PARCELA'
      'FROM'
      '  TB_CONTA_RECEBER_CAB,'
      '  TB_FINALIDADE'
      'WHERE'
      
        '  (TB_CONTA_RECEBER_CAB.COD_FINALIDADE = TB_FINALIDADE.COD_FINAL' +
        'IDADE)'
      '  AND'
      '  TB_CONTA_RECEBER_CAB.COD_NOTA_CAB = :COD_NOTA_CAB'
      '  AND'
      '  (:COD_FINALIDADE IS NULL'
      '   OR'
      '    TB_CONTA_RECEBER_CAB.COD_FINALIDADE = :COD_FINALIDADE)'
      ' ')
    Variables.Data = {
      03000000020000000D0000003A434F445F4E4F54415F43414203000000000000
      00000000000F0000003A434F445F46494E414C49444144450300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000D00000044545F56454E43494D454E544F0100000000000F
      000000444553435F46494E414C49444144450100000000000C000000434F445F
      4E4F54415F4341420100000000000E000000434F445F46494E414C4944414445
      0100000000000A0000004E554D5F544954554C4F0100000000000A0000005641
      4C5F544954554C4F0100000000000B0000004E554D5F50415243454C41010000
      000000}
    Master = QConferencia
    MasterFields = 'COD_NOTA_CAB'
    DetailFields = 'COD_NOTA_CAB'
    Session = DMOracle.DBCemapa
    Left = 680
    Top = 282
    object QConfContaPagarDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object QConfContaPagarDESC_FINALIDADE: TStringField
      FieldName = 'DESC_FINALIDADE'
      Required = True
      Size = 30
    end
    object QConfContaPagarCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QConfContaPagarCOD_FINALIDADE: TIntegerField
      FieldName = 'COD_FINALIDADE'
      Required = True
    end
    object QConfContaPagarVAL_TITULO: TFloatField
      FieldName = 'VAL_TITULO'
      DisplayFormat = '###,##0.00'
    end
    object QConfContaPagarNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object QConfContaPagarNUM_TITULO: TFloatField
      FieldName = 'NUM_TITULO'
    end
  end
  object QRClienteComCompra: TOracleDataSet1
    SQL.Strings = (
      'SELECT DISTINCT'
      '  Tb_cadastro.COD_CADASTRO,'
      '  Tb_cadastro.NOME,'
      '  Tb_cadastro.DESC_ENDERECO,'
      '  TB_CADASTRO.COD_CIDADE,'
      '  Tb_cadastro.DESC_CIDADE,'
      '  Tb_cadastro.COD_ESTADO,'
      '  Tb_cadastro.DESC_TELEFONE,'
      
        '  SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.C' +
        'OD_NOTA_ITEM)  +Tb_nota_item.VAL_DESPESAS+Tb_nota_item.VAL_FRETE' +
        '+TB_NOTA_ITEM.VAL_ICMS_SUBST + Tb_nota_item.VAL_IPI) AS VAL_TOTA' +
        'L'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_CADASTRO,'
      '  TB_PRODUTO'
      'WHERE'
      '  TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '  AND'
      '  TB_PRODUTO.COD_PRODUTO = TB_NOTA_ITEM.COD_PRODUTO'
      '  AND'
      '  (TB_NOTA_CAB.COD_CADASTRO = Tb_cadastro.COD_CADASTRO)'
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      '  AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO >= :DT_EMISSAO_I'
      '  AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO <= :DT_EMISSAO_F'
      '  AND'
      '  (:COD_FILIAL IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      '  AND'
      '  (:TIPO_CADASTRO IS NULL'
      '   OR'
      '    TB_CADASTRO.COD_TIPO_CADASTRO = :TIPO_CADASTRO)'
      '  AND'
      '  (:RAMO IS NULL'
      '    OR'
      '    TB_CADASTRO.COD_RAMO = :RAMO)'
      '  AND'
      '  (:COD_VENDEDOR IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_VENDEDOR = :COD_VENDEDOR)'
      '  AND'
      '  (:VENDEDOR_PREPOSTO IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO = :VENDEDOR_PREPOSTO)'
      '   AND'
      '   (:COD_CLASSE IS NULL'
      '    OR'
      '     TB_PRODUTO.COD_CLASSE = :COD_CLASSE)'
      '   AND'
      '   (:COD_CIDADE IS NULL'
      '    OR'
      '     TB_CADASTRO.COD_CIDADE = :COD_CIDADE)'
      '   AND'
      '   (:COD_PRODUTO IS NULL'
      '    OR'
      '      TB_NOTA_ITEM.COD_PRODUTO = :COD_PRODUTO)'
      '   AND'
      '   (:COD_REGIAO IS NULL'
      '    OR '
      '      TB_CADASTRO.COD_REGIAO = :COD_REGIAO)'
      'GROUP BY'
      '  Tb_cadastro.COD_CADASTRO,'
      '  Tb_cadastro.NOME,'
      '  Tb_cadastro.DESC_ENDERECO,'
      '  TB_CADASTRO.COD_CIDADE,'
      '  Tb_cadastro.DESC_CIDADE,'
      '  Tb_cadastro.COD_ESTADO,'
      '  Tb_cadastro.DESC_TELEFONE'
      'ORDER BY'
      '  Tb_cadastro.DESC_CIDADE,'
      '  Tb_cadastro.NOME')
    Variables.Data = {
      030000000B0000000D0000003A44545F454D495353414F5F490C000000000000
      00000000000D0000003A44545F454D495353414F5F460C000000000000000000
      00000B0000003A434F445F46494C49414C0300000000000000000000000D0000
      003A434F445F56454E4445444F520300000000000000000000000B0000003A43
      4F445F434C41535345030000000000000000000000120000003A56454E444544
      4F525F505245504F53544F0300000000000000000000000E0000003A5449504F
      5F434144415354524F030000000000000000000000050000003A52414D4F0300
      000000000000000000000B0000003A434F445F43494441444503000000000000
      00000000000C0000003A434F445F50524F4455544F0300000000000000000000
      000B0000003A434F445F52454749414F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000008000000040000004E4F4D450100000000000C000000434F445F4341
      44415354524F0100000000000D000000444553435F454E44455245434F010000
      0000000B000000444553435F4349444144450100000000000A000000434F445F
      45535441444F0100000000000D000000444553435F54454C45464F4E45010000
      0000000900000056414C5F544F54414C0100000000000A000000434F445F4349
      44414445010000000000}
    ReadOnly = True
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 376
    Top = 424
    object QRClienteComCompraCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRClienteComCompraNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRClienteComCompraDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      Size = 40
    end
    object QRClienteComCompraDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object QRClienteComCompraCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
    object QRClienteComCompraDESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 12
    end
    object QRClienteComCompraVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QRClienteComCompraCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
  end
  object QREtiq_ItemsNF: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_NOTA_CAB.COD_CADASTRO,'
      '  TB_NOTA_ITEM.COD_PRODUTO,'
      '  TB_NOTA_ITEM.QT_QUANTIDADE,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_NOTA_CAB.NUM_NOTA,'
      '  TB_NOTA_CAB.NUM_VOLUMES,'
      '  TB_CIDADE.DESC_CIDADE,'
      '  TB_FILIAL.DESC_FILIAL,'
      '  TB_FILIAL.DESC_TELEFONE'
      'FROM'
      '  TB_NOTA_ITEM,'
      '  TB_NOTA_CAB,'
      '  TB_PRODUTO,'
      '  TB_CADASTRO,'
      '  TB_CIDADE,'
      '  TB_FILIAL'
      'WHERE'
      '  (TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB)'
      '  AND'
      '  (TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO)'
      '  AND'
      '  (TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO)'
      '  AND'
      '  (TB_CADASTRO.COD_CIDADE = TB_CIDADE.COD_CIDADE)'
      '  AND'
      '  (TB_NOTA_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL)'
      '  AND'
      '  (TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39')'
      '  AND'
      '  (TB_NOTA_CAB.IND_SITUACAO=2)'
      '  AND'
      '  ((:COD_SERIE IS NULL) OR'
      '  (TB_NOTA_CAB.COD_SERIE = :COD_SERIE))'
      '  AND'
      '  TB_NOTA_CAB.NUM_NOTA >= :NUM_NOTA_I'
      '  AND'
      '  TB_NOTA_CAB.NUM_NOTA <= :NUM_NOTA_F')
    Variables.Data = {
      03000000030000000B0000003A4E554D5F4E4F54415F49030000000000000000
      0000000B0000003A4E554D5F4E4F54415F460300000000000000000000000A00
      00003A434F445F5345524945050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000C000000434F445F434144415354524F0100000000000B00
      0000434F445F50524F4455544F0100000000000C000000444553435F50524F44
      55544F010000000000080000004E554D5F4E4F54410100000000000D00000051
      545F5155414E5449444144450100000000000B000000444553435F4349444144
      450100000000000B0000004E554D5F564F4C554D45530100000000000B000000
      444553435F46494C49414C0100000000000D000000444553435F54454C45464F
      4E45010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QREtiq_ItemsNFCalcFields
    Left = 40
    Top = 424
    object QREtiq_ItemsNFCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QREtiq_ItemsNFCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QREtiq_ItemsNFNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QREtiq_ItemsNFnome: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome'
      Size = 50
      Calculated = True
    end
    object QREtiq_ItemsNFQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object QREtiq_ItemsNFDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QREtiq_ItemsNFDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Required = True
      Size = 50
    end
    object QREtiq_ItemsNFNUM_VOLUMES: TIntegerField
      FieldName = 'NUM_VOLUMES'
    end
    object QREtiq_ItemsNFDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QREtiq_ItemsNFDESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 12
    end
  end
  object QRNotaContaCorrente: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_NOTA_CAB.NUM_NOTA,'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      '  TB_CADASTRO.NOME,'
      '  SUM(TB_NOTA_ITEM.VAL_TOTAL) AS TOTAL_NOTA'
      'FROM'
      '  TB_NOTA_CAB, TB_CADASTRO, TB_NOTA_ITEM'
      'WHERE'
      '  TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      '  TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '  AND'
      '  TB_NOTA_CAB.NUM_NOTA <> :NUM_NOTA'
      '  AND'
      '  TB_NOTA_CAB.COD_NOTA_CONTA_CORRENTE = :COD_NOTA_CONTA_CORRENTE'
      'GROUP BY'
      '  TB_NOTA_CAB.NUM_NOTA, TB_NOTA_CAB.DT_EMISSAO,TB_CADASTRO.NOME')
    Variables.Data = {
      0300000002000000180000003A434F445F4E4F54415F434F4E54415F434F5252
      454E5445030000000000000000000000090000003A4E554D5F4E4F5441030000
      000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000080000004E554D5F4E4F54410100000000000A0000004454
      5F454D495353414F010000000000040000004E4F4D450100000000000A000000
      544F54414C5F4E4F5441010000000000}
    Session = DMOracle.DBCemapa
    Left = 584
    Top = 264
    object QRNotaContaCorrenteNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRNotaContaCorrenteDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRNotaContaCorrenteNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRNotaContaCorrenteTOTAL_NOTA: TFloatField
      FieldName = 'TOTAL_NOTA'
    end
  end
  object QRSeguroCarga1: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '('
      '  SELECT'
      '    Tb_estado.COD_ESTADO,'
      '    Tb_estado.DESC_ESTADO,'
      '    Tb_estado.PERC_FRETE,'
      '    SUM(Tb_nota_item.VAL_TOTAL) AS SVal_Total'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_CADASTRO,'
      '    TB_ESTADO,'
      '    TB_OPERACAO'
      '  WHERE'
      '     (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)'
      '     AND'
      '     (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO)'
      '     AND'
      '     (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)'
      '     AND'
      '     (Tb_nota_cab.COD_ESTADO = Tb_estado.COD_ESTADO)'
      '     AND'
      '     (Tb_nota_cab.COD_SERIE <> '#39'PE'#39')'
      '     AND'
      '     (TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39')'
      '     AND'
      '     (TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39')'
      '  /*   AND'
      '     (TB_OPERACAO.IND_VENDAS = '#39'V'#39') ALTERADO SERGIO 29/11/2002*/'
      '  /*   AND'
      
        '     (TB_OPERACAO.IND_EMITE = '#39'F'#39') *A PEDIDO DA ROSE 08/09/2004 ' +
        '*/'
      '     AND'
      '     (TB_NOTA_CAB.IND_NOTA_SEGURO = '#39'SIM'#39')'
      '     AND'
      '     (TB_NOTA_CAB.DT_EMISSAO >= :DATA_I)'
      '     AND'
      '     (TB_NOTA_CAB.DT_EMISSAO <= :DATA_F)'
      '     AND'
      '     (:FILIAL IS NULL OR'
      '       TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '     AND'
      '     (:COD_OPERACAO IS NULL OR'
      '       TB_NOTA_CAB.COD_OPERACAO = :COD_OPERACAO)'
      '     AND'
      '     (:IND_ENT_SAIDA IS NULL OR'
      '       TB_NOTA_CAB.IND_ENTRADA_SAIDA = :IND_ENT_SAIDA)'
      '  GROUP BY'
      '    Tb_estado.COD_ESTADO,'
      '    Tb_estado.DESC_ESTADO,'
      '    Tb_estado.PERC_FRETE'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_estado.COD_ESTADO,'
      '    Tb_estado.DESC_ESTADO,'
      '    Tb_estado.PERC_FRETE,'
      '    SUM(Tb_nota_item.VAL_TOTAL) AS SVal_Total'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_CADASTRO,'
      '    TB_ESTADO,'
      '    TB_OPERACAO'
      '  WHERE'
      '     (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)'
      '     AND'
      '     (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO)'
      '     AND'
      '     (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)'
      '     AND'
      '     (Tb_nota_cab.COD_ESTADO = Tb_estado.COD_ESTADO)'
      '     AND'
      '     (Tb_nota_cab.COD_SERIE <> '#39'PE'#39')'
      '     AND'
      '     (TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39')'
      '     AND'
      '     (TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39')'
      '  /*   AND'
      '     (TB_OPERACAO.IND_VENDAS = '#39'V'#39') ALTERADO SERGIO 29/11/2002*/'
      '  /*   AND'
      
        '     (TB_OPERACAO.IND_EMITE = '#39'F'#39') *A PEDIDO DA ROSE 08/09/2004 ' +
        '*/'
      '     AND'
      '     (TB_NOTA_CAB.IND_NOTA_SEGURO = '#39'SIM'#39')'
      '     AND'
      '     (TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I)'
      '     AND'
      '     (TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F)'
      '     AND'
      '     (:FILIAL IS NULL OR'
      '       TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '     AND'
      '     (:COD_OPERACAO IS NULL OR'
      '       TB_NOTA_CAB.COD_OPERACAO = :COD_OPERACAO)'
      '     AND'
      '     (:IND_ENT_SAIDA IS NULL OR'
      '       TB_NOTA_CAB.IND_ENTRADA_SAIDA = :IND_ENT_SAIDA)'
      '  GROUP BY'
      '    Tb_estado.COD_ESTADO,'
      '    Tb_estado.DESC_ESTADO,'
      '    Tb_estado.PERC_FRETE'
      ''
      ')'
      'ORDER BY'
      '  DESC_ESTADO'
      ''
      ''
      '')
    Variables.Data = {
      0300000005000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000070000003A46494C4941
      4C0300000000000000000000000E0000003A494E445F454E545F534149444105
      00000000000000000000000D0000003A434F445F4F5045524143414F03000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000A0000005356414C5F544F54414C0100000000000B000000
      444553435F45535441444F0100000000000A000000504552435F465245544501
      00000000000A000000434F445F45535441444F010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 144
    Top = 368
    object QRSeguroCarga1COD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
    object QRSeguroCarga1DESC_ESTADO: TStringField
      FieldName = 'DESC_ESTADO'
      Size = 30
    end
    object QRSeguroCarga1PERC_FRETE: TFloatField
      FieldName = 'PERC_FRETE'
    end
    object QRSeguroCarga1SVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
  end
  object QRVendaVendedorCliente: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_PRODUTO +0.00 AS COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  COD_CADASTRO + 0.00 AS COD_CADASTRO,'
      '  NOME_CLIENTE,'
      '  TELEFONE,'
      '  CLASSIFICACAO,'
      '  COD_VENDEDOR + 0.00 AS COD_VENDEDOR,'
      '  NOME_VENDEDOR,'
      '  SQT_QUANTIDADE,'
      '  SVAL_TOTAL'
      'FROM'
      '('
      '  SELECT'
      '    TB_PRODUTO.COD_PRODUTO,'
      '    TB_PRODUTO.DESC_PRODUTO,'
      '    TB_CADASTRO.COD_CADASTRO,'
      '    TB_CADASTRO.NOME AS NOME_CLIENTE,'
      '    TB_CADASTRO.DESC_TELEFONE AS TELEFONE,'
      '    TB_CLASS_CADASTRO.DESC_CLASSIFICACAO AS CLASSIFICACAO,'
      '    TB_VENDEDOR.COD_VENDEDOR,'
      '    TB_VENDEDOR.NOME AS NOME_VENDEDOR,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.QT_QUANTI' +
        'DADE,(Tb_nota_item.QT_QUANTIDADE * -1))) AS SQT_QUANTIDADE,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.VAL_TOTAL' +
        ' - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item' +
        '.VAL_DESPESAS + Tb_nota_item.VAL_FRETE,(Tb_nota_item.VAL_TOTAL -' +
        ' PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.V' +
        'AL_DESPESAS + Tb_nota_item.VAL_FRETE)*-1)) AS SVAL_TOTAL'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_PRODUTO,'
      '    TB_CADASTRO,'
      '    TB_VENDEDOR,'
      '    TB_CLASS_CADASTRO'
      '  WHERE'
      '    TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '    AND'
      '    TB_PRODUTO.COD_PRODUTO = TB_NOTA_ITEM.COD_PRODUTO'
      '    AND'
      '    TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '    AND'
      '    TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '    AND'
      '    TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '    AND'
      '    (:CANCELADO_SIM_NAO IS NULL'
      '     OR'
      '     (:CANCELADO_SIM_NAO = '#39'NAO'#39' AND COD_MOTIVO IS NULL))'
      '    AND'
      
        '    TB_CADASTRO.COD_CLASS_CADASTRO = TB_CLASS_CADASTRO.COD_CLASS' +
        '_CADASTRO'
      '    AND'
      '    (:RAMO IS NULL'
      '      OR'
      '      TB_CADASTRO.COD_RAMO = :RAMO)'
      '    AND'
      '    ((TB_OPERACAO.IND_VENDAS = '#39'V'#39') OR'
      '      (TB_OPERACAO.IND_VENDAS = '#39'D'#39'))'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    (:CLASSE IS NULL'
      '      OR'
      '        TB_PRODUTO.COD_CLASSE = :CLASSE)'
      '    AND'
      '    (:VENDEDOR IS NULL'
      '      OR'
      '        TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '    AND'
      '    (:FILIAL IS NULL'
      '      OR'
      '        TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DT_INICIO'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DT_FINAL'
      '  GROUP BY'
      '    TB_PRODUTO.COD_PRODUTO,'
      '    TB_PRODUTO.DESC_PRODUTO,'
      '    TB_CADASTRO.COD_CADASTRO,'
      '    TB_CADASTRO.NOME,'
      '    TB_CADASTRO.DESC_TELEFONE,'
      '    TB_CLASS_CADASTRO.DESC_CLASSIFICACAO,'
      '    TB_VENDEDOR.COD_VENDEDOR,'
      '    TB_VENDEDOR.NOME'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    0 AS COD_PRODUTO,'
      '    '#39#39' AS DESC_PRODUTO,'
      '    TB_CADASTRO.COD_CADASTRO,'
      '    TB_CADASTRO.NOME AS NOME_CLIENTE,'
      '    TB_CADASTRO.DESC_TELEFONE AS TELEFONE,'
      '    TB_CLASS_CADASTRO.DESC_CLASSIFICACAO AS CLASSIFICACAO,'
      '    TB_VENDEDOR.COD_VENDEDOR,'
      '    TB_VENDEDOR.NOME AS NOME_VENDEDOR,'
      '    0 AS SQT_QUANTIDADE,'
      '    0 AS SVAL_TOTAL'
      '  FROM'
      '    TB_CADASTRO,'
      '    TB_VENDEDOR,'
      '    TB_CLASS_CADASTRO'
      '  WHERE'
      '    TB_CADASTRO.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '    AND'
      
        '    TB_CADASTRO.COD_CLASS_CADASTRO = TB_CLASS_CADASTRO.COD_CLASS' +
        '_CADASTRO'
      '    AND'
      '    (:RAMO IS NULL'
      '      OR'
      '      TB_CADASTRO.COD_RAMO = :RAMO)'
      '    AND'
      '    (:VENDEDOR IS NULL'
      '      OR'
      '        TB_VENDEDOR.COD_VENDEDOR = :VENDEDOR)'
      '    AND'
      '    (:CANCELADO_SIM_NAO IS NULL'
      '     OR'
      '     (:CANCELADO_SIM_NAO = '#39'NAO'#39' AND COD_MOTIVO IS NULL))'
      '  GROUP BY'
      '    TB_CADASTRO.COD_CADASTRO,'
      '    TB_CADASTRO.NOME,'
      '    TB_CADASTRO.DESC_TELEFONE,'
      '    TB_CLASS_CADASTRO.DESC_CLASSIFICACAO,'
      '    TB_VENDEDOR.COD_VENDEDOR,'
      '    TB_VENDEDOR.NOME'
      ')'
      'ORDER BY'
      '  NOME_VENDEDOR,'
      '  COD_VENDEDOR,'
      '  NOME_CLIENTE,'
      '  COD_CADASTRO,'
      '  DESC_PRODUTO,'
      '  COD_PRODUTO'
      '')
    Variables.Data = {
      0300000007000000090000003A56454E4445444F520300000000000000000000
      00070000003A46494C49414C0300000000000000000000000A0000003A44545F
      494E4943494F0C0000000000000000000000090000003A44545F46494E414C0C
      0000000000000000000000070000003A434C4153534503000000000000000000
      0000120000003A43414E43454C41444F5F53494D5F4E414F0500000000000000
      00000000050000003A52414D4F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000B000000434F445F50524F4455544F0100000000000C0000
      00444553435F50524F4455544F0100000000000C000000434F445F4341444153
      54524F0100000000000C0000004E4F4D455F434C49454E54450100000000000C
      000000434F445F56454E4445444F520100000000000D0000004E4F4D455F5645
      4E4445444F520100000000000E0000005351545F5155414E5449444144450100
      000000000A0000005356414C5F544F54414C0100000000000800000054454C45
      464F4E450100000000000D000000434C415353494649434143414F0100000000
      00}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRVendaVendedorClienteCalcFields
    Left = 256
    Top = 439
    object QRVendaVendedorClienteCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRVendaVendedorClienteCOD_CADASTRO: TFloatField
      FieldName = 'COD_CADASTRO'
    end
    object QRVendaVendedorClienteNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object QRVendaVendedorClienteCOD_VENDEDOR: TFloatField
      FieldName = 'COD_VENDEDOR'
    end
    object QRVendaVendedorClienteNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 40
    end
    object QRVendaVendedorClienteSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRVendaVendedorClienteSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRVendaVendedorClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 12
    end
    object QRVendaVendedorClienteCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      Size = 30
    end
    object QRVendaVendedorClientedt_ultima_compra: TDateField
      FieldKind = fkCalculated
      FieldName = 'dt_ultima_compra'
      EditMask = '!99/99/00;1;_'
      Calculated = True
    end
    object QRVendaVendedorClienteDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
  end
  object QRVendaVendedorClasse: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_VENDEDOR AS COD_VENDEDOR,'
      '  NOME,'
      '  COD_CLASSE AS COD_CLASSE,'
      '  DESC_CLASSE,'
      '  SUM(QT_QUANTIDADE) AS QT_QUANTIDADE,'
      '  SUM(VAL_TOTAL) AS VAL_TOTAL,'
      '  SUM(VAL_ICMS) AS VAL_ICMS,'
      '  SUM(VAL_COMISSAO) AS VAL_COMISSAO,'
      '  SUM(VAL_FRETE) AS VAL_FRETE,'
      '  SUM(VAL_CUSTO) AS VAL_CUSTO,'
      '  SUM(TRIB_FED) AS TRIB_FED,'
      '  SUM(VAL_BONIFICACAO) AS VAL_BONIFICACAO'
      'FROM'
      '('
      '  SELECT'
      '    TB_VENDEDOR.COD_VENDEDOR,'
      '    TB_VENDEDOR.NOME,'
      '    TB_CLASSE.COD_CLASSE,'
      '    TB_CLASSE.DESC_CLASSE,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',TB_NOTA_ITEM.QT_QUANTI' +
        'DADE,TB_NOTA_ITEM.QT_QUANTIDADE * -1)*TB_PRODUTO.NUM_EMBALAGEM) ' +
        'AS QT_QUANTIDADE,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',(Tb_nota_item.VAL_TOTA' +
        'L - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_ite' +
        'm.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRETE),' +
        '(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NO' +
        'TA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb' +
        '_nota_item.VAL_FRETE)*-1)) AS VAL_TOTAL,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_EMITE,'#39'F'#39',TB_NOTA_ITEM.VAL_ICM,0)' +
        ') AS VAL_ICMS,'
      
        '    SUM((TB_NOTA_ITEM.VAL_TOTAL- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS)*(DECODE(TB_NOTA_ITE' +
        'M.PERC_COMISSAO,0,DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',TB_NOTA_CAB.' +
        'PERC_COMISSAO,TB_NOTA_CAB.PERC_COMISSAO * -1),DECODE(TB_OPERACAO' +
        '.IND_VENDAS,'#39'V'#39',TB_NOTA_ITEM.PERC_COMISSAO,TB_NOTA_ITEM.PERC_COM' +
        'ISSAO * -1))/100)) AS VAL_COMISSAO,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',TB_NOTA_ITEM.VAL_TOTAL' +
        '*TB_VENDEDOR.PERC_FRETE/100,0)) AS VAL_FRETE,'
      
        '    SUM(TB_PRODUTO.NUM_EMBALAGEM*TB_CLASSE.VAL_CUSTO*DECODE(TB_O' +
        'PERACAO.IND_VENDAS,'#39'V'#39',TB_NOTA_ITEM.QT_QUANTIDADE,TB_NOTA_ITEM.Q' +
        'T_QUANTIDADE*-1)) AS VAL_CUSTO,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_EMITE,'#39'F'#39',TB_NOTA_ITEM.VAL_TOTAL*' +
        '(:VAL_TRIBUTO)/100,0)) AS TRIB_FED,'
      '    0 AS VAL_BONIFICACAO'
      '  FROM'
      '    TB_VENDEDOR,'
      '    TB_PRODUTO,'
      '    TB_CLASSE,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO'
      '  WHERE'
      '    TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB'
      '    AND'
      '    TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '    AND'
      '    TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '    AND'
      '    TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '    AND'
      '    TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '    AND'
      '    ((TB_OPERACAO.IND_VENDAS = '#39'V'#39')'
      '     OR'
      '     (TB_OPERACAO.IND_VENDAS = '#39'D'#39'))'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DT_INICIAL'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DT_FINAL'
      '    AND'
      '    (:VENDEDOR IS NULL'
      '     OR'
      '      TB_VENDEDOR.COD_VENDEDOR = :VENDEDOR)'
      '    AND'
      '    (:SUPERVISOR IS NULL'
      '     OR'
      '      :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '    AND'
      '    (:CLASSE IS NULL'
      '      OR'
      '      TB_CLASSE.COD_CLASSE = :CLASSE)'
      '    AND'
      '    (:FILIAL IS NULL'
      '      OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '  GROUP BY'
      '    TB_VENDEDOR.COD_VENDEDOR,'
      '    TB_VENDEDOR.NOME,'
      '    TB_CLASSE.COD_CLASSE,'
      '    TB_CLASSE.DESC_CLASSE'
      ''
      '  UNION'
      ''
      '  /* *** BONIFICA'#199#213'ES ****  */'
      '  SELECT'
      '    TB_VENDEDOR.COD_VENDEDOR,'
      '    TB_VENDEDOR.NOME,'
      '    TB_CLASSE.COD_CLASSE,'
      '    TB_CLASSE.DESC_CLASSE,'
      '    0 AS QT_QUANTIDADE,'
      '    0 AS VAL_TOTAL,'
      '    0 AS VAL_ICMS,'
      '    0 AS VAL_COMISSAO,'
      '    0 AS VAL_FRETE,'
      '    0 AS VAL_CUSTO,'
      '    0 AS TRIB_FED,'
      
        '    SUM(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM*TB_C' +
        'LASSE.VAL_CUSTO) AS VAL_BONIFICACAO'
      '  FROM'
      '    TB_VENDEDOR,'
      '    TB_PRODUTO,'
      '    TB_CLASSE,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO'
      '  WHERE'
      '    TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB'
      '    AND'
      '    TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '    AND'
      '    TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '    AND'
      '    TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '    AND'
      '    TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '    AND'
      '    (Tb_operacao.ind_bonificacao = '#39'S'#39')'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DT_INICIAL'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DT_FINAL'
      '    AND'
      '    (:VENDEDOR IS NULL'
      '      OR'
      '      TB_VENDEDOR.COD_VENDEDOR = :VENDEDOR)'
      '    AND'
      '    (:SUPERVISOR IS NULL'
      '     OR'
      '      :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '    AND'
      '    (:CLASSE IS NULL'
      '      OR'
      '      TB_CLASSE.COD_CLASSE = :CLASSE)'
      '    AND'
      '    (:FILIAL IS NULL'
      '      OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '  GROUP BY'
      '    TB_VENDEDOR.COD_VENDEDOR,'
      '    TB_VENDEDOR.NOME,'
      '    TB_CLASSE.COD_CLASSE,'
      '    TB_CLASSE.DESC_CLASSE'
      ')'
      'GROUP BY'
      '  COD_VENDEDOR,'
      '  NOME,'
      '  COD_CLASSE,'
      '  DESC_CLASSE'
      'ORDER BY  COD_VENDEDOR,COD_CLASSE')
    Variables.Data = {
      03000000070000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C000000000000000000000007000000
      3A46494C49414C030000000000000000000000070000003A434C415353450300
      00000000000000000000090000003A56454E4445444F52030000000000000000
      0000000C0000003A56414C5F5452494255544F0400000000000000000000000B
      0000003A53555045525649534F52030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C0000000C000000434F445F56454E4445444F520100000000000400
      00004E4F4D450100000000000A000000434F445F434C41535345010000000000
      0B000000444553435F434C415353450100000000000D00000051545F5155414E
      5449444144450100000000000900000056414C5F544F54414C01000000000008
      00000056414C5F49434D530100000000000C00000056414C5F434F4D49535341
      4F0100000000000900000056414C5F4652455445010000000000090000005641
      4C5F435553544F01000000000008000000545249425F4645440100000000000F
      00000056414C5F424F4E494649434143414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 584
    Top = 320
    object QRVendaVendedorClasseNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object QRVendaVendedorClasseDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QRVendaVendedorClasseQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QRVendaVendedorClasseVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QRVendaVendedorClasseVAL_ICMS: TFloatField
      FieldName = 'VAL_ICMS'
    end
    object QRVendaVendedorClasseVAL_COMISSAO: TFloatField
      FieldName = 'VAL_COMISSAO'
    end
    object QRVendaVendedorClasseVAL_FRETE: TFloatField
      FieldName = 'VAL_FRETE'
    end
    object QRVendaVendedorClasseVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
    end
    object QRVendaVendedorClasseTRIB_FED: TFloatField
      FieldName = 'TRIB_FED'
    end
    object QRVendaVendedorClasseVAL_BONIFICACAO: TFloatField
      FieldName = 'VAL_BONIFICACAO'
    end
    object QRVendaVendedorClasseCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QRVendaVendedorClasseCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
    end
  end
  object QRAcompanhaMeta: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  DT_EMISSAO,'
      '  SUM(QUANTIDADE) AS QUANTIDADE,'
      '  SUM(KG) AS KG,'
      '  SUM(VAL_TOTAL) AS VAL_TOTAL,'
      '  SUM(QT_KG_BONIFICACAO) AS QT_KG_BONIFICACAO'
      'FROM'
      '('
      '  SELECT'
      '    /*TB_NOTA_CAB.DT_RECEBIMENTO AS DT_EMISSAO,*/'
      '    TB_NOTA_CAB.DT_EMISSAO AS DT_EMISSAO,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_BONIFICACAO,'#39'S'#39',0,TB_NOTA_ITEM.QT' +
        '_QUANTIDADE)) AS QUANTIDADE,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_BONIFICACAO,'#39'S'#39',0,TB_NOTA_ITEM.QT' +
        '_QUANTIDADE * TB_PRODUTO.NUM_EMBALAGEM)) AS KG,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_BONIFICACAO,'#39'S'#39',0,TB_NOTA_ITEM.VA' +
        'L_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_no' +
        'ta_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_F' +
        'RETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)) AS VAL_TOTAL,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_BONIFICACAO,'#39'S'#39',TB_NOTA_ITEM.QT_Q' +
        'UANTIDADE * TB_PRODUTO.NUM_EMBALAGEM,0)) AS QT_KG_BONIFICACAO'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_PRODUTO,'
      '    TB_VENDEDOR,'
      '    TB_DIAS_UTEIS'
      '  WHERE'
      '    TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '    AND'
      '    TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '    AND'
      '    TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '    AND'
      '    TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    ((TB_OPERACAO.IND_VENDAS = '#39'V'#39') OR'
      '     (TB_OPERACAO.IND_BONIFICACAO = '#39'S'#39'))'
      '    AND'
      '    (:COD_SUPERVISOR IS NULL'
      '     OR'
      '       :COD_SUPERVISOR = TB_VENDEDOR.COD_SUPERVISOR)'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DT_INICIAL'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DT_FINAL'
      '    AND'
      '    (:FILIAL IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '    AND'
      
        '    /*TB_NOTA_CAB.DT_RECEBIMENTO(+)  = TB_DIAS_UTEIS.DIAS_UTEIS*' +
        '/'
      '    TB_NOTA_CAB.DT_EMISSAO(+)  = TB_DIAS_UTEIS.DIAS_UTEIS'
      '  GROUP BY'
      '    /*TB_NOTA_CAB.DT_RECEBIMENTO*/'
      '    TB_NOTA_CAB.DT_EMISSAO'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    /*TB_NOTA_CAB.DT_RECEBIMENTO AS DT_EMISSAO,*/'
      '    TB_NOTA_CAB.DT_RECEBIMENTO AS DT_EMISSAO,'
      '    SUM(TB_NOTA_ITEM.QT_QUANTIDADE * -1) AS QUANTIDADE,'
      
        '    SUM(TB_NOTA_ITEM.QT_QUANTIDADE * TB_PRODUTO.NUM_EMBALAGEM * ' +
        '-1) AS KG,'
      
        '    SUM((TB_NOTA_ITEM.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITE' +
        'M.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_' +
        'IPI + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST) * -1' +
        ') AS VAL_TOTAL,'
      '    0 AS QT_KG_BONIFICACAO'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_PRODUTO,'
      '    TB_VENDEDOR,'
      '    TB_DIAS_UTEIS'
      '  WHERE'
      '    TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '    AND'
      '    TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '    AND'
      '    TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '    AND'
      '    TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    (TB_OPERACAO.IND_VENDAS = '#39'D'#39')'
      '    AND'
      '    (:COD_SUPERVISOR IS NULL'
      '     OR'
      '       :COD_SUPERVISOR = TB_VENDEDOR.COD_SUPERVISOR)'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DT_INICIAL'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DT_FINAL'
      '    AND'
      '    (:FILIAL IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '    AND'
      
        '    /*TB_NOTA_CAB.DT_RECEBIMENTO(+)  = TB_DIAS_UTEIS.DIAS_UTEIS*' +
        '/'
      '    TB_NOTA_CAB.DT_RECEBIMENTO(+)  = TB_DIAS_UTEIS.DIAS_UTEIS'
      '  GROUP BY'
      '    /*TB_NOTA_CAB.DT_RECEBIMENTO*/'
      '    TB_NOTA_CAB.DT_RECEBIMENTO'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    DIAS_UTEIS AS DT_EMISSAO,'
      '    0 AS QUANTIDADE,'
      '    0 AS KG,'
      '    0 AS VAL_TOTAL,'
      '    0 AS QT_KG_BONIFICACAO'
      '  FROM'
      '    TB_DIAS_UTEIS'
      '  WHERE'
      '    DIAS_UTEIS >= :DT_INICIAL'
      '    AND'
      '    DIAS_UTEIS <= :DT_FINAL'
      ''
      ')'
      'GROUP BY'
      '  DT_EMISSAO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Variables.Data = {
      0300000004000000070000003A46494C49414C0300000000000000000000000B
      0000003A44545F494E494349414C0C0000000000000000000000090000003A44
      545F46494E414C0C00000000000000000000000F0000003A434F445F53555045
      525649534F52030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000A00000044545F454D495353414F0100000000000A000000
      5155414E544944414445010000000000020000004B4701000000000009000000
      56414C5F544F54414C0100000000001100000051545F4B475F424F4E49464943
      4143414F010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRAcompanhaMetaCalcFields
    Left = 680
    Top = 450
    object QRAcompanhaMetaDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QRAcompanhaMetaQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '#,##0.00'
    end
    object QRAcompanhaMetaKG: TFloatField
      FieldName = 'KG'
      DisplayFormat = '#,##0.00'
    end
    object QRAcompanhaMetasaldo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'saldo'
      Calculated = True
    end
    object QRAcompanhaMetameta: TFloatField
      FieldKind = fkCalculated
      FieldName = 'meta'
      Calculated = True
    end
    object QRAcompanhaMetaVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QRAcompanhaMetaQT_KG_BONIFICACAO: TFloatField
      FieldName = 'QT_KG_BONIFICACAO'
    end
  end
  object QRelacaoNotasRio: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '('
      '  SELECT'
      '    DT_EMISSAO,'
      '    NUM_NOTA,'
      '    TB_CADASTRO.NOME,'
      '    TB_OPERACAO.NUM_NATUREZA_EST_NOVO,'
      '    TB_OPERACAO.NUM_NATUREZA_INT_NOVO,'
      '    TB_OPERACAO.COD_OPERACAO,'
      
        '    SUM(decode(TB_NOTA_CAB.IND_SITUACAO,3,0,((TB_NOTA_ITEM.VAL_U' +
        'NITARIO - TB_NOTA_ITEM.VAL_DESCONTO)*TB_NOTA_ITEM.QT_QUANTIDADE)' +
        '-TB_NOTA_ITEM.VAL_DESCONTO_RATEIO+TB_NOTA_ITEM.VAL_DESPESAS)) AS' +
        ' VAL_PRODUTOS,'
      
        '    SUM(decode(TB_NOTA_CAB.IND_SITUACAO,3,0,TB_NOTA_ITEM.VAL_ICM' +
        'S_SUBST)) AS VAL_SUBSTITUICAO,'
      
        '    SUM(decode(TB_NOTA_CAB.IND_SITUACAO,3,0,TB_NOTA_ITEM.VAL_TOT' +
        'AL + TB_NOTA_ITEM.VAL_DESPESAS - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) +VAL_ICMS_SUBST)) AS VAL_TOTAL,'
      
        '    SUM(DECODE(TB_NOTA_CAB.IND_SITUACAO,3,0,TB_NOTA_ITEM.VAL_IPI' +
        ')) AS VAL_IPI,'
      
        '    SUM(DECODE(TB_NOTA_CAB.IND_SITUACAO,3,0,TB_NOTA_ITEM.VAL_DES' +
        'PESAS)) AS VAL_DESPESAS,'
      
        '    SUM(DECODE(TB_NOTA_CAB.IND_SITUACAO,3,0,TB_NOTA_ITEM.VAL_ICM' +
        '_BASE)) AS VAL_ICM_BASE,'
      
        '    SUM(DECODE(TB_NOTA_CAB.IND_SITUACAO,3,0,TB_NOTA_ITEM.VAL_ICM' +
        '_BASE * (TB_TRIBUTACAO.PERC_ALIQUOTA/100))) AS TOTAL_ICMS,'
      
        '    SUM(DECODE(TB_NOTA_CAB.IND_SITUACAO,3,0,TB_NOTA_ITEM.VAL_BAS' +
        'E_SUBST)) AS VAL_BASE_SUBST,'
      
        '    SUM(DECODE(TB_NOTA_CAB.IND_SITUACAO,3,0,TB_NOTA_ITEM.VAL_BAS' +
        'E_SUBST*(TB_TRIBUTACAO.PERC_ALIQUOTA/100))) AS TOTAL_ICMS_SUBST'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_CADASTRO,'
      '    TB_OPERACAO,'
      '    TB_TRIBUTACAO'
      '  WHERE'
      '    TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '    AND'
      '    TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '    AND'
      '    TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '    AND'
      '    TB_TRIBUTACAO.COD_TRIBUTACAO = TB_NOTA_ITEM.COD_TRIBUTACAO'
      '    AND'
      '    TB_OPERACAO.IND_EMITE = '#39'F'#39
      '    AND'
      '    (:COD_FILIAL IS NULL'
      '      OR'
      '      TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      '    AND'
      '    ('
      '      (TB_OPERACAO.IND_VENDAS = :IND_VENDAS)'
      '       OR'
      '      (TB_OPERACAO.IND_BRINDE = :IND_BRINDE)'
      '       OR'
      '      (TB_OPERACAO.IND_BONIFICACAO = :IND_BONIFICACAO)'
      '       OR'
      '      (TB_OPERACAO.IND_TROCA = :IND_TROCA))'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO > = :DT_INICIAL'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO < = :DT_FINAL'
      '    AND'
      '      TB_NOTA_CAB.COD_ESTADO = :COD_ESTADO'
      '  GROUP BY'
      '    DT_EMISSAO,'
      '    NUM_NOTA,'
      '    TB_NOTA_CAB.COD_NOTA_CAB,'
      '    TB_CADASTRO.NOME,'
      '    TB_OPERACAO.NUM_NATUREZA_EST_NOVO,'
      '    TB_OPERACAO.NUM_NATUREZA_INT_NOVO,'
      '    TB_OPERACAO.COD_OPERACAO,'
      
        '    DECODE(TB_NOTA_CAB.IND_SITUACAO,3,0,TB_NOTA_ITEM.VAL_ICM_BAS' +
        'E),'
      
        '    DECODE(TB_NOTA_CAB.IND_SITUACAO,3,0,TB_NOTA_ITEM.VAL_ICM_BAS' +
        'E * (TB_TRIBUTACAO.PERC_ALIQUOTA/100)),'
      
        '    DECODE(TB_NOTA_CAB.IND_SITUACAO,3,0,TB_NOTA_ITEM.VAL_BASE_SU' +
        'BST),'
      
        '    DECODE(TB_NOTA_CAB.IND_SITUACAO,3,0,TB_NOTA_ITEM.VAL_BASE_SU' +
        'BST*(TB_TRIBUTACAO.PERC_ALIQUOTA/100))'
      '  ORDER BY'
      '    TB_NOTA_CAB.COD_NOTA_CAB,'
      '    TB_NOTA_CAB.DT_EMISSAO'
      ')'
      'WHERE'
      '  VAL_SUBSTITUICAO <> 0'
      ''
      ' '
      '')
    Variables.Data = {
      03000000080000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C00000000000000000000000B000000
      3A434F445F46494C49414C0300000000000000000000000B0000003A494E445F
      56454E4441530500000000000000000000000B0000003A494E445F4252494E44
      45050000000000000000000000100000003A494E445F424F4E49464943414341
      4F0500000000000000000000000A0000003A494E445F54524F43410500000000
      000000000000000B0000003A434F445F45535441444F05000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000F000000080000004E554D5F4E4F54410100000000000A0000004454
      5F454D495353414F010000000000040000004E4F4D450100000000000C000000
      56414C5F50524F4455544F530100000000001000000056414C5F535542535449
      54554943414F0100000000000900000056414C5F544F54414C01000000000015
      0000004E554D5F4E41545552455A415F4553545F4E4F564F0100000000001500
      00004E554D5F4E41545552455A415F494E545F4E4F564F0100000000000C0000
      00434F445F4F5045524143414F0100000000000700000056414C5F4950490100
      000000000C00000056414C5F44455350455341530100000000000C0000005641
      4C5F49434D5F424153450100000000000A000000544F54414C5F49434D530100
      000000000E00000056414C5F424153455F535542535401000000000010000000
      544F54414C5F49434D535F5355425354010000000000}
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 488
    object QRelacaoNotasRioNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRelacaoNotasRioDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRelacaoNotasRioNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRelacaoNotasRioVAL_PRODUTOS: TFloatField
      FieldName = 'VAL_PRODUTOS'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object QRelacaoNotasRioVAL_SUBSTITUICAO: TFloatField
      FieldName = 'VAL_SUBSTITUICAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object QRelacaoNotasRioVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object QRelacaoNotasRioNUM_NATUREZA_EST_NOVO: TIntegerField
      FieldName = 'NUM_NATUREZA_EST_NOVO'
    end
    object QRelacaoNotasRioNUM_NATUREZA_INT_NOVO: TIntegerField
      FieldName = 'NUM_NATUREZA_INT_NOVO'
    end
    object QRelacaoNotasRioCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
      Required = True
    end
    object QRelacaoNotasRioVAL_IPI: TFloatField
      FieldName = 'VAL_IPI'
    end
    object QRelacaoNotasRioVAL_DESPESAS: TFloatField
      FieldName = 'VAL_DESPESAS'
    end
    object QRelacaoNotasRioVAL_ICM_BASE: TFloatField
      FieldName = 'VAL_ICM_BASE'
    end
    object QRelacaoNotasRioTOTAL_ICMS: TFloatField
      FieldName = 'TOTAL_ICMS'
    end
    object QRelacaoNotasRioVAL_BASE_SUBST: TFloatField
      FieldName = 'VAL_BASE_SUBST'
    end
    object QRelacaoNotasRioTOTAL_ICMS_SUBST: TFloatField
      FieldName = 'TOTAL_ICMS_SUBST'
    end
  end
  object QRAcompanhaVenda: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  IND_TIPO,'
      '  SUM(VAL_JANEIRO)AS VAL_JANEIRO,'
      '  SUM(VAL_FEVEREIRO)AS VAL_FEVEREIRO,'
      '  SUM(VAL_MARCO)AS VAL_MARCO,'
      '  SUM(VAL_ABRIL)AS VAL_ABRIL,'
      '  SUM(VAL_MAIO)AS VAL_MAIO,'
      '  SUM(VAL_JUNHO)AS VAL_JUNHO,'
      '  SUM(VAL_JULHO)AS VAL_JULHO,'
      '  SUM(VAL_AGOSTO)AS VAL_AGOSTO,'
      '  SUM(VAL_SETEMBRO)AS VAL_SETEMBRO,'
      '  SUM(VAL_OUTUBRO)AS VAL_OUTUBRO,'
      '  SUM(VAL_NOVEMBRO)AS VAL_NOVEMBRO,'
      '  SUM(VAL_DEZEMBRO)AS VAL_DEZEMBRO,'
      '  SUM(QT_CAIXAS_JAN)AS QT_CAIXAS_JAN,'
      '  SUM(QT_CAIXAS_FEV)AS QT_CAIXAS_FEV,'
      '  SUM(QT_CAIXAS_MAR)AS QT_CAIXAS_MAR,'
      '  SUM(QT_CAIXAS_ABR)AS QT_CAIXAS_ABR,'
      '  SUM(QT_CAIXAS_MAI)AS QT_CAIXAS_MAI,'
      '  SUM(QT_CAIXAS_JUN)AS QT_CAIXAS_JUN,'
      '  SUM(QT_CAIXAS_JUL)AS QT_CAIXAS_JUL,'
      '  SUM(QT_CAIXAS_AGO)AS QT_CAIXAS_AGO,'
      '  SUM(QT_CAIXAS_SET)AS QT_CAIXAS_SET,'
      '  SUM(QT_CAIXAS_OUT)AS QT_CAIXAS_OUT,'
      '  SUM(QT_CAIXAS_NOV)AS QT_CAIXAS_NOV,'
      '  SUM(QT_CAIXAS_DEZ)AS QT_CAIXAS_DEZ,'
      '  SUM(QT_KG_JAN)AS QT_KG_JAN,'
      '  SUM(QT_KG_FEV)AS QT_KG_FEV,'
      '  SUM(QT_KG_MAR)AS QT_KG_MAR,'
      '  SUM(QT_KG_ABR)AS QT_KG_ABR,'
      '  SUM(QT_KG_MAI)AS QT_KG_MAI,'
      '  SUM(QT_KG_JUN)AS QT_KG_JUN,'
      '  SUM(QT_KG_JUL)AS QT_KG_JUL,'
      '  SUM(QT_KG_AGO)AS QT_KG_AGO,'
      '  SUM(QT_KG_SET)AS QT_KG_SET,'
      '  SUM(QT_KG_OUT)AS QT_KG_OUT,'
      '  SUM(QT_KG_NOV)AS QT_KG_NOV,'
      '  SUM(QT_KG_DEZ)AS QT_KG_DEZ,'
      '  SUM(SVAL_TOTAL) AS SVAL_TOTAL,'
      '  SUM(SQT_QUANTIDADE) AS SQT_QUANTIDADE,'
      '  SUM(SQT_KILOS) AS SQT_KILOS,'
      '  SUM(QUOTA_JAN)AS QUOTA_JAN,'
      '  SUM(QUOTA_FEV)AS QUOTA_FEV,'
      '  SUM(QUOTA_MAR)AS QUOTA_MAR,'
      '  SUM(QUOTA_ABR)AS QUOTA_ABR,'
      '  SUM(QUOTA_MAI)AS QUOTA_MAI,'
      '  SUM(QUOTA_JUN)AS QUOTA_JUN,'
      '  SUM(QUOTA_JUL)AS QUOTA_JUL,'
      '  SUM(QUOTA_AGO)AS QUOTA_AGO,'
      '  SUM(QUOTA_SET)AS QUOTA_SET,'
      '  SUM(QUOTA_OUT)AS QUOTA_OUT,'
      '  SUM(QUOTA_NOV)AS QUOTA_NOV,'
      '  SUM(QUOTA_DEZ)AS QUOTA_DEZ,'
      '  SUM(QUOTA_KG_JAN)AS QUOTA_KG_JAN,'
      '  SUM(QUOTA_KG_FEV)AS QUOTA_KG_FEV,'
      '  SUM(QUOTA_KG_MAR)AS QUOTA_KG_MAR,'
      '  SUM(QUOTA_KG_ABR)AS QUOTA_KG_ABR,'
      '  SUM(QUOTA_KG_MAI)AS QUOTA_KG_MAI,'
      '  SUM(QUOTA_KG_JUN)AS QUOTA_KG_JUN,'
      '  SUM(QUOTA_KG_JUL)AS QUOTA_KG_JUL,'
      '  SUM(QUOTA_KG_AGO)AS QUOTA_KG_AGO,'
      '  SUM(QUOTA_KG_SET)AS QUOTA_KG_SET,'
      '  SUM(QUOTA_KG_OUT)AS QUOTA_KG_OUT,'
      '  SUM(QUOTA_KG_NOV)AS QUOTA_KG_NOV,'
      '  SUM(QUOTA_KG_DEZ)AS QUOTA_KG_DEZ'
      'FROM'
      '('
      '  SELECT'
      '        TB_CLASSE.IND_TIPO,'
      
        '        SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_R' +
        'ECEBIMENTO,4,2),'#39'01'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITE' +
        'M(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_n' +
        'ota_item.VAL_IPI + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICM' +
        'S_SUBST),0),0)) AS VAL_JANEIRO,'
      
        '        SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_R' +
        'ECEBIMENTO,4,2),'#39'02'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITE' +
        'M(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_n' +
        'ota_item.VAL_IPI + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICM' +
        'S_SUBST),0),0)) AS VAL_FEVEREIRO,'
      
        #9'      SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RE' +
        'CEBIMENTO,4,2),'#39'03'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM' +
        '(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_no' +
        'ta_item.VAL_IPI + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS' +
        '_SUBST),0),0)) AS VAL_MARCO,'
      
        #9'      SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RE' +
        'CEBIMENTO,4,2),'#39'04'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM' +
        '(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_no' +
        'ta_item.VAL_IPI + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS' +
        '_SUBST),0),0)) AS VAL_ABRIL,'
      
        #9'      SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RE' +
        'CEBIMENTO,4,2),'#39'05'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM' +
        '(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_no' +
        'ta_item.VAL_IPI + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS' +
        '_SUBST),0),0)) AS VAL_MAIO,'
      
        #9'      SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RE' +
        'CEBIMENTO,4,2),'#39'06'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM' +
        '(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_no' +
        'ta_item.VAL_IPI + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS' +
        '_SUBST),0),0)) AS VAL_JUNHO,'
      
        #9'      SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RE' +
        'CEBIMENTO,4,2),'#39'07'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM' +
        '(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_no' +
        'ta_item.VAL_IPI + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS' +
        '_SUBST),0),0)) AS VAL_JULHO,'
      
        #9'      SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RE' +
        'CEBIMENTO,4,2),'#39'08'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM' +
        '(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_no' +
        'ta_item.VAL_IPI + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS' +
        '_SUBST),0),0)) AS VAL_AGOSTO,'
      
        #9'      SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RE' +
        'CEBIMENTO,4,2),'#39'09'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM' +
        '(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_no' +
        'ta_item.VAL_IPI + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS' +
        '_SUBST),0),0)) AS VAL_SETEMBRO,'
      
        #9'      SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RE' +
        'CEBIMENTO,4,2),'#39'10'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM' +
        '(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_no' +
        'ta_item.VAL_IPI + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS' +
        '_SUBST),0),0)) AS VAL_OUTUBRO,'
      
        #9'      SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RE' +
        'CEBIMENTO,4,2),'#39'11'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM' +
        '(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_no' +
        'ta_item.VAL_IPI + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS' +
        '_SUBST),0),0)) AS VAL_NOVEMBRO,'
      
        #9'      SUM(decode(Tb_operacao.ind_vendas,'#39'V'#39',DECODE(SUBSTR(DT_RE' +
        'CEBIMENTO,4,2),'#39'12'#39',(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM' +
        '(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_no' +
        'ta_item.VAL_IPI + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS' +
        '_SUBST),0),0)) AS VAL_DEZEMBRO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'01'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE))) AS QT_CAIXAS_JAN,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'02'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE))) AS QT_CAIXAS_FEV,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'03'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE))) AS QT_CAIXAS_MAR,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'04'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE))) AS QT_CAIXAS_ABR,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'05'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE))) AS QT_CAIXAS_MAI,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'06'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE))) AS QT_CAIXAS_JUN,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'07'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE))) AS QT_CAIXAS_JUL,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'08'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE))) AS QT_CAIXAS_AGO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'09'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE))) AS QT_CAIXAS_SET,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'10'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE))) AS QT_CAIXAS_OUT,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'11'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE))) AS QT_CAIXAS_NOV,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'12'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE))) AS QT_CAIXAS_DEZ,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'01'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM))) AS QT_KG_JAN,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'02'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM))) AS QT_KG_FEV,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'03'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM))) AS QT_KG_MAR,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'04'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM))) AS QT_KG_ABR,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'05'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM))) AS QT_KG_MAI,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'06'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM))) AS QT_KG_JUN,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'07'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM))) AS QT_KG_JUL,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'08'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM))) AS QT_KG_AGO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'09'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM))) AS QT_KG_SET,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'10'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM))) AS QT_KG_OUT,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'11'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM))) AS QT_KG_NOV,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'12'#39',(Tb_nota_item' +
        '.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM))) AS QT_KG_DEZ,'
      
        '        SUM(Tb_nota_item.VAL_TOTAL - (Tb_nota_item.VAL_DESCONTO ' +
        '* TB_NOTA_ITEM.QT_QUANTIDADE) - Tb_nota_item.VAL_DESCONTO_RATEIO' +
        ' + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_it' +
        'em.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SVAL_TOTAL,'
      '        SUM(Tb_nota_item.QT_QUANTIDADE) AS SQT_QUANTIDADE,'
      
        '        SUM(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)' +
        ' AS SQT_KILOS,'
      '        0 AS QUOTA_JAN,'
      '        0 AS QUOTA_FEV,'
      '        0 AS QUOTA_MAR,'
      '        0 AS QUOTA_ABR,'
      '        0 AS QUOTA_MAI,'
      '        0 AS QUOTA_JUN,'
      '        0 AS QUOTA_JUL,'
      '        0 AS QUOTA_AGO,'
      '        0 AS QUOTA_SET,'
      '        0 AS QUOTA_OUT,'
      '        0 AS QUOTA_NOV,'
      '        0 AS QUOTA_DEZ,'
      '        0 AS QUOTA_KG_JAN,'
      '        0 AS QUOTA_KG_FEV,'
      '        0 AS QUOTA_KG_MAR,'
      '        0 AS QUOTA_KG_ABR,'
      '        0 AS QUOTA_KG_MAI,'
      '        0 AS QUOTA_KG_JUN,'
      '        0 AS QUOTA_KG_JUL,'
      '        0 AS QUOTA_KG_AGO,'
      '        0 AS QUOTA_KG_SET,'
      '        0 AS QUOTA_KG_OUT,'
      '        0 AS QUOTA_KG_NOV,'
      '        0 AS QUOTA_KG_DEZ'
      '      FROM'
      '        TB_NOTA_CAB,'
      '        TB_NOTA_ITEM,'
      '        TB_FILIAL,'
      '        TB_VENDEDOR,'
      '        TB_OPERACAO,'
      '        TB_CLASSE,'
      '        TB_PRODUTO'
      '      WHERE'
      '        Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '        AND'
      '        Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '        AND'
      '        Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '        AND'
      '        TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '        AND'
      '        TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '        AND'
      '        TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '        AND'
      '        ((Tb_operacao.ind_vendas = '#39'V'#39')'
      '         or'
      '        (Tb_operacao.ind_bonificacao = '#39'S'#39'))'
      '        AND'
      '        TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '        AND'
      '        NOT(TB_CLASSE.IND_TIPO IS NULL)'
      '        AND'
      '        (:VENDEDOR IS NULL'
      '          OR'
      '          TB_VENDEDOR.COD_VENDEDOR = :VENDEDOR)'
      '        AND'
      '        (:COD_FILIAL IS NULL'
      '          OR'
      '          TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      '        AND'
      '        (:COD_SUPERVISOR IS NULL'
      '          OR'
      '          TB_VENDEDOR.COD_SUPERVISOR = :COD_SUPERVISOR)'
      '        AND'
      '        (:COD_ESTADO IS NULL'
      '          OR'
      '          TB_NOTA_CAB.COD_ESTADO = :COD_ESTADO)'
      '        AND'
      '        TB_NOTA_CAB.DT_RECEBIMENTO >= :DT_INICIAL'
      '        AND'
      '        TB_NOTA_CAB.DT_RECEBIMENTO <= :DT_FINAL'
      '      GROUP BY'
      '        TB_CLASSE.IND_TIPO'
      ''
      '   UNION ALL'
      ''
      '  /* *** DEVOLUCOES ****  */'
      '  SELECT'
      '        TB_CLASSE.IND_TIPO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'01'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + T' +
        'b_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.V' +
        'AL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0)) AS VAL_JANEIRO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'02'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + T' +
        'b_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.V' +
        'AL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0)) AS VAL_FEVEREIRO' +
        ','
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'03'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + T' +
        'b_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.V' +
        'AL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0)) AS VAL_MARCO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'04'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + T' +
        'b_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.V' +
        'AL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0)) AS VAL_ABRIL,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'05'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + T' +
        'b_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.V' +
        'AL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0)) AS VAL_MAIO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'06'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + T' +
        'b_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.V' +
        'AL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0)) AS VAL_JUNHO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'07'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + T' +
        'b_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.V' +
        'AL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0)) AS VAL_JULHO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'08'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + T' +
        'b_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.V' +
        'AL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0)) AS VAL_AGOSTO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'09'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + T' +
        'b_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.V' +
        'AL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0)) AS VAL_SETEMBRO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'10'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + T' +
        'b_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.V' +
        'AL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0)) AS VAL_OUTUBRO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'11'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + T' +
        'b_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.V' +
        'AL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0)) AS VAL_NOVEMBRO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'12'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + T' +
        'b_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.V' +
        'AL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0)) AS VAL_DEZEMBRO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'01'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_JAN,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'02'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_FEV,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'03'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_MAR,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'04'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_ABR,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'05'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_MAI,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'06'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_JUN,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'07'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_JUL,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'08'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_AGO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'09'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_SET,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'10'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_OUT,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'11'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_NOV,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'12'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_DEZ,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'01'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1))) AS QT_KG_JAN,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'02'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1))) AS QT_KG_FEV,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'03'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1))) AS QT_KG_MAR,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'04'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1))) AS QT_KG_ABR,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'05'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1))) AS QT_KG_MAI,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'06'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1))) AS QT_KG_JUN,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'07'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1))) AS QT_KG_JUL,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'08'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1))) AS QT_KG_AGO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'09'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1))) AS QT_KG_SET,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'10'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1))) AS QT_KG_OUT,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'11'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1))) AS QT_KG_NOV,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'12'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1))) AS QT_KG_DEZ,'
      
        '        SUM((Tb_nota_item.VAL_TOTAL - (Tb_nota_item.VAL_DESCONTO' +
        ' * TB_NOTA_ITEM.QT_QUANTIDADE) - Tb_nota_item.VAL_DESCONTO_RATEI' +
        'O + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_i' +
        'tem.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1) AS SVAL_TOTAL,'
      '        SUM((Tb_nota_item.QT_QUANTIDADE)*-1) AS SQT_QUANTIDADE,'
      
        '        SUM((Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM' +
        ')*-1) AS SQT_KILOS,'
      '        0 AS QUOTA_JAN,'
      '        0 AS QUOTA_FEV,'
      '        0 AS QUOTA_MAR,'
      '        0 AS QUOTA_ABR,'
      '        0 AS QUOTA_MAI,'
      '        0 AS QUOTA_JUN,'
      '        0 AS QUOTA_JUL,'
      '        0 AS QUOTA_AGO,'
      '        0 AS QUOTA_SET,'
      '        0 AS QUOTA_OUT,'
      '        0 AS QUOTA_NOV,'
      '        0 AS QUOTA_DEZ,'
      '        0 AS QUOTA_KG_JAN,'
      '        0 AS QUOTA_KG_FEV,'
      '        0 AS QUOTA_KG_MAR,'
      '        0 AS QUOTA_KG_ABR,'
      '        0 AS QUOTA_KG_MAI,'
      '        0 AS QUOTA_KG_JUN,'
      '        0 AS QUOTA_KG_JUL,'
      '        0 AS QUOTA_KG_AGO,'
      '        0 AS QUOTA_KG_SET,'
      '        0 AS QUOTA_KG_OUT,'
      '        0 AS QUOTA_KG_NOV,'
      '        0 AS QUOTA_KG_DEZ'
      '      FROM'
      '        TB_NOTA_CAB,'
      '        TB_NOTA_ITEM,'
      '        TB_FILIAL,'
      '        TB_VENDEDOR,'
      '        TB_OPERACAO,'
      '        TB_CLASSE,'
      '        TB_PRODUTO'
      '      WHERE'
      '        Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '        AND'
      '        Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '        AND'
      '        Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '        AND'
      '        TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '        AND'
      '        TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '        AND'
      '        TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '        AND'
      '        (Tb_operacao.ind_vendas = '#39'D'#39')'
      '        AND'
      '        TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '        AND'
      '        NOT(TB_CLASSE.IND_TIPO IS NULL)'
      '        AND'
      '        (:VENDEDOR IS NULL'
      '          OR'
      '          TB_VENDEDOR.COD_VENDEDOR = :VENDEDOR)'
      '        AND'
      '        (:COD_FILIAL IS NULL'
      '          OR'
      '          TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      '        AND'
      '        (:COD_SUPERVISOR IS NULL'
      '          OR'
      '          TB_VENDEDOR.COD_SUPERVISOR = :COD_SUPERVISOR)'
      '        AND'
      '        (:COD_ESTADO IS NULL'
      '          OR'
      '          TB_NOTA_CAB.COD_ESTADO = :COD_ESTADO)'
      '        AND'
      '        TB_NOTA_CAB.DT_RECEBIMENTO >= :DT_INICIAL'
      '        AND'
      '        TB_NOTA_CAB.DT_RECEBIMENTO <= :DT_FINAL'
      '      GROUP BY'
      '        TB_CLASSE.IND_TIPO'
      ''
      '  UNION ALL'
      ''
      '   /* *** Bonificacao ****  */'
      '  SELECT'
      '        TB_CLASSE.IND_TIPO,'
      
        '    /*    SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'01'#39',((Tb_nota_i' +
        'tem.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DES' +
        'PESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRETE)*-1),0)) A' +
        'S VAL_JANEIRO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'02'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DESPE' +
        'SAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRETE)*-1),0)) AS ' +
        'VAL_FEVEREIRO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'03'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DESPE' +
        'SAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRETE)*-1),0)) AS ' +
        'VAL_MARCO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'04'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DESPE' +
        'SAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRETE)*-1),0)) AS ' +
        'VAL_ABRIL,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'05'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DESPE' +
        'SAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRETE)*-1),0)) AS ' +
        'VAL_MAIO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'06'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DESPE' +
        'SAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRETE)*-1),0)) AS ' +
        'VAL_JUNHO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'07'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DESPE' +
        'SAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRETE)*-1),0)) AS ' +
        'VAL_JULHO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'08'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DESPE' +
        'SAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRETE)*-1),0)) AS ' +
        'VAL_AGOSTO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'09'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DESPE' +
        'SAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRETE)*-1),0)) AS ' +
        'VAL_SETEMBRO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'10'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DESPE' +
        'SAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRETE)*-1),0)) AS ' +
        'VAL_OUTUBRO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'11'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DESPE' +
        'SAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRETE)*-1),0)) AS ' +
        'VAL_NOVEMBRO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'12'#39',((Tb_nota_ite' +
        'm.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DESPE' +
        'SAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRETE)*-1),0)) AS ' +
        'VAL_DEZEMBRO,  */'
      '        0 AS VAL_JANEIRO,'
      '        0 AS VAL_FEVEREIRO,'
      '        0 AS VAL_MARCO,'
      '        0 AS VAL_ABRIL,'
      '        0 AS VAL_MAIO,'
      '        0 AS VAL_JUNHO,'
      '        0 AS VAL_JULHO,'
      '        0 AS VAL_AGOSTO,'
      '        0 AS VAL_SETEMBRO,'
      '        0 AS VAL_OUTUBRO,'
      '        0 AS VAL_NOVEMBRO,'
      '        0 AS VAL_DEZEMBRO,'
      ''
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'01'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_JAN,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'02'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_FEV,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'03'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_MAR,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'04'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_ABR,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'05'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_MAI,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'06'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_JUN,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'07'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_JUL,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'08'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_AGO,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'09'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_SET,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'10'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_OUT,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'11'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_NOV,'
      
        '        SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'12'#39',((Tb_nota_ite' +
        'm.QT_QUANTIDADE)*-1))) AS QT_CAIXAS_DEZ,'
      '        0 AS QT_KG_JAN,'
      '        0 AS QT_KG_FEV,'
      '        0 AS QT_KG_MAR,'
      '        0 AS QT_KG_ABR,'
      '        0 AS QT_KG_MAI,'
      '        0 AS QT_KG_JUN,'
      '        0 AS QT_KG_JUL,'
      '        0 AS QT_KG_AGO,'
      '        0 AS QT_KG_SET,'
      '        0 AS QT_KG_OUT,'
      '        0 AS QT_KG_NOV,'
      '        0 AS QT_KG_DEZ,'
      
        '        SUM((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA' +
        '_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.' +
        'VAL_IPI + Tb_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*' +
        '-1) AS SVAL_TOTAL,'
      '        SUM((Tb_nota_item.QT_QUANTIDADE)*-1) AS SQT_QUANTIDADE,'
      '        0 AS SQT_KILOS,'
      '        0 AS QUOTA_JAN,'
      '        0 AS QUOTA_FEV,'
      '        0 AS QUOTA_MAR,'
      '        0 AS QUOTA_ABR,'
      '        0 AS QUOTA_MAI,'
      '        0 AS QUOTA_JUN,'
      '        0 AS QUOTA_JUL,'
      '        0 AS QUOTA_AGO,'
      '        0 AS QUOTA_SET,'
      '        0 AS QUOTA_OUT,'
      '        0 AS QUOTA_NOV,'
      '        0 AS QUOTA_DEZ,'
      '        0 AS QUOTA_KG_JAN,'
      '        0 AS QUOTA_KG_FEV,'
      '        0 AS QUOTA_KG_MAR,'
      '        0 AS QUOTA_KG_ABR,'
      '        0 AS QUOTA_KG_MAI,'
      '        0 AS QUOTA_KG_JUN,'
      '        0 AS QUOTA_KG_JUL,'
      '        0 AS QUOTA_KG_AGO,'
      '        0 AS QUOTA_KG_SET,'
      '        0 AS QUOTA_KG_OUT,'
      '        0 AS QUOTA_KG_NOV,'
      '        0 AS QUOTA_KG_DEZ'
      '      FROM'
      '        TB_NOTA_CAB,'
      '        TB_NOTA_ITEM,'
      '        TB_FILIAL,'
      '        TB_VENDEDOR,'
      '        TB_OPERACAO,'
      '        TB_CLASSE,'
      '        TB_PRODUTO'
      '      WHERE'
      '        Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '        AND'
      '        Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '        AND'
      '        Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '        AND'
      '        TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '        AND'
      '        TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '        AND'
      '        TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '        AND'
      '        (Tb_operacao.ind_bonificacao = '#39'S'#39')'
      '        AND'
      '        TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '        AND'
      '        NOT(TB_CLASSE.IND_TIPO IS NULL)'
      '        AND'
      '        (:VENDEDOR IS NULL'
      '          OR'
      '          TB_VENDEDOR.COD_VENDEDOR = :VENDEDOR)'
      '        AND'
      '        (:COD_FILIAL IS NULL'
      '          OR'
      '          TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      '        AND'
      '        (:COD_SUPERVISOR IS NULL'
      '          OR'
      '          TB_VENDEDOR.COD_SUPERVISOR = :COD_SUPERVISOR)'
      '        AND'
      '        (:COD_ESTADO IS NULL'
      '          OR'
      '          TB_NOTA_CAB.COD_ESTADO = :COD_ESTADO)'
      '        AND'
      '        TB_NOTA_CAB.DT_RECEBIMENTO >= :DT_INICIAL'
      '        AND'
      '        TB_NOTA_CAB.DT_RECEBIMENTO <= :DT_FINAL'
      '      GROUP BY'
      '        TB_CLASSE.IND_TIPO'
      ''
      'UNION ALL'
      ''
      '  /* *** QUOTA ****  */'
      ''
      '      SELECT'
      '        TB_CLASSE.IND_TIPO,'
      '        TO_NUMBER('#39'0'#39') AS VAL_JANEIRO,'
      '        TO_NUMBER('#39'0'#39') AS VAL_FEVEREIRO,'
      '        TO_NUMBER('#39'0'#39') AS VAL_MARCO,'
      '        TO_NUMBER('#39'0'#39') AS VAL_ABRIL,'
      '        TO_NUMBER('#39'0'#39') AS VAL_MAIO,'
      '        TO_NUMBER('#39'0'#39') AS VAL_JUNHO,'
      '        TO_NUMBER('#39'0'#39') AS VAL_JULHO,'
      '        TO_NUMBER('#39'0'#39') AS VAL_AGOSTO,'
      '        TO_NUMBER('#39'0'#39') AS VAL_SETEMBRO,'
      '        TO_NUMBER('#39'0'#39') AS VAL_OUTUBRO,'
      '        TO_NUMBER('#39'0'#39') AS VAL_NOVEMBRO,'
      '        TO_NUMBER('#39'0'#39') AS VAL_DEZEMBRO,'
      '        TO_NUMBER('#39'0'#39') AS QT_CAIXAS_JAN,'
      '        TO_NUMBER('#39'0'#39') AS QT_CAIXAS_FEV,'
      '        TO_NUMBER('#39'0'#39') AS QT_CAIXAS_MAR,'
      '        TO_NUMBER('#39'0'#39') AS QT_CAIXAS_ABR,'
      '        TO_NUMBER('#39'0'#39') AS QT_CAIXAS_MAI,'
      '        TO_NUMBER('#39'0'#39') AS QT_CAIXAS_JUN,'
      '        TO_NUMBER('#39'0'#39') AS QT_CAIXAS_JUL,'
      '        TO_NUMBER('#39'0'#39') AS QT_CAIXAS_AGO,'
      '        TO_NUMBER('#39'0'#39') AS QT_CAIXAS_SET,'
      '        TO_NUMBER('#39'0'#39') AS QT_CAIXAS_OUT,'
      '        TO_NUMBER('#39'0'#39') AS QT_CAIXAS_NOV,'
      '        TO_NUMBER('#39'0'#39') AS QT_CAIXAS_DEZ,'
      '        TO_NUMBER('#39'0'#39') AS QT_KG_JAN,'
      '        TO_NUMBER('#39'0'#39') AS QT_KG_FEV,'
      '        TO_NUMBER('#39'0'#39') AS QT_KG_MAR,'
      '        TO_NUMBER('#39'0'#39') AS QT_KG_ABR,'
      '        TO_NUMBER('#39'0'#39') AS QT_KG_MAI,'
      '        TO_NUMBER('#39'0'#39') AS QT_KG_JUN,'
      '        TO_NUMBER('#39'0'#39') AS QT_KG_JUL,'
      '        TO_NUMBER('#39'0'#39') AS QT_KG_AGO,'
      '        TO_NUMBER('#39'0'#39') AS QT_KG_SET,'
      '        TO_NUMBER('#39'0'#39') AS QT_KG_OUT,'
      '        TO_NUMBER('#39'0'#39') AS QT_KG_NOV,'
      '        TO_NUMBER('#39'0'#39') AS QT_KG_DEZ,'
      '        TO_NUMBER('#39'0'#39') AS SVAL_TOTAL,'
      '        TO_NUMBER('#39'0'#39') AS SQT_QUANTIDADE,'
      '        TO_NUMBER('#39'0'#39') AS SQT_KILOS,'
      '        SUM(DECODE(NUM_MES,1,QT_QUOTA,0))AS QUOTA_JAN,'
      '        SUM(DECODE(NUM_MES,2,QT_QUOTA,0))AS QUOTA_FEV,'
      '        SUM(DECODE(NUM_MES,3,QT_QUOTA,0))AS QUOTA_MAR,'
      '        SUM(DECODE(NUM_MES,4,QT_QUOTA,0))AS QUOTA_ABR,'
      '        SUM(DECODE(NUM_MES,5,QT_QUOTA,0))AS QUOTA_MAI,'
      '        SUM(DECODE(NUM_MES,6,QT_QUOTA,0))AS QUOTA_JUN,'
      '        SUM(DECODE(NUM_MES,7,QT_QUOTA,0))AS QUOTA_JUL,'
      '        SUM(DECODE(NUM_MES,8,QT_QUOTA,0))AS QUOTA_AGO,'
      '        SUM(DECODE(NUM_MES,9,QT_QUOTA,0))AS QUOTA_SET,'
      '        SUM(DECODE(NUM_MES,10,QT_QUOTA,0))AS QUOTA_OUT,'
      '        SUM(DECODE(NUM_MES,11,QT_QUOTA,0))AS QUOTA_NOV,'
      '        SUM(DECODE(NUM_MES,12,QT_QUOTA,0))AS QUOTA_DEZ,'
      '        SUM(DECODE(NUM_MES,1,QT_QUOTA_KG,0))AS QUOTA_KG_JAN,'
      '        SUM(DECODE(NUM_MES,2,QT_QUOTA_KG,0))AS QUOTA_KG_FEV,'
      '        SUM(DECODE(NUM_MES,3,QT_QUOTA_KG,0))AS QUOTA_KG_MAR,'
      '        SUM(DECODE(NUM_MES,4,QT_QUOTA_KG,0))AS QUOTA_KG_ABR,'
      '        SUM(DECODE(NUM_MES,5,QT_QUOTA_KG,0))AS QUOTA_KG_MAI,'
      '        SUM(DECODE(NUM_MES,6,QT_QUOTA_KG,0))AS QUOTA_KG_JUN,'
      '        SUM(DECODE(NUM_MES,7,QT_QUOTA_KG,0))AS QUOTA_KG_JUL,'
      '        SUM(DECODE(NUM_MES,8,QT_QUOTA_KG,0))AS QUOTA_KG_AGO,'
      '        SUM(DECODE(NUM_MES,9,QT_QUOTA_KG,0))AS QUOTA_KG_SET,'
      '        SUM(DECODE(NUM_MES,10,QT_QUOTA_KG,0))AS QUOTA_KG_OUT,'
      '        SUM(DECODE(NUM_MES,11,QT_QUOTA_KG,0))AS QUOTA_KG_NOV,'
      '        SUM(DECODE(NUM_MES,12,QT_QUOTA_KG,0))AS QUOTA_KG_DEZ'
      '      FROM'
      '        TB_VENDEDOR,'
      '        TB_CLASSE,'
      '        TB_VENDEDOR_QUOTA'
      '      WHERE'
      
        '        TB_VENDEDOR_QUOTA.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDO' +
        'R'
      '        AND'
      '        TB_VENDEDOR_QUOTA.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '        AND'
      '        NOT(TB_CLASSE.IND_TIPO IS NULL)'
      '        AND'
      '        (:VENDEDOR IS NULL'
      '          OR'
      '          TB_VENDEDOR.COD_VENDEDOR = :VENDEDOR)'
      '        AND'
      '        (:COD_SUPERVISOR IS NULL'
      '          OR'
      '          TB_VENDEDOR.COD_SUPERVISOR = :COD_SUPERVISOR)'
      '        AND'
      '        TB_VENDEDOR_QUOTA.NUM_ANO = :ANO'
      '        AND'
      '        (:COD_ESTADO IS NULL'
      '          OR'
      '          TB_VENDEDOR.COD_ESTADO = :COD_ESTADO)'
      '    GROUP BY'
      '        TB_CLASSE.IND_TIPO'
      ')'
      ' GROUP BY'
      '   IND_TIPO'
      ' ORDER BY'
      '    IND_TIPO'
      ''
      ''
      ''
      '')
    Variables.Data = {
      0300000007000000090000003A56454E4445444F520300000000000000000000
      000B0000003A44545F494E494349414C0C000000000000000000000009000000
      3A44545F46494E414C0C0000000000000000000000040000003A414E4F030000
      0000000000000000000F0000003A434F445F53555045525649534F5203000000
      00000000000000000B0000003A434F445F46494C49414C030000000000000000
      0000000B0000003A434F445F45535441444F050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000004000000008000000494E445F5449504F0100000000000B0000005641
      4C5F4A414E4549524F0100000000000D00000056414C5F46455645524549524F
      0100000000000900000056414C5F4D4152434F0100000000000900000056414C
      5F414252494C0100000000000800000056414C5F4D41494F0100000000000900
      000056414C5F4A554E484F0100000000000900000056414C5F4A554C484F0100
      000000000A00000056414C5F41474F53544F0100000000000C00000056414C5F
      534554454D42524F0100000000000B00000056414C5F4F55545542524F010000
      0000000C00000056414C5F4E4F56454D42524F0100000000000C00000056414C
      5F44455A454D42524F0100000000000D00000051545F4341495841535F4A414E
      0100000000000D00000051545F4341495841535F4645560100000000000D0000
      0051545F4341495841535F4D41520100000000000D00000051545F4341495841
      535F4142520100000000000D00000051545F4341495841535F4D414901000000
      00000D00000051545F4341495841535F4A554E0100000000000D00000051545F
      4341495841535F4A554C0100000000000D00000051545F4341495841535F4147
      4F0100000000000D00000051545F4341495841535F5345540100000000000D00
      000051545F4341495841535F4F55540100000000000D00000051545F43414958
      41535F4E4F560100000000000D00000051545F4341495841535F44455A010000
      0000000900000051545F4B475F4A414E0100000000000900000051545F4B475F
      4645560100000000000900000051545F4B475F4D415201000000000009000000
      51545F4B475F4142520100000000000900000051545F4B475F4D414901000000
      00000900000051545F4B475F4A554E0100000000000900000051545F4B475F4A
      554C0100000000000900000051545F4B475F41474F0100000000000900000051
      545F4B475F5345540100000000000900000051545F4B475F4F55540100000000
      000900000051545F4B475F4E4F560100000000000900000051545F4B475F4445
      5A0100000000000A0000005356414C5F544F54414C0100000000000E00000053
      51545F5155414E544944414445010000000000090000005351545F4B494C4F53
      0100000000000900000051554F54415F4A414E0100000000000900000051554F
      54415F4645560100000000000900000051554F54415F4D415201000000000009
      00000051554F54415F4142520100000000000900000051554F54415F4D414901
      00000000000900000051554F54415F4A554E0100000000000900000051554F54
      415F4A554C0100000000000900000051554F54415F41474F0100000000000900
      000051554F54415F5345540100000000000900000051554F54415F4F55540100
      000000000900000051554F54415F4E4F560100000000000900000051554F5441
      5F44455A0100000000000C00000051554F54415F4B475F4A414E010000000000
      0C00000051554F54415F4B475F4645560100000000000C00000051554F54415F
      4B475F4D41520100000000000C00000051554F54415F4B475F41425201000000
      00000C00000051554F54415F4B475F4D41490100000000000C00000051554F54
      415F4B475F4A554E0100000000000C00000051554F54415F4B475F4A554C0100
      000000000C00000051554F54415F4B475F41474F0100000000000C0000005155
      4F54415F4B475F5345540100000000000C00000051554F54415F4B475F4F5554
      0100000000000C00000051554F54415F4B475F4E4F560100000000000C000000
      51554F54415F4B475F44455A010000000000}
    Session = DMOracle.DBCemapa
    Left = 680
    Top = 498
    object QRAcompanhaVendaIND_TIPO: TStringField
      FieldName = 'IND_TIPO'
      Size = 10
    end
    object QRAcompanhaVendaVAL_JANEIRO: TFloatField
      FieldName = 'VAL_JANEIRO'
    end
    object QRAcompanhaVendaVAL_FEVEREIRO: TFloatField
      FieldName = 'VAL_FEVEREIRO'
    end
    object QRAcompanhaVendaVAL_MARCO: TFloatField
      FieldName = 'VAL_MARCO'
    end
    object QRAcompanhaVendaVAL_ABRIL: TFloatField
      FieldName = 'VAL_ABRIL'
    end
    object QRAcompanhaVendaVAL_MAIO: TFloatField
      FieldName = 'VAL_MAIO'
    end
    object QRAcompanhaVendaVAL_JUNHO: TFloatField
      FieldName = 'VAL_JUNHO'
    end
    object QRAcompanhaVendaVAL_JULHO: TFloatField
      FieldName = 'VAL_JULHO'
    end
    object QRAcompanhaVendaVAL_AGOSTO: TFloatField
      FieldName = 'VAL_AGOSTO'
    end
    object QRAcompanhaVendaVAL_SETEMBRO: TFloatField
      FieldName = 'VAL_SETEMBRO'
    end
    object QRAcompanhaVendaVAL_OUTUBRO: TFloatField
      FieldName = 'VAL_OUTUBRO'
    end
    object QRAcompanhaVendaVAL_NOVEMBRO: TFloatField
      FieldName = 'VAL_NOVEMBRO'
    end
    object QRAcompanhaVendaVAL_DEZEMBRO: TFloatField
      FieldName = 'VAL_DEZEMBRO'
    end
    object QRAcompanhaVendaQT_CAIXAS_JAN: TFloatField
      FieldName = 'QT_CAIXAS_JAN'
    end
    object QRAcompanhaVendaQT_CAIXAS_FEV: TFloatField
      FieldName = 'QT_CAIXAS_FEV'
    end
    object QRAcompanhaVendaQT_CAIXAS_MAR: TFloatField
      FieldName = 'QT_CAIXAS_MAR'
    end
    object QRAcompanhaVendaQT_CAIXAS_ABR: TFloatField
      FieldName = 'QT_CAIXAS_ABR'
    end
    object QRAcompanhaVendaQT_CAIXAS_MAI: TFloatField
      FieldName = 'QT_CAIXAS_MAI'
    end
    object QRAcompanhaVendaQT_CAIXAS_JUN: TFloatField
      FieldName = 'QT_CAIXAS_JUN'
    end
    object QRAcompanhaVendaQT_CAIXAS_JUL: TFloatField
      FieldName = 'QT_CAIXAS_JUL'
    end
    object QRAcompanhaVendaQT_CAIXAS_AGO: TFloatField
      FieldName = 'QT_CAIXAS_AGO'
    end
    object QRAcompanhaVendaQT_CAIXAS_SET: TFloatField
      FieldName = 'QT_CAIXAS_SET'
    end
    object QRAcompanhaVendaQT_CAIXAS_OUT: TFloatField
      FieldName = 'QT_CAIXAS_OUT'
    end
    object QRAcompanhaVendaQT_CAIXAS_NOV: TFloatField
      FieldName = 'QT_CAIXAS_NOV'
    end
    object QRAcompanhaVendaQT_CAIXAS_DEZ: TFloatField
      FieldName = 'QT_CAIXAS_DEZ'
    end
    object QRAcompanhaVendaQT_KG_JAN: TFloatField
      FieldName = 'QT_KG_JAN'
    end
    object QRAcompanhaVendaQT_KG_FEV: TFloatField
      FieldName = 'QT_KG_FEV'
    end
    object QRAcompanhaVendaQT_KG_MAR: TFloatField
      FieldName = 'QT_KG_MAR'
    end
    object QRAcompanhaVendaQT_KG_ABR: TFloatField
      FieldName = 'QT_KG_ABR'
    end
    object QRAcompanhaVendaQT_KG_MAI: TFloatField
      FieldName = 'QT_KG_MAI'
    end
    object QRAcompanhaVendaQT_KG_JUN: TFloatField
      FieldName = 'QT_KG_JUN'
    end
    object QRAcompanhaVendaQT_KG_JUL: TFloatField
      FieldName = 'QT_KG_JUL'
    end
    object QRAcompanhaVendaQT_KG_AGO: TFloatField
      FieldName = 'QT_KG_AGO'
    end
    object QRAcompanhaVendaQT_KG_SET: TFloatField
      FieldName = 'QT_KG_SET'
    end
    object QRAcompanhaVendaQT_KG_OUT: TFloatField
      FieldName = 'QT_KG_OUT'
    end
    object QRAcompanhaVendaQT_KG_NOV: TFloatField
      FieldName = 'QT_KG_NOV'
    end
    object QRAcompanhaVendaQT_KG_DEZ: TFloatField
      FieldName = 'QT_KG_DEZ'
    end
    object QRAcompanhaVendaSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRAcompanhaVendaSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRAcompanhaVendaSQT_KILOS: TFloatField
      FieldName = 'SQT_KILOS'
    end
    object QRAcompanhaVendaQUOTA_JAN: TFloatField
      FieldName = 'QUOTA_JAN'
    end
    object QRAcompanhaVendaQUOTA_FEV: TFloatField
      FieldName = 'QUOTA_FEV'
    end
    object QRAcompanhaVendaQUOTA_MAR: TFloatField
      FieldName = 'QUOTA_MAR'
    end
    object QRAcompanhaVendaQUOTA_ABR: TFloatField
      FieldName = 'QUOTA_ABR'
    end
    object QRAcompanhaVendaQUOTA_MAI: TFloatField
      FieldName = 'QUOTA_MAI'
    end
    object QRAcompanhaVendaQUOTA_JUN: TFloatField
      FieldName = 'QUOTA_JUN'
    end
    object QRAcompanhaVendaQUOTA_JUL: TFloatField
      FieldName = 'QUOTA_JUL'
    end
    object QRAcompanhaVendaQUOTA_AGO: TFloatField
      FieldName = 'QUOTA_AGO'
    end
    object QRAcompanhaVendaQUOTA_SET: TFloatField
      FieldName = 'QUOTA_SET'
    end
    object QRAcompanhaVendaQUOTA_OUT: TFloatField
      FieldName = 'QUOTA_OUT'
    end
    object QRAcompanhaVendaQUOTA_NOV: TFloatField
      FieldName = 'QUOTA_NOV'
    end
    object QRAcompanhaVendaQUOTA_DEZ: TFloatField
      FieldName = 'QUOTA_DEZ'
    end
    object QRAcompanhaVendaQUOTA_KG_JAN: TFloatField
      FieldName = 'QUOTA_KG_JAN'
    end
    object QRAcompanhaVendaQUOTA_KG_FEV: TFloatField
      FieldName = 'QUOTA_KG_FEV'
    end
    object QRAcompanhaVendaQUOTA_KG_MAR: TFloatField
      FieldName = 'QUOTA_KG_MAR'
    end
    object QRAcompanhaVendaQUOTA_KG_ABR: TFloatField
      FieldName = 'QUOTA_KG_ABR'
    end
    object QRAcompanhaVendaQUOTA_KG_MAI: TFloatField
      FieldName = 'QUOTA_KG_MAI'
    end
    object QRAcompanhaVendaQUOTA_KG_JUN: TFloatField
      FieldName = 'QUOTA_KG_JUN'
    end
    object QRAcompanhaVendaQUOTA_KG_JUL: TFloatField
      FieldName = 'QUOTA_KG_JUL'
    end
    object QRAcompanhaVendaQUOTA_KG_AGO: TFloatField
      FieldName = 'QUOTA_KG_AGO'
    end
    object QRAcompanhaVendaQUOTA_KG_SET: TFloatField
      FieldName = 'QUOTA_KG_SET'
    end
    object QRAcompanhaVendaQUOTA_KG_OUT: TFloatField
      FieldName = 'QUOTA_KG_OUT'
    end
    object QRAcompanhaVendaQUOTA_KG_NOV: TFloatField
      FieldName = 'QUOTA_KG_NOV'
    end
    object QRAcompanhaVendaQUOTA_KG_DEZ: TFloatField
      FieldName = 'QUOTA_KG_DEZ'
    end
  end
  object QRVendasRamoCliente: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_CADASTRO.COD_CADASTRO,'
      '  TB_CADASTRO.NOME,'
      '  TB_CADASTRO.NOME_CONTATO,'
      '  TB_CADASTRO.DESC_TELEFONE,'
      
        '  SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'01'#39',(Tb_nota_item.VAL_T' +
        'OTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_' +
        'item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRET' +
        'E + TB_NOTA_ITEM.VAL_ICMS_SUBST),0)) AS VAL_JANEIRO,'
      
        '  SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'02'#39',(Tb_nota_item.VAL_T' +
        'OTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_' +
        'item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRET' +
        'E + TB_NOTA_ITEM.VAL_ICMS_SUBST),0)) AS VAL_FEVEREIRO,'
      
        '  SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'03'#39',(Tb_nota_item.VAL_T' +
        'OTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_' +
        'item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRET' +
        'E + TB_NOTA_ITEM.VAL_ICMS_SUBST),0)) AS VAL_MARCO,'
      
        '  SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'04'#39',(Tb_nota_item.VAL_T' +
        'OTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_' +
        'item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRET' +
        'E + TB_NOTA_ITEM.VAL_ICMS_SUBST),0)) AS VAL_ABRIL,'
      
        '  SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'05'#39',(Tb_nota_item.VAL_T' +
        'OTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_' +
        'item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRET' +
        'E + TB_NOTA_ITEM.VAL_ICMS_SUBST),0)) AS VAL_MAIO,'
      
        '  SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'06'#39',(Tb_nota_item.VAL_T' +
        'OTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_' +
        'item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRET' +
        'E + TB_NOTA_ITEM.VAL_ICMS_SUBST),0)) AS VAL_JUNHO,'
      
        '  SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'07'#39',(Tb_nota_item.VAL_T' +
        'OTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_' +
        'item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRET' +
        'E + TB_NOTA_ITEM.VAL_ICMS_SUBST),0)) AS VAL_JULHO,'
      
        '  SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'08'#39',(Tb_nota_item.VAL_T' +
        'OTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_' +
        'item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRET' +
        'E + TB_NOTA_ITEM.VAL_ICMS_SUBST),0)) AS VAL_AGOSTO,'
      
        '  SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'09'#39',(Tb_nota_item.VAL_T' +
        'OTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_' +
        'item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRET' +
        'E + TB_NOTA_ITEM.VAL_ICMS_SUBST),0)) AS VAL_SETEMBRO,'
      
        '  SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'10'#39',(Tb_nota_item.VAL_T' +
        'OTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_' +
        'item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRET' +
        'E + TB_NOTA_ITEM.VAL_ICMS_SUBST),0)) AS VAL_OUTUBRO,'
      
        '  SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'11'#39',(Tb_nota_item.VAL_T' +
        'OTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_' +
        'item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRET' +
        'E + TB_NOTA_ITEM.VAL_ICMS_SUBST),0)) AS VAL_NOVEMBRO,'
      
        '  SUM(DECODE(SUBSTR(DT_RECEBIMENTO,4,2),'#39'12'#39',(Tb_nota_item.VAL_T' +
        'OTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_' +
        'item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRET' +
        'E + TB_NOTA_ITEM.VAL_ICMS_SUBST),0)) AS VAL_DEZEMBRO'
      'FROM      '
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_OPERACAO,'
      '  TB_CADASTRO,'
      '  TB_RAMO,'
      '  TB_VENDEDOR'
      'WHERE'
      '  TB_CADASTRO.COD_RAMO = TB_RAMO.COD_RAMO'
      '  AND'
      '  TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      '  Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '  AND'
      '  TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '  AND'
      '  TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR       '
      '  AND'
      '  (Tb_operacao.ind_vendas = '#39'V'#39')         '
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39'  '
      '  AND'
      '  (TB_NOTA_CAB.DT_RECEBIMENTO >= :DT_INICIAL)'
      '  AND'
      '  (TB_NOTA_CAB.DT_RECEBIMENTO <= :DT_FINAL)'
      '  AND'
      '  (TB_CADASTRO.COD_RAMO = :RAMO)'
      '  AND'
      '  (:SUPERVISOR IS NULL'
      '   OR'
      '    TB_VENDEDOR.COD_SUPERVISOR =:SUPERVISOR)'
      ''
      'GROUP BY'
      '  TB_CADASTRO.COD_CADASTRO,'
      '  TB_CADASTRO.NOME,'
      '  TB_CADASTRO.NOME_CONTATO,'
      '  TB_CADASTRO.DESC_TELEFONE '
      ' '
      ' '
      ' '
      ' ')
    Variables.Data = {
      03000000040000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C000000000000000000000005000000
      3A52414D4F0300000000000000000000000B0000003A53555045525649534F52
      030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000100000000C000000434F445F434144415354524F0100000000000400
      00004E4F4D450100000000000C0000004E4F4D455F434F4E5441544F01000000
      00000D000000444553435F54454C45464F4E450100000000000B00000056414C
      5F4A414E4549524F0100000000000D00000056414C5F46455645524549524F01
      00000000000900000056414C5F4D4152434F0100000000000900000056414C5F
      414252494C0100000000000800000056414C5F4D41494F010000000000090000
      0056414C5F4A554E484F0100000000000900000056414C5F4A554C484F010000
      0000000A00000056414C5F41474F53544F0100000000000C00000056414C5F53
      4554454D42524F0100000000000B00000056414C5F4F55545542524F01000000
      00000C00000056414C5F4E4F56454D42524F0100000000000C00000056414C5F
      44455A454D42524F010000000000}
    Session = DMOracle.DBCemapa
    Left = 480
    Top = 488
    object QRVendasRamoClienteCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRVendasRamoClienteNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRVendasRamoClienteNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 30
    end
    object QRVendasRamoClienteDESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 12
    end
    object QRVendasRamoClienteVAL_JANEIRO: TFloatField
      FieldName = 'VAL_JANEIRO'
    end
    object QRVendasRamoClienteVAL_FEVEREIRO: TFloatField
      FieldName = 'VAL_FEVEREIRO'
    end
    object QRVendasRamoClienteVAL_MARCO: TFloatField
      FieldName = 'VAL_MARCO'
    end
    object QRVendasRamoClienteVAL_ABRIL: TFloatField
      FieldName = 'VAL_ABRIL'
    end
    object QRVendasRamoClienteVAL_MAIO: TFloatField
      FieldName = 'VAL_MAIO'
    end
    object QRVendasRamoClienteVAL_JUNHO: TFloatField
      FieldName = 'VAL_JUNHO'
    end
    object QRVendasRamoClienteVAL_JULHO: TFloatField
      FieldName = 'VAL_JULHO'
    end
    object QRVendasRamoClienteVAL_AGOSTO: TFloatField
      FieldName = 'VAL_AGOSTO'
    end
    object QRVendasRamoClienteVAL_SETEMBRO: TFloatField
      FieldName = 'VAL_SETEMBRO'
    end
    object QRVendasRamoClienteVAL_OUTUBRO: TFloatField
      FieldName = 'VAL_OUTUBRO'
    end
    object QRVendasRamoClienteVAL_NOVEMBRO: TFloatField
      FieldName = 'VAL_NOVEMBRO'
    end
    object QRVendasRamoClienteVAL_DEZEMBRO: TFloatField
      FieldName = 'VAL_DEZEMBRO'
    end
  end
  object QRVendVendedorResumo: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_VENDEDOR + 0.00 AS COD_VENDEDOR,'
      '  NOME,'
      '  SUM(QT_QUANTIDADE) AS QT_QUANTIDADE,'
      '  SUM(VAL_TOTAL) AS VAL_TOTAL,'
      '  SUM(VAL_ICMS) AS VAL_ICMS,'
      '  SUM(VAL_COMISSAO) AS VAL_COMISSAO,'
      '  SUM(VAL_FRETE) AS VAL_FRETE,'
      '  SUM(VAL_CUSTO) AS VAL_CUSTO,'
      '  SUM(TRIB_FED) AS TRIB_FED,'
      '  SUM(VAL_BONIFICACAO) AS VAL_BONIFICACAO'
      'FROM'
      '('
      '  SELECT'
      '    TB_VENDEDOR.COD_VENDEDOR,'
      '    TB_VENDEDOR.NOME,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',TB_NOTA_ITEM.QT_QUANTI' +
        'DADE,TB_NOTA_ITEM.QT_QUANTIDADE * -1)*TB_PRODUTO.NUM_EMBALAGEM) ' +
        'AS QT_QUANTIDADE,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',(Tb_nota_item.VAL_TOTA' +
        'L - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_ite' +
        'm.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRETE),' +
        '(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NO' +
        'TA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb' +
        '_nota_item.VAL_FRETE)*-1)) AS VAL_TOTAL,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_EMITE,'#39'F'#39',TB_NOTA_ITEM.VAL_ICM,0)' +
        ') AS VAL_ICMS,'
      
        '    SUM((TB_NOTA_ITEM.VAL_TOTAL- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS)*(DECODE(TB_NOTA_ITE' +
        'M.PERC_COMISSAO,0,DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',TB_NOTA_CAB.' +
        'PERC_COMISSAO,TB_NOTA_CAB.PERC_COMISSAO * -1),DECODE(TB_OPERACAO' +
        '.IND_VENDAS,'#39'V'#39',TB_NOTA_ITEM.PERC_COMISSAO,TB_NOTA_ITEM.PERC_COM' +
        'ISSAO * -1))/100)) AS VAL_COMISSAO,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',TB_NOTA_ITEM.VAL_TOTAL' +
        '*TB_VENDEDOR.PERC_FRETE/100,0)) AS VAL_FRETE,'
      
        '    SUM(TB_PRODUTO.NUM_EMBALAGEM*TB_CLASSE.VAL_CUSTO*DECODE(TB_O' +
        'PERACAO.IND_VENDAS,'#39'V'#39',TB_NOTA_ITEM.QT_QUANTIDADE,TB_NOTA_ITEM.Q' +
        'T_QUANTIDADE*-1)) AS VAL_CUSTO,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_EMITE,'#39'F'#39',TB_NOTA_ITEM.VAL_TOTAL*' +
        '(:VAL_TRIBUTO)/100,0)) AS TRIB_FED,'
      '    0 AS VAL_BONIFICACAO'
      '  FROM'
      '    TB_VENDEDOR,'
      '    TB_PRODUTO,'
      '    TB_CLASSE,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO'
      '  WHERE'
      '    TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB'
      '    AND'
      '    TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '    AND'
      '    TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '    AND'
      '    TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '    AND'
      '    TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '    AND'
      '    ((TB_OPERACAO.IND_VENDAS = '#39'V'#39')'
      '     OR'
      '     (TB_OPERACAO.IND_VENDAS = '#39'D'#39'))'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DT_INICIAL'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DT_FINAL'
      '    AND'
      '    (:VENDEDOR IS NULL'
      '     OR'
      '      TB_VENDEDOR.COD_VENDEDOR = :VENDEDOR)'
      '    AND'
      '    (:SUPERVISOR IS NULL'
      '     OR'
      '      :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '    AND'
      '    (:CLASSE IS NULL'
      '      OR'
      '      TB_CLASSE.COD_CLASSE = :CLASSE)'
      '    AND'
      '    (:FILIAL IS NULL'
      '      OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '  GROUP BY'
      '    TB_VENDEDOR.COD_VENDEDOR,'
      '    TB_VENDEDOR.NOME'
      ''
      '  UNION'
      ''
      '  /* *** BONIFICA'#199#213'ES ****  */'
      '  SELECT'
      '    TB_VENDEDOR.COD_VENDEDOR,'
      '    TB_VENDEDOR.NOME,'
      '    0 AS QT_QUANTIDADE,'
      '    0 AS VAL_TOTAL,'
      '    0 AS VAL_ICMS,'
      '    0 AS VAL_COMISSAO,'
      '    0 AS VAL_FRETE,'
      '    0 AS VAL_CUSTO,'
      '    0 AS TRIB_FED,'
      
        '    SUM(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM*TB_C' +
        'LASSE.VAL_CUSTO) AS VAL_BONIFICACAO'
      '  FROM'
      '    TB_VENDEDOR,'
      '    TB_PRODUTO,'
      '    TB_CLASSE,'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO'
      '  WHERE'
      '    TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB'
      '    AND'
      '    TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '    AND'
      '    TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '    AND'
      '    TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '    AND'
      '    TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '    AND'
      '    (Tb_operacao.ind_bonificacao = '#39'S'#39')'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DT_INICIAL'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DT_FINAL'
      '    AND'
      '    (:VENDEDOR IS NULL'
      '      OR'
      '      TB_VENDEDOR.COD_VENDEDOR = :VENDEDOR)'
      '    AND'
      '    (:SUPERVISOR IS NULL'
      '     OR'
      '      :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '    AND'
      '    (:CLASSE IS NULL'
      '      OR'
      '      TB_CLASSE.COD_CLASSE = :CLASSE)'
      '    AND'
      '    (:FILIAL IS NULL'
      '      OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '  GROUP BY'
      '    TB_VENDEDOR.COD_VENDEDOR,'
      '    TB_VENDEDOR.NOME'
      ')'
      'GROUP BY'
      '  COD_VENDEDOR,'
      '  NOME'
      'ORDER BY'
      '  COD_VENDEDOR'
      ''
      ' '
      ' ')
    Variables.Data = {
      03000000070000000C0000003A56414C5F5452494255544F0400000000000000
      000000000B0000003A44545F494E494349414C0C000000000000000000000009
      0000003A44545F46494E414C0C0000000000000000000000090000003A56454E
      4445444F520300000000000000000000000B0000003A53555045525649534F52
      030000000000000000000000070000003A434C41535345030000000000000000
      000000070000003A46494C49414C030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000C000000434F445F56454E4445444F520100000000000400
      00004E4F4D450100000000000D00000051545F5155414E544944414445010000
      0000000900000056414C5F544F54414C0100000000000800000056414C5F4943
      4D530100000000000C00000056414C5F434F4D495353414F0100000000000900
      000056414C5F46524554450100000000000900000056414C5F435553544F0100
      0000000008000000545249425F4645440100000000000F00000056414C5F424F
      4E494649434143414F010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRVendVendedorResumoCalcFields
    Left = 584
    Top = 384
    object QRVendVendedorResumoCOD_VENDEDOR: TFloatField
      FieldName = 'COD_VENDEDOR'
    end
    object QRVendVendedorResumoNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object QRVendVendedorResumoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QRVendVendedorResumoVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QRVendVendedorResumoVAL_ICMS: TFloatField
      FieldName = 'VAL_ICMS'
    end
    object QRVendVendedorResumoVAL_COMISSAO: TFloatField
      FieldName = 'VAL_COMISSAO'
    end
    object QRVendVendedorResumoVAL_FRETE: TFloatField
      FieldName = 'VAL_FRETE'
    end
    object QRVendVendedorResumoVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
    end
    object QRVendVendedorResumoTRIB_FED: TFloatField
      FieldName = 'TRIB_FED'
    end
    object QRVendVendedorResumoVAL_BONIFICACAO: TFloatField
      FieldName = 'VAL_BONIFICACAO'
    end
    object QRVendVendedorResumopreco_medio: TFloatField
      FieldKind = fkCalculated
      FieldName = 'preco_medio'
      Calculated = True
    end
  end
  object QRNotasCultura: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TO_CHAR(TB_NOTA_CAB.DT_EMISSAO,'#39'DD/MM'#39') AS DIA,'
      '  TB_CADASTRO.COD_CADASTRO,'
      '  TB_CADASTRO.NOME,'
      '  TB_CULTURA.COD_CULTURA,'
      '  TB_CULTURA.DESC_CULTURA,'
      '  TB_FILIAL.COD_FILIAL,'
      '  TB_FILIAL.DESC_FILIAL,'
      '  TB_PRODUTO.COD_PRODUTO,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'D'#39',TB_NOTA_ITEM.QT_QUANTIDA' +
        'DE*-1,TB_NOTA_ITEM.QT_QUANTIDADE)) AS SQT_QUANTIDADE,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'D'#39',(TB_NOTA_ITEM.VAL_TOTAL-' +
        ' PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) +TB_NOTA_ITEM.VA' +
        'L_DESPESAS+TB_NOTA_ITEM.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)' +
        '*-1,TB_NOTA_ITEM.VAL_TOTAL- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_' +
        'NOTA_ITEM) +TB_NOTA_ITEM.VAL_DESPESAS+TB_NOTA_ITEM.VAL_FRETE + T' +
        'B_NOTA_ITEM.VAL_ICMS_SUBST)) AS SVAL_TOTAL,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'D'#39',(TB_NOTA_ITEM.VAL_CUSTO)' +
        '*-1,TB_NOTA_ITEM.VAL_CUSTO*TB_NOTA_ITEM.QT_QUANTIDADE)) AS SVAL_' +
        'CUSTO'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_OPERACAO,'
      '  TB_PRODUTO,'
      '  TB_FILIAL,'
      '  TB_LOTE_TIPO,'
      '  TB_CADASTRO,'
      '  TB_CULTURA'
      'WHERE'
      '  TB_NOTA_ITEM.COD_CULTURA = TB_CULTURA.COD_CULTURA'
      '  AND'
      '  TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      '  TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '  AND'
      '  ((TB_OPERACAO.IND_VENDAS = '#39'D'#39')'
      '    or'
      '   (TB_OPERACAO.IND_VENDAS = '#39'V'#39'))'
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB'
      '  AND'
      '  TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_FILIAL.COD_FILIAL = TB_NOTA_CAB.COD_FILIAL'
      '  AND'
      '  TB_NOTA_ITEM.COD_LOTE_TIPO = TB_LOTE_TIPO.COD_LOTE_TIPO'
      '  AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO >= :DT_INICIAL'
      '  AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO <= :DT_FINAL'
      '  AND'
      '  (:FILIAL IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '  AND'
      '  (:CULTURA IS NULL'
      '   OR'
      '    TB_NOTA_ITEM.COD_CULTURA = :CULTURA)'
      '  AND'
      '  (:CADASTRO IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_CADASTRO = :CADASTRO)'
      '  AND'
      '  (:VENDEDOR IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      'GROUP BY'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      '  TB_CADASTRO.COD_CADASTRO,'
      '  TB_CADASTRO.NOME,'
      '  TB_CULTURA.COD_CULTURA,'
      '  TB_CULTURA.DESC_CULTURA,'
      '  TB_FILIAL.COD_FILIAL,'
      '  TB_FILIAL.DESC_FILIAL,'
      '  TB_PRODUTO.COD_PRODUTO,'
      '  TB_PRODUTO.DESC_PRODUTO'
      'ORDER BY'
      '  NOME')
    Variables.Data = {
      03000000060000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C000000000000000000000007000000
      3A46494C49414C030000000000000000000000080000003A43554C5455524103
      0000000000000000000000090000003A434144415354524F0300000000000000
      00000000090000003A56454E4445444F52030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C000000030000004449410100000000000C000000434F445F434144
      415354524F010000000000040000004E4F4D450100000000000B000000434F44
      5F43554C545552410100000000000C000000444553435F43554C545552410100
      000000000A000000434F445F46494C49414C0100000000000B00000044455343
      5F46494C49414C0100000000000B000000434F445F50524F4455544F01000000
      00000C000000444553435F50524F4455544F0100000000000E0000005351545F
      5155414E5449444144450100000000000A0000005356414C5F544F54414C0100
      000000000A0000005356414C5F435553544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 584
    Top = 456
    object QRNotasCulturaDIA: TStringField
      FieldName = 'DIA'
      Size = 5
    end
    object QRNotasCulturaCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRNotasCulturaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRNotasCulturaCOD_CULTURA: TIntegerField
      FieldName = 'COD_CULTURA'
      Required = True
    end
    object QRNotasCulturaDESC_CULTURA: TStringField
      FieldName = 'DESC_CULTURA'
      Required = True
      Size = 30
    end
    object QRNotasCulturaCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QRNotasCulturaDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRNotasCulturaCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRNotasCulturaDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRNotasCulturaSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRNotasCulturaSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRNotasCulturaSVAL_CUSTO: TFloatField
      FieldName = 'SVAL_CUSTO'
    end
  end
  object QrMovMercadoria_CR: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  DT_EMISSAO,'
      '  DT_VENCIMENTO,'
      '  VAL_ORIGINAL,'
      '  NUM_PARCELA'
      'From'
      '  TB_CONTA_RECEBER_CAB'
      'where cod_nota_cab = :cod_nota_cab')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000A00000044545F454D495353414F0100000000000D000000
      44545F56454E43494D454E544F0100000000000C00000056414C5F4F52494749
      4E414C0100000000000B0000004E554D5F50415243454C41010000000000}
    Master = QRMovMercadoria
    MasterFields = 'COD_NOTA_CAB'
    DetailFields = 'COD_NOTA_CAB'
    Session = DMOracle.DBCemapa
    Left = 368
    Top = 72
    object QrMovMercadoria_CRDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QrMovMercadoria_CRDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object QrMovMercadoria_CRVAL_ORIGINAL: TFloatField
      FieldName = 'VAL_ORIGINAL'
    end
    object QrMovMercadoria_CRNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
  end
  object QrVendaComDesconto: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_CADASTRO.NOME,'
      '  TB_NOTA_CAB.NUM_NOTA,'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      '  TB_NOTA_ITEM.COD_PRODUTO,'
      '  TB_NOTA_ITEM.VAL_UNITARIO_TABELA AS VAL_VAREJO,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      
        '  TB_NOTA_ITEM.VAL_DESCONTO + TB_NOTA_ITEM.VAL_DESCONTO_RATEIO A' +
        'S VAL_DESCONTO,'
      
        '  (TB_NOTA_ITEM.VAL_DESCONTO + TB_NOTA_ITEM.VAL_DESCONTO_RATEIO ' +
        '/ TB_NOTA_ITEM.VAL_TOTAL * 100) AS PERC_DESCONTO,'
      '  TB_NOTA_ITEM.VAL_UNITARIO,'
      '  TB_NOTA_ITEM.VAL_CUSTO,'
      '  TB_NOTA_ITEM.QT_QUANTIDADE'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_CADASTRO,'
      '  TB_PRODUTO'
      'WHERE'
      '  TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '  AND'
      '  TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      '  TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      '  AND'
      
        '  ((TB_NOTA_ITEM.VAL_DESCONTO <> 0) OR (TB_NOTA_ITEM.VAL_DESCONT' +
        'O_RATEIO <> 0))'
      '  AND '
      '  (:COD_CADASTRO IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO)'
      '  AND'
      '  (:COD_FILIAL IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      '  AND'
      '  (:COD_DEPARTAMENTO IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_DEPARTAMENTO = :COD_DEPARTAMENTO)'
      '  AND'
      '  :COD_VENDEDOR'
      '  AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO >= :DT_INICIAL'
      '  AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO <= :DT_FINAL'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Variables.Data = {
      03000000060000000D0000003A434F445F434144415354524F03000000000000
      0000000000110000003A434F445F444550415254414D454E544F030000000000
      0000000000000B0000003A44545F494E494349414C0C00000000000000000000
      00090000003A44545F46494E414C0C00000000000000000000000B0000003A43
      4F445F46494C49414C0300000000000000000000000D0000003A434F445F5645
      4E4445444F520100000004000000313D310000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B000000040000004E4F4D45010000000000080000004E554D5F4E4F
      54410100000000000B000000434F445F50524F4455544F0100000000000A0000
      0056414C5F564152454A4F0100000000000C00000056414C5F444553434F4E54
      4F0100000000000D000000504552435F444553434F4E544F0100000000000900
      000056414C5F435553544F0100000000000A00000044545F454D495353414F01
      00000000000C000000444553435F50524F4455544F0100000000000C00000056
      414C5F554E49544152494F0100000000000D00000051545F5155414E54494441
      4445010000000000}
    Session = DMOracle.DBCemapa
    Left = 256
    Top = 488
    object QrVendaComDescontoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QrVendaComDescontoNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QrVendaComDescontoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QrVendaComDescontoVAL_VAREJO: TFloatField
      FieldName = 'VAL_VAREJO'
    end
    object QrVendaComDescontoVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
    end
    object QrVendaComDescontoPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
      Required = True
    end
    object QrVendaComDescontoVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
      Required = True
    end
    object QrVendaComDescontoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QrVendaComDescontoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QrVendaComDescontoVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
    end
    object QrVendaComDescontoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
  end
  object QRVendedorResumoVenda: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_VENDEDOR + 0.00 AS COD_VENDEDOR,'
      '  NOME,'
      '  CASE'
      '    WHEN :TIPO_PAGTO = '#39'1'#39' THEN'
      
        '      SUM(TOTAL+VAL_ENTRADA_PRAZO+VAL_ENTRADA_OUTROS+VAL_ENTRADA' +
        '_CARTAO)'
      '    WHEN :TIPO_PAGTO = '#39'2'#39' THEN'
      '      SUM(TOTAL-VAL_ENTRADA_PRAZO)  '
      '    WHEN :TIPO_PAGTO = '#39'3'#39' THEN'
      '      SUM(TOTAL-VAL_ENTRADA_OUTROS)'
      '    WHEN :TIPO_PAGTO = '#39'4'#39' THEN'
      '      SUM(TOTAL-VAL_ENTRADA_CARTAO)'
      '    ELSE'
      '      SUM(TOTAL)'
      '  END AS TOTAL,'
      '  SUM(QUANTIDADE) AS QUANTIDADE'
      'FROM'
      '('
      '  SELECT'
      '    N.COD_VENDEDOR,'
      '    V.NOME,    '
      
        '    SUM(NI.VAL_TOTAL- PEGA_DESCONTO_ITEM(NI.COD_NOTA_ITEM) +NI.V' +
        'AL_DESPESAS+NI.VAL_FRETE+NI.VAL_ICMS_SUBST) AS TOTAL,'
      '    SUM(NI.QT_QUANTIDADE) AS QUANTIDADE,'
      '    0 AS VAL_ENTRADA_PRAZO,'
      '    0 AS VAL_ENTRADA_OUTROS,'
      '    0 AS VAL_ENTRADA_CARTAO,'
      '    N.DT_RECEBIMENTO'
      '  FROM'
      '    TB_NOTA_CAB N'
      '  INNER JOIN'
      '    TB_NOTA_ITEM NI'
      '  ON'
      '    NI.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '  INNER JOIN'
      '    TB_VENDEDOR V'
      '  ON'
      '    V.COD_VENDEDOR = N.COD_VENDEDOR'
      '  INNER JOIN'
      '    TB_OPERACAO OP'
      '  ON'
      '    OP.COD_OPERACAO = N.COD_OPERACAO'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    OP.IND_VENDAS = '#39'V'#39
      '    AND'
      '    (:TIPO_PAGTO IS NULL'
      '     OR'
      '      N.IND_CONDICAO_PAGTO = :TIPO_PAGTO)'
      '    AND'
      '    (:FILIAL IS NULL'
      '     OR'
      '      N.COD_FILIAL = :FILIAL)'
      '    AND'
      '    N.DT_RECEBIMENTO >= :DT_INICIAL'
      '    AND'
      '    N.DT_RECEBIMENTO <= :DT_FINAL'
      '    AND'
      '    (:VENDEDOR IS NULL'
      '     OR'
      '      N.COD_VENDEDOR =:VENDEDOR)'
      '    AND'
      '    (:SUPERVISOR IS NULL'
      '     OR'
      '      V.COD_SUPERVISOR =:SUPERVISOR)'
      '    AND'
      '    (:PRODUTO IS NULL'
      '      OR'
      '      NI.COD_PRODUTO = :PRODUTO)'
      '  GROUP BY N.COD_VENDEDOR, V.NOME, 0, 0, 0, N.DT_RECEBIMENTO'
      ''
      '  UNION ALL'
      ''
      '  SELECT  /* AQUI '#201' AS DEVOLUCOES */'
      '    N.COD_VENDEDOR,'
      '    V.NOME,'
      
        '    SUM((NI.VAL_TOTAL- NVL(PEGA_DESCONTO_ITEM(NI.COD_NOTA_ITEM),' +
        '0) +NI.VAL_DESPESAS+ NI.VAL_FRETE +NI.VAL_ICMS_SUBST) * -1) AS T' +
        'OTAL,'
      '    SUM(NI.QT_QUANTIDADE * -1) AS QUANTIDADE,'
      '    0 AS VAL_ENTRADA_PRAZO,'
      '    0 AS VAL_ENTRADA_OUTROS,'
      '    0 AS VAL_ENTRADA_CARTAO,'
      '    N.DT_RECEBIMENTO'
      '  FROM'
      '    TB_NOTA_CAB N'
      '  INNER JOIN'
      '    TB_NOTA_ITEM NI'
      '  ON'
      '    NI.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '  LEFT JOIN'
      '    TB_TEF_CAB TEF'
      '  ON'
      
        '    TEF.COD_NOTA_CAB = N.COD_NOTA_CAB AND TEF.IND_STATUS = '#39'EFET' +
        'UADA'#39
      '  INNER JOIN'
      '    TB_VENDEDOR V'
      '  ON'
      '    V.COD_VENDEDOR = N.COD_VENDEDOR'
      '  INNER JOIN'
      '    TB_OPERACAO OP'
      '  ON'
      '    OP.COD_OPERACAO = N.COD_OPERACAO'
      '  LEFT JOIN'
      '    TB_VALE_PRODUTO VP'
      '  ON'
      '    VP.COD_NOTA_CAB_TROCA = N.COD_NOTA_CAB'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    OP.IND_VENDAS = '#39'D'#39
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    (:TIPO_PAGTO IS NULL'
      '     OR'
      '      N.IND_CONDICAO_PAGTO = :TIPO_PAGTO)'
      '    AND'
      '    (:FILIAL IS NULL'
      '     OR'
      '      N.COD_FILIAL = :FILIAL)'
      '    AND'
      '    N.DT_RECEBIMENTO >= :DT_INICIAL'
      '    AND'
      '    N.DT_RECEBIMENTO <= :DT_FINAL'
      '    AND'
      '    (:VENDEDOR IS NULL'
      '     OR'
      '      N.COD_VENDEDOR =:VENDEDOR)'
      '    AND'
      '    (:SUPERVISOR IS NULL'
      '     OR'
      '      V.COD_SUPERVISOR =:SUPERVISOR)'
      '    AND'
      '    (:PRODUTO IS NULL'
      '      OR'
      '      NI.COD_PRODUTO = :PRODUTO)'
      '    AND'
      '    (N.COD_NOTA_CAB <> VP.COD_NOTA_CAB_TROCA OR'
      '     :PRODUTO IS NOT NULL)'
      '  GROUP BY'
      '    N.COD_VENDEDOR,'
      '    V.NOME,'
      '    N.DT_RECEBIMENTO,'
      '    N.COD_NOTA_CAB'
      ''
      '  UNION ALL  '
      '  '
      
        '  SELECT /*AQUI SOMA O VALOR DE ENTRADA DAS NOTAS A PRAZO, OUTRO' +
        'S E CART'#195'O*/'
      '    N.COD_VENDEDOR,'
      '    V.NOME,'
      '    0 AS TOTAL,    '
      '    0 AS QUANTIDADE,'
      
        '    DECODE(N.IND_CONDICAO_PAGTO,'#39'2'#39',N.VAL_AVISTA,0) AS VAL_ENTRA' +
        'DA_PRAZO,'
      
        '    DECODE(N.IND_CONDICAO_PAGTO,'#39'3'#39',N.VAL_AVISTA,0) AS VAL_ENTRA' +
        'DA_OUTROS,'
      
        '    DECODE(N.IND_CONDICAO_PAGTO,'#39'4'#39',N.VAL_AVISTA,0) AS VAL_ENTRA' +
        'DA_CARTAO,'
      '    N.DT_RECEBIMENTO'
      '  FROM'
      '    TB_NOTA_CAB N'
      '  INNER JOIN'
      '    TB_NOTA_ITEM NI'
      '  ON'
      '    NI.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '  INNER JOIN'
      '    TB_VENDEDOR V'
      '  ON'
      '    V.COD_VENDEDOR = N.COD_VENDEDOR'
      '  INNER JOIN'
      '    TB_OPERACAO OP'
      '  ON'
      '    OP.COD_OPERACAO = N.COD_OPERACAO'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    OP.IND_VENDAS = '#39'V'#39
      '    AND'
      '    (:FILIAL IS NULL'
      '     OR'
      '      N.COD_FILIAL = :FILIAL)'
      '    AND'
      '    N.DT_RECEBIMENTO >= :DT_INICIAL'
      '    AND'
      '    N.DT_RECEBIMENTO <= :DT_FINAL'
      '    AND'
      '    (:VENDEDOR IS NULL'
      '     OR'
      '      N.COD_VENDEDOR =:VENDEDOR)'
      '    AND'
      '    (:SUPERVISOR IS NULL'
      '     OR'
      '      V.COD_SUPERVISOR =:SUPERVISOR)'
      '    AND'
      '    (:PRODUTO IS NULL'
      '      OR'
      '      NI.COD_PRODUTO = :PRODUTO)'
      '    AND'
      '    N.VAL_AVISTA > 0'
      '    AND'
      '    N.IND_CONDICAO_PAGTO <> '#39'1'#39
      '    AND'
      '    :TIPO_PAGTO IS NOT NULL'
      '  GROUP BY'
      '    N.COD_VENDEDOR, '
      '    V.NOME,'
      '    DECODE(N.IND_CONDICAO_PAGTO,'#39'2'#39',N.VAL_AVISTA,0),'
      '    DECODE(N.IND_CONDICAO_PAGTO,'#39'3'#39',N.VAL_AVISTA,0),'
      '    DECODE(N.IND_CONDICAO_PAGTO,'#39'4'#39',N.VAL_AVISTA,0),'
      '    N.DT_RECEBIMENTO,'
      '    N.COD_NOTA_CAB'
      '    '
      '  UNION ALL'
      ''
      '  SELECT  /* VALES A SEREM DESCONTADOS */'
      '    N.COD_VENDEDOR,'
      '    V.NOME,'
      
        '    SUM((NI.VAL_UNITARIO * VPI.QT_QUANTIDADE_DEVOLVIDA) * -1) AS' +
        ' TOTAL,'
      '    SUM(VPI.QT_QUANTIDADE_DEVOLVIDA * -1) AS QUANTIDADE,'
      '    0 AS VAL_ENTRADA_PRAZO,'
      '    0 AS VAL_ENTRADA_OUTROS,'
      '    0 AS VAL_ENTRADA_CARTAO,'
      '    N.DT_RECEBIMENTO'
      '  FROM'
      '    TB_VALE_PRODUTO VP'
      '  INNER JOIN'
      '    TB_NOTA_CAB N'
      '  ON'
      '    VP.COD_NOTA_CAB_TROCA = N.COD_NOTA_CAB'
      '  INNER JOIN'
      '    TB_VALE_PRODUTO_ITEM VPI'
      '  ON'
      '    VPI.COD_VALE_PRODUTO = VP.COD_VALE_PRODUTO'
      '  INNER JOIN'
      '    TB_NOTA_ITEM NI'
      '  ON'
      '    NI.COD_NOTA_ITEM = VPI.COD_NOTA_ITEM'
      '  LEFT JOIN'
      '    TB_TEF_CAB TEF'
      '  ON'
      
        '    TEF.COD_NOTA_CAB = N.COD_NOTA_CAB AND TEF.IND_STATUS = '#39'EFET' +
        'UADA'#39
      '  INNER JOIN'
      '    TB_VENDEDOR V'
      '  ON'
      '    V.COD_VENDEDOR = N.COD_VENDEDOR'
      '  INNER JOIN'
      '    TB_OPERACAO OP'
      '  ON'
      '    OP.COD_OPERACAO = N.COD_OPERACAO'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    (:TIPO_PAGTO IS NULL'
      '     OR'
      '      N.IND_CONDICAO_PAGTO = :TIPO_PAGTO)'
      '    AND'
      '    (:FILIAL IS NULL'
      '     OR'
      '      N.COD_FILIAL = :FILIAL)'
      '    AND'
      '    N.DT_RECEBIMENTO >= :DT_INICIAL'
      '    AND'
      '    N.DT_RECEBIMENTO <= :DT_FINAL'
      '    AND'
      '    (:VENDEDOR IS NULL'
      '     OR'
      '      N.COD_VENDEDOR =:VENDEDOR)'
      '    AND'
      '    (:SUPERVISOR IS NULL'
      '     OR'
      '      V.COD_SUPERVISOR =:SUPERVISOR)'
      '    AND'
      '    (:PRODUTO IS NULL)'
      '  GROUP BY'
      '    N.COD_VENDEDOR,'
      '    V.NOME,'
      '    N.DT_RECEBIMENTO,'
      '    N.COD_NOTA_CAB'
      
        ') WHERE DT_RECEBIMENTO >= :DT_INICIAL AND DT_RECEBIMENTO <= :DT_' +
        'FINAL'
      'GROUP BY COD_VENDEDOR + 0.00, NOME'
      ''
      '')
    Variables.Data = {
      03000000070000000B0000003A5449504F5F504147544F030000000000000000
      000000070000003A46494C49414C0300000000000000000000000B0000003A44
      545F494E494349414C0C0000000000000000000000090000003A44545F46494E
      414C0C0000000000000000000000090000003A56454E4445444F520300000000
      000000000000000B0000003A53555045525649534F5203000000000000000000
      0000080000003A50524F4455544F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000C000000434F445F56454E4445444F520100000000000400
      00004E4F4D4501000000000005000000544F54414C0100000000000A00000051
      55414E544944414445010000000000}
    Session = DMOracle.DBCemapa
    Left = 680
    Top = 546
    object QRVendedorResumoVendaCOD_VENDEDOR: TFloatField
      FieldName = 'COD_VENDEDOR'
    end
    object QRVendedorResumoVendaNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object QRVendedorResumoVendaTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object QRVendedorResumoVendaQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
  end
  object QRVendedorCMedioMes: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_VENDEDOR + 0.00 AS COD_VENDEDOR,'
      '  NOME_VENDEDOR AS NOME_VENDEDOR,'
      '  COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  COD_CLASSE + 0.00 AS COD_CLASSE,'
      '  DESC_CLASSE,'
      '  num_classe + 0.00 AS NUM_CLASSE,'
      '  SUM(SVAL_TOTAL_JAN) AS SVAL_TOTAL_JAN,'
      '  SUM(SVAL_TOTAL_FEV) AS SVAL_TOTAL_FEV,'
      '  SUM(SVAL_TOTAL_MAR) AS SVAL_TOTAL_MAR,'
      '  SUM(SVAL_TOTAL_ABR) AS SVAL_TOTAL_ABR,'
      '  SUM(SVAL_TOTAL_MAI) AS SVAL_TOTAL_MAI,'
      '  SUM(SVAL_TOTAL_JUN) AS SVAL_TOTAL_JUN,'
      '  SUM(SVAL_TOTAL_JUL) AS SVAL_TOTAL_JUL,'
      '  SUM(SVAL_TOTAL_AGO) AS SVAL_TOTAL_AGO,'
      '  SUM(SVAL_TOTAL_SET) AS SVAL_TOTAL_SET,'
      '  SUM(SVAL_TOTAL_OUT) AS SVAL_TOTAL_OUT,'
      '  SUM(SVAL_TOTAL_NOV) AS SVAL_TOTAL_NOV,'
      '  SUM(SVAL_TOTAL_DEZ) AS SVAL_TOTAL_DEZ,'
      ''
      '  SUM(SQT_QUANTIDADE_JAN) AS SQT_QUANTIDADE_JAN,'
      '  SUM(SQT_QUANTIDADE_FEV) AS SQT_QUANTIDADE_FEV,'
      '  SUM(SQT_QUANTIDADE_MAR) AS SQT_QUANTIDADE_MAR,'
      '  SUM(SQT_QUANTIDADE_ABR) AS SQT_QUANTIDADE_ABR,'
      '  SUM(SQT_QUANTIDADE_MAI) AS SQT_QUANTIDADE_MAI,'
      '  SUM(SQT_QUANTIDADE_JUN) AS SQT_QUANTIDADE_JUN,'
      '  SUM(SQT_QUANTIDADE_JUL) AS SQT_QUANTIDADE_JUL,'
      '  SUM(SQT_QUANTIDADE_AGO) AS SQT_QUANTIDADE_AGO,'
      '  SUM(SQT_QUANTIDADE_SET) AS SQT_QUANTIDADE_SET,'
      '  SUM(SQT_QUANTIDADE_OUT) AS SQT_QUANTIDADE_OUT,'
      '  SUM(SQT_QUANTIDADE_NOV) AS SQT_QUANTIDADE_NOV,'
      '  SUM(SQT_QUANTIDADE_DEZ) AS SQT_QUANTIDADE_DEZ,'
      ''
      '  SUM(SQT_KILOS_JAN) AS SQT_KILOS_JAN,'
      '  SUM(SQT_KILOS_FEV) AS SQT_KILOS_FEV,'
      '  SUM(SQT_KILOS_MAR) AS SQT_KILOS_MAR,'
      '  SUM(SQT_KILOS_ABR) AS SQT_KILOS_ABR,'
      '  SUM(SQT_KILOS_MAI) AS SQT_KILOS_MAI,'
      '  SUM(SQT_KILOS_JUN) AS SQT_KILOS_JUN,'
      '  SUM(SQT_KILOS_JUL) AS SQT_KILOS_JUL,'
      '  SUM(SQT_KILOS_AGO) AS SQT_KILOS_AGO,'
      '  SUM(SQT_KILOS_SET) AS SQT_KILOS_SET,'
      '  SUM(SQT_KILOS_OUT) AS SQT_KILOS_OUT,'
      '  SUM(SQT_KILOS_NOV) AS SQT_KILOS_NOV,'
      '  SUM(SQT_KILOS_DEZ) AS SQT_KILOS_DEZ,'
      ''
      '  SUM(SQT_KILOS_BONIFICACAO_JAN) AS SQT_KILOS_BONIFICACAO_JAN,'
      '  SUM(SQT_KILOS_BONIFICACAO_FEV) AS SQT_KILOS_BONIFICACAO_FEV,'
      '  SUM(SQT_KILOS_BONIFICACAO_MAR) AS SQT_KILOS_BONIFICACAO_MAR,'
      '  SUM(SQT_KILOS_BONIFICACAO_ABR) AS SQT_KILOS_BONIFICACAO_ABR,'
      '  SUM(SQT_KILOS_BONIFICACAO_MAI) AS SQT_KILOS_BONIFICACAO_MAI,'
      '  SUM(SQT_KILOS_BONIFICACAO_JUN) AS SQT_KILOS_BONIFICACAO_JUN,'
      '  SUM(SQT_KILOS_BONIFICACAO_JUL) AS SQT_KILOS_BONIFICACAO_JUL,'
      '  SUM(SQT_KILOS_BONIFICACAO_AGO) AS SQT_KILOS_BONIFICACAO_AGO,'
      '  SUM(SQT_KILOS_BONIFICACAO_SET) AS SQT_KILOS_BONIFICACAO_SET,'
      '  SUM(SQT_KILOS_BONIFICACAO_OUT) AS SQT_KILOS_BONIFICACAO_OUT,'
      '  SUM(SQT_KILOS_BONIFICACAO_NOV) AS SQT_KILOS_BONIFICACAO_NOV,'
      '  SUM(SQT_KILOS_BONIFICACAO_DEZ) AS SQT_KILOS_BONIFICACAO_DEZ'
      'FROM'
      '('
      '  SELECT'
      '        Tb_vendedor.COD_VENDEDOR,'
      '        Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '        Tb_produto.COD_PRODUTO,'
      '        Tb_produto.DESC_PRODUTO,'
      '        Tb_Classe.Cod_Classe,'
      '        Tb_Classe.Desc_Classe,'
      '        tb_classe.num_classe,'
      ''
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 01, SUM' +
        '(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NO' +
        'TA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb' +
        '_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST),0) AS SVAL_T' +
        'OTAL_JAN,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 02, SUM' +
        '(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NO' +
        'TA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb' +
        '_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST),0) AS SVAL_T' +
        'OTAL_FEV,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 03, SUM' +
        '(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NO' +
        'TA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb' +
        '_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST),0) AS SVAL_T' +
        'OTAL_MAR,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 04, SUM' +
        '(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NO' +
        'TA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb' +
        '_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST),0) AS SVAL_T' +
        'OTAL_ABR,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 05, SUM' +
        '(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NO' +
        'TA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb' +
        '_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST),0) AS SVAL_T' +
        'OTAL_MAI,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 06, SUM' +
        '(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NO' +
        'TA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb' +
        '_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST),0) AS SVAL_T' +
        'OTAL_JUN,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 07, SUM' +
        '(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NO' +
        'TA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb' +
        '_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST),0) AS SVAL_T' +
        'OTAL_JUL,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 08, SUM' +
        '(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NO' +
        'TA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb' +
        '_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST),0) AS SVAL_T' +
        'OTAL_AGO,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 09, SUM' +
        '(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NO' +
        'TA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb' +
        '_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST),0) AS SVAL_T' +
        'OTAL_SET,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 10, SUM' +
        '(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NO' +
        'TA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb' +
        '_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST),0) AS SVAL_T' +
        'OTAL_OUT,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 11, SUM' +
        '(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NO' +
        'TA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb' +
        '_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST),0) AS SVAL_T' +
        'OTAL_NOV,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 12, SUM' +
        '(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NO' +
        'TA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb' +
        '_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST),0) AS SVAL_T' +
        'OTAL_DEZ,'
      ''
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 01, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE),0) AS SQT_QUANTIDADE_JAN,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 02, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE),0) AS SQT_QUANTIDADE_FEV,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 03, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE),0) AS SQT_QUANTIDADE_MAR,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 04, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE),0) AS SQT_QUANTIDADE_ABR,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 05, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE),0) AS SQT_QUANTIDADE_MAI,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 06, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE),0) AS SQT_QUANTIDADE_JUN,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 07, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE),0) AS SQT_QUANTIDADE_JUL,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 08, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE),0) AS SQT_QUANTIDADE_AGO,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 09, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE),0) AS SQT_QUANTIDADE_SET,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 10, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE),0) AS SQT_QUANTIDADE_OUT,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 11, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE),0) AS SQT_QUANTIDADE_NOV,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 12, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE),0) AS SQT_QUANTIDADE_DEZ,'
      ''
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 01, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_JAN,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 02, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_FEV,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 03, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_MAR,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 04, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_ABR,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 05, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_MAI,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 06, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_JUN,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 07, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_JUL,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 08, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_AGO,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 09, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_SET,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 10, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_OUT,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 11, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_NOV,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 12, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_DEZ,'
      ''
      '        0 AS SQT_KILOS_BONIFICACAO_JAN,'
      '        0 AS SQT_KILOS_BONIFICACAO_FEV,'
      '        0 AS SQT_KILOS_BONIFICACAO_MAR,'
      '        0 AS SQT_KILOS_BONIFICACAO_ABR,'
      '        0 AS SQT_KILOS_BONIFICACAO_MAI,'
      '        0 AS SQT_KILOS_BONIFICACAO_JUN,'
      '        0 AS SQT_KILOS_BONIFICACAO_JUL,'
      '        0 AS SQT_KILOS_BONIFICACAO_AGO,'
      '        0 AS SQT_KILOS_BONIFICACAO_SET,'
      '        0 AS SQT_KILOS_BONIFICACAO_OUT,'
      '        0 AS SQT_KILOS_BONIFICACAO_NOV,'
      '        0 AS SQT_KILOS_BONIFICACAO_DEZ'
      '      FROM'
      '        TB_NOTA_CAB,'
      '        TB_NOTA_ITEM,'
      '        TB_PRODUTO,'
      '        TB_FILIAL,'
      '        TB_VENDEDOR,'
      '        TB_OPERACAO,'
      '        TB_CLASSE'
      '      WHERE'
      '        Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '        AND'
      '        Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '        AND'
      '        Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '        AND'
      '        Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '        AND'
      '        Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '        AND'
      '        Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '        AND'
      '        (:ind_vendas is null'
      '         or'
      '          Tb_operacao.ind_vendas = :ind_vendas)'
      '        AND'
      '        (:OPERACAO IS NULL'
      '         OR'
      '          TB_NOTA_CAB.COD_OPERACAO = :OPERACAO)'
      '        AND'
      '        TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '        AND'
      '        (:FILIAL IS NULL OR'
      '         :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '        AND'
      '        (:VENDEDOR IS NULL OR'
      '         :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '        AND'
      '        (:SUPERVISOR IS NULL OR'
      '         :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '        AND'
      '        (:COD_CADASTRO IS NULL OR'
      '         :COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO)'
      '        AND'
      '        (:COD_DEPARTAMENTO IS NULL OR'
      '         :COD_DEPARTAMENTO = TB_NOTA_CAB.COD_DEPARTAMENTO)'
      '        AND'
      '        (:COD_SERIE IS NULL OR'
      '         :COD_SERIE = TB_NOTA_CAB.COD_SERIE)'
      '        AND'
      '        (:VAL_TOTAL_INI IS NULL'
      '         OR'
      '          TB_NOTA_ITEM.VAL_TOTAL >= :VAL_TOTAL_INI)'
      '        AND'
      '        (:VAL_TOTAL_FIM IS NULL'
      '         OR'
      '          TB_NOTA_ITEM.VAL_TOTAL <= :VAL_TOTAL_FIM)'
      '        AND'
      '        (:ESTADO IS NULL'
      '         OR'
      '          TB_NOTA_CAB.COD_ESTADO = :ESTADO)'
      '        AND'
      '        TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '        AND'
      '        TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '      GROUP BY'
      '        Tb_vendedor.COD_VENDEDOR,'
      '        Tb_vendedor.NOME,'
      '        Tb_produto.COD_PRODUTO,'
      '        Tb_produto.DESC_PRODUTO,'
      '        Tb_Classe.Cod_Classe,'
      '        Tb_Classe.Desc_Classe,'
      '        tb_classe.num_classe,'
      '        TB_NOTA_CAB.DT_RECEBIMENTO'
      ''
      '  UNION ALL'
      ''
      '  /* *** DEVOLUCOES ****  */'
      '  SELECT'
      '        Tb_vendedor.COD_VENDEDOR,'
      '        Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '        Tb_produto.COD_PRODUTO,'
      '        Tb_produto.DESC_PRODUTO,'
      '        Tb_Classe.Cod_Classe,'
      '        Tb_Classe.Desc_Classe,'
      '        tb_classe.num_classe,'
      ''
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 01, SUM' +
        '((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_N' +
        'OTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + T' +
        'b_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0) AS S' +
        'VAL_TOTAL_JAN,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 02, SUM' +
        '((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_N' +
        'OTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + T' +
        'b_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0) AS S' +
        'VAL_TOTAL_FEV,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 03, SUM' +
        '((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_N' +
        'OTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + T' +
        'b_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0) AS S' +
        'VAL_TOTAL_MAR,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 04, SUM' +
        '((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_N' +
        'OTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + T' +
        'b_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0) AS S' +
        'VAL_TOTAL_ABR,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 05, SUM' +
        '((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_N' +
        'OTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + T' +
        'b_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0) AS S' +
        'VAL_TOTAL_MAI,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 06, SUM' +
        '((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_N' +
        'OTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + T' +
        'b_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0) AS S' +
        'VAL_TOTAL_JUN,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 07, SUM' +
        '((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_N' +
        'OTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + T' +
        'b_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0) AS S' +
        'VAL_TOTAL_JUL,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 08, SUM' +
        '((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_N' +
        'OTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + T' +
        'b_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0) AS S' +
        'VAL_TOTAL_AGO,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 09, SUM' +
        '((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_N' +
        'OTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + T' +
        'b_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0) AS S' +
        'VAL_TOTAL_SET,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 10, SUM' +
        '((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_N' +
        'OTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + T' +
        'b_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0) AS S' +
        'VAL_TOTAL_OUT,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 11, SUM' +
        '((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_N' +
        'OTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + T' +
        'b_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0) AS S' +
        'VAL_TOTAL_NOV,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 12, SUM' +
        '((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_N' +
        'OTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + T' +
        'b_nota_item.VAL_FRETE + TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1),0) AS S' +
        'VAL_TOTAL_DEZ,'
      ''
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 01, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE)*-1),0) AS SQT_QUANTIDADE_JAN,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 02, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE)*-1),0) AS SQT_QUANTIDADE_FEV,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 03, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE)*-1),0) AS SQT_QUANTIDADE_MAR,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 04, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE)*-1),0) AS SQT_QUANTIDADE_ABR,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 05, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE)*-1),0) AS SQT_QUANTIDADE_MAI,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 06, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE)*-1),0) AS SQT_QUANTIDADE_JUN,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 07, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE)*-1),0) AS SQT_QUANTIDADE_JUL,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 08, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE)*-1),0) AS SQT_QUANTIDADE_AGO,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 09, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE)*-1),0) AS SQT_QUANTIDADE_SET,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 10, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE)*-1),0) AS SQT_QUANTIDADE_OUT,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 11, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE)*-1),0) AS SQT_QUANTIDADE_NOV,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 12, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE)*-1),0) AS SQT_QUANTIDADE_DEZ,'
      ''
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 01, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1),0) AS' +
        ' SQT_KILOS_JAN,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 02, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1),0) AS' +
        ' SQT_KILOS_FEV,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 03, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1),0) AS' +
        ' SQT_KILOS_MAR,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 04, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1),0) AS' +
        ' SQT_KILOS_ABR,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 05, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1),0) AS' +
        ' SQT_KILOS_MAI,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 06, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1),0) AS' +
        ' SQT_KILOS_JUN,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 07, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1),0) AS' +
        ' SQT_KILOS_JUL,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 08, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1),0) AS' +
        ' SQT_KILOS_AGO,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 09, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1),0) AS' +
        ' SQT_KILOS_SET,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 10, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1),0) AS' +
        ' SQT_KILOS_OUT,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 11, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1),0) AS' +
        ' SQT_KILOS_NOV,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 12, SUM' +
        '((Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1),0) AS' +
        ' SQT_KILOS_DEZ,'
      ''
      '        0 AS SQT_KILOS_BONIFICACAO_JAN,'
      '        0 AS SQT_KILOS_BONIFICACAO_FEV,'
      '        0 AS SQT_KILOS_BONIFICACAO_MAR,'
      '        0 AS SQT_KILOS_BONIFICACAO_ABR,'
      '        0 AS SQT_KILOS_BONIFICACAO_MAI,'
      '        0 AS SQT_KILOS_BONIFICACAO_JUN,'
      '        0 AS SQT_KILOS_BONIFICACAO_JUL,'
      '        0 AS SQT_KILOS_BONIFICACAO_AGO,'
      '        0 AS SQT_KILOS_BONIFICACAO_SET,'
      '        0 AS SQT_KILOS_BONIFICACAO_OUT,'
      '        0 AS SQT_KILOS_BONIFICACAO_NOV,'
      '        0 AS SQT_KILOS_BONIFICACAO_DEZ'
      '      FROM'
      '        TB_NOTA_CAB,'
      '        TB_NOTA_ITEM,'
      '        TB_PRODUTO,'
      '        TB_FILIAL,'
      '        TB_VENDEDOR,'
      '        TB_OPERACAO,'
      '        TB_CLASSE'
      '      WHERE'
      '        Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '        AND'
      '        Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '        AND'
      '        Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '        AND'
      '        Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '        AND'
      '        Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '        AND'
      '        Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '        AND'
      '        (Tb_operacao.ind_vendas = '#39'D'#39')'
      '        AND'
      '        (:OPERACAO IS NULL'
      '         OR'
      '          TB_NOTA_CAB.COD_OPERACAO = :OPERACAO)'
      '        AND'
      '        TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '        AND'
      '        (:FILIAL IS NULL OR'
      '         :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '        AND'
      '        (:VENDEDOR IS NULL OR'
      '         :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '        AND'
      '        (:SUPERVISOR IS NULL OR'
      '         :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '        AND'
      '        (:COD_CADASTRO IS NULL OR'
      '         :COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO)'
      '        AND'
      '        (:COD_DEPARTAMENTO IS NULL OR'
      '         :COD_DEPARTAMENTO = TB_NOTA_CAB.COD_DEPARTAMENTO)'
      '        AND'
      '        (:COD_SERIE IS NULL OR'
      '         :COD_SERIE = TB_NOTA_CAB.COD_SERIE)'
      '        AND'
      '        (:VAL_TOTAL_INI IS NULL'
      '         OR'
      '          TB_NOTA_ITEM.VAL_TOTAL >= :VAL_TOTAL_INI)'
      '        AND'
      '        (:VAL_TOTAL_FIM IS NULL'
      '         OR'
      '          TB_NOTA_ITEM.VAL_TOTAL <= :VAL_TOTAL_FIM)'
      '        AND'
      '        (:ESTADO IS NULL'
      '         OR'
      '          TB_NOTA_CAB.COD_ESTADO = :ESTADO)'
      '        AND'
      '        TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '        AND'
      '        TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '      GROUP BY'
      '        Tb_vendedor.COD_VENDEDOR,'
      '        Tb_vendedor.NOME,'
      '        Tb_produto.COD_PRODUTO,'
      '        Tb_produto.DESC_PRODUTO,'
      '        Tb_Classe.Cod_Classe,'
      '        Tb_Classe.Desc_Classe,'
      '        tb_classe.num_classe,'
      '        TB_NOTA_CAB.DT_RECEBIMENTO'
      ''
      '  UNION ALL'
      ''
      '  /* *** BONIFICA'#199#213'ES ****  */'
      ''
      '  SELECT'
      '        Tb_vendedor.COD_VENDEDOR,'
      '        Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '        Tb_produto.COD_PRODUTO,'
      '        Tb_produto.DESC_PRODUTO,'
      '        Tb_Classe.Cod_Classe,'
      '        Tb_Classe.Desc_Classe,'
      '        tb_classe.num_classe,'
      ''
      '        0 AS SVAL_TOTAL_JAN,'
      '        0 AS SVAL_TOTAL_FEV,'
      '        0 AS SVAL_TOTAL_MAR,'
      '        0 AS SVAL_TOTAL_ABR,'
      '        0 AS SVAL_TOTAL_MAI,'
      '        0 AS SVAL_TOTAL_JUN,'
      '        0 AS SVAL_TOTAL_JUL,'
      '        0 AS SVAL_TOTAL_AGO,'
      '        0 AS SVAL_TOTAL_SET,'
      '        0 AS SVAL_TOTAL_OUT,'
      '        0 AS SVAL_TOTAL_NOV,'
      '        0 AS SVAL_TOTAL_DEZ,'
      ''
      '        0 AS SQT_QUANTIDADE_JAN,'
      '        0 AS SQT_QUANTIDADE_FEV,'
      '        0 AS SQT_QUANTIDADE_MAR,'
      '        0 AS SQT_QUANTIDADE_ABR,'
      '        0 AS SQT_QUANTIDADE_MAI,'
      '        0 AS SQT_QUANTIDADE_JUN,'
      '        0 AS SQT_QUANTIDADE_JUL,'
      '        0 AS SQT_QUANTIDADE_AGO,'
      '        0 AS SQT_QUANTIDADE_SET,'
      '        0 AS SQT_QUANTIDADE_OUT,'
      '        0 AS SQT_QUANTIDADE_NOV,'
      '        0 AS SQT_QUANTIDADE_DEZ,'
      ''
      '        0 AS SQT_KILOS_JAN,'
      '        0 AS SQT_KILOS_FEV,'
      '        0 AS SQT_KILOS_MAR,'
      '        0 AS SQT_KILOS_ABR,'
      '        0 AS SQT_KILOS_MAI,'
      '        0 AS SQT_KILOS_JUN,'
      '        0 AS SQT_KILOS_JUL,'
      '        0 AS SQT_KILOS_AGO,'
      '        0 AS SQT_KILOS_SET,'
      '        0 AS SQT_KILOS_OUT,'
      '        0 AS SQT_KILOS_NOV,'
      '        0 AS SQT_KILOS_DEZ,'
      ''
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 01, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_BONIFICACAO_JAN,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 02, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_BONIFICACAO_FEV,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 03, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_BONIFICACAO_MAR,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 04, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_BONIFICACAO_ABR,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 05, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_BONIFICACAO_MAI,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 06, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_BONIFICACAO_JUN,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 07, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_BONIFICACAO_JUL,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 08, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_BONIFICACAO_AGO,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 09, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_BONIFICACAO_SET,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 10, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_BONIFICACAO_OUT,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 11, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_BONIFICACAO_NOV,'
      
        '        DECODE(TO_CHAR(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'MM'#39'), 12, SUM' +
        '(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM),0) AS SQT_' +
        'KILOS_BONIFICACAO_DEZ'
      '      FROM'
      '        TB_NOTA_CAB,'
      '        TB_NOTA_ITEM,'
      '        TB_PRODUTO,'
      '        TB_FILIAL,'
      '        TB_VENDEDOR,'
      '        TB_OPERACAO,'
      '        TB_CLASSE'
      '      WHERE'
      '        Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '        AND'
      '        Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '        AND'
      '        Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '        AND'
      '        Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '        AND'
      '        Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '        AND'
      '        Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '        AND'
      '        (Tb_operacao.ind_bonificacao = '#39'S'#39')'
      '        AND'
      '        (:OPERACAO IS NULL'
      '         OR'
      '          TB_NOTA_CAB.COD_OPERACAO = :OPERACAO)'
      '        AND'
      '        TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '        AND'
      '        (:FILIAL IS NULL OR'
      '         :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '        AND'
      '        (:VENDEDOR IS NULL OR'
      '         :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)'
      '        AND'
      '        (:SUPERVISOR IS NULL OR'
      '         :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '        AND'
      '        (:COD_CADASTRO IS NULL OR'
      '         :COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO)'
      '        AND'
      '        (:COD_DEPARTAMENTO IS NULL OR'
      '         :COD_DEPARTAMENTO = TB_NOTA_CAB.COD_DEPARTAMENTO)'
      '        AND'
      '        (:COD_SERIE IS NULL OR'
      '         :COD_SERIE = TB_NOTA_CAB.COD_SERIE)'
      '        AND'
      '        (:VAL_TOTAL_INI IS NULL'
      '         OR'
      '          TB_NOTA_ITEM.VAL_TOTAL >= :VAL_TOTAL_INI)'
      '        AND'
      '        (:VAL_TOTAL_FIM IS NULL'
      '         OR'
      '          TB_NOTA_ITEM.VAL_TOTAL <= :VAL_TOTAL_FIM)'
      '        AND'
      '        (:ESTADO IS NULL'
      '         OR'
      '          TB_NOTA_CAB.COD_ESTADO = :ESTADO)'
      '        AND'
      '        TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '        AND'
      '        TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '      GROUP BY'
      '        Tb_vendedor.COD_VENDEDOR,'
      '        Tb_vendedor.NOME,'
      '        Tb_produto.COD_PRODUTO,'
      '        Tb_produto.DESC_PRODUTO,'
      '        Tb_Classe.Cod_Classe,'
      '        Tb_Classe.Desc_Classe,'
      '        tb_classe.num_classe,'
      '        TB_NOTA_CAB.DT_RECEBIMENTO'
      ')'
      ' GROUP BY'
      '   COD_VENDEDOR,'
      '   NOME_VENDEDOR,'
      '   COD_PRODUTO,'
      '   DESC_PRODUTO,'
      '   COD_CLASSE,'
      '   DESC_CLASSE,'
      '   num_classe'
      ' ORDER BY'
      '   COD_VENDEDOR,'
      '   COD_CLASSE'
      ''
      '')
    Variables.Data = {
      030000000D0000000B0000003A494E445F56454E444153050000000000000000
      000000090000003A4F5045524143414F03000000000000000000000007000000
      3A46494C49414C030000000000000000000000090000003A56454E4445444F52
      0300000000000000000000000B0000003A53555045525649534F520300000000
      000000000000000D0000003A434F445F434144415354524F0300000000000000
      00000000110000003A434F445F444550415254414D454E544F03000000000000
      00000000000A0000003A434F445F53455249450500000000000000000000000E
      0000003A56414C5F544F54414C5F494E490400000000000000000000000E0000
      003A56414C5F544F54414C5F46494D040000000000000000000000070000003A
      45535441444F050000000000000000000000070000003A444154415F490C0000
      000000000000000000070000003A444154415F460C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000370000000C000000434F445F56454E4445444F520100000000000D00
      00004E4F4D455F56454E4445444F520100000000000B000000434F445F50524F
      4455544F0100000000000C000000444553435F50524F4455544F010000000000
      0A000000434F445F434C415353450100000000000B000000444553435F434C41
      5353450100000000000A0000004E554D5F434C415353450100000000000E0000
      005356414C5F544F54414C5F4A414E0100000000000E0000005356414C5F544F
      54414C5F4645560100000000000E0000005356414C5F544F54414C5F4D415201
      00000000000E0000005356414C5F544F54414C5F4142520100000000000E0000
      005356414C5F544F54414C5F4D41490100000000000E0000005356414C5F544F
      54414C5F4A554E0100000000000E0000005356414C5F544F54414C5F4A554C01
      00000000000E0000005356414C5F544F54414C5F41474F0100000000000E0000
      005356414C5F544F54414C5F5345540100000000000E0000005356414C5F544F
      54414C5F4F55540100000000000E0000005356414C5F544F54414C5F4E4F5601
      00000000000E0000005356414C5F544F54414C5F44455A010000000000120000
      005351545F5155414E5449444144455F4A414E01000000000012000000535154
      5F5155414E5449444144455F464556010000000000120000005351545F515541
      4E5449444144455F4D4152010000000000120000005351545F5155414E544944
      4144455F414252010000000000120000005351545F5155414E5449444144455F
      4D4149010000000000120000005351545F5155414E5449444144455F4A554E01
      0000000000120000005351545F5155414E5449444144455F4A554C0100000000
      00120000005351545F5155414E5449444144455F41474F010000000000120000
      005351545F5155414E5449444144455F53455401000000000012000000535154
      5F5155414E5449444144455F4F5554010000000000120000005351545F515541
      4E5449444144455F4E4F56010000000000120000005351545F5155414E544944
      4144455F44455A0100000000000D0000005351545F4B494C4F535F4A414E0100
      000000000D0000005351545F4B494C4F535F4645560100000000000D00000053
      51545F4B494C4F535F4D41520100000000000D0000005351545F4B494C4F535F
      4142520100000000000D0000005351545F4B494C4F535F4D4149010000000000
      0D0000005351545F4B494C4F535F4A554E0100000000000D0000005351545F4B
      494C4F535F4A554C0100000000000D0000005351545F4B494C4F535F41474F01
      00000000000D0000005351545F4B494C4F535F5345540100000000000D000000
      5351545F4B494C4F535F4F55540100000000000D0000005351545F4B494C4F53
      5F4E4F560100000000000D0000005351545F4B494C4F535F44455A0100000000
      00190000005351545F4B494C4F535F424F4E494649434143414F5F4A414E0100
      00000000190000005351545F4B494C4F535F424F4E494649434143414F5F4645
      56010000000000190000005351545F4B494C4F535F424F4E494649434143414F
      5F4D4152010000000000190000005351545F4B494C4F535F424F4E4946494341
      43414F5F414252010000000000190000005351545F4B494C4F535F424F4E4946
      49434143414F5F4D4149010000000000190000005351545F4B494C4F535F424F
      4E494649434143414F5F4A554E010000000000190000005351545F4B494C4F53
      5F424F4E494649434143414F5F4A554C010000000000190000005351545F4B49
      4C4F535F424F4E494649434143414F5F41474F01000000000019000000535154
      5F4B494C4F535F424F4E494649434143414F5F53455401000000000019000000
      5351545F4B494C4F535F424F4E494649434143414F5F4F555401000000000019
      0000005351545F4B494C4F535F424F4E494649434143414F5F4E4F5601000000
      0000190000005351545F4B494C4F535F424F4E494649434143414F5F44455A01
      0000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRVendedorCMedioMesCalcFields
    Left = 376
    Top = 472
    object QRVendedorCMedioMesCOD_VENDEDOR: TFloatField
      FieldName = 'COD_VENDEDOR'
    end
    object QRVendedorCMedioMesNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 40
    end
    object QRVendedorCMedioMesCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRVendedorCMedioMesDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRVendedorCMedioMesCOD_CLASSE: TFloatField
      FieldName = 'COD_CLASSE'
    end
    object QRVendedorCMedioMesDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QRVendedorCMedioMesNUM_CLASSE: TFloatField
      FieldName = 'NUM_CLASSE'
    end
    object QRVendedorCMedioMesSVAL_TOTAL_JAN: TFloatField
      FieldName = 'SVAL_TOTAL_JAN'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSVAL_TOTAL_FEV: TFloatField
      FieldName = 'SVAL_TOTAL_FEV'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSVAL_TOTAL_MAR: TFloatField
      FieldName = 'SVAL_TOTAL_MAR'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSVAL_TOTAL_ABR: TFloatField
      FieldName = 'SVAL_TOTAL_ABR'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSVAL_TOTAL_MAI: TFloatField
      FieldName = 'SVAL_TOTAL_MAI'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSVAL_TOTAL_JUN: TFloatField
      FieldName = 'SVAL_TOTAL_JUN'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSVAL_TOTAL_JUL: TFloatField
      FieldName = 'SVAL_TOTAL_JUL'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSVAL_TOTAL_AGO: TFloatField
      FieldName = 'SVAL_TOTAL_AGO'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSVAL_TOTAL_SET: TFloatField
      FieldName = 'SVAL_TOTAL_SET'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSVAL_TOTAL_OUT: TFloatField
      FieldName = 'SVAL_TOTAL_OUT'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSVAL_TOTAL_NOV: TFloatField
      FieldName = 'SVAL_TOTAL_NOV'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSVAL_TOTAL_DEZ: TFloatField
      FieldName = 'SVAL_TOTAL_DEZ'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_QUANTIDADE_JAN: TFloatField
      FieldName = 'SQT_QUANTIDADE_JAN'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_QUANTIDADE_FEV: TFloatField
      FieldName = 'SQT_QUANTIDADE_FEV'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_QUANTIDADE_MAR: TFloatField
      FieldName = 'SQT_QUANTIDADE_MAR'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_QUANTIDADE_ABR: TFloatField
      FieldName = 'SQT_QUANTIDADE_ABR'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_QUANTIDADE_MAI: TFloatField
      FieldName = 'SQT_QUANTIDADE_MAI'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_QUANTIDADE_JUN: TFloatField
      FieldName = 'SQT_QUANTIDADE_JUN'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_QUANTIDADE_JUL: TFloatField
      FieldName = 'SQT_QUANTIDADE_JUL'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_QUANTIDADE_AGO: TFloatField
      FieldName = 'SQT_QUANTIDADE_AGO'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_QUANTIDADE_SET: TFloatField
      FieldName = 'SQT_QUANTIDADE_SET'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_QUANTIDADE_OUT: TFloatField
      FieldName = 'SQT_QUANTIDADE_OUT'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_QUANTIDADE_NOV: TFloatField
      FieldName = 'SQT_QUANTIDADE_NOV'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_QUANTIDADE_DEZ: TFloatField
      FieldName = 'SQT_QUANTIDADE_DEZ'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_JAN: TFloatField
      FieldName = 'SQT_KILOS_JAN'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_FEV: TFloatField
      FieldName = 'SQT_KILOS_FEV'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_MAR: TFloatField
      FieldName = 'SQT_KILOS_MAR'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_ABR: TFloatField
      FieldName = 'SQT_KILOS_ABR'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_MAI: TFloatField
      FieldName = 'SQT_KILOS_MAI'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_JUN: TFloatField
      FieldName = 'SQT_KILOS_JUN'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_JUL: TFloatField
      FieldName = 'SQT_KILOS_JUL'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_AGO: TFloatField
      FieldName = 'SQT_KILOS_AGO'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_SET: TFloatField
      FieldName = 'SQT_KILOS_SET'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_OUT: TFloatField
      FieldName = 'SQT_KILOS_OUT'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_NOV: TFloatField
      FieldName = 'SQT_KILOS_NOV'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_DEZ: TFloatField
      FieldName = 'SQT_KILOS_DEZ'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_JAN: TFloatField
      FieldName = 'SQT_KILOS_BONIFICACAO_JAN'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_FEV: TFloatField
      FieldName = 'SQT_KILOS_BONIFICACAO_FEV'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_MAR: TFloatField
      FieldName = 'SQT_KILOS_BONIFICACAO_MAR'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_ABR: TFloatField
      FieldName = 'SQT_KILOS_BONIFICACAO_ABR'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_MAI: TFloatField
      FieldName = 'SQT_KILOS_BONIFICACAO_MAI'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_JUN: TFloatField
      FieldName = 'SQT_KILOS_BONIFICACAO_JUN'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_JUL: TFloatField
      FieldName = 'SQT_KILOS_BONIFICACAO_JUL'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_AGO: TFloatField
      FieldName = 'SQT_KILOS_BONIFICACAO_AGO'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_SET: TFloatField
      FieldName = 'SQT_KILOS_BONIFICACAO_SET'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_OUT: TFloatField
      FieldName = 'SQT_KILOS_BONIFICACAO_OUT'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_NOV: TFloatField
      FieldName = 'SQT_KILOS_BONIFICACAO_NOV'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_DEZ: TFloatField
      FieldName = 'SQT_KILOS_BONIFICACAO_DEZ'
      DisplayFormat = '#,##0.00'
    end
    object QRVendedorCMedioMessPreco_Medio_jan: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_jan'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_fev: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_fev'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_mar: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_mar'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_abr: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_abr'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_mai: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_mai'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_jun: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_jun'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_jul: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_jul'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_ago: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_ago'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_set: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_set'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_out: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_out'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_nov: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_nov'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_dez: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_dez'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_KG_jan: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_KG_jan'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_KG_fev: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_KG_fev'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_KG_mar: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_KG_mar'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_KG_abr: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_KG_abr'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_KG_mai: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_KG_mai'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_KG_jun: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_KG_jun'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_KG_jul: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_KG_jul'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_KG_ago: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_KG_ago'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_KG_set: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_KG_set'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_KG_out: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_KG_out'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_KG_nov: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_KG_nov'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QRVendedorCMedioMessPreco_Medio_KG_dez: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sPreco_Medio_KG_dez'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
  end
  object QRMapaVenda2: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  DESC_CLASSE,'
      '  TO_CHAR(DT_EMISSAO,'#39'DD/MM'#39') AS DIA,'
      '  COD_FILIAL + 0.00 AS COD_FILIAL,'
      '  DESC_FILIAL,'
      '  SUM(SQT_QUANTIDADE) AS SQT_QUANTIDADE,'
      '  SUM(SVAL_TOTAL) AS SVAL_TOTAL,'
      '  SUM(VAL_CUSTO) AS VAL_CUSTO'
      'FROM'
      '('
      '  SELECT'
      '    TB_CLASSE.DESC_CLASSE,'
      '    TB_NOTA_CAB.DT_EMISSAO,'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      
        '    SUM(Tb_nota_item.QT_QUANTIDADE * TB_PRODUTO.NUM_EMBALAGEM ) ' +
        'AS SQT_QUANTIDADE,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.' +
        'COD_NOTA_ITEM) +Tb_nota_item.VAL_DESPESAS+Tb_nota_item.VAL_FRETE' +
        '+TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SVAL_TOTAL,'
      
        '    SUM(Tb_nota_item.VAL_CUSTO*Tb_nota_item.QT_QUANTIDADE) AS VA' +
        'L_CUSTO'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_PRODUTO,'
      '    TB_FILIAL,'
      '    TB_LOTE_TIPO,'
      '    TB_CLASSE'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL'
      '    AND'
      '    TB_NOTA_ITEM.COD_LOTE_TIPO = TB_LOTE_TIPO.COD_LOTE_TIPO'
      '    AND'
      '    TB_CLASSE.COD_CLASSE = TB_PRODUTO.COD_CLASSE'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '    AND'
      '    (:OPERACAO IS NULL OR'
      '      TB_OPERACAO.IND_VENDAS = :OPERACAO)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '    AND'
      '    :VENDEDOR'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR_PREPOSTO)'
      '    AND'
      '    :COD_OPERACAO'
      '    AND'
      '    (:TIPO_PAGTO IS NULL OR'
      '      TB_NOTA_CAB.IND_CONDICAO_PAGTO = :TIPO_PAGTO)'
      '    AND'
      '    (:COD_PRODUTO)'
      '    AND'
      '    (:FORNECEDOR IS NULL OR'
      '      TB_PRODUTO.COD_CADASTRO = :FORNECEDOR)'
      '    AND'
      '    (:IND_TIPO_PRODUCAO IS NULL'
      '     OR'
      '      TB_LOTE_TIPO.IND_TIPO_PRODUCAO = :IND_TIPO_PRODUCAO)'
      '    AND'
      '    (:COD_CULTURA IS NULL OR'
      '      TB_NOTA_ITEM.COD_CULTURA = :COD_CULTURA)'
      '    AND'
      '    (:COD_CADASTRO IS NULL OR'
      '      TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO)'
      '    AND'
      '    (:COD_SERIE IS NULL OR'
      '      TB_NOTA_CAB.COD_SERIE = :COD_SERIE)'
      '    AND'
      '    (:ESTADO IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_ESTADO = :ESTADO)'
      '    AND'
      '    (:CLASSE IS NULL OR TB_CLASSE.NUM_CLASSE = :CLASSE)'
      '    AND'
      '    (:SUBCLASSE IS NULL OR TB_CLASSE.NUM_SUBCLASSE = :SUBCLASSE)'
      '  GROUP BY'
      '    TB_NOTA_CAB.DT_EMISSAO,'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    TB_CLASSE.DESC_CLASSE'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    TB_CLASSE.DESC_CLASSE,'
      '    TB_NOTA_CAB.DT_EMISSAO,'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      
        '    SUM(Tb_nota_item.QT_QUANTIDADE * TB_PRODUTO.NUM_EMBALAGEM * ' +
        '-1) AS SQT_QUANTIDADE,'
      
        '    SUM((Tb_nota_item.VAL_TOTAL- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) +Tb_nota_item.VAL_DESPESAS+Tb_nota_item.VAL_FRET' +
        'E+TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1) AS SVAL_TOTAL,'
      '    SUM((Tb_nota_item.VAL_CUSTO)*-1) AS VAL_CUSTO'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_PRODUTO,'
      '    TB_FILIAL,'
      '    TB_LOTE_TIPO,'
      '    TB_CLASSE'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS = '#39'D'#39
      '    AND'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL'
      '    AND'
      '    TB_NOTA_ITEM.COD_LOTE_TIPO = TB_LOTE_TIPO.COD_LOTE_TIPO'
      '    AND'
      '    TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '    AND'
      '    :VENDEDOR'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO = :VENDEDOR_PREPOSTO)'
      '    AND'
      '    :COD_OPERACAO'
      '    AND'
      '    (:COD_PRODUTO)'
      '    AND'
      '    (:FORNECEDOR IS NULL OR'
      '      TB_PRODUTO.COD_CADASTRO = :FORNECEDOR)'
      '    AND'
      '    (:IND_TIPO_PRODUCAO IS NULL'
      '     OR'
      '      TB_LOTE_TIPO.IND_TIPO_PRODUCAO = :IND_TIPO_PRODUCAO)'
      '    AND'
      '    (:COD_CULTURA IS NULL OR'
      '      TB_NOTA_ITEM.COD_CULTURA = :COD_CULTURA)'
      '    AND'
      '    (:COD_CADASTRO IS NULL OR'
      '      TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO)'
      '    AND'
      '    (:COD_SERIE IS NULL OR'
      '      TB_NOTA_CAB.COD_SERIE = :COD_SERIE)'
      '    AND'
      '    (:ESTADO IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_ESTADO = :ESTADO)'
      '    AND'
      '    (:CLASSE IS NULL OR TB_CLASSE.NUM_CLASSE = :CLASSE)'
      '    AND'
      '    (:SUBCLASSE IS NULL OR TB_CLASSE.NUM_SUBCLASSE = :SUBCLASSE)'
      '  GROUP BY'
      '    TB_NOTA_CAB.DT_EMISSAO,'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    TB_CLASSE.DESC_CLASSE'
      ')'
      'GROUP BY'
      '  TO_CHAR(DT_EMISSAO,'#39'DD/MM'#39'),'
      '  COD_FILIAL,'
      '  DESC_FILIAL,'
      '  DESC_CLASSE'
      'ORDER BY'
      '  TO_CHAR(DT_EMISSAO,'#39'DD/MM'#39'),'
      '  DESC_CLASSE'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Variables.Data = {
      0300000011000000090000003A4F5045524143414F0500000000000000000000
      00070000003A444154415F490C0000000000000000000000070000003A444154
      415F460C0000000000000000000000070000003A46494C49414C030000000000
      000000000000090000003A56454E4445444F520100000004000000313D310000
      0000000D0000003A434F445F4F5045524143414F010000000000000000000000
      0B0000003A5449504F5F504147544F0500000000000000000000000C0000003A
      434F445F50524F4455544F010000000000000000000000120000003A56454E44
      45444F525F505245504F53544F0300000000000000000000000B0000003A464F
      524E454345444F52030000000000000000000000120000003A494E445F544950
      4F5F50524F445543414F0500000000000000000000000C0000003A434F445F43
      554C545552410300000000000000000000000D0000003A434F445F4341444153
      54524F0300000000000000000000000A0000003A434F445F5345524945050000
      000000000000000000070000003A45535441444F050000000000000000000000
      070000003A434C415353450300000000000000000000000A0000003A53554243
      4C41535345030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000007000000030000004449410100000000000A000000434F445F46494C
      49414C0100000000000B000000444553435F46494C49414C0100000000000E00
      00005351545F5155414E5449444144450100000000000A0000005356414C5F54
      4F54414C0100000000000900000056414C5F435553544F0100000000000B0000
      00444553435F434C41535345010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 144
    Top = 482
    object QRMapaVenda2DIA: TStringField
      FieldName = 'DIA'
      Size = 5
    end
    object QRMapaVenda2COD_FILIAL: TFloatField
      FieldName = 'COD_FILIAL'
    end
    object QRMapaVenda2DESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRMapaVenda2SQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
      DisplayFormat = '###,###,##0.00'
    end
    object QRMapaVenda2SVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object QRMapaVenda2VAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
    end
    object QRMapaVenda2sval_custo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sval_custo'
      Calculated = True
    end
    object QRMapaVenda2DESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
  end
  object QRMapaVendaRes2: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_FILIAL + 0.00 AS COD_FILIAL,'
      '  DESC_FILIAL,'
      '  DESC_CLASSE,'
      '  SUM(SQT_QUANTIDADE) AS SQT_QUANTIDADE,'
      '  SUM(SVAL_TOTAL) AS SVAL_TOTAL,'
      '  SUM(VAL_CUSTO) AS VAL_CUSTO'
      'FROM'
      '('
      '  SELECT'
      '    TB_CLASSE.DESC_CLASSE,'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      
        '    SUM(Tb_nota_item.QT_QUANTIDADE * TB_PRODUTO.NUM_EMBALAGEM) A' +
        'S SQT_QUANTIDADE,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_F' +
        'RETE + Tb_nota_item.VAL_IPI) AS SVAL_TOTAL,'
      
        '    SUM(Tb_nota_item.VAL_CUSTO*Tb_nota_item.QT_QUANTIDADE) AS VA' +
        'L_CUSTO'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_PRODUTO,'
      '    TB_FILIAL,'
      '    TB_LOTE_TIPO,'
      '    TB_CLASSE'
      '  WHERE'
      '    TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '    AND'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL'
      '    AND'
      '    TB_NOTA_ITEM.COD_LOTE_TIPO = TB_LOTE_TIPO.COD_LOTE_TIPO'
      '    AND'
      '    TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '    AND'
      '    (:OPERACAO IS NULL OR'
      '     TB_OPERACAO.IND_VENDAS = :OPERACAO)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '    AND'
      '    :VENDEDOR'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:COD_PRODUTO)'
      '    AND'
      '    :COD_OPERACAO'
      '    AND'
      '    (:TIPO_PAGTO IS NULL OR'
      '      TB_NOTA_CAB.IND_CONDICAO_PAGTO = :TIPO_PAGTO)'
      '    AND'
      '    (:FORNECEDOR IS NULL OR'
      '      TB_PRODUTO.COD_CADASTRO = :FORNECEDOR)'
      '    AND'
      '    (:IND_TIPO_PRODUCAO IS NULL'
      '     OR'
      '     TB_LOTE_TIPO.IND_TIPO_PRODUCAO = :IND_TIPO_PRODUCAO)'
      '    AND'
      '    (:COD_CULTURA IS NULL OR'
      '      TB_NOTA_ITEM.COD_CULTURA = :COD_CULTURA)'
      '    AND'
      '    (:COD_CADASTRO IS NULL OR'
      '      TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO)'
      '    AND'
      '    (:ESTADO IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_ESTADO = :ESTADO)'
      '    AND'
      '    (:CLASSE IS NULL OR TB_CLASSE.NUM_CLASSE = :CLASSE)'
      '    AND'
      '    (:SUBCLASSE IS NULL OR TB_CLASSE.NUM_SUBCLASSE = :SUBCLASSE)'
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    TB_CLASSE.DESC_CLASSE'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    TB_CLASSE.DESC_CLASSE,'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      
        '    SUM(Tb_nota_item.QT_QUANTIDADE * TB_PRODUTO.NUM_EMBALAGEM * ' +
        '-1) AS SQT_QUANTIDADE,'
      
        '    SUM((Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITE' +
        'M.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_' +
        'FRETE + Tb_nota_item.VAL_IPI)*-1) AS SVAL_TOTAL,'
      '    SUM((Tb_nota_item.VAL_CUSTO)*-1) AS VAL_CUSTO'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_PRODUTO,'
      '    TB_FILIAL,'
      '    TB_LOTE_TIPO,'
      '    TB_CLASSE'
      '  WHERE'
      '    (TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO)'
      '    AND'
      '    (TB_OPERACAO.IND_VENDAS = '#39'D'#39')'
      '    AND'
      '    (TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39')'
      '    AND'
      '    (TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39')'
      '    AND'
      '    (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)'
      '    AND'
      '    (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO)'
      '    AND'
      '    (Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL)'
      '    AND'
      '    (TB_NOTA_ITEM.COD_LOTE_TIPO = TB_LOTE_TIPO.COD_LOTE_TIPO)'
      '    AND'
      '    TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '    AND'
      '    (TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I)'
      '    AND'
      '    (TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F)'
      '    AND'
      '    (:FILIAL IS NULL OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '    AND'
      '    :VENDEDOR'
      '    AND'
      '    (:VENDEDOR_PREPOSTO IS NULL OR'
      '      TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR_PREPOSTO)'
      '    AND'
      '    (:COD_PRODUTO)'
      '    AND'
      '    :COD_OPERACAO'
      '    AND'
      '    (:FORNECEDOR IS NULL OR'
      '      TB_PRODUTO.COD_CADASTRO = :FORNECEDOR)'
      '    AND'
      '    (:IND_TIPO_PRODUCAO IS NULL'
      '     OR'
      '     TB_LOTE_TIPO.IND_TIPO_PRODUCAO = :IND_TIPO_PRODUCAO)'
      '    AND'
      '    (:COD_CULTURA IS NULL OR'
      '      TB_NOTA_ITEM.COD_CULTURA = :COD_CULTURA)'
      '    AND'
      '    (:COD_CADASTRO IS NULL OR'
      '      TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO)'
      '    AND'
      '    (:ESTADO IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_ESTADO = :ESTADO)'
      '    AND'
      '    (:CLASSE IS NULL OR TB_CLASSE.NUM_CLASSE = :CLASSE)'
      '    AND'
      '    (:SUBCLASSE IS NULL OR TB_CLASSE.NUM_SUBCLASSE = :SUBCLASSE)'
      '  GROUP BY'
      '    Tb_filial.COD_FILIAL,'
      '    Tb_filial.DESC_FILIAL,'
      '    TB_CLASSE.DESC_CLASSE'
      ')'
      'GROUP BY'
      '  COD_FILIAL,'
      '  DESC_FILIAL,'
      '  DESC_CLASSE'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Variables.Data = {
      0300000010000000090000003A4F5045524143414F0500000000000000000000
      00070000003A444154415F490C0000000000000000000000070000003A444154
      415F460C0000000000000000000000070000003A46494C49414C030000000000
      000000000000090000003A56454E4445444F520100000004000000313D310000
      0000000D0000003A434F445F4F5045524143414F010000000000000000000000
      0B0000003A5449504F5F504147544F0500000000000000000000000C0000003A
      434F445F50524F4455544F010000000000000000000000120000003A56454E44
      45444F525F505245504F53544F0300000000000000000000000B0000003A464F
      524E454345444F52030000000000000000000000120000003A494E445F544950
      4F5F50524F445543414F0500000000000000000000000C0000003A434F445F43
      554C545552410300000000000000000000000D0000003A434F445F4341444153
      54524F030000000000000000000000070000003A45535441444F050000000000
      000000000000070000003A434C415353450300000000000000000000000A0000
      003A535542434C41535345030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000A000000434F445F46494C49414C0100000000000B000000
      444553435F46494C49414C0100000000000E0000005351545F5155414E544944
      4144450100000000000A0000005356414C5F544F54414C010000000000090000
      0056414C5F435553544F0100000000000B000000444553435F434C4153534501
      0000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 144
    Top = 528
    object QRMapaVendaRes2COD_FILIAL: TFloatField
      FieldName = 'COD_FILIAL'
    end
    object QRMapaVendaRes2DESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRMapaVendaRes2SQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
      DisplayFormat = '###,###,##0.00'
    end
    object QRMapaVendaRes2SVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object QRMapaVendaRes2VAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
    end
    object QRMapaVendaRes2sval_custo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sval_custo'
      Calculated = True
    end
    object QRMapaVendaRes2DESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
  end
  object QRProdutoCultura: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_CADASTRO + 0.00 AS COD_CADASTRO,'
      '  NOME,'
      '  COD_CULTURA + 0.00 AS COD_CULTURA,'
      '  DESC_CULTURA,'
      '  COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  DESC_CLASSE,'
      '  SUM(QT_COMPRA - (QT_VENDA + QT_SREMESSA)) AS QUANTIDADE,'
      '  SUM((VAL_VENDA + VAL_SREMESSA) - VAL_COMPRA) AS VAL_TOTAL'
      'FROM'
      '  ('
      '    SELECT'
      '      TB_NOTA_CAB.COD_CADASTRO,'
      '      TB_CADASTRO.NOME,'
      '      TB_NOTA_ITEM.COD_CULTURA,'
      '      TB_CULTURA.DESC_CULTURA,'
      '      TB_NOTA_ITEM.COD_PRODUTO,'
      '      TB_PRODUTO.DESC_PRODUTO,'
      '      TB_CLASSE.DESC_CLASSE,'
      
        '      SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',TB_NOTA_ITEM.QT_QUAN' +
        'TIDADE,TB_NOTA_ITEM.QT_QUANTIDADE * -1)) AS QT_VENDA,'
      
        '      SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',TB_NOTA_ITEM.VAL_TOT' +
        'AL - (Tb_nota_item.VAL_DESCONTO * Tb_nota_item.QT_QUANTIDADE),((' +
        'TB_NOTA_ITEM.VAL_TOTAL - (TB_NOTA_ITEM.VAL_DESCONTO * TB_NOTA_IT' +
        'EM.QT_QUANTIDADE)) * -1))) AS VAL_VENDA,'
      '      0 AS QT_COMPRA,'
      '      0 AS VAL_COMPRA,'
      '      0 AS QT_SREMESSA,'
      '      0 AS VAL_SREMESSA'
      '    FROM'
      '      TB_NOTA_CAB,'
      '      TB_NOTA_ITEM,'
      '      TB_CADASTRO,'
      '      TB_OPERACAO,'
      '      TB_CULTURA,'
      '      TB_PRODUTO,'
      '      TB_CLASSE'
      '    WHERE'
      '      TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '      AND'
      '      TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '      AND'
      '      TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '      AND'
      '      TB_NOTA_ITEM.COD_CULTURA = TB_CULTURA.COD_CULTURA'
      '      AND'
      '      TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '      AND'
      '      TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '      AND'
      '      TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '      AND'
      '      ((TB_OPERACAO.IND_VENDAS = '#39'V'#39')'
      '       or'
      '       (TB_OPERACAO.IND_VENDAS = '#39'D'#39'))'
      '      AND'
      '      (TB_OPERACAO.IND_FUTURA_CLIENTE <> '#39'D'#39')'
      '      AND'
      '      (TB_OPERACAO.IND_FUTURA_CLIENTE <> '#39'V'#39')'
      '      AND'
      '      (:MARCA IS NULL'
      '       OR'
      '        TB_PRODUTO.COD_MARCA =:MARCA)'
      '      AND'
      '      (:FILIAL IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_FILIAL =:FILIAL)'
      '      AND'
      '      (:CADASTRO IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_CADASTRO =:CADASTRO)'
      '      AND'
      '      (:VENDEDOR IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_VENDEDOR =:VENDEDOR)'
      '      AND'
      '      (:FORNECEDOR IS NULL'
      '       OR'
      '        TB_PRODUTO.COD_CADASTRO =:FORNECEDOR)'
      '      AND'
      '      (:CULTURA IS NULL'
      '       OR'
      '        TB_NOTA_ITEM.COD_CULTURA =:CULTURA)'
      '      AND'
      '      (:PRODUTO IS NULL'
      '       OR'
      '        TB_NOTA_ITEM.COD_PRODUTO =:PRODUTO)'
      '      AND'
      '      (:OPERACAO IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_OPERACAO =:OPERACAO)'
      '      AND'
      '      (:CLASSIFICACAO IS NULL'
      '       OR'
      '        TB_CADASTRO.COD_CLASS_CADASTRO =:CLASSIFICACAO)'
      '      AND'
      '      (:CLASSE IS NULL'
      '       OR'
      '        TB_CLASSE.NUM_CLASSE =:CLASSE)'
      '      AND'
      '      (:SUBCLASSE IS NULL'
      '       OR'
      '        TB_CLASSE.NUM_SUBCLASSE =:SUBCLASSE)'
      '      AND'
      '      (:TIPO_NOTA IS NULL'
      '       OR'
      '        TB_NOTA_CAB.IND_ENTRADA_SAIDA =:TIPO_NOTA)'
      '      AND'
      '      (:TIPO_PAGTO IS NULL'
      '       OR'
      '        TB_NOTA_CAB.IND_CONDICAO_PAGTO =:TIPO_PAGTO)'
      '      AND'
      '      TB_NOTA_CAB.DT_EMISSAO >=:DT_INICIAL'
      '      AND'
      '      TB_NOTA_CAB.DT_EMISSAO <=:DT_FINAL'
      '    GROUP BY'
      '      TB_NOTA_CAB.COD_CADASTRO,'
      '      TB_CADASTRO.NOME,'
      '      TB_NOTA_ITEM.COD_CULTURA,'
      '      TB_CULTURA.DESC_CULTURA,'
      '      TB_NOTA_ITEM.COD_PRODUTO,'
      '      TB_PRODUTO.DESC_PRODUTO,'
      '      TB_CLASSE.DESC_CLASSE'
      ''
      ''
      '    UNION ALL'
      ''
      ''
      '    SELECT'
      '      TB_NOTA_CAB.COD_CADASTRO,'
      '      TB_CADASTRO.NOME,'
      '      TB_NOTA_ITEM.COD_CULTURA,'
      '      TB_CULTURA.DESC_CULTURA,'
      '      TB_NOTA_ITEM.COD_PRODUTO,'
      '      TB_PRODUTO.DESC_PRODUTO,'
      '      TB_CLASSE.DESC_CLASSE,'
      '      0 AS QT_VENDA,'
      '      0 AS VAL_VENDA,'
      
        '      SUM(DECODE(TB_OPERACAO.IND_COMPRAS,'#39'C'#39',TB_NOTA_ITEM.QT_QUA' +
        'NTIDADE,TB_NOTA_ITEM.QT_QUANTIDADE * -1)) AS QT_COMPRA,'
      
        '      SUM(DECODE(TB_OPERACAO.IND_COMPRAS,'#39'C'#39',TB_NOTA_ITEM.VAL_TO' +
        'TAL - (Tb_nota_item.VAL_DESCONTO * Tb_nota_item.QT_QUANTIDADE),(' +
        'TB_NOTA_ITEM.VAL_TOTAL - (Tb_nota_item.VAL_DESCONTO * Tb_nota_it' +
        'em.QT_QUANTIDADE)) * -1)) AS VAL_COMPRA,'
      '      0 AS QT_SREMESSA,'
      '      0 AS VAL_SREMESSA'
      '    FROM'
      '      TB_NOTA_CAB,'
      '      TB_NOTA_ITEM,'
      '      TB_CADASTRO,'
      '      TB_OPERACAO,'
      '      TB_CULTURA,'
      '      TB_PRODUTO,'
      '      TB_CLASSE'
      '    WHERE'
      '      TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '      AND'
      '      TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '      AND'
      '      TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '      AND'
      '      TB_NOTA_ITEM.COD_CULTURA = TB_CULTURA.COD_CULTURA'
      '      AND'
      '      TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '      AND'
      '      TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '      AND'
      '      TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '      AND'
      '      ((TB_OPERACAO.IND_COMPRAS = '#39'C'#39')'
      '       OR'
      '       (TB_OPERACAO.IND_COMPRAS = '#39'D'#39'))'
      '      AND'
      '      (:MARCA IS NULL'
      '       OR'
      '        TB_PRODUTO.COD_MARCA =:MARCA)'
      '      AND'
      '      (:FILIAL IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_FILIAL =:FILIAL)'
      '      AND'
      '      (:CADASTRO IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_CADASTRO =:CADASTRO)'
      '      AND'
      '      (:VENDEDOR IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_VENDEDOR =:VENDEDOR)'
      '      AND'
      '      (:FORNECEDOR IS NULL'
      '       OR'
      '        TB_PRODUTO.COD_CADASTRO =:FORNECEDOR)'
      '      AND'
      '      (:CULTURA IS NULL'
      '       OR'
      '        TB_NOTA_ITEM.COD_CULTURA =:CULTURA)'
      '      AND'
      '      (:PRODUTO IS NULL'
      '       OR'
      '        TB_NOTA_ITEM.COD_PRODUTO =:PRODUTO)'
      '      AND'
      '      (:OPERACAO IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_OPERACAO =:OPERACAO)'
      '      AND'
      '      (:CLASSIFICACAO IS NULL'
      '       OR'
      '        TB_CADASTRO.COD_CLASS_CADASTRO =:CLASSIFICACAO)'
      '      AND'
      '      (:CLASSE IS NULL'
      '       OR'
      '        TB_CLASSE.NUM_CLASSE =:CLASSE)'
      '      AND'
      '      (:SUBCLASSE IS NULL'
      '       OR'
      '        TB_CLASSE.NUM_SUBCLASSE =:SUBCLASSE)'
      '      AND'
      '      (:TIPO_NOTA IS NULL'
      '       OR'
      '        TB_NOTA_CAB.IND_ENTRADA_SAIDA =:TIPO_NOTA)'
      '      AND'
      '      (:TIPO_PAGTO IS NULL'
      '       OR'
      '        TB_NOTA_CAB.IND_CONDICAO_PAGTO =:TIPO_PAGTO)'
      '      AND'
      '      TB_NOTA_CAB.DT_RECEBIMENTO >=:DT_INICIAL'
      '      AND'
      '      TB_NOTA_CAB.DT_RECEBIMENTO <=:DT_FINAL'
      '    GROUP BY'
      '      TB_NOTA_CAB.COD_CADASTRO,'
      '      TB_CADASTRO.NOME,'
      '      TB_NOTA_ITEM.COD_CULTURA,'
      '      TB_CULTURA.DESC_CULTURA,'
      '      TB_NOTA_ITEM.COD_PRODUTO,'
      '      TB_PRODUTO.DESC_PRODUTO,'
      '      TB_CLASSE.DESC_CLASSE'
      ''
      ''
      '    UNION ALL'
      ''
      ''
      '    SELECT'
      '      TB_NOTA_CAB.COD_CADASTRO,'
      '      TB_CADASTRO.NOME,'
      '      TB_NOTA_ITEM.COD_CULTURA,'
      '      TB_CULTURA.DESC_CULTURA,'
      '      TB_NOTA_ITEM.COD_PRODUTO,'
      '      TB_PRODUTO.DESC_PRODUTO,'
      '      TB_CLASSE.DESC_CLASSE,'
      '      0 AS QT_VENDA,'
      '      0 AS VAL_VENDA,'
      '      0 AS QT_COMPRA,'
      '      0 AS VAL_COMPRA,'
      '      SUM(TB_NOTA_ITEM.QT_QUANTIDADE) AS QT_SREMESSA,'
      
        '      SUM(TB_NOTA_ITEM.VAL_TOTAL - (Tb_nota_item.VAL_DESCONTO * ' +
        'Tb_nota_item.QT_QUANTIDADE)) AS VAL_SREMESSA      '
      '    FROM'
      '      TB_NOTA_CAB,'
      '      TB_NOTA_ITEM,'
      '      TB_CADASTRO,'
      '      TB_OPERACAO,'
      '      TB_CULTURA,'
      '      TB_PRODUTO,'
      '      TB_CLASSE'
      '    WHERE'
      '      TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '      AND'
      '      TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '      AND'
      '      TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '      AND'
      '      TB_NOTA_ITEM.COD_CULTURA = TB_CULTURA.COD_CULTURA'
      '      AND'
      '      TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '      AND'
      '      TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '      AND'
      '      TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '      AND'
      '      (TB_OPERACAO.IND_VENDAS = '#39'N'#39')'
      '      AND'
      '      (TB_OPERACAO.IND_FUTURA_CLIENTE = '#39'S'#39')'
      '      AND'
      '      (:MARCA IS NULL'
      '       OR'
      '        TB_PRODUTO.COD_MARCA =:MARCA)'
      '      AND'
      '      (:FILIAL IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_FILIAL =:FILIAL)'
      '      AND'
      '      (:CADASTRO IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_CADASTRO =:CADASTRO)'
      '      AND'
      '      (:VENDEDOR IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_VENDEDOR =:VENDEDOR)'
      '      AND'
      '      (:FORNECEDOR IS NULL'
      '       OR'
      '        TB_PRODUTO.COD_CADASTRO =:FORNECEDOR)'
      '      AND'
      '      (:CULTURA IS NULL'
      '       OR'
      '        TB_NOTA_ITEM.COD_CULTURA =:CULTURA)'
      '      AND'
      '      (:PRODUTO IS NULL'
      '       OR'
      '        TB_NOTA_ITEM.COD_PRODUTO =:PRODUTO)'
      '      AND'
      '      (:OPERACAO IS NULL'
      '       OR'
      '        TB_NOTA_CAB.COD_OPERACAO =:OPERACAO)'
      '      AND'
      '      (:CLASSIFICACAO IS NULL'
      '       OR'
      '        TB_CADASTRO.COD_CLASS_CADASTRO =:CLASSIFICACAO)'
      '      AND'
      '      (:CLASSE IS NULL'
      '       OR'
      '        TB_CLASSE.NUM_CLASSE =:CLASSE)'
      '      AND'
      '      (:SUBCLASSE IS NULL'
      '       OR'
      '        TB_CLASSE.NUM_SUBCLASSE =:SUBCLASSE)'
      '      AND'
      '      (:TIPO_NOTA IS NULL'
      '       OR'
      '        TB_NOTA_CAB.IND_ENTRADA_SAIDA =:TIPO_NOTA)'
      '      AND'
      '      (:TIPO_PAGTO IS NULL'
      '       OR'
      '        TB_NOTA_CAB.IND_CONDICAO_PAGTO =:TIPO_PAGTO)'
      '      AND'
      '      TB_NOTA_CAB.DT_EMISSAO >=:DT_INICIAL'
      '      AND'
      '      TB_NOTA_CAB.DT_EMISSAO <=:DT_FINAL'
      '    GROUP BY'
      '      TB_NOTA_CAB.COD_CADASTRO,'
      '      TB_CADASTRO.NOME,'
      '      TB_NOTA_ITEM.COD_CULTURA,'
      '      TB_CULTURA.DESC_CULTURA,'
      '      TB_NOTA_ITEM.COD_PRODUTO,'
      '      TB_PRODUTO.DESC_PRODUTO,'
      '      TB_CLASSE.DESC_CLASSE'
      '                              )'
      ''
      'GROUP BY'
      '  COD_CADASTRO,'
      '  NOME,'
      '  COD_CULTURA,'
      '  DESC_CULTURA,'
      '  COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  DESC_CLASSE'
      'ORDER BY  NOME,COD_CULTURA,DESC_CLASSE  '
      ' ')
    Variables.Data = {
      030000000F000000070000003A46494C49414C03000000000000000000000009
      0000003A56454E4445444F520300000000000000000000000B0000003A464F52
      4E454345444F52030000000000000000000000080000003A43554C5455524103
      0000000000000000000000080000003A50524F4455544F030000000000000000
      000000090000003A4F5045524143414F0300000000000000000000000E000000
      3A434C415353494649434143414F030000000000000000000000070000003A43
      4C415353450300000000000000000000000A0000003A535542434C4153534503
      00000000000000000000000A0000003A5449504F5F4E4F544105000000000000
      00000000000B0000003A5449504F5F504147544F030000000000000000000000
      0B0000003A44545F494E494349414C0C0000000000000000000000090000003A
      44545F46494E414C0C0000000000000000000000090000003A43414441535452
      4F030000000000000000000000060000003A4D41524341030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000B000000434F445F43554C545552410100000000000C0000
      00444553435F43554C545552410100000000000B000000434F445F50524F4455
      544F0100000000000C000000444553435F50524F4455544F0100000000000B00
      0000444553435F434C415353450100000000000A0000005155414E5449444144
      450100000000000900000056414C5F544F54414C0100000000000C000000434F
      445F434144415354524F010000000000040000004E4F4D450100000000000C00
      000056414C5F554E49544152494F010000000000}
    Session = DMOracle.DBCemapa
    Left = 576
    Top = 528
    object QRProdutoCulturaCOD_CULTURA: TFloatField
      FieldName = 'COD_CULTURA'
    end
    object QRProdutoCulturaDESC_CULTURA: TStringField
      FieldName = 'DESC_CULTURA'
      Size = 30
    end
    object QRProdutoCulturaCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRProdutoCulturaDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRProdutoCulturaDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QRProdutoCulturaQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object QRProdutoCulturaVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QRProdutoCulturaCOD_CADASTRO: TFloatField
      FieldName = 'COD_CADASTRO'
    end
    object QRProdutoCulturaNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
  object QRMovMercadoria_Sintetico: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_CADASTRO.COD_CADASTRO,'
      '  TB_CADASTRO.NOME,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_NOTA_ITEM.COD_PRODUTO,'
      '  Tb_nota_cab.COD_OPERACAO,'
      '  Tb_operacao.DESC_OPERACAO,'
      '  TB_NOTA_ITEM.VAL_UNITARIO,'
      
        '  sum(DECODE(TB_NOTA_CAB.IND_ENTRADA_SAIDA,'#39'E'#39',TB_NOTA_ITEM.QT_Q' +
        'UANTIDADE,TB_NOTA_ITEM.QT_QUANTIDADE * -1)) AS QT_QUANTIDADE,'
      
        '  sum(DECODE(TB_NOTA_CAB.IND_ENTRADA_SAIDA,'#39'E'#39',(TB_NOTA_ITEM.VAL' +
        '_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) +'
      
        '      TB_NOTA_ITEM.VAL_DESPESAS + TB_NOTA_ITEM.VAL_FRETE + TB_NO' +
        'TA_ITEM.VAL_ICMS_SUBST),(TB_NOTA_ITEM.VAL_TOTAL - PEGA_DESCONTO_' +
        'ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) +'
      
        '      TB_NOTA_ITEM.VAL_DESPESAS + TB_NOTA_ITEM.VAL_FRETE + TB_NO' +
        'TA_ITEM.VAL_ICMS_SUBST) * -1)) AS VAL_TOTAL'
      ''
      'FROM'
      '  TB_CADASTRO,'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_PRODUTO,'
      '  TB_CLASSE,'
      '  TB_OPERACAO'
      'WHERE'
      '  TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '  AND'
      '  Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '  AND'
      '  Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO'
      '  AND'
      '  Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '  AND'
      '  TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  (:FILIAL IS NULL OR'
      '    TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '  AND'
      '  (:CADASTRO IS NULL OR'
      '    TB_NOTA_CAB.COD_CADASTRO = :CADASTRO)'
      '  AND'
      '  (:OPERACAO IS NULL OR'
      '    TB_NOTA_CAB.COD_OPERACAO = :OPERACAO)'
      '  AND'
      '  (:ENTRADA_SAIDA IS NULL OR'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = :ENTRADA_SAIDA)'
      '  AND'
      '  (:CONDICAO_PAGTO IS NULL OR'
      '    TB_NOTA_CAB.IND_CONDICAO_PAGTO = :CONDICAO_PAGTO)'
      '  AND'
      '  (:COD_PRODUTO IS NULL'
      '   OR'
      '    TB_NOTA_ITEM.COD_PRODUTO = :COD_PRODUTO)'
      '  AND'
      '  (:CULTURA IS NULL'
      '    OR'
      '      TB_NOTA_ITEM.COD_CULTURA = :CULTURA)'
      '  AND'
      '  (:DEPARTAMENTO IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_DEPARTAMENTO = :DEPARTAMENTO)'
      '  AND'
      '  (:FORNECEDOR IS NULL'
      '   OR'
      '    TB_PRODUTO.COD_CADASTRO = :FORNECEDOR)'
      '  AND'
      '  (:SERIE IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_SERIE = :SERIE)'
      '  AND'
      '  (:COD_CLASSE IS NULL'
      '   OR'
      '    Tb_Classe.NUM_CLASSE = :COD_CLASSE)'
      '  AND'
      '  (:COD_SUBCLASSE IS NULL'
      '   OR'
      '    Tb_Classe.NUM_SUBCLASSE = :COD_SUBCLASSE)'
      '  AND'
      '  (:COD_LOTE_TIPO IS NULL'
      '   OR'
      '    TB_NOTA_ITEM.COD_LOTE_TIPO = :COD_LOTE_TIPO)'
      '  AND'
      '  (:VENDEDOR IS NULL'
      '    OR'
      '      TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '  AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '  AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '  and'
      '  (:cod_marca is null'
      '  or'
      '    tb_produto.cod_marca = :cod_marca)'
      'GROUP BY'
      '  TB_CADASTRO.COD_CADASTRO,'
      '  TB_CADASTRO.NOME,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_NOTA_ITEM.COD_PRODUTO,'
      '  Tb_nota_cab.COD_OPERACAO,'
      '  Tb_operacao.DESC_OPERACAO,'
      '  TB_NOTA_ITEM.VAL_UNITARIO')
    Variables.Data = {
      0300000011000000070000003A46494C49414C03000000000000000000000009
      0000003A434144415354524F030000000000000000000000090000003A4F5045
      524143414F0300000000000000000000000E0000003A454E54524144415F5341
      4944410500000000000000000000000F0000003A434F4E444943414F5F504147
      544F0500000000000000000000000C0000003A434F445F50524F4455544F0300
      00000000000000000000090000003A56454E4445444F52030000000000000000
      000000070000003A444154415F490C0000000000000000000000070000003A44
      4154415F460C0000000000000000000000080000003A43554C54555241030000
      0000000000000000000D0000003A444550415254414D454E544F030000000000
      000000000000060000003A53455249450300000000000000000000000B000000
      3A434F445F434C415353450300000000000000000000000E0000003A434F445F
      535542434C415353450300000000000000000000000E0000003A434F445F4C4F
      54455F5449504F0300000000000000000000000B0000003A464F524E45434544
      4F520300000000000000000000000A0000003A434F445F4D4152434103000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000C000000444553435F50524F4455544F0100000000000D00
      000051545F5155414E5449444144450100000000000900000056414C5F544F54
      414C0100000000000B000000434F445F50524F4455544F0100000000000C0000
      00434F445F434144415354524F0100000000000C000000434F445F4F50455241
      43414F0100000000000D000000444553435F4F5045524143414F010000000000
      040000004E4F4D450100000000000C00000056414C5F554E49544152494F0100
      00000000}
    Session = DMOracle.DBCemapa
    Left = 376
    Top = 520
    object QRMovMercadoria_SinteticoCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRMovMercadoria_SinteticoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRMovMercadoria_SinteticoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRMovMercadoria_SinteticoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRMovMercadoria_SinteticoCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
      Required = True
    end
    object QRMovMercadoria_SinteticoDESC_OPERACAO: TStringField
      FieldName = 'DESC_OPERACAO'
      Required = True
      Size = 30
    end
    object QRMovMercadoria_SinteticoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QRMovMercadoria_SinteticoVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QRMovMercadoria_SinteticoVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
    end
  end
  object QRExtratoAgricola: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  "COD_NOTA_CAB",'
      '  "NUM_NOTA",'
      '  "DT_EMISSAO",'
      '  "NOME",'
      '  "VAL_TOTAL_COM_ICMS",'
      '  "VAL_TOTAL_SEM_ICMS",'
      '  "QUANTIDADE",'
      '  "EMBALAGENS",'
      
        '  (DECODE("QUANTIDADE",0,0,("VAL_TOTAL_COM_ICMS"/"QUANTIDADE")) ' +
        '* "EMBALAGENS") AS "VAL_UNITARIO_COM_ICMS",'
      
        '  (DECODE("QUANTIDADE",0,0,("VAL_TOTAL_SEM_ICMS"/"QUANTIDADE")) ' +
        '* "EMBALAGENS") AS "VAL_UNITARIO_SEM_ICMS"'
      'FROM'
      '('
      '  SELECT'
      '    TB_NOTA_CAB."COD_NOTA_CAB",'
      '    TB_NOTA_CAB."NUM_NOTA",'
      '    TB_NOTA_CAB."DT_EMISSAO",'
      '    TB_CADASTRO."NOME",'
      
        '/* era assim o Gilberto pediu para quando for devolucao deixar a' +
        'penas quantidade    SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',TB_NOT' +
        'A_ITEM."VAL_TOTAL" - TB_NOTA_ITEM."VAL_DESCONTO",(TB_NOTA_ITEM."' +
        'VAL_TOTAL" - TB_NOTA_ITEM."VAL_DESCONTO") * -1)) AS "VAL_TOTAL_C' +
        'OM_ICMS",'
      
        '    SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',TB_NOTA_ITEM."VAL_TOTA' +
        'L" - TB_NOTA_ITEM."VAL_DESCONTO" - TB_NOTA_ITEM."VAL_ICM",'
      
        '                                          (TB_NOTA_ITEM."VAL_TOT' +
        'AL" - TB_NOTA_ITEM."VAL_DESCONTO" - TB_NOTA_ITEM."VAL_ICM") * -1' +
        ')) AS "VAL_TOTAL_SEM_ICMS",'
      '*/'
      
        '    SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',TB_NOTA_ITEM."VAL_TOTA' +
        'L" - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) ,0)) AS "VAL' +
        '_TOTAL_COM_ICMS",'
      
        '    SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',TB_NOTA_ITEM."VAL_TOTA' +
        'L" - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) - TB_NOTA_IT' +
        'EM."VAL_ICM",'
      
        '                                          0)) AS "VAL_TOTAL_SEM_' +
        'ICMS",'
      '    SUM(TB_NOTA_ITEM."QT_QUANTIDADE") AS "QUANTIDADE",'
      
        '    DECODE(TB_PRODUTO."IND_TIPO_PRODUTO",'#39'AGRICOLA'#39',NVL(TB_PRODU' +
        'TO."NUM_EMBALAGEM", 1),1) AS "EMBALAGENS"'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_CADASTRO,'
      '    TB_PRODUTO'
      '  WHERE'
      '    TB_NOTA_CAB."COD_NOTA_CAB" = TB_NOTA_ITEM."COD_NOTA_CAB"'
      '    AND'
      '    TB_NOTA_CAB."COD_CADASTRO" = TB_CADASTRO."COD_CADASTRO"'
      '    AND'
      '    TB_NOTA_CAB."COD_OPERACAO" = TB_OPERACAO."COD_OPERACAO"'
      '    AND'
      '    TB_NOTA_ITEM."COD_PRODUTO" = TB_PRODUTO."COD_PRODUTO"'
      '    AND'
      '    TB_OPERACAO.IND_VENDAS <> '#39'N'#39
      '    AND'
      '    TB_NOTA_CAB."IND_SITUACAO" = 2'
      '    AND'
      '    (:FILIAL IS NULL'
      '     OR'
      '      TB_NOTA_CAB."COD_FILIAL" = :FILIAL)'
      '    AND'
      '    (:CADASTRO IS NULL'
      '     OR'
      '      TB_NOTA_CAB."COD_CADASTRO" = :CADASTRO)'
      '    AND'
      '    :DESC_OPERACAO'
      '    AND'
      '    (:PRODUTO IS NULL'
      '     OR'
      '      TB_NOTA_ITEM."COD_PRODUTO" = :PRODUTO)'
      '    AND'
      '    TB_NOTA_CAB."DT_RECEBIMENTO" >= :DT_INICIAL'
      '    AND'
      '    TB_NOTA_CAB."DT_RECEBIMENTO" <= :DT_FINAL'
      '  GROUP BY'
      '    TB_NOTA_CAB."COD_NOTA_CAB",'
      '    TB_NOTA_CAB."NUM_NOTA",'
      '    TB_NOTA_CAB."DT_EMISSAO",'
      '    TB_CADASTRO."NOME",'
      
        '    DECODE(TB_PRODUTO."IND_TIPO_PRODUTO",'#39'AGRICOLA'#39',NVL(TB_PRODU' +
        'TO."NUM_EMBALAGEM", 1),1)'
      '  ORDER BY'
      '    TB_NOTA_CAB."DT_EMISSAO"'
      ')')
    Variables.Data = {
      0300000006000000070000003A46494C49414C03000000000000000000000009
      0000003A434144415354524F030000000000000000000000080000003A50524F
      4455544F0300000000000000000000000B0000003A44545F494E494349414C0C
      0000000000000000000000090000003A44545F46494E414C0C00000000000000
      000000000E0000003A444553435F4F5045524143414F01000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000A000000080000004E554D5F4E4F54410100000000000A0000004454
      5F454D495353414F0100000000001200000056414C5F544F54414C5F434F4D5F
      49434D530100000000001200000056414C5F544F54414C5F53454D5F49434D53
      0100000000000A0000005155414E5449444144450100000000000C000000434F
      445F4E4F54415F4341420100000000000A000000454D42414C4147454E530100
      000000001500000056414C5F554E49544152494F5F434F4D5F49434D53010000
      0000001500000056414C5F554E49544152494F5F53454D5F49434D5301000000
      0000040000004E4F4D45010000000000}
    Session = DMOracle.DBCemapa
    Left = 1016
    Top = 332
    object QRExtratoAgricolaCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QRExtratoAgricolaNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRExtratoAgricolaDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRExtratoAgricolaVAL_TOTAL_COM_ICMS: TFloatField
      FieldName = 'VAL_TOTAL_COM_ICMS'
    end
    object QRExtratoAgricolaVAL_TOTAL_SEM_ICMS: TFloatField
      FieldName = 'VAL_TOTAL_SEM_ICMS'
    end
    object QRExtratoAgricolaQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object QRExtratoAgricolaEMBALAGENS: TFloatField
      FieldName = 'EMBALAGENS'
    end
    object QRExtratoAgricolaVAL_UNITARIO_COM_ICMS: TFloatField
      FieldName = 'VAL_UNITARIO_COM_ICMS'
    end
    object QRExtratoAgricolaVAL_UNITARIO_SEM_ICMS: TFloatField
      FieldName = 'VAL_UNITARIO_SEM_ICMS'
    end
    object QRExtratoAgricolaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
  end
  object QRVendaClasseData: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      '  Tb_classe.NUM_CLASSE,'
      '  Tb_classe.NUM_SUBCLASSE,'
      '  Tb_classe.DESC_CLASSE,'
      
        '  SUM(Tb_nota_item.QT_QUANTIDADE * TB_PRODUTO.NUM_CONVERTE_FARDO' +
        ') AS SQT_QUANTIDADE,'
      
        '  SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.C' +
        'OD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_FRE' +
        'TE + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SVAL_TOTAL'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_PRODUTO,'
      '  TB_OPERACAO,'
      '  TB_CLASSE'
      'WHERE'
      '   TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '   AND'
      '   Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '   AND'
      '   Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '   AND'
      '   Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '   AND'
      '   TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '   /*AND'
      
        '   (:monta_na_sql) /*serve para o caso de informar uma operacao ' +
        'que nao '#233' venda e nem devolucao de venda */'
      '   AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '   AND'
      '    (:CLASSE IS NULL OR'
      '     :CLASSE = TB_CLASSE.NUM_CLASSE)'
      '   AND'
      '    (:SUB_CLASSE IS NULL OR'
      '     :SUB_CLASSE = TB_CLASSE.NUM_SUBCLASSE)'
      '   AND'
      '  (:VENDEDOR IS NULL'
      '    OR'
      '    TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '  AND'
      '  (:FABRICANTE IS NULL'
      '    OR'
      '    TB_PRODUTO.COD_CADASTRO = :FABRICANTE)'
      '   AND'
      '   TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '   AND'
      '   TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '   AND'
      '   (:IND_ENTRADA_SAIDA IS NULL'
      '   OR'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = :IND_ENTRADA_SAIDA)'
      'GROUP BY'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      '  Tb_classe.NUM_CLASSE,'
      '  Tb_classe.NUM_SUBCLASSE,'
      '  Tb_classe.DESC_CLASSE'
      'ORDER BY'
      '  TB_NOTA_CAB.DT_EMISSAO')
    Variables.Data = {
      03000000090000000D0000003A4D4F4E54415F4E415F53514C01000000000000
      0000000000070000003A46494C49414C03000000000000000000000007000000
      3A434C415353450300000000000000000000000B0000003A5355425F434C4153
      5345030000000000000000000000090000003A56454E4445444F520300000000
      000000000000000B0000003A464142524943414E544503000000000000000000
      0000070000003A444154415F490C0000000000000000000000070000003A4441
      54415F460C0000000000000000000000120000003A494E445F454E5452414441
      5F5341494441050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000B000000444553435F434C415353450100000000000A0000
      004E554D5F434C415353450100000000000D0000004E554D5F535542434C4153
      53450100000000000E0000005351545F5155414E544944414445010000000000
      0A0000005356414C5F544F54414C0100000000000A00000044545F454D495353
      414F010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 1016
    Top = 16
    object QRVendaClasseDataNUM_CLASSE: TIntegerField
      FieldName = 'NUM_CLASSE'
      Required = True
    end
    object QRVendaClasseDataNUM_SUBCLASSE: TIntegerField
      FieldName = 'NUM_SUBCLASSE'
      Required = True
    end
    object QRVendaClasseDataDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QRVendaClasseDataDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRVendaClasseDataSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRVendaClasseDataSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
  end
  object QRVendaClasseDataResumo: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      
        '  SUM(Tb_nota_item.QT_QUANTIDADE * TB_PRODUTO.NUM_CONVERTE_FARDO' +
        ') AS SQT_QUANTIDADE,'
      
        '  SUM(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.C' +
        'OD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_FRE' +
        'TE + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SVAL_TOTAL'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_PRODUTO,'
      '  TB_OPERACAO,'
      '  TB_CLASSE'
      'WHERE'
      '   TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '   AND'
      '   Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '   AND'
      '   Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '   AND'
      '   Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '   AND'
      '   TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '   /*AND'
      
        '   (:monta_na_sql) /*serve para o caso de informar uma operacao ' +
        'que nao '#233' venda e nem devolucao de venda */'
      '   AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '   AND'
      '    (:CLASSE IS NULL OR'
      '     :CLASSE = TB_CLASSE.NUM_CLASSE)'
      '   AND'
      '    (:SUB_CLASSE IS NULL OR'
      '     :SUB_CLASSE = TB_CLASSE.NUM_SUBCLASSE)'
      '   AND'
      '  (:VENDEDOR IS NULL'
      '    OR'
      '    TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '  AND'
      '  (:FABRICANTE IS NULL'
      '    OR'
      '    TB_PRODUTO.COD_CADASTRO = :FABRICANTE)'
      '   AND'
      '   TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '   AND'
      '   TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '   AND'
      '   (:IND_ENTRADA_SAIDA IS NULL'
      '   OR'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = :IND_ENTRADA_SAIDA)'
      'GROUP BY'
      '  TB_NOTA_CAB.DT_EMISSAO'
      'ORDER BY'
      '  TB_NOTA_CAB.DT_EMISSAO')
    Variables.Data = {
      03000000090000000D0000003A4D4F4E54415F4E415F53514C01000000000000
      0000000000070000003A46494C49414C03000000000000000000000007000000
      3A434C415353450300000000000000000000000B0000003A5355425F434C4153
      5345030000000000000000000000090000003A56454E4445444F520300000000
      000000000000000B0000003A464142524943414E544503000000000000000000
      0000070000003A444154415F490C0000000000000000000000070000003A4441
      54415F460C0000000000000000000000120000003A494E445F454E5452414441
      5F5341494441050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000E0000005351545F5155414E544944414445010000000000
      0A0000005356414C5F544F54414C0100000000000A00000044545F454D495353
      414F010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 488
    Top = 539
    object QRVendaClasseDataResumoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRVendaClasseDataResumoSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRVendaClasseDataResumoSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
  end
  object QRHistoricoVendas: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_NOTA_CAB.COD_NOTA_CAB,'
      '  TB_NOTA_ITEM.COD_PRODUTO,'
      '  T1.NUM_CGC,'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      '  TB_CADASTRO.DESC_CIDADE,'
      
        '  DECODE(TB_PRODUTO.NUM_EMBALAGEM,0,TB_NOTA_ITEM.QT_QUANTIDADE,T' +
        'B_NOTA_ITEM.QT_QUANTIDADE*TB_PRODUTO.NUM_EMBALAGEM) AS QT_QUANTI' +
        'DADE,'
      
        '  (TB_NOTA_ITEM.VAL_UNITARIO - TB_NOTA_ITEM.VAL_DESCONTO)  * TB_' +
        'PRODUTO.NUM_EMBALAGEM AS PRECO_UNITARIO,'
      
        '  (TB_NOTA_ITEM.VAL_UNITARIO - TB_NOTA_ITEM.VAL_DESCONTO - TB_NO' +
        'TA_ITEM.VAL_CUSTO) AS MARGEM_UNITARIA,'
      '  TB_OPERACAO.IND_VENDAS'
      ''
      'FROM'
      '  TB_FILIAL T1,'
      '  TB_NOTA_ITEM,'
      '  TB_NOTA_CAB,'
      '  TB_PRODUTO,'
      '  TB_CADASTRO,'
      '  TB_OPERACAO'
      ''
      'WHERE'
      '  TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '  AND'
      '  TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '  AND'
      '  TB_NOTA_CAB.COD_FILIAL = T1.COD_FILIAL'
      '  AND'
      '  TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      '  TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39'  '
      '  AND'
      '  TB_NOTA_CAB.DT_EMISSAO BETWEEN :DATA_I AND :DATA_F')
    Variables.Data = {
      0300000002000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000C000000434F445F4E4F54415F4341420100000000000B00
      0000434F445F50524F4455544F010000000000070000004E554D5F4347430100
      000000000A00000044545F454D495353414F0100000000000B00000044455343
      5F4349444144450100000000000D00000051545F5155414E5449444144450100
      000000000E000000505245434F5F554E49544152494F0100000000000F000000
      4D415247454D5F554E4954415249410100000000000A000000494E445F56454E
      444153010000000000}
    Session = DMOracle.DBCemapa
    Left = 248
    Top = 544
    object QRHistoricoVendasCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QRHistoricoVendasCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRHistoricoVendasNUM_CGC: TStringField
      FieldName = 'NUM_CGC'
      Size = 18
    end
    object QRHistoricoVendasDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRHistoricoVendasDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Required = True
      Size = 30
    end
    object QRHistoricoVendasQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QRHistoricoVendasPRECO_UNITARIO: TFloatField
      FieldName = 'PRECO_UNITARIO'
    end
    object QRHistoricoVendasMARGEM_UNITARIA: TFloatField
      FieldName = 'MARGEM_UNITARIA'
    end
    object QRHistoricoVendasIND_VENDAS: TStringField
      FieldName = 'IND_VENDAS'
      Required = True
      Size = 1
    end
  end
  object QRFutura_Atendido: TOracleDataSet1
    SQL.Strings = (
      
        '/*  SQL est'#225' sendo utilizado diretamento no fonte do formulario.' +
        ' */'
      'SELECT Tb_nota_aux.COD_NOTA_AUX,'
      '       Tb_nota_aux.QT_ATENDIDO,'
      '       Tb_nota_aux.QT_CANCELADO,'
      '       Tb_nota_aux.QT_DEVOLVIDO,'
      '       Tb_nota_aux.QT_NOTA_ITEM,'
      '       Tb_nota_aux.IND_TIPO,'
      '       Tb_produto.DESC_PRODUTO,'
      '       Tb_produto.COD_PRODUTO,'
      '       Tb_nota_cab.NUM_NOTA,'
      '       Tb_nota_cab.DT_EMISSAO,'
      '       Tb_produto.IND_TIPO_PRODUTO,'
      '       Tb_produto.NUM_EMBALAGEM,'
      '       Tb_nota_cab.COD_SERIE,'
      '       TB_NOTA_ITEM.COD_LOTE_TIPO,'
      '       Tb_nota_item.VAL_UNITARIO,'
      '       Tb_nota_cab.VAL_FUNRURAL,'
      '       Tb_baixa_aux.QT_QUANTIDADE,'
      '       Tb_nota_item.VAL_DESCONTO,'
      '       NF_CAB.DT_EMISSAO DT_BAIXA,'
      '       NF_CAB.NUM_NOTA NF_BAIXA,'
      '       NF_CAB.COD_SERIE NF_SERIE,'
      
        '       DECODE(TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO,NULL,TB_NOTA_C' +
        'AB.COD_CADASTRO,TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO) AS COD_CADA' +
        'STRO'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_NOTA_AUX,'
      '  TB_PRODUTO,'
      '  TB_LOTE_TIPO,'
      '  TB_BAIXA_AUX,'
      '  TB_NOTA_ITEM NF_ITEM,'
      '  TB_NOTA_CAB NF_CAB'
      'WHERE'
      '    NF_ITEM.COD_NOTA_ITEM = Tb_Nota_aux.COD_NOTA_ITEM'
      '  AND'
      '    NF_CAB.COD_NOTA_CAB = NF_ITEM.COD_NOTA_CAB'
      '  AND'
      '    TB_LOTE_TIPO.COD_LOTE_TIPO = NF_ITEM.COD_LOTE_TIPO'
      '   AND'
      '    Tb_nota_item.COD_NOTA_ITEM = Tb_nota_aux.COD_NOTA_ITEM'
      '   AND'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '   AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '   AND'
      '    tb_nota_item.COD_NOTA_ITEM = Tb_baixa_aux.COD_NOTA_ITEM'
      '   AND'
      '    Tb_nota_aux.COD_NOTA_AUX = Tb_baixa_aux.COD_NOTA_AUX'
      '   AND'
      '    QT_NOTA_ITEM > (QT_ATENDIDO+QT_CANCELADO+QT_DEVOLVIDO)'
      '   AND'
      '    Tb_nota_aux.IND_TIPO = :IND_TIPO'
      '   AND'
      '    Tb_nota_cab.DT_RECEBIMENTO >= :DATA_I'
      '   AND'
      '    Tb_nota_cab.DT_RECEBIMENTO <= :DATA_F'
      '   AND'
      '    (:CADASTRO IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_CADASTRO = :CADASTRO)'
      '   AND'
      '    (:FILIAL IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '   AND'
      '    (:PRODUTO IS NULL'
      '     OR'
      '      TB_NOTA_ITEM.COD_PRODUTO = :PRODUTO)'
      '   AND'
      '    (:LOTE IS NULL'
      '     OR'
      '      TB_NOTA_ITEM.COD_LOTE_TIPO = :LOTE)'
      ''
      'ORDER BY'
      '  COD_CADASTRO,'
      '  Tb_nota_cab.NUM_NOTA'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    QBEDefinition.QBEFieldDefs = {
      04000000160000000B00000051545F4154454E4449444F0100000000000C0000
      0051545F43414E43454C41444F0100000000000C00000051545F4445564F4C56
      49444F0100000000000C00000051545F4E4F54415F4954454D01000000000008
      000000494E445F5449504F0100000000000B000000434F445F50524F4455544F
      0100000000000C000000444553435F50524F4455544F01000000000008000000
      4E554D5F4E4F544101000000000009000000434F445F53455249450100000000
      000C000000434F445F434144415354524F0100000000000D000000434F445F4C
      4F54455F5449504F0100000000000C00000056414C5F554E49544152494F0100
      0000000010000000494E445F5449504F5F50524F4455544F0100000000000D00
      00004E554D5F454D42414C4147454D0100000000000C00000056414C5F444553
      434F4E544F0100000000000C00000056414C5F46554E525552414C0100000000
      000D00000051545F5155414E5449444144450100000000000C000000434F445F
      4E4F54415F4155580100000000000A00000044545F454D495353414F01000000
      00000800000044545F4241495841010000000000080000004E465F4241495841
      010000000000080000004E465F5345524945010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 781
    Top = 17
    object QRFutura_Atendidonome: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome'
      Calculated = True
    end
    object QRFutura_AtendidoQT_ATENDIDO: TFloatField
      FieldName = 'QT_ATENDIDO'
      Required = True
    end
    object QRFutura_AtendidoQT_CANCELADO: TFloatField
      FieldName = 'QT_CANCELADO'
      Required = True
    end
    object QRFutura_AtendidoQT_DEVOLVIDO: TFloatField
      FieldName = 'QT_DEVOLVIDO'
      Required = True
    end
    object QRFutura_AtendidoQT_NOTA_ITEM: TFloatField
      FieldName = 'QT_NOTA_ITEM'
      Required = True
    end
    object QRFutura_AtendidoIND_TIPO: TStringField
      FieldName = 'IND_TIPO'
      Required = True
      Size = 7
    end
    object QRFutura_AtendidoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRFutura_AtendidoIND_TIPO_PRODUTO: TStringField
      FieldName = 'IND_TIPO_PRODUTO'
      Required = True
      Size = 10
    end
    object QRFutura_AtendidoNUM_EMBALAGEM: TFloatField
      FieldName = 'NUM_EMBALAGEM'
    end
    object QRFutura_AtendidoNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRFutura_AtendidoCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QRFutura_AtendidoVAL_FUNRURAL: TFloatField
      FieldName = 'VAL_FUNRURAL'
      Required = True
    end
    object QRFutura_AtendidoCOD_CADASTRO: TFloatField
      FieldName = 'COD_CADASTRO'
    end
    object QRFutura_AtendidoCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
      Required = True
    end
    object QRFutura_AtendidoVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
    end
    object QRFutura_AtendidoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object QRFutura_AtendidoCOD_NOTA_AUX: TIntegerField
      FieldName = 'COD_NOTA_AUX'
      Required = True
    end
    object QRFutura_AtendidoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRFutura_AtendidoVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
      Required = True
    end
    object QRFutura_AtendidoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRFutura_AtendidoDT_BAIXA: TDateTimeField
      FieldName = 'DT_BAIXA'
      Required = True
    end
    object QRFutura_AtendidoNF_BAIXA: TIntegerField
      FieldName = 'NF_BAIXA'
      Required = True
    end
    object QRFutura_AtendidoNF_SERIE: TStringField
      FieldName = 'NF_SERIE'
      Required = True
      Size = 3
    end
  end
  object QRPrecoVendido: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  V.COD_VENDEDOR,'
      '  V.NOME AS DESC_VENDEDOR,'
      '  P.COD_PRODUTO,'
      '  P.DESC_PRODUTO,'
      '  P.VAL_VAREJO,'
      '  (I.VAL_UNITARIO - I.VAL_DESCONTO) AS VAL_VENDA,'
      
        '  (I.VAL_UNITARIO - I.VAL_DESCONTO - P.VAL_VAREJO) AS VAL_DIFERE' +
        'NCA,'
      '  I.QT_QUANTIDADE,'
      
        '  (I.QT_QUANTIDADE * (I.VAL_UNITARIO - I.VAL_DESCONTO)) AS VAL_T' +
        'OTAL,'
      
        '  (I.QT_QUANTIDADE * (I.VAL_UNITARIO - I.VAL_DESCONTO - P.VAL_VA' +
        'REJO)) AS VAL_DIFERENCA_TOTAL,'
      '  (I.QT_QUANTIDADE * P.VAL_VAREJO) AS VAL_VAREJO_TOTAL'
      'FROM'
      '  TB_NOTA_ITEM I,'
      '  TB_NOTA_CAB C,'
      '  TB_VENDEDOR V,'
      '  TB_PRODUTO P'
      'WHERE'
      '  C.COD_NOTA_CAB = I.COD_NOTA_CAB'
      '  AND'
      '  C.COD_VENDEDOR = V.COD_VENDEDOR(+)'
      '  AND'
      '  P.COD_PRODUTO = I.COD_PRODUTO'
      '  AND'
      '  C.IND_SITUACAO = 2'
      '  AND'
      
        '  (C.DT_RECEBIMENTO BETWEEN :DT_RECEBIMENTO_INI AND :DT_RECEBIME' +
        'NTO_FIN)'
      '  AND'
      '  (C.COD_VENDEDOR = :COD_VENDEDOR OR :COD_VENDEDOR IS NULL)'
      '  AND'
      '  (I.COD_PRODUTO = :COD_PRODUTO OR :COD_PRODUTO IS NULL)'
      'ORDER BY'
      '  V.NOME,'
      '  P.DESC_PRODUTO,'
      '  6')
    Variables.Data = {
      0300000004000000130000003A44545F5245434542494D454E544F5F494E490C
      0000000000000000000000130000003A44545F5245434542494D454E544F5F46
      494E0C00000000000000000000000D0000003A434F445F56454E4445444F5203
      00000000000000000000000C0000003A434F445F50524F4455544F0300000000
      00000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B0000000B000000434F445F50524F4455544F0100000000000C0000
      00444553435F50524F4455544F0100000000000D00000051545F5155414E5449
      444144450100000000000C000000434F445F56454E4445444F52010000000000
      0D000000444553435F56454E4445444F520100000000000A00000056414C5F56
      4152454A4F0100000000000900000056414C5F56454E44410100000000000D00
      000056414C5F4449464552454E43410100000000000900000056414C5F544F54
      414C0100000000001300000056414C5F4449464552454E43415F544F54414C01
      00000000001000000056414C5F564152454A4F5F544F54414C010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 781
    Top = 75
    object QRPrecoVendidoCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QRPrecoVendidoDESC_VENDEDOR: TStringField
      FieldName = 'DESC_VENDEDOR'
      Size = 40
    end
    object QRPrecoVendidoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRPrecoVendidoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRPrecoVendidoVAL_VAREJO: TFloatField
      FieldName = 'VAL_VAREJO'
    end
    object QRPrecoVendidoVAL_VENDA: TFloatField
      FieldName = 'VAL_VENDA'
    end
    object QRPrecoVendidoVAL_DIFERENCA: TFloatField
      FieldName = 'VAL_DIFERENCA'
    end
    object QRPrecoVendidoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object QRPrecoVendidoVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QRPrecoVendidoVAL_DIFERENCA_TOTAL: TFloatField
      FieldName = 'VAL_DIFERENCA_TOTAL'
    end
    object QRPrecoVendidoVAL_VAREJO_TOTAL: TFloatField
      FieldName = 'VAL_VAREJO_TOTAL'
    end
  end
  object QRControleCarga: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_NOTA_CAB.NR_ROTA,'
      '  TB_NOTA_CAB.NUM_NOTA,'
      '  TB_NOTA_CAB.COD_CADASTRO,'
      '  TB_CADASTRO.NOME,'
      '  CASE TB_NOTA_CAB.IND_CONDICAO_PAGTO'
      '    WHEN '#39'1'#39' THEN '#39'A VISTA'#39
      '    WHEN '#39'2'#39' THEN '#39'A PRAZO'#39
      '    ELSE '#39'OUTROS'#39' END AS DESC_CONDICAO_PAGTO,'
      
        '  SUM(TB_NOTA_ITEM.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.C' +
        'OD_NOTA_ITEM)) AS VAL_TOTAL,'
      '  SUM(TB_NOTA_ITEM.QT_QUANTIDADE) AS QT_QUANTIDADE'
      'FROM'
      '  TB_NOTA_ITEM'
      
        'INNER JOIN TB_NOTA_CAB ON TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CA' +
        'B.COD_NOTA_CAB'
      
        'INNER JOIN TB_CADASTRO ON TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO' +
        '.COD_CADASTRO'
      'WHERE'
      '  (:COD_FILIAL IS NULL OR TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      'AND'
      '  TB_NOTA_CAB.NR_ROTA = :NR_ROTA'
      'AND'
      
        '  TB_NOTA_CAB.DT_RECEBIMENTO BETWEEN :DT_RECEBIMENTO_INI AND :DT' +
        '_RECEBIMENTO_FIN'
      'GROUP BY'
      '  TB_NOTA_CAB.NR_ROTA,'
      '  TB_NOTA_CAB.NUM_NOTA,'
      '  TB_NOTA_CAB.COD_CADASTRO,'
      '  TB_CADASTRO.NOME,'
      '  TB_NOTA_CAB.IND_CONDICAO_PAGTO')
    Variables.Data = {
      03000000040000000B0000003A434F445F46494C49414C030000000000000000
      000000080000003A4E525F524F5441030000000000000000000000130000003A
      44545F5245434542494D454E544F5F494E490C00000000000000000000001300
      00003A44545F5245434542494D454E544F5F46494E0C00000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000D00000051545F5155414E54494441444501000000000009
      00000056414C5F544F54414C010000000000070000004E525F524F5441010000
      000000080000004E554D5F4E4F54410100000000000C000000434F445F434144
      415354524F010000000000040000004E4F4D4501000000000013000000444553
      435F434F4E444943414F5F504147544F010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 781
    Top = 123
    object QRControleCargaNR_ROTA: TIntegerField
      FieldName = 'NR_ROTA'
    end
    object QRControleCargaNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRControleCargaCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRControleCargaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRControleCargaDESC_CONDICAO_PAGTO: TStringField
      FieldName = 'DESC_CONDICAO_PAGTO'
      Size = 7
    end
    object QRControleCargaVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QRControleCargaQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
  end
  object QRCurvaABC: TOracleDataSet1
    SQL.Strings = (
      
        'SELECT      /* foi feito duas subconsultas para permitir orderna' +
        'r para depois selecionar o numero de linhas para curva ABC */'
      '  COD_FILIAL,'
      '  DESC_FILIAL,'
      '  COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  NUM_FABRICANTE,'
      '  COD_LOTE_TIPO,'
      '  SQT_QUANTIDADE,'
      '  SVAL_TOTAL,'
      '  VAL_CUSTO'
      'FROM'
      '('
      '  SELECT'
      '    COD_FILIAL,'
      '    DESC_FILIAL,'
      '    COD_PRODUTO,'
      '    DESC_PRODUTO,'
      '    NUM_FABRICANTE,'
      '    COD_LOTE_TIPO,'
      '    SQT_QUANTIDADE,'
      '    SVAL_TOTAL,'
      '    VAL_CUSTO'
      '  FROM'
      '  ('
      '    SELECT'
      '      COD_FILIAL + 0.00 AS COD_FILIAL,'
      '      DESC_FILIAL,'
      '      COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '      DESC_PRODUTO,'
      '      NUM_FABRICANTE,'
      '      COD_LOTE_TIPO + 0 as COD_LOTE_TIPO,'
      '      SUM(SQT_QUANTIDADE) as SQT_QUANTIDADE,'
      '      sum(SVAL_TOTAL) as SVAL_TOTAL,'
      '      sum(VAL_CUSTO) as VAL_CUSTO'
      '    FROM'
      '    ('
      '      SELECT'
      '        Tb_filial.COD_FILIAL,'
      '        Tb_filial.DESC_FILIAL,'
      '        TB_PRODUTO.COD_PRODUTO,'
      '        TB_PRODUTO.DESC_PRODUTO,'
      '        TB_PRODUTO.NUM_FABRICANTE,'
      '        TB_NOTA_ITEM.COD_LOTE_TIPO,'
      '        SUM(Tb_nota_item.QT_QUANTIDADE) AS SQT_QUANTIDADE,'
      
        '        SUM(Tb_nota_item.VAL_TOTAL- PEGA_DESCONTO_ITEM(TB_NOTA_I' +
        'TEM.COD_NOTA_ITEM) +Tb_nota_item.VAL_DESPESAS+Tb_nota_item.VAL_F' +
        'RETE + TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SVAL_TOTAL,'
      
        '        SUM(Tb_nota_item.VAL_CUSTO*Tb_nota_item.QT_QUANTIDADE) A' +
        'S VAL_CUSTO'
      '      FROM'
      '        TB_NOTA_CAB,'
      '        TB_NOTA_ITEM,'
      '        TB_OPERACAO,'
      '        TB_PRODUTO,'
      '        TB_CLASSE,'
      '        TB_FILIAL'
      '      WHERE'
      '        TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '        AND'
      '        TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      '        AND'
      '        TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '        AND'
      '        Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '        AND'
      '        Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '        AND'
      '        Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL'
      '        AND'
      '        TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '        AND'
      '        TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '        AND'
      '        TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      '        AND'
      '        (:COD_FILIAL IS NULL OR'
      '          TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      '        AND'
      '        (:COD_VENDEDOR IS NULL OR'
      '          TB_NOTA_CAB.COD_VENDEDOR = :COD_VENDEDOR)'
      '        AND'
      '        (:COD_CADASTRO IS NULL OR'
      '          TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO)'
      '        AND'
      '        (:COD_ESTADO IS NULL'
      '         OR'
      '          TB_NOTA_CAB.COD_ESTADO = :COD_ESTADO)'
      '        AND'
      '        (:NUM_CLASSE IS NULL'
      '         OR'
      '          TB_CLASSE.NUM_CLASSE = :NUM_CLASSE)'
      '        AND'
      '        (:NUM_SUBCLASSE IS NULL'
      '         OR'
      '          TB_CLASSE.NUM_SUBCLASSE = :NUM_SUBCLASSE)'
      '        AND'
      '        (:COD_OPERACAO IS NULL OR'
      '          TB_NOTA_CAB.COD_OPERACAO = :COD_OPERACAO)'
      '      GROUP BY'
      '        Tb_filial.COD_FILIAL,'
      '        Tb_filial.DESC_FILIAL,'
      '        TB_PRODUTO.COD_PRODUTO,'
      '        TB_PRODUTO.DESC_PRODUTO,'
      '        TB_PRODUTO.NUM_FABRICANTE,'
      '        TB_NOTA_ITEM.COD_LOTE_TIPO'
      ''
      '      UNION ALL'
      ''
      '      SELECT'
      '        Tb_filial.COD_FILIAL,'
      '        Tb_filial.DESC_FILIAL,'
      '        TB_PRODUTO.COD_PRODUTO,'
      '        TB_PRODUTO.DESC_PRODUTO,'
      '        TB_PRODUTO.NUM_FABRICANTE,'
      '        TB_NOTA_ITEM.COD_LOTE_TIPO,'
      '        SUM(Tb_nota_item.QT_QUANTIDADE*-1) AS SQT_QUANTIDADE,'
      
        '        SUM((Tb_nota_item.VAL_TOTAL- PEGA_DESCONTO_ITEM(TB_NOTA_' +
        'ITEM.COD_NOTA_ITEM) +Tb_nota_item.VAL_DESPESAS+Tb_nota_item.VAL_' +
        'FRETE+TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1) AS SVAL_TOTAL,'
      '        SUM((Tb_nota_item.VAL_CUSTO)*-1) AS VAL_CUSTO'
      '      FROM'
      '        TB_NOTA_CAB,'
      '        TB_NOTA_ITEM,'
      '        TB_OPERACAO,'
      '        TB_PRODUTO,'
      '        TB_FILIAL,'
      '        TB_CLASSE'
      '      WHERE'
      '        TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '        AND'
      '        TB_OPERACAO.IND_VENDAS = '#39'D'#39
      '        AND'
      '        TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39
      '        AND'
      '        TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '        AND'
      '        Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '        AND'
      '        Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '        AND'
      '        Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL'
      '        AND'
      '        TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '        AND'
      '        TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '        AND'
      '        TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '        AND'
      '        (:COD_FILIAL IS NULL OR'
      '          TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      '        AND'
      '        (:COD_VENDEDOR IS NULL OR'
      '          TB_NOTA_CAB.COD_VENDEDOR = :COD_VENDEDOR)'
      '        AND'
      '        (:COD_CADASTRO IS NULL OR'
      '          TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO)'
      '        AND'
      '        (:COD_ESTADO IS NULL'
      '         OR'
      '          TB_NOTA_CAB.COD_ESTADO = :COD_ESTADO)'
      '        AND'
      '        (:NUM_CLASSE IS NULL'
      '         OR'
      '          TB_CLASSE.NUM_CLASSE = :NUM_CLASSE)'
      '        AND'
      '        (:NUM_SUBCLASSE IS NULL'
      '         OR'
      '          TB_CLASSE.NUM_SUBCLASSE = :NUM_SUBCLASSE)'
      '        AND'
      '        (:COD_OPERACAO IS NULL OR'
      '          TB_NOTA_CAB.COD_OPERACAO = :COD_OPERACAO)'
      '      GROUP BY'
      '        Tb_filial.COD_FILIAL,'
      '        Tb_filial.DESC_FILIAL,'
      '        TB_PRODUTO.COD_PRODUTO,'
      '        TB_PRODUTO.DESC_PRODUTO,'
      '        TB_PRODUTO.NUM_FABRICANTE,'
      '        TB_NOTA_ITEM.COD_LOTE_TIPO'
      '    )'
      '    GROUP BY'
      '      COD_FILIAL,'
      '      DESC_FILIAL,'
      '      COD_PRODUTO,'
      '      DESC_PRODUTO,'
      '      NUM_FABRICANTE,'
      '      COD_LOTE_TIPO'
      '  )'
      '   ORDER BY :ORDENAR DESC'
      ')'
      'Where'
      '  RowNum <= :NR_ITENS')
    Variables.Data = {
      030000000B000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C00000000000000000000000D0000003A434F445F43
      4144415354524F0300000000000000000000000B0000003A434F445F46494C49
      414C0300000000000000000000000D0000003A434F445F56454E4445444F5203
      00000000000000000000000B0000003A434F445F45535441444F050000000000
      0000000000000B0000003A4E554D5F434C415353450300000000000000000000
      000E0000003A4E554D5F535542434C415353450300000000000000000000000D
      0000003A434F445F4F5045524143414F03000000000000000000000008000000
      3A4F5244454E4152010000000000000000000000090000003A4E525F4954454E
      53030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000A000000434F445F46494C49414C0100000000000B000000
      444553435F46494C49414C0100000000000B000000434F445F50524F4455544F
      0100000000000C000000444553435F50524F4455544F0100000000000E000000
      5351545F5155414E5449444144450100000000000A0000005356414C5F544F54
      414C0100000000000900000056414C5F435553544F0100000000000D00000043
      4F445F4C4F54455F5449504F0100000000000E0000004E554D5F464142524943
      414E5445010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 784
    Top = 178
    object QRCurvaABCCOD_FILIAL: TFloatField
      FieldName = 'COD_FILIAL'
    end
    object QRCurvaABCDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRCurvaABCCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRCurvaABCDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QRCurvaABCNUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
      Size = 15
    end
    object QRCurvaABCSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRCurvaABCSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRCurvaABCVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
    end
    object QRCurvaABCCOD_LOTE_TIPO: TFloatField
      FieldName = 'COD_LOTE_TIPO'
    end
  end
  object QRComissaoFrete: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_NOTA_CAB,'
      '  NUM_NOTA,'
      '  DESC_PLACA,'
      '  DT_EMISSAO,'
      '  DESC_FILIAL,'
      '  NOME_DESTINATARIO,'
      '  COD_TRANSPORTADOR,'
      '  NOME_TRANSPORTADOR,'
      '  PORCENTAGEM_COMISSAO,'
      '  VALOR_FRETE_SC,'
      '  PESO,'
      '  VALOR_COMISSAO'
      'FROM'
      '('
      '  SELECT'
      '    NC.COD_NOTA_CAB,'
      '    NC.NUM_NOTA,'
      '    NC.DESC_PLACA,'
      '    NC.DT_EMISSAO,'
      '    F.DESC_FILIAL,'
      '    CLI.NOME as NOME_DESTINATARIO,'
      '    NC.COD_TRANSPORTADOR,'
      '    C.NOME AS NOME_TRANSPORTADOR,'
      '    :PORCENTAGEM_COMISSAO + 0.00 AS PORCENTAGEM_COMISSAO,'
      '    :VALOR_FRETE_SC AS VALOR_FRETE_SC,'
      
        '    SUM(DECODE(PR.DESC_UNIDADE,'#39'TON'#39',NI.QT_QUANTIDADE * 1000,NI.' +
        'QT_QUANTIDADE)) AS PESO,'
      
        '    (SUM(DECODE(PR.DESC_UNIDADE,'#39'TON'#39',NI.QT_QUANTIDADE * 1000, N' +
        'I.QT_QUANTIDADE)) / 60 * :VALOR_FRETE_SC) AS VALOR_COMISSAO'
      '  FROM'
      '    TB_NOTA_CAB NC'
      '    INNER JOIN TB_NOTA_ITEM NI ON'
      '      NC.COD_NOTA_CAB = NI.COD_NOTA_CAB'
      '    INNER JOIN TB_CADASTRO C ON'
      '      NC.COD_TRANSPORTADOR = C.COD_CADASTRO'
      '    INNER JOIN TB_FILIAL F ON'
      '      NC.COD_FILIAL = F.COD_FILIAL'
      '    INNER JOIN TB_CADASTRO CLI ON'
      '      NC.COD_CADASTRO = CLI.COD_CADASTRO'
      '    INNER JOIN TB_PRODUTO PR ON'
      '      NI.COD_PRODUTO = PR.COD_PRODUTO'
      '  WHERE'
      '    NC.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    NC.NUM_CONHECIMENTO_FRETE IS NULL'
      '    AND'
      '    NC.COD_TRANSPORTADOR IS NOT NULL'
      '    AND'
      '    (:COD_TRANSPORTADOR IS NULL'
      '    OR'
      '    NC.COD_TRANSPORTADOR = :COD_TRANSPORTADOR)'
      '    AND'
      '    NC.VAL_FRETE_COMISSAO = 0'
      '    AND'
      '    NC.DT_EMISSAO >= :DT_INICIAL'
      '    AND'
      '    NC.DT_EMISSAO <= :DT_FINAL'
      '  GROUP BY'
      '    NC.COD_NOTA_CAB,'
      '    NC.NUM_NOTA,'
      '    NC.DESC_PLACA,'
      '    NC.DT_EMISSAO,'
      '    F.DESC_FILIAL,'
      '    CLI.NOME,'
      '    NC.COD_TRANSPORTADOR,'
      '    C.NOME,'
      '    :VALOR_FRETE_SC'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    NC.COD_NOTA_CAB,'
      '    NC.NUM_NOTA,'
      '    NC.DESC_PLACA,'
      '    NC.DT_EMISSAO,'
      '    F.DESC_FILIAL,'
      '    CLI.NOME as NOME_DESTINATARIO,'
      '    NC.COD_TRANSPORTADOR,'
      '    C.NOME AS NOME_TRANSPORTADOR,'
      '    :PORCENTAGEM_COMISSAO + 0.00 AS PORCENTAGEM_COMISSAO,'
      '    0 AS VALOR_FRETE_SC,'
      '    0 AS PESO,'
      '    SUM(NC.VAL_FRETE_COMISSAO) AS VALOR_COMISSAO'
      '  FROM'
      '    TB_NOTA_CAB NC'
      '    INNER JOIN TB_CADASTRO C ON'
      '      NC.COD_TRANSPORTADOR = C.COD_CADASTRO'
      '    INNER JOIN TB_FILIAL F ON'
      '      NC.COD_FILIAL = F.COD_FILIAL'
      '    INNER JOIN TB_CADASTRO CLI ON'
      '      NC.COD_CADASTRO = CLI.COD_CADASTRO'
      '  WHERE'
      '    NC.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    NC.NUM_CONHECIMENTO_FRETE IS NULL'
      '    AND'
      '    NC.COD_TRANSPORTADOR IS NOT NULL'
      '    AND'
      '    (:COD_TRANSPORTADOR IS NULL'
      '    OR'
      '    NC.COD_TRANSPORTADOR = :COD_TRANSPORTADOR)'
      '    AND'
      '    NC.VAL_FRETE_COMISSAO > 0'
      '    AND'
      '    NC.DT_EMISSAO >= :DT_INICIAL'
      '    AND'
      '    NC.DT_EMISSAO <= :DT_FINAL'
      '  GROUP BY'
      '    NC.COD_NOTA_CAB,'
      '    NC.NUM_NOTA,'
      '    NC.DESC_PLACA,'
      '    NC.DT_EMISSAO,'
      '    F.DESC_FILIAL,'
      '    CLI.NOME,'
      '    NC.COD_TRANSPORTADOR,'
      '    C.NOME'
      ')'
      'ORDER BY'
      '  NOME_TRANSPORTADOR,'
      '  NOME_DESTINATARIO,'
      '  DT_EMISSAO,'
      '  NUM_NOTA'
      ''
      ''
      '')
    Variables.Data = {
      03000000050000000F0000003A56414C4F525F46524554455F53430400000000
      000000000000000B0000003A44545F494E494349414C0C000000000000000000
      0000090000003A44545F46494E414C0C0000000000000000000000120000003A
      434F445F5452414E53504F525441444F52030000000000000000000000150000
      003A504F5243454E544147454D5F434F4D495353414F04000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000C0000000C000000434F445F4E4F54415F4341420100000000000800
      00004E554D5F4E4F54410100000000000A000000444553435F504C4143410100
      0000000011000000434F445F5452414E53504F525441444F5201000000000004
      0000005045534F010000000000120000004E4F4D455F5452414E53504F525441
      444F520100000000000E00000056414C4F525F434F4D495353414F0100000000
      000A00000044545F454D495353414F0100000000000B000000444553435F4649
      4C49414C0100000000000E00000056414C4F525F46524554455F534301000000
      0000110000004E4F4D455F44455354494E41544152494F010000000000140000
      00504F5243454E544147454D5F434F4D495353414F010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 784
    Top = 240
    object QRComissaoFreteCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QRComissaoFreteNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRComissaoFreteDESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Size = 8
    end
    object QRComissaoFreteCOD_TRANSPORTADOR: TIntegerField
      FieldName = 'COD_TRANSPORTADOR'
    end
    object QRComissaoFreteNOME_TRANSPORTADOR: TStringField
      FieldName = 'NOME_TRANSPORTADOR'
      Required = True
      Size = 60
    end
    object QRComissaoFretePESO: TFloatField
      FieldName = 'PESO'
    end
    object QRComissaoFreteVALOR_COMISSAO: TFloatField
      FieldName = 'VALOR_COMISSAO'
    end
    object QRComissaoFreteDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRComissaoFreteDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRComissaoFreteNOME_DESTINATARIO: TStringField
      FieldName = 'NOME_DESTINATARIO'
      Required = True
      Size = 60
    end
    object QRComissaoFreteVALOR_FRETE_SC: TFloatField
      FieldName = 'VALOR_FRETE_SC'
    end
    object QRComissaoFretePORCENTAGEM_COMISSAO: TFloatField
      FieldName = 'PORCENTAGEM_COMISSAO'
    end
  end
  object QRVendaOperacaoProduto: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_FILIAL,'
      '  COD_OPERACAO,'
      '  DESC_OPERACAO,'
      '  IND_SITUACAO,'
      '  IND_ENTRADA_SAIDA,'
      '  SUM(SVAL_TOTAL) AS SVAL_TOTAL,'
      '  SUM(SVAL_BASE_CALCULO) AS SVAL_BASE_CALCULO'
      'FROM ('
      '    SELECT'
      '     TB_NOTA_CAB.COD_FILIAL,'
      '     TB_NOTA_CAB.COD_NOTA_CAB,'
      '     TB_NOTA_CAB.NUM_NOTA,'
      '     TB_NOTA_CAB.DT_EMISSAO,'
      '     TB_NOTA_CAB.COD_OPERACAO,'
      '     TB_OPERACAO.DESC_OPERACAO,'
      '     TB_NOTA_CAB.IND_SITUACAO,'
      
        '     DECODE(TB_NOTA_CAB.IND_ENTRADA_SAIDA,'#39'E'#39','#39'ENTRADA'#39','#39'SAIDA'#39')' +
        ' AS IND_ENTRADA_SAIDA,'
      
        '     SUM(TB_NOTA_ITEM.VAL_TOTAL) - PEGA_DESCONTO_NOTA(TB_NOTA_CA' +
        'B.COD_NOTA_CAB) + '
      
        '       NVL(TB_NOTA_CAB.VAL_DESPESAS,0) + NVL(TB_NOTA_CAB.VAL_FRE' +
        'TE,0) + NVL(TB_NOTA_CAB.VAL_TOTAL_IPI,0) + SUM(NVL(TB_NOTA_ITEM.' +
        'VAL_ICMS_SUBST,0)) AS SVAL_TOTAL,'
      
        '     SUM(TB_NOTA_ITEM.VAL_TOTAL) - PEGA_DESCONTO_NOTA(TB_NOTA_CA' +
        'B.COD_NOTA_CAB)+'
      '       NVL(TB_NOTA_CAB.VAL_DESPESAS,0) AS SVAL_BASE_CALCULO'
      '    FROM '
      '     TB_NOTA_CAB '
      
        '    INNER JOIN TB_NOTA_ITEM ON TB_NOTA_CAB.COD_NOTA_CAB = TB_NOT' +
        'A_ITEM.COD_NOTA_CAB'
      
        '    INNER JOIN TB_OPERACAO  ON TB_NOTA_CAB.COD_OPERACAO = TB_OPE' +
        'RACAO.COD_OPERACAO'
      '  AND'
      '    TB_NOTA_CAB.IND_SITUACAO = 2'
      '  AND'
      '  (:COD_FILIAL IS NULL'
      '   OR TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      '  AND'
      '    (TB_NOTA_CAB.IND_ENTRADA_SAIDA = :ENTRADA_SAIDA)'
      '  AND'
      '    (TB_NOTA_CAB.DT_EMISSAO >= :DATA_I)'
      '  AND'
      '    (TB_NOTA_CAB.DT_EMISSAO <= :DATA_F) '
      'GROUP BY '
      '  TB_NOTA_CAB.COD_FILIAL, '
      '  TB_NOTA_CAB.COD_NOTA_CAB, '
      '  TB_NOTA_CAB.NUM_NOTA, '
      '  TB_NOTA_CAB.DT_EMISSAO, '
      '  TB_NOTA_CAB.COD_OPERACAO, '
      '  TB_OPERACAO.DESC_OPERACAO,  '
      '  TB_NOTA_CAB.IND_SITUACAO,'
      '  TB_NOTA_CAB.VAL_DESPESAS,'
      '  TB_NOTA_CAB.VAL_FRETE,'
      '  TB_NOTA_CAB.VAL_TOTAL_IPI,'
      '  DECODE(TB_NOTA_CAB.IND_ENTRADA_SAIDA,'#39'E'#39','#39'ENTRADA'#39','#39'SAIDA'#39')'
      ' )'
      'GROUP BY'
      '  COD_FILIAL,'
      '  COD_OPERACAO,'
      '  DESC_OPERACAO,'
      '  IND_SITUACAO,'
      '  IND_ENTRADA_SAIDA'
      'ORDER BY '
      '  COD_OPERACAO')
    Variables.Data = {
      0300000004000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C00000000000000000000000B0000003A434F445F46
      494C49414C0300000000000000000000000E0000003A454E54524144415F5341
      494441050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000A000000434F445F46494C49414C0100000000000A000000
      5356414C5F544F54414C0100000000000C000000494E445F534954554143414F
      010000000000110000005356414C5F424153455F43414C43554C4F0100000000
      000C000000434F445F4F5045524143414F0100000000000D000000444553435F
      4F5045524143414F01000000000011000000494E445F454E54524144415F5341
      494441010000000000}
    Session = DMOracle.DBCemapa
    Left = 781
    Top = 303
    object QRVendaOperacaoProdutoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QRVendaOperacaoProdutoCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
      Required = True
    end
    object QRVendaOperacaoProdutoDESC_OPERACAO: TStringField
      FieldName = 'DESC_OPERACAO'
      Required = True
      Size = 50
    end
    object QRVendaOperacaoProdutoSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRVendaOperacaoProdutoIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Required = True
      Size = 1
    end
    object QRVendaOperacaoProdutoIND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 7
    end
    object QRVendaOperacaoProdutoSVAL_BASE_CALCULO: TFloatField
      FieldName = 'SVAL_BASE_CALCULO'
    end
  end
  object QRVendaOperacaoProduto2: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_FILIAL,'
      '  COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  IND_SITUACAO,'
      '  SUM(SVAL_TOTAL) AS SVAL_TOTAL,'
      '  SUM(QT_QUANTIDADE) AS QT_QUANTIDADE,'
      '  SUM(SVAL_BASE_CALCULO) AS SVAL_BASE_CALCULO'
      'FROM ('
      '    SELECT'
      '     TB_NOTA_CAB.COD_FILIAL,'
      '     TB_NOTA_CAB.COD_NOTA_CAB,'
      '     TB_NOTA_CAB.NUM_NOTA,'
      '     TB_NOTA_CAB.DT_EMISSAO,'
      '     TB_NOTA_ITEM.COD_PRODUTO,'
      '     TB_PRODUTO.DESC_PRODUTO,'
      '     TB_NOTA_ITEM.VAL_TOTAL,'
      '     TB_NOTA_CAB.IND_SITUACAO,'
      '     SUM(TB_NOTA_ITEM.QT_QUANTIDADE) AS QT_QUANTIDADE,'
      
        '     SUM(TB_NOTA_ITEM.VAL_TOTAL) - PEGA_DESCONTO_ITEM(TB_NOTA_IT' +
        'EM.COD_NOTA_ITEM) + '
      
        '      NVL(TB_NOTA_ITEM.VAL_DESPESAS,0) + NVL(TB_NOTA_ITEM.VAL_FR' +
        'ETE,0) + NVL(TB_NOTA_ITEM.VAL_IPI,0) + NVL(TB_NOTA_ITEM.VAL_ICMS' +
        '_SUBST,0) AS SVAL_TOTAL,'
      
        '     SUM(TB_NOTA_ITEM.VAL_TOTAL) - PEGA_DESCONTO_ITEM(TB_NOTA_IT' +
        'EM.COD_NOTA_ITEM)+ NVL(TB_NOTA_ITEM.VAL_DESPESAS,0) AS SVAL_BASE' +
        '_CALCULO'
      '    FROM'
      '     TB_NOTA_CAB '
      
        '    INNER JOIN TB_NOTA_ITEM ON TB_NOTA_CAB.COD_NOTA_CAB = TB_NOT' +
        'A_ITEM.COD_NOTA_CAB'
      
        '    INNER JOIN TB_PRODUTO  ON TB_NOTA_ITEM.COD_PRODUTO = TB_PROD' +
        'UTO.COD_PRODUTO'
      '  AND'
      '    TB_NOTA_CAB.IND_SITUACAO = 2'
      '  AND'
      '  (:COD_FILIAL IS NULL'
      '   OR TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      '  AND'
      '    (TB_NOTA_CAB.IND_ENTRADA_SAIDA = :ENTRADA_SAIDA) '
      '  AND'
      '    (TB_NOTA_CAB.DT_EMISSAO >= :DATA_I)'
      '  AND'
      '    (TB_NOTA_CAB.DT_EMISSAO <= :DATA_F) '
      ' GROUP BY '
      '  TB_NOTA_CAB.COD_FILIAL,'
      '  TB_NOTA_CAB.COD_NOTA_CAB,'
      '  TB_NOTA_CAB.NUM_NOTA,'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      '  TB_NOTA_ITEM.COD_PRODUTO,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_NOTA_ITEM.VAL_TOTAL,'
      '  TB_NOTA_CAB.IND_SITUACAO,'
      '  TB_NOTA_ITEM.COD_NOTA_ITEM,'
      '  TB_NOTA_ITEM.VAL_DESPESAS,'
      '  TB_NOTA_ITEM.VAL_FRETE,'
      '  TB_NOTA_ITEM.VAL_IPI,'
      '  TB_NOTA_ITEM.VAL_ICMS_SUBST'
      ' )'
      'GROUP BY'
      '  COD_FILIAL,'
      '  COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  IND_SITUACAO'
      'ORDER BY '
      '  COD_PRODUTO'
      '  '
      ' '
      '')
    Variables.Data = {
      0300000004000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C00000000000000000000000B0000003A434F445F46
      494C49414C0300000000000000000000000E0000003A454E54524144415F5341
      494441050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000A000000434F445F46494C49414C0100000000000A000000
      5356414C5F544F54414C0100000000000C000000494E445F534954554143414F
      010000000000110000005356414C5F424153455F43414C43554C4F0100000000
      000B000000434F445F50524F4455544F0100000000000C000000444553435F50
      524F4455544F0100000000000D00000051545F5155414E544944414445010000
      000000}
    Session = DMOracle.DBCemapa
    Left = 783
    Top = 359
    object QRVendaOperacaoProduto2COD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QRVendaOperacaoProduto2COD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRVendaOperacaoProduto2DESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QRVendaOperacaoProduto2SVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRVendaOperacaoProduto2QT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QRVendaOperacaoProduto2IND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Required = True
      Size = 1
    end
    object QRVendaOperacaoProduto2SVAL_BASE_CALCULO: TFloatField
      FieldName = 'SVAL_BASE_CALCULO'
    end
  end
  object QRVendaClienteOP: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_FILIAL,'
      '  COD_CADASTRO,'
      '  NOME,'
      '  TIPO,'
      '  CODIGO,'
      '  DESCRICAO,'
      '  FABRICANTE,'
      '  IND_ENTRADA_SAIDA,'
      '  SUM(QT_QUANTIDADE) AS QT_QUANTIDADE,'
      '  SUM(SVAL_BASE_CALCULO) AS SVAL_BASE_CALCULO,'
      '  SUM(SVAL_TOTAL)AS SVAL_TOTAL'
      'FROM ('
      'SELECT'
      '     TB_NOTA_CAB.COD_FILIAL,'
      '     TB_NOTA_CAB.COD_CADASTRO,'
      '     TB_CADASTRO.NOME,'
      '     '#39'OPERACOES'#39' AS TIPO,'
      '     TB_NOTA_CAB.COD_OPERACAO AS CODIGO,'
      '     TB_OPERACAO.DESC_OPERACAO AS DESCRICAO,'
      
        '     CAST(TB_NOTA_CAB.COD_OPERACAO AS VARCHAR2(21 BYTE)) AS FABR' +
        'ICANTE,'
      
        '     DECODE(TB_NOTA_CAB.IND_ENTRADA_SAIDA,'#39'E'#39','#39'ENTRADA'#39','#39'SAIDA'#39')' +
        ' AS IND_ENTRADA_SAIDA,'
      '     SUM(TB_NOTA_ITEM.QT_QUANTIDADE) AS QT_QUANTIDADE,'
      
        '     SUM(TB_NOTA_ITEM.VAL_TOTAL) - PEGA_DESCONTO_NOTA(TB_NOTA_CA' +
        'B.COD_NOTA_CAB) +'
      
        '      NVL(TB_NOTA_CAB.VAL_DESPESAS,0) + NVL(TB_NOTA_CAB.VAL_FRET' +
        'E,0) + NVL(TB_NOTA_CAB.VAL_TOTAL_IPI,0) + SUM(NVL(TB_NOTA_ITEM.V' +
        'AL_ICMS_SUBST,0)) AS SVAL_TOTAL,'
      
        '    SUM(TB_NOTA_ITEM.VAL_TOTAL) - PEGA_DESCONTO_NOTA(TB_NOTA_CAB' +
        '.COD_NOTA_CAB) + NVL(TB_NOTA_CAB.VAL_DESPESAS,0) AS SVAL_BASE_CA' +
        'LCULO'
      '    FROM '
      '     TB_NOTA_CAB '
      
        '    INNER JOIN TB_NOTA_ITEM ON TB_NOTA_CAB.COD_NOTA_CAB = TB_NOT' +
        'A_ITEM.COD_NOTA_CAB'
      
        '    INNER JOIN TB_OPERACAO  ON TB_NOTA_CAB.COD_OPERACAO = TB_OPE' +
        'RACAO.COD_OPERACAO'
      
        '    INNER JOIN TB_CADASTRO  ON TB_NOTA_CAB.COD_CADASTRO = TB_CAD' +
        'ASTRO.COD_CADASTRO'
      '  AND'
      '    TB_NOTA_CAB.IND_SITUACAO = 2'
      '  AND'
      '  (:COD_FILIAL IS NULL'
      '   OR TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      '  AND'
      '  (:COD_CADASTRO IS NULL'
      '   OR TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO)'
      '  AND'
      '    (TB_NOTA_CAB.IND_ENTRADA_SAIDA = :IND_ENTRADA_SAIDA)'
      '  AND'
      '    (TB_NOTA_CAB.DT_EMISSAO >= :DATA_I) '
      '  AND'
      '    (TB_NOTA_CAB.DT_EMISSAO <= :DATA_F) '
      '  GROUP BY '
      '   TB_NOTA_CAB.COD_FILIAL, '
      '   TB_NOTA_CAB.COD_CADASTRO, '
      '   TB_CADASTRO.NOME, '
      '   '#39'OPERACOES'#39', '
      '   TB_NOTA_CAB.COD_OPERACAO, '
      '   TB_OPERACAO.DESC_OPERACAO,'
      '   DECODE(TB_NOTA_CAB.IND_ENTRADA_SAIDA,'#39'E'#39','#39'ENTRADA'#39','#39'SAIDA'#39'),'
      '   TB_NOTA_CAB.COD_NOTA_CAB,'
      '   TB_NOTA_CAB.VAL_DESPESAS,'
      '   TB_NOTA_CAB.VAL_FRETE,'
      '   TB_NOTA_CAB.VAL_TOTAL_IPI'
      ' '
      'UNION ALL'
      ' '
      '  SELECT'
      '     TB_NOTA_CAB.COD_FILIAL,'
      '     TB_NOTA_CAB.COD_CADASTRO,'
      '     TB_CADASTRO.NOME,'
      '     '#39'PRODUTOS'#39' AS TIPO,'
      '     TB_NOTA_ITEM.COD_PRODUTO AS CODIGO,'
      '     TB_PRODUTO.DESC_PRODUTO AS DESCRICAO,'
      '     TB_PRODUTO.NUM_FABRICANTE AS FABRICANTE,'
      
        '     DECODE(TB_NOTA_CAB.IND_ENTRADA_SAIDA,'#39'E'#39','#39'ENTRADA'#39','#39'SAIDA'#39')' +
        ' AS IND_ENTRADA_SAIDA,'
      '    SUM(TB_NOTA_ITEM.QT_QUANTIDADE) AS QT_QUANTIDADE,'
      
        '    SUM(TB_NOTA_ITEM.VAL_TOTAL) - PEGA_DESCONTO_ITEM(TB_NOTA_ITE' +
        'M.COD_NOTA_ITEM) + '
      
        '      NVL(TB_NOTA_ITEM.VAL_DESPESAS,0) + NVL(TB_NOTA_ITEM.VAL_FR' +
        'ETE,0) + NVL(TB_NOTA_ITEM.VAL_IPI,0) + NVL(TB_NOTA_ITEM.VAL_ICMS' +
        '_SUBST,0) AS SVAL_TOTAL,'
      
        '     SUM(TB_NOTA_ITEM.VAL_TOTAL) - PEGA_DESCONTO_ITEM(TB_NOTA_IT' +
        'EM.COD_NOTA_ITEM)+ NVL(TB_NOTA_ITEM.VAL_DESPESAS,0) AS SVAL_BASE' +
        '_CALCULO'
      '    FROM '
      '     TB_NOTA_CAB '
      
        '    INNER JOIN TB_NOTA_ITEM ON TB_NOTA_CAB.COD_NOTA_CAB = TB_NOT' +
        'A_ITEM.COD_NOTA_CAB'
      
        '    INNER JOIN TB_PRODUTO  ON TB_NOTA_ITEM.COD_PRODUTO = TB_PROD' +
        'UTO.COD_PRODUTO'
      
        '    INNER JOIN TB_CADASTRO ON TB_NOTA_CAB.COD_CADASTRO = TB_CADA' +
        'STRO.COD_CADASTRO'
      '  AND'
      '    TB_NOTA_CAB.IND_SITUACAO = 2'
      '  AND'
      '  (:COD_FILIAL IS NULL'
      '   OR TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      '  AND'
      '  (:COD_CADASTRO IS NULL'
      '   OR TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO)'
      '  AND'
      '  (TB_NOTA_CAB.IND_ENTRADA_SAIDA = :IND_ENTRADA_SAIDA)'
      '  AND'
      '    (TB_NOTA_CAB.DT_EMISSAO >= :DATA_I)'
      '  AND'
      '    (TB_NOTA_CAB.DT_EMISSAO <= :DATA_F) '
      ' GROUP BY '
      ' TB_NOTA_CAB.COD_FILIAL, '
      ' TB_NOTA_CAB.COD_CADASTRO, '
      ' TB_CADASTRO.NOME, '
      ' TB_NOTA_ITEM.COD_PRODUTO, '
      ' TB_PRODUTO.DESC_PRODUTO,'
      ' TB_PRODUTO.NUM_FABRICANTE,'
      ' DECODE(TB_NOTA_CAB.IND_ENTRADA_SAIDA,'#39'E'#39','#39'ENTRADA'#39','#39'SAIDA'#39'),'
      ' TB_NOTA_ITEM.COD_NOTA_ITEM,'
      ' TB_NOTA_ITEM.VAL_DESPESAS,'
      ' TB_NOTA_ITEM.VAL_FRETE,'
      ' TB_NOTA_ITEM.VAL_IPI,'
      ' TB_NOTA_ITEM.VAL_ICMS_SUBST'
      ') '
      'GROUP BY'
      '  COD_FILIAL,'
      '  COD_CADASTRO,'
      '  TIPO,'
      '  NOME, '
      '  CODIGO, '
      '  DESCRICAO,'
      '  FABRICANTE,'
      '  IND_ENTRADA_SAIDA'
      'ORDER BY'
      '  COD_CADASTRO,'
      '  COD_FILIAL,'
      '  TIPO,'
      '  CODIGO,'
      '  FABRICANTE')
    Variables.Data = {
      03000000050000000B0000003A434F445F46494C49414C030000000000000000
      0000000D0000003A434F445F434144415354524F030000000000000000000000
      070000003A444154415F490C0000000000000000000000070000003A44415441
      5F460C0000000000000000000000120000003A494E445F454E54524144415F53
      41494441050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B0000000A000000434F445F46494C49414C0100000000000C000000
      434F445F434144415354524F010000000000040000004E4F4D45010000000000
      0A0000005356414C5F544F54414C0100000000000D00000051545F5155414E54
      4944414445010000000000040000005449504F01000000000006000000434F44
      49474F0100000000000900000044455343524943414F01000000000011000000
      494E445F454E54524144415F5341494441010000000000110000005356414C5F
      424153455F43414C43554C4F0100000000000A000000464142524943414E5445
      010000000000}
    Session = DMOracle.DBCemapa
    Left = 778
    Top = 417
    object QRVendaClienteOPCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QRVendaClienteOPCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object QRVendaClienteOPNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QRVendaClienteOPTIPO: TStringField
      FieldName = 'TIPO'
      Size = 9
    end
    object QRVendaClienteOPCODIGO: TFloatField
      FieldName = 'CODIGO'
    end
    object QRVendaClienteOPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object QRVendaClienteOPQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QRVendaClienteOPSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRVendaClienteOPIND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 7
    end
    object QRVendaClienteOPSVAL_BASE_CALCULO: TFloatField
      FieldName = 'SVAL_BASE_CALCULO'
    end
    object QRVendaClienteOPFABRICANTE: TStringField
      FieldName = 'FABRICANTE'
      Size = 21
    end
  end
  object QRNotasNaoAutorizadas: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  N.COD_NOTA_CAB,'
      '  N.DT_EMISSAO, '
      '  N.COD_FILIAL, '
      '  N.COD_CADASTRO,'
      '  N.NUM_NOTA, '
      '  C.NOME,'
      
        '  decode(n.ind_entrada_saida,'#39'E'#39','#39'ENTRADA'#39','#39'SA'#205'DA'#39') AS ENTRADA_S' +
        'AIDA'
      'FROM '
      '  TB_NOTA_CAB N, '
      '  TB_NF_ELETRONICA E, '
      '  TB_CADASTRO C'
      'WHERE N.COD_NOTA_CAB = E.COD_NOTA_CAB'
      'AND N.COD_CADASTRO = C.COD_CADASTRO'
      
        'AND ((E.DESC_RETORNO_PROCESSAMENTO IS NULL) OR (E.DESC_RETORNO_P' +
        'ROCESSAMENTO <> 100))'
      'AND (:DATA_I IS NULL OR N.DT_EMISSAO >= :DATA_I)'
      'AND (:DATA_F IS NULL OR N.DT_EMISSAO <= :DATA_F)'
      'AND (:CADASTRO IS NULL OR N.COD_CADASTRO = :CADASTRO)'
      'AND (:FILIAL IS NULL OR N.COD_FILIAL = :FILIAL) '
      'AND N.IND_SITUACAO = 2'
      'ORDER BY N.DT_EMISSAO, N.NUM_NOTA')
    Variables.Data = {
      0300000004000000070000003A444154415F4905000000000000000000000007
      0000003A444154415F46050000000000000000000000090000003A4341444153
      54524F050000000000000000000000070000003A46494C49414C050000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000C000000434F445F4E4F54415F4341420100000000000A00
      000044545F454D495353414F0100000000000A000000434F445F46494C49414C
      0100000000000C000000434F445F434144415354524F01000000000008000000
      4E554D5F4E4F5441010000000000040000004E4F4D450100000000000D000000
      454E54524144415F5341494441010000000000}
    Session = DMOracle.DBCemapa
    Left = 792
    Top = 480
    object QRNotasNaoAutorizadasDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRNotasNaoAutorizadasCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRNotasNaoAutorizadasNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRNotasNaoAutorizadasNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QRNotasNaoAutorizadasENTRADA_SAIDA: TStringField
      FieldName = 'ENTRADA_SAIDA'
      Size = 7
    end
  end
  object QRResumoNotas: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_NOTA_CAB,'
      '  DT_EMISSAO, '
      '  COD_FILIAL, '
      '  COD_CADASTRO,'
      '  NUM_NOTA,'
      '  COD_SERIE,'
      '  COD_SERIE_MODELO,'
      '  IND_SITUACAO,'
      '  IND_AMBIENTE_NFE,'
      '  NOME,'
      '  DESC_RETORNO_PROCESSAMENTO,'
      '  DESC_CHAVE_ACESSO,'
      '  ENTRADA_SAIDA'
      'FROM '
      '('
      'SELECT '
      '  1 AS ORDENACAO,'
      '  N.COD_NOTA_CAB,'
      '  N.DT_EMISSAO, '
      '  N.COD_FILIAL, '
      '  N.COD_CADASTRO,'
      '  TO_CHAR(N.NUM_NOTA) AS NUM_NOTA,'
      '  N.COD_SERIE,'
      '  N.COD_SERIE_MODELO,'
      '  CASE '
      '    WHEN N.IND_SITUACAO = 1 THEN'
      '      '#39'DIGITADA'#39
      '    WHEN N.IND_SITUACAO = 2 THEN'
      '      '#39'CONFIRMADA'#39
      '    WHEN N.IND_SITUACAO = 3 THEN'
      '      '#39'CANCELADA'#39
      '    ELSE'
      '      '#39'DENEGADA'#39
      '  END AS IND_SITUACAO,'
      
        '  DECODE(N.IND_AMBIENTE_NFE,1,'#39'PRODU'#199#195'O'#39','#39'HOMOLOGA'#199#195'O'#39') AS IND_A' +
        'MBIENTE_NFE,'
      '  C.NOME,'
      '  CASE '
      '  WHEN DESC_RETORNO_CANCELAMENTO = '#39'101'#39' THEN'
      '    '#39'CANCELADA'#39
      
        '  WHEN DESC_RETORNO_PROCESSAMENTO = '#39'110'#39' OR DESC_RETORNO_PROCES' +
        'SAMENTO = '#39'301'#39' OR DESC_RETORNO_PROCESSAMENTO = '#39'302'#39' THEN'
      '    '#39'DENEGADA'#39
      
        '  WHEN DESC_RETORNO_PROCESSAMENTO = '#39'100'#39' OR DESC_RETORNO_PROCES' +
        'SAMENTO = '#39'150'#39' AND (DESC_RETORNO_CANCELAMENTO IS NULL OR DESC_R' +
        'ETORNO_CANCELAMENTO <> '#39'101'#39') THEN'
      '    '#39'AUTORIZADA'#39
      '  END AS DESC_RETORNO_PROCESSAMENTO,'
      '  E.DESC_CHAVE_ACESSO,'
      
        '  decode(n.ind_entrada_saida,'#39'E'#39','#39'ENTRADA'#39','#39'SA'#205'DA'#39') AS ENTRADA_S' +
        'AIDA'
      'FROM '
      '  TB_NOTA_CAB N, '
      '  TB_NF_ELETRONICA E, '
      '  TB_CADASTRO C'
      'WHERE '
      '   N.COD_NOTA_CAB = E.COD_NOTA_CAB'
      'AND '
      '  N.COD_CADASTRO = C.COD_CADASTRO'
      'AND '
      
        '  ((E.DESC_RETORNO_PROCESSAMENTO = 100) OR (E.DESC_RETORNO_PROCE' +
        'SSAMENTO = 101) OR'
      
        '   (E.DESC_RETORNO_PROCESSAMENTO = 110) OR (E.DESC_RETORNO_PROCE' +
        'SSAMENTO = 301) OR'
      
        '   (E.DESC_RETORNO_PROCESSAMENTO = 302) OR (E.DESC_RETORNO_PROCE' +
        'SSAMENTO = 150) )'
      'AND '
      '  (:DATA_I IS NULL OR N.DT_EMISSAO >= :DATA_I)'
      'AND '
      '  (:DATA_F IS NULL OR N.DT_EMISSAO <= :DATA_F)'
      'AND'
      '  :OPERACAO'
      'AND'
      '  :SERIE'
      'AND'
      '  (:COD_SERIE_MODELO IS NULL'
      '    OR COD_SERIE_MODELO = :COD_SERIE_MODELO)'
      'AND'
      '  (:IND_ENTRADA_SAIDA IS NULL'
      '     OR N.IND_ENTRADA_SAIDA = :IND_ENTRADA_SAIDA)'
      'AND '
      '  (:FILIAL IS NULL OR N.COD_FILIAL = :FILIAL) '
      ''
      'UNION ALL'
      ''
      'SELECT '
      '  2 AS ORDENACAO,'
      '  N.COD_NOTA_CAB,'
      '  N.DT_EMISSAO, '
      '  N.COD_FILIAL, '
      '  N.COD_CADASTRO,'
      '  TO_CHAR(N.NUM_NOTA) AS NUM_NOTA,'
      '  N.COD_SERIE,'
      '  N.COD_SERIE_MODELO,'
      ' CASE '
      '    WHEN N.IND_SITUACAO = 1 THEN'
      '      '#39'DIGITADA'#39
      '    WHEN N.IND_SITUACAO = 2 THEN'
      '      '#39'CONFIRMADA'#39
      '    WHEN N.IND_SITUACAO = 3 THEN'
      '      '#39'CANCELADA'#39
      '    ELSE'
      '      '#39'DENEGADA'#39
      '  END AS IND_SITUACAO,'
      
        '  DECODE(N.IND_AMBIENTE_NFE,1,'#39'PRODU'#199#195'O'#39','#39'HOMOLOGA'#199#195'O'#39') AS IND_A' +
        'MBIENTE_NFE,'
      '  C.NOME,'
      '  '#39'N'#195'O AUTORIZADA'#39' AS DESC_RETORNO_PROCESSAMENTO,'
      '  E.DESC_CHAVE_ACESSO,'
      
        '  decode(n.ind_entrada_saida,'#39'E'#39','#39'ENTRADA'#39','#39'SA'#205'DA'#39') AS ENTRADA_S' +
        'AIDA'
      'FROM '
      '  TB_NOTA_CAB N, '
      '  TB_NF_ELETRONICA E, '
      '  TB_CADASTRO C'
      'WHERE '
      '   N.COD_NOTA_CAB = E.COD_NOTA_CAB(+)'
      'AND '
      '  N.COD_CADASTRO = C.COD_CADASTRO'
      'AND'
      '  ((N.COD_SERIE_MODELO = '#39'55'#39') OR (N.COD_SERIE_MODELO = '#39'65'#39'))'
      'AND '
      
        '  ((E.DESC_RETORNO_PROCESSAMENTO IS NULL) OR (E.DESC_RETORNO_PRO' +
        'CESSAMENTO <> 100) AND '
      
        '   (E.DESC_RETORNO_PROCESSAMENTO <> 110) AND (E.DESC_RETORNO_PRO' +
        'CESSAMENTO <> 301) AND '
      
        '   (E.DESC_RETORNO_PROCESSAMENTO <> 302) AND (E.DESC_RETORNO_PRO' +
        'CESSAMENTO <> 150) )'
      'AND '
      '  (:DATA_I IS NULL OR N.DT_EMISSAO >= :DATA_I)'
      'AND '
      '  (:DATA_F IS NULL OR N.DT_EMISSAO <= :DATA_F)'
      'AND'
      '   :OPERACAO'
      'AND'
      '   :SERIE'
      'AND'
      '  (:COD_SERIE_MODELO IS NULL'
      '    OR N.COD_SERIE_MODELO = :COD_SERIE_MODELO)'
      'AND'
      '  (:IND_ENTRADA_SAIDA IS NULL'
      '     OR N.IND_ENTRADA_SAIDA = :IND_ENTRADA_SAIDA)'
      'AND'
      '  (:FILIAL IS NULL OR N.COD_FILIAL = :FILIAL) '
      ''
      'UNION ALL'
      ''
      'SELECT '
      '  2 AS ORDENACAO,'
      '  0 AS COD_NOTA_CAB,'
      '  DT_INUTILIZACAO AS DT_EMISSAO, '
      '  COD_FILIAL, '
      '  0 AS COD_CADASTRO,'
      '  CASE '
      '    WHEN NUM_INICIAL = NUM_FINAL THEN'
      '      TO_CHAR(NUM_INICIAL)'
      '    ELSE'
      '      NUM_INICIAL || '#39' - '#39' || NUM_FINAL'
      '  END AS NUM_NOTA,'
      '  COD_SERIE,'
      '  TO_CHAR(COD_SERIE_MODELO),'
      '  '#39#39' AS IND_SITUACAO,'
      
        '  DECODE(IND_AMBIENTE,1,'#39'PRODU'#199#195'O'#39','#39'HOMOLOGA'#199#195'O'#39') AS IND_AMBIENT' +
        'E_NFE,'
      '  '#39#39' AS NOME,'
      '  '#39'INUTILIZADA'#39' AS DESC_RETORNO_PROCESSAMENTO,'
      '  DESC_PROTOCOLO AS DESC_CHAVE_ACESSO,'
      '  '#39' '#39' AS ENTRADA_SAIDA '
      'FROM TB_NF_ELETRONICA_INUT'
      'WHERE'
      ' (DESC_STATUS = 102 AND DESC_PROTOCOLO IS NOT NULL)'
      'AND '
      '  (:DATA_I IS NULL OR DT_INUTILIZACAO >= :DATA_I)'
      'AND '
      '  (:DATA_F IS NULL OR DT_INUTILIZACAO <= :DATA_F)'
      'AND'
      '  :SERIE'
      'AND'
      '  (:COD_SERIE_MODELO IS NULL'
      '    OR COD_SERIE_MODELO = :COD_SERIE_MODELO)'
      'AND'
      '  (:FILIAL IS NULL OR COD_FILIAL = :FILIAL) '
      ')'
      'WHERE'
      '  (:DESC_RETORNO IS NULL OR'
      '    DESC_RETORNO_PROCESSAMENTO = :DESC_RETORNO)'
      'ORDER BY'
      'ORDENACAO,'
      'DT_EMISSAO,'
      'COD_SERIE_MODELO,'
      'NUM_NOTA')
    Variables.Data = {
      0300000008000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000070000003A46494C4941
      4C030000000000000000000000090000003A4F5045524143414F010000000000
      000000000000120000003A494E445F454E54524144415F534149444105000000
      0000000000000000060000003A53455249450100000000000000000000001100
      00003A434F445F53455249455F4D4F44454C4F0500000000000000000000000D
      0000003A444553435F5245544F524E4F050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000D0000000C000000434F445F4E4F54415F4341420100000000000A00
      000044545F454D495353414F0100000000000A000000434F445F46494C49414C
      0100000000000C000000434F445F434144415354524F01000000000008000000
      4E554D5F4E4F544101000000000009000000434F445F53455249450100000000
      0010000000434F445F53455249455F4D4F44454C4F0100000000000C00000049
      4E445F534954554143414F01000000000010000000494E445F414D4249454E54
      455F4E4645010000000000040000004E4F4D450100000000001A000000444553
      435F5245544F524E4F5F50524F43455353414D454E544F010000000000110000
      00444553435F43484156455F41434553534F0100000000000D000000454E5452
      4144415F5341494441010000000000}
    Session = DMOracle.DBCemapa
    Left = 792
    Top = 532
    object QRResumoNotasCOD_NOTA_CAB: TFloatField
      FieldName = 'COD_NOTA_CAB'
    end
    object QRResumoNotasDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QRResumoNotasCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QRResumoNotasCOD_CADASTRO: TFloatField
      FieldName = 'COD_CADASTRO'
    end
    object QRResumoNotasNUM_NOTA: TStringField
      FieldName = 'NUM_NOTA'
      Size = 83
    end
    object QRResumoNotasCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Size = 3
    end
    object QRResumoNotasCOD_SERIE_MODELO: TStringField
      FieldName = 'COD_SERIE_MODELO'
      Size = 40
    end
    object QRResumoNotasNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QRResumoNotasDESC_RETORNO_PROCESSAMENTO: TStringField
      FieldName = 'DESC_RETORNO_PROCESSAMENTO'
      Size = 14
    end
    object QRResumoNotasDESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Size = 44
    end
    object QRResumoNotasENTRADA_SAIDA: TStringField
      FieldName = 'ENTRADA_SAIDA'
      Size = 7
    end
    object QRResumoNotasIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 10
    end
    object QRResumoNotasIND_AMBIENTE_NFE: TStringField
      FieldName = 'IND_AMBIENTE_NFE'
      Size = 11
    end
  end
  object QRVendaProduto_Lote: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '   Tb_produto.COD_PRODUTO,'
      '   Tb_produto.DESC_PRODUTO,'
      '   Tb_produto.NUM_FABRICANTE,'
      '   TB_LOTE_TIPO.DESC_LOTE,'
      
        '   SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.QT_QUANTID' +
        'ADE * Tb_produto.VAL_VAREJO,(Tb_nota_item.QT_QUANTIDADE * Tb_pro' +
        'duto.VAL_VAREJO) * -1)) AS SVAL_TABELA,'
      
        '   SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.QT_QUANTID' +
        'ADE,Tb_nota_item.QT_QUANTIDADE*-1)) AS SQT_QUANTIDADE,'
      
        '   SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.VAL_TOTAL ' +
        '- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.' +
        'VAL_DESPESAS + Tb_nota_item.VAL_FRETE+TB_NOTA_ITEM.VAL_ICMS_SUBS' +
        'T,'
      
        '             (Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOT' +
        'A_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + Tb_nota_item' +
        '.VAL_FRETE+TB_NOTA_ITEM.VAL_ICMS_SUBST) * -1)) AS SVAL_TOTAL'
      'FROM'
      '   TB_CADASTRO,'
      '   TB_NOTA_CAB,'
      '   TB_NOTA_ITEM,'
      '   TB_PRODUTO,'
      '   TB_OPERACAO,'
      '   TB_CLASSE,'
      '   TB_LOTE_TIPO'
      'WHERE'
      '   TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '   AND'
      '   Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '   AND'
      '   TB_CADASTRO.COD_CADASTRO = Tb_nota_cab.COD_CADASTRO'
      '   AND'
      '   Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '   AND'
      '   Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '   AND'
      '   TB_NOTA_ITEM.COD_LOTE_TIPO = TB_LOTE_TIPO.COD_LOTE_TIPO'
      '   AND'
      
        '   (TB_OPERACAO.IND_VENDAS = '#39'V'#39' OR TB_OPERACAO.IND_VENDAS = '#39'D'#39 +
        ')'
      '   AND'
      '   TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '   AND'
      '   (:COD_FILIAL IS NULL'
      '   OR'
      '    :COD_FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '   AND'
      '   (:COD_CADASTRO IS NULL'
      '    OR'
      '    TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO)'
      '   AND'
      '   (:COD_CLASSE IS NULL'
      '   OR'
      '    :COD_CLASSE = TB_CLASSE.NUM_CLASSE)'
      '   AND'
      '   (:COD_SUB_CLASSE IS NULL'
      '   OR'
      '    :COD_SUB_CLASSE = TB_CLASSE.NUM_SUBCLASSE)'
      '   AND'
      '   (:COD_VENDEDOR IS NULL'
      '    OR'
      '    TB_NOTA_CAB.COD_VENDEDOR = :COD_VENDEDOR)'
      '   AND'
      '   (:COD_CIDADE IS NULL'
      '    OR'
      '     TB_CADASTRO.COD_CIDADE = :COD_CIDADE)'
      '   AND'
      '   (:COD_ESTADO IS NULL'
      '    OR'
      '    TB_CADASTRO.COD_ESTADO = :COD_ESTADO)'
      '   AND'
      '   TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '   AND'
      '   TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      'GROUP BY'
      '   Tb_produto.COD_PRODUTO,'
      '   Tb_produto.DESC_PRODUTO,'
      '   Tb_produto.NUM_FABRICANTE,'
      '   TB_LOTE_TIPO.DESC_LOTE'
      'ORDER BY'
      '   Tb_produto.COD_PRODUTO,'
      '   Tb_produto.DESC_PRODUTO,'
      '   TB_LOTE_TIPO.DESC_LOTE,'
      '   Tb_produto.NUM_FABRICANTE'
      ''
      '')
    Variables.Data = {
      0300000009000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C00000000000000000000000B0000003A434F445F46
      494C49414C0500000000000000000000000B0000003A434F445F434C41535345
      0300000000000000000000000F0000003A434F445F5355425F434C4153534503
      00000000000000000000000D0000003A434F445F56454E4445444F5203000000
      00000000000000000B0000003A434F445F434944414445030000000000000000
      0000000B0000003A434F445F45535441444F0500000000000000000000000D00
      00003A434F445F434144415354524F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000B000000434F445F50524F4455544F0100000000000C0000
      00444553435F50524F4455544F0100000000000B0000005356414C5F54414245
      4C410100000000000E0000005351545F5155414E544944414445010000000000
      0A0000005356414C5F544F54414C0100000000000E0000004E554D5F46414252
      4943414E544501000000000009000000444553435F4C4F5445010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRVendaClasseCalcFields
    Left = 40
    Top = 544
    object QRVendaProduto_LoteCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRVendaProduto_LoteDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QRVendaProduto_LoteNUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
      Size = 21
    end
    object QRVendaProduto_LoteDESC_LOTE: TStringField
      FieldName = 'DESC_LOTE'
      Size = 50
    end
    object QRVendaProduto_LoteSVAL_TABELA: TFloatField
      FieldName = 'SVAL_TABELA'
    end
    object QRVendaProduto_LoteSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRVendaProduto_LoteSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
  end
  object QRelacaoItens: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_NOTA_ITEM.COD_PRODUTO,'
      '  TB_NOTA_ITEM.QT_QUANTIDADE,'
      '  TB_NOTA_ITEM.VAL_UNITARIO,'
      '  TB_NOTA_ITEM.DESC_INF_ADICIONAL,'
      
        '  DECODE(TB_PARAM_SISTEMA.COD_EMPRESA,'#39'CONTINTAS'#39', TB_PRODUTO.DE' +
        'SC_PRODUTO || '#39'-'#39'|| TB_NOTA_ITEM.DESC_INF_ADICIONAL, TB_PRODUTO.' +
        'DESC_PRODUTO) AS DESC_PRODUTO,'
      '  TB_NOTA_ITEM.VAL_TOTAL,'
      '  TB_LOTE_TIPO.DESC_LOTE'
      'FROM'
      '  TB_NOTA_ITEM,'
      '  TB_NOTA_CAB,'
      '  TB_PRODUTO,'
      '  TB_LOTE_TIPO,'
      '  TB_PARAM_SISTEMA'
      'WHERE'
      '  TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB'
      '  AND'
      '  TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_NOTA_ITEM.COD_LOTE_TIPO = TB_LOTE_TIPO.COD_LOTE_TIPO'
      '  AND'
      '  (:COD_TRIBUTACAO IS NULL'
      '    OR'
      '    TB_NOTA_ITEM.COD_TRIBUTACAO = :COD_TRIBUTACAO)'
      '  And'
      '  (:COD_LOTE_TIPO IS NULL'
      '    OR'
      '    TB_NOTA_ITEM.COD_LOTE_TIPO = :COD_LOTE_TIPO)'
      '  And'
      '  (:COD_PRODUTO IS NULL'
      '    OR'
      '     TB_NOTA_ITEM.COD_PRODUTO = :COD_PRODUTO)'
      '  and'
      '  TB_NOTA_CAB.cod_nota_cab = :cod_nota_cab')
    Variables.Data = {
      03000000040000000D0000003A434F445F4E4F54415F43414203000000000000
      00000000000F0000003A434F445F5452494255544143414F0300000000000000
      000000000E0000003A434F445F4C4F54455F5449504F03000000000000000000
      00000C0000003A434F445F50524F4455544F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000B000000434F445F50524F4455544F0100000000000D0000
      0051545F5155414E5449444144450100000000000C00000056414C5F554E4954
      4152494F0100000000000C000000444553435F50524F4455544F010000000000
      0900000056414C5F544F54414C01000000000012000000444553435F494E465F
      41444943494F4E414C01000000000009000000444553435F4C4F544501000000
      0000}
    Master = QRelacao
    MasterFields = 'COD_NOTA_CAB'
    DetailFields = 'COD_NOTA_CAB'
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QConferenciaCalcFields
    Left = 681
    Top = 130
    object QRelacaoItensCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRelacaoItensQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object QRelacaoItensVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
    end
    object QRelacaoItensDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QRelacaoItensVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
      Required = True
    end
    object QRelacaoItensDESC_INF_ADICIONAL: TStringField
      FieldName = 'DESC_INF_ADICIONAL'
      Size = 500
    end
    object QRelacaoItensDESC_LOTE: TStringField
      FieldName = 'DESC_LOTE'
      Size = 50
    end
  end
  object QREtiquetaZebra: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_NOTA_CAB.NUM_NOTA,'
      '  TB_NOTA_CAB.COD_CADASTRO,'
      '  TB_NOTA_CAB.NUM_VOLUMES,'
      '  TB_CADASTRO.NOME,'
      '  TB_CIDADE.DESC_CIDADE,'
      '  TB_FILIAL.DESC_FILIAL,'
      '  TB_NOTA_ITEM.COD_PRODUTO,'
      '  TB_NOTA_ITEM.QT_QUANTIDADE,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_CADASTRO.DESC_TELEFONE'
      'FROM'
      '  TB_NOTA_ITEM,'
      '  TB_NOTA_CAB,'
      '  TB_PRODUTO,'
      '  TB_CADASTRO,'
      '  TB_CIDADE,'
      '  TB_FILIAL'
      'WHERE'
      '  (TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB)'
      '  AND'
      '  (TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO)'
      '  AND'
      '  (TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO)'
      '  AND'
      '  (TB_CADASTRO.COD_CIDADE = TB_CIDADE.COD_CIDADE)'
      '  AND'
      '  (TB_NOTA_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL)'
      '  AND'
      '  (TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39')'
      '  AND'
      '  (TB_NOTA_CAB.IND_SITUACAO = 2)'
      '  AND'
      '  TB_NOTA_CAB.COD_NOTA_CAB >= :COD_NOTA_CAB')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000B000000444553435F46494C49414C010000000000080000
      004E554D5F4E4F54410100000000000C000000434F445F434144415354524F01
      00000000000B0000004E554D5F564F4C554D4553010000000000040000004E4F
      4D450100000000000B000000444553435F4349444144450100000000000B0000
      00434F445F50524F4455544F0100000000000D00000051545F5155414E544944
      4144450100000000000C000000444553435F50524F4455544F0100000000000D
      000000444553435F54454C45464F4E45010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 1016
    Top = 476
    object QREtiquetaZebraNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QREtiquetaZebraCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QREtiquetaZebraNUM_VOLUMES: TIntegerField
      FieldName = 'NUM_VOLUMES'
    end
    object QREtiquetaZebraNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QREtiquetaZebraDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Required = True
      Size = 50
    end
    object QREtiquetaZebraDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QREtiquetaZebraCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QREtiquetaZebraQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object QREtiquetaZebraDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QREtiquetaZebraDESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 15
    end
  end
  object QRComissaoRoyalties: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_PRODUTO.NUM_FABRICANTE AS COD_OBRA,'
      '  TB_VENDEDOR.COD_VENDEDOR,'
      '  TB_VENDEDOR.NOME AS NOME_VENDEDOR,'
      '  TB_FILIAL.COD_FILIAL,'
      '  TB_FILIAL.DESC_FILIAL,'
      '  TB_PRODUTO.COD_PRODUTO,'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      '  TB_NOTA_CAB.NUM_NOTA,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',TB_NOTA_ITEM.QT_QUANTIDA' +
        'DE,'
      
        '                                        TB_NOTA_ITEM.QT_QUANTIDA' +
        'DE*-1)) AS SQT_QUANTIDADE,'
      
        '  SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',TB_NOTA_ITEM.VAL_TOTAL -' +
        ' nvl(PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM),0) ,'
      
        '                                        (TB_NOTA_ITEM.VAL_TOTAL-' +
        ' nvl(PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM),0) )*-1)) AS' +
        ' SVAL_TOTAL,'
      '  TB_CADASTRO.COD_CADASTRO AS COD_ROYALTIES,'
      '  TB_CADASTRO.NOME AS NOME_ROYALTIES,'
      '  NVL(TB_CADASTRO.PERC_ROYALTIES,0) AS PERC_ROYALTIES'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_OPERACAO,'
      '  TB_PRODUTO,'
      '  TB_FILIAL,'
      '  TB_VENDEDOR,'
      '  TB_CADASTRO'
      'WHERE'
      '  TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '  AND'
      '  TB_NOTA_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      '  AND'
      '  TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '  AND'
      '  TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB'
      '  AND'
      '  TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '  TB_PRODUTO.COD_ROYALTIES = TB_CADASTRO.COD_CADASTRO(+)'
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '  AND'
      
        '  ((TB_OPERACAO.IND_VENDAS = '#39'V'#39') OR (TB_OPERACAO.IND_VENDAS = '#39 +
        'D'#39'))'
      '  AND'
      '  (:VENDEDOR IS NULL OR'
      '    TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '  AND'
      '  (:FILIAL IS NULL OR'
      '    TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '  AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '  AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      '  AND'
      '  (:IND_CONDICAO_PAGTO IS NULL'
      '  OR'
      '  TB_NOTA_CAB.IND_CONDICAO_PAGTO = :IND_CONDICAO_PAGTO)'
      '  AND'
      '  (:COD_ROYALTIES IS NULL'
      '  OR'
      '  TB_CADASTRO.COD_CADASTRO = :COD_ROYALTIES)'
      'GROUP BY'
      '  TB_FILIAL.COD_FILIAL,'
      '  TB_PRODUTO.NUM_FABRICANTE,'
      '  TB_CADASTRO.COD_CADASTRO,'
      '  TB_VENDEDOR.COD_VENDEDOR,'
      '  TB_PRODUTO.COD_PRODUTO,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      '  TB_NOTA_CAB.NUM_NOTA,'
      '  TB_VENDEDOR.NOME,'
      '  TB_FILIAL.DESC_FILIAL,'
      '  TB_CADASTRO.NOME,'
      '  NVL(TB_CADASTRO.PERC_ROYALTIES,0)'
      'ORDER BY'
      '  TB_CADASTRO.COD_CADASTRO,'
      '  TB_FILIAL.COD_FILIAL')
    Variables.Data = {
      0300000006000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C0000000000000000000000090000003A56454E4445
      444F52030000000000000000000000070000003A46494C49414C030000000000
      000000000000130000003A494E445F434F4E444943414F5F504147544F030000
      0000000000000000000E0000003A434F445F524F59414C544945530300000000
      00000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E0000000C000000444553435F50524F4455544F0100000000000C00
      0000434F445F56454E4445444F520100000000000D0000004E4F4D455F56454E
      4445444F520100000000000A000000434F445F46494C49414C0100000000000B
      000000444553435F46494C49414C0100000000000B000000434F445F50524F44
      55544F0100000000000E0000005351545F5155414E5449444144450100000000
      000A0000005356414C5F544F54414C0100000000000A00000044545F454D4953
      53414F010000000000080000004E554D5F4E4F54410100000000000E0000004E
      4F4D455F524F59414C544945530100000000000E000000504552435F524F5941
      4C544945530100000000000D000000434F445F524F59414C5449455301000000
      000008000000434F445F4F425241010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRComissaoRoyaltiesCalcFields
    Left = 1013
    Top = 88
    object QRComissaoRoyaltiesNOME_ROYALTIES: TStringField
      FieldName = 'NOME_ROYALTIES'
      Size = 60
    end
    object QRComissaoRoyaltiesPERC_ROYALTIES: TFloatField
      FieldName = 'PERC_ROYALTIES'
    end
    object QRComissaoRoyaltiesval_comissao: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_comissao'
      Calculated = True
    end
    object QRComissaoRoyaltiesSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object QRComissaoRoyaltiesDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QRComissaoRoyaltiesCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object QRComissaoRoyaltiesNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Required = True
      Size = 40
    end
    object QRComissaoRoyaltiesCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QRComissaoRoyaltiesDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRComissaoRoyaltiesCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRComissaoRoyaltiesDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRComissaoRoyaltiesSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRComissaoRoyaltiesCOD_ROYALTIES: TIntegerField
      FieldName = 'COD_ROYALTIES'
    end
    object QRComissaoRoyaltiesNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRComissaoRoyaltiesCOD_OBRA: TStringField
      FieldName = 'COD_OBRA'
      Size = 21
    end
  end
  object QRInformacaoVenda: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '    COD_PRODUTO,'
      '    NUM_FABRICANTE,'
      '    DESC_PRODUTO,'
      '    COD_CLASSE,'
      '    DESC_CLASSE,'
      '    DESC_MARCA,'
      '    SUM(QT_QUANTIDADE) AS SQT_SAIDA'
      'FROM('
      ''
      '-- NOTAS DE SA'#205'DA'
      'SELECT'
      '    P.COD_PRODUTO,'
      '    P.NUM_FABRICANTE,'
      '    P.DESC_PRODUTO,'
      '    C.COD_CLASSE,'
      '    C.DESC_CLASSE,'
      '    M.DESC_MARCA,'
      
        '    DECODE(N.IND_ENTRADA_SAIDA, '#39'S'#39', I.QT_QUANTIDADE, I.QT_QUANT' +
        'IDADE * -1) AS QT_QUANTIDADE,        '
      
        '    (I.VAL_TOTAL - PEGA_DESCONTO_ITEM(I.COD_NOTA_ITEM) +I.VAL_DE' +
        'SPESAS+I.VAL_FRETE+I.VAL_ICMS_SUBST + I.VAL_IPI) * DECODE(N.IND_' +
        'ENTRADA_SAIDA, '#39'S'#39', I.QT_QUANTIDADE, I.QT_QUANTIDADE * -1) AS VA' +
        'L_TOTAL'
      'FROM'
      '    TB_NOTA_CAB N'
      '        INNER JOIN TB_NOTA_ITEM I'
      '            ON N.COD_NOTA_CAB = I.COD_NOTA_CAB        '
      '        INNER JOIN TB_FILIAL F'
      '            ON N.COD_FILIAL = F.COD_FILIAL        '
      '        INNER JOIN TB_OPERACAO O'
      '            ON N.COD_OPERACAO = O.COD_OPERACAO'
      '        INNER JOIN TB_PRODUTO P'
      '            ON I.COD_PRODUTO = P.COD_PRODUTO'
      '        INNER JOIN TB_CLASSE C'
      '                ON P.COD_CLASSE = C.COD_CLASSE'
      '        LEFT JOIN TB_MARCA M'
      '                ON P.COD_MARCA = M.COD_MARCA'
      'WHERE'
      
        '    ((N.IND_ENTRADA_SAIDA = '#39'S'#39') OR (N.IND_ENTRADA_SAIDA = '#39'E'#39' A' +
        'ND O.IND_VENDAS = '#39'D'#39' AND O.IND_ESTOQUE = '#39'S'#39'))'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.DT_EMISSAO BETWEEN :DT_INI AND :DT_FIN    '
      '    AND'
      '    I.COD_PRODUTO IN ('
      '        SELECT DISTINCT '
      '            P.COD_PRODUTO'
      '        FROM'
      '            TB_PRODUTO P            '
      '            LEFT JOIN TB_PRODUTO_GENERO_CALCADO PGC'
      '                ON P.COD_PRODUTO = PGC.COD_PRODUTO'
      '            LEFT JOIN TB_PRODUTO_SALTO_CALCADO PSC'
      '                ON P.COD_PRODUTO = PSC.COD_PRODUTO'
      '            LEFT JOIN TB_PRODUTO_MATERIAL_CALCADO PMC'
      '                ON P.COD_PRODUTO = PMC.COD_PRODUTO'
      '            LEFT JOIN TB_PRODUTO_CONFIG_CALCADO PCC'
      '                ON P.COD_PRODUTO = PCC.COD_PRODUTO            '
      '        WHERE            '
      '            (:COD_GENERO_CALCADO IS NULL OR '
      
        '            /***************************************************' +
        '******************************************************'
      
        '             * Este c'#243'digo utiliza express'#227'o regular para format' +
        'ar a string passada na vari'#225'vel :COD_GENERO_CALCADO,'
      '             * para que fique no padr'#227'o da fun'#231#227'o IN().'
      
        '             * Desta forma, fica f'#225'cil passar uma string por par' +
        #226'metro, com os c'#243'digos dos g'#234'neros que se deseja filtrar.'
      
        '             * OBS: Vari'#225'vel de substitui'#231#227'o n'#227'o funcionou bem, ' +
        'por isso foi utilizado desta forma.'
      '            */'
      
        '                (P.COD_PRODUTO = PGC.COD_PRODUTO AND PGC.COD_GEN' +
        'ERO_CALCADO IN ('
      
        '                    SELECT REGEXP_SUBSTR(:COD_GENERO_CALCADO,'#39'[^' +
        ',]+'#39', 1, level) FROM DUAL'
      
        '                    connect by REGEXP_SUBSTR(:COD_GENERO_CALCADO' +
        ', '#39'[^,]+'#39', 1, level) IS NOT NULL) '
      '                )'
      
        '            /***************************************************' +
        '*******************************************************/'
      '            )   '
      '            AND        '
      '            (:COD_SALTO_CALCADO IS NULL OR '
      
        '                (P.COD_PRODUTO = PSC.COD_PRODUTO AND PSC.COD_SAL' +
        'TO_CALCADO IN ('
      
        '                    SELECT REGEXP_SUBSTR(:COD_SALTO_CALCADO,'#39'[^,' +
        ']+'#39', 1, level) FROM DUAL'
      
        '                    connect by REGEXP_SUBSTR(:COD_SALTO_CALCADO,' +
        ' '#39'[^,]+'#39', 1, level) IS NOT NULL)'
      '                )'
      '            )       '
      '            AND'
      '            (:COD_MATERIAL_CALCADO IS NULL OR'
      
        '                (P.COD_PRODUTO = PMC.COD_PRODUTO AND PMC.COD_MAT' +
        'ERIAL_CALCADO IN ('
      
        '                    SELECT REGEXP_SUBSTR(:COD_MATERIAL_CALCADO,'#39 +
        '[^,]+'#39', 1, level) FROM DUAL'
      
        '                    connect by REGEXP_SUBSTR(:COD_MATERIAL_CALCA' +
        'DO, '#39'[^,]+'#39', 1, level) IS NOT NULL))) '
      '            AND'
      '            (:COD_CONFIG_CALCADO IS NULL OR'
      
        '                (P.COD_PRODUTO = PCC.COD_PRODUTO AND PCC.COD_CON' +
        'FIG_CALCADO IN ('
      
        '                    SELECT REGEXP_SUBSTR(:COD_CONFIG_CALCADO,'#39'[^' +
        ',]+'#39', 1, level) FROM DUAL'
      
        '                    connect by REGEXP_SUBSTR(:COD_CONFIG_CALCADO' +
        ', '#39'[^,]+'#39', 1, level) IS NOT NULL)))'
      '            AND   '
      '            (:IND_SOLADO IS NULL'
      '                OR P.IND_SOLADO = :IND_SOLADO)'
      '            AND'
      '            (:IND_BICO IS NULL'
      '                OR P.IND_BICO = :IND_BICO)'
      '            AND'
      '            (:IND_ENFEITE IS NULL'
      '                OR P.IND_ENFEITE = :IND_ENFEITE)'
      '            AND'
      '            (:DESC_TIME IS NULL'
      '                OR P.DESC_TIME LIKE :DESC_TIME)'
      '            AND'
      '            (:DESC_ESPORTE IS NULL'
      '                OR P.DESC_ESPORTE LIKE :DESC_ESPORTE)'
      '            AND'
      '            (:DESC_COR IS NULL'
      '                OR (INSTR(P.DESC_PRODUTO, :DESC_COR, 1, 1) > 0))'
      '            AND'
      '            (:DESC_REFERENCIA IS NULL'
      
        '                OR (INSTR(P.DESC_PRODUTO, :DESC_REFERENCIA, 1, 1' +
        ') > 0))'
      '    )'
      '    AND'
      '        (:COD_CLASSE IS NULL'
      '            OR P.COD_CLASSE = :COD_CLASSE)'
      '    AND'
      '        (:COD_MARCA IS NULL'
      '            OR P.COD_MARCA = :COD_MARCA)'
      '    AND'
      '        (:COD_LOTE_TIPO IS NULL'
      '            OR I.COD_LOTE_TIPO = :COD_LOTE_TIPO)'
      '    AND'
      '    :DOCUMENTO LIKE '#39'SAIDAS'#39'    '
      ')'
      'GROUP BY'
      '    COD_PRODUTO,'
      '    NUM_FABRICANTE,'
      '    DESC_PRODUTO,'
      '    COD_CLASSE,'
      '    DESC_CLASSE,'
      '    DESC_MARCA'
      'HAVING'
      '    SUM(QT_QUANTIDADE) > 0'
      'ORDER BY'
      '    COD_PRODUTO')
    Variables.Data = {
      0300000011000000070000003A44545F46494E0C00000000000000000000000B
      0000003A434F445F434C41535345030000000000000000000000130000003A43
      4F445F47454E45524F5F43414C4341444F050000000000000000000000120000
      003A434F445F53414C544F5F43414C4341444F05000000000000000000000015
      0000003A434F445F4D4154455249414C5F43414C4341444F0500000000000000
      00000000130000003A434F445F434F4E4649475F43414C4341444F0500000000
      000000000000000B0000003A494E445F534F4C41444F05000000000000000000
      0000090000003A494E445F4249434F0500000000000000000000000C0000003A
      494E445F454E46454954450500000000000000000000000A0000003A44455343
      5F54494D450500000000000000000000000D0000003A444553435F4553504F52
      5445050000000000000000000000070000003A44545F494E490C000000000000
      0000000000090000003A444553435F434F520500000000000000000000000E00
      00003A434F445F4C4F54455F5449504F0300000000000000000000000A000000
      3A434F445F4D415243410500000000000000000000000A0000003A444F43554D
      454E544F050000000000000000000000100000003A444553435F524546455245
      4E434941050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000B000000434F445F50524F4455544F0100000000000C0000
      00444553435F50524F4455544F0100000000000D000000434F445F4C4F54455F
      5449504F0100000000000A000000434F445F434C415353450100000000000B00
      0000444553435F434C415353450100000000000A000000444553435F4D415243
      41010000000000090000005351545F53414944410100000000000E0000004E55
      4D5F464142524943414E5445010000000000}
    Session = DMOracle.DBCemapa
    Left = 1008
    Top = 140
    object QRInformacaoVendaCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRInformacaoVendaNUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
      Size = 21
    end
    object QRInformacaoVendaDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QRInformacaoVendaCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object QRInformacaoVendaDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 100
    end
    object QRInformacaoVendaDESC_MARCA: TStringField
      FieldName = 'DESC_MARCA'
      Size = 50
    end
    object QRInformacaoVendaSQT_SAIDA: TFloatField
      FieldName = 'SQT_SAIDA'
    end
  end
  object QRInformacaoVenda2: TOracleDataSet1
    SQL.Strings = (
      '-- SELECT EXTERNO APENAS PARA FAZER SUM'
      'SELECT'
      '    DESC_MARCA_CLASSE,'
      '    COD_PRODUTO,'
      '    DESC_PRODUTO,'
      '    NUM_FABRICANTE,'
      '    TAMANHO_1,'
      '    TAMANHO_2,'
      '    TAMANHO_3,'
      '    TAMANHO_4,'
      '    TAMANHO_5,'
      '    TAMANHO_6,'
      '    TAMANHO_7,'
      '    TAMANHO_8,'
      '    TAMANHO_9,'
      '    TAMANHO_10,'
      '    TAMANHO_11,'
      '    TAMANHO_12,'
      '    TOTAL_COMPRADO,'
      '    TOTAL_ESTOQUE,'
      '    SUM(QT_ESTOQUE_1) AS QT_ESTOQUE_1,'
      '    SUM(QT_ESTOQUE_2) AS QT_ESTOQUE_2,'
      '    SUM(QT_ESTOQUE_3) AS QT_ESTOQUE_3,'
      '    SUM(QT_ESTOQUE_4) AS QT_ESTOQUE_4,'
      '    SUM(QT_ESTOQUE_5) AS QT_ESTOQUE_5,'
      '    SUM(QT_ESTOQUE_6) AS QT_ESTOQUE_6,'
      '    SUM(QT_ESTOQUE_7) AS QT_ESTOQUE_7,'
      '    SUM(QT_ESTOQUE_8) AS QT_ESTOQUE_8,'
      '    SUM(QT_ESTOQUE_9) AS QT_ESTOQUE_9,'
      '    SUM(QT_ESTOQUE_10) AS QT_ESTOQUE_10,'
      '    SUM(QT_ESTOQUE_11) AS QT_ESTOQUE_11,'
      '    SUM(QT_ESTOQUE_12) AS QT_ESTOQUE_12,'
      '    SUM(QT_COMPRADO_1) AS QT_COMPRADO_1,'
      '    SUM(QT_COMPRADO_2) AS QT_COMPRADO_2,'
      '    SUM(QT_COMPRADO_3) AS QT_COMPRADO_3,'
      '    SUM(QT_COMPRADO_4) AS QT_COMPRADO_4,'
      '    SUM(QT_COMPRADO_5) AS QT_COMPRADO_5,'
      '    SUM(QT_COMPRADO_6) AS QT_COMPRADO_6,'
      '    SUM(QT_COMPRADO_7) AS QT_COMPRADO_7,'
      '    SUM(QT_COMPRADO_8) AS QT_COMPRADO_8,'
      '    SUM(QT_COMPRADO_9) AS QT_COMPRADO_9,'
      '    SUM(QT_COMPRADO_10) AS QT_COMPRADO_10,'
      '    SUM(QT_COMPRADO_11) AS QT_COMPRADO_11,'
      '    SUM(QT_COMPRADO_12) AS QT_COMPRADO_12   '
      'FROM    '
      '('
      '    SELECT DISTINCT'
      
        '        NVL(DESC_MARCA, '#39'SEM MARCA'#39') || '#39' / '#39' || DESC_CLASSE AS ' +
        'DESC_MARCA_CLASSE,'
      '        COD_PRODUTO,'
      '        DESC_PRODUTO,'
      '        NUM_FABRICANTE,'
      '        CAST(TAMANHO_1 AS VARCHAR2(2)) AS TAMANHO_1,'
      
        '        DECODE(TAMANHO_1, NULL, '#39#39', NVL(QT_ESTOQUE_1, '#39'0'#39')) AS Q' +
        'T_ESTOQUE_1,'
      
        '        DECODE(TAMANHO_1, NULL, '#39#39', NVL(QT_COMPRADO_1, '#39'0'#39')) AS ' +
        'QT_COMPRADO_1,'
      '        CAST(TAMANHO_2 AS VARCHAR2(2)) AS TAMANHO_2,'
      
        '        DECODE(TAMANHO_2, NULL, '#39#39', NVL(QT_ESTOQUE_2, '#39'0'#39')) AS Q' +
        'T_ESTOQUE_2,'
      
        '        DECODE(TAMANHO_2, NULL, '#39#39', NVL(QT_COMPRADO_2, '#39'0'#39')) AS ' +
        'QT_COMPRADO_2,'
      '        CAST(TAMANHO_3 AS VARCHAR2(2)) AS TAMANHO_3,'
      
        '        DECODE(TAMANHO_3, NULL, '#39#39', NVL(QT_ESTOQUE_3, '#39'0'#39')) AS Q' +
        'T_ESTOQUE_3,    '
      
        '        DECODE(TAMANHO_3, NULL, '#39#39', NVL(QT_COMPRADO_3, '#39'0'#39')) AS ' +
        'QT_COMPRADO_3,'
      '        CAST(TAMANHO_4 AS VARCHAR2(2)) AS TAMANHO_4,'
      
        '        DECODE(TAMANHO_4, NULL, '#39#39', NVL(QT_ESTOQUE_4, '#39'0'#39')) AS Q' +
        'T_ESTOQUE_4,'
      
        '        DECODE(TAMANHO_4, NULL, '#39#39', NVL(QT_COMPRADO_4, '#39'0'#39')) AS ' +
        'QT_COMPRADO_4,'
      '        CAST(TAMANHO_5 AS VARCHAR2(2)) AS TAMANHO_5,'
      
        '        DECODE(TAMANHO_5, NULL, '#39#39', NVL(QT_ESTOQUE_5, '#39'0'#39')) AS Q' +
        'T_ESTOQUE_5,'
      
        '        DECODE(TAMANHO_5, NULL, '#39#39', NVL(QT_COMPRADO_5, '#39'0'#39')) AS ' +
        'QT_COMPRADO_5,'
      '        CAST(TAMANHO_6 AS VARCHAR2(2)) AS TAMANHO_6,'
      
        '        DECODE(TAMANHO_6, NULL, '#39#39', NVL(QT_ESTOQUE_6, '#39'0'#39')) AS Q' +
        'T_ESTOQUE_6,'
      
        '        DECODE(TAMANHO_6, NULL, '#39#39', NVL(QT_COMPRADO_6, '#39'0'#39')) AS ' +
        'QT_COMPRADO_6,'
      '        CAST(TAMANHO_7 AS VARCHAR2(2)) AS TAMANHO_7,'
      
        '        DECODE(TAMANHO_7, NULL, '#39#39', NVL(QT_ESTOQUE_7, '#39'0'#39')) AS Q' +
        'T_ESTOQUE_7,'
      
        '        DECODE(TAMANHO_7, NULL, '#39#39', NVL(QT_COMPRADO_7, '#39'0'#39')) AS ' +
        'QT_COMPRADO_7,'
      '        CAST(TAMANHO_8 AS VARCHAR2(2)) AS TAMANHO_8,'
      
        '        DECODE(TAMANHO_8, NULL, '#39#39', NVL(QT_ESTOQUE_8, '#39'0'#39')) AS Q' +
        'T_ESTOQUE_8,'
      
        '        DECODE(TAMANHO_8, NULL, '#39#39', NVL(QT_COMPRADO_8, '#39'0'#39')) AS ' +
        'QT_COMPRADO_8,'
      '        CAST(TAMANHO_9 AS VARCHAR2(2)) AS TAMANHO_9,'
      
        '        DECODE(TAMANHO_9, NULL, '#39#39', NVL(QT_ESTOQUE_9, '#39'0'#39')) AS Q' +
        'T_ESTOQUE_9,'
      
        '        DECODE(TAMANHO_9, NULL, '#39#39', NVL(QT_COMPRADO_9, '#39'0'#39')) AS ' +
        'QT_COMPRADO_9,'
      '        CAST(TAMANHO_10 AS VARCHAR2(2)) AS TAMANHO_10,'
      
        '        DECODE(TAMANHO_10, NULL, '#39#39', NVL(QT_ESTOQUE_10, '#39'0'#39')) AS' +
        ' QT_ESTOQUE_10,'
      
        '        DECODE(TAMANHO_10, NULL, '#39#39', NVL(QT_COMPRADO_10, '#39'0'#39')) A' +
        'S QT_COMPRADO_10,'
      '        CAST(TAMANHO_11 AS VARCHAR2(2)) AS TAMANHO_11,'
      
        '        DECODE(TAMANHO_11, NULL, '#39#39', NVL(QT_ESTOQUE_11, '#39'0'#39')) AS' +
        ' QT_ESTOQUE_11,'
      
        '        DECODE(TAMANHO_11, NULL, '#39#39', NVL(QT_COMPRADO_11, '#39'0'#39')) A' +
        'S QT_COMPRADO_11,'
      '        CAST(TAMANHO_12 AS VARCHAR2(2)) AS TAMANHO_12,'
      
        '        DECODE(TAMANHO_12, NULL, '#39#39', NVL(QT_ESTOQUE_12, '#39'0'#39')) AS' +
        ' QT_ESTOQUE_12,'
      
        '        DECODE(TAMANHO_12, NULL, '#39#39', NVL(QT_COMPRADO_12, '#39'0'#39')) A' +
        'S QT_COMPRADO_12,'
      '        NVL(QT_COMPRADO_1, 0)'
      '            + NVL(QT_COMPRADO_2, 0)'
      '            + NVL(QT_COMPRADO_3, 0)'
      '            + NVL(QT_COMPRADO_4, 0)'
      '            + NVL(QT_COMPRADO_5, 0)'
      '            + NVL(QT_COMPRADO_6, 0)'
      '            + NVL(QT_COMPRADO_7, 0)'
      '            + NVL(QT_COMPRADO_8, 0)'
      '            + NVL(QT_COMPRADO_9, 0)'
      '            + NVL(QT_COMPRADO_10, 0)'
      '            + NVL(QT_COMPRADO_11, 0)'
      '            + NVL(QT_COMPRADO_12, 0) AS TOTAL_COMPRADO,'
      '        NVL(QT_ESTOQUE_1, 0)'
      '            + NVL(QT_ESTOQUE_2, 0)'
      '            + NVL(QT_ESTOQUE_3, 0)'
      '            + NVL(QT_ESTOQUE_4, 0)'
      '            + NVL(QT_ESTOQUE_5, 0)'
      '            + NVL(QT_ESTOQUE_6, 0)'
      '            + NVL(QT_ESTOQUE_7, 0)'
      '            + NVL(QT_ESTOQUE_8, 0)'
      '            + NVL(QT_ESTOQUE_9, 0)'
      '            + NVL(QT_ESTOQUE_10, 0)'
      '            + NVL(QT_ESTOQUE_11, 0)'
      '            + NVL(QT_ESTOQUE_12, 0) AS TOTAL_ESTOQUE'
      '    '
      '    FROM('
      '        '
      '        SELECT'
      '            DESC_MARCA,'
      '            DESC_CLASSE,'
      '            COD_PRODUTO,'
      '            DESC_PRODUTO,'
      '            NUM_FABRICANTE,            '
      '            -- TAMANHO 1'
      '            :COD_LOTE_TIPO_1 AS TAMANHO_1,'
      
        '            (SELECT NVL(SUM(E.QT_QUANTIDADE),0) FROM TB_ESTOQUE ' +
        'E WHERE E.COD_PRODUTO = q.COD_PRODUTO AND E.COD_LOTE_TIPO = :COD' +
        '_LOTE_TIPO_1) AS QT_ESTOQUE_1,'
      '            SUM(NVL(('
      '                SELECT '
      '                    SUM(I.QT_QUANTIDADE)'
      '                FROM '
      '                    TB_NOTA_ITEM I '
      
        '                        INNER JOIN TB_NOTA_CAB N ON I.COD_NOTA_C' +
        'AB = N.COD_NOTA_CAB'
      
        '                        INNER JOIN TB_OPERACAO O ON N.COD_OPERAC' +
        'AO = O.COD_OPERACAO'
      '                WHERE '
      '                    N.IND_SITUACAO = 2'
      '                    AND'
      
        '                    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN' +
        '  '
      '                    AND'
      '                    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '                    AND'
      '                    I.COD_PRODUTO = q.COD_PRODUTO '
      '                    AND '
      '                    I.COD_LOTE_TIPO = :COD_LOTE_TIPO_1'
      '                    AND'
      '                    N.COD_NOTA_CAB = q.COD_NOTA_CAB'
      '                    AND'
      '                    O.IND_COMPRAS = '#39'C'#39
      '            ), 0)) AS QT_COMPRADO_1,'
      '            '
      '            -- TAMANHO 2'
      '            :COD_LOTE_TIPO_2 AS TAMANHO_2,'
      
        '            (SELECT NVL(SUM(E.QT_QUANTIDADE),0) FROM TB_ESTOQUE ' +
        'E WHERE E.COD_PRODUTO = q.COD_PRODUTO AND E.COD_LOTE_TIPO = :COD' +
        '_LOTE_TIPO_2) AS QT_ESTOQUE_2,'
      '            SUM(NVL(('
      '                SELECT '
      '                    SUM(I.QT_QUANTIDADE)'
      '                FROM '
      '                    TB_NOTA_ITEM I '
      
        '                        INNER JOIN TB_NOTA_CAB N ON I.COD_NOTA_C' +
        'AB = N.COD_NOTA_CAB'
      
        '                        INNER JOIN TB_OPERACAO O ON N.COD_OPERAC' +
        'AO = O.COD_OPERACAO'
      '                WHERE '
      '                    N.IND_SITUACAO = 2'
      '                    AND'
      
        '                    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN' +
        '  '
      '                    AND'
      '                    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '                    AND'
      '                    I.COD_PRODUTO = q.COD_PRODUTO '
      '                    AND '
      '                    I.COD_LOTE_TIPO = :COD_LOTE_TIPO_2'
      '                    AND'
      '                    N.COD_NOTA_CAB = q.COD_NOTA_CAB'
      '                    AND'
      '                    O.IND_COMPRAS = '#39'C'#39
      '            ),0)) AS QT_COMPRADO_2,'
      '            '
      '            -- TAMANHO 3'
      '            :COD_LOTE_TIPO_3 AS TAMANHO_3,'
      
        '            (SELECT NVL(SUM(E.QT_QUANTIDADE),0) FROM TB_ESTOQUE ' +
        'E WHERE E.COD_PRODUTO = q.COD_PRODUTO AND E.COD_LOTE_TIPO = :COD' +
        '_LOTE_TIPO_3) AS QT_ESTOQUE_3,'
      '            SUM(NVL(('
      '                SELECT '
      '                    SUM(I.QT_QUANTIDADE)'
      '                FROM '
      '                    TB_NOTA_ITEM I '
      
        '                        INNER JOIN TB_NOTA_CAB N ON I.COD_NOTA_C' +
        'AB = N.COD_NOTA_CAB'
      
        '                        INNER JOIN TB_OPERACAO O ON N.COD_OPERAC' +
        'AO = O.COD_OPERACAO'
      '                WHERE '
      '                    N.IND_SITUACAO = 2'
      '                    AND'
      
        '                    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN' +
        '  '
      '                    AND'
      '                    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '                    AND'
      '                    I.COD_PRODUTO = q.COD_PRODUTO '
      '                    AND '
      '                    I.COD_LOTE_TIPO = :COD_LOTE_TIPO_3'
      '                    AND'
      '                    N.COD_NOTA_CAB = q.COD_NOTA_CAB'
      '                    AND'
      '                    O.IND_COMPRAS = '#39'C'#39
      '            ),0)) AS QT_COMPRADO_3,'
      '            '
      '            -- TAMANHO 4'
      '            :COD_LOTE_TIPO_4 AS TAMANHO_4,'
      
        '            (SELECT NVL(SUM(E.QT_QUANTIDADE),0) FROM TB_ESTOQUE ' +
        'E WHERE E.COD_PRODUTO = q.COD_PRODUTO AND E.COD_LOTE_TIPO = :COD' +
        '_LOTE_TIPO_4) AS QT_ESTOQUE_4,'
      '            SUM(NVL(('
      '                SELECT '
      '                    SUM(I.QT_QUANTIDADE)'
      '                FROM '
      '                    TB_NOTA_ITEM I '
      
        '                        INNER JOIN TB_NOTA_CAB N ON I.COD_NOTA_C' +
        'AB = N.COD_NOTA_CAB'
      
        '                        INNER JOIN TB_OPERACAO O ON N.COD_OPERAC' +
        'AO = O.COD_OPERACAO'
      '                WHERE '
      '                    N.IND_SITUACAO = 2'
      '                    AND'
      
        '                    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN' +
        '  '
      '                    AND'
      '                    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '                    AND'
      '                    I.COD_PRODUTO = q.COD_PRODUTO '
      '                    AND '
      '                    I.COD_LOTE_TIPO = :COD_LOTE_TIPO_4'
      '                    AND'
      '                    N.COD_NOTA_CAB = q.COD_NOTA_CAB'
      '                    AND'
      '                    O.IND_COMPRAS = '#39'C'#39
      '            ),0)) AS QT_COMPRADO_4,'
      '            '
      '            -- TAMANHO 5'
      '            :COD_LOTE_TIPO_5 AS TAMANHO_5,'
      
        '            (SELECT NVL(SUM(E.QT_QUANTIDADE),0) FROM TB_ESTOQUE ' +
        'E WHERE E.COD_PRODUTO = q.COD_PRODUTO AND E.COD_LOTE_TIPO = :COD' +
        '_LOTE_TIPO_5) AS QT_ESTOQUE_5,'
      '            SUM(NVL(('
      '                SELECT '
      '                    SUM(I.QT_QUANTIDADE)'
      '                FROM '
      '                    TB_NOTA_ITEM I '
      
        '                        INNER JOIN TB_NOTA_CAB N ON I.COD_NOTA_C' +
        'AB = N.COD_NOTA_CAB'
      
        '                        INNER JOIN TB_OPERACAO O ON N.COD_OPERAC' +
        'AO = O.COD_OPERACAO'
      '                WHERE '
      '                    N.IND_SITUACAO = 2'
      '                    AND'
      
        '                    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN' +
        '  '
      '                    AND'
      '                    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '                    AND'
      '                    I.COD_PRODUTO = q.COD_PRODUTO '
      '                    AND '
      '                    I.COD_LOTE_TIPO = :COD_LOTE_TIPO_5'
      '                    AND'
      '                    N.COD_NOTA_CAB = q.COD_NOTA_CAB'
      '                    AND'
      '                    O.IND_COMPRAS = '#39'C'#39
      '            ),0)) AS QT_COMPRADO_5,'
      '            '
      '            -- TAMANHO 6'
      '            :COD_LOTE_TIPO_6 AS TAMANHO_6,'
      
        '            (SELECT NVL(SUM(E.QT_QUANTIDADE),0) FROM TB_ESTOQUE ' +
        'E WHERE E.COD_PRODUTO = q.COD_PRODUTO AND E.COD_LOTE_TIPO = :COD' +
        '_LOTE_TIPO_6) AS QT_ESTOQUE_6,'
      '            SUM(NVL(('
      '                SELECT '
      '                    SUM(I.QT_QUANTIDADE)'
      '                FROM '
      '                    TB_NOTA_ITEM I '
      
        '                        INNER JOIN TB_NOTA_CAB N ON I.COD_NOTA_C' +
        'AB = N.COD_NOTA_CAB'
      
        '                        INNER JOIN TB_OPERACAO O ON N.COD_OPERAC' +
        'AO = O.COD_OPERACAO'
      '                WHERE '
      '                    N.IND_SITUACAO = 2'
      '                    AND'
      
        '                    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN' +
        '  '
      '                    AND'
      '                    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '                    AND'
      '                    I.COD_PRODUTO = q.COD_PRODUTO '
      '                    AND '
      '                    I.COD_LOTE_TIPO = :COD_LOTE_TIPO_6'
      '                    AND'
      '                    N.COD_NOTA_CAB = q.COD_NOTA_CAB'
      '                    AND'
      '                    O.IND_COMPRAS = '#39'C'#39
      '            ),0)) AS QT_COMPRADO_6,'
      '            '
      '            -- TAMANHO 7'
      '            :COD_LOTE_TIPO_7 AS TAMANHO_7,'
      
        '            (SELECT NVL(SUM(E.QT_QUANTIDADE),0) FROM TB_ESTOQUE ' +
        'E WHERE E.COD_PRODUTO = q.COD_PRODUTO AND E.COD_LOTE_TIPO = :COD' +
        '_LOTE_TIPO_7) AS QT_ESTOQUE_7,'
      '            SUM(NVL(('
      '                SELECT '
      '                    SUM(I.QT_QUANTIDADE)'
      '                FROM '
      '                    TB_NOTA_ITEM I '
      
        '                        INNER JOIN TB_NOTA_CAB N ON I.COD_NOTA_C' +
        'AB = N.COD_NOTA_CAB'
      
        '                        INNER JOIN TB_OPERACAO O ON N.COD_OPERAC' +
        'AO = O.COD_OPERACAO'
      '                WHERE '
      '                    N.IND_SITUACAO = 2'
      '                    AND'
      
        '                    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN' +
        '  '
      '                    AND'
      '                    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '                    AND'
      '                    I.COD_PRODUTO = q.COD_PRODUTO '
      '                    AND '
      '                    I.COD_LOTE_TIPO = :COD_LOTE_TIPO_7'
      '                    AND'
      '                    N.COD_NOTA_CAB = q.COD_NOTA_CAB'
      '                    AND'
      '                    O.IND_COMPRAS = '#39'C'#39
      '            ),0)) AS QT_COMPRADO_7,'
      '            '
      '            -- TAMANHO 8'
      '            :COD_LOTE_TIPO_8 AS TAMANHO_8,'
      
        '            (SELECT NVL(SUM(E.QT_QUANTIDADE),0) FROM TB_ESTOQUE ' +
        'E WHERE E.COD_PRODUTO = q.COD_PRODUTO AND E.COD_LOTE_TIPO = :COD' +
        '_LOTE_TIPO_8) AS QT_ESTOQUE_8,'
      '            SUM(NVL(('
      '                SELECT '
      '                    SUM(I.QT_QUANTIDADE)'
      '                FROM '
      '                    TB_NOTA_ITEM I '
      
        '                        INNER JOIN TB_NOTA_CAB N ON I.COD_NOTA_C' +
        'AB = N.COD_NOTA_CAB'
      
        '                        INNER JOIN TB_OPERACAO O ON N.COD_OPERAC' +
        'AO = O.COD_OPERACAO'
      '                WHERE '
      '                    N.IND_SITUACAO = 2'
      '                    AND'
      
        '                    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN' +
        '  '
      '                    AND'
      '                    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '                    AND'
      '                    I.COD_PRODUTO = q.COD_PRODUTO '
      '                    AND '
      '                    I.COD_LOTE_TIPO = :COD_LOTE_TIPO_8'
      '                    AND'
      '                    N.COD_NOTA_CAB = q.COD_NOTA_CAB'
      '                    AND'
      '                    O.IND_COMPRAS = '#39'C'#39
      '            ),0)) AS QT_COMPRADO_8,'
      '            '
      '            -- TAMANHO 9'
      '            :COD_LOTE_TIPO_9 AS TAMANHO_9,'
      
        '            (SELECT NVL(SUM(E.QT_QUANTIDADE),0) FROM TB_ESTOQUE ' +
        'E WHERE E.COD_PRODUTO = q.COD_PRODUTO AND E.COD_LOTE_TIPO = :COD' +
        '_LOTE_TIPO_9) AS QT_ESTOQUE_9,'
      '            SUM(NVL(('
      '                SELECT '
      '                    SUM(I.QT_QUANTIDADE)'
      '                FROM '
      '                    TB_NOTA_ITEM I '
      
        '                        INNER JOIN TB_NOTA_CAB N ON I.COD_NOTA_C' +
        'AB = N.COD_NOTA_CAB'
      
        '                        INNER JOIN TB_OPERACAO O ON N.COD_OPERAC' +
        'AO = O.COD_OPERACAO'
      '                WHERE '
      '                    N.IND_SITUACAO = 2'
      '                    AND'
      
        '                    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN' +
        '  '
      '                    AND'
      '                    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '                    AND'
      '                    I.COD_PRODUTO = q.COD_PRODUTO '
      '                    AND '
      '                    I.COD_LOTE_TIPO = :COD_LOTE_TIPO_9'
      '                    AND'
      '                    N.COD_NOTA_CAB = q.COD_NOTA_CAB'
      '                    AND'
      '                    O.IND_COMPRAS = '#39'C'#39
      '            ),0)) AS QT_COMPRADO_9,'
      '            '
      '            -- TAMANHO 10'
      '            :COD_LOTE_TIPO_10 AS TAMANHO_10,'
      
        '            (SELECT NVL(SUM(E.QT_QUANTIDADE),0) FROM TB_ESTOQUE ' +
        'E WHERE E.COD_PRODUTO = q.COD_PRODUTO AND E.COD_LOTE_TIPO = :COD' +
        '_LOTE_TIPO_10) AS QT_ESTOQUE_10,'
      '            SUM(NVL(('
      '                SELECT '
      '                    SUM(I.QT_QUANTIDADE)'
      '                FROM '
      '                    TB_NOTA_ITEM I '
      
        '                        INNER JOIN TB_NOTA_CAB N ON I.COD_NOTA_C' +
        'AB = N.COD_NOTA_CAB'
      
        '                        INNER JOIN TB_OPERACAO O ON N.COD_OPERAC' +
        'AO = O.COD_OPERACAO'
      '                WHERE '
      '                    N.IND_SITUACAO = 2'
      '                    AND'
      
        '                    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN' +
        '  '
      '                    AND'
      '                    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '                    AND'
      '                    I.COD_PRODUTO = q.COD_PRODUTO '
      '                    AND '
      '                    I.COD_LOTE_TIPO = :COD_LOTE_TIPO_10'
      '                    AND'
      '                    N.COD_NOTA_CAB = q.COD_NOTA_CAB'
      '                    AND'
      '                    O.IND_COMPRAS = '#39'C'#39
      '            ),0)) AS QT_COMPRADO_10,'
      '            '
      '            -- TAMANHO 11'
      '            :COD_LOTE_TIPO_11 AS TAMANHO_11,'
      
        '            (SELECT NVL(SUM(E.QT_QUANTIDADE),0) FROM TB_ESTOQUE ' +
        'E WHERE E.COD_PRODUTO = q.COD_PRODUTO AND E.COD_LOTE_TIPO = :COD' +
        '_LOTE_TIPO_11) AS QT_ESTOQUE_11,'
      '            SUM(NVL(('
      '                SELECT '
      '                    SUM(I.QT_QUANTIDADE)'
      '                FROM '
      '                    TB_NOTA_ITEM I '
      
        '                        INNER JOIN TB_NOTA_CAB N ON I.COD_NOTA_C' +
        'AB = N.COD_NOTA_CAB'
      
        '                        INNER JOIN TB_OPERACAO O ON N.COD_OPERAC' +
        'AO = O.COD_OPERACAO'
      '                WHERE '
      '                    N.IND_SITUACAO = 2'
      '                    AND'
      
        '                    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN' +
        '  '
      '                    AND'
      '                    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '                    AND'
      '                    I.COD_PRODUTO = q.COD_PRODUTO '
      '                    AND '
      '                    I.COD_LOTE_TIPO = :COD_LOTE_TIPO_11'
      '                    AND'
      '                    N.COD_NOTA_CAB = q.COD_NOTA_CAB'
      '                    AND'
      '                    O.IND_COMPRAS = '#39'C'#39
      '            ),0)) AS QT_COMPRADO_11,'
      '            '
      '            -- TAMANHO 12'
      '            :COD_LOTE_TIPO_12 AS TAMANHO_12,'
      
        '            (SELECT NVL(SUM(E.QT_QUANTIDADE),0) FROM TB_ESTOQUE ' +
        'E WHERE E.COD_PRODUTO = q.COD_PRODUTO AND E.COD_LOTE_TIPO = :COD' +
        '_LOTE_TIPO_12) AS QT_ESTOQUE_12,'
      '            SUM(NVL(('
      '                SELECT '
      '                    SUM(I.QT_QUANTIDADE)'
      '                FROM '
      '                    TB_NOTA_ITEM I '
      
        '                        INNER JOIN TB_NOTA_CAB N ON I.COD_NOTA_C' +
        'AB = N.COD_NOTA_CAB'
      
        '                        INNER JOIN TB_OPERACAO O ON N.COD_OPERAC' +
        'AO = O.COD_OPERACAO'
      '                WHERE '
      '                    N.IND_SITUACAO = 2'
      '                    AND'
      
        '                    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN' +
        '  '
      '                    AND'
      '                    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '                    AND'
      '                    I.COD_PRODUTO = q.COD_PRODUTO '
      '                    AND '
      '                    I.COD_LOTE_TIPO = :COD_LOTE_TIPO_12'
      '                    AND'
      '                    N.COD_NOTA_CAB = q.COD_NOTA_CAB'
      '                    AND'
      '                    O.IND_COMPRAS = '#39'C'#39
      '            ),0)) AS QT_COMPRADO_12'
      '            '
      '        FROM ('
      '            -- TRAZ PRODUTOS DAS NOTAS'
      '            SELECT DISTINCT'
      '                M.DESC_MARCA,'
      '                C.DESC_CLASSE,'
      '                P.COD_PRODUTO,'
      '                P.NUM_FABRICANTE,'
      '                P.DESC_PRODUTO,'
      '                N.COD_NOTA_CAB'
      '            FROM'
      '                TB_NOTA_CAB N'
      '                    INNER JOIN TB_NOTA_ITEM I'
      '                        ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      '                    INNER JOIN TB_PRODUTO P'
      '                        ON I.COD_PRODUTO = P.COD_PRODUTO'
      '                    INNER JOIN TB_FILIAL F'
      '                        ON N.COD_FILIAL = F.COD_FILIAL'
      '                    INNER JOIN TB_CLASSE C'
      '                        ON P.COD_CLASSE = C.COD_CLASSE'
      '                    INNER JOIN TB_OPERACAO O'
      '                        ON N.COD_OPERACAO = O.COD_OPERACAO'
      '                    LEFT JOIN TB_PRODUTO_GENERO_CALCADO PGC'
      '                        ON P.COD_PRODUTO = PGC.COD_PRODUTO'
      '                    LEFT JOIN TB_PRODUTO_SALTO_CALCADO PSC'
      '                        ON P.COD_PRODUTO = PSC.COD_PRODUTO'
      '                    LEFT JOIN TB_PRODUTO_MATERIAL_CALCADO PMC'
      '                        ON P.COD_PRODUTO = PMC.COD_PRODUTO'
      '                    LEFT JOIN TB_PRODUTO_CONFIG_CALCADO PCC'
      '                        ON P.COD_PRODUTO = PCC.COD_PRODUTO'
      '                    LEFT JOIN TB_MARCA M'
      '                        ON P.COD_MARCA = M.COD_MARCA'
      '                    LEFT JOIN TB_ESTOQUE E'
      
        '                        ON P.COD_PRODUTO = E.COD_PRODUTO AND E.C' +
        'OD_LOTE_TIPO = :COD_LOTE_TIPO'
      '            WHERE'
      '                N.IND_ENTRADA_SAIDA = '#39'E'#39
      '                AND'
      '                N.IND_SITUACAO = '#39'2'#39
      '                AND'
      '                N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN    '
      '                AND'
      '                (:COD_CLASSE IS NULL'
      '                    OR P.COD_CLASSE = :COD_CLASSE)'
      '                AND'
      '                (:COD_GENERO_CALCADO IS NULL OR '
      
        '                    (P.COD_PRODUTO = PGC.COD_PRODUTO AND PGC.COD' +
        '_GENERO_CALCADO IN ('
      
        '                        SELECT REGEXP_SUBSTR(:COD_GENERO_CALCADO' +
        ','#39'[^,]+'#39', 1, level) FROM DUAL'
      
        '                        connect by REGEXP_SUBSTR(:COD_GENERO_CAL' +
        'CADO, '#39'[^,]+'#39', 1, level) IS NOT NULL) '
      '                    )'
      '                )   '
      '                AND        '
      '                (:COD_SALTO_CALCADO IS NULL OR '
      
        '                    (P.COD_PRODUTO = PSC.COD_PRODUTO AND PSC.COD' +
        '_SALTO_CALCADO IN ('
      
        '                        SELECT REGEXP_SUBSTR(:COD_SALTO_CALCADO,' +
        #39'[^,]+'#39', 1, level) FROM DUAL'
      
        '                        connect by REGEXP_SUBSTR(:COD_SALTO_CALC' +
        'ADO, '#39'[^,]+'#39', 1, level) IS NOT NULL)'
      '                    )'
      '                )       '
      '                AND'
      '                (:COD_MATERIAL_CALCADO IS NULL OR'
      
        '                    (P.COD_PRODUTO = PMC.COD_PRODUTO AND PMC.COD' +
        '_MATERIAL_CALCADO IN ('
      
        '                        SELECT REGEXP_SUBSTR(:COD_MATERIAL_CALCA' +
        'DO,'#39'[^,]+'#39', 1, level) FROM DUAL'
      
        '                        connect by REGEXP_SUBSTR(:COD_MATERIAL_C' +
        'ALCADO, '#39'[^,]+'#39', 1, level) IS NOT NULL))) '
      '                AND'
      '                (:COD_CONFIG_CALCADO IS NULL OR'
      
        '                    (P.COD_PRODUTO = PCC.COD_PRODUTO AND PCC.COD' +
        '_CONFIG_CALCADO IN ('
      
        '                        SELECT REGEXP_SUBSTR(:COD_CONFIG_CALCADO' +
        ','#39'[^,]+'#39', 1, level) FROM DUAL'
      
        '                        connect by REGEXP_SUBSTR(:COD_CONFIG_CAL' +
        'CADO, '#39'[^,]+'#39', 1, level) IS NOT NULL)))'
      '                AND   '
      '                (:IND_SOLADO IS NULL'
      '                    OR P.IND_SOLADO = :IND_SOLADO)'
      '                AND'
      '                (:IND_BICO IS NULL'
      '                    OR P.IND_BICO = :IND_BICO)'
      '                AND'
      '                (:IND_ENFEITE IS NULL'
      '                    OR P.IND_ENFEITE = :IND_ENFEITE)'
      '                AND'
      '                (:DESC_TIME IS NULL'
      '                    OR P.DESC_TIME LIKE :DESC_TIME)'
      '                AND'
      '                (:DESC_ESPORTE IS NULL'
      '                    OR P.DESC_ESPORTE LIKE :DESC_ESPORTE)'
      '                AND'
      '                (:DESC_COR IS NULL'
      
        '                    OR (INSTR(P.DESC_PRODUTO, :DESC_COR, 1, 1) >' +
        ' 0))'
      '                AND'
      '                (:DESC_REFERENCIA IS NULL'
      
        '                    OR (INSTR(P.DESC_PRODUTO, :DESC_REFERENCIA, ' +
        '1, 1) > 0))'
      '                AND'
      '                (:COD_MARCA IS NULL'
      '                    OR P.COD_MARCA = :COD_MARCA)'
      '                AND'
      '                ('
      '                    I.COD_LOTE_TIPO = 1 '
      '                    OR'
      
        '                    I.COD_LOTE_TIPO BETWEEN :COD_LOTE_TIPO_INI A' +
        'ND :COD_LOTE_TIPO_FIN'
      '                )                '
      '                AND'
      '                O.IND_COMPRAS = '#39'C'#39
      '                '
      
        '            /* Retirado a pedido da Loriane. Suporte c'#243'digo 1310' +
        '3    '
      '            UNION'
      '            '
      #9'     -- TRAZ PRODUTOS DO ESTOQUE'#9#9
      '            SELECT DISTINCT'
      '                M.DESC_MARCA,'
      '                C.DESC_CLASSE,'
      '                P.COD_PRODUTO,'
      '                P.NUM_FABRICANTE,'
      '                P.DESC_PRODUTO,'
      '                NULL AS COD_NOTA_CAB'
      '            FROM'
      '                TB_ESTOQUE E'
      '                    INNER JOIN TB_PRODUTO P'
      
        '                        ON P.COD_PRODUTO = E.COD_PRODUTO        ' +
        '            '
      '                    LEFT JOIN TB_PRODUTO_GENERO_CALCADO PGC'
      '                        ON P.COD_PRODUTO = PGC.COD_PRODUTO'
      '                    LEFT JOIN TB_PRODUTO_SALTO_CALCADO PSC'
      '                        ON P.COD_PRODUTO = PSC.COD_PRODUTO'
      '                    LEFT JOIN TB_PRODUTO_MATERIAL_CALCADO PMC'
      '                        ON P.COD_PRODUTO = PMC.COD_PRODUTO'
      '                    LEFT JOIN TB_PRODUTO_CONFIG_CALCADO PCC'
      '                        ON P.COD_PRODUTO = PCC.COD_PRODUTO'
      '                    LEFT JOIN TB_MARCA M'
      '                        ON P.COD_MARCA = M.COD_MARCA  '
      '                    INNER JOIN TB_CLASSE C'
      '                        ON P.COD_CLASSE = C.COD_CLASSE'
      '                    INNER JOIN TB_NOTA_ITEM I'
      '                        ON I.COD_PRODUTO = P.COD_PRODUTO'
      '                    INNER JOIN TB_NOTA_CAB N'
      '                        ON I.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '                    INNER JOIN TB_OPERACAO O'
      '                        ON N.COD_OPERACAO = O.COD_OPERACAO'
      '            WHERE               '
      '                (:COD_CLASSE IS NULL'
      '                    OR P.COD_CLASSE = :COD_CLASSE)'
      '                AND'
      '                (:COD_GENERO_CALCADO IS NULL OR '
      
        '                    (P.COD_PRODUTO = PGC.COD_PRODUTO AND PGC.COD' +
        '_GENERO_CALCADO IN ('
      
        '                        SELECT REGEXP_SUBSTR(:COD_GENERO_CALCADO' +
        ','#39'[^,]+'#39', 1, level) FROM DUAL'
      
        '                        connect by REGEXP_SUBSTR(:COD_GENERO_CAL' +
        'CADO, '#39'[^,]+'#39', 1, level) IS NOT NULL) '
      '                    )'
      '                )   '
      '                AND        '
      '                (:COD_SALTO_CALCADO IS NULL OR '
      
        '                    (P.COD_PRODUTO = PSC.COD_PRODUTO AND PSC.COD' +
        '_SALTO_CALCADO IN ('
      
        '                        SELECT REGEXP_SUBSTR(:COD_SALTO_CALCADO,' +
        #39'[^,]+'#39', 1, level) FROM DUAL'
      
        '                        connect by REGEXP_SUBSTR(:COD_SALTO_CALC' +
        'ADO, '#39'[^,]+'#39', 1, level) IS NOT NULL)'
      '                    )'
      '                )       '
      '                AND'
      '                (:COD_MATERIAL_CALCADO IS NULL OR'
      
        '                    (P.COD_PRODUTO = PMC.COD_PRODUTO AND PMC.COD' +
        '_MATERIAL_CALCADO IN ('
      
        '                        SELECT REGEXP_SUBSTR(:COD_MATERIAL_CALCA' +
        'DO,'#39'[^,]+'#39', 1, level) FROM DUAL'
      
        '                        connect by REGEXP_SUBSTR(:COD_MATERIAL_C' +
        'ALCADO, '#39'[^,]+'#39', 1, level) IS NOT NULL))) '
      '                AND'
      '                (:COD_CONFIG_CALCADO IS NULL OR'
      
        '                    (P.COD_PRODUTO = PCC.COD_PRODUTO AND PCC.COD' +
        '_CONFIG_CALCADO IN ('
      
        '                        SELECT REGEXP_SUBSTR(:COD_CONFIG_CALCADO' +
        ','#39'[^,]+'#39', 1, level) FROM DUAL'
      
        '                        connect by REGEXP_SUBSTR(:COD_CONFIG_CAL' +
        'CADO, '#39'[^,]+'#39', 1, level) IS NOT NULL)))'
      '                AND   '
      '                (:IND_SOLADO IS NULL'
      '                    OR P.IND_SOLADO = :IND_SOLADO)'
      '                AND'
      '                (:IND_BICO IS NULL'
      '                    OR P.IND_BICO = :IND_BICO)'
      '                AND'
      '                (:IND_ENFEITE IS NULL'
      '                    OR P.IND_ENFEITE = :IND_ENFEITE)'
      '                AND'
      '                (:DESC_TIME IS NULL'
      '                    OR P.DESC_TIME LIKE :DESC_TIME)'
      '                AND'
      '                (:DESC_ESPORTE IS NULL'
      '                    OR P.DESC_ESPORTE LIKE :DESC_ESPORTE)'
      '                AND'
      '                (:DESC_COR IS NULL'
      
        '                    OR (INSTR(P.DESC_PRODUTO, :DESC_COR, 1, 1) >' +
        ' 0))'
      '                AND'
      '                (:DESC_REFERENCIA IS NULL'
      
        '                    OR (INSTR(P.DESC_PRODUTO, :DESC_REFERENCIA, ' +
        '1, 1) > 0))'
      '                AND'
      '                (:COD_MARCA IS NULL'
      '                    OR P.COD_MARCA = :COD_MARCA)'
      '                AND'
      '                ('
      '                    E.COD_LOTE_TIPO = 1 '
      '                    OR'
      
        '                    E.COD_LOTE_TIPO BETWEEN :COD_LOTE_TIPO_INI A' +
        'ND :COD_LOTE_TIPO_FIN'
      '                )                '
      '                AND'
      '                N.DT_EMISSAO BETWEEN :DT_INI AND :DT_FIN'
      '                AND'
      '                N.IND_SITUACAO = '#39'2'#39
      '                AND'
      #9#9'  ('
      '                '#9'O.IND_VENDAS = '#39'V'#39
      '                '#9'OR'
      '                '#9'O.IND_COMPRAS = '#39'C'#39
      #9#9'  )'
      #9#9'*/'
      '        ) q'
      '        GROUP BY'
      '            DESC_MARCA,'
      '            DESC_CLASSE,'
      '            COD_PRODUTO,'
      '            DESC_PRODUTO,'
      '            NUM_FABRICANTE,'
      '            :COD_LOTE_TIPO_1,'
      '            :COD_LOTE_TIPO_2,'
      '            :COD_LOTE_TIPO_3,'
      '            :COD_LOTE_TIPO_4,'
      '            :COD_LOTE_TIPO_5,'
      '            :COD_LOTE_TIPO_6,'
      '            :COD_LOTE_TIPO_7,'
      '            :COD_LOTE_TIPO_8,'
      '            :COD_LOTE_TIPO_9,'
      '            :COD_LOTE_TIPO_10,'
      '            :COD_LOTE_TIPO_11,'
      '            :COD_LOTE_TIPO_12'
      '    )'
      ')'
      'GROUP BY'
      '    DESC_MARCA_CLASSE,'
      '    COD_PRODUTO,'
      '    DESC_PRODUTO,'
      '    NUM_FABRICANTE,'
      '    TAMANHO_1,'
      '    TAMANHO_2,'
      '    TAMANHO_3,'
      '    TAMANHO_4,'
      '    TAMANHO_5,'
      '    TAMANHO_6,'
      '    TAMANHO_7,'
      '    TAMANHO_8,'
      '    TAMANHO_9,'
      '    TAMANHO_10,'
      '    TAMANHO_11,'
      '    TAMANHO_12,'
      '    TOTAL_COMPRADO,'
      '    TOTAL_ESTOQUE'
      
        '/* HAVING - retirado a pedido da loriane no dia 13/02/2020 - Ces' +
        'ar'
      '    (SUM(QT_ESTOQUE_2) > 0 OR'
      '    SUM(QT_ESTOQUE_3) > 0 OR'
      '    SUM(QT_ESTOQUE_4) > 0 OR'
      '    SUM(QT_ESTOQUE_5) > 0 OR'
      '    SUM(QT_ESTOQUE_6) > 0 OR'
      '    SUM(QT_ESTOQUE_7) > 0 OR'
      '    SUM(QT_ESTOQUE_8) > 0 OR'
      '    SUM(QT_ESTOQUE_9) > 0 OR'
      '    SUM(QT_ESTOQUE_10) > 0 OR'
      '    SUM(QT_ESTOQUE_11) > 0 OR'
      '    SUM(QT_ESTOQUE_12) > 0)'
      '*/'
      'ORDER BY'
      '    DESC_MARCA_CLASSE ASC,'
      '    COD_PRODUTO DESC,'
      '    DESC_PRODUTO')
    Variables.Data = {
      030000001E000000100000003A434F445F4C4F54455F5449504F5F3103000000
      040000000100000000000000070000003A44545F494E490C0000000700000078
      77070101010100000000070000003A44545F46494E0C00000007000000787808
      0A01010100000000100000003A434F445F4C4F54455F5449504F5F3203000000
      040000002100000000000000100000003A434F445F4C4F54455F5449504F5F33
      03000000040000002200000000000000100000003A434F445F4C4F54455F5449
      504F5F3403000000040000002300000000000000100000003A434F445F4C4F54
      455F5449504F5F3503000000040000002400000000000000100000003A434F44
      5F4C4F54455F5449504F5F360300000004000000250000000000000010000000
      3A434F445F4C4F54455F5449504F5F3703000000040000002600000000000000
      100000003A434F445F4C4F54455F5449504F5F38030000000400000027000000
      00000000100000003A434F445F4C4F54455F5449504F5F390300000004000000
      28000000000000000E0000003A434F445F4C4F54455F5449504F030000000000
      0000000000000B0000003A434F445F434C415353450300000004000000FD0300
      0000000000130000003A434F445F47454E45524F5F43414C4341444F0A000000
      0000000000000000120000003A434F445F53414C544F5F43414C4341444F0A00
      00000000000000000000150000003A434F445F4D4154455249414C5F43414C43
      41444F0A0000000000000000000000130000003A434F445F434F4E4649475F43
      414C4341444F0A00000000000000000000000B0000003A494E445F534F4C4144
      4F050000000000000000000000090000003A494E445F4249434F050000000000
      0000000000000C0000003A494E445F454E464549544505000000000000000000
      00000A0000003A444553435F54494D450500000000000000000000000D000000
      3A444553435F4553504F525445050000000000000000000000090000003A4445
      53435F434F520500000000000000000000000A0000003A434F445F4D41524341
      050000000000000000000000120000003A434F445F4C4F54455F5449504F5F49
      4E4903000000040000002100000000000000120000003A434F445F4C4F54455F
      5449504F5F46494E03000000040000002800000000000000110000003A434F44
      5F4C4F54455F5449504F5F3130030000000000000000000000110000003A434F
      445F4C4F54455F5449504F5F3131030000000000000000000000110000003A43
      4F445F4C4F54455F5449504F5F3132030000000000000000000000100000003A
      444553435F5245464552454E434941050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000002A0000000B000000434F445F50524F4455544F0100000000000C0000
      00444553435F50524F4455544F0100000000000900000054414D414E484F5F31
      0100000000000C00000051545F4553544F5155455F310100000000000D000000
      51545F434F4D505241444F5F310100000000000900000054414D414E484F5F32
      0100000000000C00000051545F4553544F5155455F320100000000000D000000
      51545F434F4D505241444F5F320100000000000900000054414D414E484F5F33
      0100000000000C00000051545F4553544F5155455F330100000000000D000000
      51545F434F4D505241444F5F330100000000000900000054414D414E484F5F34
      0100000000000C00000051545F4553544F5155455F340100000000000D000000
      51545F434F4D505241444F5F340100000000000900000054414D414E484F5F35
      0100000000000C00000051545F4553544F5155455F350100000000000D000000
      51545F434F4D505241444F5F350100000000000900000054414D414E484F5F36
      0100000000000C00000051545F4553544F5155455F360100000000000D000000
      51545F434F4D505241444F5F360100000000000900000054414D414E484F5F37
      0100000000000C00000051545F4553544F5155455F370100000000000D000000
      51545F434F4D505241444F5F370100000000000900000054414D414E484F5F38
      0100000000000C00000051545F4553544F5155455F380100000000000D000000
      51545F434F4D505241444F5F380100000000000900000054414D414E484F5F39
      0100000000000C00000051545F4553544F5155455F390100000000000D000000
      51545F434F4D505241444F5F3901000000000011000000444553435F4D415243
      415F434C415353450100000000000E0000004E554D5F464142524943414E5445
      0100000000000A00000054414D414E484F5F31300100000000000D0000005154
      5F4553544F5155455F31300100000000000E00000051545F434F4D505241444F
      5F31300100000000000A00000054414D414E484F5F31310100000000000D0000
      0051545F4553544F5155455F31310100000000000E00000051545F434F4D5052
      41444F5F31310100000000000A00000054414D414E484F5F3132010000000000
      0D00000051545F4553544F5155455F31320100000000000E00000051545F434F
      4D505241444F5F31320100000000000E000000544F54414C5F434F4D50524144
      4F0100000000000D000000544F54414C5F4553544F515545010000000000}
    Session = DMOracle.DBCemapa
    Left = 1008
    Top = 204
    object QRInformacaoVenda2DESC_MARCA_CLASSE: TStringField
      FieldName = 'DESC_MARCA_CLASSE'
      Size = 153
    end
    object QRInformacaoVenda2COD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRInformacaoVenda2DESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QRInformacaoVenda2NUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
      Size = 21
    end
    object QRInformacaoVenda2TAMANHO_1: TStringField
      FieldName = 'TAMANHO_1'
      Size = 2
    end
    object QRInformacaoVenda2TAMANHO_2: TStringField
      FieldName = 'TAMANHO_2'
      Size = 2
    end
    object QRInformacaoVenda2TAMANHO_3: TStringField
      FieldName = 'TAMANHO_3'
      Size = 2
    end
    object QRInformacaoVenda2TAMANHO_4: TStringField
      FieldName = 'TAMANHO_4'
      Size = 2
    end
    object QRInformacaoVenda2TAMANHO_5: TStringField
      FieldName = 'TAMANHO_5'
      Size = 2
    end
    object QRInformacaoVenda2TAMANHO_6: TStringField
      FieldName = 'TAMANHO_6'
      Size = 2
    end
    object QRInformacaoVenda2TAMANHO_7: TStringField
      FieldName = 'TAMANHO_7'
      Size = 2
    end
    object QRInformacaoVenda2TAMANHO_8: TStringField
      FieldName = 'TAMANHO_8'
      Size = 2
    end
    object QRInformacaoVenda2TAMANHO_9: TStringField
      FieldName = 'TAMANHO_9'
      Size = 2
    end
    object QRInformacaoVenda2TAMANHO_10: TStringField
      FieldName = 'TAMANHO_10'
      Size = 2
    end
    object QRInformacaoVenda2TAMANHO_11: TStringField
      FieldName = 'TAMANHO_11'
      Size = 2
    end
    object QRInformacaoVenda2TAMANHO_12: TStringField
      FieldName = 'TAMANHO_12'
      Size = 2
    end
    object QRInformacaoVenda2TOTAL_COMPRADO: TFloatField
      FieldName = 'TOTAL_COMPRADO'
    end
    object QRInformacaoVenda2TOTAL_ESTOQUE: TFloatField
      FieldName = 'TOTAL_ESTOQUE'
    end
    object QRInformacaoVenda2QT_ESTOQUE_1: TFloatField
      FieldName = 'QT_ESTOQUE_1'
    end
    object QRInformacaoVenda2QT_ESTOQUE_2: TFloatField
      FieldName = 'QT_ESTOQUE_2'
    end
    object QRInformacaoVenda2QT_ESTOQUE_3: TFloatField
      FieldName = 'QT_ESTOQUE_3'
    end
    object QRInformacaoVenda2QT_ESTOQUE_4: TFloatField
      FieldName = 'QT_ESTOQUE_4'
    end
    object QRInformacaoVenda2QT_ESTOQUE_5: TFloatField
      FieldName = 'QT_ESTOQUE_5'
    end
    object QRInformacaoVenda2QT_ESTOQUE_6: TFloatField
      FieldName = 'QT_ESTOQUE_6'
    end
    object QRInformacaoVenda2QT_ESTOQUE_7: TFloatField
      FieldName = 'QT_ESTOQUE_7'
    end
    object QRInformacaoVenda2QT_ESTOQUE_8: TFloatField
      FieldName = 'QT_ESTOQUE_8'
    end
    object QRInformacaoVenda2QT_ESTOQUE_9: TFloatField
      FieldName = 'QT_ESTOQUE_9'
    end
    object QRInformacaoVenda2QT_ESTOQUE_10: TFloatField
      FieldName = 'QT_ESTOQUE_10'
    end
    object QRInformacaoVenda2QT_ESTOQUE_11: TFloatField
      FieldName = 'QT_ESTOQUE_11'
    end
    object QRInformacaoVenda2QT_ESTOQUE_12: TFloatField
      FieldName = 'QT_ESTOQUE_12'
    end
    object QRInformacaoVenda2QT_COMPRADO_1: TFloatField
      FieldName = 'QT_COMPRADO_1'
    end
    object QRInformacaoVenda2QT_COMPRADO_2: TFloatField
      FieldName = 'QT_COMPRADO_2'
    end
    object QRInformacaoVenda2QT_COMPRADO_3: TFloatField
      FieldName = 'QT_COMPRADO_3'
    end
    object QRInformacaoVenda2QT_COMPRADO_4: TFloatField
      FieldName = 'QT_COMPRADO_4'
    end
    object QRInformacaoVenda2QT_COMPRADO_5: TFloatField
      FieldName = 'QT_COMPRADO_5'
    end
    object QRInformacaoVenda2QT_COMPRADO_6: TFloatField
      FieldName = 'QT_COMPRADO_6'
    end
    object QRInformacaoVenda2QT_COMPRADO_7: TFloatField
      FieldName = 'QT_COMPRADO_7'
    end
    object QRInformacaoVenda2QT_COMPRADO_8: TFloatField
      FieldName = 'QT_COMPRADO_8'
    end
    object QRInformacaoVenda2QT_COMPRADO_9: TFloatField
      FieldName = 'QT_COMPRADO_9'
    end
    object QRInformacaoVenda2QT_COMPRADO_10: TFloatField
      FieldName = 'QT_COMPRADO_10'
    end
    object QRInformacaoVenda2QT_COMPRADO_11: TFloatField
      FieldName = 'QT_COMPRADO_11'
    end
    object QRInformacaoVenda2QT_COMPRADO_12: TFloatField
      FieldName = 'QT_COMPRADO_12'
    end
  end
  object QRDetalhamentoFunrural: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  N.COD_CADASTRO,'
      '  SUM(NI.VAL_TOTAL) SVAL_TOTAL,'
      '  SUM(NI.VAL_TOTAL) * :CPREV / 100 CPREV,'
      '  SUM(NI.VAL_TOTAL) * :RAT / 100 RAT,'
      '  SUM(NI.VAL_TOTAL) * :SENAR / 100 SENAR,'
      '  C.NOME,'
      '  C.NUM_CGC_CPF'
      'FROM'
      '  TB_NOTA_ITEM NI'
      'INNER JOIN'
      '  TB_NOTA_CAB N'
      'ON'
      '  N.COD_NOTA_CAB = NI.COD_NOTA_CAB'
      'INNER JOIN'
      '  TB_CADASTRO C'
      'ON'
      '  C.COD_CADASTRO = N.COD_CADASTRO'
      'INNER JOIN'
      '  TB_FILIAL F'
      'ON'
      '  F.COD_FILIAL = N.COD_FILIAL'
      'WHERE'
      '  (:COD_CADASTRO IS NULL OR'
      '   N.COD_CADASTRO = :COD_CADASTRO)'
      'AND'
      '  (:COD_FILIAL IS NULL OR'
      '   N.COD_FILIAL = :COD_FILIAL)'
      'AND'
      '  NVL(N.VAL_FUNRURAL, 0) > 0'
      'AND'
      '  :OPERACAO'
      'AND'
      '  (N.DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL) '
      'group by N.COD_CADASTRO, C.NOME, C.NUM_CGC_CPF'
      'ORDER BY C.NOME')
    Variables.Data = {
      03000000080000000D0000003A434F445F434144415354524F03000000000000
      00000000000B0000003A44545F494E494349414C0C0000000000000000000000
      090000003A44545F46494E414C0C00000000000000000000000B0000003A434F
      445F46494C49414C030000000000000000000000090000003A4F504552414341
      4F0100000004000000313D310000000000060000003A43505245560400000000
      00000000000000040000003A524154040000000000000000000000060000003A
      53454E4152040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000C000000434F445F434144415354524F0100000000000A00
      00005356414C5F544F54414C0100000000000500000043505245560100000000
      00030000005241540100000000000500000053454E4152010000000000040000
      004E4F4D450100000000000B0000004E554D5F4347435F435046010000000000}
    Session = DMOracle.DBCemapa
    Left = 1016
    Top = 282
    object QRDetalhamentoFunruralCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRDetalhamentoFunruralSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object QRDetalhamentoFunruralCPREV: TFloatField
      FieldName = 'CPREV'
      DisplayFormat = '###,###,##0.00'
    end
    object QRDetalhamentoFunruralRAT: TFloatField
      FieldName = 'RAT'
      DisplayFormat = '###,###,##0.00'
    end
    object QRDetalhamentoFunruralSENAR: TFloatField
      FieldName = 'SENAR'
      DisplayFormat = '###,###,##0.00'
    end
    object QRDetalhamentoFunruralNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QRDetalhamentoFunruralNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
  end
  object QRVendaInfAddItem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_NOTA_CAB.COD_CADASTRO,'
      '  TB_NOTA_ITEM.COD_PRODUTO,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_PRODUTO.NUM_EMBALAGEM,'
      '  TB_PRODUTO.DESC_UNIDADE,'
      '  UPPER(TB_NOTA_ITEM.DESC_INF_ADICIONAL) AS DESC_INF_ADICIONAL,'
      '  TB_CADASTRO.NOME,'
      '  SUM(TB_NOTA_ITEM.QT_QUANTIDADE) AS QT_QUANTIDADE,'
      
        '  SUM(TB_NOTA_ITEM.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.C' +
        'OD_NOTA_ITEM) +TB_NOTA_ITEM.VAL_DESPESAS) AS SVAL_TOTAL'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_PRODUTO,'
      '  TB_CADASTRO'
      'WHERE '
      '  TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      'AND'
      '  TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      'AND'
      '  TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      'AND'
      ' (:COD_FILIAL IS NULL'
      '  OR'
      ' TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      'AND'
      '  :COD_OPERACAO'
      'AND'
      '  :COD_SERIE'
      'AND'
      '  TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      'AND'
      '  TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      'AND'
      '  (:COD_CADASTRO IS NULL '
      '   OR'
      '  TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO)'
      'AND'
      '  (:DESC_INF_ADICIONAL IS NULL'
      '   OR'
      
        '  UPPER(TB_NOTA_ITEM.DESC_INF_ADICIONAL) LIKE '#39'%'#39' || :DESC_INF_A' +
        'DICIONAL || '#39'%'#39')'
      'GROUP BY '
      '  TB_NOTA_ITEM.DESC_INF_ADICIONAL,'
      '  TB_NOTA_CAB.COD_CADASTRO,'
      '  TB_NOTA_ITEM.COD_PRODUTO,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_PRODUTO.NUM_EMBALAGEM,'
      '  TB_PRODUTO.DESC_UNIDADE,'
      '  TB_CADASTRO.NOME'
      'ORDER BY'
      '  TB_NOTA_CAB.COD_CADASTRO')
    Variables.Data = {
      0300000007000000070000003A444154415F490C000000000000000000000007
      0000003A444154415F460C00000000000000000000000D0000003A434F445F43
      4144415354524F0300000000000000000000000A0000003A434F445F53455249
      450100000000000000000000000D0000003A434F445F4F5045524143414F0100
      00000000000000000000130000003A444553435F494E465F41444943494F4E41
      4C0500000000000000000000000B0000003A434F445F46494C49414C03000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000B000000434F445F50524F4455544F0100000000000C0000
      00444553435F50524F4455544F0100000000000A0000005356414C5F544F5441
      4C0100000000000C000000434F445F434144415354524F0100000000000D0000
      004E554D5F454D42414C4147454D0100000000000C000000444553435F554E49
      44414445010000000000040000004E4F4D450100000000000D00000051545F51
      55414E54494441444501000000000012000000444553435F494E465F41444943
      494F4E414C010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRMapaVendaCalcFields
    Left = 889
    Top = 17
    object QRVendaInfAddItemCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRVendaInfAddItemCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRVendaInfAddItemDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QRVendaInfAddItemNUM_EMBALAGEM: TFloatField
      FieldName = 'NUM_EMBALAGEM'
    end
    object QRVendaInfAddItemDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 3
    end
    object QRVendaInfAddItemNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QRVendaInfAddItemQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QRVendaInfAddItemSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object QRVendaInfAddItemDESC_INF_ADICIONAL: TStringField
      FieldName = 'DESC_INF_ADICIONAL'
      Size = 500
    end
  end
  object QRNotasLoteCadastro: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  PROD.DESC_PRODUTO,'
      '  LOTE.DESC_LOTE,'
      '  CAD.NOME,'
      '  SUM(NOTAIT.QT_QUANTIDADE) AS QT_QUANTIDADE'
      'FROM'
      '  TB_NOTA_CAB NOTA,'
      '  TB_NOTA_ITEM NOTAIT,'
      '  TB_CADASTRO CAD,'
      '  TB_LOTE_TIPO LOTE,'
      '  TB_CLASSE CLASSE,'
      '  TB_PRODUTO PROD'
      'WHERE'
      '  NOTA.COD_NOTA_CAB = NOTAIT.COD_NOTA_CAB'
      '  AND'
      '  NOTA.COD_CADASTRO = CAD.COD_CADASTRO'
      '  AND'
      '  NOTAIT.COD_PRODUTO = PROD.COD_PRODUTO'
      '  AND'
      '  PROD.COD_CLASSE = CLASSE.COD_CLASSE'
      '  AND'
      '  NOTAIT.COD_LOTE_TIPO = LOTE.COD_LOTE_TIPO'
      '  AND'
      '  (:FILIAL IS NULL OR :FILIAL = NOTA.COD_FILIAL)'
      '  AND'
      '  (:CADASTRO IS NULL OR :CADASTRO = NOTA.COD_CADASTRO)'
      '  AND'
      '  (:CLASSE IS NULL OR :CLASSE = PROD.COD_CLASSE)'
      '  AND'
      '  (:PRODUTO IS NULL OR :PRODUTO = NOTAIT.COD_PRODUTO)'
      '  AND'
      '  (:LOTE IS NULL OR :LOTE = NOTAIT.COD_LOTE_TIPO)'
      '  AND'
      '  (:OPERACAO IS NULL OR :OPERACAO = NOTA.COD_OPERACAO)'
      '  AND'
      '  NOTA.DT_EMISSAO >= :DATA_I'
      '  AND'
      '  NOTA.DT_EMISSAO <= :DATA_F'
      'GROUP BY'
      '  PROD.DESC_PRODUTO,'
      '  LOTE.DESC_LOTE,'
      '  CAD.NOME'
      'ORDER BY'
      '  :ORDEM')
    Variables.Data = {
      0300000009000000070000003A444154415F4905000000000000000000000007
      0000003A444154415F46050000000000000000000000070000003A46494C4941
      4C050000000000000000000000090000003A434144415354524F050000000000
      000000000000070000003A434C41535345050000000000000000000000080000
      003A50524F4455544F050000000000000000000000050000003A4C4F54450500
      00000000000000000000090000003A4F5045524143414F050000000000000000
      000000060000003A4F5244454D010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000C000000444553435F50524F4455544F0100000000000900
      0000444553435F4C4F5445010000000000040000004E4F4D450100000000000D
      00000051545F5155414E544944414445010000000000}
    Session = DMOracle.DBCemapa
    Left = 888
    Top = 74
  end
  object QRelEspelhoNota: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_NOTA_CAB.COD_NOTA_CAB,'
      '  TB_NOTA_ITEM.COD_NOTA_ITEM,'
      
        '  DECODE(TB_NOTA_CAB.IND_CONDICAO_PAGTO ,1, '#39#192' VISTA'#39', 2, '#39#192' PRA' +
        'ZO'#39', 3, '#39'OUTROS'#39') AS IND_PAGAMENTO,'
      '  TB_NOTA_CAB.COD_CADASTRO,'
      '  TB_NOTA_CAB.COD_VENDEDOR,'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      '  TB_NOTA_CAB.OBS,'
      '  TB_NOTA_CAB.COD_SERIE,'
      '  TB_NOTA_CAB.COD_SERIE_MODELO,'#9
      '  TB_NOTA_CAB.NUM_NOTA,'
      '  TB_NOTA_CAB.COD_ORDEM_SERVICO_CAB,'
      
        '  TB_NOTA_CAB.DESC_OBS_CORPO_NOTA || '#39' '#39' || DECODE(TB_NOTA_CAB.O' +
        'BS,'#39#39',TB_NOTA_CAB.OBS_COMPLEMENTO,TB_NOTA_CAB.OBS|| '#39' '#39' || TB_NO' +
        'TA_CAB.OBS_COMPLEMENTO) AS DESC_OBS_CORPO_NOTA,'
      
        '--  TB_NOTA_CAB.DESC_OBS_CORPO_NOTA || '#39' '#39' || TB_NOTA_CAB.OBS AS' +
        ' DESC_OBS_CORPO_NOTA ,'
      '  TB_NOTA_CAB.VAL_AVISTA,'
      '  TB_NOTA_ITEM.COD_PRODUTO,'
      '  TB_NOTA_ITEM.QT_QUANTIDADE,'
      '  TB_NOTA_ITEM.VAL_UNITARIO,'
      '  TB_NOTA_ITEM.VAL_TOTAL,'#9
      '  TB_NOTA_ITEM.DESC_INF_ADICIONAL,'
      
        '  PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) as VAL_DESCONTO' +
        ','
      '  TB_NOTA_ITEM.VAL_ICMS_SUBST AS VAL_TOTAL_ICMS_SUBST,'
      
        '  SUM(TB_NOTA_ITEM.VAL_DESPESAS + TB_NOTA_ITEM.VAL_FRETE + TB_NO' +
        'TA_ITEM.VAL_ICMS_SUBST) AS VAL_ACRESCIMO,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_PRODUTO.NUM_FABRICANTE,'
      '  TB_PRODUTO.NUM_GENERO_NCM,'
      '  TB_PRODUTO.DESC_UNIDADE,'
      '  TB_PRODUTO.IND_TIPO_PRODUTO,'
      '  TB_CADASTRO.NOME,'
      '  TB_CADASTRO.DESC_TELEFONE,'
      '  TB_CADASTRO.NUM_CGC_CPF,'
      '  TB_CADASTRO.NUM_INSCRICAO,'
      
        '  TB_CADASTRO.DESC_ENDERECO || '#39' - '#39' || TB_CADASTRO.DESC_BAIRRO ' +
        'AS DESC_ENDERECO,'
      
        '  TB_CADASTRO.DESC_CIDADE || '#39' - '#39'|| TB_CADASTRO.COD_ESTADO AS D' +
        'ESC_CIDADE,'
      '  TB_VENDEDOR.NOME AS NOME_VENDEDOR,'
      '  TB_TECNICO.COD_VENDEDOR AS COD_TECNICO,'
      '  TB_TECNICO.NOME AS NOME_TECNICO,'
      '  TB_TECNICO2.COD_VENDEDOR AS COD_TECNICO2,'
      '  TB_TECNICO2.NOME AS NOME_TECNICO2,'
      '  TB_TECNICO3.COD_VENDEDOR AS COD_TECNICO3,'
      '  TB_TECNICO3.NOME AS NOME_TECNICO3,'
      '  TB_FILIAL.COD_FILIAL,'
      '  TB_FILIAL.DESC_FILIAL,'
      
        '  TB_FILIAL.DESC_ENDERECO || '#39' - '#39' || TB_FILIAL.DESC_BAIRRO AS D' +
        'ESC_ENDERECO_FILIAL,'
      
        '  TB_FILIAL.DESC_CIDADE || '#39' - '#39' || TB_FILIAL.COD_ESTADO AS DESC' +
        '_CIDADE_FILIAL,'
      '  TB_FILIAL.NUM_CGC AS NUM_CNPJ_FILIAL,'
      '  TB_FILIAL.DESC_INSCRICAO AS DESC_IE_FILIAL,'
      '  TB_FILIAL.DESC_TELEFONE AS FONE_FILIAL,'
      '  SUM(TB_NOTA_ITEM.VAL_DESPESAS) AS SVAL_DESPESAS,'
      '  SUM(TB_NOTA_ITEM.VAL_FRETE) AS SVAL_FRETE,'
      '  SUM(TB_NOTA_ITEM.VAL_ICMS_SUBST) AS SVAL_ICMS_SUBST,'
      
        '  TB_MENSAGEM.DESC_MENSAGEM || '#39'. '#39' || TB_MENSAGEM.DESC_COMPLEME' +
        'NTO AS DESC_MENSAGEM,'
      '  TB_PARAM_SISTEMA.DESC_EMPRESA'
      'FROM '
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM, '
      '  TB_PRODUTO, '
      '  TB_CADASTRO, '
      '  TB_VENDEDOR, '
      '  TB_VENDEDOR TB_TECNICO, '
      '  TB_VENDEDOR TB_TECNICO2,'
      '  TB_VENDEDOR TB_TECNICO3,'
      '  TB_ORDEM_SERVICO_CAB,'
      '  TB_FILIAL,'
      '  TB_MENSAGEM,'
      '  TB_PARAM_SISTEMA'
      'WHERE'
      '  TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      'AND'
      '  TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      'AND'
      '  TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      'AND'
      '  TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      'AND'
      
        '  TB_NOTA_CAB.COD_ORDEM_SERVICO_CAB = TB_ORDEM_SERVICO_CAB.COD_O' +
        'RDEM_SERVICO_CAB(+)'
      'AND'
      '  TB_ORDEM_SERVICO_CAB.COD_TECNICO = TB_TECNICO.COD_VENDEDOR(+)'
      'AND'
      
        '  TB_ORDEM_SERVICO_CAB.COD_TECNICO2 = TB_TECNICO2.COD_VENDEDOR(+' +
        ')'
      'AND'
      
        '  TB_ORDEM_SERVICO_CAB.COD_TECNICO3 = TB_TECNICO3.COD_VENDEDOR(+' +
        ')'
      'AND'
      '  TB_NOTA_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      'AND'
      '  TB_NOTA_CAB.COD_MENSAGEM = TB_MENSAGEM.COD_MENSAGEM(+)'
      'AND'
      '  TB_NOTA_CAB.COD_NOTA_CAB = :PK'
      'GROUP BY'
      '  TB_NOTA_CAB.COD_NOTA_CAB,'
      '  TB_NOTA_ITEM.COD_NOTA_ITEM,'
      '  TB_NOTA_CAB.IND_CONDICAO_PAGTO,'
      '  TB_NOTA_CAB.COD_CADASTRO,'
      '  TB_NOTA_CAB.COD_VENDEDOR,'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      '  TB_NOTA_CAB.OBS,'
      '  TB_NOTA_CAB.COD_SERIE,'
      '  TB_NOTA_CAB.COD_SERIE_MODELO,'
      '  TB_NOTA_CAB.NUM_NOTA,'
      '  TB_NOTA_CAB.COD_ORDEM_SERVICO_CAB,'
      
        '  TB_NOTA_CAB.DESC_OBS_CORPO_NOTA || '#39' '#39' || DECODE(TB_NOTA_CAB.O' +
        'BS,'#39#39',TB_NOTA_CAB.OBS_COMPLEMENTO,TB_NOTA_CAB.OBS|| '#39' '#39' || TB_NO' +
        'TA_CAB.OBS_COMPLEMENTO),'
      '--  TB_NOTA_CAB.DESC_OBS_CORPO_NOTA || '#39' '#39' || TB_NOTA_CAB.OBS,'
      '  TB_NOTA_CAB.VAL_AVISTA,'
      '  TB_NOTA_ITEM.COD_PRODUTO,'
      '  TB_NOTA_ITEM.QT_QUANTIDADE,'
      '  TB_NOTA_ITEM.VAL_UNITARIO,'
      '  TB_NOTA_ITEM.VAL_TOTAL,'
      '  TB_NOTA_ITEM.DESC_INF_ADICIONAL,'
      '  PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM),'
      '  TB_NOTA_ITEM.VAL_ICMS_SUBST ,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_PRODUTO.NUM_FABRICANTE,'
      '  TB_PRODUTO.NUM_GENERO_NCM,'
      '  TB_PRODUTO.DESC_UNIDADE,'
      '  TB_PRODUTO.IND_TIPO_PRODUTO,'
      '  TB_CADASTRO.NOME,'
      '  TB_CADASTRO.DESC_TELEFONE,'
      '  TB_CADASTRO.NUM_CGC_CPF,'
      '  TB_CADASTRO.NUM_INSCRICAO,'
      
        '  TB_CADASTRO.DESC_ENDERECO || '#39' - '#39' || TB_CADASTRO.DESC_BAIRRO ' +
        ','
      '  TB_CADASTRO.DESC_CIDADE || '#39' - '#39'|| TB_CADASTRO.COD_ESTADO,'
      '  TB_VENDEDOR.NOME,'
      '  TB_TECNICO.COD_VENDEDOR,'
      '  TB_TECNICO.NOME,'
      '  TB_TECNICO2.COD_VENDEDOR,'
      '  TB_TECNICO2.NOME,'
      '  TB_TECNICO3.COD_VENDEDOR,'
      '  TB_TECNICO3.NOME,'
      '  TB_FILIAL.COD_FILIAL,'
      '  TB_FILIAL.DESC_FILIAL,'
      '  TB_FILIAL.DESC_ENDERECO || '#39' - '#39' || TB_FILIAL.DESC_BAIRRO ,'
      '  TB_FILIAL.DESC_CIDADE || '#39' - '#39' || TB_FILIAL.COD_ESTADO ,'
      '  TB_FILIAL.NUM_CGC,'
      '  TB_FILIAL.DESC_INSCRICAO,'
      '  TB_FILIAL.DESC_TELEFONE,'
      
        '  TB_MENSAGEM.DESC_MENSAGEM || '#39'. '#39'  || TB_MENSAGEM.DESC_COMPLEM' +
        'ENTO,'
      '  TB_PARAM_SISTEMA.DESC_EMPRESA'
      'order by TB_PRODUTO.IND_TIPO_PRODUTO, TB_NOTA_ITEM.COD_NOTA_ITEM')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000330000000C000000434F445F4E4F54415F4341420100000000000A00
      000044545F454D495353414F0100000000000C000000434F445F434144415354
      524F010000000000040000004E4F4D450100000000000C000000434F445F5645
      4E4445444F52010000000000030000004F42530100000000000B000000434F44
      5F50524F4455544F0100000000000D00000051545F5155414E54494441444501
      00000000000C00000056414C5F554E49544152494F0100000000000900000056
      414C5F544F54414C0100000000000C000000444553435F50524F4455544F0100
      000000000E0000004E554D5F464142524943414E54450100000000000C000000
      444553435F554E49444144450100000000000D000000444553435F454E444552
      45434F0100000000000B000000444553435F4349444144450100000000000D00
      00004E4F4D455F56454E4445444F520100000000000D000000444553435F5445
      4C45464F4E450100000000000B0000004E554D5F4347435F4350460100000000
      000D0000004E554D5F494E5343524943414F0100000000000B00000044455343
      5F46494C49414C0100000000000B000000464F4E455F46494C49414C01000000
      000014000000444553435F454E44455245434F5F46494C49414C010000000000
      12000000444553435F4349444144455F46494C49414C01000000000010000000
      494E445F5449504F5F50524F4455544F0100000000000C00000056414C5F4445
      53434F4E544F010000000000080000004E554D5F4E4F54410100000000001400
      000056414C5F544F54414C5F49434D535F53554253540100000000000D000000
      56414C5F414352455343494D4F01000000000013000000444553435F4F42535F
      434F52504F5F4E4F54410100000000000D0000005356414C5F44455350455341
      530100000000000A0000005356414C5F46524554450100000000000F00000053
      56414C5F49434D535F53554253540100000000000D000000494E445F50414741
      4D454E544F01000000000009000000434F445F53455249450100000000000F00
      00004E554D5F434E504A5F46494C49414C0100000000000E000000444553435F
      49455F46494C49414C0100000000000A000000434F445F46494C49414C010000
      00000012000000444553435F494E465F41444943494F4E414C0100000000000B
      000000434F445F5445434E49434F0100000000000C0000004E4F4D455F544543
      4E49434F0100000000000C000000434F445F5445434E49434F32010000000000
      0D0000004E4F4D455F5445434E49434F320100000000000C000000434F445F54
      45434E49434F330100000000000D0000004E4F4D455F5445434E49434F330100
      000000000D000000434F445F4E4F54415F4954454D0100000000000D00000044
      4553435F4D454E534147454D0100000000000E0000004E554D5F47454E45524F
      5F4E434D01000000000015000000434F445F4F5244454D5F5345525649434F5F
      4341420100000000000A00000056414C5F415649535441010000000000100000
      00434F445F53455249455F4D4F44454C4F0100000000000C000000444553435F
      454D5052455341010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRelEspelhoNotaCalcFields
    Left = 912
    Top = 472
    object QRelEspelhoNotaCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QRelEspelhoNotaCOD_NOTA_ITEM: TIntegerField
      FieldName = 'COD_NOTA_ITEM'
      Required = True
    end
    object QRelEspelhoNotaIND_PAGAMENTO: TStringField
      FieldName = 'IND_PAGAMENTO'
      Size = 7
    end
    object QRelEspelhoNotaCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRelEspelhoNotaCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QRelEspelhoNotaDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRelEspelhoNotaOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
    object QRelEspelhoNotaCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QRelEspelhoNotaNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRelEspelhoNotaDESC_OBS_CORPO_NOTA: TStringField
      FieldName = 'DESC_OBS_CORPO_NOTA'
      Size = 2302
    end
    object QRelEspelhoNotaCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRelEspelhoNotaQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object QRelEspelhoNotaVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QRelEspelhoNotaVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QRelEspelhoNotaDESC_INF_ADICIONAL: TStringField
      FieldName = 'DESC_INF_ADICIONAL'
      Size = 500
    end
    object QRelEspelhoNotaVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
    end
    object QRelEspelhoNotaVAL_TOTAL_ICMS_SUBST: TFloatField
      FieldName = 'VAL_TOTAL_ICMS_SUBST'
    end
    object QRelEspelhoNotaVAL_ACRESCIMO: TFloatField
      FieldName = 'VAL_ACRESCIMO'
    end
    object QRelEspelhoNotaDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QRelEspelhoNotaNUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
      Size = 26
    end
    object QRelEspelhoNotaNUM_GENERO_NCM: TStringField
      FieldName = 'NUM_GENERO_NCM'
      Size = 8
    end
    object QRelEspelhoNotaDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 3
    end
    object QRelEspelhoNotaIND_TIPO_PRODUTO: TStringField
      FieldName = 'IND_TIPO_PRODUTO'
      Required = True
      Size = 11
    end
    object QRelEspelhoNotaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QRelEspelhoNotaDESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 15
    end
    object QRelEspelhoNotaNUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object QRelEspelhoNotaNUM_INSCRICAO: TStringField
      FieldName = 'NUM_INSCRICAO'
    end
    object QRelEspelhoNotaDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      Size = 123
    end
    object QRelEspelhoNotaDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 35
    end
    object QRelEspelhoNotaNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Required = True
      Size = 40
    end
    object QRelEspelhoNotaCOD_TECNICO: TIntegerField
      FieldName = 'COD_TECNICO'
    end
    object QRelEspelhoNotaNOME_TECNICO: TStringField
      FieldName = 'NOME_TECNICO'
      Size = 40
    end
    object QRelEspelhoNotaCOD_TECNICO2: TIntegerField
      FieldName = 'COD_TECNICO2'
    end
    object QRelEspelhoNotaNOME_TECNICO2: TStringField
      FieldName = 'NOME_TECNICO2'
      Size = 40
    end
    object QRelEspelhoNotaCOD_TECNICO3: TIntegerField
      FieldName = 'COD_TECNICO3'
    end
    object QRelEspelhoNotaNOME_TECNICO3: TStringField
      FieldName = 'NOME_TECNICO3'
      Size = 40
    end
    object QRelEspelhoNotaCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QRelEspelhoNotaDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRelEspelhoNotaDESC_ENDERECO_FILIAL: TStringField
      FieldName = 'DESC_ENDERECO_FILIAL'
      Size = 93
    end
    object QRelEspelhoNotaDESC_CIDADE_FILIAL: TStringField
      FieldName = 'DESC_CIDADE_FILIAL'
      Size = 35
    end
    object QRelEspelhoNotaNUM_CNPJ_FILIAL: TStringField
      FieldName = 'NUM_CNPJ_FILIAL'
      Size = 18
    end
    object QRelEspelhoNotaDESC_IE_FILIAL: TStringField
      FieldName = 'DESC_IE_FILIAL'
      Size = 15
    end
    object QRelEspelhoNotaFONE_FILIAL: TStringField
      FieldName = 'FONE_FILIAL'
      Size = 14
    end
    object QRelEspelhoNotaSVAL_DESPESAS: TFloatField
      FieldName = 'SVAL_DESPESAS'
    end
    object QRelEspelhoNotaSVAL_FRETE: TFloatField
      FieldName = 'SVAL_FRETE'
    end
    object QRelEspelhoNotaSVAL_ICMS_SUBST: TFloatField
      FieldName = 'SVAL_ICMS_SUBST'
    end
    object QRelEspelhoNotaCOD_ORDEM_SERVICO_CAB: TIntegerField
      FieldName = 'COD_ORDEM_SERVICO_CAB'
    end
    object QRelEspelhoNotaVAL_AVISTA: TFloatField
      FieldName = 'VAL_AVISTA'
      DisplayFormat = '#,##0.00'
    end
    object QRelEspelhoNotaCOD_SERIE_MODELO: TStringField
      FieldName = 'COD_SERIE_MODELO'
      Size = 2
    end
    object QRelEspelhoNotadt_entrada_os: TDateField
      FieldKind = fkCalculated
      FieldName = 'dt_entrada_os'
      Calculated = True
    end
    object QRelEspelhoNotadt_saida_os: TDateField
      FieldKind = fkCalculated
      FieldName = 'dt_saida_os'
      Calculated = True
    end
    object QRelEspelhoNotaDESC_MENSAGEM: TStringField
      FieldName = 'DESC_MENSAGEM'
      Size = 182
    end
    object QRelEspelhoNotaDESC_EMPRESA: TStringField
      FieldName = 'DESC_EMPRESA'
      Size = 40
    end
  end
  object QRParcelasEspelhoNota: TOracleDataSet1
    SQL.Strings = (
      'SELECT DT_VENCIMENTO, VAL_TITULO'
      'FROM TB_CONTA_RECEBER_CAB WHERE COD_NOTA_CAB = :COD_NOTA_CAB')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000D00000044545F56454E43494D454E544F0100000000000A
      00000056414C5F544954554C4F010000000000}
    Session = DMOracle.DBCemapa
    Left = 912
    Top = 528
    object QRParcelasEspelhoNotaDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
      Required = True
    end
    object QRParcelasEspelhoNotaVAL_TITULO: TFloatField
      FieldName = 'VAL_TITULO'
    end
  end
  object QRResumoVendaOS: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  /*VENDAS PELO MODULO VENDA*/'
      '  SUM(VAL_TOTAL_PVENDA) AS VAL_TOTAL_PVENDA,'
      '  SUM(VAL_TOTAL_DESCONTO_PVENDA) AS VAL_TOTAL_DESCONTO_PVENDA,'
      '  SUM(VAL_TOTAL_ACRESCIMO_PVENDA) AS VAL_TOTAL_ACRESCIMO_PVENDA,'
      '  SUM(VAL_TOTAL_FRETE_PVENDA) AS VAL_TOTAL_FRETE_PVENDA,'
      '  SUM(VAL_TOTAL_TOTAL_ST_PVENDA) AS VAL_TOTAL_TOTAL_ST_PVENDA,'
      '  SUM(VAL_TOTAL_LIQUIDO_PVENDA) AS VAL_TOTAL_LIQUIDO_PVENDA,'
      '  SUM(VAL_AVISTA_PVENDA) AS VAL_AVISTA_PVENDA,'
      '  SUM(VAL_APRAZO_PVENDA) AS VAL_APRAZO_PVENDA,'
      '  /*TIPO PRODUTO(SERVI'#199'O) VEM DA OS*/'
      '  SUM(VAL_TOTAL_SOS) AS VAL_TOTAL_SOS,'
      '  SUM(VAL_TOTAL_DESCONTO_SOS) AS VAL_TOTAL_DESCONTO_SOS,'
      '  SUM(VAL_TOTAL_ACRESCIMO_SOS)AS VAL_TOTAL_ACRESCIMO_SOS,'
      '  SUM(VAL_TOTAL_FRETE_SOS) AS VAL_TOTAL_FRETE_SOS,'
      '  SUM(VAL_LIQUIDO_SOS) AS VAL_LIQUIDO_SOS,'
      '  SUM(VAL_AVISTA_SOS) AS VAL_AVISTA_SOS,'
      '  SUM(VAL_APRAZO_SOS) AS VAL_APRAZO_SOS,'
      '  /*TIPO PRODUTO (COMERCIAL) VEM DA OS*/'
      '  SUM(VAL_TOTAL_POS) AS VAL_TOTAL_POS,'
      '  SUM(VAL_TOTAL_DESCONTO_POS) AS VAL_TOTAL_DESCONTO_POS,'
      '  SUM(VAL_TOTAL_ACRESCIMO_POS) AS VAL_TOTAL_ACRESCIMO_POS,'
      '  SUM(VAL_TOTAL_FRETE_POS) AS VAL_TOTAL_FRETE_POS,'
      '  SUM(VAL_TOTAL_TOTAL_ST_POS) AS VAL_TOTAL_ST_POS,'
      '  SUM(VAL_TOTAL_LIQUIDO_POS) AS VAL_TOTAL_LIQUIDO_POS,'
      '  SUM(VAL_AVISTA_POS) AS VAL_AVISTA_POS,'
      '  SUM(VAL_APRAZO_POS) AS VAL_APRAZO_POS'
      'FROM('
      '  /*VENDA DIRETA PELO MODULO VENDAS*/'
      ' SELECT'
      '   SUM(TB_NOTA_ITEM.VAL_TOTAL) AS VAL_TOTAL_PVENDA,'
      
        '   SUM(PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM)) AS VAL_TO' +
        'TAL_DESCONTO_PVENDA,'
      '   SUM(TB_NOTA_ITEM.VAL_DESPESAS) AS VAL_TOTAL_ACRESCIMO_PVENDA,'
      '   SUM(TB_NOTA_ITEM.VAL_FRETE) AS VAL_TOTAL_FRETE_PVENDA,'
      
        '   SUM(TB_NOTA_ITEM.VAL_ICMS_SUBST) AS VAL_TOTAL_TOTAL_ST_PVENDA' +
        ','
      
        '   SUM(TB_NOTA_ITEM.VAL_TOTAL - (PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM)) + TB_NOTA_ITEM.VAL_DESPESAS + TB_NOTA_ITEM.VAL_' +
        'FRETE +TB_NOTA_ITEM.VAL_ICMS_SUBST) AS VAL_TOTAL_LIQUIDO_PVENDA,'
      
        '   SUM(DECODE(TB_NOTA_CAB.IND_CONDICAO_PAGTO,'#39'1'#39',TB_NOTA_ITEM.VA' +
        'L_TOTAL - (PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM)) + TB_' +
        'NOTA_ITEM.VAL_DESPESAS + TB_NOTA_ITEM.VAL_FRETE +TB_NOTA_ITEM.VA' +
        'L_ICMS_SUBST,0)) AS VAL_AVISTA_PVENDA,'
      
        '   SUM(DECODE(TB_NOTA_CAB.IND_CONDICAO_PAGTO,'#39'2'#39',TB_NOTA_ITEM.VA' +
        'L_TOTAL - (PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM)) + TB_' +
        'NOTA_ITEM.VAL_DESPESAS + TB_NOTA_ITEM.VAL_FRETE +TB_NOTA_ITEM.VA' +
        'L_ICMS_SUBST,0)) AS VAL_APRAZO_PVENDA,'
      '   /*TIPO SERVI'#199'O (PRODUTO) NO FECHAMENTO DA OS*/'
      '   0.00 AS VAL_TOTAL_SOS,'
      '   0.00 AS VAL_TOTAL_DESCONTO_SOS,'
      '   0.00 AS VAL_TOTAL_ACRESCIMO_SOS,'
      '   0.00 AS VAL_TOTAL_FRETE_SOS,'
      '   0.00 AS VAL_TOTAL_ST_SOS,'
      '   0.00 AS VAL_LIQUIDO_SOS,'
      '   0.00 AS VAL_AVISTA_SOS,'
      '   0.00 AS VAL_APRAZO_SOS,'
      
        '   /*TIPO COMERCIAL (PRODUTO) NO FECHAMENTO DA OS - SEPARAR VEND' +
        'A DIRETA COM O FECHAMENTO DA OS*/'
      '   0.00 AS VAL_TOTAL_POS,'
      '   0.00 AS VAL_TOTAL_DESCONTO_POS,'
      '   0.00 AS VAL_TOTAL_ACRESCIMO_POS,'
      '   0.00 AS VAL_TOTAL_FRETE_POS,'
      '   0.00 AS VAL_TOTAL_TOTAL_ST_POS,'
      '   0.00 AS VAL_TOTAL_LIQUIDO_POS,'
      '   0.00 AS VAL_AVISTA_POS,'
      '   0.00 AS VAL_APRAZO_POS'
      ' FROM'
      '   TB_NOTA_CAB, TB_NOTA_ITEM, TB_PRODUTO, TB_OPERACAO'
      ' WHERE'
      '   TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      ' AND'
      '   TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      ' AND'
      '   TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      ' AND'
      '   TB_NOTA_CAB.IND_SITUACAO = 2'
      ' AND'
      '   TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      ' AND'
      '   TB_NOTA_CAB.COD_ORDEM_SERVICO_CAB IS NULL'
      ' AND'
      '   TB_OPERACAO.IND_VENDAS = '#39'V'#39
      ' AND'
      '   (:COD_FILIAL IS NULL'
      '   OR TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      ' AND'
      '   TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      ' AND'
      '   TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      ' GROUP BY'
      '   0.00'
      '   '
      'UNION'
      ' /*TIPO_PRODUTO = SERVI'#199'O - VEM DA OS*/ '
      ' SELECT'
      '   /*VENDA DIRETA PELO MODULO VENDAS*/'
      '   0.00 AS VAL_TOTAL_PVENDA,'
      '   0.00 AS VAL_TOTAL_DESCONTO_PVENDA,'
      '   0.00 AS VAL_TOTAL_ACRESCIMO_PVENDA,'
      '   0.00 AS VAL_TOTAL_FRETE_PVENDA,'
      '   0.00 AS VAL_TOTAL_TOTAL_ST_PVENDA,'
      '   0.00 AS VAL_TOTAL_LIQUIDO_PVENDA,'
      '   0.00 AS VAL_AVISTA_PVENDA,'
      '   0.00 AS VAL_APRAZO_PVENDA,'
      '   /*TIPO SERVI'#199'O (PRODUTO) NO FECHAMENTO DA OS*/'
      '   SUM(TB_NOTA_ITEM.VAL_TOTAL) AS VAL_TOTAL_SOS,'
      
        '   SUM(PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM)) AS VAL_TO' +
        'TAL_DESCONTO_SOS,'
      '   SUM(TB_NOTA_ITEM.VAL_DESPESAS) AS VAL_TOTAL_ACRESCIMO_SOS,'
      '   SUM(TB_NOTA_ITEM.VAL_FRETE) AS VAL_TOTAL_FRETE_SOS,'
      '   SUM(TB_NOTA_ITEM.VAL_ICMS_SUBST) AS VAL_TOTAL_ST_SOS,'
      
        '   SUM(TB_NOTA_ITEM.VAL_TOTAL - (PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM)) + TB_NOTA_ITEM.VAL_DESPESAS + TB_NOTA_ITEM.VAL_' +
        'FRETE +TB_NOTA_ITEM.VAL_ICMS_SUBST) AS VAL_LIQUIDO_SOS,'
      
        '   SUM(DECODE(TB_NOTA_CAB.IND_CONDICAO_PAGTO,'#39'1'#39',TB_NOTA_ITEM.VA' +
        'L_TOTAL - (PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM)) + TB_' +
        'NOTA_ITEM.VAL_DESPESAS + TB_NOTA_ITEM.VAL_FRETE +TB_NOTA_ITEM.VA' +
        'L_ICMS_SUBST,0)) AS VAL_AVISTA_SOS,'
      
        '   SUM(DECODE(TB_NOTA_CAB.IND_CONDICAO_PAGTO,'#39'2'#39',TB_NOTA_ITEM.VA' +
        'L_TOTAL - (PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM)) + TB_' +
        'NOTA_ITEM.VAL_DESPESAS + TB_NOTA_ITEM.VAL_FRETE +TB_NOTA_ITEM.VA' +
        'L_ICMS_SUBST,0)) AS VAL_APRAZO_SOS,'
      
        '   /*TIPO COMERCIAL (PRODUTO) NO FECHAMENTO DA OS - SEPARAR VEND' +
        'A DIRETA COM O FECHAMENTO DA OS*/'
      '   0.00 AS VAL_TOTAL_POS,'
      '   0.00 AS VAL_TOTAL_DESCONTO_POS,'
      '   0.00 AS VAL_TOTAL_ACRESCIMO_POS,'
      '   0.00 AS VAL_TOTAL_FRETE_POS,'
      '   0.00 AS VAL_TOTAL_TOTAL_ST_POS,'
      '   0.00 AS VAL_TOTAL_LIQUIDO_POS,'
      '   0.00 AS VAL_AVISTA_POS,'
      '   0.00 AS VAL_APRAZO_POS'
      ' FROM'
      '   TB_NOTA_CAB, TB_NOTA_ITEM, TB_PRODUTO, TB_OPERACAO'
      ' WHERE'
      '   TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      ' AND'
      '   TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      ' AND'
      '   TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      ' AND'
      '   TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      ' AND'
      '   TB_NOTA_CAB.IND_SITUACAO = 2'
      ' AND'
      '   TB_NOTA_CAB.COD_ORDEM_SERVICO_CAB IS NOT NULL'
      ' AND'
      '   TB_PRODUTO.IND_TIPO_PRODUTO = '#39'SERVI'#199'O'#39
      ' AND'
      '   (TB_OPERACAO.IND_SERVICO = '#39'S'#39' OR'
      '    TB_OPERACAO.IND_VENDAS = '#39'V'#39')'
      ' AND'
      '   (:COD_FILIAL IS NULL'
      '   OR TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      ' AND'
      '   TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      ' AND'
      '   TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      ' GROUP BY'
      '   0.00'
      ''
      'UNION'
      ' /*PRODUTO=COMERCIAL QUE VEM DA OS*/'
      ' SELECT'
      '   /*VENDA DIRETA PELO MODULO VENDAS*/'
      '   0.00 AS VAL_TOTAL_PVENDA,'
      '   0.00 AS VAL_TOTAL_DESCONTO_PVENDA,'
      '   0.00 AS VAL_TOTAL_ACRESCIMO_PVENDA,'
      '   0.00 AS VAL_TOTAL_FRETE_PVENDA,'
      '   0.00 AS VAL_TOTAL_TOTAL_ST_PVENDA,'
      '   0.00 AS VAL_TOTAL_LIQUIDO_PVENDA,'
      '   0.00 AS VAL_TOTAL_AVISTA_PVENDA,'
      '   0.00 AS VAL_TOTAL_APRAZO_PVENDA,'
      '   /*TIPO SERVI'#199'O (PRODUTO) NO FECHAMENTO DA OS*/'
      '   0.00 AS VAL_TOTAL_SOS,'
      '   0.00 AS VAL_TOTAL_DESCONTO_SOS,'
      '   0.00 AS VAL_TOTAL_ACRESCIMO_SOS,'
      '   0.00 AS VAL_TOTAL_FRETE_SOS,'
      '   0.00 AS VAL_TOTAL_ST_SOS,'
      '   0.00 AS VAL_LIQUIDO_SOS,'
      '   0.00 AS VAL_AVISTA_SOS,'
      '   0.00 AS VAL_APRAZO_SOS,'
      
        '   /*TIPO COMERCIAL (PRODUTO) NO FECHAMENTO DA OS - SEPARAR VEND' +
        'A DIRETA COM O FECHAMENTO DA OS*/'
      '   SUM(TB_NOTA_ITEM.VAL_TOTAL) AS VAL_TOTAL_POS,'
      
        '   SUM(PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM)) AS VAL_TO' +
        'TAL_DESCONTO_POS,'
      '   SUM(TB_NOTA_ITEM.VAL_DESPESAS) AS VAL_TOTAL_ACRESCIMO_POS,'
      '   SUM(TB_NOTA_ITEM.VAL_FRETE) AS VAL_TOTAL_FRETE_POS,'
      '   SUM(TB_NOTA_ITEM.VAL_ICMS_SUBST) AS VAL_TOTAL_TOTAL_ST_POS,'
      
        '   SUM(TB_NOTA_ITEM.VAL_TOTAL - (PEGA_DESCONTO_ITEM(TB_NOTA_ITEM' +
        '.COD_NOTA_ITEM)) + TB_NOTA_ITEM.VAL_DESPESAS + TB_NOTA_ITEM.VAL_' +
        'FRETE +TB_NOTA_ITEM.VAL_ICMS_SUBST) AS VAL_TOTAL_LIQUIDO_POS,'
      
        '   SUM(DECODE(TB_NOTA_CAB.IND_CONDICAO_PAGTO,'#39'1'#39',TB_NOTA_ITEM.VA' +
        'L_TOTAL - (PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM)) + TB_' +
        'NOTA_ITEM.VAL_DESPESAS + TB_NOTA_ITEM.VAL_FRETE +TB_NOTA_ITEM.VA' +
        'L_ICMS_SUBST,0)) AS VAL_AVISTA_POS,'
      
        '   SUM(DECODE(TB_NOTA_CAB.IND_CONDICAO_PAGTO,'#39'2'#39',TB_NOTA_ITEM.VA' +
        'L_TOTAL - (PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM)) + TB_' +
        'NOTA_ITEM.VAL_DESPESAS + TB_NOTA_ITEM.VAL_FRETE +TB_NOTA_ITEM.VA' +
        'L_ICMS_SUBST,0)) AS VAL_APRAZO_POS'
      ' FROM'
      '   TB_NOTA_CAB, TB_NOTA_ITEM, TB_PRODUTO, TB_OPERACAO'
      ' WHERE'
      '   TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      ' AND'
      '   TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      ' AND'
      '   TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      ' AND'
      '   TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      ' AND'
      '   TB_NOTA_CAB.IND_SITUACAO = 2'
      ' AND'
      '   TB_NOTA_CAB.COD_ORDEM_SERVICO_CAB IS NOT NULL'
      ' AND'
      '   TB_PRODUTO.IND_TIPO_PRODUTO <> '#39'SERVI'#199'O'#39
      ' AND'
      '   TB_OPERACAO.IND_VENDAS = '#39'V'#39
      ' AND'
      '  (:COD_FILIAL IS NULL'
      '   OR TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      ' AND'
      '   TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      ' AND'
      '   TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      ' GROUP BY'
      '   0.00'
      ')'
      '')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000070000003A444154415F490C0000000000000000000000070000003A44
      4154415F460C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000170000000D00000056414C5F544F54414C5F534F5301000000000016
      00000056414C5F544F54414C5F444553434F4E544F5F534F5301000000000017
      00000056414C5F544F54414C5F414352455343494D4F5F534F53010000000000
      1300000056414C5F544F54414C5F46524554455F534F530100000000000F0000
      0056414C5F4C49515549444F5F534F530100000000000D00000056414C5F544F
      54414C5F504F530100000000001600000056414C5F544F54414C5F444553434F
      4E544F5F504F530100000000001700000056414C5F544F54414C5F4143524553
      43494D4F5F504F530100000000001300000056414C5F544F54414C5F46524554
      455F504F530100000000001000000056414C5F544F54414C5F53545F504F5301
      00000000001500000056414C5F544F54414C5F4C49515549444F5F504F530100
      000000001000000056414C5F544F54414C5F5056454E44410100000000001900
      000056414C5F544F54414C5F444553434F4E544F5F5056454E44410100000000
      001A00000056414C5F544F54414C5F414352455343494D4F5F5056454E444101
      00000000001600000056414C5F544F54414C5F46524554455F5056454E444101
      00000000001900000056414C5F544F54414C5F544F54414C5F53545F5056454E
      44410100000000001800000056414C5F544F54414C5F4C49515549444F5F5056
      454E44410100000000001100000056414C5F4156495354415F5056454E444101
      00000000001100000056414C5F415052415A4F5F5056454E4441010000000000
      0E00000056414C5F4156495354415F534F530100000000000E00000056414C5F
      4156495354415F504F530100000000000E00000056414C5F415052415A4F5F50
      4F530100000000000E00000056414C5F415052415A4F5F534F53010000000000}
    Session = DMOracle.DBCemapa
    Left = 904
    Top = 368
    object QRResumoVendaOSVAL_TOTAL_PVENDA: TFloatField
      FieldName = 'VAL_TOTAL_PVENDA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_TOTAL_DESCONTO_PVENDA: TFloatField
      FieldName = 'VAL_TOTAL_DESCONTO_PVENDA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_TOTAL_ACRESCIMO_PVENDA: TFloatField
      FieldName = 'VAL_TOTAL_ACRESCIMO_PVENDA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_TOTAL_FRETE_PVENDA: TFloatField
      FieldName = 'VAL_TOTAL_FRETE_PVENDA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_TOTAL_TOTAL_ST_PVENDA: TFloatField
      FieldName = 'VAL_TOTAL_TOTAL_ST_PVENDA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_TOTAL_LIQUIDO_PVENDA: TFloatField
      FieldName = 'VAL_TOTAL_LIQUIDO_PVENDA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_AVISTA_PVENDA: TFloatField
      FieldName = 'VAL_AVISTA_PVENDA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_APRAZO_PVENDA: TFloatField
      FieldName = 'VAL_APRAZO_PVENDA'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_TOTAL_SOS: TFloatField
      FieldName = 'VAL_TOTAL_SOS'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_TOTAL_DESCONTO_SOS: TFloatField
      FieldName = 'VAL_TOTAL_DESCONTO_SOS'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_TOTAL_ACRESCIMO_SOS: TFloatField
      FieldName = 'VAL_TOTAL_ACRESCIMO_SOS'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_TOTAL_FRETE_SOS: TFloatField
      FieldName = 'VAL_TOTAL_FRETE_SOS'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_LIQUIDO_SOS: TFloatField
      FieldName = 'VAL_LIQUIDO_SOS'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_AVISTA_SOS: TFloatField
      FieldName = 'VAL_AVISTA_SOS'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_APRAZO_SOS: TFloatField
      FieldName = 'VAL_APRAZO_SOS'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_TOTAL_POS: TFloatField
      FieldName = 'VAL_TOTAL_POS'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_TOTAL_DESCONTO_POS: TFloatField
      FieldName = 'VAL_TOTAL_DESCONTO_POS'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_TOTAL_ACRESCIMO_POS: TFloatField
      FieldName = 'VAL_TOTAL_ACRESCIMO_POS'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_TOTAL_FRETE_POS: TFloatField
      FieldName = 'VAL_TOTAL_FRETE_POS'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_TOTAL_ST_POS: TFloatField
      FieldName = 'VAL_TOTAL_ST_POS'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_TOTAL_LIQUIDO_POS: TFloatField
      FieldName = 'VAL_TOTAL_LIQUIDO_POS'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_AVISTA_POS: TFloatField
      FieldName = 'VAL_AVISTA_POS'
      DisplayFormat = '###,###,##0.00'
    end
    object QRResumoVendaOSVAL_APRAZO_POS: TFloatField
      FieldName = 'VAL_APRAZO_POS'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object QRComissaoClasse: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Tb_nota_cab.NUM_NOTA,'
      '  Tb_nota_cab.DT_EMISSAO,'
      '  Tb_vendedor.COD_VENDEDOR,'
      '  Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '  TB_OPERACAO.IND_VENDAS,'
      '  SUM(Tb_nota_item.QT_QUANTIDADE) AS SQT_QUANTIDADE,'
      
        '  SUM(decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.VAL_TOTAL,T' +
        'b_nota_item.VAL_TOTAL * -1)) AS SVAL_TOTAL,'
      
        '  SUM(decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.VAL_DESCONT' +
        'O_RATEIO,Tb_nota_item.VAL_DESCONTO_RATEIO * -1)) AS SVAL_DESCONT' +
        'O,'
      
        '  --SUM(((Tb_Classe.PERC_COMISSAO1 - (TB_NOTA_ITEM.VAL_DESCONTO ' +
        '/ TB_NOTA_ITEM.VAL_TOTAL * 100) * Tb_Classe.PERC_COMISSAO2)) * (' +
        'Tb_nota_item.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO)/100) AS sVAL' +
        '_COMISSAO'
      '  CASE '
      
        '    WHEN SUM(ROUND(((TB_NOTA_ITEM.VAL_TOTAL-TB_NOTA_ITEM.VAL_DES' +
        'CONTO_RATEIO) / TB_NOTA_ITEM.QT_QUANTIDADE),2)) < SUM(TB_PRODUTO' +
        '.VAL_VAREJO) THEN --Se tem desconto'
      
        '      SUM(((TB_COMISSAO_CLASSE.PERC_COMISSAO - (TB_NOTA_ITEM.VAL' +
        '_DESCONTO_RATEIO / TB_NOTA_ITEM.VAL_TOTAL * 100) * TB_COMISSAO_C' +
        'LASSE.PERC_COMISSAO1)) *'
      
        '       (Tb_nota_item.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO_RATEI' +
        'O)/100)'
      '    ELSE'
      
        '      SUM((Tb_nota_item.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO_RA' +
        'TEIO) * TB_COMISSAO_CLASSE.PERC_COMISSAO) / 100'
      '  END AS sVAL_COMISSAO,'
      
        '  (SUM(decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.VAL_TOTAL,' +
        'Tb_nota_item.VAL_TOTAL * -1))-'
      
        '      SUM(decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.VAL_DES' +
        'CONTO_RATEIO,decode(Tb_nota_item.VAL_DESCONTO_RATEIO,0,'
      
        '     (Tb_nota_ITEM.VAL_DESCONTO_RATEIO * -1),(Tb_nota_item.VAL_D' +
        'ESCONTO_RATEIO * -1))))) AS STOTAL_LIQ'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_OPERACAO,'
      '  TB_PRODUTO,'
      '  TB_CLASSE,'
      '  TB_VENDEDOR,'
      '  TB_COMISSAO_CLASSE'
      'WHERE'
      '  TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '  AND'
      '  Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '  AND'
      '  Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '  AND'
      '  Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '  AND'
      '  Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '  AND'
      '  TB_COMISSAO_CLASSE.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '  AND'
      '  TB_COMISSAO_CLASSE.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '  AND'
      
        '  ((TB_OPERACAO.IND_VENDAS = '#39'V'#39') or (TB_OPERACAO.IND_VENDAS = '#39 +
        'D'#39'))'
      '  AND'
      '  (:VENDEDOR IS NULL OR'
      '    TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '  AND'
      '  (:FILIAL IS NULL OR'
      '    TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '  AND'
      '  ((:SERIE IS NULL OR'
      '    TB_NOTA_CAB.COD_SERIE = :SERIE)'
      '    or'
      '   (:SERIE1 IS NULL OR'
      '      TB_NOTA_CAB.COD_SERIE = :SERIE1))'
      '  AND'
      '  (:COD_OPERACAO IS NULL '
      '   or'
      '    TB_NOTA_CAB.COD_OPERACAO = :COD_OPERACAO)'
      '  AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '  AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F    '
      'GROUP BY'
      '  Tb_vendedor.COD_VENDEDOR,'
      '  Tb_vendedor.NOME,'
      '  Tb_nota_cab.NUM_NOTA,'
      '  Tb_nota_cab.DT_EMISSAO,'
      '  Tb_Classe.PERC_COMISSAO1,'
      '  Tb_Classe.PERC_COMISSAO2,'
      '  TB_OPERACAO.IND_VENDAS'
      'ORDER BY'
      '  Tb_vendedor.COD_VENDEDOR,'
      '  Tb_vendedor.NOME,'
      '  Tb_nota_cab.NUM_NOTA')
    Variables.Data = {
      0300000007000000090000003A56454E4445444F520300000000000000000000
      00070000003A46494C49414C030000000000000000000000060000003A534552
      4945050000000000000000000000070000003A53455249453105000000000000
      0000000000070000003A444154415F490C000000000000000000000007000000
      3A444154415F460C00000000000000000000000D0000003A434F445F4F504552
      4143414F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000C000000434F445F56454E4445444F520100000000000D00
      00004E4F4D455F56454E4445444F520100000000000E0000005351545F515541
      4E5449444144450100000000000A0000005356414C5F544F54414C0100000000
      000A00000044545F454D495353414F010000000000080000004E554D5F4E4F54
      410100000000000A000000494E445F56454E4441530100000000000D00000053
      56414C5F444553434F4E544F0100000000000D0000005356414C5F434F4D4953
      53414F0100000000000A00000053544F54414C5F4C4951010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    OnCalcFields = QRComissaoClasseCalcFields
    Left = 894
    Top = 122
    object QRComissaoClasseNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRComissaoClasseDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRComissaoClasseCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object QRComissaoClasseNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Required = True
      Size = 40
    end
    object QRComissaoClasseIND_VENDAS: TStringField
      FieldName = 'IND_VENDAS'
      Required = True
      Size = 1
    end
    object QRComissaoClasseSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRComissaoClasseSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRComissaoClasseSVAL_DESCONTO: TFloatField
      FieldName = 'SVAL_DESCONTO'
    end
    object QRComissaoClasseSVAL_COMISSAO: TFloatField
      FieldName = 'SVAL_COMISSAO'
    end
    object QRComissaoClasseSTOTAL_LIQ: TFloatField
      FieldName = 'STOTAL_LIQ'
    end
    object QRComissaoClasseperc_comissao: TFloatField
      FieldKind = fkCalculated
      FieldName = 'perc_comissao'
      Calculated = True
    end
    object QRComissaoClasseperc_desconto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'perc_desconto'
      Calculated = True
    end
    object QRComissaoClasseval_comissao: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_comissao'
      Calculated = True
    end
  end
  object QRClasseMaisVendida: TOracleDataSet1
    SQL.Strings = (
      'select'
      '  COD_CLASSE,'
      '  NUM_CLASSE,'
      '  NUM_SUBCLASSE,'
      '  DESC_CLASSE,'
      '  SUM(SQT_QUANTIDADE) AS QT_QUANTIDADE,'
      '  SUM(VAL_UNITARIO) AS VAL_UNITARIO,'
      '  SUM(SVAL_CUSTO/SQT_QUANTIDADE) AS VL_CUSTO_UNITARIO,'
      
        '  SUM(VAL_UNITARIO - (SVAL_CUSTO/SQT_QUANTIDADE)) AS VL_LUCRO_UN' +
        'ITARIO,'
      
        '  SUM(((VAL_UNITARIO - (SVAL_CUSTO/SQT_QUANTIDADE))*100)/(SVAL_C' +
        'USTO/SQT_QUANTIDADE)) AS PERC_LUCRO,'
      '  SUM(SVAL_TOTAL) AS VAL_TOTAL_VENDA,'
      '  SUM(SVAL_CUSTO) AS VAL_CUSTO'
      'FROM'
      '(    '
      '  SELECT  '
      '    TB_CLASSE.COD_CLASSE,'
      '    TB_CLASSE.NUM_CLASSE,'
      '    TB_CLASSE.NUM_SUBCLASSE,'
      '    TB_CLASSE.DESC_CLASSE,'
      '    SUM(TB_NOTA_ITEM.QT_QUANTIDADE) AS SQT_QUANTIDADE,'
      
        '    AVG(TB_NOTA_ITEM.VAL_UNITARIO - NVL(PEGA_DESCONTO_ITEM(TB_NO' +
        'TA_ITEM.COD_NOTA_ITEM),0)) AS VAL_UNITARIO,'
      
        '    SUM(Tb_nota_item.VAL_CUSTO*Tb_nota_item.QT_QUANTIDADE) AS SV' +
        'AL_CUSTO,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - NVL(PEGA_DESCONTO_ITEM(TB_NOTA_' +
        'ITEM.COD_NOTA_ITEM),0)) AS SVAL_TOTAL'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_VENDEDOR,'
      '    TB_PRODUTO,'
      '    TB_FILIAL,'
      '    TB_LOTE_TIPO,'
      '    TB_CLASSE,'
      '    TB_CADASTRO'
      '  WHERE'
      '    (TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE)'
      '    AND'
      '    (TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO)'
      '    AND'
      '    (TB_CADASTRO.COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO)'
      '    AND'
      '    (TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39')'
      '    AND'
      '    (TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39')'
      '    and'
      '    tb_operacao.ind_vendas = '#39'V'#39
      '    AND'
      '    TB_OPERACAO.COD_OPERACAO IN(3,17)'
      '    AND'
      '    (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)'
      '    AND'
      '    (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO)'
      '    AND'
      '    (Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL)'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR(+) = Tb_Vendedor.COD_VENDEDOR'
      '    AND'
      '    TB_NOTA_ITEM.COD_LOTE_TIPO = TB_LOTE_TIPO.COD_LOTE_TIPO  '
      '    AND'
      '    (TB_NOTA_CAB.DT_EMISSAO >= :DT_INICIAL)'
      '    AND'
      '    (TB_NOTA_CAB.DT_EMISSAO <= :DT_FINAL)'
      '    AND'
      '    (:VENDEDOR IS NULL'
      '     OR'
      '      TB_NOTA_CAB.COD_VENDEDOR =:VENDEDOR)'
      '  GROUP BY'
      '    TB_CLASSE.COD_CLASSE,'
      '    TB_CLASSE.NUM_CLASSE,'
      '    TB_CLASSE.NUM_SUBCLASSE,'
      '    TB_CLASSE.DESC_CLASSE)'
      'GROUP BY'
      '  COD_CLASSE,'
      '  NUM_CLASSE,'
      '  NUM_SUBCLASSE,'
      '  DESC_CLASSE'
      'ORDER BY NUM_CLASSE,NUM_SUBCLASSE')
    Variables.Data = {
      03000000030000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C000000000000000000000009000000
      3A56454E4445444F52030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B0000000A000000434F445F434C415353450100000000000A000000
      4E554D5F434C415353450100000000000D0000004E554D5F535542434C415353
      450100000000000B000000444553435F434C4153534501000000000011000000
      564C5F435553544F5F554E49544152494F01000000000011000000564C5F4C55
      43524F5F554E49544152494F0100000000000A000000504552435F4C5543524F
      0100000000000D00000051545F5155414E5449444144450100000000000C0000
      0056414C5F554E49544152494F0100000000000F00000056414C5F544F54414C
      5F56454E44410100000000000900000056414C5F435553544F010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRClasseMaisVendidaCalcFields
    Left = 904
    Top = 416
    object QRClasseMaisVendidaCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object QRClasseMaisVendidaNUM_CLASSE: TIntegerField
      FieldName = 'NUM_CLASSE'
      Required = True
    end
    object QRClasseMaisVendidaNUM_SUBCLASSE: TIntegerField
      FieldName = 'NUM_SUBCLASSE'
      Required = True
    end
    object QRClasseMaisVendidaDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 100
    end
    object QRClasseMaisVendidaVL_CUSTO_UNITARIO: TFloatField
      FieldName = 'VL_CUSTO_UNITARIO'
    end
    object QRClasseMaisVendidaVL_LUCRO_UNITARIO: TFloatField
      FieldName = 'VL_LUCRO_UNITARIO'
    end
    object QRClasseMaisVendidaPERC_LUCRO: TFloatField
      FieldName = 'PERC_LUCRO'
    end
    object QRClasseMaisVendidaQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QRClasseMaisVendidaVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
    end
    object QRClasseMaisVendidaVAL_TOTAL_VENDA: TFloatField
      FieldName = 'VAL_TOTAL_VENDA'
    end
    object QRClasseMaisVendidaVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
    end
    object QRClasseMaisVendidawFaturamento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'wFaturamento'
      Calculated = True
    end
    object QRClasseMaisVendidanum_vendas: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'num_vendas'
      Calculated = True
    end
  end
  object QRComissaoTecnico: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      
        '  Tb_produto.DESC_PRODUTO || '#39' '#39' || TB_NOTA_ITEM.DESC_INF_ADICIO' +
        'NAL AS DESC_PRODUTO,'
      '  TB_NOTA_CAB.COD_TECNICO AS COD_TECNICO,'
      '  TB_TECNICO.NOME AS NOME_TECNICO,'
      '  Tb_tecnico.PERC_IRRF,'
      '  Tb_filial.COD_FILIAL,'
      '  Tb_filial.DESC_FILIAL,'
      '  Tb_produto.COD_PRODUTO,'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      '  to_date(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'dd/mm/yy'#39'),'
      '  TB_NOTA_CAB.NUM_NOTA,'
      '  TB_NOTA_CAB.COD_OPERACAO,'
      '  tb_nota_cab.cod_ordem_servico_cab,'
      '  Tb_nota_item.PERC_COMISSAO PERC_COMISSAO_ITEM,'
      '  Tb_nota_CAB.PERC_COMISSAO PERC_COMISSAO_NOTA,'
      '  Tb_nota_item.PERC_DESCONTO,'
      '  Tb_produto.COD_CLASSE,'
      '  TB_NOTA_CAB.OBS || TB_NOTA_CAB.OBS_COMPLEMENTO AS OBS_NOTA,'
      
        '  /* IND_FINALIDADE_NFE para verificar se '#233' devolu'#231#227'o. Center Fr' +
        'io precisa gerar relat'#243'rio com opera'#231#227'o(N'#227'o '#233' do tipo Venda). Ju' +
        'nior 29/01/2024. Solic. Marcos.*/'
      
        '  SUM(Decode(TB_NOTA_CAB.IND_FINALIDADE_NFE,4,Tb_nota_item.QT_QU' +
        'ANTIDADE*-1,'
      
        '                                        Tb_nota_item.QT_QUANTIDA' +
        'DE)) AS SQT_QUANTIDADE,'
      
        '  SUM(Decode(TB_NOTA_CAB.IND_FINALIDADE_NFE,4,(Tb_nota_item.VAL_' +
        'TOTAL -'
      
        '                                        PEGA_DESCONTO_ITEM(TB_NO' +
        'TA_ITEM.COD_NOTA_ITEM) +'
      
        '                                        Tb_nota_item.VAL_DESPESA' +
        'S+TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1,'
      '                                       (Tb_nota_item.VAL_TOTAL -'
      
        '                                        PEGA_DESCONTO_ITEM(TB_NO' +
        'TA_ITEM.COD_NOTA_ITEM) +'
      
        '                                        Tb_nota_item.VAL_DESPESA' +
        'S+TB_NOTA_ITEM.VAL_ICMS_SUBST))) AS SVAL_TOTAL,'
      
        '/*  SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.QT_QUANTI' +
        'DADE,'
      
        '                                        Tb_nota_item.QT_QUANTIDA' +
        'DE*-1)) AS SQT_QUANTIDADE,'
      '  SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.VAL_TOTAL -'
      
        '                                        DECODE(TB_PARAM_SISTEMA.' +
        'COD_EMPRESA,'#39'GRASEL'#39',0,PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_' +
        'ITEM)) +'
      
        '                                        Tb_nota_item.VAL_DESPESA' +
        'S+TB_NOTA_ITEM.VAL_ICMS_SUBST,'
      '                                       (Tb_nota_item.VAL_TOTAL -'
      
        '                                        DECODE(TB_PARAM_SISTEMA.' +
        'COD_EMPRESA,'#39'GRASEL'#39',0,PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_' +
        'ITEM)) +'
      
        '                                        Tb_nota_item.VAL_DESPESA' +
        'S+TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1)) AS SVAL_TOTAL,*/ /*Utilizar ' +
        'Ind_Finalidade_NFe para verificar se '#233' devolu'#231#227'o. Junior 29/01/2' +
        '024(Center Frio)*/'
      '  TB_CADASTRO.NOME'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_OPERACAO,'
      '  TB_PRODUTO,'
      '  TB_FILIAL,'
      '  TB_VENDEDOR TB_TECNICO,'
      '  TB_CADASTRO,'
      '  TB_PARAM_SISTEMA'
      'WHERE'
      '  TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '  AND'
      '  Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '  AND'
      '  Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '  AND'
      '  Tb_nota_cab.COD_TECNICO = tb_tecnico.cod_vendedor'
      '  and'
      '  TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      '  Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '  AND'
      '  (:IND_TIPO_PRODUTO IS NULL'
      '   or'
      '    TB_PRODUTO.IND_TIPO_PRODUTO = :IND_TIPO_PRODUTO)'
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '  AND'
      '    ((TB_NOTA_ITEM.PERC_COMISSAO > 0) OR'
      '    (Tb_nota_CAB.PERC_COMISSAO > 0))'
      '/*  AND'
      
        '  ((TB_OPERACAO.IND_VENDAS = '#39'V'#39') or (TB_OPERACAO.IND_VENDAS = '#39 +
        'D'#39'))'
      '  AND*/'
      '  AND'
      '  (:COD_OPERACAO IS NULL'
      '   OR TB_NOTA_CAB.COD_OPERACAO = :COD_OPERACAO)'
      '  AND'
      '  (:TECNICO IS NULL OR'
      '    TB_NOTA_CAB.COD_TECNICO = :TECNICO)'
      '  AND'
      '  (:FILIAL IS NULL OR'
      '    TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '  AND'
      '  ((:SERIE IS NULL OR'
      '    TB_NOTA_CAB.COD_SERIE = :SERIE)'
      '    or'
      '   (:SERIE1 IS NULL OR'
      '      TB_NOTA_CAB.COD_SERIE = :SERIE1))'
      '  AND'
      
        '  to_date(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'dd/mm/yy'#39') between to_date' +
        '(:DATA_I, '#39'dd/mm/yy'#39') and to_date(:DATA_F, '#39'dd/mm/yy'#39')'
      '  AND'
      '  (:IND_CONDICAO_PAGTO IS NULL'
      '  OR'
      '  TB_NOTA_CAB.IND_CONDICAO_PAGTO = :IND_CONDICAO_PAGTO)'
      '  AND'
      ' (:COD_PRODUTO IS NULL'
      '   OR'
      '    Tb_nota_item.COD_PRODUTO = :COD_PRODUTO)'
      'GROUP BY'
      '  Tb_filial.COD_FILIAL,'
      '  TB_NOTA_CAB.COD_TECNICO ,'
      '  TB_TECNICO.NOME,'
      '  Tb_tecnico.PERC_IRRF,'
      '  Tb_produto.COD_PRODUTO,'
      
        '  Tb_produto.DESC_PRODUTO || '#39' '#39' || TB_NOTA_ITEM.DESC_INF_ADICIO' +
        'NAL,'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      '  to_date(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'dd/mm/yy'#39'),'
      '  tb_nota_cab.cod_ordem_servico_cab,'
      '  TB_NOTA_CAB.NUM_NOTA,'
      '  TB_NOTA_CAB.COD_OPERACAO,'
      '  Tb_filial.DESC_FILIAL,'
      '  Tb_nota_item.PERC_COMISSAO,'
      '  Tb_nota_CAB.PERC_COMISSAO,'
      '  Tb_nota_item.PERC_DESCONTO,'
      '  Tb_produto.COD_CLASSE,'
      '  TB_CADASTRO.NOME,'
      '  TB_NOTA_CAB.OBS || TB_NOTA_CAB.OBS_COMPLEMENTO '
      'ORDER BY '
      ' TB_NOTA_CAB.COD_TECNICO,'
      ' TB_NOTA_CAB.DT_EMISSAO')
    Variables.Data = {
      030000000A000000070000003A46494C49414C05000000000000000000000006
      0000003A5345524945050000000000000000000000070000003A534552494531
      050000000000000000000000070000003A444154415F49050000000000000000
      000000070000003A444154415F46050000000000000000000000130000003A49
      4E445F434F4E444943414F5F504147544F0500000000000000000000000C0000
      003A434F445F50524F4455544F050000000000000000000000080000003A5445
      434E49434F0500000000000000000000000D0000003A434F445F4F5045524143
      414F030000000000000000000000110000003A494E445F5449504F5F50524F44
      55544F050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000140000000C000000444553435F50524F4455544F0100000000000900
      0000504552435F495252460100000000000C0000004E4F4D455F5445434E4943
      4F0100000000000A000000434F445F46494C49414C0100000000000B00000044
      4553435F46494C49414C0100000000000B000000434F445F50524F4455544F01
      00000000000A00000044545F454D495353414F0100000000001E000000544F5F
      444154452854425F4E4F54415F4341422E44545F5245434542494D0100000000
      00080000004E554D5F4E4F54410100000000000C000000434F445F4F50455241
      43414F0100000000000B000000434F445F5445434E49434F0100000000001200
      0000504552435F434F4D495353414F5F4954454D010000000000120000005045
      52435F434F4D495353414F5F4E4F54410100000000000D000000504552435F44
      4553434F4E544F0100000000000A000000434F445F434C415353450100000000
      000E0000005351545F5155414E5449444144450100000000000A000000535641
      4C5F544F54414C010000000000040000004E4F4D450100000000001500000043
      4F445F4F5244454D5F5345525649434F5F434142010000000000080000004F42
      535F4E4F5441010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRComissaoTecnicoCalcFields
    Left = 896
    Top = 178
    object QRComissaoTecnicoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 701
    end
    object QRComissaoTecnicoCOD_TECNICO: TIntegerField
      FieldName = 'COD_TECNICO'
    end
    object QRComissaoTecnicoNOME_TECNICO: TStringField
      FieldName = 'NOME_TECNICO'
      Required = True
      Size = 40
    end
    object QRComissaoTecnicoPERC_IRRF: TFloatField
      FieldName = 'PERC_IRRF'
    end
    object QRComissaoTecnicoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QRComissaoTecnicoDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRComissaoTecnicoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRComissaoTecnicoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRComissaoTecnicoTO_DATETB_NOTA_CABDT_RECEBIM: TDateTimeField
      FieldName = 'TO_DATE(TB_NOTA_CAB.DT_RECEBIM'
    end
    object QRComissaoTecnicoNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRComissaoTecnicoCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
      Required = True
    end
    object QRComissaoTecnicoPERC_COMISSAO_ITEM: TFloatField
      FieldName = 'PERC_COMISSAO_ITEM'
      Required = True
    end
    object QRComissaoTecnicoPERC_COMISSAO_NOTA: TFloatField
      FieldName = 'PERC_COMISSAO_NOTA'
      Required = True
    end
    object QRComissaoTecnicoPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
      Required = True
    end
    object QRComissaoTecnicoCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object QRComissaoTecnicoSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRComissaoTecnicoSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRComissaoTecnicoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QRComissaoTecnicosval_irrf: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sval_irrf'
      Calculated = True
    end
    object QRComissaoTecnicoperc_comissao: TFloatField
      FieldKind = fkCalculated
      FieldName = 'perc_comissao'
      Calculated = True
    end
    object QRComissaoTecnicoval_comissao: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_comissao'
      Calculated = True
    end
    object QRComissaoTecnicoCOD_ORDEM_SERVICO_CAB: TIntegerField
      FieldName = 'COD_ORDEM_SERVICO_CAB'
    end
    object QRComissaoTecnicoOBS_NOTA: TStringField
      FieldName = 'OBS_NOTA'
      Size = 1700
    end
  end
  object QRComissaoVendedor: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      
        '  Tb_produto.DESC_PRODUTO || '#39' '#39' || TB_NOTA_ITEM.DESC_INF_ADICIO' +
        'NAL AS DESC_PRODUTO,'
      '  TB_NOTA_CAB.COD_VENDEDOR AS COD_VENDEDOR,'
      '  Tb_vendedor.NOME AS NOME_VENDEDOR,'
      '  Tb_vendedor.PERC_IRRF,'
      '  Tb_filial.COD_FILIAL,'
      '  Tb_filial.DESC_FILIAL,'
      '  Tb_produto.COD_PRODUTO,'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      '  to_date(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'dd/mm/yy'#39'),'
      '  TB_NOTA_CAB.NUM_NOTA,'
      '  TB_NOTA_CAB.COD_OPERACAO,'
      '  tb_nota_cab.cod_ordem_servico_cab,'
      '  Tb_nota_item.PERC_COMISSAO PERC_COMISSAO_ITEM,'
      '  Tb_nota_CAB.PERC_COMISSAO PERC_COMISSAO_NOTA,'
      '  Tb_nota_item.PERC_DESCONTO,'
      '  Tb_produto.COD_CLASSE,'
      '  TB_NOTA_CAB.OBS,'
      
        '  SUM(Decode(TB_NOTA_CAB.IND_FINALIDADE_NFE,4,Tb_nota_item.QT_QU' +
        'ANTIDADE*-1,'
      
        '                                        Tb_nota_item.QT_QUANTIDA' +
        'DE)) AS SQT_QUANTIDADE,'
      
        '  SUM(Decode(TB_NOTA_CAB.IND_FINALIDADE_NFE,4,(Tb_nota_item.VAL_' +
        'TOTAL -'
      
        '                                        PEGA_DESCONTO_ITEM(TB_NO' +
        'TA_ITEM.COD_NOTA_ITEM) +'
      
        '                                        Tb_nota_item.VAL_DESPESA' +
        'S+TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1,'
      '                                       (Tb_nota_item.VAL_TOTAL -'
      
        '                                        PEGA_DESCONTO_ITEM(TB_NO' +
        'TA_ITEM.COD_NOTA_ITEM) +'
      
        '                                        Tb_nota_item.VAL_DESPESA' +
        'S+TB_NOTA_ITEM.VAL_ICMS_SUBST))) AS SVAL_TOTAL,'
      ''
      
        '/*  SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.QT_QUANTI' +
        'DADE,'
      
        '                                        Tb_nota_item.QT_QUANTIDA' +
        'DE*-1)) AS SQT_QUANTIDADE,'
      '  SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.VAL_TOTAL -'
      
        '                                        DECODE(TB_PARAM_SISTEMA.' +
        'COD_EMPRESA,'#39'GRASEL'#39',0,PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_' +
        'ITEM)) +'
      
        '                                        Tb_nota_item.VAL_DESPESA' +
        'S+TB_NOTA_ITEM.VAL_ICMS_SUBST,'
      '                                       (Tb_nota_item.VAL_TOTAL -'
      
        '                                        DECODE(TB_PARAM_SISTEMA.' +
        'COD_EMPRESA,'#39'GRASEL'#39',0,PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_' +
        'ITEM)) +'
      
        '                                        Tb_nota_item.VAL_DESPESA' +
        'S+TB_NOTA_ITEM.VAL_ICMS_SUBST)*-1)) AS SVAL_TOTAL,*//*Utilizar I' +
        'nd_Finalidade_NFe para verificar se '#233' devolu'#231#227'o. Junior 29/01/20' +
        '24(Center Frio)*/'
      '  TB_CADASTRO.NOME'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_OPERACAO,'
      '  TB_PRODUTO,'
      '  TB_FILIAL,'
      '  TB_VENDEDOR,'
      '  TB_CADASTRO,'
      '  TB_PARAM_SISTEMA'
      'WHERE'
      '  TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '  AND'
      '  Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'
      '  AND'
      '  Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '  AND'
      '  Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '  AND'
      '  TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      '  Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  TB_PRODUTO.IND_TIPO_PRODUTO <> '#39'SERVI'#199'O'#39
      '  AND'
      '    ((TB_NOTA_ITEM.PERC_COMISSAO > 0) OR'
      '    (Tb_nota_CAB.PERC_COMISSAO > 0))'
      '  AND'
      
        '/*  ((TB_OPERACAO.IND_VENDAS = '#39'V'#39') or (TB_OPERACAO.IND_VENDAS =' +
        ' '#39'D'#39'))*/'
      '  (:COD_OPERACAO IS NULL OR'
      '    TB_NOTA_CAB.COD_OPERACAO = :COD_OPERACAO)'
      '  AND'
      '  (:VENDEDOR IS NULL OR'
      '    TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'
      '  AND'
      '  (:FILIAL IS NULL OR'
      '    TB_NOTA_CAB.COD_FILIAL = :FILIAL)'
      '  AND'
      '  ((:SERIE IS NULL OR'
      '    TB_NOTA_CAB.COD_SERIE = :SERIE)'
      '    or'
      '   (:SERIE1 IS NULL OR'
      '      TB_NOTA_CAB.COD_SERIE = :SERIE1))'
      '  AND'
      
        '  to_date(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'dd/mm/yy'#39') between to_date' +
        '(:DATA_I, '#39'dd/mm/yy'#39') and to_date(:DATA_F, '#39'dd/mm/yy'#39')'
      '  AND'
      '  (:IND_CONDICAO_PAGTO IS NULL'
      '  OR'
      '  TB_NOTA_CAB.IND_CONDICAO_PAGTO = :IND_CONDICAO_PAGTO)'
      '  AND'
      '  (:COD_PRODUTO IS NULL'
      '   OR'
      '    Tb_nota_item.COD_PRODUTO = :COD_PRODUTO)'
      'GROUP BY'
      '  Tb_filial.COD_FILIAL,'
      '  TB_NOTA_CAB.COD_VENDEDOR ,'
      '  Tb_vendedor.NOME ,'
      '  Tb_vendedor.PERC_IRRF,'
      '  Tb_produto.COD_PRODUTO,'
      
        '  Tb_produto.DESC_PRODUTO || '#39' '#39' || TB_NOTA_ITEM.DESC_INF_ADICIO' +
        'NAL,'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      '  to_date(TB_NOTA_CAB.DT_RECEBIMENTO,'#39'dd/mm/yy'#39'),'
      '  tb_nota_cab.cod_ordem_servico_cab,'
      '  TB_NOTA_CAB.NUM_NOTA,'
      '  TB_NOTA_CAB.COD_OPERACAO,'
      '  Tb_filial.DESC_FILIAL,'
      '  Tb_nota_item.PERC_COMISSAO,'
      '  Tb_nota_CAB.PERC_COMISSAO,'
      '  Tb_nota_item.PERC_DESCONTO,'
      '  Tb_produto.COD_CLASSE,'
      '  TB_CADASTRO.NOME,'
      '  TB_NOTA_CAB.OBS'
      'ORDER BY '
      '  TB_NOTA_CAB.COD_VENDEDOR,'
      '  TB_NOTA_CAB.DT_EMISSAO')
    Variables.Data = {
      0300000009000000090000003A56454E4445444F520300000000000000000000
      00070000003A46494C49414C030000000000000000000000060000003A534552
      4945050000000000000000000000070000003A53455249453105000000000000
      0000000000070000003A444154415F490C000000000000000000000007000000
      3A444154415F460C0000000000000000000000130000003A494E445F434F4E44
      4943414F5F504147544F0500000000000000000000000C0000003A434F445F50
      524F4455544F0300000000000000000000000D0000003A434F445F4F50455241
      43414F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000140000000C000000444553435F50524F4455544F0100000000000C00
      0000434F445F56454E4445444F520100000000000D0000004E4F4D455F56454E
      4445444F5201000000000009000000504552435F495252460100000000000A00
      0000434F445F46494C49414C0100000000000B000000444553435F46494C4941
      4C0100000000000B000000434F445F50524F4455544F0100000000000A000000
      44545F454D495353414F0100000000001E000000544F5F444154452854425F4E
      4F54415F4341422E44545F5245434542494D010000000000080000004E554D5F
      4E4F54410100000000000C000000434F445F4F5045524143414F010000000000
      12000000504552435F434F4D495353414F5F4954454D01000000000012000000
      504552435F434F4D495353414F5F4E4F54410100000000000D00000050455243
      5F444553434F4E544F0100000000000A000000434F445F434C41535345010000
      000000030000004F42530100000000000E0000005351545F5155414E54494441
      44450100000000000A0000005356414C5F544F54414C01000000000004000000
      4E4F4D4501000000000015000000434F445F4F5244454D5F5345525649434F5F
      434142010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRComissaoVendedorCalcFields
    Left = 896
    Top = 240
    object QRComissaoVendedorDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 701
    end
    object QRComissaoVendedorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QRComissaoVendedorNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Required = True
      Size = 40
    end
    object QRComissaoVendedorPERC_IRRF: TFloatField
      FieldName = 'PERC_IRRF'
    end
    object QRComissaoVendedorCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QRComissaoVendedorDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRComissaoVendedorCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRComissaoVendedorDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRComissaoVendedorTO_DATETB_NOTA_CABDT_RECEBIM: TDateTimeField
      FieldName = 'TO_DATE(TB_NOTA_CAB.DT_RECEBIM'
    end
    object QRComissaoVendedorNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRComissaoVendedorCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
      Required = True
    end
    object QRComissaoVendedorPERC_COMISSAO_ITEM: TFloatField
      FieldName = 'PERC_COMISSAO_ITEM'
      Required = True
    end
    object QRComissaoVendedorPERC_COMISSAO_NOTA: TFloatField
      FieldName = 'PERC_COMISSAO_NOTA'
      Required = True
    end
    object QRComissaoVendedorPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
      Required = True
    end
    object QRComissaoVendedorCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object QRComissaoVendedorOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
    object QRComissaoVendedorSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRComissaoVendedorSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRComissaoVendedorNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QRComissaoVendedorperc_comissao: TFloatField
      FieldKind = fkCalculated
      FieldName = 'perc_comissao'
      Calculated = True
    end
    object QRComissaoVendedorval_comissao: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_comissao'
      Calculated = True
    end
    object QRComissaoVendedorsval_irrf: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sval_irrf'
      Calculated = True
    end
    object QRComissaoVendedorCOD_ORDEM_SERVICO_CAB: TIntegerField
      FieldName = 'COD_ORDEM_SERVICO_CAB'
    end
  end
  object QRComissaoTotalOS: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  tb_vendedor.cod_vendedor as COD_TECNICO,'
      '  tb_vendedor.nome as NOME_TECNICO,'
      '  Tb_vendedor.PERC_IRRF,'
      '  tb_vendedor.perc_comissao3,'
      '  Tb_cadastro.COD_CADASTRO,'
      '  Tb_cadastro.NOME NOME_CADASTRO,'
      '  Tb_Nota_Cab.Num_Nota,'
      '  Tb_Nota_Cab.Cod_Serie,'
      '  Tb_Nota_Cab.Dt_Emissao,'
      '  Tb_Nota_Cab.Cod_Nota_Cab,'
      '  tb_nota_cab.cod_ordem_servico_cab,'
      '  Tb_Nota_Cab.Perc_Comissao perc_comissao_nota,'
      '  TB_NOTA_CAB.COD_OPERACAO,'
      
        '  decode(Tb_Nota_Item.Perc_Comissao,0,Tb_Produto.PERC_COMISSAO,T' +
        'b_Nota_Item.Perc_Comissao) perc_comissao_item,'
      '  Tb_Produto.PERC_COMISSAO AS perc_comissao_produto,'
      
        '  SUM(Decode(TB_NOTA_CAB.IND_FINALIDADE_NFE,4,Tb_nota_item.QT_QU' +
        'ANTIDADE*-1,'
      
        '                                       Tb_nota_item.QT_QUANTIDAD' +
        'E)) AS SQT_QUANTIDADE,'
      '  SUM(Decode(TB_NOTA_CAB.IND_FINALIDADE_NFE,4,'
      
        '        (Tb_nota_item.VAL_TOTAL - (Tb_nota_item.VAL_DESCONTO * T' +
        'B_NOTA_ITEM.QT_QUANTIDADE) - Tb_nota_item.VAL_DESCONTO_RATEIO +T' +
        'B_NOTA_ITEM.VAL_DESPESAS + TB_NOTA_ITEM.VAL_FRETE)*-1, '
      
        '                                        (Tb_nota_item.VAL_TOTAL ' +
        '- (Tb_nota_item.VAL_DESCONTO * TB_NOTA_ITEM.QT_QUANTIDADE) - Tb_' +
        'nota_item.VAL_DESCONTO_RATEIO +TB_NOTA_ITEM.VAL_DESPESAS + TB_NO' +
        'TA_ITEM.VAL_FRETE))) AS SVAL_TOTAL'
      
        '  /*SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.QT_QUANTI' +
        'DADE,'
      
        '                                         Tb_nota_item.QT_QUANTID' +
        'ADE*-1)) AS SQT_QUANTIDADE,*/'
      '  /* Modificado Marlon 31/05/2007'
      
        '  SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.VAL_TOTAL -' +
        ' Tb_nota_item.VAL_DESCONTO,'
      
        '                                        (Tb_nota_item.VAL_TOTAL ' +
        '- Tb_nota_item.VAL_DESCONTO)*-1)) AS SVAL_TOTAL'
      
        '  Retirada a soma do valor da substitui'#231#227'o a pedido do Junior da' +
        ' Zapoli  */'
      
        '  /*SUM(Decode(TB_OPERACAO.IND_VENDAS,'#39'V'#39',(Tb_nota_item.VAL_TOTA' +
        'L - (Tb_nota_item.VAL_DESCONTO * TB_NOTA_ITEM.QT_QUANTIDADE) - T' +
        'b_nota_item.VAL_DESCONTO_RATEIO +TB_NOTA_ITEM.VAL_DESPESAS + TB_' +
        'NOTA_ITEM.VAL_FRETE),'
      
        '                                        (Tb_nota_item.VAL_TOTAL ' +
        '- (Tb_nota_item.VAL_DESCONTO * TB_NOTA_ITEM.QT_QUANTIDADE) - Tb_' +
        'nota_item.VAL_DESCONTO_RATEIO +TB_NOTA_ITEM.VAL_DESPESAS + TB_NO' +
        'TA_ITEM.VAL_FRETE)*-1)) AS SVAL_TOTAL*/'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_CADASTRO,'
      '  TB_VENDEDOR,'
      '  TB_OPERACAO,'
      '  TB_PRODUTO'
      'WHERE'
      '  Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB'
      '  AND'
      '  TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '  AND'
      '  Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO'
      '  AND'
      '  Tb_nota_item.COD_PRODUTO = Tb_Produto.COD_PRODUTO'
      '  AND'
      '  tb_nota_cab.cod_tecnico = TB_vendedor.COD_VENDEDOR'
      '  AND'
      
        '/*  ((TB_OPERACAO.IND_VENDAS = '#39'V'#39') OR (TB_OPERACAO.IND_VENDAS =' +
        ' '#39'D'#39'))*/'
      '  (:COD_OPERACAO IS NULL OR'
      '    TB_NOTA_CAB.COD_OPERACAO = :COD_OPERACAO)'
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  (:FILIAL IS NULL OR'
      '   :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '  AND'
      '  (:TECNICO IS NULL OR'
      '   :TECNICO = TB_NOTA_CAB.COD_TECNICO)'
      '   AND'
      '  ((:SERIE IS NULL OR'
      '    TB_NOTA_CAB.COD_SERIE = :SERIE)'
      '   OR'
      '  (:SERIE1 IS NULL OR'
      '    TB_NOTA_CAB.COD_SERIE = :SERIE1))'
      '  AND'
      
        '    DECODE(TB_NOTA_CAB.IND_ENTRADA_SAIDA, '#39'E'#39',TB_NOTA_CAB.DT_REC' +
        'EBIMENTO, TB_NOTA_CAB.DT_EMISSAO) BETWEEN :DATA_I AND :DATA_F'
      '  AND'
      '  (:IND_CONDICAO_PAGTO IS NULL OR'
      '   TB_NOTA_CAB.IND_CONDICAO_PAGTO = :IND_CONDICAO_PAGTO)'
      'GROUP BY'
      '  tb_vendedor.cod_vendedor,'
      '  tb_vendedor.nome,'
      '  Tb_vendedor.PERC_IRRF,'
      '  tb_vendedor.perc_comissao3,'
      '  Tb_cadastro.COD_CADASTRO,'
      '  Tb_cadastro.NOME,'
      '  tb_nota_cab.cod_ordem_servico_cab,'
      '  Tb_Nota_Cab.Num_Nota,'
      '  Tb_Nota_Cab.Cod_Serie,'
      '  Tb_Nota_Cab.Dt_Emissao,'
      '  Tb_Nota_Cab.Cod_Nota_Cab,'
      '  Tb_Nota_Cab.Perc_Comissao,'
      '  Tb_Nota_Item.Perc_Comissao,'
      '  Tb_Produto.PERC_COMISSAO,'
      '  TB_NOTA_CAB.COD_OPERACAO'
      ''
      'UNION ALL'
      ''
      
        '/* ESTE SQL SERVE APENAS PARA LISTAR VALORES A VISTA DE NOTA FIS' +
        'CAL A PRAZO - E QUANDO FOI SOLICITADO SOMENTE NOTAS A VISTA PARA' +
        ' LISTAR NO RELATORIO */'
      'SELECT'
      '  tb_vendedor.cod_vendedor as COD_TECNICO,'
      '  tb_vendedor.nome as NOME_TECNICO,'
      '  Tb_vendedor.PERC_IRRF,'
      '  tb_vendedor.perc_comissao3,'
      '  Tb_cadastro.COD_CADASTRO,'
      '  Tb_cadastro.NOME NOME_CADASTRO,'
      '  Tb_Nota_Cab.Num_Nota,'
      '  Tb_Nota_Cab.Cod_Serie,'
      '  Tb_Nota_Cab.Dt_Emissao,'
      '  Tb_Nota_Cab.Cod_Nota_Cab,'
      '  tb_nota_cab.cod_ordem_servico_cab,'
      '  Tb_Nota_Cab.Perc_Comissao perc_comissao_nota,'
      '  TB_NOTA_CAB.COD_OPERACAO,'
      '  Tb_Nota_Cab.Perc_Comissao perc_comissao_item,'
      '  Tb_Nota_Cab.Perc_Comissao AS perc_comissao_produto,'
      '  0 AS SQT_QUANTIDADE,'
      '  Tb_Nota_Cab.Val_AVista AS SVAL_TOTAL'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_CADASTRO,'
      '  TB_VENDEDOR,'
      '  TB_OPERACAO'
      'WHERE'
      '  TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO'
      '  AND'
      '  Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO'
      '  AND'
      '  tb_nota_cab.cod_tecnico = tb_vendedor.cod_vendedor'
      '  AND'
      
        '/*  ((TB_OPERACAO.IND_VENDAS = '#39'V'#39') OR (TB_OPERACAO.IND_VENDAS =' +
        ' '#39'D'#39'))*/'
      '  (:COD_OPERACAO IS NULL OR'
      '    TB_NOTA_CAB.COD_OPERACAO = :COD_OPERACAO)'
      '  AND'
      
        '  TB_NOTA_CAB.IND_CONDICAO_PAGTO = '#39'2'#39' AND :IND_CONDICAO_PAGTO =' +
        ' '#39'1'#39
      '  AND'
      '  TB_NOTA_CAB.VAL_AVISTA > 0'
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  (:FILIAL IS NULL OR'
      '   :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '  AND'
      '  (:TECNICO IS NULL OR'
      '   :TECNICO = TB_NOTA_CAB.COD_TECNICO)'
      '  AND'
      '  ((:SERIE IS NULL OR'
      '    TB_NOTA_CAB.COD_SERIE = :SERIE)'
      '   OR'
      '  (:SERIE1 IS NULL OR'
      '    TB_NOTA_CAB.COD_SERIE = :SERIE1))'
      '  AND'
      
        '    DECODE(TB_NOTA_CAB.IND_ENTRADA_SAIDA, '#39'E'#39',TB_NOTA_CAB.DT_REC' +
        'EBIMENTO, TB_NOTA_CAB.DT_EMISSAO) BETWEEN :DATA_I AND :DATA_F'
      ''
      'ORDER BY NOME_TECNICO, Num_Nota')
    Variables.Data = {
      0300000008000000070000003A46494C49414C05000000000000000000000008
      0000003A5445434E49434F050000000000000000000000060000003A53455249
      45050000000000000000000000070000003A5345524945310500000000000000
      00000000070000003A444154415F49050000000000000000000000070000003A
      444154415F46050000000000000000000000130000003A494E445F434F4E4449
      43414F5F504147544F0500000000000000000000000D0000003A434F445F4F50
      45524143414F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000110000000B000000434F445F5445434E49434F0100000000000C0000
      004E4F4D455F5445434E49434F01000000000009000000504552435F49525246
      0100000000000E000000504552435F434F4D495353414F330100000000000C00
      0000434F445F434144415354524F0100000000000D0000004E4F4D455F434144
      415354524F010000000000080000004E554D5F4E4F5441010000000000090000
      00434F445F53455249450100000000000A00000044545F454D495353414F0100
      000000000C000000434F445F4E4F54415F434142010000000000120000005045
      52435F434F4D495353414F5F4E4F544101000000000012000000504552435F43
      4F4D495353414F5F4954454D01000000000015000000504552435F434F4D4953
      53414F5F50524F4455544F0100000000000E0000005351545F5155414E544944
      4144450100000000000A0000005356414C5F544F54414C010000000000150000
      00434F445F4F5244454D5F5345525649434F5F4341420100000000000C000000
      434F445F4F5045524143414F010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRComissaoTotalOSCalcFields
    Left = 896
    Top = 312
    object QRComissaoTotalOSCOD_TECNICO: TIntegerField
      FieldName = 'COD_TECNICO'
    end
    object QRComissaoTotalOSNOME_TECNICO: TStringField
      FieldName = 'NOME_TECNICO'
      Size = 40
    end
    object QRComissaoTotalOSPERC_IRRF: TFloatField
      FieldName = 'PERC_IRRF'
    end
    object QRComissaoTotalOSPERC_COMISSAO3: TFloatField
      FieldName = 'PERC_COMISSAO3'
    end
    object QRComissaoTotalOSCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object QRComissaoTotalOSNOME_CADASTRO: TStringField
      FieldName = 'NOME_CADASTRO'
      Size = 60
    end
    object QRComissaoTotalOSNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
    end
    object QRComissaoTotalOSCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Size = 3
    end
    object QRComissaoTotalOSDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QRComissaoTotalOSCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QRComissaoTotalOSPERC_COMISSAO_NOTA: TFloatField
      FieldName = 'PERC_COMISSAO_NOTA'
    end
    object QRComissaoTotalOSPERC_COMISSAO_ITEM: TFloatField
      FieldName = 'PERC_COMISSAO_ITEM'
    end
    object QRComissaoTotalOSPERC_COMISSAO_PRODUTO: TFloatField
      FieldName = 'PERC_COMISSAO_PRODUTO'
    end
    object QRComissaoTotalOSSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRComissaoTotalOSSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRComissaoTotalOSval_comissao: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_comissao'
      Calculated = True
    end
    object QRComissaoTotalOSCOD_ORDEM_SERVICO_CAB: TIntegerField
      FieldName = 'COD_ORDEM_SERVICO_CAB'
    end
    object QRComissaoTotalOSCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
    end
  end
  object QRTotalFaturamento: TOracleDataSet1
    SQL.Strings = (
      'select'
      '  SUM(SQT_QUANTIDADE) AS QT_QUANTIDADE,'
      '  SUM(VAL_UNITARIO) AS VAL_UNITARIO,'
      '  SUM(SVAL_CUSTO/SQT_QUANTIDADE) AS VL_CUSTO_UNITARIO,'
      
        '  SUM(VAL_UNITARIO - (SVAL_CUSTO/SQT_QUANTIDADE)) AS VL_LUCRO_UN' +
        'ITARIO,'
      
        '  SUM(((VAL_UNITARIO - (SVAL_CUSTO/SQT_QUANTIDADE))*100)/(SVAL_C' +
        'USTO/SQT_QUANTIDADE)) AS PERC_LUCRO,'
      '  SUM(SVAL_TOTAL) AS VAL_TOTAL_VENDA,'
      '  SUM(SVAL_CUSTO) AS VAL_CUSTO'
      'FROM'
      '(    '
      '  SELECT     '
      '    SUM(TB_NOTA_ITEM.QT_QUANTIDADE) AS SQT_QUANTIDADE,'
      
        '    AVG(TB_NOTA_ITEM.VAL_UNITARIO - NVL(PEGA_DESCONTO_ITEM(TB_NO' +
        'TA_ITEM.COD_NOTA_ITEM),0)) AS VAL_UNITARIO,'
      
        '    SUM(Tb_nota_item.VAL_CUSTO*Tb_nota_item.QT_QUANTIDADE) AS SV' +
        'AL_CUSTO,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - NVL(PEGA_DESCONTO_ITEM(TB_NOTA_' +
        'ITEM.COD_NOTA_ITEM),0)) AS SVAL_TOTAL'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_OPERACAO,'
      '    TB_VENDEDOR,'
      '    TB_PRODUTO,'
      '    TB_FILIAL,'
      '    TB_LOTE_TIPO,'
      '    TB_CLASSE,'
      '    TB_CADASTRO'
      '  WHERE'
      '    (TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE)'
      '    AND'
      '    (TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO)'
      '    AND'
      '    (TB_CADASTRO.COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO)'
      '    AND'
      '    (TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39')'
      '    AND'
      '    (TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39')'
      '    and'
      '    tb_operacao.ind_vendas = '#39'V'#39
      '    AND'
      '    TB_OPERACAO.COD_OPERACAO IN(3,17)'
      '    AND'
      '    (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)'
      '    AND'
      '    (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO)'
      '    AND'
      '    (Tb_filial.COD_FILIAL = Tb_nota_cab.COD_FILIAL)'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR(+) = Tb_Vendedor.COD_VENDEDOR'
      '    AND'
      '    TB_NOTA_ITEM.COD_LOTE_TIPO = TB_LOTE_TIPO.COD_LOTE_TIPO  '
      '    AND'
      '    (TB_NOTA_CAB.DT_EMISSAO >= :DT_INICIAL)'
      '    AND'
      '    (TB_NOTA_CAB.DT_EMISSAO <= :DT_FINAL)  )'
      ''
      '')
    Variables.Data = {
      03000000020000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000011000000564C5F435553544F5F554E49544152494F010000
      00000011000000564C5F4C5543524F5F554E49544152494F0100000000000A00
      0000504552435F4C5543524F0100000000000D00000051545F5155414E544944
      4144450100000000000C00000056414C5F554E49544152494F0100000000000F
      00000056414C5F544F54414C5F56454E44410100000000000900000056414C5F
      435553544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 1024
    Top = 408
    object QRTotalFaturamentoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QRTotalFaturamentoVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
    end
    object QRTotalFaturamentoVL_CUSTO_UNITARIO: TFloatField
      FieldName = 'VL_CUSTO_UNITARIO'
    end
    object QRTotalFaturamentoVL_LUCRO_UNITARIO: TFloatField
      FieldName = 'VL_LUCRO_UNITARIO'
    end
    object QRTotalFaturamentoPERC_LUCRO: TFloatField
      FieldName = 'PERC_LUCRO'
    end
    object QRTotalFaturamentoVAL_TOTAL_VENDA: TFloatField
      FieldName = 'VAL_TOTAL_VENDA'
    end
    object QRTotalFaturamentoVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
    end
  end
  object QRComissaoArtista: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '  NC.COD_NOTA_CAB,'
      '  NC.DT_EMISSAO,'
      '  NC.NUM_NOTA,'
      '  NC.COD_CADASTRO,'
      '  P.COD_CADASTRO AS COD_ARTISTA,'
      '  ARTISTA.NOME AS NOME_ARTISTA,'
      '  V.COD_VENDEDOR AS COD_VENDEDOR,'
      '  V.NOME AS NOME_VENDEDOR,'
      '  V.PERC_COMISSAO1,'
      '  V.PERC_COMISSAO2,'
      '  CLIENTE.COD_CADASTRO || '#39'-'#39' || CLIENTE.NOME AS NOME_CLIENTE,'
      
        '  CONSULTOR.COD_CADASTRO || '#39'-'#39' || CONSULTOR.NOME AS NOME_CONSUL' +
        'TOR,'
      '  NI.COD_PRODUTO,'
      '  ni.val_custo,'
      '  ni.val_total,'
      '  (pega_desconto_item(ni.cod_nota_item)) as val_desconto,'
      
        '     ((((ni. val_total - pega_desconto_item(ni.cod_nota_item) - ' +
        'ni.val_custo) -'
      
        '     (ni.val_total - pega_desconto_item(ni.cod_nota_item) - ni.v' +
        'al_custo) * 0.10) -- /*Desconta 10% da RT*/'
      '   -'
      
        '     ((ni. val_total - pega_desconto_item(ni.cod_nota_item) - ni' +
        '.val_custo) -'
      
        '     (ni.val_total - pega_desconto_item(ni.cod_nota_item) - ni.v' +
        'al_custo) * 0.10) * 0.074)) /*resultado dos 7.4% da nf*/'
      '    AS val_liquido'
      'FROM'
      '  TB_NOTA_CAB  NC,'
      '  TB_NOTA_ITEM NI,'
      '  TB_PRODUTO   P,'
      '  TB_ESTOQUE   E,'
      '  TB_CADASTRO  ARTISTA,'
      '  TB_CADASTRO  CLIENTE,'
      '  TB_CADASTRO CONSULTOR,'
      '  TB_VENDEDOR  V,'
      '  TB_OPERACAO  O'
      'WHERE'
      '  NC.COD_NOTA_CAB = NI.COD_NOTA_CAB'
      'AND'
      '  NI.COD_PRODUTO = P.COD_PRODUTO'
      'AND'
      '  NC.COD_VENDEDOR = V.COD_VENDEDOR'
      'AND'
      '  NI.COD_PRODUTO = E.COD_PRODUTO(+)'
      'AND'
      '  P.COD_CADASTRO = ARTISTA.COD_CADASTRO(+)'
      'AND'
      ' NC.COD_CADASTRO = CLIENTE.COD_CADASTRO'
      'AND'
      ' NC.COD_VENDEDOR_PREPOSTO = CONSULTOR.COD_CADASTRO(+)'
      'AND'
      ' NC.COD_OPERACAO = O.COD_OPERACAO'
      'AND'
      ' NC.IND_ENTRADA_SAIDA = '#39'S'#39
      'AND'
      '  O.IND_VENDAS = '#39'V'#39' '
      'AND'
      ' (:COD_FILIAL IS NULL'
      '  OR'
      '   NC.COD_FILIAL = :COD_FILIAL)'
      'AND'
      ' (:COD_CADASTRO IS NULL'
      '  OR'
      '   NC.COD_CADASTRO = :COD_CADASTRO)'
      'AND'
      '  (:COD_ARTISTA IS NULL'
      '   OR'
      '    P.COD_CADASTRO = :COD_ARTISTA)'
      'AND'
      '  (:COD_CONSULTOR IS NULL'
      '    OR'
      '     CONSULTOR.COD_CADASTRO = :COD_CONSULTOR)'
      'AND'
      '  (:COD_VENDEDOR IS NULL'
      '   OR'
      '   NC.COD_VENDEDOR = :COD_VENDEDOR)'
      'AND'
      '  (:DATA_I IS NULL '
      '  OR NC.DT_EMISSAO >= :DATA_I)'
      'AND'
      ' (:DATA_F IS NULL'
      '  OR'
      '    NC.DT_EMISSAO <= :DATA_F)'
      'ORDER BY NOME_VENDEDOR,Num_Nota')
    Variables.Data = {
      03000000070000000B0000003A434F445F46494C49414C030000000000000000
      0000000D0000003A434F445F434144415354524F030000000000000000000000
      0C0000003A434F445F415254495354410300000000000000000000000E000000
      3A434F445F434F4E53554C544F52030000000000000000000000070000003A44
      4154415F490C0000000000000000000000070000003A444154415F460C000000
      00000000000000000D0000003A434F445F56454E4445444F5203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000110000000C000000434F445F56454E4445444F520100000000000D00
      00004E4F4D455F56454E4445444F520100000000000C000000434F445F434144
      415354524F0100000000000A00000044545F454D495353414F0100000000000C
      000000434F445F4E4F54415F4341420100000000000B000000434F445F415254
      495354410100000000000C0000004E4F4D455F41525449535441010000000000
      0C0000004E4F4D455F434C49454E54450100000000000E0000004E4F4D455F43
      4F4E53554C544F520100000000000B000000434F445F50524F4455544F010000
      0000000900000056414C5F544F54414C0100000000000C00000056414C5F4445
      53434F4E544F0100000000000B00000056414C5F4C49515549444F0100000000
      00080000004E554D5F4E4F54410100000000000E000000504552435F434F4D49
      5353414F310100000000000E000000504552435F434F4D495353414F32010000
      0000000900000056414C5F435553544F010000000000}
    ReadOnly = True
    Session = DMOracle.DBCemapa
    Left = 1040
    Top = 544
    object QRComissaoArtistaCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QRComissaoArtistaDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRComissaoArtistaCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRComissaoArtistaCOD_ARTISTA: TIntegerField
      FieldName = 'COD_ARTISTA'
    end
    object QRComissaoArtistaNOME_ARTISTA: TStringField
      FieldName = 'NOME_ARTISTA'
      Size = 60
    end
    object QRComissaoArtistaCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object QRComissaoArtistaNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Required = True
      Size = 40
    end
    object QRComissaoArtistaNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 101
    end
    object QRComissaoArtistaNOME_CONSULTOR: TStringField
      FieldName = 'NOME_CONSULTOR'
      Size = 101
    end
    object QRComissaoArtistaCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRComissaoArtistaVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
      Required = True
    end
    object QRComissaoArtistaVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
    end
    object QRComissaoArtistaVAL_LIQUIDO: TFloatField
      FieldName = 'VAL_LIQUIDO'
    end
    object QRComissaoArtistaNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QRComissaoArtistaPERC_COMISSAO1: TFloatField
      FieldName = 'PERC_COMISSAO1'
    end
    object QRComissaoArtistaPERC_COMISSAO2: TFloatField
      FieldName = 'PERC_COMISSAO2'
    end
    object QRComissaoArtistaVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
      Required = True
    end
  end
end
