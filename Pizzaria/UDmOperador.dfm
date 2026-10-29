object DmOperador: TDmOperador
  OldCreateOrder = False
  Left = 449
  Top = 253
  Height = 150
  Width = 215
  object QSelOperador: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select * from TB_OPERADOR')
    Left = 32
    Top = 8
    object QSelOperadorCOD_OPERADOR: TIntegerField
      FieldName = 'COD_OPERADOR'
      Origin = 'TB_OPERADOR.COD_OPERADOR'
      Required = True
    end
    object QSelOperadorDESC_NOME: TIBStringField
      FieldName = 'DESC_NOME'
      Origin = 'TB_OPERADOR.DESC_NOME'
      Required = True
      Size = 100
    end
    object QSelOperadorDESC_SENHA: TIBStringField
      FieldName = 'DESC_SENHA'
      Origin = 'TB_OPERADOR.DESC_SENHA'
      Required = True
      Size = 100
    end
  end
  object DsSelOperador: TDataSource
    DataSet = QSelOperador
    Left = 32
    Top = 64
  end
  object QLogin: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select * from tb_operador'
      'where cod_operador = :COD_OPERADOR'
      'and desc_senha = :DESC_SENHA')
    Left = 96
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_OPERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESC_SENHA'
        ParamType = ptUnknown
      end>
    object QLoginCOD_OPERADOR: TIntegerField
      FieldName = 'COD_OPERADOR'
      Origin = 'TB_OPERADOR.COD_OPERADOR'
      Required = True
    end
    object QLoginDESC_NOME: TIBStringField
      FieldName = 'DESC_NOME'
      Origin = 'TB_OPERADOR.DESC_NOME'
      Required = True
      Size = 100
    end
    object QLoginDESC_SENHA: TIBStringField
      FieldName = 'DESC_SENHA'
      Origin = 'TB_OPERADOR.DESC_SENHA'
      Required = True
      Size = 100
    end
  end
end
