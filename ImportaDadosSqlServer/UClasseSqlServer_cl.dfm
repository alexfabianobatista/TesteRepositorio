object DMClasseSqlServer: TDMClasseSqlServer
  OldCreateOrder = False
  Left = 506
  Top = 302
  Height = 264
  Width = 236
  object SSQClasse: TADOQuery
    Connection = DMSqlServer.ConexaoSqlServer
    Parameters = <>
    SQL.Strings = (
      'SELECT [Codigo subgrupo] as COD_CLASSE'
      '      ,[Descricao sub grupo] as DESC_CLASSE '
      '  FROM [SIGIND].[dbo].[Sub grupo]')
    Left = 24
    Top = 40
    object SSQClasseCOD_CLASSE: TSmallintField
      FieldName = 'COD_CLASSE'
    end
    object SSQClasseDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 50
    end
  end
end
