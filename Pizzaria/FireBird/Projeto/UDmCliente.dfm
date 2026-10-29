object DmCliente: TDmCliente
  OldCreateOrder = False
  Left = 425
  Top = 256
  Height = 150
  Width = 215
  object QSelCliente: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Tb_Cliente')
    Left = 24
    Top = 8
    object QSelClienteCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = 'TB_CLIENTE.CODCLIENTE'
      Required = True
    end
    object QSelClienteNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TB_CLIENTE.NOME'
      Required = True
      Size = 80
    end
    object QSelClienteCPF: TIBStringField
      FieldName = 'CPF'
      Origin = 'TB_CLIENTE.CPF'
      Required = True
      Size = 12
    end
    object QSelClienteRG: TIBStringField
      FieldName = 'RG'
      Origin = 'TB_CLIENTE.RG'
      Size = 12
    end
    object QSelClienteNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TB_CLIENTE.NUMERO'
      Required = True
    end
    object QSelClienteCODENDERECO: TIntegerField
      FieldName = 'CODENDERECO'
      Origin = 'TB_CLIENTE.CODENDERECO'
      Required = True
    end
    object QSelClienteCODBAIRRO: TIntegerField
      FieldName = 'CODBAIRRO'
      Origin = 'TB_CLIENTE.CODBAIRRO'
      Required = True
    end
    object QSelClienteCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      Origin = 'TB_CLIENTE.CODCIDADE'
      Required = True
    end
    object QSelClienteDATA_NASCIMENTO: TDateTimeField
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'TB_CLIENTE.DATA_NASCIMENTO'
    end
    object QSelClienteDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
      Origin = 'TB_CLIENTE.DATA_CADASTRO'
      Required = True
    end
  end
  object DsSelCliente: TDataSource
    DataSet = QSelCliente
    Left = 24
    Top = 64
  end
end
