object DmBlocoD: TDmBlocoD
  OldCreateOrder = False
  Left = 812
  Top = 305
  Height = 198
  Width = 374
  object QReg100: TOracleDataSet1
    SQL.Strings = (
      'Select distinct'
      '  TB_CONHECIMENTO.COD_CONHECIMENTO + 0.00 AS COD_CONHECIMENTO,'
      '  TB_CONHECIMENTO.COD_CADASTRO + 0.00 AS COD_CADASTRO,'
      '  TB_SERIE.COD_SERIE_MODELO,'
      '  TB_CONHECIMENTO.IND_SITUACAO,'
      '  TB_SERIE.NUM_SERIE_FISCAL,'
      '  TB_SERIE.COD_SERIE,'
      '  TB_CONHECIMENTO.NUM_CONHECIMENTO + 0.00 AS NUM_CONHECIMENTO,'
      '  TB_CONHECIMENTO.DT_EMISSAO,'
      '  TB_CONHECIMENTO.DT_RECEBIMENTO,'
      '  TB_CONHECIMENTO.VAL_FRETE,  '
      
        '  DECODE(TB_CONHECIMENTO.PERC_DESCONTO_FRETE,0,0,TB_CONHECIMENTO' +
        '.VAL_FRETE * TB_CONHECIMENTO.PERC_DESCONTO_FRETE / 100) as VAL_D' +
        'ESCONTO,'
      '  TB_CONHECIMENTO.DESC_CHAVE_ACESSO_CTE,'
      '  TB_CONHECIMENTO.DESC_CHAVE_ACESSO_REF,'
      '  1 as TIPO_PAGAMENTO,'
      
        '  NVL(TB_CONHECIMENTO.VAL_FRETE,0) + NVL(TB_CONHECIMENTO.VAL_PED' +
        'AGIO,0) + NVL(TB_CONHECIMENTO.VAL_SEGURO,0) AS VAL_TOTAL,'
      
        '  DECODE(VAL_ICMS,0,0,TB_CONHECIMENTO.VAL_FRETE + NVL(TB_CONHECI' +
        'MENTO.VAL_SEGURO,0)) AS VAL_BASE_CALCULO,'
      '  TB_CONHECIMENTO.VAL_ICMS,'
      
        '  DECODE(VAL_ICMS,0,TB_CONHECIMENTO.VAL_PEDAGIO + TB_CONHECIMENT' +
        'O.VAL_SEGURO,TB_CONHECIMENTO.VAL_FRETE + TB_CONHECIMENTO.VAL_PED' +
        'AGIO + TB_CONHECIMENTO.VAL_SEGURO) AS VAL_NAO_TRIBUTADO,'
      '  '#39#39' AS IND_TIPO_CTE,'
      '  0 AS VAL_PIS,'
      '  0 AS VAL_COFINS,'
      '  TB_OPERACAO.IND_TIPO_OPERACAO,'
      '  TB_OPERACAO.IND_EMITE,'
      
        '  NVL(TB_TRIBUTACAO.DESC_SITUACAO_TRIB,TB_TRIBUTACAO.DESC_CSOSN)' +
        ' AS CST_ICMS,'
      '  TB_TRIBUTACAO.PERC_ALIQUOTA AS ALIQ_ICMS,'
      
        '  cast(DECODE(TB_CADASTRO.COD_ESTADO, TB_FILIAL.COD_ESTADO, TB_O' +
        'PERACAO.NUM_NATUREZA_EST_NOVO, TB_OPERACAO.NUM_NATUREZA_INT_NOVO' +
        ') as number(4)) + 0.00 AS CFOP,'
      '  '#39'C'#39' as TIPO,'
      
        '  (SELECT COD_UF_IBGE FROM TB_ESTADO WHERE COD_ESTADO = TB_CONHE' +
        'CIMENTO.COD_UF_ORIGEM)'
      
        '    || (SELECT COD_CIDADE_IBGE FROM TB_CIDADE WHERE COD_CIDADE =' +
        ' TB_CONHECIMENTO.COD_CIDADE_ORIGEM) AS COD_MUN_ORIG,'
      
        '  (SELECT COD_UF_IBGE FROM TB_ESTADO WHERE COD_ESTADO = TB_CONHE' +
        'CIMENTO.COD_UF_DESTINO)'
      
        '    || (SELECT COD_CIDADE_IBGE FROM TB_CIDADE WHERE COD_CIDADE =' +
        ' TB_CONHECIMENTO.COD_CIDADE_DESTINO) AS COD_MUN_DEST'
      'FROM'
      '  TB_CONHECIMENTO,'
      '  TB_CADASTRO,'
      '  TB_OPERACAO,'
      '  TB_TRIBUTACAO,'
      '  TB_FILIAL,'
      '  TB_SERIE'
      'WHERE'
      '  TB_CONHECIMENTO.COD_SERIE = TB_SERIE.COD_SERIE'
      '  AND'
      '  TB_CONHECIMENTO.COD_FILIAL = TB_SERIE.COD_FILIAL'
      '  AND'
      '  TB_CONHECIMENTO.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO'
      '  AND'
      '  TB_CONHECIMENTO.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '  AND'
      '  TB_CONHECIMENTO.COD_TRIBUTACAO = TB_TRIBUTACAO.COD_TRIBUTACAO'
      '  AND'
      '  TB_CONHECIMENTO.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      '  AND'
      '  TB_CADASTRO.COD_CADASTRO = TB_CONHECIMENTO.COD_CADASTRO'
      '  AND'
      '  TB_CONHECIMENTO.IND_SITUACAO <> '#39'1'#39
      '  AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      '  AND'
      '  TB_CONHECIMENTO.DT_RECEBIMENTO >= :DT_INICIAL'
      '  AND'
      '  TB_CONHECIMENTO.DT_RECEBIMENTO <= :DT_FINAL'
      '  AND'
      '  TB_CONHECIMENTO.COD_FILIAL = :COD_FILIAL'
      ''
      'union all'
      ''
      'Select distinct'
      
        '  TB_CONHECIMENTO_FRETE.COD_CONHECIMENTO_FRETE + 0.00 AS COD_CON' +
        'HECIMENTO,'
      '  TB_CONHECIMENTO_FRETE.COD_CADASTRO + 0.00,'
      
        '  decode(TB_SERIE.NUM_SERIE_FISCAL, null, '#39'08'#39', TB_SERIE.COD_SER' +
        'IE_MODELO),'
      '  TB_CONHECIMENTO_FRETE.IND_SITUACAO,'
      
        '  decode(TB_SERIE.NUM_SERIE_FISCAL, null, 8, TB_SERIE.NUM_SERIE_' +
        'FISCAL),'
      '  TB_SERIE.COD_SERIE,'
      '  TB_CONHECIMENTO_FRETE.NUM_FRETE + 0.00 AS NUM_CONHECIMENTO,'
      '  TB_CONHECIMENTO_FRETE.DT_EMISSAO_CONHECIMENTO AS DT_EMISSAO,'
      '  TB_CONHECIMENTO_FRETE.DT_RECEBIMENTO,'
      '  TB_CONHECIMENTO_FRETE.VAL_FRETE,'
      '  TB_CONHECIMENTO_FRETE.VAL_DESCONTO,'
      '  NULL AS DESC_CHAVE_ACESSO_CTE,'
      '  '#39#39' AS DESC_CHAVE_ACESSP_REF,  '
      '  1 as TIPO_PAGAMENTO,'
      
        '  TB_CONHECIMENTO_FRETE.VAL_FRETE + TB_CONHECIMENTO_FRETE.VAL_PE' +
        'DAGIO AS VAL_TOTAL,'
      
        '  DECODE(TB_CONHECIMENTO_FRETE.VAL_ICMS,0,0,TB_CONHECIMENTO_FRET' +
        'E.VAL_FRETE)  AS VAL_BASE_CALCULO,'
      '  TB_CONHECIMENTO_FRETE.VAL_ICMS,'
      
        '  DECODE(TB_CONHECIMENTO_FRETE.VAL_ICMS,0,TB_CONHECIMENTO_FRETE.' +
        'VAL_FRETE + TB_CONHECIMENTO_FRETE.VAL_PEDAGIO,TB_CONHECIMENTO_FR' +
        'ETE.VAL_PEDAGIO)  AS VAL_NAO_TRIBUTADO,'
      '  '#39#39' AS IND_TIPO_CTE,'
      '  TB_CONHECIMENTO_FRETE.VAL_PIS,'
      '  TB_CONHECIMENTO_FRETE.VAL_COFINS,'
      '  TB_OPERACAO.IND_TIPO_OPERACAO,'
      '  TB_OPERACAO.IND_EMITE,'
      
        '  NVL(TB_TRIBUTACAO.DESC_SITUACAO_TRIB,TB_TRIBUTACAO.DESC_CSOSN)' +
        ' AS CST_ICMS,'
      '  TB_TRIBUTACAO.PERC_ALIQUOTA AS ALIQ_ICMS,'
      
        '  cast(DECODE(TB_CADASTRO.COD_ESTADO, TB_FILIAL.COD_ESTADO, TB_O' +
        'PERACAO.NUM_NATUREZA_EST_NOVO, TB_OPERACAO.NUM_NATUREZA_INT_NOVO' +
        ') as number(4)) + 0.00 AS CFOP,'
      '  '#39'F'#39','
      '  '#39#39' AS COD_MUN_ORIG,'
      '  '#39#39' AS COD_MUN_DEST'
      'FROM'
      '  TB_CONHECIMENTO_FRETE'
      
        'INNER JOIN TB_CADASTRO ON TB_CONHECIMENTO_FRETE.COD_CADASTRO = T' +
        'B_CADASTRO.COD_CADASTRO'
      
        'INNER JOIN TB_TRIBUTACAO ON TB_CONHECIMENTO_FRETE.COD_TRIBUTACAO' +
        ' = TB_TRIBUTACAO.COD_TRIBUTACAO'
      
        'INNER JOIN TB_OPERACAO ON TB_CONHECIMENTO_FRETE.COD_OPERACAO = T' +
        'B_OPERACAO.COD_OPERACAO'
      
        'INNER JOIN TB_FILIAL ON TB_CONHECIMENTO_FRETE.COD_FILIAL = TB_FI' +
        'LIAL.COD_FILIAL'
      
        'LEFT JOIN TB_SERIE ON TB_CONHECIMENTO_FRETE.COD_SERIE = TB_SERIE' +
        '.COD_SERIE AND TB_CONHECIMENTO_FRETE.COD_FILIAL = TB_SERIE.COD_F' +
        'ILIAL'
      'WHERE'
      '  TB_CONHECIMENTO_FRETE.IND_SITUACAO <> '#39'1'#39
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  TB_CONHECIMENTO_FRETE.DT_RECEBIMENTO >= :DT_INICIAL'
      'AND'
      '  TB_CONHECIMENTO_FRETE.DT_RECEBIMENTO <= :DT_FINAL'
      'AND'
      '  TB_CONHECIMENTO_FRETE.COD_FILIAL = :COD_FILIAL'
      ''
      'union all'
      ''
      'SELECT distinct'
      '  N.COD_NOTA_CAB + 0.00,'
      '  N.COD_CADASTRO + 0.00,'
      '--  '#39'07'#39','
      '  TB_SERIE.COD_SERIE_MODELO,'
      '  N.IND_SITUACAO,'
      '  TB_SERIE.NUM_SERIE_FISCAL,'
      '  TB_SERIE.COD_SERIE,'
      '  N.NUM_NOTA,'
      '  N.DT_EMISSAO,'
      '  N.DT_RECEBIMENTO,'
      '  cast(0 as number(1)),'
      '  N.VAL_DESCONTO,'
      '  N.DESC_CHAVE_ACESSO_CTE,'
      '  '#39#39' DESC_CHAVE_ACESSO_REF,'
      '  cast(1 as number(1)),'
      '  SUM(I.VAL_TOTAL + I.VAL_DESPESAS - I.VAL_DESCONTO),'
      '  SUM(I.VAL_ICM_BASE),'
      '  SUM(I.VAL_ICM),'
      
        '  SUM(I.VAL_TOTAL + I.VAL_DESPESAS - I.VAL_DESCONTO) - SUM(I.VAL' +
        '_ICM_BASE),'
      '  '#39#39' AS IND_TIPO_CTE,'
      '  SUM(I.VAL_PIS),'
      '  SUM(I.VAL_CONFINS),'
      '  O.IND_TIPO_OPERACAO,'
      '  O.IND_EMITE,'
      
        '  NVL(TB_TRIBUTACAO.DESC_SITUACAO_TRIB,TB_TRIBUTACAO.DESC_CSOSN)' +
        ' AS CST_ICMS,'
      '  TB_TRIBUTACAO.PERC_ALIQUOTA,'
      
        '  cast(DECODE(TB_CADASTRO.COD_ESTADO, TB_FILIAL.COD_ESTADO, O.NU' +
        'M_NATUREZA_EST_NOVO, O.NUM_NATUREZA_INT_NOVO) as number(4)) + 0.' +
        '00,'
      '  '#39'N'#39','
      
        '  (SELECT COD_UF_IBGE FROM TB_ESTADO WHERE COD_ESTADO = TB_CADAS' +
        'TRO.COD_ESTADO)  '
      
        '    || (SELECT COD_CIDADE_IBGE FROM TB_CIDADE WHERE COD_CIDADE =' +
        ' TB_CADASTRO.COD_CIDADE)  AS COD_MUN_ORIG,'
      
        '  (SELECT COD_UF_IBGE FROM TB_ESTADO WHERE COD_ESTADO = TB_FILIA' +
        'L.COD_ESTADO)  '
      
        '    || (SELECT COD_CIDADE_IBGE FROM TB_CIDADE WHERE COD_CIDADE =' +
        ' TB_FILIAL.COD_CIDADE) AS COD_MUN_DEST'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      
        'INNER JOIN TB_TRIBUTACAO ON I.COD_TRIBUTACAO = TB_TRIBUTACAO.COD' +
        '_TRIBUTACAO'
      'INNER JOIN TB_FILIAL ON N.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      
        'INNER JOIN TB_CADASTRO ON N.COD_CADASTRO = TB_CADASTRO.COD_CADAS' +
        'TRO'
      'WHERE'
      '  N.IND_SITUACAO <> '#39'1'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  O.NUM_LIVROS = 10'
      'AND'
      
        '  TB_SERIE.COD_SERIE_MODELO IN ('#39'07'#39','#39'08'#39', '#39'8B'#39', '#39'09'#39', '#39'10'#39', '#39'11' +
        #39', '#39'26'#39', '#39'27'#39', '#39'57'#39')'
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.DT_RECEBIMENTO between :DT_INICIAL AND :DT_FINAL'
      'GROUP BY'
      '  N.COD_NOTA_CAB,'
      '  N.COD_CADASTRO,'
      '  TB_SERIE.COD_SERIE_MODELO,'
      '  TB_SERIE.COD_SERIE,'
      '  N.IND_SITUACAO,'
      '  N.COD_SERIE,'
      '  N.NUM_NOTA,'
      '  N.DT_EMISSAO,'
      '  N.DT_RECEBIMENTO,'
      '  cast(0 as number(1)),'
      '  N.VAL_DESCONTO,'
      '  N.DESC_CHAVE_ACESSO_CTE,'
      '  cast(1 as number(1)),'
      '  '#39#39','
      '  O.IND_TIPO_OPERACAO,'
      '  O.IND_EMITE,'
      
        '  NVL(TB_TRIBUTACAO.DESC_SITUACAO_TRIB,TB_TRIBUTACAO.DESC_CSOSN)' +
        ','
      '  TB_TRIBUTACAO.PERC_ALIQUOTA,'
      
        '  cast(DECODE(TB_CADASTRO.COD_ESTADO, TB_FILIAL.COD_ESTADO, O.NU' +
        'M_NATUREZA_EST_NOVO, O.NUM_NATUREZA_INT_NOVO) as number(4)),'
      '  TB_SERIE.NUM_SERIE_FISCAL,'
      '  TB_FILIAL.COD_CIDADE,'
      '  TB_FILIAL.COD_ESTADO,'
      '  TB_CADASTRO.COD_CIDADE,'
      '  TB_CADASTRO.COD_ESTADO'
      ''
      'union all'
      ''
      'SELECT distinct'
      '  N.COD_NOTA_CAB + 0.00,'
      '  N.COD_TRANSPORTADOR + 0.00,'
      '  TB_SERIE.COD_SERIE_MODELO,'
      '  N.IND_SITUACAO,'
      '  TB_SERIE.NUM_SERIE_FISCAL,'
      '  TB_SERIE.COD_SERIE,'
      '  N.NUM_CONHECIMENTO_FRETE,'
      '  N.DT_EMISSAO_CF,'
      '  NVL(N.DT_RECEBIMENTO,N.DT_EMISSAO_CF) AS DT_RECEBIMENTO,'
      '  N.VAL_FRETE,'
      '  cast(0 as number(1)),  '
      '  N.DESC_CHAVE_ACESSO_CTE, '
      '  '#39#39' DESC_CHAVE_ACESSO_REF,'
      '  cast(1 as number(1)),'
      '  N.VAL_FRETE,  '
      '  N.VAL_ICM_BASE_FRETE,  '
      '  N.VAL_ICM_FRETE,'
      '  N.VAL_FRETE - N.VAL_ICM_BASE_FRETE,  '
      '  '#39#39' AS IND_TIPO_CTE,'
      '  0, --PIS: ver'
      '  0, --COFINS: ver'
      '  O.IND_TIPO_OPERACAO,'
      '  O.IND_EMITE,'
      
        '  NVL(TB_TRIBUTACAO.DESC_SITUACAO_TRIB,TB_TRIBUTACAO.DESC_CSOSN)' +
        ' AS CST_ICMS,'
      '  TB_TRIBUTACAO.PERC_ALIQUOTA,'
      
        '  cast(DECODE(TB_CADASTRO.COD_ESTADO, TB_FILIAL.COD_ESTADO, O.NU' +
        'M_NATUREZA_EST_NOVO, O.NUM_NATUREZA_INT_NOVO) as number(4)) + 0.' +
        '00,'
      '  '#39'I'#39', -- Incluso'
      
        '  (SELECT COD_UF_IBGE FROM TB_ESTADO WHERE COD_ESTADO = TB_FILIA' +
        'L.COD_ESTADO)  '
      
        '    || (SELECT COD_CIDADE_IBGE FROM TB_CIDADE WHERE COD_CIDADE =' +
        ' TB_FILIAL.COD_CIDADE) AS COD_MUN_ORIG,'
      
        '  (SELECT COD_UF_IBGE FROM TB_ESTADO WHERE COD_ESTADO = TB_CADAS' +
        'TRO.COD_ESTADO)  '
      
        '    || (SELECT COD_CIDADE_IBGE FROM TB_CIDADE WHERE COD_CIDADE =' +
        ' TB_CADASTRO.COD_CIDADE) AS COD_MUN_DEST'
      'FROM'
      '  TB_NOTA_CAB N'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO_CF = O.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE_CF = TB_SERIE.COD_SERIE AND ' +
        'TB_SERIE.COD_FILIAL = N.COD_FILIAL '
      #9'AND N.COD_SERIE_MODELO_CF = TB_SERIE.COD_SERIE_MODELO)'
      
        'INNER JOIN TB_TRIBUTACAO ON N.COD_TRIBUTACAO_FRETE = TB_TRIBUTAC' +
        'AO.COD_TRIBUTACAO'
      'INNER JOIN TB_FILIAL ON N.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      
        'INNER JOIN TB_CADASTRO ON N.COD_TRANSPORTADOR = TB_CADASTRO.COD_' +
        'CADASTRO'
      
        'INNER JOIN TB_OPERACAO O_NOTA ON N.COD_OPERACAO = O_NOTA.COD_OPE' +
        'RACAO'
      
        'INNER JOIN TB_SERIE TB_SERIE_NOTA ON (N.COD_SERIE = TB_SERIE_NOT' +
        'A.COD_SERIE AND TB_SERIE_NOTA.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE_NOTA.COD_SERIE_MODELO)'
      
        'INNER JOIN TB_CADASTRO TB_CADASTRO_NOTA ON N.COD_TRANSPORTADOR =' +
        ' TB_CADASTRO_NOTA.COD_CADASTRO'
      'WHERE'
      '  N.IND_SITUACAO <> '#39'1'#39
      'AND'
      '  O_NOTA.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O_NOTA.NUM_LIVROS <> 10 or O_NOTA.NUM_LIVROS is null)'
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      
        '  --NVL(N.DT_EMISSAO_CF -- comentado porque a Nelci Cgs pediu. V' +
        'anessa 22/03/2017'
      '  --  , N.DT_RECEBIMENTO) BETWEEN :DT_INICIAL AND :DT_FINAL'
      '  N.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      '--and'
      
        '--  ((N.IND_ENTRADA_SAIDA = '#39'E'#39' and N.DT_RECEBIMENTO between :DT' +
        '_INICIAL and :DT_FINAL)'
      '--or'
      
        '--  (N.IND_ENTRADA_SAIDA = '#39'S'#39' and N.DT_EMISSAO between :DT_INIC' +
        'IAL and :DT_FINAL))'
      'AND'
      '  TB_SERIE_NOTA.COD_SERIE_MODELO <> '#39'06'#39
      'AND'
      '  N.NUM_CONHECIMENTO_FRETE IS NOT NULL'
      'AND'
      '  N.IND_ENTRADA_SAIDA = '#39'E'#39
      'AND'
      '  N.IND_TIPO_FRETE = '#39'FOB'#39
      'AND'
      
        '  TB_SERIE.COD_SERIE_MODELO IN ('#39'07'#39','#39'08'#39', '#39'8B'#39', '#39'09'#39', '#39'10'#39', '#39'11' +
        #39', '#39'26'#39', '#39'27'#39', '#39'57'#39')  '
      '  '
      ''
      'union all'
      '/* UTILIZADO PARA PEGAR CT-E. - 11/10/2013 */'
      'Select distinct'
      '  TB_CONHECIMENTO.COD_CONHECIMENTO + 0.00 AS COD_CONHECIMENTO,'
      '  TB_CONHECIMENTO.COD_CADASTRO_TOMADOR + 0.00 AS COD_CADASTRO,'
      '  TB_SERIE.COD_SERIE_MODELO,  '
      '  TB_CONHECIMENTO.IND_SITUACAO,'
      '  TB_SERIE.NUM_SERIE_FISCAL,'
      '  TB_SERIE.COD_SERIE,'
      '  TB_CONHECIMENTO.NUM_CONHECIMENTO + 0.00 AS NUM_CONHECIMENTO,'
      '  TB_CONHECIMENTO.DT_EMISSAO,'
      '  TB_CONHECIMENTO.DT_RECEBIMENTO,'
      '  TB_CONHECIMENTO.VAL_FRETE,  '
      
        '  DECODE(TB_CONHECIMENTO.PERC_DESCONTO_FRETE,0,0,TB_CONHECIMENTO' +
        '.VAL_FRETE * TB_CONHECIMENTO.PERC_DESCONTO_FRETE / 100) as VAL_D' +
        'ESCONTO,'
      '  TB_CONHECIMENTO.DESC_CHAVE_ACESSO_CTE,'
      '  TB_CONHECIMENTO.DESC_CHAVE_ACESSO_REF,'
      '  1 as TIPO_PAGAMENTO,'
      
        '  TB_CONHECIMENTO.VAL_FRETE + TB_CONHECIMENTO.VAL_PEDAGIO + TB_C' +
        'ONHECIMENTO.VAL_SEGURO AS VAL_TOTAL,'
      
        '  DECODE(VAL_ICMS,0,0,TB_CONHECIMENTO.VAL_FRETE + NVL(TB_CONHECI' +
        'MENTO.VAL_SEGURO,0)) AS VAL_BASE_CALCULO,'
      '  TB_CONHECIMENTO.VAL_ICMS,'
      
        '  DECODE(VAL_ICMS,0,TB_CONHECIMENTO.VAL_PEDAGIO + TB_CONHECIMENT' +
        'O.VAL_SEGURO,TB_CONHECIMENTO.VAL_FRETE + TB_CONHECIMENTO.VAL_PED' +
        'AGIO + TB_CONHECIMENTO.VAL_SEGURO) AS VAL_NAO_TRIBUTADO,'
      
        '  CAST(NVL(TB_CONHECIMENTO.IND_TIPO_CTE,'#39#39')AS VARCHAR2(1)) AS IN' +
        'D_TIPO_CTE,'
      '  0 AS VAL_PIS,'
      '  0 AS VAL_COFINS,'
      '  TB_OPERACAO.IND_TIPO_OPERACAO,'
      '  TB_OPERACAO.IND_EMITE,'
      
        '  NVL(TB_TRIBUTACAO.DESC_SITUACAO_TRIB,TB_TRIBUTACAO.DESC_CSOSN)' +
        ' AS CST_ICMS,'
      '  TB_TRIBUTACAO.PERC_ALIQUOTA AS ALIQ_ICMS,'
      
        '  cast(DECODE(TB_CADASTRO.COD_ESTADO, TB_FILIAL.COD_ESTADO, TB_O' +
        'PERACAO.NUM_NATUREZA_EST_NOVO, TB_OPERACAO.NUM_NATUREZA_INT_NOVO' +
        ') as number(4)) + 0.00 AS CFOP,'
      '  '#39'C'#39' as TIPO,'
      
        '  (SELECT COD_UF_IBGE FROM TB_ESTADO WHERE COD_ESTADO = TB_CONHE' +
        'CIMENTO.COD_UF_ORIGEM)'
      
        '    || (SELECT COD_CIDADE_IBGE FROM TB_CIDADE WHERE COD_CIDADE =' +
        ' TB_CONHECIMENTO.COD_CIDADE_ORIGEM) AS COD_MUN_ORIG,'
      
        '  (SELECT COD_UF_IBGE FROM TB_ESTADO WHERE COD_ESTADO = TB_CONHE' +
        'CIMENTO.COD_UF_DESTINO)'
      
        '    || (SELECT COD_CIDADE_IBGE FROM TB_CIDADE WHERE COD_CIDADE =' +
        ' TB_CONHECIMENTO.COD_CIDADE_DESTINO) AS COD_MUN_DEST'
      'FROM'
      '  TB_CONHECIMENTO,'
      '  TB_CADASTRO,'
      '  TB_OPERACAO,'
      '  TB_TRIBUTACAO,'
      '  TB_FILIAL,'
      '  TB_SERIE'
      'WHERE'
      '  TB_CONHECIMENTO.COD_SERIE = TB_SERIE.COD_SERIE'
      '  AND'
      '  TB_CONHECIMENTO.COD_FILIAL = TB_SERIE.COD_FILIAL'
      '  AND'
      '  TB_CONHECIMENTO.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO'
      '  AND'
      '  TB_CONHECIMENTO.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '  AND'
      '  TB_CONHECIMENTO.COD_TRIBUTACAO = TB_TRIBUTACAO.COD_TRIBUTACAO'
      '  AND'
      '  TB_CONHECIMENTO.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      '  and'
      
        '  TB_CADASTRO.COD_CADASTRO = TB_CONHECIMENTO.COD_CADASTRO_TOMADO' +
        'R'
      '  AND'
      '  TB_CONHECIMENTO.IND_SITUACAO <> '#39'1'#39
      '  AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      '  AND'
      
        '  TB_SERIE.COD_SERIE_MODELO IN ('#39'07'#39','#39'08'#39', '#39'8B'#39', '#39'09'#39', '#39'10'#39', '#39'11' +
        #39', '#39'26'#39', '#39'27'#39', '#39'57'#39')    '
      '  AND'
      '  TB_CONHECIMENTO.DT_RECEBIMENTO >= :DT_INICIAL'
      '  AND'
      '  TB_CONHECIMENTO.DT_RECEBIMENTO <= :DT_FINAL'
      '  and'
      '  TB_CONHECIMENTO.COD_FILIAL = :COD_FILIAL')
    Variables.Data = {
      0300000003000000090000003A44545F46494E414C0C00000000000000000000
      000B0000003A434F445F46494C49414C0300000000000000000000000B000000
      3A44545F494E494349414C0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001D0000000C000000434F445F434144415354524F0100000000000C00
      0000494E445F534954554143414F010000000000100000004E554D5F434F4E48
      4543494D454E544F0100000000000A00000044545F454D495353414F01000000
      00000E00000044545F5245434542494D454E544F010000000000090000005641
      4C5F46524554450100000000000C00000056414C5F444553434F4E544F010000
      0000000E0000005449504F5F504147414D454E544F0100000000000900000056
      414C5F544F54414C0100000000001000000056414C5F424153455F43414C4355
      4C4F0100000000000800000056414C5F49434D53010000000000110000005641
      4C5F4E414F5F54524942555441444F0100000000000700000056414C5F504953
      0100000000000A00000056414C5F434F46494E5301000000000010000000434F
      445F434F4E484543494D454E544F01000000000011000000494E445F5449504F
      5F4F5045524143414F010000000000080000004353545F49434D530100000000
      0009000000414C49515F49434D530100000000000400000043464F5001000000
      000009000000494E445F454D495445010000000000040000005449504F010000
      000000100000004E554D5F53455249455F46495343414C010000000000100000
      00434F445F53455249455F4D4F44454C4F01000000000015000000444553435F
      43484156455F41434553534F5F4354450100000000000C000000494E445F5449
      504F5F43544501000000000009000000434F445F53455249450100000000000C
      000000434F445F4D554E5F4F5249470100000000000C000000434F445F4D554E
      5F4445535401000000000015000000444553435F43484156455F41434553534F
      5F524546010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QReg100CalcFields
    Left = 56
    Top = 40
    object QReg100COD_CADASTRO: TFloatField
      FieldName = 'COD_CADASTRO'
    end
    object QReg100IND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 1
    end
    object QReg100NUM_CONHECIMENTO: TFloatField
      FieldName = 'NUM_CONHECIMENTO'
    end
    object QReg100DT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QReg100DT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
    end
    object QReg100VAL_FRETE: TFloatField
      FieldName = 'VAL_FRETE'
    end
    object QReg100VAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
    end
    object QReg100TIPO_PAGAMENTO: TFloatField
      FieldName = 'TIPO_PAGAMENTO'
    end
    object QReg100VAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QReg100VAL_BASE_CALCULO: TFloatField
      FieldName = 'VAL_BASE_CALCULO'
    end
    object QReg100VAL_ICMS: TFloatField
      FieldName = 'VAL_ICMS'
    end
    object QReg100VAL_NAO_TRIBUTADO: TFloatField
      FieldName = 'VAL_NAO_TRIBUTADO'
    end
    object QReg100VAL_PIS: TFloatField
      FieldName = 'VAL_PIS'
    end
    object QReg100VAL_COFINS: TFloatField
      FieldName = 'VAL_COFINS'
    end
    object QReg100COD_CONHECIMENTO: TFloatField
      FieldName = 'COD_CONHECIMENTO'
    end
    object QReg100IND_TIPO_OPERACAO: TStringField
      FieldName = 'IND_TIPO_OPERACAO'
      Size = 1
    end
    object QReg100CST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Size = 3
    end
    object QReg100ALIQ_ICMS: TFloatField
      FieldName = 'ALIQ_ICMS'
    end
    object QReg100CFOP: TFloatField
      FieldName = 'CFOP'
    end
    object QReg100IND_EMITE: TStringField
      FieldName = 'IND_EMITE'
      Size = 1
    end
    object QReg100val_servico: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_servico'
      Calculated = True
    end
    object QReg100TIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object QReg100NUM_SERIE_FISCAL: TFloatField
      FieldName = 'NUM_SERIE_FISCAL'
    end
    object QReg100COD_SERIE_MODELO: TStringField
      FieldName = 'COD_SERIE_MODELO'
      Size = 2
    end
    object QReg100DESC_CHAVE_ACESSO_CTE: TStringField
      FieldName = 'DESC_CHAVE_ACESSO_CTE'
      Size = 47
    end
    object QReg100IND_TIPO_CTE: TStringField
      FieldName = 'IND_TIPO_CTE'
      Size = 1
    end
    object QReg100COD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Size = 3
    end
    object QReg100COD_MUN_ORIG: TStringField
      FieldName = 'COD_MUN_ORIG'
      Size = 45
    end
    object QReg100COD_MUN_DEST: TStringField
      FieldName = 'COD_MUN_DEST'
      Size = 45
    end
    object QReg100DESC_CHAVE_ACESSO_REF: TStringField
      FieldName = 'DESC_CHAVE_ACESSO_REF'
      Size = 44
    end
  end
  object QReg130: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  TB_CIDADE.COD_CIDADE_IBGE AS COD_CIDADE_IBGE_ORIGEM,'
      '  TB_ESTADO.COD_UF_IBGE + 0.00 AS COD_UF_IBGE_ORIGEM,'
      '  TB_CIDADE1.COD_CIDADE_IBGE AS COD_CIDADE_IBGE_DESTINO,'
      '  TB_ESTADO1.COD_UF_IBGE + 0.00 AS COD_UF_IBGE_DESTINO,'
      '  TB_CONHECIMENTO.DESC_PLACA,'
      
        '  TB_CONHECIMENTO.VAL_FRETE + NVL(TB_CONHECIMENTO.VAL_PEDAGIO,0)' +
        ' + NVL(TB_CONHECIMENTO.VAL_SEGURO,0) AS VAL_LIQUIDO,'
      '  TB_CONHECIMENTO.VAL_PEDAGIO,'
      
        '  TB_CONHECIMENTO.VAL_FRETE + NVL(TB_CONHECIMENTO.VAL_PEDAGIO,0)' +
        ' + NVL(TB_CONHECIMENTO.VAL_SEGURO,0) AS VAL_FRETE'
      'From'
      '  TB_CONHECIMENTO,'
      '  TB_CIDADE,'
      '  TB_CIDADE TB_CIDADE1,'
      '  TB_FILIAL,'
      '  TB_CADASTRO,'
      '  TB_ESTADO,'
      '  TB_ESTADO TB_ESTADO1'
      'WHERE'
      '  TB_CONHECIMENTO.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      '  TB_CONHECIMENTO.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      '  AND'
      '  TB_CONHECIMENTO.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  TB_CADASTRO.COD_CIDADE = TB_CIDADE.COD_CIDADE'
      '  AND'
      '  TB_FILIAL.COD_CIDADE = TB_CIDADE1.COD_CIDADE'
      '  AND'
      '  TB_ESTADO.COD_ESTADO = TB_CIDADE.COD_ESTADO'
      '  AND'
      '  TB_ESTADO1.COD_ESTADO = TB_CIDADE1.COD_ESTADO'
      '  AND'
      '  TB_CONHECIMENTO.COD_CONHECIMENTO = :COD_CONHECIMENTO'
      ''
      'UNION ALL'
      ''
      'Select'
      '  TB_CIDADE.COD_CIDADE_IBGE AS COD_CIDADE_IBGE_ORIGEM,'
      '  TB_ESTADO.COD_UF_IBGE + 0.00 AS COD_UF_IBGE_ORIGEM,'
      '  TB_CIDADE1.COD_CIDADE_IBGE AS COD_CIDADE_IBGE_DESTINO,'
      '  TB_ESTADO1.COD_UF_IBGE + 0.00 AS COD_UF_IBGE_DESTINO,'
      '  TB_CONHECIMENTO_FRETE.DESC_PLACA,'
      
        '  TB_CONHECIMENTO_FRETE.VAL_FRETE + TB_CONHECIMENTO_FRETE.VAL_PE' +
        'DAGIO AS VAL_LIQUIDO,'
      '  TB_CONHECIMENTO_FRETE.VAL_PEDAGIO,'
      
        '  TB_CONHECIMENTO_FRETE.VAL_FRETE + TB_CONHECIMENTO_FRETE.VAL_PE' +
        'DAGIO AS VAL_FRETE'
      'From'
      '  TB_CONHECIMENTO_FRETE,'
      '  TB_CIDADE,'
      '  TB_CIDADE TB_CIDADE1,'
      '  TB_FILIAL,'
      '  TB_CADASTRO,'
      '  TB_ESTADO,'
      '  TB_ESTADO TB_ESTADO1'
      'WHERE'
      '  TB_CONHECIMENTO_FRETE.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      '  TB_CONHECIMENTO_FRETE.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      '  AND'
      '  TB_CADASTRO.COD_CIDADE = TB_CIDADE.COD_CIDADE'
      '  AND'
      '  TB_FILIAL.COD_CIDADE = TB_CIDADE1.COD_CIDADE'
      '  AND'
      '  TB_ESTADO.COD_ESTADO = TB_CIDADE.COD_ESTADO'
      '  AND'
      '  TB_ESTADO1.COD_ESTADO = TB_CIDADE1.COD_ESTADO'
      '  AND'
      '  TB_CONHECIMENTO_FRETE.IND_SITUACAO = '#39'2'#39
      '  AND'
      
        '  TB_CONHECIMENTO_FRETE.COD_CONHECIMENTO_FRETE = :COD_CONHECIMEN' +
        'TO'
      ''
      'union all'
      ''
      'SELECT'
      '  CID1.COD_CIDADE_IBGE,'
      '  UF1.COD_UF_IBGE,'
      '  CID2.COD_CIDADE_IBGE,'
      '  UF2.COD_UF_IBGE,'
      '  '#39#39','
      '  SUM(I.VAL_TOTAL + I.VAL_DESPESAS - I.VAL_DESCONTO),'
      '  0,'
      '  SUM(I.VAL_TOTAL + I.VAL_DESPESAS - I.VAL_DESCONTO)'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_FILIAL ON N.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      
        'INNER JOIN TB_CADASTRO ON N.COD_CADASTRO = TB_CADASTRO.COD_CADAS' +
        'TRO'
      
        'INNER JOIN TB_CIDADE CID1 ON CID1.COD_CIDADE = TB_CADASTRO.COD_C' +
        'IDADE'
      
        'INNER JOIN TB_CIDADE CID2 ON CID2.COD_CIDADE = TB_FILIAL.COD_CID' +
        'ADE'
      
        'INNER JOIN TB_ESTADO UF1 ON UF1.COD_ESTADO = TB_CADASTRO.COD_EST' +
        'ADO'
      
        'INNER JOIN TB_ESTADO UF2 ON UF2.COD_ESTADO = TB_FILIAL.COD_ESTAD' +
        'O'
      'WHERE'
      '  N.IND_SITUACAO <> '#39'1'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  O.NUM_LIVROS = 10'
      'AND'
      '  N.COD_NOTA_CAB = :COD_CONHECIMENTO'
      'GROUP BY'
      '  CID1.COD_CIDADE_IBGE,'
      '  UF1.COD_UF_IBGE,'
      '  CID2.COD_CIDADE_IBGE,'
      '  UF2.COD_UF_IBGE')
    Variables.Data = {
      0300000001000000110000003A434F445F434F4E484543494D454E544F030000
      000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000A000000444553435F504C4143410100000000000B000000
      56414C5F4C49515549444F0100000000000B00000056414C5F5045444147494F
      0100000000000900000056414C5F465245544501000000000016000000434F44
      5F4349444144455F494247455F4F524947454D01000000000012000000434F44
      5F55465F494247455F4F524947454D01000000000017000000434F445F434944
      4144455F494247455F44455354494E4F01000000000013000000434F445F5546
      5F494247455F44455354494E4F010000000000}
    Session = DMOracle.DBCemapa
    Left = 136
    Top = 40
    object QReg130COD_CIDADE_IBGE_ORIGEM: TStringField
      FieldName = 'COD_CIDADE_IBGE_ORIGEM'
      Size = 5
    end
    object QReg130COD_UF_IBGE_ORIGEM: TFloatField
      FieldName = 'COD_UF_IBGE_ORIGEM'
    end
    object QReg130COD_CIDADE_IBGE_DESTINO: TStringField
      FieldName = 'COD_CIDADE_IBGE_DESTINO'
      Size = 5
    end
    object QReg130COD_UF_IBGE_DESTINO: TFloatField
      FieldName = 'COD_UF_IBGE_DESTINO'
    end
    object QReg130DESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Size = 10
    end
    object QReg130VAL_LIQUIDO: TFloatField
      FieldName = 'VAL_LIQUIDO'
    end
    object QReg130VAL_PEDAGIO: TFloatField
      FieldName = 'VAL_PEDAGIO'
    end
    object QReg130VAL_FRETE: TFloatField
      FieldName = 'VAL_FRETE'
    end
  end
  object QReg500: TOracleDataSet1
    SQL.Strings = (
      'Select distinct'
      '  TB_NOTA_CAB.COD_NOTA_CAB,'
      '  Tb_Nota_Cab.Cod_Cadastro Cod_Part,'
      '  22 as Cod_Mod,'
      '  Tb_Nota_Cab.Ind_Situacao as Cod_Sit,'
      '  Tb_Nota_Cab.Cod_Serie AS Ser,'
      '  Tb_Nota_Cab.Num_Nota + 0.00 as Num_Doc,'
      '  Tb_Nota_Cab.Dt_Emissao as Dt_Doc,'
      '  Tb_Nota_Cab.Dt_Recebimento as Dt_A_P,'
      '  Tb_Nota_Item.Val_Total as Val_Doc,'
      '  Tb_Nota_Item.Val_Total as Val_Serv,'
      '  tb_nota_item.val_icm_base as vl_bc_icms,'
      '  Tb_Nota_Item.Val_Icm as Vl_Icms,'
      '  TB_SERIE.NUM_SERIE_FISCAL,'
      '  TB_SERIE.COD_SERIE'
      'From'
      '  Tb_Nota_Cab,'
      '  Tb_Nota_Item,'
      '  Tb_Operacao,'
      '  TB_SERIE'
      'Where'
      '  Tb_Nota_Cab.COD_NOTA_CAB = Tb_Nota_Item.COD_NOTA_CAB'
      '  And'
      '  Tb_Nota_Cab.COD_OPERACAO = Tb_Operacao.COD_OPERACAO'
      '  And'
      
        '  ((TB_NOTA_CAB.COD_SERIE = TB_SERIE.COD_SERIE) AND (TB_NOTA_CAB' +
        '.COD_FILIAL = TB_SERIE.COD_FILIAL)'
      
        '    AND (TB_NOTA_CAB.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODEL' +
        'O))'
      '  And'
      '  Tb_Nota_Cab.IND_SITUACAO <> '#39'1'#39
      '  And'
      '  Tb_Operacao.IND_TELECOMUNICACAO = '#39'S'#39
      '  And'
      '  Tb_Nota_Cab.COD_FILIAL = :COD_FILIAL'
      '  And'
      '  Tb_Nota_Cab.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      '  AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39)
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      0000000B0000003A44545F494E494349414C0C00000000000000000000000900
      00003A44545F46494E414C0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E00000008000000434F445F5041525401000000000007000000434F
      445F4D4F4401000000000007000000434F445F53495401000000000003000000
      534552010000000000070000004E554D5F444F43010000000000060000004454
      5F444F430100000000000600000044545F415F50010000000000070000005641
      4C5F444F430100000000000800000056414C5F53455256010000000000070000
      00564C5F49434D53010000000000100000004E554D5F53455249455F46495343
      414C0100000000000A000000564C5F42435F49434D530100000000000C000000
      434F445F4E4F54415F43414201000000000009000000434F445F534552494501
      0000000000}
    Session = DMOracle.DBCemapa
    Left = 208
    Top = 40
    object QReg500COD_PART: TIntegerField
      FieldName = 'COD_PART'
      Required = True
    end
    object QReg500COD_MOD: TFloatField
      FieldName = 'COD_MOD'
    end
    object QReg500COD_SIT: TStringField
      FieldName = 'COD_SIT'
      Required = True
      Size = 1
    end
    object QReg500SER: TStringField
      FieldName = 'SER'
      Required = True
      Size = 3
    end
    object QReg500DT_DOC: TDateTimeField
      FieldName = 'DT_DOC'
      Required = True
    end
    object QReg500DT_A_P: TDateTimeField
      FieldName = 'DT_A_P'
    end
    object QReg500VAL_DOC: TFloatField
      FieldName = 'VAL_DOC'
      Required = True
    end
    object QReg500VAL_SERV: TFloatField
      FieldName = 'VAL_SERV'
      Required = True
    end
    object QReg500VL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
      Required = True
    end
    object QReg500NUM_SERIE_FISCAL: TIntegerField
      FieldName = 'NUM_SERIE_FISCAL'
    end
    object QReg500NUM_DOC: TFloatField
      FieldName = 'NUM_DOC'
    end
    object QReg500VL_BC_ICMS: TFloatField
      FieldName = 'VL_BC_ICMS'
      Required = True
    end
    object QReg500COD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QReg500COD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
  end
  object QReg590: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  Tb_Tributacao.Desc_Situacao_Trib as Cst_Icms,'
      '  DECODE(TB_FILIAL.COD_ESTADO,'
      
        '            TB_NOTA_CAB.COD_ESTADO,TB_OPERACAO.NUM_NATUREZA_EST_' +
        'NOVO,'
      '            NUM_NATUREZA_INT_NOVO) AS CfOP,'
      '  Tb_Tributacao.Perc_Aliquota as Aliq_Icms,'
      '  Sum(Tb_Nota_Item.Val_Total) as Vl_Opr,'
      '  Sum(Tb_Nota_Item.Val_Icm_Base) as Vl_Bc_Icms,'
      '  Sum(Tb_Nota_Item.Val_Icm) as Vl_Icms,'
      '  Sum(Tb_Nota_Item.Val_Base_Subst) as Vl_Bc_Icms_St,'
      '  Sum(Tb_Nota_Item.Val_Icms_Subst) as Vl_Icms_St,'
      
        '  ABS(Sum(Tb_Nota_Item.Val_Total - Tb_Nota_Item.Val_Icm_Base)) a' +
        's Vl_Red_Bc'
      'From'
      '  Tb_Nota_Cab,'
      '  Tb_Nota_Item,'
      '  Tb_Operacao,'
      '  Tb_Filial,'
      '  Tb_Tributacao'
      'Where'
      '  Tb_Nota_Cab.COD_NOTA_CAB = Tb_Nota_Item.COD_NOTA_CAB'
      '  And'
      
        '  tb_operacao.cod_operacao = decode(tb_nota_item.cod_operacao, n' +
        'ull, tb_nota_cab.cod_operacao, tb_nota_item.cod_operacao)'
      '  --Tb_Nota_Cab.COD_OPERACAO = Tb_Nota_Item.COD_OPERACAO'
      '  And'
      '  Tb_Nota_Cab.COD_FILIAL = Tb_Filial.COD_FILIAL'
      '  And'
      '  Tb_Nota_Item.COD_TRIBUTACAO = Tb_Tributacao.COD_TRIBUTACAO'
      '  And'
      '  TB_NOTA_CAB.COD_NOTA_CAB = :COD_NOTA'
      '  --And'
      '  --Tb_Nota_Cab.IND_SITUACAO <> '#39'1'#39
      '  --And'
      '  --Tb_Operacao.IND_TELECOMUNICACAO = '#39'S'#39
      '  --AND'
      '  --TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      '  --And'
      '  --Tb_Nota_Cab.COD_FILIAL = :COD_FILIAL'
      '  --And'
      '  --Tb_Nota_Cab.DT_RECEBIMENTO BETWEEN :DT_INICIAL AND :DT_FINAL'
      'Group By'
      '  Tb_Tributacao.Desc_Situacao_Trib,'
      '  DECODE(TB_FILIAL.COD_ESTADO,'
      
        '            TB_NOTA_CAB.COD_ESTADO,TB_OPERACAO.NUM_NATUREZA_EST_' +
        'NOVO,'
      '            NUM_NATUREZA_INT_NOVO),'
      '  Tb_Tributacao.Perc_Aliquota')
    Variables.Data = {
      0300000001000000090000003A434F445F4E4F54410300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000900000007000000564C5F49434D5301000000000008000000435354
      5F49434D530100000000000400000043464F5001000000000009000000414C49
      515F49434D5301000000000006000000564C5F4F50520100000000000A000000
      564C5F42435F49434D530100000000000D000000564C5F42435F49434D535F53
      540100000000000A000000564C5F49434D535F53540100000000000900000056
      4C5F5245445F4243010000000000}
    Session = DMOracle.DBCemapa
    Left = 288
    Top = 40
    object QReg590CST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Size = 3
    end
    object QReg590CFOP: TFloatField
      FieldName = 'CFOP'
    end
    object QReg590ALIQ_ICMS: TFloatField
      FieldName = 'ALIQ_ICMS'
      Required = True
    end
    object QReg590VL_OPR: TFloatField
      FieldName = 'VL_OPR'
    end
    object QReg590VL_BC_ICMS: TFloatField
      FieldName = 'VL_BC_ICMS'
    end
    object QReg590VL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
    end
    object QReg590VL_BC_ICMS_ST: TFloatField
      FieldName = 'VL_BC_ICMS_ST'
    end
    object QReg590VL_ICMS_ST: TFloatField
      FieldName = 'VL_ICMS_ST'
    end
    object QReg590VL_RED_BC: TFloatField
      FieldName = 'VL_RED_BC'
    end
  end
  object QAux100: TOracleDataSet1
    SQL.Strings = (
      'select'
      
        '--  sum(xi.VAL_TOTAL + xi.VAL_DESPESAS - xi.VAL_DESCONTO) as val' +
        'or'
      
        '  SUM(xI.VAL_TOTAL + (case when xN.VAL_DESPESAS > 0 then xI.VAL_' +
        'DESPESAS else 0 end) - (case when xN.VAL_DESCONTO > 0 then xI.VA' +
        'L_DESCONTO else 0 end)) as valor'
      'from'
      '  tb_nota_item xi'
      'inner join tb_nota_cab xn on xn.cod_nota_cab = xi.cod_nota_cab'
      'inner join tb_produto xp on xp.cod_produto = xi.cod_produto'
      'where'
      '  xp.ind_tipo_produto = '#39'SERVI'#199'O'#39
      'and'
      '  xi.cod_nota_cab = :cod_nota_cab')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000500000056414C4F52010000000000}
    Session = DMOracle.DBCemapa
    Left = 56
    Top = 96
    object QAux100VALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
end
