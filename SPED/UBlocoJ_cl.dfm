object DmBlocoJ: TDmBlocoJ
  OldCreateOrder = False
  Left = 317
  Top = 269
  Height = 200
  Width = 327
  object QReg100: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  P.COD_PLANO_CONTA AS COD_AGLUTINACAO,'
      '  DECODE(P.COD_REDUZIDO, NULL, '#39'T'#39', '#39'D'#39') AS IND_COD_AGLUTINACAO,'
      '  '
      '  CASE'
      '    WHEN P.NUM_GRAU > 1 THEN'
      
        '        (SELECT P1.COD_PLANO_CONTA FROM TB_PLANO_CONTA P1 WHERE ' +
        'P1.NUM_PLANO_CONTA = SUBSTR(P.NUM_PLANO_CONTA, 0, ((P.NUM_GRAU-1' +
        ')*2)-1))'
      '    ELSE'
      '        NULL'
      '  END AS COD_AGLUTINACAO_SUP,'
      '  '
      '  P.NUM_PLANO_CONTA,'
      '  P.DESC_PLANO_CONTA,'
      '  P.NUM_GRAU,'
      
        '  decode(P.DESC_NATUREZA_CONTA, '#39'01'#39', '#39'A'#39', '#39'P'#39') as DESC_TIPO_BAL' +
        'ANCO,'
      
        '  (case when SUM(S.VAL_ATUAL) > 0 then SUM(S.VAL_ATUAL) else SUM' +
        '(S.VAL_ATUAL) * (-1) end) AS VAL_ATUAL,'
      
        '  (case when SUM(S.VAL_ATUAL) > 0 then '#39'D'#39' else '#39'C'#39' end) as IND_' +
        'DC,'
      '  ('
      '    SELECT '
      '      ABS(SUM(S1.VAL_ATUAL))'
      '    FROM'
      '      TB_SALDO_CONTABIL S1'
      '    WHERE'
      '      P.COD_PLANO_CONTA = S1.COD_PLANO_CONTA'
      '      AND'
      '      S1.COD_FILIAL IN :FILIAIS'
      '      AND '
      
        '      S1.DT_ANO_MES = CAST(SUBSTR(:DT_ANO_MES, 1, 4) AS INTEGER)' +
        '-1 || SUBSTR(:DT_ANO_MES, 5, 2)'
      '  ) AS VAL_CTA_INI,'
      '  (case when ('
      '    SELECT '
      '      SUM(S1.VAL_ATUAL)'
      '    FROM'
      '      TB_SALDO_CONTABIL S1'
      '    WHERE'
      '      P.COD_PLANO_CONTA = S1.COD_PLANO_CONTA'
      '      AND'
      '      S1.COD_FILIAL IN :FILIAIS'
      '      AND'
      
        '      S1.DT_ANO_MES = (CAST(SUBSTR(:DT_ANO_MES, 1, 4) AS INTEGER' +
        ') - 1) || '#39'12'#39
      '  ) > 0 then '#39'D'#39' else '#39'C'#39' end) AS IND_DC_BAL_INI'
      ''
      'FROM'
      '   TB_SALDO_CONTABIL S'
      
        'INNER JOIN TB_PLANO_CONTA P ON S.COD_PLANO_CONTA = P.COD_PLANO_C' +
        'ONTA'
      'WHERE'
      '  P.DESC_NATUREZA_CONTA IN ('#39'01'#39', '#39'02'#39', '#39'03'#39')'
      'AND'
      '  S.COD_FILIAL IN :FILIAIS'
      'AND'
      '  S.DT_ANO_MES = :DT_ANO_MES'
      'AND'
      '  P.IND_LIBERADO_USO = '#39'SIM'#39
      '  AND'
      '  ((ABS(S.VAL_ATUAL) > 0) OR (SELECT '
      '      ABS(SUM(S1.VAL_ATUAL))'
      '    FROM'
      '      TB_SALDO_CONTABIL S1'
      '    WHERE'
      '      P.COD_PLANO_CONTA = S1.COD_PLANO_CONTA'
      '      AND'
      '      S1.COD_FILIAL IN :FILIAIS'
      '      AND '
      
        '      S1.DT_ANO_MES = CAST(SUBSTR(:DT_ANO_MES, 1, 4) AS INTEGER)' +
        '-1 || SUBSTR(:DT_ANO_MES, 5, 2)) > 0)'
      ''
      ''
      'GROUP BY'
      '  P.COD_PLANO_CONTA,'
      '  DECODE(P.COD_REDUZIDO, NULL, '#39'T'#39', '#39'D'#39'),'
      '  P.NUM_PLANO_CONTA,'
      '  P.DESC_PLANO_CONTA,'
      '  P.NUM_GRAU,'
      '  decode(P.DESC_NATUREZA_CONTA, '#39'01'#39', '#39'A'#39', '#39'P'#39')  '
      'ORDER BY'
      '  P.NUM_PLANO_CONTA')
    Variables.Data = {
      03000000020000000B0000003A44545F414E4F5F4D4553050000000000000000
      000000080000003A46494C49414953010000000600000028312C322900000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000B00000010000000444553435F504C414E4F5F434F4E544101000000
      00000900000056414C5F415455414C01000000000006000000494E445F444301
      00000000000F0000004E554D5F504C414E4F5F434F4E54410100000000000800
      00004E554D5F4752415501000000000011000000444553435F5449504F5F4241
      4C414E434F0100000000000F000000434F445F41474C5554494E4143414F0100
      000000000B00000056414C5F4354415F494E490100000000000E000000494E44
      5F44435F42414C5F494E4901000000000013000000494E445F434F445F41474C
      5554494E4143414F01000000000013000000434F445F41474C5554494E414341
      4F5F535550010000000000}
    Session = DMOracle.DBCemapa
    Left = 16
    Top = 16
    object QReg100COD_AGLUTINACAO: TIntegerField
      FieldName = 'COD_AGLUTINACAO'
      Required = True
    end
    object QReg100NUM_PLANO_CONTA: TStringField
      FieldName = 'NUM_PLANO_CONTA'
      Required = True
      Size = 15
    end
    object QReg100DESC_PLANO_CONTA: TStringField
      FieldName = 'DESC_PLANO_CONTA'
      Required = True
      Size = 40
    end
    object QReg100NUM_GRAU: TIntegerField
      FieldName = 'NUM_GRAU'
      Required = True
    end
    object QReg100DESC_TIPO_BALANCO: TStringField
      FieldName = 'DESC_TIPO_BALANCO'
      Size = 1
    end
    object QReg100VAL_ATUAL: TFloatField
      FieldName = 'VAL_ATUAL'
    end
    object QReg100IND_DC: TStringField
      FieldName = 'IND_DC'
      Size = 1
    end
    object QReg100IND_DC_BAL_INI: TStringField
      FieldName = 'IND_DC_BAL_INI'
      Size = 1
    end
    object QReg100VAL_CTA_INI: TFloatField
      FieldName = 'VAL_CTA_INI'
    end
    object QReg100IND_COD_AGLUTINACAO: TStringField
      FieldName = 'IND_COD_AGLUTINACAO'
      Size = 1
    end
    object QReg100COD_AGLUTINACAO_SUP: TFloatField
      FieldName = 'COD_AGLUTINACAO_SUP'
    end
  end
  object QReg900: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  T.*,'
      '  F.DESC_FILIAL'
      'FROM'
      '  TB_TERMO_ABERTURA T'
      'INNER JOIN TB_FILIAL F ON T.COD_FILIAL = F.COD_FILIAL'
      'WHERE'
      '  T.COD_FILIAL IN :FILIAIS'
      'AND'
      '  (T.DT_INICIAL BETWEEN :DT_INICIAL_INI AND :DT_INICIAL_FIN)')
    Variables.Data = {
      03000000030000000F0000003A44545F494E494349414C5F494E490C00000000
      000000000000000F0000003A44545F494E494349414C5F46494E0C0000000000
      000000000000080000003A46494C4941495301000000230000002853454C4543
      5420434F445F46494C49414C2046524F4D2054425F46494C49414C2900000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000600000012000000434F445F5445524D4F5F41424552545552410100
      000000000A000000434F445F46494C49414C010000000000090000004E554D5F
      4F5244454D0100000000000E000000444553435F4E41545F4C4956524F010000
      0000000A00000044545F494E494349414C0100000000000B000000444553435F
      46494C49414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 72
    Top = 16
    object QReg900COD_TERMO_ABERTURA: TIntegerField
      FieldName = 'COD_TERMO_ABERTURA'
      Required = True
    end
    object QReg900COD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QReg900NUM_ORDEM: TFloatField
      FieldName = 'NUM_ORDEM'
      Required = True
    end
    object QReg900DESC_NAT_LIVRO: TStringField
      FieldName = 'DESC_NAT_LIVRO'
      Required = True
      Size = 80
    end
    object QReg900DT_INICIAL: TDateTimeField
      FieldName = 'DT_INICIAL'
      Required = True
    end
    object QReg900DESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
  end
  object QReg930: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  C.NOME,'
      '  C.NUM_CGC_CPF as DESC_CPF,'
      '  DESC_QUALIFICACAO,'
      '  C.DESC_CRC,'
      '  C.DESC_E_MAIL,'
      '  C.DESC_TELEFONE,'
      
        '  SUBSTR(C.DESC_CRC, LENGTH(C.DESC_CRC)-1, LENGTH(C.DESC_CRC)) A' +
        'S UF_CRC,'
      '  TRIM(C.NUM_SEQ_CRC) AS NUM_SEQ_CRC,'
      '  C.DT_CRC AS DT_CRC,'
      '  CASE'
      '    WHEN SUBSTR(DESC_QUALIFICACAO, 1, 3) IN ('#39'205'#39') THEN'
      '      '#39'S'#39
      '    ELSE'
      '      '#39'N'#39
      '  END AS IND_RESP_LEGAL'
      'FROM'
      '  TB_CADASTRO C'
      'WHERE'
      
        '  C.COD_CADASTRO IN (SELECT DISTINCT COD_CADASTRO_CONTABILISTA F' +
        'ROM TB_FILIAL WHERE COD_FILIAL IN :FILIAIS)'
      ''
      'UNION ALL'
      ''
      'SELECT'
      '  C.NOME,'
      '  C.NUM_CGC_CPF as DESC_CPF,'
      '  DESC_QUALIFICACAO,'
      '  C.DESC_CRC,'
      '  C.DESC_E_MAIL,'
      '  C.DESC_TELEFONE,'
      '  NULL AS UF_CRC,'
      '  NULL AS NUM_SEQ_CRC,'
      '  NULL AS DT_CRC,  '
      '  '#39'S'#39' AS IND_RESP_LEGAL'
      'FROM'
      '  TB_CADASTRO C'
      'WHERE'
      
        '  C.COD_CADASTRO IN (SELECT DISTINCT COD_CADASTRO_RESPONSAVEL FR' +
        'OM TB_FILIAL WHERE COD_FILIAL IN :FILIAIS)')
    Variables.Data = {
      0300000001000000080000003A46494C49414953010000000400000028312900
      00000000}
    QBEDefinition.QBEFieldDefs = {
      0400000009000000040000004E4F4D4501000000000008000000444553435F43
      504601000000000008000000444553435F435243010000000000110000004445
      53435F5155414C494649434143414F0100000000000B000000444553435F455F
      4D41494C0100000000000D000000444553435F54454C45464F4E450100000000
      000600000055465F4352430100000000000B0000004E554D5F5345515F435243
      0100000000000600000044545F435243010000000000}
    Session = DMOracle.DBCemapa
    Left = 128
    Top = 16
    object QReg930NOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object QReg930DESC_CPF: TStringField
      FieldName = 'DESC_CPF'
      Size = 18
    end
    object QReg930DESC_QUALIFICACAO: TStringField
      FieldName = 'DESC_QUALIFICACAO'
      Size = 100
    end
    object QReg930DESC_CRC: TStringField
      FieldName = 'DESC_CRC'
      Size = 10
    end
    object QReg930DESC_E_MAIL: TStringField
      FieldName = 'DESC_E_MAIL'
      Size = 70
    end
    object QReg930DESC_TELEFONE: TStringField
      FieldName = 'DESC_TELEFONE'
      Size = 12
    end
    object QReg930UF_CRC: TStringField
      FieldName = 'UF_CRC'
      Size = 1
    end
    object QReg930NUM_SEQ_CRC: TStringField
      FieldName = 'NUM_SEQ_CRC'
      Size = 1
    end
    object QReg930DT_CRC: TStringField
      FieldName = 'DT_CRC'
      Size = 1
    end
  end
  object QReg800: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  DESC_NOTA_EXPLICATIVA'
      'FROM'
      '  TB_NOTA_EXPLICATIVA_BALANCO'
      'WHERE'
      '  NUM_ANO = :NUM_ANO'
      '  AND'
      '  COD_FILIAL = :COD_FILIAL')
    Variables.Data = {
      0300000002000000080000003A4E554D5F414E4F030000000000000000000000
      0B0000003A434F445F46494C49414C030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000100000015000000444553435F4E4F54415F4558504C494341544956
      41000000000000}
    Session = DMOracle.DBCemapa
    Left = 184
    Top = 16
    object QReg800DESC_NOTA_EXPLICATIVA: TMemoField
      FieldName = 'DESC_NOTA_EXPLICATIVA'
      BlobType = ftOraClob
    end
  end
  object QReg100Trim: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  P.COD_PLANO_CONTA AS COD_AGLUTINACAO,'
      '  DECODE(P.COD_REDUZIDO, NULL, '#39'T'#39', '#39'D'#39') AS IND_COD_AGLUTINACAO,'
      '  '
      '  CASE'
      '    WHEN P.NUM_GRAU > 1 THEN'
      
        '        (SELECT P1.COD_PLANO_CONTA FROM TB_PLANO_CONTA P1 WHERE ' +
        'P1.NUM_PLANO_CONTA = SUBSTR(P.NUM_PLANO_CONTA, 0, ((P.NUM_GRAU-1' +
        ')*2)-1))'
      '    ELSE'
      '        NULL'
      '  END AS COD_AGLUTINACAO_SUP,'
      '  '
      '  P.NUM_PLANO_CONTA,'
      '  P.DESC_PLANO_CONTA,'
      '  P.NUM_GRAU,'
      
        '  decode(P.DESC_NATUREZA_CONTA, '#39'01'#39', '#39'A'#39', '#39'P'#39') as DESC_TIPO_BAL' +
        'ANCO,'
      
        '  (case when SUM(S.VAL_ATUAL) > 0 then SUM(S.VAL_ATUAL) else SUM' +
        '(S.VAL_ATUAL) * (-1) end) AS VAL_ATUAL,'
      
        '  (case when SUM(S.VAL_ATUAL) > 0 then '#39'D'#39' else '#39'C'#39' end) as IND_' +
        'DC,'
      '  ('
      '    SELECT '
      '      ABS(SUM(S1.VAL_ATUAL))'
      '    FROM'
      '      TB_SALDO_CONTABIL S1'
      '    WHERE'
      '      P.COD_PLANO_CONTA = S1.COD_PLANO_CONTA'
      '      AND'
      '      S1.COD_FILIAL IN :FILIAIS'
      '      AND '
      '      S1.DT_ANO_MES = :DT_ANO_MES_INI'
      '  ) AS VAL_CTA_INI,'
      '  (case when ('
      '    SELECT '
      '      SUM(S1.VAL_ATUAL)'
      '    FROM'
      '      TB_SALDO_CONTABIL S1'
      '    WHERE'
      '      P.COD_PLANO_CONTA = S1.COD_PLANO_CONTA'
      '      AND'
      '      S1.COD_FILIAL IN :FILIAIS'
      '      AND'
      '      S1.DT_ANO_MES = :DT_ANO_MES_INI'
      '  ) > 0 then '#39'D'#39' else '#39'C'#39' end) AS IND_DC_BAL_INI'
      ''
      'FROM'
      '   TB_SALDO_CONTABIL S'
      
        'INNER JOIN TB_PLANO_CONTA P ON S.COD_PLANO_CONTA = P.COD_PLANO_C' +
        'ONTA'
      'WHERE'
      '  P.DESC_NATUREZA_CONTA IN ('#39'01'#39', '#39'02'#39', '#39'03'#39')'
      'AND'
      '  S.COD_FILIAL IN :FILIAIS'
      'AND'
      '  S.DT_ANO_MES = :DT_ANO_MES'
      'AND'
      '  P.IND_LIBERADO_USO = '#39'SIM'#39
      '  AND'
      '  ((ABS(S.VAL_ATUAL) > 0) OR (SELECT '
      '      ABS(SUM(S1.VAL_ATUAL))'
      '    FROM'
      '      TB_SALDO_CONTABIL S1'
      '    WHERE'
      '      P.COD_PLANO_CONTA = S1.COD_PLANO_CONTA'
      '      AND'
      '      S1.COD_FILIAL IN :FILIAIS'
      '      AND '
      '      S1.DT_ANO_MES = :DT_ANO_MES_INI) > 0)'
      ''
      ''
      'GROUP BY'
      '  P.COD_PLANO_CONTA,'
      '  DECODE(P.COD_REDUZIDO, NULL, '#39'T'#39', '#39'D'#39'),'
      '  P.NUM_PLANO_CONTA,'
      '  P.DESC_PLANO_CONTA,'
      '  P.NUM_GRAU,'
      '  decode(P.DESC_NATUREZA_CONTA, '#39'01'#39', '#39'A'#39', '#39'P'#39')  '
      'ORDER BY'
      '  P.NUM_PLANO_CONTA')
    Variables.Data = {
      03000000030000000B0000003A44545F414E4F5F4D4553050000000000000000
      000000080000003A46494C49414953010000000600000028312C322900000000
      000F0000003A44545F414E4F5F4D45535F494E49050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B00000010000000444553435F504C414E4F5F434F4E544101000000
      00000900000056414C5F415455414C01000000000006000000494E445F444301
      00000000000F0000004E554D5F504C414E4F5F434F4E54410100000000000800
      00004E554D5F4752415501000000000011000000444553435F5449504F5F4241
      4C414E434F0100000000000F000000434F445F41474C5554494E4143414F0100
      000000000B00000056414C5F4354415F494E490100000000000E000000494E44
      5F44435F42414C5F494E4901000000000013000000494E445F434F445F41474C
      5554494E4143414F01000000000013000000434F445F41474C5554494E414341
      4F5F535550010000000000}
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 72
    object QReg100TrimCOD_AGLUTINACAO: TIntegerField
      FieldName = 'COD_AGLUTINACAO'
      Required = True
    end
    object QReg100TrimIND_COD_AGLUTINACAO: TStringField
      FieldName = 'IND_COD_AGLUTINACAO'
      Size = 1
    end
    object QReg100TrimCOD_AGLUTINACAO_SUP: TFloatField
      FieldName = 'COD_AGLUTINACAO_SUP'
    end
    object QReg100TrimNUM_PLANO_CONTA: TStringField
      FieldName = 'NUM_PLANO_CONTA'
      Required = True
      Size = 15
    end
    object QReg100TrimDESC_PLANO_CONTA: TStringField
      FieldName = 'DESC_PLANO_CONTA'
      Required = True
      Size = 40
    end
    object QReg100TrimNUM_GRAU: TIntegerField
      FieldName = 'NUM_GRAU'
      Required = True
    end
    object QReg100TrimDESC_TIPO_BALANCO: TStringField
      FieldName = 'DESC_TIPO_BALANCO'
      Size = 1
    end
    object QReg100TrimVAL_ATUAL: TFloatField
      FieldName = 'VAL_ATUAL'
    end
    object QReg100TrimIND_DC: TStringField
      FieldName = 'IND_DC'
      Size = 1
    end
    object QReg100TrimVAL_CTA_INI: TFloatField
      FieldName = 'VAL_CTA_INI'
    end
    object QReg100TrimIND_DC_BAL_INI: TStringField
      FieldName = 'IND_DC_BAL_INI'
      Size = 1
    end
  end
end
