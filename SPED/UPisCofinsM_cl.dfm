object DMPisCofinsM: TDMPisCofinsM
  OldCreateOrder = False
  Left = 683
  Top = 226
  Height = 398
  Width = 464
  object QReg400: TOracleDataSet1
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '  NVL(I.COD_CST_PIS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_CST_' +
        'PIS, P.COD_CST_PIS_SAIDA)) CST_PIS,'
      '  '#39#39' AS DESC_COMPL,'
      '  O.COD_CONTABIL_NOTA_SPED_CONTRIB AS COD_CTA'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  N.IND_SITUACAO <> '#39'1'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  N.COD_FILIAL IN :FILIAIS'
      'AND'
      '  (N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN)'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO IN ('#39'01'#39','#39'1B'#39','#39'04'#39','#39'55'#39')'
      'AND'
      '  I.COD_CST_PIS IN ('#39'04'#39', '#39'05'#39', '#39'06'#39', '#39'07'#39', '#39'08'#39', '#39'09'#39')')
    Variables.Data = {
      0300000003000000080000003A46494C49414953010000000400000028312900
      00000000090000003A444154415F494E490C0000000000000000000000090000
      003A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000003000000070000004353545F5049530100000000000A000000444553
      435F434F4D504C01000000000007000000434F445F435441010000000000}
    Session = DMOracle.DBCemapa
    Left = 32
    Top = 24
    object QReg400CST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object QReg400DESC_COMPL: TStringField
      FieldName = 'DESC_COMPL'
      Size = 1
    end
    object QReg400COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 15
    end
  end
  object QReg410: TOracleDataSet1
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '  DECODE(P.COD_NATUREZA_RECEITA,NULL,I.COD_NATUREZA_RECEITA,P.CO' +
        'D_NATUREZA_RECEITA) NAT_REC,'
      '  '#39#39' AS DESC_COMPL'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  N.IND_SITUACAO <> '#39'1'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  N.COD_FILIAL IN :FILIAIS'
      'AND'
      '  (N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN)'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO IN ('#39'01'#39','#39'1B'#39','#39'04'#39','#39'55'#39')'
      'AND'
      '  I.COD_CST_PIS IN ('#39'04'#39', '#39'05'#39', '#39'06'#39', '#39'07'#39', '#39'08'#39', '#39'09'#39')'
      'AND'
      
        '  DECODE(P.COD_NATUREZA_RECEITA,NULL,I.COD_NATUREZA_RECEITA,P.CO' +
        'D_NATUREZA_RECEITA) IS NOT NULL'
      'AND'
      '  N.IND_ENTRADA_SAIDA = '#39'E'#39)
    Variables.Data = {
      0300000003000000080000003A46494C49414953010000000400000028312900
      00000000090000003A444154415F494E490C0000000000000000000000090000
      003A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000A000000444553435F434F4D504C01000000000007000000
      4E41545F524543010000000000}
    Session = DMOracle.DBCemapa
    Left = 104
    Top = 24
    object QReg410NAT_REC: TIntegerField
      FieldName = 'NAT_REC'
    end
    object QReg410DESC_COMPL: TStringField
      FieldName = 'DESC_COMPL'
      Size = 1
    end
  end
  object QReg800: TOracleDataSet1
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '  NVL(I.COD_CST_COFINS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_C' +
        'ST_COFINS, P.COD_CST_COFINS_SAIDA)) CST_COFINS,'
      '  '#39#39' AS DESC_COMPL,'
      '  O.COD_CONTABIL_NOTA_SPED_CONTRIB AS COD_CTA'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  N.IND_SITUACAO <> '#39'1'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  N.COD_FILIAL IN :FILIAIS'
      'AND'
      '  (N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN)'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO IN ('#39'01'#39','#39'1B'#39','#39'04'#39','#39'55'#39')'
      'AND'
      '  I.COD_CST_PIS IN ('#39'04'#39', '#39'05'#39', '#39'06'#39', '#39'07'#39', '#39'08'#39', '#39'09'#39')')
    Variables.Data = {
      0300000003000000080000003A46494C49414953010000000400000028312900
      00000000090000003A444154415F494E490C0000000000000000000000090000
      003A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000A000000444553435F434F4D504C0100000000000A000000
      4353545F434F46494E5301000000000007000000434F445F4354410100000000
      00}
    Session = DMOracle.DBCemapa
    Left = 32
    Top = 88
    object QReg800CST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object QReg800DESC_COMPL: TStringField
      FieldName = 'DESC_COMPL'
      Size = 1
    end
    object QReg800COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 15
    end
  end
  object QReg810: TOracleDataSet1
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '  DECODE(P.COD_NATUREZA_RECEITA,NULL,I.COD_NATUREZA_RECEITA,P.CO' +
        'D_NATUREZA_RECEITA) NAT_REC,'
      '  '#39#39' AS DESC_COMPL'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  N.IND_SITUACAO <> '#39'1'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  N.COD_FILIAL IN :FILIAIS'
      'AND'
      '  (N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN)'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO IN ('#39'01'#39','#39'1B'#39','#39'04'#39','#39'55'#39')'
      'AND'
      '  I.COD_CST_PIS IN ('#39'04'#39', '#39'05'#39', '#39'06'#39', '#39'07'#39', '#39'08'#39', '#39'09'#39')'
      'AND'
      
        '  DECODE(P.COD_NATUREZA_RECEITA,NULL,I.COD_NATUREZA_RECEITA,P.CO' +
        'D_NATUREZA_RECEITA) IS NOT NULL'
      'AND'
      '  N.IND_ENTRADA_SAIDA = '#39'E'#39)
    Variables.Data = {
      0300000003000000080000003A46494C49414953010000000400000028312900
      00000000090000003A444154415F494E490C0000000000000000000000090000
      003A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000A000000444553435F434F4D504C01000000000007000000
      4E41545F524543010000000000}
    Session = DMOracle.DBCemapa
    Left = 104
    Top = 88
    object QReg810NAT_REC: TIntegerField
      FieldName = 'NAT_REC'
    end
    object QReg810DESC_COMPL: TStringField
      FieldName = 'DESC_COMPL'
      Size = 1
    end
  end
  object QReg200_old: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      
        '  CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT_CONT_NC_PER) THEN' +
        ' '
      
        '    SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED_DESC) END AS VL' +
        '_TOT_CRED_DESC,'
      '--  SUM(VL_TOT_CRED_DESC) AS VL_TOT_CRED_DESC,'
      '  SUM(VL_TOT_CONT_NC_PER) AS VL_TOT_CONT_NC_PER,'
      '  SUM(VL_TOT_CONT_CUM_PER) AS VL_TOT_CONT_CUM_PER,'
      '  SUM(VL_CONT_CUM_REC) AS VL_CONT_CUM_REC,  '
      '  SUM(VL_TOT_CONT_REC) AS VL_TOT_CONT_REC,'
      '    CASE '
      '        WHEN (SUM(VL_TOT_CONT_NC_PER) - '
      
        '            CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT_CONT_NC' +
        '_PER) THEN '
      
        '            SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED_DESC) E' +
        'ND -'
      '            0) > 0 THEN '
      '                (SUM(VL_TOT_CONT_NC_PER) - '
      
        '                    CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT' +
        '_CONT_NC_PER) THEN '
      
        '                    SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED' +
        '_DESC) END -'
      '                    0)'
      '        ELSE'
      '            0'
      '                '
      
        '    END AS VL_CONT_NC_REC, --Reten'#231#245'es e dedu'#231#245'es pelo c'#243'digo de' +
        'lphi'
      '  '
      '--  SUM(VL_CONT_NC_REC) AS VL_CONT_NC_REC,'
      '  SUM(VL_TOT_CRED_DESC_ANT) AS VL_TOT_CRED_DESC_ANT,'
      '--  SUM(VL_TOT_CONT_NC_DEV) AS VL_TOT_CONT_NC_DEV'
      'CASE '
      '    WHEN (SUM(VL_TOT_CONT_NC_PER) - '
      
        '        CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT_CONT_NC_PER' +
        ') THEN '
      '        SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED_DESC) END -'
      '        0) > 0 THEN '
      '            (SUM(VL_TOT_CONT_NC_PER) - '
      
        '                CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT_CON' +
        'T_NC_PER) THEN '
      
        '                SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED_DES' +
        'C) END -'
      '                0)'
      '    ELSE'
      '        0'
      '            '
      'END AS VL_TOT_CONT_NC_DEV'
      'FROM('
      '-- SQL NOTAS'
      'SELECT'
      '  SUM(VL_TOT_CRED_DESC) AS VL_TOT_CRED_DESC,'
      '  SUM(VL_TOT_CONT_NC_PER) AS VL_TOT_CONT_NC_PER,'
      '  '
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      SUM(VL_TOT_CONT_CUM_PER) '
      '  END AS VL_TOT_CONT_CUM_PER,'
      '  '
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      SUM(VL_TOT_CONT_CUM_PER) '
      '  END AS VL_CONT_CUM_REC,      '
      '   '
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      SUM(VL_TOT_CONT_NC_PER) - '
      
        '    CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT_CONT_NC_PER) TH' +
        'EN '
      '      SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED_DESC) END +'
      '    (SUM(VL_TOT_CONT_CUM_PER) )'
      '  END AS VL_TOT_CONT_REC,'
      '  '
      '--  SUM(VL_TOT_CONT_NC_PER) - '
      
        '--    CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT_CONT_NC_PER) ' +
        'THEN '
      
        '--      SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED_DESC) END A' +
        'S VL_CONT_NC_REC,'
      '    '
      '--  SUM(0) AS VL_TOT_CONT_REC,'
      '  SUM(0) AS VL_TOT_CRED_DESC_ANT'
      '  '
      '--  SUM(VL_TOT_CONT_NC_PER) - '
      
        '--    CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT_CONT_NC_PER) ' +
        'THEN '
      '--    SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED_DESC) END -'
      '--    0 AS VL_TOT_CONT_NC_DEV'
      'FROM(  '
      '  SELECT'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_TOT_CRED_DESC,'
      '          '
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
      '    '
      '    0 AS VL_TOT_CONT_CUM_PER'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA)   '
      '    '
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO'
      
        '    NVL(CAD.IND_PIS_COFINS_RETIDO, '#39'NAO'#39') AS IND_PIS_COFINS_RETI' +
        'DO,'
      '    C.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39', C.VAL_PIS, 0)),0) A' +
        'S VL_TOT_CRED_DESC,    '
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'S'#39', C.VAL_PIS, 0)),0) A' +
        'S VL_TOT_CONT_NC_PER,'
      '    0 AS VL_TOT_CONT_CUM_PER'
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
      
        '      LEFT JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CADA' +
        'STRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  GROUP BY'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO'
      '  '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      
        '    NVL(CAD.IND_PIS_COFINS_RETIDO, '#39'NAO'#39') AS IND_PIS_COFINS_RETI' +
        'DO,'
      '    C.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'E'#39',C.VAL_PIS,0)),0) AS V' +
        'L_TOT_CRED_DESC,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_PIS,0)),0) AS V' +
        'L_TOT_CONT_NC_PER,'
      '    0 AS VL_TOT_CONT_CUM_PER'
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
      
        '      LEFT JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CADA' +
        'STRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '  GROUP BY'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --N'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',I.VAL_PIS,0)),0) AS V' +
        'L_TOT_CRED_DESC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_PIS,0)),0) AS V' +
        'L_TOT_CONT_NC_PER,'
      '    0 AS VL_TOT_CONT_CUM_PER'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO  '
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --I'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',(N.VAL_FRETE * PS.PER' +
        'C_PIS / 100),0)),0) AS VL_TOT_CRED_DESC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PER' +
        'C_PIS / 100),0)),0) AS VL_TOT_CONT_NC_PER,'
      '    0 AS VL_TOT_CONT_CUM_PER'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO'
      '    '
      '  UNION'
      '  '
      '  SELECT'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_TOT_CRED_DESC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
      '    0 AS VL_TOT_CONT_CUM_PER'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA)   '
      '        '
      '    UNION --NOTAS REGIME CUMULATIVO (LUCRO PRESUMIDO)'
      '    '
      '    SELECT    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_TOT_CRED_DESC,'
      '    0 AS VL_TOT_CONT_NC_PER,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_TOT_CONT_CUM_PER   '
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY      '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA)'
      '    '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO'
      
        '    NVL(CAD.IND_PIS_COFINS_RETIDO, '#39'NAO'#39') AS IND_PIS_COFINS_RETI' +
        'DO,'
      '    C.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39', C.VAL_PIS, 0)),0) A' +
        'S VL_TOT_CRED_DESC,    '
      '    0 AS VL_TOT_CONT_NC_PER,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'S'#39', C.VAL_PIS, 0)),0) A' +
        'S VL_TOT_CONT_CUM_PER'
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
      
        '      LEFT JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CADA' +
        'STRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  GROUP BY'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO'
      '    '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO FRETE    '
      
        '    NVL(CAD.IND_PIS_COFINS_RETIDO, '#39'NAO'#39') AS IND_PIS_COFINS_RETI' +
        'DO,'
      '    C.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'E'#39',C.VAL_PIS,0)),0) AS V' +
        'L_TOT_CRED_DESC,'
      '    0 AS VL_TOT_CONT_NC_PER,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_PIS,0)),0) AS V' +
        'L_TOT_CONT_CUM_PER  '
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
      
        '      LEFT JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CADA' +
        'STRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '  GROUP BY'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO'
      '    '
      '  UNION'
      '  '
      '  SELECT --N'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',I.VAL_PIS,0)),0) AS V' +
        'L_TOT_CRED_DESC,'
      '    0 AS VL_TOT_CONT_NC_PER,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_PIS,0)),0) AS V' +
        'L_TOT_CONT_CUM_PER '
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO'
      '    '
      '  UNION'
      '  '
      '  SELECT --I'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',(N.VAL_FRETE * PS.PER' +
        'C_PIS / 100),0)),0) AS VL_TOT_CRED_DESC,'
      '    0 AS VL_TOT_CONT_NC_PER,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PER' +
        'C_PIS / 100),0)),0) AS VL_TOT_CONT_CUM_PER    '
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO'
      '    '
      '  UNION'
      '  '
      '  SELECT'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_TOT_CRED_DESC,'
      '    0 AS VL_TOT_CONT_NC_PER,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_TOT_CONT_CUM_PER'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA)    '
      ')'
      'GROUP BY'
      '  COD_SERIE_MODELO,'
      '  IND_PIS_COFINS_RETIDO'
      ')')
    Variables.Data = {
      0300000003000000070000003A44545F494E490C000000000000000000000007
      0000003A44545F46494E0C0000000000000000000000080000003A46494C4941
      495301000000230000002853454C45435420434F445F46494C49414C2046524F
      4D2054425F46494C49414C290000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000010000000564C5F544F545F435245445F4445534301000000
      000012000000564C5F544F545F434F4E545F4E435F5045520100000000001300
      0000564C5F544F545F434F4E545F43554D5F5045520100000000001400000056
      4C5F544F545F435245445F444553435F414E540100000000000F000000564C5F
      434F4E545F43554D5F52454301000000000012000000564C5F544F545F434F4E
      545F4E435F4445560100000000000E000000564C5F434F4E545F4E435F524543
      010000000000}
    Session = DMOracle.DBCemapa
    Left = 248
    Top = 24
    object QReg200_oldVL_TOT_CRED_DESC: TFloatField
      FieldName = 'VL_TOT_CRED_DESC'
    end
    object QReg200_oldVL_TOT_CONT_NC_PER: TFloatField
      FieldName = 'VL_TOT_CONT_NC_PER'
    end
    object QReg200_oldVL_TOT_CONT_CUM_PER: TFloatField
      FieldName = 'VL_TOT_CONT_CUM_PER'
    end
    object QReg200_oldVL_TOT_CRED_DESC_ANT: TFloatField
      FieldName = 'VL_TOT_CRED_DESC_ANT'
    end
    object QReg200_oldVL_CONT_CUM_REC: TFloatField
      FieldName = 'VL_CONT_CUM_REC'
    end
    object QReg200_oldVL_TOT_CONT_REC: TFloatField
      FieldName = 'VL_TOT_CONT_REC'
    end
    object QReg200_oldVL_TOT_CONT_NC_DEV: TFloatField
      FieldName = 'VL_TOT_CONT_NC_DEV'
    end
    object QReg200_oldVL_CONT_NC_REC: TFloatField
      FieldName = 'VL_CONT_NC_REC'
    end
  end
  object QReg100_old: TOracleDataSet1
    SQL.Strings = (
      '-- SQL NOTAS'
      'SELECT'
      '  101 AS COD_CRED,'
      '  0 AS IND_CRED_ORI,'
      '  0 AS VL_AJUS_ACRES,'
      '  0 AS VL_AJUS_REDUC,'
      '  0 AS VL_CRED_DIF,'
      
        '  CASE WHEN (SUM(VL_CRED) > SUM(VL_CRED_DESC)) THEN  1 ELSE 0 EN' +
        'D AS IND_DESC_CRED,'
      '  CASE WHEN (SUM(VL_CRED) - SUM(VL_CRED_DESC)) >= 0 THEN'
      '    (SUM(VL_CRED) - SUM(VL_CRED_DESC)) ELSE 0 END AS SLD_CRED,'
      '  (SELECT PERC_PIS FROM TB_PARAM_SISTEMA) AS ALIQ_PIS,'
      '  SUM(VL_CRED) AS VL_CRED,'
      '  SUM(VL_CRED) AS VL_CRED_DISP,'
      '  CASE WHEN (SUM(VL_CRED_DESC) > SUM(VL_CRED)) THEN'
      '    SUM(VL_CRED) ELSE SUM(VL_CRED_DESC) END AS VL_CRED_DESC,'
      '  SUM(VAL_BC) AS VL_BC_PIS  '
      'FROM('
      '  SELECT    '
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_CRED,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_CRED_DESC'
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
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '        AND P.IND_PINTURA = '#39'SIM'#39' AND P.IND_ESTOFARIA = '#39'SIM'#39
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      '  WHERE'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    NOT (I.COD_CST_PIS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY    '
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO        '
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39', C.VAL_PIS, 0)),0) A' +
        'S VL_CRED,'
      '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39','
      '      DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)),'
      '      (DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)) * C.PERC_DESCONTO_FRETE' +
        ' / 100)),0)),0) AS VAL_BC,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'S'#39', C.VAL_PIS, 0)),0) A' +
        'S VL_CRED_DESC'
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
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL IN (1,2)'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '    AND'
      '    NOT (C.COD_CST_PIS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'E'#39',C.VAL_PIS,0)),0) AS V' +
        'L_CRED,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100) + NVL(C.VAL_PEDAGIO,0)) ' +
        'AS VAL_BC,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_PIS,0)),0) AS V' +
        'L_CRED_DESC'
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
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL IN (1,2)'
      '    AND'
      '    NOT (O.COD_CST_PIS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_PIS/100) + NVL(C.VAL_PEDAGIO,0))'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --N'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',I.VAL_PIS,0)),0) AS V' +
        'L_CRED,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM((I.VAL_TOTAL*O.PERC_BASE_PIS/100)) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) AS VAL_BC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_PIS,0)),0) AS V' +
        'L_CRED_DESC'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN '
      '    AND'
      '    NOT (I.COD_CST_PIS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)  '
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --I    '
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',(N.VAL_FRETE * PS.PER' +
        'C_PIS / 100),0)),0) AS VL_CRED,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_PIS/100)) AS VL_BC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PER' +
        'C_PIS / 100),0)),0) AS VL_CRED_DESC'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    NOT (O.COD_CST_PIS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_PIS/100))'
      '      '
      '  UNION'
      '  '
      '  SELECT    '
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_CRED,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_CRED_DESC'
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
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '        AND P.IND_PINTURA = '#39'SIM'#39' AND P.IND_ESTOFARIA = '#39'SIM'#39
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      '  WHERE'
      
        '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'SIM'#39')   ' +
        ' '
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    NOT (I.COD_CST_PIS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    /*    '
      '    UNION --NOTAS REGIME CUMULATIVO (LUCRO PRESUMIDO)'
      '    '
      '    SELECT    '
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_CRED,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_CRED_DESC'
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
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '        AND P.IND_PINTURA = '#39'SIM'#39' AND P.IND_ESTOFARIA = '#39'SIM'#39
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
      '  WHERE'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY    '
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39', C.VAL_PIS, 0)),0) A' +
        'S VL_CRED,'
      '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39','
      '      DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)),'
      '      (DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)) * C.PERC_DESCONTO_FRETE' +
        ' / 100)),0)),0) AS VAL_BC,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'S'#39', C.VAL_PIS, 0)),0) A' +
        'S VL_CRED_DESC'
      '  FROM'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = C.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL IN (1,2)'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO FRETE    '
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'E'#39',C.VAL_PIS,0)),0) AS V' +
        'L_CRED,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100) + NVL(C.VAL_PEDAGIO,0)) ' +
        'AS VAL_BC,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_PIS,0)),0) AS V' +
        'L_CRED_DESC'
      '  FROM'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL IN (1,2)'
      '  GROUP BY'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_PIS/100) + NVL(C.VAL_PEDAGIO,0))'
      '    '
      '  UNION'
      '  '
      '  SELECT --N    '
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',I.VAL_PIS,0)),0) AS V' +
        'L_CRED,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM((I.VAL_TOTAL*O.PERC_BASE_PIS/100)) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) AS VAL_BC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_PIS,0)),0) AS V' +
        'L_CRED_DESC'
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
        'F.COD_INC_TRIB = 3'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  GROUP BY'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB) '
      '    '
      '  UNION'
      '  '
      '  SELECT --I    '
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',(N.VAL_FRETE * PS.PER' +
        'C_PIS / 100),0)),0) AS VL_CRED,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_PIS/100)) AS VL_BC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PER' +
        'C_PIS / 100),0)),0) AS VL_CRED_DESC'
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
        'F.COD_INC_TRIB = 3'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_PIS/100))'
      '    '
      '  UNION'
      '  '
      '  SELECT    '
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_CRED,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) VL_CRED_DESC'
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
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '        AND P.IND_PINTURA = '#39'SIM'#39' AND P.IND_ESTOFARIA = '#39'SIM'#39
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
      '  WHERE'
      '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'S'#39')'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)   '
      '  */'
      ')'
      'GROUP BY'
      '  101,'
      '  0,'
      '  0,'
      '  0,'
      '  0,'
      '  0,'
      '  0')
    Variables.Data = {
      0300000003000000070000003A44545F494E490C000000000000000000000007
      0000003A44545F46494E0C0000000000000000000000080000003A46494C4941
      495301000000230000002853454C45435420434F445F46494C49414C2046524F
      4D2054425F46494C49414C290000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C00000008000000434F445F435245440100000000000C000000494E
      445F435245445F4F52490100000000000D000000564C5F414A55535F41435245
      530100000000000D000000564C5F414A55535F52454455430100000000000B00
      0000564C5F435245445F4449460100000000000D000000494E445F444553435F
      4352454401000000000008000000534C445F4352454401000000000008000000
      414C49515F50495301000000000007000000564C5F435245440100000000000C
      000000564C5F435245445F444953500100000000000C000000564C5F43524544
      5F4445534301000000000009000000564C5F42435F504953010000000000}
    Session = DMOracle.DBCemapa
    Left = 176
    Top = 24
    object QReg100_oldCOD_CRED: TFloatField
      FieldName = 'COD_CRED'
    end
    object QReg100_oldIND_CRED_ORI: TFloatField
      FieldName = 'IND_CRED_ORI'
    end
    object QReg100_oldVL_AJUS_ACRES: TFloatField
      FieldName = 'VL_AJUS_ACRES'
    end
    object QReg100_oldVL_AJUS_REDUC: TFloatField
      FieldName = 'VL_AJUS_REDUC'
    end
    object QReg100_oldVL_CRED_DIF: TFloatField
      FieldName = 'VL_CRED_DIF'
    end
    object QReg100_oldIND_DESC_CRED: TFloatField
      FieldName = 'IND_DESC_CRED'
    end
    object QReg100_oldSLD_CRED: TFloatField
      FieldName = 'SLD_CRED'
    end
    object QReg100_oldALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object QReg100_oldVL_CRED: TFloatField
      FieldName = 'VL_CRED'
    end
    object QReg100_oldVL_CRED_DISP: TFloatField
      FieldName = 'VL_CRED_DISP'
    end
    object QReg100_oldVL_CRED_DESC: TFloatField
      FieldName = 'VL_CRED_DESC'
    end
    object QReg100_oldVL_BC_PIS: TFloatField
      FieldName = 'VL_BC_PIS'
    end
  end
  object QReg105_old: TOracleDataSet1
    SQL.Strings = (
      '-- SQL NOTAS'
      'SELECT'
      '  COD_BC_CREDITO_PISCOFINS AS NAT_BC_CRED,'
      '  CST_PIS,'
      '  SUM(VAL_BC) AS VL_BC_PIS_TOT,'
      '  SUM(VL_BC_PIS_CUM) AS VL_BC_PIS_CUM,'
      '  SUM(VL_BC_PIS_NC) AS VL_BC_PIS_NC,'
      '  SUM(VL_BC_PIS) AS VL_BC_PIS'
      'FROM('
      '  SELECT'
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      
        '    NVL(I.COD_CST_PIS, NVL(O.COD_CST_PIS, NVL(P.COD_CST_PIS,'#39'07'#39 +
        '))) AS CST_PIS,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),'
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    0 AS VL_BC_PIS_CUM,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),'
      '      SUM(I.VAL_BC_DI)) AS VL_BC_PIS_NC,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),'
      '      SUM(I.VAL_BC_DI)) AS VL_BC_PIS'
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
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '        AND P.IND_PINTURA = '#39'SIM'#39' AND P.IND_ESTOFARIA = '#39'SIM'#39
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    NOT (I.COD_CST_PIS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY'
      '    O.COD_BC_CREDITO_PISCOFINS,'
      
        '    NVL(I.COD_CST_PIS, NVL(O.COD_CST_PIS, NVL(P.COD_CST_PIS,'#39'07'#39 +
        '))),'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO        '
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      '    NVL(C.COD_CST_PIS, NVL(O.COD_CST_PIS, '#39'07'#39')) AS CST_PIS,'
      '    DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)),'
      '      (DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)) * C.PERC_DESCONTO_FRETE' +
        ' / 100)) AS VAL_BC,'
      '    0 AS VL_BC_PIS_CUM,'
      '    DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)),'
      '      (DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)) * C.PERC_DESCONTO_FRETE' +
        ' / 100)) AS VL_BC_PIS_NC,'
      '    DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)),'
      '      (DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)) * C.PERC_DESCONTO_FRETE' +
        ' / 100)) AS VL_BC_PIS'
      '  FROM'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'E'#39
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = C.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '    AND'
      '    NOT (C.COD_CST_PIS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      '    NVL(O.COD_CST_PIS, '#39'07'#39') AS CST_PIS,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100) + NVL(C.VAL_PEDAGIO,0)) ' +
        'AS VAL_BC,'
      '    0 AS VL_BC_PIS_CUM,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100) + NVL(C.VAL_PEDAGIO,0)) ' +
        'AS VL_BC_PIS_NC,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100) + NVL(C.VAL_PEDAGIO,0)) ' +
        'AS VL_BC_PIS'
      '  FROM'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'E'#39
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    NOT (O.COD_CST_PIS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --N   '
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      
        '    NVL(I.COD_CST_PIS, NVL(O.COD_CST_PIS, NVL(P.COD_CST_PIS,'#39'07'#39 +
        '))) AS CST_PIS,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM((I.VAL_TOTAL*O.PERC_BASE_PIS/100)) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) AS VAL_BC,'
      '    0 AS VL_BC_PIS_CUM,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM((I.VAL_TOTAL*O.PERC_BASE_PIS/100)) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) AS VL_BC_PIS_NC,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM((I.VAL_TOTAL*O.PERC_BASE_PIS/100)) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) AS VL_BC_PIS'
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
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '    AND'
      '    NOT (I.COD_CST_PIS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY'
      '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39'),'
      
        '    NVL(I.COD_CST_PIS, NVL(O.COD_CST_PIS, NVL(P.COD_CST_PIS,'#39'07'#39 +
        '))),'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --I    '
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      '    NVL(O.COD_CST_PIS,'#39'07'#39') AS CST_PIS,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_PIS/100)) AS VL_BC,'
      '    0 AS VL_BC_PIS_CUM,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_PIS/100)) AS VL_BC_PIS_NC,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_PIS/100)) AS VL_BC_PIS'
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
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    NOT (O.COD_CST_PIS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  '
      '  UNION'
      '  '
      '  SELECT    '
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      
        '    NVL(I.COD_CST_PIS, NVL(O.COD_CST_PIS, NVL(P.COD_CST_PIS,'#39'07'#39 +
        '))) AS CST_PIS,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    0 AS VL_BC_PIS_CUM,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VL_BC_PIS_NC,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VL_BC_PIS'
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
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '        AND P.IND_PINTURA = '#39'SIM'#39' AND P.IND_ESTOFARIA = '#39'SIM'#39
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      
        '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'SIM'#39')   ' +
        ' '
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    NOT (I.COD_CST_PIS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY'
      '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39'),'
      
        '    NVL(I.COD_CST_PIS, NVL(O.COD_CST_PIS, NVL(P.COD_CST_PIS,'#39'07'#39 +
        '))),'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '        '
      '    UNION --NOTAS REGIME CUMULATIVO (LUCRO PRESUMIDO)'
      '    '
      '  SELECT    '
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      
        '    NVL(I.COD_CST_PIS, NVL(O.COD_CST_PIS, NVL(P.COD_CST_PIS,'#39'07'#39 +
        '))) AS CST_PIS,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),'
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),'
      '      SUM(I.VAL_BC_DI)) AS VL_BC_PIS_CUM,'
      '    0 AS VL_BC_PIS_NC,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),'
      '      SUM(I.VAL_BC_DI)) AS VL_BC_PIS  '
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
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '        AND P.IND_PINTURA = '#39'SIM'#39' AND P.IND_ESTOFARIA = '#39'SIM'#39
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    NOT (I.COD_CST_PIS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY    '
      '    O.COD_BC_CREDITO_PISCOFINS,'
      
        '    NVL(I.COD_CST_PIS, NVL(O.COD_CST_PIS, NVL(P.COD_CST_PIS,'#39'07'#39 +
        '))),'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO'
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      '    NVL(C.COD_CST_PIS, NVL(O.COD_CST_PIS, '#39'07'#39')) AS CST_PIS,'
      '    DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)),'
      '      (DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)) * C.PERC_DESCONTO_FRETE' +
        ' / 100)) AS VAL_BC,'
      '    DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)),'
      '      (DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)) * C.PERC_DESCONTO_FRETE' +
        ' / 100)) AS VL_BC_PIS_CUM,'
      '    0 AS VL_BC_PIS_NC,'
      '    DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)),'
      '      (DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100)) * C.PERC_DESCONTO_FRETE' +
        ' / 100)) AS VL_BC_PIS '
      '  FROM'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'E'#39
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = C.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN '
      '    AND'
      '    NOT (C.COD_CST_PIS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO FRETE    '
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      '    NVL(O.COD_CST_PIS, '#39'07'#39') AS CST_PIS,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100) + NVL(C.VAL_PEDAGIO,0)) ' +
        'AS VAL_BC,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100) + NVL(C.VAL_PEDAGIO,0)) ' +
        'AS VL_BC_PIS_CUM,'
      '    0 AS VL_BC_PIS_NC,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100) + NVL(C.VAL_PEDAGIO,0)) ' +
        'AS VL_BC_PIS'
      '  FROM'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'E'#39
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    NOT (O.COD_CST_PIS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '    '
      '  UNION'
      '  '
      '  SELECT --N    '
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      
        '    NVL(I.COD_CST_PIS, NVL(O.COD_CST_PIS, NVL(P.COD_CST_PIS,'#39'07'#39 +
        '))) AS CST_PIS,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM((I.VAL_TOTAL*O.PERC_BASE_PIS/100)) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) AS VAL_BC,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM((I.VAL_TOTAL*O.PERC_BASE_PIS/100)) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) AS VL_BC_PIS_CUM,'
      '    0 AS VL_BC_PIS_NC,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      SUM((I.VAL_TOTAL*O.PERC_BASE_PIS/100)) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) AS VL_BC_PIS'
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
        'F.COD_INC_TRIB = 3'
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '    AND'
      '    NOT (I.COD_CST_PIS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY'
      '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39'),'
      
        '    NVL(I.COD_CST_PIS, NVL(O.COD_CST_PIS, NVL(P.COD_CST_PIS,'#39'07'#39 +
        '))),'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '  UNION'
      '  '
      '  SELECT --I    '
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      '    NVL(O.COD_CST_PIS,'#39'07'#39') AS CST_PIS,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_PIS/100)) AS VL_BC,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_PIS/100)) AS VL_BC_PIS_CUM,'
      '    0 AS VL_BC_PIS_NC,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_PIS/100)) AS VL_BC_PIS'
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
        'F.COD_INC_TRIB = 3'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    NOT (O.COD_CST_PIS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '    '
      '  UNION'
      '  '
      '  SELECT    '
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      
        '    NVL(I.COD_CST_PIS, NVL(O.COD_CST_PIS, NVL(P.COD_CST_PIS,'#39'07'#39 +
        '))) AS CST_PIS,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VL_BC_PIS_CUM,'
      '    0 AS VL_BC_PIS_NC,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL_DESPESA' +
        'S) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VL_BC_PIS '
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
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '        AND P.IND_PINTURA = '#39'SIM'#39' AND P.IND_ESTOFARIA = '#39'SIM'#39
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'S'#39')'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    NOT (I.COD_CST_PIS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY'
      '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39'),'
      
        '    NVL(I.COD_CST_PIS, NVL(O.COD_CST_PIS, NVL(P.COD_CST_PIS,'#39'07'#39 +
        '))),'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      ')'
      'GROUP BY'
      '  COD_BC_CREDITO_PISCOFINS,'
      '  CST_PIS')
    Variables.Data = {
      0300000003000000080000003A46494C4941495301000000230000002853454C
      45435420434F445F46494C49414C2046524F4D2054425F46494C49414C290000
      000000070000003A44545F494E490C0000000000000000000000070000003A44
      545F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000B0000004E41545F42435F43524544010000000000070000
      004353545F5049530100000000000C000000564C5F42435F5049535F4E430100
      0000000009000000564C5F42435F5049530100000000000D000000564C5F4243
      5F5049535F544F540100000000000D000000564C5F42435F5049535F43554D01
      0000000000}
    Session = DMOracle.DBCemapa
    Left = 176
    Top = 88
    object QReg105_oldNAT_BC_CRED: TStringField
      FieldName = 'NAT_BC_CRED'
      Size = 2
    end
    object QReg105_oldCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object QReg105_oldVL_BC_PIS_NC: TFloatField
      FieldName = 'VL_BC_PIS_NC'
    end
    object QReg105_oldVL_BC_PIS: TFloatField
      FieldName = 'VL_BC_PIS'
    end
    object QReg105_oldVL_BC_PIS_TOT: TFloatField
      FieldName = 'VL_BC_PIS_TOT'
    end
    object QReg105_oldVL_BC_PIS_CUM: TFloatField
      FieldName = 'VL_BC_PIS_CUM'
    end
  end
  object QReg210: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_CONT,'
      '  ALIQ_PIS,'
      '  SUM(VL_CONT_PER) AS VL_CONT_APUR,'
      '  SUM(VL_CONT_PER) AS VL_CONT_PER,'
      '  SUM(VL_REC_BRT) AS VL_REC_BRT,'
      '  SUM(VL_BC_CONT) AS VL_BC_CONT'
      'FROM'
      '('
      '-- SQL NOTAS'
      'SELECT '
      '  COD_CONT,'
      '  ALIQ_PIS,'
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      SUM(VL_CONT_PER)'
      '  END AS VL_CONT_APUR,'
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      SUM(VL_CONT_PER)'
      '  END AS VL_CONT_PER,'
      '  SUM(VL_REC_BRT) AS VL_REC_BRT,'
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      SUM(VAL_BC)'
      '  END AS VL_BC_CONT'
      'FROM('
      '  SELECT    '
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_PIS) AS ALIQ_PIS,    '
      '    DECODE(I.COD_CST_PIS,'#39'01'#39','#39'01'#39','#39'02'#39') AS COD_CONT,    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    CASE'
      '      WHEN I.COD_CST_PIS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') THEN'
      '        SUM(I.VAL_TOTAL)'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,    '
      '    '
      '    CASE'
      
        '        WHEN I.COD_CST_PIS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') THE' +
        'N    '
      '            DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '              DECODE(O.PERC_BASE_PIS,0,0,'
      
        '              (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL' +
        '_DESPESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '              SUM(I.VAL_BC_DI)) '
      '        ELSE '
      '            0      '
      '    END AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_CONT_PER,'
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
      
        '      LEFT JOIN TB_NOTA_IMPOSTO_SERVICO NIS ON N.COD_NOTA_CAB = ' +
        'NIS.COD_NOTA_CAB'
      
        '      LEFT JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_IMPO' +
        'STO'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '    AND '
      '    (IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39' OR IMP.DESC_IMPOSTO IS NULL)'
      '  GROUP BY'
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_PIS),'
      '    DECODE(I.COD_CST_PIS,'#39'01'#39','#39'01'#39','#39'02'#39'),'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),    '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    I.COD_CST_PIS,'
      '    N.COD_SERIE_MODELO,'
      '    C.IND_PIS_COFINS_RETIDO'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO    '
      '    PS.PERC_PIS,'
      '    DECODE(C.COD_CST_PIS,'#39'01'#39','#39'01'#39','#39'02'#39') COD_CONT,'
      
        '    NVL(CAD.IND_PIS_COFINS_RETIDO,'#39'NAO'#39') AS IND_PIS_COFINS_RETID' +
        'O,'
      '    C.COD_SERIE_MODELO,'
      '    CASE'
      '      WHEN C.COD_CST_PIS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') THEN'
      '        C.VAL_FRETE+VAL_FRETE_PESO'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN C.COD_CST_PIS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') THE' +
        'N'
      '            DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '              DECODE(O.PERC_BASE_PIS,0,0,'
      '              (C.VAL_FRETE*O.PERC_BASE_PIS/100)),'
      '              (DECODE(O.PERC_BASE_PIS,0,0,'
      
        '              (C.VAL_FRETE*O.PERC_BASE_PIS/100)) * C.PERC_DESCON' +
        'TO_FRETE / 100)) '
      '        ELSE'
      '            0'
      '    END AS VAL_BC,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO, '#39'S'#39', C.VAL_PIS, 0),0) AS VL_' +
        'TOT_CONT_NC_PER,'
      '    C.COD_CST_PIS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = C.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      LEFT JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CADA' +
        'STRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      '    PS.PERC_PIS AS PERC_PIS,'
      '    DECODE(PS.PERC_PIS,1.65,'#39'01'#39','#39'02'#39') AS COD_CONT,'
      '    NVL(CAD.IND_PIS_COFINS_RETIDO,'#39'NAO'#39'),'
      '    C.COD_SERIE_MODELO,'
      '    C.VAL_FRETE AS VL_REC_BRT,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100) + NVL(C.VAL_PEDAGIO,0)) ' +
        'AS VAL_BC,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_PIS,0),0) AS VL_TOT' +
        '_CONT_NC_PER,'
      '    NULL AS COD_CST_PIS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      LEFT JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CADA' +
        'STRO '
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    '
      '  UNION'
      '  '
      '  SELECT --N'
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_PIS),'
      '    DECODE(I.COD_CST_PIS,'#39'01'#39','#39'01'#39','#39'02'#39') AS COD_CONT,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    CASE'
      '      WHEN I.COD_CST_PIS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') THEN'
      '        SUM(I.VAL_TOTAL)'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN I.COD_CST_PIS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') THE' +
        'N'
      '            DECODE(O.PERC_BASE_PIS,0,0,'
      
        '              SUM((I.VAL_TOTAL*O.PERC_BASE_PIS/100)) + SUM(I.VAL' +
        '_DESPESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) '
      '        ELSE'
      '            0'
      '    END AS VAL_BC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_PIS,0)),0) AS V' +
        'L_TOT_CONT_NC_PER,'
      '    I.COD_CST_PIS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
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
      
        '      LEFT JOIN TB_NOTA_IMPOSTO_SERVICO NIS ON N.COD_NOTA_CAB = ' +
        'NIS.COD_NOTA_CAB'
      
        '      LEFT JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_IMPO' +
        'STO'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '    AND '
      '    (IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39' OR IMP.DESC_IMPOSTO IS NULL)'
      '  GROUP BY'
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_PIS),'
      '    DECODE(I.COD_CST_PIS,'#39'01'#39','#39'01'#39','#39'02'#39'),'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    I.COD_CST_PIS,'
      '    N.COD_SERIE_MODELO,'
      '    C.IND_PIS_COFINS_RETIDO'
      '    '
      '  UNION'
      '  '
      '  SELECT --I '
      '    PS.PERC_PIS,'
      '    DECODE(PS.PERC_PIS,1.65,'#39'01'#39','#39'02'#39') AS COD_CONT,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      N.VAL_FRETE) AS VL_REC_BRT,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_PIS/100)) AS VL_BC,'
      
        '    NVL(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PERC_PI' +
        'S / 100),0),0) AS VL_TOT_CONT_NC_PER,'
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
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      ''
      '  UNION'
      '  '
      '  SELECT'
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_PIS),'
      '    DECODE(I.COD_CST_PIS,'#39'01'#39','#39'01'#39','#39'02'#39') AS COD_CONT,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    CASE'
      '      WHEN I.COD_CST_PIS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') THEN'
      '        SUM(I.VAL_TOTAL)'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN I.COD_CST_PIS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') THE' +
        'N'
      '            DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '              DECODE(O.PERC_BASE_PIS,0,0,'
      
        '              (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL' +
        '_DESPESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '              SUM(I.VAL_BC_DI)) '
      '        ELSE'
      '            0'
      '    END AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
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
      
        '      LEFT JOIN TB_NOTA_IMPOSTO_SERVICO NIS ON N.COD_NOTA_CAB = ' +
        'NIS.COD_NOTA_CAB'
      
        '      LEFT JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_IMPO' +
        'STO'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      
        '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'SIM'#39')   ' +
        ' '
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '    AND '
      '    (IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39' OR IMP.DESC_IMPOSTO IS NULL)'
      '  GROUP BY'
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_PIS),'
      '    DECODE(I.COD_CST_PIS,'#39'01'#39','#39'01'#39','#39'02'#39'),'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),   '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    I.COD_CST_PIS,'
      '    N.COD_SERIE_MODELO,'
      '    C.IND_PIS_COFINS_RETIDO'
      '        '
      '  UNION --NOTAS REGIME CUMULATIVO (LUCRO PRESUMIDO)'
      '    '
      '  SELECT '
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_PIS) AS PERC_PIS,'
      '    DECODE(I.COD_CST_PIS,'#39'01'#39','#39'51'#39','#39'52'#39') COD_CONT,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    CASE'
      '      WHEN I.COD_CST_PIS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') THEN'
      '        SUM(I.VAL_TOTAL)'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN I.COD_CST_PIS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') THE' +
        'N'
      '            DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '              DECODE(O.PERC_BASE_PIS,0,0,'
      
        '              (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL' +
        '_DESPESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '              SUM(I.VAL_BC_DI)) '
      '        ELSE '
      '            0'
      '    END AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_CONT_PER,'
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
      
        '      INNER JOIN TB_NOTA_IMPOSTO_SERVICO NIS ON N.COD_NOTA_CAB =' +
        ' NIS.COD_NOTA_CAB'
      
        '      INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_IMP' +
        'OSTO'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '    AND '
      '    IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39
      '  GROUP BY   '
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_PIS),'
      '    DECODE(I.COD_CST_PIS,'#39'01'#39','#39'51'#39','#39'52'#39'),'
      '    N.IND_ENTRADA_SAIDA,'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),    '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    I.COD_CST_PIS,'
      '    N.COD_SERIE_MODELO,'
      '    C.IND_PIS_COFINS_RETIDO'
      '    '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO'
      '    PS.PERC_PIS,'
      '    DECODE(C.COD_CST_PIS,'#39'01'#39','#39'51'#39','#39'52'#39') AS COD_CONT,'
      '    NVL(CAD.IND_PIS_COFINS_RETIDO,'#39'NAO'#39'),'
      '    C.COD_SERIE_MODELO,'
      '    CASE'
      '      WHEN C.COD_CST_PIS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') THEN'
      '        C.VAL_FRETE + VAL_FRETE_PESO'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN C.COD_CST_PIS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') THE' +
        'N'
      '            DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '              DECODE(O.PERC_BASE_PIS,0,0,'
      '              (C.VAL_FRETE*O.PERC_BASE_PIS/100)),'
      '              (DECODE(O.PERC_BASE_PIS,0,0,'
      
        '              (C.VAL_FRETE*O.PERC_BASE_PIS/100)) * C.PERC_DESCON' +
        'TO_FRETE / 100)) '
      '        ELSE'
      '            0'
      '    END AS VAL_BC,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO, '#39'S'#39', C.VAL_PIS, 0),0) AS VL_' +
        'TOT_CONT_NC_PER,'
      '    C.COD_CST_PIS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = C.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      LEFT JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CADA' +
        'STRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO FRETE  '
      '    PS.PERC_PIS,'
      '    DECODE(PS.PERC_PIS,0.65,'#39'51'#39','#39'52'#39') COD_CONT,'
      '    NVL(CAD.IND_PIS_COFINS_RETIDO,'#39'NAO'#39'),'
      '    C.COD_SERIE_MODELO,'
      '    C.VAL_FRETE AS VL_REC_BRT,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_PIS/100) + NVL(C.VAL_PEDAGIO,0)) ' +
        'AS VAL_BC,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_PIS,0),0) AS VL_TOT' +
        '_CONT_NC_PER,'
      '    NULL AS COD_CST_PIS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      LEFT JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CADA' +
        'STRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    '
      '  UNION'
      '  '
      '  SELECT --N  '
      '    PS.PERC_PIS,'
      '    DECODE(I.COD_CST_PIS,'#39'01'#39','#39'51'#39','#39'52'#39') COD_CONT,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    CASE'
      '      WHEN I.COD_CST_PIS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') THEN'
      '        SUM(I.VAL_TOTAL)'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN I.COD_CST_PIS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') THE' +
        'N'
      '            DECODE(O.PERC_BASE_PIS,0,0,'
      
        '              SUM((I.VAL_TOTAL*O.PERC_BASE_PIS/100)) + SUM(I.VAL' +
        '_DESPESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) '
      '        ELSE'
      '            0'
      '    END AS VAL_BC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_PIS,0)),0) AS V' +
        'L_TOT_CONT_NC_PER,'
      '    I.COD_CST_PIS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
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
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      ' GROUP BY'
      '    PS.PERC_PIS,'
      '    DECODE(I.COD_CST_PIS,'#39'01'#39','#39'51'#39','#39'52'#39'),'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    I.COD_CST_PIS,'
      '    N.COD_SERIE_MODELO,'
      '    C.IND_PIS_COFINS_RETIDO'
      '    '
      '  UNION'
      '  '
      '  SELECT --I    '
      '    PS.PERC_PIS,'
      '    DECODE(PS.PERC_PIS,0.65,'#39'51'#39','#39'52'#39') COD_CONT,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      N.VAL_FRETE) AS VL_REC_BRT,'
      '    DECODE(O.PERC_BASE_PIS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_PIS/100)) AS VL_BC,'
      
        '    NVL(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PERC_PI' +
        'S / 100),0),0) AS VL_TOT_CONT_NC_PER,'
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
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '      '
      '  UNION'
      '  '
      '  SELECT   '
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_PIS) AS PERC_PIS,'
      '    DECODE(I.COD_CST_PIS,'#39'01'#39','#39'51'#39','#39'52'#39') COD_CONT,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    CASE'
      '      WHEN I.COD_CST_PIS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') THEN'
      '        SUM(I.VAL_TOTAL)'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN I.COD_CST_PIS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') THE' +
        'N'
      '            DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '              DECODE(O.PERC_BASE_PIS,0,0,'
      
        '              (SUM(I.VAL_TOTAL)*O.PERC_BASE_PIS/100) + SUM(I.VAL' +
        '_DESPESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '              SUM(I.VAL_BC_DI)) '
      '        ELSE'
      '            0'
      '    END AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
      '      I.COD_CST_PIS'
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
      
        '      INNER JOIN TB_NOTA_IMPOSTO_SERVICO NIS ON N.COD_NOTA_CAB =' +
        ' NIS.COD_NOTA_CAB'
      
        '      INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_IMP' +
        'OSTO'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'S'#39')'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39')'
      '    AND '
      '    IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39
      '  GROUP BY'
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_PIS),'
      '    DECODE(I.COD_CST_PIS,'#39'01'#39','#39'51'#39','#39'52'#39'),'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),   '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    I.COD_CST_PIS,'
      '    N.COD_SERIE_MODELO,'
      '    C.IND_PIS_COFINS_RETIDO'
      ')'
      'GROUP BY '
      '  COD_CONT,'
      '  ALIQ_PIS,'
      '  COD_CST_PIS,'
      '  COD_SERIE_MODELO,'
      '  IND_PIS_COFINS_RETIDO'
      'HAVING'
      
        '  COD_CST_PIS NOT IN ('#39'07'#39','#39'08'#39','#39'09'#39','#39'49'#39','#39'61'#39','#39'65'#39','#39'70'#39','#39'71'#39','#39'7' +
        '2'#39','#39'73'#39','#39'74'#39')'
      ')'
      'GROUP BY'
      '  COD_CONT,'
      '  ALIQ_PIS')
    Variables.Data = {
      0300000003000000080000003A46494C4941495301000000230000002853454C
      45435420434F445F46494C49414C2046524F4D2054425F46494C49414C290000
      000000070000003A44545F494E490C0000000000000000000000070000003A44
      545F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000008000000434F445F434F4E540100000000000C000000564C
      5F434F4E545F415055520100000000000B000000564C5F434F4E545F50455201
      00000000000A000000564C5F5245435F4252540100000000000A000000564C5F
      42435F434F4E5401000000000008000000414C49515F504953010000000000}
    Session = DMOracle.DBCemapa
    Left = 248
    Top = 88
    object QReg210COD_CONT: TStringField
      FieldName = 'COD_CONT'
      Size = 2
    end
    object QReg210ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object QReg210VL_CONT_APUR: TFloatField
      FieldName = 'VL_CONT_APUR'
    end
    object QReg210VL_CONT_PER: TFloatField
      FieldName = 'VL_CONT_PER'
    end
    object QReg210VL_REC_BRT: TFloatField
      FieldName = 'VL_REC_BRT'
    end
    object QReg210VL_BC_CONT: TFloatField
      FieldName = 'VL_BC_CONT'
    end
  end
  object QReg500_old: TOracleDataSet1
    SQL.Strings = (
      '-- SQL NOTAS'
      'SELECT'
      '  101 AS COD_CRED,'
      '  0 AS IND_CRED_ORI,'
      '  0 AS VL_AJUS_ACRES,'
      '  0 AS VL_AJUS_REDUC,'
      '  0 AS VL_CRED_DIF,'
      
        '  CASE WHEN (SUM(VL_CRED) > SUM(VL_CRED_DESC)) THEN  1 ELSE 0 EN' +
        'D AS IND_DESC_CRED,'
      '  CASE WHEN (SUM(VL_CRED) - SUM(VL_CRED_DESC)) >= 0 THEN'
      '    (SUM(VL_CRED) - SUM(VL_CRED_DESC)) ELSE 0 END AS SLD_CRED,'
      '  (SELECT PERC_COFINS FROM TB_PARAM_SISTEMA) AS ALIQ_COFINS,'
      '  SUM(VL_CRED) AS VL_CRED,'
      '  SUM(VL_CRED) AS VL_CRED_DISP,'
      '  CASE WHEN(SUM(VL_CRED_DESC) > SUM(VL_CRED)) THEN'
      '    SUM(VL_CRED) ELSE SUM(VL_CRED_DESC) END AS VL_CRED_DESC,'
      '  SUM(VAL_BC) AS VL_BC_COFINS'
      'FROM('
      '  SELECT    '
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_CRED,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_CRED_DESC'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '        AND P.IND_PINTURA = '#39'SIM'#39' AND P.IND_ESTOFARIA = '#39'SIM'#39
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      '  WHERE'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    NOT (I.COD_CST_COFINS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY    '
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO        '
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39', C.VAL_COFINS, 0)),0' +
        ') AS VL_CRED,'
      '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39','
      '      DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100)),'
      '      (DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100)) * C.PERC_DESCONTO_FR' +
        'ETE / 100)),0)),0) AS VAL_BC,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_COFINS,0)),0) A' +
        'S VL_CRED_DESC'
      '  FROM'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = C.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL IN (1,2)'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '    AND'
      '    NOT (C.COD_CST_COFINS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'E'#39',C.VAL_COFINS,0)),0) A' +
        'S VL_CRED,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100) + NVL(C.VAL_PEDAGIO,0' +
        ')) AS VAL_BC,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_COFINS,0)),0) A' +
        'S VL_CRED_DESC'
      '  FROM'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL IN (1,2)'
      '    AND'
      '    NOT (O.COD_CST_COFINS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100) + NVL(C.VAL_PEDAGIO,0' +
        '))'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --N'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_CRED,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      SUM((I.VAL_TOTAL*O.PERC_BASE_COFINS/100)) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) AS VAL_BC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_CRED_DESC'
      '  FROM'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN '
      '    AND'
      '    NOT (I.COD_CST_COFINS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)  '
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --I    '
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',(N.VAL_FRETE * PS.PER' +
        'C_COFINS / 100),0)),0) AS VL_CRED,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_COFINS/100)) AS VL_BC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PER' +
        'C_COFINS / 100),0)),0) AS VL_CRED_DESC'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO_CF = S' +
        'M.COD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    NOT (O.COD_CST_COFINS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_COFINS/100))'
      '      '
      '  UNION'
      '  '
      '  SELECT    '
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_CRED,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_CRED_DESC'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '        AND P.IND_PINTURA = '#39'SIM'#39' AND P.IND_ESTOFARIA = '#39'SIM'#39
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      '  WHERE'
      
        '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'SIM'#39')   ' +
        ' '
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    NOT (I.COD_CST_COFINS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '    /*    '
      '    UNION --NOTAS REGIME CUMULATIVO (LUCRO PRESUMIDO)'
      '    '
      '    SELECT    '
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_CRED,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_CRED_DESC'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '        AND P.IND_PINTURA = '#39'SIM'#39' AND P.IND_ESTOFARIA = '#39'SIM'#39
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
      '  WHERE'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY    '
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39', C.VAL_COFINS, 0)),0' +
        ') AS VL_CRED,'
      '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39','
      '      DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100)),'
      '      (DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100)) * C.PERC_DESCONTO_FR' +
        'ETE / 100)),0)),0) AS VAL_BC,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'S'#39', C.VAL_COFINS, 0)),0' +
        ') AS VL_CRED_DESC'
      '  FROM'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = C.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL IN (1,2)'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO FRETE    '
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'E'#39',C.VAL_COFINS,0)),0) A' +
        'S VL_CRED,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100) + NVL(C.VAL_PEDAGIO,0' +
        ')) AS VAL_BC,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_COFINS,0)),0) A' +
        'S VL_CRED_DESC'
      '  FROM'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL IN (1,2)'
      '  GROUP BY'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100) + NVL(C.VAL_PEDAGIO,0' +
        '))'
      '    '
      '  UNION'
      '  '
      '  SELECT --N    '
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_CRED,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      SUM((I.VAL_TOTAL*O.PERC_BASE_COFINS/100)) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) AS VAL_BC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_CRED_DESC'
      '  FROM'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  GROUP BY'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB) '
      '    '
      '  UNION'
      '  '
      '  SELECT --I    '
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',(N.VAL_FRETE * PS.PER' +
        'C_COFINS / 100),0)),0) AS VL_CRED,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_COFINS/100)) AS VL_BC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PER' +
        'C_COFINS / 100),0)),0) AS VL_CRED_DESC'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO_CF = S' +
        'M.COD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_COFINS/100))'
      '    '
      '  UNION'
      '  '
      '  SELECT    '
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_CRED,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_CRED_DESC'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '        AND P.IND_PINTURA = '#39'SIM'#39' AND P.IND_ESTOFARIA = '#39'SIM'#39
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
      '  WHERE'
      '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'S'#39')'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '  GROUP BY'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA),'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)  '
      '  */   '
      ')'
      'GROUP BY'
      '  101,'
      '  0,'
      '  0,'
      '  0,'
      '  0,'
      '  0,'
      '  0')
    Variables.Data = {
      0300000003000000080000003A46494C4941495301000000230000002853454C
      45435420434F445F46494C49414C2046524F4D2054425F46494C49414C290000
      000000070000003A44545F494E490C0000000000000000000000070000003A44
      545F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C00000008000000434F445F435245440100000000000C000000494E
      445F435245445F4F52490100000000000D000000564C5F414A55535F41435245
      530100000000000D000000564C5F414A55535F52454455430100000000000B00
      0000564C5F435245445F4449460100000000000D000000494E445F444553435F
      4352454401000000000008000000534C445F435245440100000000000B000000
      414C49515F434F46494E5301000000000007000000564C5F4352454401000000
      00000C000000564C5F435245445F444953500100000000000C000000564C5F43
      5245445F444553430100000000000C000000564C5F42435F434F46494E530100
      00000000}
    Session = DMOracle.DBCemapa
    Left = 312
    Top = 24
    object QReg500_oldCOD_CRED: TFloatField
      FieldName = 'COD_CRED'
    end
    object QReg500_oldIND_CRED_ORI: TFloatField
      FieldName = 'IND_CRED_ORI'
    end
    object QReg500_oldVL_AJUS_ACRES: TFloatField
      FieldName = 'VL_AJUS_ACRES'
    end
    object QReg500_oldVL_AJUS_REDUC: TFloatField
      FieldName = 'VL_AJUS_REDUC'
    end
    object QReg500_oldVL_CRED_DIF: TFloatField
      FieldName = 'VL_CRED_DIF'
    end
    object QReg500_oldIND_DESC_CRED: TFloatField
      FieldName = 'IND_DESC_CRED'
    end
    object QReg500_oldSLD_CRED: TFloatField
      FieldName = 'SLD_CRED'
    end
    object QReg500_oldALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object QReg500_oldVL_CRED: TFloatField
      FieldName = 'VL_CRED'
    end
    object QReg500_oldVL_CRED_DISP: TFloatField
      FieldName = 'VL_CRED_DISP'
    end
    object QReg500_oldVL_CRED_DESC: TFloatField
      FieldName = 'VL_CRED_DESC'
    end
    object QReg500_oldVL_BC_COFINS: TFloatField
      FieldName = 'VL_BC_COFINS'
    end
  end
  object QReg600_old: TOracleDataSet1
    SQL.Strings = (
      ''
      '-- SQL copiada do registro M200 e alterada para o cofins'
      'SELECT'
      
        '  CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT_CONT_NC_PER) THEN' +
        ' '
      
        '    SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED_DESC) END AS VL' +
        '_TOT_CRED_DESC,'
      '--  SUM(VL_TOT_CRED_DESC) AS VL_TOT_CRED_DESC,'
      '  SUM(VL_TOT_CONT_NC_PER) AS VL_TOT_CONT_NC_PER,'
      '  SUM(VL_TOT_CONT_CUM_PER) AS VL_TOT_CONT_CUM_PER,'
      '  SUM(VL_CONT_CUM_REC) AS VL_CONT_CUM_REC,  '
      '  SUM(VL_TOT_CONT_REC) AS VL_TOT_CONT_REC,'
      '    CASE '
      '        WHEN (SUM(VL_TOT_CONT_NC_PER) - '
      
        '            CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT_CONT_NC' +
        '_PER) THEN '
      
        '            SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED_DESC) E' +
        'ND -'
      '            0) > 0 THEN '
      '                (SUM(VL_TOT_CONT_NC_PER) - '
      
        '                    CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT' +
        '_CONT_NC_PER) THEN '
      
        '                    SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED' +
        '_DESC) END -'
      '                    0)'
      '        ELSE'
      '            0'
      '                '
      
        '    END AS VL_CONT_NC_REC, --Reten'#231#245'es e dedu'#231#245'es pelo c'#243'digo de' +
        'lphi'
      '  '
      '--  SUM(VL_CONT_NC_REC) AS VL_CONT_NC_REC,'
      '  SUM(VL_TOT_CRED_DESC_ANT) AS VL_TOT_CRED_DESC_ANT,'
      '--  SUM(VL_TOT_CONT_NC_DEV) AS VL_TOT_CONT_NC_DEV'
      'CASE '
      '    WHEN (SUM(VL_TOT_CONT_NC_PER) - '
      
        '        CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT_CONT_NC_PER' +
        ') THEN '
      '        SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED_DESC) END -'
      '        0) > 0 THEN '
      '            (SUM(VL_TOT_CONT_NC_PER) - '
      
        '                CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT_CON' +
        'T_NC_PER) THEN '
      
        '                SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED_DES' +
        'C) END -'
      '                0)'
      '    ELSE'
      '        0'
      '            '
      'END AS VL_TOT_CONT_NC_DEV'
      'FROM('
      '-- SQL NOTAS'
      'SELECT'
      '  SUM(VL_TOT_CRED_DESC) AS VL_TOT_CRED_DESC,'
      '  SUM(VL_TOT_CONT_NC_PER) AS VL_TOT_CONT_NC_PER,'
      '  '
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      SUM(VL_TOT_CONT_CUM_PER) '
      '  END AS VL_TOT_CONT_CUM_PER,'
      '  '
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      SUM(VL_TOT_CONT_CUM_PER) '
      '  END AS VL_CONT_CUM_REC,      '
      '   '
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      SUM(VL_TOT_CONT_NC_PER) - '
      
        '    CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT_CONT_NC_PER) TH' +
        'EN '
      '      SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED_DESC) END +'
      '    (SUM(VL_TOT_CONT_CUM_PER) )'
      '  END AS VL_TOT_CONT_REC,'
      '  '
      '--  SUM(VL_TOT_CONT_NC_PER) - '
      
        '--    CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT_CONT_NC_PER) ' +
        'THEN '
      
        '--      SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED_DESC) END A' +
        'S VL_CONT_NC_REC,'
      '    '
      '--  SUM(0) AS VL_TOT_CONT_REC,'
      '  SUM(0) AS VL_TOT_CRED_DESC_ANT'
      '  '
      '--  SUM(VL_TOT_CONT_NC_PER) - '
      
        '--    CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT_CONT_NC_PER) ' +
        'THEN '
      '--    SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED_DESC) END -'
      '--    0 AS VL_TOT_CONT_NC_DEV'
      'FROM(  '
      '  SELECT'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CRED_DESC,'
      '          '
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
      '    '
      '    0 AS VL_TOT_CONT_CUM_PER'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA)   '
      '    '
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO'
      
        '    NVL(CAD.IND_PIS_COFINS_RETIDO, '#39'NAO'#39') AS IND_PIS_COFINS_RETI' +
        'DO,'
      '    C.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39', C.VAL_COFINS, 0)),0' +
        ') AS VL_TOT_CRED_DESC,    '
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'S'#39', C.VAL_COFINS, 0)),0' +
        ') AS VL_TOT_CONT_NC_PER,'
      '    0 AS VL_TOT_CONT_CUM_PER'
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
      
        '      LEFT JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CADA' +
        'STRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  GROUP BY'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO'
      '  '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      
        '    NVL(CAD.IND_PIS_COFINS_RETIDO, '#39'NAO'#39') AS IND_PIS_COFINS_RETI' +
        'DO,'
      '    C.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'E'#39',C.VAL_COFINS,0)),0) A' +
        'S VL_TOT_CRED_DESC,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_COFINS,0)),0) A' +
        'S VL_TOT_CONT_NC_PER,'
      '    0 AS VL_TOT_CONT_CUM_PER'
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
      
        '      LEFT JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CADA' +
        'STRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '  GROUP BY'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --N'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_TOT_CRED_DESC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_TOT_CONT_NC_PER,'
      '    0 AS VL_TOT_CONT_CUM_PER'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO  '
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --I'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',(N.VAL_FRETE * PS.PER' +
        'C_PIS / 100),0)),0) AS VL_TOT_CRED_DESC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PER' +
        'C_PIS / 100),0)),0) AS VL_TOT_CONT_NC_PER,'
      '    0 AS VL_TOT_CONT_CUM_PER'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO'
      '    '
      '  UNION'
      '  '
      '  SELECT'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CRED_DESC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
      '    0 AS VL_TOT_CONT_CUM_PER'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA)   '
      '        '
      '    UNION --NOTAS REGIME CUMULATIVO (LUCRO PRESUMIDO)'
      '    '
      '    SELECT    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CRED_DESC,'
      '    0 AS VL_TOT_CONT_NC_PER,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CONT_CUM_PER   '
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY      '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA)'
      '    '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO'
      
        '    NVL(CAD.IND_PIS_COFINS_RETIDO, '#39'NAO'#39') AS IND_PIS_COFINS_RETI' +
        'DO,'
      '    C.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39', C.VAL_COFINS, 0)),0' +
        ') AS VL_TOT_CRED_DESC,    '
      '    0 AS VL_TOT_CONT_NC_PER,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'S'#39', C.VAL_COFINS, 0)),0' +
        ') AS VL_TOT_CONT_CUM_PER'
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
      
        '      LEFT JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CADA' +
        'STRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  GROUP BY'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO'
      '    '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO FRETE    '
      
        '    NVL(CAD.IND_PIS_COFINS_RETIDO, '#39'NAO'#39') AS IND_PIS_COFINS_RETI' +
        'DO,'
      '    C.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'E'#39',C.VAL_COFINS,0)),0) A' +
        'S VL_TOT_CRED_DESC,'
      '    0 AS VL_TOT_CONT_NC_PER,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_COFINS,0)),0) A' +
        'S VL_TOT_CONT_CUM_PER  '
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
      
        '      LEFT JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CADA' +
        'STRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '  GROUP BY'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO'
      '    '
      '  UNION'
      '  '
      '  SELECT --N'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_TOT_CRED_DESC,'
      '    0 AS VL_TOT_CONT_NC_PER,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_TOT_CONT_CUM_PER '
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO'
      '    '
      '  UNION'
      '  '
      '  SELECT --I'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',(N.VAL_FRETE * PS.PER' +
        'C_PIS / 100),0)),0) AS VL_TOT_CRED_DESC,'
      '    0 AS VL_TOT_CONT_NC_PER,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PER' +
        'C_PIS / 100),0)),0) AS VL_TOT_CONT_CUM_PER    '
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO'
      '    '
      '  UNION'
      '  '
      '  SELECT'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CRED_DESC,'
      '    0 AS VL_TOT_CONT_NC_PER,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CONT_CUM_PER'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA)    '
      ')'
      'GROUP BY'
      '  COD_SERIE_MODELO,'
      '  IND_PIS_COFINS_RETIDO'
      ')'
      ''
      ''
      ''
      ''
      '/*'
      'SELECT'
      '  SUM(VL_TOT_CRED_DESC) AS VL_TOT_CRED_DESC,'
      '  SUM(VL_TOT_CONT_NC_PER) AS VL_TOT_CONT_NC_PER,'
      '  SUM(VL_TOT_CONT_CUM_PER) AS VL_TOT_CONT_CUM_PER,'
      '  SUM(VL_CONT_CUM_REC) AS VL_CONT_CUM_REC,'
      '  SUM(VL_TOT_CONT_REC) AS VL_TOT_CONT_REC,'
      '  SUM(VL_TOT_CRED_DESC_ANT) AS VL_TOT_CRED_DESC_ANT,'
      '  SUM(VL_TOT_CONT_NC_DEV) AS VL_TOT_CONT_NC_DEV,'
      '  SUM(VL_CONT_NC_REC) AS VL_CONT_NC_REC'
      'FROM('
      '-- SQL NOTAS'
      'SELECT'
      
        '  CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT_CONT_NC_PER) THEN' +
        ' '
      
        '    SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED_DESC) END AS VL' +
        '_TOT_CRED_DESC,'
      '  SUM(VL_TOT_CONT_NC_PER) AS VL_TOT_CONT_NC_PER,'
      '  '
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      SUM(VL_TOT_CONT_CUM_PER) '
      '  END AS VL_TOT_CONT_CUM_PER,'
      '  '
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      SUM(VL_TOT_CONT_CUM_PER) '
      '  END AS VL_CONT_CUM_REC,'
      '  '
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      SUM(VL_TOT_CONT_NC_PER) - '
      
        '        CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT_CONT_NC_PER' +
        ') THEN '
      
        '          SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED_DESC) END' +
        ' +'
      '        (SUM(VL_TOT_CONT_CUM_PER) ) '
      '  END AS VL_TOT_CONT_REC,  '
      '  '
      '  SUM(0) AS VL_TOT_CRED_DESC_ANT,  '
      '  SUM(VL_TOT_CONT_NC_PER) -'
      
        '    CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT_CONT_NC_PER) TH' +
        'EN '
      '      SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED_DESC) END - '
      '    0'
      '     AS VL_TOT_CONT_NC_DEV,    '
      '  SUM(VL_TOT_CONT_NC_PER) - '
      
        '    CASE WHEN SUM(VL_TOT_CRED_DESC) > SUM(VL_TOT_CONT_NC_PER) TH' +
        'EN '
      '      SUM(VL_TOT_CONT_NC_PER) ELSE SUM(VL_TOT_CRED_DESC) END - '
      '    0 AS VL_CONT_NC_REC '
      'FROM('
      '  SELECT'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CRED_DESC,          '
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
      '    '
      '    0 AS VL_TOT_CONT_CUM_PER'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA)   '
      '    '
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39', C.VAL_COFINS, 0)),0' +
        ') AS VL_TOT_CRED_DESC,    '
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'S'#39', C.VAL_COFINS, 0)),0' +
        ') AS VL_TOT_CONT_NC_PER,'
      '    0 AS VL_TOT_CONT_CUM_PER'
      '  FROM'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
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
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  GROUP BY'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO'
      '  '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'E'#39',C.VAL_COFINS,0)),0) A' +
        'S VL_TOT_CRED_DESC,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_COFINS,0)),0) A' +
        'S VL_TOT_CONT_NC_PER,'
      '    0 AS VL_TOT_CONT_CUM_PER'
      '  FROM'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
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
      '    C.COD_FILIAL IN :FILIAIS'
      '  GROUP BY'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO '
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --N'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_TOT_CRED_DESC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_TOT_CONT_NC_PER,'
      '    0 AS VL_TOT_CONT_CUM_PER'
      '  FROM'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --I'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',(N.VAL_FRETE * PS.PER' +
        'C_COFINS / 100),0)),0) AS VL_TOT_CRED_DESC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PER' +
        'C_COFINS / 100),0)),0) AS VL_TOT_CONT_NC_PER,'
      '    0 AS VL_TOT_CONT_CUM_PER'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO'
      '  '
      '  UNION'
      '  '
      '  SELECT'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CRED_DESC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
      '    0 AS VL_TOT_CONT_CUM_PER'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA)   '
      '        '
      '    UNION --NOTAS REGIME CUMULATIVO (LUCRO PRESUMIDO)'
      '    '
      '    SELECT    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CRED_DESC,'
      '    0 AS VL_TOT_CONT_NC_PER,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CONT_CUM_PER'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA)'
      '    '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39', C.VAL_COFINS, 0)),0' +
        ') AS VL_TOT_CRED_DESC,    '
      '    0 AS VL_TOT_CONT_NC_PER,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO, '#39'S'#39', C.VAL_COFINS, 0)),0' +
        ') AS VL_TOT_CONT_CUM_PER'
      '  FROM'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
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
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  GROUP BY'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO'
      '    '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'E'#39',C.VAL_COFINS,0)),0) A' +
        'S VL_TOT_CRED_DESC,'
      '    0 AS VL_TOT_CONT_NC_PER,'
      
        '    NVL(SUM(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_COFINS,0)),0) A' +
        'S VL_TOT_CONT_CUM_PER  '
      '  FROM'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
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
      '    C.COD_FILIAL IN :FILIAIS'
      '  GROUP BY'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO'
      '    '
      '  UNION'
      '  '
      '  SELECT --N'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_TOT_CRED_DESC,'
      '    0 AS VL_TOT_CONT_NC_PER,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_TOT_CONT_CUM_PER    '
      '  FROM'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO'
      '    '
      '  UNION'
      '  '
      '  SELECT --I'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',(N.VAL_FRETE * PS.PER' +
        'C_COFINS / 100),0)),0) AS VL_TOT_CRED_DESC,'
      '    0 AS VL_TOT_CONT_NC_PER,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PER' +
        'C_COFINS / 100),0)),0) AS VL_TOT_CONT_CUM_PER'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO'
      '    '
      '  UNION'
      '  '
      '  SELECT'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CRED_DESC,'
      '    0 AS VL_TOT_CONT_NC_PER,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CONT_CUM_PER   '
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '      DECODE(O.IND_SERVICO,'#39'S'#39','
      '      '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '    N.IND_ENTRADA_SAIDA)    '
      ')'
      'GROUP BY'
      '  IND_PIS_COFINS_RETIDO,'
      '  COD_SERIE_MODELO'
      ')'
      '*/')
    Variables.Data = {
      0300000003000000080000003A46494C4941495301000000230000002853454C
      45435420434F445F46494C49414C2046524F4D2054425F46494C49414C290000
      000000070000003A44545F494E490C0000000000000000000000070000003A44
      545F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000800000010000000564C5F544F545F435245445F4445534301000000
      000012000000564C5F544F545F434F4E545F4E435F5045520100000000001300
      0000564C5F544F545F434F4E545F43554D5F5045520100000000001400000056
      4C5F544F545F435245445F444553435F414E540100000000000F000000564C5F
      434F4E545F43554D5F5245430100000000000F000000564C5F544F545F434F4E
      545F52454301000000000012000000564C5F544F545F434F4E545F4E435F4445
      560100000000000E000000564C5F434F4E545F4E435F524543010000000000}
    Session = DMOracle.DBCemapa
    Left = 376
    Top = 24
    object QReg600_oldVL_TOT_CRED_DESC: TFloatField
      FieldName = 'VL_TOT_CRED_DESC'
    end
    object QReg600_oldVL_TOT_CONT_NC_PER: TFloatField
      FieldName = 'VL_TOT_CONT_NC_PER'
    end
    object QReg600_oldVL_TOT_CONT_CUM_PER: TFloatField
      FieldName = 'VL_TOT_CONT_CUM_PER'
    end
    object QReg600_oldVL_TOT_CRED_DESC_ANT: TFloatField
      FieldName = 'VL_TOT_CRED_DESC_ANT'
    end
    object QReg600_oldVL_CONT_CUM_REC: TFloatField
      FieldName = 'VL_CONT_CUM_REC'
    end
    object QReg600_oldVL_TOT_CONT_REC: TFloatField
      FieldName = 'VL_TOT_CONT_REC'
    end
    object QReg600_oldVL_TOT_CONT_NC_DEV: TFloatField
      FieldName = 'VL_TOT_CONT_NC_DEV'
    end
    object QReg600_oldVL_CONT_NC_REC: TFloatField
      FieldName = 'VL_CONT_NC_REC'
    end
  end
  object QReg610: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_CONT,'
      '  ALIQ_COFINS,'
      '  SUM(VL_CONT_PER) AS VL_CONT_APUR,'
      '  SUM(VL_CONT_PER) AS VL_CONT_PER,'
      '  SUM(VL_REC_BRT) AS VL_REC_BRT,'
      '  SUM(VL_BC_CONT) AS VL_BC_CONT'
      'FROM'
      '('
      '-- SQL NOTAS'
      'SELECT '
      '  COD_CONT,'
      '  ALIQ_COFINS,'
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      SUM(VL_CONT_PER)'
      '  END AS VL_CONT_APUR,'
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      SUM(VL_CONT_PER)'
      '  END AS VL_CONT_PER,'
      '  SUM(VL_REC_BRT) AS VL_REC_BRT,'
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      SUM(VAL_BC)'
      '  END AS VL_BC_CONT'
      'FROM('
      '  SELECT    '
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_COFINS) AS ALIQ_COFINS,    '
      '    DECODE(I.COD_CST_COFINS,'#39'01'#39','#39'01'#39','#39'02'#39') AS COD_CONT,    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    CASE'
      
        '      WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') TH' +
        'EN'
      '        SUM(I.VAL_TOTAL)'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,    '
      '    '
      '    CASE'
      
        '        WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') ' +
        'THEN    '
      '            DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '              DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '              (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.' +
        'VAL_DESPESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '              SUM(I.VAL_BC_DI)) '
      '        ELSE '
      '            0      '
      '    END AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_CONT_PER,'
      '    I.COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      
        '      LEFT JOIN TB_NOTA_IMPOSTO_SERVICO NIS ON N.COD_NOTA_CAB = ' +
        'NIS.COD_NOTA_CAB'
      
        '      LEFT JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_IMPO' +
        'STO'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '    AND '
      
        '    (IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39' OR IMP.DESC_IMPOSTO IS NUL' +
        'L)'
      '  GROUP BY'
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_COFINS),'
      '    DECODE(I.COD_CST_COFINS,'#39'01'#39','#39'01'#39','#39'02'#39'),'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),    '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    I.COD_CST_COFINS,'
      '    N.COD_SERIE_MODELO,'
      '    C.IND_PIS_COFINS_RETIDO'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO    '
      '    PS.PERC_COFINS,'
      '    DECODE(C.COD_CST_COFINS,'#39'01'#39','#39'01'#39','#39'02'#39') COD_CONT,'
      
        '    NVL(CAD.IND_PIS_COFINS_RETIDO,'#39'NAO'#39') AS IND_PIS_COFINS_RETID' +
        'O,'
      '    C.COD_SERIE_MODELO,'
      '    CASE'
      
        '      WHEN C.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') TH' +
        'EN'
      '        C.VAL_FRETE+VAL_FRETE_PESO'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN C.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') ' +
        'THEN'
      '            DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '              DECODE(O.PERC_BASE_COFINS,0,0,'
      '              (C.VAL_FRETE*O.PERC_BASE_COFINS/100)),'
      '              (DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '              (C.VAL_FRETE*O.PERC_BASE_COFINS/100)) * C.PERC_DES' +
        'CONTO_FRETE / 100)) '
      '        ELSE'
      '            0'
      '    END AS VAL_BC,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO, '#39'S'#39', C.VAL_COFINS, 0),0) AS ' +
        'VL_TOT_CONT_NC_PER,'
      '    C.COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = C.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      LEFT JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CADA' +
        'STRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      '    PS.PERC_COFINS AS PERC_COFINS,'
      '    DECODE(PS.PERC_COFINS,1.65,'#39'01'#39','#39'02'#39') AS COD_CONT,'
      '    NVL(CAD.IND_PIS_COFINS_RETIDO,'#39'NAO'#39'),'
      '    C.COD_SERIE_MODELO,'
      '    C.VAL_FRETE AS VL_REC_BRT,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100) + NVL(C.VAL_PEDAGIO,0' +
        ')) AS VAL_BC,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_COFINS,0),0) AS VL_' +
        'TOT_CONT_NC_PER,'
      '    NULL AS COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      LEFT JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CADA' +
        'STRO '
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    '
      '  UNION'
      '  '
      '  SELECT --N'
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_COFINS),'
      '    DECODE(I.COD_CST_COFINS,'#39'01'#39','#39'01'#39','#39'02'#39') AS COD_CONT,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    CASE'
      
        '      WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') TH' +
        'EN'
      '        SUM(I.VAL_TOTAL)'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') ' +
        'THEN'
      '            DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '              SUM((I.VAL_TOTAL*O.PERC_BASE_COFINS/100)) + SUM(I.' +
        'VAL_DESPESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) '
      '        ELSE'
      '            0'
      '    END AS VAL_BC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_TOT_CONT_NC_PER,'
      '    I.COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      
        '      LEFT JOIN TB_NOTA_IMPOSTO_SERVICO NIS ON N.COD_NOTA_CAB = ' +
        'NIS.COD_NOTA_CAB'
      
        '      LEFT JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_IMPO' +
        'STO'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '    AND '
      
        '    (IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39' OR IMP.DESC_IMPOSTO IS NUL' +
        'L)'
      '  GROUP BY'
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_COFINS),'
      '    DECODE(I.COD_CST_COFINS,'#39'01'#39','#39'01'#39','#39'02'#39'),'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    I.COD_CST_COFINS,'
      '    N.COD_SERIE_MODELO,'
      '    C.IND_PIS_COFINS_RETIDO'
      '    '
      '  UNION'
      '  '
      '  SELECT --I '
      '    PS.PERC_COFINS,'
      '    DECODE(PS.PERC_COFINS,1.65,'#39'01'#39','#39'02'#39') AS COD_CONT,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      '      N.VAL_FRETE) AS VL_REC_BRT,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_COFINS/100)) AS VL_BC,'
      
        '    NVL(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PERC_CO' +
        'FINS / 100),0),0) AS VL_TOT_CONT_NC_PER,'
      '    NULL AS COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO_CF = S' +
        'M.COD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      ''
      '  UNION'
      '  '
      '  SELECT'
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_COFINS),'
      '    DECODE(I.COD_CST_COFINS,'#39'01'#39','#39'01'#39','#39'02'#39') AS COD_CONT,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    CASE'
      
        '      WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') TH' +
        'EN'
      '        SUM(I.VAL_TOTAL)'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') ' +
        'THEN'
      '            DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '              DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '              (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.' +
        'VAL_DESPESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '              SUM(I.VAL_BC_DI)) '
      '        ELSE'
      '            0'
      '    END AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
      '    I.COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      
        '      LEFT JOIN TB_NOTA_IMPOSTO_SERVICO NIS ON N.COD_NOTA_CAB = ' +
        'NIS.COD_NOTA_CAB'
      
        '      LEFT JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_IMPO' +
        'STO'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      
        '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'SIM'#39')   ' +
        ' '
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '    AND '
      
        '    (IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39' OR IMP.DESC_IMPOSTO IS NUL' +
        'L)'
      '  GROUP BY'
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_COFINS),'
      '    DECODE(I.COD_CST_COFINS,'#39'01'#39','#39'01'#39','#39'02'#39'),'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),   '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    I.COD_CST_COFINS,'
      '    N.COD_SERIE_MODELO,'
      '    C.IND_PIS_COFINS_RETIDO'
      '        '
      '  UNION --NOTAS REGIME CUMULATIVO (LUCRO PRESUMIDO)'
      '    '
      '  SELECT '
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_COFINS) AS PERC_COFINS,'
      '    DECODE(I.COD_CST_COFINS,'#39'01'#39','#39'51'#39','#39'52'#39') COD_CONT,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    CASE'
      
        '      WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') TH' +
        'EN'
      '        SUM(I.VAL_TOTAL)'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') ' +
        'THEN'
      '            DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '              DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '              (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.' +
        'VAL_DESPESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '              SUM(I.VAL_BC_DI)) '
      '        ELSE '
      '            0'
      '    END AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_CONT_PER,'
      '    I.COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      
        '      INNER JOIN TB_NOTA_IMPOSTO_SERVICO NIS ON N.COD_NOTA_CAB =' +
        ' NIS.COD_NOTA_CAB'
      
        '      INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_IMP' +
        'OSTO'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '    AND '
      '    IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39
      '  GROUP BY   '
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_COFINS),'
      '    DECODE(I.COD_CST_COFINS,'#39'01'#39','#39'51'#39','#39'52'#39'),'
      '    N.IND_ENTRADA_SAIDA,'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),    '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    I.COD_CST_COFINS,'
      '    N.COD_SERIE_MODELO,'
      '    C.IND_PIS_COFINS_RETIDO'
      '    '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO'
      '    PS.PERC_COFINS,'
      '    DECODE(C.COD_CST_COFINS,'#39'01'#39','#39'51'#39','#39'52'#39') AS COD_CONT,'
      '    NVL(CAD.IND_PIS_COFINS_RETIDO,'#39'NAO'#39'),'
      '    C.COD_SERIE_MODELO,'
      '    CASE'
      
        '      WHEN C.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') TH' +
        'EN'
      '        C.VAL_FRETE + VAL_FRETE_PESO'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN C.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') ' +
        'THEN'
      '            DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '              DECODE(O.PERC_BASE_COFINS,0,0,'
      '              (C.VAL_FRETE*O.PERC_BASE_COFINS/100)),'
      '              (DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '              (C.VAL_FRETE*O.PERC_BASE_COFINS/100)) * C.PERC_DES' +
        'CONTO_FRETE / 100)) '
      '        ELSE'
      '            0'
      '    END AS VAL_BC,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO, '#39'S'#39', C.VAL_COFINS, 0),0) AS ' +
        'VL_TOT_CONT_NC_PER,'
      '    C.COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = C.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      LEFT JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CADA' +
        'STRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO FRETE  '
      '    PS.PERC_COFINS,'
      '    DECODE(PS.PERC_COFINS,0.65,'#39'51'#39','#39'52'#39') COD_CONT,'
      '    NVL(CAD.IND_PIS_COFINS_RETIDO,'#39'NAO'#39'),'
      '    C.COD_SERIE_MODELO,'
      '    C.VAL_FRETE AS VL_REC_BRT,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100) + NVL(C.VAL_PEDAGIO,0' +
        ')) AS VAL_BC,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_COFINS,0),0) AS VL_' +
        'TOT_CONT_NC_PER,'
      '    NULL AS COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      LEFT JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CADA' +
        'STRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    '
      '  UNION'
      '  '
      '  SELECT --N  '
      '    PS.PERC_COFINS,'
      '    DECODE(I.COD_CST_COFINS,'#39'01'#39','#39'51'#39','#39'52'#39') COD_CONT,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    CASE'
      
        '      WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') TH' +
        'EN'
      '        SUM(I.VAL_TOTAL)'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') ' +
        'THEN'
      '            DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '              SUM((I.VAL_TOTAL*O.PERC_BASE_COFINS/100)) + SUM(I.' +
        'VAL_DESPESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) '
      '        ELSE'
      '            0'
      '    END AS VAL_BC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_TOT_CONT_NC_PER,'
      '    I.COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      ' GROUP BY'
      '    PS.PERC_COFINS,'
      '    DECODE(I.COD_CST_COFINS,'#39'01'#39','#39'51'#39','#39'52'#39'),'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    I.COD_CST_COFINS,'
      '    N.COD_SERIE_MODELO,'
      '    C.IND_PIS_COFINS_RETIDO'
      '    '
      '  UNION'
      '  '
      '  SELECT --I    '
      '    PS.PERC_COFINS,'
      '    DECODE(PS.PERC_COFINS,0.65,'#39'51'#39','#39'52'#39') COD_CONT,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      '      N.VAL_FRETE) AS VL_REC_BRT,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_COFINS/100)) AS VL_BC,'
      
        '    NVL(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PERC_CO' +
        'FINS / 100),0),0) AS VL_TOT_CONT_NC_PER,'
      '    NULL AS COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO_CF = S' +
        'M.COD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '      '
      '  UNION'
      '  '
      '  SELECT   '
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_COFINS) AS PERC_COFINS,'
      '    DECODE(I.COD_CST_COFINS,'#39'01'#39','#39'51'#39','#39'52'#39') COD_CONT,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    CASE'
      
        '      WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') TH' +
        'EN'
      '        SUM(I.VAL_TOTAL)'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') ' +
        'THEN'
      '            DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '              DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '              (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.' +
        'VAL_DESPESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '              SUM(I.VAL_BC_DI)) '
      '        ELSE'
      '            0'
      '    END AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
      '      I.COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      
        '      INNER JOIN TB_NOTA_IMPOSTO_SERVICO NIS ON N.COD_NOTA_CAB =' +
        ' NIS.COD_NOTA_CAB'
      
        '      INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_IMP' +
        'OSTO'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'S'#39')'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39')'
      '    AND '
      '    IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39
      '  GROUP BY'
      '    NVL(IMP.PERC_ALIQUOTA, PS.PERC_COFINS),'
      '    DECODE(I.COD_CST_COFINS,'#39'01'#39','#39'51'#39','#39'52'#39'),'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),   '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    I.COD_CST_COFINS,'
      '    N.COD_SERIE_MODELO,'
      '    C.IND_PIS_COFINS_RETIDO'
      ')'
      'GROUP BY '
      '  COD_CONT,'
      '  ALIQ_COFINS,'
      '  COD_CST_COFINS,'
      '  COD_SERIE_MODELO,'
      '  IND_PIS_COFINS_RETIDO'
      'HAVING'
      
        '  COD_CST_COFINS NOT IN ('#39'07'#39','#39'08'#39','#39'09'#39','#39'49'#39','#39'61'#39','#39'65'#39','#39'70'#39','#39'71'#39 +
        ','#39'72'#39','#39'73'#39','#39'74'#39')'
      ')'
      'GROUP BY'
      '  COD_CONT,'
      '  ALIQ_COFINS'
      ''
      ''
      '/*'
      'SELECT'
      '  COD_CONT,'
      '  ALIQ_COFINS,'
      '  SUM(VL_CONT_APUR) AS VL_CONT_APUR,'
      '  SUM(VL_CONT_PER) AS VL_CONT_PER,'
      '  SUM(VL_REC_BRT) AS VL_REC_BRT,'
      '  SUM(VL_BC_CONT) AS VL_BC_CONT'
      'FROM('
      '-- SQL NOTAS'
      'SELECT'
      '  COD_CONT,'
      '  (SELECT PERC_COFINS FROM TB_PARAM_SISTEMA) AS ALIQ_COFINS,'
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      SUM(VL_CONT_PER)'
      '  END AS VL_CONT_APUR,'
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      SUM(VL_CONT_PER)'
      '  END AS VL_CONT_PER,'
      '  SUM(VL_REC_BRT) AS VL_REC_BRT,'
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      SUM(VAL_BC)'
      '  END AS VL_BC_CONT'
      'FROM('
      '  SELECT    '
      '    DECODE(PS.PERC_COFINS,7.6,'#39'01'#39','#39'02'#39') COD_CONT,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    CASE'
      
        '      WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') TH' +
        'EN'
      '        SUM(I.VAL_TOTAL)'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    '
      '    CASE'
      
        '        WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') ' +
        'THEN    '
      '            DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '              DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '              (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.' +
        'VAL_DESPESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '              SUM(I.VAL_BC_DI))'
      '        ELSE '
      '            0      '
      '    END AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_CONT_PER,'
      '    I.COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY    '
      '    DECODE(PS.PERC_COFINS,7.6,'#39'01'#39','#39'02'#39'),'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),    '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    I.COD_CST_COFINS'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO        '
      '    DECODE(PS.PERC_COFINS,7.6,'#39'01'#39','#39'02'#39') COD_CONT,'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    CASE'
      
        '      WHEN C.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') TH' +
        'EN'
      '        C.VAL_FRETE+VAL_FRETE_PESO'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN C.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') ' +
        'THEN'
      '            DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '          DECODE(O.PERC_BASE_COFINS,0,0,'
      '          (C.VAL_FRETE*O.PERC_BASE_COFINS/100)),'
      '          (DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '          (C.VAL_FRETE*O.PERC_BASE_COFINS/100)) * C.PERC_DESCONT' +
        'O_FRETE / 100))'
      '            ELSE'
      '                0'
      '    END AS VAL_BC,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO, '#39'S'#39', C.VAL_COFINS, 0),0) AS ' +
        'VL_TOT_CONT_NC_PER,'
      '    C.COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
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
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      '    DECODE(PS.PERC_COFINS,7.6,'#39'01'#39','#39'02'#39') AS COD_CONT,'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    C.VAL_FRETE AS VL_REC_BRT,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100) + NVL(C.VAL_PEDAGIO,0' +
        ')) AS VAL_BC,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_COFINS,0),0) AS VL_' +
        'TOT_CONT_NC_PER,'
      '    NULL AS COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
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
      '    C.COD_FILIAL IN :FILIAIS'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --N'
      '    DECODE(PS.PERC_COFINS,7.6,'#39'01'#39','#39'02'#39') AS COD_CONT,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    CASE'
      
        '      WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') TH' +
        'EN'
      '        SUM(I.VAL_TOTAL)'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') ' +
        'THEN'
      '            DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '            SUM((I.VAL_TOTAL*O.PERC_BASE_COFINS/100)) + SUM(I.VA' +
        'L_DESPESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB))'
      '        ELSE'
      '            0'
      '    END AS VAL_BC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_TOT_CONT_NC_PER,'
      '    I.COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    DECODE(PS.PERC_COFINS,7.6,'#39'01'#39','#39'02'#39'),'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    I.COD_CST_COFINS'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --I    '
      '    DECODE(PS.PERC_COFINS,7.6,'#39'01'#39','#39'02'#39') AS COD_CONT,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      '      N.VAL_FRETE) AS VL_REC_BRT,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_COFINS/100)) AS VL_BC,'
      
        '    NVL(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PERC_CO' +
        'FINS / 100),0),0) AS VL_TOT_CONT_NC_PER,'
      '    NULL AS COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO_CF = S' +
        'M.COD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '      '
      '  UNION'
      '  '
      '  SELECT    '
      '    DECODE(PS.PERC_COFINS,7.6,'#39'01'#39','#39'02'#39') AS COD_CONT,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    CASE'
      
        '      WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') TH' +
        'EN'
      '        SUM(I.VAL_TOTAL)'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') ' +
        'THEN'
      '            DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '          DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '          (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.VAL_' +
        'DESPESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '          SUM(I.VAL_BC_DI)) '
      '        ELSE'
      '            0'
      '    END AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
      '    I.COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O      '
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      
        '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'SIM'#39')   ' +
        ' '
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    DECODE(PS.PERC_COFINS,7.6,'#39'01'#39','#39'02'#39'),'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),   '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    I.COD_CST_COFINS'
      '          '
      '        '
      '  UNION --NOTAS REGIME CUMULATIVO (LUCRO PRESUMIDO)'
      '    '
      '  SELECT    '
      '    DECODE(PS.PERC_COFINS,3,'#39'51'#39','#39'52'#39') COD_CONT,'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    CASE'
      
        '      WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') TH' +
        'EN'
      '        SUM(I.VAL_TOTAL)'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') ' +
        'THEN'
      '            DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '          DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '          (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.VAL_' +
        'DESPESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '          SUM(I.VAL_BC_DI)) '
      '        ELSE '
      '            0'
      '    END AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_CONT_PER,'
      '    I.COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY       '
      '    DECODE(PS.PERC_COFINS,3,'#39'51'#39','#39'52'#39'),'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),    '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    I.COD_CST_COFINS'
      '    '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO'
      '    DECODE(PS.PERC_COFINS,3,'#39'51'#39','#39'52'#39') COD_CONT,'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    CASE'
      
        '      WHEN C.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') TH' +
        'EN'
      '        C.VAL_FRETE + VAL_FRETE_PESO'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN C.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') ' +
        'THEN'
      '            DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '              DECODE(O.PERC_BASE_COFINS,0,0,'
      '              (C.VAL_FRETE*O.PERC_BASE_COFINS/100)),'
      '              (DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '              (C.VAL_FRETE*O.PERC_BASE_COFINS/100)) * C.PERC_DES' +
        'CONTO_FRETE / 100))'
      '        ELSE'
      '            0'
      '    END AS VAL_BC,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO, '#39'S'#39', C.VAL_COFINS, 0),0) AS ' +
        'VL_TOT_CONT_NC_PER,'
      '    C.COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
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
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO FRETE    '
      '    DECODE(PS.PERC_COFINS,3,'#39'51'#39','#39'52'#39') COD_CONT, '
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    C.VAL_FRETE AS VL_REC_BRT,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100) + NVL(C.VAL_PEDAGIO,0' +
        ')) AS VAL_BC,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_COFINS,0),0) AS VL_' +
        'TOT_CONT_NC_PER,'
      '    NULL AS COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
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
      '    C.COD_FILIAL IN :FILIAIS'
      '    '
      '  UNION'
      '  '
      '  SELECT --N    '
      '    DECODE(PS.PERC_COFINS,3,'#39'51'#39','#39'52'#39') COD_CONT, '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    CASE'
      
        '      WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') TH' +
        'EN'
      '        SUM(I.VAL_TOTAL)'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') ' +
        'THEN'
      '            DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '                SUM((I.VAL_TOTAL*O.PERC_BASE_COFINS/100)) + SUM(' +
        'I.VAL_DESPESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB))'
      '        ELSE'
      '            0'
      '    END AS VAL_BC,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_TOT_CONT_NC_PER,'
      '    I.COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      ' GROUP BY'
      '    DECODE(PS.PERC_COFINS,3,'#39'51'#39','#39'52'#39'),'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    I.COD_CST_COFINS'
      '    '
      '  UNION'
      '  '
      '  SELECT --I    '
      '    DECODE(PS.PERC_COFINS,3,'#39'51'#39','#39'52'#39') COD_CONT, '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,    '
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      '      N.VAL_FRETE) AS VL_REC_BRT,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_COFINS/100)) AS VL_BC,'
      
        '    NVL(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PERC_CO' +
        'FINS / 100),0),0) AS VL_TOT_CONT_NC_PER,'
      '    NULL AS COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO_CF = S' +
        'M.COD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '      '
      '  UNION'
      '  '
      '  SELECT    '
      '    DECODE(PS.PERC_COFINS,3,'#39'51'#39','#39'52'#39') COD_CONT, '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    CASE'
      
        '      WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') TH' +
        'EN'
      '        SUM(I.VAL_TOTAL)'
      '      ELSE'
      '       0 '
      '    END AS VL_REC_BRT,'
      '    CASE'
      
        '        WHEN I.COD_CST_COFINS IN ('#39'01'#39', '#39'02'#39', '#39'03'#39', '#39'04'#39', '#39'05'#39') ' +
        'THEN'
      '            DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '              DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '              (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.' +
        'VAL_DESPESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '              SUM(I.VAL_BC_DI)) '
      '        ELSE'
      '            0'
      '    END AS VAL_BC,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
      '    I.COD_CST_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'S'#39')'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    DECODE(PS.PERC_COFINS,3,'#39'51'#39','#39'52'#39'),'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),   '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    I.COD_CST_COFINS'
      ')'
      'GROUP BY '
      '  COD_CONT,'
      '  COD_CST_COFINS,'
      '  COD_SERIE_MODELO,'
      '  IND_PIS_COFINS_RETIDO'
      'HAVING'
      
        '  COD_CST_COFINS NOT IN ('#39'07'#39','#39'08'#39','#39'09'#39','#39'49'#39','#39'61'#39','#39'65'#39','#39'70'#39','#39'71'#39 +
        ','#39'72'#39','#39'73'#39','#39'74'#39')'
      ') GROUP BY'
      '  COD_CONT,'
      '  ALIQ_COFINS'
      '*/')
    Variables.Data = {
      0300000003000000080000003A46494C4941495301000000230000002853454C
      45435420434F445F46494C49414C2046524F4D2054425F46494C49414C290000
      000000070000003A44545F494E490C0000000000000000000000070000003A44
      545F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000008000000434F445F434F4E540100000000000B000000414C
      49515F434F46494E530100000000000C000000564C5F434F4E545F4150555201
      00000000000B000000564C5F434F4E545F5045520100000000000A000000564C
      5F5245435F4252540100000000000A000000564C5F42435F434F4E5401000000
      0000}
    Session = DMOracle.DBCemapa
    Left = 376
    Top = 88
    object QReg610COD_CONT: TStringField
      FieldName = 'COD_CONT'
      Size = 2
    end
    object QReg610ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object QReg610VL_CONT_APUR: TFloatField
      FieldName = 'VL_CONT_APUR'
    end
    object QReg610VL_CONT_PER: TFloatField
      FieldName = 'VL_CONT_PER'
    end
    object QReg610VL_REC_BRT: TFloatField
      FieldName = 'VL_REC_BRT'
    end
    object QReg610VL_BC_CONT: TFloatField
      FieldName = 'VL_BC_CONT'
    end
  end
  object QReg505_old: TOracleDataSet1
    SQL.Strings = (
      '-- SQL NOTAS'
      'SELECT'
      '  COD_BC_CREDITO_PISCOFINS AS NAT_BC_CRED,'
      '  CST_COFINS,'
      '  SUM(VAL_BC) AS VL_BC_COFINS_TOT,'
      '  SUM(VL_BC_COFINS_CUM) AS VL_BC_COFINS_CUM,'
      '  SUM(VL_BC_COFINS_NC) AS VL_BC_COFINS_NC,'
      '  SUM(VL_BC_COFINS) AS VL_BC_COFINS'
      'FROM('
      '  SELECT'
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      
        '    NVL(I.COD_CST_COFINS, NVL(O.COD_CST_COFINS, NVL(P.COD_CST_CO' +
        'FINS,'#39'07'#39'))) AS CST_COFINS,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),'
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    0 AS VL_BC_COFINS_CUM,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),'
      '      SUM(I.VAL_BC_DI)) AS VL_BC_COFINS_NC,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),'
      '      SUM(I.VAL_BC_DI)) AS VL_BC_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '        AND P.IND_PINTURA = '#39'SIM'#39' AND P.IND_ESTOFARIA = '#39'SIM'#39
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    NOT (I.COD_CST_COFINS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY'
      '    O.COD_BC_CREDITO_PISCOFINS,'
      
        '    NVL(I.COD_CST_COFINS, NVL(O.COD_CST_COFINS, NVL(P.COD_CST_CO' +
        'FINS,'#39'07'#39'))),'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO        '
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      
        '    NVL(C.COD_CST_COFINS, NVL(O.COD_CST_COFINS, '#39'07'#39')) AS CST_CO' +
        'FINS,'
      '    DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100)),'
      '      (DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100)) * C.PERC_DESCONTO_FR' +
        'ETE / 100)) AS VAL_BC,'
      '    0 AS VL_BC_COFINS_CUM,'
      '    DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100)),'
      '      (DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100)) * C.PERC_DESCONTO_FR' +
        'ETE / 100)) AS VL_BC_COFINS_NC,'
      '    DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100)),'
      '      (DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100)) * C.PERC_DESCONTO_FR' +
        'ETE / 100)) AS VL_BC_COFINS'
      '  FROM'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'E'#39
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = C.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN '
      '    AND'
      '    NOT (C.COD_CST_COFINS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      ''
      '  '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      '    NVL(O.COD_CST_COFINS, '#39'07'#39') AS CST_COFINS,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100) + NVL(C.VAL_PEDAGIO,0' +
        ')) AS VAL_BC,'
      '    0 AS VL_BC_COFINS_CUM,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100) + NVL(C.VAL_PEDAGIO,0' +
        ')) AS VL_BC_COFINS_NC,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100) + NVL(C.VAL_PEDAGIO,0' +
        ')) AS VL_BC_COFINS'
      '  FROM'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'E'#39
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    NOT (O.COD_CST_COFINS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --N   '
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      
        '    NVL(I.COD_CST_COFINS, NVL(O.COD_CST_COFINS, NVL(P.COD_CST_CO' +
        'FINS,'#39'07'#39'))) AS CST_COFINS,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      SUM((I.VAL_TOTAL*O.PERC_BASE_COFINS/100)) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) AS VAL_BC,'
      '    0 AS VL_BC_COFINS_CUM,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      SUM((I.VAL_TOTAL*O.PERC_BASE_COFINS/100)) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) AS VL_BC_COFINS_NC,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      SUM((I.VAL_TOTAL*O.PERC_BASE_COFINS/100)) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) AS VL_BC_COFINS'
      '  FROM'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '    AND'
      '    NOT (I.COD_CST_COFINS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY'
      '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39'),'
      
        '    NVL(I.COD_CST_COFINS, NVL(O.COD_CST_COFINS, NVL(P.COD_CST_CO' +
        'FINS,'#39'07'#39'))),'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --I    '
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      '    NVL(O.COD_CST_COFINS,'#39'07'#39') AS CST_COFINS,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_COFINS/100)) AS VL_BC,'
      '    0 AS VL_BC_COFINS_CUM,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_COFINS/100)) AS VL_BC_COFINS_NC,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_COFINS/100)) AS VL_BC_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO_CF = S' +
        'M.COD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    NOT (O.COD_CST_COFINS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  '
      '  UNION'
      '  '
      '  SELECT    '
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      
        '    NVL(I.COD_CST_COFINS, NVL(O.COD_CST_COFINS, NVL(P.COD_CST_CO' +
        'FINS,'#39'07'#39'))) AS CST_COFINS,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    0 AS VL_BC_COFINS_CUM,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VL_BC_COFINS_NC,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VL_BC_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '        AND P.IND_PINTURA = '#39'SIM'#39' AND P.IND_ESTOFARIA = '#39'SIM'#39
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      
        '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'SIM'#39')   ' +
        ' '
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    NOT (I.COD_CST_COFINS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY'
      '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39'),'
      
        '    NVL(I.COD_CST_COFINS, NVL(O.COD_CST_COFINS, NVL(P.COD_CST_CO' +
        'FINS,'#39'07'#39'))),'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '        '
      '    UNION --NOTAS REGIME CUMULATIVO (LUCRO PRESUMIDO)'
      '    '
      '  SELECT    '
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      
        '    NVL(I.COD_CST_COFINS, NVL(O.COD_CST_COFINS, NVL(P.COD_CST_CO' +
        'FINS,'#39'07'#39'))) AS CST_COFINS,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),'
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),'
      '      SUM(I.VAL_BC_DI)) AS VL_BC_COFINS_CUM,'
      '    0 AS VL_BC_COFINS_NC,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),'
      '      SUM(I.VAL_BC_DI)) AS VL_BC_COFINS  '
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '        AND P.IND_PINTURA = '#39'SIM'#39' AND P.IND_ESTOFARIA = '#39'SIM'#39
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    NOT (I.COD_CST_COFINS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY    '
      '    O.COD_BC_CREDITO_PISCOFINS,'
      
        '    NVL(I.COD_CST_COFINS, NVL(O.COD_CST_COFINS, NVL(P.COD_CST_CO' +
        'FINS,'#39'07'#39'))),'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO'
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      
        '    NVL(C.COD_CST_COFINS, NVL(O.COD_CST_COFINS, '#39'07'#39')) AS CST_CO' +
        'FINS,'
      '    DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100)),'
      '      (DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100)) * C.PERC_DESCONTO_FR' +
        'ETE / 100)) AS VAL_BC,'
      '    DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100)),'
      '      (DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100)) * C.PERC_DESCONTO_FR' +
        'ETE / 100)) AS VL_BC_COFINS_CUM,'
      '    0 AS VL_BC_COFINS_NC,'
      '    DECODE(NVL(C.PERC_DESCONTO_FRETE,0), 0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100)),'
      '      (DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100)) * C.PERC_DESCONTO_FR' +
        'ETE / 100)) AS VL_BC_COFINS '
      '  FROM'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'E'#39
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = C.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '    AND'
      '    NOT (C.COD_CST_COFINS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO FRETE    '
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      '    NVL(O.COD_CST_COFINS, '#39'07'#39') AS CST_COFINS,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100) + NVL(C.VAL_PEDAGIO,0' +
        ')) AS VAL_BC,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100) + NVL(C.VAL_PEDAGIO,0' +
        ')) AS VL_BC_COFINS_CUM,'
      '    0 AS VL_BC_COFINS_NC,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (C.VAL_FRETE*O.PERC_BASE_COFINS/100) + NVL(C.VAL_PEDAGIO,0' +
        ')) AS VL_BC_COFINS'
      '  FROM'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'E'#39
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON C.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    NOT (O.COD_CST_COFINS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '    '
      '  UNION'
      '  '
      '  SELECT --N    '
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      
        '    NVL(I.COD_CST_COFINS, NVL(O.COD_CST_COFINS, NVL(P.COD_CST_CO' +
        'FINS,'#39'07'#39'))) AS CST_COFINS,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      SUM((I.VAL_TOTAL*O.PERC_BASE_COFINS/100)) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) AS VAL_BC,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      SUM((I.VAL_TOTAL*O.PERC_BASE_COFINS/100)) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) AS VL_BC_COFINS_CUM,'
      '    0 AS VL_BC_COFINS_NC,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      SUM((I.VAL_TOTAL*O.PERC_BASE_COFINS/100)) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) AS VL_BC_COFINS'
      '  FROM'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '    AND'
      '    NOT (I.COD_CST_COFINS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY'
      '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39'),'
      
        '    NVL(I.COD_CST_COFINS, NVL(O.COD_CST_COFINS, NVL(P.COD_CST_CO' +
        'FINS,'#39'07'#39'))),'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    '
      '  UNION'
      '  '
      '  SELECT --I    '
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      '    NVL(O.COD_CST_COFINS,'#39'07'#39') AS CST_COFINS,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_COFINS/100)) AS VL_BC,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_COFINS/100)) AS VL_BC_COFINS_CUM,'
      '    0 AS VL_BC_COFINS_NC,'
      '    DECODE(O.PERC_BASE_COFINS,0,0,'
      '      (N.VAL_FRETE*O.PERC_BASE_COFINS/100)) AS VL_BC_COFINS'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO_CF = S' +
        'M.COD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    NOT (O.COD_CST_COFINS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '    '
      '  UNION'
      '  '
      '  SELECT    '
      
        '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39') AS COD_BC_CREDITO_PISCO' +
        'FINS,'
      
        '    NVL(I.COD_CST_COFINS, NVL(O.COD_CST_COFINS, NVL(P.COD_CST_CO' +
        'FINS,'#39'07'#39'))) AS CST_COFINS,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VAL_BC,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VL_BC_COFINS_CUM,'
      '    0 AS VL_BC_COFINS_NC,'
      '    DECODE(SUM(NVL(I.VAL_BC_DI,0)),0,'
      '      DECODE(O.PERC_BASE_COFINS,0,0,'
      
        '      (SUM(I.VAL_TOTAL)*O.PERC_BASE_COFINS/100) + SUM(I.VAL_DESP' +
        'ESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)),    '
      '      SUM(I.VAL_BC_DI)) AS VL_BC_COFINS '
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      '        AND P.IND_PINTURA = '#39'SIM'#39' AND P.IND_ESTOFARIA = '#39'SIM'#39
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 3'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'E'#39
      '    AND'
      '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'S'#39')'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    NOT (I.COD_CST_COFINS BETWEEN '#39'70'#39' AND '#39'74'#39')'
      '  GROUP BY'
      '    NVL(O.COD_BC_CREDITO_PISCOFINS,'#39'01'#39'),'
      
        '    NVL(I.COD_CST_COFINS, NVL(O.COD_CST_COFINS, NVL(P.COD_CST_CO' +
        'FINS,'#39'07'#39'))),'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      ')'
      'GROUP BY'
      '  COD_BC_CREDITO_PISCOFINS,'
      '  CST_COFINS')
    Variables.Data = {
      0300000003000000080000003A46494C4941495301000000230000002853454C
      45435420434F445F46494C49414C2046524F4D2054425F46494C49414C290000
      000000070000003A44545F494E490C0000000000000000000000070000003A44
      545F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000B0000004E41545F42435F435245440100000000000A0000
      004353545F434F46494E5301000000000010000000564C5F42435F434F46494E
      535F544F5401000000000010000000564C5F42435F434F46494E535F43554D01
      00000000000F000000564C5F42435F434F46494E535F4E430100000000000C00
      0000564C5F42435F434F46494E53010000000000}
    Session = DMOracle.DBCemapa
    Left = 312
    Top = 88
    object QReg505_oldNAT_BC_CRED: TStringField
      FieldName = 'NAT_BC_CRED'
      Size = 2
    end
    object QReg505_oldCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object QReg505_oldVL_BC_COFINS_TOT: TFloatField
      FieldName = 'VL_BC_COFINS_TOT'
    end
    object QReg505_oldVL_BC_COFINS_CUM: TFloatField
      FieldName = 'VL_BC_COFINS_CUM'
    end
    object QReg505_oldVL_BC_COFINS_NC: TFloatField
      FieldName = 'VL_BC_COFINS_NC'
    end
    object QReg505_oldVL_BC_COFINS: TFloatField
      FieldName = 'VL_BC_COFINS'
    end
  end
  object QReg205: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_REC,'
      '  NUM_CAMPO,'
      '  SUM(VL_DEBITO) AS VL_DEBITO'
      'FROM ('
      '-- SQL NOTAS'
      'SELECT'
      '  DCTF.COD_RECEITA AS COD_REC,'
      '  NUM_CAMPO,'
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      DECODE(COD_INC_TRIB,1,'
      '        ABS(SUM(VL_TOT_CONT_NC_PER)-SUM(VL_TOT_CRED_DESC)),'
      '        ABS(SUM(VL_TOT_CONT_NC_PER))'
      '      ) '
      '  END AS VL_DEBITO'
      'FROM'
      '  TB_PISCOFINS_DCTF DCTF,'
      '('
      '  SELECT'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_PIS_DCTF,'
      '    '#39'08'#39' AS NUM_CAMPO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
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
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_PIS_DCTF,'
      '    '#39'08'#39','
      '    DECODE(PS.PERC_PIS,1.65,'#39'01'#39','#39'02'#39'),'
      '    N.IND_ENTRADA_SAIDA,'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),    '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    F.COD_INC_TRIB'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO  '
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    F.COD_PIS_DCTF,'
      '    '#39'08'#39' AS NUM_CAMPO,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO, '#39'S'#39', C.VAL_PIS, 0),0) AS VL_' +
        'TOT_CONT_NC_PER,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39', C.VAL_PIS, 0),0) AS VL_' +
        'TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
        '      INNER JOIN TB_SERIE_MODELO SM ON C.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = C.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO CAD ON C.COD_CADASTRO = CAD.COD_CAD' +
        'ASTRO'
      #9' OR C.COD_CADASTRO_TOMADOR = CAD.COD_CADASTRO'
      '  WHERE'
      '    C.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    F.COD_PIS_DCTF,'
      '    '#39'08'#39' AS NUM_CAMPO,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_PIS,0),0) AS VL_TOT' +
        '_CONT_NC_PER,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO,'#39'E'#39',C.VAL_PIS,0),0) AS VL_TOT' +
        '_CRED_DESC,'
      '    F.COD_INC_TRIB'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
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
      '    C.COD_FILIAL IN :FILIAIS'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --N'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_PIS_DCTF,'
      '    '#39'08'#39' AS NUM_CAMPO,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_PIS,0)),0) AS V' +
        'L_TOT_CONT_NC_PER,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',I.VAL_PIS,0)),0) AS V' +
        'L_TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
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
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_PIS_DCTF,'
      '    '#39'08'#39',    '
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    F.COD_INC_TRIB'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --I    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_PIS_DCTF,'
      '    '#39'08'#39' AS NUM_CAMPO,'
      
        '    NVL(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PERC_PI' +
        'S / 100),0),0) AS VL_TOT_CONT_NC_PER,'
      
        '    NVL(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',(N.VAL_FRETE * PS.PERC_PI' +
        'S / 100),0),0) AS VL_TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
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
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  '
      '  UNION'
      '  '
      '  SELECT    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_PIS_DCTF,'
      '    '#39'08'#39' AS NUM_CAMPO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
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
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      
        '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'SIM'#39')   ' +
        ' '
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_PIS_DCTF,'
      '    '#39'08'#39','
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),   '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    F.COD_INC_TRIB'
      '          '
      '        '
      '  UNION --NOTAS REGIME CUMULATIVO (LUCRO PRESUMIDO)'
      '    '
      '  SELECT    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_PIS_DCTF,'
      '    '#39'12'#39' AS NUM_CAMPO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
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
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY  '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_PIS_DCTF,'
      '    '#39'12'#39',      '
      '    N.IND_ENTRADA_SAIDA,'
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),    '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    F.COD_INC_TRIB'
      '    '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    F.COD_PIS_DCTF,'
      '    '#39'12'#39' AS NUM_CAMPO,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO, '#39'S'#39', C.VAL_PIS, 0),0) AS VL_' +
        'TOT_CONT_NC_PER,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39', C.VAL_PIS, 0),0) AS VL_' +
        'TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
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
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '          '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    F.COD_PIS_DCTF,'
      '    '#39'12'#39' AS NUM_CAMPO,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_PIS,0),0) AS VL_TOT' +
        '_CONT_NC_PER,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO,'#39'E'#39',C.VAL_PIS,0),0) AS VL_TOT' +
        '_CRED_DESC,'
      '    F.COD_INC_TRIB'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_PIS, -1) >= 0 AND NVL(O.PERC_BASE_CO' +
        'FINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
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
      '    C.COD_FILIAL IN :FILIAIS'
      '    '
      '  UNION'
      '  '
      '  SELECT --N    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_PIS_DCTF,'
      '    '#39'12'#39' AS NUM_CAMPO,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_PIS,0)),0) AS V' +
        'L_TOT_CONT_NC_PER,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',I.VAL_PIS,0)),0) AS V' +
        'L_TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
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
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      ' GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_PIS_DCTF,'
      '    '#39'12'#39','
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    F.COD_INC_TRIB'
      '    '
      '  UNION'
      '  '
      '  SELECT --I      '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_PIS_DCTF,'
      '    '#39'12'#39' AS NUM_CAMPO,'
      
        '    NVL(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PERC_PI' +
        'S / 100),0),0) AS VL_TOT_CONT_NC_PER,'
      
        '    NVL(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',(N.VAL_FRETE * PS.PERC_PI' +
        'S / 100),0),0) AS VL_TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
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
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '      '
      '  UNION'
      '  '
      '  SELECT    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_PIS_DCTF,'
      '    '#39'12'#39' AS NUM_CAMPO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_PIS),'
      '          0),0) AS VL_TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
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
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'S'#39')'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_PIS_DCTF,'
      '    '#39'12'#39','
      '    O.PERC_BASE_PIS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),   '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    F.COD_INC_TRIB'
      ') t1'
      'WHERE'
      '  t1.COD_PIS_DCTF = DCTF.COD_PISCOFINS_DCTF'
      'GROUP BY '
      '  IND_PIS_COFINS_RETIDO,'
      '  COD_SERIE_MODELO,'
      '  DCTF.COD_RECEITA,'
      '  NUM_CAMPO,'
      '  COD_INC_TRIB'
      ')'
      'GROUP BY'
      '  COD_REC,'
      '  NUM_CAMPO')
    Variables.Data = {
      0300000003000000080000003A46494C4941495301000000230000002853454C
      45435420434F445F46494C49414C2046524F4D2054425F46494C49414C290000
      000000070000003A44545F494E490C0000000000000000000000070000003A44
      545F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000003000000090000004E554D5F43414D504F0100000000000900000056
      4C5F44454249544F01000000000007000000434F445F524543010000000000}
    Session = DMOracle.DBCemapa
    Left = 248
    Top = 152
    object QReg205NUM_CAMPO: TStringField
      FieldName = 'NUM_CAMPO'
      Size = 2
    end
    object QReg205COD_REC: TStringField
      FieldName = 'COD_REC'
      Size = 6
    end
    object QReg205VL_DEBITO: TFloatField
      FieldName = 'VL_DEBITO'
    end
  end
  object QReg605: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_REC,'
      '  NUM_CAMPO,'
      '  SUM(VL_DEBITO) AS VL_DEBITO'
      'FROM ('
      '-- SQL NOTAS'
      'SELECT'
      '  DCTF.COD_RECEITA AS COD_REC,'
      '  NUM_CAMPO,'
      '  CASE'
      
        '    WHEN ((IND_PIS_COFINS_RETIDO = '#39'SIM'#39') AND (COD_SERIE_MODELO ' +
        '= '#39'98'#39')) THEN'
      '      0'
      '    ELSE'
      '      DECODE(COD_INC_TRIB,1,'
      '        ABS(SUM(VL_TOT_CONT_NC_PER)-SUM(VL_TOT_CRED_DESC)),'
      '        ABS(SUM(VL_TOT_CONT_NC_PER)))'
      '  END AS VL_DEBITO'
      'FROM'
      '  TB_PISCOFINS_DCTF DCTF,'
      '('
      '  SELECT'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_COFINS_DCTF,'
      '    '#39'08'#39' AS NUM_CAMPO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_COFINS_DCTF,'
      '    '#39'08'#39','
      '    DECODE(PS.PERC_COFINS,1.65,'#39'01'#39','#39'02'#39'),'
      '    N.IND_ENTRADA_SAIDA,'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),    '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    F.COD_INC_TRIB'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    F.COD_COFINS_DCTF,'
      '    '#39'08'#39' AS NUM_CAMPO,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO, '#39'S'#39', C.VAL_COFINS, 0),0) AS ' +
        'VL_TOT_CONT_NC_PER,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39', C.VAL_COFINS, 0),0) AS ' +
        'VL_TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
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
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  '
      '  UNION ALL'
      '  '
      '  SELECT --CONHECIMENTO FRETE'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    F.COD_COFINS_DCTF,'
      '    '#39'08'#39' AS NUM_CAMPO,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_COFINS,0),0) AS VL_' +
        'TOT_CONT_NC_PER,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO,'#39'E'#39',C.VAL_COFINS,0),0) AS VL_' +
        'TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
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
      '    C.COD_FILIAL IN :FILIAIS'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --N'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_COFINS_DCTF,'
      '    '#39'08'#39' AS NUM_CAMPO,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_TOT_CONT_NC_PER,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON C.COD_CADASTRO = N.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_COFINS_DCTF,'
      '    '#39'08'#39',    '
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    F.COD_INC_TRIB'
      '    '
      '  UNION ALL'
      '  '
      '  SELECT --I    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_COFINS_DCTF,'
      '    '#39'08'#39' AS NUM_CAMPO,'
      
        '    NVL(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PERC_CO' +
        'FINS / 100),0),0) AS VL_TOT_CONT_NC_PER,'
      
        '    NVL(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',(N.VAL_FRETE * PS.PERC_CO' +
        'FINS / 100),0),0) AS VL_TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO_CF = S' +
        'M.COD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON C.COD_CADASTRO = N.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '      '
      '  UNION'
      '  '
      '  SELECT    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_COFINS_DCTF,'
      '    '#39'08'#39' AS NUM_CAMPO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 1'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      
        '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'SIM'#39')   ' +
        ' '
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_COFINS_DCTF,'
      '    '#39'08'#39','
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),   '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    F.COD_INC_TRIB'
      '          '
      '        '
      '  UNION --NOTAS REGIME CUMULATIVO (LUCRO PRESUMIDO)'
      '    '
      '  SELECT    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_COFINS_DCTF,'
      '    '#39'12'#39' AS NUM_CAMPO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON C.COD_CADASTRO = N.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '    (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY  '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_COFINS_DCTF,'
      '    '#39'12'#39',      '
      '    N.IND_ENTRADA_SAIDA,'
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),    '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    F.COD_INC_TRIB'
      '    '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO'
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    F.COD_COFINS_DCTF,'
      '    '#39'12'#39' AS NUM_CAMPO,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO, '#39'S'#39', C.VAL_COFINS, 0),0) AS ' +
        'VL_TOT_CONT_NC_PER,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO, '#39'E'#39', C.VAL_COFINS, 0),0) AS ' +
        'VL_TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
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
      '    C.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    C.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '  '
      '  UNION'
      '  '
      '  SELECT --CONHECIMENTO FRETE    '
      '    CAD.IND_PIS_COFINS_RETIDO,'
      '    C.COD_SERIE_MODELO,'
      '    F.COD_COFINS_DCTF,'
      '    '#39'12'#39' AS NUM_CAMPO,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO,'#39'S'#39',C.VAL_COFINS,0),0) AS VL_' +
        'TOT_CONT_NC_PER,'
      
        '    NVL(DECODE(O.IND_TIPO_OPERACAO,'#39'E'#39',C.VAL_COFINS,0),0) AS VL_' +
        'TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_CONHECIMENTO_FRETE C'
      
        '      INNER JOIN TB_OPERACAO O ON C.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      '        AND O.IND_TIPO_OPERACAO = '#39'S'#39
      
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
      '    C.COD_FILIAL IN :FILIAIS'
      '    '
      '  UNION'
      '  '
      '  SELECT --N    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_COFINS_DCTF,'
      '    '#39'12'#39' AS NUM_CAMPO,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_TOT_CONT_NC_PER,'
      
        '    NVL(SUM(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',I.VAL_CONFINS,0)),0) ' +
        'AS VL_TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN  '
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO, '
      '    F.COD_COFINS_DCTF,'
      '    '#39'12'#39','
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '    F.COD_INC_TRIB'
      '    '
      '  UNION'
      '  '
      '  SELECT --I    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_COFINS_DCTF,'
      '    '#39'12'#39' AS NUM_CAMPO,'
      
        '    NVL(DECODE(N.IND_ENTRADA_SAIDA,'#39'S'#39',(N.VAL_FRETE * PS.PERC_CO' +
        'FINS / 100),0),0) AS VL_TOT_CONT_NC_PER,'
      
        '    NVL(DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',(N.VAL_FRETE * PS.PERC_CO' +
        'FINS / 100),0),0) AS VL_TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPER' +
        'ACAO'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0'
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO_CF = S' +
        'M.COD_SERIE_MODELO'
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
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
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '      '
      '  UNION'
      '  '
      '  SELECT    '
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_COFINS_DCTF,'
      '    '#39'12'#39' AS NUM_CAMPO,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'S'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CONT_NC_PER,'
      '    NVL(DECODE('
      '      DECODE(PS.COD_EMPRESA, '#39'GRASEL'#39','
      '        DECODE(O.IND_SERVICO,'#39'S'#39','
      '        '#39'E'#39', N.IND_ENTRADA_SAIDA),'
      '        N.IND_ENTRADA_SAIDA),'
      '          '#39'E'#39','
      '          SUM(I.VAL_CONFINS),'
      '          0),0) AS VL_TOT_CRED_DESC,'
      '    F.COD_INC_TRIB'
      '  FROM'
      '    TB_PARAM_SISTEMA PS,'
      '    TB_NOTA_CAB N'
      
        '      INNER JOIN TB_NOTA_ITEM I ON N.COD_NOTA_CAB = I.COD_NOTA_C' +
        'AB'
      
        '      INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACA' +
        'O'
      
        '        AND NVL(O.PERC_BASE_COFINS, -1) >= 0 AND NVL(O.PERC_BASE' +
        '_COFINS, -1) >= 0 '
      
        '      INNER JOIN TB_SERIE_MODELO SM ON N.COD_SERIE_MODELO = SM.C' +
        'OD_SERIE_MODELO'
      
        '      INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  ' +
        '      '
      
        '      INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL AND ' +
        'F.COD_INC_TRIB = 2'
      
        '      INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTR' +
        'O'
      '  WHERE'
      '    N.IND_ENTRADA_SAIDA = '#39'S'#39
      '    AND'
      '    (O.IND_LIVRO_FISCAL = '#39'N'#39' AND O.IND_CUPOM_FISCAL = '#39'S'#39')'
      '    AND'
      '    N.IND_SITUACAO = '#39'2'#39
      '    AND'
      '    N.COD_FILIAL IN :FILIAIS'
      '    AND'
      '    N.DT_RECEBIMENTO BETWEEN :DT_INI AND :DT_FIN'
      '    AND'
      '    N.COD_SERIE_MODELO IN ('#39'1'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39', '#39'65'#39', '#39'02'#39','
      '      '#39'2D'#39', '#39'2E'#39', '#39'59'#39', '#39'06'#39', '#39'98'#39')'
      '  GROUP BY'
      '    C.IND_PIS_COFINS_RETIDO,'
      '    N.COD_SERIE_MODELO,'
      '    F.COD_COFINS_DCTF,'
      '    '#39'12'#39','
      '    O.PERC_BASE_COFINS,'
      '    PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),   '
      '    PS.COD_EMPRESA,'
      '    O.IND_SERVICO,'
      '    N.IND_ENTRADA_SAIDA,'
      '    F.COD_INC_TRIB'
      ') t1'
      'WHERE'
      '  t1.COD_COFINS_DCTF = DCTF.COD_PISCOFINS_DCTF'
      'GROUP BY '
      '  DCTF.COD_RECEITA,'
      '  NUM_CAMPO,'
      '  COD_INC_TRIB,'
      '  IND_PIS_COFINS_RETIDO,'
      '  COD_SERIE_MODELO'
      ')'
      'GROUP BY'
      '  COD_REC,'
      '  NUM_CAMPO')
    Variables.Data = {
      0300000003000000080000003A46494C4941495301000000230000002853454C
      45435420434F445F46494C49414C2046524F4D2054425F46494C49414C290000
      000000070000003A44545F494E490C0000000000000000000000070000003A44
      545F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000007000000434F445F524543010000000000090000004E554D
      5F43414D504F01000000000009000000564C5F44454249544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 376
    Top = 152
    object QReg605COD_REC: TStringField
      FieldName = 'COD_REC'
      Size = 6
    end
    object QReg605NUM_CAMPO: TStringField
      FieldName = 'NUM_CAMPO'
      Size = 2
    end
    object QReg605VL_DEBITO: TFloatField
      FieldName = 'VL_DEBITO'
    end
  end
  object QReg200: TOracleDataSet1
    SQL.Strings = (
      'SELECT'#9'DISTINCT'
      #9'DESC_REGISTRO,'
      
        '--'#9'CAST(NVL(COD_NATUREZA_RECEITA,999) AS INTEGER) AS COD_NATUREZ' +
        'A_RECEITA,'
      '--'#9'PERC_ALIQUOTA,'
      #9'CAST(COD_CONT AS NUMBER(2,0)) AS COD_CONT,'
      #9'SUM(VAL_REGISTRO) VAL_REGISTRO,'
      #9'SUM(VAL_BC) AS VAL_BC'
      'FROM'
      #9'TB_SPED_APURACAO'
      'WHERE'
      #9'(:CST IS NULL OR'
      #9'COD_CST_PIS = :CST)'
      #9'AND'
      #9'DESC_REGISTRO = :REGISTRO'
      #9'AND'
      #9'(:COD_CTA IS NULL OR'
      #9'COD_CTA = :COD_CTA)'
      'GROUP BY'
      #9'DESC_REGISTRO,'#9
      '--'#9'CAST(NVL(COD_NATUREZA_RECEITA,999) AS INTEGER),'
      '--'#9'PERC_ALIQUOTA,'
      #9'COD_CONT')
    Variables.Data = {
      0300000003000000090000003A524547495354524F0500000000000000000000
      00040000003A435354050000000000000000000000080000003A434F445F4354
      41050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000D000000444553435F524547495354524F0100000000000C
      00000056414C5F524547495354524F0100000000000600000056414C5F424301
      000000000008000000434F445F434F4E54010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 32
    Top = 160
    object QReg200DESC_REGISTRO: TStringField
      FieldName = 'DESC_REGISTRO'
      Required = True
      Size = 4
    end
    object QReg200VAL_REGISTRO: TFloatField
      FieldName = 'VAL_REGISTRO'
    end
    object QReg200VAL_BC: TFloatField
      FieldName = 'VAL_BC'
    end
    object QReg200COD_CONT: TIntegerField
      FieldName = 'COD_CONT'
    end
  end
  object QReg100: TOracleDataSet1
    SQL.Strings = (
      'SELECT'#9'DISTINCT'
      #9'DESC_REGISTRO,'
      
        #9'CAST(NVL(COD_NATUREZA_RECEITA,999) AS INTEGER) AS COD_NATUREZA_' +
        'RECEITA,'
      #9'PERC_ALIQUOTA,'#9
      #9'SUM(VAL_REGISTRO) VAL_REGISTRO,'
      #9'SUM(VAL_BC) AS VAL_BC'
      'FROM'
      #9'TB_SPED_APURACAO'
      'WHERE'
      #9'(:CST IS NULL OR'
      #9'COD_CST_PIS = :CST)'
      #9'AND'
      #9'DESC_REGISTRO = :REGISTRO'
      #9'AND'
      #9'(:COD_CTA IS NULL OR'
      #9'COD_CTA = :COD_CTA)'
      'GROUP BY'
      #9'DESC_REGISTRO,'#9
      #9'CAST(NVL(COD_NATUREZA_RECEITA,999) AS INTEGER),'
      #9'PERC_ALIQUOTA'
      'ORDER BY '#9
      #9'PERC_ALIQUOTA DESC')
    Variables.Data = {
      0300000003000000090000003A524547495354524F0500000000000000000000
      00040000003A435354050000000000000000000000080000003A434F445F4354
      41050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000D000000444553435F524547495354524F0100000000000C
      00000056414C5F524547495354524F01000000000014000000434F445F4E4154
      5552455A415F524543454954410100000000000D000000504552435F414C4951
      554F54410100000000000600000056414C5F42430100000000000F000000434F
      445F4E41545F42435F43524544010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 104
    Top = 160
    object QReg100DESC_REGISTRO: TStringField
      FieldName = 'DESC_REGISTRO'
      Required = True
      Size = 4
    end
    object QReg100VAL_REGISTRO: TFloatField
      FieldName = 'VAL_REGISTRO'
    end
    object QReg100PERC_ALIQUOTA: TFloatField
      FieldName = 'PERC_ALIQUOTA'
    end
    object QReg100VAL_BC: TFloatField
      FieldName = 'VAL_BC'
    end
    object QReg100COD_NATUREZA_RECEITA: TFloatField
      FieldName = 'COD_NATUREZA_RECEITA'
    end
  end
  object QReg105: TOracleDataSet1
    SQL.Strings = (
      'SELECT'#9'DISTINCT'
      #9'DESC_REGISTRO,'
      #9'NVL(COD_NAT_BC_CRED, 13) AS COD_NAT_BC_CRED,'
      '  '#9'COD_CST_PIS,'
      #9'--DESC_OBS,'
      #9'SUM(VAL_REGISTRO) VAL_REGISTRO,'
      #9'SUM(VAL_BC) AS VAL_BC'
      'FROM'
      #9'TB_SPED_APURACAO'
      'WHERE'
      #9'DESC_REGISTRO = :REGISTRO'
      #9'AND'
      
        #9'(:COD_NATUREZA_RECEITA IS NULL OR :COD_NATUREZA_RECEITA = COD_N' +
        'ATUREZA_RECEITA)'
      #9'AND'
      #9'(:PERC_ALIQUOTA IS NULL OR :PERC_ALIQUOTA = PERC_ALIQUOTA)'
      'GROUP BY'
      #9'DESC_REGISTRO,'
      #9'NVL(COD_NAT_BC_CRED, 13),'
      '  '#9'COD_CST_PIS,'
      #9'PERC_ALIQUOTA'
      #9'--DESC_OBS')
    Variables.Data = {
      0300000003000000090000003A524547495354524F0500000000000000000000
      00150000003A434F445F4E41545552455A415F52454345495441030000000000
      0000000000000E0000003A504552435F414C4951554F54410400000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000D000000444553435F524547495354524F0100000000000B
      000000434F445F4353545F5049530100000000000C00000056414C5F52454749
      5354524F0100000000000600000056414C5F42430100000000000F000000434F
      445F4E41545F42435F4352454401000000000008000000444553435F4F425301
      0000000000}
    Session = DMOracle.DBCemapa
    Left = 104
    Top = 216
    object QReg105DESC_REGISTRO: TStringField
      FieldName = 'DESC_REGISTRO'
      Required = True
      Size = 4
    end
    object QReg105COD_CST_PIS: TStringField
      FieldName = 'COD_CST_PIS'
      Size = 3
    end
    object QReg105VAL_REGISTRO: TFloatField
      FieldName = 'VAL_REGISTRO'
    end
    object QReg105VAL_BC: TFloatField
      FieldName = 'VAL_BC'
    end
    object QReg105COD_NAT_BC_CRED: TFloatField
      FieldName = 'COD_NAT_BC_CRED'
    end
  end
  object QReg500: TOracleDataSet1
    SQL.Strings = (
      'SELECT'#9'DISTINCT'
      #9'DESC_REGISTRO,'
      
        #9'CAST(NVL(COD_NATUREZA_RECEITA,999) AS INTEGER) AS COD_NATUREZA_' +
        'RECEITA,'
      #9'PERC_ALIQUOTA,'#9
      #9'SUM(VAL_REGISTRO) VAL_REGISTRO,'
      #9'SUM(VAL_BC) AS VAL_BC'
      'FROM'
      #9'TB_SPED_APURACAO'
      'WHERE'
      #9'(:CST IS NULL OR'
      #9'COD_CST_COFINS = :CST)'
      #9'AND'
      #9'DESC_REGISTRO = :REGISTRO'
      #9'AND'
      #9'(:COD_CTA IS NULL OR'
      #9'COD_CTA = :COD_CTA)'
      'GROUP BY'
      #9'DESC_REGISTRO,'#9
      #9'CAST(NVL(COD_NATUREZA_RECEITA,999) AS INTEGER),'
      #9'PERC_ALIQUOTA'
      'ORDER BY'
      #9'PERC_ALIQUOTA DESC'
      '')
    Variables.Data = {
      0300000003000000040000003A43535405000000000000000000000009000000
      3A524547495354524F050000000000000000000000080000003A434F445F4354
      41050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000D000000444553435F524547495354524F01000000000014
      000000434F445F4E41545552455A415F524543454954410100000000000D0000
      00504552435F414C4951554F54410100000000000C00000056414C5F52454749
      5354524F0100000000000600000056414C5F4243010000000000}
    Session = DMOracle.DBCemapa
    Left = 176
    Top = 160
    object QReg500DESC_REGISTRO: TStringField
      FieldName = 'DESC_REGISTRO'
      Required = True
      Size = 4
    end
    object QReg500COD_NATUREZA_RECEITA: TFloatField
      FieldName = 'COD_NATUREZA_RECEITA'
    end
    object QReg500PERC_ALIQUOTA: TFloatField
      FieldName = 'PERC_ALIQUOTA'
    end
    object QReg500VAL_REGISTRO: TFloatField
      FieldName = 'VAL_REGISTRO'
    end
    object QReg500VAL_BC: TFloatField
      FieldName = 'VAL_BC'
    end
  end
  object QReg600: TOracleDataSet1
    SQL.Strings = (
      'SELECT'#9'DISTINCT'
      #9'DESC_REGISTRO,'
      
        #9'CAST(NVL(COD_NATUREZA_RECEITA,999) AS INTEGER) AS COD_NATUREZA_' +
        'RECEITA,'
      #9'PERC_ALIQUOTA,'
      #9'CAST(COD_CONT AS NUMBER(2,0)) AS COD_CONT,'
      #9'SUM(VAL_REGISTRO) VAL_REGISTRO,'
      #9'SUM(VAL_BC) AS VAL_BC'
      'FROM'
      #9'TB_SPED_APURACAO'
      'WHERE'
      #9'(:CST IS NULL OR'
      #9'COD_CST_COFINS = :CST)'
      #9'AND'
      #9'DESC_REGISTRO = :REGISTRO'
      #9'AND'
      #9'(:COD_CTA IS NULL OR'
      #9'COD_CTA = :COD_CTA)'
      'GROUP BY'
      #9'DESC_REGISTRO,'#9
      #9'CAST(NVL(COD_NATUREZA_RECEITA,999) AS INTEGER),'
      #9'PERC_ALIQUOTA,'
      #9'COD_CONT'
      '')
    Variables.Data = {
      0300000003000000040000003A43535405000000000000000000000009000000
      3A524547495354524F050000000000000000000000080000003A434F445F4354
      41050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000D000000444553435F524547495354524F01000000000014
      000000434F445F4E41545552455A415F524543454954410100000000000D0000
      00504552435F414C4951554F544101000000000008000000434F445F434F4E54
      0100000000000C00000056414C5F524547495354524F01000000000006000000
      56414C5F4243010000000000}
    Session = DMOracle.DBCemapa
    Left = 32
    Top = 216
    object QReg600DESC_REGISTRO: TStringField
      FieldName = 'DESC_REGISTRO'
      Required = True
      Size = 4
    end
    object QReg600COD_NATUREZA_RECEITA: TFloatField
      FieldName = 'COD_NATUREZA_RECEITA'
    end
    object QReg600PERC_ALIQUOTA: TFloatField
      FieldName = 'PERC_ALIQUOTA'
    end
    object QReg600COD_CONT: TIntegerField
      FieldName = 'COD_CONT'
    end
    object QReg600VAL_REGISTRO: TFloatField
      FieldName = 'VAL_REGISTRO'
    end
    object QReg600VAL_BC: TFloatField
      FieldName = 'VAL_BC'
    end
  end
  object QReg505: TOracleDataSet1
    SQL.Strings = (
      'SELECT'#9'DISTINCT'
      #9'DESC_REGISTRO,'
      #9'NVL(COD_NAT_BC_CRED, 13) AS COD_NAT_BC_CRED,'
      '  '#9'COD_CST_COFINS,'
      #9'--DESC_OBS,'
      #9'SUM(VAL_REGISTRO) VAL_REGISTRO,'
      #9'SUM(VAL_BC) AS VAL_BC'
      'FROM'
      #9'TB_SPED_APURACAO'
      'WHERE'
      #9'DESC_REGISTRO = :REGISTRO'
      #9'AND'
      
        #9'(:COD_NATUREZA_RECEITA IS NULL OR :COD_NATUREZA_RECEITA = COD_N' +
        'ATUREZA_RECEITA)'
      #9'AND'
      #9'(PERC_ALIQUOTA IS NULL OR :PERC_ALIQUOTA = PERC_ALIQUOTA)'
      'GROUP BY'
      #9'DESC_REGISTRO,'
      #9'NVL(COD_NAT_BC_CRED, 13),'
      '  '#9'COD_CST_COFINS,'
      #9'PERC_ALIQUOTA'
      #9'--DESC_OBS'
      '')
    Variables.Data = {
      0300000003000000090000003A524547495354524F0500000000000000000000
      00150000003A434F445F4E41545552455A415F52454345495441050000000000
      0000000000000E0000003A504552435F414C4951554F54410400000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000D000000444553435F524547495354524F0100000000000F
      000000434F445F4E41545F42435F435245440100000000000E000000434F445F
      4353545F434F46494E530100000000000C00000056414C5F524547495354524F
      0100000000000600000056414C5F4243010000000000}
    Session = DMOracle.DBCemapa
    Left = 176
    Top = 216
    object QReg505DESC_REGISTRO: TStringField
      FieldName = 'DESC_REGISTRO'
      Required = True
      Size = 4
    end
    object QReg505COD_NAT_BC_CRED: TFloatField
      FieldName = 'COD_NAT_BC_CRED'
    end
    object QReg505COD_CST_COFINS: TStringField
      FieldName = 'COD_CST_COFINS'
      Size = 3
    end
    object QReg505VAL_REGISTRO: TFloatField
      FieldName = 'VAL_REGISTRO'
    end
    object QReg505VAL_BC: TFloatField
      FieldName = 'VAL_BC'
    end
  end
  object CDS210_610: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 216
    Data = {
      AE0000009619E0BD010000001800000007000000000003000000AE000D444553
      435F524547495354524F01004900000001000557494454480200020014000D50
      4552435F414C4951554F544108000400000000000C56414C5F52454749535452
      4F08000400000000000656414C5F424308000400000000000A564C5F5245435F
      425254080004000000000008434F445F434F4E5404000100000000000B56414C
      5F5245435F42525408000400000000000000}
    object CDS210_610DESC_REGISTRO: TStringField
      FieldName = 'DESC_REGISTRO'
    end
    object CDS210_610PERC_ALIQUOTA: TFloatField
      FieldName = 'PERC_ALIQUOTA'
    end
    object CDS210_610VAL_REGISTRO: TFloatField
      FieldName = 'VAL_REGISTRO'
    end
    object CDS210_610VAL_BC: TFloatField
      FieldName = 'VAL_BC'
    end
    object CDS210_610VL_REC_BRT: TFloatField
      FieldName = 'VL_REC_BRT'
    end
    object CDS210_610COD_CONT: TIntegerField
      FieldName = 'COD_CONT'
    end
  end
  object QReg210_610: TOracleDataSet1
    SQL.Strings = (
      'SELECT'#9'DISTINCT'
      #9'DESC_REGISTRO,'
      
        #9'CAST(NVL(COD_NATUREZA_RECEITA,999) AS INTEGER) AS COD_NATUREZA_' +
        'RECEITA,'
      #9'PERC_ALIQUOTA,'
      #9'COD_CONT,'
      #9'COD_CST_PIS,'
      #9'COD_CST_COFINS,'
      #9'SUM(VAL_REGISTRO) VAL_REGISTRO,'
      #9'SUM(VAL_BC) AS VAL_BC,'
      #9'SUM(VAL_RECEITA_BRUTA) AS VAL_REC_BRT'
      'FROM'
      #9'TB_SPED_APURACAO'
      'WHERE'
      #9'DESC_REGISTRO = :REGISTRO'
      'GROUP BY'
      #9'DESC_REGISTRO,'#9
      #9'CAST(NVL(COD_NATUREZA_RECEITA,999) AS INTEGER),'
      #9'PERC_ALIQUOTA,'
      #9'COD_CONT,'
      #9'COD_CST_PIS,'
      #9'COD_CST_COFINS'
      'HAVING '
      #9'SUM(VAL_REGISTRO) > 0')
    Variables.Data = {
      0300000001000000090000003A524547495354524F0500000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000D000000444553435F524547495354524F01000000000014
      000000434F445F4E41545552455A415F524543454954410100000000000D0000
      00504552435F414C4951554F544101000000000008000000434F445F434F4E54
      0100000000000B000000434F445F4353545F5049530100000000000E00000043
      4F445F4353545F434F46494E530100000000000C00000056414C5F5245474953
      54524F0100000000000600000056414C5F42430100000000000B00000056414C
      5F5245435F425254010000000000}
    Session = DMOracle.DBCemapa
    Left = 248
    Top = 216
    object QReg210_610DESC_REGISTRO: TStringField
      FieldName = 'DESC_REGISTRO'
      Required = True
      Size = 4
    end
    object QReg210_610COD_NATUREZA_RECEITA: TFloatField
      FieldName = 'COD_NATUREZA_RECEITA'
    end
    object QReg210_610PERC_ALIQUOTA: TFloatField
      FieldName = 'PERC_ALIQUOTA'
    end
    object QReg210_610COD_CONT: TIntegerField
      FieldName = 'COD_CONT'
    end
    object QReg210_610COD_CST_PIS: TStringField
      FieldName = 'COD_CST_PIS'
      Size = 3
    end
    object QReg210_610COD_CST_COFINS: TStringField
      FieldName = 'COD_CST_COFINS'
      Size = 3
    end
    object QReg210_610VAL_REGISTRO: TFloatField
      FieldName = 'VAL_REGISTRO'
    end
    object QReg210_610VAL_BC: TFloatField
      FieldName = 'VAL_BC'
    end
    object QReg210_610VAL_REC_BRT: TFloatField
      FieldName = 'VAL_REC_BRT'
    end
  end
  object CDS200_600: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 272
    Data = {
      510000009619E0BD010000001800000002000000000003000000510012564C5F
      544F545F434F4E545F4E435F504552080004000000000013564C5F544F545F43
      4F4E545F43554D5F50455208000400000000000000}
    object CDS200_600VL_TOT_CONT_NC_PER: TFloatField
      FieldName = 'VL_TOT_CONT_NC_PER'
    end
    object CDS200_600VL_TOT_CONT_CUM_PER: TFloatField
      FieldName = 'VL_TOT_CONT_CUM_PER'
    end
  end
end
