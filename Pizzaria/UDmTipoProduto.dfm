object DmTipoProduto: TDmTipoProduto
  OldCreateOrder = False
  Left = 225
  Top = 103
  Height = 150
  Width = 215
  object QSelTipoProduto: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TB_TIPO_PRODUTO')
    Left = 32
    Top = 8
    object QSelTipoProdutoCOD_TIPO_PRODUTO: TIntegerField
      FieldName = 'COD_TIPO_PRODUTO'
      Origin = 'TB_TIPO_PRODUTO.COD_TIPO_PRODUTO'
      Required = True
    end
    object QSelTipoProdutoDESC_TIPO_PRODUTO: TIBStringField
      FieldName = 'DESC_TIPO_PRODUTO'
      Origin = 'TB_TIPO_PRODUTO.DESC_TIPO_PRODUTO'
      Required = True
      Size = 100
    end
    object QSelTipoProdutoNUM_SABORES: TIntegerField
      FieldName = 'NUM_SABORES'
      Origin = 'TB_TIPO_PRODUTO.NUM_SABORES'
      Required = True
    end
  end
  object DsSelTipoProduto: TDataSource
    DataSet = QSelTipoProduto
    Left = 32
    Top = 64
  end
end
