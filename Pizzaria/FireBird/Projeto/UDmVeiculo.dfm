object DmVeiculo: TDmVeiculo
  OldCreateOrder = False
  Left = 336
  Top = 151
  Height = 286
  Width = 323
  object QSelVeiculo: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Tb_Veiculo')
    Left = 24
    Top = 8
    object QSelVeiculoCODVEICULO: TIntegerField
      FieldName = 'CODVEICULO'
      Origin = 'TB_VEICULO.CODVEICULO'
      Required = True
    end
    object QSelVeiculoDSCVEICULO: TIBStringField
      FieldName = 'DSCVEICULO'
      Origin = 'TB_VEICULO.DSCVEICULO'
      Required = True
      Size = 80
    end
    object QSelVeiculoCODMARCA: TIntegerField
      FieldName = 'CODMARCA'
      Origin = 'TB_VEICULO.CODMARCA'
      Required = True
    end
    object QSelVeiculoANOFAB: TIntegerField
      FieldName = 'ANOFAB'
      Origin = 'TB_VEICULO.ANOFAB'
      Required = True
    end
    object QSelVeiculoANOMODELO: TIntegerField
      FieldName = 'ANOMODELO'
      Origin = 'TB_VEICULO.ANOMODELO'
      Required = True
    end
    object QSelVeiculoCHASSI: TIntegerField
      FieldName = 'CHASSI'
      Origin = 'TB_VEICULO.CHASSI'
      Required = True
    end
    object QSelVeiculoPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'TB_VEICULO.PLACA'
      Size = 8
    end
    object QSelVeiculoCODCOR: TIntegerField
      FieldName = 'CODCOR'
      Origin = 'TB_VEICULO.CODCOR'
      Required = True
    end
    object QSelVeiculoVALORCOMPRA: TFloatField
      FieldName = 'VALORCOMPRA'
      Origin = 'TB_VEICULO.VALORCOMPRA'
      Required = True
    end
    object QSelVeiculoVALORVENDA: TFloatField
      FieldName = 'VALORVENDA'
      Origin = 'TB_VEICULO.VALORVENDA'
      Required = True
    end
  end
  object DsSelVeiculo: TDataSource
    DataSet = QSelVeiculo
    Left = 24
    Top = 64
  end
  object QUpValorVenda: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update Tb_Veiculo'
      'set'
      '  VALORVENDA = :VALORVENDA'
      'where'
      '  CODVEICULO = :CODVEICULO')
    Left = 112
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'VALORVENDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODVEICULO'
        ParamType = ptUnknown
      end>
  end
  object QUpValorCompra: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update Tb_Veiculo'
      'set'
      '  VALORCOMPRA = :VALORCOMPRA'
      'where'
      '  CODVEICULO = :CODVEICULO')
    Left = 112
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'VALORCOMPRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODVEICULO'
        ParamType = ptUnknown
      end>
  end
  object QJaVendido: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select VALORVENDA from TB_VEICULO'
      'where CODVEICULO = :CODVEICULO'
      'and VALORVENDA is not null')
    Left = 192
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODVEICULO'
        ParamType = ptUnknown
      end>
    object QJaVendidoVALORVENDA: TFloatField
      FieldName = 'VALORVENDA'
      Origin = 'TB_VEICULO.VALORVENDA'
    end
  end
  object QJaComprado: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select VALORCOMPRA from TB_VEICULO'
      'where CODVEICULO = :CODVEICULO'
      'and VALORCOMPRA is not null')
    Left = 192
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODVEICULO'
        ParamType = ptUnknown
      end>
    object QJaCompradoVALORCOMPRA: TFloatField
      FieldName = 'VALORCOMPRA'
      Origin = 'TB_VEICULO.VALORCOMPRA'
    end
  end
end
