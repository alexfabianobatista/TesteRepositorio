object DmCompra: TDmCompra
  OldCreateOrder = False
  Left = 580
  Top = 258
  Height = 150
  Width = 215
  object QInsCompra: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'insert into tb_compra'
      '  (CODCOMPRA, CODVEICULO, CODCLIENTE, DTCOMPRA)'
      'values'
      '  (:CODCOMPRA, :CODVEICULO, :CODCLIENTE, :DTCOMPRA)')
    Left = 16
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODCOMPRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODVEICULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODCLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DTCOMPRA'
        ParamType = ptUnknown
      end>
  end
  object QUltCompra: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select max(CODCOMPRA) as ultima from TB_COMPRA')
    Left = 16
    Top = 56
    object QUltCompraULTIMA: TIntegerField
      FieldName = 'ULTIMA'
    end
  end
end
