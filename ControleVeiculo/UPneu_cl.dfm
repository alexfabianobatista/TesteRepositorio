object DMPneu: TDMPneu
  OldCreateOrder = False
  Left = 519
  Top = 217
  Height = 178
  Width = 399
  object QPneuCad: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_PNEU.*'
      'FROM'
      '  TB_PNEU'
      'WHERE'
      '  TB_PNEU.COD_PNEU = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.Field = 'COD_PNEU'
    SequenceField.Sequence = 'SQ_PNEU'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000A00000008000000434F445F504E45550100000000000E0000004445
      53435F44455343524943414F010000000000090000004E554D5F534552494501
      00000000000900000044545F434F4D5052410100000000000C000000494E445F
      534954554143414F0100000000000D000000494E445F52454341504147454D01
      0000000000130000004E554D5F56455A45535F52454341504147454D01000000
      0000090000004E554D5F504C4143410100000000000E000000434F445F4D4152
      43415F504E45550100000000000A000000434F445F46494C49414C0100000000
      00}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    AfterOpen = QPneuCadAfterOpen
    BeforeInsert = QPneuCadBeforeInsert
    BeforeEdit = QPneuCadBeforeEdit
    AfterPost = QPneuCadAfterPost
    AfterCancel = QPneuCadAfterCancel
    Left = 25
    Top = 11
    object QPneuCadCOD_PNEU: TIntegerField
      FieldName = 'COD_PNEU'
      Required = True
    end
    object QPneuCadDESC_DESCRICAO: TStringField
      FieldName = 'DESC_DESCRICAO'
      Required = True
      Size = 50
    end
    object QPneuCadNUM_SERIE: TStringField
      FieldName = 'NUM_SERIE'
    end
    object QPneuCadDT_COMPRA: TDateTimeField
      FieldName = 'DT_COMPRA'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QPneuCadIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 15
    end
    object QPneuCadIND_RECAPAGEM: TStringField
      FieldName = 'IND_RECAPAGEM'
      Size = 15
    end
    object QPneuCadNUM_VEZES_RECAPAGEM: TIntegerField
      FieldName = 'NUM_VEZES_RECAPAGEM'
    end
    object QPneuCadNUM_PLACA: TStringField
      FieldName = 'NUM_PLACA'
      EditMask = '>lll\-9999;1;_'
    end
    object QPneuCadCOD_MARCA_PNEU: TIntegerField
      FieldName = 'COD_MARCA_PNEU'
    end
    object QPneuCadCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
  end
  object QPneuCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PNEU.*'
      'FROM'
      '  TB_PNEU'
      'WHERE'
      '  UPPER(TB_PNEU.DESC_DESCRICAO) >= UPPER(:DESC_DESCRICAO)'
      'AND'
      '  (:IND_SITUACAO IS NULL'
      '   OR'
      '    IND_SITUACAO = :IND_SITUACAO)'
      'ORDER BY'
      '  TB_PNEU.COD_PNEU')
    Variables.Data = {
      03000000020000000F0000003A444553435F44455343524943414F0500000000
      000000000000000D0000003A494E445F534954554143414F0500000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000008000000434F445F504E45550100000000000E0000004445
      53435F44455343524943414F010000000000090000004E554D5F534552494501
      00000000000900000044545F434F4D5052410100000000000C000000494E445F
      534954554143414F0100000000000D000000494E445F52454341504147454D01
      0000000000130000004E554D5F56455A45535F52454341504147454D01000000
      0000}
    Session = DMOracle.DBCemapa
    Left = 160
    Top = 9
    object QPneuConsCOD_PNEU: TIntegerField
      FieldName = 'COD_PNEU'
      Required = True
    end
    object QPneuConsDESC_DESCRICAO: TStringField
      FieldName = 'DESC_DESCRICAO'
      Required = True
      Size = 50
    end
    object QPneuConsNUM_SERIE: TStringField
      FieldName = 'NUM_SERIE'
    end
    object QPneuConsDT_COMPRA: TDateTimeField
      FieldName = 'DT_COMPRA'
      Required = True
    end
    object QPneuConsIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 15
    end
    object QPneuConsIND_RECAPAGEM: TStringField
      FieldName = 'IND_RECAPAGEM'
      Size = 15
    end
  end
  object QRPneu: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PNEU.*'
      'FROM'
      '  TB_PNEU'
      'WHERE'
      '  (:IND_SITUACAO IS NULL'
      '   OR'
      '    IND_SITUACAO = :IND_SITUACAO)'
      'and'
      '  (:DT_COMPRA_I IS NULL'
      '    OR'
      '    TB_PNEU.DT_COMPRA >= :DT_COMPRA_I)'
      '  AND'
      '  (:DT_COMPRA_F IS NULL'
      '    OR'
      '    TB_PNEU.DT_COMPRA <= :DT_COMPRA_F)'
      '  AND'
      '  (:PLACA IS NULL'
      '    OR'
      '    TB_PNEU.NUM_PLACA = :PLACA)'
      'ORDER BY'
      '  TB_PNEU.COD_PNEU')
    Variables.Data = {
      03000000040000000D0000003A494E445F534954554143414F05000000000000
      00000000000C0000003A44545F434F4D5052415F490C00000000000000000000
      000C0000003A44545F434F4D5052415F460C0000000000000000000000060000
      003A504C414341050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000800000008000000434F445F504E45550100000000000E0000004445
      53435F44455343524943414F010000000000090000004E554D5F534552494501
      00000000000900000044545F434F4D5052410100000000000C000000494E445F
      534954554143414F0100000000000D000000494E445F52454341504147454D01
      0000000000130000004E554D5F56455A45535F52454341504147454D01000000
      0000090000004E554D5F504C414341010000000000}
    Session = DMOracle.DBCemapa
    Left = 221
    Top = 9
    object QRPneuCOD_PNEU: TIntegerField
      FieldName = 'COD_PNEU'
      Required = True
    end
    object QRPneuDESC_DESCRICAO: TStringField
      FieldName = 'DESC_DESCRICAO'
      Required = True
      Size = 50
    end
    object QRPneuNUM_SERIE: TStringField
      FieldName = 'NUM_SERIE'
    end
    object QRPneuDT_COMPRA: TDateTimeField
      FieldName = 'DT_COMPRA'
      Required = True
    end
    object QRPneuIND_SITUACAO: TStringField
      FieldName = 'IND_SITUACAO'
      Size = 15
    end
    object QRPneuIND_RECAPAGEM: TStringField
      FieldName = 'IND_RECAPAGEM'
      Size = 15
    end
    object QRPneuNUM_VEZES_RECAPAGEM: TIntegerField
      FieldName = 'NUM_VEZES_RECAPAGEM'
    end
    object QRPneuNUM_PLACA: TStringField
      FieldName = 'NUM_PLACA'
    end
  end
  object QPneuTroca: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_PNEU_TROCA.*'
      'FROM'
      '  TB_PNEU_TROCA'
      'where cod_pneu = :cod_pneu')
    Variables.Data = {
      0300000001000000090000003A434F445F504E45550300000000000000000000
      00}
    SequenceField.Field = 'COD_PNEU_TROCA'
    SequenceField.Sequence = 'SQPNEU_TROCA'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000050000000E000000434F445F504E45555F54524F4341010000000000
      08000000434F445F504E45550100000000000B000000434F445F56454943554C
      4F0100000000000800000044545F54524F43410100000000000A000000494E44
      5F45535441444F010000000000}
    Master = QPneuCad
    MasterFields = 'COD_PNEU'
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforeInsert = QPneuTrocaBeforeInsert
    AfterInsert = QPneuTrocaAfterInsert
    BeforeEdit = QPneuTrocaBeforeEdit
    AfterPost = QPneuTrocaAfterPost
    Left = 91
    Top = 10
    object QPneuTrocaCOD_PNEU_TROCA: TIntegerField
      FieldName = 'COD_PNEU_TROCA'
      Required = True
    end
    object QPneuTrocaCOD_PNEU: TIntegerField
      FieldName = 'COD_PNEU'
      Required = True
    end
    object QPneuTrocaCOD_VEICULO: TIntegerField
      FieldName = 'COD_VEICULO'
      Required = True
    end
    object QPneuTrocaDT_TROCA: TDateTimeField
      FieldName = 'DT_TROCA'
      EditMask = '!99/99/0000;1;_'
    end
    object QPneuTrocaIND_ESTADO: TIntegerField
      FieldName = 'IND_ESTADO'
    end
  end
  object DSPneuTroca: TDataSource
    DataSet = QPneuTroca
    Left = 90
    Top = 62
  end
  object QRTroca: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  P.COD_PNEU,'
      '  P.COD_FILIAL,'
      '  P.DESC_DESCRICAO,'
      '  P.DT_COMPRA,'
      '  T.DT_TROCA,'
      '  T.IND_ESTADO,'
      '  V.NUM_PLACA'
      'FROM'
      '  TB_PNEU P,'
      '  TB_PNEU_TROCA T,'
      '  TB_VEICULO V'
      'WHERE'
      '  P.COD_PNEU = T.COD_PNEU'
      '  AND'
      '  T.COD_VEICULO = V.COD_VEICULO'
      '  AND'
      '  (:DT_COMPRA_I IS NULL'
      '    OR'
      '    P.DT_COMPRA >= :DT_COMPRA_I)'
      '  AND'
      '  (:DT_COMPRA_F IS NULL'
      '    OR'
      '    P.DT_COMPRA <= :DT_COMPRA_F)'
      '  AND'
      '  (:DT_TROCA_I IS NULL'
      '    OR'
      '    T.DT_TROCA >= :DT_TROCA_I)'
      '  AND'
      '  (:DT_TROCA_F IS NULL'
      '    OR'
      '    T.DT_TROCA <= :DT_TROCA_F)'
      '  AND'
      '  (:PNEU IS NULL'
      '    OR'
      '    P.COD_PNEU = :PNEU)'
      '  AND'
      '  (:FILIAL IS NULL'
      '    OR'
      '    P.COD_FILIAL = :FILIAL)'
      '  AND'
      '  (:SITUACAO IS NULL'
      '    OR'
      '    P.IND_SITUACAO = :SITUACAO)'
      'ORDER BY'
      ' T.DT_TROCA'
      '  ')
    Variables.Data = {
      03000000070000000C0000003A44545F434F4D5052415F490C00000000000000
      000000000C0000003A44545F434F4D5052415F460C0000000000000000000000
      0B0000003A44545F54524F43415F490C00000000000000000000000B0000003A
      44545F54524F43415F460C0000000000000000000000050000003A504E455503
      0000000000000000000000070000003A46494C49414C03000000000000000000
      0000090000003A534954554143414F050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000008000000434F445F504E45550100000000000A000000434F
      445F46494C49414C0100000000000E000000444553435F44455343524943414F
      0100000000000900000044545F434F4D5052410100000000000800000044545F
      54524F43410100000000000A000000494E445F45535441444F01000000000009
      0000004E554D5F504C414341010000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QRTrocaCalcFields
    Left = 291
    Top = 10
    object QRTrocaCOD_PNEU: TIntegerField
      FieldName = 'COD_PNEU'
      Required = True
    end
    object QRTrocaCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object QRTrocaDESC_DESCRICAO: TStringField
      FieldName = 'DESC_DESCRICAO'
      Required = True
      Size = 50
    end
    object QRTrocaDT_COMPRA: TDateTimeField
      FieldName = 'DT_COMPRA'
      Required = True
    end
    object QRTrocaDT_TROCA: TDateTimeField
      FieldName = 'DT_TROCA'
    end
    object QRTrocaIND_ESTADO: TIntegerField
      FieldName = 'IND_ESTADO'
    end
    object QRTrocaNUM_PLACA: TStringField
      FieldName = 'NUM_PLACA'
    end
    object QRTrocadesc_estado: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_estado'
      Size = 50
      Calculated = True
    end
  end
end
