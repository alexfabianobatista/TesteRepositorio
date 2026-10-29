object DMOrdemServicoMySQL: TDMOrdemServicoMySQL
  OldCreateOrder = False
  Left = 589
  Top = 284
  Height = 226
  Width = 305
  object ZQOrdemServico: TZQuery
    Connection = DMMySQL.ZConnection1
    SQL.Strings = (
      'SELECT'
      ''
      '  OS.FIL_CODIGO,'
      '  OS.ORD_NUMERO,'
      '  OS.CLI_CODIGO,'
      '  OS.ORD_DATAABERTURA,'
      '  OS.ORD_DATAFECHAMENTO,'
      '  OS.ORD_VLRPRODUTOS,'
      '  OS.ORD_VLRSERVICOS,'
      '  OS.ORD_VLROS,'
      '  OS.ORD_ANOTACOES,'
      '  OS.ORD_OBS,'
      '  OS.ORD_DESCRICAOAUX,'
      '  OS.ORD_SITUACAO,'
      '  OS.IDE_CODIGO,'
      '  OSI.PRO_CODIGO,'
      '  OSI.ORDP_QTDE,'
      '  OSI.ORDP_VLRUNITARIO,'
      '  OSI.ORDP_VLRTOTAL,'
      '  OSI.ORDP_LIQREAL,'
      '  OSI.ORDP_PERCDESC,'
      '  OSI.ORDP_VLRDESC,'
      '  ORDP_OBS'
      'FROM'
      '  ORDEMSERV AS OS, OSPRODUTOS OSI'
      'WHERE'
      '  OS.ORD_NUMERO = OSI.ORD_NUMERO'
      'ORDER BY OS.ORD_NUMERO')
    Params = <>
    Left = 56
    Top = 24
    object ZQOrdemServicoFIL_CODIGO: TIntegerField
      FieldName = 'FIL_CODIGO'
      Required = True
    end
    object ZQOrdemServicoORD_NUMERO: TIntegerField
      FieldName = 'ORD_NUMERO'
      Required = True
    end
    object ZQOrdemServicoCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
    end
    object ZQOrdemServicoORD_DATAABERTURA: TDateField
      FieldName = 'ORD_DATAABERTURA'
    end
    object ZQOrdemServicoORD_DATAFECHAMENTO: TDateField
      FieldName = 'ORD_DATAFECHAMENTO'
    end
    object ZQOrdemServicoORD_VLRPRODUTOS: TFloatField
      FieldName = 'ORD_VLRPRODUTOS'
    end
    object ZQOrdemServicoORD_VLRSERVICOS: TFloatField
      FieldName = 'ORD_VLRSERVICOS'
    end
    object ZQOrdemServicoORD_VLROS: TFloatField
      FieldName = 'ORD_VLROS'
    end
    object ZQOrdemServicoORD_ANOTACOES: TMemoField
      FieldName = 'ORD_ANOTACOES'
      BlobType = ftMemo
    end
    object ZQOrdemServicoORD_OBS: TMemoField
      FieldName = 'ORD_OBS'
      BlobType = ftMemo
    end
    object ZQOrdemServicoORD_DESCRICAOAUX: TMemoField
      FieldName = 'ORD_DESCRICAOAUX'
      BlobType = ftMemo
    end
    object ZQOrdemServicoORD_SITUACAO: TIntegerField
      FieldName = 'ORD_SITUACAO'
    end
    object ZQOrdemServicoIDE_CODIGO: TStringField
      FieldName = 'IDE_CODIGO'
    end
    object ZQOrdemServicoPRO_CODIGO: TIntegerField
      FieldName = 'PRO_CODIGO'
    end
    object ZQOrdemServicoORDP_QTDE: TFloatField
      FieldName = 'ORDP_QTDE'
    end
    object ZQOrdemServicoORDP_VLRUNITARIO: TFloatField
      FieldName = 'ORDP_VLRUNITARIO'
    end
    object ZQOrdemServicoORDP_VLRTOTAL: TFloatField
      FieldName = 'ORDP_VLRTOTAL'
    end
    object ZQOrdemServicoORDP_LIQREAL: TFloatField
      FieldName = 'ORDP_LIQREAL'
    end
    object ZQOrdemServicoORDP_PERCDESC: TFloatField
      FieldName = 'ORDP_PERCDESC'
    end
    object ZQOrdemServicoORDP_VLRDESC: TFloatField
      FieldName = 'ORDP_VLRDESC'
    end
    object ZQOrdemServicoORDP_OBS: TMemoField
      FieldName = 'ORDP_OBS'
      BlobType = ftMemo
    end
  end
  object QOrdemServicoCab: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Rowid,'
      '  TB_ORDEM_SERVICO_CAB.*'
      'FROM'
      '  TB_ORDEM_SERVICO_CAB'
      'WHERE'
      '   COD_ORDEM_SERVICO_CAB = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001B00000015000000434F445F4F5244454D5F5345525649434F5F4341
      420100000000000C000000434F445F434144415354524F010000000000100000
      00444553435F4551554950414D454E544F0100000000000A00000044545F454E
      545241444101000000000010000000444553435F534F4C494349544143414F01
      00000000000B000000564C5F444553434F4E544F010000000000080000004454
      5F53414944410100000000000A000000434F445F46494C49414C010000000000
      0B000000434F445F5445434E49434F0100000000000B000000434F445F555355
      4152494F01000000000009000000434F445F43414958410100000000000C0000
      00434F445F4E4F54415F4341420100000000001300000044545F505245564953
      414F5F454E54524547410100000000001300000048525F505245564953414F5F
      454E54524547410100000000000B000000434F445F56454943554C4F01000000
      00000C000000434F445F4F5045524143414F0100000000000D00000044455343
      5F434144415354524F0100000000000C000000434F445F4D454E534147454D01
      000000000016000000444553435F53454E48415F4551554950414D454E544F01
      000000000008000000444553435F4F42530000000000000800000051545F484F
      5241530100000000000C000000494E445F434F4D5F4348495001000000000015
      00000044545F454E54524144415F4D414E5554454E43414F0100000000001300
      000044545F53414944415F4D414E5554454E43414F0100000000001400000043
      4F445F5052415A4F5F56454E43494D454E544F01000000000011000000494E44
      5F4E49525F53594E435F5349544501000000000017000000494E445F434F4D50
      555441444F525F45444954414E444F010000000000}
    Session = DMOracle.DBCemapa
    Left = 56
    Top = 88
    object QOrdemServicoCabCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QOrdemServicoCabCOD_ORDEM_SERVICO_CAB: TIntegerField
      FieldName = 'COD_ORDEM_SERVICO_CAB'
      Required = True
    end
    object QOrdemServicoCabDESC_EQUIPAMENTO: TStringField
      FieldName = 'DESC_EQUIPAMENTO'
      Required = True
      Size = 1500
    end
    object QOrdemServicoCabDT_ENTRADA: TDateTimeField
      FieldName = 'DT_ENTRADA'
      Required = True
    end
    object QOrdemServicoCabDESC_SOLICITACAO: TStringField
      FieldName = 'DESC_SOLICITACAO'
      Required = True
      Size = 1000
    end
    object QOrdemServicoCabVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Required = True
    end
    object QOrdemServicoCabDT_SAIDA: TDateTimeField
      FieldName = 'DT_SAIDA'
    end
    object QOrdemServicoCabCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QOrdemServicoCabCOD_TECNICO: TIntegerField
      FieldName = 'COD_TECNICO'
      Required = True
    end
    object QOrdemServicoCabCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QOrdemServicoCabCOD_CAIXA: TIntegerField
      FieldName = 'COD_CAIXA'
    end
    object QOrdemServicoCabCOD_NOTA_CAB: TIntegerField
      FieldName = 'COD_NOTA_CAB'
    end
    object QOrdemServicoCabDT_PREVISAO_ENTREGA: TDateTimeField
      FieldName = 'DT_PREVISAO_ENTREGA'
    end
    object QOrdemServicoCabHR_PREVISAO_ENTREGA: TDateTimeField
      FieldName = 'HR_PREVISAO_ENTREGA'
    end
    object QOrdemServicoCabCOD_VEICULO: TIntegerField
      FieldName = 'COD_VEICULO'
    end
    object QOrdemServicoCabCOD_OPERACAO: TIntegerField
      FieldName = 'COD_OPERACAO'
    end
    object QOrdemServicoCabDESC_CADASTRO: TStringField
      FieldName = 'DESC_CADASTRO'
      Size = 60
    end
    object QOrdemServicoCabCOD_MENSAGEM: TIntegerField
      FieldName = 'COD_MENSAGEM'
    end
    object QOrdemServicoCabDESC_SENHA_EQUIPAMENTO: TStringField
      FieldName = 'DESC_SENHA_EQUIPAMENTO'
    end
    object QOrdemServicoCabDESC_OBS: TMemoField
      FieldName = 'DESC_OBS'
      BlobType = ftOraClob
    end
    object QOrdemServicoCabQT_HORAS: TStringField
      FieldName = 'QT_HORAS'
      Size = 7
    end
    object QOrdemServicoCabIND_COM_CHIP: TStringField
      FieldName = 'IND_COM_CHIP'
      Size = 1
    end
    object QOrdemServicoCabDT_ENTRADA_MANUTENCAO: TDateTimeField
      FieldName = 'DT_ENTRADA_MANUTENCAO'
    end
    object QOrdemServicoCabDT_SAIDA_MANUTENCAO: TDateTimeField
      FieldName = 'DT_SAIDA_MANUTENCAO'
    end
    object QOrdemServicoCabCOD_PRAZO_VENCIMENTO: TIntegerField
      FieldName = 'COD_PRAZO_VENCIMENTO'
    end
    object QOrdemServicoCabIND_NIR_SYNC_SITE: TStringField
      FieldName = 'IND_NIR_SYNC_SITE'
      Size = 1
    end
    object QOrdemServicoCabIND_COMPUTADOR_EDITANDO: TStringField
      FieldName = 'IND_COMPUTADOR_EDITANDO'
    end
  end
  object QOrdemServicoItem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  Rowid,'
      '  TB_ORDEM_SERVICO_ITEM.*'
      'FROM'
      '  TB_ORDEM_SERVICO_ITEM'
      'WHERE'
      '   COD_ORDEM_SERVICO_ITEM = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E0000000B000000434F445F50524F4455544F010000000000150000
      00434F445F4F5244454D5F5345525649434F5F43414201000000000016000000
      434F445F4F5244454D5F5345525649434F5F4954454D01000000000010000000
      444553435F434F4D504C454D454E544F0100000000000A00000051545F50524F
      4455544F0100000000000B000000564C5F554E49544152494F0100000000000C
      00000056414C5F444553434F4E544F01000000000008000000434F445F4C4F54
      4501000000000008000000434F445F43464F500100000000000D000000434F44
      5F4C4F54455F5449504F0100000000000E000000434F445F5452494255544143
      414F0100000000000D000000504552435F444553434F4E544F01000000000007
      00000056414C5F4953530100000000000D00000056414C5F414352455343494D
      4F010000000000}
    Session = DMOracle.DBCemapa
    Left = 160
    Top = 88
    object QOrdemServicoItemCOD_ORDEM_SERVICO_CAB: TIntegerField
      FieldName = 'COD_ORDEM_SERVICO_CAB'
      Required = True
    end
    object QOrdemServicoItemCOD_ORDEM_SERVICO_ITEM: TIntegerField
      FieldName = 'COD_ORDEM_SERVICO_ITEM'
      Required = True
    end
    object QOrdemServicoItemCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QOrdemServicoItemDESC_COMPLEMENTO: TStringField
      FieldName = 'DESC_COMPLEMENTO'
      Size = 100
    end
    object QOrdemServicoItemQT_PRODUTO: TFloatField
      FieldName = 'QT_PRODUTO'
      Required = True
    end
    object QOrdemServicoItemVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Required = True
    end
    object QOrdemServicoItemVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
      Required = True
    end
    object QOrdemServicoItemCOD_LOTE: TIntegerField
      FieldName = 'COD_LOTE'
    end
    object QOrdemServicoItemCOD_CFOP: TIntegerField
      FieldName = 'COD_CFOP'
    end
    object QOrdemServicoItemCOD_LOTE_TIPO: TIntegerField
      FieldName = 'COD_LOTE_TIPO'
    end
    object QOrdemServicoItemCOD_TRIBUTACAO: TIntegerField
      FieldName = 'COD_TRIBUTACAO'
    end
    object QOrdemServicoItemPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
    end
    object QOrdemServicoItemVAL_ISS: TFloatField
      FieldName = 'VAL_ISS'
    end
    object QOrdemServicoItemVAL_ACRESCIMO: TFloatField
      FieldName = 'VAL_ACRESCIMO'
      Required = True
    end
  end
end
