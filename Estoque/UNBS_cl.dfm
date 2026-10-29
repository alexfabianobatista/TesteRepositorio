object DMNbs: TDMNbs
  OldCreateOrder = False
  Left = 251
  Top = 444
  Height = 212
  Width = 330
  object QNBS_Cons: TOracleDataSet1
    SQL.Strings = (
      'SELECT '
      ' COD_NBS,'
      ' DESC_NBS'
      'FROM '
      ' TB_NBS'
      'WHERE'
      '  (:DESCRICAO IS NULL'
      '   OR TB_NBS.DESC_NBS LIKE :DESCRICAO)'
      'ORDER BY'
      '  TB_NBS.DESC_NBS'
      '')
    Variables.Data = {
      03000000010000000A0000003A44455343524943414F05000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000007000000434F445F4E425301000000000008000000444553
      435F4E4253010000000000}
    Session = DMOracle.DBCemapa
    Left = 144
    Top = 24
    object QNBS_ConsCOD_NBS: TIntegerField
      FieldName = 'COD_NBS'
      Required = True
    end
    object QNBS_ConsDESC_NBS: TStringField
      FieldName = 'DESC_NBS'
      Required = True
      Size = 2000
    end
  end
  object QNBS_Cad: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '   ROWID,'
      '   TB_NBS.*'
      'FROM '
      '   TB_NBS'
      'WHERE'
      '  TB_NBS.COD_NBS like :PK'
      '')
    Variables.Data = {0300000001000000030000003A504B030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000800000007000000434F445F4E425301000000000008000000444553
      435F4E425301000000000015000000504552435F5452494255544F5F4E414349
      4F4E414C01000000000016000000504552435F5452494255544F5F494D504F52
      5441444F0100000000000B000000434F445F5553554152494F01000000000008
      000000504552435F4342530100000000000F00000044545F564947454E434941
      5F494E490100000000000F00000044545F564947454E4349415F46494D010000
      000000}
    Session = DMOracle.DBCemapa
    BeforePost = QNBS_CadBeforePost
    Left = 24
    Top = 16
    object QNBS_CadCOD_NBS: TIntegerField
      FieldName = 'COD_NBS'
      Required = True
    end
    object QNBS_CadDESC_NBS: TStringField
      FieldName = 'DESC_NBS'
      Required = True
      Size = 2000
    end
    object QNBS_CadPERC_TRIBUTO_NACIONAL: TFloatField
      FieldName = 'PERC_TRIBUTO_NACIONAL'
    end
    object QNBS_CadPERC_TRIBUTO_IMPORTADO: TFloatField
      FieldName = 'PERC_TRIBUTO_IMPORTADO'
    end
    object QNBS_CadCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object QNBS_CadPERC_CBS: TFloatField
      FieldName = 'PERC_CBS'
    end
    object QNBS_CadDT_VIGENCIA_INI: TDateTimeField
      FieldName = 'DT_VIGENCIA_INI'
      EditMask = '!00/00/0000;1;_'
    end
    object QNBS_CadDT_VIGENCIA_FIM: TDateTimeField
      FieldName = 'DT_VIGENCIA_FIM'
      EditMask = '!00/00/0000;1;_'
    end
  end
end
