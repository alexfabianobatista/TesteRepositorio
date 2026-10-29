object DMCartaCorrecaoEletronica: TDMCartaCorrecaoEletronica
  OldCreateOrder = False
  Left = 478
  Top = 221
  Height = 150
  Width = 303
  object QCartaCorrecaoEletronica: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_CCE.*'
      'FROM'
      '  TB_CCE'
      'WHERE'
      '  ID_LOTE = :ID_LOTE')
    Variables.Data = {
      0300000001000000080000003A49445F4C4F5445040000000000000000000000}
    SequenceField.Field = 'ID_LOTE'
    SequenceField.Sequence = 'SQCCE_ID_LOTE'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000040000000700000049445F4C4F544501000000000011000000444553
      435F43484156455F41434553534F0100000000001A000000444553435F524554
      4F524E4F5F50524F43455353414D454E544F0100000000001200000044455343
      5F4D53475F56414C49444143414F000000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QCartaCorrecaoEletronicaCalcFields
    Left = 48
    Top = 24
    object QCartaCorrecaoEletronicaID_LOTE: TFloatField
      FieldName = 'ID_LOTE'
      Required = True
    end
    object QCartaCorrecaoEletronicaDESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Required = True
      Size = 44
    end
    object QCartaCorrecaoEletronicaDESC_RETORNO_PROCESSAMENTO: TStringField
      FieldName = 'DESC_RETORNO_PROCESSAMENTO'
      Size = 4
    end
    object QCartaCorrecaoEletronicaDESC_MSG_VALIDACAO: TMemoField
      FieldName = 'DESC_MSG_VALIDACAO'
      BlobType = ftOraClob
    end
    object QCartaCorrecaoEletronicamsg_validacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'msg_validacao'
      Size = 150
      Calculated = True
    end
  end
  object QCartaCorrecaoEletronica_Item: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_CCE_EVENTO.*,'
      
        '  (desc_retorno_processamento || '#39' - '#39' || desc_msg_validacao) AS' +
        ' MSG_VALIDACAO'
      'FROM'
      '  TB_CCE_EVENTO'
      'where id_lote = :id_lote'
      'order by tb_cce_evento.id_evento')
    Variables.Data = {
      0300000001000000080000003A49445F4C4F5445040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C0000000B0000004E5345515F4556454E544F010000000000070000
      0049445F4C4F54450100000000000900000049445F4556454E544F0100000000
      000900000044545F4556454E544F0100000000000D000000444553435F434F52
      524543414F0000000000001A000000444553435F5245544F524E4F5F50524F43
      455353414D454E544F01000000000012000000444553435F4D53475F56414C49
      444143414F0000000000000D00000044545F5245475F4556454E544F01000000
      00000E000000444553435F50524F544F434F4C4F010000000000100000004445
      53435F584D4C5F5245544F524E4F0000000000000C000000444553435F584D4C
      5F4343450000000000000D0000004D53475F56414C49444143414F0000000000
      00}
    Master = QCartaCorrecaoEletronica
    MasterFields = 'ID_LOTE'
    DetailFields = 'ID_LOTE'
    Session = DMOracle.DBCemapa
    OnCalcFields = QCartaCorrecaoEletronica_ItemCalcFields
    Left = 176
    Top = 24
    object QCartaCorrecaoEletronica_ItemNSEQ_EVENTO: TIntegerField
      FieldName = 'NSEQ_EVENTO'
      Required = True
    end
    object QCartaCorrecaoEletronica_ItemID_LOTE: TFloatField
      FieldName = 'ID_LOTE'
      Required = True
    end
    object QCartaCorrecaoEletronica_ItemID_EVENTO: TStringField
      Alignment = taCenter
      FieldName = 'ID_EVENTO'
      Size = 54
    end
    object QCartaCorrecaoEletronica_ItemDT_EVENTO: TDateTimeField
      FieldName = 'DT_EVENTO'
    end
    object QCartaCorrecaoEletronica_ItemDESC_CORRECAO: TMemoField
      FieldName = 'DESC_CORRECAO'
      BlobType = ftOraClob
    end
    object QCartaCorrecaoEletronica_ItemDESC_RETORNO_PROCESSAMENTO: TStringField
      FieldName = 'DESC_RETORNO_PROCESSAMENTO'
      Size = 4
    end
    object QCartaCorrecaoEletronica_ItemDESC_MSG_VALIDACAO: TMemoField
      FieldName = 'DESC_MSG_VALIDACAO'
      BlobType = ftOraClob
    end
    object QCartaCorrecaoEletronica_ItemDT_REG_EVENTO: TDateTimeField
      FieldName = 'DT_REG_EVENTO'
    end
    object QCartaCorrecaoEletronica_ItemDESC_PROTOCOLO: TStringField
      FieldName = 'DESC_PROTOCOLO'
      Size = 15
    end
    object QCartaCorrecaoEletronica_ItemDESC_XML_RETORNO: TMemoField
      FieldName = 'DESC_XML_RETORNO'
      BlobType = ftOraClob
    end
    object QCartaCorrecaoEletronica_ItemDESC_XML_CCE: TMemoField
      FieldName = 'DESC_XML_CCE'
      BlobType = ftOraClob
    end
    object QCartaCorrecaoEletronica_Itemmsg_validacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'msg_validacao'
      Size = 200
      Calculated = True
    end
  end
end
