object DMMarcaPneu: TDMMarcaPneu
  OldCreateOrder = False
  Left = 709
  Top = 354
  Height = 159
  Width = 206
  object QMarcaPneu: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_MARCA_PNEU.*'
      'FROM'
      '  TB_MARCA_PNEU'
      'WHERE'
      '  TB_MARCA_PNEU.COD_MARCA_PNEU = :PK'
      '')
    Variables.Data = {0300000001000000030000003A504B050000000000000000000000}
    SequenceField.Field = 'COD_MARCA_PNEU'
    SequenceField.Sequence = 'SQMARCAPNEU'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000020000000E000000434F445F4D415243415F504E4555010000000000
      0F000000444553435F4D415243415F504E4555010000000000}
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 8
    object QMarcaPneuCOD_MARCA_PNEU: TIntegerField
      FieldName = 'COD_MARCA_PNEU'
      Required = True
    end
    object QMarcaPneuDESC_MARCA_PNEU: TStringField
      FieldName = 'DESC_MARCA_PNEU'
    end
  end
  object QMarcaPneuCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT * FROM TB_MARCA_PNEU'
      'WHERE'
      'DESC_MARCA_PNEU LIKE :DESCRICAO')
    Variables.Data = {
      03000000010000000A0000003A44455343524943414F05000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000E000000434F445F4D415243415F504E4555010000000000
      0F000000444553435F4D415243415F504E4555010000000000}
    Session = DMOracle.DBCemapa
    Left = 112
    Top = 8
    object QMarcaPneuConsCOD_MARCA_PNEU: TIntegerField
      FieldName = 'COD_MARCA_PNEU'
      Required = True
    end
    object QMarcaPneuConsDESC_MARCA_PNEU: TStringField
      FieldName = 'DESC_MARCA_PNEU'
    end
  end
end
