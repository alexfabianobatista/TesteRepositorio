object DMOs: TDMOs
  OldCreateOrder = False
  Left = 758
  Top = 195
  Height = 444
  Width = 509
  object QOSCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_OS.NUM_OS,'
      '  TB_OS.COD_MECANICO,'
      '  TB_OS.COD_CADASTRO,'
      '  TB_OS.COD_VENDEDOR,'
      '  TB_CADASTRO.NOME,'
      '  TB_OS.NUM_CHASSI,'
      '  TB_VEICULO.NUM_PLACA,'
      '  TB_VEICULO.DESC_COR,'
      '  TB_VEICULO.NUM_ANO,'
      '  TB_OS.IND_SITUACAO,'
      '  TB_OS.IND_CONDICAO_PAGTO,'
      '  TB_OS.IND_TIPO_OS,'
      '  TB_OS.DT_EMISSAO,'
      '  TB_OS.DT_ENTRADA,'
      '  TB_OS.DT_PREVISAOSAIDA,'
      '  TB_OS.COD_FILIAL,'
      '  TB_OS.NUM_KM,'
      '  TB_OS.DESC_SERVICO'
      'FROM'
      '  TB_OS,'
      '  TB_CADASTRO,'
      '  TB_VEICULO'
      'WHERE'
      '  (TB_CADASTRO.COD_CADASTRO = TB_OS.COD_CADASTRO)'
      '  AND'
      '  (TB_VEICULO.NUM_CHASSI(+) = TB_OS.NUM_CHASSI)'
      '  AND'
      '  (:NUM_CHASSI IS NULL'
      '  OR'
      '  TB_OS.NUM_CHASSI LIKE :NUM_CHASSI)'
      '  AND'
      '  (:COD_CADASTRO IS NULL'
      '  OR'
      '  TB_OS.COD_CADASTRO = :COD_CADASTRO)'
      '  AND'
      '  (:NUM_PLACA IS NULL'
      '  OR'
      '  TB_VEICULO.NUM_PLACA LIKE :NUM_PLACA)'
      '  AND'
      '  (:IND_SITUACAO IS NULL'
      '  OR'
      '  TB_OS.IND_SITUACAO = :IND_SITUACAO)'
      '  AND'
      '  (:NUM_OS IS NULL'
      '  OR'
      '  TB_OS.NUM_OS = :NUM_OS)'
      '  AND'
      '  (:NUM_MOTOR IS NULL'
      '  OR'
      '  TB_VEICULO.NUM_MOTOR LIKE '#39'%'#39' || :NUM_MOTOR || '#39'%'#39')'
      '  AND'
      '  (:NUM_SERIE IS NULL'
      '  OR'
      '  TB_VEICULO.NUM_SERIE LIKE '#39'%'#39' || :NUM_SERIE || '#39'%'#39')'
      'ORDER BY'
      '  TB_OS.DT_EMISSAO DESC, TB_OS.COD_CADASTRO')
    Variables.Data = {
      03000000070000000B0000003A4E554D5F434841535349050000000000000000
      0000000D0000003A434F445F434144415354524F030000000000000000000000
      0A0000003A4E554D5F504C4143410500000000000000000000000D0000003A49
      4E445F534954554143414F050000000000000000000000070000003A4E554D5F
      4F530300000000000000000000000A0000003A4E554D5F4D4F544F5205000000
      00000000000000000A0000003A4E554D5F534552494505000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      0400000012000000060000004E554D5F4F530100000000000C000000434F445F
      4D4543414E49434F0100000000000C000000434F445F434144415354524F0100
      00000000040000004E4F4D450100000000000A0000004E554D5F434841535349
      010000000000090000004E554D5F504C4143410100000000000C000000494E44
      5F534954554143414F01000000000012000000494E445F434F4E444943414F5F
      504147544F0100000000000B000000494E445F5449504F5F4F53010000000000
      0A00000044545F454D495353414F0100000000000A00000044545F454E545241
      44410100000000001000000044545F505245564953414F534149444101000000
      00000C000000434F445F56454E4445444F520100000000000A000000434F445F
      46494C49414C010000000000060000004E554D5F4B4D01000000000008000000
      444553435F434F52010000000000070000004E554D5F414E4F0100000000000C
      000000444553435F5345525649434F010000000000}
    ReadOnly = True
    QueryAllRecords = False
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 64
    object QOSConsNUM_OS: TIntegerField
      FieldName = 'NUM_OS'
      Required = True
    end
    object QOSConsCOD_MECANICO: TIntegerField
      FieldName = 'COD_MECANICO'
    end
    object QOSConsCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QOSConsCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object QOSConsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QOSConsNUM_CHASSI: TStringField
      FieldName = 'NUM_CHASSI'
      Required = True
    end
    object QOSConsNUM_PLACA: TStringField
      FieldName = 'NUM_PLACA'
    end
    object QOSConsDESC_COR: TStringField
      FieldName = 'DESC_COR'
    end
    object QOSConsNUM_ANO: TIntegerField
      FieldName = 'NUM_ANO'
    end
    object QOSConsIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Required = True
      Size = 1
    end
    object QOSConsIND_CONDICAO_PAGTO: TIntegerField
      FieldName = 'IND_CONDICAO_PAGTO'
      Required = True
    end
    object QOSConsIND_TIPO_OS: TIntegerField
      FieldName = 'IND_TIPO_OS'
      Required = True
    end
    object QOSConsDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QOSConsDT_ENTRADA: TDateTimeField
      FieldName = 'DT_ENTRADA'
      Required = True
    end
    object QOSConsDT_PREVISAOSAIDA: TDateTimeField
      FieldName = 'DT_PREVISAOSAIDA'
      Required = True
    end
    object QOSConsCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QOSConsNUM_KM: TIntegerField
      FieldName = 'NUM_KM'
      Required = True
    end
    object QOSConsDESC_SERVICO: TStringField
      FieldName = 'DESC_SERVICO'
      Required = True
      Size = 900
    end
  end
  object QOSCad: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '   ROWID,'
      '  TB_OS.*'
      'FROM  TB_OS'
      'WHERE  NUM_OS =  :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'NUM_OS'
    SequenceField.Sequence = 'SQOS'
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      040000002F000000060000004E554D5F4F530100000000000A000000434F445F
      46494C49414C0100000000000C000000434F445F56454E4445444F5201000000
      00000C000000434F445F4D4543414E49434F0100000000000C000000434F445F
      434144415354524F0100000000000A0000004E554D5F43484153534901000000
      00000C000000494E445F534954554143414F01000000000012000000494E445F
      434F4E444943414F5F504147544F0100000000000B000000494E445F5449504F
      5F4F530100000000000A00000044545F454D495353414F0100000000000A0000
      0044545F454E54524144410100000000001000000044545F505245564953414F
      53414944410100000000000800000044545F53414944410100000000000E0000
      0044545F4C494D495445484F5241530100000000000F000000434F445F4D4F54
      49564F5F43414E430100000000000C000000444553435F5345525649434F0100
      000000000A00000048525F454E54524144410100000000001000000048525F50
      5245564953544153414944410100000000000800000048525F53414944410100
      000000001500000056414C5F4C494D4954455F5245515549534943414F010000
      000000060000004E554D5F4B4D0100000000000A0000004E554D5F544954554C
      4F0100000000001200000056414C5F4E465F4D414F5F44455F4F425241010000
      0000001700000056414C5F4E465F5345525649434F5F544552434549524F0100
      000000000C00000056414C5F4E465F5045434153010000000000140000005641
      4C5F4E465F50454341535F4953454E5441530100000000000D00000044545F46
      454348414D454E544F0100000000001800000056414C5F4E465F534552564943
      4F5F43484150454143414F0100000000001300000056414C5F4E465F4D414F5F
      44455F4F425241320100000000001800000056414C5F4E465F5345525649434F
      5F544552434549524F320100000000000D00000056414C5F4E465F5045434153
      320100000000001500000056414C5F4E465F50454341535F4953454E54415332
      0100000000001900000056414C5F4E465F5345525649434F5F43484150454143
      414F320100000000001700000056414C5F4E465F5345525649434F5F454C4554
      5249434F0100000000001800000056414C5F4E465F5345525649434F5F454C45
      545249434F320100000000000C000000434F445F4F5045524143414F01000000
      00000C000000434F445F4D454E534147454D0100000000000C00000056414C5F
      444553434F4E544F0100000000000C000000434F445F4E4F54415F4341420100
      000000000F000000494E445F56495354415F5052415A4F0100000000000F0000
      00494E445F4E41545552455A415F4F5301000000000011000000494E445F4341
      4D504F5F4F464943494E410100000000001000000056414C5F4E465F4C4F434F
      4D4F43414F0100000000001100000056414C5F4E465F4C4F434F4D4F43414F32
      01000000000010000000444553435F534F4C494349544143414F010000000000
      09000000434F445F534552494501000000000006000000434F445F4F53010000
      000000}
    Session = DMOracle.DBCemapa
    AfterInsert = QOSCadAfterInsert
    BeforeEdit = QOSCadBeforeEdit
    BeforePost = QOSCadBeforePost
    OnCalcFields = QOSCadCalcFields
    OnNewRecord = QOSCadNewRecord
    Left = 24
    Top = 8
    object QOSCadCOD_OS: TIntegerField
      FieldName = 'COD_OS'
    end
    object QOSCadNUM_OS: TIntegerField
      FieldName = 'NUM_OS'
      Required = True
    end
    object QOSCadCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QOSCadCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object QOSCadCOD_MECANICO: TIntegerField
      FieldName = 'COD_MECANICO'
    end
    object QOSCadCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QOSCadNUM_CHASSI: TStringField
      FieldName = 'NUM_CHASSI'
      Required = True
    end
    object QOSCadIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Required = True
      Size = 1
    end
    object QOSCadIND_CONDICAO_PAGTO: TIntegerField
      FieldName = 'IND_CONDICAO_PAGTO'
      Required = True
    end
    object QOSCadIND_TIPO_OS: TIntegerField
      FieldName = 'IND_TIPO_OS'
      Required = True
    end
    object QOSCadDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QOSCadDT_ENTRADA: TDateTimeField
      FieldName = 'DT_ENTRADA'
      Required = True
    end
    object QOSCadDT_PREVISAOSAIDA: TDateTimeField
      FieldName = 'DT_PREVISAOSAIDA'
      Required = True
    end
    object QOSCadDT_SAIDA: TDateTimeField
      FieldName = 'DT_SAIDA'
    end
    object QOSCadDT_LIMITEHORAS: TStringField
      FieldName = 'DT_LIMITEHORAS'
      Required = True
      Size = 6
    end
    object QOSCadCOD_MOTIVO_CANC: TIntegerField
      FieldName = 'COD_MOTIVO_CANC'
    end
    object QOSCadDESC_SERVICO: TStringField
      FieldName = 'DESC_SERVICO'
      Required = True
      Size = 900
    end
    object QOSCadVAL_LIMITE_REQUISICAO: TFloatField
      FieldName = 'VAL_LIMITE_REQUISICAO'
      Required = True
    end
    object QOSCadHR_ENTRADA: TStringField
      FieldName = 'HR_ENTRADA'
      Size = 5
    end
    object QOSCadHR_PREVISTASAIDA: TStringField
      FieldName = 'HR_PREVISTASAIDA'
      Size = 5
    end
    object QOSCadHR_SAIDA: TStringField
      FieldName = 'HR_SAIDA'
      Size = 5
    end
    object QOSCadNUM_KM: TIntegerField
      FieldName = 'NUM_KM'
      Required = True
    end
    object QOSCadNUM_TITULO: TIntegerField
      FieldName = 'NUM_TITULO'
    end
    object QOSCadVAL_NF_MAO_DE_OBRA: TFloatField
      FieldName = 'VAL_NF_MAO_DE_OBRA'
    end
    object QOSCadVAL_NF_SERVICO_TERCEIRO: TFloatField
      FieldName = 'VAL_NF_SERVICO_TERCEIRO'
    end
    object QOSCadVAL_NF_PECAS: TFloatField
      FieldName = 'VAL_NF_PECAS'
    end
    object QOSCadVAL_NF_PECAS_ISENTAS: TFloatField
      FieldName = 'VAL_NF_PECAS_ISENTAS'
    end
    object QOSCadDT_FECHAMENTO: TDateTimeField
      FieldName = 'DT_FECHAMENTO'
    end
    object QOSCadVAL_NF_SERVICO_CHAPEACAO: TFloatField
      FieldName = 'VAL_NF_SERVICO_CHAPEACAO'
    end
    object QOSCadVAL_NF_MAO_DE_OBRA2: TFloatField
      FieldName = 'VAL_NF_MAO_DE_OBRA2'
    end
    object QOSCadVAL_NF_SERVICO_TERCEIRO2: TFloatField
      FieldName = 'VAL_NF_SERVICO_TERCEIRO2'
    end
    object QOSCadVAL_NF_PECAS2: TFloatField
      FieldName = 'VAL_NF_PECAS2'
    end
    object QOSCadVAL_NF_PECAS_ISENTAS2: TFloatField
      FieldName = 'VAL_NF_PECAS_ISENTAS2'
    end
    object QOSCadVAL_NF_SERVICO_CHAPEACAO2: TFloatField
      FieldName = 'VAL_NF_SERVICO_CHAPEACAO2'
    end
    object QOSCadVAL_NF_SERVICO_ELETRICO: TFloatField
      FieldName = 'VAL_NF_SERVICO_ELETRICO'
    end
    object QOSCadVAL_NF_SERVICO_ELETRICO2: TFloatField
      FieldName = 'VAL_NF_SERVICO_ELETRICO2'
    end
    object QOSCadCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
    end
    object QOSCadCOD_MENSAGEM: TIntegerField
      FieldName = 'COD_MENSAGEM'
    end
    object QOSCadVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
    end
    object QOSCadCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QOSCadIND_VISTA_PRAZO: TIntegerField
      FieldName = 'IND_VISTA_PRAZO'
    end
    object QOSCadIND_NATUREZA_OS: TStringField
      FieldName = 'IND_NATUREZA_OS'
    end
    object QOSCadIND_CAMPO_OFICINA: TStringField
      FieldName = 'IND_CAMPO_OFICINA'
      Size = 1
    end
    object QOSCadVAL_NF_LOCOMOCAO: TFloatField
      FieldName = 'VAL_NF_LOCOMOCAO'
    end
    object QOSCadVAL_NF_LOCOMOCAO2: TFloatField
      FieldName = 'VAL_NF_LOCOMOCAO2'
    end
    object QOSCadDESC_SOLICITACAO: TStringField
      FieldName = 'DESC_SOLICITACAO'
      Size = 60
    end
    object QOSCadCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Size = 3
    end
    object QOSCadnome_cadastro: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome_cadastro'
      Size = 50
      Calculated = True
    end
    object QOSCaddesc_filial: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_filial'
      Size = 50
      Calculated = True
    end
    object QOSCadnome_vendedor: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome_vendedor'
      Size = 50
      Calculated = True
    end
    object QOSCadnome_mecanico: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome_mecanico'
      Size = 50
      Calculated = True
    end
    object QOSCaddesc_tipo_os: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_tipo_os'
      Size = 50
      Calculated = True
    end
    object QOSCaddesc_caracteristica: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_caracteristica'
      Size = 50
      Calculated = True
    end
  end
end
