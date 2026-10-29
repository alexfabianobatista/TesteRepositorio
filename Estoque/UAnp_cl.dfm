object DMAnp: TDMAnp
  OldCreateOrder = False
  Left = 297
  Top = 194
  Height = 191
  Width = 296
  object QAnpCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '   TB_ANP.*'
      'FROM'
      '   TB_ANP'
      'WHERE'
      '  (:COD_ANP IS NULL'
      '   OR TB_ANP.COD_ANP LIKE :COD_ANP)'
      'AND'
      '  (:DESCRICAO IS NULL'
      '   OR TB_ANP.DESC_ANP LIKE :DESCRICAO)'
      'ORDER BY'
      '  TB_ANP.DESC_ANP')
    Variables.Data = {
      03000000020000000A0000003A44455343524943414F05000000000000000000
      0000080000003A434F445F414E50050000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      040000000200000007000000434F445F414E5001000000000008000000444553
      435F414E50010000000000}
    ReadOnly = True
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 72
    Top = 18
    object QAnpConsCOD_ANP: TStringField
      FieldName = 'COD_ANP'
      Required = True
      Size = 9
    end
    object QAnpConsDESC_ANP: TStringField
      FieldName = 'DESC_ANP'
      Required = True
      Size = 200
    end
  end
  object QAnp: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '   ROWID,'
      '   TB_ANP.*'
      'FROM '
      '   TB_ANP'
      'WHERE'
      '  TB_ANP.COD_ANP like :PK')
    Variables.Data = {0300000001000000030000003A504B050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000007000000434F445F414E5001000000000008000000444553
      435F414E50010000000000}
    Session = DMOracle.DBCemapa
    Left = 16
    Top = 16
    object QAnpCOD_ANP: TStringField
      FieldName = 'COD_ANP'
      Required = True
      Size = 9
    end
    object QAnpDESC_ANP: TStringField
      FieldName = 'DESC_ANP'
      Required = True
      Size = 200
    end
  end
end
