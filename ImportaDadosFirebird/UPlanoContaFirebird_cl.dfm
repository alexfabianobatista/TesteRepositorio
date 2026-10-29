object DMPlanoContasFirebird: TDMPlanoContasFirebird
  OldCreateOrder = False
  Left = 567
  Top = 276
  Height = 317
  Width = 310
  object ZQPlanoContaRefRetifoz: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  PLANOREFERENCIAL.ORDEM AS COD_PLANO_CONTA_REFERENCIAL,'
      '  PLANOREFERENCIAL.NOME AS DESC_PLANO_CONTA_REFERENCIAL,'
      '  PLANOREFERENCIAL.CLASSIFICACAO AS NUM_PLANO_CONTA_REFERENCIAL'
      'FROM'
      '  CAD_PLANOCONTAS_REFERENCIAL PLANOREFERENCIAL')
    Params = <>
    Left = 72
    Top = 32
    object ZQPlanoContaRefRetifozCOD_PLANO_CONTA_REFERENCIAL: TIntegerField
      FieldName = 'COD_PLANO_CONTA_REFERENCIAL'
    end
    object ZQPlanoContaRefRetifozDESC_PLANO_CONTA_REFERENCIAL: TStringField
      FieldName = 'DESC_PLANO_CONTA_REFERENCIAL'
      Size = 500
    end
    object ZQPlanoContaRefRetifozNUM_PLANO_CONTA_REFERENCIAL: TStringField
      FieldName = 'NUM_PLANO_CONTA_REFERENCIAL'
      Required = True
      Size = 40
    end
  end
  object ZQPlanoContaRetifoz: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  CONTA.CODIGO AS COD_PLANO_CONTA,'
      '  CONTA.NOME AS DESC_PLANO_CONTA,'
      '  1 AS COD_FILIAL,'
      
        '  --REPLACE(REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FROM 1 FOR 9),' +
        #39'.'#39','#39'0'#39'), '#39'00'#39','#39'0'#39') || REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FRO' +
        'M 10 FOR 4), '#39'.0'#39', '#39#39') || REPLACE(SUBSTRING(CONTA.CLASSIFICACAO ' +
        'FROM 14 FOR 4), '#39'.'#39', '#39'000'#39') AS NUM_PLANO_CONTA,'
      
        '  --REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FROM 10 FOR 4), '#39'.0'#39', ' +
        #39#39') AS BAGACA,'
      
        '  --REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FROM 14 FOR 4), '#39'.'#39', '#39 +
        '000'#39') AS BAGACA,'
      '  CASE char_length(CONTA.CLASSIFICACAO)'
      
        '  WHEN 16 THEN REPLACE(REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FRO' +
        'M 1 FOR 9),'#39'.'#39','#39'0'#39'), '#39'00'#39','#39'0'#39') || REPLACE(SUBSTRING(CONTA.CLASSI' +
        'FICACAO FROM 10 FOR 4), '#39'.0'#39', '#39#39') || REPLACE(SUBSTRING(CONTA.CLA' +
        'SSIFICACAO FROM 14 FOR 4), '#39'.'#39', '#39'0000'#39')'
      
        '  WHEN 17 THEN REPLACE(REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FRO' +
        'M 1 FOR 9),'#39'.'#39','#39'0'#39'), '#39'00'#39','#39'0'#39') || REPLACE(SUBSTRING(CONTA.CLASSI' +
        'FICACAO FROM 10 FOR 4), '#39'.0'#39', '#39#39') || REPLACE(SUBSTRING(CONTA.CLA' +
        'SSIFICACAO FROM 14 FOR 4), '#39'.'#39', '#39'000'#39')'
      
        '  ELSE REPLACE(REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FROM 1 FOR ' +
        '9),'#39'.'#39','#39'0'#39'), '#39'00'#39','#39'0'#39') || REPLACE(SUBSTRING(CONTA.CLASSIFICACAO ' +
        'FROM 10 FOR 4), '#39'.0'#39', '#39#39') || REPLACE(SUBSTRING(CONTA.CLASSIFICAC' +
        'AO FROM 14 FOR 4), '#39'.'#39', '#39'000'#39')'
      '  END AS NUM_PLANO_CONTA,'
      '  CONTA.CLASSIFICACAO AS NUM_GRAU,'
      '  CONTA.TIPO,'
      '  CONTA.ECD_COD_NAT AS DESC_NATUREZA_CONTA,'
      '  '#39'SIM'#39' AS IND_LIBERADO_USO,'
      '  CONTAREFERENCIAL.CLASS_REFERENCIAL AS CONTAREFERENCIAL'
      'FROM CAD_PLANOCONTAS CONTA'
      'LEFT JOIN REL_PLANOCONTAS_REFERENCIAL CONTAREFERENCIAL ON'
      '        (CONTAREFERENCIAL.EMPRESA = CONTA.EMPRESA AND'
      '        CONTAREFERENCIAL.PLANOCONTA = CONTA.CODIGO)'
      'WHERE CONTA.CODIGO >= 50000'
      'ORDER BY CONTA.CODIGO'
      '')
    Params = <>
    Left = 72
    Top = 96
    object ZQPlanoContaRetifozCOD_PLANO_CONTA: TIntegerField
      FieldName = 'COD_PLANO_CONTA'
      Required = True
    end
    object ZQPlanoContaRetifozDESC_PLANO_CONTA: TStringField
      FieldName = 'DESC_PLANO_CONTA'
      Required = True
      Size = 50
    end
    object ZQPlanoContaRetifozCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      ReadOnly = True
    end
    object ZQPlanoContaRetifozNUM_PLANO_CONTA: TStringField
      FieldName = 'NUM_PLANO_CONTA'
      Required = True
      Size = 40
    end
    object ZQPlanoContaRetifozTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 1
    end
    object ZQPlanoContaRetifozDESC_NATUREZA_CONTA: TStringField
      FieldName = 'DESC_NATUREZA_CONTA'
      Size = 2
    end
    object ZQPlanoContaRetifozIND_LIBERADO_USO: TStringField
      FieldName = 'IND_LIBERADO_USO'
      ReadOnly = True
      Size = 3
    end
    object ZQPlanoContaRetifozCONTAREFERENCIAL: TStringField
      FieldName = 'CONTAREFERENCIAL'
      Required = True
      Size = 40
    end
    object ZQPlanoContaRetifozNUM_GRAU: TStringField
      FieldName = 'NUM_GRAU'
      Required = True
      Size = 40
    end
  end
  object ZQPlanoContaCli: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  CLIENTE.codigo AS COD_CADASTRO,'
      '  CLIENTE.nome AS NOME_CADASTRO,'
      '  CONTA.CODIGO AS COD_REDUZIDO,'
      '  CONTA.NOME AS DESC_PLANO_CONTA,'
      '  1 AS COD_FILIAL,'
      
        '  --REPLACE(REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FROM 1 FOR 9),' +
        #39'.'#39','#39'0'#39'), '#39'00'#39','#39'0'#39') || REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FRO' +
        'M 10 FOR 4), '#39'.0'#39', '#39#39') || REPLACE(SUBSTRING(CONTA.CLASSIFICACAO ' +
        'FROM 14 FOR 4), '#39'.'#39', '#39'000'#39') AS NUM_PLANO_CONTA,'
      
        '  --REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FROM 10 FOR 4), '#39'.0'#39', ' +
        #39#39') AS BAGACA,'
      
        '  --REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FROM 14 FOR 4), '#39'.'#39', '#39 +
        '000'#39') AS BAGACA,'
      '  CASE char_length(CONTA.CLASSIFICACAO)'
      
        '  WHEN 16 THEN REPLACE(REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FRO' +
        'M 1 FOR 9),'#39'.'#39','#39'0'#39'), '#39'00'#39','#39'0'#39') --|| REPLACE(SUBSTRING(CONTA.CLAS' +
        'SIFICACAO FROM 10 FOR 4), '#39'.0'#39', '#39#39') || REPLACE(SUBSTRING(CONTA.C' +
        'LASSIFICACAO FROM 14 FOR 4), '#39'.'#39', '#39'0000'#39')'
      
        '  WHEN 17 THEN REPLACE(REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FRO' +
        'M 1 FOR 9),'#39'.'#39','#39'0'#39'), '#39'00'#39','#39'0'#39') --|| REPLACE(SUBSTRING(CONTA.CLAS' +
        'SIFICACAO FROM 10 FOR 4), '#39'.0'#39', '#39#39') || REPLACE(SUBSTRING(CONTA.C' +
        'LASSIFICACAO FROM 14 FOR 4), '#39'.'#39', '#39'000'#39')'
      
        '  ELSE REPLACE(REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FROM 1 FOR ' +
        '9),'#39'.'#39','#39'0'#39'), '#39'00'#39','#39'0'#39') --|| REPLACE(SUBSTRING(CONTA.CLASSIFICACA' +
        'O FROM 10 FOR 4), '#39'.0'#39', '#39#39') || REPLACE(SUBSTRING(CONTA.CLASSIFIC' +
        'ACAO FROM 14 FOR 4), '#39'.'#39', '#39'000'#39')'
      '  END AS NUM_PLANO_CONTA,'
      '  CONTA.CLASSIFICACAO AS NUM_GRAU,'
      '  CONTA.TIPO,'
      '  CONTA.ECD_COD_NAT AS DESC_NATUREZA_CONTA,'
      '  '#39'SIM'#39' AS IND_LIBERADO_USO'
      'FROM CAD_PLANOCONTAS CONTA'
      
        'INNER JOIN cad_terceiros CLIENTE on (CONTA.EMPRESA = CLIENTE.EMP' +
        'RESA AND'
      '         CONTA.codigo = CLIENTE.cont_cli) --CLIENTE.CONT_FOR)'
      
        'WHERE SUBSTRING(conta.classificacao FROM 1 FOR 9) = '#39'1.1.02.01'#39' ' +
        '--'#39'2.1.01.01'#39
      'ORDER BY CONTA.CODIGO')
    Params = <>
    Left = 32
    Top = 168
    object ZQPlanoContaCliCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object ZQPlanoContaCliNOME_CADASTRO: TStringField
      FieldName = 'NOME_CADASTRO'
      Required = True
      Size = 50
    end
    object ZQPlanoContaCliCOD_REDUZIDO: TIntegerField
      FieldName = 'COD_REDUZIDO'
      Required = True
    end
    object ZQPlanoContaCliDESC_PLANO_CONTA: TStringField
      FieldName = 'DESC_PLANO_CONTA'
      Required = True
      Size = 50
    end
    object ZQPlanoContaCliCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      ReadOnly = True
    end
    object ZQPlanoContaCliNUM_PLANO_CONTA: TStringField
      FieldName = 'NUM_PLANO_CONTA'
      ReadOnly = True
      Size = 40
    end
    object ZQPlanoContaCliNUM_GRAU: TStringField
      FieldName = 'NUM_GRAU'
      Required = True
      Size = 40
    end
    object ZQPlanoContaCliTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 1
    end
    object ZQPlanoContaCliDESC_NATUREZA_CONTA: TStringField
      FieldName = 'DESC_NATUREZA_CONTA'
      Size = 2
    end
    object ZQPlanoContaCliIND_LIBERADO_USO: TStringField
      FieldName = 'IND_LIBERADO_USO'
      ReadOnly = True
      Size = 3
    end
  end
  object ZQPlanoContaFor: TZQuery
    Connection = DMFirebird.ZConnection1
    SQL.Strings = (
      'SELECT'
      '  CLIENTE.codigo AS COD_CADASTRO,'
      '  CLIENTE.nome AS NOME_CADASTRO,'
      '  CONTA.CODIGO AS COD_REDUZIDO,'
      '  CONTA.NOME AS DESC_PLANO_CONTA,'
      '  1 AS COD_FILIAL,'
      
        '  --REPLACE(REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FROM 1 FOR 9),' +
        #39'.'#39','#39'0'#39'), '#39'00'#39','#39'0'#39') || REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FRO' +
        'M 10 FOR 4), '#39'.0'#39', '#39#39') || REPLACE(SUBSTRING(CONTA.CLASSIFICACAO ' +
        'FROM 14 FOR 4), '#39'.'#39', '#39'000'#39') AS NUM_PLANO_CONTA,'
      
        '  --REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FROM 10 FOR 4), '#39'.0'#39', ' +
        #39#39') AS BAGACA,'
      
        '  --REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FROM 14 FOR 4), '#39'.'#39', '#39 +
        '000'#39') AS BAGACA,'
      '  CASE char_length(CONTA.CLASSIFICACAO)'
      
        '  WHEN 16 THEN REPLACE(REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FRO' +
        'M 1 FOR 9),'#39'.'#39','#39'0'#39'), '#39'00'#39','#39'0'#39') --|| REPLACE(SUBSTRING(CONTA.CLAS' +
        'SIFICACAO FROM 10 FOR 4), '#39'.0'#39', '#39#39') || REPLACE(SUBSTRING(CONTA.C' +
        'LASSIFICACAO FROM 14 FOR 4), '#39'.'#39', '#39'0000'#39')'
      
        '  WHEN 17 THEN REPLACE(REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FRO' +
        'M 1 FOR 9),'#39'.'#39','#39'0'#39'), '#39'00'#39','#39'0'#39') --|| REPLACE(SUBSTRING(CONTA.CLAS' +
        'SIFICACAO FROM 10 FOR 4), '#39'.0'#39', '#39#39') || REPLACE(SUBSTRING(CONTA.C' +
        'LASSIFICACAO FROM 14 FOR 4), '#39'.'#39', '#39'000'#39')'
      
        '  ELSE REPLACE(REPLACE(SUBSTRING(CONTA.CLASSIFICACAO FROM 1 FOR ' +
        '9),'#39'.'#39','#39'0'#39'), '#39'00'#39','#39'0'#39') --|| REPLACE(SUBSTRING(CONTA.CLASSIFICACA' +
        'O FROM 10 FOR 4), '#39'.0'#39', '#39#39') || REPLACE(SUBSTRING(CONTA.CLASSIFIC' +
        'ACAO FROM 14 FOR 4), '#39'.'#39', '#39'000'#39')'
      '  END AS NUM_PLANO_CONTA,'
      '  CONTA.CLASSIFICACAO AS NUM_GRAU,'
      '  CONTA.TIPO,'
      '  CONTA.ECD_COD_NAT AS DESC_NATUREZA_CONTA,'
      '  '#39'SIM'#39' AS IND_LIBERADO_USO'
      'FROM CAD_PLANOCONTAS CONTA'
      
        'INNER JOIN cad_terceiros CLIENTE on (CONTA.EMPRESA = CLIENTE.EMP' +
        'RESA AND'
      '         CONTA.codigo = CLIENTE.CONT_FOR)'
      'WHERE SUBSTRING(conta.classificacao FROM 1 FOR 9) = '#39'2.1.01.01'#39
      'ORDER BY CONTA.CODIGO')
    Params = <>
    Left = 32
    Top = 224
    object ZQPlanoContaForCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object ZQPlanoContaForNOME_CADASTRO: TStringField
      FieldName = 'NOME_CADASTRO'
      Required = True
      Size = 50
    end
    object ZQPlanoContaForCOD_REDUZIDO: TIntegerField
      FieldName = 'COD_REDUZIDO'
      Required = True
    end
    object ZQPlanoContaForDESC_PLANO_CONTA: TStringField
      FieldName = 'DESC_PLANO_CONTA'
      Required = True
      Size = 50
    end
    object ZQPlanoContaForCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      ReadOnly = True
    end
    object ZQPlanoContaForNUM_PLANO_CONTA: TStringField
      FieldName = 'NUM_PLANO_CONTA'
      ReadOnly = True
      Size = 40
    end
    object ZQPlanoContaForNUM_GRAU: TStringField
      FieldName = 'NUM_GRAU'
      Required = True
      Size = 40
    end
    object ZQPlanoContaForTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 1
    end
    object ZQPlanoContaForDESC_NATUREZA_CONTA: TStringField
      FieldName = 'DESC_NATUREZA_CONTA'
      Size = 2
    end
    object ZQPlanoContaForIND_LIBERADO_USO: TStringField
      FieldName = 'IND_LIBERADO_USO'
      ReadOnly = True
      Size = 3
    end
  end
end
