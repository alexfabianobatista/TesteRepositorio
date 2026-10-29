object DMDevolucaoTroca: TDMDevolucaoTroca
  OldCreateOrder = False
  Left = 732
  Top = 146
  Height = 362
  Width = 470
  object QItensDevolucao: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      #9'I.COD_NOTA_ITEM,'
      #9'I.COD_PRODUTO,'
      #9'P.DESC_PRODUTO,'
      
        #9'I.QT_QUANTIDADE - NVL((SELECT SUM(QT_QUANTIDADE_DEVOLVIDA) FROM' +
        ' TB_VALE_PRODUTO_ITEM WHERE COD_NOTA_ITEM = I.COD_NOTA_ITEM),0) ' +
        'AS QT_QUANTIDADE,'
      #9'I.VAL_UNITARIO,'
      #9'0 AS QT_DEVOLUCAO,'
      #9'PEGA_DESCONTO_ITEM(I.COD_NOTA_ITEM) - '
      
        #9'((PEGA_DESCONTO_ITEM(I.COD_NOTA_ITEM) / I.QT_QUANTIDADE) * NVL(' +
        '(SELECT SUM(QT_QUANTIDADE_DEVOLVIDA) FROM TB_VALE_PRODUTO_ITEM W' +
        'HERE COD_NOTA_ITEM = I.COD_NOTA_ITEM),0)) AS VAL_DESCONTO,'
      #9'I.VAL_IPI,'
      #9'I.VAL_DESPESAS,'
      #9'I.VAL_ICMS_SUBST,'
      #9'I.COD_TRIBUTACAO,'
      #9'I.VAL_FRETE,'
      #9'I.VAL_ICM_BASE,'
      #9'I.VAL_ICM,'
      #9'I.VAL_BASE_SUBST,'
      #9'I.VAL_CUSTO,'
      #9'I.COD_CST_PIS,'
      #9'I.COD_CST_COFINS,'
      #9'I.COD_CST_IPI,'
      #9'I.VAL_PIS,'
      #9'I.VAL_CONFINS,'
      #9'I.COD_LOTE_TIPO,'
      #9'I.DESC_INF_ADICIONAL,'
      #9'I.PERC_COMISSAO'
      'FROM'
      #9'TB_NOTA_ITEM I'
      #9#9'INNER JOIN TB_PRODUTO P'
      #9#9'ON I.COD_PRODUTO = P.COD_PRODUTO'#9#9'    '#9#9#9' '#9#9
      'WHERE'
      #9'I.COD_NOTA_CAB = :COD_NOTA_CAB'
      
        #9'AND I.QT_QUANTIDADE - NVL((SELECT SUM(QT_QUANTIDADE_DEVOLVIDA) ' +
        'FROM TB_VALE_PRODUTO_ITEM WHERE COD_NOTA_ITEM = I.COD_NOTA_ITEM)' +
        ', 0) > 0       '
      'ORDER BY'
      #9'I.COD_NOTA_ITEM')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000180000000D000000434F445F4E4F54415F4954454D0100000000000B
      000000434F445F50524F4455544F0100000000000C000000444553435F50524F
      4455544F0100000000000C00000051545F4445564F4C5543414F010000000000
      0C00000056414C5F554E49544152494F0100000000000C00000056414C5F4445
      53434F4E544F0100000000000700000056414C5F4950490100000000000C0000
      0056414C5F44455350455341530100000000000E00000056414C5F49434D535F
      53554253540100000000000E000000434F445F5452494255544143414F010000
      0000000900000056414C5F46524554450100000000000C00000056414C5F4943
      4D5F424153450100000000000700000056414C5F49434D0100000000000E0000
      0056414C5F424153455F53554253540100000000000900000056414C5F435553
      544F0100000000000B000000434F445F4353545F5049530100000000000E0000
      00434F445F4353545F434F46494E530100000000000B000000434F445F435354
      5F4950490100000000000700000056414C5F5049530100000000000B00000056
      414C5F434F4E46494E530100000000000D000000434F445F4C4F54455F544950
      4F01000000000012000000444553435F494E465F41444943494F4E414C010000
      0000000D000000504552435F434F4D495353414F0100000000000D0000005154
      5F5155414E544944414445010000000000}
    Session = DMOracle.DBCemapa
    Left = 36
    Top = 16
    object QItensDevolucaoCOD_NOTA_ITEM: TIntegerField
      FieldName = 'COD_NOTA_ITEM'
      Required = True
    end
    object QItensDevolucaoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QItensDevolucaoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QItensDevolucaoVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QItensDevolucaoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object QItensDevolucaoQT_DEVOLUCAO: TFloatField
      FieldName = 'QT_DEVOLUCAO'
    end
    object QItensDevolucaoVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
      DisplayFormat = '#,##0.00'
    end
    object QItensDevolucaoVAL_IPI: TFloatField
      FieldName = 'VAL_IPI'
      Required = True
    end
    object QItensDevolucaoVAL_DESPESAS: TFloatField
      FieldName = 'VAL_DESPESAS'
      Required = True
    end
    object QItensDevolucaoVAL_ICMS_SUBST: TFloatField
      FieldName = 'VAL_ICMS_SUBST'
    end
    object QItensDevolucaoCOD_TRIBUTACAO: TIntegerField
      FieldName = 'COD_TRIBUTACAO'
      Required = True
    end
    object QItensDevolucaoVAL_FRETE: TFloatField
      FieldName = 'VAL_FRETE'
      Required = True
    end
    object QItensDevolucaoVAL_ICM_BASE: TFloatField
      FieldName = 'VAL_ICM_BASE'
      Required = True
    end
    object QItensDevolucaoVAL_ICM: TFloatField
      FieldName = 'VAL_ICM'
      Required = True
    end
    object QItensDevolucaoVAL_BASE_SUBST: TFloatField
      FieldName = 'VAL_BASE_SUBST'
    end
    object QItensDevolucaoVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
      Required = True
    end
    object QItensDevolucaoCOD_CST_PIS: TStringField
      FieldName = 'COD_CST_PIS'
      Size = 2
    end
    object QItensDevolucaoCOD_CST_COFINS: TStringField
      FieldName = 'COD_CST_COFINS'
      Size = 2
    end
    object QItensDevolucaoCOD_CST_IPI: TStringField
      FieldName = 'COD_CST_IPI'
      Size = 2
    end
    object QItensDevolucaoVAL_PIS: TFloatField
      FieldName = 'VAL_PIS'
    end
    object QItensDevolucaoVAL_CONFINS: TFloatField
      FieldName = 'VAL_CONFINS'
    end
    object QItensDevolucaoCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
      Required = True
    end
    object QItensDevolucaoDESC_INF_ADICIONAL: TStringField
      FieldName = 'DESC_INF_ADICIONAL'
      Size = 500
    end
    object QItensDevolucaoPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      Required = True
    end
  end
  object DSPItensDevolucao: TDataSetProvider
    DataSet = QItensDevolucao
    Left = 36
    Top = 64
  end
  object CDSItensDevolucao: TClientDataSet
    Active = True
    Aggregates = <>
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_NOTA_CAB'
        ParamType = ptUnknown
      end>
    ProviderName = 'DSPItensDevolucao'
    Left = 36
    Top = 118
    object CDSItensDevolucaoCOD_NOTA_ITEM: TIntegerField
      FieldName = 'COD_NOTA_ITEM'
      Required = True
    end
    object CDSItensDevolucaoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object CDSItensDevolucaoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object CDSItensDevolucaoVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
    end
    object CDSItensDevolucaoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object CDSItensDevolucaoQT_DEVOLUCAO: TFloatField
      FieldName = 'QT_DEVOLUCAO'
    end
    object CDSItensDevolucaoVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
    end
    object CDSItensDevolucaoVAL_IPI: TFloatField
      FieldName = 'VAL_IPI'
      Required = True
    end
    object CDSItensDevolucaoVAL_DESPESAS: TFloatField
      FieldName = 'VAL_DESPESAS'
      Required = True
    end
    object CDSItensDevolucaoVAL_ICMS_SUBST: TFloatField
      FieldName = 'VAL_ICMS_SUBST'
    end
    object CDSItensDevolucaoCOD_TRIBUTACAO: TIntegerField
      FieldName = 'COD_TRIBUTACAO'
      Required = True
    end
    object CDSItensDevolucaoVAL_FRETE: TFloatField
      FieldName = 'VAL_FRETE'
      Required = True
    end
    object CDSItensDevolucaoVAL_ICM_BASE: TFloatField
      FieldName = 'VAL_ICM_BASE'
      Required = True
    end
    object CDSItensDevolucaoVAL_ICM: TFloatField
      FieldName = 'VAL_ICM'
      Required = True
    end
    object CDSItensDevolucaoVAL_BASE_SUBST: TFloatField
      FieldName = 'VAL_BASE_SUBST'
    end
    object CDSItensDevolucaoVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
      Required = True
    end
    object CDSItensDevolucaoCOD_CST_PIS: TStringField
      FieldName = 'COD_CST_PIS'
      Size = 2
    end
    object CDSItensDevolucaoCOD_CST_COFINS: TStringField
      FieldName = 'COD_CST_COFINS'
      Size = 2
    end
    object CDSItensDevolucaoCOD_CST_IPI: TStringField
      FieldName = 'COD_CST_IPI'
      Size = 2
    end
    object CDSItensDevolucaoVAL_PIS: TFloatField
      FieldName = 'VAL_PIS'
    end
    object CDSItensDevolucaoVAL_CONFINS: TFloatField
      FieldName = 'VAL_CONFINS'
    end
    object CDSItensDevolucaoCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
      Required = True
    end
    object CDSItensDevolucaoDESC_INF_ADICIONAL: TStringField
      FieldName = 'DESC_INF_ADICIONAL'
      Size = 500
    end
    object CDSItensDevolucaoPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      Required = True
    end
  end
  object QNotaSaidaCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_NOTA_CAB."COD_NOTA_CAB",'
      '  TB_CADASTRO."NOME",'
      '  TB_NOTA_CAB."DT_RECEBIMENTO",'
      '  TB_NOTA_CAB."DT_EMISSAO",'
      '  TRUNC(TB_NOTA_CAB."NUM_NOTA") AS NUM_NOTA,'
      '  TB_NOTA_CAB."COD_FILIAL",'
      '  TB_NOTA_CAB."COD_TRANSPORTADOR",'
      '  TB_NOTA_CAB."COD_SERIE",'
      '  TB_NOTA_CAB."COD_SERIE_MODELO",'
      '  TB_NOTA_CAB."COD_CADASTRO",'
      '  TB_NOTA_CAB."COD_ESTADO",'
      '  TB_NOTA_CAB."IND_SITUACAO",'
      '  TB_NOTA_CAB."COD_ORDEM_CARREGAMENTO_CAB",'
      '  TB_NOTA_CAB."VAL_DESCONTO",'
      '  TB_NOTA_CAB."VAL_DESPESAS",'
      '  TB_NOTA_CAB."VAL_FRETE",'
      '  TB_NOTA_CAB."IND_ENTRADA_SAIDA",'
      '  TB_NOTA_CAB."COD_CADASTRO_PARCEIRO",'
      '  TB_NOTA_CAB."DESC_PLACA",'
      '  TB_NOTA_CAB."DESC_CHAVE_ACESSO",'
      '  TB_OPERACAO.IND_CONDICIONAL,'
      '  TB_OPERACAO.IND_VENDAS,'
      '  TB_VENDEDOR.NOME AS NOME_VENDEDOR,'
      '  TB_NOTA_CAB.IND_CONDICAO_PAGTO,'
      '  TB_NOTA_CAB.COD_OBRA,'
      '  TB_NOTA_CAB.COD_VENDEDOR,'
      '  TB_OBRA.DESC_OBRA,'
      '  TB_NOTA_CAB.COD_OPERACAO,'
      
        '  SUM(TB_NOTA_ITEM.VAL_TOTAL - nvl(TB_NOTA_ITEM.VAL_DESCONTO_RAT' +
        'EIO,0) - (nvl(TB_NOTA_ITEM.VAL_DESCONTO,0) * nvl(TB_NOTA_ITEM.QT' +
        '_QUANTIDADE,0))) AS SVAL_TOTAL'
      'FROM'
      '  TB_NOTA_CAB,'
      '  TB_NOTA_ITEM,'
      '  TB_CADASTRO,'
      '  TB_OPERACAO,'
      '  TB_VENDEDOR,'
      '  TB_OBRA'
      'WHERE'
      '  TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB (+)'
      '  AND'
      '  TB_NOTA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
      '  AND'
      '  TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      '  AND'
      '  TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR(+)'
      '  AND'
      '  TB_NOTA_CAB.COD_OBRA = TB_OBRA.COD_OBRA(+)'
      '  AND'
      '  TB_NOTA_CAB.DT_EMISSAO >= :DT_INICIAL'
      '  AND'
      '  TB_NOTA_CAB.DT_EMISSAO <= :DT_FINAL'
      '  AND'
      '  TB_NOTA_CAB.IND_ENTRADA_SAIDA = '#39'S'#39
      '  AND'
      '  (:CADASTRO IS NULL'
      '    OR'
      '    TB_NOTA_CAB.COD_CADASTRO = :CADASTRO)'
      '  AND'
      '  (:PRODUTO IS NULL'
      '    OR'
      '    TB_NOTA_ITEM.COD_PRODUTO = :PRODUTO)'
      '  AND'
      '  (:COD_FILIAL IS NULL'
      '    OR'
      '    TB_NOTA_CAB.COD_FILIAL = :COD_FILIAL)'
      '  AND'
      '  (:NUM_NOTA IS NULL'
      '    OR'
      '    TB_NOTA_CAB.NUM_NOTA = :NUM_NOTA)'
      '  AND'
      '  (:SITUACAO = 0'
      '    OR'
      '    TB_NOTA_CAB.IND_SITUACAO = :SITUACAO)'
      '  AND'
      '  (:COD_SERIE IS NULL'
      '    OR'
      '    TB_NOTA_CAB.COD_SERIE = :COD_SERIE)'
      '  AND'
      '  (:COD_SERIE_MODELO IS NULL'
      '    OR'
      '    TB_NOTA_CAB.COD_SERIE_MODELO = :COD_SERIE_MODELO)'
      '  AND'
      '  (:COD_VENDEDOR IS NULL'
      '    OR'
      '    TB_VENDEDOR.COD_VENDEDOR = :COD_VENDEDOR)'
      '  And'
      '  (:DESC_OBSERVACAO IS NULL'
      '   OR'
      '    TB_NOTA_CAB.DESC_OBS_CORPO_NOTA LIKE :DESC_OBSERVACAO)'
      '  And'
      '  (:NUM_NFSE IS NULL'
      '   OR'
      '    TB_NOTA_CAB.NUM_NFSE LIKE :NUM_NFSE)'
      '  AND'
      '  (:COD_OPERACAO IS NULL'
      '   OR'
      '    TB_NOTA_CAB.COD_OPERACAO = :COD_OPERACAO)'
      '  AND'
      '  (((SELECT IND_PAF_ECF FROM TB_PARAM_SISTEMA) = '#39'S'#39
      '    AND TB_NOTA_CAB.COD_SERIE_MODELO <> '#39'2D'#39')'
      '    OR ((SELECT IND_PAF_ECF FROM TB_PARAM_SISTEMA) <> '#39'S'#39'))'
      'GROUP BY'
      '  TB_NOTA_CAB."COD_NOTA_CAB",'
      '  TB_CADASTRO."NOME",'
      '  TB_NOTA_CAB."DT_RECEBIMENTO",'
      '  TB_NOTA_CAB."DT_EMISSAO",'
      '  TB_NOTA_CAB."NUM_NOTA",'
      '  TB_NOTA_CAB."COD_FILIAL",'
      '  TB_NOTA_CAB."COD_TRANSPORTADOR",'
      '  TB_NOTA_CAB."COD_SERIE",'
      '  TB_NOTA_CAB."COD_SERIE_MODELO",'
      '  TB_NOTA_CAB."COD_CADASTRO",'
      '  TB_NOTA_CAB."COD_ESTADO",'
      '  TB_NOTA_CAB."IND_SITUACAO",'
      '  TB_NOTA_CAB."COD_ORDEM_CARREGAMENTO_CAB",'
      '  TB_NOTA_CAB."VAL_DESCONTO",'
      '  TB_NOTA_CAB."VAL_DESPESAS",'
      '  TB_NOTA_CAB."VAL_FRETE",'
      '  TB_NOTA_CAB."IND_ENTRADA_SAIDA",'
      '  TB_NOTA_CAB."COD_CADASTRO_PARCEIRO",'
      '  TB_NOTA_CAB."DESC_PLACA",'
      '  TB_NOTA_CAB."DESC_CHAVE_ACESSO",'
      '  TB_OPERACAO.IND_CONDICIONAL,'
      '  TB_OPERACAO.IND_VENDAS,'
      '  TB_VENDEDOR.NOME,'
      '  TB_NOTA_CAB.IND_CONDICAO_PAGTO,'
      '  TB_NOTA_CAB.COD_OBRA,'
      '  TB_OBRA.DESC_OBRA,'
      '  TB_NOTA_CAB.COD_OPERACAO,'
      '  TB_NOTA_CAB.COD_VENDEDOR'
      'ORDER BY DT_RECEBIMENTO')
    Variables.Data = {
      030000000D0000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C000000000000000000000009000000
      3A434144415354524F030000000000000000000000090000003A4E554D5F4E4F
      5441030000000000000000000000090000003A534954554143414F0500000000
      000000000000000B0000003A434F445F46494C49414C03000000000000000000
      00000A0000003A434F445F534552494505000000000000000000000010000000
      3A444553435F4F42534552564143414F05000000000000000000000009000000
      3A4E554D5F4E4653450500000000000000000000000D0000003A434F445F5645
      4E4445444F520300000000000000000000000D0000003A434F445F4F50455241
      43414F030000000000000000000000110000003A434F445F53455249455F4D4F
      44454C4F050000000000000000000000080000003A50524F4455544F03000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001D0000000C000000434F445F4E4F54415F4341420100000000000400
      00004E4F4D450100000000000E00000044545F5245434542494D454E544F0100
      00000000080000004E554D5F4E4F544101000000000009000000434F445F5345
      5249450100000000000A000000434F445F46494C49414C010000000000110000
      00434F445F5452414E53504F525441444F520100000000000C000000434F445F
      434144415354524F0100000000000C000000494E445F534954554143414F0100
      000000001A000000434F445F4F5244454D5F434152524547414D454E544F5F43
      41420100000000000C00000056414C5F444553434F4E544F0100000000000A00
      0000434F445F45535441444F01000000000011000000494E445F454E54524144
      415F534149444101000000000015000000434F445F434144415354524F5F5041
      52434549524F0100000000000A000000444553435F504C414341010000000000
      0A000000494E445F56454E4441530100000000000A00000044545F454D495353
      414F0100000000000A0000005356414C5F544F54414C0100000000000D000000
      4E4F4D455F56454E4445444F520100000000000F000000494E445F434F4E4449
      43494F4E414C01000000000012000000494E445F434F4E444943414F5F504147
      544F01000000000011000000444553435F43484156455F41434553534F010000
      00000010000000434F445F53455249455F4D4F44454C4F010000000000080000
      00434F445F4F42524101000000000009000000444553435F4F42524101000000
      00000C000000434F445F4F5045524143414F0100000000000C00000056414C5F
      44455350455341530100000000000900000056414C5F46524554450100000000
      000C000000434F445F56454E4445444F52010000000000}
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAllFields]
    Session = DMOracle.DBCemapa
    AfterScroll = QNotaSaidaConsAfterScroll
    Left = 144
    Top = 17
    object QNotaSaidaConsCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QNotaSaidaConsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QNotaSaidaConsDT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
    end
    object QNotaSaidaConsCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Required = True
      Size = 3
    end
    object QNotaSaidaConsCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QNotaSaidaConsCOD_TRANSPORTADOR: TIntegerField
      FieldName = 'COD_TRANSPORTADOR'
    end
    object QNotaSaidaConsCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QNotaSaidaConsIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Required = True
      Size = 1
    end
    object QNotaSaidaConsCOD_ORDEM_CARREGAMENTO_CAB: TIntegerField
      FieldName = 'COD_ORDEM_CARREGAMENTO_CAB'
    end
    object QNotaSaidaConsVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
    end
    object QNotaSaidaConsCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Required = True
      Size = 2
    end
    object QNotaSaidaConsIND_ENTRADA_SAIDA: TStringField
      FieldName = 'IND_ENTRADA_SAIDA'
      Size = 1
    end
    object QNotaSaidaConsCOD_CADASTRO_PARCEIRO: TIntegerField
      FieldName = 'COD_CADASTRO_PARCEIRO'
    end
    object QNotaSaidaConsDESC_PLACA: TStringField
      FieldName = 'DESC_PLACA'
      Size = 8
    end
    object QNotaSaidaConsIND_VENDAS: TStringField
      FieldName = 'IND_VENDAS'
      Required = True
      Size = 1
    end
    object QNotaSaidaConsDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QNotaSaidaConsSVAL_TOTAL: TFloatField
      FieldName = 'SVAL_TOTAL'
      DisplayFormat = '#,##0.00'
    end
    object QNotaSaidaConsNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Required = True
      Size = 40
    end
    object QNotaSaidaConsIND_CONDICIONAL: TStringField
      FieldName = 'IND_CONDICIONAL'
      Required = True
      Size = 1
    end
    object QNotaSaidaConsIND_CONDICAO_PAGTO: TStringField
      FieldName = 'IND_CONDICAO_PAGTO'
      Required = True
      Size = 1
    end
    object QNotaSaidaConsdesc_pagamento: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_pagamento'
      Calculated = True
    end
    object QNotaSaidaConsDESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Size = 47
    end
    object QNotaSaidaConsNUM_NOTA: TFloatField
      FieldName = 'NUM_NOTA'
    end
    object QNotaSaidaConsCOD_SERIE_MODELO: TStringField
      FieldName = 'COD_SERIE_MODELO'
      Size = 2
    end
    object QNotaSaidaConsCOD_OBRA: TIntegerField
      FieldName = 'COD_OBRA'
    end
    object QNotaSaidaConsDESC_OBRA: TStringField
      FieldName = 'DESC_OBRA'
      Size = 60
    end
    object QNotaSaidaConsCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
      Required = True
    end
    object QNotaSaidaConsVAL_DESPESAS: TFloatField
      FieldName = 'VAL_DESPESAS'
      Required = True
    end
    object QNotaSaidaConsVAL_FRETE: TFloatField
      FieldName = 'VAL_FRETE'
      Required = True
    end
    object QNotaSaidaConsCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
  end
  object CDSItensTroca: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 65
    Data = {
      F50000009619E0BD01000000180000000A000000000003000000F5000B434F44
      5F50524F4455544F04000100000000000D434F445F4C4F54455F5449504F0400
      0100000000000D51545F5155414E54494441444508000400000000000C56414C
      5F554E49544152494F08000400000000000E434F445F5452494255544143414F
      04000100000000000C444553435F50524F4455544F0100490000000100055749
      44544802000200C8000956414C5F544F54414C08000400000000000E56414C5F
      49434D535F535542535408000400000000000C56414C5F444553434F4E544F08
      000400000000000756414C5F49504908000400000000000000}
    object CDSItensTrocaCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object CDSItensTrocaCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
    end
    object CDSItensTrocaQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object CDSItensTrocaVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object CDSItensTrocaCOD_TRIBUTACAO: TIntegerField
      FieldName = 'COD_TRIBUTACAO'
    end
    object CDSItensTrocaDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object CDSItensTrocaVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object CDSItensTrocaVAL_ICMS_SUBST: TFloatField
      FieldName = 'VAL_ICMS_SUBST'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object CDSItensTrocaVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object CDSItensTrocaVAL_IPI: TFloatField
      FieldName = 'VAL_IPI'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object QContasReceberCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  TB_CONTA_RECEBER_CAB'
      'WHERE'
      '  COD_NOTA_CAB = :COD_NOTA_CAB')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000003A00000015000000434F445F434F4E54415F524543454245525F4341
      420100000000000E000000434F445F46494E414C494441444501000000000011
      000000434F445F42414E434F5F4147454E4349410100000000000A000000434F
      445F46494C49414C0100000000000A0000004E554D5F544954554C4F01000000
      00000B0000004E554D5F50415243454C4101000000000013000000444553435F
      5449504F5F444F43554D454E544F0100000000000C00000044545F4D4F56494D
      454E544F0100000000000800000044545F42414958410100000000000D000000
      44545F56454E43494D454E544F0100000000000A00000044545F454D49535341
      4F0100000000001000000044545F4341504954414C495A4143414F0100000000
      000A00000056414C5F544954554C4F0100000000000B00000056414C5F4E4547
      4F43494F0100000000000A000000494E445F4143454954450100000000000C00
      0000494E445F534954554143414F0100000000000F000000444553435F4F4253
      4552564143414F0100000000000C000000434F445F4E4F54415F434142010000
      0000000C000000434F445F434144415354524F0100000000000C00000056414C
      5F4F524947494E414C01000000000010000000434F445F4E4F53534F5F4E554D
      45524F0100000000000900000056414C5F4A55524F5301000000000010000000
      434F445F444550415254414D454E544F01000000000011000000434F445F434F
      4E545241544F5F56454E440100000000000E000000444553435F4156414C4953
      5441310100000000000E000000444553435F4156414C49535441320100000000
      000C000000434F445F56454E4445444F520100000000000D000000504552435F
      434F4D495353414F0100000000001600000044545F4341504954414C495A4143
      414F5F4D4F4544410100000000000F00000056414C5F50524F4D4953534F5249
      4101000000000011000000494E445F454E564941444F5F42414E434F01000000
      000012000000434F445F434F4E54415F434F5252454E54450100000000001400
      0000434F445F4F5244454D5F434F4D5052415F43414201000000000011000000
      434F445F4F4252415F434F4E545241544F01000000000011000000494E445F45
      4D495449444F5F4341524E4501000000000015000000434F445F4F4252415F43
      4F4E545241544F5F4D4F56010000000000060000004E554D5F4F530100000000
      0015000000434F445F4F5244454D5F5345525649434F5F434142010000000000
      08000000444553435F4F42530100000000000D000000434F445F56454E444544
      4F52310100000000000E000000504552435F434F4D495353414F310100000000
      000F000000434F445F4F464943494E415F4341420100000000000B000000434F
      445F424F524445524F01000000000008000000434F445F4F4252410100000000
      0014000000434F445F434F4E545241544F5F4C4F4341444F520100000000000B
      000000434F445F5553554152494F0100000000000A00000044545F5553554152
      494F01000000000019000000434F445F4F4252415F434F4E545241544F5F4144
      495449564F01000000000010000000434F445F56414C455F50524F4455544F01
      000000000010000000494E445F415649534F5F424F4C45544F0100000000000E
      000000494E445F50524F5445535441444F0100000000000F000000444553435F
      434F5049415F434F4C410100000000000B000000494E445F5745425F41504901
      000000000009000000444553435F545849440100000000001400000044455343
      5F4C494E48415F44494749544156454C01000000000012000000444553435F43
      4F4449474F5F4241525241530100000000000900000049445F424F4C45544F01
      000000000016000000504552435F444553435F414449414E54414D454E544F01
      0000000000}
    Session = DMOracle.DBCemapa
    Left = 264
    Top = 16
    object QContasReceberConsCOD_CONTA_RECEBER_CAB: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_CAB'
      Required = True
    end
    object QContasReceberConsCOD_FINALIDADE: TIntegerField
      FieldName = 'COD_FINALIDADE'
    end
    object QContasReceberConsCOD_BANCO_AGENCIA: TIntegerField
      FieldName = 'COD_BANCO_AGENCIA'
    end
    object QContasReceberConsCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QContasReceberConsNUM_TITULO: TFloatField
      FieldName = 'NUM_TITULO'
    end
    object QContasReceberConsNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object QContasReceberConsDESC_TIPO_DOCUMENTO: TStringField
      FieldName = 'DESC_TIPO_DOCUMENTO'
      Size = 3
    end
    object QContasReceberConsDT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
    end
    object QContasReceberConsDT_BAIXA: TDateTimeField
      FieldName = 'DT_BAIXA'
    end
    object QContasReceberConsDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
      Required = True
    end
    object QContasReceberConsDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QContasReceberConsDT_CAPITALIZACAO: TDateTimeField
      FieldName = 'DT_CAPITALIZACAO'
    end
    object QContasReceberConsVAL_TITULO: TFloatField
      FieldName = 'VAL_TITULO'
    end
    object QContasReceberConsVAL_NEGOCIO: TFloatField
      FieldName = 'VAL_NEGOCIO'
    end
    object QContasReceberConsIND_ACEITE: TStringField
      FieldName = 'IND_ACEITE'
      Size = 3
    end
    object QContasReceberConsIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 13
    end
    object QContasReceberConsDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 50
    end
    object QContasReceberConsCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QContasReceberConsCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QContasReceberConsVAL_ORIGINAL: TFloatField
      FieldName = 'VAL_ORIGINAL'
    end
    object QContasReceberConsCOD_NOSSO_NUMERO: TStringField
      FieldName = 'COD_NOSSO_NUMERO'
      Size = 17
    end
    object QContasReceberConsVAL_JUROS: TFloatField
      FieldName = 'VAL_JUROS'
    end
    object QContasReceberConsCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
      Required = True
    end
    object QContasReceberConsCOD_CONTRATO_VEND: TIntegerField
      FieldName = 'COD_CONTRATO_VEND'
    end
    object QContasReceberConsDESC_AVALISTA1: TStringField
      FieldName = 'DESC_AVALISTA1'
      Size = 40
    end
    object QContasReceberConsDESC_AVALISTA2: TStringField
      FieldName = 'DESC_AVALISTA2'
      Size = 40
    end
    object QContasReceberConsCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QContasReceberConsPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      Required = True
    end
    object QContasReceberConsDT_CAPITALIZACAO_MOEDA: TDateTimeField
      FieldName = 'DT_CAPITALIZACAO_MOEDA'
    end
    object QContasReceberConsVAL_PROMISSORIA: TFloatField
      FieldName = 'VAL_PROMISSORIA'
    end
    object QContasReceberConsIND_ENVIADO_BANCO: TStringField
      FieldName = 'IND_ENVIADO_BANCO'
      Size = 3
    end
    object QContasReceberConsCOD_CONTA_CORRENTE: TIntegerField
      FieldName = 'COD_CONTA_CORRENTE'
    end
    object QContasReceberConsCOD_ORDEM_COMPRA_CAB: TIntegerField
      FieldName = 'COD_ORDEM_COMPRA_CAB'
    end
    object QContasReceberConsCOD_OBRA_CONTRATO: TIntegerField
      FieldName = 'COD_OBRA_CONTRATO'
    end
    object QContasReceberConsIND_EMITIDO_CARNE: TStringField
      FieldName = 'IND_EMITIDO_CARNE'
      Size = 3
    end
    object QContasReceberConsCOD_OBRA_CONTRATO_MOV: TIntegerField
      FieldName = 'COD_OBRA_CONTRATO_MOV'
    end
    object QContasReceberConsNUM_OS: TIntegerField
      FieldName = 'NUM_OS'
    end
    object QContasReceberConsCOD_ORDEM_SERVICO_CAB: TIntegerField
      FieldName = 'COD_ORDEM_SERVICO_CAB'
    end
    object QContasReceberConsDESC_OBS: TStringField
      FieldName = 'DESC_OBS'
      Size = 1000
    end
    object QContasReceberConsCOD_VENDEDOR1: TIntegerField
      FieldName = 'COD_VENDEDOR1'
    end
    object QContasReceberConsPERC_COMISSAO1: TFloatField
      FieldName = 'PERC_COMISSAO1'
      Required = True
    end
    object QContasReceberConsCOD_OFICINA_CAB: TIntegerField
      FieldName = 'COD_OFICINA_CAB'
    end
    object QContasReceberConsCOD_BORDERO: TIntegerField
      FieldName = 'COD_BORDERO'
    end
    object QContasReceberConsCOD_OBRA: TIntegerField
      FieldName = 'COD_OBRA'
    end
    object QContasReceberConsCOD_CONTRATO_LOCADOR: TIntegerField
      FieldName = 'COD_CONTRATO_LOCADOR'
    end
    object QContasReceberConsCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QContasReceberConsDT_USUARIO: TDateTimeField
      FieldName = 'DT_USUARIO'
    end
  end
  object QContasReceberMovCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  TB_CONTA_RECEBER_MOV'
      'WHERE'
      '  IND_TIPO_MOVIMENTO <> '#39'PRINCIPAL'#39
      '  AND'
      '  COD_CONTA_RECEBER_CAB = :COD_CONTA_RECEBER_CAB')
    Variables.Data = {
      0300000001000000160000003A434F445F434F4E54415F524543454245525F43
      4142030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001100000015000000434F445F434F4E54415F524543454245525F4D4F
      5601000000000015000000434F445F434F4E54415F524543454245525F434142
      0100000000000C00000044545F4D4F56494D454E544F0100000000000D000000
      56414C5F4D4F56494D454E544F0100000000000F000000444553435F4F425345
      52564143414F0100000000000B000000434F445F5553554152494F0100000000
      000A00000044545F5553554152494F01000000000012000000494E445F544950
      4F5F4D4F56494D454E544F01000000000011000000434F445F42434F5F4D4F56
      494D454E544F0100000000000D000000434F445F43414958415F4D4F56010000
      00000018000000434F445F4C414E43544F5F434F4E544142494C5F4352454401
      000000000017000000434F445F4C414E43544F5F434F4E544142494C5F444542
      0100000000000C000000434F445F4E4F54415F4341420100000000000D000000
      494E445F4445564F4C5543414F01000000000013000000494E445F464F524D41
      5F504147414D454E544F01000000000009000000494E445F54524F4341010000
      00000010000000434F445F414449414E54414D454E544F010000000000}
    Session = DMOracle.DBCemapa
    Left = 264
    Top = 65
    object QContasReceberMovConsCOD_CONTA_RECEBER_MOV: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_MOV'
      Required = True
    end
    object QContasReceberMovConsCOD_CONTA_RECEBER_CAB: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_CAB'
    end
    object QContasReceberMovConsDT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
    end
    object QContasReceberMovConsVAL_MOVIMENTO: TFloatField
      FieldName = 'VAL_MOVIMENTO'
    end
    object QContasReceberMovConsDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 50
    end
    object QContasReceberMovConsCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QContasReceberMovConsDT_USUARIO: TDateTimeField
      FieldName = 'DT_USUARIO'
    end
    object QContasReceberMovConsIND_TIPO_MOVIMENTO: TStringField
      FieldName = 'IND_TIPO_MOVIMENTO'
      Required = True
    end
    object QContasReceberMovConsCOD_BCO_MOVIMENTO: TIntegerField
      FieldName = 'COD_BCO_MOVIMENTO'
    end
    object QContasReceberMovConsCOD_CAIXA_MOV: TIntegerField
      FieldName = 'COD_CAIXA_MOV'
    end
    object QContasReceberMovConsCOD_LANCTO_CONTABIL_CRED: TIntegerField
      FieldName = 'COD_LANCTO_CONTABIL_CRED'
    end
    object QContasReceberMovConsCOD_LANCTO_CONTABIL_DEB: TIntegerField
      FieldName = 'COD_LANCTO_CONTABIL_DEB'
    end
    object QContasReceberMovConsCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QContasReceberMovConsIND_DEVOLUCAO: TStringField
      FieldName = 'IND_DEVOLUCAO'
      Size = 3
    end
    object QContasReceberMovConsIND_FORMA_PAGAMENTO: TStringField
      FieldName = 'IND_FORMA_PAGAMENTO'
      Size = 8
    end
    object QContasReceberMovConsIND_TROCA: TStringField
      FieldName = 'IND_TROCA'
      Size = 3
    end
    object QContasReceberMovConsCOD_ADIANTAMENTO: TIntegerField
      FieldName = 'COD_ADIANTAMENTO'
    end
  end
  object QValeProdutoItem: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  ROWID, TB_VALE_PRODUTO_ITEM.*'
      'FROM'
      '  TB_VALE_PRODUTO_ITEM'
      ''
      'where cod_vale_produto = :cod_vale_produto')
    Variables.Data = {
      0300000001000000110000003A434F445F56414C455F50524F4455544F030000
      000000000000000000}
    SequenceField.Field = 'COD_VALE_PRODUTO_ITEM'
    SequenceField.Sequence = 'SQ_VALE_PRODUTO_ITEM'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000040000000D000000434F445F4E4F54415F4954454D01000000000017
      00000051545F5155414E5449444144455F4445564F4C56494441010000000000
      15000000434F445F56414C455F50524F4455544F5F4954454D01000000000010
      000000434F445F56414C455F50524F4455544F010000000000}
    Master = QValeProduto
    MasterFields = 'COD_VALE_PRODUTO'
    DetailFields = 'COD_VALE_PRODUTO'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 138
    Top = 120
    object QValeProdutoItemCOD_NOTA_ITEM: TIntegerField
      FieldName = 'COD_NOTA_ITEM'
      Required = True
    end
    object QValeProdutoItemQT_QUANTIDADE_DEVOLVIDA: TFloatField
      FieldName = 'QT_QUANTIDADE_DEVOLVIDA'
      Required = True
    end
    object QValeProdutoItemCOD_VALE_PRODUTO_ITEM: TIntegerField
      FieldName = 'COD_VALE_PRODUTO_ITEM'
      Required = True
    end
    object QValeProdutoItemCOD_VALE_PRODUTO: TIntegerField
      FieldName = 'COD_VALE_PRODUTO'
      Required = True
    end
  end
  object QRValeProduto: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  F.COD_FILIAL,'
      '  F.DESC_FILIAL,'
      '  F.NUM_CGC CNPJ_FILIAL,'
      '  F.DESC_ENDERECO || '#39', '#39' || F.NUM_ENDERECO ENDERECO_FILIAL, '
      '  F.DESC_BAIRRO BAIRRO_FILIAL,  '
      
        '  CID_FILIAL.DESC_CIDADE || '#39' - '#39' || F.COD_ESTADO AS CIDADE_ESTA' +
        'DO_FILIAL,  '
      '  F.DESC_TELEFONE FONE_FILIAL,'
      '  F.DESC_ENDERECO || '#39', '#39' || F.NUM_ENDERECO || '#39' BAIRRO: '#39' ||  '
      
        '  F.DESC_BAIRRO || '#39' CIDADE: '#39' || CID_FILIAL.DESC_CIDADE || '#39' - ' +
        #39' || F.COD_ESTADO || '#39' FONE: '#39' ||  '
      '  F.DESC_TELEFONE AS DADOS_FILIAL,'
      '  C.COD_CADASTRO || '#39'-'#39' || C.NOME COD_NOME_CADASTRO,'
      '  C.COD_CADASTRO,'
      '  C.NOME NOME_CADASTRO,'
      '  C.NUM_CGC_CPF CPF_CNPJ_CADASTRO,'
      '  C.DESC_ENDERECO ENDERECO_CADASTRO,'
      '  C.DESC_BAIRRO BAIRRO_CADASTRO,'
      
        '  CID_CAD.DESC_CIDADE || '#39' - '#39' || C.COD_ESTADO AS CIDADE_ESTADO_' +
        'CADASTRO,'
      '  C.DESC_CEP CEP_CADASTRO,'
      '  C.DESC_TELEFONE FONE_CADASTRO,'
      
        '  C.DESC_ENDERECO || '#39' BAIRRO: '#39' || C.DESC_BAIRRO || '#39' CIDADE: '#39 +
        ' ||'
      
        '  CID_CAD.DESC_CIDADE || '#39' - '#39' || C.COD_ESTADO || '#39' CEP: '#39' || C.' +
        'DESC_CEP || '#39' FONE: '#39' ||'
      '  C.DESC_TELEFONE AS DADOS_CADASTRO,'
      '  VP.COD_VALE_PRODUTO,'
      '  VP.VAL_VALE_PRODUTO,'
      '  VP.DT_EMISSAO,'
      '  VP.DESC_TIPO_VALE,'
      '  ND.NUM_NOTA NUM_NOTA_DEV,'
      '  N.NUM_NOTA NUM_NOTA,'
      '  VP.IND_FORMA_PGTO_VALE_PRESENTE,'
      '  CR.DT_VENCIMENTO'
      'FROM'
      '  TB_VALE_PRODUTO VP'
      'LEFT JOIN'
      '  TB_NOTA_CAB N'
      'ON'
      '  N.COD_NOTA_CAB = VP.COD_NOTA_CAB'
      'LEFT JOIN '
      '  TB_NOTA_CAB ND'
      'ON'
      '  ND.COD_NOTA_CAB = VP.COD_NOTA_CAB_DEV'
      'LEFT JOIN'
      '  TB_NOTA_CAB NT'
      'ON'
      '  NT.COD_NOTA_CAB = VP.COD_NOTA_CAB_TROCA'
      'LEFT JOIN'
      '  TB_FILIAL F'
      'ON'
      '  VP.COD_FILIAL = F.COD_FILIAL'
      'LEFT JOIN'
      '  TB_CADASTRO C'
      'ON'
      
        '  (VP.DESC_TIPO_VALE = '#39'VALE-PRESENTE'#39' AND C.COD_CADASTRO = VP.C' +
        'OD_CADASTRO) OR'
      
        '  (VP.DESC_TIPO_VALE = '#39'VALE-COMPRAS'#39' AND C.COD_CADASTRO = ND.CO' +
        'D_CADASTRO)'
      'LEFT JOIN'
      '  TB_CIDADE CID_FILIAL'
      'ON'
      '  CID_FILIAL.COD_CIDADE = F.COD_CIDADE'
      'LEFT JOIN'
      '  TB_CIDADE CID_CAD'
      'ON'
      '  CID_CAD.COD_CIDADE = C.COD_CIDADE'
      'LEFT JOIN'
      '  TB_CONTA_RECEBER_CAB CR'
      'ON'
      '  CR.COD_VALE_PRODUTO = VP.COD_VALE_PRODUTO'
      'WHERE'
      '  VP.COD_VALE_PRODUTO = :COD_VALE_PRODUTO'
      '  '
      '  '
      '  ')
    Variables.Data = {
      0300000001000000110000003A434F445F56414C455F50524F4455544F030000
      000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001A0000001000000056414C5F56414C455F50524F4455544F01000000
      00000B000000464F4E455F46494C49414C01000000000011000000454E444552
      45434F5F434144415354524F0100000000000C0000004345505F434144415354
      524F0100000000000D000000464F4E455F434144415354524F0100000000000A
      00000044545F454D495353414F0100000000000B000000444553435F46494C49
      414C0100000000000B000000434E504A5F46494C49414C0100000000000F0000
      00454E44455245434F5F46494C49414C0100000000000D00000042414952524F
      5F46494C49414C010000000000140000004349444144455F45535441444F5F46
      494C49414C0100000000000D0000004E4F4D455F434144415354524F01000000
      0000110000004350465F434E504A5F434144415354524F0100000000000F0000
      0042414952524F5F434144415354524F01000000000016000000434944414445
      5F45535441444F5F434144415354524F01000000000010000000434F445F5641
      4C455F50524F4455544F0100000000000A000000434F445F46494C49414C0100
      000000000C0000004441444F535F46494C49414C0100000000000E0000004441
      444F535F434144415354524F010000000000080000004E554D5F4E4F54410100
      000000000C000000434F445F434144415354524F0100000000000C0000004E55
      4D5F4E4F54415F4445560100000000000E000000444553435F5449504F5F5641
      4C450100000000001C000000494E445F464F524D415F5047544F5F56414C455F
      50524553454E54450100000000000D00000044545F56454E43494D454E544F01
      000000000011000000434F445F4E4F4D455F434144415354524F010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 267
    Top = 118
    object QRValeProdutoFONE_FILIAL: TStringField
      FieldName = 'FONE_FILIAL'
      Size = 12
    end
    object QRValeProdutoENDERECO_CADASTRO: TStringField
      FieldName = 'ENDERECO_CADASTRO'
      Size = 60
    end
    object QRValeProdutoCEP_CADASTRO: TStringField
      FieldName = 'CEP_CADASTRO'
      Size = 9
    end
    object QRValeProdutoFONE_CADASTRO: TStringField
      FieldName = 'FONE_CADASTRO'
      Size = 12
    end
    object QRValeProdutoVAL_VALE_PRODUTO: TFloatField
      FieldName = 'VAL_VALE_PRODUTO'
      DisplayFormat = '#,##0.00'
    end
    object QRValeProdutoCIDADE_ESTADO_FILIAL: TStringField
      FieldName = 'CIDADE_ESTADO_FILIAL'
      Size = 55
    end
    object QRValeProdutoCIDADE_ESTADO_CADASTRO: TStringField
      FieldName = 'CIDADE_ESTADO_CADASTRO'
      Size = 55
    end
    object QRValeProdutoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QRValeProdutoDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QRValeProdutoCNPJ_FILIAL: TStringField
      FieldName = 'CNPJ_FILIAL'
      Size = 18
    end
    object QRValeProdutoENDERECO_FILIAL: TStringField
      FieldName = 'ENDERECO_FILIAL'
      Size = 72
    end
    object QRValeProdutoBAIRRO_FILIAL: TStringField
      FieldName = 'BAIRRO_FILIAL'
      Size = 60
    end
    object QRValeProdutoNOME_CADASTRO: TStringField
      FieldName = 'NOME_CADASTRO'
      Size = 60
    end
    object QRValeProdutoCPF_CNPJ_CADASTRO: TStringField
      FieldName = 'CPF_CNPJ_CADASTRO'
      Size = 18
    end
    object QRValeProdutoBAIRRO_CADASTRO: TStringField
      FieldName = 'BAIRRO_CADASTRO'
      Size = 60
    end
    object QRValeProdutoCOD_VALE_PRODUTO: TIntegerField
      FieldName = 'COD_VALE_PRODUTO'
      Required = True
    end
    object QRValeProdutoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QRValeProdutoDADOS_FILIAL: TStringField
      FieldName = 'DADOS_FILIAL'
      Size = 224
    end
    object QRValeProdutoDADOS_CADASTRO: TStringField
      FieldName = 'DADOS_CADASTRO'
      Size = 230
    end
    object QRValeProdutoNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
    end
    object QRValeProdutoCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object QRValeProdutoNUM_NOTA_DEV: TIntegerField
      FieldName = 'NUM_NOTA_DEV'
    end
    object QRValeProdutoDESC_TIPO_VALE: TStringField
      FieldName = 'DESC_TIPO_VALE'
    end
    object QRValeProdutoIND_FORMA_PGTO_VALE_PRESENTE: TIntegerField
      FieldName = 'IND_FORMA_PGTO_VALE_PRESENTE'
    end
    object QRValeProdutoDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object QRValeProdutoCOD_NOME_CADASTRO: TStringField
      FieldName = 'COD_NOME_CADASTRO'
      Size = 101
    end
  end
  object QValeProdutoCons: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  VP.COD_FILIAL,'
      '  C.COD_CADASTRO,'
      '  C.NOME,'
      '  VP.COD_VALE_PRODUTO,'
      '  VP.VAL_VALE_PRODUTO,'
      '  VP.DT_EMISSAO,'
      '  VP.COD_NOTA_CAB_TROCA,'
      '  CASE '
      
        '    WHEN (N.COD_SERIE_MODELO = '#39'55'#39' OR N.COD_SERIE_MODELO = '#39'65'#39 +
        ') THEN '
      
        '      DECODE(NVL(NFEDEV.DESC_RETORNO_PROCESSAMENTO,'#39'0'#39'), '#39'100'#39','#39 +
        'S'#39','#39'N'#39')'
      '    ELSE'
      '      DECODE(ND.IND_SITUACAO,'#39'2'#39','#39'S'#39','#39'N'#39')'
      '  END IND_VALIDO,'
      '  CASE '
      
        '    WHEN (N.COD_SERIE_MODELO = '#39'55'#39' OR N.COD_SERIE_MODELO = '#39'65'#39 +
        ') THEN '
      
        '      DECODE(NVL(NFEDEV.DESC_RETORNO_CANCELAMENTO,'#39'0'#39'), '#39'101'#39','#39'S' +
        #39','#39'N'#39')'
      '    ELSE'
      '      DECODE(ND.IND_SITUACAO,'#39'3'#39','#39'S'#39','#39'N'#39')'
      '  END IND_CANCELADO,'
      '  CASE '
      
        '    WHEN (NT.COD_SERIE_MODELO = '#39'55'#39' OR NT.COD_SERIE_MODELO = '#39'6' +
        '5'#39') THEN '
      '      CASE'
      #9' WHEN (NVL(NFET.DESC_RETORNO_PROCESSAMENTO,'#39'0'#39') = '#39'100'#39') OR'
      #9'      (NVL(NFET.DESC_RETORNO_PROCESSAMENTO,'#39'0'#39') = '#39'149'#39') OR'
      
        '             (NVL(NFET.DESC_RETORNO_PROCESSAMENTO,'#39'0'#39') = '#39'150'#39') ' +
        'THEN '#39'S'#39' ELSE '#39'N'#39' '
      '        END'
      '    ELSE'
      '      DECODE(NT.IND_SITUACAO,'#39'2'#39','#39'S'#39','#39'N'#39')'
      '  END IND_UTILIZADO,'
      '  VP.COD_NOTA_CAB,'
      '  VP.COD_NOTA_CAB_DEV,'
      '  VP.IND_FORMA_PGTO_VALE_PRESENTE,'
      '  VP.DESC_TIPO_VALE,'
      '  VP.IND_SITUACAO_VALE_PRESENTE'
      'FROM'
      '  TB_VALE_PRODUTO VP'
      'LEFT JOIN'
      '  TB_NOTA_CAB N'
      'ON'
      '  N.COD_NOTA_CAB = VP.COD_NOTA_CAB'
      'LEFT JOIN '
      '  TB_NOTA_CAB ND'
      'ON'
      '  ND.COD_NOTA_CAB = VP.COD_NOTA_CAB_DEV'
      'LEFT JOIN '
      '  TB_NF_ELETRONICA NFEDEV'
      'ON'
      '  NFEDEV.COD_NOTA_CAB = VP.COD_NOTA_CAB_DEV'
      'LEFT JOIN'
      '  TB_NOTA_CAB NT'
      'ON'
      '  NT.COD_NOTA_CAB = VP.COD_NOTA_CAB_TROCA'
      'LEFT JOIN'
      '  TB_NF_ELETRONICA NFET'
      'ON'
      '  NFET.COD_NOTA_CAB = NT.COD_NOTA_CAB'
      'LEFT JOIN'
      '  TB_CADASTRO C'
      'ON'
      
        '  (VP.DESC_TIPO_VALE = '#39'VALE-PRESENTE'#39' AND C.COD_CADASTRO = VP.C' +
        'OD_CADASTRO) OR'
      
        '  (VP.DESC_TIPO_VALE = '#39'VALE-COMPRAS'#39' AND C.COD_CADASTRO = ND.CO' +
        'D_CADASTRO)'
      'WHERE'
      '  (:COD_CADASTRO IS NULL '
      '    OR ND.COD_CADASTRO = :COD_CADASTRO '
      '    OR VP.COD_CADASTRO = :COD_CADASTRO)'
      '  AND'
      '  (:DT_INICIAL IS NULL OR'
      '   VP.DT_EMISSAO >= :DT_INICIAL)'
      '  AND'
      '  (:DT_FINAL IS NULL OR'
      '   VP.DT_EMISSAO <= :DT_FINAL)'
      '  AND'
      '  (:COD_NOTA_CAB_TROCA IS NULL OR'
      '   VP.COD_NOTA_CAB_TROCA = :COD_NOTA_CAB_TROCA)'
      '  AND'
      '  (:COD_NOTA_CAB IS NULL OR'
      '   VP.COD_NOTA_CAB = :COD_NOTA_CAB)'
      '  AND'
      '  (:NUM_NOTA IS NULL OR'
      '   N.NUM_NOTA = :NUM_NOTA)'
      '  AND'
      '  (:IND_VALIDO IS NULL OR'
      
        '   (:IND_VALIDO = '#39'S'#39' AND ((NVL(NFEDEV.DESC_RETORNO_PROCESSAMENT' +
        'O,'#39'0'#39') = '#39'100'#39') AND '
      
        #9#9#9'       (N.COD_SERIE_MODELO = '#39'55'#39' OR N.COD_SERIE_MODELO = '#39'65' +
        #39')) OR'
      
        #9#9#9#9'(N.COD_SERIE_MODELO <> '#39'55'#39' AND N.COD_SERIE_MODELO <> '#39'65'#39' A' +
        'ND N.IND_SITUACAO = '#39'2'#39')))'
      '  AND'
      '  (:COD_VALE_PRODUTO IS NULL OR'
      '   VP.COD_VALE_PRODUTO = :COD_VALE_PRODUTO)'
      '  AND'
      '  (:TIPO_VALE IS NULL OR'
      '   VP.DESC_TIPO_VALE = :TIPO_VALE)'
      '  AND'
      '  (:IND_SITUACAO IS NULL OR'
      '   VP.IND_SITUACAO_VALE_PRESENTE = :IND_SITUACAO)'
      '  AND'
      '  VP.VAL_VALE_PRODUTO > 0'
      'ORDER BY VP.COD_VALE_PRODUTO')
    Variables.Data = {
      030000000A0000000D0000003A434F445F434144415354524F03000000000000
      00000000000B0000003A44545F494E494349414C0C0000000000000000000000
      090000003A44545F46494E414C0C0000000000000000000000130000003A434F
      445F4E4F54415F4341425F54524F43410300000000000000000000000D000000
      3A434F445F4E4F54415F4341420300000000000000000000000B0000003A494E
      445F56414C49444F050000000000000000000000110000003A434F445F56414C
      455F50524F4455544F050000000000000000000000090000003A4E554D5F4E4F
      54410300000000000000000000000A0000003A5449504F5F56414C4505000000
      00000000000000000D0000003A494E445F534954554143414F05000000000000
      0000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000F0000001000000056414C5F56414C455F50524F4455544F01000000
      00000A00000044545F454D495353414F0100000000000A000000434F445F4649
      4C49414C0100000000000C000000434F445F434144415354524F010000000000
      040000004E4F4D4501000000000010000000434F445F56414C455F50524F4455
      544F0100000000000D000000494E445F5554494C495A41444F01000000000012
      000000434F445F4E4F54415F4341425F54524F43410100000000000C00000043
      4F445F4E4F54415F43414201000000000010000000434F445F4E4F54415F4341
      425F4445560100000000000A000000494E445F56414C49444F0100000000000D
      000000494E445F43414E43454C41444F0100000000001C000000494E445F464F
      524D415F5047544F5F56414C455F50524553454E54450100000000000E000000
      444553435F5449504F5F56414C450100000000001A000000494E445F53495455
      4143414F5F56414C455F50524553454E5445010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 258
    Top = 173
    object QValeProdutoConsCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QValeProdutoConsCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object QValeProdutoConsNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QValeProdutoConsVAL_VALE_PRODUTO: TFloatField
      FieldName = 'VAL_VALE_PRODUTO'
      DisplayFormat = '#,##0.00'
    end
    object QValeProdutoConsDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QValeProdutoConsCOD_VALE_PRODUTO: TIntegerField
      FieldName = 'COD_VALE_PRODUTO'
      Required = True
    end
    object QValeProdutoConsIND_UTILIZADO: TStringField
      FieldName = 'IND_UTILIZADO'
      Size = 1
    end
    object QValeProdutoConsCOD_NOTA_CAB_TROCA: TIntegerField
      FieldName = 'COD_NOTA_CAB_TROCA'
    end
    object QValeProdutoConsCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QValeProdutoConsCOD_NOTA_CAB_DEV: TIntegerField
      FieldName = 'COD_NOTA_CAB_DEV'
      Required = True
    end
    object QValeProdutoConsIND_VALIDO: TStringField
      FieldName = 'IND_VALIDO'
      Size = 1
    end
    object QValeProdutoConsIND_CANCELADO: TStringField
      FieldName = 'IND_CANCELADO'
      Size = 1
    end
    object QValeProdutoConsIND_FORMA_PGTO_VALE_PRESENTE: TIntegerField
      FieldName = 'IND_FORMA_PGTO_VALE_PRESENTE'
    end
    object QValeProdutoConsDESC_TIPO_VALE: TStringField
      FieldName = 'DESC_TIPO_VALE'
    end
    object QValeProdutoConsIND_SITUACAO_VALE_PRESENTE: TIntegerField
      FieldName = 'IND_SITUACAO_VALE_PRESENTE'
    end
  end
  object QCaixa: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  COD_CAIXA_MOV,'
      '  COD_USUARIO,'
      '  COD_FILIAL,'
      '  COD_DEPARTAMENTO,'
      '  COD_HISTORICO,'
      '  DT_MOVIMENTO,'
      '  VAL_MOVIMENTO,'
      '  DESC_HORARIO,'
      '  NUM_DOCUMENTO,'
      '  COD_CADASTRO,'
      '  COD_NOTA_CAB,'
      '  COD_CONTA_RECEBER_CAB,'
      '  COD_CONTA_PAGAR_CAB,'
      '  DT_USUARIO,'
      '  DESC_COMPLEMENTO,'
      '  COD_PEDIDO_CAB,'
      '  COD_OFICINA_CAB,'
      '  COD_VALE_PRODUTO'
      'FROM'
      '  TB_CAIXA_MOV'
      'where cod_VALE_PRODUTO = :COD_VALE_PRODUTO')
    Variables.Data = {
      0300000001000000110000003A434F445F56414C455F50524F4455544F030000
      000000000000000000}
    SequenceField.Field = 'COD_CAIXA_MOV'
    SequenceField.Sequence = 'SQCAIXA_MOV'
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      04000000120000000D000000434F445F43414958415F4D4F560100000000000B
      000000434F445F5553554152494F0100000000000A000000434F445F46494C49
      414C01000000000010000000434F445F444550415254414D454E544F01000000
      00000D000000434F445F484953544F5249434F0100000000000C00000044545F
      4D4F56494D454E544F0100000000000D00000056414C5F4D4F56494D454E544F
      0100000000000C000000444553435F484F524152494F0100000000000D000000
      4E554D5F444F43554D454E544F0100000000000C000000434F445F4341444153
      54524F0100000000000C000000434F445F4E4F54415F43414201000000000015
      000000434F445F434F4E54415F524543454245525F4341420100000000001300
      0000434F445F434F4E54415F50414741525F4341420100000000000A00000044
      545F5553554152494F01000000000010000000444553435F434F4D504C454D45
      4E544F0100000000000E000000434F445F50454449444F5F4341420100000000
      000F000000434F445F4F464943494E415F43414201000000000010000000434F
      445F56414C455F50524F4455544F010000000000}
    Master = QValeProduto
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 381
    Top = 16
    object QCaixaCOD_CAIXA_MOV: TIntegerField
      FieldName = 'COD_CAIXA_MOV'
      Required = True
    end
    object QCaixaCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QCaixaCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QCaixaCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
      Required = True
    end
    object QCaixaCOD_HISTORICO: TIntegerField
      FieldName = 'COD_HISTORICO'
      Required = True
    end
    object QCaixaDT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Required = True
    end
    object QCaixaVAL_MOVIMENTO: TFloatField
      FieldName = 'VAL_MOVIMENTO'
      Required = True
    end
    object QCaixaDESC_HORARIO: TStringField
      FieldName = 'DESC_HORARIO'
      Size = 8
    end
    object QCaixaCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object QCaixaCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QCaixaCOD_CONTA_RECEBER_CAB: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_CAB'
    end
    object QCaixaCOD_CONTA_PAGAR_CAB: TIntegerField
      FieldName = 'COD_CONTA_PAGAR_CAB'
    end
    object QCaixaDT_USUARIO: TDateTimeField
      FieldName = 'DT_USUARIO'
      Required = True
    end
    object QCaixaDESC_COMPLEMENTO: TStringField
      FieldName = 'DESC_COMPLEMENTO'
      Size = 50
    end
    object QCaixaCOD_PEDIDO_CAB: TIntegerField
      FieldName = 'COD_PEDIDO_CAB'
    end
    object QCaixaCOD_OFICINA_CAB: TIntegerField
      FieldName = 'COD_OFICINA_CAB'
    end
    object QCaixaNUM_DOCUMENTO: TFloatField
      FieldName = 'NUM_DOCUMENTO'
    end
    object QCaixaCOD_VALE_PRODUTO: TIntegerField
      FieldName = 'COD_VALE_PRODUTO'
    end
  end
  object QValeProdutoValida: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  VP.COD_FILIAL,'
      '  C.COD_CADASTRO,'
      '  C.NOME,'
      '  VP.COD_VALE_PRODUTO,'
      '  VP.VAL_VALE_PRODUTO,'
      '  VP.DT_EMISSAO,'
      '  VP.COD_NOTA_CAB_TROCA,'
      '  CASE '
      
        '    WHEN (N.COD_SERIE_MODELO = '#39'55'#39' OR N.COD_SERIE_MODELO = '#39'65'#39 +
        ') THEN '
      
        '      DECODE(NVL(NFEDEV.DESC_RETORNO_PROCESSAMENTO,'#39'0'#39'), '#39'100'#39','#39 +
        'S'#39','#39'N'#39')'
      '    ELSE'
      '      DECODE(ND.IND_SITUACAO,'#39'2'#39','#39'S'#39','#39'N'#39')'
      '  END IND_VALIDO,'
      '  CASE '
      
        '    WHEN (N.COD_SERIE_MODELO = '#39'55'#39' OR N.COD_SERIE_MODELO = '#39'65'#39 +
        ') THEN '
      
        '      DECODE(NVL(NFEDEV.DESC_RETORNO_CANCELAMENTO,'#39'0'#39'), '#39'101'#39','#39'S' +
        #39','#39'N'#39')'
      '    ELSE'
      '      DECODE(ND.IND_SITUACAO,'#39'3'#39','#39'S'#39','#39'N'#39')'
      '  END IND_CANCELADO,'
      '  CASE '
      
        '    WHEN (NT.COD_SERIE_MODELO = '#39'55'#39' OR NT.COD_SERIE_MODELO = '#39'6' +
        '5'#39') THEN '
      '      CASE'
      #9' WHEN (NVL(NFET.DESC_RETORNO_PROCESSAMENTO,'#39'0'#39') = '#39'100'#39') OR'
      #9'      (NVL(NFET.DESC_RETORNO_PROCESSAMENTO,'#39'0'#39') = '#39'149'#39') OR'
      
        '             (NVL(NFET.DESC_RETORNO_PROCESSAMENTO,'#39'0'#39') = '#39'150'#39') ' +
        'THEN '#39'S'#39' ELSE '#39'N'#39' '
      '        END'
      '    ELSE'
      '      DECODE(NT.IND_SITUACAO,'#39'2'#39','#39'S'#39','#39'N'#39')'
      '  END IND_UTILIZADO,'
      '  VP.COD_NOTA_CAB,'
      '  VP.COD_NOTA_CAB_DEV,'
      '  VP.IND_FORMA_PGTO_VALE_PRESENTE,'
      '  VP.DESC_TIPO_VALE,'
      '  VP.IND_SITUACAO_VALE_PRESENTE'
      'FROM'
      '  TB_VALE_PRODUTO VP'
      'LEFT JOIN'
      '  TB_NOTA_CAB N'
      'ON'
      '  N.COD_NOTA_CAB = VP.COD_NOTA_CAB'
      'LEFT JOIN '
      '  TB_NOTA_CAB ND'
      'ON'
      '  ND.COD_NOTA_CAB = VP.COD_NOTA_CAB_DEV'
      'LEFT JOIN '
      '  TB_NF_ELETRONICA NFEDEV'
      'ON'
      '  NFEDEV.COD_NOTA_CAB = VP.COD_NOTA_CAB_DEV'
      'LEFT JOIN'
      '  TB_NOTA_CAB NT'
      'ON'
      '  NT.COD_NOTA_CAB = VP.COD_NOTA_CAB_TROCA'
      'LEFT JOIN'
      '  TB_NF_ELETRONICA NFET'
      'ON'
      '  NFET.COD_NOTA_CAB = NT.COD_NOTA_CAB'
      'LEFT JOIN'
      '  TB_CADASTRO C'
      'ON'
      
        '  (VP.DESC_TIPO_VALE = '#39'VALE-PRESENTE'#39' AND C.COD_CADASTRO = VP.C' +
        'OD_CADASTRO) OR'
      
        '  (VP.DESC_TIPO_VALE = '#39'VALE-COMPRAS'#39' AND C.COD_CADASTRO = ND.CO' +
        'D_CADASTRO)'
      'WHERE'
      '  (:COD_CADASTRO IS NULL OR'
      '   ND.COD_CADASTRO = :COD_CADASTRO)'
      '  AND'
      '  (:DT_INICIAL IS NULL OR'
      '   VP.DT_EMISSAO >= :DT_INICIAL)'
      '  AND'
      '  (:DT_FINAL IS NULL OR'
      '   VP.DT_EMISSAO <= :DT_FINAL)'
      '  AND'
      '  (:COD_NOTA_CAB_TROCA IS NULL OR'
      '   VP.COD_NOTA_CAB_TROCA = :COD_NOTA_CAB_TROCA)'
      '  AND'
      '  (:COD_NOTA_CAB IS NULL OR'
      '   VP.COD_NOTA_CAB = :COD_NOTA_CAB)'
      '  AND'
      '  (:NUM_NOTA IS NULL OR'
      '   N.NUM_NOTA = :NUM_NOTA)'
      '  AND'
      '  (:IND_VALIDO IS NULL OR'
      
        '   (:IND_VALIDO = '#39'S'#39' AND ((NVL(NFEDEV.DESC_RETORNO_PROCESSAMENT' +
        'O,'#39'0'#39') = '#39'100'#39') AND '
      
        #9#9#9'       (N.COD_SERIE_MODELO = '#39'55'#39' OR N.COD_SERIE_MODELO = '#39'65' +
        #39')) OR'
      
        #9#9#9#9'(N.COD_SERIE_MODELO <> '#39'55'#39' AND N.COD_SERIE_MODELO <> '#39'65'#39' A' +
        'ND N.IND_SITUACAO = '#39'2'#39')))'
      '  AND'
      '  (:COD_VALE_PRODUTO IS NULL OR'
      '   VP.COD_VALE_PRODUTO = :COD_VALE_PRODUTO)'
      '  AND'
      '  (:TIPO_VALE IS NULL OR'
      '   VP.DESC_TIPO_VALE = :TIPO_VALE)'
      '  AND'
      '  (:IND_SITUACAO IS NULL OR'
      '   VP.IND_SITUACAO_VALE_PRESENTE = :IND_SITUACAO)'
      ''
      'ORDER BY VP.COD_VALE_PRODUTO'
      ''
      '  ')
    Variables.Data = {
      030000000A0000000D0000003A434F445F434144415354524F03000000000000
      00000000000B0000003A44545F494E494349414C0C0000000000000000000000
      090000003A44545F46494E414C0C0000000000000000000000130000003A434F
      445F4E4F54415F4341425F54524F43410300000000000000000000000D000000
      3A434F445F4E4F54415F4341420300000000000000000000000B0000003A494E
      445F56414C49444F050000000000000000000000110000003A434F445F56414C
      455F50524F4455544F050000000000000000000000090000003A4E554D5F4E4F
      54410300000000000000000000000A0000003A5449504F5F56414C4505000000
      00000000000000000D0000003A494E445F534954554143414F05000000000000
      0000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000F0000001000000056414C5F56414C455F50524F4455544F01000000
      00000A00000044545F454D495353414F0100000000000A000000434F445F4649
      4C49414C0100000000000C000000434F445F434144415354524F010000000000
      040000004E4F4D4501000000000010000000434F445F56414C455F50524F4455
      544F0100000000000D000000494E445F5554494C495A41444F01000000000012
      000000434F445F4E4F54415F4341425F54524F43410100000000000C00000043
      4F445F4E4F54415F43414201000000000010000000434F445F4E4F54415F4341
      425F4445560100000000000A000000494E445F56414C49444F0100000000000D
      000000494E445F43414E43454C41444F0100000000001C000000494E445F464F
      524D415F5047544F5F56414C455F50524553454E54450100000000000E000000
      444553435F5449504F5F56414C450100000000001A000000494E445F53495455
      4143414F5F56414C455F50524553454E5445010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 383
    Top = 65
    object QValeProdutoValidaCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QValeProdutoValidaCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object QValeProdutoValidaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QValeProdutoValidaCOD_VALE_PRODUTO: TIntegerField
      FieldName = 'COD_VALE_PRODUTO'
      Required = True
    end
    object QValeProdutoValidaVAL_VALE_PRODUTO: TFloatField
      FieldName = 'VAL_VALE_PRODUTO'
    end
    object QValeProdutoValidaDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QValeProdutoValidaCOD_NOTA_CAB_TROCA: TIntegerField
      FieldName = 'COD_NOTA_CAB_TROCA'
    end
    object QValeProdutoValidaIND_VALIDO: TStringField
      FieldName = 'IND_VALIDO'
      Size = 1
    end
    object QValeProdutoValidaIND_CANCELADO: TStringField
      FieldName = 'IND_CANCELADO'
      Size = 1
    end
    object QValeProdutoValidaIND_UTILIZADO: TStringField
      FieldName = 'IND_UTILIZADO'
      Size = 1
    end
    object QValeProdutoValidaCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QValeProdutoValidaCOD_NOTA_CAB_DEV: TIntegerField
      FieldName = 'COD_NOTA_CAB_DEV'
    end
    object QValeProdutoValidaIND_FORMA_PGTO_VALE_PRESENTE: TIntegerField
      FieldName = 'IND_FORMA_PGTO_VALE_PRESENTE'
    end
    object QValeProdutoValidaDESC_TIPO_VALE: TStringField
      FieldName = 'DESC_TIPO_VALE'
    end
    object QValeProdutoValidaIND_SITUACAO_VALE_PRESENTE: TIntegerField
      FieldName = 'IND_SITUACAO_VALE_PRESENTE'
    end
  end
  object QContaReceber: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_CONTA_RECEBER_CAB.*'
      'FROM'
      '  TB_CONTA_RECEBER_CAB'
      'where COD_VALE_PRODUTO = :COD_VALE_PRODUTO'
      'order by NUM_PARCELA'
      ' ')
    Variables.Data = {
      0300000001000000110000003A434F445F56414C455F50524F4455544F030000
      000000000000000000}
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      040000003100000015000000434F445F434F4E54415F524543454245525F4341
      420100000000000E000000434F445F46494E414C494441444501000000000011
      000000434F445F42414E434F5F4147454E4349410100000000000A000000434F
      445F46494C49414C0100000000000A0000004E554D5F544954554C4F01000000
      00000B0000004E554D5F50415243454C4101000000000013000000444553435F
      5449504F5F444F43554D454E544F0100000000000C00000044545F4D4F56494D
      454E544F0100000000000800000044545F42414958410100000000000D000000
      44545F56454E43494D454E544F0100000000000A00000044545F454D49535341
      4F0100000000001000000044545F4341504954414C495A4143414F0100000000
      000A00000056414C5F544954554C4F0100000000000B00000056414C5F4E4547
      4F43494F0100000000000A000000494E445F4143454954450100000000000C00
      0000494E445F534954554143414F0100000000000F000000444553435F4F4253
      4552564143414F0100000000000C000000434F445F4E4F54415F434142010000
      0000000C000000434F445F434144415354524F0100000000000C00000056414C
      5F4F524947494E414C01000000000010000000434F445F4E4F53534F5F4E554D
      45524F0100000000000900000056414C5F4A55524F5301000000000010000000
      434F445F444550415254414D454E544F01000000000011000000434F445F434F
      4E545241544F5F56454E440100000000000E000000444553435F4156414C4953
      5441310100000000000E000000444553435F4156414C49535441320100000000
      000C000000434F445F56454E4445444F520100000000000D000000504552435F
      434F4D495353414F0100000000001600000044545F4341504954414C495A4143
      414F5F4D4F4544410100000000000F00000056414C5F50524F4D4953534F5249
      4101000000000011000000494E445F454E564941444F5F42414E434F01000000
      000012000000434F445F434F4E54415F434F5252454E54450100000000001400
      0000434F445F4F5244454D5F434F4D5052415F43414201000000000011000000
      434F445F4F4252415F434F4E545241544F01000000000011000000494E445F45
      4D495449444F5F4341524E4501000000000015000000434F445F4F4252415F43
      4F4E545241544F5F4D4F56010000000000060000004E554D5F4F530100000000
      0015000000434F445F4F5244454D5F5345525649434F5F434142010000000000
      08000000444553435F4F42530100000000000D000000434F445F56454E444544
      4F52310100000000000E000000504552435F434F4D495353414F310100000000
      000F000000434F445F4F464943494E415F4341420100000000000B000000434F
      445F424F524445524F01000000000008000000434F445F4F4252410100000000
      0014000000434F445F434F4E545241544F5F4C4F4341444F520100000000000B
      000000434F445F5553554152494F0100000000000A00000044545F5553554152
      494F01000000000019000000434F445F4F4252415F434F4E545241544F5F4144
      495449564F01000000000010000000434F445F56414C455F50524F4455544F01
      0000000000}
    Master = QValeProduto
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 380
    Top = 118
    object QContaReceberCOD_CONTA_RECEBER_CAB: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_CAB'
      Required = True
    end
    object QContaReceberCOD_FINALIDADE: TIntegerField
      FieldName = 'COD_FINALIDADE'
    end
    object QContaReceberCOD_BANCO_AGENCIA: TIntegerField
      FieldName = 'COD_BANCO_AGENCIA'
    end
    object QContaReceberCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QContaReceberNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object QContaReceberDESC_TIPO_DOCUMENTO: TStringField
      FieldName = 'DESC_TIPO_DOCUMENTO'
      Size = 3
    end
    object QContaReceberDT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
    end
    object QContaReceberDT_BAIXA: TDateTimeField
      FieldName = 'DT_BAIXA'
    end
    object QContaReceberDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object QContaReceberDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object QContaReceberDT_CAPITALIZACAO: TDateTimeField
      FieldName = 'DT_CAPITALIZACAO'
    end
    object QContaReceberVAL_TITULO: TFloatField
      FieldName = 'VAL_TITULO'
    end
    object QContaReceberVAL_NEGOCIO: TFloatField
      FieldName = 'VAL_NEGOCIO'
    end
    object QContaReceberIND_ACEITE: TStringField
      FieldName = 'IND_ACEITE'
      Size = 3
    end
    object QContaReceberIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 13
    end
    object QContaReceberDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 50
    end
    object QContaReceberCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QContaReceberCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QContaReceberVAL_ORIGINAL: TFloatField
      FieldName = 'VAL_ORIGINAL'
    end
    object QContaReceberCOD_NOSSO_NUMERO: TStringField
      FieldName = 'COD_NOSSO_NUMERO'
      Size = 15
    end
    object QContaReceberVAL_JUROS: TFloatField
      FieldName = 'VAL_JUROS'
    end
    object QContaReceberCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
      Required = True
    end
    object QContaReceberCOD_CONTRATO_VEND: TIntegerField
      FieldName = 'COD_CONTRATO_VEND'
    end
    object QContaReceberDESC_AVALISTA1: TStringField
      FieldName = 'DESC_AVALISTA1'
      Size = 40
    end
    object QContaReceberDESC_AVALISTA2: TStringField
      FieldName = 'DESC_AVALISTA2'
      Size = 40
    end
    object QContaReceberCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QContaReceberPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      Required = True
    end
    object QContaReceberDT_CAPITALIZACAO_MOEDA: TDateTimeField
      FieldName = 'DT_CAPITALIZACAO_MOEDA'
    end
    object QContaReceberVAL_PROMISSORIA: TFloatField
      FieldName = 'VAL_PROMISSORIA'
    end
    object QContaReceberCOD_CONTA_CORRENTE: TIntegerField
      FieldName = 'COD_CONTA_CORRENTE'
    end
    object QContaReceberCOD_OFICINA_CAB: TIntegerField
      FieldName = 'COD_OFICINA_CAB'
    end
    object QContaReceberNUM_TITULO: TFloatField
      FieldName = 'NUM_TITULO'
    end
    object QContaReceberIND_ENVIADO_BANCO: TStringField
      FieldName = 'IND_ENVIADO_BANCO'
      Size = 3
    end
    object QContaReceberCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QContaReceberDT_USUARIO: TDateTimeField
      FieldName = 'DT_USUARIO'
    end
    object QContaReceberCOD_VALE_PRODUTO: TIntegerField
      FieldName = 'COD_VALE_PRODUTO'
    end
  end
  object QContaReceberMov: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_CONTA_RECEBER_MOV.*'
      'FROM'
      '  TB_CONTA_RECEBER_MOV'
      'where cod_conta_receber_cab = :cod_conta_receber_cab')
    Variables.Data = {
      0300000001000000160000003A434F445F434F4E54415F524543454245525F43
      4142030000000000000000000000}
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      040000001100000015000000434F445F434F4E54415F524543454245525F4D4F
      5601000000000015000000434F445F434F4E54415F524543454245525F434142
      0100000000000C00000044545F4D4F56494D454E544F0100000000000D000000
      56414C5F4D4F56494D454E544F0100000000000F000000444553435F4F425345
      52564143414F0100000000000B000000434F445F5553554152494F0100000000
      000A00000044545F5553554152494F01000000000012000000494E445F544950
      4F5F4D4F56494D454E544F01000000000011000000434F445F42434F5F4D4F56
      494D454E544F0100000000000D000000434F445F43414958415F4D4F56010000
      00000018000000434F445F4C414E43544F5F434F4E544142494C5F4352454401
      000000000017000000434F445F4C414E43544F5F434F4E544142494C5F444542
      0100000000000C000000434F445F4E4F54415F4341420100000000000D000000
      494E445F4445564F4C5543414F01000000000013000000494E445F464F524D41
      5F504147414D454E544F01000000000009000000494E445F54524F4341010000
      00000010000000434F445F414449414E54414D454E544F010000000000}
    Master = QContaReceber
    MasterFields = 'COD_CONTA_RECEBER_CAB'
    DetailFields = 'COD_CONTA_RECEBER_CAB'
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 381
    Top = 173
    object QContaReceberMovCOD_CONTA_RECEBER_MOV: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_MOV'
      Required = True
    end
    object QContaReceberMovCOD_CONTA_RECEBER_CAB: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_CAB'
    end
    object QContaReceberMovDT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
    end
    object QContaReceberMovVAL_MOVIMENTO: TFloatField
      FieldName = 'VAL_MOVIMENTO'
    end
    object QContaReceberMovDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 50
    end
    object QContaReceberMovCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QContaReceberMovDT_USUARIO: TDateTimeField
      FieldName = 'DT_USUARIO'
    end
    object QContaReceberMovIND_TIPO_MOVIMENTO: TStringField
      FieldName = 'IND_TIPO_MOVIMENTO'
      Required = True
    end
    object QContaReceberMovCOD_BCO_MOVIMENTO: TIntegerField
      FieldName = 'COD_BCO_MOVIMENTO'
    end
    object QContaReceberMovCOD_CAIXA_MOV: TIntegerField
      FieldName = 'COD_CAIXA_MOV'
    end
    object QContaReceberMovCOD_LANCTO_CONTABIL_CRED: TIntegerField
      FieldName = 'COD_LANCTO_CONTABIL_CRED'
    end
    object QContaReceberMovCOD_LANCTO_CONTABIL_DEB: TIntegerField
      FieldName = 'COD_LANCTO_CONTABIL_DEB'
    end
  end
  object QValeProduto: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID, TB_VALE_PRODUTO.*'
      'FROM'
      '  TB_VALE_PRODUTO'
      'WHERE'
      '  TB_VALE_PRODUTO.COD_VALE_PRODUTO = :PK '
      '  OR'
      
        '  TB_VALE_PRODUTO.COD_NOTA_CAB_ANTERIOR = :COD_NOTA_CAB_ANTERIOR' +
        ' '
      '  OR'
      '  TB_VALE_PRODUTO.COD_NOTA_CAB_DEV = :COD_NOTA_CAB_DEV'
      '  OR'
      '  TB_VALE_PRODUTO.COD_NOTA_CAB = :COD_NOTA_CAB')
    Variables.Data = {
      0300000004000000030000003A504B030000000000000000000000160000003A
      434F445F4E4F54415F4341425F414E544552494F520300000000000000000000
      00110000003A434F445F4E4F54415F4341425F44455603000000000000000000
      00000D0000003A434F445F4E4F54415F434142030000000000000000000000}
    SequenceField.Field = 'COD_VALE_PRODUTO'
    SequenceField.Sequence = 'SQ_VALE_PRODUTO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000001300000010000000434F445F56414C455F50524F4455544F01000000
      00000C000000434F445F4E4F54415F43414201000000000010000000434F445F
      4E4F54415F4341425F44455601000000000012000000434F445F4E4F54415F43
      41425F54524F43410100000000000A00000044545F454D495353414F01000000
      00001100000056414C5F56414C4F525F4241495841444F010000000000100000
      0056414C5F56414C455F50524F4455544F01000000000015000000434F445F4E
      4F54415F4341425F414E544552494F520100000000000E000000444553435F54
      49504F5F56414C450100000000000A000000434F445F46494C49414C01000000
      00001C000000494E445F464F524D415F5047544F5F56414C455F50524553454E
      54450100000000001A000000494E445F534954554143414F5F56414C455F5052
      4553454E54450100000000000C000000434F445F434144415354524F01000000
      00000B000000434F445F5553554152494F0100000000000A00000044545F5553
      554152494F01000000000013000000494E445F464F524D415F504147414D454E
      544F0100000000000C000000434F445F56454E4445444F520100000000001500
      0000494E445F4D4F44414C49444144455F43415254414F0100000000000A0000
      0056414C5F415649535441010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforePost = QValeProdutoBeforePost
    OnCalcFields = QValeProdutoCalcFields
    Left = 36
    Top = 173
    object QValeProdutoCOD_VALE_PRODUTO: TIntegerField
      FieldName = 'COD_VALE_PRODUTO'
      Required = True
    end
    object QValeProdutoCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QValeProdutoCOD_NOTA_CAB_DEV: TIntegerField
      FieldName = 'COD_NOTA_CAB_DEV'
    end
    object QValeProdutoCOD_NOTA_CAB_TROCA: TIntegerField
      FieldName = 'COD_NOTA_CAB_TROCA'
    end
    object QValeProdutoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QValeProdutoVAL_VALOR_BAIXADO: TFloatField
      FieldName = 'VAL_VALOR_BAIXADO'
    end
    object QValeProdutoVAL_VALE_PRODUTO: TFloatField
      FieldName = 'VAL_VALE_PRODUTO'
    end
    object QValeProdutoCOD_NOTA_CAB_ANTERIOR: TIntegerField
      FieldName = 'COD_NOTA_CAB_ANTERIOR'
    end
    object QValeProdutoDESC_TIPO_VALE: TStringField
      FieldName = 'DESC_TIPO_VALE'
    end
    object QValeProdutoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QValeProdutoIND_FORMA_PGTO_VALE_PRESENTE: TIntegerField
      FieldName = 'IND_FORMA_PGTO_VALE_PRESENTE'
    end
    object QValeProdutoIND_SITUACAO_VALE_PRESENTE: TIntegerField
      FieldName = 'IND_SITUACAO_VALE_PRESENTE'
    end
    object QValeProdutoCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object QValeProdutoCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QValeProdutoDT_USUARIO: TDateTimeField
      FieldName = 'DT_USUARIO'
    end
    object QValeProdutoIND_FORMA_PAGAMENTO: TIntegerField
      FieldName = 'IND_FORMA_PAGAMENTO'
    end
    object QValeProdutoCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QValeProdutoIND_MODALIDADE_CARTAO: TStringField
      FieldName = 'IND_MODALIDADE_CARTAO'
      Size = 15
    end
    object QValeProdutoVAL_AVISTA: TFloatField
      FieldName = 'VAL_AVISTA'
    end
    object QValeProdutosituacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'situacao'
      Size = 100
      Calculated = True
    end
  end
  object QContasPagarCabCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '   TB_CONTA_PAGAR_CAB."COD_CONTA_PAGAR_CAB" ,'
      '   TB_CONTA_PAGAR_CAB."COD_CADASTRO" ,'
      '   TB_CONTA_PAGAR_CAB."NUM_TITULO" ,'
      '   TB_CONTA_PAGAR_CAB."VAL_TITULO",'
      '   TB_CONTA_PAGAR_CAB."VAL_ORIGINAL", '
      '   TB_CONTA_PAGAR_CAB."DT_BAIXA",'
      '   TB_CONTA_PAGAR_CAB."IND_SITUACAO",'
      '   TB_CONTA_PAGAR_CAB."IND_ACEITE",'
      '   TB_CONTA_PAGAR_CAB."COD_NOTA_CAB",'
      '   TB_CONTA_PAGAR_CAB."IND_DEVOLUCAO"'
      'FROM'
      '   TB_CONTA_PAGAR_CAB,'
      '   TB_CADASTRO'
      'WHERE'
      '  (TB_CONTA_PAGAR_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO )'
      '  AND'
      '  (:COD_CADASTRO IS NULL'
      '   OR'
      '    TB_CONTA_PAGAR_CAB.COD_CADASTRO = :COD_CADASTRO)'
      'ORDER BY TB_CADASTRO.NOME')
    Variables.Data = {
      03000000010000000D0000003A434F445F434144415354524F03000000000000
      0000000000}
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000C000000434F445F4E4F54415F4341420100000000001300
      0000434F445F434F4E54415F50414741525F4341420100000000000C00000043
      4F445F434144415354524F0100000000000A0000004E554D5F544954554C4F01
      00000000000A00000056414C5F544954554C4F0100000000000C00000056414C
      5F4F524947494E414C0100000000000800000044545F42414958410100000000
      000C000000494E445F534954554143414F0100000000000A000000494E445F41
      43454954450100000000000D000000494E445F4445564F4C5543414F01000000
      0000}
    MasterFields = 'COD_CONTA_RECEBER_CAB'
    DetailFields = 'COD_CONTA_RECEBER_CAB'
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 136
    Top = 174
    object QContasPagarCabConsCOD_CONTA_PAGAR_CAB: TIntegerField
      FieldName = 'COD_CONTA_PAGAR_CAB'
      Required = True
    end
    object QContasPagarCabConsCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QContasPagarCabConsNUM_TITULO: TFloatField
      FieldName = 'NUM_TITULO'
    end
    object QContasPagarCabConsVAL_TITULO: TFloatField
      FieldName = 'VAL_TITULO'
    end
    object QContasPagarCabConsVAL_ORIGINAL: TFloatField
      FieldName = 'VAL_ORIGINAL'
    end
    object QContasPagarCabConsDT_BAIXA: TDateTimeField
      FieldName = 'DT_BAIXA'
    end
    object QContasPagarCabConsIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 13
    end
    object QContasPagarCabConsIND_ACEITE: TStringField
      FieldName = 'IND_ACEITE'
      Size = 3
    end
    object QContasPagarCabConsCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QContasPagarCabConsIND_DEVOLUCAO: TStringField
      FieldName = 'IND_DEVOLUCAO'
      Size = 1
    end
  end
end
