object DmCor: TDmCor
  OldCreateOrder = False
  Left = 217
  Top = 62
  Height = 150
  Width = 215
  object QSelCor: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Tb_Cor')
    Left = 24
    Top = 8
    object QSelCorCODCOR: TIntegerField
      FieldName = 'CODCOR'
      Origin = 'TB_COR.CODCOR'
      Required = True
    end
    object QSelCorDSCCOR: TIBStringField
      FieldName = 'DSCCOR'
      Origin = 'TB_COR.DSCCOR'
      Required = True
      Size = 40
    end
  end
  object DsSelCor: TDataSource
    DataSet = QSelCor
    Left = 24
    Top = 64
  end
end
