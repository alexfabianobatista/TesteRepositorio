object DmVenda: TDmVenda
  OldCreateOrder = False
  Left = 198
  Top = 129
  Height = 338
  Width = 441
  object QItemVenda: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select * from TB_VENDA_ITEM'
      'where 1 = 2')
    Left = 24
    Top = 8
    object QItemVendaCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'TB_VENDA_ITEM.COD_VENDA'
      Required = True
    end
    object QItemVendaCOD_VENDA_ITEM: TIntegerField
      FieldName = 'COD_VENDA_ITEM'
      Origin = 'TB_VENDA_ITEM.COD_VENDA_ITEM'
      Required = True
    end
    object QItemVendaCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = 'TB_VENDA_ITEM.COD_PRODUTO'
      Required = True
    end
    object QItemVendaQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Origin = 'TB_VENDA_ITEM.QT_QUANTIDADE'
      Required = True
    end
    object QItemVendaVAL_PRECO: TFloatField
      FieldName = 'VAL_PRECO'
      Origin = 'TB_VENDA_ITEM.VAL_PRECO'
      Required = True
    end
  end
  object DspItemVenda: TDataSetProvider
    DataSet = QItemVenda
    Left = 24
    Top = 56
  end
  object CdItemVenda: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DspItemVenda'
    OnCalcFields = CdItemVendaCalcFields
    Left = 24
    Top = 104
    object CdItemVendaCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'TB_VENDA_ITEM.COD_VENDA'
    end
    object CdItemVendaCOD_VENDA_ITEM: TIntegerField
      FieldName = 'COD_VENDA_ITEM'
      Origin = 'TB_VENDA_ITEM.COD_VENDA_ITEM'
    end
    object CdItemVendaCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = 'TB_VENDA_ITEM.COD_PRODUTO'
    end
    object CdItemVendaQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Origin = 'TB_VENDA_ITEM.QT_QUANTIDADE'
      DisplayFormat = '#0.00'
    end
    object CdItemVendaVAL_PRECO: TFloatField
      FieldName = 'VAL_PRECO'
      Origin = 'TB_VENDA_ITEM.VAL_PRECO'
      DisplayFormat = '#0.00'
    end
    object CdItemVendadesc_produto: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_produto'
      Size = 100
      Calculated = True
    end
    object CdItemVendaval_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'val_total'
      DisplayFormat = '#0.00'
      Calculated = True
    end
    object CdItemVendamax_codigo: TAggregateField
      FieldName = 'max_codigo'
      Active = True
      Expression = 'max(COD_VENDA_ITEM)'
    end
  end
  object DsItemVenda: TDataSource
    DataSet = CdItemVenda
    Left = 24
    Top = 152
  end
  object QInsVenda: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'insert into tb_venda'
      '  (DT_VENDA, COD_CLIENTE, COD_OPERADOR, DESC_OBSERVACAO)'
      'values'
      '  (:DT_VENDA, :COD_CLIENTE, :COD_OPERADOR, :DESC_OBSERVACAO)')
    Left = 160
    Top = 224
    ParamData = <
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
    Left = 216
    Top = 224
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
      '  (COD_VENDA, COD_VENDA_ITEM, COD_SABOR, QT_QUANTIDADE)'
      'values'
      '  (:COD_VENDA, :COD_VENDA_ITEM, :COD_SABOR, :QT_QUANTIDADE)')
    Left = 272
    Top = 224
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
        Name = 'COD_SABOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'QT_QUANTIDADE'
        ParamType = ptUnknown
      end>
  end
  object QSabor: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select s.* from TB_VENDA_ITEM_SABOR s'
      'where 1 = 2')
    Left = 96
    Top = 8
    object QSaborCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'TB_VENDA_ITEM_SABOR.COD_VENDA'
      Required = True
    end
    object QSaborCOD_VENDA_ITEM: TIntegerField
      FieldName = 'COD_VENDA_ITEM'
      Origin = 'TB_VENDA_ITEM_SABOR.COD_VENDA_ITEM'
      Required = True
    end
    object QSaborCOD_SABOR: TIntegerField
      FieldName = 'COD_SABOR'
      Origin = 'TB_VENDA_ITEM_SABOR.COD_SABOR'
      Required = True
    end
    object QSaborQT_QUANTIDADE: TIntegerField
      FieldName = 'QT_QUANTIDADE'
      Origin = 'TB_VENDA_ITEM_SABOR.QT_QUANTIDADE'
      Required = True
    end
  end
  object DspSabor: TDataSetProvider
    DataSet = QSabor
    Left = 96
    Top = 56
  end
  object CdSabor: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DspSabor'
    OnCalcFields = CdSaborCalcFields
    Left = 96
    Top = 104
    object CdSaborCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'TB_VENDA_ITEM_SABOR.COD_VENDA'
    end
    object CdSaborCOD_VENDA_ITEM: TIntegerField
      FieldName = 'COD_VENDA_ITEM'
      Origin = 'TB_VENDA_ITEM_SABOR.COD_VENDA_ITEM'
    end
    object CdSaborCOD_SABOR: TIntegerField
      FieldName = 'COD_SABOR'
      Origin = 'TB_VENDA_ITEM_SABOR.COD_SABOR'
    end
    object CdSaborQT_QUANTIDADE: TIntegerField
      FieldName = 'QT_QUANTIDADE'
    end
    object CdSabordesc_sabor: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_sabor'
      Size = 100
      Calculated = True
    end
  end
  object DsSabor: TDataSource
    DataSet = CdSabor
    Left = 96
    Top = 152
  end
  object CdBackup: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DspBackup'
    Left = 160
    Top = 104
    object CdBackupCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
    end
    object CdBackupCOD_VENDA_ITEM: TIntegerField
      FieldName = 'COD_VENDA_ITEM'
    end
    object CdBackupCOD_SABOR: TIntegerField
      FieldName = 'COD_SABOR'
    end
    object CdBackupQT_QUANTIDADE: TIntegerField
      FieldName = 'QT_QUANTIDADE'
    end
  end
  object DspBackup: TDataSetProvider
    DataSet = QSabor
    Left = 160
    Top = 56
  end
  object QUltimaVenda: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'Select max(COD_VENDA) as ultimo from TB_VENDA')
    Left = 160
    Top = 176
    object QUltimaVendaULTIMO: TIntegerField
      FieldName = 'ULTIMO'
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
    Left = 312
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_VENDA'
        ParamType = ptUnknown
      end>
    object QTicketCabCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'TB_VENDA.COD_VENDA'
      Required = True
    end
    object QTicketCabDT_VENDA: TDateField
      FieldName = 'DT_VENDA'
      Origin = 'TB_VENDA.DT_VENDA'
      Required = True
    end
    object QTicketCabCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'TB_VENDA.COD_CLIENTE'
      Required = True
    end
    object QTicketCabCOD_OPERADOR: TIntegerField
      FieldName = 'COD_OPERADOR'
      Origin = 'TB_VENDA.COD_OPERADOR'
      Required = True
    end
    object QTicketCabDESC_OBSERVACAO: TIBStringField
      FieldName = 'DESC_OBSERVACAO'
      Origin = 'TB_VENDA.DESC_OBSERVACAO'
      Size = 500
    end
    object QTicketCabDESC_NOME_CLIENTE: TIBStringField
      FieldName = 'DESC_NOME_CLIENTE'
      Origin = 'TB_CLIENTE.DESC_NOME'
      Required = True
      Size = 100
    end
    object QTicketCabDESC_ENDERECO: TIBStringField
      FieldName = 'DESC_ENDERECO'
      Origin = 'TB_CLIENTE.DESC_ENDERECO'
      Size = 100
    end
    object QTicketCabDESC_LOCALIZACAO: TIBStringField
      FieldName = 'DESC_LOCALIZACAO'
      Origin = 'TB_CLIENTE.DESC_LOCALIZACAO'
      Size = 200
    end
    object QTicketCabDESC_TELEFONE: TIBStringField
      FieldName = 'DESC_TELEFONE'
      Origin = 'TB_CLIENTE.DESC_TELEFONE'
      Required = True
    end
    object QTicketCabDESC_NOME_OPERADOR: TIBStringField
      FieldName = 'DESC_NOME_OPERADOR'
      Origin = 'TB_OPERADOR.DESC_NOME'
      Required = True
      Size = 100
    end
  end
  object QTicketItem: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select'
      '  v.*,'
      '  p.DESC_PRODUTO'
      'from'
      '  TB_VENDA_ITEM v'
      'inner join TB_PRODUTO p on v.COD_PRODUTO = p.COD_PRODUTO'
      'where v.COD_VENDA = :COD_VENDA')
    Left = 312
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_VENDA'
        ParamType = ptUnknown
      end>
    object QTicketItemCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'TB_VENDA_ITEM.COD_VENDA'
      Required = True
    end
    object QTicketItemCOD_VENDA_ITEM: TIntegerField
      FieldName = 'COD_VENDA_ITEM'
      Origin = 'TB_VENDA_ITEM.COD_VENDA_ITEM'
      Required = True
    end
    object QTicketItemCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = 'TB_VENDA_ITEM.COD_PRODUTO'
      Required = True
    end
    object QTicketItemQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
      Origin = 'TB_VENDA_ITEM.QT_QUANTIDADE'
      Required = True
    end
    object QTicketItemVAL_PRECO: TFloatField
      FieldName = 'VAL_PRECO'
      Origin = 'TB_VENDA_ITEM.VAL_PRECO'
      Required = True
    end
    object QTicketItemDESC_PRODUTO: TIBStringField
      FieldName = 'DESC_PRODUTO'
      Origin = 'TB_PRODUTO.DESC_PRODUTO'
      Required = True
      Size = 100
    end
  end
  object QTicketSabor: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select'
      '  v.*,'
      '  s.DESC_SABOR'
      'from'
      '  TB_VENDA_ITEM_SABOR v'
      'inner join TB_SABOR s on v.COD_SABOR = s.COD_SABOR'
      'where v.COD_VENDA = :COD_VENDA'
      'and v.COD_VENDA_ITEM = :COD_VENDA_ITEM')
    Left = 312
    Top = 112
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
      end>
    object QTicketSaborCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'TB_VENDA_ITEM_SABOR.COD_VENDA'
      Required = True
    end
    object QTicketSaborCOD_VENDA_ITEM: TIntegerField
      FieldName = 'COD_VENDA_ITEM'
      Origin = 'TB_VENDA_ITEM_SABOR.COD_VENDA_ITEM'
      Required = True
    end
    object QTicketSaborCOD_SABOR: TIntegerField
      FieldName = 'COD_SABOR'
      Origin = 'TB_VENDA_ITEM_SABOR.COD_SABOR'
      Required = True
    end
    object QTicketSaborQT_QUANTIDADE: TIntegerField
      FieldName = 'QT_QUANTIDADE'
      Origin = 'TB_VENDA_ITEM_SABOR.QT_QUANTIDADE'
      Required = True
    end
    object QTicketSaborDESC_SABOR: TIBStringField
      FieldName = 'DESC_SABOR'
      Origin = 'TB_SABOR.DESC_SABOR'
      Required = True
      Size = 100
    end
  end
end
