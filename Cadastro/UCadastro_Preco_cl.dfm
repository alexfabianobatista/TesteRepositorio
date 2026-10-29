object DMCadastro_Preco: TDMCadastro_Preco
  OldCreateOrder = False
  Left = 274
  Top = 101
  Height = 252
  Width = 305
  object QCadastro_Preco_Cad: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Cadastro_Preco.*'
      'From'
      '  Tb_Cadastro_Preco'
      'Where'
      '  Cod_Cadastro_Preco = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_CADASTRO_PRECO'
    SequenceField.Sequence = 'SQ_caDASTRO_PRECO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000400000012000000434F445F434144415354524F5F505245434F0100
      000000000C000000434F445F434144415354524F0100000000000B000000434F
      445F50524F4455544F0100000000000900000056414C5F505245434F01000000
      0000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 32
    object QCadastro_Preco_CadCOD_CADASTRO_PRECO: TIntegerField
      FieldName = 'COD_CADASTRO_PRECO'
      Required = True
    end
    object QCadastro_Preco_CadCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QCadastro_Preco_CadCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QCadastro_Preco_CadVAL_PRECO: TFloatField
      FieldName = 'VAL_PRECO'
      Required = True
      DisplayFormat = '#,##0.00'
    end
  end
  object QCadastro_Preco_Cons: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Tb_Cadastro_Preco.Cod_Cadastro_Preco,'
      '  Tb_Cadastro_Preco.Cod_Cadastro,'
      '  Tb_Cadastro_Preco.Cod_Produto,'
      '  Tb_Cadastro_Preco.Val_Preco,'
      '  Nome,'
      '  Desc_Produto'
      'From'
      '  Tb_Cadastro_Preco,'
      '  Tb_Cadastro,'
      '  Tb_Produto'
      'Where'
      '  Tb_Cadastro_Preco.COD_CADASTRO = Tb_Cadastro.COD_CADASTRO'
      '  And'
      '  Tb_Cadastro_Preco.COD_PRODUTO = Tb_Produto.COD_PRODUTO'
      '  And'
      '  (:Cod_Cadastro is Null'
      '   Or'
      '    Tb_Cadastro_Preco.COD_CADASTRO = :Cod_Cadastro)'
      '  And'
      '  (:Cod_Produto is Null'
      '   Or'
      '    Tb_Cadastro_Preco.COD_PRODUTO = :Cod_Produto)'
      'Order By'
      '  Tb_Cadastro_Preco.Cod_Cadastro,'
      '  Tb_Cadastro_Preco.Cod_Produto')
    Variables.Data = {
      03000000020000000D0000003A434F445F434144415354524F03000000000000
      00000000000C0000003A434F445F50524F4455544F0300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000C000000434F445F434144415354524F0100000000000B00
      0000434F445F50524F4455544F0100000000000900000056414C5F505245434F
      010000000000040000004E4F4D450100000000000C000000444553435F50524F
      4455544F01000000000012000000434F445F434144415354524F5F505245434F
      010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 96
    object QCadastro_Preco_ConsCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QCadastro_Preco_ConsCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QCadastro_Preco_ConsVAL_PRECO: TFloatField
      FieldName = 'VAL_PRECO'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QCadastro_Preco_ConsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QCadastro_Preco_ConsDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QCadastro_Preco_ConsCOD_CADASTRO_PRECO: TIntegerField
      FieldName = 'COD_CADASTRO_PRECO'
      Required = True
    end
  end
end
