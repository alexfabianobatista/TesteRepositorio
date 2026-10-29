object DmSuino: TDmSuino
  OldCreateOrder = False
  Left = 470
  Top = 194
  Height = 224
  Width = 340
  object QSuinoDespesa: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_SUINO_DESPESA.*'
      'FROM'
      '  TB_SUINO_DESPESA'
      'WHERE'
      '  TB_SUINO_DESPESA.COD_SUINO_DESPESA = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_SUINO_DESPESA'
    SequenceField.Sequence = 'SQSUINO_DESPESA'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000600000011000000434F445F5355494E4F5F44455350455341010000
      0000000C000000434F445F434144415354524F0100000000000D000000434F44
      5F484953544F5249434F0100000000000A00000044545F444553504553410100
      000000000B00000056414C5F4445535045534101000000000008000000444553
      435F4F4253010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 16
    object QSuinoDespesaCOD_SUINO_DESPESA: TIntegerField
      FieldName = 'COD_SUINO_DESPESA'
      Required = True
    end
    object QSuinoDespesaCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QSuinoDespesaCOD_HISTORICO: TIntegerField
      FieldName = 'COD_HISTORICO'
      Required = True
    end
    object QSuinoDespesaDT_DESPESA: TDateTimeField
      FieldName = 'DT_DESPESA'
      Required = True
      EditMask = '!99/99/##00;1;_'
    end
    object QSuinoDespesaVAL_DESPESA: TFloatField
      FieldName = 'VAL_DESPESA'
      Required = True
      DisplayFormat = '#,###,##0.00'
      EditFormat = '0.00'
    end
    object QSuinoDespesaDESC_OBS: TStringField
      FieldName = 'DESC_OBS'
      Size = 200
    end
  end
  object QSuinoDespesaCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_SUINO_DESPESA.*,'
      '  TB_CADASTRO.NOME,'
      '  TB_HISTORICO.DESC_HISTORICO'
      'FROM'
      '  TB_SUINO_DESPESA'
      
        'INNER JOIN TB_CADASTRO ON TB_CADASTRO.COD_CADASTRO = TB_SUINO_DE' +
        'SPESA.COD_CADASTRO'
      
        'INNER JOIN TB_HISTORICO ON TB_HISTORICO.COD_HISTORICO = TB_SUINO' +
        '_DESPESA.COD_HISTORICO'
      'WHERE'
      '  (:COD_CADASTRO IS NULL'
      '    OR'
      '  TB_CADASTRO.COD_CADASTRO = :COD_CADASTRO)'
      'AND'
      
        '  TB_SUINO_DESPESA.DT_DESPESA BETWEEN :DT_DESPESA_INI AND :DT_DE' +
        'SPESA_FIN')
    Variables.Data = {
      03000000030000000D0000003A434F445F434144415354524F03000000000000
      00000000000F0000003A44545F444553504553415F494E490C00000000000000
      000000000F0000003A44545F444553504553415F46494E0C0000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000800000011000000434F445F5355494E4F5F44455350455341010000
      0000000C000000434F445F434144415354524F0100000000000D000000434F44
      5F484953544F5249434F0100000000000A00000044545F444553504553410100
      000000000B00000056414C5F4445535045534101000000000008000000444553
      435F4F4253010000000000040000004E4F4D450100000000000E000000444553
      435F484953544F5249434F010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 64
    object QSuinoDespesaConsCOD_SUINO_DESPESA: TIntegerField
      FieldName = 'COD_SUINO_DESPESA'
      Required = True
    end
    object QSuinoDespesaConsCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QSuinoDespesaConsCOD_HISTORICO: TIntegerField
      FieldName = 'COD_HISTORICO'
      Required = True
    end
    object QSuinoDespesaConsDT_DESPESA: TDateTimeField
      FieldName = 'DT_DESPESA'
      Required = True
      EditMask = '!99/99/##00;1;_'
    end
    object QSuinoDespesaConsVAL_DESPESA: TFloatField
      FieldName = 'VAL_DESPESA'
      Required = True
      DisplayFormat = '#,###,##0.00'
    end
    object QSuinoDespesaConsDESC_OBS: TStringField
      FieldName = 'DESC_OBS'
      Size = 200
    end
    object QSuinoDespesaConsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QSuinoDespesaConsDESC_HISTORICO: TStringField
      FieldName = 'DESC_HISTORICO'
      Required = True
      Size = 30
    end
  end
  object QSobra: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_SUINO_SOBRA_PRODUTO.*'
      'FROM'
      '  TB_SUINO_SOBRA_PRODUTO'
      'WHERE'
      '  TB_SUINO_SOBRA_PRODUTO.COD_SUINO_SOBRA_PRODUTO = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_SUINO_SOBRA_PRODUTO'
    SequenceField.Sequence = 'SQSUINO_SOBRA_PRODUTO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000070000000C000000434F445F434144415354524F0100000000001700
      0000434F445F5355494E4F5F534F4252415F50524F4455544F0100000000000B
      000000434F445F50524F4455544F0100000000000800000051545F534F425241
      0100000000000900000056414C5F435553544F0100000000000800000044545F
      534F42524101000000000008000000494E445F5449504F010000000000}
    Session = DMOracle.DBCemapa
    AfterInsert = QSobraAfterInsert
    Left = 144
    Top = 16
    object QSobraCOD_SUINO_SOBRA_PRODUTO: TIntegerField
      FieldName = 'COD_SUINO_SOBRA_PRODUTO'
      Required = True
    end
    object QSobraCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QSobraCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QSobraQT_SOBRA: TFloatField
      FieldName = 'QT_SOBRA'
      Required = True
      DisplayFormat = '#,###,##0.###'
      EditFormat = '0.###'
    end
    object QSobraVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
      Required = True
      DisplayFormat = '#,###,##0.00'
      EditFormat = '0.00'
    end
    object QSobraDT_SOBRA: TDateTimeField
      FieldName = 'DT_SOBRA'
      Required = True
      EditMask = '!99/99/##00;1;_'
    end
    object QSobraIND_TIPO: TStringField
      FieldName = 'IND_TIPO'
      Required = True
      Size = 1
    end
  end
  object QSobraCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_SUINO_SOBRA_PRODUTO.*,'
      '  TB_CADASTRO.NOME,'
      '  TB_PRODUTO.DESC_PRODUTO'
      'FROM'
      '  TB_SUINO_SOBRA_PRODUTO'
      
        'INNER JOIN TB_CADASTRO ON TB_CADASTRO.COD_CADASTRO = TB_SUINO_SO' +
        'BRA_PRODUTO.COD_CADASTRO'
      
        'INNER JOIN TB_PRODUTO ON TB_PRODUTO.COD_PRODUTO = TB_SUINO_SOBRA' +
        '_PRODUTO.COD_PRODUTO'
      'WHERE'
      '  (:COD_PRODUTO IS NULL'
      '    OR'
      '  TB_PRODUTO.COD_PRODUTO = :COD_PRODUTO)'
      'AND'
      
        '  TB_SUINO_SOBRA_PRODUTO.DT_SOBRA BETWEEN :DT_SOBRA_INI AND :DT_' +
        'SOBRA_FIN')
    Variables.Data = {
      03000000030000000C0000003A434F445F50524F4455544F0300000000000000
      000000000D0000003A44545F534F4252415F494E490C00000000000000000000
      000D0000003A44545F534F4252415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000C000000434F445F434144415354524F0100000000000400
      00004E4F4D4501000000000017000000434F445F5355494E4F5F534F4252415F
      50524F4455544F0100000000000B000000434F445F50524F4455544F01000000
      00000800000051545F534F4252410100000000000900000056414C5F43555354
      4F0100000000000800000044545F534F42524101000000000008000000494E44
      5F5449504F0100000000000C000000444553435F50524F4455544F0100000000
      00}
    Session = DMOracle.DBCemapa
    Left = 144
    Top = 64
    object QSobraConsCOD_SUINO_SOBRA_PRODUTO: TIntegerField
      FieldName = 'COD_SUINO_SOBRA_PRODUTO'
      Required = True
    end
    object QSobraConsCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QSobraConsCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QSobraConsQT_SOBRA: TFloatField
      FieldName = 'QT_SOBRA'
      Required = True
      DisplayFormat = '#,###,##0.###'
    end
    object QSobraConsVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
      Required = True
      DisplayFormat = '#,###,##0.00'
    end
    object QSobraConsDT_SOBRA: TDateTimeField
      FieldName = 'DT_SOBRA'
      Required = True
    end
    object QSobraConsIND_TIPO: TStringField
      FieldName = 'IND_TIPO'
      Required = True
      Size = 1
    end
    object QSobraConsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QSobraConsDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
  end
  object QRReceitaDespesa: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  DESC_TIPO,'
      '  NUM_NOTA,'
      '  DT_RECEBIMENTO,'
      '  COD_PRODUTO,'
      '  DESC_PRODUTO,'
      '  IND_TIPO_PRODUTO,'
      '  COD_CADASTRO,'
      '  NOME,'
      '  QT_QUANTIDADE,'
      '  NUM_CABECAS,'
      '  VAL_UNITARIO,'
      '  VAL_TOTAL'
      'FROM'
      '('
      '  SELECT'
      '    '#39'NOTAS DE SAIDA - RA'#199#195'O'#39' AS DESC_TIPO,'
      '    TB_NOTA_CAB.NUM_NOTA,'
      '    TB_NOTA_CAB.DT_RECEBIMENTO,'
      '    TB_PRODUTO.COD_PRODUTO,'
      '    TB_PRODUTO.DESC_PRODUTO,'
      '    TB_PRODUTO.IND_TIPO_PRODUTO,'
      '    TB_CADASTRO.COD_CADASTRO,'
      '    TB_CADASTRO.NOME,'
      '    TB_NOTA_ITEM.QT_QUANTIDADE,'
      '    TB_NOTA_ITEM.NUM_CABECAS,'
      '    TB_NOTA_ITEM.VAL_UNITARIO,'
      
        '    TB_NOTA_ITEM.QT_QUANTIDADE * TB_NOTA_ITEM.VAL_UNITARIO AS VA' +
        'L_TOTAL'
      '  FROM'
      '    TB_NOTA_ITEM,'
      '    TB_NOTA_CAB,'
      '    TB_CADASTRO,'
      '    TB_PRODUTO'
      '  WHERE'
      '    TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '    And'
      '    TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '    And'
      '    TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '    AND'
      '    TB_PRODUTO.IND_TIPO_PRODUTO = '#39'RA'#199#195'O'#39
      '    AND'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO BETWEEN :DATA_INI AND :DATA_FIN'
      '    AND'
      '    (:COD_FILIAL IS NULL'
      '     Or'
      '      TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      '    AND'
      '    (:COD_CADASTRO IS NULL'
      '     Or'
      '      TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO)'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    '#39'NOTAS DE SAIDA - OUTROS'#39' AS DESC_TIPO,'
      '    TB_NOTA_CAB.NUM_NOTA,'
      '    TB_NOTA_CAB.DT_RECEBIMENTO,'
      '    TB_PRODUTO.COD_PRODUTO,'
      '    TB_PRODUTO.DESC_PRODUTO,'
      '    TB_PRODUTO.IND_TIPO_PRODUTO,'
      '    TB_CADASTRO.COD_CADASTRO,'
      '    TB_CADASTRO.NOME,'
      '    TB_NOTA_ITEM.QT_QUANTIDADE,'
      '    TB_NOTA_ITEM.NUM_CABECAS,'
      '    TB_NOTA_ITEM.VAL_UNITARIO,'
      
        '    TB_NOTA_ITEM.QT_QUANTIDADE * TB_NOTA_ITEM.VAL_UNITARIO AS VA' +
        'L_TOTAL'
      '  FROM'
      '    TB_NOTA_ITEM,'
      '    TB_NOTA_CAB,'
      '    TB_CADASTRO,'
      '    TB_PRODUTO'
      '  WHERE'
      '    TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '    And'
      '    TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '    And'
      '    TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '    AND'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    TB_PRODUTO.IND_TIPO_PRODUTO <> '#39'RA'#199#195'O'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO BETWEEN :DATA_INI AND :DATA_FIN'
      '    AND'
      '    (:COD_FILIAL IS NULL'
      '     Or'
      '      TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      '    AND'
      '    (:COD_CADASTRO IS NULL'
      '     Or'
      '      TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO)'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    '#39'NOTAS DE ENTRADA'#39' AS DESC_TIPO,'
      '    TB_NOTA_CAB.NUM_NOTA,'
      '    TB_NOTA_CAB.DT_RECEBIMENTO,'
      '    TB_PRODUTO.COD_PRODUTO,'
      '    TB_PRODUTO.DESC_PRODUTO,'
      '    TB_PRODUTO.IND_TIPO_PRODUTO,'
      '    TB_CADASTRO.COD_CADASTRO,'
      '    TB_CADASTRO.NOME,'
      '    TB_NOTA_ITEM.QT_QUANTIDADE,'
      '    TB_NOTA_ITEM.NUM_CABECAS,'
      '    TB_NOTA_ITEM.VAL_UNITARIO,'
      
        '    TB_NOTA_ITEM.QT_QUANTIDADE * TB_NOTA_ITEM.VAL_UNITARIO AS VA' +
        'L_TOTAL'
      '  FROM'
      '    TB_NOTA_ITEM,'
      '    TB_NOTA_CAB,'
      '    TB_CADASTRO,'
      '    TB_PRODUTO'
      '  WHERE'
      '    TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '    AND'
      '    TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '    AND'
      '    TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '    AND'
      '    TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    TB_NOTA_CAB.DT_RECEBIMENTO BETWEEN :DATA_INI AND :DATA_FIN'
      '    AND'
      '    (:COD_FILIAL IS NULL'
      '     Or'
      '      TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      '    AND'
      '    (:COD_CADASTRO IS NULL'
      '     Or'
      '      TB_NOTA_CAB.COD_CADASTRO = :COD_CADASTRO)'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    '#39'DESPESAS'#39' AS DESC_TIPO,'
      '    NULL,'
      '    TB_SUINO_DESPESA.DT_DESPESA,'
      '    NULL,'
      '    TB_HISTORICO.DESC_HISTORICO AS DESC_PRODUTO,'
      '    NULL,'
      '    TB_CADASTRO.COD_CADASTRO,'
      '    TB_CADASTRO.NOME,'
      '    0.00,'
      '    0.00,'
      '    TB_SUINO_DESPESA.VAL_DESPESA,'
      '    TB_SUINO_DESPESA.VAL_DESPESA  AS VAL_TOTAL'
      '  FROM'
      '    TB_SUINO_DESPESA,'
      '    TB_CADASTRO,'
      '    TB_HISTORICO'
      '  WHERE'
      '    TB_SUINO_DESPESA.COD_HISTORICO = TB_HISTORICO.COD_HISTORICO'
      '    AND'
      '    TB_SUINO_DESPESA.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '    AND'
      '    TB_SUINO_DESPESA.DT_DESPESA BETWEEN :DATA_INI AND :DATA_FIN'
      '    AND'
      '    (:COD_CADASTRO IS NULL'
      '     Or'
      '      TB_SUINO_DESPESA.COD_CADASTRO = :COD_CADASTRO)'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    '#39'DEVOLU'#199#213'ES NO PER'#205'ODO'#39' AS DESC_TIPO,'
      '    NULL,'
      '    TB_SUINO_SOBRA_PRODUTO.DT_SOBRA,'
      '    NULL,'
      '    TB_PRODUTO.DESC_PRODUTO,'
      '    TB_PRODUTO.IND_TIPO_PRODUTO,'
      '    TB_CADASTRO.COD_CADASTRO,'
      '    TB_CADASTRO.NOME,'
      '    TB_SUINO_SOBRA_PRODUTO.QT_SOBRA * -1 AS QT_QUANTIDADE,'
      '    0.00,'
      '    TB_SUINO_SOBRA_PRODUTO.VAL_CUSTO,'
      
        '    TB_SUINO_SOBRA_PRODUTO.QT_SOBRA * TB_SUINO_SOBRA_PRODUTO.VAL' +
        '_CUSTO * -1 AS VAL_TOTAL'
      '  FROM'
      '    TB_SUINO_SOBRA_PRODUTO,'
      '    TB_CADASTRO,'
      '    TB_PRODUTO'
      '  WHERE'
      '    TB_SUINO_SOBRA_PRODUTO.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '    AND'
      
        '    TB_SUINO_SOBRA_PRODUTO.COD_CADASTRO = TB_CADASTRO.COD_CADAST' +
        'RO'
      '    AND'
      '    TB_SUINO_SOBRA_PRODUTO.IND_TIPO = '#39'S'#39
      '    AND'
      
        '    TB_SUINO_SOBRA_PRODUTO.DT_SOBRA BETWEEN :DATA_INI AND :DATA_' +
        'FIN'
      '    AND'
      '    (:COD_CADASTRO IS NULL'
      '     Or'
      '      TB_SUINO_SOBRA_PRODUTO.COD_CADASTRO = :COD_CADASTRO)'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    '#39'SOBRAS DO PER'#205'ODO ANTERIOR'#39' AS DESC_TIPO,'
      '    NULL,'
      '    TB_SUINO_SOBRA_PRODUTO.DT_SOBRA,'
      '    NULL,'
      '    TB_PRODUTO.DESC_PRODUTO,'
      '    TB_PRODUTO.IND_TIPO_PRODUTO,'
      '    TB_CADASTRO.COD_CADASTRO,'
      '    TB_CADASTRO.NOME,'
      '    TB_SUINO_SOBRA_PRODUTO.QT_SOBRA AS QT_QUANTIDADE,'
      '    0.00,'
      '    TB_SUINO_SOBRA_PRODUTO.VAL_CUSTO,'
      
        '    TB_SUINO_SOBRA_PRODUTO.QT_SOBRA * TB_SUINO_SOBRA_PRODUTO.VAL' +
        '_CUSTO AS VAL_TOTAL'
      '  FROM'
      '    TB_SUINO_SOBRA_PRODUTO,'
      '    TB_CADASTRO,'
      '    TB_PRODUTO'
      '  WHERE'
      '    TB_SUINO_SOBRA_PRODUTO.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '    AND'
      
        '    TB_SUINO_SOBRA_PRODUTO.COD_CADASTRO = TB_CADASTRO.COD_CADAST' +
        'RO'
      '    AND'
      '    TB_SUINO_SOBRA_PRODUTO.IND_TIPO = '#39'E'#39
      '    AND'
      
        '    TB_SUINO_SOBRA_PRODUTO.DT_SOBRA BETWEEN :DATA_INI AND :DATA_' +
        'FIN'
      '    AND'
      '    (:COD_CADASTRO IS NULL'
      '     Or'
      '      TB_SUINO_SOBRA_PRODUTO.COD_CADASTRO = :COD_CADASTRO)'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    '#39'ADIANTAMENTOS'#39' AS DESC_TIPO,'
      '    TB_CONTA_RECEBER_CAB.NUM_TITULO AS NUM_NOTA,'
      '    TB_CONTA_RECEBER_CAB.DT_EMISSAO,'
      '    NULL,'
      '    TB_FINALIDADE.DESC_FINALIDADE,'
      '    NULL,'
      '    TB_CADASTRO.COD_CADASTRO,'
      '    TB_CADASTRO.NOME,'
      '    0.00 AS QT_QUANTIDADE,'
      '    0.00,'
      '    TB_CONTA_RECEBER_CAB.VAL_TITULO,'
      '    TB_CONTA_RECEBER_CAB.VAL_TITULO AS VAL_TOTAL'
      '  FROM'
      '    TB_CONTA_RECEBER_CAB,'
      '    TB_CADASTRO,'
      '    TB_FINALIDADE'
      '  WHERE'
      
        '    TB_CONTA_RECEBER_CAB.COD_FINALIDADE = TB_FINALIDADE.COD_FINA' +
        'LIDADE'
      '    AND'
      '    TB_CONTA_RECEBER_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '    AND'
      '    TB_FINALIDADE.IND_TIPO = '#39'ADIANTAMENTOS'#39
      '    AND'
      
        '    TB_CONTA_RECEBER_CAB.DT_EMISSAO BETWEEN :DATA_INI AND :DATA_' +
        'FIN'
      '    AND'
      '    (:COD_CADASTRO IS NULL'
      '     Or'
      '      TB_CONTA_RECEBER_CAB.COD_CADASTRO = :COD_CADASTRO)'
      ')'
      'Order by'
      '  NOME,'
      '  DESC_TIPO,'
      '  DT_RECEBIMENTO'
      '')
    Variables.Data = {
      03000000040000000D0000003A434F445F434144415354524F03000000000000
      0000000000090000003A444154415F494E490C00000000000000000000000900
      00003A444154415F46494E0C00000000000000000000000B0000003A434F445F
      46494C49414C030000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000C000000080000004E554D5F4E4F54410100000000000E0000004454
      5F5245434542494D454E544F0100000000000B000000434F445F50524F445554
      4F0100000000000C000000444553435F50524F4455544F0100000000000D0000
      0051545F5155414E5449444144450100000000000B0000004E554D5F43414245
      4341530100000000000C00000056414C5F554E49544152494F01000000000009
      00000056414C5F544F54414C01000000000009000000444553435F5449504F01
      00000000000C000000434F445F434144415354524F010000000000040000004E
      4F4D4501000000000010000000494E445F5449504F5F50524F4455544F010000
      000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 120
    object QRReceitaDespesaNUM_NOTA: TFloatField
      FieldName = 'NUM_NOTA'
    end
    object QRReceitaDespesaDT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
    end
    object QRReceitaDespesaCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QRReceitaDespesaDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRReceitaDespesaCOD_CADASTRO: TFloatField
      FieldName = 'COD_CADASTRO'
    end
    object QRReceitaDespesaNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object QRReceitaDespesaQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QRReceitaDespesaNUM_CABECAS: TFloatField
      FieldName = 'NUM_CABECAS'
    end
    object QRReceitaDespesaVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
    end
    object QRReceitaDespesaVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QRReceitaDespesaDESC_TIPO: TStringField
      FieldName = 'DESC_TIPO'
      Size = 26
    end
    object QRReceitaDespesaIND_TIPO_PRODUTO: TStringField
      FieldName = 'IND_TIPO_PRODUTO'
      Size = 10
    end
  end
end
