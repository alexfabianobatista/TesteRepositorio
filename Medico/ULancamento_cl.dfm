object DMLancamento: TDMLancamento
  OldCreateOrder = False
  Left = 337
  Top = 167
  Height = 194
  Width = 357
  object QLancamento: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_LANCAMENTO."COD_LANCAMENTO",'
      '  TB_LANCAMENTO."COD_MEDICO",'
      '  TB_LANCAMENTO."COD_CONVENIO",'
      '  TB_LANCAMENTO."DT_LANCAMENTO",'
      '  TB_LANCAMENTO."DT_PAGAMENTO",'
      '  TB_LANCAMENTO."VAL_PAGAMENTO",'
      '  TB_LANCAMENTO."IND_TIPO_PAGAMENTO",'
      '  TB_LANCAMENTO."NOME_PACIENTE",'
      '  TB_LANCAMENTO."IND_SITUACAO"'
      'FROM'
      '  TB_LANCAMENTO'
      'WHERE'
      '  TB_LANCAMENTO."COD_LANCAMENTO" = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_LANCAMENTO'
    SequenceField.Sequence = 'SQLANCAMENTO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000090000000E000000434F445F4C414E43414D454E544F010000000000
      0A000000434F445F4D454449434F0100000000000C000000434F445F434F4E56
      454E494F0100000000000D00000044545F4C414E43414D454E544F0100000000
      000C00000044545F504147414D454E544F0100000000000D00000056414C5F50
      4147414D454E544F01000000000012000000494E445F5449504F5F504147414D
      454E544F0100000000000D0000004E4F4D455F50414349454E54450100000000
      000C000000494E445F534954554143414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 32
    object QLancamentoCOD_LANCAMENTO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_LANCAMENTO'
      Required = True
    end
    object QLancamentoCOD_MEDICO: TIntegerField
      DisplayLabel = 'M'#233'dico'
      FieldName = 'COD_MEDICO'
      Required = True
    end
    object QLancamentoCOD_CONVENIO: TIntegerField
      DisplayLabel = 'Conv'#234'nio'
      FieldName = 'COD_CONVENIO'
    end
    object QLancamentoDT_LANCAMENTO: TDateTimeField
      DisplayLabel = 'Dt. Lan'#231'amento'
      FieldName = 'DT_LANCAMENTO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QLancamentoDT_PAGAMENTO: TDateTimeField
      DisplayLabel = 'Dt. Pagamento'
      FieldName = 'DT_PAGAMENTO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QLancamentoVAL_PAGAMENTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VAL_PAGAMENTO'
      Required = True
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object QLancamentoIND_TIPO_PAGAMENTO: TStringField
      DisplayLabel = 'Tipo Pagamento'
      FieldName = 'IND_TIPO_PAGAMENTO'
      Required = True
      Size = 1
    end
    object QLancamentoNOME_PACIENTE: TStringField
      DisplayLabel = 'Nome do Paci'#234'nte'
      FieldName = 'NOME_PACIENTE'
      Required = True
      Size = 50
    end
    object QLancamentoIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 1
    end
  end
  object QLancamentoCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_LANCAMENTO."COD_LANCAMENTO",'
      '  TB_LANCAMENTO."DT_LANCAMENTO",'
      '  TB_LANCAMENTO."DT_PAGAMENTO",'
      '  TB_LANCAMENTO."VAL_PAGAMENTO",'
      '  TB_LANCAMENTO."NOME_PACIENTE",'
      '  TB_MEDICO."NOME" AS "NOME_MEDICO",'
      
        '  DECODE(NVL(TB_LANCAMENTO."COD_CONVENIO", 0), 0, '#39' - '#39', TB_CONV' +
        'ENIO."DESC_CONVENIO") AS "DESC_CONVENIO",'
      
        '  DECODE(TB_LANCAMENTO."IND_TIPO_PAGAMENTO", '#39'P'#39', '#39'Particular'#39', ' +
        #39'Conv'#234'nio'#39') AS "TIPO_PAGAMENTO"'
      'FROM'
      '  TB_LANCAMENTO,'
      '  TB_MEDICO,'
      '  TB_CONVENIO'
      'WHERE'
      '  TB_LANCAMENTO."COD_MEDICO" = TB_MEDICO."COD_MEDICO"'
      '  AND'
      '  TB_LANCAMENTO."COD_CONVENIO" = TB_CONVENIO."COD_CONVENIO"(+)'
      '  AND'
      '  (:PACIENTE IS NULL'
      '   OR'
      '    TB_LANCAMENTO."NOME_PACIENTE" >= :PACIENTE)'
      '  AND'
      '  (:TIPO_PAGAMENTO IS NULL'
      '   OR'
      '    TB_LANCAMENTO."IND_TIPO_PAGAMENTO" = :TIPO_PAGAMENTO)'
      '  AND'
      '  (:MEDICO IS NULL'
      '   OR'
      '    TB_LANCAMENTO."COD_MEDICO" = :MEDICO)'
      '  AND'
      '  (:CONVENIO IS NULL'
      '   OR'
      '    TB_LANCAMENTO."COD_CONVENIO" = :CONVENIO)'
      '  AND'
      '  (:DT_LANC_I IS NULL'
      '   OR'
      '    TB_LANCAMENTO."DT_LANCAMENTO" >= :DT_LANC_I)'
      '  AND'
      '  (:DT_LANC_F IS NULL'
      '   OR'
      '    TB_LANCAMENTO."DT_LANCAMENTO" <= :DT_LANC_F)'
      '  AND'
      '  (:DT_PGTO_I IS NULL'
      '   OR'
      '    TB_LANCAMENTO."DT_PAGAMENTO" >= :DT_PGTO_I)'
      '  AND'
      '  (:DT_PGTO_F IS NULL'
      '   OR'
      '    TB_LANCAMENTO."DT_PAGAMENTO" <= :DT_PGTO_F)'
      '  AND'
      '  (:SITUACAO IS NULL'
      '   OR'
      '    TB_LANCAMENTO.IND_SITUACAO =:SITUACAO)  '
      'ORDER BY'
      '  TB_LANCAMENTO."DT_LANCAMENTO"')
    Variables.Data = {
      0300000009000000090000003A50414349454E54450500000000000000000000
      000F0000003A5449504F5F504147414D454E544F610000000000000000000000
      070000003A4D454449434F030000000000000000000000090000003A434F4E56
      454E494F0300000000000000000000000A0000003A44545F4C414E435F490C00
      000000000000000000000A0000003A44545F4C414E435F460C00000000000000
      000000000A0000003A44545F5047544F5F490C00000000000000000000000A00
      00003A44545F5047544F5F460C0000000000000000000000090000003A534954
      554143414F050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000E000000434F445F4C414E43414D454E544F010000000000
      0D00000044545F4C414E43414D454E544F0100000000000C00000044545F5041
      47414D454E544F0100000000000D00000056414C5F504147414D454E544F0100
      000000000D0000004E4F4D455F50414349454E54450100000000000B0000004E
      4F4D455F4D454449434F0100000000000D000000444553435F434F4E56454E49
      4F0100000000000E0000005449504F5F504147414D454E544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 160
    Top = 32
    object QLancamentoConsCOD_LANCAMENTO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_LANCAMENTO'
      Required = True
    end
    object QLancamentoConsDT_LANCAMENTO: TDateTimeField
      DisplayLabel = 'Dt. Lan'#231'amento'
      FieldName = 'DT_LANCAMENTO'
      Required = True
    end
    object QLancamentoConsDT_PAGAMENTO: TDateTimeField
      DisplayLabel = 'Dt. Pagamento'
      FieldName = 'DT_PAGAMENTO'
      Required = True
    end
    object QLancamentoConsVAL_PAGAMENTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VAL_PAGAMENTO'
      Required = True
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object QLancamentoConsNOME_PACIENTE: TStringField
      DisplayLabel = 'Paci'#234'nte'
      FieldName = 'NOME_PACIENTE'
      Required = True
      Size = 50
    end
    object QLancamentoConsNOME_MEDICO: TStringField
      DisplayLabel = 'M'#233'dico'
      FieldName = 'NOME_MEDICO'
      Required = True
      Size = 50
    end
    object QLancamentoConsDESC_CONVENIO: TStringField
      DisplayLabel = 'Conv'#234'nio'
      FieldName = 'DESC_CONVENIO'
      Size = 30
    end
    object QLancamentoConsTIPO_PAGAMENTO: TStringField
      DisplayLabel = 'Pagamento'
      FieldName = 'TIPO_PAGAMENTO'
      Size = 10
    end
  end
  object QRLancamento: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_LANCAMENTO."COD_LANCAMENTO",'
      '  TB_LANCAMENTO."DT_LANCAMENTO",'
      '  TB_LANCAMENTO."DT_PAGAMENTO",'
      '  TB_LANCAMENTO."VAL_PAGAMENTO",'
      '  TB_LANCAMENTO."NOME_PACIENTE",'
      '  TB_MEDICO."NOME" AS "NOME_MEDICO",'
      
        '  DECODE(NVL(TB_LANCAMENTO."COD_CONVENIO", 0), 0, '#39' - '#39', TB_CONV' +
        'ENIO."DESC_CONVENIO") AS "DESC_CONVENIO",'
      
        '  DECODE(TB_LANCAMENTO."IND_TIPO_PAGAMENTO", '#39'P'#39', '#39'Particular'#39', ' +
        #39'Conv'#234'nio'#39') AS "TIPO_PAGAMENTO",'
      
        '  (TO_CHAR(TB_LANCAMENTO."DT_LANCAMENTO", '#39'fmMonth'#39')||'#39', '#39'|| TO_' +
        'CHAR(TB_LANCAMENTO."DT_LANCAMENTO", '#39'YYYY'#39')) AS "MES_ANO_LANCAME' +
        'NTO",'
      
        '  (TO_CHAR(TB_LANCAMENTO."DT_PAGAMENTO", '#39'fmMonth'#39')||'#39', '#39'|| TO_C' +
        'HAR(TB_LANCAMENTO."DT_PAGAMENTO", '#39'YYYY'#39'))    AS "MES_ANO_PAGAME' +
        'NTO"'
      'FROM'
      '  TB_LANCAMENTO,'
      '  TB_MEDICO,'
      '  TB_CONVENIO'
      'WHERE'
      '  TB_LANCAMENTO."COD_MEDICO" = TB_MEDICO."COD_MEDICO"'
      '  AND'
      '  TB_LANCAMENTO."COD_CONVENIO" = TB_CONVENIO."COD_CONVENIO"(+)'
      '  AND'
      '  (:TIPO_PAGAMENTO IS NULL'
      '   OR'
      '    TB_LANCAMENTO."IND_TIPO_PAGAMENTO" = :TIPO_PAGAMENTO)'
      '  AND'
      '  (:MEDICO IS NULL'
      '   OR'
      '    TB_LANCAMENTO."COD_MEDICO" = :MEDICO)'
      '  AND'
      '  (:CONVENIO IS NULL'
      '   OR'
      '    TB_LANCAMENTO."COD_CONVENIO" = :CONVENIO)'
      '  AND'
      '  (:DT_LANC_I IS NULL'
      '   OR'
      '    TB_LANCAMENTO."DT_LANCAMENTO" >= :DT_LANC_I)'
      '  AND'
      '  (:DT_LANC_F IS NULL'
      '   OR'
      '    TB_LANCAMENTO."DT_LANCAMENTO" <= :DT_LANC_F)'
      '  AND'
      '  (:DT_PGTO_I IS NULL'
      '   OR'
      '    TB_LANCAMENTO."DT_PAGAMENTO" >= :DT_PGTO_I)'
      '  AND'
      '  (:DT_PGTO_F IS NULL'
      '   OR'
      '    TB_LANCAMENTO."DT_PAGAMENTO" <= :DT_PGTO_F)'
      '  AND'
      '  (:SITUACAO IS NULL'
      '   OR'
      '    TB_LANCAMENTO.IND_SITUACAO =:SITUACAO)  '
      'ORDER BY'
      '  :ORDENACAO'
      '')
    Variables.Data = {
      03000000090000000F0000003A5449504F5F504147414D454E544F6100000000
      00000000000000070000003A4D454449434F0300000000000000000000000900
      00003A434F4E56454E494F0300000000000000000000000A0000003A44545F4C
      414E435F490C00000000000000000000000A0000003A44545F4C414E435F460C
      00000000000000000000000A0000003A44545F5047544F5F490C000000000000
      00000000000A0000003A44545F5047544F5F460C00000000000000000000000A
      0000003A4F5244454E4143414F010000000000000000000000090000003A5349
      54554143414F050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000E000000434F445F4C414E43414D454E544F010000000000
      0D00000044545F4C414E43414D454E544F0100000000000C00000044545F5041
      47414D454E544F0100000000000D00000056414C5F504147414D454E544F0100
      000000000D0000004E4F4D455F50414349454E5445010000000000120000004D
      45535F414E4F5F4C414E43414D454E544F010000000000110000004D45535F41
      4E4F5F504147414D454E544F0100000000000B0000004E4F4D455F4D45444943
      4F0100000000000D000000444553435F434F4E56454E494F0100000000000E00
      00005449504F5F504147414D454E544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 256
    Top = 32
    object QRLancamentoCOD_LANCAMENTO: TIntegerField
      FieldName = 'COD_LANCAMENTO'
      Required = True
    end
    object QRLancamentoDT_LANCAMENTO: TDateTimeField
      FieldName = 'DT_LANCAMENTO'
      Required = True
    end
    object QRLancamentoDT_PAGAMENTO: TDateTimeField
      FieldName = 'DT_PAGAMENTO'
      Required = True
    end
    object QRLancamentoVAL_PAGAMENTO: TFloatField
      FieldName = 'VAL_PAGAMENTO'
      Required = True
    end
    object QRLancamentoNOME_PACIENTE: TStringField
      FieldName = 'NOME_PACIENTE'
      Required = True
      Size = 50
    end
    object QRLancamentoMES_ANO_LANCAMENTO: TStringField
      FieldName = 'MES_ANO_LANCAMENTO'
      Size = 15
    end
    object QRLancamentoMES_ANO_PAGAMENTO: TStringField
      FieldName = 'MES_ANO_PAGAMENTO'
      Size = 15
    end
    object QRLancamentoNOME_MEDICO: TStringField
      FieldName = 'NOME_MEDICO'
      Required = True
      Size = 50
    end
    object QRLancamentoDESC_CONVENIO: TStringField
      FieldName = 'DESC_CONVENIO'
      Size = 30
    end
    object QRLancamentoTIPO_PAGAMENTO: TStringField
      FieldName = 'TIPO_PAGAMENTO'
      Size = 10
    end
  end
  object QRReciboLancamento: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_LANCAMENTO.NOME_PACIENTE,'
      '  TB_MEDICO."NOME",'
      '  SUM(TB_LANCAMENTO."VAL_PAGAMENTO") AS "VAL_PAGAMENTO",'
      '  DECODE(TB_CONVENIO.DESC_CONVENIO, '#39#39', '#39'Nao possui'#39','
      
        '  TB_CONVENIO.COD_CONVENIO || '#39' - '#39' || TB_CONVENIO.DESC_CONVENIO' +
        ') AS CONVENIO'
      'FROM'
      '  TB_LANCAMENTO,'
      '  TB_MEDICO,'
      '  TB_CONVENIO'
      'WHERE'
      '  TB_LANCAMENTO."COD_MEDICO" = TB_MEDICO."COD_MEDICO"'
      '  AND'
      '  TB_CONVENIO.COD_CONVENIO(+) = TB_LANCAMENTO.COD_CONVENIO'
      '  AND'
      '  TB_LANCAMENTO."COD_MEDICO" = :MEDICO'
      '  AND'
      '/*  TB_LANCAMENTO.IND_SITUACAO = '#39'P'#39
      '  AND */'
      '  (:CONVENIO IS NULL'
      '   OR'
      '    TB_LANCAMENTO."COD_CONVENIO" = :CONVENIO)'
      '  AND'
      '  TB_LANCAMENTO."DT_PAGAMENTO" >= :DT_PGTO_I'
      '  AND'
      '  TB_LANCAMENTO."DT_PAGAMENTO" <= :DT_PGTO_F'
      '  AND'
      '  (:TIPO_PAGAMENTO IS NULL'
      '   OR'
      '   TB_LANCAMENTO."IND_TIPO_PAGAMENTO" = :TIPO_PAGAMENTO)'
      'GROUP BY'
      '  TB_LANCAMENTO.NOME_PACIENTE,'
      '  TB_MEDICO."NOME",'
      '  TB_CONVENIO.COD_CONVENIO,'
      '  TB_CONVENIO.DESC_CONVENIO'
      '')
    Variables.Data = {
      0300000005000000070000003A4D454449434F03000000000000000000000009
      0000003A434F4E56454E494F0300000000000000000000000A0000003A44545F
      5047544F5F490C00000000000000000000000A0000003A44545F5047544F5F46
      0C00000000000000000000000F0000003A5449504F5F504147414D454E544F61
      00000002000000310000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000040000004E4F4D450100000000000D00000056414C5F5041
      47414D454E544F0100000000000D0000004E4F4D455F50414349454E54450100
      0000000008000000434F4E56454E494F010000000000}
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 88
    object QRReciboLancamentoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRReciboLancamentoVAL_PAGAMENTO: TFloatField
      FieldName = 'VAL_PAGAMENTO'
    end
    object QRReciboLancamentoNOME_PACIENTE: TStringField
      FieldName = 'NOME_PACIENTE'
      Required = True
      Size = 50
    end
    object QRReciboLancamentoCONVENIO: TStringField
      FieldName = 'CONVENIO'
      Size = 73
    end
  end
  object QRLancamentoSintetico: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_MEDICO."NOME",'
      '  SUM(TB_LANCAMENTO."VAL_PAGAMENTO") AS "VAL_PAGAMENTO"'
      'FROM'
      '  TB_MEDICO,'
      '  TB_LANCAMENTO'
      'WHERE'
      '  TB_MEDICO."COD_MEDICO" = TB_LANCAMENTO."COD_MEDICO"  '
      '  AND'
      '  (:DT_PGTO_I IS NULL'
      '   OR'
      '    TB_LANCAMENTO."DT_PAGAMENTO" >= :DT_PGTO_I)'
      '  AND'
      '  (:DT_PGTO_F IS NULL'
      '   OR'
      '    TB_LANCAMENTO."DT_PAGAMENTO" <= :DT_PGTO_F)'
      '  AND'
      '  (:TIPO_PAGAMENTO IS NULL'
      '   OR'
      '   TB_LANCAMENTO."IND_TIPO_PAGAMENTO" = :TIPO_PAGAMENTO)'
      '  AND'
      '  (:CONVENIO IS NULL'
      '   OR'
      '   TB_LANCAMENTO."COD_CONVENIO" = :CONVENIO)'
      '  AND'
      '  (:MEDICO IS NULL'
      '   OR'
      '   TB_LANCAMENTO."COD_MEDICO" = :MEDICO)'
      'GROUP BY'
      '  TB_MEDICO."NOME"'
      'ORDER BY'
      '  TB_MEDICO."NOME"')
    Variables.Data = {
      03000000050000000A0000003A44545F5047544F5F490C000000000000000000
      00000A0000003A44545F5047544F5F460C00000000000000000000000F000000
      3A5449504F5F504147414D454E544F6100000002000000310000000000090000
      003A434F4E56454E494F030000000000000000000000070000003A4D45444943
      4F030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000002000000040000004E4F4D450100000000000D00000056414C5F5041
      47414D454E544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 160
    Top = 88
    object QRLancamentoSinteticoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRLancamentoSinteticoVAL_PAGAMENTO: TFloatField
      FieldName = 'VAL_PAGAMENTO'
    end
  end
end
