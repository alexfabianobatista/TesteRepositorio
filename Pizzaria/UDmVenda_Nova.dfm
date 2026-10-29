object DmVenda_Nova: TDmVenda_Nova
  OldCreateOrder = False
  Left = 257
  Top = 134
  Height = 537
  Width = 616
  object QProdutosVenda: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select'
      
        '  (select count(*) from tb_produto_item i where i.cod_produto = ' +
        'p.cod_produto) as num_itens,'
      '  p.*,'
      
        '  (p.desc_produto || '#39' ('#39' || p.cod_produto || '#39')'#39') as desc_cod_p' +
        'roduto,'
      '  t.desc_tipo_produto,'
      '  '#39'N'#39' as MARCADO,'
      '  cast(null as integer) as COD_VENDA_ITEM,'
      '  p.VLR_VENDA as VAL_PRECO_DIGITADO,'
      '  cast(QT_QUANTIDADE_PADRAO as float) as QT_QUANTIDADE_DIGITADO'
      'from'
      '  tb_produto p'
      
        'left join tb_tipo_produto t on p.cod_tipo_produto = t.cod_tipo_p' +
        'roduto'
      'order by'
      '  1 desc, p.desc_produto')
    Left = 32
    Top = 8
    object QProdutosVendaNUM_ITENS: TIntegerField
      FieldName = 'NUM_ITENS'
      ProviderFlags = []
    end
    object QProdutosVendaCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = '"TB_PRODUTO"."COD_PRODUTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QProdutosVendaDESC_PRODUTO: TIBStringField
      FieldName = 'DESC_PRODUTO'
      Origin = '"TB_PRODUTO"."DESC_PRODUTO"'
      Size = 100
    end
    object QProdutosVendaVLR_VENDA: TFloatField
      FieldName = 'VLR_VENDA'
      Origin = '"TB_PRODUTO"."VLR_VENDA"'
    end
    object QProdutosVendaCOD_TIPO_PRODUTO: TIntegerField
      FieldName = 'COD_TIPO_PRODUTO'
      Origin = '"TB_PRODUTO"."COD_TIPO_PRODUTO"'
    end
    object QProdutosVendaDESC_TIPO_PRODUTO: TIBStringField
      FieldName = 'DESC_TIPO_PRODUTO'
      Origin = '"TB_TIPO_PRODUTO"."DESC_TIPO_PRODUTO"'
      Size = 100
    end
    object QProdutosVendaMARCADO: TIBStringField
      FieldName = 'MARCADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object QProdutosVendaDESC_COD_PRODUTO: TIBStringField
      FieldName = 'DESC_COD_PRODUTO'
      ProviderFlags = []
      Size = 114
    end
    object QProdutosVendaCOD_VENDA_ITEM: TIntegerField
      FieldName = 'COD_VENDA_ITEM'
      ProviderFlags = []
    end
    object QProdutosVendaVAL_PRECO_DIGITADO: TFloatField
      FieldName = 'VAL_PRECO_DIGITADO'
      Origin = '"TB_PRODUTO"."VLR_VENDA"'
    end
    object QProdutosVendaQT_QUANTIDADE_DIGITADO: TFloatField
      FieldName = 'QT_QUANTIDADE_DIGITADO'
      ProviderFlags = []
    end
  end
  object DsProdutosVenda: TDataSource
    DataSet = CdProdutosVenda
    Left = 32
    Top = 152
  end
  object DspProdutosVenda: TDataSetProvider
    DataSet = QProdutosVenda
    Left = 32
    Top = 56
  end
  object CdProdutosVenda: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DspProdutosVenda'
    OnCalcFields = CdProdutosVendaCalcFields
    Left = 32
    Top = 104
    object CdProdutosVendaNUM_ITENS: TIntegerField
      FieldName = 'NUM_ITENS'
    end
    object CdProdutosVendaCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object CdProdutosVendaDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 100
    end
    object CdProdutosVendaVLR_VENDA: TFloatField
      FieldName = 'VLR_VENDA'
      DisplayFormat = '#0.00'
    end
    object CdProdutosVendaCOD_TIPO_PRODUTO: TIntegerField
      FieldName = 'COD_TIPO_PRODUTO'
    end
    object CdProdutosVendaDESC_TIPO_PRODUTO: TStringField
      FieldName = 'DESC_TIPO_PRODUTO'
      Size = 100
    end
    object CdProdutosVendaMARCADO: TStringField
      FieldName = 'MARCADO'
      FixedChar = True
      Size = 1
    end
    object CdProdutosVendaDESC_COD_PRODUTO: TStringField
      FieldName = 'DESC_COD_PRODUTO'
      Size = 114
    end
    object CdProdutosVendaCOD_VENDA_ITEM: TIntegerField
      FieldName = 'COD_VENDA_ITEM'
    end
    object CdProdutosVendaVAL_PRECO_DIGITADO: TFloatField
      FieldName = 'VAL_PRECO_DIGITADO'
      DisplayFormat = '#0.00'
    end
    object CdProdutosVendaQT_QUANTIDADE_DIGITADO: TFloatField
      FieldName = 'QT_QUANTIDADE_DIGITADO'
    end
    object CdProdutosVendaval_total_digitado: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_total_digitado'
      DisplayFormat = '#0.00'
      Calculated = True
    end
  end
  object QSabor: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select s.* from TB_VENDA_ITEM_SABOR s'
      'where 1 = 2')
    Left = 192
    Top = 8
    object QSaborCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = '"TB_VENDA_ITEM_SABOR"."COD_VENDA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QSaborCOD_VENDA_ITEM: TIntegerField
      FieldName = 'COD_VENDA_ITEM'
      Origin = '"TB_VENDA_ITEM_SABOR"."COD_VENDA_ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QSaborCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = '"TB_VENDA_ITEM_SABOR"."COD_PRODUTO"'
      Required = True
    end
    object QSaborCOD_ITEM: TIntegerField
      FieldName = 'COD_ITEM'
      Origin = '"TB_VENDA_ITEM_SABOR"."COD_ITEM"'
      Required = True
    end
    object QSaborCOD_SABOR: TIntegerField
      FieldName = 'COD_SABOR'
      Origin = '"TB_VENDA_ITEM_SABOR"."COD_SABOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QSaborQT_QUANTIDADE: TIntegerField
      FieldName = 'QT_QUANTIDADE'
      Origin = '"TB_VENDA_ITEM_SABOR"."QT_QUANTIDADE"'
      Required = True
    end
    object QSaborINDICE: TIntegerField
      FieldName = 'INDICE'
      Origin = '"TB_VENDA_ITEM_SABOR"."INDICE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object DspSabor: TDataSetProvider
    DataSet = QSabor
    Left = 192
    Top = 56
  end
  object CdSabor: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'COD_VENDA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'COD_VENDA_ITEM'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'COD_PRODUTO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'COD_ITEM'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'COD_SABOR'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'QT_QUANTIDADE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'INDICE'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'CdSaborIndex1'
        Fields = 'COD_VENDA_ITEM;COD_PRODUTO;COD_ITEM;COD_SABOR;INDICE'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'COD_VENDA_ITEM;COD_PRODUTO;COD_ITEM;COD_SABOR'
    Params = <>
    ProviderName = 'DspSabor'
    StoreDefs = True
    OnCalcFields = CdSaborCalcFields
    Left = 192
    Top = 104
    object CdSaborCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Required = True
    end
    object CdSaborCOD_VENDA_ITEM: TIntegerField
      FieldName = 'COD_VENDA_ITEM'
      Required = True
    end
    object CdSaborCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object CdSaborCOD_ITEM: TIntegerField
      FieldName = 'COD_ITEM'
      Required = True
    end
    object CdSaborCOD_SABOR: TIntegerField
      FieldName = 'COD_SABOR'
      Required = True
    end
    object CdSaborQT_QUANTIDADE: TIntegerField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object CdSabordesc_sabor: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_sabor'
      Size = 100
      Calculated = True
    end
    object CdSaborINDICE: TIntegerField
      FieldName = 'INDICE'
    end
  end
  object DsSabor: TDataSource
    DataSet = CdSabor
    Left = 192
    Top = 152
  end
  object QProdutoItens: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select'
      '  p.desc_produto,'
      '  t.desc_tipo_produto,'
      
        '  (case when i.cod_produto_item is not null then i.cod_produto_i' +
        'tem else i.cod_tipo_produto_item end) as cod_selecionado,'
      
        '  (case when i.cod_produto_item is not null then p.desc_produto ' +
        'else t.desc_tipo_produto end) as desc_selecionado,'
      
        '  trim(case when i.cod_produto_item is not null then '#39'PRODUTO'#39' e' +
        'lse '#39'TIPO DE PRODUTO'#39' end) as classe_selecionado,'
      '  i.cod_produto_item,'
      '  i.cod_tipo_produto_item,'
      '  p.cod_tipo_produto'
      'from'
      '  tb_produto_item i'
      'left join tb_produto p on p.cod_produto = i.cod_produto_item'
      
        'left join tb_tipo_produto t on t.cod_tipo_produto = i.cod_tipo_p' +
        'roduto_item'
      'where'
      '  i.cod_produto = :cod_produto'
      'order by'
      '  4, 5')
    Left = 336
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_produto'
        ParamType = ptUnknown
      end>
    object QProdutoItensDESC_PRODUTO: TIBStringField
      FieldName = 'DESC_PRODUTO'
      Origin = '"TB_PRODUTO"."DESC_PRODUTO"'
      Size = 100
    end
    object QProdutoItensDESC_TIPO_PRODUTO: TIBStringField
      FieldName = 'DESC_TIPO_PRODUTO'
      Origin = '"TB_TIPO_PRODUTO"."DESC_TIPO_PRODUTO"'
      Size = 100
    end
    object QProdutoItensCOD_SELECIONADO: TIntegerField
      FieldName = 'COD_SELECIONADO'
      ProviderFlags = []
    end
    object QProdutoItensDESC_SELECIONADO: TIBStringField
      FieldName = 'DESC_SELECIONADO'
      ProviderFlags = []
      Size = 100
    end
    object QProdutoItensCLASSE_SELECIONADO: TIBStringField
      FieldName = 'CLASSE_SELECIONADO'
      ProviderFlags = []
      Size = 15
    end
    object QProdutoItensCOD_PRODUTO_ITEM: TIntegerField
      FieldName = 'COD_PRODUTO_ITEM'
      Origin = '"TB_PRODUTO_ITEM"."COD_PRODUTO_ITEM"'
    end
    object QProdutoItensCOD_TIPO_PRODUTO_ITEM: TIntegerField
      FieldName = 'COD_TIPO_PRODUTO_ITEM'
      Origin = '"TB_PRODUTO_ITEM"."COD_TIPO_PRODUTO_ITEM"'
    end
    object QProdutoItensCOD_TIPO_PRODUTO: TIntegerField
      FieldName = 'COD_TIPO_PRODUTO'
      Origin = '"TB_PRODUTO"."COD_TIPO_PRODUTO"'
    end
  end
  object DspProdutoItens: TDataSetProvider
    DataSet = QProdutoItens
    Left = 336
    Top = 56
  end
  object CdProdutoItens: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DspProdutoItens'
    Left = 336
    Top = 104
    object CdProdutoItensDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 100
    end
    object CdProdutoItensDESC_TIPO_PRODUTO: TStringField
      FieldName = 'DESC_TIPO_PRODUTO'
      Size = 100
    end
    object CdProdutoItensCOD_SELECIONADO: TIntegerField
      FieldName = 'COD_SELECIONADO'
    end
    object CdProdutoItensDESC_SELECIONADO: TStringField
      FieldName = 'DESC_SELECIONADO'
      Size = 100
    end
    object CdProdutoItensCLASSE_SELECIONADO: TStringField
      FieldName = 'CLASSE_SELECIONADO'
      Size = 15
    end
    object CdProdutoItensCOD_PRODUTO_ITEM: TIntegerField
      FieldName = 'COD_PRODUTO_ITEM'
    end
    object CdProdutoItensCOD_TIPO_PRODUTO_ITEM: TIntegerField
      FieldName = 'COD_TIPO_PRODUTO_ITEM'
    end
    object CdProdutoItensCOD_TIPO_PRODUTO: TIntegerField
      FieldName = 'COD_TIPO_PRODUTO'
    end
  end
  object DsProdutoItens: TDataSource
    DataSet = CdProdutoItens
    Left = 336
    Top = 152
  end
  object QSelSabor: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select'
      '  s.*,'
      '  '#39'N'#39' as MARCADO'
      'from'
      '  TB_SABOR s'
      'where s.COD_TIPO_PRODUTO = :COD_TIPO_PRODUTO'
      'or s.COD_TIPO_PRODUTO is null'
      'order by'
      '  s.DESC_SABOR')
    Left = 120
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_TIPO_PRODUTO'
        ParamType = ptUnknown
      end>
    object QSelSaborDESC_SABOR: TIBStringField
      FieldName = 'DESC_SABOR'
      Origin = '"TB_SABOR"."DESC_SABOR"'
      Required = True
      Size = 100
    end
    object QSelSaborVLR_INTEGRAL: TFloatField
      FieldName = 'VLR_INTEGRAL'
      Origin = '"TB_SABOR"."VLR_INTEGRAL"'
    end
    object QSelSaborCOD_SABOR: TIntegerField
      FieldName = 'COD_SABOR'
      Origin = '"TB_SABOR"."COD_SABOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QSelSaborMARCADO: TIBStringField
      FieldName = 'MARCADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
  end
  object DspSelSabor: TDataSetProvider
    DataSet = QSelSabor
    Left = 120
    Top = 56
  end
  object CdSelSabor: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DspSelSabor'
    OnCalcFields = CdSaborCalcFields
    Left = 120
    Top = 104
    object CdSelSaborDESC_SABOR: TStringField
      FieldName = 'DESC_SABOR'
      Required = True
      Size = 100
    end
    object CdSelSaborVLR_INTEGRAL: TFloatField
      FieldName = 'VLR_INTEGRAL'
    end
    object CdSelSaborCOD_SABOR: TIntegerField
      FieldName = 'COD_SABOR'
      Required = True
    end
    object CdSelSaborMARCADO: TStringField
      FieldName = 'MARCADO'
      FixedChar = True
      Size = 1
    end
  end
  object DsSelSabor: TDataSource
    DataSet = CdSelSabor
    Left = 120
    Top = 152
  end
  object QInsVenda: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'insert into tb_venda'
      
        '  (COD_VENDA, DT_VENDA, COD_CLIENTE, COD_OPERADOR, DESC_OBSERVAC' +
        'AO, VAL_TAXA_TOTAL)'
      'values'
      
        '  (:COD_VENDA, :DT_VENDA, :COD_CLIENTE, :COD_OPERADOR, :DESC_OBS' +
        'ERVACAO, :VAL_TAXA_TOTAL)')
    Left = 32
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_VENDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_VENDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_OPERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESC_OBSERVACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VAL_TAXA_TOTAL'
        ParamType = ptUnknown
      end>
  end
  object QInsVendaItem: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'insert into tb_venda_item'
      
        '  (COD_VENDA, COD_VENDA_ITEM, COD_PRODUTO, QT_QUANTIDADE, VAL_PR' +
        'ECO)'
      'values'
      
        '  (:COD_VENDA, :COD_VENDA_ITEM, :COD_PRODUTO, :QT_QUANTIDADE, :V' +
        'AL_PRECO)')
    Left = 88
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_VENDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_VENDA_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'QT_QUANTIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VAL_PRECO'
        ParamType = ptUnknown
      end>
  end
  object QInsVendaItemSabor: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'insert into tb_venda_item_sabor'
      
        '  (COD_VENDA, COD_VENDA_ITEM, COD_PRODUTO, COD_ITEM, COD_SABOR, ' +
        'QT_QUANTIDADE, INDICE)'
      'values'
      
        '  (:COD_VENDA, :COD_VENDA_ITEM, :COD_PRODUTO, :COD_ITEM, :COD_SA' +
        'BOR, :QT_QUANTIDADE, :INDICE)')
    Left = 144
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_VENDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_VENDA_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_SABOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'QT_QUANTIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INDICE'
        ParamType = ptUnknown
      end>
  end
  object QUltimaVenda: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'Select max(COD_VENDA) as ultimo from TB_VENDA')
    Left = 32
    Top = 216
    object QUltimaVendaULTIMO: TIntegerField
      FieldName = 'ULTIMO'
    end
  end
  object DspBackup: TDataSetProvider
    DataSet = QSabor
    Left = 264
    Top = 56
  end
  object CdBackup: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DspSabor'
    OnCalcFields = CdSaborCalcFields
    Left = 264
    Top = 104
    object CdBackupCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Required = True
    end
    object CdBackupCOD_VENDA_ITEM: TIntegerField
      FieldName = 'COD_VENDA_ITEM'
      Required = True
    end
    object CdBackupCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object CdBackupCOD_ITEM: TIntegerField
      FieldName = 'COD_ITEM'
      Required = True
    end
    object CdBackupCOD_SABOR: TIntegerField
      FieldName = 'COD_SABOR'
      Required = True
    end
    object CdBackupQT_QUANTIDADE: TIntegerField
      FieldName = 'QT_QUANTIDADE'
      Required = True
    end
    object CdBackupINDICE: TIntegerField
      FieldName = 'INDICE'
    end
  end
  object QTicketCozinha: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select'
      '  vis.COD_VENDA_ITEM,'
      '  vis.COD_PRODUTO,'
      '  vis.COD_ITEM,'
      '  vis.COD_SABOR,'
      '  p.DESC_PRODUTO,'
      '  s.DESC_SABOR,'
      '  vis.INDICE'
      'from'
      '  tb_venda_item_sabor vis'
      
        'inner join tb_venda_item vi on (vi.cod_venda = vis.cod_venda and' +
        ' vi.cod_venda_item = vis.cod_venda_item)'
      'inner join tb_venda v on v.cod_venda = vi.cod_venda'
      'inner join tb_produto p on vis.COD_PRODUTO = p.COD_PRODUTO'
      
        'left join tb_tipo_produto t on p.COD_TIPO_PRODUTO = t.COD_TIPO_P' +
        'RODUTO'
      'inner join tb_sabor s on vis.COD_SABOR = s.COD_SABOR'
      'where'
      '  v.COD_VENDA = :COD_VENDA'
      'and'
      '  t.COD_TIPO_PRODUTO > 0'
      'and'
      '  t.IND_TICKET_COZINHA = '#39'S'#39
      'order by'
      '  vis.COD_VENDA_ITEM,'
      '  p.DESC_PRODUTO,'
      '  vis.COD_PRODUTO,'
      '  vis.COD_ITEM,'
      '  vis.INDICE,'
      '  s.DESC_SABOR')
    Left = 32
    Top = 456
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_VENDA'
        ParamType = ptUnknown
      end>
    object QTicketCozinhaCOD_VENDA_ITEM: TIntegerField
      FieldName = 'COD_VENDA_ITEM'
      Origin = '"TB_VENDA_ITEM_SABOR"."COD_VENDA_ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QTicketCozinhaCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = '"TB_VENDA_ITEM_SABOR"."COD_PRODUTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QTicketCozinhaCOD_ITEM: TIntegerField
      FieldName = 'COD_ITEM'
      Origin = '"TB_VENDA_ITEM_SABOR"."COD_ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QTicketCozinhaCOD_SABOR: TIntegerField
      FieldName = 'COD_SABOR'
      Origin = '"TB_VENDA_ITEM_SABOR"."COD_SABOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QTicketCozinhaDESC_PRODUTO: TIBStringField
      FieldName = 'DESC_PRODUTO'
      Origin = '"TB_PRODUTO"."DESC_PRODUTO"'
      Required = True
      Size = 100
    end
    object QTicketCozinhaDESC_SABOR: TIBStringField
      FieldName = 'DESC_SABOR'
      Origin = '"TB_SABOR"."DESC_SABOR"'
      Required = True
      Size = 100
    end
    object QTicketCozinhaINDICE: TIntegerField
      FieldName = 'INDICE'
      Origin = '"TB_VENDA_ITEM_SABOR"."INDICE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object QTicketCab: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select'
      '  v.*,'
      '  c.DESC_NOME as DESC_NOME_CLIENTE,'
      '  c.DESC_ENDERECO,'
      '  c.DESC_LOCALIZACAO,'
      '  c.DESC_TELEFONE,'
      '  o.DESC_NOME as DESC_NOME_OPERADOR'
      'from'
      '  TB_VENDA v'
      'inner join TB_CLIENTE c on v.COD_CLIENTE = c.COD_CLIENTE'
      'inner join TB_OPERADOR o on v.COD_OPERADOR = o.COD_OPERADOR'
      'where v.COD_VENDA = :COD_VENDA')
    Left = 32
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_VENDA'
        ParamType = ptUnknown
      end>
    object QTicketCabCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = '"TB_VENDA"."COD_VENDA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QTicketCabDT_VENDA: TDateField
      FieldName = 'DT_VENDA'
      Origin = '"TB_VENDA"."DT_VENDA"'
      Required = True
    end
    object QTicketCabCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = '"TB_VENDA"."COD_CLIENTE"'
      Required = True
    end
    object QTicketCabCOD_OPERADOR: TIntegerField
      FieldName = 'COD_OPERADOR'
      Origin = '"TB_VENDA"."COD_OPERADOR"'
      Required = True
    end
    object QTicketCabDESC_OBSERVACAO: TIBStringField
      FieldName = 'DESC_OBSERVACAO'
      Origin = '"TB_VENDA"."DESC_OBSERVACAO"'
      Size = 500
    end
    object QTicketCabDESC_NOME_CLIENTE: TIBStringField
      FieldName = 'DESC_NOME_CLIENTE'
      Origin = '"TB_CLIENTE"."DESC_NOME"'
      Required = True
      Size = 100
    end
    object QTicketCabDESC_ENDERECO: TIBStringField
      FieldName = 'DESC_ENDERECO'
      Origin = '"TB_CLIENTE"."DESC_ENDERECO"'
      Size = 100
    end
    object QTicketCabDESC_LOCALIZACAO: TIBStringField
      FieldName = 'DESC_LOCALIZACAO'
      Origin = '"TB_CLIENTE"."DESC_LOCALIZACAO"'
      Size = 200
    end
    object QTicketCabDESC_TELEFONE: TIBStringField
      FieldName = 'DESC_TELEFONE'
      Origin = '"TB_CLIENTE"."DESC_TELEFONE"'
      Required = True
    end
    object QTicketCabDESC_NOME_OPERADOR: TIBStringField
      FieldName = 'DESC_NOME_OPERADOR'
      Origin = '"TB_OPERADOR"."DESC_NOME"'
      Required = True
      Size = 100
    end
    object QTicketCabVAL_TAXA_TOTAL: TFloatField
      FieldName = 'VAL_TAXA_TOTAL'
      Origin = '"TB_VENDA"."VAL_TAXA_TOTAL"'
      Required = True
    end
  end
  object QTicketItem: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select'
      '  v.*,'
      '  p.DESC_PRODUTO,'
      '  t.IND_TICKET_COZINHA,'
      '  t.IND_TICKET_ENTREGADOR'
      'from'
      '  TB_VENDA_ITEM v'
      'inner join TB_PRODUTO p on v.COD_PRODUTO = p.COD_PRODUTO'
      
        'inner join TB_TIPO_PRODUTO t on p.COD_TIPO_PRODUTO = t.COD_TIPO_' +
        'PRODUTO'
      'where'
      '  v.COD_VENDA = :COD_VENDA'
      'and'
      '  t.IND_TICKET_ENTREGADOR = '#39'S'#39
      'order by'
      '  p.DESC_PRODUTO')
    Left = 32
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_VENDA'
        ParamType = ptUnknown
      end>
    object QTicketItemCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = '"TB_VENDA_ITEM"."COD_PRODUTO"'
      Required = True
    end
    object QTicketItemCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = '"TB_VENDA_ITEM"."COD_VENDA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QTicketItemCOD_VENDA_ITEM: TIntegerField
      FieldName = 'COD_VENDA_ITEM'
      Origin = '"TB_VENDA_ITEM"."COD_VENDA_ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QTicketItemVAL_PRECO: TFloatField
      FieldName = 'VAL_PRECO'
      Origin = '"TB_VENDA_ITEM"."VAL_PRECO"'
      Required = True
    end
    object QTicketItemQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Origin = '"TB_VENDA_ITEM"."QT_QUANTIDADE"'
      Required = True
    end
    object QTicketItemDESC_PRODUTO: TIBStringField
      FieldName = 'DESC_PRODUTO'
      Origin = '"TB_PRODUTO"."DESC_PRODUTO"'
      Required = True
      Size = 100
    end
    object QTicketItemIND_TICKET_COZINHA: TIBStringField
      FieldName = 'IND_TICKET_COZINHA'
      Origin = '"TB_TIPO_PRODUTO"."IND_TICKET_COZINHA"'
      Required = True
      Size = 1
    end
    object QTicketItemIND_TICKET_ENTREGADOR: TIBStringField
      FieldName = 'IND_TICKET_ENTREGADOR'
      Origin = '"TB_TIPO_PRODUTO"."IND_TICKET_ENTREGADOR"'
      Required = True
      Size = 1
    end
  end
  object QConsVendaTipoProd: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select'
      '  t.DESC_TIPO_PRODUTO,'
      '  t.COD_TIPO_PRODUTO,'
      '  sum(i.QT_QUANTIDADE) as QT_QUANTIDADE,'
      '  sum(i.QT_QUANTIDADE * i.VAL_PRECO) as VAL_TOTAL'
      'from'
      '  tb_venda_item i'
      'inner join tb_venda v on i.cod_venda = v.cod_venda'
      'inner join tb_cliente c on v.cod_cliente = c.cod_cliente'
      'inner join tb_operador o on v.cod_operador = o.cod_operador'
      'inner join tb_produto p on i.cod_produto = p.cod_produto'
      
        'left join tb_tipo_produto t on p.cod_tipo_produto = t.cod_tipo_p' +
        'roduto'
      'where'
      '  (v.cod_cliente = :Pcod_cliente or :Pcod_cliente = 0)'
      'and'
      '  (v.cod_operador = :Pcod_operador or :Pcod_operador = 0)'
      'and'
      '  (v.dt_venda between :Pdt_venda_ini and :Pdt_venda_fin)'
      'and'
      
        '  (p.cod_tipo_produto = :Pcod_tipo_produto or :Pcod_tipo_produto' +
        ' = 0)'
      'and'
      
        '  ((:Ptaxa = 0 and v.val_taxa_total > 0) or (:Ptaxa = 1 and v.va' +
        'l_taxa_total <= 0) or (:Ptaxa = 2))'
      'group by'
      '  t.DESC_TIPO_PRODUTO,'
      '  t.COD_TIPO_PRODUTO'
      'order by'
      '  t.DESC_TIPO_PRODUTO,'
      '  t.COD_TIPO_PRODUTO')
    Left = 344
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Pcod_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Pcod_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Pcod_operador'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Pcod_operador'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Pdt_venda_ini'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Pdt_venda_fin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Pcod_tipo_produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Pcod_tipo_produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ptaxa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ptaxa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ptaxa'
        ParamType = ptUnknown
      end>
    object QConsVendaTipoProdDESC_TIPO_PRODUTO: TIBStringField
      FieldName = 'DESC_TIPO_PRODUTO'
      Origin = '"TB_TIPO_PRODUTO"."DESC_TIPO_PRODUTO"'
      Size = 100
    end
    object QConsVendaTipoProdCOD_TIPO_PRODUTO: TIntegerField
      FieldName = 'COD_TIPO_PRODUTO'
      Origin = '"TB_TIPO_PRODUTO"."COD_TIPO_PRODUTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QConsVendaTipoProdQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      ProviderFlags = []
    end
    object QConsVendaTipoProdVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
      ProviderFlags = []
    end
  end
end
