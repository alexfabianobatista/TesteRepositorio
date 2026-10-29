object DmPisCofinsF: TDmPisCofinsF
  OldCreateOrder = False
  Left = 589
  Top = 321
  Height = 192
  Width = 350
  object QReg010: TOracleDataSet1
    SQL.Strings = (
      'SELECT DISTINCT'
      '  FILIAL,'
      '  CNPJ'
      'FROM('
      'SELECT'
      '  F.COD_FILIAL FILIAL,'
      '  F.NUM_CGC CNPJ'
      'FROM'
      '  TB_PATRIMONIO_ITEM PI'
      
        '  INNER JOIN TB_PATRIMONIO_DEPRECIACAO PD ON PI.COD_PATRIMONIO_I' +
        'TEM = PD.COD_PATRIMONIO_ITEM'
      '  INNER JOIN TB_FILIAL F ON PI.COD_FILIAL = F.COD_FILIAL'
      'WHERE'
      '  PD.DT_DEPRECIACAO BETWEEN :DATA_INI AND :DATA_FIN'
      '  AND'
      '  PI.COD_FILIAL IN :FILIAIS'
      ''
      'UNION ALL'
      ''
      'SELECT'
      '  F.COD_FILIAL FILIAL,'
      '  F.NUM_CGC CNPJ'
      'FROM'
      '  TB_PATRIMONIO_ITEM PI'
      
        '  INNER JOIN TB_PATRIMONIO_INCORPORACAO PINC ON PI.COD_PATRIMONI' +
        'O_ITEM = PINC.COD_PATRIMONIO_ITEM'
      '  INNER JOIN TB_FILIAL F ON PI.COD_FILIAL = F.COD_FILIAL'
      'WHERE'
      '  PINC.DT_INCORPORACAO BETWEEN :DATA_INI AND :DATA_FIN'
      '  AND'
      '  PI.COD_FILIAL IN :FILIAIS'
      ')')
    Variables.Data = {
      0300000003000000090000003A444154415F494E490C00000000000000000000
      00090000003A444154415F46494E0C0000000000000000000000080000003A46
      494C4941495301000000040000002831290000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000004000000434E504A0100000000000600000046494C49414C
      010000000000}
    Session = DMOracle.DBCemapa
    Left = 16
    Top = 16
    object QReg010CNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object QReg010FILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
  end
  object QReg120: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  '#39'09'#39' NAT_BC_CRED,'
      '  PI.COD_IDENT_BEM_IMOB IDENT_BEM_IMOB,'
      '  PI.COD_ORIG_CRED IND_ORIG_CRED,'
      '  PI.COD_UTIL_BEM_IMOB IND_UTIL_BEM_IMOB,'
      '  PI.COD_CST_PIS_DEPRECIACAO CST_PIS,'
      '  PI.COD_CST_COFINS_DEPRECIACAO CST_COFINS,'
      '  PI.CONTA_CREDITO_DEPRECIACAO COD_CTA,'
      '  PS.PERC_COFINS ALIQ_COFINS,'
      '  PS.PERC_PIS ALIQ_PIS,'
      
        '  NVL(O.COD_BC_CREDITO_PISCOFINS, '#39'09'#39') AS COD_BC_CREDITO_PISCOF' +
        'INS,'
      '  ((SUM(PD.VAL_DEPRECIACAO) * PS.PERC_PIS) / 100) VL_PIS,'
      '  ((SUM(PD.VAL_DEPRECIACAO) * PS.PERC_COFINS) / 100) VL_COFINS,'
      '  SUM(PD.VAL_DEPRECIACAO) VL_BC_PIS,  '
      '  SUM(PD.VAL_DEPRECIACAO) VL_BC_COFINS,'
      '  SUM(PD.VAL_DEPRECIACAO) VL_OPER_DEP'
      '  '
      'FROM'
      '  TB_PATRIMONIO_ITEM PI'
      
        '  INNER JOIN TB_PATRIMONIO_DEPRECIACAO PD ON PI.COD_PATRIMONIO_I' +
        'TEM = PD.COD_PATRIMONIO_ITEM'
      '  INNER JOIN TB_FILIAL F ON PI.COD_FILIAL = F.COD_FILIAL'
      '  INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      
        '  LEFT JOIN TB_NOTA_CAB N ON PI.COD_NOTA_CAB_ENTRADA = N.COD_NOT' +
        'A_CAB'
      '  LEFT JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'WHERE'
      '  (O.PERC_BASE_PIS IS NULL  '
      '    OR '
      '    O.PERC_BASE_PIS = 0)'
      '  AND'
      '  (O.PERC_BASE_COFINS IS NULL'
      '    OR'
      '    O.PERC_BASE_COFINS = 0)'
      '  AND'
      '  PD.DT_DEPRECIACAO BETWEEN :DATA_INI AND :DATA_FIN'
      '  AND'
      '  PI.COD_FILIAL = :COD_FILIAL'
      '  AND'
      '  PI.COD_CST_PIS_DEPRECIACAO IS NOT NULL'
      '  AND'
      '  PI.COD_CST_COFINS_DEPRECIACAO IS NOT NULL'
      ' GROUP BY '
      '  '#39'09'#39', '
      '  PI.COD_IDENT_BEM_IMOB, '
      '  PI.COD_ORIG_CRED, '
      '  PI.COD_UTIL_BEM_IMOB, '
      '  PI.COD_CST_PIS_DEPRECIACAO, '
      '  PI.COD_CST_COFINS_DEPRECIACAO, '
      '  PI.CONTA_CREDITO_DEPRECIACAO, '
      '  PS.PERC_COFINS, PS.PERC_PIS, '
      '  NVL(O.COD_BC_CREDITO_PISCOFINS, '#39'09'#39')'
      
        '  HAVING ((SUM(PD.VAL_DEPRECIACAO) * PS.PERC_PIS) / 100) > 0 AND' +
        ' ((SUM(PD.VAL_DEPRECIACAO) * PS.PERC_COFINS) / 100) > 0')
    Variables.Data = {
      0300000003000000090000003A444154415F494E490C00000000000000000000
      00090000003A444154415F46494E0C00000000000000000000000B0000003A43
      4F445F46494C49414C030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000F0000000B0000004E41545F42435F435245440100000000000E0000
      004944454E545F42454D5F494D4F420100000000000D000000494E445F4F5249
      475F4352454401000000000011000000494E445F5554494C5F42454D5F494D4F
      42010000000000070000004353545F5049530100000000000A0000004353545F
      434F46494E5301000000000007000000434F445F4354410100000000000B0000
      00414C49515F434F46494E5301000000000008000000414C49515F5049530100
      0000000006000000564C5F50495301000000000009000000564C5F434F46494E
      5301000000000009000000564C5F42435F5049530100000000000C000000564C
      5F42435F434F46494E530100000000000B000000564C5F4F5045525F44455001
      000000000018000000434F445F42435F4352454449544F5F504953434F46494E
      53010000000000}
    Session = DMOracle.DBCemapa
    Left = 72
    Top = 16
    object QReg120NAT_BC_CRED: TStringField
      FieldName = 'NAT_BC_CRED'
      Size = 2
    end
    object QReg120IDENT_BEM_IMOB: TStringField
      FieldName = 'IDENT_BEM_IMOB'
      Size = 2
    end
    object QReg120IND_ORIG_CRED: TStringField
      FieldName = 'IND_ORIG_CRED'
      Size = 1
    end
    object QReg120IND_UTIL_BEM_IMOB: TIntegerField
      FieldName = 'IND_UTIL_BEM_IMOB'
    end
    object QReg120CST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object QReg120CST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object QReg120COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 15
    end
    object QReg120ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object QReg120ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object QReg120VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object QReg120VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
    object QReg120VL_BC_PIS: TFloatField
      FieldName = 'VL_BC_PIS'
    end
    object QReg120VL_BC_COFINS: TFloatField
      FieldName = 'VL_BC_COFINS'
    end
    object QReg120VL_OPER_DEP: TFloatField
      FieldName = 'VL_OPER_DEP'
    end
    object QReg120COD_BC_CREDITO_PISCOFINS: TStringField
      FieldName = 'COD_BC_CREDITO_PISCOFINS'
      Size = 2
    end
  end
  object QReg130: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  '#39'10'#39' NAT_BC_CRED,'
      '  PI.COD_IDENT_BEM_IMOB IDENT_BEM_IMOB,'
      '  PI.COD_ORIG_CRED IND_ORIG_CRED,'
      '  PI.COD_UTIL_BEM_IMOB IND_UTIL_BEM_IMOB,'
      
        '  EXTRACT(MONTH FROM PI.DT_AQUISICAO) || EXTRACT(YEAR FROM PI.DT' +
        '_AQUISICAO) MES_OPER_AQUIS,'
      '  1 IND_NR_PARC,  '
      '  PI.COD_CST_PIS_INCORPORACAO CST_PIS,'
      '  PI.COD_CST_COFINS_INCORPORACAO CST_COFINS,'
      '  O.COD_CONTABIL_NOTA_SPED_CONTRIB AS COD_CTA,'
      '  PS.PERC_COFINS ALIQ_COFINS,'
      '  PS.PERC_PIS ALIQ_PIS,  '
      '  PI.VAL_AQUISICAO VL_BC_CRED,'
      '  PI.VAL_AQUISICAO VL_OPER_AQUIS,'
      '  PI.VAL_AQUISICAO VL_BC_PIS,'
      '  PI.VAL_AQUISICAO VL_BC_COFINS,'
      '  (PI.VAL_AQUISICAO*PS.PERC_PIS) / 100 VL_PIS,'
      '  (PI.VAL_AQUISICAO*PS.PERC_COFINS) / 100 VL_COFINS,'
      
        '  NVL(O.COD_BC_CREDITO_PISCOFINS, '#39'10'#39') AS COD_BC_CREDITO_PISCOF' +
        'INS'
      'FROM'
      '  TB_PATRIMONIO_ITEM PI'
      
        '  --INNER JOIN TB_PATRIMONIO_INCORPORACAO P_INC ON PI.COD_PATRIM' +
        'ONIO_ITEM = P_INC.COD_PATRIMONIO_ITEM'
      '  INNER JOIN TB_FILIAL F ON PI.COD_FILIAL = F.COD_FILIAL'
      '  INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      
        '  INNER JOIN TB_NOTA_CAB N ON PI.COD_NOTA_CAB_ENTRADA = N.COD_NO' +
        'TA_CAB'
      '  INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'WHERE'
      '  O.PERC_BASE_PIS IS NOT NULL '
      '  AND '
      '  O.PERC_BASE_PIS > 0'
      '  AND'
      '  O.PERC_BASE_COFINS IS NOT NULL'
      '  AND'
      '  O.PERC_BASE_COFINS > 0'
      '  AND'
      '  PI.DT_AQUISICAO BETWEEN :DATA_INI AND :DATA_FIN'
      '  AND'
      '  PI.COD_FILIAL = :COD_FILIAL')
    Variables.Data = {
      0300000003000000090000003A444154415F494E490C00000000000000000000
      00090000003A444154415F46494E0C00000000000000000000000B0000003A43
      4F445F46494C49414C030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000120000000B0000004E41545F42435F435245440100000000000E0000
      004944454E545F42454D5F494D4F420100000000000D000000494E445F4F5249
      475F4352454401000000000011000000494E445F5554494C5F42454D5F494D4F
      420100000000000E0000004D45535F4F5045525F41515549530100000000000B
      000000494E445F4E525F50415243010000000000070000004353545F50495301
      00000000000A0000004353545F434F46494E5301000000000007000000434F44
      5F4354410100000000000B000000414C49515F434F46494E5301000000000008
      000000414C49515F5049530100000000000A000000564C5F42435F4352454401
      00000000000D000000564C5F4F5045525F415155495301000000000009000000
      564C5F42435F5049530100000000000C000000564C5F42435F434F46494E5301
      000000000006000000564C5F50495301000000000009000000564C5F434F4649
      4E5301000000000018000000434F445F42435F4352454449544F5F504953434F
      46494E53010000000000}
    Session = DMOracle.DBCemapa
    Left = 136
    Top = 16
    object QReg130NAT_BC_CRED: TStringField
      FieldName = 'NAT_BC_CRED'
      Size = 2
    end
    object QReg130IDENT_BEM_IMOB: TStringField
      FieldName = 'IDENT_BEM_IMOB'
      Size = 2
    end
    object QReg130IND_ORIG_CRED: TStringField
      FieldName = 'IND_ORIG_CRED'
      Size = 1
    end
    object QReg130IND_UTIL_BEM_IMOB: TIntegerField
      FieldName = 'IND_UTIL_BEM_IMOB'
    end
    object QReg130MES_OPER_AQUIS: TStringField
      FieldName = 'MES_OPER_AQUIS'
      Size = 80
    end
    object QReg130IND_NR_PARC: TFloatField
      FieldName = 'IND_NR_PARC'
    end
    object QReg130CST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object QReg130CST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object QReg130COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 15
    end
    object QReg130ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object QReg130ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object QReg130VL_BC_CRED: TFloatField
      FieldName = 'VL_BC_CRED'
    end
    object QReg130VL_OPER_AQUIS: TFloatField
      FieldName = 'VL_OPER_AQUIS'
    end
    object QReg130VL_BC_PIS: TFloatField
      FieldName = 'VL_BC_PIS'
    end
    object QReg130VL_BC_COFINS: TFloatField
      FieldName = 'VL_BC_COFINS'
    end
    object QReg130VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object QReg130VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
    object QReg130COD_BC_CREDITO_PISCOFINS: TStringField
      FieldName = 'COD_BC_CREDITO_PISCOFINS'
      Size = 2
    end
  end
  object QReg600: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '    IND_NAT_RET,'
      '    DT_RET,'
      '    COD_REC,'
      '    IND_NAT_CRED,'
      '    CNPJ,'
      '    IND_DEC,'
      '    SUM(VL_RET_PIS) AS VL_RET_PIS,'
      '    SUM(VL_RET_COFINS) AS VL_RET_COFINS,'
      '    SUM(VL_RET) AS VL_RET,'
      '    SUM(VL_BC_RET) AS VL_BC_RET'
      'FROM (    '
      ''
      '    SELECT'
      '        q.COD_NOTA_CAB,'
      '        q.IND_NAT_RET,'
      '        q.DT_RET,'
      '        q.COD_REC,'
      '        q.IND_NAT_CRED,'
      '        q.CNPJ,'
      '        q.IND_DEC,'
      '        SUM(q.VL_RET_PIS) AS VL_RET_PIS,'
      '        SUM(q.VL_RET_COFINS) AS VL_RET_COFINS,'
      '        SUM(q.VL_RET_PIS + q.VL_RET_COFINS) AS VL_RET,'
      '        '
      
        '        (SELECT SUM(IT.VAL_TOTAL + IT.VAL_DESPESAS + IT.VAL_IPI ' +
        '+ IT.VAL_ICMS_SUBST - PEGA_DESCONTO_ITEM(IT.COD_NOTA_ITEM))'
      
        '        FROM TB_NOTA_ITEM IT WHERE IT.COD_NOTA_CAB = q.COD_NOTA_' +
        'CAB) AS VL_BC_RET'
      '    FROM('
      '        SELECT'
      '            N.COD_NOTA_CAB,'
      '            99 AS IND_NAT_RET,'
      '            NIS.DT_VENCIMENTO AS DT_RET,    '
      '            NULL AS COD_REC,'
      '            CASE'
      '                WHEN F.COD_INC_TRIB = 1 THEN'
      '                    0'
      '                ELSE'
      '                    1    '
      '            END AS IND_NAT_CRED,'
      '            LIMPA_CNPJ(F.NUM_CGC) AS CNPJ,'
      '            1 AS IND_DEC,'
      '            CASE'
      '                WHEN IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39' THEN'
      '                    NIS.VAL_IMPOSTO'
      '                ELSE'
      '                    0'
      '            END AS VL_RET_PIS,'
      '            CASE'
      '                WHEN IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39' THEN'
      '                    NIS.VAL_IMPOSTO'
      '                ELSE'
      '                    0'
      '            END AS VL_RET_COFINS'
      '            '
      '        FROM'
      '            TB_PARAM_SISTEMA,'
      '            TB_NOTA_CAB N'
      
        '                INNER JOIN TB_NOTA_ITEM I ON I.COD_NOTA_CAB = N.' +
        'COD_NOTA_CAB'
      
        '                INNER JOIN TB_NOTA_IMPOSTO_SERVICO NIS ON N.COD_' +
        'NOTA_CAB = NIS.COD_NOTA_CAB'
      
        '                INNER JOIN TB_IMPOSTO IMP ON NIS.COD_IMPOSTO = I' +
        'MP.COD_IMPOSTO'
      
        '                INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.C' +
        'OD_CADASTRO'
      
        '                INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_F' +
        'ILIAL'
      '        WHERE    '
      '            C.IND_PIS_COFINS_RETIDO = '#39'SIM'#39
      '            AND'
      '            NIS.DT_VENCIMENTO BETWEEN :DATA_INI AND :DATA_FIN'
      '            AND'
      '            N.COD_FILIAL IN :FILIAIS'
      '            /*AND'
      
        '            ((TB_PARAM_SISTEMA.COD_EMPRESA = '#39'GRASEL'#39' AND N.IND_' +
        'ENTRADA_SAIDA = '#39'S'#39')'
      
        '                OR (TB_PARAM_SISTEMA.COD_EMPRESA <> '#39'GRASEL'#39' AND' +
        ' N.IND_ENTRADA_SAIDA = '#39'E'#39'))*/'
      #9'     AND'
      
        '            (:IND_ENTRADA_SAIDA IS NULL OR :IND_ENTRADA_SAIDA = ' +
        'N.IND_ENTRADA_SAIDA)'
      '        )q'
      '    GROUP BY'
      '        COD_NOTA_CAB,'
      '        IND_NAT_RET,'
      '        DT_RET,'
      '        COD_REC,'
      '        IND_NAT_CRED,'
      '        CNPJ,'
      '        IND_DEC'
      '    )'
      'GROUP BY'
      '    IND_NAT_RET,'
      '    DT_RET,'
      '    COD_REC,'
      '    IND_NAT_CRED,'
      '    CNPJ,'
      '    IND_DEC')
    Variables.Data = {
      0300000004000000090000003A444154415F494E490C00000000000000000000
      00090000003A444154415F46494E0C0000000000000000000000080000003A46
      494C4941495301000000040000002831290000000000120000003A494E445F45
      4E54524144415F5341494441050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000B000000494E445F4E41545F524554010000000000060000
      0044545F52455401000000000007000000434F445F5245430100000000000C00
      0000494E445F4E41545F4352454401000000000004000000434E504A01000000
      000007000000494E445F44454301000000000006000000564C5F524554010000
      0000000A000000564C5F5245545F5049530100000000000D000000564C5F5245
      545F434F46494E5301000000000009000000564C5F42435F5245540100000000
      00}
    Session = DMOracle.DBCemapa
    Left = 200
    Top = 16
    object QReg600IND_NAT_RET: TFloatField
      FieldName = 'IND_NAT_RET'
    end
    object QReg600DT_RET: TDateTimeField
      FieldName = 'DT_RET'
      Required = True
    end
    object QReg600COD_REC: TStringField
      FieldName = 'COD_REC'
      Size = 1
    end
    object QReg600IND_NAT_CRED: TFloatField
      FieldName = 'IND_NAT_CRED'
    end
    object QReg600CNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 4000
    end
    object QReg600IND_DEC: TFloatField
      FieldName = 'IND_DEC'
    end
    object QReg600VL_RET: TFloatField
      FieldName = 'VL_RET'
    end
    object QReg600VL_RET_PIS: TFloatField
      FieldName = 'VL_RET_PIS'
    end
    object QReg600VL_RET_COFINS: TFloatField
      FieldName = 'VL_RET_COFINS'
    end
    object QReg600VL_BC_RET: TFloatField
      FieldName = 'VL_BC_RET'
    end
  end
end
