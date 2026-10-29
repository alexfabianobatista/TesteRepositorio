object DmPisCofinsP: TDmPisCofinsP
  OldCreateOrder = False
  Left = 576
  Top = 333
  Height = 245
  Width = 431
  object QReg010: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      
        #9'REPLACE(REPLACE(REPLACE(F.NUM_CGC,'#39'.'#39','#39#39'),'#39'/'#39','#39#39'),'#39'-'#39','#39#39') AS CN' +
        'PJ,'
      #9'F.COD_FILIAL'
      'FROM'
      '  TB_FILIAL F'
      'WHERE'
      '  --COD_FILIAL IN :FILIAL'
      '  --AND'
      '  F.COD_INC_TRIB_PREV IS NOT NULL')
    Variables.Data = {
      0300000001000000070000003A46494C49414C01000000040000002831290000
      000000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000A000000434F445F46494C49414C01000000000004000000
      434E504A010000000000}
    Session = DMOracle.DBCemapa
    Left = 16
    Top = 16
    object QReg010COD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QReg010CNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
  end
  object QReg100: TOracleDataSet1
    SQL.Strings = (
      ''
      'SELECT'
      '  MIN(N.DT_RECEBIMENTO) AS DT_INI,'
      '  MAX(N.DT_RECEBIMENTO) AS DT_FIN,'
      '  A.COD_ATIVIDADE_CONTRIB AS COD_ATIV_ECON,'
      '  0 AS VL_EXC,   '
      
        '  (SELECT SUM(IT.VAL_TOTAL) + SUM(IT.VAL_DESPESAS) - SUM(IT.VAL_' +
        'DESCONTO)'
      '    FROM TB_NOTA_ITEM IT'
      
        '      INNER JOIN TB_NOTA_CAB NT ON NT.COD_NOTA_CAB = IT.COD_NOTA' +
        '_CAB'
      
        '      INNER JOIN TB_OPERACAO OP ON NT.COD_OPERACAO = OP.COD_OPER' +
        'ACAO'
      '    WHERE'
      '      OP.IND_LIVRO_FISCAL = '#39'S'#39
      '      AND'
      '      (OP.NUM_LIVROS <> 10 or OP.NUM_LIVROS is null)'
      '      AND'
      '      NT.IND_SITUACAO = 2 '
      '      AND'
      '      NT.IND_ENTRADA_SAIDA = '#39'S'#39
      '      AND'
      '      NT.COD_FILIAL = :FILIAL'
      '      AND'
      
        '      NT.DT_EMISSAO BETWEEN :DT_INI AND :DT_FIN ) VL_REC_TOT_EST' +
        ','
      
        '  SUM(I.VAL_TOTAL) + SUM(I.VAL_DESPESAS) - SUM(I.VAL_DESCONTO) A' +
        'S VL_REC_ATIV_ESTAB,  '
      
        '  SUM(I.VAL_TOTAL) + SUM(I.VAL_DESPESAS) - SUM(I.VAL_DESCONTO) A' +
        'S VL_BC_CONT,'
      '  A.PERC_ALIQ AS ALIQ_CONT,'
      
        '  (SUM(I.VAL_TOTAL) + SUM(I.VAL_DESPESAS) - SUM(I.VAL_DESCONTO))' +
        '  *'
      '   (( A.PERC_ALIQ) / 100) AS VL_CONT_APU  '
      'FROM'
      '  TB_NOTA_ITEM I'
      '  INNER JOIN TB_NOTA_CAB N ON I.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '  INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  '
      '  INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL'
      '  INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO  '
      
        '  INNER JOIN TB_ATIVIDADE_CONTRIB A ON TRIM(P.NUM_GENERO_NCM) LI' +
        'KE TRIM(A.COD_NCM)||'#39'%'#39
      'WHERE'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      '  AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      '  AND'
      '  N.IND_SITUACAO = 2'
      '  AND'
      '  N.IND_ENTRADA_SAIDA = '#39'S'#39
      '  AND'
      '  F.COD_INC_TRIB_PREV IS NOT NULL'
      '  AND'
      '  F.COD_FILIAL = :FILIAL'
      '  AND'
      '  N.DT_EMISSAO BETWEEN :DT_INI AND :DT_FIN'
      'GROUP BY '
      '  A.COD_ATIVIDADE_CONTRIB,'
      '  0,'
      '  A.PERC_ALIQ'
      'HAVING '
      
        '  (SUM(I.VAL_TOTAL) + SUM(I.VAL_DESPESAS) - SUM(I.VAL_DESCONTO))' +
        '  *'
      '   (( A.PERC_ALIQ) / 100) > 0')
    Variables.Data = {
      0300000003000000070000003A46494C49414C03000000000000000000000007
      0000003A44545F494E490C0000000000000000000000070000003A44545F4649
      4E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000600000044545F494E490100000000000600000044545F46
      494E0100000000000D000000434F445F415449565F45434F4E01000000000006
      000000564C5F4558430100000000000E000000564C5F5245435F544F545F4553
      5401000000000011000000564C5F5245435F415449565F455354414201000000
      00000A000000564C5F42435F434F4E5401000000000009000000414C49515F43
      4F4E540100000000000B000000564C5F434F4E545F415055010000000000}
    Session = DMOracle.DBCemapa
    Left = 80
    Top = 16
    object QReg100DT_INI: TDateTimeField
      FieldName = 'DT_INI'
    end
    object QReg100DT_FIN: TDateTimeField
      FieldName = 'DT_FIN'
    end
    object QReg100COD_ATIV_ECON: TIntegerField
      FieldName = 'COD_ATIV_ECON'
    end
    object QReg100VL_EXC: TFloatField
      FieldName = 'VL_EXC'
    end
    object QReg100VL_REC_TOT_EST: TFloatField
      FieldName = 'VL_REC_TOT_EST'
    end
    object QReg100VL_REC_ATIV_ESTAB: TFloatField
      FieldName = 'VL_REC_ATIV_ESTAB'
    end
    object QReg100VL_BC_CONT: TFloatField
      FieldName = 'VL_BC_CONT'
    end
    object QReg100ALIQ_CONT: TFloatField
      FieldName = 'ALIQ_CONT'
    end
    object QReg100VL_CONT_APU: TFloatField
      FieldName = 'VL_CONT_APU'
    end
  end
  object QReg200: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      '  TO_CHAR(N.DT_EMISSAO, '#39'MMYYYY'#39') AS PERC_REF,'
      '  0 AS VL_TOT_AJ_REDUC,'
      '  0 AS VL_TOT_AJ_ACRES,'
      '  DECODE(A.IND_TIPO, '#39'PRODUTO'#39', '#39'299101'#39', '#39'298501'#39') AS COD_REC,'
      
        '  (((SUM(I.VAL_TOTAL) + SUM(I.VAL_DESPESAS) - SUM(I.VAL_DESCONTO' +
        ')) *'
      '    A.PERC_ALIQ) / 100) AS VL_TOT_CONT_APU,  '
      
        '  (((SUM(I.VAL_TOTAL) + SUM(I.VAL_DESPESAS) - SUM(I.VAL_DESCONTO' +
        ')) *'
      '    A.PERC_ALIQ) / 100) AS VL_TOT_CONT_DEV  '
      'FROM'
      '  TB_NOTA_ITEM I'
      '  INNER JOIN TB_NOTA_CAB N ON I.COD_NOTA_CAB = N.COD_NOTA_CAB'
      '  INNER JOIN TB_PRODUTO P ON I.COD_PRODUTO = P.COD_PRODUTO  '
      '  INNER JOIN TB_FILIAL F ON N.COD_FILIAL = F.COD_FILIAL '
      
        '  INNER JOIN TB_ATIVIDADE_CONTRIB A ON TRIM(P.NUM_GENERO_NCM) LI' +
        'KE TRIM(A.COD_NCM)||'#39'%'#39' '
      '  INNER JOIN TB_OPERACAO O ON N.COD_OPERACAO = O.COD_OPERACAO'
      'WHERE'
      '  F.COD_INC_TRIB_PREV IS NOT NULL'
      '  AND'
      '  N.DT_EMISSAO BETWEEN :DT_INI AND :DT_FIN'
      '  AND'
      '  N.IND_SITUACAO = 2'
      '  AND'
      '  N.IND_ENTRADA_SAIDA = '#39'S'#39
      '  AND'
      '  O.IND_LIVRO_FISCAL = '#39'S'#39
      '  AND'
      '  (O.NUM_LIVROS <> 10 or O.NUM_LIVROS is null)'
      'GROUP BY '
      '  TO_CHAR(N.DT_EMISSAO, '#39'MMYYYY'#39'),'
      '  0,'
      '  0,'
      '  DECODE(A.IND_TIPO, '#39'PRODUTO'#39', '#39'299101'#39', '#39'298501'#39'),'
      '  A.PERC_ALIQ'
      'HAVING '
      
        '  (((SUM(I.VAL_TOTAL) + SUM(I.VAL_DESPESAS) - SUM(I.VAL_DESCONTO' +
        ')) *'
      '    A.PERC_ALIQ) / 100) > 0')
    Variables.Data = {
      0300000002000000070000003A44545F494E490C000000000000000000000007
      0000003A44545F46494E0C0000000000000000000000}
    Session = DMOracle.DBCemapa
    Left = 144
    Top = 16
  end
  object CDS100: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    AfterInsert = CDS100AfterInsert
    OnCalcFields = CDS100CalcFields
    Left = 216
    Top = 16
    Data = {
      D70000009619E0BD010000001800000009000000000003000000D7000A434F44
      5F46494C49414C04000100000000000644545F494E4904000600000000000644
      545F46494E08000800000000000E564C5F5245435F544F545F45535408000400
      000000000D434F445F415449565F45434F4E0100490000000100055749445448
      02000200140011564C5F5245435F415449565F45535441420800040000000000
      0A564C5F42435F434F4E54080004000000000009414C49515F434F4E54080004
      00000000000B564C5F434F4E545F41505508000400000000000000}
    object CDS100COD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object CDS100DT_INI: TDateField
      FieldName = 'DT_INI'
    end
    object CDS100DT_FIN: TDateTimeField
      FieldName = 'DT_FIN'
    end
    object CDS100VL_REC_TOT_EST: TFloatField
      FieldName = 'VL_REC_TOT_EST'
    end
    object CDS100COD_ATIV_ECON: TStringField
      FieldName = 'COD_ATIV_ECON'
    end
    object CDS100VL_REC_ATIV_ESTAB: TFloatField
      FieldName = 'VL_REC_ATIV_ESTAB'
    end
    object CDS100ALIQ_CONT: TFloatField
      FieldName = 'ALIQ_CONT'
    end
    object CDS100vl_cont_apu: TFloatField
      FieldKind = fkCalculated
      FieldName = 'vl_cont_apu'
      Calculated = True
    end
    object CDS100vl_bc_cont: TFloatField
      FieldKind = fkCalculated
      FieldName = 'vl_bc_cont'
      Calculated = True
    end
  end
  object DS100: TDataSource
    AutoEdit = False
    DataSet = CDS100
    Left = 216
    Top = 88
  end
  object CDS200: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 16
    Data = {
      820000009619E0BD01000000180000000400000000000300000082000F564C5F
      544F545F434F4E545F41505508000400000000000F564C5F544F545F434F4E54
      5F444556080004000000000007434F445F524543010049000000010005574944
      5448020002001400075045525F52454601004900000001000557494454480200
      020014000000}
    object CDS200VL_TOT_CONT_APU: TFloatField
      FieldName = 'VL_TOT_CONT_APU'
    end
    object CDS200VL_TOT_CONT_DEV: TFloatField
      FieldName = 'VL_TOT_CONT_DEV'
    end
    object CDS200COD_REC: TStringField
      FieldName = 'COD_REC'
    end
    object CDS200PER_REF: TStringField
      FieldName = 'PER_REF'
    end
  end
  object DS200: TDataSource
    DataSet = CDS200
    Left = 272
    Top = 88
  end
end
