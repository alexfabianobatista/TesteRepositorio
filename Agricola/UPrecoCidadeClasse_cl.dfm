object DMPrecoCidadeClasse: TDMPrecoCidadeClasse
  OldCreateOrder = False
  Left = 340
  Top = 167
  Height = 257
  Width = 384
  object QPrecoCidadeClasse: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_PRECO_CIDADE_CLASSE.*'
      'FROM'
      '  TB_PRECO_CIDADE_CLASSE'
      'WHERE'
      '  COD_PRECO_CIDADE_CLASSE =:PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_PRECO_CIDADE_CLASSE'
    SequenceField.Sequence = 'SQPRECO_CIDADE_CLASSE'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000500000017000000434F445F505245434F5F4349444144455F434C41
      5353450100000000000A000000434F445F4349444144450100000000000A0000
      00434F445F434C415353450100000000000D00000044545F5245464552454E43
      49410100000000000900000056414C5F505245434F010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 32
    object QPrecoCidadeClasseCOD_PRECO_CIDADE_CLASSE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PRECO_CIDADE_CLASSE'
      Required = True
    end
    object QPrecoCidadeClasseCOD_CIDADE: TIntegerField
      DisplayLabel = 'Cidade'
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object QPrecoCidadeClasseCOD_CLASSE: TIntegerField
      DisplayLabel = 'Classe'
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object QPrecoCidadeClasseDT_REFERENCIA: TDateTimeField
      DisplayLabel = 'Data Refer'#234'ncia'
      FieldName = 'DT_REFERENCIA'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QPrecoCidadeClasseVAL_PRECO: TFloatField
      DisplayLabel = 'Valor Pre'#231'o'
      FieldName = 'VAL_PRECO'
      Required = True
    end
  end
  object QPrecoCidadeClasseCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PRECO_CIDADE_CLASSE.COD_PRECO_CIDADE_CLASSE,'
      '  TB_PRECO_CIDADE_CLASSE.DT_REFERENCIA,'
      '  TB_PRECO_CIDADE_CLASSE.VAL_PRECO,'
      '  TB_CIDADE.DESC_CIDADE,'
      '  TB_CLASSE.DESC_CLASSE'
      'FROM'
      '  TB_PRECO_CIDADE_CLASSE,'
      '  TB_CIDADE,'
      '  TB_CLASSE'
      'WHERE'
      '  TB_PRECO_CIDADE_CLASSE.COD_CIDADE = TB_CIDADE.COD_CIDADE'
      '  AND'
      '  TB_PRECO_CIDADE_CLASSE.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '  AND'
      '  (:COD_CIDADE IS NULL'
      '    OR'
      '    :COD_CIDADE = TB_PRECO_CIDADE_CLASSE.COD_CIDADE)'
      '  AND'
      '  (:COD_CLASSE IS NULL'
      '    OR'
      '    :COD_CLASSE = TB_PRECO_CIDADE_CLASSE.COD_CLASSE)'
      '  AND'
      '  TB_PRECO_CIDADE_CLASSE.DT_REFERENCIA >= :DATA'
      ''
      '')
    Variables.Data = {
      03000000030000000B0000003A434F445F434944414445030000000000000000
      0000000B0000003A434F445F434C415353450300000000000000000000000500
      00003A444154410C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000017000000434F445F505245434F5F4349444144455F434C41
      5353450100000000000D00000044545F5245464552454E434941010000000000
      0900000056414C5F505245434F0100000000000B000000444553435F43494441
      44450100000000000B000000444553435F434C41535345010000000000}
    Session = DMOracle.DBCemapa
    Left = 168
    Top = 32
    object QPrecoCidadeClasseConsCOD_PRECO_CIDADE_CLASSE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PRECO_CIDADE_CLASSE'
      Required = True
    end
    object QPrecoCidadeClasseConsDT_REFERENCIA: TDateTimeField
      DisplayLabel = 'Data Refer'#234'ncia'
      FieldName = 'DT_REFERENCIA'
      Required = True
    end
    object QPrecoCidadeClasseConsVAL_PRECO: TFloatField
      DisplayLabel = 'Valor Pre'#231'o'
      FieldName = 'VAL_PRECO'
      Required = True
    end
    object QPrecoCidadeClasseConsDESC_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'DESC_CIDADE'
      Required = True
      Size = 50
    end
    object QPrecoCidadeClasseConsDESC_CLASSE: TStringField
      DisplayLabel = 'Classe'
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
  end
  object QRPrecoCidadeClasse: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PRECO_CIDADE_CLASSE.*,'
      '  TB_CIDADE.DESC_CIDADE,'
      '  TB_CLASSE.DESC_CLASSE'
      'FROM'
      '  TB_PRECO_CIDADE_CLASSE,'
      '  TB_CIDADE,'
      '  TB_CLASSE'
      'WHERE'
      '  TB_PRECO_CIDADE_CLASSE.COD_CIDADE = TB_CIDADE.COD_CIDADE'
      '  AND'
      '  TB_PRECO_CIDADE_CLASSE.COD_CLASSE = TB_CLASSE.COD_CLASSE'
      '  AND'
      '  (:COD_CIDADE IS NULL'
      '    OR'
      '    :COD_CIDADE = TB_PRECO_CIDADE_CLASSE.COD_CIDADE)'
      '  AND'
      '  (:COD_CLASSE IS NULL'
      '    OR'
      '    :COD_CLASSE = TB_PRECO_CIDADE_CLASSE.COD_CLASSE)'
      '  AND'
      '  TB_PRECO_CIDADE_CLASSE.DT_REFERENCIA >= :DATA_I'
      '  AND'
      '  TB_PRECO_CIDADE_CLASSE.DT_REFERENCIA <= :DATA_F'
      '')
    Variables.Data = {
      03000000040000000B0000003A434F445F434944414445030000000000000000
      0000000B0000003A434F445F434C415353450300000000000000000000000700
      00003A444154415F490C0000000000000000000000070000003A444154415F46
      0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000017000000434F445F505245434F5F4349444144455F434C41
      5353450100000000000A000000434F445F4349444144450100000000000A0000
      00434F445F434C415353450100000000000D00000044545F5245464552454E43
      49410100000000000900000056414C5F505245434F0100000000000B00000044
      4553435F4349444144450100000000000B000000444553435F434C4153534501
      0000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 96
    object QRPrecoCidadeClasseCOD_PRECO_CIDADE_CLASSE: TIntegerField
      FieldName = 'COD_PRECO_CIDADE_CLASSE'
      Required = True
    end
    object QRPrecoCidadeClasseCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object QRPrecoCidadeClasseCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object QRPrecoCidadeClasseDT_REFERENCIA: TDateTimeField
      FieldName = 'DT_REFERENCIA'
      Required = True
    end
    object QRPrecoCidadeClasseVAL_PRECO: TFloatField
      FieldName = 'VAL_PRECO'
      Required = True
    end
    object QRPrecoCidadeClasseDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Required = True
      Size = 50
    end
    object QRPrecoCidadeClasseDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
  end
end
