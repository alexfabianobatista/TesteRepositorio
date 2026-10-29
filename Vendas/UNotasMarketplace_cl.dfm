object DMNotasMarketplace: TDMNotasMarketplace
  OldCreateOrder = False
  Left = 419
  Top = 174
  Height = 226
  Width = 429
  object QNotasMarketplace: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  NOTA.COD_NOTA_CAB,'
      '  NOTA.NUM_NOTA,'
      '  CAD.NOME,'
      '  PED.COD_FILIAL,'
      '  PED.COD_PEDIDO_CAB,'
      '  PED.COD_PEDIDO_MARKETPLACE,'
      '  PED.DESC_SITUACAO_MARKETPLACE,'
      '  PED.DT_EMISSAO,'
      '  REPLACE(NOTA.DESC_CHAVE_ACESSO,'#39'NFe'#39','#39#39') as DESC_CHAVE_ACESSO,'
      '  SUM(NOTAI.QT_QUANTIDADE * NOTAI.VAL_UNITARIO) AS SVAL_TOTAL,'
      '  NVL(PED.VAL_FRETE_MARKETPLACE,0) AS VAL_FRETE_MARKETPLACE,'
      
        '  ROUND(SUM(NOTAI.QT_QUANTIDADE * NOTAI.VAL_UNITARIO) - (SUM(NOT' +
        'AI.QT_QUANTIDADE * NOTAI.VAL_UNITARIO + NVL(PED.VAL_FRETE_MARKET' +
        'PLACE,0))*0.16),2) AS SVAL_RECEBER'
      'FROM'
      '  TB_CADASTRO CAD,'
      '  TB_NOTA_CAB NOTA,'
      '  TB_NOTA_ITEM NOTAI,'
      '  TB_PEDIDO_CAB PED,'
      '  TB_PEDIDO_ITEM PEDI,'
      '  TB_BAIXA_PEDIDO BAIXAPED'
      'WHERE'
      '  NOTA.COD_NOTA_CAB = NOTAI.COD_NOTA_CAB'
      '  AND'
      '  NOTAI.COD_NOTA_ITEM = BAIXAPED.COD_NOTA_ITEM'
      '  AND'
      '  BAIXAPED.COD_PEDIDO_ITEM = PEDI.COD_PEDIDO_ITEM'
      '  AND'
      '  PEDI.COD_PEDIDO_CAB = PED.COD_PEDIDO_CAB'
      '  AND'
      '  NOTA.COD_CADASTRO = CAD.COD_CADASTRO'
      '  AND'
      '  (:CADASTRO IS NULL OR :CADASTRO = CAD.COD_CADASTRO)'
      '  AND'
      '  (:FILIAL IS NULL OR :FILIAL = NOTA.COD_FILIAL)'
      '  AND'
      '  PED.COD_PEDIDO_MARKETPLACE IS NOT NULL'
      '  AND'
      
        '  ((:DT_INICIAL IS NULL OR :DT_FINAL IS NULL) OR NOTA.DT_EMISSAO' +
        ' BETWEEN :DT_INICIAL AND :DT_FINAL)'
      '  AND'
      '  (:NUM_NOTA IS NULL OR :NUM_NOTA = NOTA.NUM_NOTA)'
      '  AND'
      
        '  (:MARKETPLACE IS NULL OR :MARKETPLACE = PED.COD_PEDIDO_MARKETP' +
        'LACE)'
      '  AND'
      '  (:SITUACAO)'
      
        'GROUP BY NOTA.COD_NOTA_CAB, NOTA.NUM_NOTA, CAD.NOME, PED.COD_FIL' +
        'IAL, PED.COD_PEDIDO_CAB, PED.COD_PEDIDO_MARKETPLACE, PED.DESC_SI' +
        'TUACAO_MARKETPLACE, PED.DT_EMISSAO, REPLACE(NOTA.DESC_CHAVE_ACES' +
        'SO,'#39'NFe'#39','#39#39'), NVL(PED.VAL_FRETE_MARKETPLACE,0)'
      'ORDER BY'
      '  NOTA.COD_NOTA_CAB DESC')
    Variables.Data = {
      0300000007000000090000003A434144415354524F0500000000000000000000
      00070000003A46494C49414C050000000000000000000000090000003A534954
      554143414F0100000000000000000000000B0000003A44545F494E494349414C
      050000000000000000000000090000003A44545F46494E414C05000000000000
      0000000000090000003A4E554D5F4E4F54410500000000000000000000000C00
      00003A4D41524B4554504C414345050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C0000000C000000434F445F4E4F54415F4341420100000000000800
      00004E554D5F4E4F5441010000000000040000004E4F4D450100000000000E00
      0000434F445F50454449444F5F43414201000000000016000000434F445F5045
      4449444F5F4D41524B4554504C4143450100000000000A0000005356414C5F54
      4F54414C0100000000000A000000434F445F46494C49414C0100000000001100
      0000444553435F43484156455F41434553534F0100000000000A00000044545F
      454D495353414F01000000000019000000444553435F534954554143414F5F4D
      41524B4554504C4143450100000000000C0000005356414C5F52454345424552
      0100000000001500000056414C5F46524554455F4D41524B4554504C41434501
      0000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QNotasMarketplaceCalcFields
    Left = 56
    Top = 16
    object QNotasMarketplaceCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QNotasMarketplaceNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QNotasMarketplaceNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QNotasMarketplaceCOD_PEDIDO_CAB: TIntegerField
      FieldName = 'COD_PEDIDO_CAB'
      Required = True
    end
    object QNotasMarketplaceCOD_PEDIDO_MARKETPLACE: TStringField
      FieldName = 'COD_PEDIDO_MARKETPLACE'
      Size = 60
    end
    object QNotasMarketplaceSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
    end
    object QNotasMarketplaceCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QNotasMarketplaceDESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Size = 47
    end
    object QNotasMarketplacedesc_situacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_situacao'
      Calculated = True
    end
    object QNotasMarketplaceDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QNotasMarketplaceDESC_SITUACAO_MARKETPLACE: TStringField
      FieldName = 'DESC_SITUACAO_MARKETPLACE'
      Size = 30
    end
    object QNotasMarketplaceSVAL_RECEBER: TFloatField
      FieldName = 'SVAL_RECEBER'
    end
    object QNotasMarketplaceVAL_FRETE_MARKETPLACE: TFloatField
      FieldName = 'VAL_FRETE_MARKETPLACE'
    end
  end
  object QConfiguracoesSkyhub: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      
        '  COD_CONFIGURACAO_SKYHUB AS COD_CONFIGURACAO_SKYHUB,           ' +
        '                                                                ' +
        '                                                                ' +
        '                                        '
      
        '  COD_FILIAL + 0.00 AS COD_FILIAL,                              ' +
        '                                                                ' +
        '                                                                ' +
        '             '
      
        '  IND_ATIVO,                                                    ' +
        '                                                                ' +
        '                                                                ' +
        ' '
      
        '  DESC_USUARIO_EMAIL,                                           ' +
        '                                                                ' +
        '                                                                ' +
        '  '
      
        '  DESC_TOKEN_INTEGRACAO,                                        ' +
        '                                                                ' +
        '                                                                ' +
        '     '
      
        '  DESC_TOKEN_ACCOUNT,                                           ' +
        '                                                                ' +
        '                                                                ' +
        '       '
      '  COD_OPERACAO + 0.00 AS COD_OPERACAO'
      'FROM'
      '  TB_CONFIGURACAO_SKYHUB'
      'WHERE'
      '  (:FILIAL IS NULL OR COD_FILIAL = :FILIAL)'
      '  AND'
      '  (:ATIVO IS NULL OR IND_ATIVO = :ATIVO)'
      '  AND'
      
        '  (:CONFIGURACAO_SKYHUB IS NULL OR COD_CONFIGURACAO_SKYHUB = :CO' +
        'NFIGURACAO_SKYHUB)')
    Variables.Data = {
      0300000003000000070000003A46494C49414C05000000000000000000000006
      0000003A415449564F050000000000000000000000140000003A434F4E464947
      55524143414F5F534B59485542050000000000000000000000}
    SequenceField.Field = 'COD_CONFIGURACAO_SKYHUB'
    SequenceField.Sequence = 'SQCONFIGURACAO_SKYHUB'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000700000017000000434F445F434F4E46494755524143414F5F534B59
      4855420100000000000A000000434F445F46494C49414C010000000000090000
      00494E445F415449564F01000000000012000000444553435F5553554152494F
      5F454D41494C01000000000015000000444553435F544F4B454E5F494E544547
      524143414F01000000000012000000444553435F544F4B454E5F4143434F554E
      540100000000000C000000434F445F4F5045524143414F010000000000}
    Session = DMOracle.DBCemapa
    Left = 64
    Top = 72
    object QConfiguracoesSkyhubCOD_CONFIGURACAO_SKYHUB: TIntegerField
      FieldName = 'COD_CONFIGURACAO_SKYHUB'
      Required = True
    end
    object QConfiguracoesSkyhubCOD_FILIAL: TFloatField
      FieldName = 'COD_FILIAL'
    end
    object QConfiguracoesSkyhubIND_ATIVO: TStringField
      FieldName = 'IND_ATIVO'
      Size = 1
    end
    object QConfiguracoesSkyhubDESC_USUARIO_EMAIL: TStringField
      FieldName = 'DESC_USUARIO_EMAIL'
      Size = 40
    end
    object QConfiguracoesSkyhubDESC_TOKEN_INTEGRACAO: TStringField
      FieldName = 'DESC_TOKEN_INTEGRACAO'
      Size = 30
    end
    object QConfiguracoesSkyhubDESC_TOKEN_ACCOUNT: TStringField
      FieldName = 'DESC_TOKEN_ACCOUNT'
      Size = 30
    end
    object QConfiguracoesSkyhubCOD_OPERACAO: TFloatField
      FieldName = 'COD_OPERACAO'
    end
  end
end
