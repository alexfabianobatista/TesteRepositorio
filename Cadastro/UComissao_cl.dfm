object DMComissao: TDMComissao
  OldCreateOrder = False
  Left = 282
  Top = 55
  Height = 150
  Width = 215
  object QComissao: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_COMISSAO.*'
      'FROM'
      '  TB_COMISSAO'
      'WHERE'
      '  TB_COMISSAO.COD_COMISSAO = :PK'
      ' ')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_COMISSAO'
    SequenceField.Sequence = 'SQCOMISSAO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000020000000C000000434F445F434F4D495353414F0100000000000D00
      0000444553435F434F4D495353414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 32
    Top = 8
    object QComissaoCOD_COMISSAO: TIntegerField
      FieldName = 'COD_COMISSAO'
      Required = True
    end
    object QComissaoDESC_COMISSAO: TStringField
      FieldName = 'DESC_COMISSAO'
      Size = 50
    end
  end
  object QComissaoCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_COMISSAO.*'
      'FROM'
      '  TB_COMISSAO'
      'WHERE'
      '  TB_COMISSAO.DESC_COMISSAO LIKE '#39'%'#39' || :DESC_COMISSAO || '#39'%'#39
      ' ')
    Variables.Data = {
      03000000010000000E0000003A444553435F434F4D495353414F050000000000
      000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000020000000C000000434F445F434F4D495353414F0100000000000D00
      0000444553435F434F4D495353414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 128
    Top = 8
    object QComissaoConsCOD_COMISSAO: TIntegerField
      FieldName = 'COD_COMISSAO'
      Required = True
    end
    object QComissaoConsDESC_COMISSAO: TStringField
      FieldName = 'DESC_COMISSAO'
      Size = 50
    end
  end
end
