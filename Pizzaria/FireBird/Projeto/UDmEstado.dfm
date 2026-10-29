object DmEstado: TDmEstado
  OldCreateOrder = False
  Left = 571
  Top = 247
  Height = 150
  Width = 215
  object QSelEstado: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Tb_Estado')
    Left = 24
    Top = 8
    object QSelEstadoCODESTADO: TIntegerField
      FieldName = 'CODESTADO'
      Origin = 'TB_ESTADO.CODESTADO'
      Required = True
    end
    object QSelEstadoDSCESTADO: TIBStringField
      FieldName = 'DSCESTADO'
      Origin = 'TB_ESTADO.DSCESTADO'
      Required = True
      Size = 40
    end
  end
  object DsSelEstado: TDataSource
    DataSet = QSelEstado
    Left = 24
    Top = 64
  end
end
