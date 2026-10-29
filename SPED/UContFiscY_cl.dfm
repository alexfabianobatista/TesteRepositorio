object DMContFiscY: TDMContFiscY
  OldCreateOrder = False
  Left = 414
  Top = 283
  Height = 150
  Width = 273
  object QReg600: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '    COD_CADASTRO,    '
      '    DT_CADASTRO AS DT_ALT_SOC,'
      '    '#39#39' AS DT_FIM_SOC,'
      '    SUBSTR(TB_PAIS.COD_PAIS_IBGE, 0, 3) AS PAIS,'
      '    TB_QUALIFICACAO_SOCIO.IND_TIPO AS IND_QUALIF,'
      '    LIMPA_CNPJ(NUM_CGC_CPF) AS CPF_CNPJ,'
      '    NOME AS NOME_EMP,'
      '    TB_QUALIFICACAO_SOCIO.COD_QUALIFICACAO_SOCIO AS QUALIF,'
      '    PERC_CAP_TOT,'
      '    PERC_CAP_VOT,'
      '    '#39#39' AS CPF_REP_LEG,'
      '    '#39#39' AS QUALIF_REP_LEG,'
      '    '#39#39' AS VL_REM_TRAB,'
      '    '#39#39' AS VL_LUC_DIV,'
      '    '#39#39' AS VL_JUR_CAP,'
      '    '#39#39' AS VL_DEM_REND,'
      '    '#39#39' AS VL_IR_RET'
      'FROM'
      '    TB_CADASTRO'
      
        '        INNER JOIN TB_PAIS ON TB_CADASTRO.COD_PAIS = TB_PAIS.COD' +
        '_PAIS'
      
        '        INNER JOIN TB_QUALIFICACAO_SOCIO ON TB_CADASTRO.COD_QUAL' +
        'IFICACAO_SOCIO = TB_QUALIFICACAO_SOCIO.COD_QUALIFICACAO_SOCIO'
      'WHERE'
      '    COD_QUALIFICACAO_SOCIO IS NOT NULL')
    QBEDefinition.QBEFieldDefs = {
      04000000110000000C000000434F445F434144415354524F0100000000000A00
      0000494E445F5155414C49460100000000000A00000044545F414C545F534F43
      0100000000000400000050414953010000000000080000004350465F434E504A
      010000000000080000004E4F4D455F454D500100000000000C00000050455243
      5F4341505F544F540100000000000C000000504552435F4341505F564F540100
      000000000A00000044545F46494D5F534F43010000000000060000005155414C
      49460100000000000B0000004350465F5245505F4C45470100000000000E0000
      005155414C49465F5245505F4C45470100000000000B000000564C5F52454D5F
      545241420100000000000A000000564C5F4C55435F4449560100000000000A00
      0000564C5F4A55525F4341500100000000000B000000564C5F44454D5F52454E
      4401000000000009000000564C5F49525F524554010000000000}
    Session = DMOracle.DBCemapa
    Left = 32
    Top = 32
    object QReg600COD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QReg600IND_QUALIF: TStringField
      FieldName = 'IND_QUALIF'
      Size = 2
    end
    object QReg600DT_ALT_SOC: TDateTimeField
      FieldName = 'DT_ALT_SOC'
      Required = True
    end
    object QReg600PAIS: TStringField
      FieldName = 'PAIS'
      Size = 3
    end
    object QReg600CPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Size = 4000
    end
    object QReg600NOME_EMP: TStringField
      FieldName = 'NOME_EMP'
      Required = True
      Size = 60
    end
    object QReg600PERC_CAP_TOT: TFloatField
      FieldName = 'PERC_CAP_TOT'
    end
    object QReg600PERC_CAP_VOT: TFloatField
      FieldName = 'PERC_CAP_VOT'
    end
    object QReg600DT_FIM_SOC: TStringField
      FieldName = 'DT_FIM_SOC'
      Size = 1
    end
    object QReg600QUALIF: TStringField
      FieldName = 'QUALIF'
      Required = True
      Size = 2
    end
    object QReg600CPF_REP_LEG: TStringField
      FieldName = 'CPF_REP_LEG'
      Size = 1
    end
    object QReg600QUALIF_REP_LEG: TStringField
      FieldName = 'QUALIF_REP_LEG'
      Size = 1
    end
    object QReg600VL_REM_TRAB: TStringField
      FieldName = 'VL_REM_TRAB'
      Size = 1
    end
    object QReg600VL_LUC_DIV: TStringField
      FieldName = 'VL_LUC_DIV'
      Size = 1
    end
    object QReg600VL_JUR_CAP: TStringField
      FieldName = 'VL_JUR_CAP'
      Size = 1
    end
    object QReg600VL_DEM_REND: TStringField
      FieldName = 'VL_DEM_REND'
      Size = 1
    end
    object QReg600VL_IR_RET: TStringField
      FieldName = 'VL_IR_RET'
      Size = 1
    end
  end
end
