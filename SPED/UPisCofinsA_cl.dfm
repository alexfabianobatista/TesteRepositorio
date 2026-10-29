object DMPisCofinsA: TDMPisCofinsA
  OldCreateOrder = False
  Left = 729
  Top = 267
  Height = 272
  Width = 367
  object QReg010: TOracleDataSet1
    SQL.Strings = (
      'SELECT  '
      '  F.COD_FILIAL,'
      '  F.NUM_CGC CNPJ'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
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
      '  (O.IND_SERVICO = '#39'S'#39' OR P.IND_TIPO_PRODUTO = '#39'SERVI'#199'O'#39')'
      'AND'
      '  N.COD_FILIAL IN :FILIAIS'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO <> '#39'06'#39
      'GROUP BY'
      '  F.COD_FILIAL,'
      '  F.NUM_CGC'
      'ORDER BY  '
      '  F.NUM_CGC')
    Variables.Data = {
      0300000003000000090000003A444154415F494E490C00000000000000000000
      00090000003A444154415F46494E0C0000000000000000000000080000003A46
      494C4941495301000000040000002831290000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000004000000434E504A0100000000000A000000434F445F4649
      4C49414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 32
    Top = 16
    object QReg010CNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object QReg010COD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
  end
  object QReg100: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  N.COD_NOTA_CAB,'
      '  DECODE(N.IND_ENTRADA_SAIDA, '#39'S'#39', '#39'1'#39', '#39'0'#39') IND_OPER,  '
      '  DECODE(N.IND_ENTRADA_SAIDA, '#39'S'#39', '#39'0'#39', '#39'1'#39') IND_EMIT,'
      '  N.COD_CADASTRO COD_PART,'
      '  N.COD_OPERACAO,'
      '  C.IND_PIS_COFINS_RETIDO,'
      '  C.NUM_CGC_CPF,'
      '  C.COD_ESTADO,'
      '  DECODE(N.IND_SITUACAO, '#39'3'#39', '#39'02'#39', '#39'00'#39') COD_SIT,'
      '  TB_SERIE.NUM_SERIE_FISCAL SER,'
      '  TB_SERIE.COD_SERIE_MODELO,'
      '  N.NUM_NOTA NUM_DOC, '
      '  N.DT_RECEBIMENTO DT_DOC, '
      '  DECODE(N.IND_CONDICAO_PAGTO, '#39'1'#39', '#39'0'#39','
      '    DECODE(N.IND_CONDICAO_PAGTO, '#39'2'#39', '#39'1'#39', '#39'9'#39')) IND_PAGTO,'
      '  PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB) VL_DESC,'
      '  NVL(SUM(I.VAL_ISS),0.00) VL_ISS,'
      
        '  DECODE(PS.COD_EMPRESA, '#39'CGS'#39', (SUM(I.VAL_TOTAL) + N.VAL_DESPES' +
        'AS + (CASE WHEN ((N.NUM_CONHECIMENTO_FRETE IS NOT NULL) AND (N.I' +
        'ND_ENTRADA_SAIDA = '#39'E'#39') AND (N.IND_TIPO_FRETE = '#39'FOB'#39')) THEN 0.0' +
        '0 ELSE N.VAL_FRETE END) + SUM(I.VAL_ICMS_SUBST) + SUM(CASE WHEN ' +
        '(I.COD_CST_IPI IN ('#39'00'#39', '#39'50'#39')) THEN I.VAL_IPI ELSE 0 END) - PEG' +
        'A_DESCONTO_NOTA(N.COD_NOTA_CAB)), CASE WHEN(O.IND_FIXAR_EMPRESA ' +
        '= '#39'N'#39' AND O.IND_FIXAR_OUTRAS_EMP = '#39'N'#39' AND O.IND_FIXAR_CONSUMO =' +
        ' '#39'N'#39') THEN SUM(I.VAL_TOTAL) ELSE (SUM(I.VAL_TOTAL) + N.VAL_DESPE' +
        'SAS - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) END) VL_DOC, '
      '  '
      '  DECODE((SELECT NI.VAL_IMPOSTO'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%PI' +
        'S%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '    NULL, '
      '    NVL(SUM(TRUNC(I.VAL_PIS, 2)),0.00), '
      '    (SELECT NI.VAL_IMPOSTO'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%PI' +
        'S%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB)) AS VL_PIS,'
      '  '
      '  DECODE((SELECT NI.VAL_IMPOSTO'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%CO' +
        'FINS%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '    NULL, '
      '    NVL(SUM(TRUNC(I.VAL_CONFINS, 2)),0.00), '
      '    (SELECT NI.VAL_IMPOSTO'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%CO' +
        'FINS%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB)) AS VL_COFINS,'
      '  '
      
        '  DECODE(PS.COD_EMPRESA, '#39'CGS'#39', (SUM(I.VAL_TOTAL) + N.VAL_DESPES' +
        'AS + (CASE WHEN ((N.NUM_CONHECIMENTO_FRETE IS NOT NULL) AND (N.I' +
        'ND_ENTRADA_SAIDA = '#39'E'#39') AND (N.IND_TIPO_FRETE = '#39'FOB'#39')) THEN 0.0' +
        '0 ELSE N.VAL_FRETE END) + SUM(I.VAL_ICMS_SUBST) + SUM(CASE WHEN ' +
        '(I.COD_CST_IPI IN ('#39'00'#39', '#39'50'#39')) THEN I.VAL_IPI ELSE 0 END) - PEG' +
        'A_DESCONTO_NOTA(N.COD_NOTA_CAB)), CASE WHEN(O.IND_FIXAR_EMPRESA ' +
        '= '#39'N'#39' AND O.IND_FIXAR_OUTRAS_EMP = '#39'N'#39' AND O.IND_FIXAR_CONSUMO =' +
        ' '#39'N'#39') THEN SUM(I.VAL_TOTAL) ELSE (SUM(I.VAL_TOTAL) + N.VAL_DESPE' +
        'SAS - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) END) VL_BC_PIS,'
      
        '  DECODE(PS.COD_EMPRESA, '#39'CGS'#39', (SUM(I.VAL_TOTAL) + N.VAL_DESPES' +
        'AS + (CASE WHEN ((N.NUM_CONHECIMENTO_FRETE IS NOT NULL) AND (N.I' +
        'ND_ENTRADA_SAIDA = '#39'E'#39') AND (N.IND_TIPO_FRETE = '#39'FOB'#39')) THEN 0.0' +
        '0 ELSE N.VAL_FRETE END) + SUM(I.VAL_ICMS_SUBST) + SUM(CASE WHEN ' +
        '(I.COD_CST_IPI IN ('#39'00'#39', '#39'50'#39')) THEN I.VAL_IPI ELSE 0 END) - PEG' +
        'A_DESCONTO_NOTA(N.COD_NOTA_CAB)), CASE WHEN(O.IND_FIXAR_EMPRESA ' +
        '= '#39'N'#39' AND O.IND_FIXAR_OUTRAS_EMP = '#39'N'#39' AND O.IND_FIXAR_CONSUMO =' +
        ' '#39'N'#39') THEN SUM(I.VAL_TOTAL) ELSE (SUM(I.VAL_TOTAL) + N.VAL_DESPE' +
        'SAS - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) END) VL_BC_COFINS,'
      '  '#39'NAO'#39' AS RETENCAO_GRASEL'
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
      '  ((P.IND_TIPO_PRODUTO = '#39'SERVI'#199'O'#39') OR (O.IND_SERVICO = '#39'S'#39'))'
      'AND'
      '  N.IND_SITUACAO <> '#39'1'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)  '
      'AND'
      '  N.COD_FILIAL IN :FILIAIS'
      'AND'
      
        '  ((N.IND_ENTRADA_SAIDA = '#39'E'#39' AND N.DT_RECEBIMENTO BETWEEN :DATA' +
        '_INI AND :DATA_FIN)'
      '  OR'
      
        '  (N.IND_ENTRADA_SAIDA = '#39'S'#39' AND N.DT_EMISSAO BETWEEN :DATA_INI ' +
        'AND :DATA_FIN))'
      'AND'
      
        '  TB_SERIE.COD_SERIE_MODELO IN ('#39'01'#39','#39'98'#39') /*Aparecer notas de s' +
        'ervi'#231'o para Debona - Vanessa 06/04/2015*/'
      'AND'
      
        '  ((NVL(O.PERC_BASE_PIS,-1) >= 0) AND (NVL(O.PERC_BASE_COFINS,-1' +
        ') >= 0))'
      'AND'
      
        '   (I.COD_CST_PIS IS NOT NULL) AND (I.COD_CST_COFINS IS NOT NULL' +
        ') '
      'GROUP BY  '
      '  N.COD_NOTA_CAB,'
      '  DECODE(PS.COD_EMPRESA, '
      '  '#39'GRASEL'#39','
      '  '#39'0'#39','
      '  DECODE(N.IND_ENTRADA_SAIDA, '#39'S'#39', '#39'1'#39', '#39'0'#39')),'
      '  DECODE(N.IND_ENTRADA_SAIDA, '#39'S'#39', '#39'0'#39', '#39'1'#39'),'
      '  N.COD_CADASTRO,'
      '  N.COD_OPERACAO,'
      '  C.IND_PIS_COFINS_RETIDO,'
      '  C.NUM_CGC_CPF,'
      '  C.COD_ESTADO,'
      '  DECODE(N.IND_SITUACAO, '#39'3'#39', '#39'02'#39', '#39'00'#39'),'
      '  TB_SERIE.NUM_SERIE_FISCAL, '
      '  TB_SERIE.COD_SERIE_MODELO,'
      '  N.NUM_NOTA, '
      '  N.DT_RECEBIMENTO, '
      
        '  DECODE(N.IND_CONDICAO_PAGTO, '#39'1'#39', '#39'0'#39', DECODE(N.IND_CONDICAO_P' +
        'AGTO, '#39'2'#39', '#39'1'#39', '#39'9'#39')),'
      '  N.VAL_DESCONTO, '
      '  PS.COD_EMPRESA,'
      '  N.VAL_DESPESAS,'
      '  N.NUM_CONHECIMENTO_FRETE,'
      '  N.IND_ENTRADA_SAIDA,'
      '  N.IND_TIPO_FRETE,'
      '  N.VAL_FRETE,'
      '  N.VAL_DESCONTO,'
      '  O.IND_FIXAR_EMPRESA,'
      '  O.IND_FIXAR_OUTRAS_EMP,'
      '  O.IND_FIXAR_CONSUMO'
      'HAVING SUM(I.VAL_ICM) = 0'
      ''
      'UNION ALL'
      ''
      '/*'
      
        '* ESTE BLOCO FOI CRIADO PARA ESCRITURAR AS NOTAS COM RETEN'#199#195'O DE' +
        ' PIS E COFINS DA GRASEL'
      
        '* NOTAS DE SA'#205'DA COM RETEN'#199#195'O DA GRASEL, DEVEM SER ESCRITURADAS ' +
        'TAMB'#201'M COMO ENTRADA'
      '*/'
      'SELECT'
      '  COD_NOTA_CAB,'
      '  IND_OPER,'
      '  IND_EMIT,'
      '  COD_PART,'
      '  COD_OPERACAO,'
      '  IND_PIS_COFINS_RETIDO,'
      '  NUM_CGC_CPF,'
      '  COD_ESTADO,'
      '  COD_SIT,'
      '  SER,'
      '  COD_SERIE_MODELO,'
      '  NUM_DOC,'
      '  DT_DOC,'
      '  IND_PAGTO,'
      '  SUM(VL_DESC) AS VL_DESC,'
      '  SUM(VL_ISS) AS VL_ISS,'
      '  SUM(VL_DOC) AS VL_DOC,'
      '  VL_PIS,'
      '  VL_COFINS,'
      '  SUM(VL_BC_PIS) AS VL_BC_PIS,'
      '  SUM(VL_BC_COFINS) AS VL_BC_COFINS,'
      '  RETENCAO_GRASEL'
      'FROM( '
      ''
      '        SELECT DISTINCT'
      '          N.COD_NOTA_CAB,'
      '          '#39'0'#39' IND_OPER,  '
      '          '#39'1'#39' IND_EMIT,'
      '          N.COD_CADASTRO COD_PART,'
      '          N.COD_OPERACAO,'
      '          C.IND_PIS_COFINS_RETIDO,'
      '          C.NUM_CGC_CPF,'
      '          C.COD_ESTADO,'
      '          DECODE(N.IND_SITUACAO, '#39'3'#39', '#39'02'#39', '#39'00'#39') COD_SIT,'
      '          TB_SERIE.NUM_SERIE_FISCAL SER,'
      '          TB_SERIE.COD_SERIE_MODELO,'
      '          N.NUM_NOTA NUM_DOC, '
      '          N.DT_RECEBIMENTO DT_DOC, '
      '          DECODE(N.IND_CONDICAO_PAGTO, '#39'1'#39', '#39'0'#39','
      
        '            DECODE(N.IND_CONDICAO_PAGTO, '#39'2'#39', '#39'1'#39', '#39'9'#39')) IND_PAG' +
        'TO,'
      '          PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB) VL_DESC,'
      '          NVL(I.VAL_ISS,0.00) VL_ISS,'
      '          '
      
        '          CASE WHEN(O.IND_FIXAR_EMPRESA = '#39'N'#39' AND O.IND_FIXAR_OU' +
        'TRAS_EMP = '#39'N'#39' AND O.IND_FIXAR_CONSUMO = '#39'N'#39') THEN I.VAL_TOTAL E' +
        'LSE (I.VAL_TOTAL + I.VAL_DESPESAS - PEGA_DESCONTO_ITEM(I.COD_NOT' +
        'A_ITEM)) END VL_DOC, '
      '          '
      '          DECODE((SELECT NI.VAL_IMPOSTO'
      
        '            FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOST' +
        'O IMP ON NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO L' +
        'IKE '#39'%PIS%'#39' AND ROWNUM < 2'
      '            WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '            NULL, '
      '            NVL(TRUNC(I.VAL_PIS, 2),0.00), '
      '            (SELECT NI.VAL_IMPOSTO'
      
        '            FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOST' +
        'O IMP ON NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO L' +
        'IKE '#39'%PIS%'#39' AND ROWNUM < 2'
      '            WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB)) AS VL_PIS,'
      '          '
      '          DECODE((SELECT NI.VAL_IMPOSTO'
      
        '            FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOST' +
        'O IMP ON NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO L' +
        'IKE '#39'%COFINS%'#39' AND ROWNUM < 2'
      '            WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '            NULL, '
      '            NVL(TRUNC(I.VAL_CONFINS, 2),0.00), '
      '            (SELECT NI.VAL_IMPOSTO'
      
        '            FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOST' +
        'O IMP ON NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO L' +
        'IKE '#39'%COFINS%'#39' AND ROWNUM < 2'
      
        '            WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB)) AS VL_COFIN' +
        'S,'
      '          '
      
        '          CASE WHEN(O.IND_FIXAR_EMPRESA = '#39'N'#39' AND O.IND_FIXAR_OU' +
        'TRAS_EMP = '#39'N'#39' AND O.IND_FIXAR_CONSUMO = '#39'N'#39') THEN I.VAL_TOTAL E' +
        'LSE (I.VAL_TOTAL + I.VAL_DESPESAS - PEGA_DESCONTO_ITEM(I.COD_NOT' +
        'A_ITEM)) END VL_BC_PIS,'
      
        '          CASE WHEN(O.IND_FIXAR_EMPRESA = '#39'N'#39' AND O.IND_FIXAR_OU' +
        'TRAS_EMP = '#39'N'#39' AND O.IND_FIXAR_CONSUMO = '#39'N'#39') THEN I.VAL_TOTAL E' +
        'LSE (I.VAL_TOTAL + I.VAL_DESPESAS - PEGA_DESCONTO_ITEM(I.COD_NOT' +
        'A_ITEM)) END VL_BC_COFINS,'
      '          '#39'SIM'#39' AS RETENCAO_GRASEL'
      '        FROM'
      '          TB_NOTA_ITEM I'
      
        '        INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_' +
        'CAB'
      
        '        INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADAS' +
        'TRO'
      
        '        INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERA' +
        'CAO'
      '        INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      
        '        INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE' +
        ' AND TB_SERIE.COD_FILIAL = N.COD_FILIAL'
      '            AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      
        '        INNER JOIN TB_NOTA_IMPOSTO_SERVICO NIS ON N.COD_NOTA_CAB' +
        ' = NIS.COD_NOTA_CAB'
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO'
      '        '
      '        INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      '        WHERE'
      '          PS.COD_EMPRESA = '#39'GRASEL'#39
      '        AND'
      '          C.IND_PIS_COFINS_RETIDO = '#39'SIM'#39' '
      '        AND'
      
        '          (IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39' OR IMP.DESC_IMPOSTO LIK' +
        'E '#39'%COFINS%'#39')'
      '        AND'
      
        '          ((P.IND_TIPO_PRODUTO = '#39'SERVI'#199'O'#39') OR (O.IND_SERVICO = ' +
        #39'S'#39'))'
      '        AND'
      '          N.IND_SITUACAO <> '#39'1'#39
      '        AND'
      '          O.IND_LIVRO_FISCAL = '#39'S'#39
      '        AND'
      '          (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)  '
      '        AND'
      '          N.COD_FILIAL IN :FILIAIS'
      '        AND'
      '          N.IND_ENTRADA_SAIDA = '#39'S'#39
      '        AND '
      '          N.DT_EMISSAO BETWEEN :DATA_INI AND :DATA_FIN  '
      '        AND'
      
        '          TB_SERIE.COD_SERIE_MODELO IN ('#39'01'#39','#39'98'#39') /*Aparecer no' +
        'tas de servi'#231'o para Debona - Vanessa 06/04/2015*/'
      '        AND'
      
        '          ((NVL(O.PERC_BASE_PIS,-1) >= 0) AND (NVL(O.PERC_BASE_C' +
        'OFINS,-1) >= 0))'
      '        AND'
      
        '           (I.COD_CST_PIS IS NOT NULL) AND (I.COD_CST_COFINS IS ' +
        'NOT NULL) '
      ')'
      'GROUP BY'
      '  COD_NOTA_CAB,'
      '  IND_OPER,'
      '  IND_EMIT,'
      '  COD_PART,'
      '  COD_OPERACAO,'
      '  IND_PIS_COFINS_RETIDO,'
      '  NUM_CGC_CPF,'
      '  COD_ESTADO,'
      '  COD_SIT,'
      '  SER,'
      '  COD_SERIE_MODELO,'
      '  NUM_DOC,'
      '  DT_DOC,'
      '  IND_PAGTO,  '
      '  VL_PIS,'
      '  VL_COFINS,  '
      '  RETENCAO_GRASEL '
      '  '
      'UNION ALL'
      ''
      '/*'
      
        '* ESTE BLOCO FOI CRIADO PARA ESCRITURAR AS NOTAS DE ENTRADA COM ' +
        'RETEN'#199#195'O DE PIS E COFINS DA GRASEL'
      '* ESTAS NOTAS DEVEM SER ESCRITURADAS APENAS COMO SA'#205'DAS'
      '*/'
      'SELECT'
      '  COD_NOTA_CAB,'
      '  IND_OPER,'
      '  IND_EMIT,'
      '  COD_PART,'
      '  COD_OPERACAO,'
      '  IND_PIS_COFINS_RETIDO,'
      '  NUM_CGC_CPF,'
      '  COD_ESTADO,'
      '  COD_SIT,'
      '  SER,'
      '  COD_SERIE_MODELO,'
      '  NUM_DOC,'
      '  DT_DOC,'
      '  IND_PAGTO,'
      '  SUM(VL_DESC) AS VL_DESC,'
      '  SUM(VL_ISS) AS VL_ISS,'
      '  SUM(VL_DOC) AS VL_DOC,'
      '  VL_PIS,'
      '  VL_COFINS,'
      '  SUM(VL_BC_PIS) AS VL_BC_PIS,'
      '  SUM(VL_BC_COFINS) AS VL_BC_COFINS,'
      '  RETENCAO_GRASEL'
      'FROM( '
      ''
      '        SELECT DISTINCT'
      '          N.COD_NOTA_CAB,'
      '          '#39'1'#39' IND_OPER,  '
      '          '#39'1'#39' IND_EMIT,'
      '          N.COD_CADASTRO COD_PART,'
      '          N.COD_OPERACAO,'
      '          C.IND_PIS_COFINS_RETIDO,'
      '          C.NUM_CGC_CPF,'
      '          C.COD_ESTADO,'
      '          DECODE(N.IND_SITUACAO, '#39'3'#39', '#39'02'#39', '#39'00'#39') COD_SIT,'
      '          TB_SERIE.NUM_SERIE_FISCAL SER,'
      '          TB_SERIE.COD_SERIE_MODELO,'
      '          N.NUM_NOTA NUM_DOC, '
      '          N.DT_RECEBIMENTO DT_DOC, '
      '          DECODE(N.IND_CONDICAO_PAGTO, '#39'1'#39', '#39'0'#39','
      
        '            DECODE(N.IND_CONDICAO_PAGTO, '#39'2'#39', '#39'1'#39', '#39'9'#39')) IND_PAG' +
        'TO,'
      '          PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB) VL_DESC,'
      '          NVL(I.VAL_ISS,0.00) VL_ISS,'
      '          '
      
        '          CASE WHEN(O.IND_FIXAR_EMPRESA = '#39'N'#39' AND O.IND_FIXAR_OU' +
        'TRAS_EMP = '#39'N'#39' AND O.IND_FIXAR_CONSUMO = '#39'N'#39') THEN I.VAL_TOTAL E' +
        'LSE (I.VAL_TOTAL + I.VAL_DESPESAS - PEGA_DESCONTO_ITEM(I.COD_NOT' +
        'A_ITEM)) END VL_DOC, '
      '          '
      '          DECODE((SELECT NI.VAL_IMPOSTO'
      
        '            FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOST' +
        'O IMP ON NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO L' +
        'IKE '#39'%PIS%'#39' AND ROWNUM < 2'
      '            WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '            NULL, '
      '            NVL(TRUNC(I.VAL_PIS, 2),0.00), '
      '            (SELECT NI.VAL_IMPOSTO'
      
        '            FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOST' +
        'O IMP ON NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO L' +
        'IKE '#39'%PIS%'#39' AND ROWNUM < 2'
      '            WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB)) AS VL_PIS,'
      '          '
      '          DECODE((SELECT NI.VAL_IMPOSTO'
      
        '            FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOST' +
        'O IMP ON NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO L' +
        'IKE '#39'%COFINS%'#39' AND ROWNUM < 2'
      '            WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '            NULL, '
      '            NVL(TRUNC(I.VAL_CONFINS, 2),0.00), '
      '            (SELECT NI.VAL_IMPOSTO'
      
        '            FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOST' +
        'O IMP ON NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO L' +
        'IKE '#39'%COFINS%'#39' AND ROWNUM < 2'
      
        '            WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB)) AS VL_COFIN' +
        'S,'
      '          '
      
        '          CASE WHEN(O.IND_FIXAR_EMPRESA = '#39'N'#39' AND O.IND_FIXAR_OU' +
        'TRAS_EMP = '#39'N'#39' AND O.IND_FIXAR_CONSUMO = '#39'N'#39') THEN I.VAL_TOTAL E' +
        'LSE (I.VAL_TOTAL + I.VAL_DESPESAS - PEGA_DESCONTO_ITEM(I.COD_NOT' +
        'A_ITEM)) END VL_BC_PIS,'
      
        '          CASE WHEN(O.IND_FIXAR_EMPRESA = '#39'N'#39' AND O.IND_FIXAR_OU' +
        'TRAS_EMP = '#39'N'#39' AND O.IND_FIXAR_CONSUMO = '#39'N'#39') THEN I.VAL_TOTAL E' +
        'LSE (I.VAL_TOTAL + I.VAL_DESPESAS - PEGA_DESCONTO_ITEM(I.COD_NOT' +
        'A_ITEM)) END VL_BC_COFINS,'
      '          '#39'SIM'#39' AS RETENCAO_GRASEL'
      '        FROM'
      '          TB_NOTA_ITEM I'
      
        '        INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_' +
        'CAB'
      
        '        INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADAS' +
        'TRO'
      
        '        INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERA' +
        'CAO'
      '        INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      
        '        INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE' +
        ' AND TB_SERIE.COD_FILIAL = N.COD_FILIAL'
      '            AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      
        '        INNER JOIN TB_NOTA_IMPOSTO_SERVICO NIS ON N.COD_NOTA_CAB' +
        ' = NIS.COD_NOTA_CAB'
      
        '        INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = IMP.COD_I' +
        'MPOSTO'
      '        '
      '        INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      '        WHERE'
      '          PS.COD_EMPRESA = '#39'GRASEL'#39
      '        AND'
      '          (C.IND_PIS_COFINS_RETIDO = '#39'SIM'#39')'
      '        AND'
      
        '          (IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39' OR IMP.DESC_IMPOSTO LIK' +
        'E '#39'%COFINS%'#39')'
      '        AND'
      
        '          ((P.IND_TIPO_PRODUTO = '#39'SERVI'#199'O'#39') OR (O.IND_SERVICO = ' +
        #39'S'#39'))'
      '        AND'
      '          N.IND_SITUACAO <> '#39'1'#39
      '        AND'
      '          O.IND_LIVRO_FISCAL = '#39'S'#39
      '        AND'
      '          (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)  '
      '        AND'
      '          N.COD_FILIAL IN :FILIAIS'
      '        AND'
      '          N.IND_ENTRADA_SAIDA = '#39'E'#39
      '        AND '
      '          N.DT_RECEBIMENTO BETWEEN :DATA_INI AND :DATA_FIN  '
      '        AND'
      
        '          TB_SERIE.COD_SERIE_MODELO IN ('#39'01'#39','#39'98'#39') /*Aparecer no' +
        'tas de servi'#231'o para Debona - Vanessa 06/04/2015*/'
      '        AND'
      
        '          ((NVL(O.PERC_BASE_PIS,-1) = -1) AND (NVL(O.PERC_BASE_C' +
        'OFINS,-1) = -1))'
      '        AND'
      
        '           (I.COD_CST_PIS IS NOT NULL) AND (I.COD_CST_COFINS IS ' +
        'NOT NULL) '
      ')'
      'GROUP BY'
      '  COD_NOTA_CAB,'
      '  IND_OPER,'
      '  IND_EMIT,'
      '  COD_PART,'
      '  COD_OPERACAO,'
      '  IND_PIS_COFINS_RETIDO,'
      '  NUM_CGC_CPF,'
      '  COD_ESTADO,'
      '  COD_SIT,'
      '  SER,'
      '  COD_SERIE_MODELO,'
      '  NUM_DOC,'
      '  DT_DOC,'
      '  IND_PAGTO,  '
      '  VL_PIS,'
      '  VL_COFINS,  '
      '  RETENCAO_GRASEL'
      '  ')
    Variables.Data = {
      0300000003000000090000003A444154415F494E490C00000000000000000000
      00090000003A444154415F46494E0C0000000000000000000000080000003A46
      494C4941495301000000040000002831290000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001600000008000000494E445F4F50455201000000000008000000494E
      445F454D495401000000000008000000434F445F504152540100000000000700
      0000434F445F5349540100000000000300000053455201000000000007000000
      4E554D5F444F430100000000000600000044545F444F43010000000000090000
      00494E445F504147544F01000000000007000000564C5F444553430100000000
      0006000000564C5F49535301000000000006000000564C5F444F430100000000
      000C000000434F445F4E4F54415F43414201000000000006000000564C5F5049
      5301000000000009000000564C5F434F46494E5301000000000009000000564C
      5F42435F5049530100000000000C000000564C5F42435F434F46494E53010000
      0000000C000000434F445F4F5045524143414F0100000000000B0000004E554D
      5F4347435F4350460100000000000A000000434F445F45535441444F01000000
      000010000000434F445F53455249455F4D4F44454C4F01000000000015000000
      494E445F5049535F434F46494E535F52455449444F0100000000000F00000052
      4554454E43414F5F47524153454C010000000000}
    Session = DMOracle.DBCemapa
    Left = 88
    Top = 16
    object QReg100IND_OPER: TStringField
      FieldName = 'IND_OPER'
      Size = 1
    end
    object QReg100IND_EMIT: TStringField
      FieldName = 'IND_EMIT'
      Size = 1
    end
    object QReg100COD_PART: TIntegerField
      FieldName = 'COD_PART'
      Required = True
    end
    object QReg100COD_SIT: TStringField
      FieldName = 'COD_SIT'
      Size = 2
    end
    object QReg100SER: TIntegerField
      FieldName = 'SER'
    end
    object QReg100NUM_DOC: TIntegerField
      FieldName = 'NUM_DOC'
      Required = True
    end
    object QReg100DT_DOC: TDateTimeField
      FieldName = 'DT_DOC'
    end
    object QReg100IND_PAGTO: TStringField
      FieldName = 'IND_PAGTO'
      Size = 1
    end
    object QReg100VL_DESC: TFloatField
      FieldName = 'VL_DESC'
    end
    object QReg100VL_ISS: TFloatField
      FieldName = 'VL_ISS'
      Required = True
    end
    object QReg100VL_DOC: TFloatField
      FieldName = 'VL_DOC'
    end
    object QReg100COD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QReg100VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object QReg100VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
    object QReg100VL_BC_PIS: TFloatField
      FieldName = 'VL_BC_PIS'
    end
    object QReg100VL_BC_COFINS: TFloatField
      FieldName = 'VL_BC_COFINS'
    end
    object QReg100COD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
      Required = True
    end
    object QReg100NUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 18
    end
    object QReg100COD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
    object QReg100COD_SERIE_MODELO: TStringField
      FieldName = 'COD_SERIE_MODELO'
      Required = True
      Size = 2
    end
    object QReg100IND_PIS_COFINS_RETIDO: TStringField
      FieldName = 'IND_PIS_COFINS_RETIDO'
      Size = 3
    end
    object QReg100RETENCAO_GRASEL: TStringField
      FieldName = 'RETENCAO_GRASEL'
      Size = 3
    end
  end
  object QReg110: TOracleDataSet1
    SQL.Strings = (
      'select'
      '  DISTINCT'
      '  *'
      'FROM'
      '('
      'SELECT'
      '  DISTINCT'
      '  M.COD_MENSAGEM + 0.00 AS COD_MENSAGEM,'
      '  trim(M.DESC_MENSAGEM)  || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO1) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO2) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO3) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO4) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO5) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO6) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO7)  as DESC_MENSAGEM'
      'FROM'
      '  TB_NOTA_CAB'
      
        'INNER JOIN TB_MENSAGEM M ON M.COD_MENSAGEM = TB_NOTA_CAB.COD_MEN' +
        'SAGEM'
      'WHERE'
      '  TB_NOTA_CAB.COD_NOTA_CAB = :COD_NOTA_CAB'
      ')'
      ''
      '/*select'
      '  DISTINCT'
      '  *'
      'FROM'
      '('
      'SELECT'
      '  DISTINCT'
      '  M.COD_MENSAGEM + 0.00 AS COD_MENSAGEM,'
      '  trim(M.DESC_MENSAGEM)  || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO1) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO2) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO3) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO4) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO5) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO6) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO7)  as DESC_MENSAGEM'
      'FROM'
      '  TB_NOTA_CAB'
      
        'INNER JOIN TB_MENSAGEM M ON M.COD_MENSAGEM = TB_NOTA_CAB.COD_MEN' +
        'SAGEM'
      
        'INNER JOIN TB_SERIE S ON TB_NOTA_CAB.COD_SERIE = S.COD_SERIE AND' +
        ' TB_NOTA_CAB.COD_FILIAL = S.COD_FILIAL'
      
        'INNER JOIN TB_OPERACAO O ON TB_NOTA_CAB.COD_OPERACAO = O.COD_OPE' +
        'RACAO'
      'WHERE'
      '  TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      
        '  ((S.DESC_MODELO = '#39'55'#39' AND O.IND_EMITE <> '#39'F'#39') OR (S.DESC_MODE' +
        'LO <> '#39'55'#39' AND O.IND_EMITE = '#39'F'#39'))'
      'AND'
      '  S.DESC_MODELO <> '#39'06'#39
      'AND'
      '  TB_NOTA_CAB.IND_SITUACAO <> '#39'3'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  O.IND_SERVICO = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'UNION'
      'SELECT'
      '  DISTINCT'
      '  M.COD_MENSAGEM + 0.00 AS COD_MENSAGEM,'
      '  trim(M.DESC_MENSAGEM)  || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO1) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO2) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO3) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO4) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO5) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO6) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO7)  as DESC_MENSAGEM'
      'FROM'
      '  TB_NOTA_CAB'
      
        'INNER JOIN TB_MENSAGEM M ON M.COD_MENSAGEM = TB_NOTA_CAB.COD_MEN' +
        'SAGEM'
      
        'INNER JOIN TB_NOTA_ITEM ON TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_IT' +
        'EM.COD_NOTA_CAB'
      
        'INNER JOIN TB_PRODUTO ON TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.C' +
        'OD_PRODUTO'
      
        'INNER JOIN TB_SERIE ON TB_NOTA_CAB.COD_SERIE = TB_SERIE.COD_SERI' +
        'E'
      
        'INNER JOIN TB_OPERACAO ON TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO' +
        '.COD_OPERACAO'
      'WHERE'
      
        '  ((TB_PRODUTO.IND_TIPO_PRODUTO = '#39'GAS'#39') OR (TB_PRODUTO.IND_TIPO' +
        '_PRODUTO = '#39'ENERGIA'#39'))'
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_SERIE.DESC_MODELO = '#39'06'#39
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  TB_OPERACAO.IND_SERVICO = '#39'S'#39
      'AND'
      
        '  (TB_OPERACAO.NUM_LIVROS <> 10 or TB_OPERACAO.NUM_LIVROS is nul' +
        'l)'
      'UNION'
      '('
      'SELECT'
      '  DISTINCT'
      '  M.COD_MENSAGEM + 0.00 AS COD_MENSAGEM,'
      '  trim(M.DESC_MENSAGEM)  || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO1) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO2) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO3) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO4) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO5) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO6) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO7)  as DESC_MENSAGEM'
      'FROM'
      '  TB_CONHECIMENTO,'
      '  TB_CADASTRO,'
      '  TB_OPERACAO,'
      '  TB_TRIBUTACAO,'
      '  TB_FILIAL,'
      '  TB_SERIE,'
      '  TB_MENSAGEM M'
      'WHERE'
      '  TB_CONHECIMENTO.COD_MENSAGEM = M.COD_MENSAGEM'
      '  AND'
      '  TB_CONHECIMENTO.COD_SERIE = TB_SERIE.COD_SERIE'
      '  AND'
      '  TB_CONHECIMENTO.COD_FILIAL = TB_SERIE.COD_FILIAL'
      '  AND'
      '  TB_CONHECIMENTO.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '  AND'
      '  TB_CONHECIMENTO.COD_TRIBUTACAO = TB_TRIBUTACAO.COD_TRIBUTACAO'
      '  AND'
      '  TB_CONHECIMENTO.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      '  AND'
      '  TB_CONHECIMENTO.IND_SITUACAO <> '#39'1'#39
      '  AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      '  AND'
      '  TB_OPERACAO.IND_SERVICO = '#39'S'#39
      '  AND'
      '  TB_CONHECIMENTO.DT_RECEBIMENTO BETWEEN :DATA_INI AND :DATA_FIN'
      '  AND'
      '  TB_CONHECIMENTO.COD_FILIAL = :COD_FILIAL'
      'union'
      'SELECT'
      '  DISTINCT'
      '  M.COD_MENSAGEM + 0.00 AS COD_MENSAGEM,'
      '  trim(M.DESC_MENSAGEM)  || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO1) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO2) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO3) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO4) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO5) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO6) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO7)  as DESC_MENSAGEM'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL)'
      
        'INNER JOIN TB_TRIBUTACAO ON I.COD_TRIBUTACAO = TB_TRIBUTACAO.COD' +
        '_TRIBUTACAO'
      'INNER JOIN TB_FILIAL ON N.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      
        'INNER JOIN TB_CADASTRO ON N.COD_CADASTRO = TB_CADASTRO.COD_CADAS' +
        'TRO'
      'INNER JOIN TB_MENSAGEM M ON N.COD_MENSAGEM = M.COD_MENSAGEM'
      'WHERE'
      '  N.IND_SITUACAO <> '#39'1'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  O.NUM_LIVROS = 10'
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      ')'
      'union'
      'SELECT'
      '  DISTINCT'
      '  M.COD_MENSAGEM + 0.00 AS COD_MENSAGEM,'
      '  trim(M.DESC_MENSAGEM)  || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO1) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO2) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO3) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO4) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO5) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO6) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO7)  as DESC_MENSAGEM'
      'FROM'
      '  Tb_Nota_Cab,'
      '  Tb_Nota_Item,'
      '  Tb_Operacao,'
      '  TB_SERIE,'
      '  tb_mensagem m'
      'Where'
      '  tb_nota_cab.COD_MENSAGEM = M.COD_MENSAGEM'
      '  and'
      '  Tb_Nota_Cab.COD_NOTA_CAB = Tb_Nota_Item.COD_NOTA_CAB'
      '  And'
      '  Tb_Nota_Cab.COD_OPERACAO = Tb_Nota_Item.COD_OPERACAO'
      '  And'
      '  TB_NOTA_CAB.COD_SERIE = TB_SERIE.COD_SERIE'
      '  And'
      '  Tb_Nota_Cab.IND_SITUACAO <> '#39'1'#39
      '  And'
      '  Tb_Operacao.IND_TELECOMUNICACAO = '#39'S'#39
      '  And'
      '  TB_OPERACAO.IND_SERVICO = '#39'S'#39
      '  AND'
      '  Tb_Nota_Cab.COD_FILIAL = :COD_FILIAL'
      '  And'
      '  Tb_Nota_Cab.DT_RECEBIMENTO BETWEEN :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      ')'
      'ORDER BY'
      '  COD_MENSAGEM,'
      '  DESC_MENSAGEM*/')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000C000000434F445F4D454E534147454D0100000000000D00
      0000444553435F4D454E534147454D010000000000}
    Session = DMOracle.DBCemapa
    Left = 144
    Top = 16
    object QReg110COD_MENSAGEM: TFloatField
      FieldName = 'COD_MENSAGEM'
    end
    object QReg110DESC_MENSAGEM: TStringField
      FieldName = 'DESC_MENSAGEM'
      Size = 564
    end
  end
  object QReg111: TOracleDataSet1
    Session = DMOracle.DBCemapa
    Left = 32
    Top = 80
  end
  object QReg120: TOracleDataSet1
    SQL.Strings = (
      'SELECT   '
      '  N.DT_EMISSAO DT_PAG_PIS,'
      '  O.PERC_BASE_PIS AS VL_BC_PIS,'
      '  O.PERC_BASE_COFINS AS VL_BC_COFINS,'
      '  DECODE((SELECT NI.VAL_IMPOSTO'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%PI' +
        'S%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '    NULL, '
      '    NVL(SUM(I.VAL_PIS),0.00), '
      '    (SELECT NI.VAL_IMPOSTO'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%PI' +
        'S%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB)) AS VL_PIS_IMP,'
      '  DECODE((SELECT NI.VAL_IMPOSTO'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%CO' +
        'FINS%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '    NULL, '
      '    NVL(SUM(I.VAL_CONFINS),0.00), '
      '    (SELECT NI.VAL_IMPOSTO'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%CO' +
        'FINS%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB)) AS VL_COFINS_IMP,'
      '  N.DT_EMISSAO DT_PAG_COFINS,'
      '  0 LOC_EXE_SERV,'
      
        '  DECODE(PS.COD_EMPRESA, '#39'CGS'#39', (SUM(I.VAL_TOTAL) + N.VAL_DESPES' +
        'AS + (CASE WHEN ((N.NUM_CONHECIMENTO_FRETE IS NOT NULL) AND (N.I' +
        'ND_ENTRADA_SAIDA = '#39'E'#39') AND (N.IND_TIPO_FRETE = '#39'FOB'#39')) THEN 0.0' +
        '0 ELSE N.VAL_FRETE END) + SUM(I.VAL_ICMS_SUBST) + SUM(CASE WHEN ' +
        '(I.COD_CST_IPI IN ('#39'00'#39', '#39'50'#39')) THEN I.VAL_IPI ELSE 0 END) - PEG' +
        'A_DESCONTO_NOTA(N.COD_NOTA_CAB)), CASE WHEN(O.IND_FIXAR_EMPRESA ' +
        '= '#39'N'#39' AND O.IND_FIXAR_OUTRAS_EMP = '#39'N'#39' AND O.IND_FIXAR_CONSUMO =' +
        ' '#39'N'#39') THEN SUM(I.VAL_TOTAL) ELSE (SUM(I.VAL_TOTAL) + N.VAL_DESPE' +
        'SAS - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) END)  VL_TOT_SERV'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      'INNER JOIN TB_PAIS P ON C.COD_PAIS = P.COD_PAIS'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        '--INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND T' +
        'B_SERIE.COD_FILIAL = N.COD_FILIAL)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE '
      '  N.IND_ENTRADA_SAIDA = '#39'E'#39
      'AND'
      '  N.COD_NOTA_CAB = :COD_NOTA_CAB'
      'AND'
      '  O.IND_SERVICO = '#39'S'#39
      'AND'
      '  UPPER(P.DESC_PAIS) <> '#39'BRASIL'#39
      'GROUP BY '
      '  N.DT_EMISSAO,'
      '  O.PERC_BASE_PIS,'
      '  O.PERC_BASE_COFINS,  '
      '  N.COD_NOTA_CAB,'
      '  N.DT_EMISSAO,   '
      '  0,'
      '  PS.COD_EMPRESA,'
      '  N.VAL_DESPESAS,'
      '  N.NUM_CONHECIMENTO_FRETE,'
      '  N.IND_ENTRADA_SAIDA,'
      '  N.IND_TIPO_FRETE,'
      '  N.VAL_FRETE,'
      '  I.VAL_IPI,'
      '  N.VAL_DESCONTO,'
      '  O.IND_FIXAR_EMPRESA,'
      '  O.IND_FIXAR_OUTRAS_EMP,'
      '  O.IND_FIXAR_CONSUMO')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000800000009000000564C5F42435F5049530100000000000A00000056
      4C5F5049535F494D500100000000000A00000044545F5041475F504953010000
      0000000C000000564C5F42435F434F46494E530100000000000D000000564C5F
      434F46494E535F494D500100000000000D00000044545F5041475F434F46494E
      530100000000000C0000004C4F435F4558455F534552560100000000000B0000
      00564C5F544F545F53455256010000000000}
    Session = DMOracle.DBCemapa
    Left = 96
    Top = 80
    object QReg120VL_BC_PIS: TFloatField
      FieldName = 'VL_BC_PIS'
    end
    object QReg120VL_PIS_IMP: TFloatField
      FieldName = 'VL_PIS_IMP'
    end
    object QReg120DT_PAG_PIS: TDateTimeField
      FieldName = 'DT_PAG_PIS'
      Required = True
    end
    object QReg120VL_BC_COFINS: TFloatField
      FieldName = 'VL_BC_COFINS'
    end
    object QReg120VL_COFINS_IMP: TFloatField
      FieldName = 'VL_COFINS_IMP'
    end
    object QReg120DT_PAG_COFINS: TDateTimeField
      FieldName = 'DT_PAG_COFINS'
      Required = True
    end
    object QReg120LOC_EXE_SERV: TFloatField
      FieldName = 'LOC_EXE_SERV'
    end
    object QReg120VL_TOT_SERV: TFloatField
      FieldName = 'VL_TOT_SERV'
    end
  end
  object QReg170: TOracleDataSet1
    SQL.Strings = (
      'SELECT DISTINCT'
      '  I.COD_NOTA_ITEM NUM_ITEM,'
      '  PROD.COD_PRODUTO COD_ITEM,'
      '  I.DESC_INF_ADICIONAL DESCR_COMPL,'
      '  I.VAL_TOTAL VL_ITEM,'
      '  PEGA_DESCONTO_ITEM(I.COD_NOTA_ITEM) VL_DESC,'
      
        '  NVL(I.COD_CST_PIS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', PROD.COD_C' +
        'ST_PIS, PROD.COD_CST_PIS_SAIDA)) CST_PIS,'
      
        '  NVL(I.COD_CST_COFINS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', PROD.CO' +
        'D_CST_COFINS, PROD.COD_CST_COFINS_SAIDA)) CST_COFINS,'
      
        '  NVL(PROD.COD_NATUREZA_RECEITA, O.COD_BC_CREDITO_PISCOFINS) AS ' +
        'COD_NATUREZA_RECEITA,'
      '  O.NUM_NATUREZA_INT_NOVO,'
      
        '  NVL(O.COD_BC_CREDITO_PISCOFINS, '#39'03'#39') AS COD_BC_CREDITO_PISCOF' +
        'INS,'
      '  I.VAL_TOTAL - I.VAL_ICM VL_BC_PIS,'
      '  I.VAL_TOTAL - I.VAL_ICM VL_BC_COFINS,'
      '  N.IND_ENTRADA_SAIDA,'
      '  DECODE((SELECT IMP.PERC_ALIQUOTA'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%PI' +
        'S%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '    NULL, '
      '    PS.PERC_PIS, '
      '    (SELECT IMP.PERC_ALIQUOTA'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%PI' +
        'S%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB)) AS ALIQ_PIS,'
      '  DECODE((SELECT IMP.PERC_ALIQUOTA'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%CO' +
        'FINS%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '    NULL, '
      '    PS.PERC_COFINS, '
      '    (SELECT IMP.PERC_ALIQUOTA'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%CO' +
        'FINS%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB)) AS ALIQ_COFINS,  '
      '    '
      '  DECODE((SELECT NI.VAL_IMPOSTO'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%PI' +
        'S%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '    NULL, '
      '    TRUNC(NVL(I.VAL_PIS,0.00), 2), '
      '    (SELECT NI.VAL_IMPOSTO'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%PI' +
        'S%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB)) AS VL_PIS,'
      '    '
      '  DECODE((SELECT NI.VAL_IMPOSTO'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%CO' +
        'FINS%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '    NULL, '
      '    TRUNC(NVL(I.VAL_CONFINS,0.00), 2), '
      '    (SELECT NI.VAL_IMPOSTO'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%CO' +
        'FINS%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB)) AS VL_COFINS,'
      '  O.COD_CONTABIL_NOTA_SPED_CONTRIB AS COD_CTA'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_PRODUTO PROD ON  I.COD_PRODUTO = PROD.COD_PRODUTO'
      
        'INNER JOIN TB_TRIBUTACAO TR ON I.COD_TRIBUTACAO = TR.COD_TRIBUTA' +
        'CAO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  N.COD_NOTA_CAB = :COD_NOTA_CAB'
      '  AND'
      '  N.IND_SITUACAO <> 3')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000013000000080000004E554D5F4954454D01000000000008000000434F
      445F4954454D0100000000000B00000044455343525F434F4D504C0100000000
      0007000000564C5F4954454D01000000000007000000564C5F44455343010000
      000000070000004353545F5049530100000000000A0000004353545F434F4649
      4E5301000000000014000000434F445F4E41545552455A415F52454345495441
      010000000000150000004E554D5F4E41545552455A415F494E545F4E4F564F01
      000000000008000000414C49515F5049530100000000000B000000414C49515F
      434F46494E5301000000000006000000564C5F50495301000000000009000000
      564C5F434F46494E5301000000000009000000564C5F42435F50495301000000
      00000C000000564C5F42435F434F46494E5301000000000018000000434F445F
      42435F4352454449544F5F504953434F46494E5301000000000007000000434F
      445F43544101000000000011000000494E445F454E54524144415F5341494441
      0100000000000C000000434F445F4F5045524143414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 152
    Top = 80
    object QReg170NUM_ITEM: TIntegerField
      FieldName = 'NUM_ITEM'
      Required = True
    end
    object QReg170COD_ITEM: TFloatField
      FieldName = 'COD_ITEM'
      Required = True
    end
    object QReg170DESCR_COMPL: TStringField
      FieldName = 'DESCR_COMPL'
      Size = 500
    end
    object QReg170VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
      Required = True
    end
    object QReg170VL_DESC: TFloatField
      FieldName = 'VL_DESC'
    end
    object QReg170CST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 3
    end
    object QReg170COD_NATUREZA_RECEITA: TIntegerField
      FieldName = 'COD_NATUREZA_RECEITA'
    end
    object QReg170PERC_PIS: TFloatField
      FieldName = 'PERC_PIS'
    end
    object QReg170PERC_COFINS: TFloatField
      FieldName = 'PERC_COFINS'
    end
    object QReg170NUM_NATUREZA_INT_NOVO: TIntegerField
      FieldName = 'NUM_NATUREZA_INT_NOVO'
    end
    object QReg170COD_BC_CREDITO_PISCOFINS: TStringField
      FieldName = 'COD_BC_CREDITO_PISCOFINS'
      Size = 2
    end
    object QReg170CST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object QReg170ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object QReg170ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object QReg170VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object QReg170VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
    object QReg170VL_BC_PIS: TFloatField
      FieldName = 'VL_BC_PIS'
    end
    object QReg170VL_BC_COFINS: TFloatField
      FieldName = 'VL_BC_COFINS'
    end
    object QReg170COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 15
    end
    object QReg170IND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 1
    end
  end
end
