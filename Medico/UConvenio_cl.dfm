object DMConvenio: TDMConvenio
  OldCreateOrder = False
  Left = 325
  Top = 172
  Height = 132
  Width = 281
  object QConvenio: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_CONVENIO."COD_CONVENIO",'
      '  TB_CONVENIO."DESC_CONVENIO"'
      'FROM'
      '  TB_CONVENIO'
      'WHERE'
      '  TB_CONVENIO."COD_CONVENIO" = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_CONVENIO'
    SequenceField.Sequence = 'SQCONVENIO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000020000000C000000434F445F434F4E56454E494F0100000000000D00
      0000444553435F434F4E56454E494F010000000000}
    Session = DMOracle.DBCemapa
    Left = 32
    Top = 24
    object QConvenioCOD_CONVENIO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_CONVENIO'
      Required = True
    end
    object QConvenioDESC_CONVENIO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESC_CONVENIO'
      Required = True
      Size = 30
    end
  end
  object QConvenioCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_CONVENIO."COD_CONVENIO",'
      '  TB_CONVENIO."DESC_CONVENIO"'
      'FROM'
      '  TB_CONVENIO'
      'WHERE'
      '  (:CONVENIO IS NULL'
      '   OR'
      '    TB_CONVENIO."DESC_CONVENIO" >= :CONVENIO)'
      '  AND'
      '  (:CODIGO IS NULL'
      '   OR'
      '    TB_CONVENIO."COD_CONVENIO" = :CODIGO)'
      'ORDER BY'
      '  TB_CONVENIO."DESC_CONVENIO"')
    Variables.Data = {
      0300000002000000090000003A434F4E56454E494F0500000000000000000000
      00070000003A434F4449474F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000C000000434F445F434F4E56454E494F0100000000000D00
      0000444553435F434F4E56454E494F010000000000}
    Session = DMOracle.DBCemapa
    Left = 120
    Top = 24
    object QConvenioConsCOD_CONVENIO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_CONVENIO'
      Required = True
    end
    object QConvenioConsDESC_CONVENIO: TStringField
      DisplayLabel = 'Conv'#234'nio'
      FieldName = 'DESC_CONVENIO'
      Required = True
      Size = 30
    end
  end
  object QRConvenio: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_CONVENIO."COD_CONVENIO",'
      '  TB_CONVENIO."DESC_CONVENIO"'
      'FROM'
      '  TB_CONVENIO')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000C000000434F445F434F4E56454E494F0100000000000D00
      0000444553435F434F4E56454E494F010000000000}
    Session = DMOracle.DBCemapa
    Left = 208
    Top = 24
    object QRConvenioCOD_CONVENIO: TIntegerField
      FieldName = 'COD_CONVENIO'
      Required = True
    end
    object QRConvenioDESC_CONVENIO: TStringField
      FieldName = 'DESC_CONVENIO'
      Required = True
      Size = 30
    end
  end
end
