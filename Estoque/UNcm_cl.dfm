object DMNcm: TDMNcm
  OldCreateOrder = False
  Left = 396
  Top = 208
  Height = 197
  Width = 287
  object QNcmCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '   TB_NCM.*'
      'FROM'
      '   TB_NCM'
      'WHERE'
      '  (:COD_NCM IS NULL OR TB_NCM.COD_NCM = :COD_NCM)'
      'AND'
      '  (:DESCRICAO IS NULL OR TB_NCM.DESC_NCM LIKE :DESCRICAO)'
      'ORDER BY'
      '  TB_NCM.DESC_NCM')
    Variables.Data = {
      0300000002000000080000003A434F445F4E434D030000000000000000000000
      0A0000003A44455343524943414F050000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      040000000300000007000000434F445F4E434D01000000000008000000444553
      435F4E434D0100000000000E000000444553435F554E5F4D4544494441010000
      000000}
    ReadOnly = True
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 152
    Top = 24
    object QNcmConsCOD_NCM: TIntegerField
      FieldName = 'COD_NCM'
      Required = True
    end
    object QNcmConsDESC_NCM: TStringField
      FieldName = 'DESC_NCM'
      Size = 100
    end
    object QNcmConsDESC_UN_MEDIDA: TStringField
      FieldName = 'DESC_UN_MEDIDA'
      Size = 10
    end
  end
  object QNcm: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  ROWID,'
      '  TB_NCM.*'
      'FROM'
      '  TB_NCM'
      'WHERE'
      '  TB_NCM.COD_NCM = :PK')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      040000000A00000007000000434F445F4E434D01000000000008000000444553
      435F4E434D0100000000000E000000444553435F554E5F4D4544494441010000
      0000001A000000494E445F434F4E545249425F505245564944454E4349415249
      4101000000000015000000504552435F5452494255544F5F4E4143494F4E414C
      01000000000016000000504552435F5452494255544F5F494D504F525441444F
      01000000000015000000444553435F42454E49464943494F5F46495343414C01
      00000000000F00000044545F564947454E4349415F494E490100000000000F00
      000044545F564947454E4349415F46494D01000000000008000000504552435F
      434253010000000000}
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    BeforePost = QNcmBeforePost
    Left = 40
    Top = 24
    object QNcmCOD_NCM: TIntegerField
      FieldName = 'COD_NCM'
      Required = True
    end
    object QNcmDESC_NCM: TStringField
      FieldName = 'DESC_NCM'
      Size = 2000
    end
    object QNcmDESC_UN_MEDIDA: TStringField
      FieldName = 'DESC_UN_MEDIDA'
      Size = 10
    end
    object QNcmIND_CONTRIB_PREVIDENCIARIA: TStringField
      FieldName = 'IND_CONTRIB_PREVIDENCIARIA'
      Size = 3
    end
    object QNcmPERC_TRIBUTO_NACIONAL: TFloatField
      FieldName = 'PERC_TRIBUTO_NACIONAL'
    end
    object QNcmPERC_TRIBUTO_IMPORTADO: TFloatField
      FieldName = 'PERC_TRIBUTO_IMPORTADO'
    end
    object QNcmDT_VIGENCIA_INI: TDateTimeField
      FieldName = 'DT_VIGENCIA_INI'
      EditMask = '!00/00/0000;1;_'
    end
    object QNcmDT_VIGENCIA_FIM: TDateTimeField
      FieldName = 'DT_VIGENCIA_FIM'
      EditMask = '!00/00/0000;1;_'
    end
    object QNcmPERC_CBS: TFloatField
      FieldName = 'PERC_CBS'
    end
  end
  object QRNcm: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  COD_NCM,'
      '  DESC_NCM'
      'FROM'
      '  TB_NCM'
      'WHERE'
      '  (:NCM IS NULL OR'
      '    COD_NCM = :NCM)'
      'ORDER BY'
      '  COD_NCM')
    Variables.Data = {0300000001000000040000003A4E434D050000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.DefaultValues = True
    QBEDefinition.QBEFieldDefs = {
      040000000200000007000000434F445F4E434D01000000000008000000444553
      435F4E434D010000000000}
    ReadOnly = True
    CommitOnPost = False
    Session = DMOracle.DBCemapa
    Left = 96
    Top = 24
    object QRNcmCOD_NCM: TIntegerField
      FieldName = 'COD_NCM'
      Required = True
    end
    object QRNcmDESC_NCM: TStringField
      FieldName = 'DESC_NCM'
      Size = 2000
    end
  end
  object QNcmSemSimilarNacCad: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      #9'ROWID,'
      #9'TB_NCM_SEM_SIMILAR_NAC.*'
      'FROM'
      #9'TB_NCM_SEM_SIMILAR_NAC'
      'WHERE'
      #9'NUM_NCM = :PK')
    Variables.Data = {0300000001000000030000003A504B050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000002000000070000004E554D5F4E434D01000000000008000000444553
      435F4E434D000000000000}
    Session = DMOracle.DBCemapa
    Left = 48
    Top = 80
    object QNcmSemSimilarNacCadNUM_NCM: TStringField
      FieldName = 'NUM_NCM'
      Required = True
      Size = 8
    end
    object QNcmSemSimilarNacCadDESC_NCM: TMemoField
      FieldName = 'DESC_NCM'
      BlobType = ftOraClob
    end
  end
  object QNcmSemSimilarNacCons: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      #9'*'
      'FROM'
      #9'TB_NCM_SEM_SIMILAR_NAC'
      'WHERE'
      #9'NUM_NCM LIKE :NCM||'#39'%'#39
      'ORDER BY'
      #9'NUM_NCM')
    Variables.Data = {0300000001000000040000003A4E434D050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000002000000070000004E554D5F4E434D01000000000008000000444553
      435F4E434D000000000000}
    Session = DMOracle.DBCemapa
    OnCalcFields = QNcmSemSimilarNacConsCalcFields
    Left = 176
    Top = 80
    object QNcmSemSimilarNacConsNUM_NCM: TStringField
      FieldName = 'NUM_NCM'
      Required = True
      Size = 8
    end
    object QNcmSemSimilarNacConsDESC_NCM: TMemoField
      FieldName = 'DESC_NCM'
      BlobType = ftOraClob
    end
    object QNcmSemSimilarNacConsdescricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'descricao'
      Size = 500
      Calculated = True
    end
  end
end
