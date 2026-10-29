object DMTEF: TDMTEF
  OldCreateOrder = False
  Left = 698
  Top = 131
  Height = 170
  Width = 336
  object QTefCab: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_TEF_CAB.*'
      'FROM'
      '  TB_TEF_CAB'
      'WHERE'
      '  TB_TEF_CAB.cod_nota_cab = :PK or'
      '  TB_TEF_CAB.COD_VALE_PRESENTE = :COD_VALE_PRESENTE'
      '')
    Variables.Data = {
      0300000002000000030000003A504B030000000000000000000000120000003A
      434F445F56414C455F50524553454E5445050000000000000000000000}
    SequenceField.Field = 'COD_TEF_CAB'
    SequenceField.Sequence = 'SQTEF_CAB'
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      04000000080000000C000000434F445F4E4F54415F4341420100000000000800
      00004E554D5F4E4F54410100000000000B000000434F445F5445465F43414201
      00000000000800000056414C5F4E4F54410100000000000A000000494E445F53
      54415455530100000000000D000000444553435F5445524D494E414C01000000
      000011000000434F445F56414C455F50524553454E54450100000000000A0000
      0044545F454D495353414F010000000000}
    RefreshOptions = [roBeforeEdit, roAllFields]
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 8
    object QTefCabCOD_TEF_CAB: TIntegerField
      FieldName = 'COD_TEF_CAB'
      Required = True
    end
    object QTefCabCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QTefCabNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
    end
    object QTefCabVAL_NOTA: TFloatField
      FieldName = 'VAL_NOTA'
    end
    object QTefCabIND_STATUS: TStringField
      FieldName = 'IND_STATUS'
      Size = 8
    end
    object QTefCabDESC_TERMINAL: TStringField
      FieldName = 'DESC_TERMINAL'
      Size = 8
    end
    object QTefCabCOD_VALE_PRESENTE: TIntegerField
      FieldName = 'COD_VALE_PRESENTE'
    end
    object QTefCabDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
  end
  object QTefPgto: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  COD_TEF_PGTO,'
      '  COD_TEF_CAB,    '
      '  NSU,            '
      '  VAL_PGTO,'
      '  DESC_REDE_AUTORIZADORA,       '
      '  DESC_BANDEIRA_CARTAO'
      'FROM'
      '  TB_TEF_PGTO'
      'where cod_tef_cab = :cod_tef_cab')
    Variables.Data = {
      03000000010000000C0000003A434F445F5445465F4341420300000000000000
      00000000}
    SequenceField.Field = 'COD_TEF_PGTO'
    SequenceField.Sequence = 'SQTEF_PGTO'
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      04000000060000000B000000434F445F5445465F4341420100000000000C0000
      00434F445F5445465F5047544F010000000000030000004E5355010000000000
      0800000056414C5F5047544F01000000000016000000444553435F524544455F
      4155544F52495A41444F524101000000000014000000444553435F42414E4445
      4952415F43415254414F010000000000}
    Master = QTefCab
    MasterFields = 'COD_TEF_CAB'
    DetailFields = 'COD_TEF_CAB'
    RefreshOptions = [roBeforeEdit, roAllFields]
    Session = DMOracle.DBCemapa
    Left = 136
    Top = 8
    object QTefPgtoCOD_TEF_PGTO: TIntegerField
      FieldName = 'COD_TEF_PGTO'
      Required = True
    end
    object QTefPgtoCOD_TEF_CAB: TIntegerField
      FieldName = 'COD_TEF_CAB'
      Required = True
    end
    object QTefPgtoVAL_PGTO: TFloatField
      FieldName = 'VAL_PGTO'
    end
    object QTefPgtoDESC_REDE_AUTORIZADORA: TStringField
      FieldName = 'DESC_REDE_AUTORIZADORA'
      Size = 5
    end
    object QTefPgtoDESC_BANDEIRA_CARTAO: TStringField
      FieldName = 'DESC_BANDEIRA_CARTAO'
      Size = 5
    end
    object QTefPgtoNSU: TStringField
      FieldName = 'NSU'
    end
  end
  object QTefCabPendente: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_TEF_CAB.*'
      'FROM'
      '  TB_TEF_CAB'
      'WHERE'
      
        '  TB_TEF_CAB.DESC_TERMINAL = :DESC_TERMINAL AND TB_TEF_CAB.IND_S' +
        'TATUS = :IND_STATUS'
      '')
    Variables.Data = {
      03000000020000000E0000003A444553435F5445524D494E414C050000000000
      0000000000000B0000003A494E445F5354415455530500000000000000000000
      00}
    SequenceField.Field = 'COD_TEF_CAB'
    SequenceField.Sequence = 'SQTEF_CAB'
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      04000000080000000C000000434F445F4E4F54415F4341420100000000000800
      00004E554D5F4E4F54410100000000000B000000434F445F5445465F43414201
      00000000000800000056414C5F4E4F54410100000000000A000000494E445F53
      54415455530100000000000D000000444553435F5445524D494E414C01000000
      000011000000434F445F56414C455F50524553454E54450100000000000A0000
      0044545F454D495353414F010000000000}
    RefreshOptions = [roBeforeEdit, roAllFields]
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 56
    object QTefCabPendenteCOD_TEF_CAB: TIntegerField
      FieldName = 'COD_TEF_CAB'
      Required = True
    end
    object QTefCabPendenteCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QTefCabPendenteNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
    end
    object QTefCabPendenteVAL_NOTA: TFloatField
      FieldName = 'VAL_NOTA'
    end
    object QTefCabPendenteIND_STATUS: TStringField
      FieldName = 'IND_STATUS'
      Size = 8
    end
    object QTefCabPendenteDESC_TERMINAL: TStringField
      FieldName = 'DESC_TERMINAL'
      Size = 8
    end
    object QTefCabPendenteCOD_VALE_PRESENTE: TIntegerField
      FieldName = 'COD_VALE_PRESENTE'
    end
    object QTefCabPendenteDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
  end
  object QTefPgtoPendente: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_TEF_PGTO.*'
      'FROM'
      '  TB_TEF_PGTO'
      'where cod_tef_cab = :cod_tef_cab')
    Variables.Data = {
      03000000010000000C0000003A434F445F5445465F4341420300000000000000
      00000000}
    SequenceField.Field = 'COD_TEF_PGTO'
    SequenceField.Sequence = 'SQTEF_PGTO'
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      04000000060000000B000000434F445F5445465F4341420100000000000C0000
      00434F445F5445465F5047544F010000000000030000004E5355010000000000
      0800000056414C5F5047544F01000000000016000000444553435F524544455F
      4155544F52495A41444F524101000000000014000000444553435F42414E4445
      4952415F43415254414F010000000000}
    Master = QTefCabPendente
    MasterFields = 'COD_TEF_CAB'
    DetailFields = 'COD_TEF_CAB'
    RefreshOptions = [roBeforeEdit, roAllFields]
    Session = DMOracle.DBCemapa
    Left = 136
    Top = 56
    object QTefPgtoPendenteCOD_TEF_PGTO: TIntegerField
      FieldName = 'COD_TEF_PGTO'
      Required = True
    end
    object QTefPgtoPendenteCOD_TEF_CAB: TIntegerField
      FieldName = 'COD_TEF_CAB'
      Required = True
    end
    object QTefPgtoPendenteVAL_PGTO: TFloatField
      FieldName = 'VAL_PGTO'
    end
    object QTefPgtoPendenteDESC_REDE_AUTORIZADORA: TStringField
      FieldName = 'DESC_REDE_AUTORIZADORA'
      Size = 5
    end
    object QTefPgtoPendenteDESC_BANDEIRA_CARTAO: TStringField
      FieldName = 'DESC_BANDEIRA_CARTAO'
      Size = 5
    end
    object QTefPgtoPendenteNSU: TStringField
      FieldName = 'NSU'
    end
  end
  object QPagamento: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      #9'TB_PAGAMENTO.*'
      'FROM'
      #9'TB_PAGAMENTO'
      'WHERE'
      #9'TB_PAGAMENTO.COD_NOTA_CAB = :COD_NOTA_CAB AND '
      
        #9'TB_PAGAMENTO.DESC_PAGAMENTO IN ('#39'Cart'#227'o de Cr'#233'dito'#39', '#39'Cart'#227'o de' +
        ' D'#233'bito'#39')'
      'ORDER BY'
      #9'COD_PAGAMENTO'
      '')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    SequenceField.Field = 'COD_PAGAMENTO'
    SequenceField.Sequence = 'SQPAGAMENTO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000090000000C000000434F445F4E4F54415F4341420100000000000D00
      0000434F445F504147414D454E544F0100000000000E000000444553435F5041
      47414D454E544F0100000000000D00000056414C5F504147414D454E544F0100
      000000000900000056414C5F56414C4F520100000000000D000000444553435F
      484153485F4D443501000000000017000000434F445F504147414D454E544F5F
      4553544F524E41444F0100000000000B000000494E445F4553544F524E4F0100
      000000000C000000434F445F5445465F5047544F010000000000}
    Master = QTefCab
    MasterFields = 'COD_NOTA_CAB'
    Session = DMOracle.DBCemapa
    AfterInsert = QPagamentoAfterInsert
    Left = 232
    Top = 11
    object QPagamentoCOD_PAGAMENTO: TIntegerField
      FieldName = 'COD_PAGAMENTO'
      Required = True
    end
    object QPagamentoCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QPagamentoVAL_PAGAMENTO: TFloatField
      FieldName = 'VAL_PAGAMENTO'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QPagamentoVAL_VALOR: TFloatField
      FieldName = 'VAL_VALOR'
    end
    object QPagamentoCOD_PAGAMENTO_ESTORNADO: TIntegerField
      FieldName = 'COD_PAGAMENTO_ESTORNADO'
    end
    object QPagamentoIND_ESTORNO: TStringField
      FieldName = 'IND_ESTORNO'
      KeyFields = 'IND_ESTORNO'
      Size = 1
    end
    object QPagamentoCOD_TEF_PGTO: TIntegerField
      FieldName = 'COD_TEF_PGTO'
    end
    object QPagamentoDESC_PAGAMENTO: TStringField
      FieldName = 'DESC_PAGAMENTO'
      Required = True
      Size = 30
    end
  end
end
