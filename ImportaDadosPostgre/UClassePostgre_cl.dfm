object DMClassePostgre: TDMClassePostgre
  OldCreateOrder = False
  Left = 567
  Top = 241
  Height = 194
  Width = 257
  object ZQClasseSeta: TZQuery
    Connection = DMPostgre.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  DISTINCT ON (DESCRICAO) TRIM(DESCRICAO) DESCRICAO,'
      '  CODIGO'
      'FROM'
      '  GRUPOS'
      'WHERE'
      '  DESCRICAO <> '#39#39
      'ORDER BY'
      '  DESCRICAO,'
      '  CODIGO')
    Params = <>
    Left = 40
    Top = 24
    object ZQClasseSetacodigo: TStringField
      FieldName = 'codigo'
      Required = True
      Size = 6
    end
    object ZQClasseSetadescricao: TMemoField
      FieldName = 'descricao'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
end
