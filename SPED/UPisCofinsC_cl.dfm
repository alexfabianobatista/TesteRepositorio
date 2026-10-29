object DmPisCofinsC: TDmPisCofinsC
  OldCreateOrder = False
  Left = 469
  Top = 262
  Height = 291
  Width = 571
  object QReg010: TOracleDataSet1
    SQL.Strings = (
      'SELECT DISTINCT'
      '  F.COD_FILIAL,'
      '  F.NUM_CGC CNPJ,'
      '  2 IND_ESCRI'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'WHERE'
      '  N.IND_SITUACAO <> '#39'1'#39
      'AND'
      '  (O.IND_LIVRO_FISCAL = '#39'S'#39' or O.IND_CUPOM_FISCAL = '#39'S'#39')'
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  N.COD_FILIAL IN :FILIAIS'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO <> '#39'06'#39)
    Variables.Data = {
      0300000003000000090000003A444154415F494E490C00000000000000000000
      00090000003A444154415F46494E0C0000000000000000000000080000003A46
      494C4941495301000000040000002831290000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000004000000434E504A01000000000009000000494E445F4553
      4352490100000000000A000000434F445F46494C49414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 8
    object QReg010CNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object QReg010IND_ESCRI: TFloatField
      FieldName = 'IND_ESCRI'
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
      '  N.IND_ENTRADA_SAIDA,'
      '  DECODE(N.IND_ENTRADA_SAIDA, '#39'S'#39', '#39'1'#39', '#39'0'#39') IND_OPER,'
      '  DECODE(O.IND_EMITE, '#39'F'#39', '#39'0'#39', '#39'1'#39') IND_EMIT,'
      ''
      '  CASE'
      
        '    WHEN (N.COD_SERIE_MODELO = '#39'65'#39') AND (C.NUM_CGC_CPF IS NULL)' +
        ' THEN NULL'
      '    ELSE N.COD_CADASTRO'
      '  END COD_PART,'
      ''
      '  DECODE(N.IND_SITUACAO, '#39'2'#39', '#39'00'#39', '#39'02'#39') COD_SIT,'
      '  NVL(CAST(S.NUM_SERIE_FISCAL AS VARCHAR2(3)), S.COD_SERIE) SER,'
      '  S.COD_SERIE_MODELO COD_MOD,'
      '  N.NUM_NOTA NUM_DOC,'
      '  N.DESC_CHAVE_ACESSO CHV_NFE,'
      '  N.DT_RECEBIMENTO DT_DOC,'
      '  N.DT_RECEBIMENTO DT_E_S,'
      ''
      '  DECODE(N.IND_CONDICAO_PAGTO, '#39'1'#39', '#39'0'#39','
      '    DECODE(N.IND_CONDICAO_PAGTO, '#39'2'#39', '#39'1'#39', '#39'9'#39')) IND_PAGTO,'
      ''
      '  N.IND_TIPO_FRETE IND_FRT,'
      ''
      '  NVL(IT.VL_DESPESAS,0) VL_OUT_DA,'
      ''
      '  (CASE '
      '     WHEN ((N.NUM_CONHECIMENTO_FRETE IS NOT NULL)'
      '       AND (N.IND_ENTRADA_SAIDA = '#39'E'#39')'
      '       AND (N.IND_TIPO_FRETE = '#39'FOB'#39'))'
      '     THEN 0'
      '     ELSE N.VAL_FRETE'
      '   END) VL_FRT,'
      ''
      '  FAT.QT_FATURAS,'
      ''
      '  /* VL_DOC */'
      '  ('
      '    IT.VL_TOTAL'
      '    + IT.VL_DESPESAS'
      '    - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)'
      '    + IT.VL_IPI'
      '    + IT.VL_ICMS_ST_CONSID'
      '  ) VL_DOC,'
      ''
      '  PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB) VL_DESC,'
      '  IT.VL_BC_ICMS,'
      '  IT.VL_ICMS,'
      '  IT.VL_BC_ICMS_ST,'
      '  IT.VL_ICMS_ST,'
      ''
      '  NVL(PIS.VL_PIS, IT.VL_PIS) VL_PIS,'
      '  NVL(COF.VL_COFINS, IT.VL_COFINS) VL_COFINS,'
      ''
      '  IT.VL_IPI VL_IPI,'
      '  IT.VL_MERC VL_MERC,'
      '  O.IND_COMBUSTIVEL'
      ''
      'FROM TB_NOTA_CAB N'
      ''
      'INNER JOIN TB_CADASTRO C ON C.COD_CADASTRO = N.COD_CADASTRO'
      'INNER JOIN TB_OPERACAO O ON O.COD_OPERACAO = N.COD_OPERACAO'
      'INNER JOIN TB_SERIE S ON (S.COD_SERIE = N.COD_SERIE'
      '                       AND S.COD_FILIAL = N.COD_FILIAL'
      
        '                       AND S.COD_SERIE_MODELO = N.COD_SERIE_MODE' +
        'LO)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1=1'
      ''
      '/* ITENS AGRUPADOS */'
      'LEFT JOIN ('
      '  SELECT'
      '    I.COD_NOTA_CAB,'
      '    SUM(I.VAL_TOTAL) VL_TOTAL,'
      '    SUM(I.VAL_DESPESAS) VL_DESPESAS,'
      '    SUM(I.VAL_ICM_BASE) VL_BC_ICMS,'
      '    SUM(I.VAL_ICM) VL_ICMS,'
      '    SUM(I.VAL_BASE_SUBST) VL_BC_ICMS_ST,'
      '    SUM(I.VAL_ICMS_SUBST) VL_ICMS_ST,'
      '    SUM(I.VAL_IPI) VL_IPI,'
      '    SUM(I.VAL_PIS) VL_PIS,'
      '    SUM(I.VAL_CONFINS) VL_COFINS,'
      '    SUM('
      '      CASE'
      '        WHEN T.DESC_SITUACAO_TRIB = '#39'060'#39' THEN 0'
      '        ELSE I.VAL_ICMS_SUBST'
      '      END'
      '    ) VL_ICMS_ST_CONSID,'
      '    SUM('
      '      CASE'
      '        WHEN PS.COD_EMPRESA = '#39'MULTAGRO'#39
      
        '          THEN NVL(I.VAL_TOTAL,0) - PEGA_DESCONTO_ITEM(I.COD_NOT' +
        'A_ITEM)'
      '        ELSE NVL(I.VAL_TOTAL,0)'
      '      END'
      '    ) VL_MERC'
      '  FROM TB_NOTA_ITEM I'
      '  JOIN TB_TRIBUTACAO T ON T.COD_TRIBUTACAO = I.COD_TRIBUTACAO'
      '  JOIN TB_PARAM_SISTEMA PS ON 1=1'
      '  GROUP BY I.COD_NOTA_CAB'
      ') IT ON IT.COD_NOTA_CAB = N.COD_NOTA_CAB'
      ''
      '/* FATURAS */'
      'LEFT JOIN ('
      '  SELECT COD_NOTA_CAB, COUNT(*) QT_FATURAS'
      '  FROM TB_CONTA_RECEBER_CAB'
      '  GROUP BY COD_NOTA_CAB'
      '  UNION ALL'
      '  SELECT COD_NOTA_CAB, COUNT(*) QT_FATURAS'
      '  FROM TB_CONTA_PAGAR_CAB'
      '  GROUP BY COD_NOTA_CAB'
      ') FAT ON FAT.COD_NOTA_CAB = N.COD_NOTA_CAB'
      ''
      '/* PATRIMONIO */'
      'LEFT JOIN ('
      '  SELECT COD_NOTA_CAB_ENTRADA, COUNT(*) QT_PATRI'
      '  FROM TB_PATRIMONIO_ITEM'
      '  GROUP BY COD_NOTA_CAB_ENTRADA'
      ') PATRI ON PATRI.COD_NOTA_CAB_ENTRADA = N.COD_NOTA_CAB'
      ''
      '/* PIS SERV */'
      'LEFT JOIN ('
      '  SELECT NI.COD_NOTA_CAB, SUM(NI.VAL_IMPOSTO) VL_PIS'
      '  FROM TB_NOTA_IMPOSTO_SERVICO NI'
      '  JOIN TB_IMPOSTO IMP ON IMP.COD_IMPOSTO = NI.COD_IMPOSTO'
      '  WHERE IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39
      '  GROUP BY NI.COD_NOTA_CAB'
      ') PIS ON PIS.COD_NOTA_CAB = N.COD_NOTA_CAB'
      ''
      '/* COFINS SERV */'
      'LEFT JOIN ('
      '  SELECT NI.COD_NOTA_CAB, SUM(NI.VAL_IMPOSTO) VL_COFINS'
      '  FROM TB_NOTA_IMPOSTO_SERVICO NI'
      '  JOIN TB_IMPOSTO IMP ON IMP.COD_IMPOSTO = NI.COD_IMPOSTO'
      '  WHERE IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39
      '  GROUP BY NI.COD_NOTA_CAB'
      ') COF ON COF.COD_NOTA_CAB = N.COD_NOTA_CAB'
      ''
      'WHERE'
      '  N.IND_SITUACAO <> '#39'1'#39
      '  AND O.IND_LIVRO_FISCAL = '#39'S'#39
      '  AND (O.NUM_LIVROS <> 10 OR O.NUM_LIVROS IS NULL)'
      '  AND N.COD_FILIAL = :COD_FILIAL'
      '  AND ('
      
        '        (N.IND_ENTRADA_SAIDA = '#39'E'#39' AND N.DT_RECEBIMENTO BETWEEN ' +
        ':DATA_INI AND :DATA_FIN)'
      
        '     OR (N.IND_ENTRADA_SAIDA = '#39'S'#39' AND N.DT_EMISSAO BETWEEN :DAT' +
        'A_INI AND :DATA_FIN)'
      '      )'
      '  AND S.COD_SERIE_MODELO IN ('#39'01'#39','#39'1B'#39','#39'04'#39','#39'55'#39','#39'65'#39')'
      ''
      '  /* REGRA IMOBILIZADO F130 */'
      '  AND ('
      '        PATRI.QT_PATRI IS NULL'
      '     OR ('
      '           PATRI.QT_PATRI > 0'
      '        AND NVL(O.PERC_BASE_PIS,0) = 0'
      '        AND NVL(O.PERC_BASE_COFINS,0) = 0'
      '        )'
      '      )')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001C00000008000000494E445F4F50455201000000000008000000494E
      445F454D495401000000000008000000434F445F504152540100000000000700
      0000434F445F5349540100000000000300000053455201000000000007000000
      4E554D5F444F43010000000000070000004348565F4E46450100000000000600
      000044545F444F430100000000000600000044545F455F530100000000000900
      0000494E445F504147544F01000000000007000000564C5F4445534301000000
      000007000000494E445F46525401000000000009000000564C5F4F55545F4441
      01000000000006000000564C5F46525401000000000007000000564C5F49434D
      530100000000000D000000564C5F42435F49434D535F53540100000000000A00
      0000564C5F49434D535F535401000000000006000000564C5F49504901000000
      000009000000564C5F434F46494E5301000000000007000000564C5F4D455243
      01000000000007000000434F445F4D4F440100000000000A00000051545F4641
      545552415301000000000006000000564C5F444F430100000000000A00000056
      4C5F42435F49434D5301000000000006000000564C5F5049530100000000000C
      000000434F445F4E4F54415F43414201000000000011000000494E445F454E54
      524144415F53414944410100000000000F000000494E445F434F4D4255535449
      56454C010000000000}
    Session = DMOracle.DBCemapa
    Left = 88
    Top = 8
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
    object QReg100SER: TIntegerField
      FieldName = 'SER'
    end
    object QReg100NUM_DOC: TIntegerField
      FieldName = 'NUM_DOC'
      Required = True
    end
    object QReg100CHV_NFE: TStringField
      FieldName = 'CHV_NFE'
      Size = 44
    end
    object QReg100DT_DOC: TDateTimeField
      FieldName = 'DT_DOC'
    end
    object QReg100DT_E_S: TDateTimeField
      FieldName = 'DT_E_S'
    end
    object QReg100IND_PAGTO: TStringField
      FieldName = 'IND_PAGTO'
      Size = 1
    end
    object QReg100VL_DESC: TFloatField
      FieldName = 'VL_DESC'
    end
    object QReg100IND_FRT: TStringField
      FieldName = 'IND_FRT'
      Size = 3
    end
    object QReg100VL_OUT_DA: TFloatField
      FieldName = 'VL_OUT_DA'
      Required = True
    end
    object QReg100VL_FRT: TFloatField
      FieldName = 'VL_FRT'
    end
    object QReg100VL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
    end
    object QReg100VL_BC_ICMS_ST: TFloatField
      FieldName = 'VL_BC_ICMS_ST'
    end
    object QReg100VL_ICMS_ST: TFloatField
      FieldName = 'VL_ICMS_ST'
    end
    object QReg100VL_IPI: TFloatField
      FieldName = 'VL_IPI'
    end
    object QReg100VL_MERC: TFloatField
      FieldName = 'VL_MERC'
    end
    object QReg100COD_MOD: TStringField
      FieldName = 'COD_MOD'
      Size = 2
    end
    object QReg100IND_EMITE: TStringField
      FieldName = 'IND_EMITE'
      Required = True
      Size = 1
    end
    object QReg100QT_FATURAS: TFloatField
      FieldName = 'QT_FATURAS'
    end
    object QReg100VL_DOC: TFloatField
      FieldName = 'VL_DOC'
    end
    object QReg100VL_BC_ICMS: TFloatField
      FieldName = 'VL_BC_ICMS'
    end
    object QReg100COD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QReg100COD_SIT: TStringField
      FieldName = 'COD_SIT'
      Size = 2
    end
    object QReg100VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object QReg100VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
    object QReg100IND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 1
    end
    object QReg100IND_COMBUSTIVEL: TStringField
      FieldName = 'IND_COMBUSTIVEL'
      Size = 1
    end
  end
  object QReg110: TOracleDataSet1
    SQL.Strings = (
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
      'WHERE  '
      '  TB_NOTA_CAB.COD_SERIE_MODELO IN ('#39'01'#39','#39'1B'#39','#39'04'#39','#39'55'#39')'
      '  AND'
      '  TB_NOTA_CAB.IND_SITUACAO = '#39'2'#39
      '  AND'
      '  TB_NOTA_CAB.COD_NOTA_CAB = :CODNOTA'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '/*'
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
      
        'INNER JOIN TB_SERIE S ON TB_NOTA_CAB.COD_SERIE = S.COD_SERIE AND' +
        ' TB_NOTA_CAB.COD_FILIAL = S.COD_FILIAL'
      
        'INNER JOIN TB_OPERACAO O ON TB_NOTA_CAB.COD_OPERACAO = O.COD_OPE' +
        'RACAO'
      'WHERE'
      '  TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  TB_NOTA_CAB.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  S.DESC_MODELO IN ('#39'01'#39','#39'1B'#39','#39'04'#39','#39'55'#39')  AND O.IND_EMITE = '#39'F'#39
      'AND'
      '  TB_NOTA_CAB.IND_SITUACAO <> '#39'3'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
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
      
        '  TB_SERIE.DESC_MODELO IN ('#39'01'#39','#39'1B'#39','#39'04'#39','#39'55'#39')  AND TB_OPERACAO' +
        '.IND_EMITE = '#39'F'#39
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
      
        '  TB_SERIE.DESC_MODELO IN ('#39'01'#39','#39'1B'#39','#39'04'#39','#39'55'#39')  AND TB_OPERACAO' +
        '.IND_EMITE = '#39'F'#39
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
      
        '  TB_SERIE.DESC_MODELO IN ('#39'01'#39','#39'1B'#39','#39'04'#39','#39'55'#39')  AND O.IND_EMITE' +
        ' = '#39'F'#39
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
      
        '  TB_SERIE.DESC_MODELO IN ('#39'01'#39','#39'1B'#39','#39'04'#39','#39'55'#39') AND TB_OPERACAO.' +
        'IND_EMITE = '#39'F'#39
      '  AND'
      '  Tb_Nota_Cab.COD_FILIAL = :COD_FILIAL'
      '  And'
      '  Tb_Nota_Cab.DT_RECEBIMENTO BETWEEN :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_OPERACAO.IND_LIVRO_FISCAL = '#39'S'#39
      ')'
      'ORDER BY'
      '  COD_MENSAGEM,'
      '  DESC_MENSAGEM'
      '*/')
    Variables.Data = {
      0300000001000000080000003A434F444E4F5441030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000C000000434F445F4D454E534147454D0100000000000D00
      0000444553435F4D454E534147454D010000000000}
    Session = DMOracle.DBCemapa
    Left = 160
    Top = 8
    object QReg110COD_MENSAGEM: TFloatField
      FieldName = 'COD_MENSAGEM'
    end
    object QReg110DESC_MENSAGEM: TStringField
      FieldName = 'DESC_MENSAGEM'
      Size = 564
    end
  end
  object QReg120: TOracleDataSet1
    SQL.Strings = (
      'SELECT  '
      '  DECODE(I.NUM_DI,NULL,1,0) COD_DOC_IMP,'
      '  DECODE(I.NUM_DI,NULL,0,NUM_DI) NUM_DOC_IMP,'
      '  SUM(I.VAL_PIS) VL_PIS_IMP,'
      '  SUM(I.VAL_CONFINS) VL_COFINS_IMP'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL'
      
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
      '  --CFOP DE IMPORTACAO COME'#199'A COM 3'
      
        '  CAST(DECODE(F.COD_ESTADO, N.COD_ESTADO,O.NUM_NATUREZA_EST_NOVO' +
        ', O.NUM_NATUREZA_INT_NOVO) AS NUMBER(4)) > 3000 '
      'AND'
      '  N.IND_ENTRADA_SAIDA = '#39'E'#39
      'AND'
      '  N.COD_NOTA_CAB = :COD_NOTA'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO = '#39'01'#39'  '
      'AND'
      
        '  ((NVL(O.PERC_BASE_PIS,-1) >= 0) AND (NVL(O.PERC_BASE_COFINS,-1' +
        ') >= 0))'
      'AND'
      '  N.IND_SITUACAO = '#39'2'#39
      'GROUP BY '
      '  DECODE(I.NUM_DI,NULL,1,0), '
      '  DECODE(I.NUM_DI,NULL,0,NUM_DI) ')
    Variables.Data = {
      0300000001000000090000003A434F445F4E4F54410300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000B000000434F445F444F435F494D500100000000000B0000
      004E554D5F444F435F494D500100000000000A000000564C5F5049535F494D50
      0100000000000D000000564C5F434F46494E535F494D50010000000000}
    Session = DMOracle.DBCemapa
    Left = 224
    Top = 8
    object QReg120COD_DOC_IMP: TFloatField
      FieldName = 'COD_DOC_IMP'
    end
    object QReg120NUM_DOC_IMP: TFloatField
      FieldName = 'NUM_DOC_IMP'
    end
    object QReg120VL_PIS_IMP: TFloatField
      FieldName = 'VL_PIS_IMP'
    end
    object QReg120VL_COFINS_IMP: TFloatField
      FieldName = 'VL_COFINS_IMP'
    end
  end
  object QReg170: TOracleDataSet1
    SQL.Strings = (
      'SELECT DISTINCT'
      '  N.IND_ENTRADA_SAIDA,'
      '  N.NUM_NOTA,'
      '  I.COD_NOTA_ITEM + 0.00 AS NUM_ITEM,'
      '  I.COD_PRODUTO + 0.00 AS COD_ITEM,'
      '  P.DESC_PRODUTO AS DESCR_COMPL,'
      '  DECODE(I.QT_QUANTIDADE,0,1,I.QT_QUANTIDADE) AS QT_QUANTIDADE,'
      '  P.DESC_UNIDADE,'
      '  CASE'
      '    WHEN TB_PARAM_SISTEMA.COD_EMPRESA = '#39'MULTAGRO'#39' THEN'
      '        I.VAL_TOTAL - PEGA_DESCONTO_ITEM(I.COD_NOTA_ITEM)'
      '    ELSE'
      '        I.VAL_TOTAL'
      '  END AS VAL_TOTAL,'
      
        '  DECODE(P.COD_NATUREZA_RECEITA,NULL,I.COD_NATUREZA_RECEITA,P.CO' +
        'D_NATUREZA_RECEITA) COD_NATUREZA_RECEITA,'
      '  NVL(I.VAL_BC_DI,0) AS VAL_BC_DI,'
      '  PEGA_DESCONTO_ITEM(I.COD_NOTA_ITEM) VL_DESC,'
      
        '  decode(I.COD_OPERACAO, null, O_N.IND_ESTOQUE, O_I.IND_ESTOQUE)' +
        ' as IND_MOV,'
      
        '  cast(DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_OPERACAO,' +
        ' null, O_N.NUM_NATUREZA_EST_NOVO, O_I.NUM_NATUREZA_EST_NOVO), de' +
        'code(I.COD_OPERACAO, null, O_N.NUM_NATUREZA_INT_NOVO, O_I.NUM_NA' +
        'TUREZA_INT_NOVO)) as number(4)) + 0.00 CFOP,'
      
        '  cast(decode(I.COD_OPERACAO, null, N.COD_OPERACAO, I.COD_OPERAC' +
        'AO) as number(6)) + 0.00  COD_NAT,'
      '  I.VAL_ICM VL_ICMS,'
      '  NVL(I.VAL_ICM_BASE, 0.00) VL_BC_ICMS,'
      
        '  DECODE(N.IND_ST, '#39'S'#39', I.VAL_BASE_SUBST, 0.00) AS VL_BC_ICMS_ST' +
        ','
      '  DECODE(N.IND_ST, '#39'S'#39', I.VAL_ICMS_SUBST, 0.00) AS VL_ICMS_ST,'
      '  NVL(I.COD_CST_IPI,P.COD_CST_IPI) CST_IPI,'
      
        '  NVL(I.COD_CST_COFINS,DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',P.COD_CST_' +
        'COFINS,P.COD_CST_COFINS_SAIDA)) CST_COFINS,'
      
        '  NVL(I.COD_CST_PIS, DECODE(N.IND_ENTRADA_SAIDA,'#39'E'#39',P.COD_CST_PI' +
        'S,P.COD_CST_PIS_SAIDA)) CST_PIS,'
      '  I.PERC_IPI AS ALIQ_IPI,'
      '  I.VAL_IPI AS VL_IPI,      '
      '  DECODE((SELECT IMP.PERC_ALIQUOTA'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%CO' +
        'FINS%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '    NULL, '
      '    TB_PARAM_SISTEMA.PERC_COFINS, '
      '    (SELECT IMP.PERC_ALIQUOTA'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%CO' +
        'FINS%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB)) AS ALIQ_COFINS,  '
      '  '
      '/*'
      'DECODE((SELECT NI.VAL_IMPOSTO'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%PI' +
        'S%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '    NULL, '
      '    CAST(NVL(I.VAL_PIS,0.00) AS NUMBER(9,2)), '
      '    (SELECT NI.VAL_IMPOSTO'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%PI' +
        'S%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB)) AS VL_PIS,'
      '  '
      'DECODE((SELECT NI.VAL_IMPOSTO'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%CO' +
        'FINS%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '    NULL, '
      '    CAST(NVL(I.VAL_CONFINS,0.00) AS NUMBER(9,2)), '
      '    (SELECT NI.VAL_IMPOSTO'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%CO' +
        'FINS%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB)) AS VL_COFINS,'
      '*/  '
      ''
      '  DECODE((SELECT NI.VAL_IMPOSTO'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%PI' +
        'S%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '    NULL, '
      '    CAST(NVL(I.VAL_PIS,0.00) AS NUMBER(9,2)), '
      '    ((I.VAL_TOTAL-I.VAL_DESCONTO-I.VAL_DESCONTO_RATEIO) * ('
      '      SELECT '
      '        PERC_ALIQUOTA '
      '      FROM '
      '        TB_IMPOSTO '
      '        INNER JOIN TB_NOTA_IMPOSTO_SERVICO'
      
        '          ON TB_IMPOSTO.COD_IMPOSTO = TB_NOTA_IMPOSTO_SERVICO.CO' +
        'D_IMPOSTO'
      '      WHERE'
      '        TB_IMPOSTO.DESC_IMPOSTO LIKE '#39'%PIS%'#39
      '        AND'
      '        TB_NOTA_IMPOSTO_SERVICO.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '        AND'
      '        ROWNUM < 2'
      '      ) / 100)) AS VL_PIS,   '
      '    '
      '  '
      '  DECODE((SELECT NI.VAL_IMPOSTO'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%CO' +
        'FINS%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '    NULL, '
      '    CAST(NVL(I.VAL_CONFINS,0.00) AS NUMBER(9,2)), '
      '    ((I.VAL_TOTAL-I.VAL_DESCONTO-I.VAL_DESCONTO_RATEIO) * ('
      '      SELECT '
      '        PERC_ALIQUOTA '
      '      FROM '
      '        TB_IMPOSTO '
      '        INNER JOIN TB_NOTA_IMPOSTO_SERVICO'
      
        '          ON TB_IMPOSTO.COD_IMPOSTO = TB_NOTA_IMPOSTO_SERVICO.CO' +
        'D_IMPOSTO'
      '      WHERE'
      '        TB_IMPOSTO.DESC_IMPOSTO LIKE '#39'%COFINS%'#39
      '        AND'
      '        TB_NOTA_IMPOSTO_SERVICO.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '        AND'
      '        ROWNUM < 2'
      '      ) / 100)) AS VL_COFINS,'
      ''
      '  T.PERC_ALIQUOTA ALIQ_ICMS,'
      '  T.DESC_SITUACAO_TRIB ,  '
      '  E.PERC_ALIQ_SUBST ALIQ_ST,'
      '  DECODE((SELECT IMP.PERC_ALIQUOTA'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%PI' +
        'S%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '    NULL, '
      '    TB_PARAM_SISTEMA.PERC_PIS, '
      '    (SELECT IMP.PERC_ALIQUOTA'
      
        '    FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOSTO IMP ON' +
        ' NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%PI' +
        'S%'#39' AND ROWNUM < 2'
      '    WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB)) AS ALIQ_PIS,  '
      
        '  --Decode(O_N.IND_TIPO_OPERACAO, '#39'E'#39', O_N.COD_CONTABIL_PIS_CRED' +
        ', O_N.COD_CONTABIL_PIS_DEB) COD_CTA,'
      
        '  NVL(DECODE(O_I.COD_OPERACAO, NULL, O_N.PERC_BASE_PIS, O_I.PERC' +
        '_BASE_PIS), 100) PERC_BASE_PIS,'
      
        '  NVL(DECODE(O_I.COD_OPERACAO, NULL, O_N.PERC_BASE_COFINS, O_I.P' +
        'ERC_BASE_COFINS), 100) PERC_BASE_COFINS,'
      
        '  N.VAL_DESPESAS / (SELECT COUNT(*) FROM TB_NOTA_ITEM WHERE COD_' +
        'NOTA_CAB = N.COD_NOTA_CAB) AS VL_DESPESA,'
      '  I.IND_DESCONTA_ICMS_ST_PISCOFINS,'
      
        '  DECODE(TB_PARAM_SISTEMA.COD_EMPRESA, '#39'GOLDEN'#39', PC.COD_REDUZIDO' +
        ','
      '  '#9'O_N.COD_CONTABIL_NOTA_SPED_CONTRIB) AS COD_CTA,'
      '  O_N.COD_BC_CREDITO_PISCOFINS,'
      '  O_N.IND_COMBUSTIVEL    '
      'FROM'
      '  TB_PARAM_SISTEMA,'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_OPERACAO O_N ON N.COD_OPERACAO = O_N.COD_OPERACAO'
      'LEFT JOIN TB_OPERACAO O_I ON I.COD_OPERACAO = O_I.COD_OPERACAO'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO '
      'INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL'
      
        'INNER JOIN TB_TRIBUTACAO T ON I.COD_TRIBUTACAO = T.COD_TRIBUTACA' +
        'O'
      'INNER JOIN TB_ESTADO E ON N.COD_ESTADO = E.COD_ESTADO'
      
        'INNER JOIN TB_SERIE S ON N.COD_SERIE = S.COD_SERIE AND N.COD_FIL' +
        'IAL = S.COD_FILIAL'
      
        'LEFT JOIN TB_PLANO_CONTA PC ON O_N.COD_CONTABIL_NOTA_SPED_CONTRI' +
        'B = PC.NUM_PLANO_CONTA'
      'WHERE'
      ' (I.COD_CST_PIS IS NOT NULL AND I.COD_CST_COFINS IS NOT NULL)'
      'AND'
      '  N.COD_SERIE_MODELO IN ('#39'01'#39','#39'1B'#39','#39'04'#39','#39'55'#39')'
      'AND'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  I.COD_NOTA_CAB = :CODNOTA')
    Variables.Data = {
      0300000001000000080000003A434F444E4F5441030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000025000000080000004E554D5F4954454D01000000000008000000434F
      445F4954454D0100000000000B00000044455343525F434F4D504C0100000000
      000D00000051545F5155414E5449444144450100000000000C00000044455343
      5F554E49444144450100000000000900000056414C5F544F54414C0100000000
      0007000000494E445F4D4F560100000000000400000043464F50010000000000
      07000000434F445F4E41540100000000000A000000564C5F42435F49434D5301
      000000000009000000414C49515F49434D530100000000000D000000564C5F42
      435F49434D535F53540100000000000A000000564C5F49434D535F5354010000
      000000070000004353545F49504901000000000008000000414C49515F495049
      01000000000006000000564C5F4950490100000000000B000000414C49515F43
      4F46494E5301000000000009000000564C5F434F46494E530100000000001200
      0000444553435F534954554143414F5F5452494201000000000007000000414C
      49515F535401000000000008000000414C49515F504953010000000000070000
      00434F445F4354410100000000000A0000004353545F434F46494E5301000000
      0000070000004353545F50495301000000000006000000564C5F504953010000
      00000014000000434F445F4E41545552455A415F524543454954410100000000
      000D000000504552435F424153455F5049530100000000001000000050455243
      5F424153455F434F46494E5301000000000007000000564C5F44455343010000
      0000000A000000564C5F444553504553410100000000000900000056414C5F42
      435F444901000000000011000000494E445F454E54524144415F534149444101
      00000000001E000000494E445F444553434F4E54415F49434D535F53545F5049
      53434F46494E53010000000000080000004E554D5F4E4F544101000000000018
      000000434F445F42435F4352454449544F5F504953434F46494E530100000000
      0007000000564C5F49434D530100000000000F000000494E445F434F4D425553
      544956454C010000000000}
    Session = DMOracle.DBCemapa
    Left = 280
    Top = 8
    object QReg170NUM_ITEM: TFloatField
      FieldName = 'NUM_ITEM'
    end
    object QReg170COD_ITEM: TFloatField
      FieldName = 'COD_ITEM'
    end
    object QReg170QT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QReg170DESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 3
    end
    object QReg170VAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
      Required = True
    end
    object QReg170IND_MOV: TStringField
      FieldName = 'IND_MOV'
      Size = 1
    end
    object QReg170CFOP: TFloatField
      FieldName = 'CFOP'
    end
    object QReg170COD_NAT: TFloatField
      FieldName = 'COD_NAT'
    end
    object QReg170VL_BC_ICMS: TFloatField
      FieldName = 'VL_BC_ICMS'
      Required = True
    end
    object QReg170ALIQ_ICMS: TFloatField
      FieldName = 'ALIQ_ICMS'
      Required = True
    end
    object QReg170VL_BC_ICMS_ST: TFloatField
      FieldName = 'VL_BC_ICMS_ST'
    end
    object QReg170VL_ICMS_ST: TFloatField
      FieldName = 'VL_ICMS_ST'
    end
    object QReg170CST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 2
    end
    object QReg170ALIQ_IPI: TFloatField
      FieldName = 'ALIQ_IPI'
    end
    object QReg170VL_IPI: TFloatField
      FieldName = 'VL_IPI'
    end
    object QReg170ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object QReg170DESC_SITUACAO_TRIB: TStringField
      FieldName = 'DESC_SITUACAO_TRIB'
      Size = 3
    end
    object QReg170ALIQ_ST: TFloatField
      FieldName = 'ALIQ_ST'
    end
    object QReg170ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object QReg170VL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
      Required = True
    end
    object QReg170CST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object QReg170CST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object QReg170COD_NATUREZA_RECEITA: TIntegerField
      FieldName = 'COD_NATUREZA_RECEITA'
    end
    object QReg170PERC_BASE_PIS: TFloatField
      FieldName = 'PERC_BASE_PIS'
    end
    object QReg170PERC_BASE_COFINS: TFloatField
      FieldName = 'PERC_BASE_COFINS'
    end
    object QReg170DESCR_COMPL: TStringField
      FieldName = 'DESCR_COMPL'
      Size = 191
    end
    object QReg170VL_DESC: TFloatField
      FieldName = 'VL_DESC'
    end
    object QReg170VL_DESPESA: TFloatField
      FieldName = 'VL_DESPESA'
    end
    object QReg170VAL_BC_DI: TFloatField
      FieldName = 'VAL_BC_DI'
    end
    object QReg170VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object QReg170VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
    object QReg170IND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 1
    end
    object QReg170IND_DESCONTA_ICMS_ST_PISCOFINS: TStringField
      FieldName = 'IND_DESCONTA_ICMS_ST_PISCOFINS'
      Size = 3
    end
    object QReg170COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 15
    end
    object QReg170NUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QReg170COD_BC_CREDITO_PISCOFINS: TStringField
      FieldName = 'COD_BC_CREDITO_PISCOFINS'
      Size = 2
    end
    object QReg170IND_COMBUSTIVEL: TStringField
      FieldName = 'IND_COMBUSTIVEL'
      Size = 1
    end
  end
  object QReg180: TOracleDataSet1
    SQL.Strings = (
      'SELECT  '
      '  '#39'55'#39' COD_MOD,  '
      '  P.COD_PRODUTO,'
      '  P.NUM_GENERO_NCM COD_NCM,'
      '  P.COD_EX_TIPI EX_IPI,'
      '  MIN(N.DT_EMISSAO) DT_DOC_INI,'
      '  MAX(N.DT_EMISSAO) DT_DOC_FIN,'
      '  SUM(I.VAL_TOTAL) VL_TOT_ITEM   '
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'WHERE'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  N.COD_NOTA_CAB_TRANS_ENT IS NULL'
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO = '#39'55'#39
      'GROUP BY '#39'55'#39', P.COD_PRODUTO, P.NUM_GENERO_NCM, P.COD_EX_TIPI')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000007000000434F445F4D4F440100000000000B000000434F44
      5F50524F4455544F01000000000007000000434F445F4E434D01000000000006
      00000045585F4950490100000000000A00000044545F444F435F494E49010000
      0000000A00000044545F444F435F46494E0100000000000B000000564C5F544F
      545F4954454D010000000000}
    Session = DMOracle.DBCemapa
    Left = 392
    Top = 8
    object QReg180COD_MOD: TStringField
      FieldName = 'COD_MOD'
      Size = 2
    end
    object QReg180COD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QReg180COD_NCM: TStringField
      FieldName = 'COD_NCM'
      Size = 8
    end
    object QReg180EX_IPI: TStringField
      FieldName = 'EX_IPI'
      Size = 3
    end
    object QReg180DT_DOC_INI: TDateTimeField
      FieldName = 'DT_DOC_INI'
    end
    object QReg180DT_DOC_FIN: TDateTimeField
      FieldName = 'DT_DOC_FIN'
    end
    object QReg180VL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
    end
  end
  object QReg181: TOracleDataSet1
    SQL.Strings = (
      'SELECT  '
      
        '  NVL(I.COD_CST_PIS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_CST_' +
        'PIS, P.COD_CST_PIS_SAIDA)) CST_PIS,'
      
        '  cast(DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_OPERACAO,' +
        ' null, O_N.NUM_NATUREZA_EST_NOVO, O_I.NUM_NATUREZA_EST_NOVO), de' +
        'code(I.COD_OPERACAO, null, O_N.NUM_NATUREZA_INT_NOVO, O_I.NUM_NA' +
        'TUREZA_INT_NOVO)) as number(4)) + 0.00 CFOP,  '
      '  PS.PERC_PIS ALIQ_PIS,  '
      
        '  --Decode(N.IND_ENTRADA_SAIDA, '#39'E'#39', O_N.COD_CONTABIL_COFINS_CRE' +
        'D, O_N.COD_CONTABIL_COFINS_DEB) COD_CTA,'
      '  O_N.COD_CONTABIL_NOTA_SPED_CONTRIB AS COD_CTA,'
      '  SUM(I.VAL_ICM) VL_DESC,'
      '  SUM(I.VAL_TOTAL)  - SUM(I.VAL_ICM) VL_BC_PIS,'
      '  SUM(I.VAL_TOTAL) VL_ITEM,'
      '  SUM(I.VAL_PIS) VL_PIS'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'INNER JOIN TB_OPERACAO O_N ON N.COD_OPERACAO = O_N.COD_OPERACAO'
      'LEFT JOIN TB_OPERACAO O_I ON I.COD_OPERACAO = O_I.COD_OPERACAO'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1=1'
      'WHERE'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  N.COD_NOTA_CAB_TRANS_ENT IS NULL'
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO = '#39'55'#39
      'GROUP BY'
      
        '  NVL(I.COD_CST_PIS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_CST_' +
        'PIS, P.COD_CST_PIS_SAIDA)),'
      
        '  cast(DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_OPERACAO,' +
        ' null, O_N.NUM_NATUREZA_EST_NOVO, O_I.NUM_NATUREZA_EST_NOVO), de' +
        'code(I.COD_OPERACAO, null, O_N.NUM_NATUREZA_INT_NOVO, O_I.NUM_NA' +
        'TUREZA_INT_NOVO)) as number(4)) + 0.00,  '
      '  PS.PERC_PIS,  '
      '  O_N.COD_CONTABIL_NOTA_SPED_CONTRIB')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000008000000070000004353545F5049530100000000000400000043464F
      5001000000000007000000564C5F4954454D01000000000007000000564C5F44
      45534301000000000008000000414C49515F5049530100000000000600000056
      4C5F50495301000000000007000000434F445F43544101000000000009000000
      564C5F42435F504953010000000000}
    Session = DMOracle.DBCemapa
    Left = 448
    Top = 8
    object QReg181CST_PIS: TFloatField
      FieldName = 'CST_PIS'
    end
    object QReg181CFOP: TFloatField
      FieldName = 'CFOP'
    end
    object QReg181ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object QReg181COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 15
    end
    object QReg181VL_DESC: TFloatField
      FieldName = 'VL_DESC'
    end
    object QReg181VL_BC_PIS: TFloatField
      FieldName = 'VL_BC_PIS'
    end
    object QReg181VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
    end
    object QReg181VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
  end
  object QReg185: TOracleDataSet1
    SQL.Strings = (
      'SELECT  '
      
        '  NVL(I.COD_CST_COFINS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_C' +
        'ST_COFINS, P.COD_CST_COFINS_SAIDA)) CST_COFINS,'
      
        '  cast(DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_OPERACAO,' +
        ' null, O_N.NUM_NATUREZA_EST_NOVO, O_I.NUM_NATUREZA_EST_NOVO), de' +
        'code(I.COD_OPERACAO, null, O_N.NUM_NATUREZA_INT_NOVO, O_I.NUM_NA' +
        'TUREZA_INT_NOVO)) as number(4)) + 0.00 CFOP,  '
      '  PS.PERC_COFINS ALIQ_COFINS,  '
      
        '  Decode(N.IND_ENTRADA_SAIDA, '#39'E'#39', O_N.COD_CONTABIL_COFINS_CRED,' +
        ' O_N.COD_CONTABIL_COFINS_DEB) COD_CTA,  '
      
        '  SUM(I.VAL_TOTAL) - SUM(I.VAL_ICM) VL_BC_COFINS,               ' +
        '              '
      '  SUM(I.VAL_ICM) VL_DESC,'
      '  SUM(I.VAL_TOTAL) VL_ITEM,'
      '  SUM(I.VAL_CONFINS) VL_COFINS'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'INNER JOIN TB_OPERACAO O_N ON N.COD_OPERACAO = O_N.COD_OPERACAO'
      'LEFT JOIN TB_OPERACAO O_I ON I.COD_OPERACAO = O_I.COD_OPERACAO'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1=1'
      'WHERE'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  N.COD_NOTA_CAB_TRANS_ENT IS NULL'
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO = '#39'55'#39
      'GROUP BY'
      
        '  NVL(I.COD_CST_COFINS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_C' +
        'ST_COFINS, P.COD_CST_COFINS_SAIDA)),'
      
        '  cast(DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_OPERACAO,' +
        ' null, O_N.NUM_NATUREZA_EST_NOVO, O_I.NUM_NATUREZA_EST_NOVO), de' +
        'code(I.COD_OPERACAO, null, O_N.NUM_NATUREZA_INT_NOVO, O_I.NUM_NA' +
        'TUREZA_INT_NOVO)) as number(4)) + 0.00,  '
      '  PS.PERC_COFINS,  '
      
        '  Decode(N.IND_ENTRADA_SAIDA, '#39'E'#39', O_N.COD_CONTABIL_COFINS_CRED,' +
        ' O_N.COD_CONTABIL_COFINS_DEB)')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000A0000004353545F434F46494E5301000000000004000000
      43464F500100000000000B000000414C49515F434F46494E5301000000000007
      000000434F445F4354410100000000000C000000564C5F42435F434F46494E53
      01000000000007000000564C5F4445534301000000000007000000564C5F4954
      454D01000000000009000000564C5F434F46494E53010000000000}
    Session = DMOracle.DBCemapa
    Left = 496
    Top = 8
    object QReg185CST_COFINS: TFloatField
      FieldName = 'CST_COFINS'
    end
    object QReg185CFOP: TFloatField
      FieldName = 'CFOP'
    end
    object QReg185ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object QReg185COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 15
    end
    object QReg185VL_BC_COFINS: TFloatField
      FieldName = 'VL_BC_COFINS'
    end
    object QReg185VL_DESC: TFloatField
      FieldName = 'VL_DESC'
    end
    object QReg185VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
    end
    object QReg185VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
  end
  object QReg190: TOracleDataSet1
    SQL.Strings = (
      'SELECT  '
      '  '#39'55'#39' COD_MOD,  '
      '  P.COD_PRODUTO + 0.00 COD_ITEM,'
      '  P.NUM_GENERO_NCM COD_NCM,'
      '  P.COD_EX_TIPI EX_TIPI,'
      '  MIN(N.DT_RECEBIMENTO) DT_REF_INI,'
      '  MAX(N.DT_RECEBIMENTO) DT_REF_FIN,'
      '  SUM(I.VAL_TOTAL) VL_TOT_ITEM  '
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1=1'
      'WHERE'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  N.COD_NOTA_CAB_TRANS_ENT IS NULL'
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO = '#39'55'#39
      'AND'
      '  O.IND_TIPO_OPERACAO = '#39'E'#39
      'AND'
      
        '  (NVL(O.PERC_BASE_PIS,-1) >= 0 AND NVL(O.PERC_BASE_COFINS,-1) >' +
        '= 0)'
      'GROUP BY'
      '  '#39'55'#39',  '
      '  P.COD_PRODUTO,'
      '  P.NUM_GENERO_NCM,'
      '  P.COD_EX_TIPI')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000007000000434F445F4D4F4401000000000008000000434F44
      5F4954454D01000000000007000000434F445F4E434D01000000000007000000
      45585F544950490100000000000A00000044545F5245465F494E490100000000
      000A00000044545F5245465F46494E0100000000000B000000564C5F544F545F
      4954454D010000000000}
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 80
    object QReg190COD_MOD: TStringField
      FieldName = 'COD_MOD'
      Size = 2
    end
    object QReg190COD_ITEM: TFloatField
      FieldName = 'COD_ITEM'
    end
    object QReg190COD_NCM: TStringField
      FieldName = 'COD_NCM'
      Size = 8
    end
    object QReg190EX_TIPI: TStringField
      FieldName = 'EX_TIPI'
      Size = 3
    end
    object QReg190DT_REF_INI: TDateTimeField
      FieldName = 'DT_REF_INI'
    end
    object QReg190DT_REF_FIN: TDateTimeField
      FieldName = 'DT_REF_FIN'
    end
    object QReg190VL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
    end
  end
  object QReg191: TOracleDataSet1
    SQL.Strings = (
      'SELECT  '
      
        '  DECODE(C.COD_ESTADO,'#39'EX'#39',DECODE(C.IND_FISICA_JURIDICA,'#39'F'#39','#39'999' +
        '99999999'#39','#39'99999999999999'#39'), C.NUM_CGC_CPF) CNPJ_CPF_PART,'
      
        '  NVL(I.COD_CST_PIS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_CST_' +
        'PIS, P.COD_CST_PIS_SAIDA)) CST_PIS,  '
      
        '  cast(DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_OPERACAO,' +
        ' null, O_N.NUM_NATUREZA_EST_NOVO, O_I.NUM_NATUREZA_EST_NOVO), de' +
        'code(I.COD_OPERACAO, null, O_N.NUM_NATUREZA_INT_NOVO, O_I.NUM_NA' +
        'TUREZA_INT_NOVO)) as number(4)) + 0.00 CFOP,  '
      '  PS.PERC_PIS ALIQ_PIS,  '
      
        '  Decode(N.IND_ENTRADA_SAIDA, '#39'E'#39', O_N.COD_CONTABIL_COFINS_CRED,' +
        ' O_N.COD_CONTABIL_COFINS_DEB) COD_CTA,'
      '  SUM(0.00) VL_DESC,'
      '  SUM(I.VAL_TOTAL) VL_BC_PIS,'
      '  SUM(I.VAL_TOTAL) VL_ITEM,'
      '  SUM(I.VAL_PIS) VL_PIS'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'INNER JOIN TB_OPERACAO O_N ON N.COD_OPERACAO = O_N.COD_OPERACAO'
      'LEFT JOIN TB_OPERACAO O_I ON I.COD_OPERACAO = O_I.COD_OPERACAO'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1=1'
      'WHERE'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  N.COD_NOTA_CAB_TRANS_ENT IS NULL'
      'AND'
      '  O.IND_TRANSFERENCIA = '#39'N'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      
        '  (((N.IND_ENTRADA_SAIDA = '#39'E'#39') AND (O.IND_COMPRAS = '#39'C'#39')) --COM' +
        'PRAS'
      '  OR'
      
        '  ((N.IND_ENTRADA_SAIDA = '#39'E'#39') AND (O.IND_VENDAS = '#39'D'#39')) --DEVOL' +
        'U'#199#195'O DE VENDA'
      '  OR'
      
        '  ((N.IND_ENTRADA_SAIDA = '#39'S'#39') AND (O.IND_COMPRAS = '#39'D'#39')))--DEVO' +
        'LU'#199#195'O DE COMPRA'
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO = '#39'55'#39
      'AND'
      '  NVL(O.PERC_BASE_PIS,-1) >= 0'
      'GROUP BY'
      
        '  DECODE(C.COD_ESTADO,'#39'EX'#39',DECODE(C.IND_FISICA_JURIDICA,'#39'F'#39','#39'999' +
        '99999999'#39','#39'99999999999999'#39'), C.NUM_CGC_CPF),'
      
        '  NVL(I.COD_CST_PIS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_CST_' +
        'PIS, P.COD_CST_PIS_SAIDA)),  '
      
        '  cast(DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_OPERACAO,' +
        ' null, O_N.NUM_NATUREZA_EST_NOVO, O_I.NUM_NATUREZA_EST_NOVO), de' +
        'code(I.COD_OPERACAO, null, O_N.NUM_NATUREZA_INT_NOVO, O_I.NUM_NA' +
        'TUREZA_INT_NOVO)) as number(4)),  '
      '  PS.PERC_PIS,  '
      
        '  Decode(N.IND_ENTRADA_SAIDA, '#39'E'#39', O_N.COD_CONTABIL_COFINS_CRED,' +
        ' O_N.COD_CONTABIL_COFINS_DEB)')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000D000000434E504A5F4350465F5041525401000000000007
      0000004353545F5049530100000000000400000043464F500100000000000800
      0000414C49515F50495301000000000007000000434F445F4354410100000000
      0007000000564C5F4445534301000000000009000000564C5F42435F50495301
      000000000007000000564C5F4954454D01000000000006000000564C5F504953
      010000000000}
    Session = DMOracle.DBCemapa
    Left = 96
    Top = 80
    object QReg191CNPJ_CPF_PART: TStringField
      FieldName = 'CNPJ_CPF_PART'
      Size = 18
    end
    object QReg191CST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object QReg191CFOP: TFloatField
      FieldName = 'CFOP'
    end
    object QReg191ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object QReg191COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 15
    end
    object QReg191VL_DESC: TFloatField
      FieldName = 'VL_DESC'
    end
    object QReg191VL_BC_PIS: TFloatField
      FieldName = 'VL_BC_PIS'
    end
    object QReg191VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
    end
    object QReg191VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
  end
  object QReg195: TOracleDataSet1
    SQL.Strings = (
      'SELECT  '
      
        '  DECODE(C.COD_ESTADO,'#39'EX'#39',DECODE(C.IND_FISICA_JURIDICA,'#39'F'#39','#39'999' +
        '99999999'#39','#39'99999999999999'#39'), C.NUM_CGC_CPF) CNPJ_CPF_PART,'
      
        '  NVL(I.COD_CST_COFINS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_C' +
        'ST_COFINS, P.COD_CST_COFINS_SAIDA)) CST_COFINS,  '
      
        '  cast(DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_OPERACAO,' +
        ' null, O_N.NUM_NATUREZA_EST_NOVO, O_I.NUM_NATUREZA_EST_NOVO), de' +
        'code(I.COD_OPERACAO, null, O_N.NUM_NATUREZA_INT_NOVO, O_I.NUM_NA' +
        'TUREZA_INT_NOVO)) as number(4)) + 0.00 CFOP,  '
      '  PS.PERC_COFINS ALIQ_COFINS,  '
      
        '  Decode(N.IND_ENTRADA_SAIDA, '#39'E'#39', O_N.COD_CONTABIL_COFINS_CRED,' +
        ' O_N.COD_CONTABIL_COFINS_DEB) COD_CTA,'
      '  SUM(0.00) VL_DESC,'
      '  SUM(I.VAL_TOTAL) VL_BC_COFINS,'
      '  SUM(I.VAL_TOTAL) VL_ITEM,'
      '  SUM(I.VAL_CONFINS) VL_COFINS'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'INNER JOIN TB_OPERACAO O_N ON N.COD_OPERACAO = O_N.COD_OPERACAO'
      'LEFT JOIN TB_OPERACAO O_I ON I.COD_OPERACAO = O_I.COD_OPERACAO'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1=1'
      'WHERE'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  N.COD_NOTA_CAB_TRANS_ENT IS NULL'
      'AND'
      '  O.IND_TRANSFERENCIA = '#39'N'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      
        '  (((N.IND_ENTRADA_SAIDA = '#39'E'#39') AND (O.IND_COMPRAS = '#39'C'#39')) --COM' +
        'PRAS'
      '  OR'
      
        '  ((N.IND_ENTRADA_SAIDA = '#39'E'#39') AND (O.IND_VENDAS = '#39'D'#39')) --DEVOL' +
        'U'#199#195'O DE VENDA'
      '  OR'
      
        '  ((N.IND_ENTRADA_SAIDA = '#39'S'#39') AND (O.IND_COMPRAS = '#39'D'#39')))--DEVO' +
        'LU'#199#195'O DE COMPRA'
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO = '#39'55'#39
      'AND'
      '  NVL(O.PERC_BASE_COFINS,-1) >= 0'
      'GROUP BY'
      
        '  DECODE(C.COD_ESTADO,'#39'EX'#39',DECODE(C.IND_FISICA_JURIDICA,'#39'F'#39','#39'999' +
        '99999999'#39','#39'99999999999999'#39'), C.NUM_CGC_CPF),'
      
        '  NVL(I.COD_CST_COFINS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_C' +
        'ST_COFINS, P.COD_CST_COFINS_SAIDA)), '
      
        '  cast(DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_OPERACAO,' +
        ' null, O_N.NUM_NATUREZA_EST_NOVO, O_I.NUM_NATUREZA_EST_NOVO), de' +
        'code(I.COD_OPERACAO, null, O_N.NUM_NATUREZA_INT_NOVO, O_I.NUM_NA' +
        'TUREZA_INT_NOVO)) as number(4)),  '
      '  PS.PERC_COFINS,  '
      
        '  Decode(N.IND_ENTRADA_SAIDA, '#39'E'#39', O_N.COD_CONTABIL_COFINS_CRED,' +
        ' O_N.COD_CONTABIL_COFINS_DEB)')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000D000000434E504A5F4350465F504152540100000000000A
      0000004353545F434F46494E530100000000000400000043464F500100000000
      000B000000414C49515F434F46494E5301000000000007000000434F445F4354
      4101000000000007000000564C5F444553430100000000000C000000564C5F42
      435F434F46494E5301000000000007000000564C5F4954454D01000000000009
      000000564C5F434F46494E53010000000000}
    Session = DMOracle.DBCemapa
    Left = 160
    Top = 80
    object QReg195CNPJ_CPF_PART: TStringField
      FieldName = 'CNPJ_CPF_PART'
      Size = 18
    end
    object QReg195CST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object QReg195CFOP: TFloatField
      FieldName = 'CFOP'
    end
    object QReg195ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object QReg195COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 15
    end
    object QReg195VL_DESC: TFloatField
      FieldName = 'VL_DESC'
    end
    object QReg195VL_BC_COFINS: TFloatField
      FieldName = 'VL_BC_COFINS'
    end
    object QReg195VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
    end
    object QReg195VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
  end
  object QReg199: TOracleDataSet1
    SQL.Strings = (
      'SELECT  '
      '  DECODE(I.NUM_DI,NULL,1,0) COD_DOC_IMP,'
      '  DECODE(I.NUM_DI,NULL,0,NUM_DI) NUM_DOC_IMP,'
      '  SUM(NVL(I.VAL_PIS,0)) VL_PIS_IMP,'
      '  SUM(NVL(I.VAL_CONFINS,0)) VL_COFINS_IMP'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL'
      
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
      '  --CFOP DE IMPORTACAO COME'#199'A COM 3'
      
        '  CAST(DECODE(F.COD_ESTADO, N.COD_ESTADO,O.NUM_NATUREZA_EST_NOVO' +
        ', O.NUM_NATUREZA_INT_NOVO) AS NUMBER(4)) > 3000 '
      'AND'
      '  N.IND_ENTRADA_SAIDA = '#39'E'#39
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO = '#39'55'#39
      'AND'
      
        '  (NVL(O.PERC_BASE_PIS,-1) >= 0 OR NVL(O.PERC_BASE_COFINS,-1) >=' +
        ' 0)'
      'GROUP BY '
      '  DECODE(I.NUM_DI,NULL,1,0), '
      '  DECODE(I.NUM_DI,NULL,0,NUM_DI) ')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000B000000434F445F444F435F494D500100000000000B0000
      004E554D5F444F435F494D500100000000000A000000564C5F5049535F494D50
      0100000000000D000000564C5F434F46494E535F494D50010000000000}
    Session = DMOracle.DBCemapa
    Left = 224
    Top = 80
    object QReg199COD_DOC_IMP: TFloatField
      FieldName = 'COD_DOC_IMP'
    end
    object QReg199NUM_DOC_IMP: TFloatField
      FieldName = 'NUM_DOC_IMP'
    end
    object QReg199VL_PIS_IMP: TFloatField
      FieldName = 'VL_PIS_IMP'
    end
    object QReg199VL_COFINS_IMP: TFloatField
      FieldName = 'VL_COFINS_IMP'
    end
  end
  object QReg381: TOracleDataSet1
    SQL.Strings = (
      'SELECT  '
      
        '  NVL(I.COD_CST_PIS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_CST_' +
        'PIS, P.COD_CST_PIS_SAIDA)) CST_PIS,'
      '  I.COD_PRODUTO COD_ITEM,  '
      '  PS.PERC_PIS ALIQ_PIS,  '
      
        '  --Decode(N.IND_ENTRADA_SAIDA, '#39'E'#39', O_N.COD_CONTABIL_PIS_CRED, ' +
        'O_N.COD_CONTABIL_PIS_DEB) COD_CTA,'
      '  O_N.COD_CONTABIL_NOTA_SPED_CONTRIB AS COD_CTA,'
      '  SUM(I.VAL_TOTAL) - SUM(I.VAL_ICM) VL_BC_PIS,'
      '  SUM(I.VAL_TOTAL) VL_ITEM,'
      '  SUM(I.VAL_PIS) VL_PIS'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'INNER JOIN TB_OPERACAO O_N ON N.COD_OPERACAO = O_N.COD_OPERACAO'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1=1'
      'WHERE'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  N.COD_NOTA_CAB_TRANS_ENT IS NULL'
      'AND'
      '  O.IND_TRANSFERENCIA = '#39'N'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  N.IND_ENTRADA_SAIDA = '#39'S'#39
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO = '#39'02'#39
      'AND'
      '  NVL(O.PERC_BASE_PIS,-1) >= 0 '
      'GROUP BY'
      
        '  NVL(I.COD_CST_PIS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_CST_' +
        'PIS, P.COD_CST_PIS_SAIDA)),'
      '  I.COD_PRODUTO,'
      '  PS.PERC_PIS,'
      '  O_N.COD_CONTABIL_NOTA_SPED_CONTRIB')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000007000000070000004353545F50495301000000000008000000434F44
      5F4954454D01000000000008000000414C49515F504953010000000000070000
      00434F445F43544101000000000009000000564C5F42435F5049530100000000
      0007000000564C5F4954454D01000000000006000000564C5F50495301000000
      0000}
    Session = DMOracle.DBCemapa
    Left = 352
    Top = 80
    object QReg381CST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object QReg381COD_ITEM: TFloatField
      FieldName = 'COD_ITEM'
    end
    object QReg381ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object QReg381COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 15
    end
    object QReg381VL_BC_PIS: TFloatField
      FieldName = 'VL_BC_PIS'
    end
    object QReg381VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
    end
    object QReg381VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
  end
  object QReg380: TOracleDataSet1
    SQL.Strings = (
      'SELECT  '
      '  '#39'02'#39' COD_MOD,'
      '  MIN(N.DT_RECEBIMENTO) DT_DOC_INI,'
      '  MAX(N.DT_RECEBIMENTO) DT_DOC_FIN,'
      '  MIN(N.NUM_NOTA) NUM_DOC_INI,'
      '  MAX(N.NUM_NOTA) NUM_DOC_FIN,'
      
        '  DECODE(PS.COD_EMPRESA, '#39'CGS'#39', (SUM(I.VAL_TOTAL) + N.VAL_DESPES' +
        'AS + (CASE WHEN ((N.NUM_CONHECIMENTO_FRETE IS NOT NULL) AND (N.I' +
        'ND_ENTRADA_SAIDA = '#39'E'#39') AND (N.IND_TIPO_FRETE = '#39'FOB'#39')) THEN 0.0' +
        '0 ELSE N.VAL_FRETE END) + SUM(I.VAL_ICMS_SUBST) + SUM(CASE WHEN ' +
        '(I.COD_CST_IPI IN ('#39'00'#39', '#39'50'#39')) THEN I.VAL_IPI ELSE 0 END) - N.V' +
        'AL_DESCONTO), CASE WHEN(O.IND_FIXAR_EMPRESA = '#39'N'#39' AND O.IND_FIXA' +
        'R_OUTRAS_EMP = '#39'N'#39' AND O.IND_FIXAR_CONSUMO = '#39'N'#39') THEN SUM(I.VAL' +
        '_TOTAL) ELSE (SUM(I.VAL_TOTAL) + N.VAL_DESPESAS - N.VAL_DESCONTO' +
        ') END) VL_DOC,'
      '  SUM(DECODE(N.IND_SITUACAO,3,I.VAL_TOTAL,0)) VL_DOC_CANC  '
      'FROM'
      '  TB_PARAM_SISTEMA PS,'
      '  TB_SERIE,'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      
        'INNER JOIN TB_OPERACAO O_N ON (N.COD_OPERACAO = O_N.COD_OPERACAO' +
        ')'
      'LEFT JOIN TB_OPERACAO O_I ON (I.COD_OPERACAO = O_I.COD_OPERACAO)'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      'WHERE'
      '  N.COD_SERIE = TB_SERIE.COD_SERIE'
      'AND'
      '  N.COD_FILIAL = TB_SERIE.COD_FILIAL'
      'AND'
      '  N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO'
      'AND'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  N.COD_NOTA_CAB_TRANS_ENT IS NULL'
      'AND'
      '  O.IND_TRANSFERENCIA = '#39'N'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  N.IND_ENTRADA_SAIDA = '#39'S'#39
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO = '#39'02'#39
      'AND'
      '  NVL(O_N.PERC_BASE_PIS,-1) >= 0 '
      'GROUP BY '
      '  '#39'02'#39','
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
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000007000000434F445F4D4F440100000000000A00000044545F
      444F435F494E490100000000000A00000044545F444F435F46494E0100000000
      000B0000004E554D5F444F435F494E490100000000000B0000004E554D5F444F
      435F46494E0100000000000B000000564C5F444F435F43414E43010000000000
      06000000564C5F444F43010000000000}
    Session = DMOracle.DBCemapa
    Left = 288
    Top = 80
    object QReg380COD_MOD: TStringField
      FieldName = 'COD_MOD'
      Size = 2
    end
    object QReg380DT_DOC_INI: TDateTimeField
      FieldName = 'DT_DOC_INI'
    end
    object QReg380DT_DOC_FIN: TDateTimeField
      FieldName = 'DT_DOC_FIN'
    end
    object QReg380NUM_DOC_INI: TFloatField
      FieldName = 'NUM_DOC_INI'
    end
    object QReg380NUM_DOC_FIN: TFloatField
      FieldName = 'NUM_DOC_FIN'
    end
    object QReg380VL_DOC_CANC: TFloatField
      FieldName = 'VL_DOC_CANC'
    end
    object QReg380VL_DOC: TFloatField
      FieldName = 'VL_DOC'
    end
  end
  object QReg385: TOracleDataSet1
    SQL.Strings = (
      'SELECT  '
      
        '  NVL(I.COD_CST_COFINS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_C' +
        'ST_COFINS, P.COD_CST_COFINS_SAIDA)) CST_COFINS,'
      '  I.COD_PRODUTO COD_ITEM,  '
      '  PS.PERC_COFINS ALIQ_COFINS,  '
      
        '  Decode(N.IND_ENTRADA_SAIDA, '#39'E'#39', O_N.COD_CONTABIL_COFINS_CRED,' +
        ' O_N.COD_CONTABIL_COFINS_DEB) COD_CTA,'
      '  SUM(I.VAL_TOTAL) - SUM(I.VAL_ICM) VL_BC_COFINS,'
      '  SUM(I.VAL_TOTAL) VL_ITEM,'
      '  SUM(I.VAL_CONFINS) VL_COFINS'
      'FROM'
      '  TB_PARAM_SISTEMA PS,'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'INNER JOIN TB_OPERACAO O_N ON N.COD_OPERACAO = O_N.COD_OPERACAO'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'WHERE'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  N.COD_NOTA_CAB_TRANS_ENT IS NULL'
      'AND'
      '  O.IND_TRANSFERENCIA = '#39'N'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  N.IND_ENTRADA_SAIDA = '#39'S'#39
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO = '#39'02'#39
      'AND'
      '  NVL(O.PERC_BASE_COFINS,-1) >= 0'
      'GROUP BY'
      
        '  NVL(I.COD_CST_COFINS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_C' +
        'ST_COFINS, P.COD_CST_COFINS_SAIDA)),'
      '  I.COD_PRODUTO,  '
      '  PS.PERC_COFINS,  '
      
        '  Decode(N.IND_ENTRADA_SAIDA, '#39'E'#39', O_N.COD_CONTABIL_COFINS_CRED,' +
        ' O_N.COD_CONTABIL_COFINS_DEB)')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000A0000004353545F434F46494E5301000000000008000000
      434F445F4954454D0100000000000B000000414C49515F434F46494E53010000
      00000007000000434F445F4354410100000000000C000000564C5F42435F434F
      46494E5301000000000007000000564C5F4954454D0100000000000900000056
      4C5F434F46494E53010000000000}
    Session = DMOracle.DBCemapa
    Left = 424
    Top = 80
    object QReg385CST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object QReg385COD_ITEM: TFloatField
      FieldName = 'COD_ITEM'
    end
    object QReg385ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object QReg385COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 15
    end
    object QReg385VL_BC_COFINS: TFloatField
      FieldName = 'VL_BC_COFINS'
    end
    object QReg385VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
    end
    object QReg385VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
  end
  object QReg395: TOracleDataSet1
    SQL.Strings = (
      'SELECT  '
      '  TB_SERIE.COD_SERIE_MODELO COD_MOD,'
      '  C.COD_CADASTRO + 0.00 COD_PART,'
      '  TB_SERIE.COD_SERIE SER,'
      '  N.NUM_NOTA NUM_DOC,'
      '  N.DT_RECEBIMENTO DT_DOC,'
      
        '  DECODE(PS.COD_EMPRESA, '#39'CGS'#39', (SUM(I.VAL_TOTAL) + SUM(I.VAL_DE' +
        'SPESAS) + (CASE WHEN ((N.NUM_CONHECIMENTO_FRETE IS NOT NULL) AND' +
        ' (N.IND_ENTRADA_SAIDA = '#39'E'#39') AND (N.IND_TIPO_FRETE = '#39'FOB'#39')) THE' +
        'N 0.00 ELSE N.VAL_FRETE END) + SUM(I.VAL_ICMS_SUBST) + SUM(CASE ' +
        'WHEN (I.COD_CST_IPI IN ('#39'00'#39', '#39'50'#39')) THEN I.VAL_IPI ELSE 0 END) ' +
        '- PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)), CASE WHEN(O.IND_FIXAR_EMP' +
        'RESA = '#39'N'#39' AND O.IND_FIXAR_OUTRAS_EMP = '#39'N'#39' AND O.IND_FIXAR_CONS' +
        'UMO = '#39'N'#39') THEN SUM(I.VAL_TOTAL) ELSE (SUM(I.VAL_TOTAL) + SUM(I.' +
        'VAL_DESPESAS) - PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB)) END) VL_DOC'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1=1'
      'WHERE'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  N.IND_ENTRADA_SAIDA = '#39'S'#39
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO IN ('#39'02'#39','#39'2D'#39','#39'2E'#39','#39'59'#39')'
      'AND'
      
        '  (NVL(O.PERC_BASE_PIS,-1) >= 0 AND NVL(O.PERC_BASE_COFINS,-1) >' +
        '= 0)'
      'GROUP BY '
      '  TB_SERIE.COD_SERIE_MODELO, '
      '  C.COD_CADASTRO + 0.00, '
      '  TB_SERIE.COD_SERIE, '
      '  N.NUM_NOTA, '
      '  N.DT_RECEBIMENTO,'
      '  PS.COD_EMPRESA,'
      '  N.VAL_DESPESAS,'
      '  N.NUM_CONHECIMENTO_FRETE,'
      '  N.IND_ENTRADA_SAIDA,'
      '  N.IND_TIPO_FRETE,'
      '  N.VAL_FRETE,'
      '  I.VAL_IPI,'
      '  PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '  O.IND_FIXAR_EMPRESA,'
      '  O.IND_FIXAR_OUTRAS_EMP,'
      '  O.IND_FIXAR_CONSUMO')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000007000000434F445F4D4F4401000000000008000000434F44
      5F5041525401000000000003000000534552010000000000070000004E554D5F
      444F430100000000000600000044545F444F4301000000000006000000564C5F
      444F43010000000000}
    Session = DMOracle.DBCemapa
    Left = 488
    Top = 80
    object QReg395COD_MOD: TStringField
      FieldName = 'COD_MOD'
      Size = 2
    end
    object QReg395COD_PART: TFloatField
      FieldName = 'COD_PART'
    end
    object QReg395SER: TStringField
      FieldName = 'SER'
      Required = True
      Size = 3
    end
    object QReg395NUM_DOC: TIntegerField
      FieldName = 'NUM_DOC'
      Required = True
    end
    object QReg395DT_DOC: TDateTimeField
      FieldName = 'DT_DOC'
    end
    object QReg395VL_DOC: TFloatField
      FieldName = 'VL_DOC'
    end
  end
  object QReg396: TOracleDataSet1
    SQL.Strings = (
      'SELECT  '
      '  P.COD_PRODUTO + 0.00 COD_ITEM,'
      '  '#39'01'#39' NAT_BC_CRED,'
      
        '  NVL(I.COD_CST_PIS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_CST_' +
        'PIS, P.COD_CST_PIS_SAIDA)) CST_PIS,'
      
        '  NVL(I.COD_CST_COFINS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_C' +
        'ST_COFINS, P.COD_CST_COFINS_SAIDA)) CST_COFINS,'
      '  PS.PERC_PIS ALIQ_PIS,'
      '  PS.PERC_COFINS ALIQ_COFINS,'
      '  Decode(N.IND_ENTRADA_SAIDA, '#39'E'#39', '
      
        '    DECODE(NVL(I.VAL_CONFINS,0), 0, O.COD_CONTABIL_PIS_CRED, O.C' +
        'OD_CONTABIL_COFINS_CRED),'
      
        '    DECODE(NVL(I.VAL_CONFINS,0), 0, O.COD_CONTABIL_PIS_DEB, O.CO' +
        'D_CONTABIL_COFINS_DEB)'
      '   ) COD_CTA,   '
      '  SUM(0.00) VL_DESC,'
      '  SUM(I.VAL_TOTAL) + 0.00 VL_ITEM,'
      '  SUM(I.VAL_TOTAL) + 0.00 VL_BC_PIS,'
      '  SUM(I.VAL_PIS) + 0.00 VL_PIS,'
      '  SUM(I.VAL_TOTAL) + 0.00 VL_BC_COFINS,'
      '  SUM(I.VAL_CONFINS) + 0.00 VL_COFINS '
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1=1'
      'WHERE'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  N.IND_ENTRADA_SAIDA = '#39'S'#39
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO IN ('#39'02'#39','#39'2D'#39','#39'2E'#39','#39'59'#39')'
      'AND'
      
        '  (NVL(O.PERC_BASE_PIS,-1) >= 0 AND NVL(O.PERC_BASE_COFINS,-1) >' +
        '= 0)'
      
        'GROUP BY P.COD_PRODUTO + 0.00, '#39'01'#39', NVL(I.COD_CST_PIS, DECODE(N' +
        '.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_CST_PIS, P.COD_CST_PIS_SAIDA)), N' +
        'VL(I.COD_CST_COFINS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_CST_' +
        'COFINS, P.COD_CST_COFINS_SAIDA)), PS.PERC_PIS, PS.PERC_COFINS, D' +
        'ecode(N.IND_ENTRADA_SAIDA, '#39'E'#39', '
      
        '    DECODE(NVL(I.VAL_CONFINS,0), 0, O.COD_CONTABIL_PIS_CRED, O.C' +
        'OD_CONTABIL_COFINS_CRED),'
      
        '    DECODE(NVL(I.VAL_CONFINS,0), 0, O.COD_CONTABIL_PIS_DEB, O.CO' +
        'D_CONTABIL_COFINS_DEB)'
      '   )')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000D00000008000000434F445F4954454D0100000000000B0000004E41
      545F42435F43524544010000000000070000004353545F504953010000000000
      0A0000004353545F434F46494E5301000000000008000000414C49515F504953
      0100000000000B000000414C49515F434F46494E530100000000000700000043
      4F445F43544101000000000007000000564C5F44455343010000000000070000
      00564C5F4954454D01000000000009000000564C5F42435F5049530100000000
      0006000000564C5F5049530100000000000C000000564C5F42435F434F46494E
      5301000000000009000000564C5F434F46494E53010000000000}
    Session = DMOracle.DBCemapa
    Left = 24
    Top = 152
    object QReg396COD_ITEM: TFloatField
      FieldName = 'COD_ITEM'
    end
    object QReg396NAT_BC_CRED: TStringField
      FieldName = 'NAT_BC_CRED'
      Size = 2
    end
    object QReg396CST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object QReg396CST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object QReg396ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object QReg396ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object QReg396COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 15
    end
    object QReg396VL_DESC: TFloatField
      FieldName = 'VL_DESC'
    end
    object QReg396VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
    end
    object QReg396VL_BC_PIS: TFloatField
      FieldName = 'VL_BC_PIS'
    end
    object QReg396VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object QReg396VL_BC_COFINS: TFloatField
      FieldName = 'VL_BC_COFINS'
    end
    object QReg396VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
  end
  object QReg490: TOracleDataSet1
    SQL.Strings = (
      'SELECT  '
      '  MIN(N.DT_RECEBIMENTO) DT_DOC_INI,'
      '  MAX(N.DT_RECEBIMENTO) DT_DOC_FIN,'
      '  TB_SERIE.COD_SERIE_MODELO COD_MOD'
      'FROM'
      '  TB_NOTA_CAB N'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1=1'
      'WHERE'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  O.IND_CUPOM_FISCAL = '#39'S'#39
      'AND'
      '  N.IND_ENTRADA_SAIDA = '#39'S'#39
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      
        '  TB_SERIE.COD_SERIE_MODELO IN ('#39'02'#39','#39'2D'#39','#39'59'#39') GROUP BY TB_SERI' +
        'E.COD_SERIE_MODELO')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000A00000044545F444F435F494E490100000000000A000000
      44545F444F435F46494E01000000000007000000434F445F4D4F440100000000
      00}
    Session = DMOracle.DBCemapa
    Left = 88
    Top = 152
    object QReg490DT_DOC_INI: TDateTimeField
      FieldName = 'DT_DOC_INI'
    end
    object QReg490DT_DOC_FIN: TDateTimeField
      FieldName = 'DT_DOC_FIN'
    end
    object QReg490COD_MOD: TStringField
      FieldName = 'COD_MOD'
      Size = 2
    end
  end
  object QReg491: TOracleDataSet1
    SQL.Strings = (
      'SELECT  '
      '  P.COD_PRODUTO + 0.00 COD_ITEM,'
      
        '  NVL(I.COD_CST_PIS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_CST_' +
        'PIS, P.COD_CST_PIS_SAIDA)) CST_PIS,'
      
        '  cast(DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_OPERACAO,' +
        ' null, O_N.NUM_NATUREZA_EST_NOVO, O_I.NUM_NATUREZA_EST_NOVO), de' +
        'code(I.COD_OPERACAO, null, O_N.NUM_NATUREZA_INT_NOVO, O_I.NUM_NA' +
        'TUREZA_INT_NOVO)) as number(4)) + 0.00 CFOP,'
      '  PS.PERC_PIS ALIQ_PIS,'
      
        '  --Decode(N.IND_ENTRADA_SAIDA, '#39'E'#39', O_N.COD_CONTABIL_PIS_CRED, ' +
        'O_N.COD_CONTABIL_PIS_DEB) COD_CTA,'
      '  O_N.COD_CONTABIL_NOTA_SPED_CONTRIB,'
      '  SUM(I.VAL_TOTAL) + 0.00 VL_ITEM,'
      '  SUM(I.VAL_TOTAL) + 0.00 - SUM(I.VAL_ICM) VL_BC_PIS,'
      '  SUM(I.VAL_PIS) + 0.00 VL_PIS '
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_OPERACAO O_N ON N.COD_OPERACAO = O_N.COD_OPERACAO'
      'LEFT JOIN TB_OPERACAO O_I ON I.COD_OPERACAO = O_I.COD_OPERACAO'
      'INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1=1'
      'WHERE'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  O.IND_CUPOM_FISCAL = '#39'S'#39
      'AND'
      '  N.IND_ENTRADA_SAIDA = '#39'S'#39
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO = :MODELO'
      'AND'
      '  NVL(O.PERC_BASE_PIS,-1) >= 0'
      'GROUP BY '
      '  P.COD_PRODUTO + 0.00,'
      
        '  NVL(I.COD_CST_PIS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_CST_' +
        'PIS, P.COD_CST_PIS_SAIDA)),'
      
        '  cast(DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_OPERACAO,' +
        ' null, O_N.NUM_NATUREZA_EST_NOVO, O_I.NUM_NATUREZA_EST_NOVO), de' +
        'code(I.COD_OPERACAO, null, O_N.NUM_NATUREZA_INT_NOVO, O_I.NUM_NA' +
        'TUREZA_INT_NOVO)) as number(4)) + 0.00,'
      '  PS.PERC_PIS,'
      '  O_N.COD_CONTABIL_NOTA_SPED_CONTRIB')
    Variables.Data = {
      03000000040000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000070000003A4D4F44454C4F
      050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000800000008000000434F445F4954454D010000000000070000004353
      545F5049530100000000000400000043464F5001000000000008000000414C49
      515F50495301000000000007000000434F445F43544101000000000007000000
      564C5F4954454D01000000000009000000564C5F42435F504953010000000000
      06000000564C5F504953010000000000}
    Session = DMOracle.DBCemapa
    Left = 160
    Top = 152
    object QReg491COD_ITEM: TFloatField
      FieldName = 'COD_ITEM'
    end
    object QReg491CST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object QReg491CFOP: TFloatField
      FieldName = 'CFOP'
    end
    object QReg491ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object QReg491COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 15
    end
    object QReg491VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
    end
    object QReg491VL_BC_PIS: TFloatField
      FieldName = 'VL_BC_PIS'
    end
    object QReg491VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
  end
  object QReg495: TOracleDataSet1
    SQL.Strings = (
      'SELECT  '
      '  P.COD_PRODUTO + 0.00 COD_ITEM,'
      
        '  NVL(I.COD_CST_COFINS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_C' +
        'ST_COFINS, P.COD_CST_COFINS_SAIDA)) CST_COFINS,'
      
        '  cast(DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_OPERACAO,' +
        ' null, O_N.NUM_NATUREZA_EST_NOVO, O_I.NUM_NATUREZA_EST_NOVO), de' +
        'code(I.COD_OPERACAO, null, O_N.NUM_NATUREZA_INT_NOVO, O_I.NUM_NA' +
        'TUREZA_INT_NOVO)) as number(4)) + 0.00 CFOP,'
      '  PS.PERC_COFINS ALIQ_COFINS,'
      
        '  Decode(N.IND_ENTRADA_SAIDA, '#39'E'#39', O_N.COD_CONTABIL_COFINS_CRED,' +
        ' O_N.COD_CONTABIL_COFINS_DEB) COD_CTA,'
      '  SUM(I.VAL_TOTAL) + 0.00 VL_ITEM,'
      '  SUM(I.VAL_TOTAL) + 0.00 - SUM(I.VAL_ICM) VL_BC_COFINS,'
      '  SUM(I.VAL_CONFINS) + 0.00 VL_COFINS '
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'INNER JOIN TB_OPERACAO O_N ON N.COD_OPERACAO = O_N.COD_OPERACAO'
      'LEFT JOIN TB_OPERACAO O_I ON I.COD_OPERACAO = O_I.COD_OPERACAO'
      'INNER JOIN TB_CADASTRO C ON N.COD_CADASTRO = C.COD_CADASTRO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1=1'
      'WHERE'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  O.IND_CUPOM_FISCAL = '#39'S'#39
      'AND'
      '  N.IND_ENTRADA_SAIDA = '#39'S'#39
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'AND'
      '  TB_SERIE.COD_SERIE_MODELO = :MODELO'
      'AND'
      '  NVL(O.PERC_BASE_COFINS,-1) >= 0'
      'GROUP BY '
      '  P.COD_PRODUTO + 0.00,'
      
        '  NVL(I.COD_CST_COFINS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_C' +
        'ST_COFINS, P.COD_CST_COFINS_SAIDA)),'
      
        '  cast(DECODE(F.COD_ESTADO, N.COD_ESTADO, decode(I.COD_OPERACAO,' +
        ' null, O_N.NUM_NATUREZA_EST_NOVO, O_I.NUM_NATUREZA_EST_NOVO), de' +
        'code(I.COD_OPERACAO, null, O_N.NUM_NATUREZA_INT_NOVO, O_I.NUM_NA' +
        'TUREZA_INT_NOVO)) as number(4)) + 0.00,'
      '  PS.PERC_COFINS,'
      
        '  Decode(N.IND_ENTRADA_SAIDA, '#39'E'#39', O_N.COD_CONTABIL_COFINS_CRED,' +
        ' O_N.COD_CONTABIL_COFINS_DEB)')
    Variables.Data = {
      03000000040000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000070000003A4D4F44454C4F
      050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000800000008000000434F445F4954454D0100000000000A0000004353
      545F434F46494E530100000000000400000043464F500100000000000B000000
      414C49515F434F46494E5301000000000007000000434F445F43544101000000
      000007000000564C5F4954454D0100000000000C000000564C5F42435F434F46
      494E5301000000000009000000564C5F434F46494E53010000000000}
    Session = DMOracle.DBCemapa
    Left = 232
    Top = 152
    object QReg495COD_ITEM: TFloatField
      FieldName = 'COD_ITEM'
    end
    object QReg495CST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object QReg495CFOP: TFloatField
      FieldName = 'CFOP'
    end
    object QReg495ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object QReg495COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 15
    end
    object QReg495VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
    end
    object QReg495VL_BC_COFINS: TFloatField
      FieldName = 'VL_BC_COFINS'
    end
    object QReg495VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
  end
  object QReg500: TOracleDataSet1
    SQL.Strings = (
      'SELECT DISTINCT'
      '  N.COD_NOTA_CAB,'
      '  N.COD_CADASTRO + 0.00 COD_PARTICIPANTE,'
      '  TB_SERIE.COD_SERIE_MODELO COD_MOD,'
      '  00 COD_SIT,'
      '  N.COD_SERIE SER,'
      '  N.NUM_NOTA NUM_DOC,'
      '  substr(N.DESC_CHAVE_ACESSO, 4, 44) as CHV_DOCE,'
      '  N.DT_RECEBIMENTO DT_DOC,'
      '  N.DT_RECEBIMENTO DT_ENT,'
      '  N.COD_MENSAGEM + 0.00 COD_INF,  '
      '  DECODE(PS.COD_EMPRESA'
      '    , '#39'CGS'#39
      
        '    , (SUM(I.VAL_TOTAL) + SUM(I.VAL_DESPESAS) + (CASE WHEN ((N.N' +
        'UM_CONHECIMENTO_FRETE IS NOT NULL) AND (N.IND_ENTRADA_SAIDA = '#39'E' +
        #39') AND (N.IND_TIPO_FRETE = '#39'FOB'#39')) THEN 0.00 ELSE N.VAL_FRETE EN' +
        'D) + SUM(I.VAL_ICMS_SUBST) + SUM(CASE WHEN (I.COD_CST_IPI IN ('#39'0' +
        '0'#39', '#39'50'#39')) THEN I.VAL_IPI ELSE 0 END) - PEGA_DESCONTO_NOTA(N.COD' +
        '_NOTA_CAB))'
      
        '    , CASE WHEN(O.IND_FIXAR_EMPRESA = '#39'N'#39' AND O.IND_FIXAR_OUTRAS' +
        '_EMP = '#39'N'#39' AND O.IND_FIXAR_CONSUMO = '#39'N'#39') THEN SUM(I.VAL_TOTAL) ' +
        'ELSE (SUM(I.VAL_TOTAL) + SUM(I.VAL_DESPESAS) - PEGA_DESCONTO_NOT' +
        'A(N.COD_NOTA_CAB)) END'
      '  ) VL_DOC,  '
      '  SUM(I.VAL_ICM) VL_ICMS,  '
      '  SUM(I.VAL_PIS) VL_PIS,'
      '  SUM(I.VAL_CONFINS) VL_COFINS    '
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'WHERE'
      '  N.IND_SITUACAO = '#39'2'#39
      'AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      'AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'AND'
      '  (TB_SERIE.COD_SERIE_MODELO IN ('#39'06'#39', '#39'29'#39', '#39'28'#39', '#39'66'#39')'
      
        '    OR (TB_SERIE.COD_SERIE_MODELO = '#39'55'#39' AND O.COD_BC_CREDITO_PI' +
        'SCOFINS = 4))'
      'AND'
      '  N.COD_FILIAL = :COD_FILIAL'
      'AND'
      '  O.IND_ELETRICIDADE = '#39'S'#39
      'AND'
      '  N.IND_ENTRADA_SAIDA = '#39'E'#39
      'AND'
      
        ' ((NVL(O.PERC_BASE_PIS,-1) >= 0) AND (NVL(O.PERC_BASE_COFINS,-1)' +
        ' >= 0))'
      'AND'
      
        '  (P.IND_TIPO_PRODUTO = '#39'ENERGIA'#39' OR P.IND_TIPO_PRODUTO = '#39'SERVI' +
        #199'O'#39')'
      'AND'
      '  N.DT_RECEBIMENTO between :DATA_INI AND :DATA_FIN'
      'GROUP BY'
      '  N.COD_NOTA_CAB,'
      '  N.COD_CADASTRO + 0.00,'
      '  TB_SERIE.COD_SERIE_MODELO,'
      '  00,'
      '  N.COD_SERIE,'
      '  N.DESC_CHAVE_ACESSO,'
      '  N.NUM_NOTA,'
      '  N.DT_RECEBIMENTO,'
      '  N.DT_RECEBIMENTO,'
      '  N.COD_MENSAGEM + 0.00,'
      '  PS.COD_EMPRESA,'
      '  N.NUM_CONHECIMENTO_FRETE,'
      '  N.IND_ENTRADA_SAIDA,'
      '  N.IND_TIPO_FRETE,'
      '  N.VAL_FRETE,'
      '  --I.VAL_IPI,'
      '  PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB),'
      '  O.IND_FIXAR_EMPRESA,'
      '  O.IND_FIXAR_OUTRAS_EMP,'
      '  O.IND_FIXAR_CONSUMO')
    Variables.Data = {
      03000000030000000B0000003A434F445F46494C49414C030000000000000000
      000000090000003A444154415F494E490C000000000000000000000009000000
      3A444154415F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E00000010000000434F445F5041525449434950414E544501000000
      000007000000434F445F4D4F4401000000000007000000434F445F5349540100
      0000000003000000534552010000000000070000004E554D5F444F4301000000
      00000600000044545F444F430100000000000600000044545F454E5401000000
      000007000000434F445F494E4601000000000006000000564C5F444F43010000
      00000007000000564C5F49434D5301000000000006000000564C5F5049530100
      0000000009000000564C5F434F46494E530100000000000C000000434F445F4E
      4F54415F434142010000000000080000004348565F444F4345010000000000}
    Session = DMOracle.DBCemapa
    Left = 304
    Top = 152
    object QReg500COD_PARTICIPANTE: TFloatField
      FieldName = 'COD_PARTICIPANTE'
    end
    object QReg500COD_MOD: TStringField
      FieldName = 'COD_MOD'
      Size = 2
    end
    object QReg500COD_SIT: TFloatField
      FieldName = 'COD_SIT'
    end
    object QReg500SER: TStringField
      FieldName = 'SER'
      Required = True
      Size = 3
    end
    object QReg500NUM_DOC: TIntegerField
      FieldName = 'NUM_DOC'
      Required = True
    end
    object QReg500DT_DOC: TDateTimeField
      FieldName = 'DT_DOC'
    end
    object QReg500DT_ENT: TDateTimeField
      FieldName = 'DT_ENT'
    end
    object QReg500COD_INF: TFloatField
      FieldName = 'COD_INF'
    end
    object QReg500VL_DOC: TFloatField
      FieldName = 'VL_DOC'
    end
    object QReg500VL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
    end
    object QReg500VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object QReg500VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
    object QReg500COD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QReg500CHV_DOCE: TStringField
      FieldName = 'CHV_DOCE'
      Size = 47
    end
  end
  object QReg501: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      
        '  NVL(I.COD_CST_PIS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_CST_' +
        'PIS, P.COD_CST_PIS_SAIDA)) CST_PIS,'
      
        '  DECODE(O.COD_BC_CREDITO_PISCOFINS, NULL, '#39'01'#39', O.COD_BC_CREDIT' +
        'O_PISCOFINS) NAT_BC_CRED,'
      
        '  --Decode(N.IND_ENTRADA_SAIDA, '#39'E'#39', O.COD_CONTABIL_PIS_CRED, O.' +
        'COD_CONTABIL_PIS_DEB) COD_CTA,'
      '  PS.PERC_PIS ALIQ_PIS,'
      '  NVL(SUM(I.VAL_PIS), 0) VL_PIS,'
      '  NVL(SUM(I.VAL_TOTAL), 0) VL_ITEM,'
      
        '  NVL((SUM(I.VAL_TOTAL - I.VAL_DESCONTO) * O.PERC_BASE_PIS) / 10' +
        '0, 0) - SUM(I.VAL_ICM) VL_BC_PIS,'
      '  O.COD_CONTABIL_NOTA_SPED_CONTRIB AS COD_CTA,'
      
        '  NVL(O.COD_BC_CREDITO_PISCOFINS, '#39'01'#39') AS COD_BC_CREDITO_PISCOF' +
        'INS'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  N.COD_NOTA_CAB = :COD_NOTA'
      '--  AND'
      '--  I.VAL_PIS > 0'
      'GROUP BY '
      
        '    NVL(I.COD_CST_PIS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_CS' +
        'T_PIS, P.COD_CST_PIS_SAIDA)),'
      
        '    DECODE(O.COD_BC_CREDITO_PISCOFINS, NULL, '#39'01'#39', O.COD_BC_CRED' +
        'ITO_PISCOFINS), '
      
        '    Decode(N.IND_ENTRADA_SAIDA, '#39'E'#39', O.COD_CONTABIL_PIS_CRED, O.' +
        'COD_CONTABIL_PIS_DEB),'
      '    PS.PERC_PIS, '
      '    O.PERC_BASE_PIS,O.COD_CONTABIL_NOTA_SPED_CONTRIB,'
      '    NVL(O.COD_BC_CREDITO_PISCOFINS, '#39'01'#39')')
    Variables.Data = {
      0300000001000000090000003A434F445F4E4F54410300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      0400000008000000070000004353545F5049530100000000000B0000004E4154
      5F42435F4352454401000000000007000000434F445F43544101000000000008
      000000414C49515F50495301000000000006000000564C5F5049530100000000
      0007000000564C5F4954454D01000000000009000000564C5F42435F50495301
      000000000018000000434F445F42435F4352454449544F5F504953434F46494E
      53010000000000}
    Session = DMOracle.DBCemapa
    Left = 368
    Top = 152
    object QReg501CST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object QReg501NAT_BC_CRED: TStringField
      FieldName = 'NAT_BC_CRED'
      Size = 2
    end
    object QReg501COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 15
    end
    object QReg501ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object QReg501VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object QReg501VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
    end
    object QReg501VL_BC_PIS: TFloatField
      FieldName = 'VL_BC_PIS'
    end
    object QReg501COD_BC_CREDITO_PISCOFINS: TStringField
      FieldName = 'COD_BC_CREDITO_PISCOFINS'
      Size = 2
    end
  end
  object QReg505: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      
        '  NVL(I.COD_CST_COFINS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', P.COD_C' +
        'ST_COFINS, P.COD_CST_COFINS_SAIDA)) CST_COFINS,'
      
        '  DECODE(O.COD_BC_CREDITO_PISCOFINS, NULL, '#39'01'#39', O.COD_BC_CREDIT' +
        'O_PISCOFINS) NAT_BC_CRED,'
      
        '  --Decode(N.IND_ENTRADA_SAIDA, '#39'E'#39', O.COD_CONTABIL_COFINS_CRED,' +
        ' O.COD_CONTABIL_COFINS_DEB) COD_CTA,'
      '  PS.PERC_COFINS ALIQ_COFINS,'
      '  NVL(SUM(I.VAL_CONFINS), 0) VL_COFINS,'
      '  NVL(SUM(I.VAL_TOTAL), 0) VL_ITEM,'
      
        '  NVL((SUM(I.VAL_TOTAL - I.VAL_DESCONTO)* O.PERC_BASE_COFINS)/10' +
        '0, 0) - SUM(I.VAL_ICM) VL_BC_COFINS,'
      '  O.COD_CONTABIL_NOTA_SPED_CONTRIB AS COD_CTA,'
      
        '  NVL(O.COD_BC_CREDITO_PISCOFINS, '#39'01'#39') AS COD_BC_CREDITO_PISCOF' +
        'INS'
      'FROM'
      '  TB_NOTA_ITEM I'
      'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      'INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO'
      'INNER JOIN TB_FILIAL F ON F.COD_FILIAL = N.COD_FILIAL'
      'INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      
        'INNER JOIN TB_SERIE ON (N.COD_SERIE = TB_SERIE.COD_SERIE AND TB_' +
        'SERIE.COD_FILIAL = N.COD_FILIAL'
      #9'AND N.COD_SERIE_MODELO = TB_SERIE.COD_SERIE_MODELO)'
      'INNER JOIN TB_PARAM_SISTEMA PS ON 1 = 1'
      'WHERE'
      '  N.COD_NOTA_CAB = :COD_NOTA'
      '--  AND'
      '--  I.VAL_CONFINS > 0'
      
        'GROUP BY NVL(I.COD_CST_COFINS, DECODE(N.IND_ENTRADA_SAIDA, '#39'E'#39', ' +
        'P.COD_CST_COFINS, P.COD_CST_COFINS_SAIDA)),'
      
        '  DECODE(O.COD_BC_CREDITO_PISCOFINS, NULL, '#39'01'#39', O.COD_BC_CREDIT' +
        'O_PISCOFINS), '
      
        '  Decode(N.IND_ENTRADA_SAIDA, '#39'E'#39', O.COD_CONTABIL_COFINS_CRED, O' +
        '.COD_CONTABIL_COFINS_DEB),'
      '  PS.PERC_COFINS, '
      '  O.PERC_BASE_COFINS, '
      '  O.COD_CONTABIL_NOTA_SPED_CONTRIB,'
      '  NVL(O.COD_BC_CREDITO_PISCOFINS, '#39'01'#39')')
    Variables.Data = {
      0300000001000000090000003A434F445F4E4F54410300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000A0000004353545F434F46494E530100000000000B000000
      4E41545F42435F4352454401000000000007000000434F445F43544101000000
      00000B000000414C49515F434F46494E5301000000000009000000564C5F434F
      46494E5301000000000007000000564C5F4954454D0100000000000C00000056
      4C5F42435F434F46494E5301000000000018000000434F445F42435F43524544
      49544F5F504953434F46494E53010000000000}
    Session = DMOracle.DBCemapa
    Left = 432
    Top = 152
    object QReg505CST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object QReg505NAT_BC_CRED: TStringField
      FieldName = 'NAT_BC_CRED'
      Size = 2
    end
    object QReg505COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 15
    end
    object QReg505ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object QReg505VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
    object QReg505VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
    end
    object QReg505VL_BC_COFINS: TFloatField
      FieldName = 'VL_BC_COFINS'
    end
    object QReg505COD_BC_CREDITO_PISCOFINS: TStringField
      FieldName = 'COD_BC_CREDITO_PISCOFINS'
      Size = 2
    end
  end
  object QReg175: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '    CFOP,'
      '    SUM(VL_OPR) AS VL_OPR,'
      '    SUM(VL_DESC) AS VL_DESC,'
      '    CST_PIS,'
      '    SUM(VL_BC_PIS) AS VL_BC_PIS,'
      '    ALIQ_PIS,'
      '    QUANT_BC_PIS,'
      '    ALIQ_PIS_QUANT,'
      '    SUM(VL_PIS) AS VL_PIS,'
      '    CST_COFINS,'
      '    SUM(VL_BC_COFINS) AS VL_BC_COFINS,'
      '    ALIQ_COFINS,'
      '    QUANT_BC_COFINS,'
      '    ALIQ_COFINS_QUANT,'
      '    SUM(VL_COFINS) AS VL_COFINS,'
      '    SUM(VL_ICMS) AS VL_ICMS,'
      '    COD_CTA,'
      '    INFO_COMPL'
      'FROM'
      '('
      '    SELECT'
      '        cast('
      '            DECODE('
      '                F.COD_ESTADO, '
      '                N.COD_ESTADO, '
      '                decode('
      '                    I.COD_OPERACAO, '
      '                    null, '
      '                    O.NUM_NATUREZA_EST_NOVO, '
      '                    I.COD_CFOP'
      '                ), '
      '                decode('
      '                    I.COD_OPERACAO, '
      '                    null, '
      '                    O.NUM_NATUREZA_INT_NOVO, '
      '                    I.COD_CFOP'
      '                )'
      '          ) '
      '        as number(4)) + 0.00 CFOP,'
      '        I.VAL_TOTAL AS VL_OPR,'
      '        PEGA_DESCONTO_NOTA(N.COD_NOTA_CAB) AS VL_DESC,'
      '        I.COD_CST_PIS AS CST_PIS,'
      '        I.VAL_TOTAL * O.PERC_BASE_PIS / 100 AS VL_BC_PIS,'
      '        DECODE('
      '            ('
      '                SELECT IMP.PERC_ALIQUOTA '
      '                FROM TB_NOTA_IMPOSTO_SERVICO NI '
      
        '                    INNER JOIN TB_IMPOSTO IMP ON NI.COD_IMPOSTO ' +
        '= IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%PIS%'#39' AND ROWNUM <' +
        ' 2'
      '                WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '            ), '
      '            NULL, '
      '            TB_PARAM_SISTEMA.PERC_PIS, '
      '            ('
      '                SELECT IMP.PERC_ALIQUOTA'
      
        '                FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IM' +
        'POSTO IMP ON NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOS' +
        'TO LIKE '#39'%PIS%'#39' AND ROWNUM < 2'
      '                WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '            )'
      '        ) AS ALIQ_PIS,'
      '        NULL AS QUANT_BC_PIS,'
      '        NULL AS ALIQ_PIS_QUANT,'
      '        DECODE('
      '            (SELECT NI.VAL_IMPOSTO'
      
        '            FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOST' +
        'O IMP ON NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO L' +
        'IKE '#39'%PIS%'#39' AND ROWNUM < 2'
      '            WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '            NULL, '
      '            CAST(NVL(I.VAL_PIS,0.00) AS NUMBER(9,2)), '
      
        '            ((I.VAL_TOTAL-I.VAL_DESCONTO-I.VAL_DESCONTO_RATEIO) ' +
        '* ('
      '            SELECT '
      '                PERC_ALIQUOTA '
      '            FROM '
      '                TB_IMPOSTO '
      '                INNER JOIN TB_NOTA_IMPOSTO_SERVICO'
      
        '                    ON TB_IMPOSTO.COD_IMPOSTO = TB_NOTA_IMPOSTO_' +
        'SERVICO.COD_IMPOSTO'
      '            WHERE'
      '                TB_IMPOSTO.DESC_IMPOSTO LIKE '#39'%PIS%'#39
      '                AND'
      
        '                TB_NOTA_IMPOSTO_SERVICO.COD_NOTA_CAB = N.COD_NOT' +
        'A_CAB'
      '                AND'
      '                ROWNUM < 2'
      '          ) / 100)'
      '        ) AS VL_PIS,'
      '        I.COD_CST_COFINS AS CST_COFINS,'
      '        I.VAL_TOTAL * O.PERC_BASE_COFINS / 100 AS VL_BC_COFINS,'
      '        DECODE('
      '            ('
      '                SELECT IMP.PERC_ALIQUOTA '
      '                FROM TB_NOTA_IMPOSTO_SERVICO NI '
      
        '                    INNER JOIN TB_IMPOSTO IMP ON NI.COD_IMPOSTO ' +
        '= IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO LIKE '#39'%COFINS%'#39' AND ROWNU' +
        'M < 2'
      '                WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '            ), '
      '            NULL, '
      '            TB_PARAM_SISTEMA.PERC_COFINS, '
      '            ('
      '                SELECT IMP.PERC_ALIQUOTA'
      
        '                FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IM' +
        'POSTO IMP ON NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOS' +
        'TO LIKE '#39'%COFINS%'#39' AND ROWNUM < 2'
      '                WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '            )'
      '        ) AS ALIQ_COFINS,'
      '        NULL AS QUANT_BC_COFINS,'
      '        NULL AS ALIQ_COFINS_QUANT,'
      '        DECODE('
      '            (SELECT NI.VAL_IMPOSTO'
      
        '            FROM TB_NOTA_IMPOSTO_SERVICO NI INNER JOIN TB_IMPOST' +
        'O IMP ON NI.COD_IMPOSTO = IMP.COD_IMPOSTO AND IMP.DESC_IMPOSTO L' +
        'IKE '#39'%COFINS%'#39' AND ROWNUM < 2'
      '            WHERE NI.COD_NOTA_CAB = N.COD_NOTA_CAB), '
      '            NULL, '
      '            CAST(NVL(I.VAL_CONFINS,0.00) AS NUMBER(9,2)), '
      
        '            ((I.VAL_TOTAL-I.VAL_DESCONTO-I.VAL_DESCONTO_RATEIO) ' +
        '* ('
      '            SELECT '
      '                PERC_ALIQUOTA '
      '            FROM '
      '                TB_IMPOSTO '
      '                INNER JOIN TB_NOTA_IMPOSTO_SERVICO'
      
        '                    ON TB_IMPOSTO.COD_IMPOSTO = TB_NOTA_IMPOSTO_' +
        'SERVICO.COD_IMPOSTO'
      '            WHERE'
      '                TB_IMPOSTO.DESC_IMPOSTO LIKE '#39'%COFINS%'#39
      '                AND'
      
        '                TB_NOTA_IMPOSTO_SERVICO.COD_NOTA_CAB = N.COD_NOT' +
        'A_CAB'
      '                AND'
      '                ROWNUM < 2'
      '          ) / 100)'
      '        ) AS VL_COFINS,'
      '        I.VAL_ICM AS VL_ICMS,'
      '        NULL AS COD_CTA,'
      '        NULL AS INFO_COMPL'
      '    FROM'
      '        TB_PARAM_SISTEMA,'
      '        TB_NOTA_ITEM I'
      '            INNER JOIN TB_NOTA_CAB N'
      '                ON N.COD_NOTA_CAB = I.COD_NOTA_CAB'
      '            INNER JOIN TB_FILIAL F'
      '                ON N.COD_FILIAL = F.COD_FILIAL'
      '            INNER JOIN TB_OPERACAO O'
      '                ON N.COD_OPERACAO = O.COD_OPERACAO'
      '    WHERE'
      '        N.COD_NOTA_CAB = :COD_NOTA_CAB'
      '        AND'
      '        N.COD_SERIE_MODELO = '#39'65'#39
      '        AND'
      
        '        (I.COD_CST_PIS IS NOT NULL AND I.COD_CST_COFINS IS NOT N' +
        'ULL)'
      ')'
      'GROUP BY'
      '    CFOP, '
      '    CST_PIS, '
      '    ALIQ_PIS,'
      '    QUANT_BC_PIS,'
      '    ALIQ_PIS_QUANT,    '
      '    CST_COFINS,    '
      '    ALIQ_COFINS,'
      '    QUANT_BC_COFINS,'
      '    ALIQ_COFINS_QUANT,    '
      '    COD_CTA,'
      '    INFO_COMPL')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000120000000400000043464F5001000000000006000000564C5F4F5052
      01000000000007000000564C5F44455343010000000000070000004353545F50
      495301000000000009000000564C5F42435F5049530100000000000800000041
      4C49515F5049530100000000000C0000005155414E545F42435F504953010000
      0000000E000000414C49515F5049535F5155414E540100000000000600000056
      4C5F5049530100000000000A0000004353545F434F46494E530100000000000C
      000000564C5F42435F434F46494E530100000000000B000000414C49515F434F
      46494E530100000000000F0000005155414E545F42435F434F46494E53010000
      00000011000000414C49515F434F46494E535F5155414E540100000000000900
      0000564C5F434F46494E5301000000000007000000434F445F43544101000000
      00000A000000494E464F5F434F4D504C01000000000007000000564C5F49434D
      53010000000000}
    Session = DMOracle.DBCemapa
    Left = 336
    Top = 8
    object QReg175CFOP: TFloatField
      FieldName = 'CFOP'
    end
    object QReg175VL_OPR: TFloatField
      FieldName = 'VL_OPR'
    end
    object QReg175VL_DESC: TFloatField
      FieldName = 'VL_DESC'
    end
    object QReg175CST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object QReg175VL_BC_PIS: TFloatField
      FieldName = 'VL_BC_PIS'
    end
    object QReg175ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object QReg175QUANT_BC_PIS: TStringField
      FieldName = 'QUANT_BC_PIS'
      Size = 1
    end
    object QReg175ALIQ_PIS_QUANT: TStringField
      FieldName = 'ALIQ_PIS_QUANT'
      Size = 1
    end
    object QReg175VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object QReg175CST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object QReg175VL_BC_COFINS: TFloatField
      FieldName = 'VL_BC_COFINS'
    end
    object QReg175ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object QReg175QUANT_BC_COFINS: TStringField
      FieldName = 'QUANT_BC_COFINS'
      Size = 1
    end
    object QReg175ALIQ_COFINS_QUANT: TStringField
      FieldName = 'ALIQ_COFINS_QUANT'
      Size = 1
    end
    object QReg175VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
    object QReg175COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 1
    end
    object QReg175INFO_COMPL: TStringField
      FieldName = 'INFO_COMPL'
      Size = 1
    end
    object QReg175VL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
    end
  end
end
