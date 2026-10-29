object DMBordero: TDMBordero
  OldCreateOrder = False
  Left = 524
  Top = 172
  Height = 382
  Width = 294
  object QContaReceberCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      #9'C.COD_CONTA_RECEBER_CAB,'
      #9'C.NUM_TITULO,'
      #9'C.NUM_PARCELA,'#9
      #9'C.VAL_ORIGINAL,'
      #9'CA.NOME,'
      #9'B.DESC_BANCO_AGENCIA,'
      #9'C.DT_EMISSAO,'
      #9'C.DT_VENCIMENTO,'#9
      #9#39'NAO'#39' CHECADO'
      'FROM'
      #9'TB_CONTA_RECEBER_CAB C LEFT JOIN TB_BANCO_AGENCIA B'
      #9'ON C.COD_BANCO_AGENCIA = B.COD_BANCO_AGENCIA'
      #9'INNER JOIN TB_CADASTRO CA'
      #9'ON C.COD_CADASTRO = CA.COD_CADASTRO'
      'WHERE'
      #9'(C.COD_FILIAL = :FILIAL)'
      #9'AND'
      #9'(:CADASTRO IS NULL OR'
      #9#9'C.COD_CADASTRO = :CADASTRO)'
      #9'AND'
      #9'(:NUM_TITULO IS NULL OR'
      #9#9'C.NUM_TITULO = :NUM_TITULO)'
      #9'AND'
      #9'(:DT_EMISSAO_I IS NULL OR'
      #9#9'C.DT_EMISSAO >= :DT_EMISSAO_I)'
      #9'AND'
      #9'(:DT_EMISSAO_F IS NULL OR'
      #9#9'C.DT_EMISSAO <= :DT_EMISSAO_F)'
      #9'AND'
      #9'(:DT_VENCIMENTO_I IS NULL OR'
      #9#9'C.DT_VENCIMENTO >= :DT_VENCIMENTO_I)'
      #9'AND'
      #9'(:DT_VENCIMENTO_F IS NULL OR'
      #9#9'C.DT_VENCIMENTO <= :DT_VENCIMENTO_F)'
      #9'AND'
      #9'C.IND_SITUACAO = '#39'ABERTO'#39
      #9'AND'
      #9'C.COD_BORDERO IS NULL'
      'ORDER BY'
      #9'C.NUM_TITULO'
      #9
      ''
      #9)
    Variables.Data = {
      0300000007000000090000003A434144415354524F0300000000000000000000
      000B0000003A4E554D5F544954554C4F0300000000000000000000000D000000
      3A44545F454D495353414F5F490C00000000000000000000000D0000003A4454
      5F454D495353414F5F460C0000000000000000000000100000003A44545F5645
      4E43494D454E544F5F490C0000000000000000000000100000003A44545F5645
      4E43494D454E544F5F460C0000000000000000000000070000003A46494C4941
      4C030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000900000015000000434F445F434F4E54415F524543454245525F4341
      420100000000000A0000004E554D5F544954554C4F0100000000000B0000004E
      554D5F50415243454C410100000000000A00000044545F454D495353414F0100
      000000000D00000044545F56454E43494D454E544F0100000000000C00000056
      414C5F4F524947494E414C01000000000012000000444553435F42414E434F5F
      4147454E434941010000000000070000004348454341444F0100000000000400
      00004E4F4D45010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 24
    object QContaReceberConsCOD_CONTA_RECEBER_CAB: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_CAB'
      Required = True
    end
    object QContaReceberConsNUM_TITULO: TFloatField
      FieldName = 'NUM_TITULO'
    end
    object QContaReceberConsNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object QContaReceberConsVAL_ORIGINAL: TFloatField
      FieldName = 'VAL_ORIGINAL'
    end
    object QContaReceberConsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QContaReceberConsDESC_BANCO_AGENCIA: TStringField
      FieldName = 'DESC_BANCO_AGENCIA'
      Size = 30
    end
    object QContaReceberConsDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QContaReceberConsDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
      Required = True
    end
    object QContaReceberConsCHECADO: TStringField
      DisplayWidth = 3
      FieldName = 'CHECADO'
      Size = 3
    end
  end
  object CDSContaReceberCons: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CADASTRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUM_TITULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_EMISSAO_I'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_EMISSAO_F'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_VENCIMENTO_I'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_VENCIMENTO_F'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptUnknown
      end>
    ProviderName = 'DSPContaReceberCons'
    Left = 48
    Top = 80
    object CDSContaReceberConsCOD_CONTA_RECEBER_CAB: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_CAB'
      Required = True
    end
    object CDSContaReceberConsNUM_TITULO: TFloatField
      FieldName = 'NUM_TITULO'
    end
    object CDSContaReceberConsNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object CDSContaReceberConsVAL_ORIGINAL: TFloatField
      FieldName = 'VAL_ORIGINAL'
      DisplayFormat = '#,##0.00'
    end
    object CDSContaReceberConsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object CDSContaReceberConsDESC_BANCO_AGENCIA: TStringField
      FieldName = 'DESC_BANCO_AGENCIA'
      Size = 30
    end
    object CDSContaReceberConsDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object CDSContaReceberConsDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
      Required = True
    end
    object CDSContaReceberConsCHECADO: TStringField
      DisplayWidth = 3
      FieldName = 'CHECADO'
      Size = 3
    end
  end
  object DSContaReceberCons: TDataSource
    DataSet = QContaReceberCons
    Left = 168
    Top = 80
  end
  object DSPContaReceberCons: TDataSetProvider
    DataSet = QContaReceberCons
    Left = 168
    Top = 24
  end
  object DSContaReceberConsClient: TDataSource
    DataSet = CDSContaReceberCons
    Left = 56
    Top = 136
  end
  object QBorderoCab: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      #9'TB_BORDERO.ROWID,'
      #9'TB_BORDERO.*'
      'FROM'
      #9'TB_BORDERO'
      'WHERE'
      #9'TB_BORDERO.COD_BORDERO = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_BORDERO'
    SequenceField.Sequence = 'SQBORDERO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000050000000B000000434F445F424F524445524F010000000000120000
      00434F445F434F4E54415F434F5252454E54450100000000000900000056414C
      5F4A55524F530100000000000A00000044545F424F524445524F010000000000
      0C000000494E445F534954554143414F010000000000}
    Session = DMOracle.DBCemapa
    BeforeInsert = QBorderoCabBeforeInsert
    AfterInsert = QBorderoCabAfterInsert
    BeforeEdit = QBorderoCabBeforeEdit
    AfterPost = QBorderoCabAfterPost
    BeforeDelete = QBorderoCabBeforeDelete
    Left = 32
    Top = 232
    object QBorderoCabCOD_BORDERO: TIntegerField
      FieldName = 'COD_BORDERO'
      Required = True
    end
    object QBorderoCabCOD_CONTA_CORRENTE: TIntegerField
      FieldName = 'COD_CONTA_CORRENTE'
      Required = True
    end
    object QBorderoCabVAL_JUROS: TFloatField
      FieldName = 'VAL_JUROS'
      DisplayFormat = '#,##0.00'
    end
    object QBorderoCabDT_BORDERO: TDateTimeField
      FieldName = 'DT_BORDERO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QBorderoCabIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 10
    end
  end
  object QBorderoItem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'#9
      #9'C.COD_CONTA_RECEBER_CAB,'
      #9'C.NUM_TITULO,'
      #9'C.NUM_PARCELA,'#9
      #9'C.VAL_ORIGINAL,'
      #9'CA.NOME,'
      #9'B.DESC_BANCO_AGENCIA,'
      #9'C.DT_EMISSAO,'
      #9'C.DT_VENCIMENTO'
      'FROM'
      #9'TB_CONTA_RECEBER_CAB C LEFT JOIN TB_BANCO_AGENCIA B'
      #9'ON C.COD_BANCO_AGENCIA = B.COD_BANCO_AGENCIA'
      #9'INNER JOIN TB_CADASTRO CA'
      #9'ON C.COD_CADASTRO = CA.COD_CADASTRO'
      'where cod_bordero = :cod_bordero'
      'ORDER BY'
      #9'C.NUM_TITULO'
      #9
      ''
      #9
      '')
    Variables.Data = {
      03000000010000000C0000003A434F445F424F524445524F0300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000A0000004E554D5F544954554C4F0100000000000B000000
      4E554D5F50415243454C410100000000000C00000056414C5F4F524947494E41
      4C010000000000040000004E4F4D4501000000000012000000444553435F4241
      4E434F5F4147454E4349410100000000000A00000044545F454D495353414F01
      00000000000D00000044545F56454E43494D454E544F01000000000015000000
      434F445F434F4E54415F524543454245525F434142010000000000}
    Master = QBorderoCab
    MasterFields = 'COD_BORDERO'
    DetailFields = 'COD_BORDERO'
    Session = DMOracle.DBCemapa
    Left = 112
    Top = 232
    object QBorderoItemNUM_TITULO: TFloatField
      FieldName = 'NUM_TITULO'
    end
    object QBorderoItemNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object QBorderoItemVAL_ORIGINAL: TFloatField
      FieldName = 'VAL_ORIGINAL'
      DisplayFormat = '#,##0.00'
    end
    object QBorderoItemNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QBorderoItemDESC_BANCO_AGENCIA: TStringField
      FieldName = 'DESC_BANCO_AGENCIA'
      Size = 30
    end
    object QBorderoItemDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QBorderoItemDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
      Required = True
    end
    object QBorderoItemCOD_CONTA_RECEBER_CAB: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_CAB'
      Required = True
    end
  end
  object DSBorderoItem: TDataSource
    DataSet = QBorderoItem
    Left = 192
    Top = 232
  end
  object QBorderoCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      #9'B.COD_BORDERO,'
      #9'B.VAL_JUROS,'
      #9'B.DT_BORDERO,'
      #9'C.DESC_CONTA_CORRENTE'
      'FROM '
      #9'TB_BORDERO B INNER JOIN TB_CONTA_CORRENTE C'
      #9'ON B.COD_CONTA_CORRENTE = C.COD_CONTA_CORRENTE'
      'WHERE'
      #9'B.DT_BORDERO BETWEEN :DT_INICIAL AND :DT_FINAL'
      #9'AND'
      #9'(:CONTA_CORRENTE IS NULL OR'
      #9'B.COD_CONTA_CORRENTE = :CONTA_CORRENTE)'
      'ORDER BY B.DT_BORDERO')
    Variables.Data = {
      03000000030000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C00000000000000000000000F000000
      3A434F4E54415F434F5252454E5445030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000B000000434F445F424F524445524F010000000000090000
      0056414C5F4A55524F530100000000000A00000044545F424F524445524F0100
      0000000013000000444553435F434F4E54415F434F5252454E54450100000000
      00}
    Session = DMOracle.DBCemapa
    Left = 32
    Top = 288
    object QBorderoConsCOD_BORDERO: TIntegerField
      FieldName = 'COD_BORDERO'
      Required = True
    end
    object QBorderoConsVAL_JUROS: TFloatField
      FieldName = 'VAL_JUROS'
    end
    object QBorderoConsDT_BORDERO: TDateTimeField
      FieldName = 'DT_BORDERO'
      Required = True
    end
    object QBorderoConsDESC_CONTA_CORRENTE: TStringField
      FieldName = 'DESC_CONTA_CORRENTE'
      Size = 30
    end
  end
end
