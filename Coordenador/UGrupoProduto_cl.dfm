object DMGrupoProduto: TDMGrupoProduto
  OldCreateOrder = False
  Left = 305
  Top = 207
  Height = 348
  Width = 438
  object QGrupoProduto_Cad: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Grupo_Produto.*'
      'From'
      '  Tb_Grupo_Produto'
      'Where'
      '  Cod_Grupo_Produto = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_GRUPO_PRODUTO'
    SequenceField.Sequence = 'SQ_GRUPO_PRODUTO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000500000011000000434F445F475255504F5F50524F4455544F010000
      00000012000000444553435F475255504F5F50524F4455544F01000000000009
      000000434F445F475255504F010000000000070000004E554D5F414E4F010000
      000000070000004E554D5F4D4553010000000000}
    Session = DMOracle.DBCemapa
    Left = 56
    Top = 24
    object QGrupoProduto_CadCOD_GRUPO_PRODUTO: TIntegerField
      FieldName = 'COD_GRUPO_PRODUTO'
      Required = True
    end
    object QGrupoProduto_CadDESC_GRUPO_PRODUTO: TStringField
      FieldName = 'DESC_GRUPO_PRODUTO'
      Required = True
      Size = 30
    end
    object QGrupoProduto_CadCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
    end
    object QGrupoProduto_CadNUM_ANO: TIntegerField
      FieldName = 'NUM_ANO'
    end
    object QGrupoProduto_CadNUM_MES: TIntegerField
      FieldName = 'NUM_MES'
    end
  end
  object QGrupoProdutoItem_Cad: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Grupo_Produto_Item.*'
      'From'
      '  Tb_Grupo_Produto_Item'
      ''
      'where cod_grupo_produto = :cod_grupo_produto'
      ''
      'Order by'
      '  cod_vendedor')
    Variables.Data = {
      0300000001000000120000003A434F445F475255504F5F50524F4455544F0300
      00000000000000000000}
    SequenceField.Field = 'COD_GRUPO_PRODUTO_ITEM'
    SequenceField.Sequence = 'SQ_GRUPO_PRODUTO_ITEM'
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      040000001600000016000000434F445F475255504F5F50524F4455544F5F4954
      454D01000000000011000000434F445F475255504F5F50524F4455544F010000
      0000000A00000051545F4D4554415F4B470100000000001400000056414C5F4D
      4554415F505245434F5F4D4544494F0100000000000E0000004E4F54415F4641
      4958415F4B47310100000000000E0000004E4F54415F46414958415F4B473201
      00000000000E0000004E4F54415F46414958415F4B47330100000000000E0000
      004E4F54415F46414958415F4B4734010000000000110000004E4F54415F4641
      4958415F505245434F31010000000000110000004E4F54415F46414958415F50
      5245434F32010000000000110000004E4F54415F46414958415F505245434F33
      010000000000110000004E4F54415F46414958415F505245434F340100000000
      000A000000434F445F434C415353450100000000000D00000056414C5F464149
      58415F4445310100000000000E00000056414C5F46414958415F415445310100
      000000000D00000056414C5F46414958415F4445320100000000000E00000056
      414C5F46414958415F415445320100000000000D00000056414C5F4641495841
      5F4445330100000000000E00000056414C5F46414958415F4154453301000000
      00000D00000056414C5F46414958415F4445340100000000000E00000056414C
      5F46414958415F415445340100000000000C000000434F445F56454E4445444F
      52010000000000}
    Master = QGrupoProduto_Cad
    MasterFields = 'COD_GRUPO_PRODUTO'
    DetailFields = 'COD_GRUPO_PRODUTO'
    RefreshOptions = [roBeforeEdit, roAllFields]
    Session = DMOracle.DBCemapa
    AfterInsert = QGrupoProdutoItem_CadAfterInsert
    BeforePost = QGrupoProdutoItem_CadBeforePost
    OnCalcFields = QGrupoProdutoItem_CadCalcFields
    Left = 56
    Top = 88
    object QGrupoProdutoItem_Caddesc_classe: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_classe'
      Size = 30
      Calculated = True
    end
    object QGrupoProdutoItem_CadCOD_GRUPO_PRODUTO_ITEM: TIntegerField
      FieldName = 'COD_GRUPO_PRODUTO_ITEM'
      Required = True
    end
    object QGrupoProdutoItem_CadCOD_GRUPO_PRODUTO: TIntegerField
      FieldName = 'COD_GRUPO_PRODUTO'
      Required = True
    end
    object QGrupoProdutoItem_CadQT_META_KG: TIntegerField
      FieldName = 'QT_META_KG'
      Required = True
      DisplayFormat = '#,##0'
    end
    object QGrupoProdutoItem_CadVAL_META_PRECO_MEDIO: TFloatField
      FieldName = 'VAL_META_PRECO_MEDIO'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QGrupoProdutoItem_CadNOTA_FAIXA_KG1: TFloatField
      FieldName = 'NOTA_FAIXA_KG1'
      Required = True
    end
    object QGrupoProdutoItem_CadNOTA_FAIXA_KG2: TFloatField
      FieldName = 'NOTA_FAIXA_KG2'
      Required = True
    end
    object QGrupoProdutoItem_CadNOTA_FAIXA_KG3: TFloatField
      FieldName = 'NOTA_FAIXA_KG3'
      Required = True
    end
    object QGrupoProdutoItem_CadNOTA_FAIXA_KG4: TFloatField
      FieldName = 'NOTA_FAIXA_KG4'
      Required = True
    end
    object QGrupoProdutoItem_CadNOTA_FAIXA_PRECO1: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO1'
      Required = True
    end
    object QGrupoProdutoItem_CadNOTA_FAIXA_PRECO2: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO2'
      Required = True
    end
    object QGrupoProdutoItem_CadNOTA_FAIXA_PRECO3: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO3'
      Required = True
    end
    object QGrupoProdutoItem_CadNOTA_FAIXA_PRECO4: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO4'
      Required = True
    end
    object QGrupoProdutoItem_CadCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object QGrupoProdutoItem_CadVAL_FAIXA_DE1: TFloatField
      FieldName = 'VAL_FAIXA_DE1'
      Required = True
    end
    object QGrupoProdutoItem_CadVAL_FAIXA_ATE1: TFloatField
      FieldName = 'VAL_FAIXA_ATE1'
      Required = True
    end
    object QGrupoProdutoItem_CadVAL_FAIXA_DE2: TFloatField
      FieldName = 'VAL_FAIXA_DE2'
      Required = True
    end
    object QGrupoProdutoItem_CadVAL_FAIXA_ATE2: TFloatField
      FieldName = 'VAL_FAIXA_ATE2'
      Required = True
    end
    object QGrupoProdutoItem_CadVAL_FAIXA_DE3: TFloatField
      FieldName = 'VAL_FAIXA_DE3'
      Required = True
    end
    object QGrupoProdutoItem_CadVAL_FAIXA_ATE3: TFloatField
      FieldName = 'VAL_FAIXA_ATE3'
      Required = True
    end
    object QGrupoProdutoItem_CadVAL_FAIXA_DE4: TFloatField
      FieldName = 'VAL_FAIXA_DE4'
      Required = True
    end
    object QGrupoProdutoItem_CadVAL_FAIXA_ATE4: TFloatField
      FieldName = 'VAL_FAIXA_ATE4'
      Required = True
    end
    object QGrupoProdutoItem_CadCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QGrupoProdutoItem_Cadnome_vendedor: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome_vendedor'
      Size = 30
      Calculated = True
    end
  end
  object QGrupoProduto_Cons: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  * '
      'From'
      ' Tb_Grupo_Produto'
      'Where'
      '  Num_Ano = :Num_Ano'
      '  And'
      '  Num_Mes = :Num_Mes'
      'Order By'
      ' Cod_Grupo_Produto')
    Variables.Data = {
      0300000002000000080000003A4E554D5F414E4F030000000000000000000000
      080000003A4E554D5F4D4553030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000011000000434F445F475255504F5F50524F4455544F010000
      00000012000000444553435F475255504F5F50524F4455544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 256
    Top = 24
    object QGrupoProduto_ConsCOD_GRUPO_PRODUTO: TIntegerField
      FieldName = 'COD_GRUPO_PRODUTO'
      Required = True
    end
    object QGrupoProduto_ConsDESC_GRUPO_PRODUTO: TStringField
      FieldName = 'DESC_GRUPO_PRODUTO'
      Required = True
      Size = 30
    end
  end
  object QRGrupoMapa: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_REPRESENTANTE,'
      '  NOME,'
      '  Cod_Classe,'
      '  Desc_Classe,'
      '  COD_GRUPO_PRODUTO,'
      '  DESC_GRUPO_PRODUTO,'
      '  QT_META_KG,'
      '  VAL_META_PRECO_MEDIO,'
      '  NOTA_FAIXA_KG1,'
      '  NOTA_FAIXA_KG2,'
      '  NOTA_FAIXA_KG3,'
      '  NOTA_FAIXA_KG4,'
      '  NOTA_FAIXA_PRECO1,'
      '  NOTA_FAIXA_PRECO2,'
      '  NOTA_FAIXA_PRECO3,'
      '  NOTA_FAIXA_PRECO4,'
      '  VAL_FAIXA_DE1,'
      '  VAL_FAIXA_ATE1,'
      '  VAL_FAIXA_DE2,'
      '  VAL_FAIXA_ATE2,'
      '  VAL_FAIXA_DE3,'
      '  VAL_FAIXA_ATE3,'
      '  VAL_FAIXA_DE4,'
      '  VAL_FAIXA_ATE4,'
      '  SUM(SVAL_TOTAL) AS SVAL_TOTAL,'
      '  SUM(SQT_QUANTIDADE) AS SQT_QUANTIDADE,'
      '  SUM(SQT_KILOS) AS SQT_KILOS,'
      '  SUM(SVAL_TOTAL) / NVL(SUM(SQT_KILOS),1) AS VAL_MEDIA'
      'FROM'
      '  TB_VENDEDOR,'
      '  ('
      '  SELECT'
      '    Tb_vendedor.COD_SUPERVISOR AS COD_REPRESENTANTE,'
      '    Tb_Classe.Cod_Classe,'
      '    Tb_Classe.Desc_Classe,'
      '    TB_GRUPO_PRODUTO.COD_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO.DESC_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO_ITEM.QT_META_KG,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_META_PRECO_MEDIO,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG1,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG2,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG3,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG4,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO1,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO2,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO3,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO4,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE1,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE1,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE2,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE2,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE3,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE3,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE4,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE4,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_' +
        'nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL' +
        '_FRETE) AS SVAL_TOTAL,'
      '    SUM(Tb_nota_item.QT_QUANTIDADE) AS SQT_QUANTIDADE,'
      
        '    SUM(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM) AS ' +
        'SQT_KILOS'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_PRODUTO,'
      '    TB_VENDEDOR,'
      '    TB_OPERACAO,'
      '    TB_CLASSE,'
      '    TB_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO_ITEM'
      '  WHERE'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '    AND'
      '    Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '    AND'
      '    TB_CLASSE.COD_CLASSE = TB_GRUPO_PRODUTO_ITEM.COD_CLASSE'
      '    AND'
      
        '    TB_GRUPO_PRODUTO_ITEM.COD_VENDEDOR = TB_VENDEDOR.COD_SUPERVI' +
        'SOR'
      '    AND'
      
        '    TB_GRUPO_PRODUTO_ITEM.COD_GRUPO_PRODUTO = TB_GRUPO_PRODUTO.C' +
        'OD_GRUPO_PRODUTO'
      '    AND'
      '    (Tb_operacao.ind_vendas = '#39'V'#39')'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '    AND'
      '    (:SUPERVISOR IS NULL OR'
      '     :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '    AND'
      '    TB_GRUPO_PRODUTO.NUM_ANO = :NUM_ANO'
      '    AND'
      '    TB_GRUPO_PRODUTO.NUM_MES = :NUM_MES'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      ''
      '  GROUP BY'
      '    Tb_vendedor.COD_SUPERVISOR,'
      '    Tb_Classe.Cod_Classe,'
      '    Tb_Classe.Desc_Classe,'
      '    TB_GRUPO_PRODUTO.COD_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO.DESC_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO_ITEM.QT_META_KG,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_META_PRECO_MEDIO,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG1,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG2,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG3,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG4,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO1,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO2,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO3,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO4,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE1,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE1,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE2,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE2,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE3,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE3,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE4,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE4'
      ''
      '  UNION ALL'
      ''
      '  /* *** DEVOLUCOES ****  */'
      '  SELECT'
      '    Tb_vendedor.COD_SUPERVISOR AS COD_REPRESENTANTE,'
      '    Tb_Classe.Cod_Classe,'
      '    Tb_Classe.Desc_Classe,'
      '    TB_GRUPO_PRODUTO.COD_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO.DESC_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO_ITEM.QT_META_KG,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_META_PRECO_MEDIO,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG1,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG2,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG3,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG4,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO1,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO2,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO3,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO4,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE1,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE1,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE2,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE2,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE3,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE3,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE4,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE4,'
      
        '    SUM((Tb_nota_item.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb' +
        '_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VA' +
        'L_FRETE)*-1) AS SVAL_TOTAL,'
      '    SUM((Tb_nota_item.QT_QUANTIDADE)*-1) AS SQT_QUANTIDADE,'
      
        '    SUM((Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1' +
        ') AS SQT_KILOS'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_PRODUTO,'
      '    TB_VENDEDOR,'
      '    TB_OPERACAO,'
      '    TB_CLASSE,'
      '    TB_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO_ITEM'
      '  WHERE'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '    AND'
      '    Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '    AND'
      '    TB_CLASSE.COD_CLASSE = TB_GRUPO_PRODUTO_ITEM.COD_CLASSE'
      '    AND'
      
        '    TB_GRUPO_PRODUTO_ITEM.COD_VENDEDOR = TB_VENDEDOR.COD_SUPERVI' +
        'SOR'
      '    AND'
      
        '    TB_GRUPO_PRODUTO_ITEM.COD_GRUPO_PRODUTO = TB_GRUPO_PRODUTO.C' +
        'OD_GRUPO_PRODUTO'
      '    AND'
      '    (Tb_operacao.ind_vendas = '#39'D'#39')'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '    AND'
      '    (:SUPERVISOR IS NULL OR'
      '     :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '    AND'
      '    TB_GRUPO_PRODUTO.NUM_ANO = :NUM_ANO'
      '    AND'
      '    TB_GRUPO_PRODUTO.NUM_MES = :NUM_MES'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      ''
      '  GROUP BY'
      '    Tb_vendedor.COD_SUPERVISOR,'
      '    Tb_Classe.Cod_Classe,'
      '    Tb_Classe.Desc_Classe,'
      '    TB_GRUPO_PRODUTO.COD_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO.DESC_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO_ITEM.QT_META_KG,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_META_PRECO_MEDIO,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG1,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG2,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG3,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG4,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO1,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO2,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO3,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO4,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE1,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE1,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE2,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE2,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE3,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE3,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE4,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE4'
      ')'
      'WHERE'
      '  TB_VENDEDOR.COD_VENDEDOR = COD_REPRESENTANTE'
      'GROUP BY'
      '  COD_REPRESENTANTE,'
      '  NOME,'
      '  Cod_Classe,'
      '  Desc_Classe,'
      '  COD_GRUPO_PRODUTO,'
      '  DESC_GRUPO_PRODUTO,'
      '  QT_META_KG,'
      '  VAL_META_PRECO_MEDIO,'
      '  NOTA_FAIXA_KG1,'
      '  NOTA_FAIXA_KG2,'
      '  NOTA_FAIXA_KG3,'
      '  NOTA_FAIXA_KG4,'
      '  NOTA_FAIXA_PRECO1,'
      '  NOTA_FAIXA_PRECO2,'
      '  NOTA_FAIXA_PRECO3,'
      '  NOTA_FAIXA_PRECO4,'
      '  VAL_FAIXA_DE1,'
      '  VAL_FAIXA_ATE1,'
      '  VAL_FAIXA_DE2,'
      '  VAL_FAIXA_ATE2,'
      '  VAL_FAIXA_DE3,'
      '  VAL_FAIXA_ATE3,'
      '  VAL_FAIXA_DE4,'
      '  VAL_FAIXA_ATE4'
      'ORDER BY'
      '  COD_REPRESENTANTE,'
      '  COD_GRUPO_PRODUTO,'
      '  COD_CLASSE'
      '')
    Variables.Data = {
      0300000006000000070000003A46494C49414C0300000000000000000000000B
      0000003A53555045525649534F52030000000000000000000000070000003A44
      4154415F490C0000000000000000000000070000003A444154415F460C000000
      0000000000000000080000003A4E554D5F414E4F030000000000000000000000
      080000003A4E554D5F4D4553030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001C0000000A000000434F445F434C415353450100000000000B000000
      444553435F434C4153534501000000000012000000444553435F475255504F5F
      50524F4455544F0100000000000A00000051545F4D4554415F4B470100000000
      001400000056414C5F4D4554415F505245434F5F4D4544494F0100000000000E
      0000004E4F54415F46414958415F4B47310100000000000E0000004E4F54415F
      46414958415F4B47320100000000000E0000004E4F54415F46414958415F4B47
      330100000000000E0000004E4F54415F46414958415F4B473401000000000011
      0000004E4F54415F46414958415F505245434F31010000000000110000004E4F
      54415F46414958415F505245434F32010000000000110000004E4F54415F4641
      4958415F505245434F33010000000000110000004E4F54415F46414958415F50
      5245434F340100000000000D00000056414C5F46414958415F44453101000000
      00000E00000056414C5F46414958415F415445310100000000000D0000005641
      4C5F46414958415F4445320100000000000E00000056414C5F46414958415F41
      5445320100000000000D00000056414C5F46414958415F444533010000000000
      0E00000056414C5F46414958415F415445330100000000000D00000056414C5F
      46414958415F4445340100000000000E00000056414C5F46414958415F415445
      340100000000000A0000005356414C5F544F54414C0100000000000E00000053
      51545F5155414E544944414445010000000000090000005351545F4B494C4F53
      0100000000000900000056414C5F4D4544494101000000000011000000434F44
      5F524550524553454E54414E5445010000000000040000004E4F4D4501000000
      000011000000434F445F475255504F5F50524F4455544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 248
    Top = 88
    object QRGrupoMapaCOD_CLASSE: TFloatField
      FieldName = 'COD_CLASSE'
    end
    object QRGrupoMapaDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QRGrupoMapaDESC_GRUPO_PRODUTO: TStringField
      FieldName = 'DESC_GRUPO_PRODUTO'
      Size = 30
    end
    object QRGrupoMapaQT_META_KG: TFloatField
      FieldName = 'QT_META_KG'
    end
    object QRGrupoMapaVAL_META_PRECO_MEDIO: TFloatField
      FieldName = 'VAL_META_PRECO_MEDIO'
    end
    object QRGrupoMapaNOTA_FAIXA_KG1: TFloatField
      FieldName = 'NOTA_FAIXA_KG1'
    end
    object QRGrupoMapaNOTA_FAIXA_KG2: TFloatField
      FieldName = 'NOTA_FAIXA_KG2'
    end
    object QRGrupoMapaNOTA_FAIXA_KG3: TFloatField
      FieldName = 'NOTA_FAIXA_KG3'
    end
    object QRGrupoMapaNOTA_FAIXA_KG4: TFloatField
      FieldName = 'NOTA_FAIXA_KG4'
    end
    object QRGrupoMapaNOTA_FAIXA_PRECO1: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO1'
    end
    object QRGrupoMapaNOTA_FAIXA_PRECO2: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO2'
    end
    object QRGrupoMapaNOTA_FAIXA_PRECO3: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO3'
    end
    object QRGrupoMapaNOTA_FAIXA_PRECO4: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO4'
    end
    object QRGrupoMapaVAL_FAIXA_DE1: TFloatField
      FieldName = 'VAL_FAIXA_DE1'
    end
    object QRGrupoMapaVAL_FAIXA_ATE1: TFloatField
      FieldName = 'VAL_FAIXA_ATE1'
    end
    object QRGrupoMapaVAL_FAIXA_DE2: TFloatField
      FieldName = 'VAL_FAIXA_DE2'
    end
    object QRGrupoMapaVAL_FAIXA_ATE2: TFloatField
      FieldName = 'VAL_FAIXA_ATE2'
    end
    object QRGrupoMapaVAL_FAIXA_DE3: TFloatField
      FieldName = 'VAL_FAIXA_DE3'
    end
    object QRGrupoMapaVAL_FAIXA_ATE3: TFloatField
      FieldName = 'VAL_FAIXA_ATE3'
    end
    object QRGrupoMapaVAL_FAIXA_DE4: TFloatField
      FieldName = 'VAL_FAIXA_DE4'
    end
    object QRGrupoMapaVAL_FAIXA_ATE4: TFloatField
      FieldName = 'VAL_FAIXA_ATE4'
    end
    object QRGrupoMapaSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QRGrupoMapaSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QRGrupoMapaSQT_KILOS: TFloatField
      FieldName = 'SQT_KILOS'
    end
    object QRGrupoMapaVAL_MEDIA: TFloatField
      FieldName = 'VAL_MEDIA'
    end
    object QRGrupoMapaCOD_REPRESENTANTE: TFloatField
      FieldName = 'COD_REPRESENTANTE'
    end
    object QRGrupoMapaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 40
    end
  end
  object QRGrupoProduto: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_GRUPO_PRODUTO_ITEM,'
      '  TB_GRUPO_PRODUTO.COD_GRUPO_PRODUTO AS COD_GRUPO_PRODUTO,'
      '  DESC_GRUPO_PRODUTO,'
      '  QT_META_KG,'
      '  VAL_META_PRECO_MEDIO,'
      '  VAL_FAIXA_DE1,'
      '  VAL_FAIXA_ATE1,'
      '  VAL_FAIXA_DE2,'
      '  VAL_FAIXA_ATE2,'
      '  VAL_FAIXA_DE3,'
      '  VAL_FAIXA_ATE3,'
      '  VAL_FAIXA_DE4,'
      '  VAL_FAIXA_ATE4,'
      '  NOTA_FAIXA_KG1,'
      '  NOTA_FAIXA_KG2,'
      '  NOTA_FAIXA_KG3,'
      '  NOTA_FAIXA_KG4,'
      '  NOTA_FAIXA_PRECO1,'
      '  NOTA_FAIXA_PRECO2,'
      '  NOTA_FAIXA_PRECO3,'
      '  NOTA_FAIXA_PRECO4,'
      '  DESC_CLASSE,'
      '  NOME'
      'FROM'
      '  TB_GRUPO_PRODUTO_ITEM,'
      '  TB_GRUPO_PRODUTO,'
      '  TB_CLASSE,'
      '  TB_VENDEDOR'
      'WHERE'
      
        '  TB_GRUPO_PRODUTO.COD_GRUPO_PRODUTO = TB_GRUPO_PRODUTO_ITEM.COD' +
        '_GRUPO_PRODUTO'
      '  AND'
      '  TB_GRUPO_PRODUTO_ITEM.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '  AND'
      '  TB_GRUPO_PRODUTO_ITEM.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '  AND'
      '  TB_GRUPO_PRODUTO.NUM_ANO = :NUM_ANO'
      '  AND'
      '  TB_GRUPO_PRODUTO.NUM_MES = :NUM_MES'
      '  AND'
      '  (:GRUPO_PRODUTO IS NULL'
      '    OR'
      '    TB_GRUPO_PRODUTO.COD_GRUPO_PRODUTO = :GRUPO_PRODUTO)'
      '  AND'
      '  (:SUPERVISOR IS NULL'
      '    OR'
      '    TB_GRUPO_PRODUTO_ITEM.COD_VENDEDOR = :SUPERVISOR)'
      'ORDER BY'
      '  NOME,'
      '  COD_GRUPO_PRODUTO,'
      '  DESC_CLASSE'
      '')
    Variables.Data = {
      03000000040000000E0000003A475255504F5F50524F4455544F030000000000
      0000000000000B0000003A53555045525649534F520300000000000000000000
      00080000003A4E554D5F414E4F030000000000000000000000080000003A4E55
      4D5F4D4553030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001700000016000000434F445F475255504F5F50524F4455544F5F4954
      454D01000000000012000000444553435F475255504F5F50524F4455544F0100
      000000000A00000051545F4D4554415F4B470100000000001400000056414C5F
      4D4554415F505245434F5F4D4544494F0100000000000D00000056414C5F4641
      4958415F4445310100000000000E00000056414C5F46414958415F4154453101
      00000000000D00000056414C5F46414958415F4445320100000000000E000000
      56414C5F46414958415F415445320100000000000D00000056414C5F46414958
      415F4445330100000000000E00000056414C5F46414958415F41544533010000
      0000000D00000056414C5F46414958415F4445340100000000000E0000005641
      4C5F46414958415F415445340100000000000E0000004E4F54415F4641495841
      5F4B47310100000000000E0000004E4F54415F46414958415F4B473201000000
      00000E0000004E4F54415F46414958415F4B47330100000000000E0000004E4F
      54415F46414958415F4B4734010000000000110000004E4F54415F4641495841
      5F505245434F31010000000000110000004E4F54415F46414958415F50524543
      4F32010000000000110000004E4F54415F46414958415F505245434F33010000
      000000110000004E4F54415F46414958415F505245434F340100000000000400
      00004E4F4D4501000000000011000000434F445F475255504F5F50524F445554
      4F0100000000000B000000444553435F434C41535345010000000000}
    Session = DMOracle.DBCemapa
    Left = 352
    Top = 152
    object QRGrupoProdutoCOD_GRUPO_PRODUTO_ITEM: TIntegerField
      FieldName = 'COD_GRUPO_PRODUTO_ITEM'
      Required = True
    end
    object QRGrupoProdutoCOD_GRUPO_PRODUTO: TIntegerField
      FieldName = 'COD_GRUPO_PRODUTO'
      Required = True
    end
    object QRGrupoProdutoDESC_GRUPO_PRODUTO: TStringField
      FieldName = 'DESC_GRUPO_PRODUTO'
      Required = True
      Size = 30
    end
    object QRGrupoProdutoQT_META_KG: TIntegerField
      FieldName = 'QT_META_KG'
      Required = True
    end
    object QRGrupoProdutoVAL_META_PRECO_MEDIO: TFloatField
      FieldName = 'VAL_META_PRECO_MEDIO'
      Required = True
    end
    object QRGrupoProdutoVAL_FAIXA_DE1: TFloatField
      FieldName = 'VAL_FAIXA_DE1'
      Required = True
    end
    object QRGrupoProdutoVAL_FAIXA_ATE1: TFloatField
      FieldName = 'VAL_FAIXA_ATE1'
      Required = True
    end
    object QRGrupoProdutoVAL_FAIXA_DE2: TFloatField
      FieldName = 'VAL_FAIXA_DE2'
      Required = True
    end
    object QRGrupoProdutoVAL_FAIXA_ATE2: TFloatField
      FieldName = 'VAL_FAIXA_ATE2'
      Required = True
    end
    object QRGrupoProdutoVAL_FAIXA_DE3: TFloatField
      FieldName = 'VAL_FAIXA_DE3'
      Required = True
    end
    object QRGrupoProdutoVAL_FAIXA_ATE3: TFloatField
      FieldName = 'VAL_FAIXA_ATE3'
      Required = True
    end
    object QRGrupoProdutoVAL_FAIXA_DE4: TFloatField
      FieldName = 'VAL_FAIXA_DE4'
      Required = True
    end
    object QRGrupoProdutoVAL_FAIXA_ATE4: TFloatField
      FieldName = 'VAL_FAIXA_ATE4'
      Required = True
    end
    object QRGrupoProdutoNOTA_FAIXA_KG1: TFloatField
      FieldName = 'NOTA_FAIXA_KG1'
      Required = True
    end
    object QRGrupoProdutoNOTA_FAIXA_KG2: TFloatField
      FieldName = 'NOTA_FAIXA_KG2'
      Required = True
    end
    object QRGrupoProdutoNOTA_FAIXA_KG3: TFloatField
      FieldName = 'NOTA_FAIXA_KG3'
      Required = True
    end
    object QRGrupoProdutoNOTA_FAIXA_KG4: TFloatField
      FieldName = 'NOTA_FAIXA_KG4'
      Required = True
    end
    object QRGrupoProdutoNOTA_FAIXA_PRECO1: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO1'
      Required = True
    end
    object QRGrupoProdutoNOTA_FAIXA_PRECO2: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO2'
      Required = True
    end
    object QRGrupoProdutoNOTA_FAIXA_PRECO3: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO3'
      Required = True
    end
    object QRGrupoProdutoNOTA_FAIXA_PRECO4: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO4'
      Required = True
    end
    object QRGrupoProdutoDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QRGrupoProdutoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 40
    end
  end
  object QrValoresPremio: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_REPRESENTANTE,'
      '  NOME,'
      '  Cod_Classe,'
      '  Desc_Classe,'
      '  DESC_GRUPO_PRODUTO,'
      '  COD_GRUPO_PRODUTO,'
      '  QT_META_KG,'
      '  VAL_META_PRECO_MEDIO,'
      '  NOTA_FAIXA_KG1,'
      '  NOTA_FAIXA_KG2,'
      '  NOTA_FAIXA_KG3,'
      '  NOTA_FAIXA_KG4,'
      '  NOTA_FAIXA_PRECO1,'
      '  NOTA_FAIXA_PRECO2,'
      '  NOTA_FAIXA_PRECO3,'
      '  NOTA_FAIXA_PRECO4,'
      '  VAL_FAIXA_DE1,'
      '  VAL_FAIXA_ATE1,'
      '  VAL_FAIXA_DE2,'
      '  VAL_FAIXA_ATE2,'
      '  VAL_FAIXA_DE3,'
      '  VAL_FAIXA_ATE3,'
      '  VAL_FAIXA_DE4,'
      '  VAL_FAIXA_ATE4,'
      '  SUM(SVAL_TOTAL) AS SVAL_TOTAL,'
      '  SUM(SQT_QUANTIDADE) AS SQT_QUANTIDADE,'
      '  SUM(SQT_KILOS) AS SQT_KILOS,'
      '  SUM(SVAL_TOTAL) / SUM(NVL(SQT_KILOS,1)) AS VAL_MEDIA'
      'FROM'
      '  TB_VENDEDOR,'
      '  ('
      '  SELECT'
      '    Tb_vendedor.COD_SUPERVISOR AS COD_REPRESENTANTE,'
      '    Tb_Classe.Cod_Classe,'
      '    Tb_Classe.Desc_Classe,'
      '    TB_GRUPO_PRODUTO.DESC_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO.COD_GRUPO AS COD_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO_ITEM.QT_META_KG,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_META_PRECO_MEDIO,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG1,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG2,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG3,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG4,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO1,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO2,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO3,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO4,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE1,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE1,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE2,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE2,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE3,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE3,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE4,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE4,'
      
        '    SUM(Tb_nota_item.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_' +
        'nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL' +
        '_FRETE) AS SVAL_TOTAL,'
      '    SUM(Tb_nota_item.QT_QUANTIDADE) AS SQT_QUANTIDADE,'
      
        '    SUM(Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM) AS ' +
        'SQT_KILOS'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_PRODUTO,'
      '    TB_VENDEDOR,'
      '    TB_OPERACAO,'
      '    TB_CLASSE,'
      '    TB_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO_ITEM'
      '  WHERE'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '    AND'
      '    Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '    AND'
      '    TB_CLASSE.COD_CLASSE = TB_GRUPO_PRODUTO_ITEM.COD_CLASSE'
      '    AND'
      
        '    TB_GRUPO_PRODUTO_ITEM.COD_VENDEDOR = TB_VENDEDOR.COD_SUPERVI' +
        'SOR'
      '    AND'
      
        '    TB_GRUPO_PRODUTO_ITEM.COD_GRUPO_PRODUTO = TB_GRUPO_PRODUTO.C' +
        'OD_GRUPO_PRODUTO'
      '    AND'
      '    (Tb_operacao.ind_vendas = '#39'V'#39')'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '    AND'
      '    (:SUPERVISOR IS NULL OR'
      '     :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '    AND'
      '    TB_GRUPO_PRODUTO.NUM_ANO = :NUM_ANO'
      '    AND'
      '    TB_GRUPO_PRODUTO.NUM_MES = :NUM_MES'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      ''
      '  GROUP BY'
      '    Tb_vendedor.COD_SUPERVISOR,'
      '    Tb_Classe.Cod_Classe,'
      '    Tb_Classe.Desc_Classe,'
      '    TB_GRUPO_PRODUTO.DESC_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO.COD_GRUPO,'
      '    TB_GRUPO_PRODUTO_ITEM.QT_META_KG,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_META_PRECO_MEDIO,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG1,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG2,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG3,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG4,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO1,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO2,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO3,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO4,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE1,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE1,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE2,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE2,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE3,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE3,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE4,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE4'
      ''
      '  UNION ALL'
      ''
      '  /* *** DEVOLUCOES ****  */'
      '  SELECT'
      '    Tb_vendedor.COD_SUPERVISOR AS COD_REPRESENTANTE,'
      '    Tb_Classe.Cod_Classe,'
      '    Tb_Classe.Desc_Classe,'
      '    TB_GRUPO_PRODUTO.DESC_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO.COD_GRUPO AS COD_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO_ITEM.QT_META_KG,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_META_PRECO_MEDIO,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG1,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG2,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG3,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG4,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO1,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO2,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO3,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO4,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE1,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE1,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE2,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE2,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE3,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE3,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE4,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE4,'
      
        '    SUM((Tb_nota_item.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb' +
        '_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VA' +
        'L_FRETE)*-1) AS SVAL_TOTAL,'
      '    SUM((Tb_nota_item.QT_QUANTIDADE)*-1) AS SQT_QUANTIDADE,'
      
        '    SUM((Tb_nota_item.QT_QUANTIDADE*Tb_produto.NUM_EMBALAGEM)*-1' +
        ') AS SQT_KILOS'
      '  FROM'
      '    TB_NOTA_CAB,'
      '    TB_NOTA_ITEM,'
      '    TB_PRODUTO,'
      '    TB_VENDEDOR,'
      '    TB_OPERACAO,'
      '    TB_CLASSE,'
      '    TB_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO_ITEM'
      '  WHERE'
      '    Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'
      '    AND'
      '    Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO'
      '    AND'
      '    Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'
      '    AND'
      '    Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO'
      '    AND'
      '    Tb_produto.COD_CLASSE = Tb_classe.COD_CLASSE'
      '    AND'
      '    TB_CLASSE.COD_CLASSE = TB_GRUPO_PRODUTO_ITEM.COD_CLASSE'
      '    AND'
      
        '    TB_GRUPO_PRODUTO_ITEM.COD_GRUPO_PRODUTO = TB_GRUPO_PRODUTO.C' +
        'OD_GRUPO_PRODUTO'
      '    AND'
      
        '    TB_GRUPO_PRODUTO_ITEM.COD_VENDEDOR = TB_VENDEDOR.COD_SUPERVI' +
        'SOR'
      '    AND'
      '    (Tb_operacao.ind_vendas = '#39'D'#39')'
      '    AND'
      '    TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    (:FILIAL IS NULL OR'
      '     :FILIAL = TB_NOTA_CAB.COD_FILIAL)'
      '    AND'
      '    (:SUPERVISOR IS NULL OR'
      '     :SUPERVISOR = Tb_vendedor.COD_SUPERVISOR)'
      '    AND'
      '    TB_GRUPO_PRODUTO.NUM_ANO = :NUM_ANO'
      '    AND'
      '    TB_GRUPO_PRODUTO.NUM_MES = :NUM_MES'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'
      ''
      '  GROUP BY'
      '    Tb_vendedor.COD_SUPERVISOR,'
      '    Tb_Classe.Cod_Classe,'
      '    Tb_Classe.Desc_Classe,'
      '    TB_GRUPO_PRODUTO.DESC_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO.COD_GRUPO,'
      '    TB_GRUPO_PRODUTO_ITEM.QT_META_KG,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_META_PRECO_MEDIO,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG1,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG2,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG3,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG4,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO1,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO2,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO3,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO4,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE1,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE1,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE2,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE2,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE3,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE3,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE4,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE4'
      ''
      '  UNION ALL'
      ''
      
        '  /* PARA CONSEGUIR LISTAR AS CLASSE QUE O VENDEDOR NAO VENDEU N' +
        'ADA */'
      '  SELECT'
      '    TB_GRUPO_PRODUTO_ITEM.COD_VENDEDOR AS COD_REPRESENTANTE,'
      '    Tb_Classe.Cod_Classe,'
      '    Tb_Classe.Desc_Classe,'
      '    TB_GRUPO_PRODUTO.DESC_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO.COD_GRUPO AS COD_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO_ITEM.QT_META_KG,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_META_PRECO_MEDIO,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG1,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG2,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG3,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_KG4,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO1,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO2,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO3,'
      '    TB_GRUPO_PRODUTO_ITEM.NOTA_FAIXA_PRECO4,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE1,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE1,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE2,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE2,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE3,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE3,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_DE4,'
      '    TB_GRUPO_PRODUTO_ITEM.VAL_FAIXA_ATE4,'
      '    0 AS SVAL_TOTAL,'
      '    0 AS SQT_QUANTIDADE,'
      '    Null AS SQT_KILOS'
      '  FROM'
      '    TB_CLASSE,'
      '    TB_GRUPO_PRODUTO,'
      '    TB_GRUPO_PRODUTO_ITEM'
      '  WHERE'
      
        '    TB_GRUPO_PRODUTO.COD_GRUPO_PRODUTO = TB_GRUPO_PRODUTO_ITEM.C' +
        'OD_GRUPO_PRODUTO'
      '    AND'
      '    TB_GRUPO_PRODUTO_ITEM.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '    AND'
      '    (:SUPERVISOR IS NULL OR'
      '     :SUPERVISOR = TB_GRUPO_PRODUTO_ITEM.COD_VENDEDOR)'
      '    AND'
      '    TB_GRUPO_PRODUTO.NUM_ANO = :NUM_ANO'
      '    AND'
      '    TB_GRUPO_PRODUTO.NUM_MES = :NUM_MES'
      ''
      ')'
      'WHERE'
      '  TB_VENDEDOR.COD_VENDEDOR = COD_REPRESENTANTE'
      'GROUP BY'
      '  COD_REPRESENTANTE,'
      '  NOME,'
      '  Cod_Classe,'
      '  Desc_Classe,'
      '  DESC_GRUPO_PRODUTO,'
      '  COD_GRUPO_PRODUTO,'
      '  QT_META_KG,'
      '  VAL_META_PRECO_MEDIO,'
      '  NOTA_FAIXA_KG1,'
      '  NOTA_FAIXA_KG2,'
      '  NOTA_FAIXA_KG3,'
      '  NOTA_FAIXA_KG4,'
      '  NOTA_FAIXA_PRECO1,'
      '  NOTA_FAIXA_PRECO2,'
      '  NOTA_FAIXA_PRECO3,'
      '  NOTA_FAIXA_PRECO4,'
      '  VAL_FAIXA_DE1,'
      '  VAL_FAIXA_ATE1,'
      '  VAL_FAIXA_DE2,'
      '  VAL_FAIXA_ATE2,'
      '  VAL_FAIXA_DE3,'
      '  VAL_FAIXA_ATE3,'
      '  VAL_FAIXA_DE4,'
      '  VAL_FAIXA_ATE4'
      'ORDER BY'
      '  COD_REPRESENTANTE,'
      '  DESC_GRUPO_PRODUTO,'
      '  COD_CLASSE'
      '')
    Variables.Data = {
      0300000006000000070000003A46494C49414C0300000000000000000000000B
      0000003A53555045525649534F52030000000000000000000000070000003A44
      4154415F490C0000000000000000000000070000003A444154415F460C000000
      0000000000000000080000003A4E554D5F414E4F030000000000000000000000
      080000003A4E554D5F4D4553030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001C0000000A000000434F445F434C415353450100000000000B000000
      444553435F434C4153534501000000000012000000444553435F475255504F5F
      50524F4455544F0100000000000A00000051545F4D4554415F4B470100000000
      001400000056414C5F4D4554415F505245434F5F4D4544494F0100000000000E
      0000004E4F54415F46414958415F4B47310100000000000E0000004E4F54415F
      46414958415F4B47320100000000000E0000004E4F54415F46414958415F4B47
      330100000000000E0000004E4F54415F46414958415F4B473401000000000011
      0000004E4F54415F46414958415F505245434F31010000000000110000004E4F
      54415F46414958415F505245434F32010000000000110000004E4F54415F4641
      4958415F505245434F33010000000000110000004E4F54415F46414958415F50
      5245434F340100000000000D00000056414C5F46414958415F44453101000000
      00000E00000056414C5F46414958415F415445310100000000000D0000005641
      4C5F46414958415F4445320100000000000E00000056414C5F46414958415F41
      5445320100000000000D00000056414C5F46414958415F444533010000000000
      0E00000056414C5F46414958415F415445330100000000000D00000056414C5F
      46414958415F4445340100000000000E00000056414C5F46414958415F415445
      340100000000000A0000005356414C5F544F54414C0100000000000E00000053
      51545F5155414E544944414445010000000000090000005351545F4B494C4F53
      0100000000000900000056414C5F4D4544494101000000000011000000434F44
      5F524550524553454E54414E5445010000000000040000004E4F4D4501000000
      000011000000434F445F475255504F5F50524F4455544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 56
    Top = 152
    object QrValoresPremioCOD_REPRESENTANTE: TFloatField
      FieldName = 'COD_REPRESENTANTE'
    end
    object QrValoresPremioNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 40
    end
    object QrValoresPremioCOD_CLASSE: TFloatField
      FieldName = 'COD_CLASSE'
    end
    object QrValoresPremioDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QrValoresPremioDESC_GRUPO_PRODUTO: TStringField
      FieldName = 'DESC_GRUPO_PRODUTO'
      Size = 30
    end
    object QrValoresPremioQT_META_KG: TFloatField
      FieldName = 'QT_META_KG'
    end
    object QrValoresPremioVAL_META_PRECO_MEDIO: TFloatField
      FieldName = 'VAL_META_PRECO_MEDIO'
    end
    object QrValoresPremioNOTA_FAIXA_KG1: TFloatField
      FieldName = 'NOTA_FAIXA_KG1'
    end
    object QrValoresPremioNOTA_FAIXA_KG2: TFloatField
      FieldName = 'NOTA_FAIXA_KG2'
    end
    object QrValoresPremioNOTA_FAIXA_KG3: TFloatField
      FieldName = 'NOTA_FAIXA_KG3'
    end
    object QrValoresPremioNOTA_FAIXA_KG4: TFloatField
      FieldName = 'NOTA_FAIXA_KG4'
    end
    object QrValoresPremioNOTA_FAIXA_PRECO1: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO1'
    end
    object QrValoresPremioNOTA_FAIXA_PRECO2: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO2'
    end
    object QrValoresPremioNOTA_FAIXA_PRECO3: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO3'
    end
    object QrValoresPremioNOTA_FAIXA_PRECO4: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO4'
    end
    object QrValoresPremioVAL_FAIXA_DE1: TFloatField
      FieldName = 'VAL_FAIXA_DE1'
    end
    object QrValoresPremioVAL_FAIXA_ATE1: TFloatField
      FieldName = 'VAL_FAIXA_ATE1'
    end
    object QrValoresPremioVAL_FAIXA_DE2: TFloatField
      FieldName = 'VAL_FAIXA_DE2'
    end
    object QrValoresPremioVAL_FAIXA_ATE2: TFloatField
      FieldName = 'VAL_FAIXA_ATE2'
    end
    object QrValoresPremioVAL_FAIXA_DE3: TFloatField
      FieldName = 'VAL_FAIXA_DE3'
    end
    object QrValoresPremioVAL_FAIXA_ATE3: TFloatField
      FieldName = 'VAL_FAIXA_ATE3'
    end
    object QrValoresPremioVAL_FAIXA_DE4: TFloatField
      FieldName = 'VAL_FAIXA_DE4'
    end
    object QrValoresPremioVAL_FAIXA_ATE4: TFloatField
      FieldName = 'VAL_FAIXA_ATE4'
    end
    object QrValoresPremioSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QrValoresPremioSQT_QUANTIDADE: TFloatField
      FieldName = 'SQT_QUANTIDADE'
    end
    object QrValoresPremioSQT_KILOS: TFloatField
      FieldName = 'SQT_KILOS'
    end
    object QrValoresPremioVAL_MEDIA: TFloatField
      FieldName = 'VAL_MEDIA'
    end
    object QrValoresPremioCOD_GRUPO_PRODUTO: TFloatField
      FieldName = 'COD_GRUPO_PRODUTO'
    end
  end
  object QRepresentante_Meta: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  TB_PREMIO_VENDEDOR.*'
      'FROM'
      '  TB_PREMIO_VENDEDOR'
      'WHERE'
      '  COD_VENDEDOR = :COD_VENDEDOR'
      '  AND'
      '  NUM_ANO = :NUM_ANO'
      '  AND'
      '  NUM_MES = :NUM_MES')
    Variables.Data = {
      03000000030000000D0000003A434F445F56454E4445444F5203000000000000
      0000000000080000003A4E554D5F414E4F030000000000000000000000080000
      003A4E554D5F4D4553030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000027000000130000004E554D5F424F4E55535F5155414C494441444501
      00000000000A00000056414C5F5052454D494F01000000000012000000504552
      435F494E4144494D504C454E43494101000000000013000000434F445F505245
      4D494F5F56454E4445444F520100000000000C000000434F445F56454E444544
      4F52010000000000070000004E554D5F414E4F010000000000070000004E554D
      5F4D4553010000000000080000004E4F54415F44453101000000000009000000
      4E4F54415F415445310100000000000C000000504552435F5052454D494F3101
      0000000000080000004E4F54415F444532010000000000090000004E4F54415F
      415445320100000000000C000000504552435F5052454D494F32010000000000
      080000004E4F54415F444533010000000000090000004E4F54415F4154453301
      00000000000C000000504552435F5052454D494F33010000000000080000004E
      4F54415F444534010000000000090000004E4F54415F41544534010000000000
      0C000000504552435F5052454D494F34010000000000080000004E4F54415F44
      4535010000000000090000004E4F54415F415445350100000000000C00000050
      4552435F5052454D494F35010000000000080000004E4F54415F444536010000
      000000090000004E4F54415F415445360100000000000C000000504552435F50
      52454D494F36010000000000080000004E4F54415F4445370100000000000900
      00004E4F54415F415445370100000000000C000000504552435F5052454D494F
      37010000000000080000004E4F54415F444538010000000000090000004E4F54
      415F415445380100000000000C000000504552435F5052454D494F3801000000
      0000080000004E4F54415F444539010000000000090000004E4F54415F415445
      390100000000000C000000504552435F5052454D494F39010000000000090000
      004E4F54415F444531300100000000000A0000004E4F54415F41544531300100
      000000000D000000504552435F5052454D494F31300100000000000A0000004E
      4F54415F4143494D4101000000000011000000504552435F5052454D494F5F41
      43494D41010000000000}
    Session = DMOracle.DBCemapa
    Left = 248
    Top = 152
    object QRepresentante_MetaNUM_BONUS_QUALIDADE: TFloatField
      FieldName = 'NUM_BONUS_QUALIDADE'
    end
    object QRepresentante_MetaVAL_PREMIO: TFloatField
      FieldName = 'VAL_PREMIO'
    end
    object QRepresentante_MetaPERC_INADIMPLENCIA: TFloatField
      FieldName = 'PERC_INADIMPLENCIA'
    end
    object QRepresentante_MetaCOD_PREMIO_VENDEDOR: TIntegerField
      FieldName = 'COD_PREMIO_VENDEDOR'
      Required = True
    end
    object QRepresentante_MetaCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object QRepresentante_MetaNUM_ANO: TIntegerField
      FieldName = 'NUM_ANO'
      Required = True
    end
    object QRepresentante_MetaNUM_MES: TIntegerField
      FieldName = 'NUM_MES'
      Required = True
    end
    object QRepresentante_MetaNOTA_DE1: TFloatField
      FieldName = 'NOTA_DE1'
    end
    object QRepresentante_MetaNOTA_ATE1: TFloatField
      FieldName = 'NOTA_ATE1'
    end
    object QRepresentante_MetaPERC_PREMIO1: TFloatField
      FieldName = 'PERC_PREMIO1'
    end
    object QRepresentante_MetaNOTA_DE2: TFloatField
      FieldName = 'NOTA_DE2'
    end
    object QRepresentante_MetaNOTA_ATE2: TFloatField
      FieldName = 'NOTA_ATE2'
    end
    object QRepresentante_MetaPERC_PREMIO2: TFloatField
      FieldName = 'PERC_PREMIO2'
    end
    object QRepresentante_MetaNOTA_DE3: TFloatField
      FieldName = 'NOTA_DE3'
    end
    object QRepresentante_MetaNOTA_ATE3: TFloatField
      FieldName = 'NOTA_ATE3'
    end
    object QRepresentante_MetaPERC_PREMIO3: TFloatField
      FieldName = 'PERC_PREMIO3'
    end
    object QRepresentante_MetaNOTA_DE4: TFloatField
      FieldName = 'NOTA_DE4'
    end
    object QRepresentante_MetaNOTA_ATE4: TFloatField
      FieldName = 'NOTA_ATE4'
    end
    object QRepresentante_MetaPERC_PREMIO4: TFloatField
      FieldName = 'PERC_PREMIO4'
    end
    object QRepresentante_MetaNOTA_DE5: TFloatField
      FieldName = 'NOTA_DE5'
    end
    object QRepresentante_MetaNOTA_ATE5: TFloatField
      FieldName = 'NOTA_ATE5'
    end
    object QRepresentante_MetaPERC_PREMIO5: TFloatField
      FieldName = 'PERC_PREMIO5'
    end
    object QRepresentante_MetaNOTA_DE6: TFloatField
      FieldName = 'NOTA_DE6'
    end
    object QRepresentante_MetaNOTA_ATE6: TFloatField
      FieldName = 'NOTA_ATE6'
    end
    object QRepresentante_MetaPERC_PREMIO6: TFloatField
      FieldName = 'PERC_PREMIO6'
    end
    object QRepresentante_MetaNOTA_DE7: TFloatField
      FieldName = 'NOTA_DE7'
    end
    object QRepresentante_MetaNOTA_ATE7: TFloatField
      FieldName = 'NOTA_ATE7'
    end
    object QRepresentante_MetaPERC_PREMIO7: TFloatField
      FieldName = 'PERC_PREMIO7'
    end
    object QRepresentante_MetaNOTA_DE8: TFloatField
      FieldName = 'NOTA_DE8'
    end
    object QRepresentante_MetaNOTA_ATE8: TFloatField
      FieldName = 'NOTA_ATE8'
    end
    object QRepresentante_MetaPERC_PREMIO8: TFloatField
      FieldName = 'PERC_PREMIO8'
    end
    object QRepresentante_MetaNOTA_DE9: TFloatField
      FieldName = 'NOTA_DE9'
    end
    object QRepresentante_MetaNOTA_ATE9: TFloatField
      FieldName = 'NOTA_ATE9'
    end
    object QRepresentante_MetaPERC_PREMIO9: TFloatField
      FieldName = 'PERC_PREMIO9'
    end
    object QRepresentante_MetaNOTA_DE10: TFloatField
      FieldName = 'NOTA_DE10'
    end
    object QRepresentante_MetaNOTA_ATE10: TFloatField
      FieldName = 'NOTA_ATE10'
    end
    object QRepresentante_MetaPERC_PREMIO10: TFloatField
      FieldName = 'PERC_PREMIO10'
    end
    object QRepresentante_MetaNOTA_ACIMA: TFloatField
      FieldName = 'NOTA_ACIMA'
    end
    object QRepresentante_MetaPERC_PREMIO_ACIMA: TFloatField
      FieldName = 'PERC_PREMIO_ACIMA'
    end
  end
  object QRInadimplencia: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_SUPERVISOR AS COD_SUPERVISOR,'
      '  SUM(SVAL_VENDA) AS SVAL_VENDA,'
      '  SUM(SVAL_RECEBER) AS SVAL_RECEBER'
      'FROM'
      '('
      '  SELECT'
      '    Tb_vendedor.COD_SUPERVISOR,'
      
        '    SUM(DECODE(TB_OPERACAO.IND_VENDAS,'#39'V'#39',Tb_nota_item.VAL_TOTAL' +
        '-Tb_nota_item.VAL_DESCONTO+Tb_nota_item.VAL_DESPESAS,'
      
        '                                         (Tb_nota_item.VAL_TOTAL' +
        '-Tb_nota_item.VAL_DESCONTO+tb_nota_item.VAL_DESPESAS) * -1)) AS ' +
        'SVAL_VENDA,'
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
      '    (:COD_SUPERVISOR IS NULL OR'
      '     :COD_SUPERVISOR = TB_VENDEDOR.COD_SUPERVISOR)'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO >= :DATA_I'
      '    AND'
      '    TB_NOTA_CAB.DT_EMISSAO <= :DATA_F'
      ' GROUP BY'
      '    Tb_vendedor.COD_SUPERVISOR'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    Tb_vendedor.COD_SUPERVISOR,'
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
      '    (:COD_SUPERVISOR IS NULL OR'
      '     :COD_SUPERVISOR = TB_VENDEDOR.COD_SUPERVISOR)'
      '    AND'
      '    Tb_conta_receber_cab.DT_VENCIMENTO >= :DATA_I'
      '    AND'
      '    Tb_conta_receber_cab.DT_VENCIMENTO <= :DATA_F'
      '  GROUP BY'
      '    Tb_vendedor.COD_SUPERVISOR'
      ')'
      'GROUP BY'
      '  COD_SUPERVISOR')
    Variables.Data = {
      0300000004000000070000003A46494C49414C0300000000000000000000000F
      0000003A434F445F53555045525649534F520300000000000000000000000700
      00003A444154415F490C0000000000000000000000070000003A444154415F46
      0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000E000000434F445F53555045525649534F52010000000000
      0A0000005356414C5F56454E44410100000000000C0000005356414C5F524543
      45424552010000000000}
    Session = DMOracle.DBCemapa
    Left = 56
    Top = 216
    object QRInadimplenciaCOD_SUPERVISOR: TFloatField
      FieldName = 'COD_SUPERVISOR'
    end
    object QRInadimplenciaSVAL_VENDA: TFloatField
      FieldName = 'SVAL_VENDA'
    end
    object QRInadimplenciaSVAL_RECEBER: TFloatField
      FieldName = 'SVAL_RECEBER'
    end
  end
  object QPremio_Representante: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Premio_Coordenador.*'
      'From'
      '  Tb_Premio_Coordenador'
      'Where'
      ' ( :Cod_Coordenador is null'
      '  Or'
      '    Cod_Coordenador= :Cod_Coordenador)'
      'order by'
      '  cod_Coordenador,'
      '  cod_grupo_produto,'
      '  desc_classe')
    Variables.Data = {
      0300000001000000100000003A434F445F434F4F5244454E41444F5203000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000170000000F000000434F445F434F4F5244454E41444F520100000000
      000A000000434F445F434C4153534501000000000011000000434F445F475255
      504F5F50524F4455544F0100000000000A00000051545F4D4554415F4B470100
      000000000F00000051545F5245414C495A41444F5F4B470100000000000D0000
      00564C5F4D4554415F505245434F01000000000012000000564C5F5245414C49
      5A41444F5F505245434F0100000000000B0000004E554D5F4E4F54415F4B4701
      00000000000E0000004E554D5F4E4F54415F505245434F010000000000160000
      00564C5F5052454D494F5F50524F46495353494F4E414C0100000000000E0000
      004E554D5F4E4F54415F424F4E5553010000000000160000004E554D5F4E4F54
      415F494E4144494D504C454E4349410100000000000A000000504552435F4741
      4E484F010000000000040000004E4F4D450100000000000B000000444553435F
      434C4153534501000000000012000000444553435F475255504F5F50524F4455
      544F01000000000009000000564C5F5052454D494F0100000000000F0000004E
      554D5F46414958415F4B475F4445010000000000100000004E554D5F46414958
      415F4B475F415445010000000000120000004E554D5F46414958415F50524543
      4F5F4445010000000000130000004E554D5F46414958415F505245434F5F4154
      450100000000000C0000004E554D5F46414958415F44450100000000000D0000
      004E554D5F46414958415F415445010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 248
    Top = 216
    object QPremio_RepresentanteCOD_COORDENADOR: TIntegerField
      FieldName = 'COD_COORDENADOR'
    end
    object QPremio_RepresentanteCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
    end
    object QPremio_RepresentanteCOD_GRUPO_PRODUTO: TIntegerField
      FieldName = 'COD_GRUPO_PRODUTO'
    end
    object QPremio_RepresentanteQT_META_KG: TFloatField
      FieldName = 'QT_META_KG'
    end
    object QPremio_RepresentanteQT_REALIZADO_KG: TFloatField
      FieldName = 'QT_REALIZADO_KG'
    end
    object QPremio_RepresentanteVL_META_PRECO: TFloatField
      FieldName = 'VL_META_PRECO'
    end
    object QPremio_RepresentanteVL_REALIZADO_PRECO: TFloatField
      FieldName = 'VL_REALIZADO_PRECO'
    end
    object QPremio_RepresentanteNUM_NOTA_KG: TFloatField
      FieldName = 'NUM_NOTA_KG'
    end
    object QPremio_RepresentanteNUM_NOTA_PRECO: TFloatField
      FieldName = 'NUM_NOTA_PRECO'
    end
    object QPremio_RepresentanteVL_PREMIO_PROFISSIONAL: TFloatField
      FieldName = 'VL_PREMIO_PROFISSIONAL'
    end
    object QPremio_RepresentanteNUM_NOTA_BONUS: TFloatField
      FieldName = 'NUM_NOTA_BONUS'
    end
    object QPremio_RepresentanteNUM_NOTA_INADIMPLENCIA: TFloatField
      FieldName = 'NUM_NOTA_INADIMPLENCIA'
    end
    object QPremio_RepresentantePERC_GANHO: TFloatField
      FieldName = 'PERC_GANHO'
    end
    object QPremio_RepresentanteNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object QPremio_RepresentanteDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QPremio_RepresentanteDESC_GRUPO_PRODUTO: TStringField
      FieldName = 'DESC_GRUPO_PRODUTO'
      Size = 30
    end
    object QPremio_RepresentanteVL_PREMIO: TFloatField
      FieldName = 'VL_PREMIO'
    end
    object QPremio_RepresentanteNUM_FAIXA_KG_DE: TFloatField
      FieldName = 'NUM_FAIXA_KG_DE'
    end
    object QPremio_RepresentanteNUM_FAIXA_KG_ATE: TFloatField
      FieldName = 'NUM_FAIXA_KG_ATE'
    end
    object QPremio_RepresentanteNUM_FAIXA_PRECO_DE: TFloatField
      FieldName = 'NUM_FAIXA_PRECO_DE'
    end
    object QPremio_RepresentanteNUM_FAIXA_PRECO_ATE: TFloatField
      FieldName = 'NUM_FAIXA_PRECO_ATE'
    end
  end
  object QGrupoProduto_Origem: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Tb_Grupo_Produto.*'
      'From'
      '  Tb_Grupo_Produto'
      'Where'
      '  Num_Ano = :Ano'
      '  AND'
      '  Num_Mes = :Mes')
    Variables.Data = {
      0300000002000000040000003A414E4F03000000000000000000000004000000
      3A4D4553030000000000000000000000}
    SequenceField.Field = 'COD_GRUPO_PRODUTO'
    SequenceField.Sequence = 'SQ_GRUPO_PRODUTO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000500000011000000434F445F475255504F5F50524F4455544F010000
      00000012000000444553435F475255504F5F50524F4455544F01000000000009
      000000434F445F475255504F010000000000070000004E554D5F414E4F010000
      000000070000004E554D5F4D4553010000000000}
    Session = DMOracle.DBCemapa
    Left = 56
    Top = 264
    object QGrupoProduto_OrigemCOD_GRUPO_PRODUTO: TIntegerField
      FieldName = 'COD_GRUPO_PRODUTO'
      Required = True
    end
    object QGrupoProduto_OrigemDESC_GRUPO_PRODUTO: TStringField
      FieldName = 'DESC_GRUPO_PRODUTO'
      Required = True
      Size = 30
    end
    object QGrupoProduto_OrigemCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
    end
    object QGrupoProduto_OrigemNUM_ANO: TIntegerField
      FieldName = 'NUM_ANO'
    end
    object QGrupoProduto_OrigemNUM_MES: TIntegerField
      FieldName = 'NUM_MES'
    end
  end
  object QGrupoProdutoItem_Origem: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Tb_Grupo_Produto_Item.*'
      'From'
      '  Tb_Grupo_Produto_Item'
      ''
      'where cod_grupo_produto = :cod_grupo_produto'
      ''
      '')
    Variables.Data = {
      0300000001000000120000003A434F445F475255504F5F50524F4455544F0300
      00000000000000000000}
    SequenceField.Field = 'COD_GRUPO_PRODUTO_ITEM'
    SequenceField.Sequence = 'SQ_GRUPO_PRODUTO_ITEM'
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      040000001600000016000000434F445F475255504F5F50524F4455544F5F4954
      454D01000000000011000000434F445F475255504F5F50524F4455544F010000
      0000000A00000051545F4D4554415F4B470100000000001400000056414C5F4D
      4554415F505245434F5F4D4544494F0100000000000E0000004E4F54415F4641
      4958415F4B47310100000000000E0000004E4F54415F46414958415F4B473201
      00000000000E0000004E4F54415F46414958415F4B47330100000000000E0000
      004E4F54415F46414958415F4B4734010000000000110000004E4F54415F4641
      4958415F505245434F31010000000000110000004E4F54415F46414958415F50
      5245434F32010000000000110000004E4F54415F46414958415F505245434F33
      010000000000110000004E4F54415F46414958415F505245434F340100000000
      000A000000434F445F434C415353450100000000000D00000056414C5F464149
      58415F4445310100000000000E00000056414C5F46414958415F415445310100
      000000000D00000056414C5F46414958415F4445320100000000000E00000056
      414C5F46414958415F415445320100000000000D00000056414C5F4641495841
      5F4445330100000000000E00000056414C5F46414958415F4154453301000000
      00000D00000056414C5F46414958415F4445340100000000000E00000056414C
      5F46414958415F415445340100000000000C000000434F445F56454E4445444F
      52010000000000}
    Session = DMOracle.DBCemapa
    AfterInsert = QGrupoProdutoItem_CadAfterInsert
    BeforePost = QGrupoProdutoItem_CadBeforePost
    OnCalcFields = QGrupoProdutoItem_CadCalcFields
    Left = 248
    Top = 264
    object QGrupoProdutoItem_OrigemCOD_GRUPO_PRODUTO_ITEM: TIntegerField
      FieldName = 'COD_GRUPO_PRODUTO_ITEM'
      Required = True
    end
    object QGrupoProdutoItem_OrigemCOD_GRUPO_PRODUTO: TIntegerField
      FieldName = 'COD_GRUPO_PRODUTO'
      Required = True
    end
    object QGrupoProdutoItem_OrigemQT_META_KG: TIntegerField
      FieldName = 'QT_META_KG'
      Required = True
      DisplayFormat = '#,##0'
    end
    object QGrupoProdutoItem_OrigemVAL_META_PRECO_MEDIO: TFloatField
      FieldName = 'VAL_META_PRECO_MEDIO'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QGrupoProdutoItem_OrigemNOTA_FAIXA_KG1: TFloatField
      FieldName = 'NOTA_FAIXA_KG1'
      Required = True
    end
    object QGrupoProdutoItem_OrigemNOTA_FAIXA_KG2: TFloatField
      FieldName = 'NOTA_FAIXA_KG2'
      Required = True
    end
    object QGrupoProdutoItem_OrigemNOTA_FAIXA_KG3: TFloatField
      FieldName = 'NOTA_FAIXA_KG3'
      Required = True
    end
    object QGrupoProdutoItem_OrigemNOTA_FAIXA_KG4: TFloatField
      FieldName = 'NOTA_FAIXA_KG4'
      Required = True
    end
    object QGrupoProdutoItem_OrigemNOTA_FAIXA_PRECO1: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO1'
      Required = True
    end
    object QGrupoProdutoItem_OrigemNOTA_FAIXA_PRECO2: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO2'
      Required = True
    end
    object QGrupoProdutoItem_OrigemNOTA_FAIXA_PRECO3: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO3'
      Required = True
    end
    object QGrupoProdutoItem_OrigemNOTA_FAIXA_PRECO4: TFloatField
      FieldName = 'NOTA_FAIXA_PRECO4'
      Required = True
    end
    object QGrupoProdutoItem_OrigemCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object QGrupoProdutoItem_OrigemVAL_FAIXA_DE1: TFloatField
      FieldName = 'VAL_FAIXA_DE1'
      Required = True
    end
    object QGrupoProdutoItem_OrigemVAL_FAIXA_ATE1: TFloatField
      FieldName = 'VAL_FAIXA_ATE1'
      Required = True
    end
    object QGrupoProdutoItem_OrigemVAL_FAIXA_DE2: TFloatField
      FieldName = 'VAL_FAIXA_DE2'
      Required = True
    end
    object QGrupoProdutoItem_OrigemVAL_FAIXA_ATE2: TFloatField
      FieldName = 'VAL_FAIXA_ATE2'
      Required = True
    end
    object QGrupoProdutoItem_OrigemVAL_FAIXA_DE3: TFloatField
      FieldName = 'VAL_FAIXA_DE3'
      Required = True
    end
    object QGrupoProdutoItem_OrigemVAL_FAIXA_ATE3: TFloatField
      FieldName = 'VAL_FAIXA_ATE3'
      Required = True
    end
    object QGrupoProdutoItem_OrigemVAL_FAIXA_DE4: TFloatField
      FieldName = 'VAL_FAIXA_DE4'
      Required = True
    end
    object QGrupoProdutoItem_OrigemVAL_FAIXA_ATE4: TFloatField
      FieldName = 'VAL_FAIXA_ATE4'
      Required = True
    end
    object QGrupoProdutoItem_OrigemCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
  end
end
