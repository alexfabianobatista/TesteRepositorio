object DMMarcaSqlServer: TDMMarcaSqlServer
  OldCreateOrder = False
  Left = 519
  Top = 186
  Height = 217
  Width = 291
  object SSQMarca: TADOQuery
    Connection = DMSqlServer.ConexaoSqlServer
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT DISTINCT'
      '     [Marca]'
      '  FROM [SIGIND].[dbo].[Produtos]'
      '')
    Left = 24
    Top = 16
    object SSQMarcaMarca: TStringField
      FieldName = 'Marca'
      Size = 30
    end
  end
end
