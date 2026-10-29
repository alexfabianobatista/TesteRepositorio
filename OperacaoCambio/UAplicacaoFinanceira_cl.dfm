object DMAplicacaoFinanceira: TDMAplicacaoFinanceira
  OldCreateOrder = False
  Left = 283
  Top = 167
  Height = 216
  Width = 454
  object QAplicacaoFinanceira: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_APLICACAO_FINANCEIRA.*'
      'FROM'
      '  TB_APLICACAO_FINANCEIRA'
      'WHERE'
      '  COD_APLICACAO_FINANCEIRA = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_APLICACAO_FINANCEIRA'
    SequenceField.Sequence = 'SQAPLICACAOFINANCEIRA'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000D00000018000000434F445F41504C49434143414F5F46494E414E43
      4549524101000000000009000000434F445F42414E434F010000000000120000
      00434F445F434F4E54415F434F5252454E54450100000000000D000000434F44
      5F484953544F5249434F0100000000000C00000044545F41504C49434143414F
      0100000000000D00000044545F56454E43494D454E544F010000000000090000
      00444553435F544158410100000000000C00000056414C5F41504C494341444F
      0100000000000C00000056414C5F4F524947494E414C0100000000000A000000
      434F445F46494C49414C01000000000010000000434F445F444550415254414D
      454E544F0100000000000A0000004E554D5F544954554C4F0100000000000800
      00004E554D5F434F5441010000000000}
    Session = DMOracle.DBCemapa
    AfterInsert = QAplicacaoFinanceiraAfterInsert
    BeforePost = QAplicacaoFinanceiraBeforePost
    AfterPost = QAplicacaoFinanceiraAfterPost
    BeforeDelete = QAplicacaoFinanceiraBeforeDelete
    Left = 48
    Top = 16
    object QAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA: TIntegerField
      FieldName = 'COD_APLICACAO_FINANCEIRA'
      Required = True
    end
    object QAplicacaoFinanceiraCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
      Required = True
    end
    object QAplicacaoFinanceiraCOD_CONTA_CORRENTE: TIntegerField
      FieldName = 'COD_CONTA_CORRENTE'
      Required = True
    end
    object QAplicacaoFinanceiraCOD_HISTORICO: TIntegerField
      FieldName = 'COD_HISTORICO'
      Required = True
    end
    object QAplicacaoFinanceiraDT_APLICACAO: TDateTimeField
      FieldName = 'DT_APLICACAO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QAplicacaoFinanceiraDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QAplicacaoFinanceiraDESC_TAXA: TStringField
      FieldName = 'DESC_TAXA'
      Required = True
      Size = 10
    end
    object QAplicacaoFinanceiraVAL_APLICADO: TFloatField
      FieldName = 'VAL_APLICADO'
      Required = True
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object QAplicacaoFinanceiraVAL_ORIGINAL: TFloatField
      FieldName = 'VAL_ORIGINAL'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QAplicacaoFinanceiraCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
      Required = True
    end
    object QAplicacaoFinanceiraNUM_TITULO: TFloatField
      FieldName = 'NUM_TITULO'
    end
    object QAplicacaoFinanceiraCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QAplicacaoFinanceiraNUM_COTA: TFloatField
      FieldName = 'NUM_COTA'
      DisplayFormat = '#,####0.0000'
      EditFormat = '#,####0.0000'
    end
  end
  object QAplicacaoFinanceiraCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_APLICACAO_FINANCEIRA.COD_APLICACAO_FINANCEIRA,'
      '  TB_APLICACAO_FINANCEIRA.COD_HISTORICO,'
      '  TB_APLICACAO_FINANCEIRA.COD_CONTA_CORRENTE,'
      '  TB_APLICACAO_FINANCEIRA.DT_APLICACAO,'
      '  TB_APLICACAO_FINANCEIRA.VAL_ORIGINAL,'
      '  TB_APLICACAO_FINANCEIRA.VAL_APLICADO,'
      '  TB_APLICACAO_FINANCEIRA.COD_DEPARTAMENTO,'
      '  TB_APLICACAO_FINANCEIRA.DESC_TAXA,'
      '  TB_APLICACAO_FINANCEIRA.DT_VENCIMENTO,'
      '  TB_CONTA_CORRENTE.DESC_CONTA_CORRENTE,'
      '  TB_BANCO_AGENCIA.DESC_BANCO_AGENCIA,'
      '  TB_APLICACAO_FINANCEIRA.NUM_TITULO,'
      '  TB_CONTA_CORRENTE.NUM_CONTA_CORRENTE'
      'FROM'
      '  TB_APLICACAO_FINANCEIRA,'
      '  TB_CONTA_CORRENTE,'
      '  TB_BANCO_AGENCIA  '
      'WHERE'
      
        '  TB_CONTA_CORRENTE.COD_BANCO_AGENCIA = TB_BANCO_AGENCIA.COD_BAN' +
        'CO_AGENCIA'
      '  AND'
      
        '  TB_APLICACAO_FINANCEIRA.COD_CONTA_CORRENTE = TB_CONTA_CORRENTE' +
        '.COD_CONTA_CORRENTE     '
      '  AND'
      '  (:DEPARTAMENTO IS NULL'
      '   OR'
      '    TB_APLICACAO_FINANCEIRA.COD_DEPARTAMENTO =:DEPARTAMENTO)'
      '  AND'
      '  (:HISTORICO IS NULL'
      '   OR'
      '    TB_APLICACAO_FINANCEIRA.COD_HISTORICO =:HISTORICO)'
      '  AND'
      '  (:CONTA_CORRENTE IS NULL'
      '   OR'
      
        '    TB_APLICACAO_FINANCEIRA.COD_CONTA_CORRENTE =:CONTA_CORRENTE)' +
        '  '
      '  AND'
      '  (:DT_APLICACAO_I IS NULL'
      '   OR'
      '    TB_APLICACAO_FINANCEIRA.DT_APLICACAO >=:DT_APLICACAO_I)'
      '  AND'
      '  (:DT_APLICACAO_F IS NULL'
      '   OR'
      '    TB_APLICACAO_FINANCEIRA.DT_APLICACAO <=:DT_APLICACAO_F)'
      '  AND'
      '  (:DT_VENCIMENTO_I IS NULL'
      '   OR'
      '    TB_APLICACAO_FINANCEIRA.DT_VENCIMENTO >=:DT_VENCIMENTO_I)'
      '  AND'
      '  (:DT_VENCIMENTO_F IS NULL'
      '   OR'
      '    TB_APLICACAO_FINANCEIRA.DT_VENCIMENTO <=:DT_VENCIMENTO_F)'
      ''
      '  ')
    Variables.Data = {
      03000000070000000D0000003A444550415254414D454E544F03000000000000
      00000000000A0000003A484953544F5249434F0300000000000000000000000F
      0000003A434F4E54415F434F5252454E54450300000000000000000000000F00
      00003A44545F41504C49434143414F5F490C00000000000000000000000F0000
      003A44545F41504C49434143414F5F460C000000000000000000000010000000
      3A44545F56454E43494D454E544F5F490C000000000000000000000010000000
      3A44545F56454E43494D454E544F5F460C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E00000018000000434F445F41504C49434143414F5F46494E414E43
      4549524101000000000012000000434F445F434F4E54415F434F5252454E5445
      0100000000000D000000434F445F484953544F5249434F0100000000000C0000
      0044545F41504C49434143414F0100000000000D00000044545F56454E43494D
      454E544F01000000000009000000444553435F544158410100000000000C0000
      0056414C5F41504C494341444F0100000000000C00000056414C5F4F52494749
      4E414C0100000000000A000000434F445F46494C49414C010000000000100000
      00434F445F444550415254414D454E544F01000000000013000000444553435F
      434F4E54415F434F5252454E544501000000000012000000444553435F42414E
      434F5F4147454E4349410100000000000A0000004E554D5F544954554C4F0100
      00000000120000004E554D5F434F4E54415F434F5252454E5445010000000000}
    Session = DMOracle.DBCemapa
    Left = 56
    Top = 80
    object QAplicacaoFinanceiraConsCOD_APLICACAO_FINANCEIRA: TIntegerField
      FieldName = 'COD_APLICACAO_FINANCEIRA'
      Required = True
    end
    object QAplicacaoFinanceiraConsDT_APLICACAO: TDateTimeField
      FieldName = 'DT_APLICACAO'
      Required = True
    end
    object QAplicacaoFinanceiraConsDESC_TAXA: TStringField
      FieldName = 'DESC_TAXA'
      Required = True
      Size = 10
    end
    object QAplicacaoFinanceiraConsVAL_APLICADO: TFloatField
      FieldName = 'VAL_APLICADO'
      Required = True
    end
    object QAplicacaoFinanceiraConsVAL_ORIGINAL: TFloatField
      FieldName = 'VAL_ORIGINAL'
      Required = True
    end
    object QAplicacaoFinanceiraConsDESC_CONTA_CORRENTE: TStringField
      FieldName = 'DESC_CONTA_CORRENTE'
      Size = 30
    end
    object QAplicacaoFinanceiraConsDESC_BANCO_AGENCIA: TStringField
      FieldName = 'DESC_BANCO_AGENCIA'
      Size = 30
    end
    object QAplicacaoFinanceiraConsCOD_HISTORICO: TIntegerField
      FieldName = 'COD_HISTORICO'
      Required = True
    end
    object QAplicacaoFinanceiraConsCOD_CONTA_CORRENTE: TIntegerField
      FieldName = 'COD_CONTA_CORRENTE'
      Required = True
    end
    object QAplicacaoFinanceiraConsCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
      Required = True
    end
    object QAplicacaoFinanceiraConsDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
      Required = True
    end
    object QAplicacaoFinanceiraConsNUM_TITULO: TFloatField
      FieldName = 'NUM_TITULO'
    end
    object QAplicacaoFinanceiraConsNUM_CONTA_CORRENTE: TStringField
      FieldName = 'NUM_CONTA_CORRENTE'
      Required = True
      Size = 12
    end
  end
  object QAplicacaoFinanceiraMov: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_APLICACAO_FINANCEIRA_MOV.*'
      'FROM '
      '  TB_APLICACAO_FINANCEIRA_MOV'
      'WHERE'
      '  TB_APLICACAO_FINANCEIRA_MOV.COD_APLICACAO_FINANCEIRA_MOV =:PK'
      ' ')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_APLICACAO_FINANCEIRA_MOV'
    SequenceField.Sequence = 'SQAPLICACAOFINANCEIRA_MOV'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000060000001C000000434F445F41504C49434143414F5F46494E414E43
      454952415F4D4F5601000000000018000000434F445F41504C49434143414F5F
      46494E414E43454952410100000000000D00000056414C5F4D4F56494D454E54
      4F0100000000000C00000044545F4D4F56494D454E544F0100000000000D0000
      00434F445F484953544F5249434F01000000000008000000494E445F5449504F
      010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 184
    Top = 16
    object QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA_MOV: TIntegerField
      FieldName = 'COD_APLICACAO_FINANCEIRA_MOV'
      Required = True
    end
    object QAplicacaoFinanceiraMovCOD_APLICACAO_FINANCEIRA: TIntegerField
      FieldName = 'COD_APLICACAO_FINANCEIRA'
      Required = True
    end
    object QAplicacaoFinanceiraMovVAL_MOVIMENTO: TFloatField
      FieldName = 'VAL_MOVIMENTO'
      Required = True
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object QAplicacaoFinanceiraMovDT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QAplicacaoFinanceiraMovCOD_HISTORICO: TIntegerField
      FieldName = 'COD_HISTORICO'
      Required = True
    end
    object QAplicacaoFinanceiraMovIND_TIPO: TStringField
      FieldName = 'IND_TIPO'
      Required = True
      Size = 10
    end
  end
  object DSAplicacaoFinanceiraMov: TDataSource
    DataSet = QAplicacaoFinanceiraMov
    Left = 184
    Top = 64
  end
  object QAplicacaoFinanceiraMovCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_APLICACAO_FINANCEIRA_MOV.COD_APLICACAO_FINANCEIRA_MOV,'
      '  TB_APLICACAO_FINANCEIRA_MOV.VAL_MOVIMENTO,'
      '  TB_APLICACAO_FINANCEIRA_MOV.DT_MOVIMENTO,'
      '  TB_APLICACAO_FINANCEIRA_MOV.COD_HISTORICO,'
      '  TB_HISTORICO.DESC_HISTORICO,'
      '  TB_APLICACAO_FINANCEIRA_MOV.IND_TIPO'
      'FROM'
      '  TB_APLICACAO_FINANCEIRA_MOV,'
      '  TB_HISTORICO'
      'WHERE'
      
        '  TB_APLICACAO_FINANCEIRA_MOV.COD_HISTORICO = TB_HISTORICO.COD_H' +
        'ISTORICO'
      '  AND'
      '  (:COD_APLICACAO IS NULL'
      '   OR'
      
        '    TB_APLICACAO_FINANCEIRA_MOV.COD_APLICACAO_FINANCEIRA =:COD_A' +
        'PLICACAO)'
      'ORDER BY'
      '  TB_APLICACAO_FINANCEIRA_MOV.DT_MOVIMENTO')
    Variables.Data = {
      03000000010000000E0000003A434F445F41504C49434143414F030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000001C000000434F445F41504C49434143414F5F46494E414E43
      454952415F4D4F560100000000000D00000056414C5F4D4F56494D454E544F01
      00000000000C00000044545F4D4F56494D454E544F0100000000000D00000043
      4F445F484953544F5249434F0100000000000E000000444553435F484953544F
      5249434F01000000000008000000494E445F5449504F010000000000}
    Session = DMOracle.DBCemapa
    Left = 328
    Top = 16
    object QAplicacaoFinanceiraMovConsCOD_APLICACAO_FINANCEIRA_MOV: TIntegerField
      FieldName = 'COD_APLICACAO_FINANCEIRA_MOV'
      Required = True
    end
    object QAplicacaoFinanceiraMovConsVAL_MOVIMENTO: TFloatField
      FieldName = 'VAL_MOVIMENTO'
      Required = True
    end
    object QAplicacaoFinanceiraMovConsDT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Required = True
    end
    object QAplicacaoFinanceiraMovConsCOD_HISTORICO: TIntegerField
      FieldName = 'COD_HISTORICO'
      Required = True
    end
    object QAplicacaoFinanceiraMovConsDESC_HISTORICO: TStringField
      FieldName = 'DESC_HISTORICO'
      Required = True
      Size = 30
    end
    object QAplicacaoFinanceiraMovConsIND_TIPO: TStringField
      FieldName = 'IND_TIPO'
      Required = True
      Size = 10
    end
  end
  object DSQAplicacaoFinanceiraMovCons: TDataSource
    DataSet = QAplicacaoFinanceiraMovCons
    Left = 320
    Top = 72
  end
  object QRAplicacaoFinanceira: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '  TB_APLICACAO_FINANCEIRA.*,'
      '  TB_HISTORICO.DESC_HISTORICO,'
      '  TB_BANCO_AGENCIA.DESC_BANCO_AGENCIA,'
      '  TB_DEPARTAMENTO.DESC_DEPARTAMENTO,'
      '  TB_CONTA_CORRENTE.DESC_CONTA_CORRENTE,'
      '  TB_FILIAL.DESC_FILIAL'
      'FROM'
      '  TB_APLICACAO_FINANCEIRA,'
      '  TB_FILIAL,'
      '  TB_HISTORICO,'
      '  TB_BANCO_AGENCIA,'
      '  TB_DEPARTAMENTO,'
      '  TB_CONTA_CORRENTE'
      'WHERE'
      '  TB_APLICACAO_FINANCEIRA.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      '  AND'
      
        '  TB_APLICACAO_FINANCEIRA.COD_HISTORICO = TB_HISTORICO.COD_HISTO' +
        'RICO'
      '  AND'
      
        '  TB_APLICACAO_FINANCEIRA.COD_BANCO = TB_BANCO_AGENCIA.COD_BANCO' +
        '_AGENCIA'
      '  AND'
      
        '  TB_APLICACAO_FINANCEIRA.COD_DEPARTAMENTO = TB_DEPARTAMENTO.COD' +
        '_DEPARTAMENTO'
      '  AND'
      
        '  TB_APLICACAO_FINANCEIRA.COD_CONTA_CORRENTE = TB_CONTA_CORRENTE' +
        '.COD_CONTA_CORRENTE'
      '  AND'
      '  (:FILIAL IS NULL'
      '   OR'
      '    TB_APLICACAO_FINANCEIRA.COD_FILIAL =:FILIAL)'
      '  AND'
      '  (:CONTA_CORRENTE IS NULL'
      '   OR'
      '    TB_APLICACAO_FINANCEIRA.COD_CONTA_CORRENTE =:CONTA_CORRENTE)'
      '  AND'
      '  (:HISTORICO IS NULL'
      '   OR'
      '    TB_APLICACAO_FINANCEIRA.COD_HISTORICO =:HISTORICO)'
      '  AND'
      '  (:DEPARTAMENTO IS NULL'
      '   OR'
      '    TB_APLICACAO_FINANCEIRA.COD_DEPARTAMENTO =:DEPARTAMENTO)'
      '  AND'
      '  :SITUACAO'
      '  AND'
      '  TB_APLICACAO_FINANCEIRA.DT_APLICACAO >= :DT_APLICACAO_I'
      '  AND'
      '  TB_APLICACAO_FINANCEIRA.DT_APLICACAO <= :DT_APLICACAO_F'
      '')
    Variables.Data = {
      0300000007000000070000003A46494C49414C0300000000000000000000000F
      0000003A434F4E54415F434F5252454E54450300000000000000000000000F00
      00003A44545F41504C49434143414F5F490C00000000000000000000000F0000
      003A44545F41504C49434143414F5F460C00000000000000000000000A000000
      3A484953544F5249434F0300000000000000000000000D0000003A4445504152
      54414D454E544F030000000000000000000000090000003A534954554143414F
      010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001100000018000000434F445F41504C49434143414F5F46494E414E43
      4549524101000000000009000000434F445F42414E434F010000000000120000
      00434F445F434F4E54415F434F5252454E54450100000000000D000000434F44
      5F484953544F5249434F0100000000000C00000044545F41504C49434143414F
      0100000000000D00000044545F56454E43494D454E544F010000000000090000
      00444553435F544158410100000000000C00000056414C5F41504C494341444F
      0100000000000C00000056414C5F4F524947494E414C01000000000010000000
      434F445F444550415254414D454E544F0100000000000A0000004E554D5F5449
      54554C4F0100000000000E000000444553435F484953544F5249434F01000000
      000012000000444553435F42414E434F5F4147454E4349410100000000001300
      0000444553435F434F4E54415F434F5252454E54450100000000001100000044
      4553435F444550415254414D454E544F0100000000000A000000434F445F4649
      4C49414C0100000000000B000000444553435F46494C49414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 328
    Top = 136
    object QRAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA: TIntegerField
      FieldName = 'COD_APLICACAO_FINANCEIRA'
      Required = True
    end
    object QRAplicacaoFinanceiraCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
      Required = True
    end
    object QRAplicacaoFinanceiraCOD_CONTA_CORRENTE: TIntegerField
      FieldName = 'COD_CONTA_CORRENTE'
      Required = True
    end
    object QRAplicacaoFinanceiraCOD_HISTORICO: TIntegerField
      FieldName = 'COD_HISTORICO'
      Required = True
    end
    object QRAplicacaoFinanceiraDT_APLICACAO: TDateTimeField
      FieldName = 'DT_APLICACAO'
      Required = True
    end
    object QRAplicacaoFinanceiraDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
      Required = True
    end
    object QRAplicacaoFinanceiraDESC_TAXA: TStringField
      FieldName = 'DESC_TAXA'
      Required = True
      Size = 10
    end
    object QRAplicacaoFinanceiraVAL_APLICADO: TFloatField
      FieldName = 'VAL_APLICADO'
      Required = True
    end
    object QRAplicacaoFinanceiraVAL_ORIGINAL: TFloatField
      FieldName = 'VAL_ORIGINAL'
      Required = True
    end
    object QRAplicacaoFinanceiraCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
      Required = True
    end
    object QRAplicacaoFinanceiraNUM_TITULO: TFloatField
      FieldName = 'NUM_TITULO'
      Required = True
    end
    object QRAplicacaoFinanceiraCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QRAplicacaoFinanceiraDESC_HISTORICO: TStringField
      FieldName = 'DESC_HISTORICO'
      Required = True
      Size = 30
    end
    object QRAplicacaoFinanceiraDESC_BANCO_AGENCIA: TStringField
      FieldName = 'DESC_BANCO_AGENCIA'
      Size = 30
    end
    object QRAplicacaoFinanceiraDESC_DEPARTAMENTO: TStringField
      FieldName = 'DESC_DEPARTAMENTO'
      Required = True
      Size = 30
    end
    object QRAplicacaoFinanceiraDESC_CONTA_CORRENTE: TStringField
      FieldName = 'DESC_CONTA_CORRENTE'
      Size = 30
    end
    object QRAplicacaoFinanceiraDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRAplicacaoFinanceiraNUM_COTA: TFloatField
      FieldName = 'NUM_COTA'
    end
  end
end
