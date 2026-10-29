object DMRequisicaoTransfusao: TDMRequisicaoTransfusao
  OldCreateOrder = False
  Left = 360
  Top = 250
  Height = 232
  Width = 487
  object QRequisicaoTransfusao: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_REQUISICAO_TRANSFUSAO.*'
      'FROM'
      '  TB_REQUISICAO_TRANSFUSAO'
      'WHERE'
      '  TB_REQUISICAO_TRANSFUSAO.COD_REQUISICAO_TRANSFUSAO =:PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_REQUISICAO_TRANSFUSAO'
    SequenceField.Sequence = 'SQREQUISICAO_TRANSFUSAO'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000300000019000000434F445F5245515549534943414F5F5452414E53
      465553414F0100000000000C000000434F445F434144415354524F0100000000
      0013000000494E445F5449504F5F5245515549534943414F010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeInsert = QRequisicaoTransfusaoBeforeInsert
    BeforeEdit = QRequisicaoTransfusaoBeforeEdit
    AfterCancel = QRequisicaoTransfusaoAfterCancel
    Left = 48
    Top = 32
    object QRequisicaoTransfusaoCOD_REQUISICAO_TRANSFUSAO: TIntegerField
      FieldName = 'COD_REQUISICAO_TRANSFUSAO'
      Required = True
    end
    object QRequisicaoTransfusaoCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRequisicaoTransfusaoIND_TIPO_REQUISICAO: TStringField
      FieldName = 'IND_TIPO_REQUISICAO'
      Required = True
      Size = 10
    end
  end
  object QRequisicaoTransfusaoCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_CADASTRO.NOME,'
      '  TB_REQUISICAO_TRANSFUSAO.*,  '
      '  TB_REQUISICAO_TRANSFUSAO_ITEM.DT_COLETA'
      ''
      'FROM'
      '  TB_REQUISICAO_TRANSFUSAO,'
      '  TB_REQUISICAO_TRANSFUSAO_ITEM,'
      '  TB_CADASTRO'
      'WHERE'
      
        '  TB_REQUISICAO_TRANSFUSAO.COD_REQUISICAO_TRANSFUSAO = TB_REQUIS' +
        'ICAO_TRANSFUSAO_ITEM.COD_REQUISICAO_TRANSFUSAO'
      '  AND'
      
        '  TB_REQUISICAO_TRANSFUSAO.COD_CADASTRO = TB_CADASTRO.COD_CADAST' +
        'RO'
      '  AND'
      '  (:DT_INICIAL IS NULL'
      '   OR'
      '    TB_REQUISICAO_TRANSFUSAO_ITEM.DT_COLETA >= :DT_INICIAL)'
      '  AND'
      '  (:DT_FINAL IS NULL'
      '   OR'
      '    TB_REQUISICAO_TRANSFUSAO_ITEM.DT_COLETA <= :DT_FINAL)'
      '  AND'
      '  (:TIPO_REQUISICAO IS NULL'
      '   OR'
      
        '    TB_REQUISICAO_TRANSFUSAO.IND_TIPO_REQUISICAO =:TIPO_REQUISIC' +
        'AO)'
      '  AND'
      '  (:PACIENTE IS NULL'
      '   OR'
      '    TB_REQUISICAO_TRANSFUSAO.COD_CADASTRO =:PACIENTE)')
    Variables.Data = {
      03000000040000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C000000000000000000000010000000
      3A5449504F5F5245515549534943414F05000000000000000000000009000000
      3A50414349454E5445030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000019000000434F445F5245515549534943414F5F5452414E53
      465553414F0100000000000C000000434F445F434144415354524F0100000000
      0013000000494E445F5449504F5F5245515549534943414F0100000000000900
      000044545F434F4C455441010000000000040000004E4F4D45010000000000}
    Session = DMOracle.DBCemapa
    Left = 352
    Top = 24
    object QRequisicaoTransfusaoConsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QRequisicaoTransfusaoConsCOD_REQUISICAO_TRANSFUSAO: TIntegerField
      FieldName = 'COD_REQUISICAO_TRANSFUSAO'
      Required = True
    end
    object QRequisicaoTransfusaoConsCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRequisicaoTransfusaoConsIND_TIPO_REQUISICAO: TStringField
      FieldName = 'IND_TIPO_REQUISICAO'
      Required = True
      Size = 10
    end
    object QRequisicaoTransfusaoConsDT_COLETA: TDateTimeField
      FieldName = 'DT_COLETA'
    end
  end
  object QRRequisicaoTransfusao: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_REQUISICAO_TRANSFUSAO.*,'
      '  TB_REQUISICAO_TRANSFUSAO_ITEM.*,'
      '  TB_CADASTRO.NOME'
      'FROM'
      '  TB_REQUISICAO_TRANSFUSAO,'
      '  TB_REQUISICAO_TRANSFUSAO_ITEM,'
      '  TB_CADASTRO'
      'WHERE'
      
        '  TB_REQUISICAO_TRANSFUSAO.COD_REQUISICAO_TRANSFUSAO = TB_REQUIS' +
        'ICAO_TRANSFUSAO_ITEM.COD_REQUISICAO_TRANSFUSAO'
      '  AND'
      
        '  TB_REQUISICAO_TRANSFUSAO.COD_CADASTRO = TB_CADASTRO.COD_CADAST' +
        'RO'
      '  AND'
      '  (:DT_INICIAL IS NULL'
      '   OR'
      '    TB_REQUISICAO_TRANSFUSAO_ITEM.DT_COLETA >= :DT_INICIAL)'
      '  AND'
      '  (:DT_FINAL IS NULL'
      '   OR'
      '    TB_REQUISICAO_TRANSFUSAO_ITEM.DT_COLETA <= :DT_FINAL)'
      '  AND'
      '  (:TIPO_REQUISICAO IS NULL'
      '   OR'
      
        '    TB_REQUISICAO_TRANSFUSAO.IND_TIPO_REQUISICAO =:TIPO_REQUISIC' +
        'AO)'
      '  AND'
      '  (:PACIENTE IS NULL'
      '   OR'
      '    TB_REQUISICAO_TRANSFUSAO.COD_CADASTRO =:PACIENTE)'
      'ORDER BY'
      '  TB_CADASTRO.NOME,'
      '  TB_REQUISICAO_TRANSFUSAO.COD_REQUISICAO_TRANSFUSAO    '
      '  '
      ''
      '  '
      '')
    Variables.Data = {
      03000000040000000B0000003A44545F494E494349414C0C0000000000000000
      000000090000003A44545F46494E414C0C000000000000000000000010000000
      3A5449504F5F5245515549534943414F05000000000000000000000009000000
      3A50414349454E5445030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001300000019000000434F445F5245515549534943414F5F5452414E53
      465553414F0100000000000C000000434F445F434144415354524F0100000000
      0013000000494E445F5449504F5F5245515549534943414F0100000000001300
      0000444553435F48454D4F434F4D504F4E454E54450100000000000D0000004E
      554D5F424F4C53415F5355530100000000000A0000004E554D5F444F4143414F
      0100000000000D000000444553435F494E494349414953010000000000070000
      00444553435F54410100000000000B000000444553435F434F4F4D4253010000
      0000000E000000444553435F524553554C5441444F0100000000000B00000044
      4553435F4F524947454D0100000000000900000044545F434F4C455441010000
      000000040000004E4F4D450100000000001E000000434F445F52455155495349
      43414F5F5452414E53465553414F5F4954454D0100000000001B000000434F44
      5F5245515549534943414F5F5452414E53465553414F5F310100000000000D00
      0000444553435F48454D4F4C49534501000000000008000000444553435F4142
      4F01000000000007000000444553435F52480100000000000800000044455343
      5F504149010000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 96
    object QRRequisicaoTransfusaoCOD_REQUISICAO_TRANSFUSAO: TIntegerField
      FieldName = 'COD_REQUISICAO_TRANSFUSAO'
      Required = True
    end
    object QRRequisicaoTransfusaoCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
      Required = True
    end
    object QRRequisicaoTransfusaoIND_TIPO_REQUISICAO: TStringField
      FieldName = 'IND_TIPO_REQUISICAO'
      Required = True
      Size = 10
    end
    object QRRequisicaoTransfusaoCOD_REQUISICAO_TRANSFUSAO_ITEM: TIntegerField
      FieldName = 'COD_REQUISICAO_TRANSFUSAO_ITEM'
      Required = True
    end
    object QRRequisicaoTransfusaoCOD_REQUISICAO_TRANSFUSAO_1: TIntegerField
      FieldName = 'COD_REQUISICAO_TRANSFUSAO_1'
      Required = True
    end
    object QRRequisicaoTransfusaoDESC_HEMOCOMPONENTE: TStringField
      FieldName = 'DESC_HEMOCOMPONENTE'
      Size = 10
    end
    object QRRequisicaoTransfusaoNUM_BOLSA_SUS: TFloatField
      FieldName = 'NUM_BOLSA_SUS'
    end
    object QRRequisicaoTransfusaoNUM_DOACAO: TFloatField
      FieldName = 'NUM_DOACAO'
    end
    object QRRequisicaoTransfusaoDESC_INICIAIS: TStringField
      FieldName = 'DESC_INICIAIS'
      Size = 10
    end
    object QRRequisicaoTransfusaoDESC_TA: TStringField
      FieldName = 'DESC_TA'
      Size = 12
    end
    object QRRequisicaoTransfusaoDESC_COOMBS: TStringField
      FieldName = 'DESC_COOMBS'
      Size = 12
    end
    object QRRequisicaoTransfusaoDESC_RESULTADO: TStringField
      FieldName = 'DESC_RESULTADO'
      Size = 12
    end
    object QRRequisicaoTransfusaoDESC_HEMOLISE: TStringField
      FieldName = 'DESC_HEMOLISE'
      Size = 8
    end
    object QRRequisicaoTransfusaoDESC_ORIGEM: TStringField
      FieldName = 'DESC_ORIGEM'
      Size = 10
    end
    object QRRequisicaoTransfusaoDT_COLETA: TDateTimeField
      FieldName = 'DT_COLETA'
    end
    object QRRequisicaoTransfusaoDESC_ABO: TStringField
      FieldName = 'DESC_ABO'
      Size = 2
    end
    object QRRequisicaoTransfusaoDESC_RH: TStringField
      FieldName = 'DESC_RH'
      Size = 1
    end
    object QRRequisicaoTransfusaoDESC_PAI: TStringField
      FieldName = 'DESC_PAI'
      Size = 8
    end
    object QRRequisicaoTransfusaoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
  end
  object QRequisicaoTransfusaoItem: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_REQUISICAO_TRANSFUSAO_ITEM.*'
      'FROM'
      '  TB_REQUISICAO_TRANSFUSAO_ITEM'
      'WHERE'
      '  COD_REQUISICAO_TRANSFUSAO =:COD_REQUISICAO_TRANSFUSAO')
    Variables.Data = {
      03000000010000001A0000003A434F445F5245515549534943414F5F5452414E
      53465553414F030000000000000000000000}
    SequenceField.Field = 'COD_REQUISICAO_TRANSFUSAO_ITEM'
    SequenceField.Sequence = 'SQREQUISICAOTRANSFUSAO_ITEM'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000F0000001E000000434F445F5245515549534943414F5F5452414E53
      465553414F5F4954454D01000000000019000000434F445F5245515549534943
      414F5F5452414E53465553414F01000000000013000000444553435F48454D4F
      434F4D504F4E454E54450100000000000D0000004E554D5F424F4C53415F5355
      530100000000000A0000004E554D5F444F4143414F0100000000000D00000044
      4553435F494E49434941495301000000000007000000444553435F5441010000
      0000000B000000444553435F434F4F4D42530100000000000E00000044455343
      5F524553554C5441444F0100000000000D000000444553435F48454D4F4C4953
      450100000000000B000000444553435F4F524947454D01000000000009000000
      44545F434F4C45544101000000000008000000444553435F41424F0100000000
      0007000000444553435F524801000000000008000000444553435F5041490100
      00000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeInsert = QRequisicaoTransfusaoItemBeforeInsert
    AfterInsert = QRequisicaoTransfusaoItemAfterInsert
    AfterPost = QRequisicaoTransfusaoItemAfterPost
    BeforeDelete = QRequisicaoTransfusaoItemBeforeDelete
    Left = 184
    Top = 24
    object QRequisicaoTransfusaoItemCOD_REQUISICAO_TRANSFUSAO_ITEM: TIntegerField
      FieldName = 'COD_REQUISICAO_TRANSFUSAO_ITEM'
      Required = True
    end
    object QRequisicaoTransfusaoItemCOD_REQUISICAO_TRANSFUSAO: TIntegerField
      FieldName = 'COD_REQUISICAO_TRANSFUSAO'
      Required = True
    end
    object QRequisicaoTransfusaoItemDESC_HEMOCOMPONENTE: TStringField
      FieldName = 'DESC_HEMOCOMPONENTE'
      Size = 10
    end
    object QRequisicaoTransfusaoItemNUM_BOLSA_SUS: TFloatField
      FieldName = 'NUM_BOLSA_SUS'
    end
    object QRequisicaoTransfusaoItemNUM_DOACAO: TFloatField
      FieldName = 'NUM_DOACAO'
    end
    object QRequisicaoTransfusaoItemDESC_INICIAIS: TStringField
      FieldName = 'DESC_INICIAIS'
      Size = 10
    end
    object QRequisicaoTransfusaoItemDESC_TA: TStringField
      FieldName = 'DESC_TA'
      Size = 12
    end
    object QRequisicaoTransfusaoItemDESC_COOMBS: TStringField
      FieldName = 'DESC_COOMBS'
      Size = 12
    end
    object QRequisicaoTransfusaoItemDESC_RESULTADO: TStringField
      FieldName = 'DESC_RESULTADO'
      Size = 12
    end
    object QRequisicaoTransfusaoItemDESC_HEMOLISE: TStringField
      FieldName = 'DESC_HEMOLISE'
      Size = 8
    end
    object QRequisicaoTransfusaoItemDESC_ORIGEM: TStringField
      FieldName = 'DESC_ORIGEM'
      Size = 10
    end
    object QRequisicaoTransfusaoItemDT_COLETA: TDateTimeField
      FieldName = 'DT_COLETA'
      EditMask = '!99/99/0000;1;_'
    end
    object QRequisicaoTransfusaoItemDESC_ABO: TStringField
      FieldName = 'DESC_ABO'
      Size = 2
    end
    object QRequisicaoTransfusaoItemDESC_RH: TStringField
      FieldName = 'DESC_RH'
      Size = 1
    end
    object QRequisicaoTransfusaoItemDESC_PAI: TStringField
      FieldName = 'DESC_PAI'
      Size = 8
    end
  end
  object DSRequisicaoTransfusaoItem: TDataSource
    DataSet = QRequisicaoTransfusaoItem
    Left = 184
    Top = 96
  end
end
