object DMIncentivo: TDMIncentivo
  OldCreateOrder = False
  Left = 345
  Top = 148
  Height = 205
  Width = 309
  object QIncentivo_Cad: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Rowid,'
      '  Tb_Incentivo.*'
      'From'
      '  Tb_Incentivo'
      'Where'
      '  Cod_Incentivo = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_INCENTIVO'
    SequenceField.Sequence = 'SQINCENTIVO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000050000000D000000434F445F494E43454E5449564F0100000000000C
      000000434F445F434144415354524F0100000000001300000044545F494E4943
      494F5F494E43454E5449564F0100000000001200000044545F46494E414C5F49
      4E43454E5449564F0100000000000D00000056414C5F494E43454E5449564F01
      0000000000}
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 16
    object QIncentivo_CadCOD_INCENTIVO: TIntegerField
      FieldName = 'COD_INCENTIVO'
      Required = True
    end
    object QIncentivo_CadCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QIncentivo_CadDT_INICIO_INCENTIVO: TDateTimeField
      FieldName = 'DT_INICIO_INCENTIVO'
      Required = True
      EditMask = '!99/99/##00;1;_'
    end
    object QIncentivo_CadDT_FINAL_INCENTIVO: TDateTimeField
      FieldName = 'DT_FINAL_INCENTIVO'
      Required = True
      EditMask = '!99/99/##00;1;_'
    end
    object QIncentivo_CadVAL_INCENTIVO: TFloatField
      FieldName = 'VAL_INCENTIVO'
      Required = True
      DisplayFormat = '#,##0.00'
    end
  end
  object QIncentivo_Cons: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Tb_Incentivo.COD_CADASTRO,'
      '  Tb_Incentivo.COD_INCENTIVO,'
      '  Tb_Incentivo.DT_INICIO_INCENTIVO,'
      '  Tb_Incentivo.DT_FINAL_INCENTIVO,'
      '  Tb_Incentivo.VAL_INCENTIVO,'
      '  Tb_Cadastro.NOME'
      'FROM'
      '  Tb_Incentivo,'
      '  Tb_Cadastro'
      'WHERE'
      '  Tb_Cadastro.COD_CADASTRO = Tb_Incentivo.COD_CADASTRO'
      '  and'
      '  (:cod_cadastro is null'
      '   or'
      '     Tb_Incentivo.COD_CADASTRO = :cod_cadastro)'
      'order by'
      '  Tb_Incentivo.COD_CADASTRO'
      ''
      '')
    Variables.Data = {
      03000000010000000D0000003A434F445F434144415354524F03000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000C000000434F445F434144415354524F0100000000001300
      000044545F494E4943494F5F494E43454E5449564F0100000000001200000044
      545F46494E414C5F494E43454E5449564F0100000000000D00000056414C5F49
      4E43454E5449564F010000000000040000004E4F4D450100000000000D000000
      434F445F494E43454E5449564F010000000000}
    Session = DMOracle.DBCemapa
    Left = 128
    Top = 16
    object QIncentivo_ConsCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QIncentivo_ConsDT_INICIO_INCENTIVO: TDateTimeField
      FieldName = 'DT_INICIO_INCENTIVO'
      Required = True
    end
    object QIncentivo_ConsDT_FINAL_INCENTIVO: TDateTimeField
      FieldName = 'DT_FINAL_INCENTIVO'
      Required = True
    end
    object QIncentivo_ConsVAL_INCENTIVO: TFloatField
      FieldName = 'VAL_INCENTIVO'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QIncentivo_ConsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QIncentivo_ConsCOD_INCENTIVO: TIntegerField
      FieldName = 'COD_INCENTIVO'
      Required = True
    end
  end
end
