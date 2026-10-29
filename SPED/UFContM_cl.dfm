object DmFContM: TDmFContM
  OldCreateOrder = False
  Left = 529
  Top = 306
  Height = 190
  Width = 310
  object QReg020: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  10 AS QUALI_PJ,'
      '  '#39'A'#39' AS FORM_APUR,'
      '  1 AS FORM_TRIBUT'
      'FROM DUAL')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000080000005155414C495F504A01000000000009000000464F
      524D5F415055520100000000000B000000464F524D5F54524942555401000000
      0000}
    Session = DMOracle.DBCemapa
    Left = 40
    Top = 16
    object QReg020QUALI_PJ: TFloatField
      FieldName = 'QUALI_PJ'
    end
    object QReg020FORM_APUR: TStringField
      FieldName = 'FORM_APUR'
      Size = 1
    end
    object QReg020FORM_TRIBUT: TFloatField
      FieldName = 'FORM_TRIBUT'
    end
  end
  object QReg030: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  '#39'A00'#39' AS IND_PER,'
      
        '  SUM(CASE WHEN IND_DC = '#39'C'#39' THEN VAL_ATUAL ELSE (VAL_ATUAL * -1' +
        ') END) AS VL_LUC_LIQ,'
      '  CASE WHEN '
      '    SUM('
      '      CASE WHEN IND_DC = '#39'C'#39' '
      '        THEN VAL_ATUAL '
      '        ELSE (VAL_ATUAL * -1) '
      '      END) >= 0 '
      '    THEN '#39'D'#39' ELSE '#39'C'#39' END AS IND_LUC_LIQ'
      'FROM'
      '(SELECT'
      '  P.COD_PLANO_CONTA,'
      '  P.NUM_PLANO_CONTA,'
      '  ABS(SUM(S.VAL_ATUAL)) AS VAL_ATUAL,'
      
        '  CASE WHEN (SUM(S.VAL_ATUAL) >= 0) THEN '#39'C'#39' ELSE '#39'D'#39' END AS IND' +
        '_DC'
      'FROM'
      '  TB_SALDO_CONTABIL_ENCERRAMENTO S'
      'INNER JOIN TB_PLANO_CONTA P ON'
      '  P.COD_PLANO_CONTA = S.COD_PLANO_CONTA'
      '  AND S.COD_FILIAL = P.COD_FILIAL'
      'INNER JOIN TB_LANCTO_CONTABIL L'
      '  ON P.COD_PLANO_CONTA = L.COD_PLANO_CONTA'
      '  AND L.COD_FILIAL = P.COD_FILIAL'
      '  AND L.DT_LANCAMENTO BETWEEN :DT_INI AND :DT_FIN  '
      'WHERE'
      '  S.DT_ANO_MES = :DT_ANO_MES'
      'AND'
      '  S.COD_FILIAL IN :FILIAIS'
      'AND'
      '  P.DESC_NATUREZA_CONTA = '#39'04'#39
      'AND'
      '  P.COD_REDUZIDO IS NOT NULL'
      '/*'
      'HAVING'
      '  SUM(VAL_ATUAL) <> 0'
      '*/'
      'GROUP BY'
      '  P.COD_PLANO_CONTA,'
      '  P.NUM_PLANO_CONTA'
      ') '
      'GROUP BY '#39'A00'#39)
    Variables.Data = {
      0300000004000000080000003A46494C49414953010000000400000028312900
      00000000070000003A44545F494E49050000000000000000000000070000003A
      44545F46494E0500000000000000000000000B0000003A44545F414E4F5F4D45
      53050000000000000000000000}
    Session = DMOracle.DBCemapa
    Left = 120
    Top = 16
  end
  object QReg025: TOracleDataSet1
    SQL.Strings = (
      'SELECT  '
      '  P.NUM_PLANO_CONTA as COD_CTA,'
      '  '#39#39' AS COD_CCUS,'
      '  R.NUM_PLANO_CONTA_REFERENCIAL AS COD_CTA_REF, '
      '  SUM(VAL_ANTERIOR) AS VL_SLD_FIN_FC,'
      
        '  CASE WHEN SUM(VAL_ANTERIOR) > 0 THEN '#39'D'#39' ELSE '#39'C'#39' END AS IND_D' +
        'C_FIN_FC,'
      '  SUM(VAL_ANTERIOR) AS VL_SLD_FIN_SOC,'
      
        '  CASE WHEN SUM(VAL_ANTERIOR) > 0 THEN '#39'D'#39' ELSE '#39'C'#39' END AS IND_D' +
        'C_FIN_SOC '
      'FROM'
      '  TB_SALDO_CONTABIL S'
      'INNER JOIN TB_PLANO_CONTA P'
      '  ON S.COD_PLANO_CONTA = P.COD_PLANO_CONTA'
      'INNER JOIN TB_PLANO_CONTA_REFERENCIAL R'
      
        '  ON P.COD_PLANO_CONTA_REFERENCIAL = R.COD_PLANO_CONTA_REFERENCI' +
        'AL'
      'WHERE'
      '  P.COD_REDUZIDO IS NOT NULL'
      'AND'
      '  DT_ANO_MES = :DT_ANO_MES'
      'AND'
      '  S.COD_FILIAL IN :FILIAIS'
      'AND'
      '  P.DESC_NATUREZA_CONTA IN ('#39'01'#39','#39'02'#39','#39'03'#39')  '
      'GROUP BY'
      '  P.NUM_PLANO_CONTA,'
      '  '#39#39','
      '  R.NUM_PLANO_CONTA_REFERENCIAL,'
      '  0,'
      '  0'
      'HAVING'
      
        '  ((SUM(VAL_ANTERIOR) <> 0) OR (SUM(VAL_DEBITO) <> 0) OR (SUM(VA' +
        'L_CREDITO) <> 0) OR (SUM(VAL_ATUAL) <> 0))'
      'ORDER BY'
      '  P.NUM_PLANO_CONTA')
    Variables.Data = {
      03000000020000000B0000003A44545F414E4F5F4D4553030000000000000000
      000000080000003A46494C4941495301000000040000002831290000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000007000000434F445F43544101000000000008000000434F44
      5F434355530100000000000B000000434F445F4354415F524546010000000000
      0D000000564C5F534C445F46494E5F46430100000000000D000000494E445F44
      435F46494E5F46430100000000000E000000564C5F534C445F46494E5F534F43
      0100000000000E000000494E445F44435F46494E5F534F43010000000000}
    Session = DMOracle.DBCemapa
    Left = 208
    Top = 16
    object QReg025COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Required = True
      Size = 15
    end
    object QReg025COD_CCUS: TStringField
      FieldName = 'COD_CCUS'
      Size = 1
    end
    object QReg025COD_CTA_REF: TStringField
      FieldName = 'COD_CTA_REF'
      Required = True
      Size = 25
    end
    object QReg025VL_SLD_FIN_FC: TFloatField
      FieldName = 'VL_SLD_FIN_FC'
    end
    object QReg025IND_DC_FIN_FC: TStringField
      FieldName = 'IND_DC_FIN_FC'
      Size = 1
    end
    object QReg025VL_SLD_FIN_SOC: TFloatField
      FieldName = 'VL_SLD_FIN_SOC'
    end
    object QReg025IND_DC_FIN_SOC: TStringField
      FieldName = 'IND_DC_FIN_SOC'
      Size = 1
    end
  end
end
