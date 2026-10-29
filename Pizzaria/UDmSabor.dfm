object DmSabor: TDmSabor
  OldCreateOrder = False
  Left = 511
  Top = 284
  Height = 150
  Width = 215
  object QSelSabor: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    SQL.Strings = (
      'select * from TB_SABOR')
    Left = 32
    Top = 8
    object QSelSaborCOD_SABOR: TIntegerField
      FieldName = 'COD_SABOR'
      Origin = 'TB_SABOR.COD_SABOR'
      Required = True
    end
    object QSelSaborDESC_SABOR: TIBStringField
      FieldName = 'DESC_SABOR'
      Origin = 'TB_SABOR.DESC_SABOR'
      Required = True
      Size = 100
    end
    object QSelSaborVLR_INTEGRAL: TFloatField
      FieldName = 'VLR_INTEGRAL'
      Origin = 'TB_SABOR.VLR_INTEGRAL'
    end
    object QSelSaborCOD_TIPO_PRODUTO: TIntegerField
      FieldName = 'COD_TIPO_PRODUTO'
      Origin = '"TB_SABOR"."COD_TIPO_PRODUTO"'
    end
  end
  object DsSelSabor: TDataSource
    DataSet = QSelSabor
    Left = 32
    Top = 64
  end
end
