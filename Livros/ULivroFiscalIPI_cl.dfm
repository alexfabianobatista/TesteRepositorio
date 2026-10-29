object DMLivroFiscalIPI: TDMLivroFiscalIPI
  OldCreateOrder = False
  Left = 337
  Top = 359
  Height = 242
  Width = 437
  object DSLivroFiscalIPI: TDataSource
    DataSet = QLivroFiscalIPI
    Left = 48
    Top = 8
  end
  object QLivroFiscalIPI: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_LIVRO_FISCAL_IPI.*'
      'FROM'
      '  TB_LIVRO_FISCAL_IPI'
      'WHERE'
      '  TB_LIVRO_FISCAL_IPI.COD_FILIAL = :FILIAL'
      '  AND'
      '  TB_LIVRO_FISCAL_IPI.NUM_ANO = :ANO'
      '  AND'
      '  TB_LIVRO_FISCAL_IPI.NUM_MES = :MES'
      '  AND'
      '  TB_LIVRO_FISCAL_IPI.NUM_DECENDIO = :DECENDIO')
    Variables.Data = {
      0300000004000000070000003A46494C49414C03000000000000000000000004
      0000003A414E4F030000000000000000000000040000003A4D45530300000000
      00000000000000090000003A444543454E44494F030000000000000000000000}
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      0400000007000000070000004E554D5F414E4F010000000000070000004E554D
      5F4D45530100000000000A000000434F445F46494C49414C0100000000000A00
      000056414C5F43525F49434D0100000000000A00000056414C5F44425F49434D
      0100000000001000000056414C5F53414C444F5F435245444F52010000000000
      0C0000004E554D5F444543454E44494F010000000000}
    Session = DMOracle.DBCemapa
    AfterOpen = QLivroFiscalIPIAfterOpen
    AfterClose = QLivroFiscalIPIAfterClose
    BeforePost = QLivroFiscalIPIBeforePost
    AfterPost = QLivroFiscalIPIAfterPost
    BeforeDelete = QLivroFiscalIPIBeforeDelete
    Left = 48
    Top = 64
    object QLivroFiscalIPINUM_ANO: TIntegerField
      FieldName = 'NUM_ANO'
      Required = True
    end
    object QLivroFiscalIPINUM_MES: TIntegerField
      FieldName = 'NUM_MES'
      Required = True
    end
    object QLivroFiscalIPICOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QLivroFiscalIPIVAL_CR_ICM: TFloatField
      FieldName = 'VAL_CR_ICM'
      Required = True
    end
    object QLivroFiscalIPIVAL_DB_ICM: TFloatField
      FieldName = 'VAL_DB_ICM'
      Required = True
    end
    object QLivroFiscalIPIVAL_SALDO_CREDOR: TFloatField
      FieldName = 'VAL_SALDO_CREDOR'
      Required = True
    end
    object QLivroFiscalIPINUM_DECENDIO: TIntegerField
      FieldName = 'NUM_DECENDIO'
      Required = True
    end
  end
  object QLcto: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_LIVRO_LCTO_IPI.*'
      'FROM'
      '  TB_LIVRO_LCTO_IPI'
      'WHERE'
      '  NUM_ANO = :NUM_ANO'
      '  AND'
      '  NUM_MES = :NUM_MES'
      '  AND'
      '  COD_FILIAL = :COD_FILIAL'
      '  AND'
      '  NUM_DECENDIO = :NUM_DECENDIO')
    Variables.Data = {
      0300000004000000080000003A4E554D5F414E4F030000000000000000000000
      080000003A4E554D5F4D45530300000000000000000000000B0000003A434F44
      5F46494C49414C0300000000000000000000000D0000003A4E554D5F44454345
      4E44494F030000000000000000000000}
    SequenceField.Field = 'COD_LIVRO_LCTO_IPI'
    SequenceField.Sequence = 'SQLIVRO_LCTO_IPI'
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      0400000009000000070000004E554D5F414E4F010000000000070000004E554D
      5F4D45530100000000000A000000434F445F46494C49414C0100000000000C00
      0000434F445F4F5045524143414F0100000000000B00000056414C5F494D504F
      53544F01000000000009000000444553435F4C43544F01000000000010000000
      444553435F434F4D504C454D454E544F01000000000012000000434F445F4C49
      56524F5F4C43544F5F4950490100000000000C0000004E554D5F444543454E44
      494F010000000000}
    Master = QLivroFiscalIPI
    MasterFields = 'NUM_ANO;NUM_MES;COD_FILIAL;NUM_DECENDIO'
    DetailFields = 'NUM_ANO;NUM_MES;COD_FILIAL;NUM_DECENDIO'
    Session = DMOracle.DBCemapa
    AfterOpen = QLctoAfterOpen
    BeforeInsert = QLctoBeforeInsert
    AfterInsert = QLctoAfterInsert
    AfterPost = QLctoAfterPost
    BeforeDelete = QLctoBeforeDelete
    Left = 200
    Top = 64
    object QLctoNUM_ANO: TIntegerField
      FieldName = 'NUM_ANO'
      Required = True
    end
    object QLctoNUM_MES: TIntegerField
      FieldName = 'NUM_MES'
      Required = True
    end
    object QLctoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QLctoCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
      Required = True
    end
    object QLctoVAL_IMPOSTO: TFloatField
      FieldName = 'VAL_IMPOSTO'
      Required = True
    end
    object QLctoDESC_LCTO: TStringField
      FieldName = 'DESC_LCTO'
      Required = True
      Size = 60
    end
    object QLctoDESC_COMPLEMENTO: TStringField
      FieldName = 'DESC_COMPLEMENTO'
      Size = 60
    end
    object QLctoCOD_LIVRO_LCTO_IPI: TIntegerField
      FieldName = 'COD_LIVRO_LCTO_IPI'
      Required = True
    end
    object QLctoNUM_DECENDIO: TIntegerField
      FieldName = 'NUM_DECENDIO'
      Required = True
    end
  end
  object DSLcto: TDataSource
    DataSet = QLcto
    Left = 128
    Top = 8
  end
  object QRLivroFiscalIPI: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  COD_TITULO,'
      '  DESC_TITULO,'
      '  COD_OPERACAO,'
      '  SUM(VAL_IMPOSTO - VAL_IMPOSTO_NEG) AS VAL_LANCAMENTO,'
      '  DESC_OBS'
      'FROM'
      '('
      '  SELECT'
      '      1 as COD_TITULO,'
      '      '#39'CR'#201'DITO DO IMPOSTO'#39' as DESC_TITULO,'
      '      L.COD_OPERACAO,'
      '      L.VAL_IMPOSTO,'
      '      L.DESC_LCTO || '#39' '#39' || L.DESC_COMPLEMENTO AS DESC_OBS,'
      '      0 AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      TB_LIVRO_LCTO_IPI L'
      '  WHERE'
      '      (L.COD_OPERACAO BETWEEN 1 AND 7)'
      '      AND'
      '      L.COD_FILIAL = :FILIAL'
      '      AND'
      '      L.NUM_MES = :MES'
      '      AND'
      '      L.NUM_ANO = :ANO'
      '      AND'
      '      L.NUM_DECENDIO = :DECENDIO'
      ''
      ' UNION ALL'
      ''
      
        '/*   SELECT   esta sql '#233' somente para aparece esta linha no rela' +
        'torio se nao tiver movimento'
      '      1 as COD_TITULO,'
      '      '#39'CR'#201'DITO DO IMPOSTO'#39' as DESC_TITULO,'
      '      1 AS COD_OPERACAO,'
      '      0 VAL_IMPOSTO,'
      '      '#39#39' AS DESC_OBS,'
      '      0 AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      DUAL'
      ''
      '  UNION ALL'
      ''
      
        '  SELECT   esta sql '#233' somente para aparece esta linha no relator' +
        'io se nao tiver movimento'
      '      1 as COD_TITULO,'
      '      '#39'CR'#201'DITO DO IMPOSTO'#39' as DESC_TITULO,'
      '      2 AS COD_OPERACAO,'
      '      0 VAL_IMPOSTO,'
      '      '#39#39' AS DESC_OBS,'
      '      0 AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      DUAL'
      ''
      '  UNION ALL'
      ''
      
        '  SELECT  esta sql '#233' somente para aparece esta linha no relatori' +
        'o se nao tiver movimento'
      '      1 as COD_TITULO,'
      '      '#39'CR'#201'DITO DO IMPOSTO'#39' as DESC_TITULO,'
      '      3 AS COD_OPERACAO,'
      '      0 VAL_IMPOSTO,'
      '      '#39#39' AS DESC_OBS,'
      '      0 AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      DUAL'
      ''
      '  UNION ALL'
      ''
      
        '  SELECT   esta sql '#233' somente para aparece esta linha no relator' +
        'io se nao tiver movimento'
      '      1 as COD_TITULO,'
      '      '#39'CR'#201'DITO DO IMPOSTO'#39' as DESC_TITULO,'
      '      4 AS COD_OPERACAO,'
      '      0 VAL_IMPOSTO,'
      '      '#39#39' AS DESC_OBS,'
      '      0 AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      DUAL'
      ''
      '  UNION ALL'
      ''
      
        '  SELECT   esta sql '#233' somente para aparece esta linha no relator' +
        'io se nao tiver movimento'
      '      1 as COD_TITULO,'
      '      '#39'CR'#201'DITO DO IMPOSTO'#39' as DESC_TITULO,'
      '      5 AS COD_OPERACAO,'
      '      0 VAL_IMPOSTO,'
      '      '#39#39' AS DESC_OBS,'
      '      0 AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      DUAL'
      ''
      '  UNION ALL'
      ''
      
        '  SELECT   esta sql '#233' somente para aparece esta linha no relator' +
        'io se nao tiver movimento'
      '      1 as COD_TITULO,'
      '      '#39'CR'#201'DITO DO IMPOSTO'#39' as DESC_TITULO,'
      '      7 AS COD_OPERACAO,'
      '      0 VAL_IMPOSTO,'
      '      '#39#39' AS DESC_OBS,'
      '      0 AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      DUAL'
      ''
      '  UNION ALL'
      ''
      
        '  SELECT   esta sql '#233' somente para aparece esta linha no relator' +
        'io se nao tiver movimento'
      '      2 as COD_TITULO,'
      '      '#39'D'#201'BITO DO IMPOSTO'#39' as DESC_TITULO,'
      '      9 AS COD_OPERACAO,'
      '      0 VAL_IMPOSTO,'
      '      '#39#39' AS DESC_OBS,'
      '      0 AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      DUAL'
      ''
      '  UNION ALL'
      ''
      
        '  SELECT   esta sql '#233' somente para aparece esta linha no relator' +
        'io se nao tiver movimento'
      '      2 as COD_TITULO,'
      '      '#39'D'#201'BITO DO IMPOSTO'#39' as DESC_TITULO,'
      '      10 AS COD_OPERACAO,'
      '      0 VAL_IMPOSTO,'
      '      '#39#39' AS DESC_OBS,'
      '      0 AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      DUAL'
      ''
      '  UNION ALL'
      ''
      
        '  SELECT   esta sql '#233' somente para aparece esta linha no relator' +
        'io se nao tiver movimento'
      '      2 as COD_TITULO,'
      '      '#39'D'#201'BITO DO IMPOSTO'#39' as DESC_TITULO,'
      '      11 AS COD_OPERACAO,'
      '      0 VAL_IMPOSTO,'
      '      '#39#39' AS DESC_OBS,'
      '      0 AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      DUAL'
      ''
      '  UNION ALL'
      ''
      
        '  SELECT   esta sql '#233' somente para aparece esta linha no relator' +
        'io se nao tiver movimento'
      '      2 as COD_TITULO,'
      '      '#39'D'#201'BITO DO IMPOSTO'#39' as DESC_TITULO,'
      '      12 AS COD_OPERACAO,'
      '      0 VAL_IMPOSTO,'
      '      '#39#39' AS DESC_OBS,'
      '      0 AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      DUAL'
      ''
      '  UNION ALL'
      '*/'
      '  SELECT'
      '      2,'
      '      '#39'D'#201'BITO DO IMPOSTO'#39','
      '      L.COD_OPERACAO,'
      '      L.VAL_IMPOSTO,'
      '      L.DESC_LCTO || '#39' '#39' || L.DESC_COMPLEMENTO AS DESC_OBS,'
      '      0 AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      TB_LIVRO_LCTO_IPI L'
      '  WHERE'
      '      (L.COD_OPERACAO BETWEEN 9 AND 12)'
      '      AND'
      '      L.COD_FILIAL = :FILIAL'
      '      AND'
      '      L.NUM_MES = :MES'
      '      AND'
      '      L.NUM_ANO = :ANO'
      '      AND'
      '      L.NUM_DECENDIO = :DECENDIO'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '      1,'
      '      '#39'CR'#201'DITO DO IMPOSTO'#39','
      '      6,'
      '      SUM(L.VAL_IMPOSTO),'
      '      '#39#39' AS DESC_OBS,'
      '      0 AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      TB_LIVRO_LCTO_IPI L'
      '  WHERE'
      '      (L.COD_OPERACAO BETWEEN 1 AND 5)'
      '      AND'
      '      L.COD_FILIAL = :FILIAL'
      '      AND'
      '      L.NUM_MES = :MES'
      '      AND'
      '      L.NUM_ANO = :ANO'
      '      AND'
      '      L.NUM_DECENDIO = :DECENDIO'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '      1,'
      '      '#39'CR'#201'DITO DO IMPOSTO'#39','
      '      8,'
      '      SUM(L.VAL_IMPOSTO),'
      '      '#39#39' DESC_OBS,'
      '      0 AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      TB_LIVRO_LCTO_IPI L'
      '  WHERE'
      '      (L.COD_OPERACAO BETWEEN 1 AND 7)'
      '      AND'
      '      L.COD_FILIAL = :FILIAL'
      '      AND'
      '      L.NUM_MES = :MES'
      '      AND'
      '      L.NUM_ANO = :ANO'
      '      AND'
      '      L.NUM_DECENDIO = :DECENDIO'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '      2,'
      '      '#39'D'#201'BITO DO IMPOSTO'#39','
      '      13,'
      '      SUM(L.VAL_IMPOSTO),'
      '      '#39#39' AS DESC_OBS,'
      '      0 AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      TB_LIVRO_LCTO_IPI L'
      '  WHERE'
      '      (L.COD_OPERACAO BETWEEN 9 AND 12)'
      '      AND'
      '      L.COD_FILIAL = :FILIAL'
      '      AND'
      '      L.NUM_MES = :MES'
      '      AND'
      '      L.NUM_ANO = :ANO'
      '      AND'
      '      L.NUM_DECENDIO = :DECENDIO'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '      3,'
      '      '#39'APURA'#199#195'O DO SALDO'#39','
      '      14,'
      '      SUM(L.VAL_IMPOSTO),'
      '      '#39#39' AS DESC_OBS,'
      '      0 AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      TB_LIVRO_LCTO_IPI L'
      '  WHERE'
      '      (L.COD_OPERACAO BETWEEN 9 AND 12)'
      '      AND'
      '      L.COD_FILIAL = :FILIAL'
      '      AND'
      '      L.NUM_MES = :MES'
      '      AND'
      '      L.NUM_ANO = :ANO'
      '      AND'
      '      L.NUM_DECENDIO = :DECENDIO'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '      3,'
      '      '#39'APURA'#199#195'O DO SALDO'#39','
      '      15,'
      '      SUM(L.VAL_IMPOSTO),'
      '      '#39#39' AS DESC_OBS,'
      '      0 AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      TB_LIVRO_LCTO_IPI L'
      '  WHERE'
      '      (L.COD_OPERACAO BETWEEN 1 AND 7)'
      '      AND'
      '      L.COD_FILIAL = :FILIAL'
      '      AND'
      '      L.NUM_MES = :MES'
      '      AND'
      '      L.NUM_ANO = :ANO'
      '      AND'
      '      L.NUM_DECENDIO = :DECENDIO'
      ''
      'UNION ALL'
      ''
      '  SELECT'
      '      3,'
      '      '#39'APURA'#199#195'O DO SALDO'#39','
      '      16,'
      '      0 AS VAL_IMPOSTO,'
      '      '#39#39' AS DESC_OBS,'
      '      SUM(L.VAL_IMPOSTO) AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      TB_LIVRO_LCTO_IPI L'
      '  WHERE'
      '      (L.COD_OPERACAO BETWEEN 1 AND 7)'
      '      AND'
      '      L.COD_FILIAL = :FILIAL'
      '      AND'
      '      L.NUM_MES = :MES'
      '      AND'
      '      L.NUM_ANO = :ANO'
      '      AND'
      '      L.NUM_DECENDIO = :DECENDIO'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '      3,'
      '      '#39'APURA'#199#195'O DO SALDO'#39','
      '      16,'
      '      SUM(L.VAL_IMPOSTO) AS VAL_IMPOSTO,'
      '      '#39#39' AS DESC_OBS,'
      '      0 AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      TB_LIVRO_LCTO_IPI L'
      '  WHERE'
      '      (L.COD_OPERACAO BETWEEN 9 AND 12)'
      '      AND'
      '      L.COD_FILIAL = :FILIAL'
      '      AND'
      '      L.NUM_MES = :MES'
      '      AND'
      '      L.NUM_ANO = :ANO'
      '      AND'
      '      L.NUM_DECENDIO = :DECENDIO'
      ''
      'UNION ALL'
      ''
      '  SELECT'
      '      3,'
      '      '#39'APURA'#199#195'O DO SALDO'#39','
      '      17,'
      '      SUM(L.VAL_IMPOSTO) AS VAL_IMPOSTO,'
      '      '#39#39' AS DESC_OBS,'
      '      0 ASVAL_IMPOSTO_NEG'
      '  FROM'
      '      TB_LIVRO_LCTO_IPI L'
      '  WHERE'
      '      (L.COD_OPERACAO BETWEEN 1 AND 7)'
      '      AND'
      '      L.COD_FILIAL = :FILIAL'
      '      AND'
      '      L.NUM_MES = :MES'
      '      AND'
      '      L.NUM_ANO = :ANO'
      '      AND'
      '      L.NUM_DECENDIO = :DECENDIO'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '      3,'
      '      '#39'APURA'#199#195'O DO SALDO'#39','
      '      17,'
      '      0 AS VAL_IMPOSTO,'
      '      '#39#39' AS DESC_OBS,'
      '      SUM(L.VAL_IMPOSTO) AS VAL_IMPOSTO_NEG'
      '  FROM'
      '      TB_LIVRO_LCTO_IPI L'
      '  WHERE'
      '      (L.COD_OPERACAO BETWEEN 9 AND 12)'
      '      AND'
      '      L.COD_FILIAL = :FILIAL'
      '      AND'
      '      L.NUM_MES = :MES'
      '      AND'
      '      L.NUM_ANO = :ANO'
      '      AND'
      '      L.NUM_DECENDIO = :DECENDIO'
      ')'
      'GROUP BY'
      '  COD_TITULO,'
      '  DESC_TITULO,'
      '  COD_OPERACAO,'
      '  DESC_OBS'
      'ORDER BY'
      '  COD_TITULO,'
      '  DESC_TITULO,'
      '  COD_OPERACAO')
    Variables.Data = {
      0300000004000000070000003A46494C49414C03000000000000000000000004
      0000003A4D4553030000000000000000000000040000003A414E4F0300000000
      00000000000000090000003A444543454E44494F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000C000000434F445F4F5045524143414F0100000000000B00
      0000444553435F544954554C4F0100000000000A000000434F445F544954554C
      4F0100000000000E00000056414C5F4C414E43414D454E544F01000000000008
      000000444553435F4F4253010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRLivroFiscalIPICalcFields
    Left = 200
    Top = 8
    object QRLivroFiscalIPICOD_TITULO: TFloatField
      FieldName = 'COD_TITULO'
    end
    object QRLivroFiscalIPIDESC_TITULO: TStringField
      FieldName = 'DESC_TITULO'
      Size = 18
    end
    object QRLivroFiscalIPICOD_OPERACAO: TFloatField
      FieldName = 'COD_OPERACAO'
    end
    object QRLivroFiscalIPIVAL_LANCAMENTO: TFloatField
      FieldName = 'VAL_LANCAMENTO'
    end
    object QRLivroFiscalIPIdesc_operacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_operacao'
      Size = 100
      Calculated = True
    end
    object QRLivroFiscalIPIval_relatorio: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_relatorio'
      Calculated = True
    end
    object QRLivroFiscalIPIDESC_OBS: TStringField
      FieldName = 'DESC_OBS'
      Size = 121
    end
  end
  object QLivroFiscalIPICons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_LIVRO_FISCAL_IPI.NUM_ANO,'
      '  TB_LIVRO_FISCAL_IPI.NUM_MES,'
      '  TB_LIVRO_FISCAL_IPI.NUM_DECENDIO,'
      '  TB_LIVRO_FISCAL_IPI.COD_FILIAL,'
      '  TB_LIVRO_FISCAL_IPI.VAL_CR_ICM,'
      '  TB_LIVRO_FISCAL_IPI.VAL_DB_ICM'
      'FROM'
      '  TB_LIVRO_FISCAL_IPI'
      'WHERE'
      '  (:DECENDIO IS NULL OR'
      '    TB_LIVRO_FISCAL_IPI.NUM_DECENDIO = :DECENDIO)'
      '  AND'
      '  (:FILIAL IS NULL OR'
      '  TB_LIVRO_FISCAL_IPI.COD_FILIAL = :FILIAL)'
      '  AND'
      '  (:ANO IS NULL OR'
      '  TB_LIVRO_FISCAL_IPI.NUM_ANO = :ANO)'
      '  AND'
      '  (:MES IS NULL OR'
      '  TB_LIVRO_FISCAL_IPI.NUM_MES = :MES)'
      'ORDER BY'
      '  TB_LIVRO_FISCAL_IPI.COD_FILIAL,'
      '  TB_LIVRO_FISCAL_IPI.NUM_ANO,'
      '  TB_LIVRO_FISCAL_IPI.NUM_MES,'
      '  TB_LIVRO_FISCAL_IPI.NUM_DECENDIO')
    Variables.Data = {
      0300000004000000070000003A46494C49414C03000000000000000000000004
      0000003A414E4F030000000000000000000000040000003A4D45530300000000
      00000000000000090000003A444543454E44494F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000070000004E554D5F414E4F010000000000070000004E554D
      5F4D45530100000000000A000000434F445F46494C49414C0100000000000A00
      000056414C5F43525F49434D0100000000000A00000056414C5F44425F49434D
      0100000000000C0000004E554D5F444543454E44494F010000000000}
    Session = DMOracle.DBCemapa
    Left = 296
    Top = 8
    object QLivroFiscalIPIConsNUM_ANO: TIntegerField
      FieldName = 'NUM_ANO'
      Required = True
    end
    object QLivroFiscalIPIConsNUM_MES: TIntegerField
      FieldName = 'NUM_MES'
      Required = True
    end
    object QLivroFiscalIPIConsCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QLivroFiscalIPIConsVAL_CR_ICM: TFloatField
      FieldName = 'VAL_CR_ICM'
      Required = True
    end
    object QLivroFiscalIPIConsVAL_DB_ICM: TFloatField
      FieldName = 'VAL_DB_ICM'
      Required = True
    end
    object QLivroFiscalIPIConsNUM_DECENDIO: TIntegerField
      FieldName = 'NUM_DECENDIO'
      Required = True
    end
  end
  object QRLivroFiscalIPIDeb: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      #9'CODIGO,'
      #9'NVL(VALOR,0) AS VALOR,'
      '  :MES AS MES,'
      '  :ANO AS ANO'
      'FROM'
      '('
      '  SELECT'
      '    '#39'SAIDA_DEBITO'#39' AS CODIGO,'
      '    SUM(NVL(IT.VAL_IPI, 0)) AS VALOR'
      '  FROM'
      '    TB_NOTA_ITEM IT'
      '  INNER JOIN'
      '    TB_NOTA_CAB N'
      '  ON'
      '    IT.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '  AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '  AND'
      '    (:FILIAL IS NULL OR N.COD_FILIAL = :FILIAL)'
      '  AND'
      '    EXTRACT(MONTH FROM N.DT_EMISSAO) = :MES'
      '  AND'
      '    EXTRACT(YEAR FROM N.DT_EMISSAO) = :ANO'
      '  AND'
      '    EXTRACT(DAY FROM N.DT_EMISSAO) BETWEEN '
      '      DECODE(:DECENDIO,'#39'3'#39',21,DECODE(:DECENDIO,'#39'2'#39',11,1))'
      '    AND'
      '      DECODE(:DECENDIO,'#39'1'#39',10,DECODE(:DECENDIO,'#39'2'#39',20,31))'
      #9#9
      '  UNION'
      #9#9
      '  SELECT'
      '    TO_CHAR(COD_OPERACAO) AS CODIGO,'
      '    SUM(NVL(VAL_IMPOSTO,0)) AS VALOR'
      '  FROM'
      '    TB_LIVRO_LCTO_IPI'
      '  WHERE'
      '    (:FILIAL IS NULL OR COD_FILIAL = :FILIAL)'
      '  AND'
      '    NUM_MES = :MES'
      '  AND'
      '    NUM_ANO = :ANO'
      '  AND'
      '    NUM_DECENDIO = :DECENDIO'
      '  AND'
      '    COD_OPERACAO BETWEEN 9 AND 12'
      '  GROUP BY'
      '    COD_OPERACAO'
      ')'
      '')
    Variables.Data = {
      0300000004000000070000003A46494C49414C03000000000000000000000004
      0000003A4D4553030000000000000000000000040000003A414E4F0300000000
      00000000000000090000003A444543454E44494F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000006000000434F4449474F0100000000000500000056414C4F
      52010000000000030000004D455301000000000003000000414E4F0100000000
      00}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRLivroFiscalIPIDebCalcFields
    Left = 48
    Top = 112
    object QRLivroFiscalIPIDebCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 40
    end
    object QRLivroFiscalIPIDebVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object QRLivroFiscalIPIDebMES: TFloatField
      FieldName = 'MES'
    end
    object QRLivroFiscalIPIDebANO: TFloatField
      FieldName = 'ANO'
    end
    object QRLivroFiscalIPIDebdescricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'descricao'
      Size = 50
      Calculated = True
    end
  end
  object QRLivroFiscalIPICred: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      #9'CODIGO,'
      #9'NVL(VALOR,0) AS VALOR,'
      '  :MES AS MES,'
      '  :ANO AS ANO'
      'FROM'
      '('
      '  SELECT'
      '    '#39'MES_ANTERIOR'#39' AS CODIGO,'
      '    VAL_SALDO_CREDOR AS VALOR'
      '  FROM'
      '    TB_LIVRO_FISCAL_IPI'
      '  WHERE'
      '    (:FILIAL IS NULL OR COD_FILIAL = :FILIAL)'
      '  AND'
      '    NUM_MES = MES_ANTERIOR(:MES, :ANO, '#39'MES'#39')'
      '  AND'
      '    NUM_ANO = MES_ANTERIOR(:MES, :ANO, '#39'ANO'#39')'
      '  AND'
      '    NUM_DECENDIO = :DECENDIO'
      ''
      '  UNION'
      ''
      '  SELECT'
      '    '#39'ENTRADA_CREDITO'#39' AS CODIGO,'
      '    SUM(NVL(IT.VAL_IPI, 0)) AS VALOR'
      '  FROM'
      '    TB_NOTA_ITEM IT'
      '  INNER JOIN'
      '    TB_NOTA_CAB N'
      '  ON'
      '    IT.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '  AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '  AND'
      '    IT.COD_CST_IPI <> '#39'03'#39
      '  AND'
      '    (:FILIAL IS NULL OR N.COD_FILIAL = :FILIAL)'
      '  AND'
      '    EXTRACT(MONTH FROM N.DT_RECEBIMENTO) = :MES'
      '  AND'
      '    EXTRACT(YEAR FROM N.DT_RECEBIMENTO) = :ANO'
      '  AND'
      '    EXTRACT(DAY FROM N.DT_RECEBIMENTO) BETWEEN'
      '      DECODE(:DECENDIO,'#39'3'#39',21,DECODE(:DECENDIO,'#39'2'#39',11,1))'
      '    AND'
      '      DECODE(:DECENDIO,'#39'1'#39',10,DECODE(:DECENDIO,'#39'2'#39',20,31))'
      #9#9
      '  UNION'
      #9#9
      '  SELECT'
      '    TO_CHAR(COD_OPERACAO) AS CODIGO,'
      '    SUM(NVL(VAL_IMPOSTO,0)) AS VALOR'
      '  FROM'
      '    TB_LIVRO_LCTO_IPI'
      '  WHERE'
      '    (:FILIAL IS NULL OR COD_FILIAL = :FILIAL)'
      '  AND'
      '    NUM_MES = :MES'
      '  AND'
      '    NUM_ANO = :ANO'
      '  AND'
      '    NUM_DECENDIO = :DECENDIO'
      '  AND'
      '    COD_OPERACAO BETWEEN 1 AND 7'
      '  GROUP BY'
      '    COD_OPERACAO'
      ')'
      '')
    Variables.Data = {
      0300000004000000070000003A46494C49414C03000000000000000000000004
      0000003A4D4553030000000000000000000000040000003A414E4F0300000000
      00000000000000090000003A444543454E44494F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000006000000434F4449474F0100000000000500000056414C4F
      52010000000000030000004D455301000000000003000000414E4F0100000000
      00}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRLivroFiscalIPIDebCalcFields
    Left = 200
    Top = 112
    object QRLivroFiscalIPICredCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 40
    end
    object QRLivroFiscalIPICredVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object QRLivroFiscalIPICredMES: TFloatField
      FieldName = 'MES'
    end
    object QRLivroFiscalIPICredANO: TFloatField
      FieldName = 'ANO'
    end
    object QRLivroFiscalIPICreddescricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'descricao'
      Size = 50
      Calculated = True
    end
  end
  object QLctoItem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      #9'ROWID,'
      #9'TB_LIVRO_LCTO_IPI_ITEM.*'
      'FROM'
      #9'TB_LIVRO_LCTO_IPI_ITEM'
      ''
      'where cod_livro_lcto_ipi = :cod_livro_lcto_ipi')
    Variables.Data = {
      0300000001000000130000003A434F445F4C4956524F5F4C43544F5F49504903
      0000000000000000000000}
    SequenceField.Field = 'COD_LIVRO_LCTO_IPI_ITEM'
    SequenceField.Sequence = 'SQLIVRO_LCTO_IPI_ITEM'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000400000017000000434F445F4C4956524F5F4C43544F5F4950495F49
      54454D01000000000012000000434F445F4C4956524F5F4C43544F5F49504901
      00000000000D000000434F445F4E4F54415F4954454D0100000000000A000000
      56414C5F414A55535445010000000000}
    Master = QLcto
    MasterFields = 'COD_LIVRO_LCTO_IPI'
    DetailFields = 'COD_LIVRO_LCTO_IPI'
    Session = DMOracle.DBCemapa
    BeforeInsert = QLctoItemBeforeInsert
    BeforePost = QLctoItemBeforePost
    OnCalcFields = QLctoItemCalcFields
    Left = 272
    Top = 64
    object QLctoItemCOD_LIVRO_LCTO_IPI_ITEM: TIntegerField
      FieldName = 'COD_LIVRO_LCTO_IPI_ITEM'
      Required = True
    end
    object QLctoItemCOD_LIVRO_LCTO_IPI: TIntegerField
      FieldName = 'COD_LIVRO_LCTO_IPI'
    end
    object QLctoItemCOD_NOTA_ITEM: TIntegerField
      FieldName = 'COD_NOTA_ITEM'
    end
    object QLctoItemVAL_AJUSTE: TFloatField
      FieldName = 'VAL_AJUSTE'
      Required = True
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object QLctoItemnum_nota: TIntegerField
      DisplayLabel = 'Nota'
      FieldKind = fkCalculated
      FieldName = 'num_nota'
      Calculated = True
    end
    object QLctoItemcod_serie: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldKind = fkCalculated
      FieldName = 'cod_serie'
      Calculated = True
    end
    object QLctoItemcod_serie_modelo: TStringField
      DisplayLabel = 'Modelo'
      FieldKind = fkCalculated
      FieldName = 'cod_serie_modelo'
      Calculated = True
    end
    object QLctoItemcod_produto: TIntegerField
      DisplayLabel = 'Produto'
      FieldKind = fkCalculated
      FieldName = 'cod_produto'
      Calculated = True
    end
    object QLctoItemdesc_produto: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkCalculated
      FieldName = 'desc_produto'
      Calculated = True
    end
  end
end
