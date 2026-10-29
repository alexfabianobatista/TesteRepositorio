object DMTermoAbertura: TDMTermoAbertura
  OldCreateOrder = False
  Left = 419
  Top = 207
  Height = 185
  Width = 461
  object QTermoAbertura: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_TERMO_ABERTURA.*'
      'FROM'
      '  TB_TERMO_ABERTURA'
      'WHERE'
      '  COD_TERMO_ABERTURA = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_TERMO_ABERTURA'
    SequenceField.Sequence = 'SQ_TERMO_ABERTURA'
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      04000000050000000A000000434F445F46494C49414C01000000000012000000
      434F445F5445524D4F5F4142455254555241010000000000090000004E554D5F
      4F5244454D0100000000000E000000444553435F4E41545F4C4956524F010000
      0000000A00000044545F494E494349414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 16
    object QTermoAberturaCOD_TERMO_ABERTURA: TIntegerField
      FieldName = 'COD_TERMO_ABERTURA'
      Required = True
    end
    object QTermoAberturaCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QTermoAberturaNUM_ORDEM: TFloatField
      FieldName = 'NUM_ORDEM'
      Required = True
    end
    object QTermoAberturaDESC_NAT_LIVRO: TStringField
      FieldName = 'DESC_NAT_LIVRO'
      Required = True
      Size = 80
    end
    object QTermoAberturaDT_INICIAL: TDateTimeField
      FieldName = 'DT_INICIAL'
      Required = True
      EditMask = '!99/99/##00;1;_'
    end
  end
  object QTermoAberturaCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM '
      '  TB_TERMO_ABERTURA'
      'WHERE'
      '  DESC_NAT_LIVRO >= :DESC_NAT_LIVRO'
      'ORDER BY'
      '  DESC_NAT_LIVRO')
    Variables.Data = {
      03000000010000000F0000003A444553435F4E41545F4C4956524F0500000000
      00000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000A000000434F445F46494C49414C01000000000012000000
      434F445F5445524D4F5F4142455254555241010000000000090000004E554D5F
      4F5244454D0100000000000E000000444553435F4E41545F4C4956524F010000
      0000000A00000044545F494E494349414C010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 64
    object QTermoAberturaConsCOD_TERMO_ABERTURA: TIntegerField
      FieldName = 'COD_TERMO_ABERTURA'
      Required = True
    end
    object QTermoAberturaConsCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QTermoAberturaConsNUM_ORDEM: TFloatField
      FieldName = 'NUM_ORDEM'
      Required = True
    end
    object QTermoAberturaConsDESC_NAT_LIVRO: TStringField
      FieldName = 'DESC_NAT_LIVRO'
      Required = True
      Size = 80
    end
    object QTermoAberturaConsDT_INICIAL: TDateTimeField
      FieldName = 'DT_INICIAL'
      Required = True
      EditMask = '!99/99/##00;1;_'
    end
  end
  object QRTermo: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '('
      '  SELECT'
      '    T1.*,'
      '    '#39'DIARIO'#39' AS DIARIO_RAZAO'
      '  FROM'
      '  ('
      '    SELECT                /* TERMO DE ABERTURA DIARIO */'
      '      F.DESC_FILIAL,'
      '      F.DESC_ENDERECO,'
      '      F.DESC_BAIRRO,'
      '      F.DESC_CIDADE,'
      '      F.DESC_CEP,'
      '      F.NUM_CGC,'
      '      F.DESC_INSCRICAO,'
      '      C.NOME AS CONTABILISTA,'
      '      C.NUM_CGC_CPF AS CPF_CONTABILISTA,'
      '      C.DESC_CRC AS CRC_CONTABILISTA,'
      '      R.NOME AS RESPONSAVEL,'
      '      R.NUM_CGC_CPF AS CPF_RESPONSAVEL,'
      '      R.NUM_INSCRICAO AS CI_RESPONSAVEL,'
      '      R.DESC_FUNCAO AS FUNC_RESPONSAVEL,'
      '      '#39'TERMO DE ABERTURA'#39' AS TITULO,'
      '      TO_DATE(:DT_ABERTURA) AS DIA,'
      '      '#39'ABERTURA'#39' AS TIPO,'
      '      :PAGINA_I AS PAGINA,'
      '      '#39'Contem esta encadernacao de formularios continuos, '#39' ||'
      
        '          TO_CHAR(1 + TO_NUMBER(:PAGINA_F) - TO_NUMBER(:PAGINA_I' +
        ')) ||'
      
        '          '#39' folhas numeradas seguidamente pelo processo eletroni' +
        'co de dados totalmente escrituradas, de '#39' ||'
      '          :PAGINA_I || '#39' a '#39' || :PAGINA_F ||'
      
        '          '#39' e que servira de Livro Diario de numero '#39' || :NUM_OR' +
        'DEM || '#39' na forma do paragrafo 1o. (primeiro), artigo 5o.'#39' ||'
      
        '          '#39' (quinto) do decreto lei numero 486/69, em substituic' +
        'ao ao Livro Diario copiativo, onde'#39' ||'
      
        '          '#39' estao registradas todas as operacoes realizadas pela' +
        ' empresa abaixo qualificada.'#39' AS TEXTO'
      '    FROM'
      '      TB_FILIAL F'
      '    INNER JOIN'
      '      TB_CADASTRO C'
      '    ON'
      '      F.COD_CADASTRO_CONTABILISTA = C.COD_CADASTRO'
      '    INNER JOIN'
      '      TB_CADASTRO R'
      '    ON'
      '      F.COD_CADASTRO_RESPONSAVEL = R.COD_CADASTRO'
      '    WHERE'
      '      F.COD_FILIAL = :FILIAL'
      ''
      '    UNION'
      ''
      '    SELECT                /* TERMO DE ENCERRAMENTO DIARIO */'
      '      F.DESC_FILIAL,'
      '      F.DESC_ENDERECO,'
      '      F.DESC_BAIRRO,'
      '      F.DESC_CIDADE,'
      '      F.DESC_CEP,'
      '      F.NUM_CGC,'
      '      F.DESC_INSCRICAO,'
      '      C.NOME AS CONTABILISTA,'
      '      C.NUM_CGC_CPF AS CPF_CONTABILISTA,'
      '      C.DESC_CRC AS CRC_CONTABILISTA,'
      '      R.NOME AS RESPONSAVEL,'
      '      R.NUM_CGC_CPF AS CPF_RESPONSAVEL,'
      '      R.NUM_INSCRICAO AS CI_RESPONSAVEL,'
      '      R.DESC_FUNCAO AS FUNC_RESPONSAVEL,'
      '      '#39'TERMO DE FECHAMENTO'#39' AS TITULO,'
      '      TO_DATE(:DT_FECHAMENTO) AS DIA,'
      '      '#39'FECHAMENTO'#39' AS TIPO,'
      '      :PAGINA_F AS PAGINA,'
      '      '#39'Contem esta encadernacao de formularios continuos, '#39' ||'
      
        '          TO_CHAR(1 + TO_NUMBER(:PAGINA_F) - TO_NUMBER(:PAGINA_I' +
        ')) ||'
      
        '          '#39' folhas numeradas seguidamente pelo processo eletroni' +
        'co de dados totalmente escrituradas, de '#39' ||'
      '          :PAGINA_I || '#39' a '#39' || :PAGINA_F ||'
      
        '          '#39' e que serviu de Livro Diario de numero '#39' || :NUM_ORD' +
        'EM || '#39' na forma do paragrafo 1o. (primeiro), artigo 5o.'#39' ||'
      
        '          '#39' (quinto) do decreto lei numero 486/69, em substituic' +
        'ao ao Livro Diario copiativo, onde'#39' ||'
      
        '          '#39' estao registradas todas as operacoes realizadas pela' +
        ' empresa abaixo qualificada.'#39' AS TEXTO'
      '    FROM'
      '      TB_FILIAL F'
      '    INNER JOIN'
      '      TB_CADASTRO C'
      '    ON'
      '      F.COD_CADASTRO_CONTABILISTA = C.COD_CADASTRO'
      '    INNER JOIN'
      '      TB_CADASTRO R'
      '    ON'
      '      F.COD_CADASTRO_RESPONSAVEL = R.COD_CADASTRO'
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
      '    '#39'RAZAO'#39' AS DIARIO_RAZAO'
      '  FROM'
      '  ('
      '    SELECT               /* TERMO DE ABERTURA RAZAO */'
      '      F.DESC_FILIAL,'
      '      F.DESC_ENDERECO,'
      '      F.DESC_BAIRRO,'
      '      F.DESC_CIDADE,'
      '      F.DESC_CEP,'
      '      F.NUM_CGC,'
      '      F.DESC_INSCRICAO,'
      '      C.NOME AS CONTABILISTA,'
      '      C.NUM_CGC_CPF AS CPF_CONTABILISTA,'
      '      C.DESC_CRC AS CRC_CONTABILISTA,'
      '      R.NOME AS RESPONSAVEL,'
      '      R.NUM_CGC_CPF AS CPF_RESPONSAVEL,'
      '      R.NUM_INSCRICAO AS CI_RESPONSAVEL,'
      '      R.DESC_FUNCAO AS FUNC_RESPONSAVEL,'
      '      '#39'TERMO DE ABERTURA'#39' AS TITULO,'
      '      TO_DATE(:DT_ABERTURA) AS DIA,'
      '      '#39'ABERTURA'#39' AS TIPO,'
      '      :PAGINA_I AS PAGINA,'
      '      '#39'Contem esta encadernacao de formularios continuos, '#39' ||'
      
        '          TO_CHAR(1 + TO_NUMBER(:PAGINA_F) - TO_NUMBER(:PAGINA_I' +
        ')) ||'
      
        '          '#39' folhas numeradas seguidamente pelo processo eletroni' +
        'co de dados totalmente escrituradas, de '#39' ||'
      '          :PAGINA_I || '#39' a '#39' || :PAGINA_F ||'
      
        '          '#39' e que servira de Livro Diario de numero '#39' || :NUM_OR' +
        'DEM || '#39' na forma dos artigos 9o. (nono) ao 11o (decimo'#39' ||'
      
        '          '#39' primeiro) da Instrucao Normativa numero 102/06, em s' +
        'ubstituicao ao Livro Diario copiativo, onde'#39' ||'
      
        '          '#39' estao registradas todas as operacoes realizadas pela' +
        ' empresa abaixo qualificada.'#39' AS TEXTO'
      '    FROM'
      '      TB_FILIAL F'
      '    INNER JOIN'
      '      TB_CADASTRO C'
      '    ON'
      '      F.COD_CADASTRO_CONTABILISTA = C.COD_CADASTRO'
      '    INNER JOIN'
      '      TB_CADASTRO R'
      '    ON'
      '      F.COD_CADASTRO_RESPONSAVEL = R.COD_CADASTRO'
      '    WHERE'
      '      F.COD_FILIAL = :FILIAL'
      ''
      '    UNION'
      ''
      
        '    SELECT                      /* TERMO DE ENCERRAMENTO RAZAO *' +
        '/'
      '      F.DESC_FILIAL,'
      '      F.DESC_ENDERECO,'
      '      F.DESC_BAIRRO,'
      '      F.DESC_CIDADE,'
      '      F.DESC_CEP,'
      '      F.NUM_CGC,'
      '      F.DESC_INSCRICAO,'
      '      C.NOME AS CONTABILISTA,'
      '      C.NUM_CGC_CPF AS CPF_CONTABILISTA,'
      '      C.DESC_CRC AS CRC_CONTABILISTA,'
      '      R.NOME AS RESPONSAVEL,'
      '      R.NUM_CGC_CPF AS CPF_RESPONSAVEL,'
      '      R.NUM_INSCRICAO AS CI_RESPONSAVEL,'
      '      R.DESC_FUNCAO AS FUNC_RESPONSAVEL,'
      '      '#39'TERMO DE FECHAMENTO'#39' AS TITULO,'
      '      TO_DATE(:DT_FECHAMENTO) AS DIA,'
      '      '#39'FECHAMENTO'#39' AS TIPO,'
      '      :PAGINA_F AS PAGINA,'
      '      '#39'Contem esta encadernacao de formularios continuos, '#39' ||'
      
        '          TO_CHAR(1 + TO_NUMBER(:PAGINA_F) - TO_NUMBER(:PAGINA_I' +
        ')) ||'
      
        '          '#39' folhas numeradas seguidamente pelo processo eletroni' +
        'co de dados totalmente escrituradas, de '#39' ||'
      '          :PAGINA_I || '#39' a '#39' || :PAGINA_F ||'
      
        '          '#39' e que serviu de Livro Diario de numero '#39' || :NUM_ORD' +
        'EM || '#39' na forma dos artigos 9o. (nono) ao 11o (decimo'#39' ||'
      
        '          '#39' primeiro) da Instrucao Normativa numero 102/06, em s' +
        'ubstituicao ao Livro Diario copiativo, onde'#39' ||'
      
        '          '#39' estao registradas todas as operacoes realizadas pela' +
        ' empresa abaixo qualificada.'#39' AS TEXTO'
      '    FROM'
      '      TB_FILIAL F'
      '    INNER JOIN'
      '      TB_CADASTRO C'
      '    ON'
      '      F.COD_CADASTRO_CONTABILISTA = C.COD_CADASTRO'
      '    INNER JOIN'
      '      TB_CADASTRO R'
      '    ON'
      '      F.COD_CADASTRO_RESPONSAVEL = R.COD_CADASTRO'
      '    WHERE'
      '      F.COD_FILIAL = :FILIAL'
      '  ) T1'
      '  WHERE'
      '    (:TIPO IS NULL OR TIPO = :TIPO)'
      ')'
      'WHERE'
      '  DIARIO_RAZAO = :DIARIO_RAZAO'
      '')
    Variables.Data = {
      0300000008000000070000003A46494C49414C0300000000000000000000000C
      0000003A44545F41424552545552410C00000000000000000000000E0000003A
      44545F46454348414D454E544F0C0000000000000000000000050000003A5449
      504F050000000000000000000000090000003A504147494E415F490500000000
      00000000000000090000003A504147494E415F46050000000000000000000000
      0D0000003A44494152494F5F52415A414F0500000000000000000000000A0000
      003A4E554D5F4F5244454D050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000140000000B000000444553435F46494C49414C0100000000000D0000
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
      0000000005000000544558544F0100000000000C00000044494152494F5F5241
      5A414F0100000000001000000046554E435F524553504F4E534156454C010000
      000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRTermoCalcFields
    Left = 184
    Top = 16
    object QRTermoDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRTermoDESC_ENDERECO: TStringField
      FieldName = 'DESC_ENDERECO'
      Size = 30
    end
    object QRTermoDESC_BAIRRO: TStringField
      FieldName = 'DESC_BAIRRO'
      Size = 15
    end
    object QRTermoDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 30
    end
    object QRTermoDESC_CEP: TStringField
      FieldName = 'DESC_CEP'
      Size = 9
    end
    object QRTermoNUM_CGC: TStringField
      FieldName = 'NUM_CGC'
      Size = 18
    end
    object QRTermoDESC_INSCRICAO: TStringField
      FieldName = 'DESC_INSCRICAO'
      Size = 12
    end
    object QRTermoCONTABILISTA: TStringField
      FieldName = 'CONTABILISTA'
      Required = True
      Size = 50
    end
    object QRTermoCPF_CONTABILISTA: TStringField
      FieldName = 'CPF_CONTABILISTA'
      Size = 18
    end
    object QRTermoCRC_CONTABILISTA: TStringField
      FieldName = 'CRC_CONTABILISTA'
      Size = 15
    end
    object QRTermoRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Required = True
      Size = 50
    end
    object QRTermoCPF_RESPONSAVEL: TStringField
      FieldName = 'CPF_RESPONSAVEL'
      Size = 18
    end
    object QRTermoCI_RESPONSAVEL: TStringField
      FieldName = 'CI_RESPONSAVEL'
      Size = 1
    end
    object QRTermoTITULO: TStringField
      FieldName = 'TITULO'
      Size = 19
    end
    object QRTermoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 10
    end
    object QRTermoDIA: TDateTimeField
      FieldName = 'DIA'
    end
    object QRTermoPAGINA: TStringField
      FieldName = 'PAGINA'
      Size = 4000
    end
    object QRTermolocal: TStringField
      FieldKind = fkCalculated
      FieldName = 'local'
      Size = 50
      Calculated = True
    end
    object QRTermopag: TStringField
      FieldKind = fkCalculated
      FieldName = 'pag'
      Calculated = True
    end
    object QRTermoDIARIO_RAZAO: TStringField
      FieldName = 'DIARIO_RAZAO'
      Size = 6
    end
    object QRTermoTEXTO: TStringField
      FieldName = 'TEXTO'
      Size = 4000
    end
    object QRTermoFUNC_RESPONSAVEL: TStringField
      FieldName = 'FUNC_RESPONSAVEL'
      Size = 30
    end
  end
end
