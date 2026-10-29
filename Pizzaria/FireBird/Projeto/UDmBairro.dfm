object DmBairro: TDmBairro
  OldCreateOrder = False
  Left = 607
  Top = 154
  Height = 150
  Width = 215
  object QSelBairro: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Tb_Bairro')
    Left = 24
    Top = 8
    object QSelBairroCODBAIRRO: TIntegerField
      FieldName = 'CODBAIRRO'
      Origin = 'TB_BAIRRO.CODBAIRRO'
      Required = True
    end
    object QSelBairroDSCBAIRRO: TIBStringField
      FieldName = 'DSCBAIRRO'
      Origin = 'TB_BAIRRO.DSCBAIRRO'
      Required = True
      Size = 40
    end
  end
  object DsSelBairro: TDataSource
    DataSet = QSelBairro
    Left = 24
    Top = 64
  end
end
