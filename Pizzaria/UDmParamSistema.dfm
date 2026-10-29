object DmParamSistema: TDmParamSistema
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 328
  Top = 151
  Height = 334
  Width = 424
  object QParamSistema: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select * from TB_PARAM_SISTEMA')
    UpdateObject = UParamSistema
    Left = 32
    Top = 8
    object QParamSistemaDESC_FANTASIA: TIBStringField
      FieldName = 'DESC_FANTASIA'
      Origin = 'TB_PARAM_SISTEMA.DESC_FANTASIA'
      Required = True
      Size = 100
    end
    object QParamSistemaDESC_RAZAO_SOCIAL: TIBStringField
      FieldName = 'DESC_RAZAO_SOCIAL'
      Origin = 'TB_PARAM_SISTEMA.DESC_RAZAO_SOCIAL'
      Size = 200
    end
    object QParamSistemaDESC_CNPJ: TIBStringField
      FieldName = 'DESC_CNPJ'
      Origin = 'TB_PARAM_SISTEMA.DESC_CNPJ'
    end
    object QParamSistemaDESC_ENDERECO: TIBStringField
      FieldName = 'DESC_ENDERECO'
      Origin = 'TB_PARAM_SISTEMA.DESC_ENDERECO'
      Size = 200
    end
    object QParamSistemaDESC_CIDADE: TIBStringField
      FieldName = 'DESC_CIDADE'
      Origin = 'TB_PARAM_SISTEMA.DESC_CIDADE'
      Size = 100
    end
    object QParamSistemaDESC_UF: TIBStringField
      FieldName = 'DESC_UF'
      Origin = 'TB_PARAM_SISTEMA.DESC_UF'
      Size = 2
    end
    object QParamSistemaDESC_TELEFONE: TIBStringField
      FieldName = 'DESC_TELEFONE'
      Origin = 'TB_PARAM_SISTEMA.DESC_TELEFONE'
    end
    object QParamSistemaVAL_TAXA_ENTREGA: TFloatField
      FieldName = 'VAL_TAXA_ENTREGA'
      Origin = '"TB_PARAM_SISTEMA"."VAL_TAXA_ENTREGA"'
      DisplayFormat = '#0.00'
    end
  end
  object UParamSistema: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  DESC_FANTASIA,'
      '  DESC_RAZAO_SOCIAL,'
      '  DESC_CNPJ,'
      '  DESC_ENDERECO,'
      '  DESC_CIDADE,'
      '  DESC_UF,'
      '  DESC_TELEFONE,'
      '  VAL_TAXA_ENTREGA'
      'from TB_PARAM_SISTEMA')
    ModifySQL.Strings = (
      'update TB_PARAM_SISTEMA'
      'set'
      '  DESC_FANTASIA = :DESC_FANTASIA,'
      '  DESC_RAZAO_SOCIAL = :DESC_RAZAO_SOCIAL,'
      '  DESC_CNPJ = :DESC_CNPJ,'
      '  DESC_ENDERECO = :DESC_ENDERECO,'
      '  DESC_CIDADE = :DESC_CIDADE,'
      '  DESC_UF = :DESC_UF,'
      '  DESC_TELEFONE = :DESC_TELEFONE,'
      '  VAL_TAXA_ENTREGA = :VAL_TAXA_ENTREGA')
    InsertSQL.Strings = (
      'insert into TB_PARAM_SISTEMA'
      
        '  (DESC_FANTASIA, DESC_RAZAO_SOCIAL, DESC_CNPJ, DESC_ENDERECO, D' +
        'ESC_CIDADE, DESC_UF, '
      'DESC_TELEFONE, VAL_TAXA_ENTREGA)'
      'values'
      
        '  (:DESC_FANTASIA, :DESC_RAZAO_SOCIAL, :DESC_CNPJ, :DESC_ENDEREC' +
        'O, :DESC_CIDADE, :DESC_UF, '
      ':DESC_TELEFONE, :VAL_TAXA_ENTREGA)')
    DeleteSQL.Strings = (
      'delete from TB_PARAM_SISTEMA')
    Left = 128
    Top = 8
  end
end
