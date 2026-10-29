object DMRecebimento: TDMRecebimento
  OldCreateOrder = False
  Left = 523
  Top = 273
  Height = 235
  Width = 426
  object QRecebimentoJornalCad: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_RECEBIMENTO_JORNAL.*'
      'FROM'
      '  TB_RECEBIMENTO_JORNAL'
      'WHERE'
      '  TB_RECEBIMENTO_JORNAL.COD_RECEBIMENTO_JORNAL = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_RECEBIMENTO_JORNAL'
    SequenceField.Sequence = 'SQRECEBIMENTOJORNAL'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000700000016000000434F445F5245434542494D454E544F5F4A4F524E
      414C010000000000070000004E554D5F414E4F0100000000000C000000434F44
      5F434144415354524F0100000000000D00000044545F56454E43494D454E544F
      0100000000000B00000044545F434144415354524F0100000000000900000056
      414C5F544F54414C0100000000000C000000434F445F56454E4445444F520100
      00000000}
    Session = DMOracle.DBCemapa
    AfterInsert = QRecebimentoJornalCadAfterInsert
    BeforePost = QRecebimentoJornalCadBeforePost
    AfterPost = QRecebimentoJornalCadAfterPost
    OnCalcFields = QRecebimentoJornalCadCalcFields
    Left = 56
    Top = 16
    object QRecebimentoJornalCadcidade: TStringField
      FieldKind = fkCalculated
      FieldName = 'cidade'
      Size = 50
      Calculated = True
    end
    object QRecebimentoJornalCadNUM_ANO: TIntegerField
      FieldName = 'NUM_ANO'
      Required = True
    end
    object QRecebimentoJornalCadCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRecebimentoJornalCadDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
      Required = True
    end
    object QRecebimentoJornalCadDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
      Required = True
    end
    object QRecebimentoJornalCadVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
      Required = True
    end
    object QRecebimentoJornalCadCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QRecebimentoJornalCadCOD_RECEBIMENTO_JORNAL: TIntegerField
      FieldName = 'COD_RECEBIMENTO_JORNAL'
      Required = True
    end
  end
  object QRecebimentoJornalItem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_RECEBIMENTO_JORNAL_ITEM.*'
      'FROM '
      '  TB_RECEBIMENTO_JORNAL_ITEM'
      'where cod_recebimento_jornal = :cod_recebimento_jornal'
      'ORDER BY'
      '  TB_RECEBIMENTO_JORNAL_ITEM.NUM_PARCELA')
    Variables.Data = {
      0300000001000000170000003A434F445F5245434542494D454E544F5F4A4F52
      4E414C030000000000000000000000}
    SequenceField.Field = 'COD_RECEBIMENTO_JORNAL_ITEM'
    SequenceField.Sequence = 'SQRECEBIMENTOJORNALITEM'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000050000001B000000434F445F5245434542494D454E544F5F4A4F524E
      414C5F4954454D01000000000016000000434F445F5245434542494D454E544F
      5F4A4F524E414C0100000000000800000056414C5F5041474F0100000000000C
      00000044545F504147414D454E544F0100000000000B0000004E554D5F504152
      43454C41010000000000}
    Master = QRecebimentoJornalCad
    MasterFields = 'COD_RECEBIMENTO_JORNAL'
    DetailFields = 'COD_RECEBIMENTO_JORNAL'
    Session = DMOracle.DBCemapa
    Left = 192
    Top = 24
    object QRecebimentoJornalItemCOD_RECEBIMENTO_JORNAL_ITEM: TIntegerField
      FieldName = 'COD_RECEBIMENTO_JORNAL_ITEM'
      Required = True
    end
    object QRecebimentoJornalItemCOD_RECEBIMENTO_JORNAL: TIntegerField
      FieldName = 'COD_RECEBIMENTO_JORNAL'
      Required = True
    end
    object QRecebimentoJornalItemVAL_PAGO: TFloatField
      FieldName = 'VAL_PAGO'
      DisplayFormat = '#,##0.00'
    end
    object QRecebimentoJornalItemDT_PAGAMENTO: TDateTimeField
      FieldName = 'DT_PAGAMENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object QRecebimentoJornalItemNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
      Required = True
    end
  end
  object DSRecebimentoJornalItem: TDataSource
    DataSet = QRecebimentoJornalItem
    Left = 192
    Top = 72
  end
  object QRecebimentoJornalCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  R.COD_RECEBIMENTO_JORNAL,'
      '  R.NUM_ANO,'
      '  R.DT_VENCIMENTO,'
      '  R.VAL_TOTAL,'
      '  C.NOME'
      ''
      'FROM'
      '  TB_RECEBIMENTO_JORNAL R INNER JOIN TB_CADASTRO C'
      '  ON R.COD_CADASTRO = C.COD_CADASTRO'
      'WHERE'
      '  R.NUM_ANO = :ANO'
      '  AND'
      '  (:CADASTRO IS NULL OR'
      '  R.COD_CADASTRO = :CADASTRO) ')
    Variables.Data = {
      0300000002000000040000003A414E4F03000000000000000000000009000000
      3A434144415354524F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000016000000434F445F5245434542494D454E544F5F4A4F524E
      414C010000000000070000004E554D5F414E4F0100000000000D00000044545F
      56454E43494D454E544F0100000000000900000056414C5F544F54414C010000
      000000040000004E4F4D45010000000000}
    Session = DMOracle.DBCemapa
    Left = 56
    Top = 72
    object QRecebimentoJornalConsNUM_ANO: TIntegerField
      FieldName = 'NUM_ANO'
      Required = True
    end
    object QRecebimentoJornalConsDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
      Required = True
    end
    object QRecebimentoJornalConsVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
      Required = True
    end
    object QRecebimentoJornalConsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QRecebimentoJornalConsCOD_RECEBIMENTO_JORNAL: TIntegerField
      FieldName = 'COD_RECEBIMENTO_JORNAL'
      Required = True
    end
  end
end
