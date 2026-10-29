object DMPremioExportacao: TDMPremioExportacao
  OldCreateOrder = False
  Left = 340
  Top = 235
  Height = 150
  Width = 267
  object QPremioExportacao: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_PREMIO_EXPORTACAO.*'
      'FROM'
      '  TB_PREMIO_EXPORTACAO'
      'WHERE'
      '  COD_PREMIO_EXPORTACAO = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_PREMIO_EXPORTACAO'
    SequenceField.Sequence = 'SQPREMIOEXPORTACAO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000001100000015000000434F445F5052454D494F5F4558504F5254414341
      4F0100000000000D000000444553435F434F4E545241544F0100000000000B00
      000044545F434F4E545241544F01000000000012000000434F445F434F4E5441
      5F434F5252454E54450100000000000900000056414C5F444F4C415201000000
      00000E00000056414C5F544158415F444F4C4152010000000000080000005641
      4C5F5245414C0100000000000C000000434F445F434144415354524F01000000
      00000A000000444553435F4E4156494F0100000000000B000000444553435F46
      41545552410100000000000D000000434F445F484953544F5249434F01000000
      000017000000434F445F4C414E43544F5F434F4E544142494C5F444542010000
      00000018000000434F445F4C414E43544F5F434F4E544142494C5F4352454401
      000000000010000000434F445F444550415254414D454E544F0100000000000B
      000000434F445F5553554152494F01000000000011000000434F445F42434F5F
      4D4F56494D454E544F0100000000000A000000434F445F46494C49414C010000
      000000}
    Session = DMOracle.DBCemapa
    BeforePost = QPremioExportacaoBeforePost
    Left = 40
    Top = 16
    object QPremioExportacaoCOD_PREMIO_EXPORTACAO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PREMIO_EXPORTACAO'
      Required = True
    end
    object QPremioExportacaoDESC_CONTRATO: TStringField
      DisplayLabel = 'Contrato'
      FieldName = 'DESC_CONTRATO'
      Required = True
      Size = 15
    end
    object QPremioExportacaoDT_CONTRATO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_CONTRATO'
      EditMask = '!99/99/0000;1;_'
    end
    object QPremioExportacaoCOD_CONTA_CORRENTE: TIntegerField
      DisplayLabel = 'Conta Corrente'
      FieldName = 'COD_CONTA_CORRENTE'
    end
    object QPremioExportacaoVAL_DOLAR: TFloatField
      DisplayLabel = 'Valor U$'
      FieldName = 'VAL_DOLAR'
      OnChange = QPremioExportacaoVAL_TAXA_DOLARChange
      DisplayFormat = '#,##0.00'
    end
    object QPremioExportacaoVAL_TAXA_DOLAR: TFloatField
      DisplayLabel = 'Taxa U$'
      FieldName = 'VAL_TAXA_DOLAR'
      OnChange = QPremioExportacaoVAL_TAXA_DOLARChange
      DisplayFormat = '#,##0.00'
    end
    object QPremioExportacaoVAL_REAL: TFloatField
      DisplayLabel = 'Valor R$'
      FieldName = 'VAL_REAL'
      DisplayFormat = '#,##0.00'
    end
    object QPremioExportacaoCOD_CADASTRO: TIntegerField
      DisplayLabel = 'Comprador'
      FieldName = 'COD_CADASTRO'
    end
    object QPremioExportacaoDESC_NAVIO: TStringField
      DisplayLabel = 'Navio'
      FieldName = 'DESC_NAVIO'
      Size = 50
    end
    object QPremioExportacaoDESC_FATURA: TStringField
      DisplayLabel = 'Fatura'
      FieldName = 'DESC_FATURA'
      Size = 15
    end
    object QPremioExportacaoCOD_HISTORICO: TIntegerField
      FieldName = 'COD_HISTORICO'
    end
    object QPremioExportacaoCOD_LANCTO_CONTABIL_DEB: TIntegerField
      FieldName = 'COD_LANCTO_CONTABIL_DEB'
    end
    object QPremioExportacaoCOD_LANCTO_CONTABIL_CRED: TIntegerField
      FieldName = 'COD_LANCTO_CONTABIL_CRED'
    end
    object QPremioExportacaoCOD_DEPARTAMENTO: TIntegerField
      DisplayLabel = 'Departamento'
      FieldName = 'COD_DEPARTAMENTO'
    end
    object QPremioExportacaoCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QPremioExportacaoCOD_BCO_MOVIMENTO: TIntegerField
      FieldName = 'COD_BCO_MOVIMENTO'
    end
    object QPremioExportacaoCOD_FILIAL: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'COD_FILIAL'
    end
  end
  object QPremioExportacaoCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PREMIO_EXPORTACAO.COD_PREMIO_EXPORTACAO,'
      '  TB_PREMIO_EXPORTACAO.DESC_CONTRATO,'
      '  TB_PREMIO_EXPORTACAO.DT_CONTRATO,'
      '  TB_PREMIO_EXPORTACAO.VAL_DOLAR,'
      '  TB_PREMIO_EXPORTACAO.VAL_TAXA_DOLAR,'
      '  TB_PREMIO_EXPORTACAO.VAL_REAL,'
      '  TB_PREMIO_EXPORTACAO.DESC_NAVIO,'
      '  TB_PREMIO_EXPORTACAO.DESC_FATURA,'
      '  TB_CONTA_CORRENTE.NUM_CONTA_CORRENTE,'
      '  TB_CADASTRO.NOME COMPRADOR'
      'FROM'
      '  TB_PREMIO_EXPORTACAO,'
      '  TB_CONTA_CORRENTE,'
      '  TB_CADASTRO'
      'WHERE'
      
        '  TB_PREMIO_EXPORTACAO.COD_CONTA_CORRENTE = TB_CONTA_CORRENTE.CO' +
        'D_CONTA_CORRENTE'
      '  AND'
      '  TB_PREMIO_EXPORTACAO.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      '  (:CONTRATO IS NULL'
      '    OR'
      '    TB_PREMIO_EXPORTACAO.DESC_CONTRATO = :CONTRATO)'
      '  AND'
      '  (:COMPRADOR IS NULL'
      '    OR'
      '    TB_PREMIO_EXPORTACAO.COD_CADASTRO = :COMPRADOR)'
      '  AND'
      '  (:FATURA IS NULL'
      '    OR'
      '    TB_PREMIO_EXPORTACAO.DESC_FATURA = :FATURA)'
      '  AND'
      '  TB_PREMIO_EXPORTACAO.DT_CONTRATO BETWEEN :DATA_I AND :DATA_F'
      'ORDER BY'
      '  DT_CONTRATO')
    Variables.Data = {
      0300000005000000090000003A434F4E545241544F0500000000000000000000
      000A0000003A434F4D505241444F52030000000000000000000000070000003A
      464154555241050000000000000000000000070000003A444154415F490C0000
      000000000000000000070000003A444154415F460C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A00000015000000434F445F5052454D494F5F4558504F5254414341
      4F0100000000000D000000444553435F434F4E545241544F0100000000000B00
      000044545F434F4E545241544F0100000000000900000056414C5F444F4C4152
      0100000000000E00000056414C5F544158415F444F4C41520100000000000800
      000056414C5F5245414C0100000000000A000000444553435F4E4156494F0100
      000000000B000000444553435F464154555241010000000000120000004E554D
      5F434F4E54415F434F5252454E544501000000000009000000434F4D50524144
      4F52010000000000}
    Session = DMOracle.DBCemapa
    Left = 168
    Top = 16
    object QPremioExportacaoConsCOD_PREMIO_EXPORTACAO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PREMIO_EXPORTACAO'
      Required = True
    end
    object QPremioExportacaoConsDESC_CONTRATO: TStringField
      DisplayLabel = 'Contrato'
      FieldName = 'DESC_CONTRATO'
      Required = True
      Size = 15
    end
    object QPremioExportacaoConsDT_CONTRATO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_CONTRATO'
    end
    object QPremioExportacaoConsVAL_DOLAR: TFloatField
      DisplayLabel = 'Valor U$'
      FieldName = 'VAL_DOLAR'
      DisplayFormat = '#,##0.00'
    end
    object QPremioExportacaoConsVAL_TAXA_DOLAR: TFloatField
      DisplayLabel = 'Taxa U$'
      FieldName = 'VAL_TAXA_DOLAR'
      DisplayFormat = '#,##0.00'
    end
    object QPremioExportacaoConsVAL_REAL: TFloatField
      DisplayLabel = 'Valor R$'
      FieldName = 'VAL_REAL'
      DisplayFormat = '#,##0.00'
    end
    object QPremioExportacaoConsDESC_NAVIO: TStringField
      DisplayLabel = 'Navio'
      FieldName = 'DESC_NAVIO'
      Size = 50
    end
    object QPremioExportacaoConsDESC_FATURA: TStringField
      DisplayLabel = 'Fatura'
      FieldName = 'DESC_FATURA'
      Size = 15
    end
    object QPremioExportacaoConsNUM_CONTA_CORRENTE: TStringField
      DisplayLabel = 'Conta Corrente'
      FieldName = 'NUM_CONTA_CORRENTE'
      Required = True
      Size = 12
    end
    object QPremioExportacaoConsCOMPRADOR: TStringField
      DisplayLabel = 'Comprador'
      FieldName = 'COMPRADOR'
      Required = True
      Size = 50
    end
  end
  object QRPremioExportacao: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PREMIO_EXPORTACAO.COD_PREMIO_EXPORTACAO,'
      '  TB_PREMIO_EXPORTACAO.DESC_CONTRATO,'
      '  TB_PREMIO_EXPORTACAO.DT_CONTRATO,'
      '  TB_PREMIO_EXPORTACAO.DESC_NAVIO,'
      '  TB_PREMIO_EXPORTACAO.DESC_FATURA,'
      '  TB_PREMIO_EXPORTACAO.VAL_DOLAR,'
      '  TB_PREMIO_EXPORTACAO.VAL_TAXA_DOLAR,'
      '  TB_PREMIO_EXPORTACAO.VAL_REAL,'
      '  TB_PREMIO_EXPORTACAO.COD_CADASTRO,'
      '  TB_CADASTRO.NOME COMPRADOR,'
      '  TB_CONTA_CORRENTE.NUM_CONTA_CORRENTE,'
      '  TB_BANCO_AGENCIA.DESC_BANCO_AGENCIA'
      ''
      'FROM'
      '  TB_PREMIO_EXPORTACAO,'
      '  TB_CADASTRO,'
      '  TB_CONTA_CORRENTE,'
      '  TB_BANCO_AGENCIA'
      'WHERE'
      
        '  TB_PREMIO_EXPORTACAO.COD_CONTA_CORRENTE = TB_CONTA_CORRENTE.CO' +
        'D_CONTA_CORRENTE'
      '  AND'
      '  TB_PREMIO_EXPORTACAO.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      
        '  TB_CONTA_CORRENTE.COD_BANCO_AGENCIA = TB_BANCO_AGENCIA.COD_BAN' +
        'CO_AGENCIA'
      '  AND'
      '  (:CONTRATO IS NULL'
      '    OR'
      '    TB_PREMIO_EXPORTACAO.DESC_CONTRATO = :CONTRATO)'
      '  AND'
      '  (:COMPRADOR IS NULL'
      '    OR'
      '    TB_PREMIO_EXPORTACAO.COD_CADASTRO = :COMPRADOR)'
      '  AND'
      '  (:FATURA IS NULL'
      '    OR'
      '    TB_PREMIO_EXPORTACAO.DESC_FATURA = :FATURA)'
      '  AND'
      '  TB_PREMIO_EXPORTACAO.DT_CONTRATO BETWEEN :DATA_I AND :DATA_F'
      'ORDER BY'
      '  DT_CONTRATO')
    Variables.Data = {
      0300000005000000090000003A434F4E545241544F0500000000000000000000
      000A0000003A434F4D505241444F52030000000000000000000000070000003A
      464154555241050000000000000000000000070000003A444154415F490C0000
      000000000000000000070000003A444154415F460C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C00000015000000434F445F5052454D494F5F4558504F5254414341
      4F0100000000000D000000444553435F434F4E545241544F0100000000000B00
      000044545F434F4E545241544F0100000000000A000000444553435F4E415649
      4F0100000000000B000000444553435F46415455524101000000000009000000
      56414C5F444F4C41520100000000000E00000056414C5F544158415F444F4C41
      520100000000000800000056414C5F5245414C01000000000009000000434F4D
      505241444F52010000000000120000004E554D5F434F4E54415F434F5252454E
      54450100000000000C000000434F445F434144415354524F0100000000001200
      0000444553435F42414E434F5F4147454E434941010000000000}
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 64
    object QRPremioExportacaoCOD_PREMIO_EXPORTACAO: TIntegerField
      FieldName = 'COD_PREMIO_EXPORTACAO'
      Required = True
    end
    object QRPremioExportacaoDESC_CONTRATO: TStringField
      FieldName = 'DESC_CONTRATO'
      Required = True
      Size = 15
    end
    object QRPremioExportacaoDT_CONTRATO: TDateTimeField
      FieldName = 'DT_CONTRATO'
    end
    object QRPremioExportacaoDESC_NAVIO: TStringField
      FieldName = 'DESC_NAVIO'
      Size = 50
    end
    object QRPremioExportacaoDESC_FATURA: TStringField
      FieldName = 'DESC_FATURA'
      Size = 15
    end
    object QRPremioExportacaoVAL_DOLAR: TFloatField
      FieldName = 'VAL_DOLAR'
    end
    object QRPremioExportacaoVAL_TAXA_DOLAR: TFloatField
      FieldName = 'VAL_TAXA_DOLAR'
    end
    object QRPremioExportacaoVAL_REAL: TFloatField
      FieldName = 'VAL_REAL'
    end
    object QRPremioExportacaoCOMPRADOR: TStringField
      FieldName = 'COMPRADOR'
      Required = True
      Size = 50
    end
    object QRPremioExportacaoNUM_CONTA_CORRENTE: TStringField
      FieldName = 'NUM_CONTA_CORRENTE'
      Required = True
      Size = 12
    end
    object QRPremioExportacaoCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object QRPremioExportacaoDESC_BANCO_AGENCIA: TStringField
      FieldName = 'DESC_BANCO_AGENCIA'
      Size = 30
    end
  end
end
