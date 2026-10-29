object DmMarca: TDmMarca
  OldCreateOrder = False
  Left = 482
  Top = 171
  Height = 150
  Width = 215
  object QSelMarca: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Tb_Marca')
    Left = 24
    Top = 8
    object QSelMarcaCODMARCA: TIntegerField
      FieldName = 'CODMARCA'
      Origin = 'TB_MARCA.CODMARCA'
      Required = True
    end
    object QSelMarcaDSCMARCA: TIBStringField
      FieldName = 'DSCMARCA'
      Origin = 'TB_MARCA.DSCMARCA'
      Required = True
      Size = 40
    end
  end
  object DsSelMarca: TDataSource
    DataSet = QSelMarca
    Left = 24
    Top = 64
  end
end
