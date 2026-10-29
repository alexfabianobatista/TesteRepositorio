object DmProduto: TDmProduto
  OldCreateOrder = False
  Left = 402
  Top = 275
  Height = 407
  Width = 410
  object QSelProduto: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select * from TB_PRODUTO')
    Left = 32
    Top = 8
    object QSelProdutoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = 'TB_PRODUTO.COD_PRODUTO'
      Required = True
    end
    object QSelProdutoDESC_PRODUTO: TIBStringField
      FieldName = 'DESC_PRODUTO'
      Origin = 'TB_PRODUTO.DESC_PRODUTO'
      Required = True
      Size = 100
    end
    object QSelProdutoVLR_VENDA: TFloatField
      FieldName = 'VLR_VENDA'
      Origin = 'TB_PRODUTO.VLR_VENDA'
      Required = True
    end
    object QSelProdutoCOD_TIPO_PRODUTO: TIntegerField
      FieldName = 'COD_TIPO_PRODUTO'
      Origin = 'TB_PRODUTO.COD_TIPO_PRODUTO'
    end
  end
  object DsSelProduto: TDataSource
    DataSet = QSelProduto
    Left = 32
    Top = 64
  end
  object QQtdSabores: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select'
      '  t.NUM_SABORES,'
      '  p.VLR_VENDA,'
      '  p.QT_QUANTIDADE_PADRAO,'
      '  p.IND_TIPO_TAXA_ENTREGA'
      'from'
      '  TB_PRODUTO p'
      
        'left join TB_TIPO_PRODUTO t on p.COD_TIPO_PRODUTO = t.COD_TIPO_P' +
        'RODUTO'
      'where'
      '  p.COD_PRODUTO = :COD_PRODUTO')
    Left = 120
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_PRODUTO'
        ParamType = ptUnknown
      end>
    object QQtdSaboresNUM_SABORES: TIntegerField
      FieldName = 'NUM_SABORES'
      Origin = 'TB_TIPO_PRODUTO.NUM_SABORES'
    end
    object QQtdSaboresVLR_VENDA: TFloatField
      FieldName = 'VLR_VENDA'
      Origin = 'TB_PRODUTO.VLR_VENDA'
      Required = True
    end
    object QQtdSaboresQT_QUANTIDADE_PADRAO: TFloatField
      FieldName = 'QT_QUANTIDADE_PADRAO'
      Origin = '"TB_PRODUTO"."QT_QUANTIDADE_PADRAO"'
      Required = True
    end
    object QQtdSaboresIND_TIPO_TAXA_ENTREGA: TIBStringField
      FieldName = 'IND_TIPO_TAXA_ENTREGA'
      Origin = '"TB_PRODUTO"."IND_TIPO_TAXA_ENTREGA"'
      Size = 1
    end
  end
  object QProduto: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select * from tb_produto_item'
      'where cod_produto = :cod_produto')
    Left = 192
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_produto'
        ParamType = ptUnknown
      end>
    object QProdutoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = '"TB_PRODUTO_ITEM"."COD_PRODUTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QProdutoCOD_ITEM: TIntegerField
      FieldName = 'COD_ITEM'
      Origin = '"TB_PRODUTO_ITEM"."COD_ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QProdutoCOD_PRODUTO_ITEM: TIntegerField
      FieldName = 'COD_PRODUTO_ITEM'
      Origin = '"TB_PRODUTO_ITEM"."COD_PRODUTO_ITEM"'
    end
    object QProdutoCOD_TIPO_PRODUTO_ITEM: TIntegerField
      FieldName = 'COD_TIPO_PRODUTO_ITEM'
      Origin = '"TB_PRODUTO_ITEM"."COD_TIPO_PRODUTO_ITEM"'
    end
  end
  object DspProduto: TDataSetProvider
    DataSet = QProduto
    Left = 192
    Top = 104
  end
  object CdProduto: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Filter = 'COD_TIPO_PRODUTO_ITEM is null'
    Filtered = True
    FieldDefs = <
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
        Name = 'COD_PRODUTO_ITEM'
        DataType = ftInteger
      end
      item
        Name = 'COD_TIPO_PRODUTO_ITEM'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'CdProdutoIndex1'
        Fields = 'COD_ITEM'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'COD_ITEM'
    Params = <>
    ProviderName = 'DspProduto'
    StoreDefs = True
    BeforePost = CdProdutoBeforePost
    OnCalcFields = CdProdutoCalcFields
    Left = 192
    Top = 152
    object CdProdutoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object CdProdutoCOD_ITEM: TIntegerField
      FieldName = 'COD_ITEM'
    end
    object CdProdutoCOD_PRODUTO_ITEM: TIntegerField
      FieldName = 'COD_PRODUTO_ITEM'
    end
    object CdProdutoCOD_TIPO_PRODUTO_ITEM: TIntegerField
      FieldName = 'COD_TIPO_PRODUTO_ITEM'
    end
    object CdProdutodesc_produto: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_produto'
      Size = 100
      Calculated = True
    end
    object CdProdutomax_item: TAggregateField
      FieldName = 'max_item'
      Active = True
      Expression = 'max(COD_ITEM)'
    end
  end
  object DsProduto: TDataSource
    DataSet = CdProduto
    Left = 192
    Top = 200
  end
  object UProduto: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      'from tb_produto_item '
      'where'
      '  COD_ITEM = :COD_ITEM and'
      '  COD_PRODUTO = :COD_PRODUTO')
    ModifySQL.Strings = (
      'update tb_produto_item'
      'set'
      '  COD_ITEM = :COD_ITEM,'
      '  COD_PRODUTO = :COD_PRODUTO,'
      '  COD_PRODUTO_ITEM = :COD_PRODUTO_ITEM,'
      '  COD_TIPO_PRODUTO_ITEM = :COD_TIPO_PRODUTO_ITEM'
      'where'
      '  COD_ITEM = :OLD_COD_ITEM and'
      '  COD_PRODUTO = :OLD_COD_PRODUTO')
    InsertSQL.Strings = (
      'insert into tb_produto_item'
      
        '  (COD_ITEM, COD_PRODUTO, COD_PRODUTO_ITEM, COD_TIPO_PRODUTO_ITE' +
        'M)'
      'values'
      
        '  (:COD_ITEM, :COD_PRODUTO, :COD_PRODUTO_ITEM, :COD_TIPO_PRODUTO' +
        '_ITEM)')
    DeleteSQL.Strings = (
      'delete from tb_produto_item'
      'where'
      '  COD_ITEM = :OLD_COD_ITEM and'
      '  COD_PRODUTO = :OLD_COD_PRODUTO')
    Left = 192
    Top = 8
  end
  object DspTipo: TDataSetProvider
    DataSet = QTipo
    Left = 264
    Top = 104
  end
  object CdTipo: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Filter = 'COD_PRODUTO_ITEM is null'
    Filtered = True
    Params = <>
    ProviderName = 'DspTipo'
    BeforePost = CdTipoBeforePost
    OnCalcFields = CdTipoCalcFields
    Left = 264
    Top = 152
    object CdTipoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object CdTipoCOD_ITEM: TIntegerField
      FieldName = 'COD_ITEM'
      Required = True
    end
    object CdTipoCOD_PRODUTO_ITEM: TIntegerField
      FieldName = 'COD_PRODUTO_ITEM'
    end
    object CdTipoCOD_TIPO_PRODUTO_ITEM: TIntegerField
      FieldName = 'COD_TIPO_PRODUTO_ITEM'
    end
    object CdTipodesc_tipo_produto: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_tipo_produto'
      Size = 100
      Calculated = True
    end
    object CdTipomax_item: TAggregateField
      FieldName = 'max_item'
      Active = True
      Expression = 'max(COD_ITEM)'
    end
  end
  object DsTipo: TDataSource
    DataSet = CdTipo
    Left = 264
    Top = 200
  end
  object QTipo: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select * from tb_produto_item'
      'where cod_produto = :cod_produto')
    UpdateObject = UTipo
    Left = 264
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_produto'
        ParamType = ptUnknown
      end>
    object QTipoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = '"TB_PRODUTO_ITEM"."COD_PRODUTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QTipoCOD_ITEM: TIntegerField
      FieldName = 'COD_ITEM'
      Origin = '"TB_PRODUTO_ITEM"."COD_ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QTipoCOD_PRODUTO_ITEM: TIntegerField
      FieldName = 'COD_PRODUTO_ITEM'
      Origin = '"TB_PRODUTO_ITEM"."COD_PRODUTO_ITEM"'
    end
    object QTipoCOD_TIPO_PRODUTO_ITEM: TIntegerField
      FieldName = 'COD_TIPO_PRODUTO_ITEM'
      Origin = '"TB_PRODUTO_ITEM"."COD_TIPO_PRODUTO_ITEM"'
    end
  end
  object UTipo: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      'from tb_produto_item '
      'where'
      '  COD_ITEM = :COD_ITEM and'
      '  COD_PRODUTO = :COD_PRODUTO')
    ModifySQL.Strings = (
      'update tb_produto_item'
      'set'
      '  COD_ITEM = :COD_ITEM,'
      '  COD_PRODUTO = :COD_PRODUTO,'
      '  COD_PRODUTO_ITEM = :COD_PRODUTO_ITEM,'
      '  COD_TIPO_PRODUTO_ITEM = :COD_TIPO_PRODUTO_ITEM'
      'where'
      '  COD_ITEM = :OLD_COD_ITEM and'
      '  COD_PRODUTO = :OLD_COD_PRODUTO')
    InsertSQL.Strings = (
      'insert into tb_produto_item'
      
        '  (COD_ITEM, COD_PRODUTO, COD_PRODUTO_ITEM, COD_TIPO_PRODUTO_ITE' +
        'M)'
      'values'
      
        '  (:COD_ITEM, :COD_PRODUTO, :COD_PRODUTO_ITEM, :COD_TIPO_PRODUTO' +
        '_ITEM)')
    DeleteSQL.Strings = (
      'delete from tb_produto_item'
      'where'
      '  COD_ITEM = :OLD_COD_ITEM and'
      '  COD_PRODUTO = :OLD_COD_PRODUTO')
    Left = 264
    Top = 8
  end
end
