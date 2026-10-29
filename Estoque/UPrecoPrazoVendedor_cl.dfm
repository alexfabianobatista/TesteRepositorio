object DMPrecoPrazoVendedor: TDMPrecoPrazoVendedor
  OldCreateOrder = False
  Left = 417
  Top = 208
  Height = 275
  Width = 270
  object QPrecoPrazoVendedor: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_PRECO_PRAZO_VENDEDOR.*'
      'FROM'
      '  TB_PRECO_PRAZO_VENDEDOR'
      'WHERE'
      '  COD_PRECO_PRAZO_VENDEDOR = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_PRECO_PRAZO_VENDEDOR'
    SequenceField.Sequence = 'SQPRECO_PRAZO_VENDEDOR'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000500000018000000434F445F505245434F5F5052415A4F5F56454E44
      45444F5201000000000014000000434F445F5052415A4F5F56454E43494D454E
      544F0100000000000B000000434F445F50524F4455544F0100000000000B0000
      0056414C5F50524F4455544F0100000000000A000000434F445F45535441444F
      010000000000}
    Session = DMOracle.DBCemapa
    Left = 64
    Top = 16
    object QPrecoPrazoVendedorCOD_PRECO_PRAZO_VENDEDOR: TIntegerField
      FieldName = 'COD_PRECO_PRAZO_VENDEDOR'
      Required = True
    end
    object QPrecoPrazoVendedorCOD_PRAZO_VENCIMENTO: TIntegerField
      FieldName = 'COD_PRAZO_VENCIMENTO'
      Required = True
    end
    object QPrecoPrazoVendedorCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QPrecoPrazoVendedorVAL_PRODUTO: TFloatField
      FieldName = 'VAL_PRODUTO'
      DisplayFormat = '#,###0.000'
    end
    object QPrecoPrazoVendedorCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
  end
  object QPrecoPrazoVendedorCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  PR.COD_PRECO_PRAZO_VENDEDOR,'
      '  TB_PRAZO_VENCIMENTO.DESC_PRAZO_VENCIMENTO,'
      '  TB_ESTADO.DESC_ESTADO,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  PR.VAL_PRODUTO'
      'FROM'
      '  TB_PRECO_PRAZO_VENDEDOR PR,'
      '  TB_PRAZO_VENCIMENTO,'
      '  TB_ESTADO,'
      '  TB_PRODUTO'
      'WHERE'
      '    PR.COD_PRAZO_VENCIMENTO ='
      '      TB_PRAZO_VENCIMENTO.COD_PRAZO_VENCIMENTO'
      '  AND'
      '    PR.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      '  AND'
      '    PR.COD_ESTADO = TB_ESTADO.COD_ESTADO(+)'
      '  AND'
      '    (:ESTADO IS NULL'
      '    OR'
      '    PR.COD_ESTADO = :ESTADO)'
      '  AND'
      '    (:PRODUTO IS NULL'
      '    OR'
      '    PR.COD_PRODUTO = :PRODUTO)'
      '  AND'
      '    (:PRAZO_VENCIMENTO IS NULL'
      '    OR'
      '    PR.COD_PRAZO_VENCIMENTO = :PRAZO_VENCIMENTO)'
      'ORDER BY'
      '  PR.COD_PRECO_PRAZO_VENDEDOR')
    Variables.Data = {
      0300000003000000080000003A50524F4455544F030000000000000000000000
      110000003A5052415A4F5F56454E43494D454E544F0300000000000000000000
      00070000003A45535441444F050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000018000000434F445F505245434F5F5052415A4F5F56454E44
      45444F520100000000000B00000056414C5F50524F4455544F01000000000015
      000000444553435F5052415A4F5F56454E43494D454E544F0100000000000C00
      0000444553435F50524F4455544F0100000000000B000000444553435F455354
      41444F010000000000}
    Session = DMOracle.DBCemapa
    Left = 64
    Top = 64
    object QPrecoPrazoVendedorConsCOD_PRECO_PRAZO_VENDEDOR: TIntegerField
      FieldName = 'COD_PRECO_PRAZO_VENDEDOR'
      Required = True
    end
    object QPrecoPrazoVendedorConsDESC_PRAZO_VENCIMENTO: TStringField
      FieldName = 'DESC_PRAZO_VENCIMENTO'
      Required = True
      Size = 30
    end
    object QPrecoPrazoVendedorConsDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QPrecoPrazoVendedorConsVAL_PRODUTO: TFloatField
      FieldName = 'VAL_PRODUTO'
      DisplayFormat = '#,##0.00'
    end
    object QPrecoPrazoVendedorConsDESC_ESTADO: TStringField
      FieldName = 'DESC_ESTADO'
      Required = True
      Size = 30
    end
  end
  object QPrecoPrazoReajuste: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_PRECO_PRAZO_VENDEDOR,'
      '  VAL_PRODUTO'
      'FROM'
      '  TB_PRECO_PRAZO_VENDEDOR'
      'WHERE'
      '  (:COD_PRODUTO IS NULL'
      '    OR COD_PRODUTO = :COD_PRODUTO)'
      '  AND'
      '  (:COD_PRAZO_VENCIMENTO IS NULL'
      '    OR COD_PRAZO_VENCIMENTO = :COD_PRAZO_VENCIMENTO)'
      '  AND'
      '  (:COD_ESTADO IS NULL'
      '    OR COD_ESTADO = :COD_ESTADO)'
      'ORDER BY'
      '  COD_PRODUTO')
    Variables.Data = {
      03000000030000000C0000003A434F445F50524F4455544F0300000000000000
      00000000150000003A434F445F5052415A4F5F56454E43494D454E544F030000
      0000000000000000000B0000003A434F445F45535441444F0500000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000018000000434F445F505245434F5F5052415A4F5F56454E44
      45444F520100000000000B00000056414C5F50524F4455544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 64
    Top = 112
    object QPrecoPrazoReajusteCOD_PRECO_PRAZO_VENDEDOR: TIntegerField
      FieldName = 'COD_PRECO_PRAZO_VENDEDOR'
      Required = True
    end
    object QPrecoPrazoReajusteVAL_PRODUTO: TFloatField
      FieldName = 'VAL_PRODUTO'
    end
  end
end
