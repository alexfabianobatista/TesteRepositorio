object DMMarcaPostgre: TDMMarcaPostgre
  OldCreateOrder = False
  Left = 431
  Top = 203
  Height = 180
  Width = 224
  object ZQMarcaSeta: TZQuery
    Connection = DMPostgre.ZConnection1
    SQL.Strings = (
      'SELECT'
      'CODIGO,'
      'TRIM(DESCRICAO) DESCRICAO'
      'FROM'
      'MARCAS'
      'ORDER BY'
      '  CODIGO')
    Params = <>
    Left = 32
    Top = 24
    object ZQMarcaSetacodigo: TStringField
      FieldName = 'codigo'
      Required = True
      Size = 6
    end
    object ZQMarcaSetadescricao: TMemoField
      FieldName = 'descricao'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
end
