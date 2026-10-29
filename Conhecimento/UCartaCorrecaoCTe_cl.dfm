object DMCartaCorrecaoCTe: TDMCartaCorrecaoCTe
  OldCreateOrder = False
  Left = 567
  Top = 219
  Height = 207
  Width = 354
  object QCartaCorrecaoCTe: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWID,'
      'TB_CTE_EVENTO.*'
      'FROM'
      '  TB_CTE_EVENTO'
      
        'where DESC_CHAVE_ACESSO = :DESC_CHAVE_ACESSO AND (:TP_EVENTO IS ' +
        'NULL OR TP_EVENTO = :TP_EVENTO)'
      'order by TB_CTE_EVENTO.ID_EVENTO')
    Variables.Data = {
      0300000002000000120000003A444553435F43484156455F41434553534F0500
      000000000000000000000A0000003A54505F4556454E544F0500000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C0000000900000049445F4556454E544F0100000000001100000044
      4553435F43484156455F41434553534F0100000000000B0000004E5345515F45
      56454E544F0100000000000900000044545F4556454E544F0100000000000900
      000054505F4556454E544F01000000000012000000444553435F4A5553544946
      494341544956410100000000001A000000444553435F5245544F524E4F5F5052
      4F43455353414D454E544F01000000000012000000444553435F4D53475F5641
      4C49444143414F0000000000000D00000044545F5245475F4556454E544F0100
      000000000E000000444553435F50524F544F434F4C4F0100000000000F000000
      444553435F584D4C5F4556454E544F00000000000010000000444553435F584D
      4C5F5245544F524E4F000000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeInsert = QCartaCorrecaoCTeBeforeInsert
    BeforeEdit = QCartaCorrecaoCTeBeforeEdit
    AfterCancel = QCartaCorrecaoCTeAfterCancel
    BeforeDelete = QCartaCorrecaoCTeBeforeDelete
    AfterDelete = QCartaCorrecaoCTeAfterDelete
    OnCalcFields = QCartaCorrecaoCTeCalcFields
    Left = 39
    Top = 14
    object QCartaCorrecaoCTeDESC_CHAVE_ACESSO: TStringField
      FieldName = 'DESC_CHAVE_ACESSO'
      Required = True
      Size = 44
    end
    object QCartaCorrecaoCTeNSEQ_EVENTO: TIntegerField
      FieldName = 'NSEQ_EVENTO'
      Required = True
    end
    object QCartaCorrecaoCTeDT_EVENTO: TDateTimeField
      FieldName = 'DT_EVENTO'
    end
    object QCartaCorrecaoCTeTP_EVENTO: TIntegerField
      FieldName = 'TP_EVENTO'
    end
    object QCartaCorrecaoCTeDESC_JUSTIFICATIVA: TStringField
      FieldName = 'DESC_JUSTIFICATIVA'
      Size = 255
    end
    object QCartaCorrecaoCTeDESC_RETORNO_PROCESSAMENTO: TStringField
      FieldName = 'DESC_RETORNO_PROCESSAMENTO'
      Size = 4
    end
    object QCartaCorrecaoCTeDESC_MSG_VALIDACAO: TMemoField
      FieldName = 'DESC_MSG_VALIDACAO'
      BlobType = ftOraClob
    end
    object QCartaCorrecaoCTeDT_REG_EVENTO: TDateTimeField
      FieldName = 'DT_REG_EVENTO'
    end
    object QCartaCorrecaoCTeDESC_PROTOCOLO: TStringField
      FieldName = 'DESC_PROTOCOLO'
      Size = 15
    end
    object QCartaCorrecaoCTeDESC_XML_EVENTO: TMemoField
      FieldName = 'DESC_XML_EVENTO'
      BlobType = ftOraClob
    end
    object QCartaCorrecaoCTeDESC_XML_RETORNO: TMemoField
      FieldName = 'DESC_XML_RETORNO'
      BlobType = ftOraClob
    end
    object QCartaCorrecaoCTemsg_validacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'msg_validacao'
      Size = 200
      Calculated = True
    end
    object QCartaCorrecaoCTeID_EVENTO: TStringField
      FieldName = 'ID_EVENTO'
      Required = True
      Size = 55
    end
  end
  object QGrupoAlterado: TOracleDataSet1
    SQL.Strings = (
      'SELECT TB_GRUPO_ALTERADO_CCE.*'
      'FROM TB_GRUPO_ALTERADO_CCE')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000090000005441475F475255504F0100000000000A00000044
      4553435F475255504F010000000000}
    Session = DMOracle.DBCemapa
    Left = 131
    Top = 14
    object QGrupoAlteradoTAG_GRUPO: TStringField
      FieldName = 'TAG_GRUPO'
      Required = True
    end
    object QGrupoAlteradoDESC_GRUPO: TStringField
      FieldName = 'DESC_GRUPO'
      Size = 100
    end
  end
  object QCampoAlterado: TOracleDataSet1
    SQL.Strings = (
      'SELECT TB_CAMPO_ALTERADO_CCE.*'
      'FROM TB_CAMPO_ALTERADO_CCE'
      ''
      'where tag_grupo = :tag_grupo')
    Variables.Data = {
      03000000010000000A0000003A5441475F475255504F05000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      0400000003000000090000005441475F43414D504F0100000000000A00000044
      4553435F43414D504F010000000000090000005441475F475255504F01000000
      0000}
    Master = QGrupoAlterado
    MasterFields = 'TAG_GRUPO'
    DetailFields = 'TAG_GRUPO'
    Session = DMOracle.DBCemapa
    Left = 223
    Top = 15
    object QCampoAlteradoTAG_CAMPO: TStringField
      FieldName = 'TAG_CAMPO'
      Required = True
    end
    object QCampoAlteradoDESC_CAMPO: TStringField
      FieldName = 'DESC_CAMPO'
      Size = 100
    end
    object QCampoAlteradoTAG_GRUPO: TStringField
      FieldName = 'TAG_GRUPO'
      Required = True
    end
  end
  object QCorrecaoCTe: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWID,'
      'TB_CORRECAO_CTE.*'
      'FROM'
      '  TB_CORRECAO_CTE'
      'where id_evento = :id_evento')
    Variables.Data = {
      03000000010000000A0000003A49445F4556454E544F05000000000000000000
      0000}
    SequenceField.Field = 'COD_CORRECAO_CTE'
    SequenceField.Sequence = 'SQCORRECAO_CTE'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000060000000900000049445F4556454E544F0100000000001300000044
      4553435F475255504F5F414C54455241444F0100000000001300000044455343
      5F43414D504F5F414C54455241444F01000000000013000000444553435F5641
      4C4F525F414C54455241444F010000000000110000004E554D5F4954454D5F41
      4C54455241444F01000000000010000000434F445F434F52524543414F5F4354
      45010000000000}
    Master = QCartaCorrecaoCTe
    MasterFields = 'ID_EVENTO'
    DetailFields = 'ID_EVENTO'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeInsert = QCorrecaoCTeBeforeInsert
    AfterInsert = QCorrecaoCTeAfterInsert
    Left = 39
    Top = 70
    object QCorrecaoCTeDESC_GRUPO_ALTERADO: TStringField
      FieldName = 'DESC_GRUPO_ALTERADO'
    end
    object QCorrecaoCTeDESC_CAMPO_ALTERADO: TStringField
      FieldName = 'DESC_CAMPO_ALTERADO'
    end
    object QCorrecaoCTeDESC_VALOR_ALTERADO: TStringField
      FieldName = 'DESC_VALOR_ALTERADO'
      Size = 500
    end
    object QCorrecaoCTeNUM_ITEM_ALTERADO: TIntegerField
      FieldName = 'NUM_ITEM_ALTERADO'
    end
    object QCorrecaoCTeCOD_CORRECAO_CTE: TIntegerField
      FieldName = 'COD_CORRECAO_CTE'
      Required = True
    end
    object QCorrecaoCTeID_EVENTO: TStringField
      FieldName = 'ID_EVENTO'
      Required = True
      Size = 55
    end
  end
end
