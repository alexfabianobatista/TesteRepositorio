object DmFormaRecebimento: TDmFormaRecebimento
  OldCreateOrder = False
  Left = 558
  Top = 153
  Height = 150
  Width = 215
  object QFormaRecebimento: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_FORMA_RECEBIMENTO.ROWID,'
      '  TB_FORMA_RECEBIMENTO.*'
      'FROM'
      '  TB_FORMA_RECEBIMENTO'
      'WHERE'
      '  TB_FORMA_RECEBIMENTO.COD_FORMA_RECEBIMENTO = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_FORMA_RECEBIMENTO'
    SequenceField.Sequence = 'SQFORMA_RECEBIMENTO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000300000015000000434F445F464F524D415F5245434542494D454E54
      4F01000000000016000000444553435F464F524D415F5245434542494D454E54
      4F01000000000010000000494E445F4558494749525F42414E434F0100000000
      00}
    Session = DMOracle.DBCemapa
    AfterInsert = QFormaRecebimentoAfterInsert
    Left = 56
    Top = 8
    object QFormaRecebimentoCOD_FORMA_RECEBIMENTO: TIntegerField
      FieldName = 'COD_FORMA_RECEBIMENTO'
      Required = True
    end
    object QFormaRecebimentoDESC_FORMA_RECEBIMENTO: TStringField
      FieldName = 'DESC_FORMA_RECEBIMENTO'
      Required = True
      Size = 50
    end
    object QFormaRecebimentoIND_EXIGIR_BANCO: TStringField
      FieldName = 'IND_EXIGIR_BANCO'
      Size = 1
    end
  end
  object QFormaRecebimentoCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_FORMA_RECEBIMENTO.*'
      'FROM'
      '  TB_FORMA_RECEBIMENTO'
      'WHERE'
      
        '  TB_FORMA_RECEBIMENTO.DESC_FORMA_RECEBIMENTO >= :DESC_FORMA_REC' +
        'EBIMENTO')
    Variables.Data = {
      0300000001000000170000003A444553435F464F524D415F5245434542494D45
      4E544F050000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000300000015000000434F445F464F524D415F5245434542494D454E54
      4F01000000000016000000444553435F464F524D415F5245434542494D454E54
      4F01000000000010000000494E445F4558494749525F42414E434F0100000000
      00}
    Session = DMOracle.DBCemapa
    Left = 56
    Top = 56
    object QFormaRecebimentoConsCOD_FORMA_RECEBIMENTO: TIntegerField
      FieldName = 'COD_FORMA_RECEBIMENTO'
      Required = True
    end
    object QFormaRecebimentoConsDESC_FORMA_RECEBIMENTO: TStringField
      FieldName = 'DESC_FORMA_RECEBIMENTO'
      Required = True
      Size = 50
    end
    object QFormaRecebimentoConsIND_EXIGIR_BANCO: TStringField
      FieldName = 'IND_EXIGIR_BANCO'
      Size = 1
    end
  end
end
