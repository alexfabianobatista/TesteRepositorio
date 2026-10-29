object DMContratoJornal: TDMContratoJornal
  OldCreateOrder = False
  Left = 546
  Top = 243
  Height = 289
  Width = 259
  object QContratoJornal: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_CONTRATO_JORNAL.ROWID,'
      '  TB_CONTRATO_JORNAL.*'
      'FROM'
      '  TB_CONTRATO_JORNAL'
      'WHERE'
      '  COD_CONTRATO_JORNAL = :PK'
      '  ')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_CONTRATO_JORNAL'
    SequenceField.Sequence = 'SQ_CONTRATO_JORNAL'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000700000013000000434F445F434F4E545241544F5F4A4F524E414C01
      00000000000A000000434F445F46494C49414C0100000000000C000000434F44
      5F434144415354524F0100000000000B00000044545F434F4E545241544F0100
      000000000C00000056414C5F434F4E545241544F0100000000000C000000434F
      445F56454E4445444F520100000000000C000000494E445F534954554143414F
      010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    AfterOpen = QContratoJornalAfterOpen
    AfterClose = QContratoJornalAfterClose
    BeforeInsert = QContratoJornalBeforeInsert
    AfterInsert = QContratoJornalAfterInsert
    BeforeEdit = QContratoJornalBeforeEdit
    OnCalcFields = QContratoJornalCalcFields
    Left = 40
    Top = 8
    object QContratoJornalCOD_CONTRATO_JORNAL: TIntegerField
      FieldName = 'COD_CONTRATO_JORNAL'
      Required = True
    end
    object QContratoJornalCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
      Required = True
    end
    object QContratoJornalCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QContratoJornalDT_CONTRATO: TDateTimeField
      FieldName = 'DT_CONTRATO'
      Required = True
      EditMask = '!99/99/##00;1;_'
    end
    object QContratoJornalVAL_CONTRATO: TFloatField
      FieldName = 'VAL_CONTRATO'
    end
    object QContratoJornalCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QContratoJornalIND_SITUACAO: TIntegerField
      FieldName = 'IND_SITUACAO'
    end
    object QContratoJornaldesc_situacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_situacao'
      Size = 10
      Calculated = True
    end
  end
  object QContratoJornalItem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_CONTRATO_JORNAL_ITEM.ROWID,'
      '  TB_CONTRATO_JORNAL_ITEM.*'
      'FROM'
      '  TB_CONTRATO_JORNAL_ITEM'
      'WHERE'
      '  COD_CONTRATO_JORNAL = :COD_CONTRATO_JORNAL')
    Variables.Data = {
      0300000001000000140000003A434F445F434F4E545241544F5F4A4F524E414C
      030000000000000000000000}
    SequenceField.Field = 'COD_CONTRATO_JORNAL_ITEM'
    SequenceField.Sequence = 'SQ_CONTRATO_JORNAL_ITEM'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000700000013000000434F445F434F4E545241544F5F4A4F524E414C01
      00000000000A0000004E554D5F45444943414F0100000000000900000044545F
      45444943414F01000000000015000000434F445F434F4E54415F524543454245
      525F43414201000000000008000000494E445F5449504F0100000000000F0000
      00444553435F4F42534552564143414F01000000000018000000434F445F434F
      4E545241544F5F4A4F524E414C5F4954454D010000000000}
    Master = QContratoJornal
    MasterFields = 'COD_CONTRATO_JORNAL'
    DetailFields = 'COD_CONTRATO_JORNAL'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeInsert = QContratoJornalItemBeforeInsert
    AfterInsert = QContratoJornalItemAfterInsert
    Left = 160
    Top = 8
    object QContratoJornalItemCOD_CONTRATO_JORNAL_ITEM: TIntegerField
      FieldName = 'COD_CONTRATO_JORNAL_ITEM'
      Required = True
    end
    object QContratoJornalItemCOD_CONTRATO_JORNAL: TIntegerField
      FieldName = 'COD_CONTRATO_JORNAL'
      Required = True
    end
    object QContratoJornalItemNUM_EDICAO: TIntegerField
      FieldName = 'NUM_EDICAO'
      Required = True
    end
    object QContratoJornalItemDT_EDICAO: TDateTimeField
      FieldName = 'DT_EDICAO'
      EditMask = '!99/99/##00;1;_'
    end
    object QContratoJornalItemCOD_CONTA_RECEBER_CAB: TIntegerField
      FieldName = 'COD_CONTA_RECEBER_CAB'
    end
    object QContratoJornalItemIND_TIPO: TStringField
      FieldName = 'IND_TIPO'
      Size = 1
    end
    object QContratoJornalItemDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 100
    end
  end
  object QContratoJornalCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  CJ.COD_CONTRATO_JORNAL,'
      '  CJ.COD_FILIAL || '#39' - '#39' || F.DESC_FILIAL FILIAL,'
      '  CJ.COD_CADASTRO || '#39' - '#39' || C.NOME CADASTRO,'
      '  CJ.DT_CONTRATO,'
      '  CJ.VAL_CONTRATO,'
      '  CJ.IND_SITUACAO,'
      '  CJ.COD_VENDEDOR || '#39' - '#39' || V.NOME VENDEDOR'
      'FROM'
      '  TB_CONTRATO_JORNAL CJ'
      'LEFT JOIN'
      '  TB_FILIAL F'
      'ON'
      '  CJ.COD_FILIAL = F.COD_FILIAL'
      'LEFT JOIN'
      '  TB_CADASTRO C'
      'ON'
      '  CJ.COD_CADASTRO = C.COD_CADASTRO'
      'LEFT JOIN'
      '  TB_VENDEDOR V'
      'ON'
      '  CJ.COD_VENDEDOR = V.COD_VENDEDOR'
      'WHERE'
      '  (:FILIAL IS NULL OR CJ.COD_FILIAL = :FILIAL)'
      'AND'
      '  (:CADASTRO IS NULL OR CJ.COD_CADASTRO = :CADASTRO)'
      'AND'
      '  (:VENDEDOR IS NULL OR CJ.COD_VENDEDOR = :VENDEDOR)'
      'AND'
      '  (:SITUACAO IS NULL OR CJ.IND_SITUACAO = :SITUACAO)'
      'AND'
      
        '  (:EDICAO IS NULL OR :EDICAO IN (SELECT NUM_EDICAO FROM TB_CONT' +
        'RATO_JORNAL_ITEM T1 WHERE T1.COD_CONTRATO_JORNAL = CJ.COD_CONTRA' +
        'TO_JORNAL))'
      'AND'
      '  (:DT_INICIO IS NULL OR CJ.DT_CONTRATO >= :DT_INICIO)'
      'AND'
      '  (:DT_FIM IS NULL OR CJ.DT_CONTRATO <= :DT_FIM)'
      '')
    Variables.Data = {
      0300000007000000070000003A46494C49414C03000000000000000000000009
      0000003A434144415354524F0300000000000000000000000A0000003A44545F
      494E4943494F0C0000000000000000000000070000003A44545F46494D0C0000
      000000000000000000090000003A56454E4445444F5203000000000000000000
      0000070000003A45444943414F030000000000000000000000090000003A5349
      54554143414F030000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000700000013000000434F445F434F4E545241544F5F4A4F524E414C01
      00000000000B00000044545F434F4E545241544F0100000000000C0000005641
      4C5F434F4E545241544F0100000000000600000046494C49414C010000000000
      08000000434144415354524F0100000000000800000056454E4445444F520100
      000000000C000000494E445F534954554143414F010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    AfterOpen = QContratoJornalConsAfterOpen
    AfterClose = QContratoJornalConsAfterClose
    OnCalcFields = QContratoJornalConsCalcFields
    Left = 40
    Top = 56
    object QContratoJornalConsCOD_CONTRATO_JORNAL: TIntegerField
      FieldName = 'COD_CONTRATO_JORNAL'
      Required = True
    end
    object QContratoJornalConsFILIAL: TStringField
      FieldName = 'FILIAL'
      Size = 93
    end
    object QContratoJornalConsCADASTRO: TStringField
      FieldName = 'CADASTRO'
      Size = 93
    end
    object QContratoJornalConsDT_CONTRATO: TDateTimeField
      FieldName = 'DT_CONTRATO'
      Required = True
    end
    object QContratoJornalConsVAL_CONTRATO: TFloatField
      FieldName = 'VAL_CONTRATO'
    end
    object QContratoJornalConsVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Size = 83
    end
    object QContratoJornalConsIND_SITUACAO: TIntegerField
      FieldName = 'IND_SITUACAO'
    end
    object QContratoJornalConsdesc_situacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_situacao'
      Size = 10
      Calculated = True
    end
  end
  object QContratoJornalItemCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  CJI.NUM_EDICAO,'
      '  CJI.DT_EDICAO,'
      
        '  DECODE(CJI.COD_CONTA_RECEBER_CAB, NULL,'#39#39','#39'VALOR: '#39' || CR.VAL_' +
        'TITULO || '#39' - VENCIMENTO: '#39' || CR.DT_VENCIMENTO) CONTA_RECEBER,'
      '  CJI.IND_TIPO,'
      '  CJI.DESC_OBSERVACAO'
      'FROM'
      '  TB_CONTRATO_JORNAL_ITEM CJI'
      'LEFT JOIN'
      '  TB_CONTA_RECEBER_CAB CR'
      'ON'
      '  CJI.COD_CONTA_RECEBER_CAB = CR.COD_CONTA_RECEBER_CAB'
      'WHERE'
      '  COD_CONTRATO_JORNAL = :COD_CONTRATO_JORNAL')
    Variables.Data = {
      0300000001000000140000003A434F445F434F4E545241544F5F4A4F524E414C
      030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000A0000004E554D5F45444943414F01000000000009000000
      44545F45444943414F0100000000000D000000434F4E54415F52454345424552
      01000000000008000000494E445F5449504F0100000000000F00000044455343
      5F4F42534552564143414F010000000000}
    Master = QContratoJornalCons
    MasterFields = 'COD_CONTRATO_JORNAL'
    DetailFields = 'COD_CONTRATO_JORNAL'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 160
    Top = 56
    object QContratoJornalItemConsNUM_EDICAO: TIntegerField
      FieldName = 'NUM_EDICAO'
      Required = True
    end
    object QContratoJornalItemConsDT_EDICAO: TDateTimeField
      FieldName = 'DT_EDICAO'
    end
    object QContratoJornalItemConsCONTA_RECEBER: TStringField
      FieldName = 'CONTA_RECEBER'
      Size = 70
    end
    object QContratoJornalItemConsIND_TIPO: TStringField
      FieldName = 'IND_TIPO'
      Size = 1
    end
    object QContratoJornalItemConsDESC_OBSERVACAO: TStringField
      FieldName = 'DESC_OBSERVACAO'
      Size = 100
    end
  end
end
