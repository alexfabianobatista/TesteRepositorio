object DMContFiscP: TDMContFiscP
  OldCreateOrder = False
  Left = 625
  Top = 279
  Height = 293
  Width = 606
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
      'FROM'
      '  DUAL'
      ''
      ''
      ''
      ''
      '/*'
      'SELECT'
      '  :DT_INI_PERIODO AS DT_INI,'
      
        '  CAST(TO_CHAR(LAST_DAY(:DT_INI_PERIODO), '#39'DD/MM/YYYY'#39')AS DATE) ' +
        'AS DT_FIN,'
      
        '  DECODE(:DT_INI_PERIODO, NULL, '#39#39', '#39'A'#39'||SUBSTR(:DT_INI_PERIODO,' +
        ' 4, 2)) AS PER_APUR'
      'FROM'
      '  DUAL'
      '*/')
    Variables.Data = {
      03000000020000000F0000003A44545F494E495F504552494F444F0C00000000
      000000000000000F0000003A44545F46494E5F504552494F444F0C0000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000600000044545F494E490100000000000600000044545F46
      494E010000000000080000005045525F41505552010000000000}
    Session = DMOracle.DBCemapa
    Left = 32
    Top = 24
    object QReg030DT_INI: TDateTimeField
      FieldName = 'DT_INI'
    end
    object QReg030PER_APUR: TStringField
      FieldName = 'PER_APUR'
      Size = 3
    end
    object QReg030DT_FIN: TDateTimeField
      FieldName = 'DT_FIN'
    end
  end
  object QReg100: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  NUM_PLANO_CONTA_REFERENCIAL AS CODIGO,'
      '  DESC_PLANO_CONTA_REFERENCIAL AS DESCRICAO,'
      '  TIPO,'
      '  NUM_GRAU AS NIVEL,'
      '  DESC_NATUREZA_CONTA AS COD_NAT,'
      '  CASE'
      
        '    WHEN LENGTH(COD_CTA_SUP) = 13 THEN SUBSTR(COD_CTA_SUP, 1, 10' +
        ') '
      '    WHEN LENGTH(COD_CTA_SUP) = 10 THEN SUBSTR(COD_CTA_SUP, 1, 7)'
      '    WHEN LENGTH(COD_CTA_SUP) = 7 THEN SUBSTR(COD_CTA_SUP, 1, 4)'
      '    WHEN LENGTH(COD_CTA_SUP) = 4 THEN SUBSTR(COD_CTA_SUP, 1, 1)'
      '    ELSE NULL'
      '  END AS COD_CTA_SUP,'
      '  CASE '
      '    WHEN SUM(VAL_ANTERIOR) > 0 THEN '#39'D'#39
      '    ELSE '#39'C'#39
      '  END AS IND_VAL_CTA_REF_INI,'
      '  CASE'
      '    WHEN SUM(VAL_ATUAL) > 0 THEN '#39'D'#39
      '    ELSE '#39'C'#39
      '  END AS IND_VAL_CTA_REF_FIN,'
      '  ABS(SUM(VAL_ANTERIOR)) AS VAL_CTA_REF_INI,'
      '  ABS(SUM(VAL_ATUAL)) AS VAL_CTA_REF_FIN,'
      '  ABS(SUM(VAL_CTA_REF_DEB)) AS VAL_CTA_REF_DEB,'
      '  ABS(SUM(VAL_CTA_REF_CRED)) AS VAL_CTA_REF_CRED'
      'from'
      '('
      '  -- Traz os dados quando o per'#237'odo '#233' mensal'
      '  SELECT'
      '    TB_PLANO_CONTA_REFERENCIAL.NUM_PLANO_CONTA_REFERENCIAL,'
      '    TB_PLANO_CONTA_REFERENCIAL.DESC_PLANO_CONTA_REFERENCIAL,'
      '    DECODE('
      
        '      GRAU_CONTA_REFERENCIAL(TB_PLANO_CONTA_REFERENCIAL.NUM_PLAN' +
        'O_CONTA_REFERENCIAL)'
      '      , TB_PARAM_SISTEMA.NUM_GRAUS_CONTABIL'
      '      , '#39'A'#39
      '      , '#39'S'#39
      '    ) AS TIPO,'
      
        '    GRAU_CONTA_REFERENCIAL(TB_PLANO_CONTA_REFERENCIAL.NUM_PLANO_' +
        'CONTA_REFERENCIAL) AS NUM_GRAU,'
      '    TB_PLANO_CONTA.DESC_NATUREZA_CONTA,'
      
        '    TB_PLANO_CONTA_REFERENCIAL.NUM_PLANO_CONTA_REFERENCIAL AS CO' +
        'D_CTA_SUP,'
      '    Tb_saldo_contabil.DT_ANO_MES,    '
      '    SUM(Tb_saldo_contabil.VAL_ANTERIOR) AS VAL_ANTERIOR,'
      '    SUM(TB_SALDO_CONTABIL.VAL_ATUAL) AS VAL_ATUAL,'
      '    CASE'
      '        WHEN SUM(TB_SALDO_CONTABIL.VAL_ATUAL) > 0 THEN'
      '            SUM(TB_SALDO_CONTABIL.VAL_ATUAL)'
      '        ELSE'
      '            0'
      '    END AS VAL_CTA_REF_DEB,'
      '    CASE'
      '        WHEN SUM(TB_SALDO_CONTABIL.VAL_ATUAL) <= 0 THEN'
      '            SUM(TB_SALDO_CONTABIL.VAL_ATUAL)'
      '        ELSE'
      '            0'
      '    END AS VAL_CTA_REF_CRED'
      '  FROM'
      '     TB_PARAM_SISTEMA,'
      '     TB_SALDO_CONTABIL,'
      '     TB_PLANO_CONTA'
      '     LEFT JOIN TB_PLANO_CONTA_REFERENCIAL'
      '      ON TB_PLANO_CONTA.COD_PLANO_CONTA_REFERENCIAL '
      '      = TB_PLANO_CONTA_REFERENCIAL.COD_PLANO_CONTA_REFERENCIAL'
      '  WHERE'
      
        '    (Tb_saldo_contabil.COD_PLANO_CONTA = Tb_plano_conta.COD_PLAN' +
        'O_CONTA)'
      '    AND'
      '    (TB_PLANO_CONTA.NUM_PLANO_CONTA >= 1'
      '     AND'
      '      SUBSTR(TB_PLANO_CONTA.NUM_PLANO_CONTA,1,1) < 3)'
      '    AND'
      '    TB_SALDO_CONTABIL.COD_FILIAL IN :FILIAIS'
      '    AND'
      
        '    TB_SALDO_CONTABIL.DT_ANO_MES BETWEEN :DT_ANO_MES_INI AND :DT' +
        '_ANO_MES_FIN'
      '    AND'
      
        '    (SUBSTR(:DT_ANO_MES_INI, 5, 2) = SUBSTR(:DT_ANO_MES_FIN, 5, ' +
        '2))'
      '    AND '
      '    TB_PLANO_CONTA.IND_ENCERRAMENTO_EXERCICIO <> '#39'SIM'#39
      '    AND'
      '    :TRIMESTRAL = '#39'NAO'#39'    '#9
      ''
      '  GROUP BY'
      '    TB_PLANO_CONTA_REFERENCIAL.NUM_PLANO_CONTA_REFERENCIAL,'
      '    TB_PLANO_CONTA_REFERENCIAL.DESC_PLANO_CONTA_REFERENCIAL,'
      '    DECODE('
      
        '      GRAU_CONTA_REFERENCIAL(TB_PLANO_CONTA_REFERENCIAL.NUM_PLAN' +
        'O_CONTA_REFERENCIAL)'
      '      , TB_PARAM_SISTEMA.NUM_GRAUS_CONTABIL'
      '      , '#39'A'#39
      '      , '#39'S'#39
      '    ),'
      '    TB_PLANO_CONTA.NUM_GRAU,'
      '    TB_PLANO_CONTA.DESC_NATUREZA_CONTA,'
      '    TB_PLANO_CONTA_REFERENCIAL.NUM_PLANO_CONTA_REFERENCIAL,    '
      '    Tb_saldo_contabil.DT_ANO_MES'
      '    '
      '  UNION'
      '  '
      '-- Traz os dados quando o per'#237'odo '#233' anual'
      '  SELECT'
      '    TB_PLANO_CONTA_REFERENCIAL.NUM_PLANO_CONTA_REFERENCIAL,'
      '    TB_PLANO_CONTA_REFERENCIAL.DESC_PLANO_CONTA_REFERENCIAL,'
      '    DECODE('
      
        '      GRAU_CONTA_REFERENCIAL(TB_PLANO_CONTA_REFERENCIAL.NUM_PLAN' +
        'O_CONTA_REFERENCIAL)'
      '      , TB_PARAM_SISTEMA.NUM_GRAUS_CONTABIL'
      '      , '#39'A'#39
      '      , '#39'S'#39
      '    ) AS TIPO,'
      
        '    GRAU_CONTA_REFERENCIAL(TB_PLANO_CONTA_REFERENCIAL.NUM_PLANO_' +
        'CONTA_REFERENCIAL) AS NUM_GRAU,'
      '    TB_PLANO_CONTA.DESC_NATUREZA_CONTA,'
      
        '    TB_PLANO_CONTA_REFERENCIAL.NUM_PLANO_CONTA_REFERENCIAL AS CO' +
        'D_CTA_SUP,'
      '    Tb_saldo_contabil.DT_ANO_MES,    '
      '    CASE'
      
        '      WHEN SUBSTR(TB_SALDO_CONTABIL.DT_ANO_MES, 5, 2) = '#39'01'#39'  TH' +
        'EN'
      '        SUM(Tb_saldo_contabil.VAL_ANTERIOR) '
      '      ELSE'
      '        0'
      '    END AS VAL_ANTERIOR,'
      '    CASE'
      
        '      WHEN SUBSTR(TB_SALDO_CONTABIL.DT_ANO_MES, 5, 2) = '#39'12'#39'  TH' +
        'EN'
      '        SUM(TB_SALDO_CONTABIL.VAL_ATUAL)'
      '      ELSE'
      '        0'
      '    END AS VAL_ATUAL,'
      '    CASE'
      '        WHEN ('
      '            CASE'
      
        '                WHEN SUBSTR(TB_SALDO_CONTABIL.DT_ANO_MES, 5, 2) ' +
        '= '#39'12'#39'  THEN'
      '                    SUM(TB_SALDO_CONTABIL.VAL_ATUAL)'
      '                  ELSE'
      '                    0'
      '            END'
      '        ) > 0 THEN'
      '            SUM(TB_SALDO_CONTABIL.VAL_ATUAL)'
      '        ELSE'
      '            0'
      '    END AS VAL_CTA_REF_DEB,'
      '    CASE'
      '        WHEN ('
      '        '
      '            CASE'
      
        '              WHEN SUBSTR(TB_SALDO_CONTABIL.DT_ANO_MES, 5, 2) = ' +
        #39'12'#39'  THEN'
      '                SUM(TB_SALDO_CONTABIL.VAL_ATUAL)'
      '              ELSE'
      '                0'
      '            END'
      '        ) <= 0 THEN'
      '            SUM(TB_SALDO_CONTABIL.VAL_ATUAL)'
      '        ELSE'
      '            0'
      '    END AS VAL_CTA_REF_CRED'
      '  FROM'
      '     TB_PARAM_SISTEMA,'
      '     TB_SALDO_CONTABIL,'
      '     TB_PLANO_CONTA'
      '     LEFT JOIN TB_PLANO_CONTA_REFERENCIAL'
      '      ON TB_PLANO_CONTA.COD_PLANO_CONTA_REFERENCIAL '
      '      = TB_PLANO_CONTA_REFERENCIAL.COD_PLANO_CONTA_REFERENCIAL'
      '  WHERE'
      
        '    (Tb_saldo_contabil.COD_PLANO_CONTA = Tb_plano_conta.COD_PLAN' +
        'O_CONTA)'
      '    AND'
      '    (TB_PLANO_CONTA.NUM_PLANO_CONTA >= 1'
      '     AND'
      '      SUBSTR(TB_PLANO_CONTA.NUM_PLANO_CONTA,1,1) < 3)'
      '    AND'
      '    TB_SALDO_CONTABIL.COD_FILIAL IN :FILIAIS'
      '    AND'
      
        '    TB_SALDO_CONTABIL.DT_ANO_MES BETWEEN :DT_ANO_MES_INI AND :DT' +
        '_ANO_MES_FIN'
      '    AND'
      
        '    (SUBSTR(:DT_ANO_MES_INI, 5, 2) <> SUBSTR(:DT_ANO_MES_FIN, 5,' +
        ' 2))'
      '    AND '
      '    TB_PLANO_CONTA.IND_ENCERRAMENTO_EXERCICIO <> '#39'SIM'#39
      '    AND'
      '    :TRIMESTRAL = '#39'NAO'#39'    '#9
      '  GROUP BY'
      '    TB_PLANO_CONTA_REFERENCIAL.NUM_PLANO_CONTA_REFERENCIAL,'
      '    TB_PLANO_CONTA_REFERENCIAL.DESC_PLANO_CONTA_REFERENCIAL,'
      '    DECODE('
      
        '      GRAU_CONTA_REFERENCIAL(TB_PLANO_CONTA_REFERENCIAL.NUM_PLAN' +
        'O_CONTA_REFERENCIAL)'
      '      , TB_PARAM_SISTEMA.NUM_GRAUS_CONTABIL'
      '      , '#39'A'#39
      '      , '#39'S'#39
      '    ),'
      '    TB_PLANO_CONTA.NUM_GRAU,'
      '    TB_PLANO_CONTA.DESC_NATUREZA_CONTA,'
      '    TB_PLANO_CONTA_REFERENCIAL.NUM_PLANO_CONTA_REFERENCIAL,    '
      '    Tb_saldo_contabil.DT_ANO_MES'
      '    '
      '    UNION'
      '    '
      '    '
      '--Traz os dados quando o per'#237'odo '#233' TRIMESTRAL'
      'SELECT'
      '    TB_PLANO_CONTA_REFERENCIAL.NUM_PLANO_CONTA_REFERENCIAL,'
      '    TB_PLANO_CONTA_REFERENCIAL.DESC_PLANO_CONTA_REFERENCIAL,'
      '    DECODE('
      
        '      GRAU_CONTA_REFERENCIAL(TB_PLANO_CONTA_REFERENCIAL.NUM_PLAN' +
        'O_CONTA_REFERENCIAL)'
      '      , TB_PARAM_SISTEMA.NUM_GRAUS_CONTABIL'
      '      , '#39'A'#39
      '      , '#39'S'#39
      '    ) AS TIPO,'
      
        '    GRAU_CONTA_REFERENCIAL(TB_PLANO_CONTA_REFERENCIAL.NUM_PLANO_' +
        'CONTA_REFERENCIAL) AS NUM_GRAU,'
      '    TB_PLANO_CONTA.DESC_NATUREZA_CONTA,'
      
        '    TB_PLANO_CONTA_REFERENCIAL.NUM_PLANO_CONTA_REFERENCIAL AS CO' +
        'D_CTA_SUP,'
      '    Tb_saldo_contabil.DT_ANO_MES,    '
      '    CASE'
      
        '      WHEN SUBSTR(TB_SALDO_CONTABIL.DT_ANO_MES, 5, 2) IN ('#39'01'#39', ' +
        #39'04'#39', '#39'07'#39', '#39'10'#39')  THEN'
      '        SUM(Tb_saldo_contabil.VAL_ANTERIOR) '
      '      ELSE'
      '        0'
      '    END AS VAL_ANTERIOR,'
      '    CASE'
      
        '      WHEN SUBSTR(TB_SALDO_CONTABIL.DT_ANO_MES, 5, 2) IN ('#39'03'#39', ' +
        #39'06'#39', '#39'09'#39', '#39'12'#39')  THEN'
      '        SUM(TB_SALDO_CONTABIL.VAL_ATUAL)'
      '      ELSE'
      '        0'
      '    END AS VAL_ATUAL,'
      '    CASE'
      '        WHEN'
      '            SUM(TB_SALDO_CONTABIL.VAL_DEBITO) > 0 THEN'
      '                SUM(TB_SALDO_CONTABIL.VAL_DEBITO)'
      '        ELSE'
      '            0'
      '    END AS VAL_CTA_REF_DEB,'
      '    CASE'
      '        WHEN'
      '            SUM(TB_SALDO_CONTABIL.VAL_CREDITO) <= 0 THEN'
      '                SUM(TB_SALDO_CONTABIL.VAL_CREDITO)'
      '        ELSE'
      '            0'
      '    END AS VAL_CTA_REF_CRED'
      '  FROM'
      '     TB_PARAM_SISTEMA,'
      '     TB_SALDO_CONTABIL,'
      '     TB_PLANO_CONTA'
      '     LEFT JOIN TB_PLANO_CONTA_REFERENCIAL'
      '      ON TB_PLANO_CONTA.COD_PLANO_CONTA_REFERENCIAL '
      '      = TB_PLANO_CONTA_REFERENCIAL.COD_PLANO_CONTA_REFERENCIAL'
      '  WHERE'
      
        '    (Tb_saldo_contabil.COD_PLANO_CONTA = Tb_plano_conta.COD_PLAN' +
        'O_CONTA)'
      '    AND'
      '    (TB_PLANO_CONTA.NUM_PLANO_CONTA >= 1'
      '     AND'
      '      SUBSTR(TB_PLANO_CONTA.NUM_PLANO_CONTA,1,1) < 3)'
      '    AND'
      '    TB_SALDO_CONTABIL.COD_FILIAL IN :FILIAIS'
      '    AND'
      
        '    TB_SALDO_CONTABIL.DT_ANO_MES BETWEEN :DT_ANO_MES_INI AND :DT' +
        '_ANO_MES_FIN'
      '    AND'
      
        '    (SUBSTR(:DT_ANO_MES_INI, 5, 2) <> SUBSTR(:DT_ANO_MES_FIN, 5,' +
        ' 2))'
      '    AND '
      '    TB_PLANO_CONTA.IND_ENCERRAMENTO_EXERCICIO <> '#39'SIM'#39
      '    AND'
      '    :TRIMESTRAL = '#39'SIM'#39
      '  GROUP BY'
      '    TB_PLANO_CONTA_REFERENCIAL.NUM_PLANO_CONTA_REFERENCIAL,'
      '    TB_PLANO_CONTA_REFERENCIAL.DESC_PLANO_CONTA_REFERENCIAL,'
      '    DECODE('
      
        '      GRAU_CONTA_REFERENCIAL(TB_PLANO_CONTA_REFERENCIAL.NUM_PLAN' +
        'O_CONTA_REFERENCIAL)'
      '      , TB_PARAM_SISTEMA.NUM_GRAUS_CONTABIL'
      '      , '#39'A'#39
      '      , '#39'S'#39
      '    ),'
      '    TB_PLANO_CONTA.NUM_GRAU,'
      '    TB_PLANO_CONTA.DESC_NATUREZA_CONTA,'
      '    TB_PLANO_CONTA_REFERENCIAL.NUM_PLANO_CONTA_REFERENCIAL,    '
      '    Tb_saldo_contabil.DT_ANO_MES'
      '  '
      '    '
      ')'
      'GROUP BY '
      '  NUM_PLANO_CONTA_REFERENCIAL,'
      '  DESC_PLANO_CONTA_REFERENCIAL,'
      '  TIPO,'
      '  NUM_GRAU,'
      '  DESC_NATUREZA_CONTA,'
      '  COD_CTA_SUP  '
      'HAVING'
      
        '  (SUM(VAL_ATUAL) <> 0 OR SUM(VAL_ANTERIOR) <> 0) AND (NUM_PLANO' +
        '_CONTA_REFERENCIAL IS NOT NULL)'
      'ORDER BY'
      '  NUM_PLANO_CONTA_REFERENCIAL')
    Variables.Data = {
      0300000004000000080000003A46494C4941495301000000230000002853454C
      45435420434F445F46494C49414C2046524F4D2054425F46494C49414C290000
      0000000F0000003A44545F414E4F5F4D45535F494E4903000000000000000000
      00000F0000003A44545F414E4F5F4D45535F46494E0300000000000000000000
      000B0000003A5452494D45535452414C050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C000000040000005449504F010000000000050000004E4956454C01
      000000000007000000434F445F4E415401000000000013000000494E445F5641
      4C5F4354415F5245465F494E4901000000000013000000494E445F56414C5F43
      54415F5245465F46494E0100000000000F00000056414C5F4354415F5245465F
      494E490100000000000F00000056414C5F4354415F5245465F46494E01000000
      000006000000434F4449474F0100000000000900000044455343524943414F01
      00000000000B000000434F445F4354415F5355500100000000000F0000005641
      4C5F4354415F5245465F4445420100000000001000000056414C5F4354415F52
      45465F43524544010000000000}
    Session = DMOracle.DBCemapa
    Left = 88
    Top = 24
    object QReg100CODIGO: TStringField
      FieldName = 'CODIGO'
    end
    object QReg100DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object QReg100TIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object QReg100NIVEL: TIntegerField
      FieldName = 'NIVEL'
    end
    object QReg100COD_NAT: TStringField
      FieldName = 'COD_NAT'
      Size = 2
    end
    object QReg100COD_CTA_SUP: TStringField
      FieldName = 'COD_CTA_SUP'
    end
    object QReg100DT_ANO_MES: TIntegerField
      FieldName = 'DT_ANO_MES'
    end
    object QReg100IND_VAL_CTA_REF_INI: TStringField
      FieldName = 'IND_VAL_CTA_REF_INI'
      Size = 1
    end
    object QReg100IND_VAL_CTA_REF_FIN: TStringField
      FieldName = 'IND_VAL_CTA_REF_FIN'
      Size = 1
    end
    object QReg100VAL_CTA_REF_INI: TFloatField
      FieldName = 'VAL_CTA_REF_INI'
    end
    object QReg100VAL_CTA_REF_FIN: TFloatField
      FieldName = 'VAL_CTA_REF_FIN'
    end
    object QReg100VAL_CTA_REF_DEB: TFloatField
      FieldName = 'VAL_CTA_REF_DEB'
    end
    object QReg100VAL_CTA_REF_CRED: TFloatField
      FieldName = 'VAL_CTA_REF_CRED'
    end
  end
  object QReg130Saldo: TOracleDataSet1
    SQL.Strings = (
      'select'
      '  sum(val_atual) as val_atual'
      'FROM'
      '('
      '  SELECT'
      '    SUM(TB_SALDO_CONTABIL_ENCERRAMENTO.VAL_ATUAL) AS VAL_ATUAL'
      '  FROM'
      '    TB_SALDO_CONTABIL_ENCERRAMENTO, '
      '    TB_PLANO_CONTA, '
      '    TB_PLANO_CONTA_REFERENCIAL'
      '  WHERE'
      
        '    TB_SALDO_CONTABIL_ENCERRAMENTO.COD_PLANO_CONTA = TB_PLANO_CO' +
        'NTA.COD_PLANO_CONTA'
      '    AND'
      
        '    TB_PLANO_CONTA.COD_PLANO_CONTA_REFERENCIAL = TB_PLANO_CONTA_' +
        'REFERENCIAL.COD_PLANO_CONTA_REFERENCIAL'
      '    AND'
      
        '    TB_PLANO_CONTA_REFERENCIAL.COD_PLANO_CONTA_REFERENCIAL = :CO' +
        'D_PLANO_CONTA_REFERENCIAL'
      '    AND'
      
        '    TB_SALDO_CONTABIL_ENCERRAMENTO.COD_PLANO_CONTA = TB_PLANO_CO' +
        'NTA.COD_PLANO_CONTA'
      '    AND'
      '    TB_SALDO_CONTABIL_ENCERRAMENTO.DT_ANO_MES = :ANOMES'
      '    AND'
      '    :MES IN (3,6,9,12)'
      '    AND'
      
        '    (SELECT COUNT(*) FROM TB_SALDO_CONTABIL_ENCERRAMENTO X WHERE' +
        ' X.DT_ANO_MES = :ANOMES) > 0'
      '    AND'
      '    TB_SALDO_CONTABIL_ENCERRAMENTO.COD_FILIAL IN :FILIAIS'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    --SUM(TB_SALDO_CONTABIL.VAL_ATUAL) AS VAL_ATUAL'
      
        '    SUM(DECODE(COD_EMPRESA, '#39'ZAPOLI'#39', (VAL_ATUAL - VAL_ANTERIOR)' +
        ', VAL_ATUAL)) AS VAL_ATUAL'
      '  FROM'
      '    TB_PARAM_SISTEMA,'
      '    TB_SALDO_CONTABIL,'
      '    TB_PLANO_CONTA, '
      '    TB_PLANO_CONTA_REFERENCIAL'
      '  WHERE'
      
        '    TB_SALDO_CONTABIL.COD_PLANO_CONTA = TB_PLANO_CONTA.COD_PLANO' +
        '_CONTA'
      '    AND'
      
        '    TB_PLANO_CONTA.COD_PLANO_CONTA_REFERENCIAL = TB_PLANO_CONTA_' +
        'REFERENCIAL.COD_PLANO_CONTA_REFERENCIAL'
      '    AND'
      
        '    TB_PLANO_CONTA_REFERENCIAL.COD_PLANO_CONTA_REFERENCIAL = :CO' +
        'D_PLANO_CONTA_REFERENCIAL'
      '    AND'
      
        '    TB_SALDO_CONTABIL.COD_PLANO_CONTA = TB_PLANO_CONTA.COD_PLANO' +
        '_CONTA'
      '    AND'
      '    TB_SALDO_CONTABIL.DT_ANO_MES = :ANOMES'
      '    AND'
      '    ('
      '      ('
      '        :MES IN (3,6,9,12)'
      '        AND'
      
        '        (SELECT COUNT(*) FROM TB_SALDO_CONTABIL_ENCERRAMENTO X W' +
        'HERE X.DT_ANO_MES = :ANOMES) = 0'
      '      )'
      '      OR'
      '       :MES NOT IN (3,6,9,12)'
      '    )'
      '    AND'
      '    TB_SALDO_CONTABIL.COD_FILIAL IN :FILIAIS'
      ''
      '  UNION ALL'
      '    '
      '    -- FEITO PARA BUSCAR SALDOS DE CONTAS DEPOIS DO ENCERRAMENTO'
      
        '    -- NO DRE, AS CONTAS DO M'#202'S 12 ESTAVAM SAINDO ZERADAS POIS T' +
        'ANTO NA TABELA TB_SALDO_CONTABIL QUANTO NA TABELA TB_SALDO_CONTA' +
        'BIL_ENCERRAMENTO'
      '    -- ESTAVAM COM O VALOR ZERADO'
      
        '    -- AGORA EST'#193' BUSCANDO O VALOR DE ENCERRAMENTO DIRETO DOS LA' +
        'N'#199'AMENTOS CONT'#193'BEIS QUANDO FOR M'#202'S 12'
      '    -- MARLON 04/2017'
      
        '    -- DEVIDO ALTERA'#199#195'O DA PRESTA'#199#195'O TRIMESTRAL DA GRASEL, TAMB'#201 +
        'M FORAM INCL'#205'DOS OS MESES 3, 6 E 9 - '
      '    -- CLEBER 05/2020'
      '  SELECT'
      '    SUM(VAL_LANCAMENTO) * -1 AS VAL_ATUAL'
      '  FROM'
      '    TB_PARAM_SISTEMA,'
      '    TB_LANCTO_CONTABIL,'
      '    TB_PLANO_CONTA PC, '
      '    TB_PLANO_CONTA_REFERENCIAL'
      '  WHERE'
      '    TB_LANCTO_CONTABIL.COD_PLANO_CONTA = PC.COD_PLANO_CONTA'
      '    AND'
      
        '    PC.COD_PLANO_CONTA_REFERENCIAL = TB_PLANO_CONTA_REFERENCIAL.' +
        'COD_PLANO_CONTA_REFERENCIAL'
      '    AND'
      
        '    TB_PLANO_CONTA_REFERENCIAL.COD_PLANO_CONTA_REFERENCIAL = :CO' +
        'D_PLANO_CONTA_REFERENCIAL'
      '    AND'
      
        '    TO_CHAR(TB_LANCTO_CONTABIL.DT_LANCAMENTO, '#39'YYYYMM'#39') = :ANOME' +
        'S'
      '    AND'
      
        '    TB_LANCTO_CONTABIL.COD_HISTORICO_CONTABIL = TB_PARAM_SISTEMA' +
        '.COD_HISTORICO_CONTABIL_ZERA_EX'
      '    AND'
      '    ('
      '      ('
      '        :MES IN (3,6,9,12)'
      '        AND'
      
        '        (SELECT SUM(VAL_ATUAL) FROM TB_SALDO_CONTABIL_ENCERRAMEN' +
        'TO X WHERE X.DT_ANO_MES = :ANOMES'
      
        '          AND X.COD_PLANO_CONTA = PC.COD_PLANO_CONTA AND X.COD_F' +
        'ILIAL IN :FILIAIS) = 0'
      '      )      '
      '    )'
      '    AND'
      '    TB_LANCTO_CONTABIL.COD_FILIAL IN :FILIAIS   '
      ') ')
    Variables.Data = {
      0300000004000000080000003A46494C4941495301000000230000002853454C
      45435420434F445F46494C49414C2046524F4D2054425F46494C49414C290000
      000000070000003A414E4F4D4553030000000000000000000000040000003A4D
      45530300000000000000000000001C0000003A434F445F504C414E4F5F434F4E
      54415F5245464552454E4349414C030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000900000056414C5F415455414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 464
    Top = 24
    object QReg130SaldoVAL_ATUAL: TFloatField
      FieldName = 'VAL_ATUAL'
    end
  end
  object QReg130Contas: TOracleDataSet1
    SQL.Strings = (
      'select '
      '    TB_COMPOSICAO_CUSTOS.COD_COMPOSICAO_CUSTOS,'
      '    TB_COMPOSICAO_CUSTOS.DESC_COMPOSICAO_CUSTOS,'
      '    TB_COMPOSICAO_CUSTOS.IND_ATIVO,'
      '    TB_PLANO_CONTA_REFERENCIAL.COD_PLANO_CONTA_REFERENCIAL,'
      '    TB_PLANO_CONTA_REFERENCIAL.NUM_PLANO_CONTA_REFERENCIAL,'
      '    TB_PLANO_CONTA_REFERENCIAL.DESC_PLANO_CONTA_REFERENCIAL'
      'from TB_COMPOSICAO_CUSTOS '
      'inner join TB_CUSTOS_CONTA_REFERENCIAL on'
      
        'TB_COMPOSICAO_CUSTOS.COD_COMPOSICAO_CUSTOS = TB_CUSTOS_CONTA_REF' +
        'ERENCIAL.COD_COMPOSICAO_CUSTOS'
      'INNER JOIN TB_PLANO_CONTA_REFERENCIAL ON'
      
        'TB_CUSTOS_CONTA_REFERENCIAL.COD_PLANO_CONTA_REFERENCIAL = TB_PLA' +
        'NO_CONTA_REFERENCIAL.COD_PLANO_CONTA_REFERENCIAL'
      'order by TB_COMPOSICAO_CUSTOS.COD_COMPOSICAO_CUSTOS')
    QBEDefinition.QBEFieldDefs = {
      040000000600000015000000434F445F434F4D504F534943414F5F435553544F
      5301000000000016000000444553435F434F4D504F534943414F5F435553544F
      5301000000000009000000494E445F415449564F0100000000001B000000434F
      445F504C414E4F5F434F4E54415F5245464552454E4349414C0100000000001B
      0000004E554D5F504C414E4F5F434F4E54415F5245464552454E4349414C0100
      000000001C000000444553435F504C414E4F5F434F4E54415F5245464552454E
      4349414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 376
    Top = 24
    object QReg130ContasCOD_COMPOSICAO_CUSTOS: TIntegerField
      FieldName = 'COD_COMPOSICAO_CUSTOS'
      Required = True
    end
    object QReg130ContasDESC_COMPOSICAO_CUSTOS: TStringField
      FieldName = 'DESC_COMPOSICAO_CUSTOS'
      Required = True
      Size = 120
    end
    object QReg130ContasIND_ATIVO: TStringField
      FieldName = 'IND_ATIVO'
      Size = 3
    end
    object QReg130ContasCOD_PLANO_CONTA_REFERENCIAL: TIntegerField
      FieldName = 'COD_PLANO_CONTA_REFERENCIAL'
      Required = True
    end
    object QReg130ContasNUM_PLANO_CONTA_REFERENCIAL: TStringField
      FieldName = 'NUM_PLANO_CONTA_REFERENCIAL'
      Required = True
    end
    object QReg130ContasDESC_PLANO_CONTA_REFERENCIAL: TStringField
      FieldName = 'DESC_PLANO_CONTA_REFERENCIAL'
      Size = 200
    end
  end
  object QReg130: TOracleDataSet1
    SQL.Strings = (
      'SELECT * FROM TB_COMPOSICAO_CUSTOS'
      'WHERE IND_ATIVO = '#39'SIM'#39)
    QBEDefinition.QBEFieldDefs = {
      040000000300000015000000434F445F434F4D504F534943414F5F435553544F
      5301000000000016000000444553435F434F4D504F534943414F5F435553544F
      5301000000000009000000494E445F415449564F010000000000}
    Session = DMOracle.DBCemapa
    Left = 304
    Top = 24
    object QReg130COD_COMPOSICAO_CUSTOS: TIntegerField
      FieldName = 'COD_COMPOSICAO_CUSTOS'
      Required = True
    end
    object QReg130DESC_COMPOSICAO_CUSTOS: TStringField
      FieldName = 'DESC_COMPOSICAO_CUSTOS'
      Required = True
      Size = 120
    end
    object QReg130IND_ATIVO: TStringField
      FieldName = 'IND_ATIVO'
      Size = 3
    end
  end
end
