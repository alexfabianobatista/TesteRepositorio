object DMGrupoProdutoMeta: TDMGrupoProdutoMeta
  OldCreateOrder = False
  Left = 302
  Top = 166
  Height = 161
  Width = 299
  object QGrupoProdutoMeta: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_GRUPO_PRODUTO_META.*'
      'FROM'
      '  TB_GRUPO_PRODUTO_META'
      'WHERE'
      '  COD_GRUPO_PRODUTO_META = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_GRUPO_PRODUTO_META'
    SequenceField.Sequence = 'SQ_GRUPO_PRODUTO_META'
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      040000000200000016000000434F445F475255504F5F50524F4455544F5F4D45
      544101000000000017000000444553435F475255504F5F50524F4455544F5F4D
      455441010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    AfterOpen = QGrupoProdutoMetaAfterOpen
    Left = 48
    Top = 8
    object QGrupoProdutoMetaCOD_GRUPO_PRODUTO_META: TIntegerField
      FieldName = 'COD_GRUPO_PRODUTO_META'
      Required = True
    end
    object QGrupoProdutoMetaDESC_GRUPO_PRODUTO_META: TStringField
      FieldName = 'DESC_GRUPO_PRODUTO_META'
      Required = True
      Size = 40
    end
  end
  object QGrupoProdutoMetaItem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_GRUPO_PRODUTO_META_ITEM.*'
      'FROM'
      '  TB_GRUPO_PRODUTO_META_ITEM'
      'WHERE'
      '  COD_GRUPO_PRODUTO_META = :COD_GRUPO_PRODUTO_META')
    Variables.Data = {
      0300000001000000170000003A434F445F475255504F5F50524F4455544F5F4D
      455441030000000000000000000000}
    SequenceField.Field = 'COD_GRUPO_PRODUTO_META_ITEM'
    SequenceField.Sequence = 'SQ_GRUPO_PRODUTO_META_ITEM'
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      040000000300000016000000434F445F475255504F5F50524F4455544F5F4D45
      54410100000000001B000000434F445F475255504F5F50524F4455544F5F4D45
      54415F4954454D0100000000000B000000434F445F50524F4455544F01000000
      0000}
    Master = QGrupoProdutoMeta
    MasterFields = 'COD_GRUPO_PRODUTO_META'
    DetailFields = 'COD_GRUPO_PRODUTO_META'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeInsert = QGrupoProdutoMetaItemBeforeInsert
    OnCalcFields = QGrupoProdutoMetaItemCalcFields
    Left = 184
    Top = 8
    object QGrupoProdutoMetaItemCOD_GRUPO_PRODUTO_META_ITEM: TIntegerField
      FieldName = 'COD_GRUPO_PRODUTO_META_ITEM'
      Required = True
    end
    object QGrupoProdutoMetaItemCOD_GRUPO_PRODUTO_META: TIntegerField
      FieldName = 'COD_GRUPO_PRODUTO_META'
      Required = True
    end
    object QGrupoProdutoMetaItemCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QGrupoProdutoMetaItemdesc_produto: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_produto'
      Size = 50
      Calculated = True
    end
  end
  object QGrupoProdutoMetaCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  TB_GRUPO_PRODUTO_META'
      'WHERE'
      '  (:GRUPO IS NULL'
      '    OR'
      '    DESC_GRUPO_PRODUTO_META = :GRUPO)')
    Variables.Data = {0300000001000000060000003A475255504F050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000016000000434F445F475255504F5F50524F4455544F5F4D45
      544101000000000017000000444553435F475255504F5F50524F4455544F5F4D
      455441010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 64
    object QGrupoProdutoMetaConsCOD_GRUPO_PRODUTO_META: TIntegerField
      FieldName = 'COD_GRUPO_PRODUTO_META'
      Required = True
    end
    object QGrupoProdutoMetaConsDESC_GRUPO_PRODUTO_META: TStringField
      FieldName = 'DESC_GRUPO_PRODUTO_META'
      Required = True
      Size = 40
    end
  end
  object QRGrupoProdutoMeta: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  G.COD_GRUPO_PRODUTO_META,'
      '  G.DESC_GRUPO_PRODUTO_META,'
      '  P.COD_PRODUTO,'
      '  P.DESC_PRODUTO'
      'FROM'
      '  TB_GRUPO_PRODUTO_META G'
      'INNER JOIN'
      '  TB_GRUPO_PRODUTO_META_ITEM I'
      'ON'
      '  G.COD_GRUPO_PRODUTO_META = I.COD_GRUPO_PRODUTO_META'
      'INNER JOIN'
      '  TB_PRODUTO P'
      'ON'
      '  I.COD_PRODUTO = P.COD_PRODUTO'
      'WHERE'
      '  (:PRODUTO IS NULL OR P.COD_PRODUTO = :PRODUTO)'
      'AND'
      
        '  (:GRUPO_PRODUTO_META IS NULL OR G.COD_GRUPO_PRODUTO_META = :GR' +
        'UPO_PRODUTO_META)'
      'ORDER BY'
      '  G.COD_GRUPO_PRODUTO_META,'
      '  P.DESC_PRODUTO'
      '')
    Variables.Data = {
      0300000002000000080000003A50524F4455544F030000000000000000000000
      130000003A475255504F5F50524F4455544F5F4D455441030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000016000000434F445F475255504F5F50524F4455544F5F4D45
      544101000000000017000000444553435F475255504F5F50524F4455544F5F4D
      4554410100000000000B000000434F445F50524F4455544F0100000000000C00
      0000444553435F50524F4455544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 184
    Top = 64
    object QRGrupoProdutoMetaCOD_GRUPO_PRODUTO_META: TIntegerField
      FieldName = 'COD_GRUPO_PRODUTO_META'
      Required = True
    end
    object QRGrupoProdutoMetaDESC_GRUPO_PRODUTO_META: TStringField
      FieldName = 'DESC_GRUPO_PRODUTO_META'
      Required = True
      Size = 40
    end
    object QRGrupoProdutoMetaCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRGrupoProdutoMetaDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
  end
end
