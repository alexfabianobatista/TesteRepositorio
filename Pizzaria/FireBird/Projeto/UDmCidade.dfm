object DmCidade: TDmCidade
  OldCreateOrder = False
  Left = 513
  Top = 248
  Height = 150
  Width = 215
  object QSelCidade: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select C.*, E.DscEstado, (C.DscCidade || '#39' - '#39' || E.DscEstado) a' +
        's DscCidadeEstado From Tb_Cidade C'
      'Inner Join Tb_Estado E on E.CodEsTado = C.Codestado ')
    Left = 24
    Top = 8
    object QSelCidadeCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      Origin = 'TB_CIDADE.CODCIDADE'
      Required = True
    end
    object QSelCidadeDSCCIDADE: TIBStringField
      FieldName = 'DSCCIDADE'
      Origin = 'TB_CIDADE.DSCCIDADE'
      Required = True
      Size = 40
    end
    object QSelCidadeCODESTADO: TIntegerField
      FieldName = 'CODESTADO'
      Origin = 'TB_CIDADE.CODESTADO'
      Required = True
    end
    object QSelCidadeDSCESTADO: TIBStringField
      FieldName = 'DSCESTADO'
      Origin = 'TB_ESTADO.DSCESTADO'
      Required = True
      Size = 40
    end
    object QSelCidadeDSCCIDADEESTADO: TIBStringField
      FieldName = 'DSCCIDADEESTADO'
      Required = True
      Size = 83
    end
  end
  object DsSelCidade: TDataSource
    DataSet = QSelCidade
    Left = 24
    Top = 64
  end
end
