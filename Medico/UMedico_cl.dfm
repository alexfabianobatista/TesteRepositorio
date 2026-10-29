object DMMedico: TDMMedico
  OldCreateOrder = False
  Left = 321
  Top = 199
  Height = 254
  Width = 445
  object QMedico: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_MEDICO."COD_MEDICO",'
      '  TB_MEDICO."NOME",'
      '  TB_MEDICO."DESC_CRM",'
      '  TB_MEDICO."DESC_CPF",'
      '  TB_MEDICO."DESC_CNPJ"'
      'FROM'
      '  TB_MEDICO'
      'WHERE'
      '  TB_MEDICO."COD_MEDICO" = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_MEDICO'
    SequenceField.Sequence = 'SQMEDICO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000050000000A000000434F445F4D454449434F01000000000004000000
      4E4F4D4501000000000008000000444553435F43524D01000000000008000000
      444553435F43504601000000000009000000444553435F434E504A0100000000
      00}
    Session = DMOracle.DBCemapa
    BeforePost = QMedicoBeforePost
    Left = 32
    Top = 32
    object QMedicoCOD_MEDICO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_MEDICO'
      Required = True
    end
    object QMedicoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QMedicoDESC_CRM: TStringField
      DisplayLabel = 'CRM'
      FieldName = 'DESC_CRM'
      Required = True
      Size = 6
    end
    object QMedicoDESC_CNPJ: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'DESC_CNPJ'
      EditMask = '##.###.###/####-##;1;_'
      Size = 18
    end
    object QMedicoDESC_CPF: TStringField
      FieldName = 'DESC_CPF'
      EditMask = '###.###.###-##;1;_'
      Size = 14
    end
  end
  object QMedicoCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_MEDICO."COD_MEDICO",'
      '  TB_MEDICO."NOME",'
      '  TB_MEDICO."DESC_CRM",'
      '  TB_MEDICO."DESC_CPF",'
      '  TB_MEDICO."DESC_CNPJ"'
      'FROM'
      '  TB_MEDICO'
      'WHERE'
      '  (:CODIGO IS NULL'
      '   OR'
      '    TB_MEDICO."COD_MEDICO" = :CODIGO)'
      '  AND'
      '  (:NOME IS NULL'
      '   OR'
      '    TB_MEDICO."NOME" >= :NOME)'
      'ORDER BY'
      '  TB_MEDICO."NOME"'
      '')
    Variables.Data = {
      0300000002000000050000003A4E4F4D45050000000000000000000000070000
      003A434F4449474F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000A000000434F445F4D454449434F01000000000004000000
      4E4F4D4501000000000008000000444553435F43524D01000000000008000000
      444553435F43504601000000000009000000444553435F434E504A0100000000
      00}
    Session = DMOracle.DBCemapa
    Left = 112
    Top = 32
    object QMedicoConsCOD_MEDICO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_MEDICO'
      Required = True
    end
    object QMedicoConsNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QMedicoConsDESC_CRM: TStringField
      DisplayLabel = 'CRM'
      FieldName = 'DESC_CRM'
      Required = True
      Size = 6
    end
    object QMedicoConsDESC_CPF: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'DESC_CPF'
      Required = True
      EditMask = '000\.000\.000\-00;1;_'
      Size = 14
    end
    object QMedicoConsDESC_CNPJ: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'DESC_CNPJ'
      EditMask = '00\-000\-000\/0000\-00;1;_'
      Size = 18
    end
  end
  object QRMedico: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_MEDICO."COD_MEDICO",'
      '  TB_MEDICO."NOME",'
      '  TB_MEDICO."DESC_CRM",'
      '  TB_MEDICO."DESC_CPF",'
      '  TB_MEDICO."DESC_CNPJ"'
      'FROM'
      '  TB_MEDICO'
      'ORDER BY'
      '  TB_MEDICO."NOME"')
    QBEDefinition.QBEFieldDefs = {
      04000000050000000A000000434F445F4D454449434F01000000000004000000
      4E4F4D4501000000000008000000444553435F43524D01000000000008000000
      444553435F43504601000000000009000000444553435F434E504A0100000000
      00}
    Session = DMOracle.DBCemapa
    Left = 192
    Top = 32
    object QRMedicoCOD_MEDICO: TIntegerField
      FieldName = 'COD_MEDICO'
      Required = True
    end
    object QRMedicoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRMedicoDESC_CRM: TStringField
      FieldName = 'DESC_CRM'
      Required = True
      Size = 6
    end
    object QRMedicoDESC_CPF: TStringField
      FieldName = 'DESC_CPF'
      Required = True
      Size = 14
    end
    object QRMedicoDESC_CNPJ: TStringField
      FieldName = 'DESC_CNPJ'
      Size = 18
    end
  end
end
