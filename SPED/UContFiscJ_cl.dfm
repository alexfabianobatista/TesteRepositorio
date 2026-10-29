object DMContFiscJ: TDMContFiscJ
  OldCreateOrder = False
  Left = 365
  Top = 200
  Height = 370
  Width = 528
  object QReg050: TOracleDataSet1
    SQL.Strings = (
      'SELECT DISTINCT * FROM('
      'SELECT'
      '  DESC_NATUREZA_CONTA AS COD_NAT,'
      '  CASE'
      '    WHEN COD_REDUZIDO IS NULL THEN '#39'S'#39
      '    ELSE '#39'A'#39
      '  END AS IND_CTA,'
      '  NUM_GRAU AS NIVEL,  '
      '  NUM_PLANO_CONTA AS COD_CTA,  '
      '  DESC_PLANO_CONTA AS CTA,  '
      '  NUM_GRAUS_CONTABIL,'
      '  COD_PLANO_CONTA_REFERENCIAL,'
      '  COD_REDUZIDO,'
      '  P.COD_PLANO_CONTA'
      'FROM'
      '  TB_PARAM_SISTEMA S,'
      '  TB_PLANO_CONTA P,'
      '  TB_LANCTO_CONTABIL L      '
      'WHERE'
      
        '  (((P.COD_PLANO_CONTA = L.COD_PLANO_CONTA) AND L.DT_LANCAMENTO ' +
        '<= :DT_FIN) '
      '        OR P.NUM_GRAU <> S.NUM_GRAUS_CONTABIL)'
      '  AND'
      '  P.IND_LIBERADO_USO = '#39'SIM'#39
      '  AND'
      '  P.COD_FILIAL IN :FILIAIS'
      '  AND '
      '  P.IND_ENCERRAMENTO_EXERCICIO <> '#39'SIM'#39
      ''
      'UNION'
      ''
      '-- PARA BUSCAR CONTAS DO DRE'
      'SELECT'
      '  DESC_NATUREZA_CONTA AS COD_NAT,'
      '  CASE'
      '    WHEN COD_REDUZIDO IS NULL THEN '#39'S'#39
      '    ELSE '#39'A'#39
      '  END AS IND_CTA,'
      '  NUM_GRAU AS NIVEL,  '
      '  NUM_PLANO_CONTA AS COD_CTA,  '
      '  DESC_PLANO_CONTA AS CTA,  '
      '  NUM_GRAUS_CONTABIL,'
      '  COD_PLANO_CONTA_REFERENCIAL,'
      '  COD_REDUZIDO,'
      '  P.COD_PLANO_CONTA'
      'FROM'
      '  TB_PARAM_SISTEMA S,'
      '  TB_PLANO_CONTA P,'
      '  TB_DRE_ITEM L      '
      'WHERE'
      '  P.COD_PLANO_CONTA = L.COD_PLANO_CONTA'
      '  AND'
      '  P.IND_LIBERADO_USO = '#39'SIM'#39
      '  AND'
      '  P.COD_FILIAL IN :FILIAIS'
      '  AND '
      '  P.IND_ENCERRAMENTO_EXERCICIO <> '#39'SIM'#39
      ''
      'UNION'
      ''
      'SELECT'
      '  DESC_NATUREZA_CONTA AS COD_NAT,'
      '  CASE'
      '    WHEN COD_REDUZIDO IS NULL THEN '#39'S'#39
      '    ELSE '#39'A'#39
      '  END AS IND_CTA,'
      '  NUM_GRAU AS NIVEL,  '
      '  NUM_PLANO_CONTA AS COD_CTA,  '
      '  DESC_PLANO_CONTA AS CTA,  '
      '  NUM_GRAUS_CONTABIL,'
      '  COD_PLANO_CONTA_REFERENCIAL,'
      '  COD_REDUZIDO,'
      '  P.COD_PLANO_CONTA'
      'FROM'
      '  TB_PARAM_SISTEMA S,'
      '  TB_PLANO_CONTA P,'
      '  TB_GRUPO_DRE_CONTA L      '
      'WHERE'
      '  P.COD_PLANO_CONTA = L.COD_PLANO_CONTA'
      '  AND'
      '  P.IND_LIBERADO_USO = '#39'SIM'#39
      '  AND'
      '  P.COD_FILIAL IN :FILIAIS'
      '  AND '
      '  P.IND_ENCERRAMENTO_EXERCICIO <> '#39'SIM'#39
      ')'
      'ORDER BY COD_CTA')
    Variables.Data = {
      0300000002000000080000003A46494C4941495301000000230000002853454C
      45435420434F445F46494C49414C2046524F4D2054425F46494C49414C290000
      000000070000003A44545F46494E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000900000007000000434F445F4E415401000000000007000000494E44
      5F435441010000000000050000004E4956454C01000000000007000000434F44
      5F43544101000000000003000000435441010000000000120000004E554D5F47
      524155535F434F4E544142494C0100000000001B000000434F445F504C414E4F
      5F434F4E54415F5245464552454E4349414C0100000000000C000000434F445F
      524544555A49444F0100000000000F000000434F445F504C414E4F5F434F4E54
      41010000000000}
    Session = DMOracle.DBCemapa
    Left = 32
    Top = 24
    object QReg050COD_NAT: TStringField
      FieldName = 'COD_NAT'
      Size = 2
    end
    object QReg050IND_CTA: TStringField
      FieldName = 'IND_CTA'
      Size = 1
    end
    object QReg050NIVEL: TIntegerField
      FieldName = 'NIVEL'
      Required = True
    end
    object QReg050COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Required = True
      Size = 15
    end
    object QReg050CTA: TStringField
      FieldName = 'CTA'
      Required = True
      Size = 40
    end
    object QReg050NUM_GRAUS_CONTABIL: TIntegerField
      FieldName = 'NUM_GRAUS_CONTABIL'
      Required = True
    end
    object QReg050COD_PLANO_CONTA_REFERENCIAL: TIntegerField
      FieldName = 'COD_PLANO_CONTA_REFERENCIAL'
    end
    object QReg050COD_REDUZIDO: TIntegerField
      FieldName = 'COD_REDUZIDO'
    end
    object QReg050COD_PLANO_CONTA: TIntegerField
      FieldName = 'COD_PLANO_CONTA'
      Required = True
    end
  end
  object QReg051: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  NULL AS COD_CCUS,'
      '  R.NUM_PLANO_CONTA_REFERENCIAL AS COD_CTA_REF'
      'FROM'
      '  TB_PLANO_CONTA P'
      
        '    LEFT JOIN TB_PLANO_CONTA_REFERENCIAL R ON P.COD_PLANO_CONTA_' +
        'REFERENCIAL = R.COD_PLANO_CONTA_REFERENCIAL'
      'WHERE'
      '  P.COD_PLANO_CONTA = :COD_PLANO_CONTA')
    Variables.Data = {
      0300000001000000100000003A434F445F504C414E4F5F434F4E544103000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000008000000434F445F434355530100000000000B000000434F
      445F4354415F524546010000000000}
    Session = DMOracle.DBCemapa
    Left = 88
    Top = 24
    object QReg051COD_CCUS: TStringField
      FieldName = 'COD_CCUS'
      Size = 1
    end
    object QReg051COD_CTA_REF: TStringField
      FieldName = 'COD_CTA_REF'
    end
  end
end
