object DMGrafico: TDMGrafico
  OldCreateOrder = False
  Left = 342
  Top = 291
  Height = 159
  Width = 292
  object QGraficoVendedor: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  SUBSTR(TB_VENDEDOR.NOME,0,10) AS NOME,'
      
        '  SUM(Tb_nota_item.VAL_UNITARIO*Tb_nota_item.QT_QUANTIDADE) AS V' +
        'AL_VENDAS'
      'FROM'
      '  TB_VENDEDOR,'
      '  TB_NOTA_ITEM,'
      '  TB_NOTA_CAB'
      'WHERE'
      '  TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '  AND'
      '  TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR'
      '  AND'
      '  TB_VENDEDOR.IND_SITUACAO = '#39'ATIVO'#39
      '  AND'
      '  TB_VENDEDOR.NOME IN :NOMES'
      'GROUP BY'
      '  TB_VENDEDOR.NOME'
      'ORDER BY'
      '  VAL_VENDAS'
      ''
      '')
    Variables.Data = {0300000001000000060000003A4E4F4D4553010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000003000000040000004E4F4D450100000000000A00000056414C5F5645
      4E4441530100000000000A00000044545F454D495353414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 32
    Top = 16
    object QGraficoVendedorNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 40
    end
    object QGraficoVendedorVAL_VENDAS: TFloatField
      FieldName = 'VAL_VENDAS'
    end
  end
  object QVendedorCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  NOME'
      'FROM'
      '  TB_VENDEDOR'
      'WHERE'
      '  IND_SITUACAO = '#39'ATIVO'#39)
    QBEDefinition.QBEFieldDefs = {0400000001000000040000004E4F4D45010000000000}
    Session = DMOracle.DBCemapa
    Left = 128
    Top = 16
    object QVendedorConsNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      Size = 40
    end
  end
  object DSVendedorCons: TDataSource
    DataSet = QVendedorCons
    Left = 216
    Top = 16
  end
end
