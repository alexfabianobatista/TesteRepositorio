object DMContFisc0: TDMContFisc0
  OldCreateOrder = False
  Left = 376
  Top = 184
  Height = 309
  Width = 552
  object QReg000: TOracleDataSet1
    SQL.Strings = (
      'Select'
      '  '#39'LECF'#39' AS NOME_ESC,'
      '  NULL AS COD_VER,'
      '  NUM_CGC AS CNPJ,  '
      '  DESC_FILIAL AS NOME,'
      '  0 AS IND_SIT_INI_PER,'
      '  0 AS SIT_ESPECIAL,'
      '  NULL AS PAT_REMAN_CIS,'
      '  NULL AS DT_SIT_ESP,'
      '  NULL AS COD_SCP'
      'FROM'
      '  TB_FILIAL F'
      'LEFT JOIN TB_CIDADE C ON F.COD_CIDADE = C.COD_CIDADE'
      'LEFT JOIN TB_ESTADO E ON F.COD_ESTADO = E.COD_ESTADO'
      'WHERE'
      '  F.COD_FILIAL IN :FILIAIS')
    Variables.Data = {
      0300000001000000080000003A46494C4941495301000000230000002853454C
      45435420434F445F46494C49414C2046524F4D2054425F46494C49414C290000
      000000}
    QBEDefinition.QBEFieldDefs = {
      0400000009000000080000004E4F4D455F45534301000000000007000000434F
      445F56455201000000000004000000434E504A010000000000040000004E4F4D
      450100000000000F000000494E445F5349545F494E495F504552010000000000
      0C0000005349545F455350454349414C0100000000000D0000005041545F5245
      4D414E5F4349530100000000000A00000044545F5349545F4553500100000000
      0007000000434F445F534350010000000000}
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 48
    object QReg000NOME_ESC: TStringField
      FieldName = 'NOME_ESC'
      Size = 4
    end
    object QReg000COD_VER: TStringField
      FieldName = 'COD_VER'
      Size = 1
    end
    object QReg000CNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object QReg000NOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object QReg000IND_SIT_INI_PER: TFloatField
      FieldName = 'IND_SIT_INI_PER'
    end
    object QReg000SIT_ESPECIAL: TFloatField
      FieldName = 'SIT_ESPECIAL'
    end
    object QReg000PAT_REMAN_CIS: TStringField
      FieldName = 'PAT_REMAN_CIS'
      Size = 1
    end
    object QReg000DT_SIT_ESP: TStringField
      FieldName = 'DT_SIT_ESP'
      Size = 1
    end
    object QReg000COD_SCP: TStringField
      FieldName = 'COD_SCP'
      Size = 1
    end
  end
  object QReg010: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  NULL AS HASH_ECF_ANTERIOR,'
      '  '#39'N'#39' AS OPT_REFIS,'
      '  '#39'N'#39' AS OPT_PAES,'
      '  F.COD_FORMA_TRIBUTACAO AS FORMA_TRIB,'
      '  F.IND_FORMA_APURACAO AS FORMA_APUR,'
      '  '#39'01'#39' AS COD_QUALIF_PJ,'
      '  CASE '
      '    WHEN F.COD_FORMA_TRIBUTACAO = 1 THEN '#39'RRRR'#39
      '    WHEN F.COD_FORMA_TRIBUTACAO = 5 THEN '#39'PPPP'#39
      '    WHEN F.COD_FORMA_TRIBUTACAO = 6 THEN '#39'AAAA'#39
      '    WHEN F.COD_FORMA_TRIBUTACAO IN (8,9) THEN '#39'0000'#39
      '    ELSE '#39'NAO INFORMADO'#39
      '  END AS FORMA_TRIB_PER,'
      '  CASE'
      '    WHEN F.IND_FORMA_APURACAO = '#39'A'#39' THEN '#39'BBBBBBBBBBBB'#39' '
      '    ELSE '#39#39
      '  END AS MES_BAL_RED,'
      '  CASE'
      '    WHEN F.COD_FORMA_TRIBUTACAO = 5 THEN '#39'C'#39' '
      '    ELSE '#39#39
      '  END AS TIP_ESC_PRE,'
      '  NULL AS TIP_ENT,'
      '  NULL AS FORMA_APUR_I,'
      '  NULL AS APUR_CSLL,'
      '  CASE F.COD_FORMA_TRIBUTACAO'
      #9'WHEN 3 THEN '#39'2'#39
      #9'WHEN 4 THEN '#39'2'#39
      #9'WHEN 5 THEN '#39'2'#39
      #9'WHEN 7 THEN '#39'2'#39
      #9'WHEN 10 THEN '#39'2'#39
      '  END AS IND_RECEITA'
      'FROM'
      '  TB_FILIAL F'
      'WHERE'
      '  F.COD_FILIAL IN :FILIAIS')
    Variables.Data = {
      0300000001000000080000003A46494C4941495301000000230000002853454C
      45435420434F445F46494C49414C2046524F4D2054425F46494C49414C290000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000D00000011000000484153485F4543465F414E544552494F52010000
      000000090000004F50545F5245464953010000000000080000004F50545F5041
      45530100000000000A000000464F524D415F545249420100000000000A000000
      464F524D415F415055520100000000000D000000434F445F5155414C49465F50
      4A0100000000000E000000464F524D415F545249425F5045520100000000000B
      0000004D45535F42414C5F5245440100000000000B0000005449505F4553435F
      505245010000000000070000005449505F454E540100000000000C000000464F
      524D415F415055525F4901000000000009000000415055525F43534C4C010000
      0000000B000000494E445F52454345495441010000000000}
    Session = DMOracle.DBCemapa
    Left = 112
    Top = 48
    object QReg010HASH_ECF_ANTERIOR: TStringField
      FieldName = 'HASH_ECF_ANTERIOR'
      Size = 1
    end
    object QReg010OPT_REFIS: TStringField
      FieldName = 'OPT_REFIS'
      Size = 1
    end
    object QReg010OPT_PAES: TStringField
      FieldName = 'OPT_PAES'
      Size = 1
    end
    object QReg010FORMA_TRIB: TIntegerField
      FieldName = 'FORMA_TRIB'
    end
    object QReg010FORMA_APUR: TStringField
      FieldName = 'FORMA_APUR'
      Size = 1
    end
    object QReg010COD_QUALIF_PJ: TStringField
      FieldName = 'COD_QUALIF_PJ'
      Size = 2
    end
    object QReg010TIP_ESC_PRE: TStringField
      FieldName = 'TIP_ESC_PRE'
      Size = 1
    end
    object QReg010TIP_ENT: TStringField
      FieldName = 'TIP_ENT'
      Size = 1
    end
    object QReg010FORMA_APUR_I: TStringField
      FieldName = 'FORMA_APUR_I'
      Size = 1
    end
    object QReg010APUR_CSLL: TStringField
      FieldName = 'APUR_CSLL'
      Size = 1
    end
    object QReg010FORMA_TRIB_PER: TStringField
      FieldName = 'FORMA_TRIB_PER'
      Size = 13
    end
    object QReg010MES_BAL_RED: TStringField
      FieldName = 'MES_BAL_RED'
      Size = 12
    end
    object QReg010IND_RECEITA: TStringField
      FieldName = 'IND_RECEITA'
      Size = 1
    end
  end
  object QReg020: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM('
      ''
      'SELECT DISTINCT'
      '  1 AS ORDEM,'
      '  --'#39'N'#39' AS IND_ALIQ_CSLL,'
      '  '#39'1'#39' AS IND_ALIQ_CSLL,'
      '  0 AS IND_QTE_SCP,'
      '  '#39'N'#39' AS IND_ADM_FUN_CLU,'
      '  '#39'N'#39' AS IND_PART_CONS,'
      '  CASE'
      '    WHEN O.NUM_NATUREZA_INT_NOVO LIKE '#39'3%'#39' THEN '#39'S'#39
      '    WHEN O.NUM_NATUREZA_INT_NOVO LIKE '#39'7%'#39' THEN '#39'S'#39
      '    ELSE '#39'N'#39'      '
      '  END AS IND_OP_EXT,'
      '  '#39'N'#39' AS IND_OP_VINC,'
      '  '#39'N'#39' AS IND_PJ_ENQUAD,'
      '  '#39'N'#39' AS IND_PART_EXT,'
      '  CASE'
      '    WHEN (SELECT '
      '            COUNT(*) '
      '          FROM '
      '            TB_PRODUTO_AGRICOLA PA '
      '          WHERE'
      '            I.COD_PRODUTO = PA.COD_PRODUTO) > 0 THEN '#39'S'#39
      '    ELSE '#39'N'#39
      '  END AS IND_ATIV_RURAL,'
      '  '#39'N'#39' AS IND_LUC_EXP,'
      '  '#39'N'#39' AS IND_RED_ISEN,'
      '  '#39'N'#39' AS IND_FIN,'
      '  '#39'N'#39' AS IND_DOA_ELEIT,'
      '  '#39'N'#39' AS IND_PART_COLIG,'
      '  '#39'N'#39' AS IND_VEND_EXP,'
      '  '#39'N'#39' AS IND_REC_EXT,'
      '  '#39'N'#39' AS IND_ATIV_EXT,'
      '  '#39'N'#39' AS IND_COM_EXP,'
      '  '#39'N'#39' AS IND_PGTO_EXT,'
      '  '#39'N'#39' AS IND_ECOM_TI,'
      '  '#39'N'#39' AS IND_ROY_REC,'
      '  '#39'N'#39' AS IND_ROY_PAG,'
      '  '#39'N'#39' AS IND_REND_SERV,'
      '  '#39'N'#39' AS IND_PGTO_REM,'
      '  '#39'N'#39' AS IND_INOV_TEC,'
      '  '#39'N'#39' AS IND_CAP_INF,'
      '  '#39'N'#39' AS IND_PJ_HAB,'
      '  '#39'N'#39' AS IND_POLO_AM,'
      '  '#39'N'#39' AS IND_ZON_EXP,'
      '  '#39'N'#39' AS IND_AREA_COM,'
      '  '#39'N'#39' AS IND_PAIS_A_PAIS,'
      '  '#39'N'#39' AS IND_DEREX,'
      '  '#39'N'#39' AS POSSUI_CEBRAS,'
      '  null as CEBAS  '
      '  '
      'FROM'
      '  TB_FILIAL F'
      '  INNER JOIN TB_NOTA_CAB N'
      '    ON F.COD_FILIAL = N.COD_FILIAL'
      '  INNER JOIN TB_OPERACAO O'
      '    ON N.COD_OPERACAO = O.COD_OPERACAO'
      '  INNER JOIN TB_NOTA_ITEM I'
      '    ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'WHERE'
      '  N.IND_SITUACAO = 2'
      '  AND'
      '  DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', DT_RECEBIMENTO, DT_EMISSAO) '
      '    BETWEEN :DT_INI AND :DT_FIN'
      '  AND'
      '  F.COD_FILIAL IN (:FILIAIS)'
      '  AND'
      '  ROWNUM = 1'
      '  '
      'UNION'
      ''
      'SELECT DISTINCT'
      '  2 AS ORDEM,'
      '  '#39'N'#39' AS IND_ALIQ_CSLL,'
      '  0 AS IND_QTE_SCP,'
      '  '#39'N'#39' AS IND_ADM_FUN_CLU,'
      '  '#39'N'#39' AS IND_PART_CONS,'
      '  '#39'N'#39' AS IND_OP_EXT,'
      '  '#39'N'#39' AS IND_OP_VINC,'
      '  '#39'N'#39' AS IND_PJ_ENQUAD,'
      '  '#39'N'#39' AS IND_PART_EXT,'
      '  '#39'N'#39' AS IND_ATIV_RURAL,'
      '  '#39'N'#39' AS IND_LUC_EXP,'
      '  '#39'N'#39' AS IND_RED_ISEN,'
      '  '#39'N'#39' AS IND_FIN,'
      '  '#39'N'#39' AS IND_DOA_ELEIT,'
      '  '#39'N'#39' AS IND_PART_COLIG,'
      '  '#39'N'#39' AS IND_VEND_EXP,'
      '  '#39'N'#39' AS IND_REC_EXT,'
      '  '#39'N'#39' AS IND_ATIV_EXT,'
      '  '#39'N'#39' AS IND_COM_EXP,'
      '  '#39'N'#39' AS IND_PGTO_EXT,'
      '  '#39'N'#39' AS IND_ECOM_TI,'
      '  '#39'N'#39' AS IND_ROY_REC,'
      '  '#39'N'#39' AS IND_ROY_PAG,'
      '  '#39'N'#39' AS IND_REND_SERV,'
      '  '#39'N'#39' AS IND_PGTO_REM,'
      '  '#39'N'#39' AS IND_INOV_TEC,'
      '  '#39'N'#39' AS IND_CAP_INF,'
      '  '#39'N'#39' AS IND_PJ_HAB,'
      '  '#39'N'#39' AS IND_POLO_AM,'
      '  '#39'N'#39' AS IND_ZON_EXP,'
      '  '#39'N'#39' AS IND_AREA_COM,'
      '  '#39'N'#39' AS IND_PAIS_A_PAIS,'
      '  '#39'N'#39' AS IND_DEREX,'
      '  '#39'N'#39' AS POSSUI_CEBRAS,'
      '  null as CEBAS'
      'FROM'
      '  DUAL'
      ''
      'ORDER BY'
      '  ORDEM,'
      '  IND_ATIV_RURAL DESC'
      ')'
      'WHERE'
      '  ROWNUM = 1')
    Variables.Data = {
      0300000003000000070000003A44545F494E490C000000000000000000000007
      0000003A44545F46494E0C0000000000000000000000080000003A46494C4941
      495301000000230000002853454C45435420434F445F46494C49414C2046524F
      4D2054425F46494C49414C290000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000210000000D000000494E445F414C49515F43534C4C0100000000000B
      000000494E445F5154455F5343500100000000000F000000494E445F41444D5F
      46554E5F434C550100000000000D000000494E445F504152545F434F4E530100
      000000000A000000494E445F4F505F4558540100000000000B000000494E445F
      4F505F56494E430100000000000D000000494E445F504A5F454E515541440100
      000000000C000000494E445F504152545F4558540100000000000E000000494E
      445F415449565F525552414C0100000000000C000000494E445F5245445F4953
      454E01000000000007000000494E445F46494E0100000000000D000000494E44
      5F444F415F454C4549540100000000000E000000494E445F504152545F434F4C
      49470100000000000C000000494E445F56454E445F4558500100000000000B00
      0000494E445F5245435F4558540100000000000C000000494E445F415449565F
      4558540100000000000C000000494E445F5047544F5F4558540100000000000B
      000000494E445F45434F4D5F54490100000000000B000000494E445F524F595F
      5245430100000000000B000000494E445F524F595F5041470100000000000D00
      0000494E445F52454E445F534552560100000000000C000000494E445F504754
      4F5F52454D0100000000000C000000494E445F494E4F565F5445430100000000
      000B000000494E445F4341505F494E460100000000000A000000494E445F504A
      5F4841420100000000000B000000494E445F504F4C4F5F414D0100000000000B
      000000494E445F5A4F4E5F4558500100000000000C000000494E445F41524541
      5F434F4D0100000000000B000000494E445F4C55435F4558500100000000000B
      000000494E445F434F4D5F455850010000000000050000004F5244454D010000
      0000000F000000494E445F504149535F415F5041495301000000000009000000
      494E445F4445524558010000000000}
    Session = DMOracle.DBCemapa
    Left = 192
    Top = 48
    object QReg020IND_ALIQ_CSLL: TStringField
      FieldName = 'IND_ALIQ_CSLL'
      Size = 1
    end
    object QReg020IND_QTE_SCP: TFloatField
      FieldName = 'IND_QTE_SCP'
    end
    object QReg020IND_ADM_FUN_CLU: TStringField
      FieldName = 'IND_ADM_FUN_CLU'
      Size = 1
    end
    object QReg020IND_PART_CONS: TStringField
      FieldName = 'IND_PART_CONS'
      Size = 1
    end
    object QReg020IND_OP_EXT: TStringField
      FieldName = 'IND_OP_EXT'
      Size = 1
    end
    object QReg020IND_OP_VINC: TStringField
      FieldName = 'IND_OP_VINC'
      Size = 1
    end
    object QReg020IND_PJ_ENQUAD: TStringField
      FieldName = 'IND_PJ_ENQUAD'
      Size = 1
    end
    object QReg020IND_PART_EXT: TStringField
      FieldName = 'IND_PART_EXT'
      Size = 1
    end
    object QReg020IND_ATIV_RURAL: TStringField
      FieldName = 'IND_ATIV_RURAL'
      Size = 1
    end
    object QReg020IND_RED_ISEN: TStringField
      FieldName = 'IND_RED_ISEN'
      Size = 1
    end
    object QReg020IND_FIN: TStringField
      FieldName = 'IND_FIN'
      Size = 1
    end
    object QReg020IND_DOA_ELEIT: TStringField
      FieldName = 'IND_DOA_ELEIT'
      Size = 1
    end
    object QReg020IND_PART_COLIG: TStringField
      FieldName = 'IND_PART_COLIG'
      Size = 1
    end
    object QReg020IND_VEND_EXP: TStringField
      FieldName = 'IND_VEND_EXP'
      Size = 1
    end
    object QReg020IND_REC_EXT: TStringField
      FieldName = 'IND_REC_EXT'
      Size = 1
    end
    object QReg020IND_ATIV_EXT: TStringField
      FieldName = 'IND_ATIV_EXT'
      Size = 1
    end
    object QReg020IND_PGTO_EXT: TStringField
      FieldName = 'IND_PGTO_EXT'
      Size = 1
    end
    object QReg020IND_ECOM_TI: TStringField
      FieldName = 'IND_ECOM_TI'
      Size = 1
    end
    object QReg020IND_ROY_REC: TStringField
      FieldName = 'IND_ROY_REC'
      Size = 1
    end
    object QReg020IND_ROY_PAG: TStringField
      FieldName = 'IND_ROY_PAG'
      Size = 1
    end
    object QReg020IND_REND_SERV: TStringField
      FieldName = 'IND_REND_SERV'
      Size = 1
    end
    object QReg020IND_PGTO_REM: TStringField
      FieldName = 'IND_PGTO_REM'
      Size = 1
    end
    object QReg020IND_INOV_TEC: TStringField
      FieldName = 'IND_INOV_TEC'
      Size = 1
    end
    object QReg020IND_CAP_INF: TStringField
      FieldName = 'IND_CAP_INF'
      Size = 1
    end
    object QReg020IND_PJ_HAB: TStringField
      FieldName = 'IND_PJ_HAB'
      Size = 1
    end
    object QReg020IND_POLO_AM: TStringField
      FieldName = 'IND_POLO_AM'
      Size = 1
    end
    object QReg020IND_ZON_EXP: TStringField
      FieldName = 'IND_ZON_EXP'
      Size = 1
    end
    object QReg020IND_AREA_COM: TStringField
      FieldName = 'IND_AREA_COM'
      Size = 1
    end
    object QReg020IND_LUC_EXP: TStringField
      FieldName = 'IND_LUC_EXP'
      Size = 1
    end
    object QReg020IND_COM_EXP: TStringField
      FieldName = 'IND_COM_EXP'
      Size = 1
    end
    object QReg020ORDEM: TFloatField
      FieldName = 'ORDEM'
    end
    object QReg020IND_PAIS_A_PAIS: TStringField
      FieldName = 'IND_PAIS_A_PAIS'
      Size = 1
    end
    object QReg020IND_DEREX: TStringField
      FieldName = 'IND_DEREX'
      Size = 1
    end
  end
  object QReg030: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  F.COD_NATUREZA_JURIDICA AS COD_NAT,'
      '  F.DESC_CNAE AS CNAE_FISCAL,'
      '  F.DESC_ENDERECO AS ENDERECO,'
      '  F.NUM_ENDERECO AS NUM,'
      '  F.DESC_COMPLEMENTO_ENDERECO AS COMPL,'
      '  F.DESC_BAIRRO AS BAIRRO,'
      '  F.COD_ESTADO AS UF,'
      '  E.COD_UF_IBGE || CI.COD_CIDADE_IBGE AS COD_MUN,'
      '  F.DESC_CEP AS CEP,'
      '  F.DESC_TELEFONE AS NUM_TEL,'
      '  F.DESC_E_MAIL AS EMAIL  '
      'FROM'
      '  TB_FILIAL F '
      '  INNER JOIN TB_CIDADE CI'
      '    ON F.COD_CIDADE = CI.COD_CIDADE'
      '  INNER JOIN TB_ESTADO E'
      '    ON CI.COD_ESTADO = E.COD_ESTADO'
      'WHERE'
      '  F.COD_FILIAL IN :FILIAIS')
    Variables.Data = {
      0300000001000000080000003A46494C4941495301000000230000002853454C
      45435420434F445F46494C49414C2046524F4D2054425F46494C49414C290000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B00000007000000434F445F4E41540100000000000B000000434E41
      455F46495343414C01000000000008000000454E44455245434F010000000000
      030000004E554D01000000000005000000434F4D504C01000000000006000000
      42414952524F01000000000002000000554601000000000007000000434F445F
      4D554E01000000000003000000434550010000000000070000004E554D5F5445
      4C01000000000005000000454D41494C010000000000}
    Session = DMOracle.DBCemapa
    Left = 272
    Top = 48
    object QReg030COD_NAT: TIntegerField
      FieldName = 'COD_NAT'
    end
    object QReg030CNAE_FISCAL: TStringField
      FieldName = 'CNAE_FISCAL'
      Size = 7
    end
    object QReg030ENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 30
    end
    object QReg030NUM: TIntegerField
      FieldName = 'NUM'
    end
    object QReg030COMPL: TStringField
      FieldName = 'COMPL'
      Size = 22
    end
    object QReg030BAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 15
    end
    object QReg030UF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object QReg030COD_MUN: TStringField
      FieldName = 'COD_MUN'
      Size = 45
    end
    object QReg030CEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object QReg030NUM_TEL: TStringField
      FieldName = 'NUM_TEL'
      Size = 12
    end
    object QReg030EMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 40
    end
  end
  object QReg930: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  C.NOME AS IDENT_NOM,'
      '  C.NUM_CGC_CPF as IDENT_CPF_CNPJ,'
      '  SUBSTR(DESC_QUALIFICACAO,1,3) AS IDENT_QUALIF,'
      '  C.DESC_CRC AS IND_CRC,'
      '  C.DESC_E_MAIL AS EMAIL,'
      '  C.DESC_TELEFONE AS FONE  '
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
      '  SUBSTR(DESC_QUALIFICACAO,1,3),'
      '  C.DESC_CRC,'
      '  C.DESC_E_MAIL,'
      '  C.DESC_TELEFONE'
      'FROM'
      '  TB_CADASTRO C'
      'WHERE'
      
        '  C.COD_CADASTRO IN (SELECT DISTINCT COD_CADASTRO_RESPONSAVEL FR' +
        'OM TB_FILIAL WHERE COD_FILIAL IN :FILIAIS)')
    Variables.Data = {
      0300000001000000080000003A46494C4941495301000000230000002853454C
      45435420434F445F46494C49414C2046524F4D2054425F46494C49414C290000
      000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000090000004944454E545F4E4F4D0100000000000E00000049
      44454E545F4350465F434E504A0100000000000C0000004944454E545F515541
      4C494601000000000007000000494E445F43524301000000000005000000454D
      41494C01000000000004000000464F4E45010000000000}
    Session = DMOracle.DBCemapa
    Left = 344
    Top = 48
    object QReg930IDENT_NOM: TStringField
      FieldName = 'IDENT_NOM'
      Size = 60
    end
    object QReg930IDENT_CPF_CNPJ: TStringField
      FieldName = 'IDENT_CPF_CNPJ'
      Size = 18
    end
    object QReg930IND_CRC: TStringField
      FieldName = 'IND_CRC'
      Size = 10
    end
    object QReg930EMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 70
    end
    object QReg930FONE: TStringField
      FieldName = 'FONE'
      Size = 12
    end
    object QReg930IDENT_QUALIF: TStringField
      FieldName = 'IDENT_QUALIF'
      Size = 3
    end
  end
end
