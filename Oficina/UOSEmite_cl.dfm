object DMOSEmite: TDMOSEmite
  OldCreateOrder = False
  Left = 700
  Top = 184
  Height = 387
  Width = 374
  object QOrdemServico: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  OS.COD_CADASTRO,'
      '  OS.COD_FILIAL,'
      '  OS.COD_MECANICO,'
      '  OS.COD_OPERACAO,'
      '  OS.COD_VENDEDOR,'
      '  OS.COD_MENSAGEM,'
      '  OS.COD_NOTA_CAB,'
      '  OS.DESC_SERVICO,'
      '  OS.DT_EMISSAO,'
      '  OS.DT_ENTRADA,'
      '  OS.DT_FECHAMENTO,'
      '  OS.DT_SAIDA,'
      '  OS.IND_CONDICAO_PAGTO,'
      '  OS.IND_SITUACAO,'
      '  OS.IND_TIPO_OS,'
      '  OS.IND_VISTA_PRAZO,'
      '  OS.NUM_CHASSI,'
      '  OS.COD_SERIE,'
      '  OS.NUM_OS,'
      '  OS.NUM_TITULO,'
      '  OS.VAL_DESCONTO,'
      '  OS.VAL_NF_MAO_DE_OBRA,'
      '  OS.VAL_NF_PECAS,'
      '  OS.VAL_NF_PECAS_ISENTAS,'
      '  OS.VAL_NF_SERVICO_CHAPEACAO,'
      '  OS.VAL_NF_SERVICO_ELETRICO,'
      '  OS.VAL_NF_SERVICO_TERCEIRO,'
      '  OS.VAL_NF_MAO_DE_OBRA2,'
      '  OS.VAL_NF_PECAS2,'
      '  OS.VAL_NF_PECAS_ISENTAS2,'
      '  OS.VAL_NF_SERVICO_CHAPEACAO2,'
      '  OS.VAL_NF_SERVICO_ELETRICO2,'
      '  OS.VAL_NF_SERVICO_TERCEIRO2,'
      '  F.DESC_FILIAL,'
      '  T.DESC_OS_TIPO,'
      '  C.NOME'
      'FROM'
      '  TB_OS OS,'
      '  TB_FILIAL F,'
      '  TB_OS_TIPO T,'
      '  TB_CADASTRO C'
      'WHERE'
      '  OS.COD_FILIAL = F.COD_FILIAL'
      'AND'
      '  OS.IND_TIPO_OS = T.COD_OS_TIPO'
      'AND'
      '  OS.COD_CADASTRO = C.COD_CADASTRO'
      'AND'
      '  OS.NUM_OS = :NUM_OS'
      '')
    Variables.Data = {0300000001000000070000003A4E554D5F4F53030000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      04000000240000000A00000044545F454D495353414F01000000000006000000
      4E554D5F4F530100000000000C000000434F445F4D4543414E49434F01000000
      00000C000000434F445F56454E4445444F520100000000000C000000494E445F
      534954554143414F0100000000000A000000434F445F46494C49414C01000000
      00000C000000434F445F434144415354524F0100000000000C000000434F445F
      4F5045524143414F0100000000000C000000444553435F5345525649434F0100
      000000000A00000044545F454E54524144410100000000000D00000044545F46
      454348414D454E544F0100000000000800000044545F53414944410100000000
      0012000000494E445F434F4E444943414F5F504147544F0100000000000B0000
      00494E445F5449504F5F4F530100000000000A0000004E554D5F434841535349
      0100000000000A0000004E554D5F544954554C4F010000000000120000005641
      4C5F4E465F4D414F5F44455F4F4252410100000000000C00000056414C5F4E46
      5F50454341530100000000001400000056414C5F4E465F50454341535F495345
      4E5441530100000000001800000056414C5F4E465F5345525649434F5F434841
      50454143414F0100000000001700000056414C5F4E465F5345525649434F5F45
      4C45545249434F0100000000001700000056414C5F4E465F5345525649434F5F
      544552434549524F0100000000001300000056414C5F4E465F4D414F5F44455F
      4F425241320100000000000D00000056414C5F4E465F50454341533201000000
      00001500000056414C5F4E465F50454341535F4953454E544153320100000000
      001900000056414C5F4E465F5345525649434F5F43484150454143414F320100
      000000001800000056414C5F4E465F5345525649434F5F454C45545249434F32
      0100000000001800000056414C5F4E465F5345525649434F5F54455243454952
      4F320100000000000C000000434F445F4D454E534147454D0100000000000C00
      000056414C5F444553434F4E544F0100000000000C000000434F445F4E4F5441
      5F4341420100000000000F000000494E445F56495354415F5052415A4F010000
      00000009000000434F445F53455249450100000000000B000000444553435F46
      494C49414C0100000000000C000000444553435F4F535F5449504F0100000000
      00040000004E4F4D45010000000000}
    Session = DMOracle.DBCemapa
    BeforeClose = ClearVariablesClose
    Left = 48
    Top = 8
    object QOrdemServicoCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QOrdemServicoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QOrdemServicoCOD_MECANICO: TIntegerField
      FieldName = 'COD_MECANICO'
    end
    object QOrdemServicoCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
    end
    object QOrdemServicoCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object QOrdemServicoDESC_SERVICO: TStringField
      FieldName = 'DESC_SERVICO'
      Required = True
      Size = 900
    end
    object QOrdemServicoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QOrdemServicoDT_ENTRADA: TDateTimeField
      FieldName = 'DT_ENTRADA'
      Required = True
    end
    object QOrdemServicoDT_FECHAMENTO: TDateTimeField
      FieldName = 'DT_FECHAMENTO'
    end
    object QOrdemServicoDT_SAIDA: TDateTimeField
      FieldName = 'DT_SAIDA'
    end
    object QOrdemServicoIND_CONDICAO_PAGTO: TIntegerField
      FieldName = 'IND_CONDICAO_PAGTO'
      Required = True
    end
    object QOrdemServicoIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Required = True
      Size = 1
    end
    object QOrdemServicoIND_TIPO_OS: TIntegerField
      FieldName = 'IND_TIPO_OS'
      Required = True
    end
    object QOrdemServicoNUM_CHASSI: TStringField
      FieldName = 'NUM_CHASSI'
      Required = True
    end
    object QOrdemServicoNUM_OS: TIntegerField
      FieldName = 'NUM_OS'
      Required = True
    end
    object QOrdemServicoNUM_TITULO: TIntegerField
      FieldName = 'NUM_TITULO'
    end
    object QOrdemServicoVAL_NF_MAO_DE_OBRA: TFloatField
      FieldName = 'VAL_NF_MAO_DE_OBRA'
    end
    object QOrdemServicoVAL_NF_PECAS: TFloatField
      FieldName = 'VAL_NF_PECAS'
    end
    object QOrdemServicoVAL_NF_PECAS_ISENTAS: TFloatField
      FieldName = 'VAL_NF_PECAS_ISENTAS'
    end
    object QOrdemServicoVAL_NF_SERVICO_CHAPEACAO: TFloatField
      FieldName = 'VAL_NF_SERVICO_CHAPEACAO'
    end
    object QOrdemServicoVAL_NF_SERVICO_ELETRICO: TFloatField
      FieldName = 'VAL_NF_SERVICO_ELETRICO'
    end
    object QOrdemServicoVAL_NF_SERVICO_TERCEIRO: TFloatField
      FieldName = 'VAL_NF_SERVICO_TERCEIRO'
    end
    object QOrdemServicoVAL_NF_MAO_DE_OBRA2: TFloatField
      FieldName = 'VAL_NF_MAO_DE_OBRA2'
    end
    object QOrdemServicoVAL_NF_PECAS2: TFloatField
      FieldName = 'VAL_NF_PECAS2'
    end
    object QOrdemServicoVAL_NF_PECAS_ISENTAS2: TFloatField
      FieldName = 'VAL_NF_PECAS_ISENTAS2'
    end
    object QOrdemServicoVAL_NF_SERVICO_CHAPEACAO2: TFloatField
      FieldName = 'VAL_NF_SERVICO_CHAPEACAO2'
    end
    object QOrdemServicoVAL_NF_SERVICO_ELETRICO2: TFloatField
      FieldName = 'VAL_NF_SERVICO_ELETRICO2'
    end
    object QOrdemServicoVAL_NF_SERVICO_TERCEIRO2: TFloatField
      FieldName = 'VAL_NF_SERVICO_TERCEIRO2'
    end
    object QOrdemServicoCOD_MENSAGEM: TIntegerField
      FieldName = 'COD_MENSAGEM'
    end
    object QOrdemServicoVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
    end
    object QOrdemServicoCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QOrdemServicoIND_VISTA_PRAZO: TIntegerField
      FieldName = 'IND_VISTA_PRAZO'
    end
    object QOrdemServicoCOD_SERIE: TStringField
      FieldName = 'COD_SERIE'
      Size = 3
    end
    object QOrdemServicoDESC_FILIAL: TStringField
      FieldName = 'DESC_FILIAL'
      Size = 50
    end
    object QOrdemServicoDESC_OS_TIPO: TStringField
      FieldName = 'DESC_OS_TIPO'
      Size = 30
    end
    object QOrdemServicoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
  end
  object QRequisicao: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_REQUISICAO.COD_FILIAL,'
      '  TB_REQUISICAO.COD_MECANICO,'
      '  TB_REQUISICAO.COD_VENDEDOR,'
      '  TB_REQUISICAO.DT_EMISSAO,'
      '  TB_REQUISICAO.IND_SITUACAO,'
      '  TB_REQUISICAO.IND_TIPO_MOVIMENTO,'
      '  TB_REQUISICAO.NUM_OS,'
      '  TB_REQUISICAO.NUM_PEDIDO,'
      '  TB_REQUISICAO.NUM_REQUISICAO,'
      '  TB_REQUISICAO.VAL_TOTAL'
      'FROM'
      '  TB_REQUISICAO'
      'WHERE'
      '  TB_REQUISICAO.NUM_OS = :NUM_OS')
    Variables.Data = {0300000001000000070000003A4E554D5F4F53030000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000A00000044545F454D495353414F01000000000006000000
      4E554D5F4F530100000000000C000000434F445F4D4543414E49434F01000000
      00000C000000434F445F56454E4445444F520100000000000C000000494E445F
      534954554143414F0100000000000A000000434F445F46494C49414C01000000
      000012000000494E445F5449504F5F4D4F56494D454E544F0100000000000A00
      00004E554D5F50454449444F0100000000000E0000004E554D5F524551554953
      4943414F0100000000000900000056414C5F544F54414C010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeClose = ClearVariablesClose
    Left = 48
    Top = 56
    object QRequisicaoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QRequisicaoCOD_MECANICO: TIntegerField
      FieldName = 'COD_MECANICO'
    end
    object QRequisicaoCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object QRequisicaoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Required = True
    end
    object QRequisicaoIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Required = True
      Size = 1
    end
    object QRequisicaoIND_TIPO_MOVIMENTO: TStringField
      FieldName = 'IND_TIPO_MOVIMENTO'
      Size = 1
    end
    object QRequisicaoNUM_OS: TIntegerField
      FieldName = 'NUM_OS'
      Required = True
    end
    object QRequisicaoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object QRequisicaoNUM_REQUISICAO: TIntegerField
      FieldName = 'NUM_REQUISICAO'
      Required = True
    end
    object QRequisicaoVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
  end
  object QRequisicaoIt: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  RI.COD_FILIAL,'
      '  RI.COD_MECANICO,'
      '  RI.COD_PRODUTO,'
      '  RI.COD_REQUISICAO_ITEM,'
      '  RI.DESC_REQUISICAO_ITEM,'
      '  RI.COD_VENDEDOR,'
      '  RI.DT_REQUISICAO_ITEM,'
      '  RI.IND_DESCONTO,'
      '  RI.NUM_FABRICANTE,'
      '  RI.NUM_REQUISICAO,'
      '  RI.PERC_DESCONTO,'
      '  RI.QT_QUANTIDADE,'
      '  RI.VAL_CUSTO,'
      '  RI.VAL_UNITARIO,'
      '  NVL(RI.VAL_PEDAGIO,0) AS VAL_PEDAGIO,'
      '  NVL(RI.VAL_REFEICAO,0) AS VAL_REFEICAO,'
      '  NVL(RI.VAL_HOSPEDAGEM,0) AS VAL_HOSPEDAGEM,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_PRODUTO.IND_TIPO_PRODUTO'
      'FROM'
      '  TB_REQUISICAO_ITEM RI,'
      '  TB_PRODUTO'
      'WHERE'
      '  RI.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      'AND'
      '  RI.NUM_REQUISICAO = :NUM_REQUISICAO'
      '')
    Variables.Data = {
      03000000010000000F0000003A4E554D5F5245515549534943414F0300000000
      00000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      04000000130000000C000000434F445F4D4543414E49434F0100000000000C00
      0000434F445F56454E4445444F520100000000000A000000434F445F46494C49
      414C0100000000000E0000004E554D5F5245515549534943414F010000000000
      0B000000434F445F50524F4455544F01000000000013000000434F445F524551
      5549534943414F5F4954454D0100000000001200000044545F52455155495349
      43414F5F4954454D0100000000000C000000494E445F444553434F4E544F0100
      000000000E0000004E554D5F464142524943414E54450100000000000D000000
      504552435F444553434F4E544F0100000000000D00000051545F5155414E5449
      444144450100000000000900000056414C5F435553544F0100000000000C0000
      0056414C5F554E49544152494F0100000000000C000000444553435F50524F44
      55544F01000000000010000000494E445F5449504F5F50524F4455544F010000
      00000014000000444553435F5245515549534943414F5F4954454D0100000000
      000B00000056414C5F5045444147494F0100000000000C00000056414C5F5245
      46454943414F0100000000000E00000056414C5F484F535045444147454D0100
      00000000}
    Master = QRequisicao
    MasterFields = 'NUM_REQUISICAO'
    DetailFields = 'NUM_REQUISICAO'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeClose = ClearVariablesClose
    OnCalcFields = QRequisicaoItCalcFields
    Left = 160
    Top = 104
    object QRequisicaoItCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QRequisicaoItCOD_MECANICO: TIntegerField
      FieldName = 'COD_MECANICO'
      Required = True
    end
    object QRequisicaoItCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRequisicaoItCOD_REQUISICAO_ITEM: TIntegerField
      FieldName = 'COD_REQUISICAO_ITEM'
      Required = True
    end
    object QRequisicaoItCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QRequisicaoItDT_REQUISICAO_ITEM: TDateTimeField
      FieldName = 'DT_REQUISICAO_ITEM'
    end
    object QRequisicaoItIND_DESCONTO: TStringField
      FieldName = 'IND_DESCONTO'
      Size = 1
    end
    object QRequisicaoItNUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
      Required = True
      Size = 15
    end
    object QRequisicaoItNUM_REQUISICAO: TIntegerField
      FieldName = 'NUM_REQUISICAO'
      Required = True
    end
    object QRequisicaoItPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
    end
    object QRequisicaoItQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object QRequisicaoItVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
      Required = True
    end
    object QRequisicaoItVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
    end
    object QRequisicaoItDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRequisicaoItIND_TIPO_PRODUTO: TStringField
      FieldName = 'IND_TIPO_PRODUTO'
      Required = True
      Size = 10
    end
    object QRequisicaoItDESC_REQUISICAO_ITEM: TStringField
      FieldName = 'DESC_REQUISICAO_ITEM'
      Size = 80
    end
    object QRequisicaoItVAL_PEDAGIO: TFloatField
      FieldName = 'VAL_PEDAGIO'
    end
    object QRequisicaoItVAL_REFEICAO: TFloatField
      FieldName = 'VAL_REFEICAO'
    end
    object QRequisicaoItVAL_HOSPEDAGEM: TFloatField
      FieldName = 'VAL_HOSPEDAGEM'
    end
    object QRequisicaoItval_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_total'
      Calculated = True
    end
    object QRequisicaoItval_despesa: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_despesa'
      Calculated = True
    end
  end
  object QServicoTerceiro: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  S.COD_CADASTRO,'
      '  S.COD_SERVICO,'
      '  S.COD_SERVICO_TERCEIRO,'
      '  S.COD_VENDEDOR,'
      '  S.DESC_SERVICO,'
      '  S.DT_SERVICO,'
      '  S.NUM_NOTA,'
      '  S.NUM_OS,'
      '  S.VAL_SERVICO'
      'FROM'
      '  TB_SERVICO_TERCEIRO S'
      'WHERE'
      '  S.NUM_OS = :NUM_OS')
    Variables.Data = {0300000001000000070000003A4E554D5F4F53030000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      04000000090000000C000000434F445F56454E4445444F520100000000000C00
      0000434F445F434144415354524F0100000000000B000000434F445F53455256
      49434F01000000000014000000434F445F5345525649434F5F54455243454952
      4F0100000000000C000000444553435F5345525649434F0100000000000A0000
      0044545F5345525649434F010000000000080000004E554D5F4E4F5441010000
      000000060000004E554D5F4F530100000000000B00000056414C5F5345525649
      434F010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeClose = ClearVariablesClose
    Left = 160
    Top = 8
    object QServicoTerceiroCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QServicoTerceiroCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object QServicoTerceiroCOD_SERVICO_TERCEIRO: TIntegerField
      FieldName = 'COD_SERVICO_TERCEIRO'
      Required = True
    end
    object QServicoTerceiroCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object QServicoTerceiroDESC_SERVICO: TStringField
      FieldName = 'DESC_SERVICO'
      Size = 200
    end
    object QServicoTerceiroDT_SERVICO: TDateTimeField
      FieldName = 'DT_SERVICO'
    end
    object QServicoTerceiroNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
    end
    object QServicoTerceiroNUM_OS: TIntegerField
      FieldName = 'NUM_OS'
      Required = True
    end
    object QServicoTerceiroVAL_SERVICO: TFloatField
      FieldName = 'VAL_SERVICO'
      Required = True
    end
  end
  object QRequisicaoProduto: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  RI.COD_FILIAL,'
      '  RI.COD_MECANICO,'
      '  RI.COD_PRODUTO,'
      '  RI.COD_REQUISICAO_ITEM,'
      '  RI.DESC_REQUISICAO_ITEM,'
      '  RI.COD_VENDEDOR,'
      '  RI.DT_REQUISICAO_ITEM,'
      '  RI.IND_DESCONTO,'
      '  RI.NUM_FABRICANTE,'
      '  RI.NUM_REQUISICAO,'
      '  RI.PERC_DESCONTO,'
      '  RI.QT_QUANTIDADE,'
      '  RI.VAL_CUSTO,'
      '  RI.VAL_UNITARIO,'
      '  RI.VAL_PEDAGIO,'
      '  RI.VAL_REFEICAO,'
      '  RI.VAL_HOSPEDAGEM,'
      '  P.DESC_PRODUTO,'
      '  P.IND_TIPO_PRODUTO'
      'FROM'
      '  TB_REQUISICAO_ITEM RI,'
      '  TB_PRODUTO P'
      'WHERE'
      '  RI.COD_PRODUTO = P.COD_PRODUTO'
      'AND'
      '  RI.IND_VEICULO <> '#39'S'#39
      'AND'
      '  P.IND_TIPO_PRODUTO <> '#39'SERVI'#199'O'#39
      'AND'
      '  RI.NUM_REQUISICAO = :NUM_REQUISICAO'
      '')
    Variables.Data = {
      03000000010000000F0000003A4E554D5F5245515549534943414F0300000000
      00000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      04000000130000000C000000434F445F4D4543414E49434F0100000000000C00
      0000434F445F56454E4445444F520100000000000A000000434F445F46494C49
      414C0100000000000E0000004E554D5F5245515549534943414F010000000000
      0B000000434F445F50524F4455544F01000000000013000000434F445F524551
      5549534943414F5F4954454D0100000000001200000044545F52455155495349
      43414F5F4954454D0100000000000C000000494E445F444553434F4E544F0100
      000000000E0000004E554D5F464142524943414E54450100000000000D000000
      504552435F444553434F4E544F0100000000000D00000051545F5155414E5449
      444144450100000000000900000056414C5F435553544F0100000000000C0000
      0056414C5F554E49544152494F0100000000000C000000444553435F50524F44
      55544F01000000000010000000494E445F5449504F5F50524F4455544F010000
      00000014000000444553435F5245515549534943414F5F4954454D0100000000
      000B00000056414C5F5045444147494F0100000000000C00000056414C5F5245
      46454943414F0100000000000E00000056414C5F484F535045444147454D0100
      00000000}
    Master = QRequisicao
    MasterFields = 'NUM_REQUISICAO'
    DetailFields = 'NUM_REQUISICAO'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeClose = ClearVariablesClose
    OnCalcFields = QRequisicaoItCalcFields
    Left = 48
    Top = 104
    object QRequisicaoProdutoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QRequisicaoProdutoCOD_MECANICO: TIntegerField
      FieldName = 'COD_MECANICO'
    end
    object QRequisicaoProdutoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRequisicaoProdutoCOD_REQUISICAO_ITEM: TIntegerField
      FieldName = 'COD_REQUISICAO_ITEM'
      Required = True
    end
    object QRequisicaoProdutoDESC_REQUISICAO_ITEM: TStringField
      FieldName = 'DESC_REQUISICAO_ITEM'
      Size = 80
    end
    object QRequisicaoProdutoCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QRequisicaoProdutoDT_REQUISICAO_ITEM: TDateTimeField
      FieldName = 'DT_REQUISICAO_ITEM'
    end
    object QRequisicaoProdutoIND_DESCONTO: TStringField
      FieldName = 'IND_DESCONTO'
      Size = 1
    end
    object QRequisicaoProdutoNUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
      Required = True
      Size = 15
    end
    object QRequisicaoProdutoNUM_REQUISICAO: TIntegerField
      FieldName = 'NUM_REQUISICAO'
      Required = True
    end
    object QRequisicaoProdutoPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
    end
    object QRequisicaoProdutoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object QRequisicaoProdutoVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
    end
    object QRequisicaoProdutoVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
    end
    object QRequisicaoProdutoVAL_PEDAGIO: TFloatField
      FieldName = 'VAL_PEDAGIO'
    end
    object QRequisicaoProdutoVAL_REFEICAO: TFloatField
      FieldName = 'VAL_REFEICAO'
    end
    object QRequisicaoProdutoVAL_HOSPEDAGEM: TFloatField
      FieldName = 'VAL_HOSPEDAGEM'
    end
    object QRequisicaoProdutoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRequisicaoProdutoIND_TIPO_PRODUTO: TStringField
      FieldName = 'IND_TIPO_PRODUTO'
      Required = True
      Size = 10
    end
    object QRequisicaoProdutoval_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_total'
      Calculated = True
    end
  end
  object QRequisicaoServico: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  RI.COD_FILIAL,'
      '  RI.COD_MECANICO,'
      '  RI.COD_PRODUTO,'
      '  RI.COD_REQUISICAO_ITEM,'
      '  RI.DESC_REQUISICAO_ITEM AS DESC_PRODUTO,'
      '  RI.COD_VENDEDOR,'
      '  RI.DT_REQUISICAO_ITEM,'
      '  RI.IND_DESCONTO,'
      '  RI.NUM_FABRICANTE,'
      '  RI.NUM_REQUISICAO,'
      '  RI.PERC_DESCONTO,'
      '  RI.QT_QUANTIDADE,'
      '  RI.VAL_CUSTO,'
      '  RI.VAL_UNITARIO,'
      '  RI.VAL_PEDAGIO,'
      '  RI.VAL_REFEICAO,'
      '  RI.VAL_HOSPEDAGEM,'
      '  P.IND_TIPO_PRODUTO'
      'FROM'
      '  TB_REQUISICAO_ITEM RI,'
      '  TB_PRODUTO P'
      'WHERE'
      '  RI.COD_PRODUTO = P.COD_PRODUTO'
      'AND'
      '  RI.IND_VEICULO <> '#39'S'#39
      'AND'
      '  P.IND_TIPO_PRODUTO = '#39'SERVI'#199'O'#39
      'AND'
      '  RI.NUM_REQUISICAO = :NUM_REQUISICAO'
      '')
    Variables.Data = {
      03000000010000000F0000003A4E554D5F5245515549534943414F0300000000
      00000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      04000000120000000C000000434F445F4D4543414E49434F0100000000000C00
      0000434F445F56454E4445444F520100000000000A000000434F445F46494C49
      414C0100000000000E0000004E554D5F5245515549534943414F010000000000
      0B000000434F445F50524F4455544F01000000000013000000434F445F524551
      5549534943414F5F4954454D0100000000001200000044545F52455155495349
      43414F5F4954454D0100000000000C000000494E445F444553434F4E544F0100
      000000000E0000004E554D5F464142524943414E54450100000000000D000000
      504552435F444553434F4E544F0100000000000D00000051545F5155414E5449
      444144450100000000000900000056414C5F435553544F0100000000000C0000
      0056414C5F554E49544152494F0100000000000C000000444553435F50524F44
      55544F01000000000010000000494E445F5449504F5F50524F4455544F010000
      0000000B00000056414C5F5045444147494F0100000000000C00000056414C5F
      524546454943414F0100000000000E00000056414C5F484F535045444147454D
      010000000000}
    Master = QRequisicao
    MasterFields = 'NUM_REQUISICAO'
    DetailFields = 'NUM_REQUISICAO'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeClose = ClearVariablesClose
    OnCalcFields = QRequisicaoItCalcFields
    Left = 160
    Top = 152
    object QRequisicaoServicoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QRequisicaoServicoCOD_MECANICO: TIntegerField
      FieldName = 'COD_MECANICO'
    end
    object QRequisicaoServicoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRequisicaoServicoCOD_REQUISICAO_ITEM: TIntegerField
      FieldName = 'COD_REQUISICAO_ITEM'
      Required = True
    end
    object QRequisicaoServicoCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QRequisicaoServicoDT_REQUISICAO_ITEM: TDateTimeField
      FieldName = 'DT_REQUISICAO_ITEM'
    end
    object QRequisicaoServicoIND_DESCONTO: TStringField
      FieldName = 'IND_DESCONTO'
      Size = 1
    end
    object QRequisicaoServicoNUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
      Required = True
      Size = 15
    end
    object QRequisicaoServicoNUM_REQUISICAO: TIntegerField
      FieldName = 'NUM_REQUISICAO'
      Required = True
    end
    object QRequisicaoServicoPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
    end
    object QRequisicaoServicoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object QRequisicaoServicoVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
    end
    object QRequisicaoServicoVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
    end
    object QRequisicaoServicoVAL_PEDAGIO: TFloatField
      FieldName = 'VAL_PEDAGIO'
    end
    object QRequisicaoServicoVAL_REFEICAO: TFloatField
      FieldName = 'VAL_REFEICAO'
    end
    object QRequisicaoServicoVAL_HOSPEDAGEM: TFloatField
      FieldName = 'VAL_HOSPEDAGEM'
    end
    object QRequisicaoServicoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRequisicaoServicoIND_TIPO_PRODUTO: TStringField
      FieldName = 'IND_TIPO_PRODUTO'
      Required = True
      Size = 10
    end
    object QRequisicaoServicoval_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_total'
      Calculated = True
    end
  end
  object QRequisicaoVeiculo: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  RI.COD_FILIAL,'
      '  RI.COD_MECANICO,'
      '  RI.COD_PRODUTO,'
      '  RI.COD_REQUISICAO_ITEM,'
      '  RI.DESC_REQUISICAO_ITEM,'
      '  RI.COD_VENDEDOR,'
      '  RI.DT_REQUISICAO_ITEM,'
      '  RI.IND_DESCONTO,'
      '  RI.NUM_FABRICANTE,'
      '  RI.NUM_REQUISICAO,'
      '  RI.PERC_DESCONTO,'
      '  RI.QT_QUANTIDADE,'
      '  RI.VAL_CUSTO,'
      '  RI.VAL_UNITARIO,'
      '  NVL(RI.VAL_PEDAGIO,0) AS VAL_PEDAGIO,'
      '  NVL(RI.VAL_REFEICAO,0) AS VAL_REFEICAO,'
      '  NVL(RI.VAL_HOSPEDAGEM,0) AS VAL_HOSPEDAGEM,'
      '  P.DESC_PRODUTO,'
      '  P.IND_TIPO_PRODUTO'
      'FROM'
      '  TB_REQUISICAO_ITEM RI,'
      '  TB_PRODUTO P'
      'WHERE'
      '  RI.COD_PRODUTO = P.COD_PRODUTO'
      'AND'
      '  RI.IND_VEICULO = '#39'S'#39
      'AND'
      '  RI.NUM_REQUISICAO = :NUM_REQUISICAO'
      '')
    Variables.Data = {
      03000000010000000F0000003A4E554D5F5245515549534943414F0300000000
      00000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      04000000130000000C000000434F445F4D4543414E49434F0100000000000C00
      0000434F445F56454E4445444F520100000000000A000000434F445F46494C49
      414C0100000000000E0000004E554D5F5245515549534943414F010000000000
      0B000000434F445F50524F4455544F01000000000013000000434F445F524551
      5549534943414F5F4954454D0100000000001200000044545F52455155495349
      43414F5F4954454D0100000000000C000000494E445F444553434F4E544F0100
      000000000E0000004E554D5F464142524943414E54450100000000000D000000
      504552435F444553434F4E544F0100000000000D00000051545F5155414E5449
      444144450100000000000900000056414C5F435553544F0100000000000C0000
      0056414C5F554E49544152494F0100000000000C000000444553435F50524F44
      55544F01000000000010000000494E445F5449504F5F50524F4455544F010000
      00000014000000444553435F5245515549534943414F5F4954454D0100000000
      000B00000056414C5F5045444147494F0100000000000C00000056414C5F5245
      46454943414F0100000000000E00000056414C5F484F535045444147454D0100
      00000000}
    Master = QRequisicao
    MasterFields = 'NUM_REQUISICAO'
    DetailFields = 'NUM_REQUISICAO'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeClose = ClearVariablesClose
    OnCalcFields = QRequisicaoItCalcFields
    Left = 48
    Top = 152
    object QRequisicaoVeiculoCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QRequisicaoVeiculoCOD_MECANICO: TIntegerField
      FieldName = 'COD_MECANICO'
    end
    object QRequisicaoVeiculoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QRequisicaoVeiculoCOD_REQUISICAO_ITEM: TIntegerField
      FieldName = 'COD_REQUISICAO_ITEM'
      Required = True
    end
    object QRequisicaoVeiculoDESC_REQUISICAO_ITEM: TStringField
      FieldName = 'DESC_REQUISICAO_ITEM'
      Size = 80
    end
    object QRequisicaoVeiculoCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QRequisicaoVeiculoDT_REQUISICAO_ITEM: TDateTimeField
      FieldName = 'DT_REQUISICAO_ITEM'
    end
    object QRequisicaoVeiculoIND_DESCONTO: TStringField
      FieldName = 'IND_DESCONTO'
      Size = 1
    end
    object QRequisicaoVeiculoNUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
      Required = True
      Size = 15
    end
    object QRequisicaoVeiculoNUM_REQUISICAO: TIntegerField
      FieldName = 'NUM_REQUISICAO'
      Required = True
    end
    object QRequisicaoVeiculoPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
    end
    object QRequisicaoVeiculoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object QRequisicaoVeiculoVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
    end
    object QRequisicaoVeiculoVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
    end
    object QRequisicaoVeiculoVAL_PEDAGIO: TFloatField
      FieldName = 'VAL_PEDAGIO'
    end
    object QRequisicaoVeiculoVAL_REFEICAO: TFloatField
      FieldName = 'VAL_REFEICAO'
    end
    object QRequisicaoVeiculoVAL_HOSPEDAGEM: TFloatField
      FieldName = 'VAL_HOSPEDAGEM'
    end
    object QRequisicaoVeiculoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 58
    end
    object QRequisicaoVeiculoIND_TIPO_PRODUTO: TStringField
      FieldName = 'IND_TIPO_PRODUTO'
      Required = True
      Size = 10
    end
    object QRequisicaoVeiculoval_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_total'
      Calculated = True
    end
    object QRequisicaoVeiculoval_despesa: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_despesa'
      Calculated = True
    end
  end
  object QServicoTerceiroIt: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  STI.DESC_SERVICO_TERCEIRO_ITEM AS DESC_PRODUTO,'
      '  STI.QT_QUANTIDADE,'
      '  STI.VAL_UNITARIO,'
      '  STI.QT_QUANTIDADE * STI.VAL_UNITARIO AS VAL_TOTAL,'
      '  STI.COD_PRODUTO,'
      '  ST.DT_SERVICO AS DT_REQUISICAO_ITEM,'
      '  ST.COD_VENDEDOR'
      'FROM'
      '  TB_SERVICO_TERCEIRO_ITEM STI,'
      '  TB_SERVICO_TERCEIRO ST'
      'WHERE'
      '  STI.COD_SERVICO_TERCEIRO = ST.COD_SERVICO_TERCEIRO'
      'AND'
      '  STI.COD_SERVICO_TERCEIRO IN'
      
        '      (SELECT COD_SERVICO_TERCEIRO FROM TB_SERVICO_TERCEIRO WHER' +
        'E NUM_OS = :NUM_OS)'
      '')
    Variables.Data = {0300000001000000070000003A4E554D5F4F53030000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      04000000070000000C000000434F445F56454E4445444F520100000000001200
      000044545F5245515549534943414F5F4954454D0100000000000D0000005154
      5F5155414E5449444144450100000000000C00000056414C5F554E4954415249
      4F0100000000000C000000444553435F50524F4455544F010000000000090000
      0056414C5F544F54414C0100000000000B000000434F445F50524F4455544F01
      0000000000}
    Master = QOrdemServico
    MasterFields = 'NUM_OS'
    DetailFields = 'NUM_OS'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeClose = ClearVariablesClose
    OnCalcFields = QRequisicaoItCalcFields
    Left = 160
    Top = 56
    object QServicoTerceiroItDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 50
    end
    object QServicoTerceiroItQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object QServicoTerceiroItVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
      Required = True
    end
    object QServicoTerceiroItVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QServicoTerceiroItDT_REQUISICAO_ITEM: TDateTimeField
      FieldName = 'DT_REQUISICAO_ITEM'
    end
    object QServicoTerceiroItCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object QServicoTerceiroItCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
  end
  object QRequisicaoItPorClasse: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_CLASSE,'
      '  DESC_CLASSE,'
      '  SUM(DESC_PERC(VAL_TOTAL, PERC_DESCONTO)) AS VAL_TOTAL'
      'FROM'
      '('
      'SELECT'
      '  RI.QT_QUANTIDADE * RI.VAL_UNITARIO AS VAL_TOTAL,'
      '  RI.PERC_DESCONTO AS PERC_DESCONTO,'
      '  P.COD_CLASSE,'
      '  C.DESC_CLASSE'
      'FROM'
      '  TB_REQUISICAO_ITEM RI,'
      '  TB_PRODUTO P,'
      '  TB_CLASSE C'
      'WHERE'
      '  RI.COD_PRODUTO = P.COD_PRODUTO'
      'AND'
      '  P.COD_CLASSE = C.COD_CLASSE'
      'AND'
      '  RI.IND_VEICULO <> '#39'S'#39
      'AND'
      '  P.IND_TIPO_PRODUTO <> '#39'SERVI'#199'O'#39
      'AND'
      
        '  RI.NUM_REQUISICAO IN (SELECT NUM_REQUISICAO FROM TB_REQUISICAO' +
        ' WHERE NUM_OS = :NUM_OS)'
      ')'
      'GROUP BY'
      '  COD_CLASSE,'
      '  DESC_CLASSE')
    Variables.Data = {0300000001000000070000003A4E554D5F4F53030000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      04000000030000000A000000434F445F434C415353450100000000000B000000
      444553435F434C415353450100000000000900000056414C5F544F54414C0100
      00000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 200
    object QRequisicaoItPorClasseCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object QRequisicaoItPorClasseDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QRequisicaoItPorClasseVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
  end
  object QOSItem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_OS_ITEM.*'
      'FROM'
      '  TB_OS_ITEM'
      'WHERE'
      '  NUM_OS = :NUM_OS')
    Variables.Data = {0300000001000000070000003A4E554D5F4F53030000000000000000000000}
    SequenceField.Field = 'COD_OS_ITEM'
    SequenceField.Sequence = 'SQ_OS_ITEM'
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      040000000D0000000B000000434F445F4F535F4954454D0100000000000B0000
      00434F445F50524F4455544F0100000000000D00000051545F5155414E544944
      4144450100000000000C00000056414C5F554E49544152494F01000000000009
      00000056414C5F544F54414C01000000000008000000494E445F5449504F0100
      00000000060000004E554D5F4F530100000000000E000000434F445F54524942
      55544143414F01000000000010000000444553435F434F4D504C454D454E544F
      0100000000000B00000056414C5F444553504553410100000000000C00000056
      414C5F444553434F4E544F0100000000000900000056414C5F435553544F0100
      000000000D000000434F445F4C4F54455F5449504F010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 272
    object QOSItemCOD_OS_ITEM: TIntegerField
      FieldName = 'COD_OS_ITEM'
      Required = True
    end
    object QOSItemCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QOSItemQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object QOSItemVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
    end
    object QOSItemVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object QOSItemIND_TIPO: TStringField
      FieldName = 'IND_TIPO'
      Size = 1
    end
    object QOSItemNUM_OS: TIntegerField
      FieldName = 'NUM_OS'
      Required = True
    end
    object QOSItemCOD_TRIBUTACAO: TIntegerField
      FieldName = 'COD_TRIBUTACAO'
    end
    object QOSItemDESC_COMPLEMENTO: TStringField
      FieldName = 'DESC_COMPLEMENTO'
      Size = 60
    end
    object QOSItemVAL_DESPESA: TFloatField
      FieldName = 'VAL_DESPESA'
    end
    object QOSItemVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
    end
    object QOSItemVAL_CUSTO: TFloatField
      FieldName = 'VAL_CUSTO'
    end
    object QOSItemCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
    end
  end
end
