object DmVenda: TDmVenda
  OldCreateOrder = False
  Left = 636
  Top = 335
  Height = 213
  Width = 215
  object QInsVenda: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'insert into tb_venda'
      '  (CODVENDA, CODVENDEDOR, CODVEICULO, CODCLIENTE, DTVENDA)'
      'values'
      '  (:CODVENDA, :CODVENDEDOR, :CODVEICULO, :CODCLIENTE, :DTVENDA)')
    Left = 16
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODVENDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODVENDEDOR'
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
        Name = 'DTVENDA'
        ParamType = ptUnknown
      end>
  end
  object QUltVenda: TIBQuery
    Database = DmSistema.DbSistema
    Transaction = DmSistema.TSistema
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select max(CODVENDA) as ultima from TB_VENDA')
    Left = 16
    Top = 56
    object QUltVendaULTIMA: TIntegerField
      FieldName = 'ULTIMA'
    end
  end
end
