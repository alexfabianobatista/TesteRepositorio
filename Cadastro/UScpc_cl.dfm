object DMScpc: TDMScpc
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 180
  Width = 304
  object QConsultaSCPC: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  COD_CONSULTA_SCPC,'
      '  COD_CADASTRO,'
      '  COD_USUARIO,'
      '  DT_CONSULTA,'
      '  DESC_RESULTADO         '
      'FROM'
      '  TB_CONSULTA_SCPC'
      'WHERE'
      '  COD_CONSULTA_SCPC = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_CONSULTA_SCPC'
    SequenceField.Sequence = 'SQCONSULTA_SCPC'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000500000011000000434F445F434F4E53554C54415F53435043010000
      0000000C000000434F445F434144415354524F0100000000000B000000434F44
      5F5553554152494F0100000000000B00000044545F434F4E53554C5441010000
      0000000E000000444553435F524553554C5441444F000000000000}
    Session = DMOracle.DBCemapa
    Left = 32
    Top = 24
    object QConsultaSCPCCOD_CONSULTA_SCPC: TIntegerField
      FieldName = 'COD_CONSULTA_SCPC'
      Required = True
    end
    object QConsultaSCPCCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QConsultaSCPCCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object QConsultaSCPCDT_CONSULTA: TDateTimeField
      FieldName = 'DT_CONSULTA'
      Required = True
    end
    object QConsultaSCPCDESC_RESULTADO: TMemoField
      FieldName = 'DESC_RESULTADO'
      BlobType = ftOraClob
    end
  end
  object QConsultaSCPCCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  COD_CONSULTA_SCPC,'
      '  COD_CADASTRO,'
      '  COD_USUARIO,'
      '  DT_CONSULTA,'
      '  DESC_RESULTADO         '
      'FROM'
      '  TB_CONSULTA_SCPC'
      'WHERE'
      '  COD_CADASTRO = :COD_CADASTRO'
      '  AND'
      '  (:DT_INICIO IS NULL'
      '   OR'
      '    DT_CONSULTA >= :DT_INICIO)'
      '  AND'
      '  (:DT_FIM IS NULL'
      '   OR'
      '    DT_CONSULTA <= :DT_FIM)')
    Variables.Data = {
      03000000030000000D0000003A434F445F434144415354524F03000000000000
      00000000000A0000003A44545F494E4943494F0C000000000000000000000007
      0000003A44545F46494D0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000011000000434F445F434F4E53554C54415F53435043010000
      0000000C000000434F445F434144415354524F0100000000000B000000434F44
      5F5553554152494F0100000000000B00000044545F434F4E53554C5441010000
      0000000E000000444553435F524553554C5441444F000000000000}
    Session = DMOracle.DBCemapa
    Left = 168
    Top = 24
    object QConsultaSCPCConsCOD_CONSULTA_SCPC: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_CONSULTA_SCPC'
      Required = True
    end
    object QConsultaSCPCConsCOD_CADASTRO: TIntegerField
      DisplayLabel = 'Cadastro'
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QConsultaSCPCConsCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object QConsultaSCPCConsDT_CONSULTA: TDateTimeField
      DisplayLabel = 'Dt. Consulta'
      FieldName = 'DT_CONSULTA'
      Required = True
    end
    object QConsultaSCPCConsDESC_RESULTADO: TMemoField
      FieldName = 'DESC_RESULTADO'
      BlobType = ftOraClob
    end
  end
end
