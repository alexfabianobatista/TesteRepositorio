object DMLinhaProducao: TDMLinhaProducao
  OldCreateOrder = False
  Left = 329
  Top = 217
  Height = 150
  Width = 275
  object QLinhaProducao: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_LINHA_PRODUCAO.*'
      'FROM'
      '  TB_LINHA_PRODUCAO'
      'WHERE'
      '  TB_LINHA_PRODUCAO.COD_LINHA_PRODUCAO =:PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_LINHA_PRODUCAO'
    SequenceField.Sequence = 'SQ_LINHA_PRODUCAO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000200000012000000434F445F4C494E48415F50524F445543414F0100
      0000000013000000444553435F4C494E48415F50524F445543414F0100000000
      00}
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 32
    object QLinhaProducaoCOD_LINHA_PRODUCAO: TIntegerField
      FieldName = 'COD_LINHA_PRODUCAO'
      Required = True
    end
    object QLinhaProducaoDESC_LINHA_PRODUCAO: TStringField
      FieldName = 'DESC_LINHA_PRODUCAO'
      Required = True
      Size = 30
    end
  end
  object QLinhaProducaoCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM '
      '  TB_LINHA_PRODUCAO'
      'WHERE'
      '  DESC_LINHA_PRODUCAO Like :LINHA_PRODUCAO || '#39'%'#39
      ''
      '')
    Variables.Data = {
      03000000010000000F0000003A4C494E48415F50524F445543414F0500000000
      00000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000012000000434F445F4C494E48415F50524F445543414F0100
      0000000013000000444553435F4C494E48415F50524F445543414F0100000000
      00}
    Session = DMOracle.DBCemapa
    Left = 160
    Top = 32
    object QLinhaProducaoConsCOD_LINHA_PRODUCAO: TIntegerField
      FieldName = 'COD_LINHA_PRODUCAO'
      Required = True
    end
    object QLinhaProducaoConsDESC_LINHA_PRODUCAO: TStringField
      FieldName = 'DESC_LINHA_PRODUCAO'
      Required = True
      Size = 30
    end
  end
end
