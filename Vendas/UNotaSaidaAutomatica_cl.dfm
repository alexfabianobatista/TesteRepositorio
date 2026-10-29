object DMNotaSaidaAutomatica: TDMNotaSaidaAutomatica
  OldCreateOrder = False
  Left = 451
  Top = 226
  Height = 245
  Width = 470
  object QNotaSaidaEmitida: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  N.COD_NOTA_CAB,'
      '  N.COD_FILIAL,'
      '  N.NUM_NOTA,'
      '  N.COD_CADASTRO || '#39' - '#39' || C.NOME AS CADASTRO,'
      
        '  TO_CHAR(NFE.DESC_RETORNO_PROCESSAMENTO || '#39' - '#39' || NFE.DESC_MS' +
        'G_VALIDACAO_LOTE || '#39' - '#39' || NFE.DESC_MSG_VALIDACAO) AS SITUACAO'
      'FROM'
      '  TB_NOTA_CAB N'
      '    INNER JOIN TB_NF_ELETRONICA NFE'
      '      ON N.COD_NOTA_CAB = NFE.COD_NOTA_CAB'
      '    INNER JOIN TB_CADASTRO C'
      '      ON N.COD_CADASTRO = C.COD_CADASTRO'
      'WHERE'
      '  N.IND_SITUACAO = 2'
      '  AND'
      
        '  N.NUM_PEDIDO IS NOT NULL -- Lista apenas notas que foram sincr' +
        'onizadas com pedidos'
      '  AND'
      
        '  TO_DATE(N.DT_EMISSAO, '#39'DD/MM/YYYY'#39') BETWEEN TO_DATE(SYSDATE-7,' +
        ' '#39'DD/MM/YYYY'#39') AND TO_DATE(SYSDATE, '#39'DD/MM/YYYY'#39')'
      'ORDER BY'
      '  N.COD_NOTA_CAB DESC')
    QBEDefinition.QBEFieldDefs = {
      04000000050000000C000000434F445F4E4F54415F4341420100000000000A00
      0000434F445F46494C49414C010000000000080000004E554D5F4E4F54410100
      0000000008000000434144415354524F01000000000008000000534954554143
      414F000000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 56
    Top = 24
    object QNotaSaidaEmitidaCOD_NOTA_CAB: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
    object QNotaSaidaEmitidaCOD_FILIAL: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QNotaSaidaEmitidaNUM_NOTA: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object QNotaSaidaEmitidaCADASTRO: TStringField
      DisplayLabel = 'Cadastro'
      FieldName = 'CADASTRO'
      Size = 103
    end
    object QNotaSaidaEmitidaSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      Size = 4000
    end
  end
  object DSNotaSaidaEmitida: TDataSource
    DataSet = QNotaSaidaEmitida
    Left = 56
    Top = 72
  end
  object QValidaOperacao: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  DESC_RETORNO_PROCESSAMENTO'
      'FROM'
      '  TB_NF_ELETRONICA'
      'WHERE'
      '  COD_NOTA_CAB = :COD_NOTA_CAB')
    Variables.Data = {
      03000000010000000D0000003A434F445F4E4F54415F43414203000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000010000001A000000444553435F5245544F524E4F5F50524F43455353
      414D454E544F010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 168
    Top = 24
    object QValidaOperacaoDESC_RETORNO_PROCESSAMENTO: TStringField
      FieldName = 'DESC_RETORNO_PROCESSAMENTO'
      Size = 4
    end
  end
  object QNotaSaidaEmitir: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  N.COD_NOTA_CAB'
      'FROM'
      '  TB_NOTA_CAB N'
      '  LEFT JOIN TB_NF_ELETRONICA NFE'
      '    ON N.COD_NOTA_CAB = NFE.COD_NOTA_CAB'
      'WHERE     '
      '  N.IND_SITUACAO = 1 '
      '  AND '
      '  N.IND_ENTRADA_SAIDA = '#39'S'#39
      '  AND '
      
        '  TO_DATE(N.DT_EMISSAO, '#39'dd/mm/yyyy'#39') BETWEEN TO_DATE(SYSDATE-7,' +
        ' '#39'dd/mm/yyyy'#39')'
      '    AND TO_DATE(SYSDATE, '#39'dd/mm/yyyy'#39')'
      '  AND '
      '  ROWNUM = 1 -- BUSCA APENAS 1 NOTA POR VEZ'
      '  AND '
      '  COD_SERIE_MODELO = '#39'55'#39
      '  AND'
      '  (NFE.DESC_RETORNO_PROCESSAMENTO IS NULL'
      '    OR NFE.DESC_RETORNO_PROCESSAMENTO <> '#39'100'#39')')
    QBEDefinition.QBEFieldDefs = {04000000010000000C000000434F445F4E4F54415F434142010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 264
    Top = 24
    object QNotaSaidaEmitirCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
      Required = True
    end
  end
  object QPedidoSincronismo: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  TB_PEDIDO_CAB'
      'WHERE'
      '  COD_PEDIDO_WEB IS NOT NULL'
      '  AND'
      '  STEP_PEDIDO_WEB = 1'
      '  AND'
      '  STEP_SINCRONIZACAO NOT IN ('#39'SINCRONIZADO'#39','#39'NAO_SINCRONIZAR'#39')'
      '  AND'
      
        '  TO_DATE(DT_EMISSAO, '#39'DD/MM/YY'#39') BETWEEN TO_DATE(:DT_EMISSAO, '#39 +
        'DD/MM/YY'#39')-7'
      '    AND TO_DATE(:DT_EMISSAO, '#39'DD/MM/YY'#39')'
      '  AND'
      '  ROWNUM = 1')
    Variables.Data = {
      03000000010000000B0000003A44545F454D495353414F0C0000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      04000000410000000E000000434F445F50454449444F5F434142010000000000
      0A000000434F445F46494C49414C0100000000000C000000434F445F4F504552
      4143414F0100000000000C000000434F445F56454E4445444F52010000000000
      0C000000434F445F434144415354524F0100000000000A0000004E554D5F5045
      4449444F0100000000000A00000044545F454D495353414F0100000000000C00
      000056414C5F444553434F4E544F0100000000000A00000044545F454E545245
      47410100000000000E00000044545F4641545552414D454E544F010000000000
      0A00000044545F53495354454D410100000000000F000000444553435F4F4253
      4552564143414F01000000000014000000444553435F434F4D504C454D454E54
      4F5F4F42530100000000000D000000504552435F434F4D495353414F01000000
      000015000000444553435F434F4D504C454D454E544F5F4F4253320100000000
      000D00000044545F56454E43494D454E544F01000000000012000000494E445F
      5449504F5F504147414D454E544F0100000000000B000000434F445F50524F44
      55544F0100000000000D00000051545F5155414E544944414445010000000000
      0B000000434F445F5553554152494F0100000000000E0000004E525F44494153
      5F4348455155450100000000000F0000004E525F444941535F43484551554531
      0100000000000F0000004E525F444941535F434845515545320100000000000F
      0000004E525F444941535F4348455155453301000000000014000000434F445F
      5052415A4F5F56454E43494D454E544F0100000000000E000000494E445F5449
      504F5F46524554450100000000000B000000434F445F43554C54555241010000
      0000001500000044545F454E54524547415F50524F52524F4741444101000000
      00000F0000004E525F444941535F434845515545340100000000000C00000043
      4F445F4D454E534147454D01000000000010000000434F445F44455041525441
      4D454E544F01000000000011000000434F445F42414E434F5F4147454E434941
      0100000000000C000000494E445F534954554143414F0100000000000B000000
      494E445F4553544F5155450100000000000C000000494E445F454D4241525155
      45010000000000080000004E554D5F50414C4D01000000000012000000434F44
      5F434F4E54415F434F5252454E544501000000000010000000494E445F505245
      434F5F544142454C410100000000000B00000056414C5F494D504F53544F0100
      000000000C000000494E445F4C4942455241444F010000000000080000005045
      52435F53554201000000000013000000434F445F5553554152494F5F4C49425F
      43414401000000000013000000434F445F5553554152494F5F4C49425F46494E
      01000000000013000000434F445F5553554152494F5F4C49425F434F4D010000
      0000000A000000504552435F4C5543524F0100000000000A000000504552435F
      495353514E0100000000000900000056414C5F544F54414C0100000000001000
      000056414C5F414449414E54414D454E544F01000000000009000000434F445F
      53455249450100000000000C000000444553435F56454943554C4F0100000000
      000B000000444553435F54454349444F01000000000014000000444553435F46
      4F524D415F504147414D454E544F0100000000000B00000056414C5F454E5452
      4144410100000000001B000000434F445F434144415354524F5F5452414E5350
      4F525441444F52410100000000000B000000444553435F434841535349010000
      000000100000004E554D5F4F5244454D5F434F4D5052410100000000000A0000
      00444553435F534146524101000000000015000000434F445F56454E4445444F
      525F505245504F53544F0100000000000A00000044545F5553554152494F0100
      00000000160000004C4F43414C5F554C54494D415F414C5445524143414F0100
      000000000F000000535445505F50454449444F5F5745420100000000000E0000
      00434F445F50454449444F5F57454201000000000008000000434F445F4F4252
      4101000000000014000000494E445F434F4E53554D49444F525F46494E414C01
      00000000000B000000434F445F56454943554C4F010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 168
    Top = 72
    object QPedidoSincronismoCOD_PEDIDO_CAB: TIntegerField
      FieldName = 'COD_PEDIDO_CAB'
      Required = True
    end
    object QPedidoSincronismoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QPedidoSincronismoCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
      Required = True
    end
    object QPedidoSincronismoCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QPedidoSincronismoCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object QPedidoSincronismoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object QPedidoSincronismoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QPedidoSincronismoVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
    end
    object QPedidoSincronismoDT_ENTREGA: TDateTimeField
      FieldName = 'DT_ENTREGA'
    end
    object QPedidoSincronismoDT_FATURAMENTO: TDateTimeField
      FieldName = 'DT_FATURAMENTO'
    end
    object QPedidoSincronismoDT_SISTEMA: TDateTimeField
      FieldName = 'DT_SISTEMA'
    end
    object QPedidoSincronismoDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 200
    end
    object QPedidoSincronismoDESC_COMPLEMENTO_OBS: TStringField
      FieldName = 'DESC_COMPLEMENTO_OBS'
      Size = 100
    end
    object QPedidoSincronismoPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object QPedidoSincronismoDESC_COMPLEMENTO_OBS2: TStringField
      FieldName = 'DESC_COMPLEMENTO_OBS2'
      Size = 100
    end
    object QPedidoSincronismoDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object QPedidoSincronismoIND_TIPO_PAGAMENTO: TStringField
      FieldName = 'IND_TIPO_PAGAMENTO'
      Size = 12
    end
    object QPedidoSincronismoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QPedidoSincronismoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QPedidoSincronismoCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QPedidoSincronismoNR_DIAS_CHEQUE: TIntegerField
      FieldName = 'NR_DIAS_CHEQUE'
    end
    object QPedidoSincronismoNR_DIAS_CHEQUE1: TIntegerField
      FieldName = 'NR_DIAS_CHEQUE1'
    end
    object QPedidoSincronismoNR_DIAS_CHEQUE2: TIntegerField
      FieldName = 'NR_DIAS_CHEQUE2'
    end
    object QPedidoSincronismoNR_DIAS_CHEQUE3: TIntegerField
      FieldName = 'NR_DIAS_CHEQUE3'
    end
    object QPedidoSincronismoCOD_PRAZO_VENCIMENTO: TIntegerField
      FieldName = 'COD_PRAZO_VENCIMENTO'
    end
    object QPedidoSincronismoIND_TIPO_FRETE: TStringField
      FieldName = 'IND_TIPO_FRETE'
      Size = 3
    end
    object QPedidoSincronismoCOD_CULTURA: TIntegerField
      FieldName = 'COD_CULTURA'
    end
    object QPedidoSincronismoDT_ENTREGA_PRORROGADA: TDateTimeField
      FieldName = 'DT_ENTREGA_PRORROGADA'
    end
    object QPedidoSincronismoNR_DIAS_CHEQUE4: TIntegerField
      FieldName = 'NR_DIAS_CHEQUE4'
    end
    object QPedidoSincronismoCOD_MENSAGEM: TIntegerField
      FieldName = 'COD_MENSAGEM'
    end
    object QPedidoSincronismoCOD_DEPARTAMENTO: TIntegerField
      FieldName = 'COD_DEPARTAMENTO'
    end
    object QPedidoSincronismoCOD_BANCO_AGENCIA: TIntegerField
      FieldName = 'COD_BANCO_AGENCIA'
    end
    object QPedidoSincronismoIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 1
    end
    object QPedidoSincronismoIND_ESTOQUE: TStringField
      FieldName = 'IND_ESTOQUE'
      Size = 3
    end
    object QPedidoSincronismoIND_EMBARQUE: TStringField
      FieldName = 'IND_EMBARQUE'
      Size = 1
    end
    object QPedidoSincronismoNUM_PALM: TIntegerField
      FieldName = 'NUM_PALM'
    end
    object QPedidoSincronismoCOD_CONTA_CORRENTE: TIntegerField
      FieldName = 'COD_CONTA_CORRENTE'
    end
    object QPedidoSincronismoIND_PRECO_TABELA: TStringField
      FieldName = 'IND_PRECO_TABELA'
      Size = 1
    end
    object QPedidoSincronismoVAL_IMPOSTO: TFloatField
      FieldName = 'VAL_IMPOSTO'
    end
    object QPedidoSincronismoIND_LIBERADO: TStringField
      FieldName = 'IND_LIBERADO'
      Size = 3
    end
    object QPedidoSincronismoPERC_SUB: TFloatField
      FieldName = 'PERC_SUB'
    end
    object QPedidoSincronismoCOD_USUARIO_LIB_CAD: TIntegerField
      FieldName = 'COD_USUARIO_LIB_CAD'
    end
    object QPedidoSincronismoCOD_USUARIO_LIB_FIN: TIntegerField
      FieldName = 'COD_USUARIO_LIB_FIN'
    end
    object QPedidoSincronismoCOD_USUARIO_LIB_COM: TIntegerField
      FieldName = 'COD_USUARIO_LIB_COM'
    end
    object QPedidoSincronismoPERC_LUCRO: TFloatField
      FieldName = 'PERC_LUCRO'
    end
    object QPedidoSincronismoPERC_ISSQN: TFloatField
      FieldName = 'PERC_ISSQN'
    end
    object QPedidoSincronismoVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QPedidoSincronismoVAL_ADIANTAMENTO: TFloatField
      FieldName = 'VAL_ADIANTAMENTO'
    end
    object QPedidoSincronismoCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Size = 3
    end
    object QPedidoSincronismoDESC_VEICULO: TStringField
      FieldName = 'DESC_VEICULO'
      Size = 100
    end
    object QPedidoSincronismoDESC_TECIDO: TStringField
      FieldName = 'DESC_TECIDO'
      Size = 100
    end
    object QPedidoSincronismoDESC_FORMA_PAGAMENTO: TStringField
      FieldName = 'DESC_FORMA_PAGAMENTO'
      Size = 100
    end
    object QPedidoSincronismoVAL_ENTRADA: TFloatField
      FieldName = 'VAL_ENTRADA'
    end
    object QPedidoSincronismoCOD_CADASTRO_TRANSPORTADORA: TIntegerField
      FieldName = 'COD_CADASTRO_TRANSPORTADORA'
    end
    object QPedidoSincronismoDESC_CHASSI: TStringField
      FieldName = 'DESC_CHASSI'
      Size = 50
    end
    object QPedidoSincronismoNUM_ORDEM_COMPRA: TStringField
      FieldName = 'NUM_ORDEM_COMPRA'
    end
    object QPedidoSincronismoDESC_SAFRA: TStringField
      FieldName = 'DESC_SAFRA'
      Size = 15
    end
    object QPedidoSincronismoCOD_VENDEDOR_PREPOSTO: TIntegerField
      FieldName = 'COD_VENDEDOR_PREPOSTO'
    end
    object QPedidoSincronismoDT_USUARIO: TDateTimeField
      FieldName = 'DT_USUARIO'
    end
    object QPedidoSincronismoLOCAL_ULTIMA_ALTERACAO: TStringField
      FieldName = 'LOCAL_ULTIMA_ALTERACAO'
      Size = 10
    end
    object QPedidoSincronismoSTEP_PEDIDO_WEB: TIntegerField
      FieldName = 'STEP_PEDIDO_WEB'
    end
    object QPedidoSincronismoCOD_PEDIDO_WEB: TIntegerField
      FieldName = 'COD_PEDIDO_WEB'
    end
    object QPedidoSincronismoCOD_OBRA: TIntegerField
      FieldName = 'COD_OBRA'
    end
    object QPedidoSincronismoIND_CONSUMIDOR_FINAL: TStringField
      FieldName = 'IND_CONSUMIDOR_FINAL'
      Size = 1
    end
    object QPedidoSincronismoCOD_VEICULO: TIntegerField
      FieldName = 'COD_VEICULO'
    end
  end
  object QPedidoItemSincronismo: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  TB_PEDIDO_ITEM'
      'WHERE'
      '  COD_PEDIDO_CAB = :COD_PEDIDO_CAB')
    Variables.Data = {
      03000000010000000F0000003A434F445F50454449444F5F4341420300000000
      00000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001F0000000F000000434F445F50454449444F5F4954454D0100000000
      000E000000434F445F50454449444F5F4341420100000000000B000000434F44
      5F50524F4455544F0100000000000E000000434F445F5452494255544143414F
      0100000000000900000051545F50454449444F0100000000000C00000056414C
      5F554E49544152494F0100000000000B00000051545F4154454E4449444F0100
      000000000C00000051545F43414E43454C41444F0100000000000D0000005045
      52435F444553434F4E544F0100000000000D000000434F445F4C4F54455F5449
      504F0100000000000D000000504552435F434F4D495353414F0100000000000F
      000000434F445F50524F4455544F5F4155580100000000000C00000051545F45
      4D42414C4147454D0100000000001100000051545F5155414E5449444144455F
      4155580100000000000C00000056414C5F444553434F4E544F0100000000000E
      000000504552435F444553434F4E544F310100000000000E000000504552435F
      444553434F4E544F320100000000000E000000504552435F414352455343494D
      4F0100000000000B000000434F445F43554C545552410100000000000A000000
      434F445F4F524947454D0100000000000A000000434F445F4D4F5449564F0100
      000000000E0000004E554D5F464142524943414E544501000000000009000000
      434F445F4D415243410100000000000E00000056414C5F49434D535F53554253
      540100000000000700000056414C5F4950490100000000001600000050455243
      5F434F4D495353414F5F505245504F53544F01000000000008000000434F445F
      43464F50010000000000160000004C4F43414C5F554C54494D415F414C544552
      4143414F01000000000013000000434F445F50454449444F5F4954454D5F5745
      420100000000000D000000444553435F4F42535F4954454D0100000000001400
      0000434F445F544142454C415F505245434F5F434142010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 288
    Top = 72
    object QPedidoItemSincronismoCOD_PEDIDO_ITEM: TIntegerField
      FieldName = 'COD_PEDIDO_ITEM'
      Required = True
    end
    object QPedidoItemSincronismoCOD_PEDIDO_CAB: TIntegerField
      FieldName = 'COD_PEDIDO_CAB'
    end
    object QPedidoItemSincronismoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
    end
    object QPedidoItemSincronismoCOD_TRIBUTACAO: TIntegerField
      FieldName = 'COD_TRIBUTACAO'
    end
    object QPedidoItemSincronismoQT_PEDIDO: TFloatField
      FieldName = 'QT_PEDIDO'
      Required = True
    end
    object QPedidoItemSincronismoVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
    end
    object QPedidoItemSincronismoQT_ATENDIDO: TFloatField
      FieldName = 'QT_ATENDIDO'
      Required = True
    end
    object QPedidoItemSincronismoQT_CANCELADO: TFloatField
      FieldName = 'QT_CANCELADO'
      Required = True
    end
    object QPedidoItemSincronismoPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
      Required = True
    end
    object QPedidoItemSincronismoCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
    end
    object QPedidoItemSincronismoPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object QPedidoItemSincronismoCOD_PRODUTO_AUX: TIntegerField
      FieldName = 'COD_PRODUTO_AUX'
    end
    object QPedidoItemSincronismoQT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
    end
    object QPedidoItemSincronismoQT_QUANTIDADE_AUX: TFloatField
      FieldName = 'QT_QUANTIDADE_AUX'
    end
    object QPedidoItemSincronismoVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
    end
    object QPedidoItemSincronismoPERC_DESCONTO1: TFloatField
      FieldName = 'PERC_DESCONTO1'
    end
    object QPedidoItemSincronismoPERC_DESCONTO2: TFloatField
      FieldName = 'PERC_DESCONTO2'
    end
    object QPedidoItemSincronismoPERC_ACRESCIMO: TFloatField
      FieldName = 'PERC_ACRESCIMO'
    end
    object QPedidoItemSincronismoCOD_CULTURA: TIntegerField
      FieldName = 'COD_CULTURA'
    end
    object QPedidoItemSincronismoCOD_ORIGEM: TStringField
      FieldName = 'COD_ORIGEM'
      Size = 2
    end
    object QPedidoItemSincronismoCOD_MOTIVO: TIntegerField
      FieldName = 'COD_MOTIVO'
    end
    object QPedidoItemSincronismoNUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
      Size = 21
    end
    object QPedidoItemSincronismoCOD_MARCA: TIntegerField
      FieldName = 'COD_MARCA'
    end
    object QPedidoItemSincronismoVAL_ICMS_SUBST: TFloatField
      FieldName = 'VAL_ICMS_SUBST'
    end
    object QPedidoItemSincronismoVAL_IPI: TFloatField
      FieldName = 'VAL_IPI'
    end
    object QPedidoItemSincronismoPERC_COMISSAO_PREPOSTO: TFloatField
      FieldName = 'PERC_COMISSAO_PREPOSTO'
    end
    object QPedidoItemSincronismoCOD_CFOP: TIntegerField
      FieldName = 'COD_CFOP'
    end
    object QPedidoItemSincronismoLOCAL_ULTIMA_ALTERACAO: TStringField
      FieldName = 'LOCAL_ULTIMA_ALTERACAO'
      Size = 10
    end
    object QPedidoItemSincronismoCOD_PEDIDO_ITEM_WEB: TIntegerField
      FieldName = 'COD_PEDIDO_ITEM_WEB'
    end
    object QPedidoItemSincronismoDESC_OBS_ITEM: TStringField
      FieldName = 'DESC_OBS_ITEM'
      Size = 30
    end
    object QPedidoItemSincronismoCOD_TABELA_PRECO_CAB: TIntegerField
      FieldName = 'COD_TABELA_PRECO_CAB'
    end
  end
  object QAtuBaixaPed: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_BAIXA_PEDIDO."COD_PEDIDO_ITEM" ,'
      '  TB_BAIXA_PEDIDO."COD_NOTA_ITEM" ,'
      '  TB_BAIXA_PEDIDO."QT_BAIXA"'
      'FROM'
      '  TB_BAIXA_PEDIDO')
    QBEDefinition.QBEFieldDefs = {
      04000000030000000F000000434F445F50454449444F5F4954454D0100000000
      000D000000434F445F4E4F54415F4954454D0100000000000800000051545F42
      41495841010000000000}
    RefreshOptions = [roBeforeEdit, roAllFields]
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 56
    Top = 128
    object QAtuBaixaPedCOD_PEDIDO_ITEM: TIntegerField
      FieldName = 'COD_PEDIDO_ITEM'
      Required = True
    end
    object QAtuBaixaPedCOD_NOTA_ITEM: TIntegerField
      FieldName = 'COD_NOTA_ITEM'
      Required = True
    end
    object QAtuBaixaPedQT_BAIXA: TFloatField
      FieldName = 'QT_BAIXA'
      Required = True
    end
  end
end
