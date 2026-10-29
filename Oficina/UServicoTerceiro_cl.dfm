object DMServicoTerceiro: TDMServicoTerceiro
  OldCreateOrder = False
  Left = 564
  Top = 83
  Height = 201
  Width = 323
  object QServicoTerceiroCad: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_SERVICO_TERCEIRO.*'
      'FROM'
      '  TB_SERVICO_TERCEIRO'
      'WHERE'
      '  TB_SERVICO_TERCEIRO.COD_SERVICO_TERCEIRO =:PK    ')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_SERVICO_TERCEIRO'
    SequenceField.Sequence = 'SQSERVICO_TERCEIRO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000B000000434F445F5345525649434F010000000000140000
      00434F445F5345525649434F5F544552434549524F010000000000060000004E
      554D5F4F530100000000000C000000434F445F56454E4445444F520100000000
      000B00000056414C5F5345525649434F0100000000000C000000434F445F4341
      44415354524F0100000000000A00000044545F5345525649434F010000000000
      080000004E554D5F4E4F54410100000000000C000000444553435F5345525649
      434F0100000000000C000000434F445F4E4F54415F434142010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    AfterOpen = QServicoTerceiroCadAfterOpen
    BeforeClose = QServicoTerceiroCadBeforeClose
    AfterInsert = QServicoTerceiroCadAfterInsert
    BeforePost = QServicoTerceiroCadBeforePost
    BeforeCancel = QServicoTerceiroCadBeforeCancel
    OnCalcFields = QServicoTerceiroCadCalcFields
    Left = 56
    Top = 3
    object QServicoTerceiroCadCOD_SERVICO_TERCEIRO: TIntegerField
      FieldName = 'COD_SERVICO_TERCEIRO'
      Required = True
    end
    object QServicoTerceiroCadNUM_OS: TIntegerField
      FieldName = 'NUM_OS'
      Required = True
    end
    object QServicoTerceiroCadCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
    end
    object QServicoTerceiroCadCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object QServicoTerceiroCadVAL_SERVICO: TFloatField
      FieldName = 'VAL_SERVICO'
      Required = True
      DisplayFormat = '##,###.#0'
    end
    object QServicoTerceiroCadCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QServicoTerceiroCadDT_SERVICO: TDateTimeField
      FieldName = 'DT_SERVICO'
    end
    object QServicoTerceiroCadNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
    end
    object QServicoTerceiroCadCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QServicoTerceiroCadnome_cadastro: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome_cadastro'
      Size = 50
      Calculated = True
    end
    object QServicoTerceiroCadnome_vendedor: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome_vendedor'
      Size = 50
      Calculated = True
    end
    object QServicoTerceiroCaddesc_produto_servico: TStringField
      DisplayWidth = 58
      FieldKind = fkCalculated
      FieldName = 'desc_produto_servico'
      Size = 58
      Calculated = True
    end
    object QServicoTerceiroCadnome_cliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome_cliente'
      Size = 50
      Calculated = True
    end
    object QServicoTerceiroCadDESC_SERVICO: TStringField
      FieldName = 'DESC_SERVICO'
      Size = 500
    end
  end
  object QServicoTerceiroCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_SERVICO_TERCEIRO.*,'
      '  TB_PRODUTO.DESC_PRODUTO'
      'FROM'
      '  TB_SERVICO_TERCEIRO,'
      '  TB_CADASTRO,'
      '  TB_PRODUTO,'
      '  TB_VENDEDOR'
      'WHERE'
      '  (TB_VENDEDOR.COD_VENDEDOR = TB_SERVICO_TERCEIRO.COD_VENDEDOR)'
      '  AND'
      '  (TB_PRODUTO.COD_PRODUTO(+) = TB_SERVICO_TERCEIRO.COD_SERVICO)'
      '  AND'
      '  (TB_CADASTRO.COD_CADASTRO = TB_SERVICO_TERCEIRO.COD_CADASTRO)'
      '  AND'
      '  (:NUM_OS IS NULL'
      '  OR'
      '  TB_SERVICO_TERCEIRO.NUM_OS =:NUM_OS)'
      '  AND'
      '  (:COD_VENDEDOR IS NULL'
      '  OR'
      '  TB_SERVICO_TERCEIRO.COD_VENDEDOR =:COD_VENDEDOR)'
      '  AND'
      '  (:COD_SERVICO IS NULL'
      '  OR'
      '  TB_SERVICO_TERCEIRO.COD_SERVICO = :COD_SERVICO)'
      '  AND'
      '  (:DT_SERVICO IS NULL'
      '  OR'
      '  TB_SERVICO_TERCEIRO.DT_SERVICO = :DT_SERVICO)'
      '  AND'
      '  (:COD_CADASTRO IS NULL'
      '  OR'
      '  TB_SERVICO_TERCEIRO.COD_CADASTRO = :COD_CADASTRO)'
      'ORDER BY'
      '  TB_SERVICO_TERCEIRO.NUM_OS,'
      '  TB_SERVICO_TERCEIRO.COD_SERVICO')
    Variables.Data = {
      0300000005000000070000003A4E554D5F4F530300000000000000000000000D
      0000003A434F445F56454E4445444F520300000000000000000000000C000000
      3A434F445F5345525649434F0300000000000000000000000B0000003A44545F
      5345525649434F0C00000000000000000000000D0000003A434F445F43414441
      5354524F030000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000B0000000B000000434F445F5345525649434F010000000000140000
      00434F445F5345525649434F5F544552434549524F010000000000060000004E
      554D5F4F530100000000000C000000434F445F56454E4445444F520100000000
      000B00000056414C5F5345525649434F0100000000000C000000434F445F4341
      44415354524F0100000000000A00000044545F5345525649434F010000000000
      0C000000444553435F50524F4455544F010000000000080000004E554D5F4E4F
      54410100000000000C000000444553435F5345525649434F0100000000000C00
      0000434F445F4E4F54415F434142010000000000}
    Session = DMOracle.DBCemapa
    Left = 56
    Top = 51
    object QServicoTerceiroConsCOD_SERVICO_TERCEIRO: TIntegerField
      FieldName = 'COD_SERVICO_TERCEIRO'
      Required = True
    end
    object QServicoTerceiroConsNUM_OS: TIntegerField
      FieldName = 'NUM_OS'
      Required = True
    end
    object QServicoTerceiroConsCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object QServicoTerceiroConsCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object QServicoTerceiroConsVAL_SERVICO: TFloatField
      FieldName = 'VAL_SERVICO'
      Required = True
    end
    object QServicoTerceiroConsCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QServicoTerceiroConsDT_SERVICO: TDateTimeField
      FieldName = 'DT_SERVICO'
    end
    object QServicoTerceiroConsNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
    end
    object QServicoTerceiroConsDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QServicoTerceiroConsDESC_SERVICO: TStringField
      FieldName = 'DESC_SERVICO'
      Size = 500
    end
  end
  object QServicoTerceiroItem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_SERVICO_TERCEIRO_ITEM.*'
      'FROM'
      '  TB_SERVICO_TERCEIRO_ITEM'
      'WHERE'
      
        '  TB_SERVICO_TERCEIRO_ITEM.COD_SERVICO_TERCEIRO = :COD_SERVICO_T' +
        'ERCEIRO')
    Variables.Data = {
      0300000001000000150000003A434F445F5345525649434F5F54455243454952
      4F030000000000000000000000}
    SequenceField.Field = 'COD_SERVICO_TERCEIRO_ITEM'
    SequenceField.Sequence = 'SQ_SERVICO_TERCEIRO_ITEM'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000700000014000000434F445F5345525649434F5F544552434549524F
      01000000000019000000434F445F5345525649434F5F544552434549524F5F49
      54454D0100000000000B000000434F445F50524F4455544F0100000000000D00
      000051545F5155414E5449444144450100000000000C00000056414C5F554E49
      544152494F0100000000001A000000444553435F5345525649434F5F54455243
      4549524F5F4954454D0100000000000D000000434F445F4E4F54415F4954454D
      010000000000}
    Master = QServicoTerceiroCad
    MasterFields = 'COD_SERVICO_TERCEIRO'
    DetailFields = 'COD_SERVICO_TERCEIRO'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeInsert = QServicoTerceiroItemBeforeInsert
    AfterInsert = QServicoTerceiroItemAfterInsert
    BeforeEdit = QServicoTerceiroItemBeforeEdit
    BeforePost = QServicoTerceiroItemBeforePost
    AfterPost = QServicoTerceiroItemAfterPost
    OnCalcFields = QServicoTerceiroItemCalcFields
    Left = 216
    Top = 3
    object QServicoTerceiroItemCOD_SERVICO_TERCEIRO_ITEM: TIntegerField
      FieldName = 'COD_SERVICO_TERCEIRO_ITEM'
      Required = True
    end
    object QServicoTerceiroItemCOD_SERVICO_TERCEIRO: TIntegerField
      FieldName = 'COD_SERVICO_TERCEIRO'
      Required = True
    end
    object QServicoTerceiroItemCOD_NOTA_ITEM: TIntegerField
      FieldName = 'COD_NOTA_ITEM'
    end
    object QServicoTerceiroItemCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QServicoTerceiroItemDESC_SERVICO_TERCEIRO_ITEM: TStringField
      FieldName = 'DESC_SERVICO_TERCEIRO_ITEM'
      Size = 50
    end
    object QServicoTerceiroItemQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object QServicoTerceiroItemVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object QServicoTerceiroItemval_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_total'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Calculated = True
    end
  end
end
