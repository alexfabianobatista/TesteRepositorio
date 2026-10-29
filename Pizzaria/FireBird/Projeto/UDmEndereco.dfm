object DmEndereco: TDmEndereco
  OldCreateOrder = False
  Left = 485
  Top = 227
  Height = 150
  Width = 215
  object QSelEndereco: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Tb_Endereco')
    Left = 24
    Top = 8
    object QSelEnderecoCODENDERECO: TIntegerField
      FieldName = 'CODENDERECO'
      Origin = 'TB_ENDERECO.CODENDERECO'
      Required = True
    end
    object QSelEnderecoDSCENDERECO: TIBStringField
      FieldName = 'DSCENDERECO'
      Origin = 'TB_ENDERECO.DSCENDERECO'
      Required = True
      Size = 40
    end
  end
  object DsSelEndereco: TDataSource
    DataSet = QSelEndereco
    Left = 24
    Top = 64
  end
end
