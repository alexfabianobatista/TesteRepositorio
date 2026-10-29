object DMRemuneracaoLeitao: TDMRemuneracaoLeitao
  OldCreateOrder = False
  Left = 322
  Top = 166
  Height = 206
  Width = 326
  object QRemuneracaoLeitao_Cad: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Remuneracao_Leitao.*'
      'From'
      '  Tb_Remuneracao_Leitao'
      'Where'
      '  DESC_TIPO_PARCERIA = :PK'
      '')
    Variables.Data = {0300000001000000030000003A504B050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000900000012000000444553435F5449504F5F50415243455249410100
      000000001200000051545F5045534F5F5245464552454E434941010000000000
      1800000051545F494E4352454D454E544F5F5245464552454E43494101000000
      000012000000564C5F5045534F5F5245464552454E4349410100000000001800
      0000564C5F494E4352454D454E544F5F5245464552454E434941010000000000
      1800000051545F434F4E56455253414F5F5245464552454E4943494101000000
      00001700000051545F434F4E56455253414F5F494E4352454D454E544F010000
      00000017000000564C5F434F4E56455253414F5F5245464552454E4349410100
      0000000017000000564C5F434F4E56455253414F5F494E4352454D454E544F01
      0000000000}
    Session = DMOracle.DBCemapa
    Left = 64
    Top = 16
    object QRemuneracaoLeitao_CadDESC_TIPO_PARCERIA: TStringField
      FieldName = 'DESC_TIPO_PARCERIA'
      Required = True
      Size = 10
    end
    object QRemuneracaoLeitao_CadQT_PESO_REFERENCIA: TFloatField
      FieldName = 'QT_PESO_REFERENCIA'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QRemuneracaoLeitao_CadQT_INCREMENTO_REFERENCIA: TFloatField
      FieldName = 'QT_INCREMENTO_REFERENCIA'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QRemuneracaoLeitao_CadVL_PESO_REFERENCIA: TFloatField
      FieldName = 'VL_PESO_REFERENCIA'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QRemuneracaoLeitao_CadVL_INCREMENTO_REFERENCIA: TFloatField
      FieldName = 'VL_INCREMENTO_REFERENCIA'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QRemuneracaoLeitao_CadQT_CONVERSAO_REFERENICIA: TFloatField
      FieldName = 'QT_CONVERSAO_REFERENICIA'
      Required = True
      DisplayFormat = '#,##0.000'
    end
    object QRemuneracaoLeitao_CadQT_CONVERSAO_INCREMENTO: TFloatField
      FieldName = 'QT_CONVERSAO_INCREMENTO'
      Required = True
      DisplayFormat = '#,##0.000'
    end
    object QRemuneracaoLeitao_CadVL_CONVERSAO_INCREMENTO: TFloatField
      FieldName = 'VL_CONVERSAO_INCREMENTO'
      Required = True
      DisplayFormat = '#,##0.000'
    end
  end
  object QRemuneracaoLeitao_Cons: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Tb_Remuneracao_Leitao.*'
      'From'
      '  Tb_Remuneracao_Leitao'
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      040000000800000012000000444553435F5449504F5F50415243455249410100
      000000001200000051545F5045534F5F5245464552454E434941010000000000
      1800000051545F494E4352454D454E544F5F5245464552454E43494101000000
      000012000000564C5F5045534F5F5245464552454E4349410100000000001800
      0000564C5F494E4352454D454E544F5F5245464552454E434941010000000000
      1800000051545F434F4E56455253414F5F5245464552454E4943494101000000
      00001700000051545F434F4E56455253414F5F494E4352454D454E544F010000
      00000017000000564C5F434F4E56455253414F5F494E4352454D454E544F0100
      00000000}
    Session = DMOracle.DBCemapa
    Left = 64
    Top = 72
    object QRemuneracaoLeitao_ConsDESC_TIPO_PARCERIA: TStringField
      FieldName = 'DESC_TIPO_PARCERIA'
      Required = True
      Size = 10
    end
    object QRemuneracaoLeitao_ConsQT_PESO_REFERENCIA: TFloatField
      FieldName = 'QT_PESO_REFERENCIA'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QRemuneracaoLeitao_ConsQT_INCREMENTO_REFERENCIA: TFloatField
      FieldName = 'QT_INCREMENTO_REFERENCIA'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QRemuneracaoLeitao_ConsVL_PESO_REFERENCIA: TFloatField
      FieldName = 'VL_PESO_REFERENCIA'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QRemuneracaoLeitao_ConsVL_INCREMENTO_REFERENCIA: TFloatField
      FieldName = 'VL_INCREMENTO_REFERENCIA'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QRemuneracaoLeitao_ConsQT_CONVERSAO_REFERENICIA: TFloatField
      FieldName = 'QT_CONVERSAO_REFERENICIA'
      Required = True
      DisplayFormat = '#,##0.000'
    end
    object QRemuneracaoLeitao_ConsQT_CONVERSAO_INCREMENTO: TFloatField
      FieldName = 'QT_CONVERSAO_INCREMENTO'
      Required = True
      DisplayFormat = '#,##0.000'
    end
    object QRemuneracaoLeitao_ConsVL_CONVERSAO_INCREMENTO: TFloatField
      FieldName = 'VL_CONVERSAO_INCREMENTO'
      Required = True
      DisplayFormat = '#,##0.000'
    end
  end
end
