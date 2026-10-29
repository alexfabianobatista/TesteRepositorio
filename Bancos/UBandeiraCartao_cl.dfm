object DMBandeiraCartao: TDMBandeiraCartao
  OldCreateOrder = False
  Left = 633
  Top = 238
  Height = 197
  Width = 260
  object QBandeiraCartaoCad: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      ' ROWID,'
      '  TB_BANDEIRA_CARTAO.* '
      'FROM'
      '  TB_BANDEIRA_CARTAO'
      'WHERE'
      '  COD_BANDEIRA_CARTAO = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_BANDEIRA_CARTAO'
    SequenceField.Sequence = 'SQ_BANDEIRA_CARTAO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000200000013000000434F445F42414E44454952415F43415254414F01
      000000000014000000444553435F42414E44454952415F43415254414F010000
      000000}
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 16
    object QBandeiraCartaoCadCOD_BANDEIRA_CARTAO: TIntegerField
      FieldName = 'COD_BANDEIRA_CARTAO'
      Required = True
    end
    object QBandeiraCartaoCadDESC_BANDEIRA_CARTAO: TStringField
      FieldName = 'DESC_BANDEIRA_CARTAO'
      Size = 30
    end
  end
  object QBandeiraCartaoCons: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  TB_BANDEIRA_CARTAO.*'
      'FROM'
      '  TB_BANDEIRA_CARTAO'
      'WHERE'
      '  DESC_BANDEIRA_CARTAO >= :DESC_BANDEIRA_CARTAO')
    Variables.Data = {
      0300000001000000150000003A444553435F42414E44454952415F4341525441
      4F050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000013000000434F445F42414E44454952415F43415254414F01
      000000000014000000444553435F42414E44454952415F43415254414F010000
      000000}
    Session = DMOracle.DBCemapa
    Left = 152
    Top = 16
    object QBandeiraCartaoConsCOD_BANDEIRA_CARTAO: TIntegerField
      FieldName = 'COD_BANDEIRA_CARTAO'
      Required = True
    end
    object QBandeiraCartaoConsDESC_BANDEIRA_CARTAO: TStringField
      FieldName = 'DESC_BANDEIRA_CARTAO'
      Size = 30
    end
  end
  object QRBandeiraCartao: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      ' *'
      'FROM '
      ' TB_BANDEIRA_CARTAO')
    QBEDefinition.QBEFieldDefs = {
      040000000200000013000000434F445F42414E44454952415F43415254414F01
      000000000014000000444553435F42414E44454952415F43415254414F010000
      000000}
    Session = DMOracle.DBCemapa
    Left = 32
    Top = 80
    object QRBandeiraCartaoCOD_BANDEIRA_CARTAO: TIntegerField
      FieldName = 'COD_BANDEIRA_CARTAO'
      Required = True
    end
    object QRBandeiraCartaoDESC_BANDEIRA_CARTAO: TStringField
      FieldName = 'DESC_BANDEIRA_CARTAO'
      Size = 30
    end
  end
end
