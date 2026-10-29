object DmBlocoC: TDmBlocoC
  OldCreateOrder = False
  Left = 675
  Top = 222
  Height = 312
  Width = 526
  object QReg100: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_NOTA_CAB,'
      '  IND_ENTRADA_SAIDA,'
      '  IND_CONDICAO_PAGTO,'
      '  NUM_NOTA,'
      '  DT_EMISSAO,'
      '  DT_RECEBIMENTO,'
      '  DT_MOVIMENTO,'
      '  VAL_AVISTA,'
      '  VAL_IMPOSTO,'
      '  COD_CADASTRO,'
      '  COD_SERIE,'
      '  DESC_CHAVE_ACESSO,'
      '  VAL_DESCONTO,'
      '  IND_TIPO_FRETE,'
      '  VAL_FRETE,'
      '  VAL_DESPESAS,'
      '  IND_SITUACAO,'
      '  IND_EMITE,'
      '  COD_SERIE_MODELO,'
      '  QT_FATURAS,'
      '  NUM_SERIE_FISCAL,'
      '  NUM_CGC_CPF,'
      '  SUM(VAL_CONFINS) as VAL_CONFINS,'
      '  SUM(VAL_ICM_BASE) as VAL_ICM_BASE,'
      '  SUM(VAL_ICM) as VAL_ICM,'
      '  SUM(VAL_IPI) as VAL_IPI,'
      '  SUM(VAL_PIS) as VAL_PIS,'
      '  SUM(VAL_TOTAL) AS VAL_TOTAL,'
      '  SUM(VAL_MERCADORIAS) AS VAL_MERCADORIAS,'
      '  SUM(VAL_BASE_SUBST) AS VAL_BASE_SUBST,'
      '  SUM(VAL_ICMS_SUBST) AS VAL_ICMS_SUBST,'
      '  COD_CFOP_INT_ST,'
      '  COD_CFOP_ST'
      'FROM('
      '    SELECT'
      '      N.COD_NOTA_CAB,'
      '      N.IND_ENTRADA_SAIDA,'
      '      N.IND_CONDICAO_PAGTO,'
      '      N.NUM_NOTA + 0.00 AS NUM_NOTA,'
      '      N.DT_EMISSAO,'
      '      N.DT_RECEBIMENTO,'
      '      N.DT_MOVIMENTO,'
      '      N.VAL_AVISTA,'
      '      N.VAL_IMPOSTO,'
      '      N.COD_CADASTRO,'
      '      N.COD_SERIE,'
      '      CASE'
      '        WHEN N.COD_SERIE_MODELO IN ('#39'55'#39', '#39'65'#39') THEN'
      '          N.DESC_CHAVE_ACESSO'
      '        ELSE'
      '          NULL'
      '      END AS DESC_CHAVE_ACESSO,'
      '      DECODE(PS.COD_EMPRESA, '#39'BEGNINI'#39', N.VAL_DESCONTO,'
      '        PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) AS VAL_DESCONTO,'
      
        '    --  (case when N.VAL_DESCONTO > 0 then SUM(I.VAL_DESCONTO) e' +
        'lse 0 end) AS VAL_DESCONTO,'
      '      N.IND_TIPO_FRETE,'
      '    --  N.VAL_FRETE,'
      
        '      (CASE WHEN ((N.NUM_CONHECIMENTO_FRETE IS NOT NULL) AND (N.' +
        'IND_ENTRADA_SAIDA = '#39'E'#39') AND (N.IND_TIPO_FRETE = '#39'FOB'#39')) THEN 0.' +
        '00 ELSE N.VAL_FRETE END) AS VAL_FRETE,'
      '      N.VAL_DESPESAS,'
      
        '    --  (case when N.VAL_DESPESAS > 0 then SUM(I.VAL_DESPESAS) e' +
        'lse 0 end) AS VAL_DESPESAS,'
      '      N.IND_SITUACAO,'
      '      O.IND_EMITE,'
      '      TB_SERIE.COD_SERIE_MODELO,'
      
        '      decode(N.IND_ENTRADA_SAIDA, '#39'S'#39', (select count(*) from tb_' +
        'conta_receber_cab cr where cr.cod_nota_cab = n.cod_nota_cab), (s' +
        'elect count(*) from tb_conta_pagar_cab cp where cp.cod_nota_cab ' +
        '= n.cod_nota_cab)) as QT_FATURAS,'
      '      TB_SERIE.NUM_SERIE_FISCAL,'
      '      LIMPA_CNPJ(C.NUM_CGC_CPF) AS NUM_CGC_CPF,'
      '      SUM(I.VAL_CONFINS) as VAL_CONFINS,'
      '      SUM(I.VAL_ICM_BASE) as VAL_ICM_BASE,'
      '      SUM(I.VAL_ICM) as VAL_ICM,'
      
        '      SUM(CASE WHEN (I.COD_CST_IPI IN ('#39'00'#39', '#39'50'#39', '#39'99'#39', '#39'49'#39')) ' +
        'THEN I.VAL_IPI ELSE 0 END) as VAL_IPI,'
      '      SUM(I.VAL_PIS) as VAL_PIS,'
      
        '    --  SUM(I.VAL_TOTAL + (case when N.VAL_DESPESAS > 0 then I.V' +
        'AL_DESPESAS else 0 end) - (case when N.VAL_DESCONTO > 0 then I.V' +
        'AL_DESCONTO else 0 end)) as VAL_TOTAL,'
      '    --  SUM(I.VAL_TOTAL),'
      
        '    --  SUM(I.VAL_TOTAL) + N.VAL_DESPESAS - N.VAL_DESCONTO AS VA' +
        'L_TOTAL,'
      '      DECODE(PS.COD_EMPRESA, '#39'CGS'#39', '
      
        '      (SUM(I.VAL_TOTAL) + N.VAL_DESPESAS + (CASE WHEN ((N.NUM_CO' +
        'NHECIMENTO_FRETE IS NOT NULL) AND (N.IND_ENTRADA_SAIDA = '#39'E'#39') AN' +
        'D (N.IND_TIPO_FRETE = '#39'FOB'#39')) THEN 0.00 ELSE N.VAL_FRETE END) + ' +
        'SUM(I.VAL_ICMS_SUBST) + SUM(CASE WHEN (I.COD_CST_IPI IN ('#39'00'#39', '#39 +
        '50'#39')) THEN I.VAL_IPI ELSE 0 END) - N.VAL_DESCONTO),'
      '      '
      
        '      (SUM(I.VAL_TOTAL) + SUM(I.VAL_DESPESAS) - SUM(PEGA_DESCONT' +
        'O_ITEM(I.COD_NOTA_ITEM)) +'
      
        '        -- C'#211'DIGO INSERIDO PARA N'#195'O CONSIDERAR ST DE NOTAS COM S' +
        'UBSTITUI'#199#195'O TRIBUT'#193'RIA CALCULADA ANTERIORMENTE NO COMPRAS'
      '        CASE'
      
        '            WHEN ((T.DESC_SITUACAO_TRIB LIKE '#39'%60'#39' OR T.DESC_CSO' +
        'SN LIKE '#39'500'#39')'
      
        '            AND (C.IND_FISICA_JURIDICA = '#39'J'#39' AND C.NUM_INSCRICAO' +
        ' IS NOT NULL AND C.NUM_INSCRICAO <> '#39'ISENTO'#39
      '            AND C.IND_CONTRIBUINTE = '#39'SIM'#39')) THEN    '
      '                0 '
      '            ELSE            '
      '                SUM(I.VAL_ICMS_SUBST) '
      '        END'
      
        '        + SUM(CASE WHEN (I.COD_CST_IPI IN ('#39'00'#39', '#39'50'#39', '#39'99'#39', '#39'49' +
        #39')) THEN I.VAL_IPI ELSE 0 END))'
      '      '
      '      ) AS VAL_TOTAL,'
      '      '
      '      SUM(I.VAL_TOTAL) as VAL_MERCADORIAS,'
      
        '      --DECODE(N.IND_ST, '#39'S'#39', SUM(I.VAL_BASE_SUBST), 0.00) as VA' +
        'L_BASE_SUBST,'
      
        '      --DECODE(N.IND_ST, '#39'S'#39', SUM(I.VAL_ICMS_SUBST), 0.00) as VA' +
        'L_ICMS_SUBST'
      '      /*'
      '      SUM(CASE '
      
        '        WHEN T.DESC_SITUACAO_TRIB IN ('#39'010'#39','#39'030'#39','#39'060'#39','#39'070'#39') T' +
        'HEN I.VAL_BASE_SUBST'
      
        '        WHEN T.DESC_CSOSN IN ('#39'201'#39','#39'202'#39','#39'203'#39','#39'500'#39') THEN I.VA' +
        'L_BASE_SUBST'
      '      END) AS VAL_BASE_SUBST,'
      '      SUM(CASE '
      
        '        WHEN T.DESC_SITUACAO_TRIB IN ('#39'010'#39','#39'030'#39','#39'060'#39','#39'070'#39') T' +
        'HEN I.VAL_ICMS_SUBST'
      
        '        WHEN T.DESC_CSOSN IN ('#39'201'#39','#39'202'#39','#39'203'#39','#39'500'#39') THEN I.VA' +
        'L_ICMS_SUBST'
      '      END) AS VAL_ICMS_SUBST'
      '      */'
      '      SUM(I.VAL_BASE_SUBST) AS VAL_BASE_SUBST,'
      '      SUM(I.VAL_ICMS_SUBST) AS VAL_ICMS_SUBST,'
      '      O.COD_CFOP_INT_ST,'
      '      O.COD_CFOP_ST'
      '    FROM'
      '      TB_NOTA_ITEM I'
      '    INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      '    INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        '    INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND' +
        ' TB_SERIE.COD_FILIAL = N.COD_FILIAL'
      '        AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      
        '    INNER JOIN TB_TRIBUTACAO T ON I.COD_TRIBUTACAO = T.COD_TRIBU' +
        'TACAO'
      '    INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      '    INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      '    WHERE'
      '      N.IND_SITUACAO NOT IN('#39'1'#39', '#39'4'#39', '#39'5'#39')'
      '    AND'
      '      O.IND_LIVRO_FISCAL = '#39'S'#39
      '    AND'
      '      (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '    AND'
      '      N.COD_FILIAL = :COD_FILIAL'
      '    and'
      
        '      ((N.IND_ENTRADA_SAIDA = '#39'E'#39' and N.DT_RECEBIMENTO between :' +
        'DATA_INI and :DATA_FIN)'
      '    or'
      
        '      (N.IND_ENTRADA_SAIDA = '#39'S'#39' and N.DT_EMISSAO between :DATA_' +
        'INI and :DATA_FIN))'
      '    AND  '
      '     ((TB_SERIE.COD_SERIE_MODELO in ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39')'
      '      OR'
      
        '      (TB_SERIE.COD_SERIE_MODELO = '#39'65'#39' AND N.IND_ENTRADA_SAIDA ' +
        '= '#39'S'#39'))'
      '      or'
      
        '      ((TB_SERIE.COD_SERIE_MODELO = '#39'65'#39') and (ps.cod_empresa = ' +
        #39'DAMBONI'#39') and (ind_entrada_saida = '#39'E'#39')))'
      '    GROUP BY'
      '      N.COD_NOTA_CAB,'
      '      N.VAL_FRETE,'
      '      PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '      N.IND_TIPO_FRETE,'
      '      N.IND_ENTRADA_SAIDA,'
      '      N.IND_CONDICAO_PAGTO,'
      '      N.NUM_NOTA,'
      '      N.DT_EMISSAO,'
      '      N.DT_RECEBIMENTO,'
      '      N.DT_MOVIMENTO,'
      '      N.VAL_DESPESAS,'
      '      N.VAL_AVISTA,'
      '      N.VAL_IMPOSTO,'
      '      N.COD_CADASTRO,'
      '      N.COD_SERIE,'
      '      CASE'
      '        WHEN N.COD_SERIE_MODELO IN ('#39'55'#39', '#39'65'#39') THEN'
      '          N.DESC_CHAVE_ACESSO'
      '        ELSE'
      '          NULL'
      '      END,'
      '      N.VAL_DESCONTO,'
      '      N.IND_TIPO_FRETE,'
      '      N.VAL_FRETE,'
      '      N.VAL_DESPESAS,'
      '      N.IND_SITUACAO,'
      '      O.IND_EMITE,'
      '      TB_SERIE.COD_SERIE_MODELO,'
      '      TB_SERIE.NUM_SERIE_FISCAL,'
      '      C.NUM_CGC_CPF,'
      '      N.NUM_CONHECIMENTO_FRETE,'
      '      N.IND_TIPO_FRETE,'
      '      PS.COD_EMPRESA,'
      '      O.IND_FIXAR_EMPRESA,'
      '      O.IND_FIXAR_OUTRAS_EMP,'
      '      O.IND_FIXAR_CONSUMO,'
      '      N.IND_ST,'
      '      '
      '      T.DESC_SITUACAO_TRIB,'
      '      T.DESC_CSOSN,'
      '      C.IND_FISICA_JURIDICA,'
      '      C.NUM_INSCRICAO,  '
      '      C.IND_CONTRIBUINTE,'
      '      O.COD_CFOP_INT_ST,'
      '      O.COD_CFOP_ST'
      ')'
      'GROUP BY'
      '  COD_NOTA_CAB,'
      '  IND_ENTRADA_SAIDA,'
      '  IND_CONDICAO_PAGTO,'
      '  NUM_NOTA,'
      '  DT_EMISSAO,'
      '  DT_RECEBIMENTO,'
      '  DT_MOVIMENTO,'
      '  VAL_AVISTA,'
      '  VAL_IMPOSTO,'
      '  COD_CADASTRO,'
      '  COD_SERIE,'
      '  DESC_CHAVE_ACESSO,'
      '  VAL_DESCONTO,'
      '  IND_TIPO_FRETE,'
      '  VAL_FRETE,'
      '  VAL_DESPESAS,'
      '  IND_SITUACAO,'
      '  IND_EMITE,'
      '  COD_SERIE_MODELO,'
      '  QT_FATURAS,'
      '  NUM_SERIE_FISCAL,'
      '  NUM_CGC_CPF,'
      '  COD_CFOP_INT_ST,'
      '  COD_CFOP_ST  '
      'ORDER BY'
      '  IND_ENTRADA_SAIDA desc,'
      '  DT_RECEBIMENTO'
      ' '
      ' ')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000210000000C000000434F445F4E4F54415F4341420100000000000900
      000056414C5F46524554450100000000000C00000056414C5F444553434F4E54
      4F0100000000000E000000494E445F5449504F5F465245544501000000000011
      000000494E445F454E54524144415F534149444101000000000012000000494E
      445F434F4E444943414F5F504147544F010000000000080000004E554D5F4E4F
      54410100000000000A00000044545F454D495353414F0100000000000E000000
      44545F5245434542494D454E544F0100000000000C00000056414C5F44455350
      455341530100000000000A00000056414C5F4156495354410100000000000B00
      000056414C5F494D504F53544F0100000000000C000000434F445F4341444153
      54524F01000000000009000000434F445F534552494501000000000011000000
      444553435F43484156455F41434553534F0100000000000C00000044545F4D4F
      56494D454E544F0100000000000B00000056414C5F434F4E46494E5301000000
      00000C00000056414C5F49434D5F424153450100000000000700000056414C5F
      49434D0100000000000700000056414C5F495049010000000000070000005641
      4C5F5049530100000000000F00000056414C5F4D45524341444F524941530100
      000000000C000000494E445F534954554143414F0100000000000E0000005641
      4C5F424153455F53554253540100000000000E00000056414C5F49434D535F53
      5542535401000000000009000000494E445F454D4954450100000000000A0000
      0051545F46415455524153010000000000100000004E554D5F53455249455F46
      495343414C0100000000000900000056414C5F544F54414C0100000000001000
      0000434F445F53455249455F4D4F44454C4F0100000000000B0000004E554D5F
      4347435F4350460100000000000F000000434F445F43464F505F494E545F5354
      0100000000000B000000434F445F43464F505F5354010000000000}
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 16
    object QReg100COD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QReg100IND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 1
    end
    object QReg100IND_CONDICAO_PAGTO: TStringField
      FieldName = 'IND_CONDICAO_PAGTO'
      Required = True
      Size = 1
    end
    object QReg100DT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QReg100DT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
    end
    object QReg100DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Required = True
    end
    object QReg100VAL_AVISTA: TFloatField
      FieldName = 'VAL_AVISTA'
    end
    object QReg100VAL_IMPOSTO: TFloatField
      FieldName = 'VAL_IMPOSTO'
    end
    object QReg100COD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QReg100COD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QReg100VAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
    end
    object QReg100IND_TIPO_FRETE: TStringField
      FieldName = 'IND_TIPO_FRETE'
      Size = 3
    end
    object QReg100VAL_FRETE: TFloatField
      FieldName = 'VAL_FRETE'
      Required = True
    end
    object QReg100VAL_DESPESAS: TFloatField
      FieldName = 'VAL_DESPESAS'
      Required = True
    end
    object QReg100VAL_CONFINS: TFloatField
      FieldName = 'VAL_CONFINS'
    end
    object QReg100VAL_ICM_BASE: TFloatField
      FieldName = 'VAL_ICM_BASE'
    end
    object QReg100VAL_ICM: TFloatField
      FieldName = 'VAL_ICM'
    end
    object QReg100VAL_IPI: TFloatField
      FieldName = 'VAL_IPI'
    end
    object QReg100VAL_PIS: TFloatField
      FieldName = 'VAL_PIS'
    end
    object QReg100VAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QReg100VAL_MERCADORIAS: TFloatField
      FieldName = 'VAL_MERCADORIAS'
    end
    object QReg100IND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Required = True
      Size = 1
    end
    object QReg100VAL_BASE_SUBST: TFloatField
      FieldName = 'VAL_BASE_SUBST'
    end
    object QReg100VAL_ICMS_SUBST: TFloatField
      FieldName = 'VAL_ICMS_SUBST'
    end
    object QReg100IND_EMITE: TStringField
      FieldName = 'IND_EMITE'
      Required = True
      Size = 1
    end
    object QReg100QT_FATURAS: TFloatField
      FieldName = 'QT_FATURAS'
    end
    object QReg100NUM_NOTA: TFloatField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QReg100DESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Size = 47
    end
    object QReg100COD_SERIE_MODELO: TStringField
      FieldName = 'COD_SERIE_MODELO'
      Required = True
      Size = 2
    end
    object QReg100NUM_CGC_CPF: TStringField
      FieldName = 'NUM_CGC_CPF'
      Size = 4000
    end
    object QReg100NUM_SERIE_FISCAL: TIntegerField
      FieldName = 'NUM_SERIE_FISCAL'
    end
    object QReg100COD_CFOP_INT_ST: TIntegerField
      FieldName = 'COD_CFOP_INT_ST'
    end
    object QReg100COD_CFOP_ST: TIntegerField
      FieldName = 'COD_CFOP_ST'
    end
  end
  object QReg110: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  M.COD_MENSAGEM,'
      '  trim(M.DESC_MENSAGEM) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO1) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO2) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO3) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO4) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO5) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO6) || '#39'   '#39' ||'
      '  trim(M.DESC_COMPLEMENTO7)'
      '  AS DESC_MENSAGEM,'
      
        '  REPLACE(N.Obs  || '#39'   '#39' || N.Obs_Complemento,CHR(10),'#39#39') as DE' +
        'SC_COMPLEMENTO'
      'FROM'
      '  TB_MENSAGEM M'
      'INNER JOIN TB_NOTA_CAB N ON M.COD_MENSAGEM = N.COD_MENSAGEM'
      
        'INNER JOIN TB_SERIE S ON (N.COD_SERIE = S.COD_SERIE AND N.COD_FI' +
        'LIAL = S.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = S.COD_SERIE_MODELO)'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'WHERE'
      '  N.COD_NOTA_CAB = :COD_NOTA_CAB'
      'AND'
      
        '  S.COD_SERIE_MODELO in ('#39'01'#39', '#39'1B'#39', '#39'04'#39', '#39'55'#39') AND O.IND_EMITE' +
        ' = '#39'F'#39
      '  AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'ORDER BY'
      '  M.COD_MENSAGEM')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000C000000434F445F4D454E534147454D0100000000000D00
      0000444553435F4D454E534147454D01000000000010000000444553435F434F
      4D504C454D454E544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 80
    Top = 16
    object QReg110COD_MENSAGEM: TIntegerField
      FieldName = 'COD_MENSAGEM'
      Required = True
    end
    object QReg110DESC_MENSAGEM: TStringField
      FieldName = 'DESC_MENSAGEM'
      Size = 60
    end
    object QReg110DESC_COMPLEMENTO: TStringField
      FieldName = 'DESC_COMPLEMENTO'
      Size = 501
    end
  end
  object QReg130: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  SUM(VAL_ISS) AS VAL_ISS'
      'FROM'
      '  TB_NOTA_ITEM'
      'WHERE'
      '  COD_NOTA_CAB = :COD_NOTA_CAB'
      'HAVING'
      '  SUM(VAL_ISS) > 0')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000700000056414C5F495353010000000000}
    Session = DMOracle.DBCemapa
    Left = 248
    Top = 16
    object QReg130VAL_ISS: TFloatField
      FieldName = 'VAL_ISS'
    end
  end
  object QReg140: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  NUM_TITULO,'
      '  QTD_PARCELAS,'
      '  VAL_TITULO'
      'FROM'
      '('
      '  SELECT'
      '    R.NUM_TITULO + 0.00 AS NUM_TITULO,'
      '    COUNT(*) + 0.00 AS QTD_PARCELAS,'
      '    SUM(R.VAL_ORIGINAL) AS VAL_TITULO'
      '  FROM'
      '    TB_CONTA_RECEBER_CAB R'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = R.COD_NOTA_CAB'
      
        'INNER JOIN TB_SERIE S ON (N.COD_SERIE = S.COD_SERIE AND N.COD_FI' +
        'LIAL = S.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = S.COD_SERIE_MODELO)'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      '  WHERE'
      '    R.COD_NOTA_CAB = :COD_NOTA_CAB'
      '  AND'
      '    S.COD_SERIE_MODELO = '#39'01'#39
      '  AND'
      '    O.IND_EMITE = '#39'F'#39
      '  AND'
      '    R.NUM_TITULO = N.NUM_NOTA'
      '/*    (S.COD_SERIE_MODELO <> '#39'55'#39' OR O.IND_EMITE = '#39'F'#39') */'
      '  GROUP BY'
      '    R.NUM_TITULO'
      ''
      '  UNION ALL'
      ''
      '  SELECT'
      '    P.NUM_TITULO + 0.00,'
      '    COUNT(*) + 0.00 AS QTD_PARCELAS,'
      '    SUM(P.VAL_ORIGINAL) AS VAL_TITULO'
      '  FROM'
      '    TB_CONTA_PAGAR_CAB P'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = P.COD_NOTA_CAB'
      
        'INNER JOIN TB_SERIE S ON (N.COD_SERIE = S.COD_SERIE AND N.COD_FI' +
        'LIAL = S.COD_FILIAL '
      #9'AND N.COD_SERIE_MODELO = S.COD_SERIE_MODELO)'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      '  WHERE'
      '    P.COD_NOTA_CAB = :COD_NOTA_CAB'
      '  AND'
      '    S.COD_SERIE_MODELO = '#39'01'#39
      '  AND'
      '    O.IND_EMITE = '#39'F'#39
      '  AND'
      '    P.NUM_TITULO = N.NUM_NOTA'
      '/*    (S.COD_SERIE_MODELO <> '#39'55'#39' OR O.IND_EMITE = '#39'F'#39') */'
      '  GROUP BY'
      '    P.NUM_TITULO'
      ')')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000A0000004E554D5F544954554C4F0100000000000C000000
      5154445F50415243454C41530100000000000A00000056414C5F544954554C4F
      010000000000}
    Session = DMOracle.DBCemapa
    Left = 304
    Top = 16
    object QReg140NUM_TITULO: TFloatField
      FieldName = 'NUM_TITULO'
    end
    object QReg140QTD_PARCELAS: TFloatField
      FieldName = 'QTD_PARCELAS'
    end
    object QReg140VAL_TITULO: TFloatField
      FieldName = 'VAL_TITULO'
    end
  end
  object QReg141: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  NUM_PARCELA + 0.00 AS NUM_PARCELA,'
      '  DT_VENCIMENTO,'
      '  VAL_TITULO'
      'FROM'
      '('
      '  SELECT'
      '    R.NUM_PARCELA,'
      '    R.DT_VENCIMENTO,'
      '    R.VAL_ORIGINAL as VAL_TITULO'
      '  FROM'
      '    TB_CONTA_RECEBER_CAB R'
      '  INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = R.COD_NOTA_CAB'
      '  WHERE'
      '    R.COD_NOTA_CAB = :COD_NOTA_CAB'
      '  AND'
      '    R.NUM_TITULO = N.NUM_NOTA'
      '  AND'
      '    N.COD_SERIE_MODELO = '#39'01'#39
      ''
      '  UNION ALL'
      '  SELECT'
      '    P.NUM_PARCELA,'
      '    P.DT_VENCIMENTO,'
      '    P.VAL_ORIGINAL'
      '  FROM'
      '    TB_CONTA_PAGAR_CAB P'
      '  INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = P.COD_NOTA_CAB'
      '  WHERE'
      '    P.COD_NOTA_CAB = :COD_NOTA_CAB'
      '  AND'
      '    P.NUM_TITULO = N.NUM_NOTA'
      '  AND'
      '    N.COD_SERIE_MODELO = '#39'01'#39
      ')'
      'ORDER BY'
      '  DT_VENCIMENTO')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000B0000004E554D5F50415243454C410100000000000D0000
      0044545F56454E43494D454E544F0100000000000A00000056414C5F54495455
      4C4F010000000000}
    Session = DMOracle.DBCemapa
    Left = 360
    Top = 16
    object QReg141NUM_PARCELA: TFloatField
      FieldName = 'NUM_PARCELA'
    end
    object QReg141DT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object QReg141VAL_TITULO: TFloatField
      FieldName = 'VAL_TITULO'
    end
  end
  object QReg160: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_NOTA_CAB.COD_TRANSPORTADOR,'
      '  TB_NOTA_CAB.DESC_PLACA,'
      '  TB_NOTA_CAB.NUM_VOLUMES,'
      '  TB_NOTA_CAB.VAL_FRETE,'
      
        '  decode(TB_NOTA_CAB.COD_TRANSPORTADOR, null, TB_FILIAL.COD_ESTA' +
        'DO, TB_CADASTRO.COD_ESTADO) as COD_ESTADO,'
      
        '  SUM(TB_NOTA_ITEM.QT_QUANTIDADE * TB_PRODUTO.NUM_EMBALAGEM) AS ' +
        'QT_PESO_BRUTO,'
      
        '  SUM(TB_NOTA_ITEM.QT_QUANTIDADE * TB_PRODUTO.NUM_VOLUMES) AS QT' +
        '_PESO_LIQUIDO'
      'FROM'
      '  TB_NOTA_ITEM'
      
        'INNER JOIN TB_NOTA_CAB ON TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITE' +
        'M.COD_NOTA_ITEM'
      
        'INNER JOIN TB_PRODUTO ON TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.C' +
        'OD_PRODUTO'
      
        'INNER JOIN TB_CADASTRO ON TB_NOTA_CAB.COD_TRANSPORTADOR = TB_CAD' +
        'ASTRO.COD_CADASTRO'
      
        'INNER JOIN TB_FILIAL ON TB_NOTA_CAB.COD_FILIAL = TB_FILIAL.COD_F' +
        'ILIAL'
      'WHERE'
      '  TB_NOTA_CAB.COD_NOTA_CAB = :COD_NOTA_CAB'
      'AND'
      '  TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      '/*'
      'AND'
      '  DESC_PLACA IS NOT NULL'
      '*/'
      'AND'
      '  TB_NOTA_CAB.VAL_FRETE > 0'
      'GROUP BY'
      '  TB_NOTA_CAB.COD_TRANSPORTADOR,'
      '  TB_NOTA_CAB.DESC_PLACA,'
      '  TB_NOTA_CAB.NUM_VOLUMES,'
      '  TB_NOTA_CAB.VAL_FRETE,'
      
        '  decode(TB_NOTA_CAB.COD_TRANSPORTADOR, null, TB_FILIAL.COD_ESTA' +
        'DO, TB_CADASTRO.COD_ESTADO)')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000011000000434F445F5452414E53504F525441444F52010000
      0000000A000000444553435F504C4143410100000000000B0000004E554D5F56
      4F4C554D45530100000000000900000056414C5F46524554450100000000000D
      00000051545F5045534F5F425255544F0100000000000F00000051545F504553
      4F5F4C49515549444F0100000000000A000000434F445F45535441444F010000
      000000}
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 72
    object QReg160COD_TRANSPORTADOR: TIntegerField
      FieldName = 'COD_TRANSPORTADOR'
    end
    object QReg160DESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Size = 8
    end
    object QReg160NUM_VOLUMES: TIntegerField
      FieldName = 'NUM_VOLUMES'
    end
    object QReg160VAL_FRETE: TFloatField
      FieldName = 'VAL_FRETE'
      Required = True
    end
    object QReg160QT_PESO_BRUTO: TFloatField
      FieldName = 'QT_PESO_BRUTO'
    end
    object QReg160QT_PESO_LIQUIDO: TFloatField
      FieldName = 'QT_PESO_LIQUIDO'
    end
    object QReg160COD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Size = 2
    end
  end
  object QReg170: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '  N.IND_ENTRADA_SAIDA,'
      '  I.COD_NOTA_ITEM + 0.00 AS COD_NOTA_ITEM,'
      '  I.COD_PRODUTO + 0.00 AS COD_PRODUTO,'
      '  DECODE(I.QT_QUANTIDADE,0,1,I.QT_QUANTIDADE) AS QT_QUANTIDADE,'
      '  P.DESC_UNIDADE,'
      
        '  P.DESC_COMPLEMENTO || '#39' '#39' || P.DESC_COMPLEMENTO_2 AS DESC_COMP' +
        'LEMENTO,'
      '  I.VAL_TOTAL,'
      
        '  DECODE(TB_PARAM_SISTEMA.COD_EMPRESA, '#39'BEGNINI'#39', /*N.VAL_DESCON' +
        'TO / (SELECT COUNT(*) FROM TB_NOTA_ITEM IT WHERE IT.COD_NOTA_CAB' +
        ' = N.COD_NOTA_CAB)*/'
      '  PEGA_DESCONTO_ITEM(I.COD_NOTA_ITEM),'
      '  PEGA_DESCONTO_ITEM(I.COD_NOTA_ITEM)) AS VAL_DESCONTO,'
      
        '--  (case when N.VAL_DESCONTO > 0 then I.VAL_DESCONTO else 0 end' +
        ') as VAL_DESCONTO,  '
      '  CASE I.VAL_ICMS_SUBST'
      '  WHEN 0 THEN'
      '    cast('
      
        '        DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_CFOP, nu' +
        'll, O_N.NUM_NATUREZA_EST_NOVO, I.COD_CFOP), '
      
        '        decode(I.COD_CFOP, null, O_N.NUM_NATUREZA_INT_NOVO, I.CO' +
        'D_CFOP)) as number(4)) + 0.00 '
      '  ELSE '
      '    cast('
      
        '        DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_CFOP, nu' +
        'll, O_N.COD_CFOP_ST, I.COD_CFOP), '
      
        '        decode(I.COD_CFOP, null, O_N.COD_CFOP_INT_ST, I.COD_CFOP' +
        ')) as number(4)) + 0.00'
      '  END AS NUM_CFOP,  '
      
        '  cast(decode(I.COD_OPERACAO, null, N.COD_OPERACAO, I.COD_OPERAC' +
        'AO) as number(6)) + 0.00 as COD_OPERACAO,'
      '  I.VAL_ICM_BASE,'
      '  I.VAL_ICM,  '
      
        '  --DECODE(N.IND_ST, '#39'S'#39', I.VAL_BASE_SUBST, 0.00) AS VAL_BASE_SU' +
        'BST,'
      
        '  --DECODE(N.IND_ST, '#39'S'#39', I.VAL_ICMS_SUBST, 0.00) AS VAL_ICMS_SU' +
        'BST,'
      '  /*'
      '  CASE '
      
        #9'WHEN T.DESC_SITUACAO_TRIB IN ('#39'010'#39','#39'030'#39','#39'060'#39','#39'070'#39') THEN I.V' +
        'AL_BASE_SUBST'
      
        #9'WHEN T.DESC_CSOSN IN ('#39'201'#39','#39'202'#39','#39'203'#39','#39'500'#39') THEN I.VAL_BASE_' +
        'SUBST'
      '  END AS VAL_BASE_SUBST,  '
      '  CASE '
      
        #9'WHEN T.DESC_SITUACAO_TRIB IN ('#39'010'#39','#39'030'#39','#39'060'#39','#39'070'#39') THEN I.V' +
        'AL_ICMS_SUBST'
      
        #9'WHEN T.DESC_CSOSN IN ('#39'201'#39','#39'202'#39','#39'203'#39','#39'500'#39') THEN I.VAL_ICMS_' +
        'SUBST'
      '  END AS VAL_ICMS_SUBST, '
      '  */'
      '  I.VAL_BASE_SUBST,'
      '  I.VAL_ICMS_SUBST,'
      
        '  (CASE WHEN (I.COD_CST_IPI IN ('#39'00'#39', '#39'99'#39', '#39'49'#39', '#39'50'#39')) THEN I.' +
        'PERC_IPI ELSE 0 END) AS PERC_IPI,'
      
        '  (CASE WHEN (I.COD_CST_IPI IN ('#39'00'#39', '#39'99'#39', '#39'49'#39', '#39'50'#39')) THEN I.' +
        'VAL_IPI ELSE 0 END) AS VAL_IPI,'
      '  NVL(I.VAL_PIS,0) VAL_PIS,'
      '  NVL(I.VAL_CONFINS,0) VAL_COFINS,'
      '  T.PERC_ALIQUOTA,'
      '  NVL(T.DESC_SITUACAO_TRIB,T.DESC_CSOSN) AS DESC_SITUACAO_TRIB,'
      
        '  decode(I.COD_OPERACAO, null, O_N.IND_ESTOQUE, O_I.IND_ESTOQUE)' +
        ' as IND_MOVIMENTA_ESTOQUE,'
      '  E.PERC_ALIQ_SUBST,'
      '  TB_PARAM_SISTEMA.PERC_PIS,'
      '  TB_PARAM_SISTEMA.PERC_COFINS,'
      
        '  Decode(N.IND_ENTRADA_SAIDA, '#39'E'#39', Decode(N.IND_CONDICAO_PAGTO,'#39 +
        '1'#39', O_N.COD_CONTABIL_VAL_NOTA_DEB, O_N.COD_CONTABIL_VAL_NOTA_APR' +
        'AZO),'
      
        '                               Decode(N.IND_CONDICAO_PAGTO,'#39'1'#39', ' +
        'O_N.COD_CONT_VAL_NOTA_CRED_AVISTA, O_N.COD_CONTABIL_VAL_NOTA_CRE' +
        'D)) as CONTA_CONTABIL,'
      '  I.COD_CST_PIS,'
      '  I.COD_CST_COFINS,'
      '  I.IND_DESCONTA_ICMS_ST_PISCOFINS'
      'FROM'
      '  TB_PARAM_SISTEMA,'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_OPERACAO O_N ON N.COD_OPERACAO = O_N.COD_OPERACAO'
      'LEFT JOIN TB_OPERACAO O_I ON I.COD_OPERACAO = O_I.COD_OPERACAO'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL'
      
        'INNER JOIN TB_TRIBUTACAO T ON I.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      'INNER JOIN TB_ESTADO E ON N.COD_ESTADO = E.COD_ESTADO'
      
        'INNER JOIN TB_SERIE S ON (N.COD_SERIE = S.COD_SERIE AND N.COD_FI' +
        'LIAL = S.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = S.COD_SERIE_MODELO)'
      'WHERE'
      '  I.COD_NOTA_CAB = :COD_NOTA_CAB'
      'AND'
      
        '  ((S.COD_SERIE_MODELO = '#39'55'#39' AND O_N.IND_EMITE <> '#39'F'#39') OR (S.CO' +
        'D_SERIE_MODELO <> '#39'55'#39'))'
      'AND'
      '  N.IND_ENTRADA_SAIDA = '#39'E'#39
      '/*  OR'
      
        '  (TB_PARAM_SISTEMA.COD_EMPRESA IN ('#39'POLITHERM'#39','#39'BISSOLOTTI'#39'))) ' +
        '-- DEVE SAIR C170 MESMO PARA NF-E DE EMISS'#195'O PR'#211'PRIA'
      ''
      'AND'
      
        '  ((S.COD_SERIE_MODELO <> '#39'65'#39') or (TB_PARAM_SISTEMA.COD_EMPRESA' +
        ' = '#39'DAMBONI'#39'))'
      '*/')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001C0000000D000000434F445F4E4F54415F4954454D0100000000000B
      000000434F445F50524F4455544F0100000000000D00000051545F5155414E54
      49444144450100000000000C000000444553435F554E49444144450100000000
      000900000056414C5F544F54414C0100000000000C00000056414C5F44455343
      4F4E544F01000000000012000000444553435F534954554143414F5F54524942
      0100000000000C000000434F445F4F5045524143414F0100000000000C000000
      56414C5F49434D5F424153450100000000000D000000504552435F414C495155
      4F54410100000000000700000056414C5F49434D0100000000000E0000005641
      4C5F424153455F53554253540100000000000E00000056414C5F49434D535F53
      5542535401000000000008000000504552435F49504901000000000007000000
      56414C5F4950490100000000000700000056414C5F5049530100000000001000
      0000444553435F434F4D504C454D454E544F01000000000015000000494E445F
      4D4F56494D454E54415F4553544F5155450100000000000F000000504552435F
      414C49515F535542535401000000000008000000504552435F50495301000000
      00000B000000504552435F434F46494E530100000000000E000000434F4E5441
      5F434F4E544142494C0100000000000A00000056414C5F434F46494E53010000
      000000080000004E554D5F43464F500100000000000B000000434F445F435354
      5F5049530100000000000E000000434F445F4353545F434F46494E5301000000
      000011000000494E445F454E54524144415F53414944410100000000001E0000
      00494E445F444553434F4E54415F49434D535F53545F504953434F46494E5301
      0000000000}
    Session = DMOracle.DBCemapa
    Left = 80
    Top = 72
    object QReg170COD_NOTA_ITEM: TFloatField
      FieldName = 'COD_NOTA_ITEM'
    end
    object QReg170COD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QReg170QT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QReg170DESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 3
    end
    object QReg170DESC_COMPLEMENTO: TStringField
      FieldName = 'DESC_COMPLEMENTO'
      Size = 81
    end
    object QReg170VAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
      Required = True
    end
    object QReg170VAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
      Required = True
    end
    object QReg170NUM_CFOP: TFloatField
      FieldName = 'NUM_CFOP'
    end
    object QReg170COD_OPERACAO: TFloatField
      FieldName = 'COD_OPERACAO'
    end
    object QReg170VAL_ICM_BASE: TFloatField
      FieldName = 'VAL_ICM_BASE'
      Required = True
    end
    object QReg170VAL_ICM: TFloatField
      FieldName = 'VAL_ICM'
      Required = True
    end
    object QReg170VAL_BASE_SUBST: TFloatField
      FieldName = 'VAL_BASE_SUBST'
    end
    object QReg170VAL_ICMS_SUBST: TFloatField
      FieldName = 'VAL_ICMS_SUBST'
    end
    object QReg170PERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
      Required = True
    end
    object QReg170VAL_IPI: TFloatField
      FieldName = 'VAL_IPI'
      Required = True
    end
    object QReg170VAL_PIS: TFloatField
      FieldName = 'VAL_PIS'
    end
    object QReg170PERC_ALIQUOTA: TFloatField
      FieldName = 'PERC_ALIQUOTA'
      Required = True
    end
    object QReg170DESC_SITUACAO_TRIB: TStringField
      FieldName = 'DESC_SITUACAO_TRIB'
      Size = 3
    end
    object QReg170IND_MOVIMENTA_ESTOQUE: TStringField
      FieldName = 'IND_MOVIMENTA_ESTOQUE'
      Size = 1
    end
    object QReg170PERC_ALIQ_SUBST: TFloatField
      FieldName = 'PERC_ALIQ_SUBST'
    end
    object QReg170PERC_PIS: TFloatField
      FieldName = 'PERC_PIS'
    end
    object QReg170PERC_COFINS: TFloatField
      FieldName = 'PERC_COFINS'
    end
    object QReg170CONTA_CONTABIL: TStringField
      FieldName = 'CONTA_CONTABIL'
      Size = 15
    end
    object QReg170VAL_COFINS: TFloatField
      FieldName = 'VAL_COFINS'
    end
    object QReg170COD_CST_PIS: TStringField
      FieldName = 'COD_CST_PIS'
      Size = 2
    end
    object QReg170COD_CST_COFINS: TStringField
      FieldName = 'COD_CST_COFINS'
      Size = 2
    end
    object QReg170IND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 1
    end
    object QReg170IND_DESCONTA_ICMS_ST_PISCOFINS: TStringField
      FieldName = 'IND_DESCONTA_ICMS_ST_PISCOFINS'
      Size = 3
    end
  end
  object QReg113: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_NOTA_CAB.IND_ENTRADA_SAIDA,'
      '  TB_OPERACAO.IND_EMITE,'
      '  TB_NOTA_CAB.COD_CADASTRO,'
      '  TB_NOTA_CAB.DESC_CHAVE_ACESSO,'
      '  TB_NOTA_CAB.COD_SERIE,'
      '  TB_NOTA_CAB.DT_EMISSAO,'
      '  TB_NOTA_CAB.NUM_NOTA + 0.00 AS NUM_NOTA,'
      '  TB_SERIE.COD_SERIE_MODELO,'
      '  TB_SERIE.NUM_SERIE_FISCAL,'
      '  TB_SERIE.COD_SERIE'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_OPERACAO,'
      '  TB_SERIE,'
      '  TB_NOTA_ITEM N1,'
      '  TB_NOTA_ITEM N2'
      'WHERE'
      '  TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      'AND'
      '  TB_NOTA_CAB.COD_SERIE = TB_SERIE.COD_SERIE'
      'AND'
      '  TB_NOTA_CAB.COD_FILIAL = TB_SERIE.COD_FILIAL'
      'AND'
      '  TB_NOTA_CAB.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO'
      'AND'
      '  TB_NOTA_CAB.COD_NOTA_CAB = N1.COD_NOTA_CAB'
      'AND'
      '  N1.COD_NOTA_ITEM = N2.COD_NOTA_ITEM_ORIGEM'
      'AND'
      
        '  ((TB_OPERACAO.IND_COMPRAS = '#39'D'#39') OR (TB_OPERACAO.IND_VENDAS = ' +
        #39'D'#39') OR'
      
        '   (TB_OPERACAO.IND_FUTURA_CLIENTE = '#39'S'#39') OR (TB_OPERACAO.IND_FU' +
        'TURA_FORNECEDOR = '#39'S'#39'))'
      'AND'
      '  N2.COD_NOTA_CAB = :COD_NOTA_CAB')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A00000011000000494E445F454E54524144415F5341494441010000
      00000009000000494E445F454D4954450100000000000C000000434F445F4341
      44415354524F01000000000011000000444553435F43484156455F4143455353
      4F01000000000009000000434F445F53455249450100000000000A0000004454
      5F454D495353414F010000000000080000004E554D5F4E4F5441010000000000
      100000004E554D5F53455249455F46495343414C01000000000010000000434F
      445F53455249455F4D4F44454C4F0100000000000B000000434F445F53455249
      455F31010000000000}
    Session = DMOracle.DBCemapa
    Left = 192
    Top = 16
    object QReg113IND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 1
    end
    object QReg113IND_EMITE: TStringField
      FieldName = 'IND_EMITE'
      Required = True
      Size = 1
    end
    object QReg113COD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QReg113DESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Size = 47
    end
    object QReg113COD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QReg113DT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QReg113NUM_SERIE_FISCAL: TIntegerField
      FieldName = 'NUM_SERIE_FISCAL'
    end
    object QReg113NUM_NOTA: TFloatField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QReg113COD_SERIE_MODELO: TStringField
      FieldName = 'COD_SERIE_MODELO'
      Required = True
      Size = 2
    end
  end
  object QReg172: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  SUM(TB_NOTA_ITEM.VAL_TOTAL) AS VAL_BASE_ISS,'
      '  SUM(TB_NOTA_ITEM.VAL_ISS) AS VAL_TOTAL_ISS,'
      '  TB_FILIAL.PERC_ISS'
      'FROM'
      '  TB_NOTA_ITEM,'
      '  TB_NOTA_CAB,'
      '  TB_FILIAL'
      'WHERE'
      '  TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      '  AND'
      '  TB_NOTA_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL'
      '  AND'
      '  TB_NOTA_ITEM.VAL_ISS > 0'
      '  and'
      '  tb_nota_cab.cod_nota_cab = :cod_nota_cab'
      'GROUP BY'
      '  TB_FILIAL.PERC_ISS')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000C00000056414C5F424153455F4953530100000000000D00
      000056414C5F544F54414C5F49535301000000000008000000504552435F4953
      53010000000000}
    Session = DMOracle.DBCemapa
    Left = 136
    Top = 72
    object QReg172VAL_BASE_ISS: TFloatField
      FieldName = 'VAL_BASE_ISS'
    end
    object QReg172VAL_TOTAL_ISS: TFloatField
      FieldName = 'VAL_TOTAL_ISS'
    end
    object QReg172PERC_ISS: TFloatField
      FieldName = 'PERC_ISS'
    end
  end
  object QReg190old: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '  N.IND_ENTRADA_SAIDA,'
      '  T.PERC_ALIQUOTA AS ALIQ_ICMS,'
      '    CASE'
      '        WHEN F.IND_REGIME_TRIBUTARIO = 1 THEN --CSOSN'
      '            CASE '
      '                WHEN C.IND_FISICA_JURIDICA = '#39'F'#39' THEN'
      '                    T.DESC_CSOSN_NC'
      '                ELSE'
      '                    CASE '
      
        '                        WHEN ((C.IND_FISICA_JURIDICA = '#39'J'#39') AND ' +
        '(((C.NUM_INSCRICAO = '#39'ISENTO'#39') AND (C.IND_CONTRIBUINTE = '#39'NAO'#39'))' +
        ' OR (C.NUM_INSCRICAO = '#39#39'))) THEN'
      
        '                            DECODE(PS.COD_EMPRESA,'#39'CGS'#39',T.DESC_C' +
        'SOSN,T.DESC_CSOSN_NC)'
      '                        ELSE'
      '                            T.DESC_CSOSN'
      '                    END'
      '            END'
      '        ELSE --CST'
      '            CASE '
      '                WHEN C.IND_FISICA_JURIDICA = '#39'F'#39' THEN'
      '                    T.DESC_SITUACAO_TRIB_NC'
      '                ELSE'
      '                    CASE '
      
        '                        WHEN ((C.IND_FISICA_JURIDICA = '#39'J'#39') AND ' +
        '(((C.NUM_INSCRICAO = '#39'ISENTO'#39') AND (C.IND_CONTRIBUINTE = '#39'NAO'#39'))' +
        ' OR (C.NUM_INSCRICAO = '#39#39'))) THEN'
      
        '                            DECODE(PS.COD_EMPRESA,'#39'CGS'#39',T.DESC_S' +
        'ITUACAO_TRIB,T.DESC_SITUACAO_TRIB_NC)'
      '                        ELSE'
      '                            T.DESC_SITUACAO_TRIB'
      '                    END'
      '            END                     '
      '    END AS CST_ICMS,'
      '  '
      
        '  -- BUSCA O CFOP QUE FOI INFORMADO NO ITEM OU NA OPERACAO E DIS' +
        'TINGUE SE '#201' INTERESTADUAL E POSSUI ST'
      '  cast('
      '    DECODE('
      '      F.COD_ESTADO, '
      '      N.COD_ESTADO, '
      '      decode('
      '        I.COD_CFOP, '
      '        null, '
      '        CASE '
      
        '          WHEN /*T.DESC_SITUACAO_TRIB IN ('#39'010'#39','#39'030'#39','#39'060'#39','#39'070' +
        #39')*/ (SUM(I.VAL_ICMS_SUBST) > 0) AND (PS.COD_EMPRESA <> '#39'CGS'#39') T' +
        'HEN O_N.COD_CFOP_ST'
      
        '          WHEN /*T.DESC_CSOSN IN ('#39'201'#39','#39'202'#39','#39'203'#39','#39'500'#39')*/ (SU' +
        'M(I.VAL_ICMS_SUBST) > 0) AND (PS.COD_EMPRESA <> '#39'CGS'#39') THEN O_N.' +
        'COD_CFOP_ST'
      
        '          WHEN PS.COD_EMPRESA = '#39'CGS'#39' THEN O_N.NUM_NATUREZA_EST_' +
        'NOVO'
      '          ELSE O_N.NUM_NATUREZA_EST_NOVO'
      '        END, '
      '        I.COD_CFOP'
      '      ), '
      '      decode('
      '        I.COD_CFOP, '
      '        null,         '
      '        CASE '
      
        '          WHEN /*T.DESC_SITUACAO_TRIB IN ('#39'010'#39','#39'030'#39','#39'060'#39','#39'070' +
        #39')*/ (SUM(I.VAL_ICMS_SUBST) > 0) AND (PS.COD_EMPRESA <> '#39'CGS'#39') T' +
        'HEN O_N.COD_CFOP_INT_ST'
      
        '          WHEN /*T.DESC_CSOSN IN ('#39'201'#39','#39'202'#39','#39'203'#39','#39'500'#39')*/ (SU' +
        'M(I.VAL_ICMS_SUBST) > 0) AND (PS.COD_EMPRESA <> '#39'CGS'#39') THEN O_N.' +
        'COD_CFOP_INT_ST'
      
        '          WHEN PS.COD_EMPRESA = '#39'CGS'#39' THEN O_N.NUM_NATUREZA_INT_' +
        'NOVO'
      '          ELSE O_N.NUM_NATUREZA_INT_NOVO'
      '        END, '
      '        I.COD_CFOP'
      '      )'
      '    ) as number(4)'
      '  ) + 0.00 AS CFOP,'
      '  '
      '  '
      '  CASE'
      '    WHEN PS.COD_EMPRESA = '#39'CGS'#39' THEN'
      
        '      (SUM(I.VAL_TOTAL - NVL(I.VAL_DESCONTO,0)) + N.VAL_DESPESAS' +
        ' + (CASE WHEN ((N.NUM_CONHECIMENTO_FRETE IS NOT NULL) AND (N.IND' +
        '_ENTRADA_SAIDA = '#39'E'#39') AND (N.IND_TIPO_FRETE = '#39'FOB'#39')) THEN 0.00 ' +
        'ELSE N.VAL_FRETE END) + SUM(I.VAL_ICMS_SUBST) + SUM(CASE WHEN (I' +
        '.COD_CST_IPI IN ('#39'00'#39', '#39'50'#39', '#39'49'#39', '#39'99'#39')) THEN I.VAL_IPI ELSE 0 ' +
        'END))/* - N.VAL_DESCONTO)*/'
      '    WHEN PS.COD_EMPRESA = '#39'BEGNINI'#39' THEN'
      '      (SUM(I.VAL_TOTAL + I.VAL_DESPESAS) - N.VAL_DESCONTO)'
      '    ELSE'
      
        '      (SUM(I.VAL_TOTAL - PEGA_DESCONTO_ITEM(I.COD_NOTA_ITEM) + I' +
        '.VAL_DESPESAS +       '
      
        '      -- C'#211'DIGO INSERIDO PARA N'#195'O CONSIDERAR ST DE NOTAS COM SUB' +
        'STITUI'#199#195'O TRIBUT'#193'RIA CALCULADA ANTERIORMENTE NO COMPRAS'
      '        CASE'
      
        '            WHEN ((T.DESC_SITUACAO_TRIB LIKE '#39'%60'#39' OR T.DESC_CSO' +
        'SN LIKE '#39'500'#39')'
      
        '                AND (C.IND_FISICA_JURIDICA = '#39'J'#39' AND C.NUM_INSCR' +
        'ICAO IS NOT NULL AND C.NUM_INSCRICAO <> '#39'ISENTO'#39
      '                AND C.IND_CONTRIBUINTE = '#39'SIM'#39')) THEN    '
      '                    0 '
      '        '
      '            ELSE'
      '                I.VAL_ICMS_SUBST '
      '        END        '
      
        '      + CASE WHEN (I.COD_CST_IPI IN ('#39'00'#39', '#39'50'#39', '#39'49'#39', '#39'99'#39')) TH' +
        'EN I.VAL_IPI ELSE 0 END))'
      '  END AS VL_OPR,'
      '  Sum(I.VAL_ICM_BASE) AS VL_BC_ICMS,'
      '  Sum(I.VAL_ICM) AS VL_ICMS,'
      
        '  --DECODE(N.IND_ST, '#39'S'#39', Sum(I.VAL_BASE_SUBST), 0.00) AS VL_BC_' +
        'ICMS_ST,'
      
        '  --DECODE(N.IND_ST, '#39'S'#39', Sum(I.VAL_ICMS_SUBST), 0.00) AS VL_ICM' +
        'S_ST,'
      '  /*SUM(CASE '
      
        #9'WHEN T.DESC_SITUACAO_TRIB IN ('#39'010'#39','#39'030'#39','#39'060'#39','#39'070'#39') THEN I.V' +
        'AL_BASE_SUBST'
      
        #9'WHEN T.DESC_CSOSN IN ('#39'201'#39','#39'202'#39','#39'203'#39','#39'500'#39') THEN I.VAL_BASE_' +
        'SUBST'
      '  END) AS VL_BC_ICMS_ST, '
      '  SUM(CASE '
      
        #9'WHEN T.DESC_SITUACAO_TRIB IN ('#39'010'#39','#39'030'#39','#39'060'#39','#39'070'#39') THEN I.V' +
        'AL_ICMS_SUBST'
      
        #9'WHEN T.DESC_CSOSN IN ('#39'201'#39','#39'202'#39','#39'203'#39','#39'500'#39') THEN I.VAL_ICMS_' +
        'SUBST'
      '  END) AS VL_ICMS_ST,*/'
      '  SUM(I.VAL_BASE_SUBST) AS VL_BC_ICMS_ST,'
      '  SUM(I.VAL_ICMS_SUBST) AS VL_ICMS_ST,'
      
        '  Sum(Decode(NUM_CLASSIFICACAO,2/*PARTE ISENTO*/,I.VAL_TOTAL + I' +
        '.VAL_DESPESAS - I.VAL_DESCONTO - I.VAL_BASE_SUBST,'
      
        '    Decode(NUM_CLASSIFICACAO,4/*ISENTO*/,I.VAL_TOTAL,0))) as VL_' +
        'RED_BC,  '
      
        '  Sum(CASE WHEN (I.COD_CST_IPI IN ('#39'00'#39', '#39'50'#39', '#39'49'#39', '#39'99'#39')) THEN' +
        ' I.VAL_IPI ELSE 0 END) VL_IPI'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_OPERACAO O_N ON N.COD_OPERACAO = O_N.COD_OPERACAO'
      'LEFT JOIN TB_OPERACAO O_I ON I.COD_OPERACAO = O_I.COD_OPERACAO'
      'INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL'
      
        'INNER JOIN TB_TRIBUTACAO T ON I.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      'INNER JOIN TB_ESTADO E ON N.COD_ESTADO = E.COD_ESTADO'
      'INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  N.COD_NOTA_CAB = :COD_NOTA_CAB'
      'GROUP BY'
      '  N.IND_ENTRADA_SAIDA,'
      '  T.PERC_ALIQUOTA,'
      '  CASE'
      '        WHEN F.IND_REGIME_TRIBUTARIO = 1 THEN --CSOSN'
      '            CASE '
      '                WHEN C.IND_FISICA_JURIDICA = '#39'F'#39' THEN'
      '                    T.DESC_CSOSN_NC'
      '                ELSE'
      '                    CASE '
      
        '                        WHEN ((C.IND_FISICA_JURIDICA = '#39'J'#39') AND ' +
        '(((C.NUM_INSCRICAO = '#39'ISENTO'#39') AND (C.IND_CONTRIBUINTE = '#39'NAO'#39'))' +
        ' OR (C.NUM_INSCRICAO = '#39#39'))) THEN'
      
        '                            DECODE(PS.COD_EMPRESA,'#39'CGS'#39',T.DESC_C' +
        'SOSN,T.DESC_CSOSN_NC)'
      '                        ELSE'
      '                            T.DESC_CSOSN'
      '                    END'
      '            END'
      '        ELSE --CST'
      '            CASE '
      '                WHEN C.IND_FISICA_JURIDICA = '#39'F'#39' THEN'
      '                    T.DESC_SITUACAO_TRIB_NC'
      '                ELSE'
      '                    CASE '
      
        '                        WHEN ((C.IND_FISICA_JURIDICA = '#39'J'#39') AND ' +
        '(((C.NUM_INSCRICAO = '#39'ISENTO'#39') AND (C.IND_CONTRIBUINTE = '#39'NAO'#39'))' +
        ' OR (C.NUM_INSCRICAO = '#39#39'))) THEN'
      
        '                            DECODE(PS.COD_EMPRESA,'#39'CGS'#39',T.DESC_S' +
        'ITUACAO_TRIB,T.DESC_SITUACAO_TRIB_NC)'
      '                        ELSE'
      '                            T.DESC_SITUACAO_TRIB'
      '                    END'
      '            END                     '
      '    END,'
      '  cast('
      
        '    DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_CFOP, null, ' +
        'O_N.NUM_NATUREZA_EST_NOVO, I.COD_CFOP), decode(I.COD_CFOP, null,' +
        ' O_N.NUM_NATUREZA_INT_NOVO, I.COD_CFOP)) '
      '  as number(4)) + 0.00,'
      '  N.VAL_DESPESAS,'
      '  N.NUM_CONHECIMENTO_FRETE,'
      '  N.IND_ENTRADA_SAIDA,'
      '  N.IND_TIPO_FRETE,'
      '  N.VAL_FRETE,'
      '  N.VAL_DESCONTO,'
      '  PS.COD_EMPRESA,  '
      '  N.IND_ST,'
      '  F.COD_ESTADO, '
      '  N.COD_ESTADO,      '
      '  I.COD_CFOP, '
      '  PS.COD_EMPRESA,'
      '  O_N.COD_CFOP_ST,'
      '  O_N.COD_CFOP_ST,'
      '  O_N.NUM_NATUREZA_EST_NOVO, '
      '  O_N.COD_CFOP_INT_ST,'
      '  O_N.COD_CFOP_INT_ST,'
      '  O_N.NUM_NATUREZA_INT_NOVO')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B00000009000000414C49515F49434D530100000000000800000043
      53545F49434D530100000000000400000043464F500100000000000A00000056
      4C5F42435F49434D5301000000000007000000564C5F49434D53010000000000
      0A000000564C5F49434D535F535401000000000009000000564C5F5245445F42
      4301000000000006000000564C5F49504901000000000006000000564C5F4F50
      520100000000000D000000564C5F42435F49434D535F53540100000000001100
      0000494E445F454E54524144415F5341494441010000000000}
    Session = DMOracle.DBCemapa
    Left = 336
    Top = 160
    object QReg190oldALIQ_ICMS: TFloatField
      FieldName = 'ALIQ_ICMS'
      Required = True
    end
    object QReg190oldCST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Size = 3
    end
    object QReg190oldCFOP: TFloatField
      FieldName = 'CFOP'
    end
    object QReg190oldVL_BC_ICMS: TFloatField
      FieldName = 'VL_BC_ICMS'
    end
    object QReg190oldVL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
    end
    object QReg190oldVL_BC_ICMS_ST: TFloatField
      FieldName = 'VL_BC_ICMS_ST'
    end
    object QReg190oldVL_ICMS_ST: TFloatField
      FieldName = 'VL_ICMS_ST'
    end
    object QReg190oldVL_RED_BC: TFloatField
      FieldName = 'VL_RED_BC'
    end
    object QReg190oldVL_IPI: TFloatField
      FieldName = 'VL_IPI'
    end
    object QReg190oldVL_OPR: TFloatField
      FieldName = 'VL_OPR'
    end
    object QReg190oldIND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 1
    end
  end
  object QReg500: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_OPERACAO,'
      '  COD_NOTA_CAB,'
      '  IND_ENTRADA_SAIDA,'
      '  IND_CONDICAO_PAGTO,'
      '  NUM_NOTA,'
      '  DT_EMISSAO,'
      '  DT_RECEBIMENTO,'
      '  DT_MOVIMENTO,'
      '  SUM(VAL_AVISTA) AS VAL_AVISTA,'
      '  SUM(VAL_IMPOSTO) AS VAL_IMPOSTO,'
      '  COD_CADASTRO,'
      '  COD_SERIE,'
      '  DESC_CHAVE_ACESSO,'
      '  PEGA_DESCONTO_NOTA(COD_NOTA_CAB) AS VAL_DESCONTO,'
      '  SUM(VAL_DESPESAS) AS VAL_DESPESAS,'
      '  IND_SITUACAO,'
      '  IND_EMITE,'
      '  COD_SERIE_MODELO,'
      '  NUM_SERIE_FISCAL,'
      '  SUM(VAL_CONFINS) AS VAL_CONFINS,'
      '  SUM(VAL_ICM_BASE) AS VAL_ICM_BASE,'
      '  SUM(VAL_ICM) AS VAL_ICM,'
      '  SUM(VAL_IPI) AS VAL_IPI,'
      '  SUM(VAL_PIS) AS VAL_PIS,'
      
        '  SUM(VAL_TOTAL) + PEGA_DESPESA_NOTA(COD_NOTA_CAB) - PEGA_DESCON' +
        'TO_NOTA(COD_NOTA_CAB) AS VAL_TOTAL,'
      '  SUM(VAL_MERCADORIAS) AS VAL_MERCADORIAS,'
      '  SUM(VAL_BASE_SUBST) AS VAL_BASE_SUBST,'
      '  SUM(VAL_ICMS_SUBST) AS VAL_ICMS_SUBST,'
      '  SUM(VL_SERV_NT) AS VL_SERV_NT,'
      '  COD_ENERGIA_TENSAO,'
      '  COD_CLASSE_CONSUMO,'
      '  IND_TIPO_ENERGIA,'
      '  '#39' '#39' as FIN_DOCe,'
      '  '#39' '#39' as CHV_DOCe_REF,'
      '  '#39' '#39' as COD_MUN_DEST,'
      '  '#39' '#39' as FIN_DOCe,'
      '  '#39' '#39' as CHV_DOCe_REF'
      '  '
      'FROM'
      '('
      ''
      'SELECT'
      '  O.COD_OPERACAO,'
      '  N.COD_NOTA_CAB,'
      '  N.IND_ENTRADA_SAIDA,'
      '  N.IND_CONDICAO_PAGTO,'
      '  N.NUM_NOTA + 0.00 AS NUM_NOTA,'
      '  N.DT_EMISSAO,'
      '  N.DT_RECEBIMENTO,'
      '  N.DT_MOVIMENTO,'
      '  N.VAL_AVISTA,'
      '  N.VAL_IMPOSTO,'
      '  N.COD_CADASTRO,'
      '  N.COD_SERIE,'
      '  substr(N.DESC_CHAVE_ACESSO, 4, 44) as DESC_CHAVE_ACESSO,'
      '  N.VAL_DESCONTO,'
      '  N.VAL_DESPESAS,'
      '  N.IND_SITUACAO,'
      '  O.IND_EMITE,'
      '  S.COD_SERIE_MODELO,'
      '  S.NUM_SERIE_FISCAL,'
      '  SUM(I.VAL_CONFINS) as VAL_CONFINS,'
      '  SUM(I.VAL_ICM_BASE) as VAL_ICM_BASE,'
      '  SUM(I.VAL_ICM) as VAL_ICM,'
      
        '  SUM(CASE WHEN (I.COD_CST_IPI IN ('#39'00'#39', '#39'50'#39')) THEN I.VAL_IPI E' +
        'LSE 0 END) as VAL_IPI,'
      '  SUM(I.VAL_PIS) as VAL_PIS,'
      '  SUM(I.VAL_TOTAL) AS VAL_TOTAL,'
      '  SUM( -- Assume SERVI'#199'O como taxa de ilumina'#231#227'o p'#250'blica'
      '    DECODE(P.IND_TIPO_PRODUTO, '#39'SERVI'#199'O'#39', 0, I.VAL_TOTAL)'
      '  ) as VAL_MERCADORIAS,'
      '  SUM(I.VAL_BASE_SUBST) as VAL_BASE_SUBST,'
      '  SUM(I.VAL_ICMS_SUBST) as VAL_ICMS_SUBST,'
      '  SUM( -- Assume SERVI'#199'O como taxa de ilumina'#231#227'o p'#250'blica'
      '    DECODE(P.IND_TIPO_PRODUTO, '#39'SERVI'#199'O'#39', I.VAL_TOTAL, 0)'
      '  ) AS VL_SERV_NT,'
      '  F.COD_ENERGIA_TENSAO,'
      '  F.COD_CLASSE_CONSUMO,'
      '  F.IND_TIPO_ENERGIA'
      ''
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE S ON (N.COD_SERIE = S.COD_SERIE AND S.COD_FI' +
        'LIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = S.COD_SERIE_MODELO)'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL'
      
        'LEFT JOIN TB_NOTA_REFERENCIADA NR ON N.COD_NOTA_CAB = NR.COD_NOT' +
        'A_CAB'
      'WHERE'
      '  N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'AND'
      '  I.COD_PRODUTO = P.COD_PRODUTO'
      'AND'
      '  N.COD_OPERACAO = O.COD_OPERACAO'
      'AND'
      '  (N.COD_SERIE = S.COD_SERIE AND N.COD_FILIAL = S.COD_FILIAL)'
      'AND'
      '  N.COD_FILIAL = F.COD_FILIAL'
      'AND'
      
        '  ((P.IND_TIPO_PRODUTO = '#39'GAS'#39') OR (P.IND_TIPO_PRODUTO = '#39'ENERGI' +
        'A'#39') OR (P.IND_TIPO_PRODUTO = '#39'AGUA'#39'))'
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  (S.COD_SERIE_MODELO = '#39'06'#39' OR S.COD_SERIE_MODELO = '#39'66'#39' '
      
        '  OR (S.COD_SERIE_MODELO = '#39'55'#39' AND O.COD_BC_CREDITO_PISCOFINS =' +
        ' 4))'
      'GROUP BY'
      '  O.COD_OPERACAO,'
      '  N.COD_NOTA_CAB,'
      '  N.VAL_FRETE,'
      '  N.VAL_DESCONTO,'
      '  N.IND_TIPO_FRETE,'
      '  N.IND_ENTRADA_SAIDA,'
      '  N.IND_CONDICAO_PAGTO,'
      '  N.NUM_NOTA,'
      '  N.DT_EMISSAO,'
      '  N.DT_RECEBIMENTO,'
      '  N.DT_MOVIMENTO,'
      '  N.VAL_DESPESAS,'
      '  N.VAL_AVISTA,'
      '  N.VAL_IMPOSTO,'
      '  N.COD_CADASTRO,'
      '  N.COD_SERIE,'
      '  substr(N.DESC_CHAVE_ACESSO, 4, 44),'
      '  N.VAL_DESCONTO,'
      '  N.IND_TIPO_FRETE,'
      '  N.VAL_FRETE,'
      '  N.VAL_DESPESAS,'
      '  N.IND_SITUACAO,'
      '  O.IND_EMITE,'
      '  S.COD_SERIE_MODELO,'
      '  S.NUM_SERIE_FISCAL,'
      '  N.NUM_CONHECIMENTO_FRETE,'
      '  N.IND_TIPO_FRETE,'
      '  F.COD_ENERGIA_TENSAO,'
      '  F.COD_CLASSE_CONSUMO,'
      '  F.IND_TIPO_ENERGIA,'
      '  P.IND_TIPO_PRODUTO,'
      '  I.VAL_TOTAL'
      'ORDER BY'
      '  N.IND_ENTRADA_SAIDA DESC,'
      '  N.DT_RECEBIMENTO'
      ')'
      ''
      'GROUP BY'
      '  COD_OPERACAO,'
      '  COD_NOTA_CAB,'
      '  IND_ENTRADA_SAIDA,'
      '  IND_CONDICAO_PAGTO,'
      '  NUM_NOTA,'
      '  DT_EMISSAO,'
      '  DT_RECEBIMENTO,'
      '  DT_MOVIMENTO,'
      '  COD_CADASTRO,'
      '  COD_SERIE,'
      '  DESC_CHAVE_ACESSO,'
      '  IND_SITUACAO,'
      '  IND_EMITE,'
      '  COD_SERIE_MODELO,'
      '  NUM_SERIE_FISCAL,'
      '  COD_ENERGIA_TENSAO,'
      '  COD_CLASSE_CONSUMO,'
      '  IND_TIPO_ENERGIA')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000240000000900000056414C5F544F54414C0100000000000C00000056
      414C5F444553434F4E544F0100000000000C000000434F445F4E4F54415F4341
      420100000000000C000000434F445F434144415354524F0100000000000C0000
      00494E445F534954554143414F01000000000009000000434F445F5345524945
      010000000000080000004E554D5F4E4F54410100000000000A00000044545F45
      4D495353414F0100000000000E00000044545F5245434542494D454E544F0100
      00000000100000004E554D5F53455249455F46495343414C0100000000001100
      0000494E445F454E54524144415F534149444101000000000009000000494E44
      5F454D4954450100000000000700000056414C5F504953010000000000120000
      00494E445F434F4E444943414F5F504147544F0100000000000C00000044545F
      4D4F56494D454E544F0100000000000A00000056414C5F415649535441010000
      0000000B00000056414C5F494D504F53544F0100000000001100000044455343
      5F43484156455F41434553534F0100000000000C00000056414C5F4445535045
      5341530100000000000B00000056414C5F434F4E46494E530100000000000C00
      000056414C5F49434D5F424153450100000000000700000056414C5F49434D01
      00000000000700000056414C5F4950490100000000000F00000056414C5F4D45
      524341444F524941530100000000000E00000056414C5F424153455F53554253
      540100000000000E00000056414C5F49434D535F535542535401000000000012
      000000434F445F454E45524749415F54454E53414F0100000000001200000043
      4F445F434C415353455F434F4E53554D4F01000000000010000000494E445F54
      49504F5F454E455247494101000000000010000000434F445F53455249455F4D
      4F44454C4F0100000000000A000000564C5F534552565F4E5401000000000008
      00000046494E5F444F43450100000000000C000000434F445F4D554E5F444553
      540100000000000C0000004348565F444F43455F5245460100000000000A0000
      0046494E5F444F43455F310100000000000E0000004348565F444F43455F5245
      465F31010000000000}
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 128
    object QReg500COD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QReg500IND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 1
    end
    object QReg500IND_CONDICAO_PAGTO: TStringField
      FieldName = 'IND_CONDICAO_PAGTO'
      Required = True
      Size = 1
    end
    object QReg500NUM_NOTA: TFloatField
      FieldName = 'NUM_NOTA'
    end
    object QReg500DT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QReg500DT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
    end
    object QReg500DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Required = True
    end
    object QReg500VAL_AVISTA: TFloatField
      FieldName = 'VAL_AVISTA'
    end
    object QReg500VAL_IMPOSTO: TFloatField
      FieldName = 'VAL_IMPOSTO'
    end
    object QReg500COD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QReg500COD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QReg500DESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Size = 44
    end
    object QReg500VAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
    end
    object QReg500VAL_DESPESAS: TFloatField
      FieldName = 'VAL_DESPESAS'
      Required = True
    end
    object QReg500IND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Required = True
      Size = 1
    end
    object QReg500IND_EMITE: TStringField
      FieldName = 'IND_EMITE'
      Required = True
      Size = 1
    end
    object QReg500NUM_SERIE_FISCAL: TIntegerField
      FieldName = 'NUM_SERIE_FISCAL'
    end
    object QReg500VAL_CONFINS: TFloatField
      FieldName = 'VAL_CONFINS'
    end
    object QReg500VAL_ICM_BASE: TFloatField
      FieldName = 'VAL_ICM_BASE'
    end
    object QReg500VAL_ICM: TFloatField
      FieldName = 'VAL_ICM'
    end
    object QReg500VAL_IPI: TFloatField
      FieldName = 'VAL_IPI'
    end
    object QReg500VAL_PIS: TFloatField
      FieldName = 'VAL_PIS'
    end
    object QReg500VAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QReg500VAL_MERCADORIAS: TFloatField
      FieldName = 'VAL_MERCADORIAS'
    end
    object QReg500VAL_BASE_SUBST: TFloatField
      FieldName = 'VAL_BASE_SUBST'
    end
    object QReg500VAL_ICMS_SUBST: TFloatField
      FieldName = 'VAL_ICMS_SUBST'
    end
    object QReg500COD_ENERGIA_TENSAO: TStringField
      FieldName = 'COD_ENERGIA_TENSAO'
      Size = 100
    end
    object QReg500COD_CLASSE_CONSUMO: TStringField
      FieldName = 'COD_CLASSE_CONSUMO'
      Size = 100
    end
    object QReg500IND_TIPO_ENERGIA: TIntegerField
      FieldName = 'IND_TIPO_ENERGIA'
    end
    object QReg500COD_SERIE_MODELO: TStringField
      FieldName = 'COD_SERIE_MODELO'
      Required = True
      Size = 2
    end
    object QReg500VL_SERV_NT: TFloatField
      FieldName = 'VL_SERV_NT'
    end
  end
  object QReg590: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  T.PERC_ALIQUOTA AS ALIQ_ICMS,'
      '  T.DESC_SITUACAO_TRIB CST_ICMS,'
      
        '  cast(DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_CFOP, nul' +
        'l, O_N.NUM_NATUREZA_EST_NOVO, I.COD_CFOP), decode(I.COD_CFOP, nu' +
        'll, O_N.NUM_NATUREZA_INT_NOVO, I.COD_OPERACAO)) as number(4)) + ' +
        '0.00 AS CFOP,'
      
        '--  Sum(I.VAL_TOTAL + I.VAL_DESPESAS - I.VAL_DESCONTO) AS VL_OPR' +
        ','
      '  Sum(I.VAL_TOTAL) AS VL_OPR,'
      '  Sum(I.VAL_ICM_BASE) AS VL_BC_ICMS,'
      '  Sum(I.VAL_ICM) AS VL_ICMS,'
      '  Sum(I.VAL_BASE_SUBST) AS VL_BC_ICMS_ST,'
      '  Sum(I.VAL_ICMS_SUBST) AS VL_ICMS_ST,'
      
        '  Sum(Decode(NUM_CLASSIFICACAO,2,I.VAL_TOTAL + I.VAL_DESPESAS - ' +
        'I.VAL_DESCONTO - I.VAL_BASE_SUBST,0)) as VL_RED_BC,'
      
        '  Sum(CASE WHEN (I.COD_CST_IPI IN ('#39'00'#39', '#39'50'#39')) THEN I.VAL_IPI E' +
        'LSE 0 END) VL_IPI'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_OPERACAO O_N ON N.COD_OPERACAO = O_N.COD_OPERACAO'
      'LEFT JOIN TB_OPERACAO O_I ON I.COD_OPERACAO = O_I.COD_OPERACAO'
      'INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL'
      
        'INNER JOIN TB_TRIBUTACAO T ON I.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      'INNER JOIN TB_ESTADO E ON N.COD_ESTADO = E.COD_ESTADO'
      'WHERE'
      '  N.COD_NOTA_CAB = :COD_NOTA_CAB'
      'AND  T.DESC_SITUACAO_TRIB IS NOT NULL'
      'GROUP BY'
      '  T.PERC_ALIQUOTA,'
      '  T.DESC_SITUACAO_TRIB,'
      
        '  cast(DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_CFOP, nul' +
        'l, O_N.NUM_NATUREZA_EST_NOVO, I.COD_CFOP), decode(I.COD_CFOP, nu' +
        'll, O_N.NUM_NATUREZA_INT_NOVO, I.COD_OPERACAO)) as number(4)) + ' +
        '0.00'
      ''
      ''
      ''
      ''
      ''
      '/*'
      'SELECT'
      '  T.PERC_ALIQUOTA AS ALIQ_ICMS,'
      '  T.DESC_SITUACAO_TRIB CST_ICMS,'
      
        '  cast(DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_OPERACAO,' +
        ' null, O_N.NUM_NATUREZA_EST_NOVO, O_I.NUM_NATUREZA_EST_NOVO), de' +
        'code(I.COD_OPERACAO, null, O_N.NUM_NATUREZA_INT_NOVO, O_I.NUM_NA' +
        'TUREZA_INT_NOVO)) as number(4)) + 0.00 AS CFOP,'
      '--  Sum(I.VAL_TOTAL + I.VAL_DESPESAS - I.VAL_DESCONTO) AS VL_OPR'
      
        '  SUM(I.VAL_TOTAL + (case when N.VAL_DESPESAS > 0 then I.VAL_DES' +
        'PESAS else 0 end) - (case when N.VAL_DESCONTO > 0 then I.VAL_DES' +
        'CONTO else 0 end)) as VAL_OPR'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_OPERACAO O_N ON N.COD_OPERACAO = O_N.COD_OPERACAO'
      'LEFT JOIN TB_OPERACAO O_I ON I.COD_OPERACAO = O_I.COD_OPERACAO'
      'INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL'
      
        'INNER JOIN TB_TRIBUTACAO T ON I.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      'INNER JOIN TB_ESTADO E ON N.COD_ESTADO = E.COD_ESTADO'
      'WHERE'
      '  N.COD_NOTA_CAB = :COD_NOTA_CAB'
      'GROUP BY'
      '  T.PERC_ALIQUOTA,'
      '  T.DESC_SITUACAO_TRIB,'
      
        '  cast(DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_OPERACAO,' +
        ' null, O_N.NUM_NATUREZA_EST_NOVO, O_I.NUM_NATUREZA_EST_NOVO), de' +
        'code(I.COD_OPERACAO, null, O_N.NUM_NATUREZA_INT_NOVO, O_I.NUM_NA' +
        'TUREZA_INT_NOVO)) as number(4))'
      '*/')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A00000009000000414C49515F49434D530100000000000800000043
      53545F49434D530100000000000400000043464F500100000000000600000056
      4C5F4F50520100000000000A000000564C5F42435F49434D5301000000000007
      000000564C5F49434D530100000000000D000000564C5F42435F49434D535F53
      540100000000000A000000564C5F49434D535F53540100000000000900000056
      4C5F5245445F424301000000000006000000564C5F495049010000000000}
    Session = DMOracle.DBCemapa
    Left = 80
    Top = 128
    object QReg590ALIQ_ICMS: TFloatField
      FieldName = 'ALIQ_ICMS'
      Required = True
    end
    object QReg590CST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Size = 3
    end
    object QReg590CFOP: TFloatField
      FieldName = 'CFOP'
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
    object QReg590VL_IPI: TFloatField
      FieldName = 'VL_IPI'
    end
  end
  object QReg112: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_ESTADO.DESC_SIGLA_ESTADO,'
      '  TB_NOTA_GNRE.*'
      'FROM'
      '  TB_NOTA_GNRE'
      
        'INNER JOIN TB_ESTADO ON TB_NOTA_GNRE.COD_UF = TB_ESTADO.COD_ESTA' +
        'DO'
      'WHERE'
      '  COD_NOTA_CAB = :COD_NOTA_CAB')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000D000000434F445F4E4F54415F474E52450100000000000C
      000000434F445F4E4F54415F43414201000000000019000000494E445F444F43
      554D454E544F5F415252454341444143414F01000000000006000000434F445F
      5546010000000000190000004E554D5F444F43554D454E544F5F415252454341
      444143414F01000000000010000000434F445F415554454E5449434143414F01
      00000000001900000056414C5F444F43554D454E544F5F415252454341444143
      414F0100000000000700000044545F5643544F0100000000000700000044545F
      5047544F01000000000011000000444553435F5349474C415F45535441444F01
      0000000000}
    Session = DMOracle.DBCemapa
    Left = 136
    Top = 16
    object QReg112DESC_SIGLA_ESTADO: TStringField
      FieldName = 'DESC_SIGLA_ESTADO'
      Required = True
      Size = 2
    end
    object QReg112COD_NOTA_GNRE: TIntegerField
      FieldName = 'COD_NOTA_GNRE'
      Required = True
    end
    object QReg112COD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QReg112IND_DOCUMENTO_ARRECADACAO: TStringField
      FieldName = 'IND_DOCUMENTO_ARRECADACAO'
      Required = True
      Size = 1
    end
    object QReg112COD_UF: TStringField
      FieldName = 'COD_UF'
      Required = True
      Size = 2
    end
    object QReg112NUM_DOCUMENTO_ARRECADACAO: TStringField
      FieldName = 'NUM_DOCUMENTO_ARRECADACAO'
      Size = 50
    end
    object QReg112COD_AUTENTICACAO: TStringField
      FieldName = 'COD_AUTENTICACAO'
      Size = 50
    end
    object QReg112VAL_DOCUMENTO_ARRECADACAO: TFloatField
      FieldName = 'VAL_DOCUMENTO_ARRECADACAO'
      Required = True
    end
    object QReg112DT_VCTO: TDateTimeField
      FieldName = 'DT_VCTO'
      Required = True
    end
    object QReg112DT_PGTO: TDateTimeField
      FieldName = 'DT_PGTO'
      Required = True
    end
  end
  object QReg400: TOracleDataSet1
    Session = DMOracle.DBCemapa
    Left = 360
    Top = 72
  end
  object QReg195: TOracleDataSet1
    Session = DMOracle.DBCemapa
    Left = 304
    Top = 72
  end
  object QReg100Inut: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '    1 AS IND_OPER,'
      '    0 AS IND_EMIT,'
      '    COD_SERIE_MODELO AS COD_MOD,'
      '    '#39'05'#39' AS COD_SIT,'
      '    COD_SERIE AS SER,'
      '    NUM_INICIAL,'
      '    NUM_FINAL,'
      '    DT_INUTILIZACAO'
      'FROM'
      '    TB_NF_ELETRONICA_INUT'
      'WHERE'
      
        '    --TO_DATE(DT_INUTILIZACAO, '#39'DD/MM/YY'#39') BETWEEN TO_DATE(:DATA' +
        '_INI, '#39'DD/MM/YY'#39') AND TO_DATE(:DATA_FIN, '#39'DD/MM/YY'#39')'
      '    DT_INUTILIZACAO between :DATA_INI and :DATA_FIN '
      '    AND'
      '    COD_FILIAL = :COD_FILIAL'
      '    AND'
      '    DESC_SITUACAO = '#39'I'#39
      '    AND'
      '    COD_SERIE_MODELO = '#39'55'#39)
    Variables.Data = {
      0300000003000000090000003A444154415F494E490C00000000000000000000
      00090000003A444154415F46494E0C00000000000000000000000B0000003A43
      4F445F46494C49414C030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000008000000494E445F4F50455201000000000008000000494E
      445F454D495401000000000007000000434F445F4D4F44010000000000070000
      00434F445F534954010000000000030000005345520100000000000B0000004E
      554D5F494E494349414C010000000000090000004E554D5F46494E414C010000
      000000}
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 184
    object QReg100InutIND_OPER: TFloatField
      FieldName = 'IND_OPER'
    end
    object QReg100InutIND_EMIT: TFloatField
      FieldName = 'IND_EMIT'
    end
    object QReg100InutCOD_MOD: TIntegerField
      FieldName = 'COD_MOD'
    end
    object QReg100InutCOD_SIT: TStringField
      FieldName = 'COD_SIT'
      Size = 2
    end
    object QReg100InutSER: TStringField
      FieldName = 'SER'
      Size = 3
    end
    object QReg100InutNUM_INICIAL: TIntegerField
      FieldName = 'NUM_INICIAL'
    end
    object QReg100InutNUM_FINAL: TIntegerField
      FieldName = 'NUM_FINAL'
    end
  end
  object RegistroC185: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  N.IND_ENTRADA_SAIDA,'
      '  T.PERC_ALIQUOTA AS ALIQ_ICMS,'
      '    CASE'
      '        WHEN F.IND_REGIME_TRIBUTARIO = 1 THEN --CSOSN'
      '            CASE '
      '                WHEN C.IND_FISICA_JURIDICA = '#39'F'#39' THEN'
      '                    T.DESC_CSOSN_NC'
      '                ELSE'
      '                    CASE '
      
        '                        WHEN ((C.IND_FISICA_JURIDICA = '#39'J'#39') AND ' +
        '(((C.NUM_INSCRICAO = '#39'ISENTO'#39') AND (C.IND_CONTRIBUINTE = '#39'NAO'#39'))' +
        ' OR (C.NUM_INSCRICAO = '#39#39'))) THEN'
      '                            T.DESC_CSOSN_NC'
      '                        ELSE'
      '                            T.DESC_CSOSN'
      '                    END'
      '            END'
      '        ELSE --CST'
      '            CASE '
      '                WHEN C.IND_FISICA_JURIDICA = '#39'F'#39' THEN'
      '                    T.DESC_SITUACAO_TRIB_NC'
      '                ELSE'
      '                    CASE '
      
        '                        WHEN ((C.IND_FISICA_JURIDICA = '#39'J'#39') AND ' +
        '(((C.NUM_INSCRICAO = '#39'ISENTO'#39') AND (C.IND_CONTRIBUINTE = '#39'NAO'#39'))' +
        ' OR (C.NUM_INSCRICAO = '#39#39'))) THEN'
      '                            T.DESC_SITUACAO_TRIB_NC'
      '                        ELSE'
      '                            T.DESC_SITUACAO_TRIB'
      '                    END'
      '            END                     '
      '    END AS CST_ICMS,'
      '  '
      
        '  -- BUSCA O CFOP QUE FOI INFORMADO NO ITEM OU NA OPERACAO E DIS' +
        'TINGUE SE '#201' INTERESTADUAL E POSSUI ST'
      '  cast('
      '    DECODE('
      '      F.COD_ESTADO, '
      '      N.COD_ESTADO, '
      '      decode('
      '        I.COD_CFOP, '
      '        null, '
      '        CASE '
      
        '          WHEN /*T.DESC_SITUACAO_TRIB IN ('#39'010'#39','#39'030'#39','#39'060'#39','#39'070' +
        #39')*/ (SUM(I.VAL_ICMS_SUBST) > 0) AND (PS.COD_EMPRESA <> '#39'CGS'#39') T' +
        'HEN O_N.COD_CFOP_ST'
      
        '          WHEN /*T.DESC_CSOSN IN ('#39'201'#39','#39'202'#39','#39'203'#39','#39'500'#39')*/ (SU' +
        'M(I.VAL_ICMS_SUBST) > 0) AND (PS.COD_EMPRESA <> '#39'CGS'#39') THEN O_N.' +
        'COD_CFOP_ST'
      
        '          WHEN PS.COD_EMPRESA = '#39'CGS'#39' THEN O_N.NUM_NATUREZA_EST_' +
        'NOVO'
      '          ELSE O_N.NUM_NATUREZA_EST_NOVO'
      '        END, '
      '        I.COD_CFOP'
      '      ), '
      '      decode('
      '        I.COD_CFOP, '
      '        null,         '
      '        CASE '
      
        '          WHEN /*T.DESC_SITUACAO_TRIB IN ('#39'010'#39','#39'030'#39','#39'060'#39','#39'070' +
        #39')*/ (SUM(I.VAL_ICMS_SUBST) > 0) AND (PS.COD_EMPRESA <> '#39'CGS'#39') T' +
        'HEN O_N.COD_CFOP_INT_ST'
      
        '          WHEN /*T.DESC_CSOSN IN ('#39'201'#39','#39'202'#39','#39'203'#39','#39'500'#39')*/ (SU' +
        'M(I.VAL_ICMS_SUBST) > 0) AND (PS.COD_EMPRESA <> '#39'CGS'#39') THEN O_N.' +
        'COD_CFOP_INT_ST'
      
        '          WHEN PS.COD_EMPRESA = '#39'CGS'#39' THEN O_N.NUM_NATUREZA_INT_' +
        'NOVO'
      '          ELSE O_N.NUM_NATUREZA_INT_NOVO'
      '        END, '
      '        I.COD_CFOP'
      '      )'
      '    ) as number(4)'
      '  ) + 0.00 AS CFOP,'
      '  '
      '  '
      '  CASE'
      '    WHEN PS.COD_EMPRESA = '#39'CGS'#39' THEN'
      
        '      (SUM(I.VAL_TOTAL - NVL(I.VAL_DESCONTO,0)) + N.VAL_DESPESAS' +
        ' + (CASE WHEN ((N.NUM_CONHECIMENTO_FRETE IS NOT NULL) AND (N.IND' +
        '_ENTRADA_SAIDA = '#39'E'#39') AND (N.IND_TIPO_FRETE = '#39'FOB'#39')) THEN 0.00 ' +
        'ELSE N.VAL_FRETE END) + SUM(I.VAL_ICMS_SUBST) + SUM(CASE WHEN (I' +
        '.COD_CST_IPI IN ('#39'00'#39', '#39'50'#39', '#39'49'#39', '#39'99'#39')) THEN I.VAL_IPI ELSE 0 ' +
        'END))/* - N.VAL_DESCONTO)*/'
      '    WHEN PS.COD_EMPRESA = '#39'BEGNINI'#39' THEN'
      '      (SUM(I.VAL_TOTAL + I.VAL_DESPESAS) - N.VAL_DESCONTO)'
      '    ELSE'
      
        '      (SUM(I.VAL_TOTAL - PEGA_DESCONTO_ITEM(I.COD_NOTA_ITEM) + I' +
        '.VAL_DESPESAS +       '
      
        '      -- C'#211'DIGO INSERIDO PARA N'#195'O CONSIDERAR ST DE NOTAS COM SUB' +
        'STITUI'#199#195'O TRIBUT'#193'RIA CALCULADA ANTERIORMENTE NO COMPRAS'
      '        CASE'
      
        '            WHEN ((T.DESC_SITUACAO_TRIB LIKE '#39'%60'#39' OR T.DESC_CSO' +
        'SN LIKE '#39'500'#39')'
      
        '                AND (C.IND_FISICA_JURIDICA = '#39'J'#39' AND C.NUM_INSCR' +
        'ICAO IS NOT NULL AND C.NUM_INSCRICAO <> '#39'ISENTO'#39
      '                AND C.IND_CONTRIBUINTE = '#39'SIM'#39')) THEN    '
      '                    0 '
      '        '
      '            ELSE'
      '                I.VAL_ICMS_SUBST '
      '        END        '
      
        '      + CASE WHEN (I.COD_CST_IPI IN ('#39'00'#39', '#39'50'#39', '#39'49'#39', '#39'99'#39')) TH' +
        'EN I.VAL_IPI ELSE 0 END))'
      '  END AS VL_OPR,'
      '  Sum(I.VAL_ICM_BASE) AS VL_BC_ICMS,'
      '  Sum(I.VAL_ICM) AS VL_ICMS,'
      
        '  --DECODE(N.IND_ST, '#39'S'#39', Sum(I.VAL_BASE_SUBST), 0.00) AS VL_BC_' +
        'ICMS_ST,'
      
        '  --DECODE(N.IND_ST, '#39'S'#39', Sum(I.VAL_ICMS_SUBST), 0.00) AS VL_ICM' +
        'S_ST,'
      '  /*SUM(CASE '
      
        #9'WHEN T.DESC_SITUACAO_TRIB IN ('#39'010'#39','#39'030'#39','#39'060'#39','#39'070'#39') THEN I.V' +
        'AL_BASE_SUBST'
      
        #9'WHEN T.DESC_CSOSN IN ('#39'201'#39','#39'202'#39','#39'203'#39','#39'500'#39') THEN I.VAL_BASE_' +
        'SUBST'
      '  END) AS VL_BC_ICMS_ST, '
      '  SUM(CASE '
      
        #9'WHEN T.DESC_SITUACAO_TRIB IN ('#39'010'#39','#39'030'#39','#39'060'#39','#39'070'#39') THEN I.V' +
        'AL_ICMS_SUBST'
      
        #9'WHEN T.DESC_CSOSN IN ('#39'201'#39','#39'202'#39','#39'203'#39','#39'500'#39') THEN I.VAL_ICMS_' +
        'SUBST'
      '  END) AS VL_ICMS_ST,*/'
      '  SUM(I.VAL_BASE_SUBST) AS VL_BC_ICMS_ST,'
      '  SUM(I.VAL_ICMS_SUBST) AS VL_ICMS_ST,'
      
        '  Sum(Decode(NUM_CLASSIFICACAO,2/*PARTE ISENTO*/,I.VAL_TOTAL + I' +
        '.VAL_DESPESAS - I.VAL_DESCONTO - I.VAL_BASE_SUBST,'
      
        '    Decode(NUM_CLASSIFICACAO,4/*ISENTO*/,I.VAL_TOTAL,0))) as VL_' +
        'RED_BC,  '
      
        '  Sum(CASE WHEN (I.COD_CST_IPI IN ('#39'00'#39', '#39'50'#39', '#39'49'#39', '#39'99'#39')) THEN' +
        ' I.VAL_IPI ELSE 0 END) VL_IPI'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_OPERACAO O_N ON N.COD_OPERACAO = O_N.COD_OPERACAO'
      'LEFT JOIN TB_OPERACAO O_I ON I.COD_OPERACAO = O_I.COD_OPERACAO'
      'INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL'
      
        'INNER JOIN TB_TRIBUTACAO T ON I.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      'INNER JOIN TB_ESTADO E ON N.COD_ESTADO = E.COD_ESTADO'
      'INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  N.COD_NOTA_CAB = :COD_NOTA_CAB'
      'GROUP BY'
      '  N.IND_ENTRADA_SAIDA,'
      '  T.PERC_ALIQUOTA,'
      '  CASE'
      '        WHEN F.IND_REGIME_TRIBUTARIO = 1 THEN --CSOSN'
      '            CASE '
      '                WHEN C.IND_FISICA_JURIDICA = '#39'F'#39' THEN'
      '                    T.DESC_CSOSN_NC'
      '                ELSE'
      '                    CASE '
      
        '                        WHEN ((C.IND_FISICA_JURIDICA = '#39'J'#39') AND ' +
        '(((C.NUM_INSCRICAO = '#39'ISENTO'#39') AND (C.IND_CONTRIBUINTE = '#39'NAO'#39'))' +
        ' OR (C.NUM_INSCRICAO = '#39#39'))) THEN'
      '                            T.DESC_CSOSN_NC'
      '                        ELSE'
      '                            T.DESC_CSOSN'
      '                    END'
      '            END'
      '        ELSE --CST'
      '            CASE '
      '                WHEN C.IND_FISICA_JURIDICA = '#39'F'#39' THEN'
      '                    T.DESC_SITUACAO_TRIB_NC'
      '                ELSE'
      '                    CASE '
      
        '                        WHEN ((C.IND_FISICA_JURIDICA = '#39'J'#39') AND ' +
        '(((C.NUM_INSCRICAO = '#39'ISENTO'#39') AND (C.IND_CONTRIBUINTE = '#39'NAO'#39'))' +
        ' OR (C.NUM_INSCRICAO = '#39#39'))) THEN'
      '                            T.DESC_SITUACAO_TRIB_NC'
      '                        ELSE'
      '                            T.DESC_SITUACAO_TRIB'
      '                    END'
      '            END                     '
      '    END,'
      '  cast('
      
        '    DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_CFOP, null, ' +
        'O_N.NUM_NATUREZA_EST_NOVO, I.COD_CFOP), decode(I.COD_CFOP, null,' +
        ' O_N.NUM_NATUREZA_INT_NOVO, I.COD_CFOP)) '
      '  as number(4)) + 0.00,'
      '  N.VAL_DESPESAS,'
      '  N.NUM_CONHECIMENTO_FRETE,'
      '  N.IND_ENTRADA_SAIDA,'
      '  N.IND_TIPO_FRETE,'
      '  N.VAL_FRETE,'
      '  N.VAL_DESCONTO,'
      '  PS.COD_EMPRESA,  '
      '  N.IND_ST,'
      '  F.COD_ESTADO, '
      '  N.COD_ESTADO,      '
      '  I.COD_CFOP, '
      '  PS.COD_EMPRESA,'
      '  O_N.COD_CFOP_ST,'
      '  O_N.COD_CFOP_ST,'
      '  O_N.NUM_NATUREZA_EST_NOVO, '
      '  O_N.COD_CFOP_INT_ST,'
      '  O_N.COD_CFOP_INT_ST,'
      '  O_N.NUM_NATUREZA_INT_NOVO')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B00000009000000414C49515F49434D530100000000000800000043
      53545F49434D530100000000000400000043464F500100000000000A00000056
      4C5F42435F49434D5301000000000007000000564C5F49434D53010000000000
      0A000000564C5F49434D535F535401000000000009000000564C5F5245445F42
      4301000000000006000000564C5F49504901000000000006000000564C5F4F50
      520100000000000D000000564C5F42435F49434D535F53540100000000001100
      0000494E445F454E54524144415F5341494441010000000000}
    Session = DMOracle.DBCemapa
    Left = 192
    Top = 72
    object FloatField1: TFloatField
      FieldName = 'ALIQ_ICMS'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'CST_ICMS'
      Size = 3
    end
    object FloatField2: TFloatField
      FieldName = 'CFOP'
    end
    object FloatField3: TFloatField
      FieldName = 'VL_BC_ICMS'
    end
    object FloatField4: TFloatField
      FieldName = 'VL_ICMS'
    end
    object FloatField5: TFloatField
      FieldName = 'VL_BC_ICMS_ST'
    end
    object FloatField6: TFloatField
      FieldName = 'VL_ICMS_ST'
    end
    object FloatField7: TFloatField
      FieldName = 'VL_RED_BC'
    end
    object FloatField8: TFloatField
      FieldName = 'VL_IPI'
    end
    object FloatField9: TFloatField
      FieldName = 'VL_OPR'
    end
    object StringField2: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 1
    end
  end
  object QReg190: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '  N_CALC.IND_ENTRADA_SAIDA,'
      '  N_CALC.ALIQ_ICMS,'
      '  N_CALC.CST_ICMS,'
      '  N_CALC.CFOP,'
      '  SUM(N_CALC.VL_OPR_BRUTO) AS VL_OPR,'
      '  SUM(N_CALC.VL_BC_ICMS) AS VL_BC_ICMS,'
      '  SUM(N_CALC.VL_ICMS) AS VL_ICMS,'
      '  SUM(N_CALC.VL_BC_ICMS_ST) AS VL_BC_ICMS_ST,'
      '  SUM(N_CALC.VL_ICMS_ST) AS VL_ICMS_ST,'
      '  SUM(N_CALC.VL_RED_BC) AS VL_RED_BC,  '
      '  SUM(N_CALC.VL_IPI) AS VL_IPI'
      'FROM ('
      
        '  -- CAMADA INTERMEDI'#193'RIA: Calcula o CST e CFOP finais para cada' +
        ' linha de item'
      '  SELECT '
      '    N_GRP.IND_ENTRADA_SAIDA,'
      '    N_GRP.PERC_ALIQUOTA AS ALIQ_ICMS,'
      '    '
      '    -- C'#225'lculo do CST'
      '    CASE'
      '      WHEN F.IND_REGIME_TRIBUTARIO = 1 THEN'
      '        CASE '
      '          WHEN C.IND_FISICA_JURIDICA = '#39'F'#39' THEN T.DESC_CSOSN_NC'
      '          ELSE'
      '            CASE '
      
        '              WHEN ((C.IND_FISICA_JURIDICA = '#39'J'#39') AND (((C.NUM_I' +
        'NSCRICAO = '#39'ISENTO'#39' OR C.NUM_INSCRICAO IS NULL) AND (C.IND_CONTR' +
        'IBUINTE = '#39'NAO'#39')) OR (C.NUM_INSCRICAO = '#39#39'))) THEN'
      
        '                DECODE(PS.COD_EMPRESA, '#39'CGS'#39', T.DESC_CSOSN, T.DE' +
        'SC_CSOSN_NC)'
      '              ELSE T.DESC_CSOSN'
      '            END'
      '        END'
      '      ELSE'
      '        CASE '
      
        '          WHEN C.IND_FISICA_JURIDICA = '#39'F'#39' THEN T.DESC_SITUACAO_' +
        'TRIB_NC'
      '          ELSE'
      '            CASE '
      
        '              WHEN ((C.IND_FISICA_JURIDICA = '#39'J'#39') AND (((C.NUM_I' +
        'NSCRICAO = '#39'ISENTO'#39' OR C.NUM_INSCRICAO IS NULL) AND (C.IND_CONTR' +
        'IBUINTE = '#39'NAO'#39')) OR (C.NUM_INSCRICAO = '#39#39'))) THEN'
      
        '                DECODE(PS.COD_EMPRESA, '#39'CGS'#39', T.DESC_SITUACAO_TR' +
        'IB, T.DESC_SITUACAO_TRIB_NC)'
      '              ELSE T.DESC_SITUACAO_TRIB'
      '            END'
      '        END                     '
      '    END AS CST_ICMS,'
      '    '
      '    -- C'#225'lculo do CFOP'
      '    CAST('
      '      DECODE('
      '        F.COD_ESTADO, '
      '        N_GRP.COD_ESTADO, '
      '        DECODE('
      '          N_GRP.COD_CFOP, '
      '          NULL, '
      '          CASE '
      
        '            WHEN (N_GRP.VAL_ICMS_SUBST > 0) AND (PS.COD_EMPRESA ' +
        '<> '#39'CGS'#39') THEN O_N.COD_CFOP_ST'
      '            ELSE O_N.NUM_NATUREZA_EST_NOVO'
      '          END, '
      '          N_GRP.COD_CFOP'
      '        ), '
      '        DECODE('
      '          N_GRP.COD_CFOP, '
      '          NULL,         '
      '          CASE '
      
        '            WHEN (N_GRP.VAL_ICMS_SUBST > 0) AND (PS.COD_EMPRESA ' +
        '<> '#39'CGS'#39') THEN O_N.COD_CFOP_INT_ST'
      '            ELSE O_N.NUM_NATUREZA_INT_NOVO'
      '          END, '
      '          N_GRP.COD_CFOP'
      '        )'
      '      ) AS NUMBER(4)'
      '    ) + 0.00 AS CFOP,'
      '    '
      '    -- Valor da Opera'#231#227'o Individual da Linha'
      '    CASE'
      '      WHEN PS.COD_EMPRESA = '#39'CGS'#39' THEN'
      
        '        (N_GRP.VL_OPR_CGS + N_GRP.VAL_DESPESAS + (CASE WHEN ((N_' +
        'GRP.NUM_CONHECIMENTO_FRETE IS NOT NULL) AND (N_GRP.IND_ENTRADA_S' +
        'AIDA = '#39'E'#39') AND (N_GRP.IND_TIPO_FRETE = '#39'FOB'#39')) THEN 0.00 ELSE N' +
        '_GRP.VAL_FRETE END) + N_GRP.VAL_ICMS_SUBST + N_GRP.IPI_FILTRADO)'
      '      WHEN PS.COD_EMPRESA = '#39'BEGNINI'#39' THEN'
      '        (N_GRP.VAL_TOTAL_DESPESAS - N_GRP.VAL_DESCONTO)'
      '      ELSE'
      '        (N_GRP.VL_OPR_PADRAO +        '
      '          CASE'
      
        '            WHEN ((T.DESC_SITUACAO_TRIB LIKE '#39'%60'#39' OR T.DESC_CSO' +
        'SN LIKE '#39'500'#39')'
      
        '                  AND (C.IND_FISICA_JURIDICA = '#39'J'#39' AND C.NUM_INS' +
        'CRICAO IS NOT NULL AND C.NUM_INSCRICAO <> '#39'ISENTO'#39
      '                  AND C.IND_CONTRIBUINTE = '#39'SIM'#39')) THEN 0 '
      '            ELSE N_GRP.VAL_ICMS_SUBST '
      '          END        '
      '        + N_GRP.IPI_FILTRADO)'
      '    END AS VL_OPR_BRUTO,'
      '    '
      '    N_GRP.VL_BC_ICMS,'
      '    N_GRP.VL_ICMS,'
      '    N_GRP.VL_BC_ICMS_ST,'
      '    N_GRP.VAL_ICMS_SUBST AS VL_ICMS_ST,'
      '    N_GRP.VL_RED_BC,  '
      '    N_GRP.IPI_FILTRADO AS VL_IPI'
      '  FROM ('
      
        '    -- SUB-INNER: Isola o bloco de itens e evita o erro original' +
        ' de ROWID do Oracle 10g'
      '    SELECT'
      
        '      N.COD_NOTA_CAB, N.IND_ENTRADA_SAIDA, N.COD_FILIAL, N.COD_E' +
        'STADO, N.COD_CADASTRO, N.COD_OPERACAO,'
      
        '      N.VAL_DESPESAS, N.NUM_CONHECIMENTO_FRETE, N.IND_TIPO_FRETE' +
        ', N.VAL_FRETE, N.VAL_DESCONTO,'
      '      I.COD_TRIBUTACAO, I.COD_CFOP,'
      '      T_IN.PERC_ALIQUOTA,'
      '      I.VAL_ICMS_SUBST,'
      '      (I.VAL_TOTAL - NVL(I.VAL_DESCONTO,0)) AS VL_OPR_CGS,'
      '      (I.VAL_TOTAL + I.VAL_DESPESAS) AS VAL_TOTAL_DESPESAS,'
      
        '      (I.VAL_TOTAL - PEGA_DESCONTO_ITEM(I.COD_NOTA_ITEM) + I.VAL' +
        '_DESPESAS) AS VL_OPR_PADRAO,'
      
        '      (CASE WHEN (I.COD_CST_IPI IN ('#39'00'#39', '#39'50'#39', '#39'49'#39', '#39'99'#39')) THE' +
        'N I.VAL_IPI ELSE 0 END) AS IPI_FILTRADO,'
      '      I.VAL_ICM_BASE AS VL_BC_ICMS,'
      '      I.VAL_ICM AS VL_ICMS,'
      '      I.VAL_BASE_SUBST AS VL_BC_ICMS_ST,'
      
        '      DECODE(NUM_CLASSIFICACAO, 2, I.VAL_TOTAL + I.VAL_DESPESAS ' +
        '- I.VAL_DESCONTO - I.VAL_BASE_SUBST, DECODE(NUM_CLASSIFICACAO, 4' +
        ', I.VAL_TOTAL, 0)) AS VL_RED_BC'
      '    FROM TB_NOTA_ITEM I'
      '    INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      
        '    INNER JOIN TB_TRIBUTACAO T_IN ON I.COD_TRIBUTACAO = T_IN.COD' +
        '_TRIBUTACAO'
      '    WHERE N.COD_NOTA_CAB = :COD_NOTA_CAB'
      '  ) N_GRP'
      
        '  INNER JOIN TB_OPERACAO O_N ON N_GRP.COD_OPERACAO = O_N.COD_OPE' +
        'RACAO'
      '  INNER JOIN TB_FILIAL F     ON N_GRP.COD_FILIAL = F.COD_FILIAL'
      
        '  INNER JOIN TB_TRIBUTACAO T ON N_GRP.COD_TRIBUTACAO = T.COD_TRI' +
        'BUTACAO'
      '  INNER JOIN TB_ESTADO E     ON N_GRP.COD_ESTADO = E.COD_ESTADO'
      
        '  INNER JOIN TB_CADASTRO C   ON N_GRP.COD_CADASTRO = C.COD_CADAS' +
        'TRO'
      '  CROSS JOIN TB_PARAM_SISTEMA PS'
      ') N_CALC'
      'GROUP BY'
      '  N_CALC.IND_ENTRADA_SAIDA,'
      '  N_CALC.ALIQ_ICMS,'
      '  N_CALC.CST_ICMS,'
      '  N_CALC.CFOP')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B00000009000000414C49515F49434D530100000000000800000043
      53545F49434D530100000000000400000043464F500100000000000A00000056
      4C5F42435F49434D5301000000000007000000564C5F49434D53010000000000
      0A000000564C5F49434D535F535401000000000009000000564C5F5245445F42
      4301000000000006000000564C5F49504901000000000006000000564C5F4F50
      520100000000000D000000564C5F42435F49434D535F53540100000000001100
      0000494E445F454E54524144415F5341494441010000000000}
    Session = DMOracle.DBCemapa
    Left = 248
    Top = 72
    object FloatField10: TFloatField
      FieldName = 'ALIQ_ICMS'
      Required = True
    end
    object StringField3: TStringField
      FieldName = 'CST_ICMS'
      Size = 3
    end
    object FloatField11: TFloatField
      FieldName = 'CFOP'
    end
    object FloatField12: TFloatField
      FieldName = 'VL_BC_ICMS'
    end
    object FloatField13: TFloatField
      FieldName = 'VL_ICMS'
    end
    object FloatField14: TFloatField
      FieldName = 'VL_BC_ICMS_ST'
    end
    object FloatField15: TFloatField
      FieldName = 'VL_ICMS_ST'
    end
    object FloatField16: TFloatField
      FieldName = 'VL_RED_BC'
    end
    object FloatField17: TFloatField
      FieldName = 'VL_IPI'
    end
    object FloatField18: TFloatField
      FieldName = 'VL_OPR'
    end
    object StringField4: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 1
    end
  end
end
