object DMContFiscK: TDMContFiscK
  OldCreateOrder = False
  Left = 431
  Top = 251
  Height = 264
  Width = 387
  object QReg155: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  P.NUM_PLANO_CONTA AS COD_CTA,'
      '  P.DESC_PLANO_CONTA,'
      '  --ABS(SUM(VAL_ANTERIOR)) AS VL_SLD_INI,'
      '  ABS('
      '    SUM('
      '      DECODE(S.DT_ANO_MES, :DT_ANO_MES_INI, S.VAL_ANTERIOR, 0)'
      '    ) '
      '  ) AS VL_SLD_INI,'
      '  CASE'
      
        '    WHEN SUM(DECODE(S.DT_ANO_MES, :DT_ANO_MES_INI, S.VAL_ANTERIO' +
        'R, 0)) > 0 THEN '#39'D'#39
      '    ELSE '#39'C'#39
      '  END AS IND_VL_SLD_INI,  '
      '  SUM(VAL_DEBITO) AS VL_DEB,  '
      '  ABS(SUM(VAL_CREDITO)) AS VL_CRED,'
      '  ABS('
      '    SUM( '
      '      DECODE(S.DT_ANO_MES, :DT_ANO_MES_FIN, S.VAL_ATUAL, 0)'
      '    )      '
      '  ) AS VL_SLD_FIN,'
      '  CASE'
      
        '    WHEN SUM(DECODE(S.DT_ANO_MES, :DT_ANO_MES_FIN, S.VAL_ATUAL, ' +
        '0)'
      #9') > 0 THEN '#39'D'#39
      '    ELSE '#39'C'#39
      '  END AS IND_VL_SLD_FIN  '
      'FROM'
      '  TB_PARAM_SISTEMA PS,'
      '  TB_SALDO_CONTABIL S'
      'INNER JOIN TB_PLANO_CONTA P'
      '  ON S.COD_PLANO_CONTA = P.COD_PLANO_CONTA'#9
      'INNER JOIN TB_PLANO_CONTA_REFERENCIAL R'
      
        '  ON P.COD_PLANO_CONTA_REFERENCIAL = R.COD_PLANO_CONTA_REFERENCI' +
        'AL'
      'WHERE'
      '  P.COD_REDUZIDO IS NOT NULL'
      'AND'
      '  --DT_ANO_MES = :DT_ANO_MES'
      '  DT_ANO_MES BETWEEN :DT_ANO_MES_INI AND :DT_ANO_MES_FIN'
      'AND'
      '  S.COD_FILIAL IN :FILIAIS'
      'AND'
      '  P.NUM_GRAU = PS.NUM_GRAUS_CONTABIL'
      'AND'
      '  P.DESC_NATUREZA_CONTA IN ('#39'01'#39', '#39'02'#39', '#39'03'#39')'
      '--AND'
      '--  SUBSTR(S.DT_ANO_MES, 5, 2) <> 12'
      'AND '
      '  P.IND_ENCERRAMENTO_EXERCICIO <> '#39'SIM'#39
      'HAVING'
      
        '  ((SUM(VAL_ANTERIOR) <> 0) OR (SUM(VAL_DEBITO) <> 0) OR (SUM(VA' +
        'L_CREDITO) <> 0) OR (SUM(VAL_ATUAL) <> 0)) '
      'GROUP BY'
      '  P.NUM_PLANO_CONTA,'
      '  P.DESC_PLANO_CONTA  ')
    Variables.Data = {
      0300000003000000080000003A46494C4941495301000000230000002853454C
      45435420434F445F46494C49414C2046524F4D2054425F46494C49414C290000
      0000000F0000003A44545F414E4F5F4D45535F494E4903000000000000000000
      00000F0000003A44545F414E4F5F4D45535F46494E0300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000800000007000000434F445F4354410100000000000A000000564C5F
      534C445F494E490100000000000E000000494E445F564C5F534C445F494E4901
      000000000006000000564C5F44454201000000000007000000564C5F43524544
      0100000000000A000000564C5F534C445F46494E0100000000000E000000494E
      445F564C5F534C445F46494E0100000000001C000000444553435F504C414E4F
      5F434F4E54415F5245464552454E4349414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 80
    Top = 8
    object QReg155COD_PLANO_CONTA: TIntegerField
      FieldName = 'COD_PLANO_CONTA'
      Required = True
    end
    object QReg155COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Required = True
      Size = 15
    end
    object QReg155VL_SLD_INI: TFloatField
      FieldName = 'VL_SLD_INI'
    end
    object QReg155IND_VL_SLD_INI: TStringField
      FieldName = 'IND_VL_SLD_INI'
      Size = 1
    end
    object QReg155VL_DEB: TFloatField
      FieldName = 'VL_DEB'
    end
    object QReg155VL_CRED: TFloatField
      FieldName = 'VL_CRED'
    end
    object QReg155VL_SLD_FIN: TFloatField
      FieldName = 'VL_SLD_FIN'
    end
    object QReg155IND_VL_SLD_FIN: TStringField
      FieldName = 'IND_VL_SLD_FIN'
      Size = 1
    end
    object QReg155DESC_PLANO_CONTA_REFERENCIAL: TStringField
      FieldName = 'DESC_PLANO_CONTA_REFERENCIAL'
      Size = 200
    end
  end
  object QReg355: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '  COD_CTA,'
      '  COD_CCUS,'
      '  ABS(VL_SLD_FIN) AS VL_SLD_FIN,'
      '  IND_VL_SLD_FIN,'
      '  COD_PLANO_CONTA,'
      '  TIPO'
      'FROM'
      '('
      '  /*'
      '  SELECT'
      '    P.NUM_PLANO_CONTA AS COD_CTA,'
      '    NULL AS COD_CCUS,  '
      '    SUM(S.VAL_ATUAL) AS VL_SLD_FIN,'
      '    CASE'
      '      WHEN SUM(S.VAL_ATUAL) >= 0 THEN '#39'D'#39
      '      ELSE '#39'C'#39
      '    END AS IND_VL_SLD_FIN,'
      '    P.COD_PLANO_CONTA,'
      '    '#39'ENCERRAMENTO'#39' AS TIPO'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_SALDO_CONTABIL_ENCERRAMENTO S'
      '  INNER JOIN TB_PLANO_CONTA P ON'
      '    P.COD_PLANO_CONTA = S.COD_PLANO_CONTA'
      '  WHERE'
      '    P.IND_LIBERADO_USO = '#39'SIM'#39
      '  AND'
      '    S.DT_ANO_MES = :DT_ANO_MES'
      '  AND'
      '    S.COD_FILIAL IN :FILIAIS'
      '  AND'
      '    P.DESC_NATUREZA_CONTA = '#39'04'#39
      '  AND'
      '    P.COD_REDUZIDO IS NOT NULL'
      '  AND'
      '    P.NUM_GRAU = PS.NUM_GRAUS_CONTABIL'
      '  AND '
      '    P.IND_ENCERRAMENTO_EXERCICIO <> '#39'SIM'#39
      '  AND'
      '    SUBSTR(S.DT_ANO_MES,5,2) <> '#39'12'#39
      '  AND'
      '    SUBSTR(:DT_ANO_MES,5,2) <> '#39'12'#39
      '  AND'
      
        '    (SELECT COUNT(*) FROM TB_SALDO_CONTABIL_ENCERRAMENTO X WHERE' +
        ' X.DT_ANO_MES = :DT_ANO_MES) > 0'
      '  GROUP BY'
      '    P.NUM_PLANO_CONTA,'
      '    P.COD_PLANO_CONTA'
      ''
      ''
      'UNION'
      '*/'
      ''
      '  SELECT'
      '    P.NUM_PLANO_CONTA AS COD_CTA,'
      '    NULL AS COD_CCUS,  '
      '    SUM(S.VAL_ATUAL) AS VL_SLD_FIN,'
      '    CASE'
      '      WHEN SUM(S.VAL_ATUAL) >= 0 THEN '#39'D'#39
      '      ELSE '#39'C'#39
      '    END AS IND_VL_SLD_FIN,'
      '    P.COD_PLANO_CONTA,'
      '    '#39'SALDO'#39' AS TIPO'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_SALDO_CONTABIL S'
      '  INNER JOIN TB_PLANO_CONTA P ON'
      '    P.COD_PLANO_CONTA = S.COD_PLANO_CONTA'
      '  WHERE'
      '    P.IND_LIBERADO_USO = '#39'SIM'#39
      '  AND'
      '    S.DT_ANO_MES = :DT_ANO_MES'
      '  AND'
      '    S.COD_FILIAL IN :FILIAIS'
      '  AND'
      '    P.DESC_NATUREZA_CONTA = '#39'04'#39
      '  AND'
      '    P.COD_REDUZIDO IS NOT NULL'
      '  AND'
      '    P.NUM_GRAU = PS.NUM_GRAUS_CONTABIL'
      '  AND '
      '    P.IND_ENCERRAMENTO_EXERCICIO <> '#39'SIM'#39
      '  AND'
      '    SUBSTR(S.DT_ANO_MES,5,2) <> '#39'12'#39
      '  AND'
      '    SUBSTR(:DT_ANO_MES,5,2) <> '#39'12'#39
      '  GROUP BY'
      '    P.NUM_PLANO_CONTA,'
      '    P.COD_PLANO_CONTA'
      '    '
      'UNION'
      ''
      '  SELECT'
      '    P.NUM_PLANO_CONTA AS COD_CTA,'
      '    NULL AS COD_CCUS,  '
      '    SUM(L.VAL_LANCAMENTO) AS VL_SLD_FIN,'
      '    CASE'
      '      WHEN SUM(L.VAL_LANCAMENTO) >= 0 THEN '#39'D'#39
      '      ELSE '#39'C'#39
      '    END AS IND_VL_SLD_FIN,'
      '    P.COD_PLANO_CONTA,'
      '    '#39'LAN'#199'AMENTO'#39' AS TIPO'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_LANCTO_CONTABIL L'
      '  INNER JOIN TB_PLANO_CONTA P ON'
      '    P.COD_PLANO_CONTA = L.COD_PLANO_CONTA'
      '  WHERE'
      '    P.IND_LIBERADO_USO = '#39'SIM'#39
      '  AND'
      
        '    L.DT_LANCAMENTO BETWEEN '#39'01/12/'#39'||SUBSTR(:DT_ANO_MES, 1, 4) ' +
        'AND '#39'31/12/'#39'||SUBSTR(:DT_ANO_MES, 1, 4) '
      '  AND'
      '    L.COD_FILIAL IN :FILIAIS'
      '  AND'
      '    P.DESC_NATUREZA_CONTA = '#39'04'#39
      '  AND'
      '    P.COD_REDUZIDO IS NOT NULL'
      '  AND'
      '    P.NUM_GRAU = PS.NUM_GRAUS_CONTABIL'
      '  AND '
      '    P.IND_ENCERRAMENTO_EXERCICIO <> '#39'SIM'#39
      '  AND'
      '    SUBSTR(L.DT_LANCAMENTO,4,2) = '#39'12'#39
      '  AND'
      '    SUBSTR(:DT_ANO_MES,5,2) = '#39'12'#39
      '  AND'
      
        '    L.COD_HISTORICO_CONTABIL <> PS.COD_HISTORICO_CONTABIL_ZERA_E' +
        'X'
      '/*'
      '  AND'
      
        '    (SELECT SUM(VAL_ATUAL) FROM TB_SALDO_CONTABIL_ENCERRAMENTO X' +
        ' WHERE X.DT_ANO_MES = :DT_ANO_MES'
      
        '          AND X.COD_PLANO_CONTA = P.COD_PLANO_CONTA AND X.COD_FI' +
        'LIAL IN :FILIAIS) = 0'
      '*/'
      '  GROUP BY'
      '    P.NUM_PLANO_CONTA,'
      '    P.COD_PLANO_CONTA    '
      ')'
      'WHERE  '
      '  VL_SLD_FIN <> 0  '
      'ORDER BY'
      '  COD_CTA')
    Variables.Data = {
      03000000020000000B0000003A44545F414E4F5F4D4553030000000000000000
      000000080000003A46494C4941495301000000230000002853454C4543542043
      4F445F46494C49414C2046524F4D2054425F46494C49414C290000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000007000000434F445F43544101000000000008000000434F44
      5F434355530100000000000A000000564C5F534C445F46494E0100000000000E
      000000494E445F564C5F534C445F46494E010000000000040000005449504F01
      00000000000F000000434F445F504C414E4F5F434F4E5441010000000000}
    Session = DMOracle.DBCemapa
    Left = 152
    Top = 8
    object QReg355COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Required = True
      Size = 15
    end
    object QReg355COD_CCUS: TStringField
      FieldName = 'COD_CCUS'
      Size = 1
    end
    object QReg355VL_SLD_FIN: TFloatField
      FieldName = 'VL_SLD_FIN'
    end
    object QReg355IND_VL_SLD_FIN: TStringField
      FieldName = 'IND_VL_SLD_FIN'
      Size = 1
    end
    object QReg355COD_PLANO_CONTA: TIntegerField
      FieldName = 'COD_PLANO_CONTA'
    end
  end
  object QReg030: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  :DT_INI_PERIODO AS DT_INI,'
      
        '  CAST(TO_CHAR(LAST_DAY(:DT_FIN_PERIODO), '#39'DD/MM/YYYY'#39')AS DATE) ' +
        'AS DT_FIN,'
      '  CASE'
      '    WHEN ((SUBSTR(:DT_INI_PERIODO, 1, 5) = '#39'01/01'#39')'
      '      AND (SUBSTR(:DT_FIN_PERIODO,1, 5) = '#39'31/12'#39')) THEN'
      '      '#39'A00'#39
      '    ELSE'
      
        '      DECODE(:DT_FIN_PERIODO, NULL, '#39#39', '#39'A'#39'||SUBSTR(:DT_FIN_PERI' +
        'ODO, 4, 2)) '
      '  END AS PER_APUR'
      ''
      'FROM'
      '  DUAL')
    Variables.Data = {
      03000000020000000F0000003A44545F494E495F504552494F444F0C00000000
      000000000000000F0000003A44545F46494E5F504552494F444F0C0000000000
      000000000000}
    Session = DMOracle.DBCemapa
    Left = 16
    Top = 8
  end
end
