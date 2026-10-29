object DMSpedRel: TDMSpedRel
  OldCreateOrder = False
  Left = 564
  Top = 328
  Height = 201
  Width = 323
  object QRPisCofinsOperacao: TOracleDataSet1
    SQL.Strings = (
      'SELECT DISTINCT'
      '  COD_OPERACAO,'
      '  DESC_OPERACAO,'
      '  MODELO,'
      
        '  DECODE(IND_ENTRADA_SAIDA,'#39'E'#39','#39'CR'#201'DITOS'#39', '#39'D'#201'BITOS'#39') AS IND_ENT' +
        'RADA_SAIDA,'
      '  '
      '  SUM('
      '    CASE'
      
        '      WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODEL' +
        'O = '#39'98'#39')) THEN'
      '        0'
      #9' --VAL_BC'
      '      ELSE'
      '        VAL_BC'
      '    END'
      '  ) AS VAL_BC,'
      '  '
      '  TRUNC('
      '      SUM('
      '        CASE'
      
        '          WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_M' +
        'ODELO = '#39'98'#39')) THEN'
      '            0'
      '            --VAL_PIS'
      '          ELSE'
      '            (VAL_PIS + NVL(VAL_PIS_IMPOSTO, 0))'
      '        END'
      '      )'
      '  ,2) AS VAL_PIS,'
      '  '
      '  TRUNC('
      '      SUM('
      '        CASE'
      
        '          WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_M' +
        'ODELO = '#39'98'#39')) THEN'
      '            0'
      '            --VAL_COFINS'
      '          ELSE'
      '            (VAL_COFINS + NVL(VAL_COFINS_IMPOSTO, 0))'
      '        END'
      '      )'
      '  ,2) AS VAL_COFINS,'
      '  '
      '  TRUNC(SUM(VAL_IPI),2) AS VAL_IPI,'
      '  TRUNC(SUM(VAL_ICMS_SUBST),2) AS VAL_ICMS_SUBST'
      'FROM('
      '  SELECT --NOTAS REGIME N'#195'O CUMULATIVO (LUCRO REAL)'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA) IND_ENTRADA_SAIDA,       '
      '    '
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESAS)' +
        ' - SUM(PEGA_DESCONTO_ITEM(I.COD_NOTA_ITEM))),    '
      '    SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    '
      '    SUM(I.VAL_PIS) AS VAL_PIS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) AS VAL_COFINS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_COFINS_IMPOSTO,'
      '    SUM(I.VAL_IPI) AS VAL_IPI,'
      '    SUM(I.VAL_ICMS_SUBST) AS VAL_ICMS_SUBST,'
      '    I.COD_CST_PIS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND ((NVL(O.PERC_BASE_PIS, -1) >= 0) AND (NVL(O.PERC_BAS' +
        'E_COFINS,-1) >= 0)) '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO,'
      '    N.COD_NOTA_CAB,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),'
      '    O.PERC_BASE_PIS,'
      '    N.VAL_DESPESAS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    I.COD_CST_PIS'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    C.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO, '
      '    O.IND_TIPO_OPERACAO IND_ENTRADA_SAIDA,  '
      '    '
      '    DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)),'
      '      (DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)) * C.PERC_DESCONTO_FRETE' +
        ' / 100)) AS VAL_BC,'
      '    '
      '    C.VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    C.VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO,'
      '    0 AS VAL_PIS,'
      '    0 AS VAL_ICMS_SUBST,'
      '    C.COD_CST_PIS'
      '  FROM'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND ((NVL(O.PERC_BASE_PIS, -1) >= 0) AND (NVL(O.PERC_BAS' +
        'E_COFINS,-1) >= 0))'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CAD' +
        'ASTRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL = :FILIAL'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    C.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,   '
      '    O.IND_TIPO_OPERACAO IND_ENTRADA_SAIDA,'
      '    '
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '    (C.VAL_FRETE*O.PERC_BASE_PIS/100) + NVL(C.VAL_PEDAGIO,0)) AS' +
        ' VAL_BC,'
      '    '
      '    C.VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    C.VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO,'
      '    0 AS VAL_IPI,'
      '    0 AS VAL_ICMS_SUBST,'
      '    NULL AS COD_CST_PIS'
      '  FROM'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND ((NVL(O.PERC_BASE_PIS, -1) >= 0) AND (NVL(O.PERC_BAS' +
        'E_COFINS,-1) >= 0))'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CAD' +
        'ASTRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL = :FILIAL'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --N    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,  '
      '    N.IND_ENTRADA_SAIDA,  '
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '    SUM((I.VAL_TOTAL*O.PERC_BASE_PIS/100)) + SUM(I.VAL_DESPESAS)' +
        ' - SUM(PEGA_DESCONTO_ITEM(I.COD_NOTA_ITEM))) AS VAL_BC,'
      '    SUM(I.VAL_PIS) VAL_PIS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) VAL_COFINS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_COFINS_IMPOSTO,'
      '    SUM(I.VAL_IPI) AS VAL_IPI,'
      '    SUM(I.VAL_ICMS_SUBST) AS VAL_ICMS_SUBST,'
      '    I.COD_CST_PIS'
      '  FROM'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND ((NVL(O.PERC_BASE_PIS, -1) >= 0) AND (NVL(O.PERC_BAS' +
        'E_COFINS,-1) >= 0))'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    O.NUM_LIVROS = 10'
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.IND_TIPO_FRETE = '#39'FOB'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO,'
      '    N.COD_NOTA_CAB,'
      '    IND_ENTRADA_SAIDA,'
      '    O.PERC_BASE_PIS,'
      '    N.VAL_DESPESAS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    I.COD_CST_PIS'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --I    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_OPERACAO_CF AS COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,   '
      '    N.IND_ENTRADA_SAIDA,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '    (N.VAL_FRETE*O.PERC_BASE_PIS/100)) AS VL_BC,'
      '    N.VAL_FRETE * PS.PERC_PIS / 100 AS VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    N.VAL_FRETE * PS.PERC_COFINS / 100 AS VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO,'
      '    0 AS VAL_IPI, '
      '    0 AS VAL_ICMS_SUBST,'
      '    NULL AS COD_CST_PIS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND ((NVL(O.PERC_BASE_PIS, -1) >= 0) AND (NVL(O.PERC_BAS' +
        'E_COFINS,-1) >= 0))'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO_CF = S' +
        'M.COD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.NUM_CONHECIMENTO_FRETE IS NOT NULL'
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.IND_TIPO_FRETE = '#39'FOB'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    '
      '    UNION ALL'
      '    '
      '    SELECT --CUPOM FISCAL   '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA) IND_ENTRADA_SAIDA,   '
      '    '
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESAS)' +
        ' - SUM(PEGA_DESCONTO_ITEM(I.COD_NOTA_ITEM))),    '
      '    SUM(I.VAL_BC_DI)) AS VAL_BC,    '
      '    '
      '    SUM(I.VAL_PIS) AS VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) AS VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO,'
      '    SUM(I.VAL_IPI) AS VAL_IPI,'
      '    SUM(I.VAL_ICMS_SUBST) AS VAL_ICMS_SUBST,'
      '    I.COD_CST_PIS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND ((NVL(O.PERC_BASE_PIS, -1) >= 0) AND (NVL(O.PERC_BAS' +
        'E_COFINS,-1) >= 0)) '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'S'#39')'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY       '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO,'
      '    N.COD_NOTA_CAB,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),'
      '    O.PERC_BASE_PIS,'
      '    N.VAL_DESPESAS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    I.COD_CST_PIS'
      '    '
      '    '
      '    UNION ALL'
      '    '
      '    '
      '    SELECT --NOTAS REGIME CUMULATIVO (LUCRO PRESUMIDO)    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA) IND_ENTRADA_SAIDA,   '
      '    '
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100)),    '
      '    SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    SUM(I.VAL_PIS) AS VAL_PIS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0)'
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_PIS_IMPOSTO,'
      '    '
      '    SUM(I.VAL_CONFINS) AS VAL_COFINS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0)'
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_COFINS_IMPOSTO,'
      '    '
      '    SUM(I.VAL_IPI) AS VAL_IPI,'
      '    SUM(I.VAL_ICMS_SUBST) AS VAL_ICMS_SUBST,'
      '    I.COD_CST_PIS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND ((NVL(O.PERC_BASE_PIS, -1) >= 0) AND (NVL(O.PERC_BAS' +
        'E_COFINS,-1) >= 0)) '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O      '
      '  WHERE'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY       '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO,'
      '    N.COD_NOTA_CAB,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),'
      '    O.PERC_BASE_PIS,'
      '    N.VAL_DESPESAS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    I.COD_CST_PIS'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO    '
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    C.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO, '
      '    O.IND_TIPO_OPERACAO IND_ENTRADA_SAIDA,'
      '    (C.VAL_FRETE*O.PERC_BASE_PIS/100) AS VAL_BC,    '
      '    C.VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    C.VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO,'
      '    0 AS VAL_IPI,'
      '    0 AS VAL_ICMS_SUBST,'
      '    C.COD_CST_PIS'
      '  FROM'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND ((NVL(O.PERC_BASE_PIS, -1) >= 0) AND (NVL(O.PERC_BAS' +
        'E_COFINS,-1) >= 0))'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CAD' +
        'ASTRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL = :FILIAL'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO FRETE    '
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    C.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,   '
      '    O.IND_TIPO_OPERACAO IND_ENTRADA_SAIDA,  '
      '    (C.VAL_FRETE*O.PERC_BASE_PIS/100) AS VAL_BC,    '
      '    C.VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    C.VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO,'
      '    0 AS VAL_IPI,'
      '    0 AS VAL_ICMS_SUBST,'
      '    NULL AS COD_CST_PIS'
      '  FROM'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND ((NVL(O.PERC_BASE_PIS, -1) >= 0) AND (NVL(O.PERC_BAS' +
        'E_COFINS,-1) >= 0))'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO CAD ON CAD.COD_CADASTRO = C.COD_CAD' +
        'ASTRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL = :FILIAL'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --N    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,  '
      '    N.IND_ENTRADA_SAIDA,  '
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '    SUM((I.VAL_TOTAL*O.PERC_BASE_PIS/100))) AS VAL_BC,'
      '    SUM(I.VAL_PIS) VAL_PIS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0)'
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) VAL_COFINS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0)'
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_COFINS_IMPOSTO,'
      '    SUM(I.VAL_IPI) AS VAL_IPI,'
      '    SUM(I.VAL_ICMS_SUBST) AS VAL_ICMS_SUBST,'
      '    I.COD_CST_PIS'
      '  FROM'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND ((NVL(O.PERC_BASE_PIS, -1) >= 0) AND (NVL(O.PERC_BAS' +
        'E_COFINS,-1) >= 0))'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    O.NUM_LIVROS = 10'
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.IND_TIPO_FRETE = '#39'FOB'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO,'
      '    N.COD_NOTA_CAB,'
      '    IND_ENTRADA_SAIDA,'
      '    O.PERC_BASE_PIS,'
      '    N.VAL_DESPESAS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    I.COD_CST_PIS'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --I    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_OPERACAO_CF AS COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,   '
      '    N.IND_ENTRADA_SAIDA,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '    (N.VAL_FRETE*O.PERC_BASE_PIS/100)) AS VL_BC,'
      '    N.VAL_FRETE * PS.PERC_PIS / 100 AS VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    N.VAL_FRETE * PS.PERC_COFINS / 100 AS VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO,'
      '    0 AS VAL_IPI,'
      '    0 AS VAL_ICMS_SUBST,'
      '    NULL AS COD_CST_PIS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND ((NVL(O.PERC_BASE_PIS, -1) >= 0) AND (NVL(O.PERC_BAS' +
        'E_COFINS,-1) >= 0))'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO_CF = S' +
        'M.COD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.NUM_CONHECIMENTO_FRETE IS NOT NULL'
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.IND_TIPO_FRETE = '#39'FOB'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CUPOM FISCAL   '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA) IND_ENTRADA_SAIDA,   '
      '    '
      '    /*'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100) - SUM(I.VAL_IPI) - SU' +
        'M(I.VAL_ICMS_SUBST)),    '
      '    SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    */    '
      '    '
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100)),    '
      '    SUM(I.VAL_BC_DI)) AS VAL_BC,    '
      '    '
      '    /*DECODE('#39'D'#39','
      
        '      (SELECT '#39'D'#39' FROM DUAL WHERE '#39'D'#39' IN((SELECT IND_VENDAS FROM' +
        ' TB_OPERACAO WHERE COD_OPERACAO = N.COD_OPERACAO))),'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100) * -1,'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100)) AS VAL_BC,*/'
      '    '
      '    SUM(I.VAL_PIS) AS VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) AS VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO,'
      '    SUM(I.VAL_IPI) AS VAL_IPI,'
      '    SUM(I.VAL_ICMS_SUBST) AS VAL_ICMS_SUBST,'
      '    I.COD_CST_PIS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND ((NVL(O.PERC_BASE_PIS, -1) >= 0) AND (NVL(O.PERC_BAS' +
        'E_COFINS,-1) >= 0)) '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'S'#39')    '
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY       '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO,'
      '    N.COD_NOTA_CAB,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),'
      '    O.PERC_BASE_PIS,'
      '    N.VAL_DESPESAS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    I.COD_CST_PIS'
      ')'
      'GROUP BY'
      '  COD_OPERACAO,'
      '  DESC_OPERACAO,'
      '  MODELO,'
      '  IND_ENTRADA_SAIDA,'
      '  COD_CST_PIS'
      
        'HAVING COD_CST_PIS NOT IN ('#39'04'#39','#39'06'#39','#39'07'#39','#39'08'#39','#39'09'#39','#39'49'#39','#39'61'#39','#39'6' +
        '5'#39','#39'70'#39','#39'71'#39','#39'72'#39','#39'73'#39','#39'74'#39')'
      ''
      'ORDER BY'
      '  IND_ENTRADA_SAIDA, MODELO, DESC_OPERACAO')
    Variables.Data = {
      0300000003000000070000003A46494C49414C03000000000000000000000007
      0000003A44545F494E490C0000000000000000000000070000003A44545F4649
      4E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000C000000434F445F4F5045524143414F0100000000000D00
      0000444553435F4F5045524143414F010000000000060000004D4F44454C4F01
      00000000000600000056414C5F42430100000000000700000056414C5F504953
      0100000000000A00000056414C5F434F46494E5301000000000011000000494E
      445F454E54524144415F53414944410100000000000700000056414C5F495049
      0100000000000E00000056414C5F49434D535F5355425354010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 16
    object QRPisCofinsOperacaoCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
    end
    object QRPisCofinsOperacaoDESC_OPERACAO: TStringField
      FieldName = 'DESC_OPERACAO'
      Size = 50
    end
    object QRPisCofinsOperacaoMODELO: TStringField
      FieldName = 'MODELO'
      Size = 100
    end
    object QRPisCofinsOperacaoVAL_BC: TFloatField
      FieldName = 'VAL_BC'
    end
    object QRPisCofinsOperacaoIND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 8
    end
    object QRPisCofinsOperacaoVAL_PIS: TFloatField
      FieldName = 'VAL_PIS'
    end
    object QRPisCofinsOperacaoVAL_COFINS: TFloatField
      FieldName = 'VAL_COFINS'
    end
    object QRPisCofinsOperacaoVAL_IPI: TFloatField
      FieldName = 'VAL_IPI'
    end
    object QRPisCofinsOperacaoVAL_ICMS_SUBST: TFloatField
      FieldName = 'VAL_ICMS_SUBST'
    end
  end
  object QRPisCofinsNota: TOracleDataSet1
    SQL.Strings = (
      '-- SQL NOTAS'
      'SELECT DISTINCT'
      '  COD_NOTA,'
      '  CAST(NUM_NOTA AS FLOAT) NUM_NOTA,'
      '  DT_RECEBIMENTO,  '
      '  COD_OPERACAO,'
      '  DESC_OPERACAO,'
      '  MODELO,'
      
        '  DECODE(IND_ENTRADA_SAIDA,'#39'E'#39','#39'CR'#201'DITOS'#39', '#39'D'#201'BITOS'#39') AS IND_ENT' +
        'RADA_SAIDA,'
      '  TIPO,'
      '  '
      '  CASE '
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '      --VAL_BC'
      '    ELSE'
      '      VAL_BC'
      '  END AS VAL_BC,'
      '  '
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '      --VAL_PIS'
      '    ELSE'
      '      TRUNC(VAL_PIS + NVL(VAL_PIS_IMPOSTO, 0),2)'
      '  END AS VAL_PIS,'
      '  '
      '  CASE '
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '      --VAL_COFINS'
      '    ELSE'
      '    TRUNC(VAL_COFINS + NVL(VAL_COFINS_IMPOSTO, 0),2) '
      '  END AS VAL_COFINS,'
      '  '
      '  TRUNC(VAL_IPI,2) AS VAL_IPI,'
      '  TRUNC(VAL_ICMS_SUBST,2) AS VAL_ICMS_SUBST'
      'FROM('
      '  SELECT'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_NOTA_CAB AS COD_NOTA,'
      '    N.NUM_NOTA,'
      '    N.DT_RECEBIMENTO,    '
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA) IND_ENTRADA_SAIDA,'
      '    '#39'NOTAS'#39' AS TIPO,    '
      '    '
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,  '
      '    '
      '    SUM(I.VAL_PIS) AS VAL_PIS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) AS VAL_COFINS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0)'
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_COFINS_IMPOSTO,'
      '    SUM(I.VAL_IPI) AS VAL_IPI,'
      '    SUM(I.VAL_ICMS_SUBST) AS VAL_ICMS_SUBST,'
      '    I.COD_CST_PIS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_NOTA_CAB,'
      '    N.NUM_NOTA,'
      '    N.DT_RECEBIMENTO,    '
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),   '
      '    PS.PERC_PIS,'
      '    PS.PERC_COFINS,'
      '    '#39'NOTAS'#39','
      '    I.VAL_BC_DI,'
      '    O.PERC_BASE_PIS,'
      '    N.VAL_DESPESAS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    I.COD_CST_PIS'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    C.COD_CONHECIMENTO AS COD_NOTA,'
      '    C.NUM_CONHECIMENTO AS NUM_NOTA,'
      '    C.DT_RECEBIMENTO,'
      '    C.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,'
      '    O.IND_TIPO_OPERACAO AS IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39' AS TIPO,'
      '    DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)),'
      '      (DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)) * C.PERC_DESCONTO_FRETE' +
        ' / 100)) AS VAL_BC,'
      '      '
      '    C.VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    C.VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO,'
      '    0 AS VAL_IPI,'
      '    0 AS VAL_ICMS_SUBST,'
      '    C.COD_CST_PIS'
      '  FROM'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = C.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CAD' +
        'ASTRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL = :FILIAL'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    C.COD_CONHECIMENTO_FRETE AS COD_NOTA,'
      '    C.NUM_FRETE AS NUM_NOTA,'
      '    C.DT_RECEBIMENTO,'
      '    C.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,'
      '    O.IND_TIPO_OPERACAO AS IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39' AS TIPO,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100) + NVL(C.VAL_PEDAGIO,0)) ' +
        'AS VAL_BC,'
      '    C.VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    C.VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO,'
      '    0 AS VAL_IPI,'
      '    0 AS VAL_ICMS_SUBST,'
      '    NULL AS COD_CST_PIS'
      '  FROM'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CAD' +
        'ASTRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL = :FILIAL'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --N'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_NOTA_CAB AS COD_NOTA,'
      '    N.NUM_NOTA,'
      '    N.DT_RECEBIMENTO,'
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39' AS TIPO,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM((I.VAL_TOTAL*O.PERC_BASE_PIS/100)) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) AS VAL_BC,'
      '    SUM(I.VAL_PIS) VAL_PIS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) VAL_COFINS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_COFINS_IMPOSTO,'
      '    SUM(I.VAL_IPI) AS VAL_IPI,'
      '    SUM(I.VAL_ICMS_SUBST) AS VAL_ICMS_SUBST,'
      '    I.COD_CST_PIS'
      '  FROM'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    O.NUM_LIVROS = 10'
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.IND_TIPO_FRETE = '#39'FOB'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_NOTA_CAB,'
      '    N.NUM_NOTA,'
      '    N.DT_RECEBIMENTO,'
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39','
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    I.COD_CST_PIS'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --I'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_NOTA_CAB AS COD_NOTA,'
      '    N.NUM_CONHECIMENTO_FRETE AS NUM_NOTA,'
      '    N.DT_RECEBIMENTO AS DT_RECEBIMENTO,'
      '    N.COD_OPERACAO_CF AS COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39' AS TIPO,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_PIS/100)) AS VL_BC,'
      '    N.VAL_FRETE * PS.PERC_PIS / 100 AS VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    N.VAL_FRETE * PS.PERC_COFINS / 100 AS VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO,'
      '    0 AS VAL_IPI,'
      '    0 AS VAL_ICMS_SUBST,'
      '    NULL AS COD_CST_PIS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO_CF = S' +
        'M.COD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.NUM_CONHECIMENTO_FRETE IS NOT NULL'
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.IND_TIPO_FRETE = '#39'FOB'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  '
      '  UNION'
      '  '
      '  SELECT'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_NOTA_CAB AS COD_NOTA,'
      '    N.NUM_NOTA,'
      '    N.DT_RECEBIMENTO,    '
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA) IND_ENTRADA_SAIDA,'
      '    '#39'CUPOM FISCAL'#39' AS TIPO,    '
      '    '
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,    '
      '    SUM(I.VAL_PIS) AS VAL_PIS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) AS VAL_COFINS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_COFINS_IMPOSTO,'
      '    SUM(I.VAL_IPI) AS VAL_IPI,'
      '    SUM(I.VAL_ICMS_SUBST) AS VAL_ICMS_SUBST,'
      '    I.COD_CST_PIS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      
        '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'SIM'#39')   ' +
        ' '
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_NOTA_CAB,'
      '    N.NUM_NOTA,'
      '    N.DT_RECEBIMENTO,    '
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),   '
      '    PS.PERC_PIS,'
      '    PS.PERC_COFINS,'
      '    '#39'CUPOM FISCAL'#39','
      '    I.VAL_BC_DI,'
      '    O.PERC_BASE_PIS,'
      '    N.VAL_DESPESAS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    I.COD_CST_PIS'
      '        '
      '    UNION --NOTAS REGIME CUMULATIVO (LUCRO PRESUMIDO)'
      '    '
      '    SELECT'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_NOTA_CAB AS COD_NOTA,'
      '    N.NUM_NOTA,'
      '    N.DT_RECEBIMENTO,    '
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA) IND_ENTRADA_SAIDA,'
      '    '#39'NOTAS'#39' AS TIPO,    '
      '    '
      '    /*DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100) - SUM(I.VAL_IPI) - SU' +
        'M(I.VAL_ICMS_SUBST)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,*/'
      '      '
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '      '
      '    /*DECODE('#39'D'#39','
      
        '      (SELECT '#39'D'#39' FROM DUAL WHERE '#39'D'#39' IN((SELECT IND_VENDAS FROM' +
        ' TB_OPERACAO WHERE COD_OPERACAO = N.COD_OPERACAO))),'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100) * -1,'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100)) AS VAL_BC,*/'
      '    '
      '    SUM(I.VAL_PIS) AS VAL_PIS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) AS VAL_COFINS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_COFINS_IMPOSTO,'
      '    SUM(I.VAL_IPI) AS VAL_IPI,'
      '    SUM(I.VAL_ICMS_SUBST) AS VAL_ICMS_SUBST,'
      '    I.COD_CST_PIS    '
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_NOTA_CAB,'
      '    N.NUM_NOTA,'
      '    N.DT_RECEBIMENTO,    '
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),   '
      '    N.VAL_DESPESAS,'
      '    PS.PERC_PIS,'
      '    PS.PERC_COFINS,'
      '    '#39'NOTAS'#39','
      '    I.VAL_BC_DI,'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    I.COD_CST_PIS'
      '    '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    C.COD_CONHECIMENTO AS COD_NOTA,'
      '    C.NUM_CONHECIMENTO AS NUM_NOTA,'
      '    C.DT_RECEBIMENTO,'
      '    C.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,'
      '    O.IND_TIPO_OPERACAO AS IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39' AS TIPO,   '
      '      '
      '    (C.VAL_FRETE*O.PERC_BASE_PIS/100) AS VAL_BC,'
      '      '
      '    C.VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    C.VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO,'
      '    0 AS VAL_IPI,'
      '    0 AS VAL_ICMS_SUBST,'
      '    C.COD_CST_PIS'
      '  FROM'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = C.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CAD' +
        'ASTRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL = :FILIAL'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN '
      '  '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    C.COD_CONHECIMENTO_FRETE AS COD_NOTA,'
      '    C.NUM_FRETE AS NUM_NOTA,'
      '    C.DT_RECEBIMENTO,'
      '    C.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,'
      '    O.IND_TIPO_OPERACAO AS IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39' AS TIPO,'
      '    (C.VAL_FRETE*O.PERC_BASE_PIS/100) AS VAL_BC,'
      '    C.VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    C.VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO,'
      '    0 AS VAL_IPI,'
      '    0 AS VAL_ICMS_SUBST,'
      '    NULL AS COD_CST_PIS'
      '  FROM'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CAD' +
        'ASTRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL = :FILIAL'
      '    '
      '  UNION'
      '  '
      '  SELECT --N'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_NOTA_CAB AS COD_NOTA,'
      '    N.NUM_NOTA,'
      '    N.DT_RECEBIMENTO,'
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39' AS TIPO,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      SUM((I.VAL_TOTAL*O.PERC_BASE_PIS/100))) AS VAL_BC,'
      '    SUM(I.VAL_PIS) VAL_PIS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) VAL_COFINS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_COFINS_IMPOSTO,'
      '    SUM(I.VAL_IPI) AS VAL_IPI,'
      '    SUM(I.VAL_ICMS_SUBST) AS VAL_ICMS_SUBST,'
      '    I.COD_CST_PIS'
      '  FROM'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    O.NUM_LIVROS = 10'
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.IND_TIPO_FRETE = '#39'FOB'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_NOTA_CAB,'
      '    N.NUM_NOTA,'
      '    N.DT_RECEBIMENTO,'
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39','
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    I.COD_CST_PIS'
      '    '
      '  UNION'
      '  '
      '  SELECT --I'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_NOTA_CAB AS COD_NOTA,'
      '    N.NUM_CONHECIMENTO_FRETE AS NUM_NOTA,'
      '    N.DT_RECEBIMENTO AS DT_RECEBIMENTO,'
      '    N.COD_OPERACAO_CF AS COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39' AS TIPO,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_PIS/100)) AS VL_BC,'
      '    N.VAL_FRETE * PS.PERC_PIS / 100 AS VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    N.VAL_FRETE * PS.PERC_COFINS / 100 AS VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO,'
      '    0 AS VAL_IPI,'
      '    0 AS VAL_ICMS_SUBST,'
      '    NULL AS COD_CST_PIS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO_CF = S' +
        'M.COD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.NUM_CONHECIMENTO_FRETE IS NOT NULL'
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.IND_TIPO_FRETE = '#39'FOB'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    '
      '  UNION'
      '  '
      '  SELECT'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_NOTA_CAB AS COD_NOTA,'
      '    N.NUM_NOTA,'
      '    N.DT_RECEBIMENTO,    '
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA) IND_ENTRADA_SAIDA,'
      '    '#39'CUPOM FISCAL'#39' AS TIPO,    '
      '    '
      '    /*DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100) - SUM(I.VAL_IPI) - SU' +
        'M(I.VAL_ICMS_SUBST)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,*/'
      '      '
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '      '
      '    /*DECODE('#39'D'#39','
      
        '      (SELECT '#39'D'#39' FROM DUAL WHERE '#39'D'#39' IN((SELECT IND_VENDAS FROM' +
        ' TB_OPERACAO WHERE COD_OPERACAO = N.COD_OPERACAO))),'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100) * -1,'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100)) AS VAL_BC,*/'
      '    '
      '    SUM(I.VAL_PIS) AS VAL_PIS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) AS VAL_COFINS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_COFINS_IMPOSTO,'
      '    SUM(I.VAL_IPI) AS VAL_IPI,'
      '    SUM(I.VAL_ICMS_SUBST) AS VAL_ICMS_SUBST,'
      '    I.COD_CST_PIS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'S'#39')'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.COD_NOTA_CAB,'
      '    N.NUM_NOTA,'
      '    N.DT_RECEBIMENTO,    '
      '    N.COD_OPERACAO,'
      '    O.DESC_OPERACAO,'
      '    SM.DESC_SERIE_MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),   '
      '    N.VAL_DESPESAS,'
      '    PS.PERC_PIS,'
      '    PS.PERC_COFINS,'
      '    '#39'CUPOM FISCAL'#39','
      '    I.VAL_BC_DI,'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    I.COD_CST_PIS'
      '    '
      ')'
      
        'WHERE COD_CST_PIS NOT IN ('#39'04'#39','#39'06'#39','#39'07'#39','#39'08'#39','#39'09'#39','#39'49'#39','#39'61'#39','#39'65' +
        #39','#39'70'#39','#39'71'#39','#39'72'#39','#39'73'#39','#39'74'#39')'
      'ORDER BY'
      
        '  IND_ENTRADA_SAIDA,DT_RECEBIMENTO,DESC_OPERACAO,NUM_NOTA,MODELO' +
        ',TIPO')
    Variables.Data = {
      0300000003000000070000003A46494C49414C03000000000000000000000007
      0000003A44545F494E490C0000000000000000000000070000003A44545F4649
      4E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000D00000008000000434F445F4E4F5441010000000000080000004E55
      4D5F4E4F54410100000000000E00000044545F5245434542494D454E544F0100
      000000000C000000434F445F4F5045524143414F0100000000000D0000004445
      53435F4F5045524143414F010000000000060000004D4F44454C4F0100000000
      0011000000494E445F454E54524144415F534149444101000000000004000000
      5449504F0100000000000600000056414C5F4243010000000000070000005641
      4C5F5049530100000000000A00000056414C5F434F46494E5301000000000007
      00000056414C5F4950490100000000000E00000056414C5F49434D535F535542
      5354010000000000}
    Session = DMOracle.DBCemapa
    Left = 160
    Top = 16
    object QRPisCofinsNotaNUM_NOTA: TFloatField
      FieldName = 'NUM_NOTA'
    end
    object QRPisCofinsNotaDT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
    end
    object QRPisCofinsNotaCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
    end
    object QRPisCofinsNotaDESC_OPERACAO: TStringField
      FieldName = 'DESC_OPERACAO'
      Size = 50
    end
    object QRPisCofinsNotaMODELO: TStringField
      FieldName = 'MODELO'
      Size = 100
    end
    object QRPisCofinsNotaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 6
    end
    object QRPisCofinsNotaVAL_BC: TFloatField
      FieldName = 'VAL_BC'
    end
    object QRPisCofinsNotaIND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 8
    end
    object QRPisCofinsNotaVAL_PIS: TFloatField
      FieldName = 'VAL_PIS'
    end
    object QRPisCofinsNotaVAL_COFINS: TFloatField
      FieldName = 'VAL_COFINS'
    end
    object QRPisCofinsNotaVAL_IPI: TFloatField
      FieldName = 'VAL_IPI'
    end
    object QRPisCofinsNotaVAL_ICMS_SUBST: TFloatField
      FieldName = 'VAL_ICMS_SUBST'
    end
    object QRPisCofinsNotaCOD_NOTA: TFloatField
      FieldName = 'COD_NOTA'
    end
  end
  object QRPisCofinsCST: TOracleDataSet1
    SQL.Strings = (
      '-- SQL NOTAS'
      'SELECT DISTINCT'
      '  CST_COFINS,'
      '  CST_PIS,'
      
        '  DECODE(IND_ENTRADA_SAIDA, '#39'E'#39','#39'CR'#201'DITOS'#39','#39'D'#201'BITOS'#39') AS IND_ENT' +
        'RADA_SAIDA,'
      '  TIPO,'
      '  '
      '  SUM('
      '    CASE '
      '      WHEN IND_PIS_COFINS_RETIDO = '#39'SIM'#39' THEN'
      '        0'
      '        --VAL_BC'
      '      ELSE'
      '        VAL_BC'
      '    END'
      '  ) AS VAL_BC,'
      '  '
      '  TRUNC('
      '    SUM('
      '      CASE'
      '        WHEN IND_PIS_COFINS_RETIDO = '#39'SIM'#39' THEN'
      '          0'
      '          --VAL_PIS'
      '        ELSE'
      '          VAL_PIS + NVL(VAL_PIS_IMPOSTO, 0)'
      '      END'
      '    )'
      '  ,2) AS VAL_PIS,'
      '  '
      '  TRUNC('
      '    SUM('
      '      CASE'
      '        WHEN IND_PIS_COFINS_RETIDO = '#39'SIM'#39' THEN'
      '          0'
      '          --VAL_COFINS'
      '        ELSE'
      '          VAL_COFINS + NVL(VAL_COFINS_IMPOSTO, 0)'
      '      END'
      '    )'
      '  ,2) AS VAL_COFINS'
      '  '
      'FROM('
      '  SELECT'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS) CST_COFINS,'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS) CST_PIS,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA) IND_ENTRADA_SAIDA,   '
      '    '#39'NOTAS'#39' AS TIPO,         '
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESAS)' +
        ' - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,    '
      '    SUM(I.VAL_PIS) AS VAL_PIS,    '
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) AS VAL_COFINS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS),'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS),'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),   '
      '    '#39'NOTAS'#39','
      '    N.COD_NOTA_CAB,'
      '    PS.PERC_PIS,'
      '    PS.PERC_COFINS,'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    NVL(C.COD_CST_COFINS,'#39'NI'#39') CST_COFINS,'
      '    NVL(C.COD_CST_PIS,'#39'NI'#39') CST_PIS,'
      '    O.IND_TIPO_OPERACAO AS IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39' AS TIPO,'
      '    '
      '    DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)),'
      '      (DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)) * C.PERC_DESCONTO_FRETE' +
        ' / 100)) AS VAL_BC,'
      '      '
      '    C.VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    C.VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CAD' +
        'ASTRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL = :FILIAL'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    '#39'NI'#39' AS CST_COFINS,'
      '    '#39'NI'#39' AS CST_PIS,'
      '    O.IND_TIPO_OPERACAO AS IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39' AS TIPO,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '    (C.VAL_FRETE*O.PERC_BASE_PIS/100) + NVL(C.VAL_PEDAGIO,0)) AS' +
        ' VAL_BC,'
      '    C.VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    C.VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CAD' +
        'ASTRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL = :FILIAL'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --N'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS) CST_COFINS,'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS) CST_PIS,'
      '    N.IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39' AS TIPO,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM((I.VAL_TOTAL*O.PERC_BASE_PIS/100)) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) AS VAL_BC,'
      '    SUM(I.VAL_PIS) VAL_PIS,'
      '    SUM(0) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) VAL_COFINS,'
      '    SUM(0) AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    O.NUM_LIVROS = 10'
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.IND_TIPO_FRETE = '#39'FOB'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS),'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS),'
      '    N.IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39','
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --I'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39','#39'50'#39','#39'01'#39') AS CST_COFINS,'
      '    DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39','#39'50'#39','#39'01'#39') AS CST_PIS,'
      '    N.IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39' AS TIPO,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_PIS/100)) AS VL_BC,'
      '    N.VAL_FRETE * PS.PERC_PIS / 100 AS VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    N.VAL_FRETE * PS.PERC_COFINS / 100 AS VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO_CF = S' +
        'M.COD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.NUM_CONHECIMENTO_FRETE IS NOT NULL'
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.IND_TIPO_FRETE = '#39'FOB'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    '
      '    UNION ALL'
      '    '
      '    SELECT --CUPOM FISCAL'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS) CST_COFINS,'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS) CST_PIS,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA) IND_ENTRADA_SAIDA,   '
      '    '#39'CUPOM FISCAL'#39' AS TIPO,     '
      '    '
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESAS)' +
        ' - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,   '
      '    '
      '    SUM(I.VAL_PIS) AS VAL_PIS,'
      '    SUM(0) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) AS VAL_COFINS,'
      '    SUM(0) AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'S'#39')'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS),'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS),'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),   '
      '    '#39'CUPOM FISCAL'#39','
      '    N.COD_NOTA_CAB,'
      '    PS.PERC_PIS,'
      '    PS.PERC_COFINS,'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '    '
      '    UNION ALL --NOTAS REGIME CUMULATIVO (LUCRO PRESUMIDO) '
      '    '
      '    '
      '    SELECT  '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS) CST_COFINS,'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS) CST_PIS,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA) IND_ENTRADA_SAIDA,   '
      '    '#39'NOTAS'#39' AS TIPO,     '
      '    '
      '    /*DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100) - SUM(I.VAL_IPI) - SU' +
        'M(I.VAL_ICMS_SUBST)),    '
      '    SUM(I.VAL_BC_DI)) AS VAL_BC,*/'
      '    '
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100)),    '
      '    SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    '
      '    /*DECODE('#39'D'#39','
      
        '      (SELECT '#39'D'#39' FROM DUAL WHERE '#39'D'#39' IN((SELECT IND_VENDAS FROM' +
        ' TB_OPERACAO WHERE COD_OPERACAO = N.COD_OPERACAO))),'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100) * -1,'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100)) AS VAL_BC,*/'
      '    '
      '    SUM(I.VAL_PIS) AS VAL_PIS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) AS VAL_COFINS,'
      '    (SELECT '
      '      NVL(NIS.VAL_IMPOSTO, 0) '
      '    FROM '
      '      TB_NOTA_IMPOSTO_SERVICO NIS '
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO '
      '          AND IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39
      '    WHERE '
      '      NIS.COD_NOTA_CAB = N.COD_NOTA_CAB) AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS),'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS),'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),   '
      '    '#39'NOTAS'#39','
      '    IND_COMPRAS,'
      '    IND_VENDAS,'
      '    N.COD_OPERACAO,'
      '    N.COD_NOTA_CAB,'
      '    PS.PERC_PIS,'
      '    PS.PERC_COFINS,'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    NVL(C.COD_CST_COFINS,'#39'NI'#39') CST_COFINS,'
      '    NVL(C.COD_CST_PIS,'#39'NI'#39') CST_PIS,'
      '    O.IND_TIPO_OPERACAO AS IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39' AS TIPO,'
      '    '
      '    (C.VAL_FRETE*O.PERC_BASE_PIS/100) AS VAL_BC, '
      '      '
      '    C.VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    C.VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CAD' +
        'ASTRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL = :FILIAL'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    '#39'NI'#39' AS CST_COFINS,'
      '    '#39'NI'#39' AS CST_PIS,'
      '    O.IND_TIPO_OPERACAO AS IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39' AS TIPO,'
      '    (C.VAL_FRETE*O.PERC_BASE_PIS/100) AS VAL_BC,'
      '    C.VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    C.VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CAD' +
        'ASTRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL = :FILIAL'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --N'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS) CST_COFINS,'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS) CST_PIS,'
      '    N.IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39' AS TIPO,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      SUM((I.VAL_TOTAL*O.PERC_BASE_PIS/100))) AS VAL_BC,'
      '    SUM(I.VAL_PIS) VAL_PIS,'
      '    SUM(0) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) VAL_COFINS,'
      '    SUM(0) AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    O.NUM_LIVROS = 10'
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.IND_TIPO_FRETE = '#39'FOB'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS),'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS),'
      '    N.IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39','
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --I'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39','#39'50'#39','#39'01'#39') AS CST_COFINS,'
      '    DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39','#39'50'#39','#39'01'#39') AS CST_PIS,'
      '    N.IND_ENTRADA_SAIDA,'
      '    '#39'FRETES'#39' AS TIPO,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '    (N.VAL_FRETE*O.PERC_BASE_PIS/100)) AS VL_BC,'
      '    N.VAL_FRETE * PS.PERC_PIS / 100 AS VAL_PIS,'
      '    0 AS VAL_PIS_IMPOSTO,'
      '    N.VAL_FRETE * PS.PERC_COFINS / 100 AS VAL_COFINS,'
      '    0 AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO_CF = S' +
        'M.COD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.NUM_CONHECIMENTO_FRETE IS NOT NULL'
      '    AND'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    N.IND_TIPO_FRETE = '#39'FOB'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  '
      '  UNION ALL'
      '  '
      '  SELECT  '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS) CST_COFINS,'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS) CST_PIS,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA) IND_ENTRADA_SAIDA,   '
      '    '#39'CUPOM FISCAL'#39' AS TIPO,     '
      '    '
      '    /*DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100) - SUM(I.VAL_IPI) - SU' +
        'M(I.VAL_ICMS_SUBST)),    '
      '    SUM(I.VAL_BC_DI)) AS VAL_BC,*/'
      '    '
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100)),    '
      '    SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    '
      '    /*DECODE('#39'D'#39','
      
        '      (SELECT '#39'D'#39' FROM DUAL WHERE '#39'D'#39' IN((SELECT IND_VENDAS FROM' +
        ' TB_OPERACAO WHERE COD_OPERACAO = N.COD_OPERACAO))),'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100) * -1,'
      '      SUM(I.VAL_TOTAL*O.PERC_BASE_PIS/100)) AS VAL_BC,*/'
      '    '
      '    SUM(I.VAL_PIS) AS VAL_PIS,'
      '    SUM(0) AS VAL_PIS_IMPOSTO,'
      '    SUM(I.VAL_CONFINS) AS VAL_COFINS,'
      '    SUM(0) AS VAL_COFINS_IMPOSTO'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS,-1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'S'#39')    '
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL = :FILIAL'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(I.COD_CST_COFINS,P.COD_CST_COFINS),'
      '    NVL(I.COD_CST_PIS,P.COD_CST_PIS),'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),   '
      '    '#39'CUPOM FISCAL'#39','
      '    IND_COMPRAS,'
      '    IND_VENDAS,'
      '    N.COD_OPERACAO,'
      '    N.COD_NOTA_CAB,'
      '    PS.PERC_PIS,'
      '    PS.PERC_COFINS,'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      ')'
      'GROUP BY'
      '  CST_COFINS,'
      '  CST_PIS,'
      '  IND_ENTRADA_SAIDA,'
      '  TIPO'
      
        'HAVING CST_PIS NOT IN ('#39'04'#39','#39'06'#39','#39'07'#39','#39'08'#39','#39'09'#39','#39'49'#39','#39'61'#39','#39'65'#39','#39 +
        '70'#39','#39'71'#39','#39'72'#39','#39'73'#39','#39'74'#39')'
      'ORDER BY'
      '  IND_ENTRADA_SAIDA,TIPO,CST_PIS,CST_COFINS')
    Variables.Data = {
      0300000003000000070000003A46494C49414C03000000000000000000000007
      0000003A44545F494E490C0000000000000000000000070000003A44545F4649
      4E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000A0000004353545F434F46494E5301000000000007000000
      4353545F50495301000000000011000000494E445F454E54524144415F534149
      4441010000000000040000005449504F0100000000000600000056414C5F4243
      0100000000000700000056414C5F5049530100000000000A00000056414C5F43
      4F46494E53010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 80
    object QRPisCofinsCSTCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object QRPisCofinsCSTCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object QRPisCofinsCSTIND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 8
    end
    object QRPisCofinsCSTTIPO: TStringField
      FieldName = 'TIPO'
      Size = 6
    end
    object QRPisCofinsCSTVAL_BC: TFloatField
      FieldName = 'VAL_BC'
    end
    object QRPisCofinsCSTVAL_PIS: TFloatField
      FieldName = 'VAL_PIS'
    end
    object QRPisCofinsCSTVAL_COFINS: TFloatField
      FieldName = 'VAL_COFINS'
    end
  end
  object QRFiscalIPI: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  '#39'ENTRADAS'#39' AS IND_ENTRADA_SAIDA,'
      '  N.COD_NOTA_CAB,'
      '  N.NUM_NOTA,'
      '  O.DESC_OPERACAO,'
      '  SM.DESC_SERIE_MODELO,'
      '  I.COD_CST_IPI,'
      '  CASE'
      
        '    WHEN (I.COD_CST_IPI NOT IN ('#39'00'#39')) AND (I.VAL_IPI > 0) THEN ' +
        #39'* VERIFICAR CST E IPI'#39
      '  END AS OBSERVACAO,'
      '  SUM(I.VAL_IPI) AS VAL_IPI,'
      '  SUM(I.VAL_ICM) AS VAL_ICMS'
      'FROM'
      '  TB_NOTA_CAB N'
      '    INNER JOIN TB_NOTA_ITEM I'
      '    ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      '    INNER JOIN TB_OPERACAO O '
      '    ON N.COD_OPERACAO = O.COD_OPERACAO'
      '    INNER JOIN TB_SERIE S '
      '    ON N.COD_FILIAL = S.COD_FILIAL AND'
      '    N.COD_SERIE = S.COD_SERIE AND'
      '    N.COD_SERIE_MODELO = S.COD_SERIE_MODELO'
      '    INNER JOIN TB_SERIE_MODELO SM ON'
      '    S.COD_SERIE_MODELO = SM.COD_SERIE_MODELO'
      'WHERE'
      '  N.IND_ENTRADA_SAIDA = '#39'E'#39
      '  AND'
      '  N.DT_RECEBIMENTO BETWEEN :DATA_INI AND :DATA_FIN'
      '  AND'
      '  N.COD_FILIAL = :FILIAL'
      '  AND'
      '  N.IND_SITUACAO = 2'
      '  AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      '  AND'
      '  O.NUM_LIVROS IS NOT NULL AND O.NUM_LIVROS <> 10'
      '  AND'
      '  I.COD_CST_IPI IS NOT NULL'
      'GROUP BY'
      '  '#39'ENTRADAS'#39','
      '  N.COD_NOTA_CAB,'
      '  N.NUM_NOTA,'
      '  O.DESC_OPERACAO,'
      '  SM.DESC_SERIE_MODELO,'
      '  I.COD_CST_IPI,'
      '  CASE'
      
        '    WHEN (I.COD_CST_IPI NOT IN ('#39'00'#39')) AND (I.VAL_IPI > 0) THEN ' +
        #39'* VERIFICAR CST E IPI'#39
      '  END'
      '  '
      '  UNION'
      '  '
      '  SELECT'
      '  '#39'SA'#205'DAS'#39' AS IND_ENTRADA_SAIDA,'
      '  N.COD_NOTA_CAB,'
      '  N.NUM_NOTA,'
      '  O.DESC_OPERACAO,'
      '  SM.DESC_SERIE_MODELO,'
      '  I.COD_CST_IPI,'
      '  CASE'
      
        '    WHEN (I.COD_CST_IPI NOT IN ('#39'50'#39')) AND (I.VAL_IPI > 0) THEN ' +
        #39'* VERIFICAR CST E IPI'#39
      '  END AS OBSERVACAO,'
      '  SUM(I.VAL_IPI) AS VAL_IPI,'
      '  SUM(I.VAL_ICM) AS VAL_ICMS'
      'FROM'
      '  TB_NOTA_CAB N'
      '    INNER JOIN TB_NOTA_ITEM I'
      '    ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      '    INNER JOIN TB_OPERACAO O '
      '    ON N.COD_OPERACAO = O.COD_OPERACAO'
      '    INNER JOIN TB_SERIE S '
      '    ON N.COD_FILIAL = S.COD_FILIAL AND'
      '    N.COD_SERIE = S.COD_SERIE AND'
      '    N.COD_SERIE_MODELO = S.COD_SERIE_MODELO'
      '    INNER JOIN TB_SERIE_MODELO SM ON'
      '    S.COD_SERIE_MODELO = SM.COD_SERIE_MODELO'
      'WHERE'
      '  N.IND_ENTRADA_SAIDA = '#39'S'#39
      '  AND'
      '  N.DT_RECEBIMENTO BETWEEN :DATA_INI AND :DATA_FIN'
      '  AND'
      '  N.COD_FILIAL = :FILIAL'
      '  AND'
      '  N.IND_SITUACAO = 2'
      '  AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      '  AND'
      '  O.NUM_LIVROS IS NOT NULL AND O.NUM_LIVROS <> 10'
      '  AND'
      '  I.COD_CST_IPI IS NOT NULL'
      'GROUP BY'
      '  '#39'SA'#205'DAS'#39','
      '  N.COD_NOTA_CAB,'
      '  N.NUM_NOTA,'
      '  O.DESC_OPERACAO,'
      '  SM.DESC_SERIE_MODELO,'
      '  I.COD_CST_IPI,'
      '  CASE'
      
        '    WHEN (I.COD_CST_IPI NOT IN ('#39'50'#39')) AND (I.VAL_IPI > 0) THEN ' +
        #39'* VERIFICAR CST E IPI'#39
      '  END')
    Variables.Data = {
      0300000003000000090000003A444154415F494E490C00000000000000000000
      00090000003A444154415F46494E0C0000000000000000000000070000003A46
      494C49414C030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000900000011000000494E445F454E54524144415F5341494441010000
      0000000C000000434F445F4E4F54415F434142010000000000080000004E554D
      5F4E4F54410100000000000D000000444553435F4F5045524143414F01000000
      000011000000444553435F53455249455F4D4F44454C4F0100000000000B0000
      00434F445F4353545F4950490100000000000A0000004F42534552564143414F
      0100000000000700000056414C5F4950490100000000000800000056414C5F49
      434D53010000000000}
    Session = DMOracle.DBCemapa
    Left = 160
    Top = 80
    object QRFiscalIPIIND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 8
    end
    object QRFiscalIPICOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QRFiscalIPIDESC_OPERACAO: TStringField
      FieldName = 'DESC_OPERACAO'
      Size = 50
    end
    object QRFiscalIPIDESC_SERIE_MODELO: TStringField
      FieldName = 'DESC_SERIE_MODELO'
      Size = 100
    end
    object QRFiscalIPICOD_CST_IPI: TStringField
      FieldName = 'COD_CST_IPI'
      Size = 2
    end
    object QRFiscalIPIOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 30
    end
    object QRFiscalIPIVAL_IPI: TFloatField
      FieldName = 'VAL_IPI'
    end
    object QRFiscalIPINUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
    end
    object QRFiscalIPIVAL_ICMS: TFloatField
      FieldName = 'VAL_ICMS'
    end
  end
end
