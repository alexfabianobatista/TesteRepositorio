object DmCliente: TDmCliente
  OldCreateOrder = False
  Left = 542
  Top = 151
  Height = 195
  Width = 270
  object QSelCliente: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select * from TB_CLIENTE')
    Left = 32
    Top = 8
    object QSelClienteCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'TB_CLIENTE.COD_CLIENTE'
      Required = True
    end
    object QSelClienteDESC_NOME: TIBStringField
      FieldName = 'DESC_NOME'
      Origin = 'TB_CLIENTE.DESC_NOME'
      Required = True
      Size = 100
    end
    object QSelClienteDESC_TELEFONE: TIBStringField
      FieldName = 'DESC_TELEFONE'
      Origin = 'TB_CLIENTE.DESC_TELEFONE'
      Required = True
    end
    object QSelClienteDESC_ENDERECO: TIBStringField
      FieldName = 'DESC_ENDERECO'
      Origin = 'TB_CLIENTE.DESC_ENDERECO'
      Size = 100
    end
    object QSelClienteDESC_LOCALIZACAO: TIBStringField
      FieldName = 'DESC_LOCALIZACAO'
      Origin = 'TB_CLIENTE.DESC_LOCALIZACAO'
      Size = 200
    end
  end
  object DsSelCliente: TDataSource
    DataSet = QSelCliente
    Left = 32
    Top = 64
  end
  object QTelCadastrado: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select * from TB_CLIENTE'
      'where desc_telefone = :DESC_TELEFONE')
    Left = 104
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DESC_TELEFONE'
        ParamType = ptUnknown
      end>
    object QTelCadastradoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'TB_CLIENTE.COD_CLIENTE'
      Required = True
    end
    object QTelCadastradoDESC_NOME: TIBStringField
      FieldName = 'DESC_NOME'
      Origin = 'TB_CLIENTE.DESC_NOME'
      Required = True
      Size = 100
    end
    object QTelCadastradoDESC_TELEFONE: TIBStringField
      FieldName = 'DESC_TELEFONE'
      Origin = 'TB_CLIENTE.DESC_TELEFONE'
      Required = True
    end
    object QTelCadastradoDESC_ENDERECO: TIBStringField
      FieldName = 'DESC_ENDERECO'
      Origin = 'TB_CLIENTE.DESC_ENDERECO'
      Size = 100
    end
    object QTelCadastradoDESC_LOCALIZACAO: TIBStringField
      FieldName = 'DESC_LOCALIZACAO'
      Origin = 'TB_CLIENTE.DESC_LOCALIZACAO'
      Size = 200
    end
  end
  object QInsCliente: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'insert into TB_CLIENTE ('
      '  COD_CLIENTE,'
      '  DESC_NOME,'
      '  DESC_TELEFONE,'
      '  DESC_ENDERECO,'
      '  DESC_LOCALIZACAO)'
      'values ('
      '  :COD_CLIENTE,'
      '  :DESC_NOME,'
      '  :DESC_TELEFONE,'
      '  :DESC_ENDERECO,'
      '  :DESC_LOCALIZACAO'
      ')')
    Left = 176
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESC_NOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESC_TELEFONE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESC_ENDERECO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESC_LOCALIZACAO'
        ParamType = ptUnknown
      end>
  end
  object QMaxCliente: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select max(COD_CLIENTE) as ULTIMO from TB_CLIENTE')
    Left = 104
    Top = 64
    object QMaxClienteULTIMO: TIntegerField
      FieldName = 'ULTIMO'
    end
  end
end
