object DmVendedor: TDmVendedor
  OldCreateOrder = False
  Left = 217
  Top = 62
  Height = 150
  Width = 215
  object QSelVendedor: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Tb_Vendedor')
    Left = 24
    Top = 8
    object QSelVendedorCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
      Origin = 'TB_VENDEDOR.CODVENDEDOR'
      Required = True
    end
    object QSelVendedorNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TB_VENDEDOR.NOME'
      Required = True
      Size = 40
    end
    object QSelVendedorCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      Origin = 'TB_VENDEDOR.COMISSAO'
    end
  end
  object DsSelVendedor: TDataSource
    DataSet = QSelVendedor
    Left = 24
    Top = 64
  end
end
