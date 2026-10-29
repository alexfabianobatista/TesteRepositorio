object DMEmissaoTermo: TDMEmissaoTermo
  OldCreateOrder = False
  Left = 329
  Top = 145
  Height = 150
  Width = 215
  object QREmissaoTermo: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '('
      '  SELECT'
      '    T1.*,'
      '    '#39'APURACAO_ICMS'#39' AS TERMO'
      '  FROM'
      '  ('
      
        '    SELECT                /* TERMO DE ABERTURA APURACAO DE ICMS ' +
        '*/'
      '      F.DESC_FILIAL,'
      '      F.DESC_ENDERECO,'
      '      F.DESC_BAIRRO,'
      '      F.DESC_CIDADE,'
      '      F.DESC_CEP,'
      '      F.NUM_CGC,'
      '      F.DESC_INSCRICAO,'
      '      E.DESC_ESTADO,'
      '      '#39'Contador: '#39' || C.NOME AS CONTABILISTA,'
      '      '#39'CPF: '#39' || C.NUM_CGC_CPF AS CPF_CONTABILISTA,'
      '      '#39'CRC: '#39' || C.DESC_CRC AS CRC_CONTABILISTA,'
      '      '#39'Respons'#225'vel: '#39' || R.NOME AS RESPONSAVEL,'
      '      '#39'CPF: '#39' || R.NUM_CGC_CPF AS CPF_RESPONSAVEL,'
      '      R.NUM_INSCRICAO AS CI_RESPONSAVEL,'
      '      '#39'Cargo: '#39' || R.DESC_FUNCAO AS FUNC_RESPONSAVEL,'
      '      '#39'REGISTRO DE APURA'#199#195'O DE ICMS'#39' AS REGISTRO,'
      '      '#39'MODELO P9'#39' AS MODELO,'
      '      '#39'N'#218'MERO DE ORDEM '#39' || :NUM_ORDEM AS NUM_ORDEM,'
      '      '#39#39' AS ULT_LANC,'
      '      '#39'TERMO DE ABERTURA'#39' AS TITULO,'
      '      TO_DATE(:DT_ABERTURA) AS DIA,'
      '      '#39'ABERTURA'#39' AS TIPO,'
      '      :PAGINA_I AS PAGINA,'
      '      TO_NUMBER(:PAGINA_I) AS PAGINA_I,'
      '      TO_NUMBER(:PAGINA_F) AS PAGINA_F,'
      '      :DT_ABERTURA_TERMO AS DT_TERMO'
      '    FROM'
      '      TB_FILIAL F'
      '    LEFT JOIN'
      '      TB_CADASTRO C'
      '    ON'
      '      F.COD_CADASTRO_CONTABILISTA = C.COD_CADASTRO'
      '    LEFT JOIN'
      '      TB_CADASTRO R'
      '    ON'
      '      F.COD_CADASTRO_RESPONSAVEL = R.COD_CADASTRO'
      '    LEFT JOIN'
      '      TB_ESTADO E'
      '    ON'
      '      F.COD_ESTADO = E.COD_ESTADO'
      '    WHERE'
      '      F.COD_FILIAL = :FILIAL'
      ''
      '    UNION'
      ''
      
        '    SELECT                /* TERMO DE ENCERRAMENTO APURACAO DE I' +
        'CMS */'
      '      F.DESC_FILIAL,'
      '      F.DESC_ENDERECO,'
      '      F.DESC_BAIRRO,'
      '      F.DESC_CIDADE,'
      '      F.DESC_CEP,'
      '      F.NUM_CGC,'
      '      F.DESC_INSCRICAO,'
      '      E.DESC_ESTADO,'
      '      '#39'Contador: '#39' || C.NOME AS CONTABILISTA,'
      '      '#39'CPF: '#39' || C.NUM_CGC_CPF AS CPF_CONTABILISTA,'
      '      '#39'CRC: '#39' || C.DESC_CRC AS CRC_CONTABILISTA,'
      '      '#39'Respons'#225'vel: '#39' || R.NOME AS RESPONSAVEL,'
      '      '#39'CPF: '#39' || R.NUM_CGC_CPF AS CPF_RESPONSAVEL,'
      '      R.NUM_INSCRICAO AS CI_RESPONSAVEL,'
      '      '#39'Cargo: '#39' || R.DESC_FUNCAO AS FUNC_RESPONSAVEL,'
      '      '#39'REGISTRO DE APURA'#199#195'O DE ICMS'#39' AS REGISTRO,'
      '      '#39'MODELO P9'#39' AS MODELO,'
      '      '#39'N'#218'MERO DE ORDEM '#39' || :NUM_ORDEM AS NUM_ORDEM,'
      
        '      '#39#218'LTIMO LAN'#199'AMENTO EFETUADO EM '#39' || :DT_FECHAMENTO AS ULT_' +
        'LANC,'
      '      '#39'TERMO DE ENCERRAMENTO'#39' AS TITULO,'
      '      TO_DATE(:DT_FECHAMENTO) AS DIA,'
      '      '#39'ENCERRAMENTO'#39' AS TIPO,'
      '      :PAGINA_F AS PAGINA,'
      '      TO_NUMBER(:PAGINA_I) AS PAGINA_I,'
      '      TO_NUMBER(:PAGINA_F) AS PAGINA_F,'
      '      :DT_ENCERRAMENTO_TERMO AS DT_TERMO'
      '    FROM'
      '      TB_FILIAL F'
      '    LEFT JOIN'
      '      TB_CADASTRO C'
      '    ON'
      '      F.COD_CADASTRO_CONTABILISTA = C.COD_CADASTRO'
      '    LEFT JOIN'
      '      TB_CADASTRO R'
      '    ON'
      '      F.COD_CADASTRO_RESPONSAVEL = R.COD_CADASTRO'
      '    LEFT JOIN'
      '      TB_ESTADO E'
      '    ON'
      '      F.COD_ESTADO = E.COD_ESTADO'
      '    WHERE'
      '      F.COD_FILIAL = :FILIAL'
      '  ) T1'
      '  WHERE'
      '    (:TIPO IS NULL OR TIPO = :TIPO)'
      ''
      '  UNION'
      ''
      '  SELECT'
      '    T1.*,'
      '    '#39'ENTRADA'#39' AS TERMO'
      '  FROM'
      '  ('
      '    SELECT                /* TERMO DE ABERTURA ENTRADAS */'
      '      F.DESC_FILIAL,'
      '      F.DESC_ENDERECO,'
      '      F.DESC_BAIRRO,'
      '      F.DESC_CIDADE,'
      '      F.DESC_CEP,'
      '      F.NUM_CGC,'
      '      F.DESC_INSCRICAO,'
      '      E.DESC_ESTADO,'
      '      '#39'Contador: '#39' || C.NOME AS CONTABILISTA,'
      '      '#39'CPF: '#39' || C.NUM_CGC_CPF AS CPF_CONTABILISTA,'
      '      '#39'CRC: '#39' || C.DESC_CRC AS CRC_CONTABILISTA,'
      '      '#39'Respons'#225'vel: '#39' || R.NOME AS RESPONSAVEL,'
      '      '#39'CPF: '#39' || R.NUM_CGC_CPF AS CPF_RESPONSAVEL,'
      '      R.NUM_INSCRICAO AS CI_RESPONSAVEL,'
      '      '#39'Cargo: '#39' || R.DESC_FUNCAO AS FUNC_RESPONSAVEL,'
      '      '#39'REGISTRO DE ENTRADAS'#39' AS REGISTRO,'
      '      '#39'MODELO P1A'#39' AS MODELO,'
      '      '#39'N'#218'MERO DE ORDEM '#39' || :NUM_ORDEM AS NUM_ORDEM,'
      '      '#39#39' AS ULT_LANC,'
      '      '#39'TERMO DE ABERTURA'#39' AS TITULO,'
      '      TO_DATE(:DT_ABERTURA) AS DIA,'
      '      '#39'ABERTURA'#39' AS TIPO,'
      '      :PAGINA_I AS PAGINA,'
      '      TO_NUMBER(:PAGINA_I) AS PAGINA_I,'
      '      TO_NUMBER(:PAGINA_F) AS PAGINA_F,'
      '      :DT_ABERTURA_TERMO AS DT_TERMO'
      '    FROM'
      '      TB_FILIAL F'
      '    LEFT JOIN'
      '      TB_CADASTRO C'
      '    ON'
      '      F.COD_CADASTRO_CONTABILISTA = C.COD_CADASTRO'
      '    LEFT JOIN'
      '      TB_CADASTRO R'
      '    ON'
      '      F.COD_CADASTRO_RESPONSAVEL = R.COD_CADASTRO'
      '    LEFT JOIN'
      '      TB_ESTADO E'
      '    ON'
      '      F.COD_ESTADO = E.COD_ESTADO'
      '    WHERE'
      '      F.COD_FILIAL = :FILIAL'
      ''
      '    UNION'
      ''
      '    SELECT                /* TERMO DE ENCERRAMENTO ENTRADAS */'
      '      F.DESC_FILIAL,'
      '      F.DESC_ENDERECO,'
      '      F.DESC_BAIRRO,'
      '      F.DESC_CIDADE,'
      '      F.DESC_CEP,'
      '      F.NUM_CGC,'
      '      F.DESC_INSCRICAO,'
      '      E.DESC_ESTADO,'
      '      '#39'Contador: '#39' || C.NOME AS CONTABILISTA,'
      '      '#39'CPF: '#39' || C.NUM_CGC_CPF AS CPF_CONTABILISTA,'
      '      '#39'CRC: '#39' || C.DESC_CRC AS CRC_CONTABILISTA,'
      '      '#39'Respons'#225'vel: '#39' || R.NOME AS RESPONSAVEL,'
      '      '#39'CPF: '#39' || R.NUM_CGC_CPF AS CPF_RESPONSAVEL,'
      '      R.NUM_INSCRICAO AS CI_RESPONSAVEL,'
      '      '#39'Cargo: '#39' || R.DESC_FUNCAO AS FUNC_RESPONSAVEL,'
      '      '#39'REGISTRO DE ENTRADAS'#39' AS REGISTRO,'
      '      '#39'MODELO P1A'#39' AS MODELO,'
      '      '#39'N'#218'MERO DE ORDEM '#39' || :NUM_ORDEM AS NUM_ORDEM,'
      
        '      '#39#218'LTIMO LANCAMENTO EFETUADO EM '#39' || :DT_FECHAMENTO AS ULT_' +
        'LANC,'
      '      '#39'TERMO DE ENCERRAMENTO'#39' AS TITULO,'
      '      TO_DATE(:DT_FECHAMENTO) AS DIA,'
      '      '#39'ENCERRAMENTO'#39' AS TIPO,'
      '      :PAGINA_F AS PAGINA,'
      '      TO_NUMBER(:PAGINA_I) AS PAGINA_I,'
      '      TO_NUMBER(:PAGINA_F) AS PAGINA_F,'
      '      :DT_ENCERRAMENTO_TERMO AS DT_TERMO'
      '    FROM'
      '      TB_FILIAL F'
      '    LEFT JOIN'
      '      TB_CADASTRO C'
      '    ON'
      '      F.COD_CADASTRO_CONTABILISTA = C.COD_CADASTRO'
      '    LEFT JOIN'
      '      TB_CADASTRO R'
      '    ON'
      '      F.COD_CADASTRO_RESPONSAVEL = R.COD_CADASTRO'
      '    LEFT JOIN'
      '      TB_ESTADO E'
      '    ON'
      '      F.COD_ESTADO = E.COD_ESTADO'
      '    WHERE'
      '      F.COD_FILIAL = :FILIAL'
      '  ) T1'
      '  WHERE'
      '    (:TIPO IS NULL OR TIPO = :TIPO)'
      ''
      '  UNION'
      ''
      '  SELECT'
      '    T1.*,'
      '    '#39'SAIDA'#39' AS TERMO'
      '  FROM'
      '  ('
      '    SELECT                /* TERMO DE ABERTURA SAIDAS */'
      '      F.DESC_FILIAL,'
      '      F.DESC_ENDERECO,'
      '      F.DESC_BAIRRO,'
      '      F.DESC_CIDADE,'
      '      F.DESC_CEP,'
      '      F.NUM_CGC,'
      '      F.DESC_INSCRICAO,'
      '      E.DESC_ESTADO,'
      '      '#39'Contador: '#39' || C.NOME AS CONTABILISTA,'
      '      '#39'CPF: '#39' || C.NUM_CGC_CPF AS CPF_CONTABILISTA,'
      '      '#39'CRC: '#39' || C.DESC_CRC AS CRC_CONTABILISTA,'
      '      '#39'Respons'#225'vel: '#39' || R.NOME AS RESPONSAVEL,'
      '      '#39'CPF: '#39' || R.NUM_CGC_CPF AS CPF_RESPONSAVEL,'
      '      R.NUM_INSCRICAO AS CI_RESPONSAVEL,'
      '      '#39'Cargo: '#39' || R.DESC_FUNCAO AS FUNC_RESPONSAVEL,'
      '      '#39'REGISTRO DE SAIDAS'#39' AS REGISTRO,'
      '      '#39'MODELO P2A'#39' AS MODELO,'
      '      '#39'N'#218'MERO DE ORDEM '#39' || :NUM_ORDEM AS NUM_ORDEM,'
      '      '#39#39' AS ULT_LANC,'
      '      '#39'TERMO DE ABERTURA'#39' AS TITULO,'
      '      TO_DATE(:DT_ABERTURA) AS DIA,'
      '      '#39'ABERTURA'#39' AS TIPO,'
      '      :PAGINA_I AS PAGINA,'
      '      TO_NUMBER(:PAGINA_I) AS PAGINA_I,'
      '      TO_NUMBER(:PAGINA_F) AS PAGINA_F,'
      '      :DT_ABERTURA_TERMO AS DT_TERMO'
      '    FROM'
      '      TB_FILIAL F'
      '    LEFT JOIN'
      '      TB_CADASTRO C'
      '    ON'
      '      F.COD_CADASTRO_CONTABILISTA = C.COD_CADASTRO'
      '    LEFT JOIN'
      '      TB_CADASTRO R'
      '    ON'
      '      F.COD_CADASTRO_RESPONSAVEL = R.COD_CADASTRO'
      '    LEFT JOIN'
      '      TB_ESTADO E'
      '    ON'
      '      F.COD_ESTADO = E.COD_ESTADO'
      '    WHERE'
      '      F.COD_FILIAL = :FILIAL'
      ''
      '    UNION'
      ''
      '    SELECT                /* TERMO DE ENCERRAMENTO SAIDAS */'
      '      F.DESC_FILIAL,'
      '      F.DESC_ENDERECO,'
      '      F.DESC_BAIRRO,'
      '      F.DESC_CIDADE,'
      '      F.DESC_CEP,'
      '      F.NUM_CGC,'
      '      F.DESC_INSCRICAO,'
      '      E.DESC_ESTADO,'
      '      '#39'Contador: '#39' || C.NOME AS CONTABILISTA,'
      '      '#39'CPF: '#39' || '#39'CPF: '#39' || C.NUM_CGC_CPF AS CPF_CONTABILISTA,'
      '      '#39'CRC: '#39' || C.DESC_CRC AS CRC_CONTABILISTA,'
      '      '#39'Respons'#225'vel: '#39' || R.NOME AS RESPONSAVEL,'
      '      '#39'CPF: '#39' || R.NUM_CGC_CPF AS CPF_RESPONSAVEL,'
      '      R.NUM_INSCRICAO AS CI_RESPONSAVEL,'
      '      '#39'Cargo: '#39' || R.DESC_FUNCAO AS FUNC_RESPONSAVEL,'
      '      '#39'REGISTRO DE SA'#205'DAS'#39' AS REGISTRO,'
      '      '#39'MODELO P2A'#39' AS MODELO,'
      '      '#39'N'#218'MERO DE ORDEM '#39' || :NUM_ORDEM AS NUM_ORDEM,'
      
        '      '#39#218'LTIMO LANCAMENTO EFETUADO EM '#39' || :DT_FECHAMENTO AS ULT_' +
        'LANC,'
      '      '#39'TERMO DE ENCERRAMENTO'#39' AS TITULO,'
      '      TO_DATE(:DT_FECHAMENTO) AS DIA,'
      '      '#39'ENCERRAMENTO'#39' AS TIPO,'
      '      :PAGINA_F AS PAGINA,'
      '      TO_NUMBER(:PAGINA_I) AS PAGINA_I,'
      '      TO_NUMBER(:PAGINA_F) AS PAGINA_F,'
      '      :DT_ENCERRAMENTO_TERMO AS DT_TERMO'
      '    FROM'
      '      TB_FILIAL F'
      '    LEFT JOIN'
      '      TB_CADASTRO C'
      '    ON'
      '      F.COD_CADASTRO_CONTABILISTA = C.COD_CADASTRO'
      '    LEFT JOIN'
      '      TB_CADASTRO R'
      '    ON'
      '      F.COD_CADASTRO_RESPONSAVEL = R.COD_CADASTRO'
      '    LEFT JOIN'
      '      TB_ESTADO E'
      '    ON'
      '      F.COD_ESTADO = E.COD_ESTADO'
      '    WHERE'
      '      F.COD_FILIAL = :FILIAL'
      '  ) T1'
      '  WHERE'
      '    (:TIPO IS NULL OR TIPO = :TIPO)'
      ')'
      'WHERE'
      '  TERMO = :TERMO'
      'ORDER BY'
      '  TERMO,'
      '  TIPO')
    Variables.Data = {
      030000000A000000070000003A46494C49414C0300000000000000000000000C
      0000003A44545F41424552545552410C00000000000000000000000E0000003A
      44545F46454348414D454E544F0C0000000000000000000000050000003A5449
      504F050000000000000000000000090000003A504147494E415F490500000000
      00000000000000090000003A504147494E415F46050000000000000000000000
      060000003A5445524D4F0500000000000000000000000A0000003A4E554D5F4F
      5244454D050000000000000000000000120000003A44545F4142455254555241
      5F5445524D4F0C0000000000000000000000160000003A44545F454E43455252
      414D454E544F5F5445524D4F0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001B0000000B000000444553435F46494C49414C0100000000000D0000
      00444553435F454E44455245434F0100000000000B000000444553435F424149
      52524F0100000000000B000000444553435F4349444144450100000000000800
      0000444553435F434550010000000000070000004E554D5F4347430100000000
      000E000000444553435F494E5343524943414F0100000000000C000000434F4E
      544142494C49535441010000000000100000004350465F434F4E544142494C49
      535441010000000000100000004352435F434F4E544142494C49535441010000
      0000000B000000524553504F4E534156454C0100000000000F0000004350465F
      524553504F4E534156454C0100000000000E00000043495F524553504F4E5341
      56454C01000000000006000000544954554C4F01000000000003000000444941
      010000000000040000005449504F01000000000006000000504147494E410100
      000000001000000046554E435F524553504F4E534156454C0100000000000800
      0000524547495354524F010000000000060000004D4F44454C4F010000000000
      090000004E554D5F4F5244454D010000000000050000005445524D4F01000000
      000008000000554C545F4C414E430100000000000B000000444553435F455354
      41444F01000000000008000000504147494E415F490100000000000800000050
      4147494E415F460100000000000800000044545F5445524D4F010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QREmissaoTermoCalcFields
    Left = 56
    Top = 8
    object QREmissaoTermoDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QREmissaoTermoDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      Size = 30
    end
    object QREmissaoTermoDESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
      Size = 15
    end
    object QREmissaoTermoDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object QREmissaoTermoDESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 9
    end
    object QREmissaoTermoDESC_ESTADO: TStringField
      FieldName = 'DESC_ESTADO'
      Size = 30
    end
    object QREmissaoTermoNUM_CGC: TStringField
      FieldName = 'NUM_CGC'
      Size = 18
    end
    object QREmissaoTermoDESC_INSCRICAO: TStringField
      FieldName = 'DESC_INSCRICAO'
      Size = 12
    end
    object QREmissaoTermoCONTABILISTA: TStringField
      FieldName = 'CONTABILISTA'
      Size = 59
    end
    object QREmissaoTermoCPF_CONTABILISTA: TStringField
      FieldName = 'CPF_CONTABILISTA'
      Size = 28
    end
    object QREmissaoTermoCRC_CONTABILISTA: TStringField
      FieldName = 'CRC_CONTABILISTA'
      Size = 15
    end
    object QREmissaoTermoRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 63
    end
    object QREmissaoTermoCPF_RESPONSAVEL: TStringField
      FieldName = 'CPF_RESPONSAVEL'
      Size = 23
    end
    object QREmissaoTermoCI_RESPONSAVEL: TStringField
      FieldName = 'CI_RESPONSAVEL'
    end
    object QREmissaoTermoFUNC_RESPONSAVEL: TStringField
      FieldName = 'FUNC_RESPONSAVEL'
      Size = 37
    end
    object QREmissaoTermoREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Size = 28
    end
    object QREmissaoTermoMODELO: TStringField
      FieldName = 'MODELO'
      Size = 10
    end
    object QREmissaoTermoNUM_ORDEM: TStringField
      FieldName = 'NUM_ORDEM'
    end
    object QREmissaoTermoULT_LANC: TStringField
      FieldName = 'ULT_LANC'
      Size = 38
    end
    object QREmissaoTermoTITULO: TStringField
      FieldName = 'TITULO'
      Size = 21
    end
    object QREmissaoTermoDIA: TDateTimeField
      FieldName = 'DIA'
    end
    object QREmissaoTermoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 12
    end
    object QREmissaoTermoPAGINA: TStringField
      FieldName = 'PAGINA'
      Size = 4000
    end
    object QREmissaoTermoTERMO: TStringField
      FieldName = 'TERMO'
      Size = 13
    end
    object QREmissaoTermoPAGINA_I: TFloatField
      FieldName = 'PAGINA_I'
    end
    object QREmissaoTermoPAGINA_F: TFloatField
      FieldName = 'PAGINA_F'
    end
    object QREmissaoTermolocal: TStringField
      FieldKind = fkCalculated
      FieldName = 'local'
      Size = 50
      Calculated = True
    end
    object QREmissaoTermopag: TStringField
      FieldKind = fkCalculated
      FieldName = 'pag'
      Size = 30
      Calculated = True
    end
    object QREmissaoTermotexto: TStringField
      FieldKind = fkCalculated
      FieldName = 'texto'
      Size = 500
      Calculated = True
    end
    object QREmissaoTermoDT_TERMO: TDateTimeField
      FieldName = 'DT_TERMO'
    end
  end
end
